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
    float4 m_57 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_69 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_61 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_51 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1776 = as_type<float>(_104);
        out.gl_Position.z = _1776;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _96 = _126;
    }
    float _128 = _96;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1846 = as_type<float>(_142);
        out.gl_Position.z = _1846;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _150 = in.m_49.z;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _154 = _152 != 0;
    float _156 = in.m_49.w;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _160 = _158 != 0;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _164 = in.m_51.x;
    float _166 = in.m_51.y;
    float _168 = _148 * _146;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = _144 * 2.0;
    float _178 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _180 = in.m_49.y;
    bool _182 = _150 > 0.5;
    bool _184 = _182 && _154;
    float _186 = _150 * 2.0;
    float _188 = floor(_176);
    bool _190 = _156 > 0.5;
    float _192 = 0.0;
    float _194 = _166;
    if (_154)
    {
        _192 = _164;
    }
    float _196 = _192;
    float _198 = -_166;
    float _200 = _198 + 1.0;
    float _202 = _196;
    if (_184)
    {
        float _204 = -_196;
        float _206 = _204 + 1.0;
        _202 = _206;
    }
    float _208 = _202;
    float _210 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (_160)
    {
        float _212 = _190 ? _200 : _166;
        _194 = _212;
    }
    float _214 = _194;
    bool _216 = _188 > 0.0;
    float _218 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _210);
    bool _220 = _188 >= 0.0;
    bool _222 = isnan(_188);
    bool _224 = _220 || _222;
    bool _226 = isnan(0.0);
    bool _228 = _224 || _226;
    float _230 = _188;
    if (!_154)
    {
        _230 = _164;
    }
    float _232 = _230;
    float _234 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _218);
    int _236 = _228 ? 0 : 1;
    float _238 = floor(_186);
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _242 = _240 != 0;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _246 = _244 != 0;
    float _248 = _234 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _252 = _250 != 0;
    float _254 = _232;
    if (_154)
    {
        _254 = _208;
    }
    float _256 = _254;
    float _258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _260 = _248 + _258;
    int _262 = ~_236;
    int _264 = _262 + 1;
    int _266 = _264 + 1;
    float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _276 = _274 != 0;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _280 = _278 != 0;
    float _282 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _284 = _266;
    float _286 = _256;
    if (!_216)
    {
        int _288 = ~_236;
        int _290 = _288 + 1;
        _284 = _290;
    }
    int _292 = _284;
    float _294 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _296 = !_242;
    float _298 = _296 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _300 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _282);
    float _302 = _162 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _304 = floor(_178);
    float _306 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _294);
    float _308 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _300);
    float _310 = fma(_302, _214, -0.5);
    bool _312 = _238 >= 0.0;
    bool _314 = isnan(_238);
    bool _316 = _312 || _314;
    bool _318 = isnan(0.0);
    bool _320 = _316 || _318;
    float _322 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _306);
    int _324 = abs(as_type<int>(_298));
    float _326 = _308 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _328 = _320 ? 0 : 1;
    float _330 = _322 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _332 = float(_324);
    float _334 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _336 = _326 + _334;
    bool _338 = _238 > 0.0;
    float _340 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _342 = _330 + _340;
    float _344 = _268 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _346 = _298;
    if (!_252)
    {
        _346 = _180;
    }
    float _348 = _346;
    float _350 = -_304;
    float _352 = _178 + _350;
    float _354 = _178 * 6.283185482025146484375;
    float _356 = fma(_344, _256, -0.5);
    float _358 = -_352;
    float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _362 = _354 * 0.15915493667125701904296875;
    float _364 = _348;
    if (_252)
    {
        _364 = _144;
    }
    float _366 = _364;
    float _368 = _144 + _180;
    float _370 = abs(_360);
    float _372 = _332 * _370;
    float _374 = _336 * _336;
    float _376 = _362 * 6.283185482025146484375;
    float _378 = cos(_376);
    float _380 = fma(_342, _342, _374);
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_252)
    {
        _286 = _150;
    }
    float _384 = _286;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _388 = fma(_260, _260, _380);
    float _390 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[83].z, _382);
    float _392 = _384;
    if (_252)
    {
        _392 = _180;
    }
    float _394 = _392;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _398 = _366 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _400 = rsqrt(_388);
    float _402 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[83].w, _396);
    float _404 = -_386;
    float _406 = fma(_398, 2.0, _404);
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _410 = _398;
    if (!_252)
    {
        _410 = _150;
    }
    float _412 = _410;
    float _414 = _368 + (-1.0);
    float _416 = _412;
    if (_252)
    {
        _416 = _180;
    }
    float _418 = _416;
    float _420 = fma(_378, 0.5, 0.5);
    bool _422 = _352 < 0.5;
    float _424 = float(_422);
    float _426 = -_122;
    float _428 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[81].x, _406);
    int _430 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _432 = _430 != 0;
    float _434 = -_420;
    float _436 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _438 = ~_328;
    int _440 = _438 + 1;
    int _442 = _440 + 1;
    float _444 = -_424;
    float _446 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _448 = _442;
    if (!_338)
    {
        int _450 = ~_328;
        int _452 = _450 + 1;
        _448 = _452;
    }
    int _454 = _448;
    float _456 = _418 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _458 = !_432;
    int _460 = _458 ? 0 : 1;
    float _462 = _336 * _400;
    float _464 = in.m_53.x;
    float _466 = in.m_53.y;
    float _468 = in.m_53.z;
    float _470 = fma(_456, -2.0, _408);
    int _472 = abs(_460);
    float _474 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _476 = _336 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _478 = _342 * _400;
    float _480 = -_462;
    float _482 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[18].w, _336);
    float _484 = float(_472);
    float _486 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[28].x, _476);
    float _488 = -_478;
    float _490 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[18].w, _342);
    float _492 = _482 * _482;
    float _494 = _260 * _400;
    float _496 = fma(_260, (*spvDescriptorSet0.vp_c8)._m0[28].z, _486);
    bool _498 = !_246;
    int _500 = _498 ? 0 : 1;
    float _502 = fma(_490, _490, _492);
    float _504 = -_494;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _260);
    float _508 = fma(_484, _436, _372);
    float _510 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _390);
    int _512 = abs(_500);
    float _514 = fma(_506, _506, _502);
    bool _516 = _496 >= 0.0;
    float _518 = fma(_510, _356, _428);
    float _520 = float(_512);
    float _522 = sqrt(_514);
    float _524 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _402);
    float _526 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _470);
    float _528 = _150 + _180;
    float _530 = abs(_446);
    float _532 = fma(_520, _530, _508);
    float _534 = _466 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _536 = -_526;
    float _538 = fma(_524, _310, _536);
    float _540 = _528 + (-1.0);
    float _542 = _532 * _534;
    float _544 = _510;
    int _546 = as_type<int>(_534);
    if (_516)
    {
        _544 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _548 = _544;
    float _550 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _552 = log2(_550);
    float _554 = _518 + 0.5;
    float _556 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _558 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _560 = _538 + 0.5;
    float _562 = _400 * _522;
    if (_516)
    {
        float _564 = _548 * 5.0;
        _546 = as_type<int>(_564);
    }
    int _566 = _546;
    if (_516)
    {
        out.m_45.x = 0.0;
    }
    float _568 = _556 * _562;
    bool _570 = !_276;
    int _572 = _570 ? 0 : 1;
    float _574 = _180 * 2.0;
    out.m_55.z = _554;
    out.m_55.w = _560;
    bool _576 = !_280;
    int _578 = _576 ? 0 : 1;
    bool _580 = !_272;
    int _582 = _580 ? 0 : 1;
    if (_516)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2546 = as_type<float>(_566);
        out.gl_Position.z = _2546;
    }
    out.m_57.y = _568;
    if (_516)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _584 = -_462;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _326);
    float _588 = _552 * _122;
    float _590 = -_478;
    float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[18].w, _330);
    int _594 = abs(_582);
    float _596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _598 = _586 + _596;
    float _600 = floor(_574);
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _604 = _592 + _602;
    float _606 = _598 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _608 = float(_594);
    float _610 = in.m_59.x;
    float _612 = in.m_59.y;
    float _614 = in.m_59.z;
    float _616 = float(_454);
    float _618 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[28].x, _606);
    float _620 = exp2(_588);
    float _622 = -_494;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _248);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _628 = 1.0 + _626;
    bool _630 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _632 = isnan(1.0);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _638 = _634 || _636;
    float _640 = _608 * _616;
    float _642 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _644 = _624 + _642;
    bool _646 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _654 = _650 || _652;
    float _656 = _144 + (-0.5);
    float _658 = 1.0 / _628;
    float _660 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[28].z, _618);
    bool _662 = _600 > 0.0;
    bool _664 = _600 >= 0.0;
    bool _666 = isnan(_600);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    int _674 = abs(_572);
    float _676 = _640 * (-2.0);
    float _678 = -_620;
    float _680 = _678 + 1.0;
    bool _682 = _660 >= 0.0;
    float _684 = float(_674);
    float _686 = fma(_474, _676, _474);
    float _688 = _654 ? _680 : 0.0;
    float _690 = fma(_676, _610, _610);
    float _692 = float(_292);
    float _694 = _672 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _696 = _694;
    int _698 = as_type<int>(_686);
    if (_638)
    {
        float _700 = _688 * _658;
        _124 = _700;
    }
    float _702 = _124;
    float _704 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[196].x, _690);
    float _706 = _684 * _692;
    int _708 = ~as_type<int>(_694);
    int _710 = _708 + 1;
    int _712 = _710 + 1;
    int _714 = _712;
    if (_682)
    {
        out.m_45.x = 0.0;
    }
    if (!_662)
    {
        int _716 = ~as_type<int>(_694);
        int _718 = _716 + 1;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = fma(_686, _702, _704);
    if (_682)
    {
        _696 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _724 = _696;
    float _726 = _706 * (-2.0);
    int _728 = abs(_578);
    float _730 = _722 * 0.15915493667125701904296875;
    if (_682)
    {
        float _732 = _724 * 5.0;
        _698 = as_type<int>(_732);
    }
    int _734 = _698;
    float _736 = fma(_558, _726, _558);
    float _738 = fma(_726, _612, _612);
    float _740 = _730 * 6.283185482025146484375;
    float _742 = sin(_740);
    if (_682)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2788 = as_type<float>(_734);
        out.gl_Position.z = _2788;
    }
    if (_682)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _744 = -_326;
    float _746 = _744 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _748 = -_330;
    float _750 = _748 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _752 = float(_728);
    float _754 = _180 + (-0.5);
    float _756 = _746 * _746;
    float _758 = float(_720);
    float _760 = -_248;
    float _762 = _760 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _764 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[196].y, _738);
    float _766 = fma(_750, _750, _756);
    float _768 = _144 + _150;
    float _770 = _752 * _758;
    float _772 = fma(_736, _702, _764);
    float _774 = fma(_762, _762, _766);
    float _776 = _768 + (-1.0);
    float _778 = _770 * (-2.0);
    float _780 = _772 * 0.15915493667125701904296875;
    float _782 = _150 + (-0.5);
    float _784 = rsqrt(_774);
    float _786 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _788 = fma(_778, _614, _614);
    float _790 = _464 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _792 = _468 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _794 = fma(_786, _778, _786);
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[196].z, _788);
    float _798 = _532 * _790;
    float _800 = _532 * _792;
    float _802 = _780 * 6.283185482025146484375;
    float _804 = sin(_802);
    float _806 = fma(_794, _702, _796);
    float _808 = in.m_61.x;
    float _810 = in.m_61.y;
    float _812 = in.m_61.z;
    float _814 = _798 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _816 = _806 * 0.15915493667125701904296875;
    float _818 = _750 * _784;
    float _820 = _762 * _784;
    float _822 = _746 * _784;
    float _824 = _780 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _830 = _818 * _828;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _834 = _820 * _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _838 = _822 * _836;
    float _840 = _800 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _844 = -_830;
    float _846 = fma(_820, _842, _844);
    float _848 = _814 * _562;
    float _850 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _852 = -_838;
    float _854 = fma(_818, _850, _852);
    float _856 = _730 * 6.283185482025146484375;
    float _858 = cos(_856);
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _862 = -_834;
    float _864 = fma(_822, _860, _862);
    float _866 = _846 * _846;
    float _868 = _840 * _562;
    float _870 = _742 * _804;
    float _872 = fma(_864, _864, _866);
    float _874 = _816 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _810);
    float _880 = fma(_854, _854, _872);
    float _882 = _742 * _826;
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _812);
    float _886 = _568 * _878;
    float _888 = _816 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = _858 * _826;
    float _894 = _858 * _804;
    float _896 = _868 * _884;
    float _898 = rsqrt(_880);
    float _900 = fma(_876, _892, _870);
    float _902 = fma(_876, _870, _892);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _808);
    float _906 = -_894;
    float _908 = fma(_876, _882, _906);
    float _910 = -_882;
    float _912 = fma(_876, _894, _910);
    float _914 = -_886;
    float _916 = _876 * _914;
    float _918 = _848 * _904;
    float _920 = _890 * _886;
    float _922 = _826 * _890;
    float _924 = _804 * _890;
    float _926 = _858 * _920;
    float _928 = _742 * _920;
    float _930 = fma(_922, _918, _916);
    float _932 = _854 * _898;
    float _934 = fma(_900, _918, _926);
    float _936 = _864 * _898;
    float _938 = _846 * _898;
    float _940 = _818 * _932;
    float _942 = fma(_908, _918, _928);
    float _944 = fma(_912, _896, _934);
    float _946 = _820 * _938;
    float _948 = -_940;
    float _950 = fma(_820, _936, _948);
    float _952 = fma(_924, _896, _930);
    float _954 = _822 * _936;
    float _956 = -_946;
    float _958 = fma(_822, _932, _956);
    float _960 = _950 * _944;
    float _962 = fma(_902, _896, _942);
    float _964 = -_954;
    float _966 = fma(_818, _938, _964);
    float _968 = _958 * _944;
    float _970 = fma(_938, _952, _960);
    float _972 = _966 * _944;
    float _974 = fma(_936, _952, _968);
    float _976 = fma(_822, _962, _970);
    float _978 = fma(_932, _952, _972);
    float _980 = fma(_818, _962, _974);
    float _982 = _976 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 0.449999988079071044921875;
    float _986 = fma(_820, _962, _978);
    float _988 = _326 + _976;
    float _990 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[8].x, _982);
    float _992 = _330 + _980;
    float _994 = fma(_986, (*spvDescriptorSet0.vp_c10)._m0[10].x, _990);
    float _996 = _248 + _986;
    float _998 = _994 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[10].x, _996);
    float _1002 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[8].x, _992);
    float _1004 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[9].x, _988);
    float _1006 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1000);
    float _1008 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1002);
    float _1010 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1004);
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1014 = _1006 + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1018 = _1008 + _1016;
    float _1020 = _1014 * _1014;
    float _1022 = fma(_1018, _1018, _1020);
    float _1024 = sqrt(_1022);
    bool _1026 = _1024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1028 = _1004;
    float _1030 = _1008;
    float _1032 = _1006;
    if (!_1026)
    {
        _1028 = _1010;
    }
    float _1034 = _1028;
    bool _1036 = !_1026;
    float _1038 = _1034;
    if (!_1036)
    {
        float _1040 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1042 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1044 = _1024 + _1042;
        float _1046 = rsqrt(_1022);
        float _1048 = _1044 * _1040;
        float _1050 = _1010 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = _1048 * 0.15915493667125701904296875;
        float _1054 = _1052 * 6.283185482025146484375;
        float _1056 = cos(_1054);
        float _1058 = _1052 * 6.283185482025146484375;
        float _1060 = sin(_1058);
        float _1062 = _1056 + (-1.0);
        float _1064 = _1062 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1066 = fma(_1060, _1050, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1068 = fma(_1010, _1056, _1064);
        float _1070 = _1046 * _1066;
        float _1072 = fma(_1018, _1070, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1074 = fma(_1014, _1070, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1038 = _1068;
        _1030 = _1072;
        _1032 = _1074;
    }
    float _1076 = _1038;
    float _1078 = _1030;
    float _1080 = _1032;
    float _1082 = -_326;
    float _1084 = _1082 + _1076;
    float _1086 = -_330;
    float _1088 = _1086 + _1078;
    float _1090 = -_248;
    float _1092 = _1090 + _1080;
    float _1094 = _1084 * _1084;
    float _1096 = fma(_1088, _1088, _1094);
    float _1098 = in.m_63.x;
    float _1100 = in.m_63.y;
    float _1102 = in.m_63.z;
    float _1104 = fma(_1092, _1092, _1096);
    float _1106 = sqrt(_1104);
    bool _1108 = _1106 > 0.0;
    float _1110 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1112 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1114 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1116 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1110);
    float _1118 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1112);
    float _1120 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1114);
    float _1122 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1116);
    float _1124 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1118);
    float _1126 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1120);
    float _1128 = _1102;
    float _1130 = _1098;
    float _1132 = _1078;
    float _1134 = _1126;
    if (!_1108)
    {
        _1128 = _1076;
    }
    float _1136 = _1128;
    float _1138 = _1136;
    if (!_1108)
    {
        _1130 = _1080;
    }
    float _1140 = _1130;
    bool _1142 = !_1108;
    float _1144 = _1140;
    if (!_1142)
    {
        float _1146 = _1124 * _1124;
        float _1148 = fma(_1122, _1122, _1146);
        float _1150 = rsqrt(_1104);
        float _1152 = fma(_1126, _1126, _1148);
        float _1154 = sqrt(_1152);
        float _1156 = _1088 * _1150;
        float _1158 = _1084 * _1150;
        float _1160 = _1092 * _1150;
        bool _1162 = _1154 > 0.0;
        float _1164 = _1154;
        float _1166 = _1150;
        if (!_1162)
        {
            _1164 = _1076;
        }
        float _1168 = _1164;
        _1138 = _1168;
        if (!_1162)
        {
            _1166 = _1080;
        }
        float _1170 = _1166;
        bool _1172 = !_1162;
        _1144 = _1170;
        if (!_1172)
        {
            float _1174 = rsqrt(_1152);
            float _1176 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1178 = _1124 * _1174;
            float _1180 = _1122 * _1174;
            float _1182 = _1158 * _1178;
            float _1184 = _1126 * _1174;
            float _1186 = fma(_1156, _1180, _1182);
            float _1188 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1190 = fma(_1160, _1184, _1186);
            float _1192 = _1190 * _1188;
            float _1194 = fma(_1122, _1192, _1078);
            float _1196 = fma(_1124, _1192, _1076);
            float _1198 = fma(_1126, _1192, _1080);
            _1138 = _1196;
            _1132 = _1194;
            _1144 = _1198;
        }
    }
    float _1200 = _1138;
    float _1202 = _1132;
    float _1204 = _1144;
    float _1206 = -_462;
    float _1208 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1200);
    float _1210 = -_478;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1202);
    float _1214 = -_494;
    float _1216 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1204);
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1220 = _1208 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1224 = _1212 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1216 + _1226;
    float _1230 = _1220 * _1220;
    float _1232 = fma(_1224, _1224, _1230);
    float _1234 = fma(_1228, _1228, _1232);
    float _1236 = rsqrt(_1234);
    float _1238 = sqrt(_1234);
    float _1240 = _1236 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1242 = _1224 * _1240;
    float _1244 = _1228 * _1240;
    float _1246 = _1242 * _1242;
    float _1248 = _1244 * _1244;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1252 = fma(_1238, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1250);
    float _1254 = precise::clamp(_1252, 0.0, 1.0);
    float _1256 = _1246 + _1248;
    float _1258 = sqrt(_1256);
    bool _1260 = _1258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = _1258 + _1262;
    float _1266 = _1232;
    float _1268 = _1256;
    float _1270 = _1264;
    float _1272 = _1220;
    float _1274 = _1240;
    if (_1260)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1276;
    }
    float _1278 = _1266;
    if (_1260)
    {
        float _1280 = rsqrt(_1256);
        _1268 = _1280;
    }
    float _1282 = _1268;
    float _1284 = _1278;
    if (_1260)
    {
        float _1286 = _1264 * _1278;
        _1270 = _1286;
    }
    float _1288 = _1270;
    if (_1260)
    {
        float _1290 = _1288 * 0.15915493667125701904296875;
        _1134 = _1290;
    }
    float _1292 = _1134;
    float _1294 = _1236;
    if (_1260)
    {
        float _1296 = _1292 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        _1294 = _1298;
    }
    float _1300 = _1294;
    float _1302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1304 = precise::max(0.0, _1302);
    float _1306 = _1228;
    float _1308 = _1304;
    if (_1260)
    {
        float _1310 = _1292 * 6.283185482025146484375;
        float _1312 = cos(_1310);
        _1306 = _1312;
    }
    float _1314 = _1306;
    float _1316 = -_1240;
    float _1318 = -_1304;
    float _1320 = fma(_1220, _1316, _1318);
    if (_1260)
    {
        float _1322 = _1320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1272 = _1322;
    }
    float _1324 = _1272;
    float _1326 = _1300;
    float _1328 = _1324;
    if (_1260)
    {
        float _1330 = fma(_1300, _1324, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1274 = _1330;
    }
    float _1332 = _1274;
    float _1334 = _1332;
    if (!_1260)
    {
        _1326 = _1242;
    }
    float _1336 = _1326;
    float _1338 = _1336;
    if (!_1260)
    {
        _1328 = _1320;
    }
    float _1340 = _1328;
    float _1342 = _1340;
    float _1344 = _1314;
    if (_1260)
    {
        float _1346 = _1314 + (-1.0);
        _1308 = _1346;
    }
    float _1348 = _1308;
    float _1350 = _1348;
    if (_1260)
    {
        float _1352 = _1282 * _1332;
        _1334 = _1352;
    }
    float _1354 = _1334;
    float _1356 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1260)
    {
        float _1358 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1284 = _1358;
    }
    float _1360 = _1284;
    float _1362 = _1360;
    if (_1260)
    {
        float _1364 = _1242 * _1354;
        _1338 = _1364;
    }
    float _1366 = _1338;
    if (!_1260)
    {
        _1350 = _1244;
    }
    float _1368 = _1350;
    float _1370 = _1368;
    if (_1260)
    {
        float _1372 = _1244 * _1354;
        _1370 = _1372;
    }
    float _1374 = _1370;
    if (_1260)
    {
        float _1376 = fma(_1320, _1314, _1360);
        _1342 = _1376;
    }
    float _1378 = _1342;
    if (!_1260)
    {
        _1344 = _1246;
    }
    float _1380 = _1344;
    float _1382 = _1380;
    if (_1260)
    {
        float _1384 = _1366 * _1366;
        _1382 = _1384;
    }
    float _1386 = _1382;
    float _1388 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1260)
    {
        _1362 = _1248;
    }
    float _1390 = _1362;
    float _1392 = _1390;
    if (_1260)
    {
        float _1394 = _1374 * _1374;
        _1392 = _1394;
    }
    float _1396 = _1392;
    float _1398 = fma(_1378, _1378, _1386);
    float _1400 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1402 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1388);
    float _1404 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1406 = _1398 + _1396;
    float _1408 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1356);
    float _1410 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1402);
    float _1412 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1400);
    float _1414 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1404);
    float _1416 = rsqrt(_1406);
    float _1418 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1408);
    float _1420 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1422 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1424 = -_1254;
    float _1426 = _1424 + 1.0;
    float _1428 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1430 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1412);
    float _1432 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1434 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1414);
    float _1436 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1438 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1432);
    float _1440 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1442 = abs(_1426);
    float _1444 = log2(_1442);
    float _1446 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1448 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1438);
    float _1450 = _1416 * _1366;
    float _1452 = _1416 * _1374;
    float _1454 = -_1446;
    float _1456 = fma(_1454, _1422, 1.0);
    float _1458 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1448);
    float _1460 = _1416 * _1378;
    float _1462 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1464 = log2(_1456);
    float _1466 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1468 = -_1462;
    float _1470 = fma(_1460, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1468);
    float _1472 = -_1452;
    float _1474 = fma(_1472, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1470);
    float _1476 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1478 = 1.0 / _1458;
    float _1480 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1482 = fma(_1474, -0.5, 0.5);
    float _1484 = fma(_1474, 0.5, 0.5);
    float _1486 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1466);
    float _1488 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1480);
    float _1490 = _1460 + 1.0;
    float _1492 = fma(_1484, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1494 = exp2(_1476);
    float _1496 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1488);
    float _1498 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1486);
    float _1500 = fma(_1484, _1492, -0.212114393711090087890625);
    float _1502 = _1464 * 0.693147182464599609375;
    float _1504 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1496);
    float _1506 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1498);
    float _1508 = fma(_1484, _1500, 1.570728778839111328125);
    float _1510 = sqrt(_1482);
    float _1512 = _1504 * _1478;
    float _1514 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1516 = fma(_1512, 0.5, 0.5);
    float _1518 = -_1460;
    float _1520 = fma(_1494, _1490, _1518);
    float _1522 = _1506 * _1478;
    float _1524 = fma(_1520, 0.5, 0.5);
    float _1526 = fma(_1522, -0.5, 0.5);
    float _1528 = _1510 * 0.636619746685028076171875;
    float _1530 = -_1508;
    float _1532 = fma(_1528, _1530, 1.0);
    float3 _4079 = float3(_1516, _1526, _1514);
    float _1534 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4079, float3(0.0), isnan(_4079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4079, float3(0.0), isnan(_4079)), level(0.0)).x;
    float3 _4090 = float3(_1516, _1526, _1514);
    float4 _1537 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4090, float3(0.0), isnan(_4090)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4090, float3(0.0), isnan(_4090)), level(0.0)).xyzw;
    float _1539 = _1537.x;
    float _1541 = _1537.y;
    float _1543 = _1537.z;
    float _1545 = _1537.w;
    float2 _4107 = float2(_1532, _1524);
    float3 _1549 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4107, float2(0.0), isnan(_4107)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4107, float2(0.0), isnan(_4107)), level(0.0)).xyz;
    float _1551 = _1549.x;
    float _1553 = _1549.y;
    float _1555 = _1549.z;
    float _1557 = _586 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1559 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1561 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1563 = isnan(0.5);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1569 = _1565 || _1567;
    float _1571 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1573 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1557);
    float _1575 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1571);
    float _1577 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1573);
    float _1579 = _586 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1581 = exp2(_1559);
    float _1583 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1575);
    float _1585 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1587 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1579);
    float _1589 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1583);
    float _1591 = _1571;
    if (_1569)
    {
        _1591 = 1.0;
    }
    float _1593 = _1591;
    float _1595 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1587);
    float _1597 = 1.0 / _1585;
    float _1599 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1601 = _1599 + _1585;
    float _1603 = _1601 * _1597;
    float _1605 = _1603 * 0.5;
    float _1607 = _1593;
    if (!_1569)
    {
        float _1609 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1611 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1613 = _1609 * 0.15915493667125701904296875;
        float _1615 = _1611 * 0.15915493667125701904296875;
        float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1619 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1617);
        float _1621 = _1613 * 6.283185482025146484375;
        float _1623 = cos(_1621);
        float _1625 = _1613 * 6.283185482025146484375;
        float _1627 = sin(_1625);
        float _1629 = 1.0 / _1623;
        float _1631 = _1615 * 6.283185482025146484375;
        float _1633 = cos(_1631);
        float _1635 = _1627 * _1629;
        float _1637 = _1615 * 6.283185482025146484375;
        float _1639 = sin(_1637);
        float _1641 = _1633 * _1635;
        float _1643 = 1.0 / _1619;
        float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1647 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1645;
        float _1649 = 1.0 / _1641;
        float _1651 = 1.0 / _1647;
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1655 = _1643 * _1653;
        float _1657 = _1639 * _1649;
        float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1661 = fma(_1657, _1655, _1659);
        float _1663 = _1661 * _1651;
        float _1665 = precise::clamp(_1663, 0.0, 1.0);
        _1607 = _1665;
    }
    float _1667 = _1607;
    float _1669 = -_1581;
    float _1671 = _1669 + 1.0;
    bool _1673 = _1667 > 0.0;
    bool _1675 = isnan(_1667);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan(0.0);
    bool _1681 = _1677 || _1679;
    float _1683 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1685 = _1589 + _1458;
    float _1687 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1689 = _1504 + _1458;
    float _1691 = _1458 * 0.5;
    out.m_65.x = _592;
    out.m_65.y = _586;
    out.m_65.z = _624;
    float _1693 = _1687 * _1534;
    float _1695 = -_1687;
    float _1697 = _1695 + 1.0;
    float _1699 = _1685 * 0.5;
    float _1701 = _1545 * _1693;
    float _1703 = _1555 * _1693;
    float _1705 = _1689 * 0.5;
    float _1707 = fma(_1506, -0.5, _1691);
    float _1709 = fma(_1551, _1701, _1539);
    float _1711 = fma(_1553, _1701, _1541);
    float _1713 = _1545 * _1697;
    float _1715 = _1683 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1717 = fma(_1545, _1703, _1543);
    out.gl_Position.x = _1504;
    out.gl_Position.y = _1506;
    out.gl_Position.z = _1589;
    out.gl_Position.w = _1458;
    out.m_67.x = _1705;
    out.m_67.y = _1707;
    out.m_67.z = _1699;
    out.m_67.w = _1458;
    out.m_45.x = _1715;
    out.m_69.x = _1709;
    out.m_69.y = _1711;
    out.m_69.z = _1717;
    out.m_69.w = _1713;
    if (_1681)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1719 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1719;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1776 = as_type<float>(_104);
        out.gl_Position.z = _1776;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _96 = _126;
    }
    float _128 = _96;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1846 = as_type<float>(_142);
        out.gl_Position.z = _1846;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _150 = in.m_49.z;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _154 = _152 != 0;
    float _156 = in.m_49.w;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _160 = _158 != 0;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _164 = in.m_51.x;
    float _166 = in.m_51.y;
    float _168 = _148 * _146;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = _144 * 2.0;
    float _178 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _180 = in.m_49.y;
    bool _182 = _150 > 0.5;
    bool _184 = _182 && _154;
    float _186 = _150 * 2.0;
    float _188 = floor(_176);
    bool _190 = _156 > 0.5;
    float _192 = 0.0;
    float _194 = _166;
    if (_154)
    {
        _192 = _164;
    }
    float _196 = _192;
    float _198 = -_166;
    float _200 = _198 + 1.0;
    float _202 = _196;
    if (_184)
    {
        float _204 = -_196;
        float _206 = _204 + 1.0;
        _202 = _206;
    }
    float _208 = _202;
    float _210 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (_160)
    {
        float _212 = _190 ? _200 : _166;
        _194 = _212;
    }
    float _214 = _194;
    bool _216 = _188 > 0.0;
    float _218 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _210);
    bool _220 = _188 >= 0.0;
    bool _222 = isnan(_188);
    bool _224 = _220 || _222;
    bool _226 = isnan(0.0);
    bool _228 = _224 || _226;
    float _230 = _188;
    if (!_154)
    {
        _230 = _164;
    }
    float _232 = _230;
    float _234 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _218);
    int _236 = _228 ? 0 : 1;
    float _238 = floor(_186);
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _242 = _240 != 0;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _246 = _244 != 0;
    float _248 = _234 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _252 = _250 != 0;
    float _254 = _232;
    if (_154)
    {
        _254 = _208;
    }
    float _256 = _254;
    float _258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _260 = _248 + _258;
    int _262 = ~_236;
    int _264 = _262 + 1;
    int _266 = _264 + 1;
    float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _276 = _274 != 0;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _280 = _278 != 0;
    float _282 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _284 = _266;
    float _286 = _256;
    if (!_216)
    {
        int _288 = ~_236;
        int _290 = _288 + 1;
        _284 = _290;
    }
    int _292 = _284;
    float _294 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _296 = !_242;
    float _298 = _296 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _300 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _282);
    float _302 = _162 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _304 = floor(_178);
    float _306 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _294);
    float _308 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _300);
    float _310 = fma(_302, _214, -0.5);
    bool _312 = _238 >= 0.0;
    bool _314 = isnan(_238);
    bool _316 = _312 || _314;
    bool _318 = isnan(0.0);
    bool _320 = _316 || _318;
    float _322 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _306);
    int _324 = abs(as_type<int>(_298));
    float _326 = _308 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _328 = _320 ? 0 : 1;
    float _330 = _322 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _332 = float(_324);
    float _334 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _336 = _326 + _334;
    bool _338 = _238 > 0.0;
    float _340 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _342 = _330 + _340;
    float _344 = _268 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _346 = _298;
    if (!_252)
    {
        _346 = _180;
    }
    float _348 = _346;
    float _350 = -_304;
    float _352 = _178 + _350;
    float _354 = _178 * 6.283185482025146484375;
    float _356 = fma(_344, _256, -0.5);
    float _358 = -_352;
    float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _362 = _354 * 0.15915493667125701904296875;
    float _364 = _348;
    if (_252)
    {
        _364 = _144;
    }
    float _366 = _364;
    float _368 = _144 + _180;
    float _370 = abs(_360);
    float _372 = _332 * _370;
    float _374 = _336 * _336;
    float _376 = _362 * 6.283185482025146484375;
    float _378 = cos(_376);
    float _380 = fma(_342, _342, _374);
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_252)
    {
        _286 = _150;
    }
    float _384 = _286;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _388 = fma(_260, _260, _380);
    float _390 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[83].z, _382);
    float _392 = _384;
    if (_252)
    {
        _392 = _180;
    }
    float _394 = _392;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _398 = _366 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _400 = rsqrt(_388);
    float _402 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[83].w, _396);
    float _404 = -_386;
    float _406 = fma(_398, 2.0, _404);
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _410 = _398;
    if (!_252)
    {
        _410 = _150;
    }
    float _412 = _410;
    float _414 = _368 + (-1.0);
    float _416 = _412;
    if (_252)
    {
        _416 = _180;
    }
    float _418 = _416;
    float _420 = fma(_378, 0.5, 0.5);
    bool _422 = _352 < 0.5;
    float _424 = float(_422);
    float _426 = -_122;
    float _428 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[81].x, _406);
    int _430 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _432 = _430 != 0;
    float _434 = -_420;
    float _436 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _438 = ~_328;
    int _440 = _438 + 1;
    int _442 = _440 + 1;
    float _444 = -_424;
    float _446 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _448 = _442;
    if (!_338)
    {
        int _450 = ~_328;
        int _452 = _450 + 1;
        _448 = _452;
    }
    int _454 = _448;
    float _456 = _418 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _458 = !_432;
    int _460 = _458 ? 0 : 1;
    float _462 = _336 * _400;
    float _464 = in.m_53.x;
    float _466 = in.m_53.y;
    float _468 = in.m_53.z;
    float _470 = fma(_456, -2.0, _408);
    int _472 = abs(_460);
    float _474 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _476 = _336 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _478 = _342 * _400;
    float _480 = -_462;
    float _482 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[18].w, _336);
    float _484 = float(_472);
    float _486 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[28].x, _476);
    float _488 = -_478;
    float _490 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[18].w, _342);
    float _492 = _482 * _482;
    float _494 = _260 * _400;
    float _496 = fma(_260, (*spvDescriptorSet0.vp_c8)._m0[28].z, _486);
    bool _498 = !_246;
    int _500 = _498 ? 0 : 1;
    float _502 = fma(_490, _490, _492);
    float _504 = -_494;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _260);
    float _508 = fma(_484, _436, _372);
    float _510 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _390);
    int _512 = abs(_500);
    float _514 = fma(_506, _506, _502);
    bool _516 = _496 >= 0.0;
    float _518 = fma(_510, _356, _428);
    float _520 = float(_512);
    float _522 = sqrt(_514);
    float _524 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _402);
    float _526 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _470);
    float _528 = _150 + _180;
    float _530 = abs(_446);
    float _532 = fma(_520, _530, _508);
    float _534 = _466 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _536 = -_526;
    float _538 = fma(_524, _310, _536);
    float _540 = _528 + (-1.0);
    float _542 = _532 * _534;
    float _544 = _510;
    int _546 = as_type<int>(_534);
    if (_516)
    {
        _544 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _548 = _544;
    float _550 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _552 = log2(_550);
    float _554 = _518 + 0.5;
    float _556 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _558 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _560 = _538 + 0.5;
    float _562 = _400 * _522;
    if (_516)
    {
        float _564 = _548 * 5.0;
        _546 = as_type<int>(_564);
    }
    int _566 = _546;
    if (_516)
    {
        out.m_45.x = 0.0;
    }
    float _568 = _556 * _562;
    bool _570 = !_276;
    int _572 = _570 ? 0 : 1;
    float _574 = _180 * 2.0;
    out.m_55.z = _554;
    out.m_55.w = _560;
    bool _576 = !_280;
    int _578 = _576 ? 0 : 1;
    bool _580 = !_272;
    int _582 = _580 ? 0 : 1;
    if (_516)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2546 = as_type<float>(_566);
        out.gl_Position.z = _2546;
    }
    out.m_57.y = _568;
    if (_516)
    {
        return out;
    }
    float _584 = -_462;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _326);
    float _588 = _552 * _122;
    float _590 = -_478;
    float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[18].w, _330);
    int _594 = abs(_582);
    float _596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _598 = _586 + _596;
    float _600 = floor(_574);
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _604 = _592 + _602;
    float _606 = _598 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _608 = float(_594);
    float _610 = in.m_59.x;
    float _612 = in.m_59.y;
    float _614 = in.m_59.z;
    float _616 = float(_454);
    float _618 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[28].x, _606);
    float _620 = exp2(_588);
    float _622 = -_494;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _248);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _628 = 1.0 + _626;
    bool _630 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _632 = isnan(1.0);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _638 = _634 || _636;
    float _640 = _608 * _616;
    float _642 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _644 = _624 + _642;
    bool _646 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _654 = _650 || _652;
    float _656 = _144 + (-0.5);
    float _658 = 1.0 / _628;
    float _660 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[28].z, _618);
    bool _662 = _600 > 0.0;
    bool _664 = _600 >= 0.0;
    bool _666 = isnan(_600);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    int _674 = abs(_572);
    float _676 = _640 * (-2.0);
    float _678 = -_620;
    float _680 = _678 + 1.0;
    bool _682 = _660 >= 0.0;
    float _684 = float(_674);
    float _686 = fma(_474, _676, _474);
    float _688 = _654 ? _680 : 0.0;
    float _690 = fma(_676, _610, _610);
    float _692 = float(_292);
    float _694 = _672 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _696 = _694;
    int _698 = as_type<int>(_686);
    if (_638)
    {
        float _700 = _688 * _658;
        _124 = _700;
    }
    float _702 = _124;
    float _704 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[196].x, _690);
    float _706 = _684 * _692;
    int _708 = ~as_type<int>(_694);
    int _710 = _708 + 1;
    int _712 = _710 + 1;
    int _714 = _712;
    if (_682)
    {
        out.m_45.x = 0.0;
    }
    if (!_662)
    {
        int _716 = ~as_type<int>(_694);
        int _718 = _716 + 1;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = fma(_686, _702, _704);
    if (_682)
    {
        _696 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _724 = _696;
    float _726 = _706 * (-2.0);
    int _728 = abs(_578);
    float _730 = _722 * 0.15915493667125701904296875;
    if (_682)
    {
        float _732 = _724 * 5.0;
        _698 = as_type<int>(_732);
    }
    int _734 = _698;
    float _736 = fma(_558, _726, _558);
    float _738 = fma(_726, _612, _612);
    float _740 = _730 * 6.283185482025146484375;
    float _742 = sin(_740);
    if (_682)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2788 = as_type<float>(_734);
        out.gl_Position.z = _2788;
    }
    if (_682)
    {
        return out;
    }
    float _744 = -_326;
    float _746 = _744 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _748 = -_330;
    float _750 = _748 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _752 = float(_728);
    float _754 = _180 + (-0.5);
    float _756 = _746 * _746;
    float _758 = float(_720);
    float _760 = -_248;
    float _762 = _760 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _764 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[196].y, _738);
    float _766 = fma(_750, _750, _756);
    float _768 = _144 + _150;
    float _770 = _752 * _758;
    float _772 = fma(_736, _702, _764);
    float _774 = fma(_762, _762, _766);
    float _776 = _768 + (-1.0);
    float _778 = _770 * (-2.0);
    float _780 = _772 * 0.15915493667125701904296875;
    float _782 = _150 + (-0.5);
    float _784 = rsqrt(_774);
    float _786 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _788 = fma(_778, _614, _614);
    float _790 = _464 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _792 = _468 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _794 = fma(_786, _778, _786);
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[196].z, _788);
    float _798 = _532 * _790;
    float _800 = _532 * _792;
    float _802 = _780 * 6.283185482025146484375;
    float _804 = sin(_802);
    float _806 = fma(_794, _702, _796);
    float _808 = in.m_61.x;
    float _810 = in.m_61.y;
    float _812 = in.m_61.z;
    float _814 = _798 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _816 = _806 * 0.15915493667125701904296875;
    float _818 = _750 * _784;
    float _820 = _762 * _784;
    float _822 = _746 * _784;
    float _824 = _780 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _830 = _818 * _828;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _834 = _820 * _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _838 = _822 * _836;
    float _840 = _800 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _844 = -_830;
    float _846 = fma(_820, _842, _844);
    float _848 = _814 * _562;
    float _850 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _852 = -_838;
    float _854 = fma(_818, _850, _852);
    float _856 = _730 * 6.283185482025146484375;
    float _858 = cos(_856);
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _862 = -_834;
    float _864 = fma(_822, _860, _862);
    float _866 = _846 * _846;
    float _868 = _840 * _562;
    float _870 = _742 * _804;
    float _872 = fma(_864, _864, _866);
    float _874 = _816 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _810);
    float _880 = fma(_854, _854, _872);
    float _882 = _742 * _826;
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _812);
    float _886 = _568 * _878;
    float _888 = _816 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = _858 * _826;
    float _894 = _858 * _804;
    float _896 = _868 * _884;
    float _898 = rsqrt(_880);
    float _900 = fma(_876, _892, _870);
    float _902 = fma(_876, _870, _892);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _808);
    float _906 = -_894;
    float _908 = fma(_876, _882, _906);
    float _910 = -_882;
    float _912 = fma(_876, _894, _910);
    float _914 = -_886;
    float _916 = _876 * _914;
    float _918 = _848 * _904;
    float _920 = _890 * _886;
    float _922 = _826 * _890;
    float _924 = _804 * _890;
    float _926 = _858 * _920;
    float _928 = _742 * _920;
    float _930 = fma(_922, _918, _916);
    float _932 = _854 * _898;
    float _934 = fma(_900, _918, _926);
    float _936 = _864 * _898;
    float _938 = _846 * _898;
    float _940 = _818 * _932;
    float _942 = fma(_908, _918, _928);
    float _944 = fma(_912, _896, _934);
    float _946 = _820 * _938;
    float _948 = -_940;
    float _950 = fma(_820, _936, _948);
    float _952 = fma(_924, _896, _930);
    float _954 = _822 * _936;
    float _956 = -_946;
    float _958 = fma(_822, _932, _956);
    float _960 = _950 * _944;
    float _962 = fma(_902, _896, _942);
    float _964 = -_954;
    float _966 = fma(_818, _938, _964);
    float _968 = _958 * _944;
    float _970 = fma(_938, _952, _960);
    float _972 = _966 * _944;
    float _974 = fma(_936, _952, _968);
    float _976 = fma(_822, _962, _970);
    float _978 = fma(_932, _952, _972);
    float _980 = fma(_818, _962, _974);
    float _982 = _976 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 0.449999988079071044921875;
    float _986 = fma(_820, _962, _978);
    float _988 = _326 + _976;
    float _990 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[8].x, _982);
    float _992 = _330 + _980;
    float _994 = fma(_986, (*spvDescriptorSet0.vp_c10)._m0[10].x, _990);
    float _996 = _248 + _986;
    float _998 = _994 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[10].x, _996);
    float _1002 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[8].x, _992);
    float _1004 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[9].x, _988);
    float _1006 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1000);
    float _1008 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1002);
    float _1010 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1004);
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1014 = _1006 + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1018 = _1008 + _1016;
    float _1020 = _1014 * _1014;
    float _1022 = fma(_1018, _1018, _1020);
    float _1024 = sqrt(_1022);
    bool _1026 = _1024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1028 = _1004;
    float _1030 = _1008;
    float _1032 = _1006;
    if (!_1026)
    {
        _1028 = _1010;
    }
    float _1034 = _1028;
    bool _1036 = !_1026;
    float _1038 = _1034;
    if (!_1036)
    {
        float _1040 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1042 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1044 = _1024 + _1042;
        float _1046 = rsqrt(_1022);
        float _1048 = _1044 * _1040;
        float _1050 = _1010 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = _1048 * 0.15915493667125701904296875;
        float _1054 = _1052 * 6.283185482025146484375;
        float _1056 = cos(_1054);
        float _1058 = _1052 * 6.283185482025146484375;
        float _1060 = sin(_1058);
        float _1062 = _1056 + (-1.0);
        float _1064 = _1062 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1066 = fma(_1060, _1050, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1068 = fma(_1010, _1056, _1064);
        float _1070 = _1046 * _1066;
        float _1072 = fma(_1018, _1070, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1074 = fma(_1014, _1070, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1038 = _1068;
        _1030 = _1072;
        _1032 = _1074;
    }
    float _1076 = _1038;
    float _1078 = _1030;
    float _1080 = _1032;
    float _1082 = -_326;
    float _1084 = _1082 + _1076;
    float _1086 = -_330;
    float _1088 = _1086 + _1078;
    float _1090 = -_248;
    float _1092 = _1090 + _1080;
    float _1094 = _1084 * _1084;
    float _1096 = fma(_1088, _1088, _1094);
    float _1098 = in.m_63.x;
    float _1100 = in.m_63.y;
    float _1102 = in.m_63.z;
    float _1104 = fma(_1092, _1092, _1096);
    float _1106 = sqrt(_1104);
    bool _1108 = _1106 > 0.0;
    float _1110 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1112 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1114 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1116 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1110);
    float _1118 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1112);
    float _1120 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1114);
    float _1122 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1116);
    float _1124 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1118);
    float _1126 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1120);
    float _1128 = _1102;
    float _1130 = _1098;
    float _1132 = _1078;
    float _1134 = _1126;
    if (!_1108)
    {
        _1128 = _1076;
    }
    float _1136 = _1128;
    float _1138 = _1136;
    if (!_1108)
    {
        _1130 = _1080;
    }
    float _1140 = _1130;
    bool _1142 = !_1108;
    float _1144 = _1140;
    if (!_1142)
    {
        float _1146 = _1124 * _1124;
        float _1148 = fma(_1122, _1122, _1146);
        float _1150 = rsqrt(_1104);
        float _1152 = fma(_1126, _1126, _1148);
        float _1154 = sqrt(_1152);
        float _1156 = _1088 * _1150;
        float _1158 = _1084 * _1150;
        float _1160 = _1092 * _1150;
        bool _1162 = _1154 > 0.0;
        float _1164 = _1154;
        float _1166 = _1150;
        if (!_1162)
        {
            _1164 = _1076;
        }
        float _1168 = _1164;
        _1138 = _1168;
        if (!_1162)
        {
            _1166 = _1080;
        }
        float _1170 = _1166;
        bool _1172 = !_1162;
        _1144 = _1170;
        if (!_1172)
        {
            float _1174 = rsqrt(_1152);
            float _1176 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1178 = _1124 * _1174;
            float _1180 = _1122 * _1174;
            float _1182 = _1158 * _1178;
            float _1184 = _1126 * _1174;
            float _1186 = fma(_1156, _1180, _1182);
            float _1188 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1190 = fma(_1160, _1184, _1186);
            float _1192 = _1190 * _1188;
            float _1194 = fma(_1122, _1192, _1078);
            float _1196 = fma(_1124, _1192, _1076);
            float _1198 = fma(_1126, _1192, _1080);
            _1138 = _1196;
            _1132 = _1194;
            _1144 = _1198;
        }
    }
    float _1200 = _1138;
    float _1202 = _1132;
    float _1204 = _1144;
    float _1206 = -_462;
    float _1208 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1200);
    float _1210 = -_478;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1202);
    float _1214 = -_494;
    float _1216 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1204);
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1220 = _1208 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1224 = _1212 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1216 + _1226;
    float _1230 = _1220 * _1220;
    float _1232 = fma(_1224, _1224, _1230);
    float _1234 = fma(_1228, _1228, _1232);
    float _1236 = rsqrt(_1234);
    float _1238 = sqrt(_1234);
    float _1240 = _1236 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1242 = _1224 * _1240;
    float _1244 = _1228 * _1240;
    float _1246 = _1242 * _1242;
    float _1248 = _1244 * _1244;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1252 = fma(_1238, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1250);
    float _1254 = precise::clamp(_1252, 0.0, 1.0);
    float _1256 = _1246 + _1248;
    float _1258 = sqrt(_1256);
    bool _1260 = _1258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = _1258 + _1262;
    float _1266 = _1232;
    float _1268 = _1256;
    float _1270 = _1264;
    float _1272 = _1220;
    float _1274 = _1240;
    if (_1260)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1276;
    }
    float _1278 = _1266;
    if (_1260)
    {
        float _1280 = rsqrt(_1256);
        _1268 = _1280;
    }
    float _1282 = _1268;
    float _1284 = _1278;
    if (_1260)
    {
        float _1286 = _1264 * _1278;
        _1270 = _1286;
    }
    float _1288 = _1270;
    if (_1260)
    {
        float _1290 = _1288 * 0.15915493667125701904296875;
        _1134 = _1290;
    }
    float _1292 = _1134;
    float _1294 = _1236;
    if (_1260)
    {
        float _1296 = _1292 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        _1294 = _1298;
    }
    float _1300 = _1294;
    float _1302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1304 = precise::max(0.0, _1302);
    float _1306 = _1228;
    float _1308 = _1304;
    if (_1260)
    {
        float _1310 = _1292 * 6.283185482025146484375;
        float _1312 = cos(_1310);
        _1306 = _1312;
    }
    float _1314 = _1306;
    float _1316 = -_1240;
    float _1318 = -_1304;
    float _1320 = fma(_1220, _1316, _1318);
    if (_1260)
    {
        float _1322 = _1320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1272 = _1322;
    }
    float _1324 = _1272;
    float _1326 = _1300;
    float _1328 = _1324;
    if (_1260)
    {
        float _1330 = fma(_1300, _1324, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1274 = _1330;
    }
    float _1332 = _1274;
    float _1334 = _1332;
    if (!_1260)
    {
        _1326 = _1242;
    }
    float _1336 = _1326;
    float _1338 = _1336;
    if (!_1260)
    {
        _1328 = _1320;
    }
    float _1340 = _1328;
    float _1342 = _1340;
    float _1344 = _1314;
    if (_1260)
    {
        float _1346 = _1314 + (-1.0);
        _1308 = _1346;
    }
    float _1348 = _1308;
    float _1350 = _1348;
    if (_1260)
    {
        float _1352 = _1282 * _1332;
        _1334 = _1352;
    }
    float _1354 = _1334;
    float _1356 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1260)
    {
        float _1358 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1284 = _1358;
    }
    float _1360 = _1284;
    float _1362 = _1360;
    if (_1260)
    {
        float _1364 = _1242 * _1354;
        _1338 = _1364;
    }
    float _1366 = _1338;
    if (!_1260)
    {
        _1350 = _1244;
    }
    float _1368 = _1350;
    float _1370 = _1368;
    if (_1260)
    {
        float _1372 = _1244 * _1354;
        _1370 = _1372;
    }
    float _1374 = _1370;
    if (_1260)
    {
        float _1376 = fma(_1320, _1314, _1360);
        _1342 = _1376;
    }
    float _1378 = _1342;
    if (!_1260)
    {
        _1344 = _1246;
    }
    float _1380 = _1344;
    float _1382 = _1380;
    if (_1260)
    {
        float _1384 = _1366 * _1366;
        _1382 = _1384;
    }
    float _1386 = _1382;
    float _1388 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1260)
    {
        _1362 = _1248;
    }
    float _1390 = _1362;
    float _1392 = _1390;
    if (_1260)
    {
        float _1394 = _1374 * _1374;
        _1392 = _1394;
    }
    float _1396 = _1392;
    float _1398 = fma(_1378, _1378, _1386);
    float _1400 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1402 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1388);
    float _1404 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1406 = _1398 + _1396;
    float _1408 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1356);
    float _1410 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1402);
    float _1412 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1400);
    float _1414 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1404);
    float _1416 = rsqrt(_1406);
    float _1418 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1408);
    float _1420 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1422 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1424 = -_1254;
    float _1426 = _1424 + 1.0;
    float _1428 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1430 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1412);
    float _1432 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1434 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1414);
    float _1436 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1438 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1432);
    float _1440 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1442 = abs(_1426);
    float _1444 = log2(_1442);
    float _1446 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1448 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1438);
    float _1450 = _1416 * _1366;
    float _1452 = _1416 * _1374;
    float _1454 = -_1446;
    float _1456 = fma(_1454, _1422, 1.0);
    float _1458 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1448);
    float _1460 = _1416 * _1378;
    float _1462 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1464 = log2(_1456);
    float _1466 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1468 = -_1462;
    float _1470 = fma(_1460, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1468);
    float _1472 = -_1452;
    float _1474 = fma(_1472, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1470);
    float _1476 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1478 = 1.0 / _1458;
    float _1480 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1482 = fma(_1474, -0.5, 0.5);
    float _1484 = fma(_1474, 0.5, 0.5);
    float _1486 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1466);
    float _1488 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1480);
    float _1490 = _1460 + 1.0;
    float _1492 = fma(_1484, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1494 = exp2(_1476);
    float _1496 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1488);
    float _1498 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1486);
    float _1500 = fma(_1484, _1492, -0.212114393711090087890625);
    float _1502 = _1464 * 0.693147182464599609375;
    float _1504 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1496);
    float _1506 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1498);
    float _1508 = fma(_1484, _1500, 1.570728778839111328125);
    float _1510 = sqrt(_1482);
    float _1512 = _1504 * _1478;
    float _1514 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1516 = fma(_1512, 0.5, 0.5);
    float _1518 = -_1460;
    float _1520 = fma(_1494, _1490, _1518);
    float _1522 = _1506 * _1478;
    float _1524 = fma(_1520, 0.5, 0.5);
    float _1526 = fma(_1522, -0.5, 0.5);
    float _1528 = _1510 * 0.636619746685028076171875;
    float _1530 = -_1508;
    float _1532 = fma(_1528, _1530, 1.0);
    float3 _4079 = float3(_1516, _1526, _1514);
    float _1534 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4079, float3(0.0), isnan(_4079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4079, float3(0.0), isnan(_4079)), level(0.0)).x;
    float3 _4090 = float3(_1516, _1526, _1514);
    float4 _1537 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4090, float3(0.0), isnan(_4090)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4090, float3(0.0), isnan(_4090)), level(0.0)).xyzw;
    float _1539 = _1537.x;
    float _1541 = _1537.y;
    float _1543 = _1537.z;
    float _1545 = _1537.w;
    float2 _4107 = float2(_1532, _1524);
    float3 _1549 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4107, float2(0.0), isnan(_4107)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4107, float2(0.0), isnan(_4107)), level(0.0)).xyz;
    float _1551 = _1549.x;
    float _1553 = _1549.y;
    float _1555 = _1549.z;
    float _1557 = _586 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1559 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1561 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1563 = isnan(0.5);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1569 = _1565 || _1567;
    float _1571 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1573 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1557);
    float _1575 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1571);
    float _1577 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1573);
    float _1579 = _586 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1581 = exp2(_1559);
    float _1583 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1575);
    float _1585 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1587 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1579);
    float _1589 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1583);
    float _1591 = _1571;
    if (_1569)
    {
        _1591 = 1.0;
    }
    float _1593 = _1591;
    float _1595 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1587);
    float _1597 = 1.0 / _1585;
    float _1599 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1601 = _1599 + _1585;
    float _1603 = _1601 * _1597;
    float _1605 = _1603 * 0.5;
    float _1607 = _1593;
    if (!_1569)
    {
        float _1609 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1611 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1613 = _1609 * 0.15915493667125701904296875;
        float _1615 = _1611 * 0.15915493667125701904296875;
        float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1619 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1617);
        float _1621 = _1613 * 6.283185482025146484375;
        float _1623 = cos(_1621);
        float _1625 = _1613 * 6.283185482025146484375;
        float _1627 = sin(_1625);
        float _1629 = 1.0 / _1623;
        float _1631 = _1615 * 6.283185482025146484375;
        float _1633 = cos(_1631);
        float _1635 = _1627 * _1629;
        float _1637 = _1615 * 6.283185482025146484375;
        float _1639 = sin(_1637);
        float _1641 = _1633 * _1635;
        float _1643 = 1.0 / _1619;
        float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1647 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1645;
        float _1649 = 1.0 / _1641;
        float _1651 = 1.0 / _1647;
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1655 = _1643 * _1653;
        float _1657 = _1639 * _1649;
        float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1661 = fma(_1657, _1655, _1659);
        float _1663 = _1661 * _1651;
        float _1665 = precise::clamp(_1663, 0.0, 1.0);
        _1607 = _1665;
    }
    float _1667 = _1607;
    float _1669 = -_1581;
    float _1671 = _1669 + 1.0;
    bool _1673 = _1667 > 0.0;
    bool _1675 = isnan(_1667);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan(0.0);
    bool _1681 = _1677 || _1679;
    float _1683 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1685 = _1589 + _1458;
    float _1687 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1689 = _1504 + _1458;
    float _1691 = _1458 * 0.5;
    out.m_65.x = _592;
    out.m_65.y = _586;
    out.m_65.z = _624;
    float _1693 = _1687 * _1534;
    float _1695 = -_1687;
    float _1697 = _1695 + 1.0;
    float _1699 = _1685 * 0.5;
    float _1701 = _1545 * _1693;
    float _1703 = _1555 * _1693;
    float _1705 = _1689 * 0.5;
    float _1707 = fma(_1506, -0.5, _1691);
    float _1709 = fma(_1551, _1701, _1539);
    float _1711 = fma(_1553, _1701, _1541);
    float _1713 = _1545 * _1697;
    float _1715 = _1683 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1717 = fma(_1545, _1703, _1543);
    out.gl_Position.x = _1504;
    out.gl_Position.y = _1506;
    out.gl_Position.z = _1589;
    out.gl_Position.w = _1458;
    out.m_67.x = _1705;
    out.m_67.y = _1707;
    out.m_67.z = _1699;
    out.m_67.w = _1458;
    out.m_45.x = _1715;
    out.m_69.x = _1709;
    out.m_69.y = _1711;
    out.m_69.z = _1717;
    out.m_69.w = _1713;
    if (_1681)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1719 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1719;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1776 = as_type<float>(_104);
        out.gl_Position.z = _1776;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _96 = _126;
    }
    float _128 = _96;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1846 = as_type<float>(_142);
        out.gl_Position.z = _1846;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.x;
    float _146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _148 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _150 = in.m_49.z;
    int _152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _154 = _152 != 0;
    float _156 = in.m_49.w;
    int _158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _160 = _158 != 0;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _164 = in.m_51.x;
    float _166 = in.m_51.y;
    float _168 = _148 * _146;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = _144 * 2.0;
    float _178 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _180 = in.m_49.y;
    bool _182 = _150 > 0.5;
    bool _184 = _182 && _154;
    float _186 = _150 * 2.0;
    float _188 = floor(_176);
    bool _190 = _156 > 0.5;
    float _192 = 0.0;
    float _194 = _166;
    if (_154)
    {
        _192 = _164;
    }
    float _196 = _192;
    float _198 = -_166;
    float _200 = _198 + 1.0;
    float _202 = _196;
    if (_184)
    {
        float _204 = -_196;
        float _206 = _204 + 1.0;
        _202 = _206;
    }
    float _208 = _202;
    float _210 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (_160)
    {
        float _212 = _190 ? _200 : _166;
        _194 = _212;
    }
    float _214 = _194;
    bool _216 = _188 > 0.0;
    float _218 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _210);
    bool _220 = _188 >= 0.0;
    bool _222 = isnan(_188);
    bool _224 = _220 || _222;
    bool _226 = isnan(0.0);
    bool _228 = _224 || _226;
    float _230 = _188;
    if (!_154)
    {
        _230 = _164;
    }
    float _232 = _230;
    float _234 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _218);
    int _236 = _228 ? 0 : 1;
    float _238 = floor(_186);
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _242 = _240 != 0;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _246 = _244 != 0;
    float _248 = _234 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _252 = _250 != 0;
    float _254 = _232;
    if (_154)
    {
        _254 = _208;
    }
    float _256 = _254;
    float _258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _260 = _248 + _258;
    int _262 = ~_236;
    int _264 = _262 + 1;
    int _266 = _264 + 1;
    float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _276 = _274 != 0;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _280 = _278 != 0;
    float _282 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _284 = _266;
    float _286 = _256;
    if (!_216)
    {
        int _288 = ~_236;
        int _290 = _288 + 1;
        _284 = _290;
    }
    int _292 = _284;
    float _294 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _296 = !_242;
    float _298 = _296 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _300 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _282);
    float _302 = _162 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _304 = floor(_178);
    float _306 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _294);
    float _308 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _300);
    float _310 = fma(_302, _214, -0.5);
    bool _312 = _238 >= 0.0;
    bool _314 = isnan(_238);
    bool _316 = _312 || _314;
    bool _318 = isnan(0.0);
    bool _320 = _316 || _318;
    float _322 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _306);
    int _324 = abs(as_type<int>(_298));
    float _326 = _308 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _328 = _320 ? 0 : 1;
    float _330 = _322 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _332 = float(_324);
    float _334 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _336 = _326 + _334;
    bool _338 = _238 > 0.0;
    float _340 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _342 = _330 + _340;
    float _344 = _268 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _346 = _298;
    if (!_252)
    {
        _346 = _180;
    }
    float _348 = _346;
    float _350 = -_304;
    float _352 = _178 + _350;
    float _354 = _178 * 6.283185482025146484375;
    float _356 = fma(_344, _256, -0.5);
    float _358 = -_352;
    float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _362 = _354 * 0.15915493667125701904296875;
    float _364 = _348;
    if (_252)
    {
        _364 = _144;
    }
    float _366 = _364;
    float _368 = _144 + _180;
    float _370 = abs(_360);
    float _372 = _332 * _370;
    float _374 = _336 * _336;
    float _376 = _362 * 6.283185482025146484375;
    float _378 = cos(_376);
    float _380 = fma(_342, _342, _374);
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_252)
    {
        _286 = _150;
    }
    float _384 = _286;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _388 = fma(_260, _260, _380);
    float _390 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[83].z, _382);
    float _392 = _384;
    if (_252)
    {
        _392 = _180;
    }
    float _394 = _392;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _398 = _366 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _400 = rsqrt(_388);
    float _402 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[83].w, _396);
    float _404 = -_386;
    float _406 = fma(_398, 2.0, _404);
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _410 = _398;
    if (!_252)
    {
        _410 = _150;
    }
    float _412 = _410;
    float _414 = _368 + (-1.0);
    float _416 = _412;
    if (_252)
    {
        _416 = _180;
    }
    float _418 = _416;
    float _420 = fma(_378, 0.5, 0.5);
    bool _422 = _352 < 0.5;
    float _424 = float(_422);
    float _426 = -_122;
    float _428 = fma(_426, (*spvDescriptorSet0.vp_c9)._m0[81].x, _406);
    int _430 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _432 = _430 != 0;
    float _434 = -_420;
    float _436 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _438 = ~_328;
    int _440 = _438 + 1;
    int _442 = _440 + 1;
    float _444 = -_424;
    float _446 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _448 = _442;
    if (!_338)
    {
        int _450 = ~_328;
        int _452 = _450 + 1;
        _448 = _452;
    }
    int _454 = _448;
    float _456 = _418 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _458 = !_432;
    int _460 = _458 ? 0 : 1;
    float _462 = _336 * _400;
    float _464 = in.m_53.x;
    float _466 = in.m_53.y;
    float _468 = in.m_53.z;
    float _470 = fma(_456, -2.0, _408);
    int _472 = abs(_460);
    float _474 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _476 = _336 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _478 = _342 * _400;
    float _480 = -_462;
    float _482 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[18].w, _336);
    float _484 = float(_472);
    float _486 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[28].x, _476);
    float _488 = -_478;
    float _490 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[18].w, _342);
    float _492 = _482 * _482;
    float _494 = _260 * _400;
    float _496 = fma(_260, (*spvDescriptorSet0.vp_c8)._m0[28].z, _486);
    bool _498 = !_246;
    int _500 = _498 ? 0 : 1;
    float _502 = fma(_490, _490, _492);
    float _504 = -_494;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _260);
    float _508 = fma(_484, _436, _372);
    float _510 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _390);
    int _512 = abs(_500);
    float _514 = fma(_506, _506, _502);
    bool _516 = _496 >= 0.0;
    float _518 = fma(_510, _356, _428);
    float _520 = float(_512);
    float _522 = sqrt(_514);
    float _524 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _402);
    float _526 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _470);
    float _528 = _150 + _180;
    float _530 = abs(_446);
    float _532 = fma(_520, _530, _508);
    float _534 = _466 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _536 = -_526;
    float _538 = fma(_524, _310, _536);
    float _540 = _528 + (-1.0);
    float _542 = _532 * _534;
    float _544 = _510;
    int _546 = as_type<int>(_534);
    if (_516)
    {
        _544 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _548 = _544;
    float _550 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _552 = log2(_550);
    float _554 = _518 + 0.5;
    float _556 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _558 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _560 = _538 + 0.5;
    float _562 = _400 * _522;
    if (_516)
    {
        float _564 = _548 * 5.0;
        _546 = as_type<int>(_564);
    }
    int _566 = _546;
    if (_516)
    {
        out.m_45.x = 0.0;
    }
    float _568 = _556 * _562;
    bool _570 = !_276;
    int _572 = _570 ? 0 : 1;
    float _574 = _180 * 2.0;
    out.m_55.z = _554;
    out.m_55.w = _560;
    bool _576 = !_280;
    int _578 = _576 ? 0 : 1;
    bool _580 = !_272;
    int _582 = _580 ? 0 : 1;
    if (_516)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2546 = as_type<float>(_566);
        out.gl_Position.z = _2546;
    }
    out.m_57.y = _568;
    if (_516)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _584 = -_462;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _326);
    float _588 = _552 * _122;
    float _590 = -_478;
    float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[18].w, _330);
    int _594 = abs(_582);
    float _596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _598 = _586 + _596;
    float _600 = floor(_574);
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _604 = _592 + _602;
    float _606 = _598 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _608 = float(_594);
    float _610 = in.m_59.x;
    float _612 = in.m_59.y;
    float _614 = in.m_59.z;
    float _616 = float(_454);
    float _618 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[28].x, _606);
    float _620 = exp2(_588);
    float _622 = -_494;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _248);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _628 = 1.0 + _626;
    bool _630 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _632 = isnan(1.0);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _638 = _634 || _636;
    float _640 = _608 * _616;
    float _642 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _644 = _624 + _642;
    bool _646 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _654 = _650 || _652;
    float _656 = _144 + (-0.5);
    float _658 = 1.0 / _628;
    float _660 = fma(_644, (*spvDescriptorSet0.vp_c8)._m0[28].z, _618);
    bool _662 = _600 > 0.0;
    bool _664 = _600 >= 0.0;
    bool _666 = isnan(_600);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    int _674 = abs(_572);
    float _676 = _640 * (-2.0);
    float _678 = -_620;
    float _680 = _678 + 1.0;
    bool _682 = _660 >= 0.0;
    float _684 = float(_674);
    float _686 = fma(_474, _676, _474);
    float _688 = _654 ? _680 : 0.0;
    float _690 = fma(_676, _610, _610);
    float _692 = float(_292);
    float _694 = _672 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _696 = _694;
    int _698 = as_type<int>(_686);
    if (_638)
    {
        float _700 = _688 * _658;
        _124 = _700;
    }
    float _702 = _124;
    float _704 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[196].x, _690);
    float _706 = _684 * _692;
    int _708 = ~as_type<int>(_694);
    int _710 = _708 + 1;
    int _712 = _710 + 1;
    int _714 = _712;
    if (_682)
    {
        out.m_45.x = 0.0;
    }
    if (!_662)
    {
        int _716 = ~as_type<int>(_694);
        int _718 = _716 + 1;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = fma(_686, _702, _704);
    if (_682)
    {
        _696 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _724 = _696;
    float _726 = _706 * (-2.0);
    int _728 = abs(_578);
    float _730 = _722 * 0.15915493667125701904296875;
    if (_682)
    {
        float _732 = _724 * 5.0;
        _698 = as_type<int>(_732);
    }
    int _734 = _698;
    float _736 = fma(_558, _726, _558);
    float _738 = fma(_726, _612, _612);
    float _740 = _730 * 6.283185482025146484375;
    float _742 = sin(_740);
    if (_682)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2788 = as_type<float>(_734);
        out.gl_Position.z = _2788;
    }
    if (_682)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _744 = -_326;
    float _746 = _744 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _748 = -_330;
    float _750 = _748 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _752 = float(_728);
    float _754 = _180 + (-0.5);
    float _756 = _746 * _746;
    float _758 = float(_720);
    float _760 = -_248;
    float _762 = _760 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _764 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[196].y, _738);
    float _766 = fma(_750, _750, _756);
    float _768 = _144 + _150;
    float _770 = _752 * _758;
    float _772 = fma(_736, _702, _764);
    float _774 = fma(_762, _762, _766);
    float _776 = _768 + (-1.0);
    float _778 = _770 * (-2.0);
    float _780 = _772 * 0.15915493667125701904296875;
    float _782 = _150 + (-0.5);
    float _784 = rsqrt(_774);
    float _786 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _788 = fma(_778, _614, _614);
    float _790 = _464 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _792 = _468 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _794 = fma(_786, _778, _786);
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[196].z, _788);
    float _798 = _532 * _790;
    float _800 = _532 * _792;
    float _802 = _780 * 6.283185482025146484375;
    float _804 = sin(_802);
    float _806 = fma(_794, _702, _796);
    float _808 = in.m_61.x;
    float _810 = in.m_61.y;
    float _812 = in.m_61.z;
    float _814 = _798 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _816 = _806 * 0.15915493667125701904296875;
    float _818 = _750 * _784;
    float _820 = _762 * _784;
    float _822 = _746 * _784;
    float _824 = _780 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _830 = _818 * _828;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _834 = _820 * _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _838 = _822 * _836;
    float _840 = _800 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _844 = -_830;
    float _846 = fma(_820, _842, _844);
    float _848 = _814 * _562;
    float _850 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _852 = -_838;
    float _854 = fma(_818, _850, _852);
    float _856 = _730 * 6.283185482025146484375;
    float _858 = cos(_856);
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _862 = -_834;
    float _864 = fma(_822, _860, _862);
    float _866 = _846 * _846;
    float _868 = _840 * _562;
    float _870 = _742 * _804;
    float _872 = fma(_864, _864, _866);
    float _874 = _816 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _810);
    float _880 = fma(_854, _854, _872);
    float _882 = _742 * _826;
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _812);
    float _886 = _568 * _878;
    float _888 = _816 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = _858 * _826;
    float _894 = _858 * _804;
    float _896 = _868 * _884;
    float _898 = rsqrt(_880);
    float _900 = fma(_876, _892, _870);
    float _902 = fma(_876, _870, _892);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _808);
    float _906 = -_894;
    float _908 = fma(_876, _882, _906);
    float _910 = -_882;
    float _912 = fma(_876, _894, _910);
    float _914 = -_886;
    float _916 = _876 * _914;
    float _918 = _848 * _904;
    float _920 = _890 * _886;
    float _922 = _826 * _890;
    float _924 = _804 * _890;
    float _926 = _858 * _920;
    float _928 = _742 * _920;
    float _930 = fma(_922, _918, _916);
    float _932 = _854 * _898;
    float _934 = fma(_900, _918, _926);
    float _936 = _864 * _898;
    float _938 = _846 * _898;
    float _940 = _818 * _932;
    float _942 = fma(_908, _918, _928);
    float _944 = fma(_912, _896, _934);
    float _946 = _820 * _938;
    float _948 = -_940;
    float _950 = fma(_820, _936, _948);
    float _952 = fma(_924, _896, _930);
    float _954 = _822 * _936;
    float _956 = -_946;
    float _958 = fma(_822, _932, _956);
    float _960 = _950 * _944;
    float _962 = fma(_902, _896, _942);
    float _964 = -_954;
    float _966 = fma(_818, _938, _964);
    float _968 = _958 * _944;
    float _970 = fma(_938, _952, _960);
    float _972 = _966 * _944;
    float _974 = fma(_936, _952, _968);
    float _976 = fma(_822, _962, _970);
    float _978 = fma(_932, _952, _972);
    float _980 = fma(_818, _962, _974);
    float _982 = _976 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[191].x * 0.449999988079071044921875;
    float _986 = fma(_820, _962, _978);
    float _988 = _326 + _976;
    float _990 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[8].x, _982);
    float _992 = _330 + _980;
    float _994 = fma(_986, (*spvDescriptorSet0.vp_c10)._m0[10].x, _990);
    float _996 = _248 + _986;
    float _998 = _994 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[10].x, _996);
    float _1002 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[8].x, _992);
    float _1004 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[9].x, _988);
    float _1006 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1000);
    float _1008 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1002);
    float _1010 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1004);
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1014 = _1006 + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1018 = _1008 + _1016;
    float _1020 = _1014 * _1014;
    float _1022 = fma(_1018, _1018, _1020);
    float _1024 = sqrt(_1022);
    bool _1026 = _1024 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1028 = _1004;
    float _1030 = _1008;
    float _1032 = _1006;
    if (!_1026)
    {
        _1028 = _1010;
    }
    float _1034 = _1028;
    bool _1036 = !_1026;
    float _1038 = _1034;
    if (!_1036)
    {
        float _1040 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1042 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1044 = _1024 + _1042;
        float _1046 = rsqrt(_1022);
        float _1048 = _1044 * _1040;
        float _1050 = _1010 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = _1048 * 0.15915493667125701904296875;
        float _1054 = _1052 * 6.283185482025146484375;
        float _1056 = cos(_1054);
        float _1058 = _1052 * 6.283185482025146484375;
        float _1060 = sin(_1058);
        float _1062 = _1056 + (-1.0);
        float _1064 = _1062 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1066 = fma(_1060, _1050, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1068 = fma(_1010, _1056, _1064);
        float _1070 = _1046 * _1066;
        float _1072 = fma(_1018, _1070, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1074 = fma(_1014, _1070, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1038 = _1068;
        _1030 = _1072;
        _1032 = _1074;
    }
    float _1076 = _1038;
    float _1078 = _1030;
    float _1080 = _1032;
    float _1082 = -_326;
    float _1084 = _1082 + _1076;
    float _1086 = -_330;
    float _1088 = _1086 + _1078;
    float _1090 = -_248;
    float _1092 = _1090 + _1080;
    float _1094 = _1084 * _1084;
    float _1096 = fma(_1088, _1088, _1094);
    float _1098 = in.m_63.x;
    float _1100 = in.m_63.y;
    float _1102 = in.m_63.z;
    float _1104 = fma(_1092, _1092, _1096);
    float _1106 = sqrt(_1104);
    bool _1108 = _1106 > 0.0;
    float _1110 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1112 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1114 = _1100 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1116 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1110);
    float _1118 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1112);
    float _1120 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1114);
    float _1122 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1116);
    float _1124 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1118);
    float _1126 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1120);
    float _1128 = _1102;
    float _1130 = _1098;
    float _1132 = _1078;
    float _1134 = _1126;
    if (!_1108)
    {
        _1128 = _1076;
    }
    float _1136 = _1128;
    float _1138 = _1136;
    if (!_1108)
    {
        _1130 = _1080;
    }
    float _1140 = _1130;
    bool _1142 = !_1108;
    float _1144 = _1140;
    if (!_1142)
    {
        float _1146 = _1124 * _1124;
        float _1148 = fma(_1122, _1122, _1146);
        float _1150 = rsqrt(_1104);
        float _1152 = fma(_1126, _1126, _1148);
        float _1154 = sqrt(_1152);
        float _1156 = _1088 * _1150;
        float _1158 = _1084 * _1150;
        float _1160 = _1092 * _1150;
        bool _1162 = _1154 > 0.0;
        float _1164 = _1154;
        float _1166 = _1150;
        if (!_1162)
        {
            _1164 = _1076;
        }
        float _1168 = _1164;
        _1138 = _1168;
        if (!_1162)
        {
            _1166 = _1080;
        }
        float _1170 = _1166;
        bool _1172 = !_1162;
        _1144 = _1170;
        if (!_1172)
        {
            float _1174 = rsqrt(_1152);
            float _1176 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1178 = _1124 * _1174;
            float _1180 = _1122 * _1174;
            float _1182 = _1158 * _1178;
            float _1184 = _1126 * _1174;
            float _1186 = fma(_1156, _1180, _1182);
            float _1188 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1190 = fma(_1160, _1184, _1186);
            float _1192 = _1190 * _1188;
            float _1194 = fma(_1122, _1192, _1078);
            float _1196 = fma(_1124, _1192, _1076);
            float _1198 = fma(_1126, _1192, _1080);
            _1138 = _1196;
            _1132 = _1194;
            _1144 = _1198;
        }
    }
    float _1200 = _1138;
    float _1202 = _1132;
    float _1204 = _1144;
    float _1206 = -_462;
    float _1208 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1200);
    float _1210 = -_478;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1202);
    float _1214 = -_494;
    float _1216 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1204);
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1220 = _1208 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1224 = _1212 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1216 + _1226;
    float _1230 = _1220 * _1220;
    float _1232 = fma(_1224, _1224, _1230);
    float _1234 = fma(_1228, _1228, _1232);
    float _1236 = rsqrt(_1234);
    float _1238 = sqrt(_1234);
    float _1240 = _1236 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1242 = _1224 * _1240;
    float _1244 = _1228 * _1240;
    float _1246 = _1242 * _1242;
    float _1248 = _1244 * _1244;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1252 = fma(_1238, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1250);
    float _1254 = precise::clamp(_1252, 0.0, 1.0);
    float _1256 = _1246 + _1248;
    float _1258 = sqrt(_1256);
    bool _1260 = _1258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = _1258 + _1262;
    float _1266 = _1232;
    float _1268 = _1256;
    float _1270 = _1264;
    float _1272 = _1220;
    float _1274 = _1240;
    if (_1260)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1276;
    }
    float _1278 = _1266;
    if (_1260)
    {
        float _1280 = rsqrt(_1256);
        _1268 = _1280;
    }
    float _1282 = _1268;
    float _1284 = _1278;
    if (_1260)
    {
        float _1286 = _1264 * _1278;
        _1270 = _1286;
    }
    float _1288 = _1270;
    if (_1260)
    {
        float _1290 = _1288 * 0.15915493667125701904296875;
        _1134 = _1290;
    }
    float _1292 = _1134;
    float _1294 = _1236;
    if (_1260)
    {
        float _1296 = _1292 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        _1294 = _1298;
    }
    float _1300 = _1294;
    float _1302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1304 = precise::max(0.0, _1302);
    float _1306 = _1228;
    float _1308 = _1304;
    if (_1260)
    {
        float _1310 = _1292 * 6.283185482025146484375;
        float _1312 = cos(_1310);
        _1306 = _1312;
    }
    float _1314 = _1306;
    float _1316 = -_1240;
    float _1318 = -_1304;
    float _1320 = fma(_1220, _1316, _1318);
    if (_1260)
    {
        float _1322 = _1320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1272 = _1322;
    }
    float _1324 = _1272;
    float _1326 = _1300;
    float _1328 = _1324;
    if (_1260)
    {
        float _1330 = fma(_1300, _1324, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1274 = _1330;
    }
    float _1332 = _1274;
    float _1334 = _1332;
    if (!_1260)
    {
        _1326 = _1242;
    }
    float _1336 = _1326;
    float _1338 = _1336;
    if (!_1260)
    {
        _1328 = _1320;
    }
    float _1340 = _1328;
    float _1342 = _1340;
    float _1344 = _1314;
    if (_1260)
    {
        float _1346 = _1314 + (-1.0);
        _1308 = _1346;
    }
    float _1348 = _1308;
    float _1350 = _1348;
    if (_1260)
    {
        float _1352 = _1282 * _1332;
        _1334 = _1352;
    }
    float _1354 = _1334;
    float _1356 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_1260)
    {
        float _1358 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1284 = _1358;
    }
    float _1360 = _1284;
    float _1362 = _1360;
    if (_1260)
    {
        float _1364 = _1242 * _1354;
        _1338 = _1364;
    }
    float _1366 = _1338;
    if (!_1260)
    {
        _1350 = _1244;
    }
    float _1368 = _1350;
    float _1370 = _1368;
    if (_1260)
    {
        float _1372 = _1244 * _1354;
        _1370 = _1372;
    }
    float _1374 = _1370;
    if (_1260)
    {
        float _1376 = fma(_1320, _1314, _1360);
        _1342 = _1376;
    }
    float _1378 = _1342;
    if (!_1260)
    {
        _1344 = _1246;
    }
    float _1380 = _1344;
    float _1382 = _1380;
    if (_1260)
    {
        float _1384 = _1366 * _1366;
        _1382 = _1384;
    }
    float _1386 = _1382;
    float _1388 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1260)
    {
        _1362 = _1248;
    }
    float _1390 = _1362;
    float _1392 = _1390;
    if (_1260)
    {
        float _1394 = _1374 * _1374;
        _1392 = _1394;
    }
    float _1396 = _1392;
    float _1398 = fma(_1378, _1378, _1386);
    float _1400 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1402 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1388);
    float _1404 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1406 = _1398 + _1396;
    float _1408 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1356);
    float _1410 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1402);
    float _1412 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1400);
    float _1414 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1404);
    float _1416 = rsqrt(_1406);
    float _1418 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1408);
    float _1420 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1422 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1424 = -_1254;
    float _1426 = _1424 + 1.0;
    float _1428 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1430 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1412);
    float _1432 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1434 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1414);
    float _1436 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1438 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1432);
    float _1440 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1442 = abs(_1426);
    float _1444 = log2(_1442);
    float _1446 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1448 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1438);
    float _1450 = _1416 * _1366;
    float _1452 = _1416 * _1374;
    float _1454 = -_1446;
    float _1456 = fma(_1454, _1422, 1.0);
    float _1458 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1448);
    float _1460 = _1416 * _1378;
    float _1462 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1464 = log2(_1456);
    float _1466 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1468 = -_1462;
    float _1470 = fma(_1460, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1468);
    float _1472 = -_1452;
    float _1474 = fma(_1472, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1470);
    float _1476 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1478 = 1.0 / _1458;
    float _1480 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1482 = fma(_1474, -0.5, 0.5);
    float _1484 = fma(_1474, 0.5, 0.5);
    float _1486 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1466);
    float _1488 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1480);
    float _1490 = _1460 + 1.0;
    float _1492 = fma(_1484, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1494 = exp2(_1476);
    float _1496 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1488);
    float _1498 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1486);
    float _1500 = fma(_1484, _1492, -0.212114393711090087890625);
    float _1502 = _1464 * 0.693147182464599609375;
    float _1504 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1496);
    float _1506 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1498);
    float _1508 = fma(_1484, _1500, 1.570728778839111328125);
    float _1510 = sqrt(_1482);
    float _1512 = _1504 * _1478;
    float _1514 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1516 = fma(_1512, 0.5, 0.5);
    float _1518 = -_1460;
    float _1520 = fma(_1494, _1490, _1518);
    float _1522 = _1506 * _1478;
    float _1524 = fma(_1520, 0.5, 0.5);
    float _1526 = fma(_1522, -0.5, 0.5);
    float _1528 = _1510 * 0.636619746685028076171875;
    float _1530 = -_1508;
    float _1532 = fma(_1528, _1530, 1.0);
    float3 _4079 = float3(_1516, _1526, _1514);
    float _1534 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4079, float3(0.0), isnan(_4079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4079, float3(0.0), isnan(_4079)), level(0.0)).x;
    float3 _4090 = float3(_1516, _1526, _1514);
    float4 _1537 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4090, float3(0.0), isnan(_4090)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4090, float3(0.0), isnan(_4090)), level(0.0)).xyzw;
    float _1539 = _1537.x;
    float _1541 = _1537.y;
    float _1543 = _1537.z;
    float _1545 = _1537.w;
    float2 _4107 = float2(_1532, _1524);
    float3 _1549 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4107, float2(0.0), isnan(_4107)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4107, float2(0.0), isnan(_4107)), level(0.0)).xyz;
    float _1551 = _1549.x;
    float _1553 = _1549.y;
    float _1555 = _1549.z;
    float _1557 = _586 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1559 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1561 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1563 = isnan(0.5);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1569 = _1565 || _1567;
    float _1571 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1573 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1557);
    float _1575 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1571);
    float _1577 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1573);
    float _1579 = _586 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1581 = exp2(_1559);
    float _1583 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1575);
    float _1585 = _1577 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1587 = fma(_592, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1579);
    float _1589 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1583);
    float _1591 = _1571;
    if (_1569)
    {
        _1591 = 1.0;
    }
    float _1593 = _1591;
    float _1595 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1587);
    float _1597 = 1.0 / _1585;
    float _1599 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1601 = _1599 + _1585;
    float _1603 = _1601 * _1597;
    float _1605 = _1603 * 0.5;
    float _1607 = _1593;
    if (!_1569)
    {
        float _1609 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1611 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1613 = _1609 * 0.15915493667125701904296875;
        float _1615 = _1611 * 0.15915493667125701904296875;
        float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1619 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1617);
        float _1621 = _1613 * 6.283185482025146484375;
        float _1623 = cos(_1621);
        float _1625 = _1613 * 6.283185482025146484375;
        float _1627 = sin(_1625);
        float _1629 = 1.0 / _1623;
        float _1631 = _1615 * 6.283185482025146484375;
        float _1633 = cos(_1631);
        float _1635 = _1627 * _1629;
        float _1637 = _1615 * 6.283185482025146484375;
        float _1639 = sin(_1637);
        float _1641 = _1633 * _1635;
        float _1643 = 1.0 / _1619;
        float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1647 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1645;
        float _1649 = 1.0 / _1641;
        float _1651 = 1.0 / _1647;
        float _1653 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1655 = _1643 * _1653;
        float _1657 = _1639 * _1649;
        float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1661 = fma(_1657, _1655, _1659);
        float _1663 = _1661 * _1651;
        float _1665 = precise::clamp(_1663, 0.0, 1.0);
        _1607 = _1665;
    }
    float _1667 = _1607;
    float _1669 = -_1581;
    float _1671 = _1669 + 1.0;
    bool _1673 = _1667 > 0.0;
    bool _1675 = isnan(_1667);
    bool _1677 = _1673 || _1675;
    bool _1679 = isnan(0.0);
    bool _1681 = _1677 || _1679;
    float _1683 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1685 = _1589 + _1458;
    float _1687 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1689 = _1504 + _1458;
    float _1691 = _1458 * 0.5;
    out.m_65.x = _592;
    out.m_65.y = _586;
    out.m_65.z = _624;
    float _1693 = _1687 * _1534;
    float _1695 = -_1687;
    float _1697 = _1695 + 1.0;
    float _1699 = _1685 * 0.5;
    float _1701 = _1545 * _1693;
    float _1703 = _1555 * _1693;
    float _1705 = _1689 * 0.5;
    float _1707 = fma(_1506, -0.5, _1691);
    float _1709 = fma(_1551, _1701, _1539);
    float _1711 = fma(_1553, _1701, _1541);
    float _1713 = _1545 * _1697;
    float _1715 = _1683 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1717 = fma(_1545, _1703, _1543);
    out.gl_Position.x = _1504;
    out.gl_Position.y = _1506;
    out.gl_Position.z = _1589;
    out.gl_Position.w = _1458;
    out.m_67.x = _1705;
    out.m_67.y = _1707;
    out.m_67.z = _1699;
    out.m_67.w = _1458;
    out.m_45.x = _1715;
    out.m_69.x = _1709;
    out.m_69.y = _1711;
    out.m_69.z = _1717;
    out.m_69.w = _1713;
    if (_1681)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1719 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1719;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

