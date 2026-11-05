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
    float4 m_71 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
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
    float4 m_59 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2153 = false;
    bool _1474 = false;
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
        float _2438 = as_type<float>(_122);
        out.gl_Position.z = _2438;
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
        float _2507 = as_type<float>(_160);
        out.gl_Position.z = _2507;
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
    bool _374 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _376 = isnan(1.0);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _382 = _378 || _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _386 = 1.0 + _384;
    bool _388 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _396 = _392 || _394;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _400 = 1.0 / _386;
    float _402 = _372 * _140;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _406;
    float _410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _412 = _362 * 2.0;
    float _414 = _364 * 2.0;
    float _416 = _366 * 2.0;
    float _418 = _362 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _420 = _364 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _422 = exp2(_402);
    float _424 = _364 + _366;
    float _426 = -_404;
    float _428 = fma(_418, 2.0, _426);
    float _430 = fma(_420, -2.0, _398);
    float _432 = _364 + _362;
    float _434 = -_140;
    float _436 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[76].x, _428);
    float _438 = floor(_412);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _444 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _430);
    float _446 = _432 + (-1.0);
    float _448 = _424 + (-1.0);
    float _450 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[78].z, _442);
    float _452 = floor(_414);
    float _454 = -_422;
    float _456 = _454 + 1.0;
    float _458 = _410 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _460 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _450);
    float _462 = floor(_416);
    bool _464 = _438 > 0.0;
    bool _466 = _438 >= 0.0;
    bool _468 = isnan(_438);
    bool _470 = _466 || _468;
    bool _472 = isnan(0.0);
    bool _474 = _470 || _472;
    float _476 = _396 ? _456 : 0.0;
    bool _478 = _452 > 0.0;
    bool _480 = _452 >= 0.0;
    bool _482 = isnan(_452);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _492 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[79].z, _440);
    int _494 = _474 ? 0 : 1;
    float _496 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[78].w, _490);
    bool _498 = _462 > 0.0;
    float _500 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[79].x, _492);
    bool _502 = _462 >= 0.0;
    bool _504 = isnan(_462);
    bool _506 = _502 || _504;
    bool _508 = isnan(0.0);
    bool _510 = _506 || _508;
    float _512 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _496);
    if (_382)
    {
        float _514 = _476 * _400;
        _144 = _514;
    }
    float _516 = _144;
    float _518 = in.m_57.x;
    float _520 = in.m_57.y;
    float _522 = in.m_57.z;
    float _524 = _500 * (-0.15915493667125701904296875);
    int _526 = _510 ? 0 : 1;
    int _528 = _488 ? 0 : 1;
    float _530 = _524 * 6.283185482025146484375;
    float _532 = sin(_530);
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _544 = _542 != 0;
    int _546 = ~_526;
    int _548 = _546 + 1;
    int _550 = _548 + 1;
    int _552 = ~_494;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    int _558 = ~_528;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    int _564 = _550;
    int _566 = _556;
    int _568 = _562;
    bool _570 = _544;
    if (!_498)
    {
        int _572 = ~_526;
        int _574 = _572 + 1;
        _564 = _574;
    }
    int _576 = _564;
    if (!_464)
    {
        int _578 = ~_494;
        int _580 = _578 + 1;
        _566 = _580;
    }
    int _582 = _566;
    if (!_478)
    {
        int _584 = ~_528;
        int _586 = _584 + 1;
        _568 = _586;
    }
    int _588 = _568;
    float _590 = in.m_48.x;
    float _592 = in.m_48.y;
    float _594 = in.m_48.z;
    bool _596 = !_536;
    int _598 = _596 ? 0 : 1;
    float _600 = _326 * _518;
    bool _602 = _368 > 0.5;
    float _604 = _328 * _520;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _608 = _606 != 0;
    float _610 = _362 + _366;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _618 = _616 != 0;
    float _620 = _610 + (-1.0);
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _624 = _622 != 0;
    float _626 = _330 * _522;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _632 = _362 + (-0.5);
    float _634 = _366 + (-0.5);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _640 = 1.0 / _630;
    bool _642 = !_540;
    int _644 = _642 ? 0 : 1;
    float _646 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _648 = _364 > 0.5;
    float _650 = _592 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _652 = _592 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _654 = float(_582);
    float _656 = 1.0 / _638;
    float _658 = _364 + (-0.5);
    float _660 = _592 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _670 = fma(_590, (*spvDescriptorSet0.vp_c10)._m0[5].x, _650);
    float _672 = fma(_590, (*spvDescriptorSet0.vp_c10)._m0[4].x, _660);
    float _674 = fma(_590, (*spvDescriptorSet0.vp_c10)._m0[6].x, _652);
    float _676 = in.m_59.x;
    float _678 = in.m_59.y;
    float _680 = in.m_59.z;
    float _682 = 1.0 / _668;
    float _684 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[5].z, _670);
    float _686 = _408 * _640;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _688;
    float _692 = float(_588);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _698 = 1.0 / _664;
    int _700 = abs(_598);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _706 = float(_576);
    float _708 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _710 = _696 * _656;
    float _712 = in.m_61.x;
    float _714 = _690 * _682;
    float _716 = float(_700);
    float _718 = _716 * _706;
    float _720 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[4].z, _672);
    float _722 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _724 = abs(_644);
    float _726 = _718 * (-2.0);
    float _728 = _684 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _730 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[6].z, _674);
    float _732 = _720 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _734 = fma(_722, _726, _722);
    float _736 = fma(_726, _676, _676);
    float _738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _740 = _728 + _738;
    float _742 = _730 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _746 = _732 + _744;
    float _748 = float(_724);
    float _750 = _740 * _740;
    float _752 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[196].x, _736);
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _756 = _742 + _754;
    bool _758 = !_544;
    int _760 = _758 ? 0 : 1;
    float _762 = fma(_746, _746, _750);
    float _764 = _748 * _654;
    float _766 = fma(_734, _516, _752);
    int _768 = abs(_760);
    float _770 = fma(_756, _756, _762);
    float _772 = _764 * (-2.0);
    float _774 = _750;
    bool _776 = _602;
    if (_608)
    {
        float _778 = in.m_55.x;
        _774 = _778;
    }
    float _780 = _774;
    float _782 = float(_768);
    float _784 = fma(_772, _678, _678);
    float _786 = rsqrt(_770);
    float _788 = fma(_708, _772, _708);
    float _790 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _792 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].y, _784);
    float _794 = _782 * _692;
    float _796 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _798 = in.m_61.y;
    float _800 = fma(_788, _516, _792);
    float _802 = _794 * (-2.0);
    float _804 = _796 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _806 = _600;
    if (_614)
    {
        float _808 = in.m_55.z;
        _806 = _808;
    }
    float _810 = _806;
    float _812 = _800 * 0.15915493667125701904296875;
    float _814 = fma(_802, _680, _680);
    float _816 = fma(_790, _802, _790);
    float _818 = _766 * 0.15915493667125701904296875;
    float _820 = _812 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = _804 * _786;
    float _826 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[196].z, _814);
    float _828 = _704 * _698;
    float _830 = _740 * _824;
    float _832 = _746 * _824;
    float _834 = fma(_816, _516, _826);
    float _836 = _756 * _824;
    float _838 = -_830;
    float _840 = _740 + _838;
    float _842 = -_832;
    float _844 = _746 + _842;
    float _846 = _834 * 0.15915493667125701904296875;
    float _848 = -_836;
    float _850 = _756 + _848;
    float _852 = _840 * _840;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _856 = _360 + _854;
    float _858 = _818 * 6.283185482025146484375;
    float _860 = sin(_858);
    float _862 = _816;
    float _864 = _818;
    if (_608)
    {
        bool _866 = _780 > 0.5;
        _570 = _866;
    }
    bool _868 = _570;
    float _870 = fma(_844, _844, _852);
    float _872 = fma(_686, _856, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _874 = -_798;
    float _876 = _874 + 1.0;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _880 = _360 + _878;
    float _882 = fma(_850, _850, _870);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _886 = _360 + _884;
    float _888 = _818 * 6.283185482025146484375;
    float _890 = cos(_888);
    int _892 = _602 ? as_type<int>(_876) : as_type<int>(_798);
    float _894 = fma(_828, _880, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _896 = fma(_714, _886, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _898 = _798;
    if (_614)
    {
        bool _900 = _810 > 0.5;
        _776 = _900;
    }
    bool _902 = _776;
    float _904 = in.m_63.x;
    float _906 = in.m_63.y;
    float _908 = in.m_63.z;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _912 = _360 + _910;
    if (!_608)
    {
        _862 = _712;
    }
    float _914 = _862;
    float _916 = sqrt(_882);
    float _918 = fma(_710, _912, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _920 = _914;
    int _922 = as_type<int>(_918);
    if (!_608)
    {
        _864 = _914;
    }
    float _924 = _864;
    float _926 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _928 = _924;
    if (_608)
    {
        _920 = _712;
    }
    float _930 = _920;
    float _932 = _860 * _822;
    float _934 = _618 ? as_type<float>(_892) : _798;
    float _936 = _812 * 6.283185482025146484375;
    float _938 = cos(_936);
    float _940 = _930;
    if (_624)
    {
        float _942 = _648 ? _876 : _798;
        _898 = _942;
    }
    float _944 = _898;
    float _946 = _890 * _822;
    int _948 = 0;
    if (_608)
    {
        float _950 = -_930;
        float _952 = _950 + 1.0;
        _948 = as_type<int>(_952);
    }
    int _954 = _948;
    float _956 = fma(_458, _944, -0.5);
    float _958 = _846 * 6.283185482025146484375;
    float _960 = cos(_958);
    float _962 = _786 * _916;
    if (_608)
    {
        float _964 = _868 ? as_type<float>(_954) : _930;
        _928 = _964;
    }
    float _966 = _928;
    float _968 = _926 * _962;
    float _970 = _796 * _962;
    float _972 = _646 * _962;
    float _974 = _846 * 6.283185482025146484375;
    float _976 = sin(_974);
    float _978 = _890 * _938;
    float _980 = _860 * _938;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _904);
    float _984 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _908);
    bool _986 = _906 != 0.0;
    bool _988 = isnan(_906);
    bool _990 = _986 || _988;
    bool _992 = isnan(0.0);
    bool _994 = _990 || _992;
    float _996 = _970 * _982;
    float _998 = _860 * _960;
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _906);
    float _1002 = _938 * _960;
    float _1004 = _890 * _960;
    float _1006 = _822 * _960;
    float _1008 = _968 * _1000;
    float _1010 = _972 * _984;
    bool _1012 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1014 = isnan(_360);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = fma(_976, _978, _932);
    float _1026 = fma(_976, _932, _978);
    float _1028 = -_946;
    float _1030 = fma(_976, _980, _1028);
    float _1032 = -_980;
    float _1034 = fma(_976, _946, _1032);
    bool _1036 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1038 = isnan(_360);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = -_1008;
    float _1050 = _976 * _1048;
    float _1052 = _1004 * _1008;
    float _1054 = _998 * _1008;
    bool _1056 = _904 == 0.0;
    bool _1058 = !_994;
    bool _1060 = _1056 && _1058;
    float _1062 = -_1046;
    float _1064 = _1062 + 1.0;
    float _1066 = fma(_1002, _996, _1050);
    float _1068 = fma(_1024, _996, _1052);
    bool _1070 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1072 = isnan(_360);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = _1022 * _1064;
    float _1084 = -_1022;
    float _1086 = _1084 + 1.0;
    float _1088 = fma(_1030, _996, _1054);
    float _1090 = fma(_1034, _1010, _1068);
    float _1092 = -_1080;
    float _1094 = _1092 + 1.0;
    float _1096 = _1080 * _1086;
    float _1098 = fma(_1006, _1010, _1066);
    float _1100 = in.m_65.x;
    float _1102 = in.m_65.y;
    float _1104 = in.m_65.z;
    float _1106 = fma(_1026, _1010, _1088);
    float _1108 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1110 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1112 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1114 = isnan(_360);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1126 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1108);
    float _1128 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1110);
    bool _1130 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1132 = isnan(_360);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1138 = _1134 || _1136;
    float _1140 = float(_1138);
    float _1142 = _1122 * _1094;
    float _1144 = -_1122;
    float _1146 = _1144 + 1.0;
    float _1148 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1126);
    float _1150 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1128);
    bool _1152 = _908 == 0.0;
    bool _1154 = _1152 && _1060;
    float _1156 = _1140 * _1146;
    float _1158 = _732 + _1148;
    float _1160 = _742 + _1150;
    float _1162 = -_1140;
    float _1164 = _1162 + 1.0;
    float _1166 = _872 * _1156;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1170 = _1158 + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1174 = _1160 + _1172;
    float _1176 = _524 * 6.283185482025146484375;
    float _1178 = cos(_1176);
    float _1180 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1166);
    float _1182 = _1170 * _1170;
    float _1184 = _1174 * _1174;
    float _1186 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1188 = _1100;
    float _1190 = _1102;
    float _1192 = _1104;
    float _1194 = _1182;
    float _1196 = _1184;
    float _1198 = _1158;
    float _1200 = _1160;
    if (!_1154)
    {
        float _1202 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1100);
        _1188 = _1202;
    }
    float _1204 = _1188;
    float _1206 = _1204;
    if (!_1154)
    {
        float _1208 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1102);
        _1190 = _1208;
    }
    float _1210 = _1190;
    float _1212 = _1182 + _1184;
    float _1214 = fma(_918, _1142, _1180);
    if (!_1154)
    {
        float _1216 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1104);
        _1192 = _1216;
    }
    float _1218 = _1192;
    if (_614)
    {
        float _1220 = -_930;
        float _1222 = _1220 + 1.0;
        _922 = as_type<int>(_1222);
    }
    int _1224 = _922;
    float _1226 = sqrt(_1212);
    float _1228 = fma(_1186, _966, -0.5);
    float _1230 = _532 * _956;
    float _1232 = fma(_896, _1096, _1214);
    if (_614)
    {
        float _1234 = _902 ? as_type<float>(_1224) : _930;
        _940 = _1234;
    }
    float _1236 = _940;
    float _1238 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1240 = -_1230;
    float _1242 = fma(_1178, _1228, _1240);
    float _1244 = _1178 * _956;
    float _1246 = -_1210;
    float _1248 = _976 * _1246;
    float _1250 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1238);
    float _1252 = fma(_460, _1242, _436);
    float _1254 = _1004 * _1210;
    float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1258 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1250);
    float _1260 = _998 * _1210;
    float _1262 = fma(_532, _1228, _1244);
    bool _1264 = _1226 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = _728 + _1258;
    float _1268 = fma(_894, _1082, _1232);
    float _1270 = fma(_1002, _1204, _1248);
    float _1272 = fma(_1024, _1204, _1254);
    float _1274 = fma(_1030, _1204, _1260);
    float _1276 = -_444;
    float _1278 = fma(_512, _1262, _1276);
    float _1280 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1268);
    if (!_1264)
    {
        _1206 = _1266;
    }
    float _1282 = _1206;
    bool _1284 = !_1264;
    float _1286 = _1282;
    if (!_1284)
    {
        float _1288 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1292 = _1226 + _1290;
        float _1294 = _1266 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1296 = rsqrt(_1212);
        float _1298 = _1292 * _1288;
        float _1300 = _1298 * 0.15915493667125701904296875;
        float _1302 = _1300 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        float _1306 = _1300 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        float _1310 = fma(_1304, _1294, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1312 = _1296 * _1310;
        float _1314 = fma(_1170, _1312, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1316 = _1308 + (-1.0);
        float _1318 = fma(_1174, _1312, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1322 = _1314 + _1320;
        float _1324 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1326 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1328 = _1318 + _1326;
        float _1330 = _1322 * _1322;
        float _1332 = fma(_1266, _1308, _1324);
        float _1334 = _1328 * _1328;
        _1286 = _1332;
        _1194 = _1330;
        _1196 = _1334;
        _1198 = _1314;
        _1200 = _1318;
    }
    float _1336 = _1286;
    float _1338 = _1194;
    float _1340 = _1196;
    float _1342 = _1198;
    float _1344 = _1200;
    float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1350 = _1336 + _1348;
    float _1352 = fma(_1034, _1218, _1272);
    float _1354 = fma(_1006, _1218, _1270);
    float _1356 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1358 = fma(_1350, _1350, _1338);
    float _1360 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1364 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1366 = _1358 + _1340;
    float _1368 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1360);
    float _1370 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1362);
    float _1372 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1364);
    float _1374 = fma(_1026, _1218, _1274);
    float _1376 = _1356 * _1346;
    float _1378 = sqrt(_1366);
    float _1380 = _934 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1394 = _1380 * _1256;
    float _1396 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1368);
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1400 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1406 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1412 = _1252 + 0.5;
    float _1414 = _1278 + 0.5;
    float _1416 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1418 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1370);
    float _1420 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1372);
    out.m_67.x = _1406;
    out.m_67.y = _1408;
    out.m_67.z = _1410;
    out.m_67.w = _1398;
    bool _1422 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1424 = isnan(_1378);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1430 = _1426 || _1428;
    out.m_69.x = _1412;
    out.m_69.y = _1414;
    out.m_69.z = _1376;
    out.m_69.w = _1394;
    out.m_71.x = _1400;
    out.m_71.y = _1402;
    out.m_71.z = _1404;
    out.m_71.w = _1416;
    out.m_73.x = _1396;
    out.m_73.y = _1418;
    out.m_73.z = _1420;
    float _1432 = _1370;
    float _1434 = _1414;
    float _1436 = _1394;
    float _1438 = _1376;
    if (!_1430)
    {
        _1432 = 1.0;
    }
    float _1440 = _1432;
    bool _1442 = !_1430;
    float _1444 = _1440;
    if (!_1442)
    {
        bool _1446 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1448 = isnan(_1378);
        bool _1450 = _1446 || _1448;
        bool _1452 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1454 = _1450 || _1452;
        if (!_1454)
        {
            float _1456 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1458 = _1378 + _1456;
            float _1460 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1462 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1460;
            float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1466 = _1464 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1468 = 1.0 / _1462;
            float _1470 = _1458 * _1468;
            float _1472 = fma(_1470, _1466, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1444 = _1472;
            _1474 = true;
        }
        else
        {
            bool _1476 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1478 = isnan(_1378);
            bool _1480 = _1476 || _1478;
            bool _1482 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1484 = _1480 || _1482;
            if (!_1484)
            {
                float _1486 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1488 = _1378 + _1486;
                float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1492 = _1490 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1494 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1496 = _1494 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1498 = 1.0 / _1492;
                float _1500 = _1488 * _1498;
                float _1502 = fma(_1500, _1496, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1444 = _1502;
                _1474 = true;
            }
            else
            {
                _1444 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1474 = false;
    float _1504 = _1444;
    float _1506 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1508 = _1336 + _1506;
    float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1512 = _1342 + _1510;
    float _1514 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1516 = _1344 + _1514;
    float _1518 = -_832;
    float _1520 = _732 + _1518;
    float _1522 = fma(_1508, _1504, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1524 = fma(_1512, _1504, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1526 = fma(_1516, _1504, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1528 = -_830;
    float _1530 = _1528 + _1522;
    float _1532 = -_832;
    float _1534 = _1532 + _1524;
    float _1536 = -_836;
    float _1538 = _1536 + _1526;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1542 = _1530 + _1540;
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1546 = _1534 + _1544;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1550 = _1538 + _1548;
    float _1552 = _1542 * _1542;
    float _1554 = fma(_1520, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1556 = fma(_1546, _1546, _1552);
    float _1558 = fma(_1550, _1550, _1556);
    float _1560 = rsqrt(_1558);
    float _1562 = sqrt(_1558);
    float _1564 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1566 = _1546 * _1564;
    float _1568 = _1550 * _1564;
    float _1570 = _1566 * _1566;
    float _1572 = _1568 * _1568;
    float _1574 = _1570 + _1572;
    float _1576 = sqrt(_1574);
    bool _1578 = _1576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = _1576 + _1580;
    float _1584 = _1410;
    float _1586 = _1582;
    float _1588 = _1550;
    float _1590 = _1542;
    float _1592 = _1546;
    if (_1578)
    {
        float _1594 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1584 = _1594;
    }
    float _1596 = _1584;
    if (_1578)
    {
        float _1598 = rsqrt(_1574);
        _1434 = _1598;
    }
    float _1600 = _1434;
    float _1602 = _1600;
    if (_1578)
    {
        float _1604 = _1582 * _1596;
        _1586 = _1604;
    }
    float _1606 = _1586;
    if (_1578)
    {
        float _1608 = _1606 * 0.15915493667125701904296875;
        _1436 = _1608;
    }
    float _1610 = _1436;
    float _1612 = _1412;
    float _1614 = _1610;
    if (_1578)
    {
        float _1616 = _1610 * 6.283185482025146484375;
        float _1618 = sin(_1616);
        _1612 = _1618;
    }
    float _1620 = _1612;
    float _1622 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1624 = precise::max(0.0, _1622);
    float _1626 = _1398;
    float _1628 = _1622;
    float _1630 = _1624;
    if (_1578)
    {
        float _1632 = _1610 * 6.283185482025146484375;
        float _1634 = cos(_1632);
        _1626 = _1634;
    }
    float _1636 = _1626;
    float _1638 = -_1564;
    float _1640 = -_1624;
    float _1642 = fma(_1542, _1638, _1640);
    if (_1578)
    {
        float _1644 = _1642 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1628 = _1644;
    }
    float _1646 = _1628;
    float _1648 = _1620;
    float _1650 = _1646;
    if (_1578)
    {
        float _1652 = fma(_1620, _1646, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1438 = _1652;
    }
    float _1654 = _1438;
    float _1656 = _1654;
    if (!_1578)
    {
        _1648 = _1642;
    }
    float _1658 = _1648;
    float _1660 = _1658;
    if (!_1578)
    {
        _1650 = _1570;
    }
    float _1662 = _1650;
    float _1664 = _1636;
    float _1666 = _1662;
    if (_1578)
    {
        float _1668 = _1636 + (-1.0);
        _1630 = _1668;
    }
    float _1670 = _1630;
    float _1672 = _1670;
    if (_1578)
    {
        float _1674 = _1600 * _1654;
        _1614 = _1674;
    }
    float _1676 = _1614;
    if (!_1578)
    {
        _1602 = _1566;
    }
    float _1678 = _1602;
    float _1680 = _1678;
    if (_1578)
    {
        float _1682 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1682;
    }
    float _1684 = _1672;
    if (_1578)
    {
        float _1686 = _1566 * _1676;
        _1680 = _1686;
    }
    float _1688 = _1680;
    if (!_1578)
    {
        _1656 = _1572;
    }
    float _1690 = _1656;
    float _1692 = _1690;
    if (_1578)
    {
        float _1694 = fma(_1642, _1636, _1684);
        _1660 = _1694;
    }
    float _1696 = _1660;
    if (!_1578)
    {
        _1664 = _1568;
    }
    float _1698 = _1664;
    float _1700 = _1698;
    if (_1578)
    {
        float _1702 = _1568 * _1676;
        _1700 = _1702;
    }
    float _1704 = _1700;
    if (_1578)
    {
        float _1706 = _1688 * _1688;
        _1666 = _1706;
    }
    float _1708 = _1666;
    float _1710 = floor(_1554);
    if (_1578)
    {
        float _1712 = _1704 * _1704;
        _1692 = _1712;
    }
    float _1714 = _1692;
    float _1716 = fma(_1696, _1696, _1708);
    float _1718 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1720 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1722 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1720);
    float _1724 = precise::clamp(_1722, 0.0, 1.0);
    float _1726 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1728 = _1716 + _1714;
    float _1730 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1718);
    float _1732 = -_1724;
    float _1734 = _1732 + 1.0;
    float _1736 = -_836;
    float _1738 = _742 + _1736;
    float _1740 = rsqrt(_1728);
    float _1742 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1730);
    float _1744 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1726);
    float _1746 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1748 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1750 = abs(_1734);
    float _1752 = log2(_1750);
    float _1754 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1756 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1758 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1760 = -_1754;
    float _1762 = fma(_1760, _1748, 1.0);
    float _1764 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1766 = _1740 * _1688;
    float _1768 = _1740 * _1704;
    float _1770 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1764);
    float _1772 = _1740 * _1696;
    float _1774 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1756);
    float _1776 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1778 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1770);
    float _1780 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1744);
    float _1782 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1774);
    float _1784 = -_1776;
    float _1786 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1784);
    float _1788 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1790 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1792 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1794 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1796 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1798 = -_1768;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1786);
    float _1802 = floor(_1758);
    float _1804 = -_1710;
    float _1806 = _1554 + _1804;
    float _1808 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1796);
    float _1810 = fma(_1800, -0.5, 0.5);
    float _1812 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1814 = fma(_1800, 0.5, 0.5);
    float _1816 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1808);
    float _1818 = exp2(_1790);
    float _1820 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1812);
    float _1822 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1816);
    float _1824 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1826 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1820);
    float _1828 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1824);
    float _1830 = log2(_1762);
    float _1832 = fma(_1814, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1834 = -_1802;
    float _1836 = _1758 + _1834;
    float _1838 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1828);
    float _1840 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1826);
    float _1842 = fma(_1814, _1832, -0.212114393711090087890625);
    float _1844 = 1.0 / _1822;
    float _1846 = sqrt(_1810);
    float _1848 = _1830 * 0.693147182464599609375;
    float2 _5233 = float2(_1806, _1836);
    float _1850 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5233, float2(0.0), isnan(_5233)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5233, float2(0.0), isnan(_5233)), level(0.0)).x;
    float _1852 = fma(_1814, _1842, 1.570728778839111328125);
    float _1854 = _1848 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1856 = _1840 * _1844;
    float _1858 = _1772 + 1.0;
    float _1860 = fma(_1856, 0.5, 0.5);
    float _1862 = -_1772;
    float _1864 = fma(_1818, _1858, _1862);
    float _1866 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1838);
    float _1868 = _1846 * 0.636619746685028076171875;
    float _1870 = _1866 * _1844;
    float _1872 = -_1852;
    float _1874 = fma(_1868, _1872, 1.0);
    float _1876 = fma(_1864, 0.5, 0.5);
    float _1878 = fma(_1870, -0.5, 0.5);
    float3 _5285 = float3(_1860, _1878, _1854);
    float _1880 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5285, float3(0.0), isnan(_5285)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5285, float3(0.0), isnan(_5285)), level(0.0)).x;
    float3 _5296 = float3(_1860, _1878, _1854);
    float4 _1883 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5296, float3(0.0), isnan(_5296)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5296, float3(0.0), isnan(_5296)), level(0.0)).xyzw;
    float _1885 = _1883.x;
    float _1887 = _1883.y;
    float _1889 = _1883.z;
    float _1891 = _1883.w;
    float2 _5312 = float2(_1874, _1876);
    float3 _1895 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5312, float2(0.0), isnan(_5312)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5312, float2(0.0), isnan(_5312)), level(0.0)).xyz;
    float _1897 = _1895.x;
    float _1899 = _1895.y;
    float _1901 = _1895.z;
    float _1903 = -_830;
    float _1905 = _728 + _1903;
    float _1907 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1909 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1911 = isnan(_1562);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1917 = _1913 || _1915;
    float _1919 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1921 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1923 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1925 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1907);
    float _1927 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1919);
    float _1929 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1921);
    out.m_75.x = _1546;
    out.m_75.y = _1542;
    out.m_75.z = _1550;
    float _1931 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1927);
    float _1933 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1929);
    float _1935 = exp2(_1923);
    float _1937 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1939 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1941 = _1939 + _1937;
    float _1943 = 1.0 / _1937;
    float _1945 = _1866;
    if (!_1917)
    {
        _1588 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1947 = _1588;
    float _1949 = _1947;
    float _1951 = _1947;
    if (!_1917)
    {
        _1590 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1953 = _1590;
    float _1955 = _1953;
    float _1957 = _1953;
    if (!_1917)
    {
        _1592 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1959 = _1592;
    float _1961 = -_1935;
    float _1963 = _1961 + 1.0;
    float _1965 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1967 = _1941 * _1943;
    float _1969 = _1967 * 0.5;
    float _1971 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1973 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1971);
    float _1975 = 1.0 / _1973;
    float _1977 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1979 = _1975 * _1977;
    float _1981 = abs(_1979);
    float _1983 = log2(_1981);
    float _1985 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1987 = exp2(_1985);
    float _1989 = fma(_1987, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1991 = precise::clamp(_1989, 0.0, 1.0);
    float _1993 = fma(_1991, -2.0, 3.0);
    float _1995 = _1991 * _1991;
    float _1997 = _1995 * _1993;
    float _1999 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1925);
    float _2001 = in.m_77.x;
    float _2003 = -_1997;
    float _2005 = _2003 + 1.0;
    float _2007 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1999);
    float _2009 = fma(_2005, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1997);
    bool _2011 = _1979 <= 8000.0;
    bool _2013 = isnan(_1979);
    bool _2015 = _2011 || _2013;
    bool _2017 = isnan(8000.0);
    bool _2019 = _2015 || _2017;
    float _2021 = float(_2019);
    float _2023 = _2007 + _1822;
    float _2025 = _2021 * _2009;
    float _2027 = _2023 * 0.5;
    out.gl_Position.x = _1840;
    out.gl_Position.y = _1866;
    out.gl_Position.z = _2007;
    out.gl_Position.w = _1822;
    float _2029 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _2027;
    out.m_79.w = _1822;
    float _2031 = _1840;
    float _2033 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2035 = _1959;
    float _2037 = _1959;
    if (!_1917)
    {
        _2031 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2039 = _2031;
    float _2041 = _2039;
    float _2043 = _2039;
    if (!_1917)
    {
        _1945 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2045 = _1945;
    float _2047 = -_1850;
    float _2049 = _2047 + 1.0;
    float _2051 = _2049 * _2029;
    float _2053 = precise::clamp(_2051, 0.0, 1.0);
    float _2055 = -_2053;
    float _2057 = fma(_2055, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2059 = _2045;
    float _2061 = _2045;
    if (!_1917)
    {
        _2033 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2063 = _2033;
    float _2065 = _2057 * _2001;
    float _2067 = _2065 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_81.x = _2067;
    float _2069 = _1965 * _1880;
    float _2071 = -_1965;
    float _2073 = _2071 + 1.0;
    float _2075 = _1891 * _2069;
    float _2077 = _1901 * _2069;
    float _2079 = _1891 * _2073;
    float _2081 = fma(_1897, _2075, _1885);
    float _2083 = fma(_1899, _2075, _1887);
    float _2085 = fma(_1891, _2077, _1889);
    out.m_83.x = _2081;
    out.m_83.y = _2083;
    out.m_83.z = _2085;
    out.m_83.w = _2079;
    bool _2087 = !_1917;
    float _2089 = _2063;
    float _2091 = _2063;
    if (!_2087)
    {
        bool _2093 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2095 = isnan(_1562);
        bool _2097 = _2093 || _2095;
        bool _2099 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2101 = _2097 || _2099;
        if (!_2101)
        {
            float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2105 = _1562 + _2103;
            float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2109 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2107;
            float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2115 = 1.0 / _2109;
            float _2117 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2119 = _2117 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2123 = _2121 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2125 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2127 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2131 = _2129 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2133 = _2105 * _2115;
            float _2135 = precise::clamp(_2133, 0.0, 1.0);
            float _2137 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2139 = _2137 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2141 = fma(_2135, _2113, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2143 = fma(_2135, _2139, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2145 = fma(_2135, _2119, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2147 = fma(_2135, _2123, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2149 = fma(_2135, _2127, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2151 = fma(_2135, _2131, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2061 = _2145;
            _2037 = _2149;
            _2043 = _2141;
            _1957 = _2147;
            _1951 = _2143;
            _2091 = _2151;
            _2153 = true;
        }
        else
        {
            bool _2155 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2157 = isnan(_1562);
            bool _2159 = _2155 || _2157;
            bool _2161 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2163 = _2159 || _2161;
            if (!_2163)
            {
                _2041 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2165 = _2041;
            _2043 = _2165;
            if (!_2163)
            {
                _2059 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2167 = _2059;
            _2061 = _2167;
            if (!_2163)
            {
                _1949 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2169 = _1949;
            _1951 = _2169;
            if (!_2163)
            {
                _1955 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2171 = _1955;
            _1957 = _2171;
            if (!_2163)
            {
                _2035 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2173 = _2035;
            _2037 = _2173;
            if (!_2163)
            {
                _2089 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2175 = _2089;
            bool _2177 = !_2163;
            _2091 = _2175;
            if (!_2177)
            {
                bool _2179 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2181 = isnan(_1562);
                bool _2183 = _2179 || _2181;
                bool _2185 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2187 = _2183 || _2185;
                if (!_2187)
                {
                    float _2189 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2191 = _1562 + _2189;
                    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2195 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2193;
                    float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2199 = _2197 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2201 = 1.0 / _2195;
                    float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2207 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2209 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2211 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2213 = _2211 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2215 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2217 = _2215 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2219 = _2191 * _2201;
                    float _2221 = precise::clamp(_2219, 0.0, 1.0);
                    float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2225 = _2223 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2227 = fma(_2221, _2199, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2229 = fma(_2221, _2225, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2231 = fma(_2221, _2205, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2233 = fma(_2221, _2209, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2235 = fma(_2221, _2213, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2237 = fma(_2221, _2217, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2061 = _2231;
                    _2037 = _2235;
                    _2043 = _2227;
                    _1957 = _2233;
                    _1951 = _2229;
                    _2091 = _2237;
                    _2153 = true;
                }
                else
                {
                    _2061 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2037 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2043 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1957 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1951 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2091 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2153 = false;
    float _2239 = _2061;
    float _2241 = _2037;
    float _2243 = _2043;
    float _2245 = _1957;
    float _2247 = _1951;
    float _2249 = _2091;
    float _2251 = fma(_1418, -0.5, 0.5);
    float _2253 = precise::clamp(_2251, 0.0, 1.0);
    float _2255 = -_2239;
    float _2257 = _2255 + _2241;
    float _2259 = -_2243;
    float _2261 = _2259 + _2245;
    float _2263 = -_2247;
    float _2265 = _2263 + _2249;
    bool _2267 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2269 = fma(_2253, _2257, _2239);
    float _2271 = fma(_2253, _2261, _2243);
    float _2273 = fma(_2253, _2265, _2247);
    float _2275 = _2269 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _2277 = fma(_2271, 0.298911988735198974609375, _2275);
    float _2279 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2281 = fma(_2273, 0.114477999508380889892578125, _2277);
    out.m_51.x = _2279;
    float _2283 = -_2281;
    float _2285 = _2271 + _2283;
    float _2287 = -_2281;
    float _2289 = _2269 + _2287;
    float _2291 = -_2281;
    float _2293 = _2273 + _2291;
    float _2295 = fma(_2285, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2281);
    float _2297 = fma(_2289, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2281);
    float _2299 = fma(_2293, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2281);
    out.m_87.x = _2295;
    out.m_87.y = _2297;
    out.m_87.z = _2299;
    if (!_2267)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2301 = -_1530;
    float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2305 = -_1534;
    float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2309 = -_1538;
    float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2313 = _2303 * _2303;
    float _2315 = fma(_2307, _2307, _2313);
    float _2317 = fma(_2311, _2311, _2315);
    float _2319 = sqrt(_2317);
    float _2321 = rsqrt(_2317);
    float _2323 = -_2319;
    float _2325 = _2323 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2327 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2329 = precise::clamp(_2327, 0.0, 1.0);
    float _2331 = _2307 * _2321;
    float _2333 = _2303 * _2321;
    float _2335 = abs(_2329);
    float _2337 = log2(_2335);
    float _2339 = _2311 * _2321;
    float _2341 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2343 = _1418 * _2333;
    float _2345 = -_2333;
    float _2347 = -_2341;
    float _2349 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2347);
    float _2351 = fma(_1396, _2331, _2343);
    float _2353 = -_2339;
    float _2355 = fma(_2353, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2349);
    float _2357 = fma(_1420, _2339, _2351);
    float _2359 = precise::clamp(_2357, 0.0, 1.0);
    float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2363 = _2355 + _2361;
    float _2365 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2367 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2369 = precise::clamp(_2367, 0.0, 1.0);
    float _2371 = exp2(_2365);
    float _2373 = _2371 * _2369;
    float _2375 = _2359 * _2373;
    float _2377 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2379 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2381 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2377;
    out.m_85.y = _2379;
    out.m_85.z = _2381;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2153 = false;
    bool _1474 = false;
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
        float _2438 = as_type<float>(_122);
        out.gl_Position.z = _2438;
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
        float _2507 = as_type<float>(_160);
        out.gl_Position.z = _2507;
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
    bool _374 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _376 = isnan(1.0);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _382 = _378 || _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _386 = 1.0 + _384;
    bool _388 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _396 = _392 || _394;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _400 = 1.0 / _386;
    float _402 = _372 * _140;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _406;
    float _410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _412 = _362 * 2.0;
    float _414 = _364 * 2.0;
    float _416 = _366 * 2.0;
    float _418 = _362 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _420 = _364 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _422 = exp2(_402);
    float _424 = _364 + _366;
    float _426 = -_404;
    float _428 = fma(_418, 2.0, _426);
    float _430 = fma(_420, -2.0, _398);
    float _432 = _364 + _362;
    float _434 = -_140;
    float _436 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[76].x, _428);
    float _438 = floor(_412);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _444 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _430);
    float _446 = _432 + (-1.0);
    float _448 = _424 + (-1.0);
    float _450 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[78].z, _442);
    float _452 = floor(_414);
    float _454 = -_422;
    float _456 = _454 + 1.0;
    float _458 = _410 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _460 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _450);
    float _462 = floor(_416);
    bool _464 = _438 > 0.0;
    bool _466 = _438 >= 0.0;
    bool _468 = isnan(_438);
    bool _470 = _466 || _468;
    bool _472 = isnan(0.0);
    bool _474 = _470 || _472;
    float _476 = _396 ? _456 : 0.0;
    bool _478 = _452 > 0.0;
    bool _480 = _452 >= 0.0;
    bool _482 = isnan(_452);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _492 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[79].z, _440);
    int _494 = _474 ? 0 : 1;
    float _496 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[78].w, _490);
    bool _498 = _462 > 0.0;
    float _500 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[79].x, _492);
    bool _502 = _462 >= 0.0;
    bool _504 = isnan(_462);
    bool _506 = _502 || _504;
    bool _508 = isnan(0.0);
    bool _510 = _506 || _508;
    float _512 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _496);
    if (_382)
    {
        float _514 = _476 * _400;
        _144 = _514;
    }
    float _516 = _144;
    float _518 = in.m_57.x;
    float _520 = in.m_57.y;
    float _522 = in.m_57.z;
    float _524 = _500 * (-0.15915493667125701904296875);
    int _526 = _510 ? 0 : 1;
    int _528 = _488 ? 0 : 1;
    float _530 = _524 * 6.283185482025146484375;
    float _532 = sin(_530);
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _544 = _542 != 0;
    int _546 = ~_526;
    int _548 = _546 + 1;
    int _550 = _548 + 1;
    int _552 = ~_494;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    int _558 = ~_528;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    int _564 = _550;
    int _566 = _556;
    int _568 = _562;
    bool _570 = _544;
    if (!_498)
    {
        int _572 = ~_526;
        int _574 = _572 + 1;
        _564 = _574;
    }
    int _576 = _564;
    if (!_464)
    {
        int _578 = ~_494;
        int _580 = _578 + 1;
        _566 = _580;
    }
    int _582 = _566;
    if (!_478)
    {
        int _584 = ~_528;
        int _586 = _584 + 1;
        _568 = _586;
    }
    int _588 = _568;
    float _590 = in.m_48.x;
    float _592 = in.m_48.y;
    float _594 = in.m_48.z;
    bool _596 = !_536;
    int _598 = _596 ? 0 : 1;
    float _600 = _326 * _518;
    bool _602 = _368 > 0.5;
    float _604 = _328 * _520;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _608 = _606 != 0;
    float _610 = _362 + _366;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _618 = _616 != 0;
    float _620 = _610 + (-1.0);
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _624 = _622 != 0;
    float _626 = _330 * _522;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _632 = _362 + (-0.5);
    float _634 = _366 + (-0.5);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _640 = 1.0 / _630;
    bool _642 = !_540;
    int _644 = _642 ? 0 : 1;
    float _646 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _648 = _364 > 0.5;
    float _650 = _592 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _652 = _592 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _654 = float(_582);
    float _656 = 1.0 / _638;
    float _658 = _364 + (-0.5);
    float _660 = _592 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _670 = fma(_590, (*spvDescriptorSet0.vp_c10)._m0[5].x, _650);
    float _672 = fma(_590, (*spvDescriptorSet0.vp_c10)._m0[4].x, _660);
    float _674 = fma(_590, (*spvDescriptorSet0.vp_c10)._m0[6].x, _652);
    float _676 = in.m_59.x;
    float _678 = in.m_59.y;
    float _680 = in.m_59.z;
    float _682 = 1.0 / _668;
    float _684 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[5].z, _670);
    float _686 = _408 * _640;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _688;
    float _692 = float(_588);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _698 = 1.0 / _664;
    int _700 = abs(_598);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _706 = float(_576);
    float _708 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _710 = _696 * _656;
    float _712 = in.m_61.x;
    float _714 = _690 * _682;
    float _716 = float(_700);
    float _718 = _716 * _706;
    float _720 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[4].z, _672);
    float _722 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _724 = abs(_644);
    float _726 = _718 * (-2.0);
    float _728 = _684 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _730 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[6].z, _674);
    float _732 = _720 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _734 = fma(_722, _726, _722);
    float _736 = fma(_726, _676, _676);
    float _738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _740 = _728 + _738;
    float _742 = _730 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _746 = _732 + _744;
    float _748 = float(_724);
    float _750 = _740 * _740;
    float _752 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[196].x, _736);
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _756 = _742 + _754;
    bool _758 = !_544;
    int _760 = _758 ? 0 : 1;
    float _762 = fma(_746, _746, _750);
    float _764 = _748 * _654;
    float _766 = fma(_734, _516, _752);
    int _768 = abs(_760);
    float _770 = fma(_756, _756, _762);
    float _772 = _764 * (-2.0);
    float _774 = _750;
    bool _776 = _602;
    if (_608)
    {
        float _778 = in.m_55.x;
        _774 = _778;
    }
    float _780 = _774;
    float _782 = float(_768);
    float _784 = fma(_772, _678, _678);
    float _786 = rsqrt(_770);
    float _788 = fma(_708, _772, _708);
    float _790 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _792 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].y, _784);
    float _794 = _782 * _692;
    float _796 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _798 = in.m_61.y;
    float _800 = fma(_788, _516, _792);
    float _802 = _794 * (-2.0);
    float _804 = _796 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _806 = _600;
    if (_614)
    {
        float _808 = in.m_55.z;
        _806 = _808;
    }
    float _810 = _806;
    float _812 = _800 * 0.15915493667125701904296875;
    float _814 = fma(_802, _680, _680);
    float _816 = fma(_790, _802, _790);
    float _818 = _766 * 0.15915493667125701904296875;
    float _820 = _812 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = _804 * _786;
    float _826 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[196].z, _814);
    float _828 = _704 * _698;
    float _830 = _740 * _824;
    float _832 = _746 * _824;
    float _834 = fma(_816, _516, _826);
    float _836 = _756 * _824;
    float _838 = -_830;
    float _840 = _740 + _838;
    float _842 = -_832;
    float _844 = _746 + _842;
    float _846 = _834 * 0.15915493667125701904296875;
    float _848 = -_836;
    float _850 = _756 + _848;
    float _852 = _840 * _840;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _856 = _360 + _854;
    float _858 = _818 * 6.283185482025146484375;
    float _860 = sin(_858);
    float _862 = _816;
    float _864 = _818;
    if (_608)
    {
        bool _866 = _780 > 0.5;
        _570 = _866;
    }
    bool _868 = _570;
    float _870 = fma(_844, _844, _852);
    float _872 = fma(_686, _856, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _874 = -_798;
    float _876 = _874 + 1.0;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _880 = _360 + _878;
    float _882 = fma(_850, _850, _870);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _886 = _360 + _884;
    float _888 = _818 * 6.283185482025146484375;
    float _890 = cos(_888);
    int _892 = _602 ? as_type<int>(_876) : as_type<int>(_798);
    float _894 = fma(_828, _880, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _896 = fma(_714, _886, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _898 = _798;
    if (_614)
    {
        bool _900 = _810 > 0.5;
        _776 = _900;
    }
    bool _902 = _776;
    float _904 = in.m_63.x;
    float _906 = in.m_63.y;
    float _908 = in.m_63.z;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _912 = _360 + _910;
    if (!_608)
    {
        _862 = _712;
    }
    float _914 = _862;
    float _916 = sqrt(_882);
    float _918 = fma(_710, _912, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _920 = _914;
    int _922 = as_type<int>(_918);
    if (!_608)
    {
        _864 = _914;
    }
    float _924 = _864;
    float _926 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _928 = _924;
    if (_608)
    {
        _920 = _712;
    }
    float _930 = _920;
    float _932 = _860 * _822;
    float _934 = _618 ? as_type<float>(_892) : _798;
    float _936 = _812 * 6.283185482025146484375;
    float _938 = cos(_936);
    float _940 = _930;
    if (_624)
    {
        float _942 = _648 ? _876 : _798;
        _898 = _942;
    }
    float _944 = _898;
    float _946 = _890 * _822;
    int _948 = 0;
    if (_608)
    {
        float _950 = -_930;
        float _952 = _950 + 1.0;
        _948 = as_type<int>(_952);
    }
    int _954 = _948;
    float _956 = fma(_458, _944, -0.5);
    float _958 = _846 * 6.283185482025146484375;
    float _960 = cos(_958);
    float _962 = _786 * _916;
    if (_608)
    {
        float _964 = _868 ? as_type<float>(_954) : _930;
        _928 = _964;
    }
    float _966 = _928;
    float _968 = _926 * _962;
    float _970 = _796 * _962;
    float _972 = _646 * _962;
    float _974 = _846 * 6.283185482025146484375;
    float _976 = sin(_974);
    float _978 = _890 * _938;
    float _980 = _860 * _938;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _904);
    float _984 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _908);
    bool _986 = _906 != 0.0;
    bool _988 = isnan(_906);
    bool _990 = _986 || _988;
    bool _992 = isnan(0.0);
    bool _994 = _990 || _992;
    float _996 = _970 * _982;
    float _998 = _860 * _960;
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _906);
    float _1002 = _938 * _960;
    float _1004 = _890 * _960;
    float _1006 = _822 * _960;
    float _1008 = _968 * _1000;
    float _1010 = _972 * _984;
    bool _1012 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1014 = isnan(_360);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = fma(_976, _978, _932);
    float _1026 = fma(_976, _932, _978);
    float _1028 = -_946;
    float _1030 = fma(_976, _980, _1028);
    float _1032 = -_980;
    float _1034 = fma(_976, _946, _1032);
    bool _1036 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1038 = isnan(_360);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = -_1008;
    float _1050 = _976 * _1048;
    float _1052 = _1004 * _1008;
    float _1054 = _998 * _1008;
    bool _1056 = _904 == 0.0;
    bool _1058 = !_994;
    bool _1060 = _1056 && _1058;
    float _1062 = -_1046;
    float _1064 = _1062 + 1.0;
    float _1066 = fma(_1002, _996, _1050);
    float _1068 = fma(_1024, _996, _1052);
    bool _1070 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1072 = isnan(_360);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = _1022 * _1064;
    float _1084 = -_1022;
    float _1086 = _1084 + 1.0;
    float _1088 = fma(_1030, _996, _1054);
    float _1090 = fma(_1034, _1010, _1068);
    float _1092 = -_1080;
    float _1094 = _1092 + 1.0;
    float _1096 = _1080 * _1086;
    float _1098 = fma(_1006, _1010, _1066);
    float _1100 = in.m_65.x;
    float _1102 = in.m_65.y;
    float _1104 = in.m_65.z;
    float _1106 = fma(_1026, _1010, _1088);
    float _1108 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1110 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1112 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1114 = isnan(_360);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1126 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1108);
    float _1128 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1110);
    bool _1130 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1132 = isnan(_360);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1138 = _1134 || _1136;
    float _1140 = float(_1138);
    float _1142 = _1122 * _1094;
    float _1144 = -_1122;
    float _1146 = _1144 + 1.0;
    float _1148 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1126);
    float _1150 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1128);
    bool _1152 = _908 == 0.0;
    bool _1154 = _1152 && _1060;
    float _1156 = _1140 * _1146;
    float _1158 = _732 + _1148;
    float _1160 = _742 + _1150;
    float _1162 = -_1140;
    float _1164 = _1162 + 1.0;
    float _1166 = _872 * _1156;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1170 = _1158 + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1174 = _1160 + _1172;
    float _1176 = _524 * 6.283185482025146484375;
    float _1178 = cos(_1176);
    float _1180 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1166);
    float _1182 = _1170 * _1170;
    float _1184 = _1174 * _1174;
    float _1186 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1188 = _1100;
    float _1190 = _1102;
    float _1192 = _1104;
    float _1194 = _1182;
    float _1196 = _1184;
    float _1198 = _1158;
    float _1200 = _1160;
    if (!_1154)
    {
        float _1202 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1100);
        _1188 = _1202;
    }
    float _1204 = _1188;
    float _1206 = _1204;
    if (!_1154)
    {
        float _1208 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1102);
        _1190 = _1208;
    }
    float _1210 = _1190;
    float _1212 = _1182 + _1184;
    float _1214 = fma(_918, _1142, _1180);
    if (!_1154)
    {
        float _1216 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1104);
        _1192 = _1216;
    }
    float _1218 = _1192;
    if (_614)
    {
        float _1220 = -_930;
        float _1222 = _1220 + 1.0;
        _922 = as_type<int>(_1222);
    }
    int _1224 = _922;
    float _1226 = sqrt(_1212);
    float _1228 = fma(_1186, _966, -0.5);
    float _1230 = _532 * _956;
    float _1232 = fma(_896, _1096, _1214);
    if (_614)
    {
        float _1234 = _902 ? as_type<float>(_1224) : _930;
        _940 = _1234;
    }
    float _1236 = _940;
    float _1238 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1240 = -_1230;
    float _1242 = fma(_1178, _1228, _1240);
    float _1244 = _1178 * _956;
    float _1246 = -_1210;
    float _1248 = _976 * _1246;
    float _1250 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1238);
    float _1252 = fma(_460, _1242, _436);
    float _1254 = _1004 * _1210;
    float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1258 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1250);
    float _1260 = _998 * _1210;
    float _1262 = fma(_532, _1228, _1244);
    bool _1264 = _1226 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = _728 + _1258;
    float _1268 = fma(_894, _1082, _1232);
    float _1270 = fma(_1002, _1204, _1248);
    float _1272 = fma(_1024, _1204, _1254);
    float _1274 = fma(_1030, _1204, _1260);
    float _1276 = -_444;
    float _1278 = fma(_512, _1262, _1276);
    float _1280 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1268);
    if (!_1264)
    {
        _1206 = _1266;
    }
    float _1282 = _1206;
    bool _1284 = !_1264;
    float _1286 = _1282;
    if (!_1284)
    {
        float _1288 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1292 = _1226 + _1290;
        float _1294 = _1266 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1296 = rsqrt(_1212);
        float _1298 = _1292 * _1288;
        float _1300 = _1298 * 0.15915493667125701904296875;
        float _1302 = _1300 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        float _1306 = _1300 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        float _1310 = fma(_1304, _1294, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1312 = _1296 * _1310;
        float _1314 = fma(_1170, _1312, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1316 = _1308 + (-1.0);
        float _1318 = fma(_1174, _1312, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1322 = _1314 + _1320;
        float _1324 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1326 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1328 = _1318 + _1326;
        float _1330 = _1322 * _1322;
        float _1332 = fma(_1266, _1308, _1324);
        float _1334 = _1328 * _1328;
        _1286 = _1332;
        _1194 = _1330;
        _1196 = _1334;
        _1198 = _1314;
        _1200 = _1318;
    }
    float _1336 = _1286;
    float _1338 = _1194;
    float _1340 = _1196;
    float _1342 = _1198;
    float _1344 = _1200;
    float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1350 = _1336 + _1348;
    float _1352 = fma(_1034, _1218, _1272);
    float _1354 = fma(_1006, _1218, _1270);
    float _1356 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1358 = fma(_1350, _1350, _1338);
    float _1360 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1364 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1366 = _1358 + _1340;
    float _1368 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1360);
    float _1370 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1362);
    float _1372 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1364);
    float _1374 = fma(_1026, _1218, _1274);
    float _1376 = _1356 * _1346;
    float _1378 = sqrt(_1366);
    float _1380 = _934 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1394 = _1380 * _1256;
    float _1396 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1368);
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1400 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1406 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1412 = _1252 + 0.5;
    float _1414 = _1278 + 0.5;
    float _1416 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1418 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1370);
    float _1420 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1372);
    out.m_67.x = _1406;
    out.m_67.y = _1408;
    out.m_67.z = _1410;
    out.m_67.w = _1398;
    bool _1422 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1424 = isnan(_1378);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1430 = _1426 || _1428;
    out.m_69.x = _1412;
    out.m_69.y = _1414;
    out.m_69.z = _1376;
    out.m_69.w = _1394;
    out.m_71.x = _1400;
    out.m_71.y = _1402;
    out.m_71.z = _1404;
    out.m_71.w = _1416;
    out.m_73.x = _1396;
    out.m_73.y = _1418;
    out.m_73.z = _1420;
    float _1432 = _1370;
    float _1434 = _1414;
    float _1436 = _1394;
    float _1438 = _1376;
    if (!_1430)
    {
        _1432 = 1.0;
    }
    float _1440 = _1432;
    bool _1442 = !_1430;
    float _1444 = _1440;
    if (!_1442)
    {
        bool _1446 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1448 = isnan(_1378);
        bool _1450 = _1446 || _1448;
        bool _1452 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1454 = _1450 || _1452;
        if (!_1454)
        {
            float _1456 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1458 = _1378 + _1456;
            float _1460 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1462 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1460;
            float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1466 = _1464 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1468 = 1.0 / _1462;
            float _1470 = _1458 * _1468;
            float _1472 = fma(_1470, _1466, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1444 = _1472;
            _1474 = true;
        }
        else
        {
            bool _1476 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1478 = isnan(_1378);
            bool _1480 = _1476 || _1478;
            bool _1482 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1484 = _1480 || _1482;
            if (!_1484)
            {
                float _1486 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1488 = _1378 + _1486;
                float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1492 = _1490 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1494 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1496 = _1494 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1498 = 1.0 / _1492;
                float _1500 = _1488 * _1498;
                float _1502 = fma(_1500, _1496, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1444 = _1502;
                _1474 = true;
            }
            else
            {
                _1444 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1474 = false;
    float _1504 = _1444;
    float _1506 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1508 = _1336 + _1506;
    float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1512 = _1342 + _1510;
    float _1514 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1516 = _1344 + _1514;
    float _1518 = -_832;
    float _1520 = _732 + _1518;
    float _1522 = fma(_1508, _1504, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1524 = fma(_1512, _1504, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1526 = fma(_1516, _1504, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1528 = -_830;
    float _1530 = _1528 + _1522;
    float _1532 = -_832;
    float _1534 = _1532 + _1524;
    float _1536 = -_836;
    float _1538 = _1536 + _1526;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1542 = _1530 + _1540;
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1546 = _1534 + _1544;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1550 = _1538 + _1548;
    float _1552 = _1542 * _1542;
    float _1554 = fma(_1520, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1556 = fma(_1546, _1546, _1552);
    float _1558 = fma(_1550, _1550, _1556);
    float _1560 = rsqrt(_1558);
    float _1562 = sqrt(_1558);
    float _1564 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1566 = _1546 * _1564;
    float _1568 = _1550 * _1564;
    float _1570 = _1566 * _1566;
    float _1572 = _1568 * _1568;
    float _1574 = _1570 + _1572;
    float _1576 = sqrt(_1574);
    bool _1578 = _1576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = _1576 + _1580;
    float _1584 = _1410;
    float _1586 = _1582;
    float _1588 = _1550;
    float _1590 = _1542;
    float _1592 = _1546;
    if (_1578)
    {
        float _1594 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1584 = _1594;
    }
    float _1596 = _1584;
    if (_1578)
    {
        float _1598 = rsqrt(_1574);
        _1434 = _1598;
    }
    float _1600 = _1434;
    float _1602 = _1600;
    if (_1578)
    {
        float _1604 = _1582 * _1596;
        _1586 = _1604;
    }
    float _1606 = _1586;
    if (_1578)
    {
        float _1608 = _1606 * 0.15915493667125701904296875;
        _1436 = _1608;
    }
    float _1610 = _1436;
    float _1612 = _1412;
    float _1614 = _1610;
    if (_1578)
    {
        float _1616 = _1610 * 6.283185482025146484375;
        float _1618 = sin(_1616);
        _1612 = _1618;
    }
    float _1620 = _1612;
    float _1622 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1624 = precise::max(0.0, _1622);
    float _1626 = _1398;
    float _1628 = _1622;
    float _1630 = _1624;
    if (_1578)
    {
        float _1632 = _1610 * 6.283185482025146484375;
        float _1634 = cos(_1632);
        _1626 = _1634;
    }
    float _1636 = _1626;
    float _1638 = -_1564;
    float _1640 = -_1624;
    float _1642 = fma(_1542, _1638, _1640);
    if (_1578)
    {
        float _1644 = _1642 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1628 = _1644;
    }
    float _1646 = _1628;
    float _1648 = _1620;
    float _1650 = _1646;
    if (_1578)
    {
        float _1652 = fma(_1620, _1646, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1438 = _1652;
    }
    float _1654 = _1438;
    float _1656 = _1654;
    if (!_1578)
    {
        _1648 = _1642;
    }
    float _1658 = _1648;
    float _1660 = _1658;
    if (!_1578)
    {
        _1650 = _1570;
    }
    float _1662 = _1650;
    float _1664 = _1636;
    float _1666 = _1662;
    if (_1578)
    {
        float _1668 = _1636 + (-1.0);
        _1630 = _1668;
    }
    float _1670 = _1630;
    float _1672 = _1670;
    if (_1578)
    {
        float _1674 = _1600 * _1654;
        _1614 = _1674;
    }
    float _1676 = _1614;
    if (!_1578)
    {
        _1602 = _1566;
    }
    float _1678 = _1602;
    float _1680 = _1678;
    if (_1578)
    {
        float _1682 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1682;
    }
    float _1684 = _1672;
    if (_1578)
    {
        float _1686 = _1566 * _1676;
        _1680 = _1686;
    }
    float _1688 = _1680;
    if (!_1578)
    {
        _1656 = _1572;
    }
    float _1690 = _1656;
    float _1692 = _1690;
    if (_1578)
    {
        float _1694 = fma(_1642, _1636, _1684);
        _1660 = _1694;
    }
    float _1696 = _1660;
    if (!_1578)
    {
        _1664 = _1568;
    }
    float _1698 = _1664;
    float _1700 = _1698;
    if (_1578)
    {
        float _1702 = _1568 * _1676;
        _1700 = _1702;
    }
    float _1704 = _1700;
    if (_1578)
    {
        float _1706 = _1688 * _1688;
        _1666 = _1706;
    }
    float _1708 = _1666;
    float _1710 = floor(_1554);
    if (_1578)
    {
        float _1712 = _1704 * _1704;
        _1692 = _1712;
    }
    float _1714 = _1692;
    float _1716 = fma(_1696, _1696, _1708);
    float _1718 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1720 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1722 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1720);
    float _1724 = precise::clamp(_1722, 0.0, 1.0);
    float _1726 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1728 = _1716 + _1714;
    float _1730 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1718);
    float _1732 = -_1724;
    float _1734 = _1732 + 1.0;
    float _1736 = -_836;
    float _1738 = _742 + _1736;
    float _1740 = rsqrt(_1728);
    float _1742 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1730);
    float _1744 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1726);
    float _1746 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1748 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1750 = abs(_1734);
    float _1752 = log2(_1750);
    float _1754 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1756 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1758 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1760 = -_1754;
    float _1762 = fma(_1760, _1748, 1.0);
    float _1764 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1766 = _1740 * _1688;
    float _1768 = _1740 * _1704;
    float _1770 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1764);
    float _1772 = _1740 * _1696;
    float _1774 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1756);
    float _1776 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1778 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1770);
    float _1780 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1744);
    float _1782 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1774);
    float _1784 = -_1776;
    float _1786 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1784);
    float _1788 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1790 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1792 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1794 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1796 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1798 = -_1768;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1786);
    float _1802 = floor(_1758);
    float _1804 = -_1710;
    float _1806 = _1554 + _1804;
    float _1808 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1796);
    float _1810 = fma(_1800, -0.5, 0.5);
    float _1812 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1814 = fma(_1800, 0.5, 0.5);
    float _1816 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1808);
    float _1818 = exp2(_1790);
    float _1820 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1812);
    float _1822 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1816);
    float _1824 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1826 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1820);
    float _1828 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1824);
    float _1830 = log2(_1762);
    float _1832 = fma(_1814, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1834 = -_1802;
    float _1836 = _1758 + _1834;
    float _1838 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1828);
    float _1840 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1826);
    float _1842 = fma(_1814, _1832, -0.212114393711090087890625);
    float _1844 = 1.0 / _1822;
    float _1846 = sqrt(_1810);
    float _1848 = _1830 * 0.693147182464599609375;
    float2 _5233 = float2(_1806, _1836);
    float _1850 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5233, float2(0.0), isnan(_5233)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5233, float2(0.0), isnan(_5233)), level(0.0)).x;
    float _1852 = fma(_1814, _1842, 1.570728778839111328125);
    float _1854 = _1848 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1856 = _1840 * _1844;
    float _1858 = _1772 + 1.0;
    float _1860 = fma(_1856, 0.5, 0.5);
    float _1862 = -_1772;
    float _1864 = fma(_1818, _1858, _1862);
    float _1866 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1838);
    float _1868 = _1846 * 0.636619746685028076171875;
    float _1870 = _1866 * _1844;
    float _1872 = -_1852;
    float _1874 = fma(_1868, _1872, 1.0);
    float _1876 = fma(_1864, 0.5, 0.5);
    float _1878 = fma(_1870, -0.5, 0.5);
    float3 _5285 = float3(_1860, _1878, _1854);
    float _1880 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5285, float3(0.0), isnan(_5285)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5285, float3(0.0), isnan(_5285)), level(0.0)).x;
    float3 _5296 = float3(_1860, _1878, _1854);
    float4 _1883 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5296, float3(0.0), isnan(_5296)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5296, float3(0.0), isnan(_5296)), level(0.0)).xyzw;
    float _1885 = _1883.x;
    float _1887 = _1883.y;
    float _1889 = _1883.z;
    float _1891 = _1883.w;
    float2 _5312 = float2(_1874, _1876);
    float3 _1895 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5312, float2(0.0), isnan(_5312)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5312, float2(0.0), isnan(_5312)), level(0.0)).xyz;
    float _1897 = _1895.x;
    float _1899 = _1895.y;
    float _1901 = _1895.z;
    float _1903 = -_830;
    float _1905 = _728 + _1903;
    float _1907 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1909 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1911 = isnan(_1562);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1917 = _1913 || _1915;
    float _1919 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1921 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1923 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1925 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1907);
    float _1927 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1919);
    float _1929 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1921);
    out.m_75.x = _1546;
    out.m_75.y = _1542;
    out.m_75.z = _1550;
    float _1931 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1927);
    float _1933 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1929);
    float _1935 = exp2(_1923);
    float _1937 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1939 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1941 = _1939 + _1937;
    float _1943 = 1.0 / _1937;
    float _1945 = _1866;
    if (!_1917)
    {
        _1588 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1947 = _1588;
    float _1949 = _1947;
    float _1951 = _1947;
    if (!_1917)
    {
        _1590 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1953 = _1590;
    float _1955 = _1953;
    float _1957 = _1953;
    if (!_1917)
    {
        _1592 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1959 = _1592;
    float _1961 = -_1935;
    float _1963 = _1961 + 1.0;
    float _1965 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1967 = _1941 * _1943;
    float _1969 = _1967 * 0.5;
    float _1971 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1973 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1971);
    float _1975 = 1.0 / _1973;
    float _1977 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1979 = _1975 * _1977;
    float _1981 = abs(_1979);
    float _1983 = log2(_1981);
    float _1985 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1987 = exp2(_1985);
    float _1989 = fma(_1987, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1991 = precise::clamp(_1989, 0.0, 1.0);
    float _1993 = fma(_1991, -2.0, 3.0);
    float _1995 = _1991 * _1991;
    float _1997 = _1995 * _1993;
    float _1999 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1925);
    float _2001 = in.m_77.x;
    float _2003 = -_1997;
    float _2005 = _2003 + 1.0;
    float _2007 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1999);
    float _2009 = fma(_2005, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1997);
    bool _2011 = _1979 <= 8000.0;
    bool _2013 = isnan(_1979);
    bool _2015 = _2011 || _2013;
    bool _2017 = isnan(8000.0);
    bool _2019 = _2015 || _2017;
    float _2021 = float(_2019);
    float _2023 = _2007 + _1822;
    float _2025 = _2021 * _2009;
    float _2027 = _2023 * 0.5;
    out.gl_Position.x = _1840;
    out.gl_Position.y = _1866;
    out.gl_Position.z = _2007;
    out.gl_Position.w = _1822;
    float _2029 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _2027;
    out.m_79.w = _1822;
    float _2031 = _1840;
    float _2033 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2035 = _1959;
    float _2037 = _1959;
    if (!_1917)
    {
        _2031 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2039 = _2031;
    float _2041 = _2039;
    float _2043 = _2039;
    if (!_1917)
    {
        _1945 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2045 = _1945;
    float _2047 = -_1850;
    float _2049 = _2047 + 1.0;
    float _2051 = _2049 * _2029;
    float _2053 = precise::clamp(_2051, 0.0, 1.0);
    float _2055 = -_2053;
    float _2057 = fma(_2055, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2059 = _2045;
    float _2061 = _2045;
    if (!_1917)
    {
        _2033 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2063 = _2033;
    float _2065 = _2057 * _2001;
    float _2067 = _2065 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_81.x = _2067;
    float _2069 = _1965 * _1880;
    float _2071 = -_1965;
    float _2073 = _2071 + 1.0;
    float _2075 = _1891 * _2069;
    float _2077 = _1901 * _2069;
    float _2079 = _1891 * _2073;
    float _2081 = fma(_1897, _2075, _1885);
    float _2083 = fma(_1899, _2075, _1887);
    float _2085 = fma(_1891, _2077, _1889);
    out.m_83.x = _2081;
    out.m_83.y = _2083;
    out.m_83.z = _2085;
    out.m_83.w = _2079;
    bool _2087 = !_1917;
    float _2089 = _2063;
    float _2091 = _2063;
    if (!_2087)
    {
        bool _2093 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2095 = isnan(_1562);
        bool _2097 = _2093 || _2095;
        bool _2099 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2101 = _2097 || _2099;
        if (!_2101)
        {
            float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2105 = _1562 + _2103;
            float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2109 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2107;
            float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2115 = 1.0 / _2109;
            float _2117 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2119 = _2117 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2123 = _2121 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2125 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2127 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2131 = _2129 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2133 = _2105 * _2115;
            float _2135 = precise::clamp(_2133, 0.0, 1.0);
            float _2137 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2139 = _2137 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2141 = fma(_2135, _2113, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2143 = fma(_2135, _2139, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2145 = fma(_2135, _2119, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2147 = fma(_2135, _2123, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2149 = fma(_2135, _2127, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2151 = fma(_2135, _2131, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2061 = _2145;
            _2037 = _2149;
            _2043 = _2141;
            _1957 = _2147;
            _1951 = _2143;
            _2091 = _2151;
            _2153 = true;
        }
        else
        {
            bool _2155 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2157 = isnan(_1562);
            bool _2159 = _2155 || _2157;
            bool _2161 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2163 = _2159 || _2161;
            if (!_2163)
            {
                _2041 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2165 = _2041;
            _2043 = _2165;
            if (!_2163)
            {
                _2059 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2167 = _2059;
            _2061 = _2167;
            if (!_2163)
            {
                _1949 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2169 = _1949;
            _1951 = _2169;
            if (!_2163)
            {
                _1955 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2171 = _1955;
            _1957 = _2171;
            if (!_2163)
            {
                _2035 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2173 = _2035;
            _2037 = _2173;
            if (!_2163)
            {
                _2089 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2175 = _2089;
            bool _2177 = !_2163;
            _2091 = _2175;
            if (!_2177)
            {
                bool _2179 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2181 = isnan(_1562);
                bool _2183 = _2179 || _2181;
                bool _2185 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2187 = _2183 || _2185;
                if (!_2187)
                {
                    float _2189 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2191 = _1562 + _2189;
                    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2195 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2193;
                    float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2199 = _2197 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2201 = 1.0 / _2195;
                    float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2207 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2209 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2211 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2213 = _2211 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2215 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2217 = _2215 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2219 = _2191 * _2201;
                    float _2221 = precise::clamp(_2219, 0.0, 1.0);
                    float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2225 = _2223 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2227 = fma(_2221, _2199, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2229 = fma(_2221, _2225, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2231 = fma(_2221, _2205, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2233 = fma(_2221, _2209, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2235 = fma(_2221, _2213, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2237 = fma(_2221, _2217, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2061 = _2231;
                    _2037 = _2235;
                    _2043 = _2227;
                    _1957 = _2233;
                    _1951 = _2229;
                    _2091 = _2237;
                    _2153 = true;
                }
                else
                {
                    _2061 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2037 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2043 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1957 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1951 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2091 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2153 = false;
    float _2239 = _2061;
    float _2241 = _2037;
    float _2243 = _2043;
    float _2245 = _1957;
    float _2247 = _1951;
    float _2249 = _2091;
    float _2251 = fma(_1418, -0.5, 0.5);
    float _2253 = precise::clamp(_2251, 0.0, 1.0);
    float _2255 = -_2239;
    float _2257 = _2255 + _2241;
    float _2259 = -_2243;
    float _2261 = _2259 + _2245;
    float _2263 = -_2247;
    float _2265 = _2263 + _2249;
    bool _2267 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2269 = fma(_2253, _2257, _2239);
    float _2271 = fma(_2253, _2261, _2243);
    float _2273 = fma(_2253, _2265, _2247);
    float _2275 = _2269 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _2277 = fma(_2271, 0.298911988735198974609375, _2275);
    float _2279 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2281 = fma(_2273, 0.114477999508380889892578125, _2277);
    out.m_51.x = _2279;
    float _2283 = -_2281;
    float _2285 = _2271 + _2283;
    float _2287 = -_2281;
    float _2289 = _2269 + _2287;
    float _2291 = -_2281;
    float _2293 = _2273 + _2291;
    float _2295 = fma(_2285, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2281);
    float _2297 = fma(_2289, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2281);
    float _2299 = fma(_2293, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2281);
    out.m_87.x = _2295;
    out.m_87.y = _2297;
    out.m_87.z = _2299;
    if (!_2267)
    {
        return out;
    }
    float _2301 = -_1530;
    float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2305 = -_1534;
    float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2309 = -_1538;
    float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2313 = _2303 * _2303;
    float _2315 = fma(_2307, _2307, _2313);
    float _2317 = fma(_2311, _2311, _2315);
    float _2319 = sqrt(_2317);
    float _2321 = rsqrt(_2317);
    float _2323 = -_2319;
    float _2325 = _2323 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2327 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2329 = precise::clamp(_2327, 0.0, 1.0);
    float _2331 = _2307 * _2321;
    float _2333 = _2303 * _2321;
    float _2335 = abs(_2329);
    float _2337 = log2(_2335);
    float _2339 = _2311 * _2321;
    float _2341 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2343 = _1418 * _2333;
    float _2345 = -_2333;
    float _2347 = -_2341;
    float _2349 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2347);
    float _2351 = fma(_1396, _2331, _2343);
    float _2353 = -_2339;
    float _2355 = fma(_2353, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2349);
    float _2357 = fma(_1420, _2339, _2351);
    float _2359 = precise::clamp(_2357, 0.0, 1.0);
    float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2363 = _2355 + _2361;
    float _2365 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2367 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2369 = precise::clamp(_2367, 0.0, 1.0);
    float _2371 = exp2(_2365);
    float _2373 = _2371 * _2369;
    float _2375 = _2359 * _2373;
    float _2377 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2379 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2381 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2377;
    out.m_85.y = _2379;
    out.m_85.z = _2381;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2153 = false;
    bool _1474 = false;
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
        float _2438 = as_type<float>(_122);
        out.gl_Position.z = _2438;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2507 = as_type<float>(_160);
        out.gl_Position.z = _2507;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _374 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _376 = isnan(1.0);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _382 = _378 || _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _386 = 1.0 + _384;
    bool _388 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _396 = _392 || _394;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _400 = 1.0 / _386;
    float _402 = _372 * _140;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _406;
    float _410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _412 = _362 * 2.0;
    float _414 = _364 * 2.0;
    float _416 = _366 * 2.0;
    float _418 = _362 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _420 = _364 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _422 = exp2(_402);
    float _424 = _364 + _366;
    float _426 = -_404;
    float _428 = fma(_418, 2.0, _426);
    float _430 = fma(_420, -2.0, _398);
    float _432 = _364 + _362;
    float _434 = -_140;
    float _436 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[76].x, _428);
    float _438 = floor(_412);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _444 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _430);
    float _446 = _432 + (-1.0);
    float _448 = _424 + (-1.0);
    float _450 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[78].z, _442);
    float _452 = floor(_414);
    float _454 = -_422;
    float _456 = _454 + 1.0;
    float _458 = _410 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _460 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _450);
    float _462 = floor(_416);
    bool _464 = _438 > 0.0;
    bool _466 = _438 >= 0.0;
    bool _468 = isnan(_438);
    bool _470 = _466 || _468;
    bool _472 = isnan(0.0);
    bool _474 = _470 || _472;
    float _476 = _396 ? _456 : 0.0;
    bool _478 = _452 > 0.0;
    bool _480 = _452 >= 0.0;
    bool _482 = isnan(_452);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _492 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[79].z, _440);
    int _494 = _474 ? 0 : 1;
    float _496 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[78].w, _490);
    bool _498 = _462 > 0.0;
    float _500 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[79].x, _492);
    bool _502 = _462 >= 0.0;
    bool _504 = isnan(_462);
    bool _506 = _502 || _504;
    bool _508 = isnan(0.0);
    bool _510 = _506 || _508;
    float _512 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _496);
    if (_382)
    {
        float _514 = _476 * _400;
        _144 = _514;
    }
    float _516 = _144;
    float _518 = in.m_57.x;
    float _520 = in.m_57.y;
    float _522 = in.m_57.z;
    float _524 = _500 * (-0.15915493667125701904296875);
    int _526 = _510 ? 0 : 1;
    int _528 = _488 ? 0 : 1;
    float _530 = _524 * 6.283185482025146484375;
    float _532 = sin(_530);
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _544 = _542 != 0;
    int _546 = ~_526;
    int _548 = _546 + 1;
    int _550 = _548 + 1;
    int _552 = ~_494;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    int _558 = ~_528;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    int _564 = _550;
    int _566 = _556;
    int _568 = _562;
    bool _570 = _544;
    if (!_498)
    {
        int _572 = ~_526;
        int _574 = _572 + 1;
        _564 = _574;
    }
    int _576 = _564;
    if (!_464)
    {
        int _578 = ~_494;
        int _580 = _578 + 1;
        _566 = _580;
    }
    int _582 = _566;
    if (!_478)
    {
        int _584 = ~_528;
        int _586 = _584 + 1;
        _568 = _586;
    }
    int _588 = _568;
    float _590 = in.m_48.x;
    float _592 = in.m_48.y;
    float _594 = in.m_48.z;
    bool _596 = !_536;
    int _598 = _596 ? 0 : 1;
    float _600 = _326 * _518;
    bool _602 = _368 > 0.5;
    float _604 = _328 * _520;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _608 = _606 != 0;
    float _610 = _362 + _366;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _618 = _616 != 0;
    float _620 = _610 + (-1.0);
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _624 = _622 != 0;
    float _626 = _330 * _522;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _632 = _362 + (-0.5);
    float _634 = _366 + (-0.5);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _640 = 1.0 / _630;
    bool _642 = !_540;
    int _644 = _642 ? 0 : 1;
    float _646 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _648 = _364 > 0.5;
    float _650 = _592 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _652 = _592 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _654 = float(_582);
    float _656 = 1.0 / _638;
    float _658 = _364 + (-0.5);
    float _660 = _592 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _670 = fma(_590, (*spvDescriptorSet0.vp_c10)._m0[5].x, _650);
    float _672 = fma(_590, (*spvDescriptorSet0.vp_c10)._m0[4].x, _660);
    float _674 = fma(_590, (*spvDescriptorSet0.vp_c10)._m0[6].x, _652);
    float _676 = in.m_59.x;
    float _678 = in.m_59.y;
    float _680 = in.m_59.z;
    float _682 = 1.0 / _668;
    float _684 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[5].z, _670);
    float _686 = _408 * _640;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _688;
    float _692 = float(_588);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _698 = 1.0 / _664;
    int _700 = abs(_598);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _706 = float(_576);
    float _708 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _710 = _696 * _656;
    float _712 = in.m_61.x;
    float _714 = _690 * _682;
    float _716 = float(_700);
    float _718 = _716 * _706;
    float _720 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[4].z, _672);
    float _722 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _724 = abs(_644);
    float _726 = _718 * (-2.0);
    float _728 = _684 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _730 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[6].z, _674);
    float _732 = _720 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _734 = fma(_722, _726, _722);
    float _736 = fma(_726, _676, _676);
    float _738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _740 = _728 + _738;
    float _742 = _730 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _746 = _732 + _744;
    float _748 = float(_724);
    float _750 = _740 * _740;
    float _752 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[196].x, _736);
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _756 = _742 + _754;
    bool _758 = !_544;
    int _760 = _758 ? 0 : 1;
    float _762 = fma(_746, _746, _750);
    float _764 = _748 * _654;
    float _766 = fma(_734, _516, _752);
    int _768 = abs(_760);
    float _770 = fma(_756, _756, _762);
    float _772 = _764 * (-2.0);
    float _774 = _750;
    bool _776 = _602;
    if (_608)
    {
        float _778 = in.m_55.x;
        _774 = _778;
    }
    float _780 = _774;
    float _782 = float(_768);
    float _784 = fma(_772, _678, _678);
    float _786 = rsqrt(_770);
    float _788 = fma(_708, _772, _708);
    float _790 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _792 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].y, _784);
    float _794 = _782 * _692;
    float _796 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _798 = in.m_61.y;
    float _800 = fma(_788, _516, _792);
    float _802 = _794 * (-2.0);
    float _804 = _796 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _806 = _600;
    if (_614)
    {
        float _808 = in.m_55.z;
        _806 = _808;
    }
    float _810 = _806;
    float _812 = _800 * 0.15915493667125701904296875;
    float _814 = fma(_802, _680, _680);
    float _816 = fma(_790, _802, _790);
    float _818 = _766 * 0.15915493667125701904296875;
    float _820 = _812 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = _804 * _786;
    float _826 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[196].z, _814);
    float _828 = _704 * _698;
    float _830 = _740 * _824;
    float _832 = _746 * _824;
    float _834 = fma(_816, _516, _826);
    float _836 = _756 * _824;
    float _838 = -_830;
    float _840 = _740 + _838;
    float _842 = -_832;
    float _844 = _746 + _842;
    float _846 = _834 * 0.15915493667125701904296875;
    float _848 = -_836;
    float _850 = _756 + _848;
    float _852 = _840 * _840;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _856 = _360 + _854;
    float _858 = _818 * 6.283185482025146484375;
    float _860 = sin(_858);
    float _862 = _816;
    float _864 = _818;
    if (_608)
    {
        bool _866 = _780 > 0.5;
        _570 = _866;
    }
    bool _868 = _570;
    float _870 = fma(_844, _844, _852);
    float _872 = fma(_686, _856, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _874 = -_798;
    float _876 = _874 + 1.0;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _880 = _360 + _878;
    float _882 = fma(_850, _850, _870);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _886 = _360 + _884;
    float _888 = _818 * 6.283185482025146484375;
    float _890 = cos(_888);
    int _892 = _602 ? as_type<int>(_876) : as_type<int>(_798);
    float _894 = fma(_828, _880, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _896 = fma(_714, _886, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _898 = _798;
    if (_614)
    {
        bool _900 = _810 > 0.5;
        _776 = _900;
    }
    bool _902 = _776;
    float _904 = in.m_63.x;
    float _906 = in.m_63.y;
    float _908 = in.m_63.z;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _912 = _360 + _910;
    if (!_608)
    {
        _862 = _712;
    }
    float _914 = _862;
    float _916 = sqrt(_882);
    float _918 = fma(_710, _912, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _920 = _914;
    int _922 = as_type<int>(_918);
    if (!_608)
    {
        _864 = _914;
    }
    float _924 = _864;
    float _926 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _928 = _924;
    if (_608)
    {
        _920 = _712;
    }
    float _930 = _920;
    float _932 = _860 * _822;
    float _934 = _618 ? as_type<float>(_892) : _798;
    float _936 = _812 * 6.283185482025146484375;
    float _938 = cos(_936);
    float _940 = _930;
    if (_624)
    {
        float _942 = _648 ? _876 : _798;
        _898 = _942;
    }
    float _944 = _898;
    float _946 = _890 * _822;
    int _948 = 0;
    if (_608)
    {
        float _950 = -_930;
        float _952 = _950 + 1.0;
        _948 = as_type<int>(_952);
    }
    int _954 = _948;
    float _956 = fma(_458, _944, -0.5);
    float _958 = _846 * 6.283185482025146484375;
    float _960 = cos(_958);
    float _962 = _786 * _916;
    if (_608)
    {
        float _964 = _868 ? as_type<float>(_954) : _930;
        _928 = _964;
    }
    float _966 = _928;
    float _968 = _926 * _962;
    float _970 = _796 * _962;
    float _972 = _646 * _962;
    float _974 = _846 * 6.283185482025146484375;
    float _976 = sin(_974);
    float _978 = _890 * _938;
    float _980 = _860 * _938;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _904);
    float _984 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _908);
    bool _986 = _906 != 0.0;
    bool _988 = isnan(_906);
    bool _990 = _986 || _988;
    bool _992 = isnan(0.0);
    bool _994 = _990 || _992;
    float _996 = _970 * _982;
    float _998 = _860 * _960;
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _906);
    float _1002 = _938 * _960;
    float _1004 = _890 * _960;
    float _1006 = _822 * _960;
    float _1008 = _968 * _1000;
    float _1010 = _972 * _984;
    bool _1012 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1014 = isnan(_360);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = fma(_976, _978, _932);
    float _1026 = fma(_976, _932, _978);
    float _1028 = -_946;
    float _1030 = fma(_976, _980, _1028);
    float _1032 = -_980;
    float _1034 = fma(_976, _946, _1032);
    bool _1036 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1038 = isnan(_360);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1044 = _1040 || _1042;
    float _1046 = float(_1044);
    float _1048 = -_1008;
    float _1050 = _976 * _1048;
    float _1052 = _1004 * _1008;
    float _1054 = _998 * _1008;
    bool _1056 = _904 == 0.0;
    bool _1058 = !_994;
    bool _1060 = _1056 && _1058;
    float _1062 = -_1046;
    float _1064 = _1062 + 1.0;
    float _1066 = fma(_1002, _996, _1050);
    float _1068 = fma(_1024, _996, _1052);
    bool _1070 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1072 = isnan(_360);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1078 = _1074 || _1076;
    float _1080 = float(_1078);
    float _1082 = _1022 * _1064;
    float _1084 = -_1022;
    float _1086 = _1084 + 1.0;
    float _1088 = fma(_1030, _996, _1054);
    float _1090 = fma(_1034, _1010, _1068);
    float _1092 = -_1080;
    float _1094 = _1092 + 1.0;
    float _1096 = _1080 * _1086;
    float _1098 = fma(_1006, _1010, _1066);
    float _1100 = in.m_65.x;
    float _1102 = in.m_65.y;
    float _1104 = in.m_65.z;
    float _1106 = fma(_1026, _1010, _1088);
    float _1108 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1110 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1112 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1114 = isnan(_360);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1126 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1108);
    float _1128 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1110);
    bool _1130 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1132 = isnan(_360);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1138 = _1134 || _1136;
    float _1140 = float(_1138);
    float _1142 = _1122 * _1094;
    float _1144 = -_1122;
    float _1146 = _1144 + 1.0;
    float _1148 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1126);
    float _1150 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1128);
    bool _1152 = _908 == 0.0;
    bool _1154 = _1152 && _1060;
    float _1156 = _1140 * _1146;
    float _1158 = _732 + _1148;
    float _1160 = _742 + _1150;
    float _1162 = -_1140;
    float _1164 = _1162 + 1.0;
    float _1166 = _872 * _1156;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1170 = _1158 + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1174 = _1160 + _1172;
    float _1176 = _524 * 6.283185482025146484375;
    float _1178 = cos(_1176);
    float _1180 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1166);
    float _1182 = _1170 * _1170;
    float _1184 = _1174 * _1174;
    float _1186 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1188 = _1100;
    float _1190 = _1102;
    float _1192 = _1104;
    float _1194 = _1182;
    float _1196 = _1184;
    float _1198 = _1158;
    float _1200 = _1160;
    if (!_1154)
    {
        float _1202 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1100);
        _1188 = _1202;
    }
    float _1204 = _1188;
    float _1206 = _1204;
    if (!_1154)
    {
        float _1208 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1102);
        _1190 = _1208;
    }
    float _1210 = _1190;
    float _1212 = _1182 + _1184;
    float _1214 = fma(_918, _1142, _1180);
    if (!_1154)
    {
        float _1216 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1104);
        _1192 = _1216;
    }
    float _1218 = _1192;
    if (_614)
    {
        float _1220 = -_930;
        float _1222 = _1220 + 1.0;
        _922 = as_type<int>(_1222);
    }
    int _1224 = _922;
    float _1226 = sqrt(_1212);
    float _1228 = fma(_1186, _966, -0.5);
    float _1230 = _532 * _956;
    float _1232 = fma(_896, _1096, _1214);
    if (_614)
    {
        float _1234 = _902 ? as_type<float>(_1224) : _930;
        _940 = _1234;
    }
    float _1236 = _940;
    float _1238 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1240 = -_1230;
    float _1242 = fma(_1178, _1228, _1240);
    float _1244 = _1178 * _956;
    float _1246 = -_1210;
    float _1248 = _976 * _1246;
    float _1250 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1238);
    float _1252 = fma(_460, _1242, _436);
    float _1254 = _1004 * _1210;
    float _1256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1258 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1250);
    float _1260 = _998 * _1210;
    float _1262 = fma(_532, _1228, _1244);
    bool _1264 = _1226 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = _728 + _1258;
    float _1268 = fma(_894, _1082, _1232);
    float _1270 = fma(_1002, _1204, _1248);
    float _1272 = fma(_1024, _1204, _1254);
    float _1274 = fma(_1030, _1204, _1260);
    float _1276 = -_444;
    float _1278 = fma(_512, _1262, _1276);
    float _1280 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1268);
    if (!_1264)
    {
        _1206 = _1266;
    }
    float _1282 = _1206;
    bool _1284 = !_1264;
    float _1286 = _1282;
    if (!_1284)
    {
        float _1288 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1292 = _1226 + _1290;
        float _1294 = _1266 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1296 = rsqrt(_1212);
        float _1298 = _1292 * _1288;
        float _1300 = _1298 * 0.15915493667125701904296875;
        float _1302 = _1300 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        float _1306 = _1300 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        float _1310 = fma(_1304, _1294, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1312 = _1296 * _1310;
        float _1314 = fma(_1170, _1312, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1316 = _1308 + (-1.0);
        float _1318 = fma(_1174, _1312, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1322 = _1314 + _1320;
        float _1324 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1326 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1328 = _1318 + _1326;
        float _1330 = _1322 * _1322;
        float _1332 = fma(_1266, _1308, _1324);
        float _1334 = _1328 * _1328;
        _1286 = _1332;
        _1194 = _1330;
        _1196 = _1334;
        _1198 = _1314;
        _1200 = _1318;
    }
    float _1336 = _1286;
    float _1338 = _1194;
    float _1340 = _1196;
    float _1342 = _1198;
    float _1344 = _1200;
    float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1350 = _1336 + _1348;
    float _1352 = fma(_1034, _1218, _1272);
    float _1354 = fma(_1006, _1218, _1270);
    float _1356 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1358 = fma(_1350, _1350, _1338);
    float _1360 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1364 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1366 = _1358 + _1340;
    float _1368 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1360);
    float _1370 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1362);
    float _1372 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1364);
    float _1374 = fma(_1026, _1218, _1274);
    float _1376 = _1356 * _1346;
    float _1378 = sqrt(_1366);
    float _1380 = _934 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1394 = _1380 * _1256;
    float _1396 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1368);
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1400 = _1382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1406 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1412 = _1252 + 0.5;
    float _1414 = _1278 + 0.5;
    float _1416 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1418 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1370);
    float _1420 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1372);
    out.m_67.x = _1406;
    out.m_67.y = _1408;
    out.m_67.z = _1410;
    out.m_67.w = _1398;
    bool _1422 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1424 = isnan(_1378);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1430 = _1426 || _1428;
    out.m_69.x = _1412;
    out.m_69.y = _1414;
    out.m_69.z = _1376;
    out.m_69.w = _1394;
    out.m_71.x = _1400;
    out.m_71.y = _1402;
    out.m_71.z = _1404;
    out.m_71.w = _1416;
    out.m_73.x = _1396;
    out.m_73.y = _1418;
    out.m_73.z = _1420;
    float _1432 = _1370;
    float _1434 = _1414;
    float _1436 = _1394;
    float _1438 = _1376;
    if (!_1430)
    {
        _1432 = 1.0;
    }
    float _1440 = _1432;
    bool _1442 = !_1430;
    float _1444 = _1440;
    if (!_1442)
    {
        bool _1446 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1448 = isnan(_1378);
        bool _1450 = _1446 || _1448;
        bool _1452 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1454 = _1450 || _1452;
        if (!_1454)
        {
            float _1456 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1458 = _1378 + _1456;
            float _1460 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1462 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1460;
            float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1466 = _1464 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1468 = 1.0 / _1462;
            float _1470 = _1458 * _1468;
            float _1472 = fma(_1470, _1466, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1444 = _1472;
            _1474 = true;
        }
        else
        {
            bool _1476 = _1378 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1478 = isnan(_1378);
            bool _1480 = _1476 || _1478;
            bool _1482 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1484 = _1480 || _1482;
            if (!_1484)
            {
                float _1486 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1488 = _1378 + _1486;
                float _1490 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1492 = _1490 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1494 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1496 = _1494 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1498 = 1.0 / _1492;
                float _1500 = _1488 * _1498;
                float _1502 = fma(_1500, _1496, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1444 = _1502;
                _1474 = true;
            }
            else
            {
                _1444 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1474 = false;
    float _1504 = _1444;
    float _1506 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1508 = _1336 + _1506;
    float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1512 = _1342 + _1510;
    float _1514 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1516 = _1344 + _1514;
    float _1518 = -_832;
    float _1520 = _732 + _1518;
    float _1522 = fma(_1508, _1504, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1524 = fma(_1512, _1504, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1526 = fma(_1516, _1504, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1528 = -_830;
    float _1530 = _1528 + _1522;
    float _1532 = -_832;
    float _1534 = _1532 + _1524;
    float _1536 = -_836;
    float _1538 = _1536 + _1526;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1542 = _1530 + _1540;
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1546 = _1534 + _1544;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1550 = _1538 + _1548;
    float _1552 = _1542 * _1542;
    float _1554 = fma(_1520, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1556 = fma(_1546, _1546, _1552);
    float _1558 = fma(_1550, _1550, _1556);
    float _1560 = rsqrt(_1558);
    float _1562 = sqrt(_1558);
    float _1564 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1566 = _1546 * _1564;
    float _1568 = _1550 * _1564;
    float _1570 = _1566 * _1566;
    float _1572 = _1568 * _1568;
    float _1574 = _1570 + _1572;
    float _1576 = sqrt(_1574);
    bool _1578 = _1576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = _1576 + _1580;
    float _1584 = _1410;
    float _1586 = _1582;
    float _1588 = _1550;
    float _1590 = _1542;
    float _1592 = _1546;
    if (_1578)
    {
        float _1594 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1584 = _1594;
    }
    float _1596 = _1584;
    if (_1578)
    {
        float _1598 = rsqrt(_1574);
        _1434 = _1598;
    }
    float _1600 = _1434;
    float _1602 = _1600;
    if (_1578)
    {
        float _1604 = _1582 * _1596;
        _1586 = _1604;
    }
    float _1606 = _1586;
    if (_1578)
    {
        float _1608 = _1606 * 0.15915493667125701904296875;
        _1436 = _1608;
    }
    float _1610 = _1436;
    float _1612 = _1412;
    float _1614 = _1610;
    if (_1578)
    {
        float _1616 = _1610 * 6.283185482025146484375;
        float _1618 = sin(_1616);
        _1612 = _1618;
    }
    float _1620 = _1612;
    float _1622 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1624 = precise::max(0.0, _1622);
    float _1626 = _1398;
    float _1628 = _1622;
    float _1630 = _1624;
    if (_1578)
    {
        float _1632 = _1610 * 6.283185482025146484375;
        float _1634 = cos(_1632);
        _1626 = _1634;
    }
    float _1636 = _1626;
    float _1638 = -_1564;
    float _1640 = -_1624;
    float _1642 = fma(_1542, _1638, _1640);
    if (_1578)
    {
        float _1644 = _1642 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1628 = _1644;
    }
    float _1646 = _1628;
    float _1648 = _1620;
    float _1650 = _1646;
    if (_1578)
    {
        float _1652 = fma(_1620, _1646, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1438 = _1652;
    }
    float _1654 = _1438;
    float _1656 = _1654;
    if (!_1578)
    {
        _1648 = _1642;
    }
    float _1658 = _1648;
    float _1660 = _1658;
    if (!_1578)
    {
        _1650 = _1570;
    }
    float _1662 = _1650;
    float _1664 = _1636;
    float _1666 = _1662;
    if (_1578)
    {
        float _1668 = _1636 + (-1.0);
        _1630 = _1668;
    }
    float _1670 = _1630;
    float _1672 = _1670;
    if (_1578)
    {
        float _1674 = _1600 * _1654;
        _1614 = _1674;
    }
    float _1676 = _1614;
    if (!_1578)
    {
        _1602 = _1566;
    }
    float _1678 = _1602;
    float _1680 = _1678;
    if (_1578)
    {
        float _1682 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1682;
    }
    float _1684 = _1672;
    if (_1578)
    {
        float _1686 = _1566 * _1676;
        _1680 = _1686;
    }
    float _1688 = _1680;
    if (!_1578)
    {
        _1656 = _1572;
    }
    float _1690 = _1656;
    float _1692 = _1690;
    if (_1578)
    {
        float _1694 = fma(_1642, _1636, _1684);
        _1660 = _1694;
    }
    float _1696 = _1660;
    if (!_1578)
    {
        _1664 = _1568;
    }
    float _1698 = _1664;
    float _1700 = _1698;
    if (_1578)
    {
        float _1702 = _1568 * _1676;
        _1700 = _1702;
    }
    float _1704 = _1700;
    if (_1578)
    {
        float _1706 = _1688 * _1688;
        _1666 = _1706;
    }
    float _1708 = _1666;
    float _1710 = floor(_1554);
    if (_1578)
    {
        float _1712 = _1704 * _1704;
        _1692 = _1712;
    }
    float _1714 = _1692;
    float _1716 = fma(_1696, _1696, _1708);
    float _1718 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1720 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1722 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1720);
    float _1724 = precise::clamp(_1722, 0.0, 1.0);
    float _1726 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1728 = _1716 + _1714;
    float _1730 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1718);
    float _1732 = -_1724;
    float _1734 = _1732 + 1.0;
    float _1736 = -_836;
    float _1738 = _742 + _1736;
    float _1740 = rsqrt(_1728);
    float _1742 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1730);
    float _1744 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1726);
    float _1746 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1748 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1750 = abs(_1734);
    float _1752 = log2(_1750);
    float _1754 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1756 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1758 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1760 = -_1754;
    float _1762 = fma(_1760, _1748, 1.0);
    float _1764 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1766 = _1740 * _1688;
    float _1768 = _1740 * _1704;
    float _1770 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1764);
    float _1772 = _1740 * _1696;
    float _1774 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1756);
    float _1776 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1778 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1770);
    float _1780 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1744);
    float _1782 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1774);
    float _1784 = -_1776;
    float _1786 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1784);
    float _1788 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1790 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1792 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1794 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1796 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1798 = -_1768;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1786);
    float _1802 = floor(_1758);
    float _1804 = -_1710;
    float _1806 = _1554 + _1804;
    float _1808 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1796);
    float _1810 = fma(_1800, -0.5, 0.5);
    float _1812 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1814 = fma(_1800, 0.5, 0.5);
    float _1816 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1808);
    float _1818 = exp2(_1790);
    float _1820 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1812);
    float _1822 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1816);
    float _1824 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1826 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1820);
    float _1828 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1824);
    float _1830 = log2(_1762);
    float _1832 = fma(_1814, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1834 = -_1802;
    float _1836 = _1758 + _1834;
    float _1838 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1828);
    float _1840 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1826);
    float _1842 = fma(_1814, _1832, -0.212114393711090087890625);
    float _1844 = 1.0 / _1822;
    float _1846 = sqrt(_1810);
    float _1848 = _1830 * 0.693147182464599609375;
    float2 _5233 = float2(_1806, _1836);
    float _1850 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5233, float2(0.0), isnan(_5233)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5233, float2(0.0), isnan(_5233)), level(0.0)).x;
    float _1852 = fma(_1814, _1842, 1.570728778839111328125);
    float _1854 = _1848 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1856 = _1840 * _1844;
    float _1858 = _1772 + 1.0;
    float _1860 = fma(_1856, 0.5, 0.5);
    float _1862 = -_1772;
    float _1864 = fma(_1818, _1858, _1862);
    float _1866 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1838);
    float _1868 = _1846 * 0.636619746685028076171875;
    float _1870 = _1866 * _1844;
    float _1872 = -_1852;
    float _1874 = fma(_1868, _1872, 1.0);
    float _1876 = fma(_1864, 0.5, 0.5);
    float _1878 = fma(_1870, -0.5, 0.5);
    float3 _5285 = float3(_1860, _1878, _1854);
    float _1880 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5285, float3(0.0), isnan(_5285)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5285, float3(0.0), isnan(_5285)), level(0.0)).x;
    float3 _5296 = float3(_1860, _1878, _1854);
    float4 _1883 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5296, float3(0.0), isnan(_5296)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5296, float3(0.0), isnan(_5296)), level(0.0)).xyzw;
    float _1885 = _1883.x;
    float _1887 = _1883.y;
    float _1889 = _1883.z;
    float _1891 = _1883.w;
    float2 _5312 = float2(_1874, _1876);
    float3 _1895 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5312, float2(0.0), isnan(_5312)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5312, float2(0.0), isnan(_5312)), level(0.0)).xyz;
    float _1897 = _1895.x;
    float _1899 = _1895.y;
    float _1901 = _1895.z;
    float _1903 = -_830;
    float _1905 = _728 + _1903;
    float _1907 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1909 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1911 = isnan(_1562);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1917 = _1913 || _1915;
    float _1919 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1921 = _1905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1923 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1925 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1907);
    float _1927 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1919);
    float _1929 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1921);
    out.m_75.x = _1546;
    out.m_75.y = _1542;
    out.m_75.z = _1550;
    float _1931 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1927);
    float _1933 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1929);
    float _1935 = exp2(_1923);
    float _1937 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1939 = _1933 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1941 = _1939 + _1937;
    float _1943 = 1.0 / _1937;
    float _1945 = _1866;
    if (!_1917)
    {
        _1588 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1947 = _1588;
    float _1949 = _1947;
    float _1951 = _1947;
    if (!_1917)
    {
        _1590 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1953 = _1590;
    float _1955 = _1953;
    float _1957 = _1953;
    if (!_1917)
    {
        _1592 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1959 = _1592;
    float _1961 = -_1935;
    float _1963 = _1961 + 1.0;
    float _1965 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1967 = _1941 * _1943;
    float _1969 = _1967 * 0.5;
    float _1971 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1973 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1971);
    float _1975 = 1.0 / _1973;
    float _1977 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1979 = _1975 * _1977;
    float _1981 = abs(_1979);
    float _1983 = log2(_1981);
    float _1985 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1987 = exp2(_1985);
    float _1989 = fma(_1987, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1991 = precise::clamp(_1989, 0.0, 1.0);
    float _1993 = fma(_1991, -2.0, 3.0);
    float _1995 = _1991 * _1991;
    float _1997 = _1995 * _1993;
    float _1999 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1925);
    float _2001 = in.m_77.x;
    float _2003 = -_1997;
    float _2005 = _2003 + 1.0;
    float _2007 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1999);
    float _2009 = fma(_2005, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1997);
    bool _2011 = _1979 <= 8000.0;
    bool _2013 = isnan(_1979);
    bool _2015 = _2011 || _2013;
    bool _2017 = isnan(8000.0);
    bool _2019 = _2015 || _2017;
    float _2021 = float(_2019);
    float _2023 = _2007 + _1822;
    float _2025 = _2021 * _2009;
    float _2027 = _2023 * 0.5;
    out.gl_Position.x = _1840;
    out.gl_Position.y = _1866;
    out.gl_Position.z = _2007;
    out.gl_Position.w = _1822;
    float _2029 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _2027;
    out.m_79.w = _1822;
    float _2031 = _1840;
    float _2033 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2035 = _1959;
    float _2037 = _1959;
    if (!_1917)
    {
        _2031 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2039 = _2031;
    float _2041 = _2039;
    float _2043 = _2039;
    if (!_1917)
    {
        _1945 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2045 = _1945;
    float _2047 = -_1850;
    float _2049 = _2047 + 1.0;
    float _2051 = _2049 * _2029;
    float _2053 = precise::clamp(_2051, 0.0, 1.0);
    float _2055 = -_2053;
    float _2057 = fma(_2055, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2059 = _2045;
    float _2061 = _2045;
    if (!_1917)
    {
        _2033 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2063 = _2033;
    float _2065 = _2057 * _2001;
    float _2067 = _2065 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_81.x = _2067;
    float _2069 = _1965 * _1880;
    float _2071 = -_1965;
    float _2073 = _2071 + 1.0;
    float _2075 = _1891 * _2069;
    float _2077 = _1901 * _2069;
    float _2079 = _1891 * _2073;
    float _2081 = fma(_1897, _2075, _1885);
    float _2083 = fma(_1899, _2075, _1887);
    float _2085 = fma(_1891, _2077, _1889);
    out.m_83.x = _2081;
    out.m_83.y = _2083;
    out.m_83.z = _2085;
    out.m_83.w = _2079;
    bool _2087 = !_1917;
    float _2089 = _2063;
    float _2091 = _2063;
    if (!_2087)
    {
        bool _2093 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2095 = isnan(_1562);
        bool _2097 = _2093 || _2095;
        bool _2099 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2101 = _2097 || _2099;
        if (!_2101)
        {
            float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2105 = _1562 + _2103;
            float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2109 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2107;
            float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2115 = 1.0 / _2109;
            float _2117 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2119 = _2117 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2123 = _2121 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2125 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2127 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2131 = _2129 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2133 = _2105 * _2115;
            float _2135 = precise::clamp(_2133, 0.0, 1.0);
            float _2137 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2139 = _2137 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2141 = fma(_2135, _2113, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2143 = fma(_2135, _2139, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2145 = fma(_2135, _2119, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2147 = fma(_2135, _2123, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2149 = fma(_2135, _2127, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2151 = fma(_2135, _2131, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2061 = _2145;
            _2037 = _2149;
            _2043 = _2141;
            _1957 = _2147;
            _1951 = _2143;
            _2091 = _2151;
            _2153 = true;
        }
        else
        {
            bool _2155 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2157 = isnan(_1562);
            bool _2159 = _2155 || _2157;
            bool _2161 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2163 = _2159 || _2161;
            if (!_2163)
            {
                _2041 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2165 = _2041;
            _2043 = _2165;
            if (!_2163)
            {
                _2059 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2167 = _2059;
            _2061 = _2167;
            if (!_2163)
            {
                _1949 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2169 = _1949;
            _1951 = _2169;
            if (!_2163)
            {
                _1955 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2171 = _1955;
            _1957 = _2171;
            if (!_2163)
            {
                _2035 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2173 = _2035;
            _2037 = _2173;
            if (!_2163)
            {
                _2089 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2175 = _2089;
            bool _2177 = !_2163;
            _2091 = _2175;
            if (!_2177)
            {
                bool _2179 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2181 = isnan(_1562);
                bool _2183 = _2179 || _2181;
                bool _2185 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2187 = _2183 || _2185;
                if (!_2187)
                {
                    float _2189 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2191 = _1562 + _2189;
                    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2195 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2193;
                    float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2199 = _2197 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2201 = 1.0 / _2195;
                    float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2207 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2209 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2211 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2213 = _2211 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2215 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2217 = _2215 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2219 = _2191 * _2201;
                    float _2221 = precise::clamp(_2219, 0.0, 1.0);
                    float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2225 = _2223 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2227 = fma(_2221, _2199, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2229 = fma(_2221, _2225, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2231 = fma(_2221, _2205, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2233 = fma(_2221, _2209, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2235 = fma(_2221, _2213, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2237 = fma(_2221, _2217, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2061 = _2231;
                    _2037 = _2235;
                    _2043 = _2227;
                    _1957 = _2233;
                    _1951 = _2229;
                    _2091 = _2237;
                    _2153 = true;
                }
                else
                {
                    _2061 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2037 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2043 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1957 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1951 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2091 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2153 = false;
    float _2239 = _2061;
    float _2241 = _2037;
    float _2243 = _2043;
    float _2245 = _1957;
    float _2247 = _1951;
    float _2249 = _2091;
    float _2251 = fma(_1418, -0.5, 0.5);
    float _2253 = precise::clamp(_2251, 0.0, 1.0);
    float _2255 = -_2239;
    float _2257 = _2255 + _2241;
    float _2259 = -_2243;
    float _2261 = _2259 + _2245;
    float _2263 = -_2247;
    float _2265 = _2263 + _2249;
    bool _2267 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2269 = fma(_2253, _2257, _2239);
    float _2271 = fma(_2253, _2261, _2243);
    float _2273 = fma(_2253, _2265, _2247);
    float _2275 = _2269 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _2277 = fma(_2271, 0.298911988735198974609375, _2275);
    float _2279 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2281 = fma(_2273, 0.114477999508380889892578125, _2277);
    out.m_51.x = _2279;
    float _2283 = -_2281;
    float _2285 = _2271 + _2283;
    float _2287 = -_2281;
    float _2289 = _2269 + _2287;
    float _2291 = -_2281;
    float _2293 = _2273 + _2291;
    float _2295 = fma(_2285, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2281);
    float _2297 = fma(_2289, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2281);
    float _2299 = fma(_2293, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2281);
    out.m_87.x = _2295;
    out.m_87.y = _2297;
    out.m_87.z = _2299;
    if (!_2267)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2301 = -_1530;
    float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2305 = -_1534;
    float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2309 = -_1538;
    float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2313 = _2303 * _2303;
    float _2315 = fma(_2307, _2307, _2313);
    float _2317 = fma(_2311, _2311, _2315);
    float _2319 = sqrt(_2317);
    float _2321 = rsqrt(_2317);
    float _2323 = -_2319;
    float _2325 = _2323 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2327 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2329 = precise::clamp(_2327, 0.0, 1.0);
    float _2331 = _2307 * _2321;
    float _2333 = _2303 * _2321;
    float _2335 = abs(_2329);
    float _2337 = log2(_2335);
    float _2339 = _2311 * _2321;
    float _2341 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2343 = _1418 * _2333;
    float _2345 = -_2333;
    float _2347 = -_2341;
    float _2349 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2347);
    float _2351 = fma(_1396, _2331, _2343);
    float _2353 = -_2339;
    float _2355 = fma(_2353, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2349);
    float _2357 = fma(_1420, _2339, _2351);
    float _2359 = precise::clamp(_2357, 0.0, 1.0);
    float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2363 = _2355 + _2361;
    float _2365 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2367 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2369 = precise::clamp(_2367, 0.0, 1.0);
    float _2371 = exp2(_2365);
    float _2373 = _2371 * _2369;
    float _2375 = _2359 * _2373;
    float _2377 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2379 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2381 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2377;
    out.m_85.y = _2379;
    out.m_85.z = _2381;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

