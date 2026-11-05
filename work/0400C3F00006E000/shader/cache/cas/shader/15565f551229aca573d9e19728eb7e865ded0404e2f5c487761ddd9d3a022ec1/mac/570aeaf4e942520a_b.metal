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
    bool _2169 = false;
    bool _1490 = false;
    bool _406 = false;
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
        float _2454 = as_type<float>(_122);
        out.gl_Position.z = _2454;
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
        float _2523 = as_type<float>(_160);
        out.gl_Position.z = _2523;
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
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _192 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _200 = _192 + _198;
    bool _202 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _204 = isnan(_192);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _192 + _226;
    float _230 = 1.0 / _224;
    bool _232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _234 = 1.0 / _220;
    bool _236 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _238 = isnan(_192);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = 1.0 / _216;
    float _250 = _200 * _230;
    float _252 = -_212;
    float _254 = _252 + 1.0;
    bool _256 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _258 = isnan(_192);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = _246 * _254;
    float _270 = -_246;
    float _272 = _270 + 1.0;
    float _274 = _196 * _234;
    bool _276 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _278 = isnan(_192);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _296 = -_286;
    float _298 = _296 + 1.0;
    float _300 = fma(_294, _274, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _302 = _228 * _248;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    float _312 = _266 * _298;
    float _314 = fma(_290, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _316 = fma(_306, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _318 = fma(_310, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _320 = _286 * _272;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _326 = _316 * _312;
    float _328 = _318 * _312;
    float _330 = _314 * _312;
    float _332 = -_266;
    float _334 = _332 + 1.0;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _340 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].y, _328);
    float _342 = fma(_324, _274, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _344 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].x, _326);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _350;
    float _354 = fma(_338, _274, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _356 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].z, _330);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _358;
    float _362 = fma(_300, _320, _344);
    float _364 = fma(_348, _250, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _366 = fma(_352, _250, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _368 = fma(_342, _320, _340);
    float _370 = fma(_360, _250, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _372 = fma(_354, _320, _356);
    float _374 = fma(_364, _268, _362);
    float _376 = fma(_366, _268, _368);
    float _378 = fma(_370, _268, _372);
    float _380 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[146].x, _374);
    float _382 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[146].y, _376);
    float _384 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[146].z, _378);
    bool _386 = !_232;
    float _404;
    if (!_386)
    {
        float _388 = in.m_55.x;
        float _390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _392 = _388 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _394 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _396 = _394 * _390;
        float _398 = floor(_396);
        float _400 = -_398;
        float _402 = _396 + _400;
        _404 = _402;
        _406 = true;
    }
    else
    {
        float _408 = float(_106);
        float _410 = 1.0 / _408;
        float _412 = _140 * _410;
        _404 = _412;
    }
    _406 = false;
    float _414 = _404;
    float _416 = in.m_55.x;
    float _418 = in.m_55.y;
    float _420 = in.m_55.z;
    float _422 = in.m_55.w;
    float _424 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _426 = log2(_424);
    float _428 = in.m_57.x;
    bool _430 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _432 = isnan(0.0);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _438 = _434 || _436;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _444 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _446 = isnan(1.0);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _452 = _448 || _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _456 = 1.0 + _454;
    float _458 = _426 * _140;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _462 = 1.0 / _456;
    bool _464 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _466 = isnan(_414);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _416 * 2.0;
    float _478 = _418 * 2.0;
    float _480 = _420 * 2.0;
    float _482 = exp2(_458);
    float _484 = _416 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _486 = _418 + _420;
    float _488 = _442 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _490 = -_460;
    float _492 = fma(_484, 2.0, _490);
    float _494 = _486 + (-1.0);
    float _496 = floor(_476);
    float _498 = -_140;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[76].x, _492);
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _504 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _506 = floor(_478);
    float _508 = -_482;
    float _510 = _508 + 1.0;
    float _512 = floor(_480);
    bool _514 = _496 > 0.0;
    bool _516 = _496 >= 0.0;
    bool _518 = isnan(_496);
    bool _520 = _516 || _518;
    bool _522 = isnan(0.0);
    bool _524 = _520 || _522;
    float _526 = _438 ? _510 : 0.0;
    bool _528 = _506 > 0.0;
    float _530 = _418 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _532 = _506 >= 0.0;
    bool _534 = isnan(_506);
    bool _536 = _532 || _534;
    bool _538 = isnan(0.0);
    bool _540 = _536 || _538;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _544 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[79].z, _502);
    float _546 = fma(_530, -2.0, _440);
    float _548 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[78].w, _542);
    bool _550 = _512 > 0.0;
    float _552 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[79].x, _544);
    bool _554 = _512 >= 0.0;
    bool _556 = isnan(_512);
    bool _558 = _554 || _556;
    bool _560 = isnan(0.0);
    bool _562 = _558 || _560;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _566 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _546);
    float _568 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _548);
    float _570 = in.m_48.x;
    float _572 = in.m_48.y;
    float _574 = in.m_48.z;
    float _576 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[78].z, _564);
    int _578 = _562 ? 0 : 1;
    float _580 = _552 * (-0.15915493667125701904296875);
    float _582 = in.m_59.x;
    float _584 = in.m_59.y;
    float _586 = in.m_59.z;
    float _588 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _576);
    if (_452)
    {
        float _590 = _526 * _462;
        _144 = _590;
    }
    float _592 = _144;
    int _594 = _524 ? 0 : 1;
    float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _600 = _598 != 0;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _604 = _602 != 0;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _608 = _606 != 0;
    int _610 = _540 ? 0 : 1;
    int _612 = ~_578;
    int _614 = _612 + 1;
    int _616 = _614 + 1;
    int _618 = ~_594;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = _580 * 6.283185482025146484375;
    float _626 = sin(_624);
    int _628 = ~_610;
    int _630 = _628 + 1;
    int _632 = _630 + 1;
    int _634 = _616;
    int _636 = _622;
    int _638 = _632;
    bool _640 = _608;
    if (!_550)
    {
        int _642 = ~_578;
        int _644 = _642 + 1;
        _634 = _644;
    }
    int _646 = _634;
    if (!_514)
    {
        int _648 = ~_594;
        int _650 = _648 + 1;
        _636 = _650;
    }
    int _652 = _636;
    if (!_528)
    {
        int _654 = ~_610;
        int _656 = _654 + 1;
        _638 = _656;
    }
    int _658 = _638;
    float _660 = _416 + _420;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _664 = _662 != 0;
    float _666 = _580 * 6.283185482025146484375;
    float _668 = cos(_666);
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _672 = _670 != 0;
    float _674 = _380 * _582;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _678 = _676 != 0;
    float _680 = _418 + (-0.5);
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _684 = _682 != 0;
    float _686 = _418 + _416;
    bool _688 = !_604;
    int _690 = _688 ? 0 : 1;
    float _692 = _384 * _586;
    bool _694 = _418 > 0.5;
    float _696 = _572 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _698 = !_600;
    int _700 = _698 ? 0 : 1;
    float _702 = _382 * _584;
    bool _704 = _422 > 0.5;
    float _706 = _572 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _708 = _572 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _710 = _420 + (-0.5);
    float _712 = _416 + (-0.5);
    float _714 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[4].x, _696);
    float _716 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[5].x, _706);
    float _718 = in.m_61.x;
    float _720 = in.m_61.y;
    float _722 = in.m_61.z;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _728 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[6].x, _708);
    int _730 = abs(_700);
    float _732 = _686 + (-1.0);
    float _734 = 1.0 / _726;
    float _736 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[4].z, _714);
    int _738 = abs(_690);
    float _740 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _742 = _660 + (-1.0);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _744;
    float _748 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _750 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _752 = float(_730);
    float _754 = float(_646);
    float _756 = _752 * _754;
    float _758 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[5].z, _716);
    float _760 = float(_738);
    float _762 = _746 * _734;
    float _764 = _756 * (-2.0);
    float _766 = float(_652);
    float _768 = _758 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _770 = fma(_740, _764, _740);
    float _772 = fma(_764, _718, _718);
    float _774 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[6].z, _728);
    float _776 = _760 * _766;
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _780 = _768 + _778;
    float _782 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[196].x, _772);
    float _784 = _736 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _790 = _774 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _794 = _784 + _792;
    float _796 = _780 * _780;
    float _798 = 1.0 / _788;
    float _800 = _776 * (-2.0);
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _804 = _790 + _802;
    float _806 = fma(_794, _794, _796);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _812 = fma(_800, _720, _720);
    float _814 = fma(_504, _800, _504);
    float _816 = fma(_804, _804, _806);
    float _818 = 1.0 / _810;
    bool _820 = !_608;
    int _822 = _820 ? 0 : 1;
    float _824 = _796;
    bool _826 = _704;
    float _828 = _818;
    if (_664)
    {
        float _830 = in.m_55.x;
        _824 = _830;
    }
    float _832 = _824;
    float _834 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].y, _812);
    float _836 = fma(_770, _592, _782);
    int _838 = abs(_822);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _844 = fma(_814, _592, _834);
    float _846 = rsqrt(_816);
    float _848 = float(_838);
    float _850 = in.m_57.y;
    float _852 = float(_658);
    float _854 = _836 * 0.15915493667125701904296875;
    float _856 = _844 * 0.15915493667125701904296875;
    float _858 = _842 * _798;
    float _860 = _848 * _852;
    float _862 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _864 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _866 = _854 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = _860 * (-2.0);
    float _872 = _798;
    if (_672)
    {
        float _874 = in.m_55.z;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = fma(_870, _722, _722);
    float _880 = fma(_864, _870, _864);
    float _882 = _862 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _884 = _854 * 6.283185482025146484375;
    float _886 = cos(_884);
    float _888 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[196].z, _878);
    if (_664)
    {
        bool _890 = _832 > 0.5;
        _640 = _890;
    }
    bool _892 = _640;
    float _894 = _882 * _846;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _898 = _414 + _896;
    float _900 = fma(_880, _592, _888);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _902;
    float _906 = _780 * _894;
    float _908 = _856 * 6.283185482025146484375;
    float _910 = sin(_908);
    float _912 = _900 * 0.15915493667125701904296875;
    float _914 = _794 * _894;
    float _916 = -_906;
    float _918 = _780 + _916;
    float _920 = _804 * _894;
    float _922 = fma(_762, _898, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _924 = -_914;
    float _926 = _794 + _924;
    float _928 = _918 * _918;
    float _930 = _856 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = -_850;
    float _936 = _934 + 1.0;
    float _938 = _904 * _818;
    float _940 = fma(_926, _926, _928);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _944 = _414 + _942;
    float _946 = in.m_63.x;
    float _948 = in.m_63.y;
    float _950 = in.m_63.z;
    int _952 = _704 ? as_type<int>(_936) : as_type<int>(_850);
    float _954 = _912 * 6.283185482025146484375;
    float _956 = cos(_954);
    float _958 = -_920;
    float _960 = _804 + _958;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _964 = _414 + _962;
    float _966 = _850;
    float _968 = _960;
    if (_672)
    {
        bool _970 = _876 > 0.5;
        _826 = _970;
    }
    bool _972 = _826;
    float _974 = fma(_858, _944, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _976 = fma(_960, _960, _940);
    float _978 = fma(_938, _964, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _980 = _868 * _910;
    float _982 = _912 * 6.283185482025146484375;
    float _984 = sin(_982);
    float _986 = _678 ? as_type<float>(_952) : _850;
    float _988 = _868 * _932;
    float _990 = _886 * _910;
    if (_684)
    {
        float _992 = _694 ? _936 : _850;
        _966 = _992;
    }
    float _994 = _966;
    float _996 = sqrt(_976);
    float _998 = _886 * _932;
    float _1000 = _868 * _956;
    float _1002 = _932 * _956;
    float _1004 = _886 * _956;
    float _1006 = _910 * _956;
    int _1008 = as_type<int>(_950);
    if (!_664)
    {
        _968 = _428;
    }
    float _1010 = _968;
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _948);
    float _1014 = fma(_984, _998, _980);
    float _1016 = fma(_984, _980, _998);
    float _1018 = _1010;
    if (!_664)
    {
        _828 = _1010;
    }
    float _1020 = _828;
    float _1022 = fma(_488, _994, -0.5);
    float _1024 = _1020;
    if (_664)
    {
        _1018 = _428;
    }
    float _1026 = _1018;
    float _1028 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _946);
    bool _1030 = _948 != 0.0;
    bool _1032 = isnan(_948);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan(0.0);
    bool _1038 = _1034 || _1036;
    float _1040 = _846 * _996;
    float _1042 = -_990;
    float _1044 = fma(_984, _988, _1042);
    float _1046 = -_988;
    float _1048 = fma(_984, _990, _1046);
    bool _1050 = _946 == 0.0;
    bool _1052 = !_1038;
    bool _1054 = _1050 && _1052;
    float _1056 = _748 * _1040;
    float _1058 = _862 * _1040;
    float _1060 = _750 * _1040;
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _950);
    float _1064 = _1056 * _1012;
    float _1066 = _1058 * _1028;
    bool _1068 = _950 == 0.0;
    bool _1070 = _1068 && _1054;
    float _1072 = _1060 * _1062;
    float _1074 = _1004 * _1064;
    float _1076 = -_1064;
    float _1078 = _984 * _1076;
    float _1080 = _1000 * _1064;
    int _1082 = 0;
    float _1084 = _1026;
    if (_664)
    {
        float _1086 = -_1026;
        float _1088 = _1086 + 1.0;
        _1082 = as_type<int>(_1088);
    }
    int _1090 = _1082;
    float _1092 = fma(_1014, _1066, _1074);
    float _1094 = fma(_1002, _1066, _1078);
    float _1096 = fma(_1044, _1066, _1080);
    bool _1098 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1100 = isnan(_414);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = fma(_1048, _1072, _1092);
    float _1112 = fma(_1006, _1072, _1094);
    float _1114 = fma(_1016, _1072, _1096);
    bool _1116 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1118 = isnan(_414);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    float _1128 = in.m_65.x;
    float _1130 = in.m_65.y;
    float _1132 = in.m_65.z;
    float _1134 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1136 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1138 = -_1108;
    float _1140 = _1138 + 1.0;
    bool _1142 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1144 = isnan(_414);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1134);
    float _1156 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1136);
    float _1158 = -_1126;
    float _1160 = _1158 + 1.0;
    float _1162 = _1126 * _1140;
    float _1164 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1154);
    float _1166 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1156);
    float _1168 = _1152 * _1160;
    float _1170 = -_1152;
    float _1172 = _1170 + 1.0;
    float _1174 = _784 + _1164;
    float _1176 = _790 + _1166;
    float _1178 = _1174;
    float _1180 = _1176;
    if (_664)
    {
        float _1182 = _892 ? as_type<float>(_1090) : _1026;
        _1024 = _1182;
    }
    float _1184 = _1024;
    float _1186 = _474 * _1172;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1190 = _1174 + _1188;
    float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1194 = _1176 + _1192;
    float _1196 = _596 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1198 = _922 * _1186;
    float _1200 = _1190 * _1190;
    float _1202 = _1194 * _1194;
    float _1204 = _626 * _1022;
    float _1206 = _1128;
    float _1208 = _1130;
    float _1210 = _1132;
    float _1212 = _1200;
    float _1214 = _1202;
    if (!_1070)
    {
        float _1216 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1128);
        _1206 = _1216;
    }
    float _1218 = _1206;
    float _1220 = _1218;
    if (!_1070)
    {
        float _1222 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1130);
        _1208 = _1222;
    }
    float _1224 = _1208;
    float _1226 = _1200 + _1202;
    float _1228 = fma(_1196, _1184, -0.5);
    float _1230 = _668 * _1022;
    if (!_1070)
    {
        float _1232 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1132);
        _1210 = _1232;
    }
    float _1234 = _1210;
    float _1236 = sqrt(_1226);
    if (_672)
    {
        float _1238 = -_1026;
        float _1240 = _1238 + 1.0;
        _1008 = as_type<int>(_1240);
    }
    int _1242 = _1008;
    float _1244 = -_1204;
    float _1246 = fma(_668, _1228, _1244);
    float _1248 = fma(_626, _1228, _1230);
    float _1250 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1252 = -_474;
    float _1254 = _1252 + 1.0;
    if (_672)
    {
        float _1256 = _972 ? as_type<float>(_1242) : _1026;
        _1084 = _1256;
    }
    float _1258 = _1084;
    float _1260 = -_1224;
    float _1262 = _984 * _1260;
    float _1264 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1250);
    float _1266 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1198);
    float _1268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1270 = _1004 * _1224;
    float _1272 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1264);
    float _1274 = fma(_974, _1168, _1266);
    float _1276 = _1000 * _1224;
    float _1278 = fma(_1002, _1218, _1262);
    bool _1280 = _1236 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1282 = _768 + _1272;
    float _1284 = fma(_978, _1162, _1274);
    float _1286 = fma(_1014, _1218, _1270);
    float _1288 = fma(_1044, _1218, _1276);
    float _1290 = fma(_588, _1246, _500);
    float _1292 = -_566;
    float _1294 = fma(_568, _1248, _1292);
    float _1296 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1284);
    if (!_1280)
    {
        _1220 = _1282;
    }
    float _1298 = _1220;
    bool _1300 = !_1280;
    float _1302 = _1298;
    if (!_1300)
    {
        float _1304 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1308 = _1236 + _1306;
        float _1310 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = rsqrt(_1226);
        float _1314 = _1308 * _1304;
        float _1316 = _1314 * 0.15915493667125701904296875;
        float _1318 = _1316 * 6.283185482025146484375;
        float _1320 = sin(_1318);
        float _1322 = _1316 * 6.283185482025146484375;
        float _1324 = cos(_1322);
        float _1326 = fma(_1320, _1310, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1328 = _1312 * _1326;
        float _1330 = fma(_1190, _1328, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1332 = _1324 + (-1.0);
        float _1334 = fma(_1194, _1328, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1338 = _1330 + _1336;
        float _1340 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1344 = _1334 + _1342;
        float _1346 = _1338 * _1338;
        float _1348 = fma(_1282, _1324, _1340);
        float _1350 = _1344 * _1344;
        _1302 = _1348;
        _1212 = _1346;
        _1214 = _1350;
        _1178 = _1330;
        _1180 = _1334;
    }
    float _1352 = _1302;
    float _1354 = _1212;
    float _1356 = _1214;
    float _1358 = _1178;
    float _1360 = _1180;
    float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1366 = _1352 + _1364;
    float _1368 = fma(_1048, _1234, _1286);
    float _1370 = fma(_1006, _1234, _1278);
    float _1372 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1374 = fma(_1366, _1366, _1354);
    float _1376 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1378 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1380 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1382 = _1374 + _1356;
    float _1384 = fma(_1016, _1234, _1288);
    float _1386 = _986 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1388 = fma(_1370, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1376);
    float _1390 = fma(_1370, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1378);
    float _1392 = fma(_1370, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1380);
    float _1394 = _1372 * _1362;
    float _1396 = sqrt(_1382);
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1408 = _1386 * _1268;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1412 = fma(_1384, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1388);
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1416 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1420 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1296 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1430 = _1290 + 0.5;
    float _1432 = _1294 + 0.5;
    float _1434 = fma(_1384, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1390);
    float _1436 = fma(_1384, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1392);
    out.m_67.x = _1422;
    out.m_67.y = _1424;
    out.m_67.z = _1426;
    out.m_67.w = _1414;
    bool _1438 = _1396 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1440 = isnan(_1396);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1446 = _1442 || _1444;
    out.m_69.x = _1416;
    out.m_69.y = _1418;
    out.m_69.z = _1420;
    out.m_69.w = _1428;
    out.m_71.x = _1430;
    out.m_71.y = _1432;
    out.m_71.z = _1394;
    out.m_71.w = _1408;
    out.m_73.x = _1412;
    out.m_73.y = _1434;
    out.m_73.z = _1436;
    float _1448 = _1390;
    float _1450 = _1418;
    float _1452 = _1428;
    float _1454 = _1420;
    if (!_1446)
    {
        _1448 = 1.0;
    }
    float _1456 = _1448;
    bool _1458 = !_1446;
    float _1460 = _1456;
    if (!_1458)
    {
        bool _1462 = _1396 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1464 = isnan(_1396);
        bool _1466 = _1462 || _1464;
        bool _1468 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1470 = _1466 || _1468;
        if (!_1470)
        {
            float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1474 = _1396 + _1472;
            float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1478 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1476;
            float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1482 = _1480 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1484 = 1.0 / _1478;
            float _1486 = _1474 * _1484;
            float _1488 = fma(_1486, _1482, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1460 = _1488;
            _1490 = true;
        }
        else
        {
            bool _1492 = _1396 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1494 = isnan(_1396);
            bool _1496 = _1492 || _1494;
            bool _1498 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1500 = _1496 || _1498;
            if (!_1500)
            {
                float _1502 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1504 = _1396 + _1502;
                float _1506 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1508 = _1506 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1512 = _1510 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1514 = 1.0 / _1508;
                float _1516 = _1504 * _1514;
                float _1518 = fma(_1516, _1512, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1460 = _1518;
                _1490 = true;
            }
            else
            {
                _1460 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1490 = false;
    float _1520 = _1460;
    float _1522 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1524 = _1352 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1528 = _1358 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1532 = _1360 + _1530;
    float _1534 = -_914;
    float _1536 = _784 + _1534;
    float _1538 = fma(_1524, _1520, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1540 = fma(_1528, _1520, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1542 = fma(_1532, _1520, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1544 = -_906;
    float _1546 = _1544 + _1538;
    float _1548 = -_914;
    float _1550 = _1548 + _1540;
    float _1552 = -_920;
    float _1554 = _1552 + _1542;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1558 = _1546 + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1562 = _1550 + _1560;
    float _1564 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1566 = _1554 + _1564;
    float _1568 = _1558 * _1558;
    float _1570 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1572 = fma(_1562, _1562, _1568);
    float _1574 = fma(_1566, _1566, _1572);
    float _1576 = rsqrt(_1574);
    float _1578 = sqrt(_1574);
    float _1580 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1582 = _1562 * _1580;
    float _1584 = _1566 * _1580;
    float _1586 = _1582 * _1582;
    float _1588 = _1584 * _1584;
    float _1590 = _1586 + _1588;
    float _1592 = sqrt(_1590);
    bool _1594 = _1592 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1598 = _1592 + _1596;
    float _1600 = _1426;
    float _1602 = _1598;
    float _1604 = _1566;
    float _1606 = _1558;
    float _1608 = _1562;
    if (_1594)
    {
        float _1610 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1610;
    }
    float _1612 = _1600;
    if (_1594)
    {
        float _1614 = rsqrt(_1590);
        _1450 = _1614;
    }
    float _1616 = _1450;
    float _1618 = _1616;
    if (_1594)
    {
        float _1620 = _1598 * _1612;
        _1602 = _1620;
    }
    float _1622 = _1602;
    if (_1594)
    {
        float _1624 = _1622 * 0.15915493667125701904296875;
        _1452 = _1624;
    }
    float _1626 = _1452;
    float _1628 = _1416;
    float _1630 = _1626;
    if (_1594)
    {
        float _1632 = _1626 * 6.283185482025146484375;
        float _1634 = sin(_1632);
        _1628 = _1634;
    }
    float _1636 = _1628;
    float _1638 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1640 = precise::max(0.0, _1638);
    float _1642 = _1414;
    float _1644 = _1638;
    float _1646 = _1640;
    if (_1594)
    {
        float _1648 = _1626 * 6.283185482025146484375;
        float _1650 = cos(_1648);
        _1642 = _1650;
    }
    float _1652 = _1642;
    float _1654 = -_1580;
    float _1656 = -_1640;
    float _1658 = fma(_1558, _1654, _1656);
    if (_1594)
    {
        float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1644 = _1660;
    }
    float _1662 = _1644;
    float _1664 = _1636;
    float _1666 = _1662;
    if (_1594)
    {
        float _1668 = fma(_1636, _1662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1454 = _1668;
    }
    float _1670 = _1454;
    float _1672 = _1670;
    if (!_1594)
    {
        _1664 = _1658;
    }
    float _1674 = _1664;
    float _1676 = _1674;
    if (!_1594)
    {
        _1666 = _1586;
    }
    float _1678 = _1666;
    float _1680 = _1652;
    float _1682 = _1678;
    if (_1594)
    {
        float _1684 = _1652 + (-1.0);
        _1646 = _1684;
    }
    float _1686 = _1646;
    float _1688 = _1686;
    if (_1594)
    {
        float _1690 = _1616 * _1670;
        _1630 = _1690;
    }
    float _1692 = _1630;
    if (!_1594)
    {
        _1618 = _1582;
    }
    float _1694 = _1618;
    float _1696 = _1694;
    if (_1594)
    {
        float _1698 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1688 = _1698;
    }
    float _1700 = _1688;
    if (_1594)
    {
        float _1702 = _1582 * _1692;
        _1696 = _1702;
    }
    float _1704 = _1696;
    if (!_1594)
    {
        _1672 = _1588;
    }
    float _1706 = _1672;
    float _1708 = _1706;
    if (_1594)
    {
        float _1710 = fma(_1658, _1652, _1700);
        _1676 = _1710;
    }
    float _1712 = _1676;
    if (!_1594)
    {
        _1680 = _1584;
    }
    float _1714 = _1680;
    float _1716 = _1714;
    if (_1594)
    {
        float _1718 = _1584 * _1692;
        _1716 = _1718;
    }
    float _1720 = _1716;
    if (_1594)
    {
        float _1722 = _1704 * _1704;
        _1682 = _1722;
    }
    float _1724 = _1682;
    float _1726 = floor(_1570);
    if (_1594)
    {
        float _1728 = _1720 * _1720;
        _1708 = _1728;
    }
    float _1730 = _1708;
    float _1732 = fma(_1712, _1712, _1724);
    float _1734 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1738 = fma(_1578, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1736);
    float _1740 = precise::clamp(_1738, 0.0, 1.0);
    float _1742 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1744 = _1732 + _1730;
    float _1746 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1734);
    float _1748 = -_1740;
    float _1750 = _1748 + 1.0;
    float _1752 = -_920;
    float _1754 = _790 + _1752;
    float _1756 = rsqrt(_1744);
    float _1758 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1746);
    float _1760 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1742);
    float _1762 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1764 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1766 = abs(_1750);
    float _1768 = log2(_1766);
    float _1770 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1772 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1774 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1776 = -_1770;
    float _1778 = fma(_1776, _1764, 1.0);
    float _1780 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1782 = _1756 * _1704;
    float _1784 = _1756 * _1720;
    float _1786 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1780);
    float _1788 = _1756 * _1712;
    float _1790 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1772);
    float _1792 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1794 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1786);
    float _1796 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1760);
    float _1798 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1790);
    float _1800 = -_1792;
    float _1802 = fma(_1788, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1800);
    float _1804 = _1794 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1806 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1808 = _1798 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1810 = _1796 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1812 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1814 = -_1784;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1802);
    float _1818 = floor(_1774);
    float _1820 = -_1726;
    float _1822 = _1570 + _1820;
    float _1824 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1812);
    float _1826 = fma(_1816, -0.5, 0.5);
    float _1828 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1830 = fma(_1816, 0.5, 0.5);
    float _1832 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1824);
    float _1834 = exp2(_1806);
    float _1836 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1828);
    float _1838 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1832);
    float _1840 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1842 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1836);
    float _1844 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1840);
    float _1846 = log2(_1778);
    float _1848 = fma(_1830, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1850 = -_1818;
    float _1852 = _1774 + _1850;
    float _1854 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1844);
    float _1856 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1842);
    float _1858 = fma(_1830, _1848, -0.212114393711090087890625);
    float _1860 = 1.0 / _1838;
    float _1862 = sqrt(_1826);
    float _1864 = _1846 * 0.693147182464599609375;
    float2 _5281 = float2(_1822, _1852);
    float _1866 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5281, float2(0.0), isnan(_5281)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5281, float2(0.0), isnan(_5281)), level(0.0)).x;
    float _1868 = fma(_1830, _1858, 1.570728778839111328125);
    float _1870 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1872 = _1856 * _1860;
    float _1874 = _1788 + 1.0;
    float _1876 = fma(_1872, 0.5, 0.5);
    float _1878 = -_1788;
    float _1880 = fma(_1834, _1874, _1878);
    float _1882 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1854);
    float _1884 = _1862 * 0.636619746685028076171875;
    float _1886 = _1882 * _1860;
    float _1888 = -_1868;
    float _1890 = fma(_1884, _1888, 1.0);
    float _1892 = fma(_1880, 0.5, 0.5);
    float _1894 = fma(_1886, -0.5, 0.5);
    float3 _5333 = float3(_1876, _1894, _1870);
    float _1896 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5333, float3(0.0), isnan(_5333)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5333, float3(0.0), isnan(_5333)), level(0.0)).x;
    float3 _5344 = float3(_1876, _1894, _1870);
    float4 _1899 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5344, float3(0.0), isnan(_5344)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5344, float3(0.0), isnan(_5344)), level(0.0)).xyzw;
    float _1901 = _1899.x;
    float _1903 = _1899.y;
    float _1905 = _1899.z;
    float _1907 = _1899.w;
    float2 _5360 = float2(_1890, _1892);
    float3 _1911 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5360, float2(0.0), isnan(_5360)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5360, float2(0.0), isnan(_5360)), level(0.0)).xyz;
    float _1913 = _1911.x;
    float _1915 = _1911.y;
    float _1917 = _1911.z;
    float _1919 = -_906;
    float _1921 = _768 + _1919;
    float _1923 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1925 = _1578 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1927 = isnan(_1578);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1933 = _1929 || _1931;
    float _1935 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1937 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1939 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1941 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1923);
    float _1943 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1935);
    float _1945 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1937);
    out.m_75.x = _1562;
    out.m_75.y = _1558;
    out.m_75.z = _1566;
    float _1947 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1943);
    float _1949 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1945);
    float _1951 = exp2(_1939);
    float _1953 = _1947 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1955 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1957 = _1955 + _1953;
    float _1959 = 1.0 / _1953;
    float _1961 = _1882;
    if (!_1933)
    {
        _1604 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1963 = _1604;
    float _1965 = _1963;
    float _1967 = _1963;
    if (!_1933)
    {
        _1606 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1969 = _1606;
    float _1971 = _1969;
    float _1973 = _1969;
    if (!_1933)
    {
        _1608 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1975 = _1608;
    float _1977 = -_1951;
    float _1979 = _1977 + 1.0;
    float _1981 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1983 = _1957 * _1959;
    float _1985 = _1983 * 0.5;
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1989 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1987);
    float _1991 = 1.0 / _1989;
    float _1993 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1995 = _1991 * _1993;
    float _1997 = abs(_1995);
    float _1999 = log2(_1997);
    float _2001 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2003 = exp2(_2001);
    float _2005 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2007 = precise::clamp(_2005, 0.0, 1.0);
    float _2009 = fma(_2007, -2.0, 3.0);
    float _2011 = _2007 * _2007;
    float _2013 = _2011 * _2009;
    float _2015 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1941);
    float _2017 = in.m_77.x;
    float _2019 = -_2013;
    float _2021 = _2019 + 1.0;
    float _2023 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2015);
    float _2025 = fma(_2021, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2013);
    bool _2027 = _1995 <= 8000.0;
    bool _2029 = isnan(_1995);
    bool _2031 = _2027 || _2029;
    bool _2033 = isnan(8000.0);
    bool _2035 = _2031 || _2033;
    float _2037 = float(_2035);
    float _2039 = _2023 + _1838;
    float _2041 = _2037 * _2025;
    float _2043 = _2039 * 0.5;
    out.gl_Position.x = _1856;
    out.gl_Position.y = _1882;
    out.gl_Position.z = _2023;
    out.gl_Position.w = _1838;
    float _2045 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _2043;
    out.m_79.w = _1838;
    float _2047 = _1856;
    float _2049 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2051 = _1975;
    float _2053 = _1975;
    if (!_1933)
    {
        _2047 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2055 = _2047;
    float _2057 = _2055;
    float _2059 = _2055;
    if (!_1933)
    {
        _1961 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2061 = _1961;
    float _2063 = -_1866;
    float _2065 = _2063 + 1.0;
    float _2067 = _2065 * _2045;
    float _2069 = precise::clamp(_2067, 0.0, 1.0);
    float _2071 = -_2069;
    float _2073 = fma(_2071, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2075 = _2061;
    float _2077 = _2061;
    if (!_1933)
    {
        _2049 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2079 = _2049;
    float _2081 = _2073 * _2017;
    float _2083 = _2081 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_81.x = _2083;
    float _2085 = _1981 * _1896;
    float _2087 = -_1981;
    float _2089 = _2087 + 1.0;
    float _2091 = _1907 * _2085;
    float _2093 = _1917 * _2085;
    float _2095 = _1907 * _2089;
    float _2097 = fma(_1913, _2091, _1901);
    float _2099 = fma(_1915, _2091, _1903);
    float _2101 = fma(_1907, _2093, _1905);
    out.m_83.x = _2097;
    out.m_83.y = _2099;
    out.m_83.z = _2101;
    out.m_83.w = _2095;
    bool _2103 = !_1933;
    float _2105 = _2079;
    float _2107 = _2079;
    if (!_2103)
    {
        bool _2109 = _1578 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2111 = isnan(_1578);
        bool _2113 = _2109 || _2111;
        bool _2115 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2117 = _2113 || _2115;
        if (!_2117)
        {
            float _2119 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2121 = _1578 + _2119;
            float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2125 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2123;
            float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2129 = _2127 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2131 = 1.0 / _2125;
            float _2133 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2135 = _2133 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2137 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2139 = _2137 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2143 = _2141 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2147 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2149 = _2121 * _2131;
            float _2151 = precise::clamp(_2149, 0.0, 1.0);
            float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2155 = _2153 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2157 = fma(_2151, _2129, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2159 = fma(_2151, _2155, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2161 = fma(_2151, _2135, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2163 = fma(_2151, _2139, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2165 = fma(_2151, _2143, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2167 = fma(_2151, _2147, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2077 = _2161;
            _2053 = _2165;
            _2059 = _2157;
            _1973 = _2163;
            _1967 = _2159;
            _2107 = _2167;
            _2169 = true;
        }
        else
        {
            bool _2171 = _1578 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2173 = isnan(_1578);
            bool _2175 = _2171 || _2173;
            bool _2177 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2179 = _2175 || _2177;
            if (!_2179)
            {
                _2057 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2181 = _2057;
            _2059 = _2181;
            if (!_2179)
            {
                _2075 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2183 = _2075;
            _2077 = _2183;
            if (!_2179)
            {
                _1965 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2185 = _1965;
            _1967 = _2185;
            if (!_2179)
            {
                _1971 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2187 = _1971;
            _1973 = _2187;
            if (!_2179)
            {
                _2051 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2189 = _2051;
            _2053 = _2189;
            if (!_2179)
            {
                _2105 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2191 = _2105;
            bool _2193 = !_2179;
            _2107 = _2191;
            if (!_2193)
            {
                bool _2195 = _1578 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2197 = isnan(_1578);
                bool _2199 = _2195 || _2197;
                bool _2201 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2203 = _2199 || _2201;
                if (!_2203)
                {
                    float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2207 = _1578 + _2205;
                    float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2211 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2209;
                    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2217 = 1.0 / _2211;
                    float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2221 = _2219 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2225 = _2223 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2227 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2229 = _2227 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2235 = _2207 * _2217;
                    float _2237 = precise::clamp(_2235, 0.0, 1.0);
                    float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2243 = fma(_2237, _2215, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2245 = fma(_2237, _2241, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2247 = fma(_2237, _2221, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2249 = fma(_2237, _2225, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2251 = fma(_2237, _2229, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2253 = fma(_2237, _2233, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2077 = _2247;
                    _2053 = _2251;
                    _2059 = _2243;
                    _1973 = _2249;
                    _1967 = _2245;
                    _2107 = _2253;
                    _2169 = true;
                }
                else
                {
                    _2077 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2053 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2059 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1973 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1967 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2107 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2169 = false;
    float _2255 = _2077;
    float _2257 = _2053;
    float _2259 = _2059;
    float _2261 = _1973;
    float _2263 = _1967;
    float _2265 = _2107;
    float _2267 = fma(_1434, -0.5, 0.5);
    float _2269 = precise::clamp(_2267, 0.0, 1.0);
    float _2271 = -_2255;
    float _2273 = _2271 + _2257;
    float _2275 = -_2259;
    float _2277 = _2275 + _2261;
    float _2279 = -_2263;
    float _2281 = _2279 + _2265;
    bool _2283 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2285 = fma(_2269, _2273, _2255);
    float _2287 = fma(_2269, _2277, _2259);
    float _2289 = fma(_2269, _2281, _2263);
    float _2291 = _2285 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _2293 = fma(_2287, 0.298911988735198974609375, _2291);
    float _2295 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2297 = fma(_2289, 0.114477999508380889892578125, _2293);
    out.m_51.x = _2295;
    float _2299 = -_2297;
    float _2301 = _2287 + _2299;
    float _2303 = -_2297;
    float _2305 = _2285 + _2303;
    float _2307 = -_2297;
    float _2309 = _2289 + _2307;
    float _2311 = fma(_2301, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2297);
    float _2313 = fma(_2305, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2297);
    float _2315 = fma(_2309, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2297);
    out.m_87.x = _2311;
    out.m_87.y = _2313;
    out.m_87.z = _2315;
    if (!_2283)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2317 = -_1546;
    float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2321 = -_1550;
    float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2325 = -_1554;
    float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2329 = _2319 * _2319;
    float _2331 = fma(_2323, _2323, _2329);
    float _2333 = fma(_2327, _2327, _2331);
    float _2335 = sqrt(_2333);
    float _2337 = rsqrt(_2333);
    float _2339 = -_2335;
    float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2343 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = _2323 * _2337;
    float _2349 = _2319 * _2337;
    float _2351 = abs(_2345);
    float _2353 = log2(_2351);
    float _2355 = _2327 * _2337;
    float _2357 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2359 = _1434 * _2349;
    float _2361 = -_2349;
    float _2363 = -_2357;
    float _2365 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2363);
    float _2367 = fma(_1412, _2347, _2359);
    float _2369 = -_2355;
    float _2371 = fma(_2369, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2365);
    float _2373 = fma(_1436, _2355, _2367);
    float _2375 = precise::clamp(_2373, 0.0, 1.0);
    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2379 = _2371 + _2377;
    float _2381 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2383 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2385 = precise::clamp(_2383, 0.0, 1.0);
    float _2387 = exp2(_2381);
    float _2389 = _2387 * _2385;
    float _2391 = _2375 * _2389;
    float _2393 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2395 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2397 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2393;
    out.m_85.y = _2395;
    out.m_85.z = _2397;
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
    bool _2169 = false;
    bool _1490 = false;
    bool _406 = false;
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
        float _2454 = as_type<float>(_122);
        out.gl_Position.z = _2454;
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
        float _2523 = as_type<float>(_160);
        out.gl_Position.z = _2523;
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
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _192 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _200 = _192 + _198;
    bool _202 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _204 = isnan(_192);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _192 + _226;
    float _230 = 1.0 / _224;
    bool _232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _234 = 1.0 / _220;
    bool _236 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _238 = isnan(_192);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = 1.0 / _216;
    float _250 = _200 * _230;
    float _252 = -_212;
    float _254 = _252 + 1.0;
    bool _256 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _258 = isnan(_192);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = _246 * _254;
    float _270 = -_246;
    float _272 = _270 + 1.0;
    float _274 = _196 * _234;
    bool _276 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _278 = isnan(_192);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _296 = -_286;
    float _298 = _296 + 1.0;
    float _300 = fma(_294, _274, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _302 = _228 * _248;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    float _312 = _266 * _298;
    float _314 = fma(_290, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _316 = fma(_306, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _318 = fma(_310, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _320 = _286 * _272;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _326 = _316 * _312;
    float _328 = _318 * _312;
    float _330 = _314 * _312;
    float _332 = -_266;
    float _334 = _332 + 1.0;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _340 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].y, _328);
    float _342 = fma(_324, _274, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _344 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].x, _326);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _350;
    float _354 = fma(_338, _274, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _356 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].z, _330);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _358;
    float _362 = fma(_300, _320, _344);
    float _364 = fma(_348, _250, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _366 = fma(_352, _250, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _368 = fma(_342, _320, _340);
    float _370 = fma(_360, _250, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _372 = fma(_354, _320, _356);
    float _374 = fma(_364, _268, _362);
    float _376 = fma(_366, _268, _368);
    float _378 = fma(_370, _268, _372);
    float _380 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[146].x, _374);
    float _382 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[146].y, _376);
    float _384 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[146].z, _378);
    bool _386 = !_232;
    float _404;
    if (!_386)
    {
        float _388 = in.m_55.x;
        float _390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _392 = _388 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _394 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _396 = _394 * _390;
        float _398 = floor(_396);
        float _400 = -_398;
        float _402 = _396 + _400;
        _404 = _402;
        _406 = true;
    }
    else
    {
        float _408 = float(_106);
        float _410 = 1.0 / _408;
        float _412 = _140 * _410;
        _404 = _412;
    }
    _406 = false;
    float _414 = _404;
    float _416 = in.m_55.x;
    float _418 = in.m_55.y;
    float _420 = in.m_55.z;
    float _422 = in.m_55.w;
    float _424 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _426 = log2(_424);
    float _428 = in.m_57.x;
    bool _430 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _432 = isnan(0.0);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _438 = _434 || _436;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _444 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _446 = isnan(1.0);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _452 = _448 || _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _456 = 1.0 + _454;
    float _458 = _426 * _140;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _462 = 1.0 / _456;
    bool _464 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _466 = isnan(_414);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _416 * 2.0;
    float _478 = _418 * 2.0;
    float _480 = _420 * 2.0;
    float _482 = exp2(_458);
    float _484 = _416 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _486 = _418 + _420;
    float _488 = _442 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _490 = -_460;
    float _492 = fma(_484, 2.0, _490);
    float _494 = _486 + (-1.0);
    float _496 = floor(_476);
    float _498 = -_140;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[76].x, _492);
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _504 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _506 = floor(_478);
    float _508 = -_482;
    float _510 = _508 + 1.0;
    float _512 = floor(_480);
    bool _514 = _496 > 0.0;
    bool _516 = _496 >= 0.0;
    bool _518 = isnan(_496);
    bool _520 = _516 || _518;
    bool _522 = isnan(0.0);
    bool _524 = _520 || _522;
    float _526 = _438 ? _510 : 0.0;
    bool _528 = _506 > 0.0;
    float _530 = _418 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _532 = _506 >= 0.0;
    bool _534 = isnan(_506);
    bool _536 = _532 || _534;
    bool _538 = isnan(0.0);
    bool _540 = _536 || _538;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _544 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[79].z, _502);
    float _546 = fma(_530, -2.0, _440);
    float _548 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[78].w, _542);
    bool _550 = _512 > 0.0;
    float _552 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[79].x, _544);
    bool _554 = _512 >= 0.0;
    bool _556 = isnan(_512);
    bool _558 = _554 || _556;
    bool _560 = isnan(0.0);
    bool _562 = _558 || _560;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _566 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _546);
    float _568 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _548);
    float _570 = in.m_48.x;
    float _572 = in.m_48.y;
    float _574 = in.m_48.z;
    float _576 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[78].z, _564);
    int _578 = _562 ? 0 : 1;
    float _580 = _552 * (-0.15915493667125701904296875);
    float _582 = in.m_59.x;
    float _584 = in.m_59.y;
    float _586 = in.m_59.z;
    float _588 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _576);
    if (_452)
    {
        float _590 = _526 * _462;
        _144 = _590;
    }
    float _592 = _144;
    int _594 = _524 ? 0 : 1;
    float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _600 = _598 != 0;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _604 = _602 != 0;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _608 = _606 != 0;
    int _610 = _540 ? 0 : 1;
    int _612 = ~_578;
    int _614 = _612 + 1;
    int _616 = _614 + 1;
    int _618 = ~_594;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = _580 * 6.283185482025146484375;
    float _626 = sin(_624);
    int _628 = ~_610;
    int _630 = _628 + 1;
    int _632 = _630 + 1;
    int _634 = _616;
    int _636 = _622;
    int _638 = _632;
    bool _640 = _608;
    if (!_550)
    {
        int _642 = ~_578;
        int _644 = _642 + 1;
        _634 = _644;
    }
    int _646 = _634;
    if (!_514)
    {
        int _648 = ~_594;
        int _650 = _648 + 1;
        _636 = _650;
    }
    int _652 = _636;
    if (!_528)
    {
        int _654 = ~_610;
        int _656 = _654 + 1;
        _638 = _656;
    }
    int _658 = _638;
    float _660 = _416 + _420;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _664 = _662 != 0;
    float _666 = _580 * 6.283185482025146484375;
    float _668 = cos(_666);
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _672 = _670 != 0;
    float _674 = _380 * _582;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _678 = _676 != 0;
    float _680 = _418 + (-0.5);
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _684 = _682 != 0;
    float _686 = _418 + _416;
    bool _688 = !_604;
    int _690 = _688 ? 0 : 1;
    float _692 = _384 * _586;
    bool _694 = _418 > 0.5;
    float _696 = _572 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _698 = !_600;
    int _700 = _698 ? 0 : 1;
    float _702 = _382 * _584;
    bool _704 = _422 > 0.5;
    float _706 = _572 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _708 = _572 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _710 = _420 + (-0.5);
    float _712 = _416 + (-0.5);
    float _714 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[4].x, _696);
    float _716 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[5].x, _706);
    float _718 = in.m_61.x;
    float _720 = in.m_61.y;
    float _722 = in.m_61.z;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _728 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[6].x, _708);
    int _730 = abs(_700);
    float _732 = _686 + (-1.0);
    float _734 = 1.0 / _726;
    float _736 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[4].z, _714);
    int _738 = abs(_690);
    float _740 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _742 = _660 + (-1.0);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _744;
    float _748 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _750 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _752 = float(_730);
    float _754 = float(_646);
    float _756 = _752 * _754;
    float _758 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[5].z, _716);
    float _760 = float(_738);
    float _762 = _746 * _734;
    float _764 = _756 * (-2.0);
    float _766 = float(_652);
    float _768 = _758 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _770 = fma(_740, _764, _740);
    float _772 = fma(_764, _718, _718);
    float _774 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[6].z, _728);
    float _776 = _760 * _766;
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _780 = _768 + _778;
    float _782 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[196].x, _772);
    float _784 = _736 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _790 = _774 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _794 = _784 + _792;
    float _796 = _780 * _780;
    float _798 = 1.0 / _788;
    float _800 = _776 * (-2.0);
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _804 = _790 + _802;
    float _806 = fma(_794, _794, _796);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _812 = fma(_800, _720, _720);
    float _814 = fma(_504, _800, _504);
    float _816 = fma(_804, _804, _806);
    float _818 = 1.0 / _810;
    bool _820 = !_608;
    int _822 = _820 ? 0 : 1;
    float _824 = _796;
    bool _826 = _704;
    float _828 = _818;
    if (_664)
    {
        float _830 = in.m_55.x;
        _824 = _830;
    }
    float _832 = _824;
    float _834 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].y, _812);
    float _836 = fma(_770, _592, _782);
    int _838 = abs(_822);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _844 = fma(_814, _592, _834);
    float _846 = rsqrt(_816);
    float _848 = float(_838);
    float _850 = in.m_57.y;
    float _852 = float(_658);
    float _854 = _836 * 0.15915493667125701904296875;
    float _856 = _844 * 0.15915493667125701904296875;
    float _858 = _842 * _798;
    float _860 = _848 * _852;
    float _862 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _864 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _866 = _854 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = _860 * (-2.0);
    float _872 = _798;
    if (_672)
    {
        float _874 = in.m_55.z;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = fma(_870, _722, _722);
    float _880 = fma(_864, _870, _864);
    float _882 = _862 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _884 = _854 * 6.283185482025146484375;
    float _886 = cos(_884);
    float _888 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[196].z, _878);
    if (_664)
    {
        bool _890 = _832 > 0.5;
        _640 = _890;
    }
    bool _892 = _640;
    float _894 = _882 * _846;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _898 = _414 + _896;
    float _900 = fma(_880, _592, _888);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _902;
    float _906 = _780 * _894;
    float _908 = _856 * 6.283185482025146484375;
    float _910 = sin(_908);
    float _912 = _900 * 0.15915493667125701904296875;
    float _914 = _794 * _894;
    float _916 = -_906;
    float _918 = _780 + _916;
    float _920 = _804 * _894;
    float _922 = fma(_762, _898, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _924 = -_914;
    float _926 = _794 + _924;
    float _928 = _918 * _918;
    float _930 = _856 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = -_850;
    float _936 = _934 + 1.0;
    float _938 = _904 * _818;
    float _940 = fma(_926, _926, _928);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _944 = _414 + _942;
    float _946 = in.m_63.x;
    float _948 = in.m_63.y;
    float _950 = in.m_63.z;
    int _952 = _704 ? as_type<int>(_936) : as_type<int>(_850);
    float _954 = _912 * 6.283185482025146484375;
    float _956 = cos(_954);
    float _958 = -_920;
    float _960 = _804 + _958;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _964 = _414 + _962;
    float _966 = _850;
    float _968 = _960;
    if (_672)
    {
        bool _970 = _876 > 0.5;
        _826 = _970;
    }
    bool _972 = _826;
    float _974 = fma(_858, _944, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _976 = fma(_960, _960, _940);
    float _978 = fma(_938, _964, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _980 = _868 * _910;
    float _982 = _912 * 6.283185482025146484375;
    float _984 = sin(_982);
    float _986 = _678 ? as_type<float>(_952) : _850;
    float _988 = _868 * _932;
    float _990 = _886 * _910;
    if (_684)
    {
        float _992 = _694 ? _936 : _850;
        _966 = _992;
    }
    float _994 = _966;
    float _996 = sqrt(_976);
    float _998 = _886 * _932;
    float _1000 = _868 * _956;
    float _1002 = _932 * _956;
    float _1004 = _886 * _956;
    float _1006 = _910 * _956;
    int _1008 = as_type<int>(_950);
    if (!_664)
    {
        _968 = _428;
    }
    float _1010 = _968;
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _948);
    float _1014 = fma(_984, _998, _980);
    float _1016 = fma(_984, _980, _998);
    float _1018 = _1010;
    if (!_664)
    {
        _828 = _1010;
    }
    float _1020 = _828;
    float _1022 = fma(_488, _994, -0.5);
    float _1024 = _1020;
    if (_664)
    {
        _1018 = _428;
    }
    float _1026 = _1018;
    float _1028 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _946);
    bool _1030 = _948 != 0.0;
    bool _1032 = isnan(_948);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan(0.0);
    bool _1038 = _1034 || _1036;
    float _1040 = _846 * _996;
    float _1042 = -_990;
    float _1044 = fma(_984, _988, _1042);
    float _1046 = -_988;
    float _1048 = fma(_984, _990, _1046);
    bool _1050 = _946 == 0.0;
    bool _1052 = !_1038;
    bool _1054 = _1050 && _1052;
    float _1056 = _748 * _1040;
    float _1058 = _862 * _1040;
    float _1060 = _750 * _1040;
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _950);
    float _1064 = _1056 * _1012;
    float _1066 = _1058 * _1028;
    bool _1068 = _950 == 0.0;
    bool _1070 = _1068 && _1054;
    float _1072 = _1060 * _1062;
    float _1074 = _1004 * _1064;
    float _1076 = -_1064;
    float _1078 = _984 * _1076;
    float _1080 = _1000 * _1064;
    int _1082 = 0;
    float _1084 = _1026;
    if (_664)
    {
        float _1086 = -_1026;
        float _1088 = _1086 + 1.0;
        _1082 = as_type<int>(_1088);
    }
    int _1090 = _1082;
    float _1092 = fma(_1014, _1066, _1074);
    float _1094 = fma(_1002, _1066, _1078);
    float _1096 = fma(_1044, _1066, _1080);
    bool _1098 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1100 = isnan(_414);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = fma(_1048, _1072, _1092);
    float _1112 = fma(_1006, _1072, _1094);
    float _1114 = fma(_1016, _1072, _1096);
    bool _1116 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1118 = isnan(_414);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    float _1128 = in.m_65.x;
    float _1130 = in.m_65.y;
    float _1132 = in.m_65.z;
    float _1134 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1136 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1138 = -_1108;
    float _1140 = _1138 + 1.0;
    bool _1142 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1144 = isnan(_414);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1134);
    float _1156 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1136);
    float _1158 = -_1126;
    float _1160 = _1158 + 1.0;
    float _1162 = _1126 * _1140;
    float _1164 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1154);
    float _1166 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1156);
    float _1168 = _1152 * _1160;
    float _1170 = -_1152;
    float _1172 = _1170 + 1.0;
    float _1174 = _784 + _1164;
    float _1176 = _790 + _1166;
    float _1178 = _1174;
    float _1180 = _1176;
    if (_664)
    {
        float _1182 = _892 ? as_type<float>(_1090) : _1026;
        _1024 = _1182;
    }
    float _1184 = _1024;
    float _1186 = _474 * _1172;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1190 = _1174 + _1188;
    float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1194 = _1176 + _1192;
    float _1196 = _596 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1198 = _922 * _1186;
    float _1200 = _1190 * _1190;
    float _1202 = _1194 * _1194;
    float _1204 = _626 * _1022;
    float _1206 = _1128;
    float _1208 = _1130;
    float _1210 = _1132;
    float _1212 = _1200;
    float _1214 = _1202;
    if (!_1070)
    {
        float _1216 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1128);
        _1206 = _1216;
    }
    float _1218 = _1206;
    float _1220 = _1218;
    if (!_1070)
    {
        float _1222 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1130);
        _1208 = _1222;
    }
    float _1224 = _1208;
    float _1226 = _1200 + _1202;
    float _1228 = fma(_1196, _1184, -0.5);
    float _1230 = _668 * _1022;
    if (!_1070)
    {
        float _1232 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1132);
        _1210 = _1232;
    }
    float _1234 = _1210;
    float _1236 = sqrt(_1226);
    if (_672)
    {
        float _1238 = -_1026;
        float _1240 = _1238 + 1.0;
        _1008 = as_type<int>(_1240);
    }
    int _1242 = _1008;
    float _1244 = -_1204;
    float _1246 = fma(_668, _1228, _1244);
    float _1248 = fma(_626, _1228, _1230);
    float _1250 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1252 = -_474;
    float _1254 = _1252 + 1.0;
    if (_672)
    {
        float _1256 = _972 ? as_type<float>(_1242) : _1026;
        _1084 = _1256;
    }
    float _1258 = _1084;
    float _1260 = -_1224;
    float _1262 = _984 * _1260;
    float _1264 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1250);
    float _1266 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1198);
    float _1268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1270 = _1004 * _1224;
    float _1272 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1264);
    float _1274 = fma(_974, _1168, _1266);
    float _1276 = _1000 * _1224;
    float _1278 = fma(_1002, _1218, _1262);
    bool _1280 = _1236 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1282 = _768 + _1272;
    float _1284 = fma(_978, _1162, _1274);
    float _1286 = fma(_1014, _1218, _1270);
    float _1288 = fma(_1044, _1218, _1276);
    float _1290 = fma(_588, _1246, _500);
    float _1292 = -_566;
    float _1294 = fma(_568, _1248, _1292);
    float _1296 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1284);
    if (!_1280)
    {
        _1220 = _1282;
    }
    float _1298 = _1220;
    bool _1300 = !_1280;
    float _1302 = _1298;
    if (!_1300)
    {
        float _1304 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1308 = _1236 + _1306;
        float _1310 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = rsqrt(_1226);
        float _1314 = _1308 * _1304;
        float _1316 = _1314 * 0.15915493667125701904296875;
        float _1318 = _1316 * 6.283185482025146484375;
        float _1320 = sin(_1318);
        float _1322 = _1316 * 6.283185482025146484375;
        float _1324 = cos(_1322);
        float _1326 = fma(_1320, _1310, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1328 = _1312 * _1326;
        float _1330 = fma(_1190, _1328, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1332 = _1324 + (-1.0);
        float _1334 = fma(_1194, _1328, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1338 = _1330 + _1336;
        float _1340 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1344 = _1334 + _1342;
        float _1346 = _1338 * _1338;
        float _1348 = fma(_1282, _1324, _1340);
        float _1350 = _1344 * _1344;
        _1302 = _1348;
        _1212 = _1346;
        _1214 = _1350;
        _1178 = _1330;
        _1180 = _1334;
    }
    float _1352 = _1302;
    float _1354 = _1212;
    float _1356 = _1214;
    float _1358 = _1178;
    float _1360 = _1180;
    float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1366 = _1352 + _1364;
    float _1368 = fma(_1048, _1234, _1286);
    float _1370 = fma(_1006, _1234, _1278);
    float _1372 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1374 = fma(_1366, _1366, _1354);
    float _1376 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1378 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1380 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1382 = _1374 + _1356;
    float _1384 = fma(_1016, _1234, _1288);
    float _1386 = _986 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1388 = fma(_1370, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1376);
    float _1390 = fma(_1370, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1378);
    float _1392 = fma(_1370, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1380);
    float _1394 = _1372 * _1362;
    float _1396 = sqrt(_1382);
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1408 = _1386 * _1268;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1412 = fma(_1384, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1388);
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1416 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1420 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1296 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1430 = _1290 + 0.5;
    float _1432 = _1294 + 0.5;
    float _1434 = fma(_1384, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1390);
    float _1436 = fma(_1384, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1392);
    out.m_67.x = _1422;
    out.m_67.y = _1424;
    out.m_67.z = _1426;
    out.m_67.w = _1414;
    bool _1438 = _1396 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1440 = isnan(_1396);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1446 = _1442 || _1444;
    out.m_69.x = _1416;
    out.m_69.y = _1418;
    out.m_69.z = _1420;
    out.m_69.w = _1428;
    out.m_71.x = _1430;
    out.m_71.y = _1432;
    out.m_71.z = _1394;
    out.m_71.w = _1408;
    out.m_73.x = _1412;
    out.m_73.y = _1434;
    out.m_73.z = _1436;
    float _1448 = _1390;
    float _1450 = _1418;
    float _1452 = _1428;
    float _1454 = _1420;
    if (!_1446)
    {
        _1448 = 1.0;
    }
    float _1456 = _1448;
    bool _1458 = !_1446;
    float _1460 = _1456;
    if (!_1458)
    {
        bool _1462 = _1396 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1464 = isnan(_1396);
        bool _1466 = _1462 || _1464;
        bool _1468 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1470 = _1466 || _1468;
        if (!_1470)
        {
            float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1474 = _1396 + _1472;
            float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1478 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1476;
            float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1482 = _1480 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1484 = 1.0 / _1478;
            float _1486 = _1474 * _1484;
            float _1488 = fma(_1486, _1482, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1460 = _1488;
            _1490 = true;
        }
        else
        {
            bool _1492 = _1396 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1494 = isnan(_1396);
            bool _1496 = _1492 || _1494;
            bool _1498 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1500 = _1496 || _1498;
            if (!_1500)
            {
                float _1502 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1504 = _1396 + _1502;
                float _1506 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1508 = _1506 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1512 = _1510 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1514 = 1.0 / _1508;
                float _1516 = _1504 * _1514;
                float _1518 = fma(_1516, _1512, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1460 = _1518;
                _1490 = true;
            }
            else
            {
                _1460 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1490 = false;
    float _1520 = _1460;
    float _1522 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1524 = _1352 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1528 = _1358 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1532 = _1360 + _1530;
    float _1534 = -_914;
    float _1536 = _784 + _1534;
    float _1538 = fma(_1524, _1520, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1540 = fma(_1528, _1520, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1542 = fma(_1532, _1520, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1544 = -_906;
    float _1546 = _1544 + _1538;
    float _1548 = -_914;
    float _1550 = _1548 + _1540;
    float _1552 = -_920;
    float _1554 = _1552 + _1542;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1558 = _1546 + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1562 = _1550 + _1560;
    float _1564 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1566 = _1554 + _1564;
    float _1568 = _1558 * _1558;
    float _1570 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1572 = fma(_1562, _1562, _1568);
    float _1574 = fma(_1566, _1566, _1572);
    float _1576 = rsqrt(_1574);
    float _1578 = sqrt(_1574);
    float _1580 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1582 = _1562 * _1580;
    float _1584 = _1566 * _1580;
    float _1586 = _1582 * _1582;
    float _1588 = _1584 * _1584;
    float _1590 = _1586 + _1588;
    float _1592 = sqrt(_1590);
    bool _1594 = _1592 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1598 = _1592 + _1596;
    float _1600 = _1426;
    float _1602 = _1598;
    float _1604 = _1566;
    float _1606 = _1558;
    float _1608 = _1562;
    if (_1594)
    {
        float _1610 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1610;
    }
    float _1612 = _1600;
    if (_1594)
    {
        float _1614 = rsqrt(_1590);
        _1450 = _1614;
    }
    float _1616 = _1450;
    float _1618 = _1616;
    if (_1594)
    {
        float _1620 = _1598 * _1612;
        _1602 = _1620;
    }
    float _1622 = _1602;
    if (_1594)
    {
        float _1624 = _1622 * 0.15915493667125701904296875;
        _1452 = _1624;
    }
    float _1626 = _1452;
    float _1628 = _1416;
    float _1630 = _1626;
    if (_1594)
    {
        float _1632 = _1626 * 6.283185482025146484375;
        float _1634 = sin(_1632);
        _1628 = _1634;
    }
    float _1636 = _1628;
    float _1638 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1640 = precise::max(0.0, _1638);
    float _1642 = _1414;
    float _1644 = _1638;
    float _1646 = _1640;
    if (_1594)
    {
        float _1648 = _1626 * 6.283185482025146484375;
        float _1650 = cos(_1648);
        _1642 = _1650;
    }
    float _1652 = _1642;
    float _1654 = -_1580;
    float _1656 = -_1640;
    float _1658 = fma(_1558, _1654, _1656);
    if (_1594)
    {
        float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1644 = _1660;
    }
    float _1662 = _1644;
    float _1664 = _1636;
    float _1666 = _1662;
    if (_1594)
    {
        float _1668 = fma(_1636, _1662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1454 = _1668;
    }
    float _1670 = _1454;
    float _1672 = _1670;
    if (!_1594)
    {
        _1664 = _1658;
    }
    float _1674 = _1664;
    float _1676 = _1674;
    if (!_1594)
    {
        _1666 = _1586;
    }
    float _1678 = _1666;
    float _1680 = _1652;
    float _1682 = _1678;
    if (_1594)
    {
        float _1684 = _1652 + (-1.0);
        _1646 = _1684;
    }
    float _1686 = _1646;
    float _1688 = _1686;
    if (_1594)
    {
        float _1690 = _1616 * _1670;
        _1630 = _1690;
    }
    float _1692 = _1630;
    if (!_1594)
    {
        _1618 = _1582;
    }
    float _1694 = _1618;
    float _1696 = _1694;
    if (_1594)
    {
        float _1698 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1688 = _1698;
    }
    float _1700 = _1688;
    if (_1594)
    {
        float _1702 = _1582 * _1692;
        _1696 = _1702;
    }
    float _1704 = _1696;
    if (!_1594)
    {
        _1672 = _1588;
    }
    float _1706 = _1672;
    float _1708 = _1706;
    if (_1594)
    {
        float _1710 = fma(_1658, _1652, _1700);
        _1676 = _1710;
    }
    float _1712 = _1676;
    if (!_1594)
    {
        _1680 = _1584;
    }
    float _1714 = _1680;
    float _1716 = _1714;
    if (_1594)
    {
        float _1718 = _1584 * _1692;
        _1716 = _1718;
    }
    float _1720 = _1716;
    if (_1594)
    {
        float _1722 = _1704 * _1704;
        _1682 = _1722;
    }
    float _1724 = _1682;
    float _1726 = floor(_1570);
    if (_1594)
    {
        float _1728 = _1720 * _1720;
        _1708 = _1728;
    }
    float _1730 = _1708;
    float _1732 = fma(_1712, _1712, _1724);
    float _1734 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1738 = fma(_1578, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1736);
    float _1740 = precise::clamp(_1738, 0.0, 1.0);
    float _1742 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1744 = _1732 + _1730;
    float _1746 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1734);
    float _1748 = -_1740;
    float _1750 = _1748 + 1.0;
    float _1752 = -_920;
    float _1754 = _790 + _1752;
    float _1756 = rsqrt(_1744);
    float _1758 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1746);
    float _1760 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1742);
    float _1762 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1764 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1766 = abs(_1750);
    float _1768 = log2(_1766);
    float _1770 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1772 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1774 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1776 = -_1770;
    float _1778 = fma(_1776, _1764, 1.0);
    float _1780 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1782 = _1756 * _1704;
    float _1784 = _1756 * _1720;
    float _1786 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1780);
    float _1788 = _1756 * _1712;
    float _1790 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1772);
    float _1792 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1794 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1786);
    float _1796 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1760);
    float _1798 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1790);
    float _1800 = -_1792;
    float _1802 = fma(_1788, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1800);
    float _1804 = _1794 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1806 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1808 = _1798 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1810 = _1796 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1812 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1814 = -_1784;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1802);
    float _1818 = floor(_1774);
    float _1820 = -_1726;
    float _1822 = _1570 + _1820;
    float _1824 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1812);
    float _1826 = fma(_1816, -0.5, 0.5);
    float _1828 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1830 = fma(_1816, 0.5, 0.5);
    float _1832 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1824);
    float _1834 = exp2(_1806);
    float _1836 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1828);
    float _1838 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1832);
    float _1840 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1842 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1836);
    float _1844 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1840);
    float _1846 = log2(_1778);
    float _1848 = fma(_1830, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1850 = -_1818;
    float _1852 = _1774 + _1850;
    float _1854 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1844);
    float _1856 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1842);
    float _1858 = fma(_1830, _1848, -0.212114393711090087890625);
    float _1860 = 1.0 / _1838;
    float _1862 = sqrt(_1826);
    float _1864 = _1846 * 0.693147182464599609375;
    float2 _5281 = float2(_1822, _1852);
    float _1866 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5281, float2(0.0), isnan(_5281)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5281, float2(0.0), isnan(_5281)), level(0.0)).x;
    float _1868 = fma(_1830, _1858, 1.570728778839111328125);
    float _1870 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1872 = _1856 * _1860;
    float _1874 = _1788 + 1.0;
    float _1876 = fma(_1872, 0.5, 0.5);
    float _1878 = -_1788;
    float _1880 = fma(_1834, _1874, _1878);
    float _1882 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1854);
    float _1884 = _1862 * 0.636619746685028076171875;
    float _1886 = _1882 * _1860;
    float _1888 = -_1868;
    float _1890 = fma(_1884, _1888, 1.0);
    float _1892 = fma(_1880, 0.5, 0.5);
    float _1894 = fma(_1886, -0.5, 0.5);
    float3 _5333 = float3(_1876, _1894, _1870);
    float _1896 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5333, float3(0.0), isnan(_5333)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5333, float3(0.0), isnan(_5333)), level(0.0)).x;
    float3 _5344 = float3(_1876, _1894, _1870);
    float4 _1899 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5344, float3(0.0), isnan(_5344)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5344, float3(0.0), isnan(_5344)), level(0.0)).xyzw;
    float _1901 = _1899.x;
    float _1903 = _1899.y;
    float _1905 = _1899.z;
    float _1907 = _1899.w;
    float2 _5360 = float2(_1890, _1892);
    float3 _1911 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5360, float2(0.0), isnan(_5360)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5360, float2(0.0), isnan(_5360)), level(0.0)).xyz;
    float _1913 = _1911.x;
    float _1915 = _1911.y;
    float _1917 = _1911.z;
    float _1919 = -_906;
    float _1921 = _768 + _1919;
    float _1923 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1925 = _1578 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1927 = isnan(_1578);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1933 = _1929 || _1931;
    float _1935 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1937 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1939 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1941 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1923);
    float _1943 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1935);
    float _1945 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1937);
    out.m_75.x = _1562;
    out.m_75.y = _1558;
    out.m_75.z = _1566;
    float _1947 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1943);
    float _1949 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1945);
    float _1951 = exp2(_1939);
    float _1953 = _1947 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1955 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1957 = _1955 + _1953;
    float _1959 = 1.0 / _1953;
    float _1961 = _1882;
    if (!_1933)
    {
        _1604 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1963 = _1604;
    float _1965 = _1963;
    float _1967 = _1963;
    if (!_1933)
    {
        _1606 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1969 = _1606;
    float _1971 = _1969;
    float _1973 = _1969;
    if (!_1933)
    {
        _1608 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1975 = _1608;
    float _1977 = -_1951;
    float _1979 = _1977 + 1.0;
    float _1981 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1983 = _1957 * _1959;
    float _1985 = _1983 * 0.5;
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1989 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1987);
    float _1991 = 1.0 / _1989;
    float _1993 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1995 = _1991 * _1993;
    float _1997 = abs(_1995);
    float _1999 = log2(_1997);
    float _2001 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2003 = exp2(_2001);
    float _2005 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2007 = precise::clamp(_2005, 0.0, 1.0);
    float _2009 = fma(_2007, -2.0, 3.0);
    float _2011 = _2007 * _2007;
    float _2013 = _2011 * _2009;
    float _2015 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1941);
    float _2017 = in.m_77.x;
    float _2019 = -_2013;
    float _2021 = _2019 + 1.0;
    float _2023 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2015);
    float _2025 = fma(_2021, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2013);
    bool _2027 = _1995 <= 8000.0;
    bool _2029 = isnan(_1995);
    bool _2031 = _2027 || _2029;
    bool _2033 = isnan(8000.0);
    bool _2035 = _2031 || _2033;
    float _2037 = float(_2035);
    float _2039 = _2023 + _1838;
    float _2041 = _2037 * _2025;
    float _2043 = _2039 * 0.5;
    out.gl_Position.x = _1856;
    out.gl_Position.y = _1882;
    out.gl_Position.z = _2023;
    out.gl_Position.w = _1838;
    float _2045 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _2043;
    out.m_79.w = _1838;
    float _2047 = _1856;
    float _2049 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2051 = _1975;
    float _2053 = _1975;
    if (!_1933)
    {
        _2047 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2055 = _2047;
    float _2057 = _2055;
    float _2059 = _2055;
    if (!_1933)
    {
        _1961 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2061 = _1961;
    float _2063 = -_1866;
    float _2065 = _2063 + 1.0;
    float _2067 = _2065 * _2045;
    float _2069 = precise::clamp(_2067, 0.0, 1.0);
    float _2071 = -_2069;
    float _2073 = fma(_2071, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2075 = _2061;
    float _2077 = _2061;
    if (!_1933)
    {
        _2049 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2079 = _2049;
    float _2081 = _2073 * _2017;
    float _2083 = _2081 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_81.x = _2083;
    float _2085 = _1981 * _1896;
    float _2087 = -_1981;
    float _2089 = _2087 + 1.0;
    float _2091 = _1907 * _2085;
    float _2093 = _1917 * _2085;
    float _2095 = _1907 * _2089;
    float _2097 = fma(_1913, _2091, _1901);
    float _2099 = fma(_1915, _2091, _1903);
    float _2101 = fma(_1907, _2093, _1905);
    out.m_83.x = _2097;
    out.m_83.y = _2099;
    out.m_83.z = _2101;
    out.m_83.w = _2095;
    bool _2103 = !_1933;
    float _2105 = _2079;
    float _2107 = _2079;
    if (!_2103)
    {
        bool _2109 = _1578 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2111 = isnan(_1578);
        bool _2113 = _2109 || _2111;
        bool _2115 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2117 = _2113 || _2115;
        if (!_2117)
        {
            float _2119 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2121 = _1578 + _2119;
            float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2125 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2123;
            float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2129 = _2127 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2131 = 1.0 / _2125;
            float _2133 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2135 = _2133 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2137 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2139 = _2137 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2143 = _2141 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2147 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2149 = _2121 * _2131;
            float _2151 = precise::clamp(_2149, 0.0, 1.0);
            float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2155 = _2153 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2157 = fma(_2151, _2129, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2159 = fma(_2151, _2155, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2161 = fma(_2151, _2135, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2163 = fma(_2151, _2139, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2165 = fma(_2151, _2143, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2167 = fma(_2151, _2147, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2077 = _2161;
            _2053 = _2165;
            _2059 = _2157;
            _1973 = _2163;
            _1967 = _2159;
            _2107 = _2167;
            _2169 = true;
        }
        else
        {
            bool _2171 = _1578 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2173 = isnan(_1578);
            bool _2175 = _2171 || _2173;
            bool _2177 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2179 = _2175 || _2177;
            if (!_2179)
            {
                _2057 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2181 = _2057;
            _2059 = _2181;
            if (!_2179)
            {
                _2075 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2183 = _2075;
            _2077 = _2183;
            if (!_2179)
            {
                _1965 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2185 = _1965;
            _1967 = _2185;
            if (!_2179)
            {
                _1971 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2187 = _1971;
            _1973 = _2187;
            if (!_2179)
            {
                _2051 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2189 = _2051;
            _2053 = _2189;
            if (!_2179)
            {
                _2105 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2191 = _2105;
            bool _2193 = !_2179;
            _2107 = _2191;
            if (!_2193)
            {
                bool _2195 = _1578 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2197 = isnan(_1578);
                bool _2199 = _2195 || _2197;
                bool _2201 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2203 = _2199 || _2201;
                if (!_2203)
                {
                    float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2207 = _1578 + _2205;
                    float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2211 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2209;
                    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2217 = 1.0 / _2211;
                    float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2221 = _2219 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2225 = _2223 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2227 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2229 = _2227 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2235 = _2207 * _2217;
                    float _2237 = precise::clamp(_2235, 0.0, 1.0);
                    float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2243 = fma(_2237, _2215, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2245 = fma(_2237, _2241, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2247 = fma(_2237, _2221, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2249 = fma(_2237, _2225, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2251 = fma(_2237, _2229, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2253 = fma(_2237, _2233, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2077 = _2247;
                    _2053 = _2251;
                    _2059 = _2243;
                    _1973 = _2249;
                    _1967 = _2245;
                    _2107 = _2253;
                    _2169 = true;
                }
                else
                {
                    _2077 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2053 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2059 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1973 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1967 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2107 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2169 = false;
    float _2255 = _2077;
    float _2257 = _2053;
    float _2259 = _2059;
    float _2261 = _1973;
    float _2263 = _1967;
    float _2265 = _2107;
    float _2267 = fma(_1434, -0.5, 0.5);
    float _2269 = precise::clamp(_2267, 0.0, 1.0);
    float _2271 = -_2255;
    float _2273 = _2271 + _2257;
    float _2275 = -_2259;
    float _2277 = _2275 + _2261;
    float _2279 = -_2263;
    float _2281 = _2279 + _2265;
    bool _2283 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2285 = fma(_2269, _2273, _2255);
    float _2287 = fma(_2269, _2277, _2259);
    float _2289 = fma(_2269, _2281, _2263);
    float _2291 = _2285 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _2293 = fma(_2287, 0.298911988735198974609375, _2291);
    float _2295 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2297 = fma(_2289, 0.114477999508380889892578125, _2293);
    out.m_51.x = _2295;
    float _2299 = -_2297;
    float _2301 = _2287 + _2299;
    float _2303 = -_2297;
    float _2305 = _2285 + _2303;
    float _2307 = -_2297;
    float _2309 = _2289 + _2307;
    float _2311 = fma(_2301, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2297);
    float _2313 = fma(_2305, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2297);
    float _2315 = fma(_2309, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2297);
    out.m_87.x = _2311;
    out.m_87.y = _2313;
    out.m_87.z = _2315;
    if (!_2283)
    {
        return out;
    }
    float _2317 = -_1546;
    float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2321 = -_1550;
    float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2325 = -_1554;
    float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2329 = _2319 * _2319;
    float _2331 = fma(_2323, _2323, _2329);
    float _2333 = fma(_2327, _2327, _2331);
    float _2335 = sqrt(_2333);
    float _2337 = rsqrt(_2333);
    float _2339 = -_2335;
    float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2343 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = _2323 * _2337;
    float _2349 = _2319 * _2337;
    float _2351 = abs(_2345);
    float _2353 = log2(_2351);
    float _2355 = _2327 * _2337;
    float _2357 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2359 = _1434 * _2349;
    float _2361 = -_2349;
    float _2363 = -_2357;
    float _2365 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2363);
    float _2367 = fma(_1412, _2347, _2359);
    float _2369 = -_2355;
    float _2371 = fma(_2369, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2365);
    float _2373 = fma(_1436, _2355, _2367);
    float _2375 = precise::clamp(_2373, 0.0, 1.0);
    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2379 = _2371 + _2377;
    float _2381 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2383 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2385 = precise::clamp(_2383, 0.0, 1.0);
    float _2387 = exp2(_2381);
    float _2389 = _2387 * _2385;
    float _2391 = _2375 * _2389;
    float _2393 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2395 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2397 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2393;
    out.m_85.y = _2395;
    out.m_85.z = _2397;
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
    bool _2169 = false;
    bool _1490 = false;
    bool _406 = false;
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
        float _2454 = as_type<float>(_122);
        out.gl_Position.z = _2454;
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
        float _2523 = as_type<float>(_160);
        out.gl_Position.z = _2523;
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
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _192 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _200 = _192 + _198;
    bool _202 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _204 = isnan(_192);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _192 + _226;
    float _230 = 1.0 / _224;
    bool _232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _234 = 1.0 / _220;
    bool _236 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _238 = isnan(_192);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = 1.0 / _216;
    float _250 = _200 * _230;
    float _252 = -_212;
    float _254 = _252 + 1.0;
    bool _256 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _258 = isnan(_192);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = _246 * _254;
    float _270 = -_246;
    float _272 = _270 + 1.0;
    float _274 = _196 * _234;
    bool _276 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _278 = isnan(_192);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _296 = -_286;
    float _298 = _296 + 1.0;
    float _300 = fma(_294, _274, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _302 = _228 * _248;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    float _312 = _266 * _298;
    float _314 = fma(_290, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _316 = fma(_306, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _318 = fma(_310, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _320 = _286 * _272;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _326 = _316 * _312;
    float _328 = _318 * _312;
    float _330 = _314 * _312;
    float _332 = -_266;
    float _334 = _332 + 1.0;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _340 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].y, _328);
    float _342 = fma(_324, _274, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _344 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].x, _326);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _350;
    float _354 = fma(_338, _274, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _356 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[143].z, _330);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _358;
    float _362 = fma(_300, _320, _344);
    float _364 = fma(_348, _250, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _366 = fma(_352, _250, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _368 = fma(_342, _320, _340);
    float _370 = fma(_360, _250, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _372 = fma(_354, _320, _356);
    float _374 = fma(_364, _268, _362);
    float _376 = fma(_366, _268, _368);
    float _378 = fma(_370, _268, _372);
    float _380 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[146].x, _374);
    float _382 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[146].y, _376);
    float _384 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[146].z, _378);
    bool _386 = !_232;
    float _404;
    if (!_386)
    {
        float _388 = in.m_55.x;
        float _390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _392 = _388 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _394 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _396 = _394 * _390;
        float _398 = floor(_396);
        float _400 = -_398;
        float _402 = _396 + _400;
        _404 = _402;
        _406 = true;
    }
    else
    {
        float _408 = float(_106);
        float _410 = 1.0 / _408;
        float _412 = _140 * _410;
        _404 = _412;
    }
    _406 = false;
    float _414 = _404;
    float _416 = in.m_55.x;
    float _418 = in.m_55.y;
    float _420 = in.m_55.z;
    float _422 = in.m_55.w;
    float _424 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _426 = log2(_424);
    float _428 = in.m_57.x;
    bool _430 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _432 = isnan(0.0);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _438 = _434 || _436;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _444 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _446 = isnan(1.0);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _452 = _448 || _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _456 = 1.0 + _454;
    float _458 = _426 * _140;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _462 = 1.0 / _456;
    bool _464 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _466 = isnan(_414);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _416 * 2.0;
    float _478 = _418 * 2.0;
    float _480 = _420 * 2.0;
    float _482 = exp2(_458);
    float _484 = _416 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _486 = _418 + _420;
    float _488 = _442 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _490 = -_460;
    float _492 = fma(_484, 2.0, _490);
    float _494 = _486 + (-1.0);
    float _496 = floor(_476);
    float _498 = -_140;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[76].x, _492);
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _504 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _506 = floor(_478);
    float _508 = -_482;
    float _510 = _508 + 1.0;
    float _512 = floor(_480);
    bool _514 = _496 > 0.0;
    bool _516 = _496 >= 0.0;
    bool _518 = isnan(_496);
    bool _520 = _516 || _518;
    bool _522 = isnan(0.0);
    bool _524 = _520 || _522;
    float _526 = _438 ? _510 : 0.0;
    bool _528 = _506 > 0.0;
    float _530 = _418 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _532 = _506 >= 0.0;
    bool _534 = isnan(_506);
    bool _536 = _532 || _534;
    bool _538 = isnan(0.0);
    bool _540 = _536 || _538;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _544 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[79].z, _502);
    float _546 = fma(_530, -2.0, _440);
    float _548 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[78].w, _542);
    bool _550 = _512 > 0.0;
    float _552 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[79].x, _544);
    bool _554 = _512 >= 0.0;
    bool _556 = isnan(_512);
    bool _558 = _554 || _556;
    bool _560 = isnan(0.0);
    bool _562 = _558 || _560;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _566 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _546);
    float _568 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _548);
    float _570 = in.m_48.x;
    float _572 = in.m_48.y;
    float _574 = in.m_48.z;
    float _576 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[78].z, _564);
    int _578 = _562 ? 0 : 1;
    float _580 = _552 * (-0.15915493667125701904296875);
    float _582 = in.m_59.x;
    float _584 = in.m_59.y;
    float _586 = in.m_59.z;
    float _588 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _576);
    if (_452)
    {
        float _590 = _526 * _462;
        _144 = _590;
    }
    float _592 = _144;
    int _594 = _524 ? 0 : 1;
    float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _600 = _598 != 0;
    int _602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _604 = _602 != 0;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _608 = _606 != 0;
    int _610 = _540 ? 0 : 1;
    int _612 = ~_578;
    int _614 = _612 + 1;
    int _616 = _614 + 1;
    int _618 = ~_594;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = _580 * 6.283185482025146484375;
    float _626 = sin(_624);
    int _628 = ~_610;
    int _630 = _628 + 1;
    int _632 = _630 + 1;
    int _634 = _616;
    int _636 = _622;
    int _638 = _632;
    bool _640 = _608;
    if (!_550)
    {
        int _642 = ~_578;
        int _644 = _642 + 1;
        _634 = _644;
    }
    int _646 = _634;
    if (!_514)
    {
        int _648 = ~_594;
        int _650 = _648 + 1;
        _636 = _650;
    }
    int _652 = _636;
    if (!_528)
    {
        int _654 = ~_610;
        int _656 = _654 + 1;
        _638 = _656;
    }
    int _658 = _638;
    float _660 = _416 + _420;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _664 = _662 != 0;
    float _666 = _580 * 6.283185482025146484375;
    float _668 = cos(_666);
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _672 = _670 != 0;
    float _674 = _380 * _582;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _678 = _676 != 0;
    float _680 = _418 + (-0.5);
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _684 = _682 != 0;
    float _686 = _418 + _416;
    bool _688 = !_604;
    int _690 = _688 ? 0 : 1;
    float _692 = _384 * _586;
    bool _694 = _418 > 0.5;
    float _696 = _572 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _698 = !_600;
    int _700 = _698 ? 0 : 1;
    float _702 = _382 * _584;
    bool _704 = _422 > 0.5;
    float _706 = _572 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _708 = _572 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _710 = _420 + (-0.5);
    float _712 = _416 + (-0.5);
    float _714 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[4].x, _696);
    float _716 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[5].x, _706);
    float _718 = in.m_61.x;
    float _720 = in.m_61.y;
    float _722 = in.m_61.z;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _728 = fma(_570, (*spvDescriptorSet0.vp_c10)._m0[6].x, _708);
    int _730 = abs(_700);
    float _732 = _686 + (-1.0);
    float _734 = 1.0 / _726;
    float _736 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[4].z, _714);
    int _738 = abs(_690);
    float _740 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _742 = _660 + (-1.0);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _744;
    float _748 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _750 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _752 = float(_730);
    float _754 = float(_646);
    float _756 = _752 * _754;
    float _758 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[5].z, _716);
    float _760 = float(_738);
    float _762 = _746 * _734;
    float _764 = _756 * (-2.0);
    float _766 = float(_652);
    float _768 = _758 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _770 = fma(_740, _764, _740);
    float _772 = fma(_764, _718, _718);
    float _774 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[6].z, _728);
    float _776 = _760 * _766;
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _780 = _768 + _778;
    float _782 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[196].x, _772);
    float _784 = _736 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _790 = _774 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _794 = _784 + _792;
    float _796 = _780 * _780;
    float _798 = 1.0 / _788;
    float _800 = _776 * (-2.0);
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _804 = _790 + _802;
    float _806 = fma(_794, _794, _796);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _812 = fma(_800, _720, _720);
    float _814 = fma(_504, _800, _504);
    float _816 = fma(_804, _804, _806);
    float _818 = 1.0 / _810;
    bool _820 = !_608;
    int _822 = _820 ? 0 : 1;
    float _824 = _796;
    bool _826 = _704;
    float _828 = _818;
    if (_664)
    {
        float _830 = in.m_55.x;
        _824 = _830;
    }
    float _832 = _824;
    float _834 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].y, _812);
    float _836 = fma(_770, _592, _782);
    int _838 = abs(_822);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _844 = fma(_814, _592, _834);
    float _846 = rsqrt(_816);
    float _848 = float(_838);
    float _850 = in.m_57.y;
    float _852 = float(_658);
    float _854 = _836 * 0.15915493667125701904296875;
    float _856 = _844 * 0.15915493667125701904296875;
    float _858 = _842 * _798;
    float _860 = _848 * _852;
    float _862 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _864 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _866 = _854 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = _860 * (-2.0);
    float _872 = _798;
    if (_672)
    {
        float _874 = in.m_55.z;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = fma(_870, _722, _722);
    float _880 = fma(_864, _870, _864);
    float _882 = _862 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _884 = _854 * 6.283185482025146484375;
    float _886 = cos(_884);
    float _888 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[196].z, _878);
    if (_664)
    {
        bool _890 = _832 > 0.5;
        _640 = _890;
    }
    bool _892 = _640;
    float _894 = _882 * _846;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _898 = _414 + _896;
    float _900 = fma(_880, _592, _888);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _902;
    float _906 = _780 * _894;
    float _908 = _856 * 6.283185482025146484375;
    float _910 = sin(_908);
    float _912 = _900 * 0.15915493667125701904296875;
    float _914 = _794 * _894;
    float _916 = -_906;
    float _918 = _780 + _916;
    float _920 = _804 * _894;
    float _922 = fma(_762, _898, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _924 = -_914;
    float _926 = _794 + _924;
    float _928 = _918 * _918;
    float _930 = _856 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = -_850;
    float _936 = _934 + 1.0;
    float _938 = _904 * _818;
    float _940 = fma(_926, _926, _928);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _944 = _414 + _942;
    float _946 = in.m_63.x;
    float _948 = in.m_63.y;
    float _950 = in.m_63.z;
    int _952 = _704 ? as_type<int>(_936) : as_type<int>(_850);
    float _954 = _912 * 6.283185482025146484375;
    float _956 = cos(_954);
    float _958 = -_920;
    float _960 = _804 + _958;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _964 = _414 + _962;
    float _966 = _850;
    float _968 = _960;
    if (_672)
    {
        bool _970 = _876 > 0.5;
        _826 = _970;
    }
    bool _972 = _826;
    float _974 = fma(_858, _944, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _976 = fma(_960, _960, _940);
    float _978 = fma(_938, _964, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _980 = _868 * _910;
    float _982 = _912 * 6.283185482025146484375;
    float _984 = sin(_982);
    float _986 = _678 ? as_type<float>(_952) : _850;
    float _988 = _868 * _932;
    float _990 = _886 * _910;
    if (_684)
    {
        float _992 = _694 ? _936 : _850;
        _966 = _992;
    }
    float _994 = _966;
    float _996 = sqrt(_976);
    float _998 = _886 * _932;
    float _1000 = _868 * _956;
    float _1002 = _932 * _956;
    float _1004 = _886 * _956;
    float _1006 = _910 * _956;
    int _1008 = as_type<int>(_950);
    if (!_664)
    {
        _968 = _428;
    }
    float _1010 = _968;
    float _1012 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _948);
    float _1014 = fma(_984, _998, _980);
    float _1016 = fma(_984, _980, _998);
    float _1018 = _1010;
    if (!_664)
    {
        _828 = _1010;
    }
    float _1020 = _828;
    float _1022 = fma(_488, _994, -0.5);
    float _1024 = _1020;
    if (_664)
    {
        _1018 = _428;
    }
    float _1026 = _1018;
    float _1028 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _946);
    bool _1030 = _948 != 0.0;
    bool _1032 = isnan(_948);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan(0.0);
    bool _1038 = _1034 || _1036;
    float _1040 = _846 * _996;
    float _1042 = -_990;
    float _1044 = fma(_984, _988, _1042);
    float _1046 = -_988;
    float _1048 = fma(_984, _990, _1046);
    bool _1050 = _946 == 0.0;
    bool _1052 = !_1038;
    bool _1054 = _1050 && _1052;
    float _1056 = _748 * _1040;
    float _1058 = _862 * _1040;
    float _1060 = _750 * _1040;
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _950);
    float _1064 = _1056 * _1012;
    float _1066 = _1058 * _1028;
    bool _1068 = _950 == 0.0;
    bool _1070 = _1068 && _1054;
    float _1072 = _1060 * _1062;
    float _1074 = _1004 * _1064;
    float _1076 = -_1064;
    float _1078 = _984 * _1076;
    float _1080 = _1000 * _1064;
    int _1082 = 0;
    float _1084 = _1026;
    if (_664)
    {
        float _1086 = -_1026;
        float _1088 = _1086 + 1.0;
        _1082 = as_type<int>(_1088);
    }
    int _1090 = _1082;
    float _1092 = fma(_1014, _1066, _1074);
    float _1094 = fma(_1002, _1066, _1078);
    float _1096 = fma(_1044, _1066, _1080);
    bool _1098 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1100 = isnan(_414);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = fma(_1048, _1072, _1092);
    float _1112 = fma(_1006, _1072, _1094);
    float _1114 = fma(_1016, _1072, _1096);
    bool _1116 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1118 = isnan(_414);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1124 = _1120 || _1122;
    float _1126 = float(_1124);
    float _1128 = in.m_65.x;
    float _1130 = in.m_65.y;
    float _1132 = in.m_65.z;
    float _1134 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1136 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1138 = -_1108;
    float _1140 = _1138 + 1.0;
    bool _1142 = _414 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1144 = isnan(_414);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1134);
    float _1156 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1136);
    float _1158 = -_1126;
    float _1160 = _1158 + 1.0;
    float _1162 = _1126 * _1140;
    float _1164 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1154);
    float _1166 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1156);
    float _1168 = _1152 * _1160;
    float _1170 = -_1152;
    float _1172 = _1170 + 1.0;
    float _1174 = _784 + _1164;
    float _1176 = _790 + _1166;
    float _1178 = _1174;
    float _1180 = _1176;
    if (_664)
    {
        float _1182 = _892 ? as_type<float>(_1090) : _1026;
        _1024 = _1182;
    }
    float _1184 = _1024;
    float _1186 = _474 * _1172;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1190 = _1174 + _1188;
    float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1194 = _1176 + _1192;
    float _1196 = _596 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1198 = _922 * _1186;
    float _1200 = _1190 * _1190;
    float _1202 = _1194 * _1194;
    float _1204 = _626 * _1022;
    float _1206 = _1128;
    float _1208 = _1130;
    float _1210 = _1132;
    float _1212 = _1200;
    float _1214 = _1202;
    if (!_1070)
    {
        float _1216 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1128);
        _1206 = _1216;
    }
    float _1218 = _1206;
    float _1220 = _1218;
    if (!_1070)
    {
        float _1222 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1130);
        _1208 = _1222;
    }
    float _1224 = _1208;
    float _1226 = _1200 + _1202;
    float _1228 = fma(_1196, _1184, -0.5);
    float _1230 = _668 * _1022;
    if (!_1070)
    {
        float _1232 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1132);
        _1210 = _1232;
    }
    float _1234 = _1210;
    float _1236 = sqrt(_1226);
    if (_672)
    {
        float _1238 = -_1026;
        float _1240 = _1238 + 1.0;
        _1008 = as_type<int>(_1240);
    }
    int _1242 = _1008;
    float _1244 = -_1204;
    float _1246 = fma(_668, _1228, _1244);
    float _1248 = fma(_626, _1228, _1230);
    float _1250 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1252 = -_474;
    float _1254 = _1252 + 1.0;
    if (_672)
    {
        float _1256 = _972 ? as_type<float>(_1242) : _1026;
        _1084 = _1256;
    }
    float _1258 = _1084;
    float _1260 = -_1224;
    float _1262 = _984 * _1260;
    float _1264 = fma(_1112, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1250);
    float _1266 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1198);
    float _1268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1270 = _1004 * _1224;
    float _1272 = fma(_1114, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1264);
    float _1274 = fma(_974, _1168, _1266);
    float _1276 = _1000 * _1224;
    float _1278 = fma(_1002, _1218, _1262);
    bool _1280 = _1236 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1282 = _768 + _1272;
    float _1284 = fma(_978, _1162, _1274);
    float _1286 = fma(_1014, _1218, _1270);
    float _1288 = fma(_1044, _1218, _1276);
    float _1290 = fma(_588, _1246, _500);
    float _1292 = -_566;
    float _1294 = fma(_568, _1248, _1292);
    float _1296 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1284);
    if (!_1280)
    {
        _1220 = _1282;
    }
    float _1298 = _1220;
    bool _1300 = !_1280;
    float _1302 = _1298;
    if (!_1300)
    {
        float _1304 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1308 = _1236 + _1306;
        float _1310 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = rsqrt(_1226);
        float _1314 = _1308 * _1304;
        float _1316 = _1314 * 0.15915493667125701904296875;
        float _1318 = _1316 * 6.283185482025146484375;
        float _1320 = sin(_1318);
        float _1322 = _1316 * 6.283185482025146484375;
        float _1324 = cos(_1322);
        float _1326 = fma(_1320, _1310, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1328 = _1312 * _1326;
        float _1330 = fma(_1190, _1328, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1332 = _1324 + (-1.0);
        float _1334 = fma(_1194, _1328, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1338 = _1330 + _1336;
        float _1340 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1344 = _1334 + _1342;
        float _1346 = _1338 * _1338;
        float _1348 = fma(_1282, _1324, _1340);
        float _1350 = _1344 * _1344;
        _1302 = _1348;
        _1212 = _1346;
        _1214 = _1350;
        _1178 = _1330;
        _1180 = _1334;
    }
    float _1352 = _1302;
    float _1354 = _1212;
    float _1356 = _1214;
    float _1358 = _1178;
    float _1360 = _1180;
    float _1362 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1366 = _1352 + _1364;
    float _1368 = fma(_1048, _1234, _1286);
    float _1370 = fma(_1006, _1234, _1278);
    float _1372 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1374 = fma(_1366, _1366, _1354);
    float _1376 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1378 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1380 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1382 = _1374 + _1356;
    float _1384 = fma(_1016, _1234, _1288);
    float _1386 = _986 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1388 = fma(_1370, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1376);
    float _1390 = fma(_1370, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1378);
    float _1392 = fma(_1370, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1380);
    float _1394 = _1372 * _1362;
    float _1396 = sqrt(_1382);
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1408 = _1386 * _1268;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1412 = fma(_1384, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1388);
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1416 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1420 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1296 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1430 = _1290 + 0.5;
    float _1432 = _1294 + 0.5;
    float _1434 = fma(_1384, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1390);
    float _1436 = fma(_1384, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1392);
    out.m_67.x = _1422;
    out.m_67.y = _1424;
    out.m_67.z = _1426;
    out.m_67.w = _1414;
    bool _1438 = _1396 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1440 = isnan(_1396);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1446 = _1442 || _1444;
    out.m_69.x = _1416;
    out.m_69.y = _1418;
    out.m_69.z = _1420;
    out.m_69.w = _1428;
    out.m_71.x = _1430;
    out.m_71.y = _1432;
    out.m_71.z = _1394;
    out.m_71.w = _1408;
    out.m_73.x = _1412;
    out.m_73.y = _1434;
    out.m_73.z = _1436;
    float _1448 = _1390;
    float _1450 = _1418;
    float _1452 = _1428;
    float _1454 = _1420;
    if (!_1446)
    {
        _1448 = 1.0;
    }
    float _1456 = _1448;
    bool _1458 = !_1446;
    float _1460 = _1456;
    if (!_1458)
    {
        bool _1462 = _1396 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1464 = isnan(_1396);
        bool _1466 = _1462 || _1464;
        bool _1468 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1470 = _1466 || _1468;
        if (!_1470)
        {
            float _1472 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1474 = _1396 + _1472;
            float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1478 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1476;
            float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1482 = _1480 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1484 = 1.0 / _1478;
            float _1486 = _1474 * _1484;
            float _1488 = fma(_1486, _1482, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1460 = _1488;
            _1490 = true;
        }
        else
        {
            bool _1492 = _1396 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1494 = isnan(_1396);
            bool _1496 = _1492 || _1494;
            bool _1498 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1500 = _1496 || _1498;
            if (!_1500)
            {
                float _1502 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1504 = _1396 + _1502;
                float _1506 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1508 = _1506 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1512 = _1510 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1514 = 1.0 / _1508;
                float _1516 = _1504 * _1514;
                float _1518 = fma(_1516, _1512, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1460 = _1518;
                _1490 = true;
            }
            else
            {
                _1460 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1490 = false;
    float _1520 = _1460;
    float _1522 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1524 = _1352 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1528 = _1358 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1532 = _1360 + _1530;
    float _1534 = -_914;
    float _1536 = _784 + _1534;
    float _1538 = fma(_1524, _1520, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1540 = fma(_1528, _1520, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1542 = fma(_1532, _1520, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1544 = -_906;
    float _1546 = _1544 + _1538;
    float _1548 = -_914;
    float _1550 = _1548 + _1540;
    float _1552 = -_920;
    float _1554 = _1552 + _1542;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1558 = _1546 + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1562 = _1550 + _1560;
    float _1564 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1566 = _1554 + _1564;
    float _1568 = _1558 * _1558;
    float _1570 = fma(_1536, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1572 = fma(_1562, _1562, _1568);
    float _1574 = fma(_1566, _1566, _1572);
    float _1576 = rsqrt(_1574);
    float _1578 = sqrt(_1574);
    float _1580 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1582 = _1562 * _1580;
    float _1584 = _1566 * _1580;
    float _1586 = _1582 * _1582;
    float _1588 = _1584 * _1584;
    float _1590 = _1586 + _1588;
    float _1592 = sqrt(_1590);
    bool _1594 = _1592 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1598 = _1592 + _1596;
    float _1600 = _1426;
    float _1602 = _1598;
    float _1604 = _1566;
    float _1606 = _1558;
    float _1608 = _1562;
    if (_1594)
    {
        float _1610 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1610;
    }
    float _1612 = _1600;
    if (_1594)
    {
        float _1614 = rsqrt(_1590);
        _1450 = _1614;
    }
    float _1616 = _1450;
    float _1618 = _1616;
    if (_1594)
    {
        float _1620 = _1598 * _1612;
        _1602 = _1620;
    }
    float _1622 = _1602;
    if (_1594)
    {
        float _1624 = _1622 * 0.15915493667125701904296875;
        _1452 = _1624;
    }
    float _1626 = _1452;
    float _1628 = _1416;
    float _1630 = _1626;
    if (_1594)
    {
        float _1632 = _1626 * 6.283185482025146484375;
        float _1634 = sin(_1632);
        _1628 = _1634;
    }
    float _1636 = _1628;
    float _1638 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1640 = precise::max(0.0, _1638);
    float _1642 = _1414;
    float _1644 = _1638;
    float _1646 = _1640;
    if (_1594)
    {
        float _1648 = _1626 * 6.283185482025146484375;
        float _1650 = cos(_1648);
        _1642 = _1650;
    }
    float _1652 = _1642;
    float _1654 = -_1580;
    float _1656 = -_1640;
    float _1658 = fma(_1558, _1654, _1656);
    if (_1594)
    {
        float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1644 = _1660;
    }
    float _1662 = _1644;
    float _1664 = _1636;
    float _1666 = _1662;
    if (_1594)
    {
        float _1668 = fma(_1636, _1662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1454 = _1668;
    }
    float _1670 = _1454;
    float _1672 = _1670;
    if (!_1594)
    {
        _1664 = _1658;
    }
    float _1674 = _1664;
    float _1676 = _1674;
    if (!_1594)
    {
        _1666 = _1586;
    }
    float _1678 = _1666;
    float _1680 = _1652;
    float _1682 = _1678;
    if (_1594)
    {
        float _1684 = _1652 + (-1.0);
        _1646 = _1684;
    }
    float _1686 = _1646;
    float _1688 = _1686;
    if (_1594)
    {
        float _1690 = _1616 * _1670;
        _1630 = _1690;
    }
    float _1692 = _1630;
    if (!_1594)
    {
        _1618 = _1582;
    }
    float _1694 = _1618;
    float _1696 = _1694;
    if (_1594)
    {
        float _1698 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1688 = _1698;
    }
    float _1700 = _1688;
    if (_1594)
    {
        float _1702 = _1582 * _1692;
        _1696 = _1702;
    }
    float _1704 = _1696;
    if (!_1594)
    {
        _1672 = _1588;
    }
    float _1706 = _1672;
    float _1708 = _1706;
    if (_1594)
    {
        float _1710 = fma(_1658, _1652, _1700);
        _1676 = _1710;
    }
    float _1712 = _1676;
    if (!_1594)
    {
        _1680 = _1584;
    }
    float _1714 = _1680;
    float _1716 = _1714;
    if (_1594)
    {
        float _1718 = _1584 * _1692;
        _1716 = _1718;
    }
    float _1720 = _1716;
    if (_1594)
    {
        float _1722 = _1704 * _1704;
        _1682 = _1722;
    }
    float _1724 = _1682;
    float _1726 = floor(_1570);
    if (_1594)
    {
        float _1728 = _1720 * _1720;
        _1708 = _1728;
    }
    float _1730 = _1708;
    float _1732 = fma(_1712, _1712, _1724);
    float _1734 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1738 = fma(_1578, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1736);
    float _1740 = precise::clamp(_1738, 0.0, 1.0);
    float _1742 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1744 = _1732 + _1730;
    float _1746 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1734);
    float _1748 = -_1740;
    float _1750 = _1748 + 1.0;
    float _1752 = -_920;
    float _1754 = _790 + _1752;
    float _1756 = rsqrt(_1744);
    float _1758 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1746);
    float _1760 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1742);
    float _1762 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1764 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1766 = abs(_1750);
    float _1768 = log2(_1766);
    float _1770 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1772 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1774 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1776 = -_1770;
    float _1778 = fma(_1776, _1764, 1.0);
    float _1780 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1782 = _1756 * _1704;
    float _1784 = _1756 * _1720;
    float _1786 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1780);
    float _1788 = _1756 * _1712;
    float _1790 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1772);
    float _1792 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1794 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1786);
    float _1796 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1760);
    float _1798 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1790);
    float _1800 = -_1792;
    float _1802 = fma(_1788, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1800);
    float _1804 = _1794 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1806 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1808 = _1798 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1810 = _1796 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1812 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1814 = -_1784;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1802);
    float _1818 = floor(_1774);
    float _1820 = -_1726;
    float _1822 = _1570 + _1820;
    float _1824 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1812);
    float _1826 = fma(_1816, -0.5, 0.5);
    float _1828 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1830 = fma(_1816, 0.5, 0.5);
    float _1832 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1824);
    float _1834 = exp2(_1806);
    float _1836 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1828);
    float _1838 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1832);
    float _1840 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1842 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1836);
    float _1844 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1840);
    float _1846 = log2(_1778);
    float _1848 = fma(_1830, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1850 = -_1818;
    float _1852 = _1774 + _1850;
    float _1854 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1844);
    float _1856 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1842);
    float _1858 = fma(_1830, _1848, -0.212114393711090087890625);
    float _1860 = 1.0 / _1838;
    float _1862 = sqrt(_1826);
    float _1864 = _1846 * 0.693147182464599609375;
    float2 _5281 = float2(_1822, _1852);
    float _1866 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5281, float2(0.0), isnan(_5281)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5281, float2(0.0), isnan(_5281)), level(0.0)).x;
    float _1868 = fma(_1830, _1858, 1.570728778839111328125);
    float _1870 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1872 = _1856 * _1860;
    float _1874 = _1788 + 1.0;
    float _1876 = fma(_1872, 0.5, 0.5);
    float _1878 = -_1788;
    float _1880 = fma(_1834, _1874, _1878);
    float _1882 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1854);
    float _1884 = _1862 * 0.636619746685028076171875;
    float _1886 = _1882 * _1860;
    float _1888 = -_1868;
    float _1890 = fma(_1884, _1888, 1.0);
    float _1892 = fma(_1880, 0.5, 0.5);
    float _1894 = fma(_1886, -0.5, 0.5);
    float3 _5333 = float3(_1876, _1894, _1870);
    float _1896 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5333, float3(0.0), isnan(_5333)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5333, float3(0.0), isnan(_5333)), level(0.0)).x;
    float3 _5344 = float3(_1876, _1894, _1870);
    float4 _1899 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5344, float3(0.0), isnan(_5344)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5344, float3(0.0), isnan(_5344)), level(0.0)).xyzw;
    float _1901 = _1899.x;
    float _1903 = _1899.y;
    float _1905 = _1899.z;
    float _1907 = _1899.w;
    float2 _5360 = float2(_1890, _1892);
    float3 _1911 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5360, float2(0.0), isnan(_5360)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5360, float2(0.0), isnan(_5360)), level(0.0)).xyz;
    float _1913 = _1911.x;
    float _1915 = _1911.y;
    float _1917 = _1911.z;
    float _1919 = -_906;
    float _1921 = _768 + _1919;
    float _1923 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1925 = _1578 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1927 = isnan(_1578);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1933 = _1929 || _1931;
    float _1935 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1937 = _1921 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1939 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1941 = fma(_1808, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1923);
    float _1943 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1935);
    float _1945 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1937);
    out.m_75.x = _1562;
    out.m_75.y = _1558;
    out.m_75.z = _1566;
    float _1947 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1943);
    float _1949 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1945);
    float _1951 = exp2(_1939);
    float _1953 = _1947 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1955 = _1949 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1957 = _1955 + _1953;
    float _1959 = 1.0 / _1953;
    float _1961 = _1882;
    if (!_1933)
    {
        _1604 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1963 = _1604;
    float _1965 = _1963;
    float _1967 = _1963;
    if (!_1933)
    {
        _1606 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1969 = _1606;
    float _1971 = _1969;
    float _1973 = _1969;
    if (!_1933)
    {
        _1608 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1975 = _1608;
    float _1977 = -_1951;
    float _1979 = _1977 + 1.0;
    float _1981 = _1979 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1983 = _1957 * _1959;
    float _1985 = _1983 * 0.5;
    float _1987 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1989 = fma(_1985, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1987);
    float _1991 = 1.0 / _1989;
    float _1993 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1995 = _1991 * _1993;
    float _1997 = abs(_1995);
    float _1999 = log2(_1997);
    float _2001 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2003 = exp2(_2001);
    float _2005 = fma(_2003, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2007 = precise::clamp(_2005, 0.0, 1.0);
    float _2009 = fma(_2007, -2.0, 3.0);
    float _2011 = _2007 * _2007;
    float _2013 = _2011 * _2009;
    float _2015 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1941);
    float _2017 = in.m_77.x;
    float _2019 = -_2013;
    float _2021 = _2019 + 1.0;
    float _2023 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2015);
    float _2025 = fma(_2021, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2013);
    bool _2027 = _1995 <= 8000.0;
    bool _2029 = isnan(_1995);
    bool _2031 = _2027 || _2029;
    bool _2033 = isnan(8000.0);
    bool _2035 = _2031 || _2033;
    float _2037 = float(_2035);
    float _2039 = _2023 + _1838;
    float _2041 = _2037 * _2025;
    float _2043 = _2039 * 0.5;
    out.gl_Position.x = _1856;
    out.gl_Position.y = _1882;
    out.gl_Position.z = _2023;
    out.gl_Position.w = _1838;
    float _2045 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _2043;
    out.m_79.w = _1838;
    float _2047 = _1856;
    float _2049 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2051 = _1975;
    float _2053 = _1975;
    if (!_1933)
    {
        _2047 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2055 = _2047;
    float _2057 = _2055;
    float _2059 = _2055;
    if (!_1933)
    {
        _1961 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2061 = _1961;
    float _2063 = -_1866;
    float _2065 = _2063 + 1.0;
    float _2067 = _2065 * _2045;
    float _2069 = precise::clamp(_2067, 0.0, 1.0);
    float _2071 = -_2069;
    float _2073 = fma(_2071, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2075 = _2061;
    float _2077 = _2061;
    if (!_1933)
    {
        _2049 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2079 = _2049;
    float _2081 = _2073 * _2017;
    float _2083 = _2081 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_81.x = _2083;
    float _2085 = _1981 * _1896;
    float _2087 = -_1981;
    float _2089 = _2087 + 1.0;
    float _2091 = _1907 * _2085;
    float _2093 = _1917 * _2085;
    float _2095 = _1907 * _2089;
    float _2097 = fma(_1913, _2091, _1901);
    float _2099 = fma(_1915, _2091, _1903);
    float _2101 = fma(_1907, _2093, _1905);
    out.m_83.x = _2097;
    out.m_83.y = _2099;
    out.m_83.z = _2101;
    out.m_83.w = _2095;
    bool _2103 = !_1933;
    float _2105 = _2079;
    float _2107 = _2079;
    if (!_2103)
    {
        bool _2109 = _1578 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2111 = isnan(_1578);
        bool _2113 = _2109 || _2111;
        bool _2115 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2117 = _2113 || _2115;
        if (!_2117)
        {
            float _2119 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2121 = _1578 + _2119;
            float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2125 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2123;
            float _2127 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2129 = _2127 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2131 = 1.0 / _2125;
            float _2133 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2135 = _2133 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2137 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2139 = _2137 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2143 = _2141 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2147 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2149 = _2121 * _2131;
            float _2151 = precise::clamp(_2149, 0.0, 1.0);
            float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2155 = _2153 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2157 = fma(_2151, _2129, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2159 = fma(_2151, _2155, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2161 = fma(_2151, _2135, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2163 = fma(_2151, _2139, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2165 = fma(_2151, _2143, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2167 = fma(_2151, _2147, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2077 = _2161;
            _2053 = _2165;
            _2059 = _2157;
            _1973 = _2163;
            _1967 = _2159;
            _2107 = _2167;
            _2169 = true;
        }
        else
        {
            bool _2171 = _1578 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2173 = isnan(_1578);
            bool _2175 = _2171 || _2173;
            bool _2177 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2179 = _2175 || _2177;
            if (!_2179)
            {
                _2057 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2181 = _2057;
            _2059 = _2181;
            if (!_2179)
            {
                _2075 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2183 = _2075;
            _2077 = _2183;
            if (!_2179)
            {
                _1965 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2185 = _1965;
            _1967 = _2185;
            if (!_2179)
            {
                _1971 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2187 = _1971;
            _1973 = _2187;
            if (!_2179)
            {
                _2051 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2189 = _2051;
            _2053 = _2189;
            if (!_2179)
            {
                _2105 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2191 = _2105;
            bool _2193 = !_2179;
            _2107 = _2191;
            if (!_2193)
            {
                bool _2195 = _1578 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2197 = isnan(_1578);
                bool _2199 = _2195 || _2197;
                bool _2201 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2203 = _2199 || _2201;
                if (!_2203)
                {
                    float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2207 = _1578 + _2205;
                    float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2211 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2209;
                    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2217 = 1.0 / _2211;
                    float _2219 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2221 = _2219 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2225 = _2223 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2227 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2229 = _2227 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2235 = _2207 * _2217;
                    float _2237 = precise::clamp(_2235, 0.0, 1.0);
                    float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2243 = fma(_2237, _2215, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2245 = fma(_2237, _2241, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2247 = fma(_2237, _2221, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2249 = fma(_2237, _2225, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2251 = fma(_2237, _2229, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2253 = fma(_2237, _2233, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2077 = _2247;
                    _2053 = _2251;
                    _2059 = _2243;
                    _1973 = _2249;
                    _1967 = _2245;
                    _2107 = _2253;
                    _2169 = true;
                }
                else
                {
                    _2077 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2053 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2059 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1973 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1967 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2107 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2169 = false;
    float _2255 = _2077;
    float _2257 = _2053;
    float _2259 = _2059;
    float _2261 = _1973;
    float _2263 = _1967;
    float _2265 = _2107;
    float _2267 = fma(_1434, -0.5, 0.5);
    float _2269 = precise::clamp(_2267, 0.0, 1.0);
    float _2271 = -_2255;
    float _2273 = _2271 + _2257;
    float _2275 = -_2259;
    float _2277 = _2275 + _2261;
    float _2279 = -_2263;
    float _2281 = _2279 + _2265;
    bool _2283 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2285 = fma(_2269, _2273, _2255);
    float _2287 = fma(_2269, _2277, _2259);
    float _2289 = fma(_2269, _2281, _2263);
    float _2291 = _2285 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _2293 = fma(_2287, 0.298911988735198974609375, _2291);
    float _2295 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2297 = fma(_2289, 0.114477999508380889892578125, _2293);
    out.m_51.x = _2295;
    float _2299 = -_2297;
    float _2301 = _2287 + _2299;
    float _2303 = -_2297;
    float _2305 = _2285 + _2303;
    float _2307 = -_2297;
    float _2309 = _2289 + _2307;
    float _2311 = fma(_2301, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2297);
    float _2313 = fma(_2305, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2297);
    float _2315 = fma(_2309, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2297);
    out.m_87.x = _2311;
    out.m_87.y = _2313;
    out.m_87.z = _2315;
    if (!_2283)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2317 = -_1546;
    float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2321 = -_1550;
    float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2325 = -_1554;
    float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2329 = _2319 * _2319;
    float _2331 = fma(_2323, _2323, _2329);
    float _2333 = fma(_2327, _2327, _2331);
    float _2335 = sqrt(_2333);
    float _2337 = rsqrt(_2333);
    float _2339 = -_2335;
    float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2343 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = _2323 * _2337;
    float _2349 = _2319 * _2337;
    float _2351 = abs(_2345);
    float _2353 = log2(_2351);
    float _2355 = _2327 * _2337;
    float _2357 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2359 = _1434 * _2349;
    float _2361 = -_2349;
    float _2363 = -_2357;
    float _2365 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2363);
    float _2367 = fma(_1412, _2347, _2359);
    float _2369 = -_2355;
    float _2371 = fma(_2369, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2365);
    float _2373 = fma(_1436, _2355, _2367);
    float _2375 = precise::clamp(_2373, 0.0, 1.0);
    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2379 = _2371 + _2377;
    float _2381 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2383 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2385 = precise::clamp(_2383, 0.0, 1.0);
    float _2387 = exp2(_2381);
    float _2389 = _2387 * _2385;
    float _2391 = _2375 * _2389;
    float _2393 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2395 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2397 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2393;
    out.m_85.y = _2395;
    out.m_85.z = _2397;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

