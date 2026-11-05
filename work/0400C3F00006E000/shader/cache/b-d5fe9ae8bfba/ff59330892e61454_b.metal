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
    float4 m_53 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _416 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2447 = as_type<float>(_106);
        out.gl_Position.z = _2447;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2517 = as_type<float>(_144);
        out.gl_Position.z = _2517;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_312;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _334;
    float _338 = 1.0 / _316;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _342 = _328 * _332;
    float _344 = -_328;
    float _346 = _344 + 1.0;
    float _348 = _300 * _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _350;
    float _354 = fma(_336, _348, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _356;
    float _360 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _362 = _354 * _342;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _366 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _368 = _360 * _342;
    float _370 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[107].x, _362);
    float _372 = _366 * _342;
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[107].z, _368);
    float _376 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[108].x, _370);
    float _378 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[107].y, _372);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[108].z, _374);
    float _382 = _376 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _384 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[108].y, _378);
    float _386 = _380 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _388 = _382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _390 = _384 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _392 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _388;
    out.m_53.y = _394;
    out.m_53.z = _392;
    out.m_53.w = _364;
    bool _396 = !_340;
    float _414;
    if (!_396)
    {
        float _398 = in.m_51.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_90);
        float _420 = 1.0 / _418;
        float _422 = _124 * _420;
        _414 = _422;
    }
    _416 = false;
    float _424 = _414;
    float _426 = in.m_51.z;
    float _428 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _430 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _432 = in.m_51.x;
    float _434 = in.m_51.y;
    float _436 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _428);
    float _438 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _450 = _448 != 0;
    float _452 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
    float _454 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _430);
    float _456 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _438);
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _460 = !_446;
    int _462 = _460 ? 0 : 1;
    float _464 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _466 = int(_464);
    bool _468 = !_442;
    int _470 = _468 ? 0 : 1;
    float _472 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _454);
    bool _474 = !_450;
    int _476 = _474 ? 0 : 1;
    float _478 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _456);
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _490 = _488 != 0;
    float _492 = _452 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _494 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _496 = log2(_494);
    float _498 = _426 * 2.0;
    float _500 = _472 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _504 = _478 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _506 = _432 * 2.0;
    float _508 = _434 * 2.0;
    float _510 = floor(_498);
    float _512 = _432 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _514 = _434 + _432;
    float _516 = _434 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _520 = -_458;
    float _522 = fma(_512, 2.0, _520);
    float _524 = _514 + (-1.0);
    float _526 = floor(_506);
    float _528 = fma(_516, -2.0, _502);
    float _530 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[78].w, _518);
    float _532 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _534 = !_482;
    int _536 = _534 ? 0 : 1;
    float _538 = -_124;
    float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[76].x, _522);
    bool _542 = _510 > 0.0;
    float _544 = floor(_508);
    bool _546 = _510 >= 0.0;
    bool _548 = isnan(_510);
    bool _550 = _546 || _548;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    int _556 = abs(_536);
    int _558 = _554 ? 0 : 1;
    bool _560 = _526 > 0.0;
    float _562 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _564 = int(_562);
    bool _566 = _526 >= 0.0;
    bool _568 = isnan(_526);
    bool _570 = _566 || _568;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    int _576 = ~_558;
    int _578 = _576 + 1;
    int _580 = _578 + 1;
    int _582 = _580;
    float _584 = _504;
    if (!_542)
    {
        int _586 = ~_558;
        int _588 = _586 + 1;
        _582 = _588;
    }
    int _590 = _582;
    int _592 = _574 ? 0 : 1;
    float _594 = float(_466);
    float _596 = float(_556);
    float _598 = float(_590);
    float _600 = 1.0 / _594;
    bool _602 = _544 > 0.0;
    bool _604 = _544 >= 0.0;
    bool _606 = isnan(_544);
    bool _608 = _604 || _606;
    bool _610 = isnan(0.0);
    bool _612 = _608 || _610;
    float _614 = _496 * _124;
    float _616 = _596 * _598;
    int _618 = ~_592;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = exp2(_614);
    float _626 = _616 * (-2.0);
    int _628 = _622;
    if (!_560)
    {
        int _630 = ~_592;
        int _632 = _630 + 1;
        _628 = _632;
    }
    int _634 = _628;
    float _636 = in.m_55.x;
    float _638 = in.m_55.y;
    float _640 = in.m_55.z;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _644 = 1.0 + _642;
    bool _646 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _648 = isnan(1.0);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _654 = _650 || _652;
    float _656 = _600 * _124;
    bool _658 = !_486;
    int _660 = _658 ? 0 : 1;
    float _662 = 1.0 / _644;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _666 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _674 = _670 || _672;
    float _676 = float(_564);
    float _678 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[78].z, _664);
    float _680 = -_624;
    float _682 = _680 + 1.0;
    float _684 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _528);
    float _686 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _530);
    float _688 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _678);
    int _690 = abs(_660);
    float _692 = _676 * _124;
    int _694 = _612 ? 0 : 1;
    float _696 = _674 ? _682 : 0.0;
    float _698 = float(_634);
    float _700 = fma(_532, _626, _532);
    float _702 = float(_690);
    if (_654)
    {
        float _704 = _696 * _662;
        _126 = _704;
    }
    float _706 = _126;
    int _708 = ~_694;
    int _710 = _708 + 1;
    int _712 = _710 + 1;
    float _714 = _432 + (-0.5);
    int _716 = _712;
    if (!_602)
    {
        int _718 = ~_694;
        int _720 = _718 + 1;
        _716 = _720;
    }
    int _722 = _716;
    float _724 = fma(_626, _636, _636);
    float _726 = _702 * _698;
    float _728 = -_492;
    float _730 = _728 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _732 = -_500;
    float _734 = _732 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _736 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[196].x, _724);
    bool _738 = !_490;
    int _740 = _738 ? 0 : 1;
    float _742 = _730 * _730;
    float _744 = _434 + _426;
    float _746 = -_504;
    float _748 = _746 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _750 = abs(_740);
    float _752 = fma(_734, _734, _742);
    float _754 = _744 + (-1.0);
    float _756 = _726 * (-2.0);
    float _758 = fma(_748, _748, _752);
    float _760 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _762 = float(_722);
    float _764 = fma(_700, _706, _736);
    float _766 = float(_750);
    float _768 = _434 + (-0.5);
    float _770 = fma(_756, _638, _638);
    float _772 = _764 * 0.15915493667125701904296875;
    float _774 = fma(_760, _756, _760);
    float _776 = _766 * _762;
    float _778 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[196].y, _770);
    float _780 = rsqrt(_758);
    float _782 = in.m_49.x;
    float _784 = in.m_49.y;
    float _786 = in.m_49.z;
    float _788 = _426 + _432;
    float _790 = _776 * (-2.0);
    float _792 = fma(_774, _706, _778);
    float _794 = _788 + (-1.0);
    float _796 = _426 + (-0.5);
    float _798 = fma(_790, _640, _640);
    float _800 = _792 * 0.15915493667125701904296875;
    float _802 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _804 = _772 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[196].z, _798);
    float _810 = fma(_802, _790, _802);
    float _812 = _734 * _780;
    float _814 = in.m_57.x;
    float _816 = in.m_57.y;
    float _818 = in.m_57.z;
    float _820 = fma(_810, _706, _808);
    float _822 = _772 * 6.283185482025146484375;
    float _824 = cos(_822);
    float _826 = _748 * _780;
    float _828 = _730 * _780;
    float _830 = _820 * 0.15915493667125701904296875;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _834 = _826 * _832;
    float _836 = _782 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _838 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _840 = _828 * _838;
    float _842 = _800 * 6.283185482025146484375;
    float _844 = sin(_842);
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _848 = _812 * _846;
    float _850 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _852 = -_834;
    float _854 = fma(_828, _850, _852);
    bool _856 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _858 = isnan(0.5);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _864 = _860 || _862;
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _868 = -_848;
    float _870 = fma(_826, _866, _868);
    float _872 = _784 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _876 = -_840;
    float _878 = fma(_812, _874, _876);
    float _880 = _800 * 6.283185482025146484375;
    float _882 = cos(_880);
    float _884 = _870 * _870;
    float _886 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _816);
    float _890 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _818);
    float _892 = _830 * 6.283185482025146484375;
    float _894 = sin(_892);
    float _896 = _786 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _898 = fma(_854, _854, _884);
    float _900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _814);
    float _902 = _824 * _844;
    float _904 = _896 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _906 = fma(_878, _878, _898);
    float _908 = _836 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _910 = _830 * 6.283185482025146484375;
    float _912 = cos(_910);
    float _914 = _806 * _882;
    float _916 = _904 * _890;
    float _918 = _908 * _900;
    float _920 = rsqrt(_906);
    float _922 = _886 * _888;
    float _924 = -_902;
    float _926 = fma(_894, _914, _924);
    float _928 = -_914;
    float _930 = fma(_894, _902, _928);
    float _932 = _806 * _844;
    float _934 = _824 * _882;
    float _936 = -_922;
    float _938 = _894 * _936;
    float _940 = _912 * _922;
    float _942 = _844 * _912;
    float _944 = fma(_894, _934, _932);
    float _946 = fma(_894, _932, _934);
    float _948 = _824 * _940;
    float _950 = _882 * _912;
    float _952 = _806 * _940;
    float _954 = _854 * _920;
    float _956 = fma(_944, _918, _948);
    float _958 = _870 * _920;
    float _960 = _878 * _920;
    float _962 = _828 * _954;
    float _964 = fma(_930, _916, _956);
    float _966 = fma(_950, _918, _938);
    float _968 = _826 * _958;
    float _970 = -_962;
    float _972 = fma(_812, _958, _970);
    float _974 = fma(_926, _918, _952);
    float _976 = fma(_942, _916, _966);
    float _978 = -_968;
    float _980 = fma(_828, _960, _978);
    float _982 = _972 * _964;
    float _984 = fma(_946, _916, _974);
    float _986 = _980 * _964;
    float _988 = fma(_960, _976, _982);
    float _990 = fma(_954, _976, _986);
    float _992 = fma(_826, _984, _988);
    float _994 = fma(_812, _984, _990);
    float _996 = _504 + _992;
    float _998 = _492 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1000 = _812 * _960;
    float _1002 = _500 + _994;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1006 = _996 + _1004;
    float _1008 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[11].x, _998);
    float _1010 = -_1000;
    float _1012 = fma(_826, _954, _1010);
    float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1016 = _1002 + _1014;
    float _1018 = _1006 * _1006;
    float _1020 = _1012 * _964;
    float _1022 = _1012;
    float _1024 = _1020;
    float _1026 = _1002;
    float _1028 = _930;
    if (_864)
    {
        _1022 = 1.0;
    }
    float _1030 = _1022;
    float _1032 = fma(_1016, _1016, _1018);
    float _1034 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1008);
    float _1036 = _492 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1038 = fma(_958, _976, _1020);
    float _1040 = sqrt(_1032);
    float _1042 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1044 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1036);
    float _1046 = fma(_828, _984, _1038);
    float _1048 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1044);
    float _1050 = _492 + _1046;
    float _1052 = 1.0 / _1042;
    float _1054 = _1048 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1056 = _1054 + _1042;
    bool _1058 = _1040 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1060 = _1056 * _1052;
    float _1062 = _1060 * 0.5;
    float _1064 = _1038;
    float _1066 = _1056;
    float _1068 = _1030;
    if (!_1058)
    {
        _1024 = _1002;
    }
    float _1070 = _1024;
    float _1072 = _1070;
    if (!_1058)
    {
        _1064 = _996;
    }
    float _1074 = _1064;
    float _1076 = _1074;
    if (!_1058)
    {
        _1066 = _1050;
    }
    float _1078 = _1066;
    bool _1080 = !_1058;
    float _1082 = _1078;
    if (!_1080)
    {
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1088 = _1040 + _1086;
        float _1090 = rsqrt(_1032);
        float _1092 = _1088 * _1084;
        float _1094 = _1050 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1096 = _1092 * 0.15915493667125701904296875;
        float _1098 = _1096 * 6.283185482025146484375;
        float _1100 = cos(_1098);
        float _1102 = _1096 * 6.283185482025146484375;
        float _1104 = sin(_1102);
        float _1106 = _1100 + (-1.0);
        float _1108 = fma(_1104, _1094, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1106 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = _1090 * _1108;
        float _1114 = fma(_1050, _1100, _1110);
        float _1116 = fma(_1016, _1112, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1118 = fma(_1006, _1112, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _584 = _1096;
        _1082 = _1114;
        _1072 = _1116;
        _1076 = _1118;
    }
    float _1120 = _584;
    float _1122 = _1082;
    float _1124 = _1072;
    float _1126 = _1076;
    float _1128 = _1120;
    if (!_864)
    {
        float _1130 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1132 = _1130 * 0.15915493667125701904296875;
        float _1134 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1138 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1136);
        float _1140 = _1132 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        float _1144 = _1134 * 0.15915493667125701904296875;
        float _1146 = _1132 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        float _1150 = 1.0 / _1142;
        float _1152 = _1144 * 6.283185482025146484375;
        float _1154 = cos(_1152);
        float _1156 = _1148 * _1150;
        float _1158 = _1144 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        float _1162 = _1154 * _1156;
        float _1164 = 1.0 / _1138;
        float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1168 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1166;
        float _1170 = 1.0 / _1162;
        float _1172 = 1.0 / _1168;
        float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1176 = _1164 * _1174;
        float _1178 = _1160 * _1170;
        float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1182 = fma(_1178, _1176, _1180);
        float _1184 = _1182 * _1172;
        float _1186 = precise::clamp(_1184, 0.0, 1.0);
        _1128 = _1176;
        _1068 = _1186;
    }
    float _1188 = _1128;
    float _1190 = _1068;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1194 = _1122 + _1192;
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1198 = _1124 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1202 = _1126 + _1200;
    float _1204 = _1194 * _1194;
    float _1206 = fma(_1198, _1198, _1204);
    float _1208 = fma(_1202, _1202, _1206);
    float _1210 = rsqrt(_1208);
    float _1212 = sqrt(_1208);
    float _1214 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1216 = _1198 * _1214;
    float _1218 = _1202 * _1214;
    float _1220 = _1216 * _1216;
    float _1222 = _1218 * _1218;
    float _1224 = _1220 + _1222;
    float _1226 = sqrt(_1224);
    bool _1228 = _1226 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = _1226 + _1230;
    float _1234 = _1206;
    float _1236 = _1210;
    float _1238 = _1232;
    float _1240 = _1194;
    if (_1228)
    {
        float _1242 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1234 = _1242;
    }
    float _1244 = _1234;
    if (_1228)
    {
        float _1246 = rsqrt(_1224);
        _1236 = _1246;
    }
    float _1248 = _1236;
    float _1250 = _1244;
    float _1252 = _1248;
    if (_1228)
    {
        float _1254 = _1232 * _1244;
        _1238 = _1254;
    }
    float _1256 = _1238;
    if (_1228)
    {
        float _1258 = _1256 * 0.15915493667125701904296875;
        _1250 = _1258;
    }
    float _1260 = _1250;
    float _1262 = _1202;
    float _1264 = _1260;
    if (_1228)
    {
        float _1266 = _1260 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        _1262 = _1268;
    }
    float _1270 = _1262;
    float _1272 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1274 = precise::max(0.0, _1272);
    float _1276 = _1188;
    float _1278 = _1274;
    if (_1228)
    {
        float _1280 = _1260 * 6.283185482025146484375;
        float _1282 = cos(_1280);
        _1276 = _1282;
    }
    float _1284 = _1276;
    float _1286 = -_1214;
    float _1288 = -_1274;
    float _1290 = fma(_1194, _1286, _1288);
    if (_1228)
    {
        float _1292 = _1290 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1240 = _1292;
    }
    float _1294 = _1240;
    float _1296 = _1294;
    if (!_1228)
    {
        _1264 = _1220;
    }
    float _1298 = _1264;
    float _1300 = _1270;
    float _1302 = _1298;
    if (_1228)
    {
        float _1304 = fma(_1270, _1294, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1296 = _1304;
    }
    float _1306 = _1296;
    float _1308 = _1306;
    if (!_1228)
    {
        _1300 = _1290;
    }
    float _1310 = _1300;
    float _1312 = _1310;
    if (_1228)
    {
        float _1314 = _1284 + (-1.0);
        _1278 = _1314;
    }
    float _1316 = _1278;
    float _1318 = _1316;
    if (_1228)
    {
        float _1320 = _1248 * _1306;
        _1026 = _1320;
    }
    float _1322 = _1026;
    if (!_1228)
    {
        _1252 = _1216;
    }
    float _1324 = _1252;
    float _1326 = _1324;
    if (_1228)
    {
        float _1328 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1318 = _1328;
    }
    float _1330 = _1318;
    float _1332 = _1330;
    if (_1228)
    {
        float _1334 = _1216 * _1322;
        _1326 = _1334;
    }
    float _1336 = _1326;
    if (!_1228)
    {
        _1308 = _1218;
    }
    float _1338 = _1308;
    float _1340 = _1338;
    if (_1228)
    {
        float _1342 = _1218 * _1322;
        _1340 = _1342;
    }
    float _1344 = _1340;
    if (_1228)
    {
        float _1346 = fma(_1290, _1284, _1330);
        _1312 = _1346;
    }
    float _1348 = _1312;
    if (_1228)
    {
        float _1350 = _1336 * _1336;
        _1302 = _1350;
    }
    float _1352 = _1302;
    if (!_1228)
    {
        _1332 = _1222;
    }
    float _1354 = _1332;
    float _1356 = _1354;
    if (_1228)
    {
        float _1358 = _1344 * _1344;
        _1356 = _1358;
    }
    float _1360 = _1356;
    float _1362 = fma(_1348, _1348, _1352);
    float _1364 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1366 = _1362 + _1360;
    float _1368 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1364);
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1372 = fma(_1212, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1370);
    float _1374 = precise::clamp(_1372, 0.0, 1.0);
    float _1376 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1378 = rsqrt(_1366);
    float _1380 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1368);
    float _1382 = -_1374;
    float _1384 = _1382 + 1.0;
    float _1386 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1388 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1376);
    float _1390 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1392 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1394 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1386);
    float _1396 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1388);
    float _1398 = abs(_1384);
    float _1400 = log2(_1398);
    float _1402 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1392);
    float _1404 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1394);
    float _1406 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1408 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1410 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1416 = _1378 * _1336;
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1420 = _1378 * _1348;
    float _1422 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1414);
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1426 = _1378 * _1344;
    float _1428 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1430 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1422);
    float _1432 = -_1424;
    float _1434 = fma(_1420, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1432);
    float _1436 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1438 = -_1428;
    float _1440 = fma(_1438, _1390, 1.0);
    float _1442 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1430);
    float _1444 = -_1426;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1434);
    float _1448 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1450 = exp2(_1436);
    float _1452 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1454 = fma(_1446, -0.5, 0.5);
    float _1456 = fma(_1446, 0.5, 0.5);
    float _1458 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1448);
    float _1460 = _1420 + 1.0;
    float _1462 = fma(_1456, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1464 = log2(_1440);
    float _1466 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1452);
    float _1468 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1458);
    float _1470 = fma(_1456, _1462, -0.212114393711090087890625);
    float _1472 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1466);
    float _1474 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1468);
    float _1476 = fma(_1456, _1470, 1.570728778839111328125);
    float _1478 = 1.0 / _1442;
    float _1480 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1472);
    float _1482 = -_1420;
    float _1484 = fma(_1450, _1460, _1482);
    float _1486 = fma(_1484, 0.5, 0.5);
    float _1488 = sqrt(_1454);
    float _1490 = _1464 * 0.693147182464599609375;
    float _1492 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1494 = _1474 * _1478;
    float _1496 = _1480 * _1478;
    float _1498 = fma(_1494, 0.5, 0.5);
    float _1500 = fma(_1496, -0.5, 0.5);
    float _1502 = _1488 * 0.636619746685028076171875;
    float _1504 = -_1476;
    float _1506 = fma(_1502, _1504, 1.0);
    float3 _4637 = float3(_1498, _1500, _1492);
    float _1508 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4637, float3(0.0), isnan(_4637)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4637, float3(0.0), isnan(_4637)), level(0.0)).x;
    float3 _4648 = float3(_1498, _1500, _1492);
    float4 _1511 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4648, float3(0.0), isnan(_4648)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4648, float3(0.0), isnan(_4648)), level(0.0)).xyzw;
    float _1513 = _1511.x;
    float _1515 = _1511.y;
    float _1517 = _1511.z;
    float _1519 = _1511.w;
    float2 _4665 = float2(_1506, _1486);
    float3 _1523 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4665, float2(0.0), isnan(_4665)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4665, float2(0.0), isnan(_4665)), level(0.0)).xyz;
    float _1525 = _1523.x;
    float _1527 = _1523.y;
    float _1529 = _1523.z;
    float _1531 = float(uint(_564));
    float _1533 = trunc(_656);
    int _1535 = int(_1533);
    int _1537 = ~_564;
    int _1539 = _1537 + 1;
    float _1541 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1543 = abs(_462);
    int _1545 = abs(_476);
    float _1547 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1541);
    float _1549 = 1.0 / _1531;
    float _1551 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1547);
    int _1553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1555 = _1553 != 0;
    float _1557 = float(uint(_1535));
    bool _1559 = !_1555;
    float _1561 = _1559 ? 7.345489978790283203125 : 1.0;
    float _1563 = float(_90);
    float _1565 = float(_1535);
    float _1567 = _1561 * _432;
    int _1569 = as_type<int>(_1549) + (-2);
    bool _1571 = _1565 >= _676;
    bool _1573 = isnan(_1565);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan(_676);
    bool _1579 = _1575 || _1577;
    float _1581 = float(_1579);
    float _1583 = floor(_1567);
    float _1585 = as_type<float>(_1569) * _1557;
    float _1587 = trunc(_1585);
    float _1589 = precise::max(_1587, 0.0);
    uint _1592 = uint(_1589);
    float _1594 = 1.0 / _1563;
    float _1596 = -_1583;
    float _1598 = _1567 + _1596;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1602 = _1600 != 0;
    int _1604 = _1539 * int(_1592);
    int _1606 = _1604 + _1535;
    float _1608 = trunc(_1581);
    int _1610 = int(_1608);
    float _1612 = float(uint(_1606));
    float _1614 = _692 * _1594;
    bool _1616 = !_1602;
    int _1618 = _1616 ? 0 : 1;
    float _1620 = as_type<float>(_1569) * _1612;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1624 = _1622 != 0;
    int _1626 = abs(_1618);
    float _1628 = trunc(_1620);
    float _1630 = precise::max(_1628, 0.0);
    uint _1632 = uint(_1630);
    float _1634 = in.m_59.x;
    float _1636 = trunc(_1614);
    int _1638 = int(_1636);
    int _1640 = int(_1592) + int(_1632);
    int _1642 = _1539 * _1640;
    int _1644 = _1642 + _1535;
    bool _1646 = uint(_1644) >= uint(_564);
    bool _1648 = !_1646;
    int _1650 = _1648 ? 0 : (-1);
    bool _1652 = _564 == 0;
    int _1654 = ~_1640;
    int _1656 = _1654 + _1650;
    int _1658 = _1656 + 1;
    float _1660 = _1598 * _676;
    int _1662 = ~_1610;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    int _1668 = _564 + (-1);
    int _1670 = _564 * _1658;
    int _1672 = _1670 + _1535;
    float _1674 = trunc(_1660);
    int _1676 = int(_1674);
    bool _1678 = !_1652;
    int _1680 = _1678 ? _1672 : (-1);
    int _1682 = _1680 * _1666;
    int _1684 = ~_564;
    int _1686 = _1684 + 1;
    float _1688 = in.m_61.w;
    int _1690 = _1610 * _1668;
    int _1692 = _1690 + _1682;
    int _1694 = abs(_470);
    int _1696 = _1676 * _1626;
    int _1698 = _1696 + _1535;
    bool _1700 = !_1624;
    int _1702 = _1700 ? 0 : 1;
    int _1704 = _1692 * _1543;
    int _1706 = abs(_1702);
    int _1708 = _1638 * _1694;
    int _1710 = _1708 + _1704;
    int _1712 = ~_564;
    int _1714 = _1712 + 1;
    float _1716 = float(uint(_1698));
    int _1718 = _1698 * _1545;
    int _1720 = _1718 + _1710;
    int _1722 = _1676 * _1706;
    int _1724 = _1722 + _1720;
    int _1726 = ~_564;
    int _1728 = _1726 + 1;
    float _1730 = as_type<float>(_1569) * _1716;
    out.m_63.w = _1688;
    float _1732 = float(uint(_1724));
    float _1734 = trunc(_1730);
    float _1736 = precise::max(_1734, 0.0);
    uint _1738 = uint(_1736);
    float _1740 = as_type<float>(_1569) * _1732;
    float _1742 = trunc(_1740);
    float _1744 = precise::max(_1742, 0.0);
    uint _1746 = uint(_1744);
    int _1748 = _1728 * int(_1746);
    int _1750 = _1748 + _1724;
    float _1752 = float(uint(_1750));
    float _1754 = as_type<float>(_1569) * _1752;
    float _1756 = trunc(_1754);
    float _1758 = precise::max(_1756, 0.0);
    uint _1760 = uint(_1758);
    int _1762 = int(_1746) + int(_1760);
    int _1764 = ~_564;
    int _1766 = _1764 + 1;
    int _1768 = _1714 * _1762;
    int _1770 = _1768 + _1724;
    bool _1772 = uint(_1770) >= uint(_564);
    bool _1774 = !_1772;
    int _1776 = _1774 ? 0 : (-1);
    int _1778 = ~_1762;
    int _1780 = _1778 + _1776;
    int _1782 = _1780 + 1;
    int _1784 = _564 * _1782;
    int _1786 = _1784 + _1724;
    int _1788 = _1766 * int(_1738);
    int _1790 = _1788 + _1698;
    bool _1792 = !_1652;
    int _1794 = _1792 ? _1786 : (-1);
    float _1796 = float(uint(_1790));
    int _1798 = _1794 >> 31;
    int _1800 = _1794 & 3;
    bool _1802 = _1800 != 0;
    float _1804 = as_type<float>(_1569) * _1796;
    int _1806 = _1798 & 3;
    int _1808 = _1794 + _1806;
    float _1810 = trunc(_1804);
    float _1812 = precise::max(_1810, 0.0);
    uint _1814 = uint(_1812);
    int _1816 = _1808 >> 2;
    int _1818 = _1816 << 4;
    int _1820 = _1818 + 368;
    int _1822 = _1794 & 3;
    bool _1824 = _1822 != 0;
    uint _1826 = uint(int(uint(_1820) >> uint(2)));
    uint _1828 = uint(int(uint(int(_1826)) >> uint(2)));
    int _1830 = int(_1826) & 3;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[int(_1828)][_1830];
    int _1834 = int(_1826) + 1;
    uint _1836 = uint(int(uint(_1834) >> uint(2)));
    int _1838 = _1834 & 3;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[int(_1836)][_1838];
    int _1842 = _1802 ? 0 : 1;
    bool _1844 = uint(_1822) > 1u;
    int _1846 = int(_1738) + int(_1814);
    bool _1848 = _1822 != 3;
    int _1850 = _1820 + 8;
    uint _1852 = uint(int(uint(_1850) >> uint(2)));
    uint _1854 = uint(int(uint(int(_1852)) >> uint(2)));
    int _1856 = int(_1852) & 3;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[int(_1854)][_1856];
    int _1860 = int(_1852) + 1;
    uint _1862 = uint(int(uint(_1860) >> uint(2)));
    int _1864 = _1860 & 3;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[int(_1862)][_1864];
    int _1868 = _1686 * _1846;
    int _1870 = _1868 + _1698;
    bool _1872 = uint(_1870) >= uint(_564);
    float _1874 = in.m_61.z;
    bool _1876 = !_1872;
    int _1878 = _1876 ? 0 : (-1);
    bool _1880 = uint(_1822) >= 2u;
    int _1882 = ~_1846;
    int _1884 = _1882 + _1878;
    int _1886 = _1884 + 1;
    int _1888 = ~_1842;
    int _1890 = _1888 + 1;
    int _1892 = _1890 + 1;
    int _1894 = _1892;
    if (!_1844)
    {
        int _1896 = ~_1842;
        int _1898 = _1896 + 1;
        _1894 = _1898;
    }
    int _1900 = _1894;
    int _1902 = _564 * _1886;
    int _1904 = _1902 + _1698;
    int _1906 = _1880 ? 0 : 1;
    bool _1908 = !_1824;
    int _1910 = _1908 ? 0 : 1;
    int _1912 = abs(_1900);
    bool _1914 = _1822 != 3;
    int _1916 = ~_1906;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    int _1922 = _1920;
    if (_1848)
    {
        int _1924 = ~_1906;
        int _1926 = _1924 + 1;
        _1922 = _1926;
    }
    int _1928 = _1922;
    int _1930 = abs(_1910);
    out.m_63.z = _1874;
    float _1932 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1934 = int(_1932);
    int _1936 = ~_1912;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    bool _1942 = !_1914;
    int _1944 = _1942 ? 0 : (-1);
    int _1946 = abs(_1928);
    int _1948 = _1940 * as_type<int>(_1840);
    int _1950 = ~_1930;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    int _1956 = abs(_1944);
    int _1958 = _1954 * as_type<int>(_1832);
    int _1960 = _1958 + _1948;
    int _1962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1964 = _1962 != 0;
    int _1966 = ~_1946;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    float _1972 = in.m_61.x;
    bool _1974 = !_1964;
    int _1976 = _1974 ? 0 : 1;
    int _1978 = ~_1956;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    int _1984 = _1970 * as_type<int>(_1858);
    int _1986 = _1984 + _1960;
    int _1988 = abs(_1976);
    int _1990 = abs(_1934);
    int _1992 = _1982 * as_type<int>(_1866);
    int _1994 = _1992 + _1986;
    float _1996 = float(uint(_1934));
    float _1998 = float(uint(_1990));
    int _2000 = ~_1988;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    float _2006 = 1.0 / _1996;
    int _2008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2010 = _2008 != 0;
    int _2012 = _1994 * _2004;
    bool _2014 = !_1652;
    int _2016 = _2014 ? _1904 : (-1);
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2020 = _2018 != 0;
    float _2022 = in.m_61.y;
    float _2024 = 1.0 / _1998;
    int _2026 = _2016 * _1988;
    int _2028 = _2026 + _2012;
    int _2030 = ~_1934;
    int _2032 = _2030 + 1;
    out.m_63.x = _1972;
    bool _2034 = _434 > 0.5;
    int _2036 = abs(_2028);
    if (_2010)
    {
        float _2038 = in.m_51.x;
        _1028 = _2038;
    }
    float _2040 = _1028;
    int _2042 = as_type<int>(_2006) + (-2);
    float _2044 = float(uint(_2028));
    int _2046 = ~_1990;
    int _2048 = _2046 + 1;
    float _2050 = as_type<float>(_2042) * _2044;
    int _2052 = as_type<int>(_2024) + (-2);
    float _2054 = in.m_59.y;
    float _2056 = float(uint(_2036));
    float _2058 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2058;
    float _2062 = trunc(_2050);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    float _2068 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2070 = _424 + _2068;
    float _2072 = as_type<float>(_2052) * _2056;
    out.m_63.y = _2022;
    bool _2074 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2076 = isnan(_424);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2082 = _2078 || _2080;
    float _2084 = float(_2082);
    float _2086 = trunc(_2072);
    float _2088 = precise::max(_2086, 0.0);
    uint _2090 = uint(_2088);
    float _2092 = 1.0 / _2060;
    int _2094 = _2032 * int(_2066);
    int _2096 = _2094 + _2028;
    float _2098 = float(uint(_2096));
    int _2100 = _2048 * int(_2090);
    int _2102 = _2100 + _2036;
    float _2104 = -_2054;
    float _2106 = _2104 + 1.0;
    float _2108 = as_type<float>(_2042) * _2098;
    bool _2110 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2112 = isnan(_424);
    bool _2114 = _2110 || _2112;
    bool _2116 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2118 = _2114 || _2116;
    float _2120 = float(_2118);
    float _2122 = float(uint(_2102));
    float _2124 = _2070 * _2092;
    float _2126 = trunc(_2108);
    float _2128 = precise::max(_2126, 0.0);
    uint _2130 = uint(_2128);
    float _2132 = as_type<float>(_2052) * _2122;
    float _2134 = _2054;
    float _2136 = as_type<float>(_2052);
    if (_2020)
    {
        float _2138 = _2034 ? _2106 : _2054;
        _2134 = _2138;
    }
    float _2140 = _2134;
    float _2142 = -_2120;
    float _2144 = _2142 + 1.0;
    bool _2146 = _2040 > 0.5;
    bool _2148 = _2146 && _2010;
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2150;
    float _2154 = _2152;
    if (_2010)
    {
        _2136 = _1634;
    }
    float _2156 = _2136;
    float _2158 = _2084 * _2144;
    float _2160 = trunc(_2132);
    float _2162 = precise::max(_2160, 0.0);
    uint _2164 = uint(_2162);
    float _2166 = fma(_2152, _2124, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2168 = _2156;
    if (!_2010)
    {
        _2154 = _1634;
    }
    float _2170 = _2154;
    float _2172 = -_2084;
    float _2174 = _2172 + 1.0;
    int _2176 = ~_1934;
    int _2178 = _2176 + 1;
    float _2180 = _2166 * _2158;
    int _2182 = ~_1990;
    int _2184 = _2182 + 1;
    int _2186 = int(_2066) + int(_2130);
    float _2188 = _2170;
    if (_2148)
    {
        float _2190 = -_2156;
        float _2192 = _2190 + 1.0;
        _2168 = _2192;
    }
    float _2194 = _2168;
    float _2196 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2180);
    int _2198 = _2178 * _2186;
    int _2200 = _2198 + _2028;
    if (_2010)
    {
        _2188 = _2194;
    }
    float _2202 = _2188;
    float _2204 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2206 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2204;
    int _2208 = int(_2090) + int(_2164);
    float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2212 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2210;
    float _2214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2216 = uint(_2200) >= uint(_1934);
    float _2218 = fma(_2206, _2124, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    int _2220 = _2184 * _2208;
    int _2222 = _2220 + _2036;
    float _2224 = fma(_2212, _2124, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2226 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2196);
    float _2228 = _2218 * _2158;
    bool _2230 = uint(_2222) >= uint(_1990);
    float _2232 = _2224 * _2158;
    int _2234 = _2028 ^ _1934;
    float _2236 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2228);
    bool _2238 = !_2230;
    int _2240 = _2238 ? 0 : (-1);
    float _2242 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2232);
    uint _2244 = uint(int(uint(_2234) >> uint(31)));
    float _2246 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2236);
    bool _2248 = !_2216;
    int _2250 = _2248 ? 0 : (-1);
    float _2252 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2242);
    int _2254 = ~_2240;
    int _2256 = _2208 + _2254;
    int _2258 = _2256 + 1;
    float _2260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2262 = ~_2186;
    int _2264 = _2262 + _2250;
    int _2266 = _2264 + 1;
    float _2268 = _2226 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2270 = ~int(_2244);
    int _2272 = _2270 + 1;
    float _2274 = _2214 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2276 = _1934 == 0;
    int _2278 = _1934 * _2266;
    int _2280 = _2278 + _2028;
    int _2282 = _2258 ^ _2272;
    float _2284 = fma(_2274, _2202, -0.5);
    bool _2286 = _1934 == 0;
    float _2288 = _2246 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2290 = !_2276;
    int _2292 = _2290 ? _2280 : (-1);
    float _2294 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2296 = _2252 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2298 = ~_2272;
    int _2300 = _2298 + _2282;
    int _2302 = _2300 + 1;
    float _2304 = _2268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2306 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2308 = _2288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2310 = exp2(_2294);
    float _2312 = _2296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2314 = !_2286;
    int _2316 = _2314 ? _2302 : (-1);
    float _2318 = fma(_2306, _2140, -0.5);
    float _2320 = float(_2292);
    float _2322 = float(_2316);
    out.m_65.x = _2304;
    out.m_65.y = _2308;
    out.m_65.z = _2312;
    bool _2324 = _1190 > 0.0;
    bool _2326 = isnan(_1190);
    bool _2328 = _2324 || _2326;
    bool _2330 = isnan(0.0);
    bool _2332 = _2328 || _2330;
    float _2334 = fma(_2274, _2320, _540);
    float _2336 = -_684;
    float _2338 = fma(_2306, _2322, _2336);
    float _2340 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1551);
    float _2342 = fma(_688, _2284, _2334);
    float _2344 = _1442 * 0.5;
    float _2346 = fma(_686, _2318, _2338);
    float _2348 = -_2310;
    float _2350 = _2348 + 1.0;
    float _2352 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2354 = _2340 + _1442;
    float _2356 = _1474 + _1442;
    float _2358 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1474;
    out.gl_Position.y = _1480;
    out.gl_Position.z = _2340;
    out.gl_Position.w = _1442;
    float _2360 = _2354 * 0.5;
    float _2362 = _2358 * _1508;
    float _2364 = -_2358;
    float _2366 = _2364 + 1.0;
    float _2368 = _2356 * 0.5;
    float _2370 = fma(_1480, -0.5, _2344);
    float _2372 = _1519 * _2362;
    float _2374 = _1529 * _2362;
    float _2376 = _2342 + 0.5;
    float _2378 = _2346 + 0.5;
    float _2380 = fma(_1525, _2372, _1513);
    float _2382 = _2352 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2384 = fma(_1527, _2372, _1515);
    float _2386 = _1519 * _2366;
    float _2388 = fma(_1519, _2374, _1517);
    out.m_67.x = _2368;
    out.m_67.y = _2370;
    out.m_67.z = _2360;
    out.m_67.w = _1442;
    out.m_69.x = _2376;
    out.m_69.y = _2378;
    out.m_45.x = _2382;
    out.m_71.x = _2380;
    out.m_71.y = _2384;
    out.m_71.z = _2388;
    out.m_71.w = _2386;
    if (_2332)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2390 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2390;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _416 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2447 = as_type<float>(_106);
        out.gl_Position.z = _2447;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2517 = as_type<float>(_144);
        out.gl_Position.z = _2517;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_312;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _334;
    float _338 = 1.0 / _316;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _342 = _328 * _332;
    float _344 = -_328;
    float _346 = _344 + 1.0;
    float _348 = _300 * _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _350;
    float _354 = fma(_336, _348, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _356;
    float _360 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _362 = _354 * _342;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _366 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _368 = _360 * _342;
    float _370 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[107].x, _362);
    float _372 = _366 * _342;
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[107].z, _368);
    float _376 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[108].x, _370);
    float _378 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[107].y, _372);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[108].z, _374);
    float _382 = _376 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _384 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[108].y, _378);
    float _386 = _380 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _388 = _382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _390 = _384 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _392 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _388;
    out.m_53.y = _394;
    out.m_53.z = _392;
    out.m_53.w = _364;
    bool _396 = !_340;
    float _414;
    if (!_396)
    {
        float _398 = in.m_51.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_90);
        float _420 = 1.0 / _418;
        float _422 = _124 * _420;
        _414 = _422;
    }
    _416 = false;
    float _424 = _414;
    float _426 = in.m_51.z;
    float _428 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _430 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _432 = in.m_51.x;
    float _434 = in.m_51.y;
    float _436 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _428);
    float _438 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _450 = _448 != 0;
    float _452 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
    float _454 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _430);
    float _456 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _438);
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _460 = !_446;
    int _462 = _460 ? 0 : 1;
    float _464 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _466 = int(_464);
    bool _468 = !_442;
    int _470 = _468 ? 0 : 1;
    float _472 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _454);
    bool _474 = !_450;
    int _476 = _474 ? 0 : 1;
    float _478 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _456);
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _490 = _488 != 0;
    float _492 = _452 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _494 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _496 = log2(_494);
    float _498 = _426 * 2.0;
    float _500 = _472 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _504 = _478 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _506 = _432 * 2.0;
    float _508 = _434 * 2.0;
    float _510 = floor(_498);
    float _512 = _432 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _514 = _434 + _432;
    float _516 = _434 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _520 = -_458;
    float _522 = fma(_512, 2.0, _520);
    float _524 = _514 + (-1.0);
    float _526 = floor(_506);
    float _528 = fma(_516, -2.0, _502);
    float _530 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[78].w, _518);
    float _532 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _534 = !_482;
    int _536 = _534 ? 0 : 1;
    float _538 = -_124;
    float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[76].x, _522);
    bool _542 = _510 > 0.0;
    float _544 = floor(_508);
    bool _546 = _510 >= 0.0;
    bool _548 = isnan(_510);
    bool _550 = _546 || _548;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    int _556 = abs(_536);
    int _558 = _554 ? 0 : 1;
    bool _560 = _526 > 0.0;
    float _562 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _564 = int(_562);
    bool _566 = _526 >= 0.0;
    bool _568 = isnan(_526);
    bool _570 = _566 || _568;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    int _576 = ~_558;
    int _578 = _576 + 1;
    int _580 = _578 + 1;
    int _582 = _580;
    float _584 = _504;
    if (!_542)
    {
        int _586 = ~_558;
        int _588 = _586 + 1;
        _582 = _588;
    }
    int _590 = _582;
    int _592 = _574 ? 0 : 1;
    float _594 = float(_466);
    float _596 = float(_556);
    float _598 = float(_590);
    float _600 = 1.0 / _594;
    bool _602 = _544 > 0.0;
    bool _604 = _544 >= 0.0;
    bool _606 = isnan(_544);
    bool _608 = _604 || _606;
    bool _610 = isnan(0.0);
    bool _612 = _608 || _610;
    float _614 = _496 * _124;
    float _616 = _596 * _598;
    int _618 = ~_592;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = exp2(_614);
    float _626 = _616 * (-2.0);
    int _628 = _622;
    if (!_560)
    {
        int _630 = ~_592;
        int _632 = _630 + 1;
        _628 = _632;
    }
    int _634 = _628;
    float _636 = in.m_55.x;
    float _638 = in.m_55.y;
    float _640 = in.m_55.z;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _644 = 1.0 + _642;
    bool _646 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _648 = isnan(1.0);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _654 = _650 || _652;
    float _656 = _600 * _124;
    bool _658 = !_486;
    int _660 = _658 ? 0 : 1;
    float _662 = 1.0 / _644;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _666 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _674 = _670 || _672;
    float _676 = float(_564);
    float _678 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[78].z, _664);
    float _680 = -_624;
    float _682 = _680 + 1.0;
    float _684 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _528);
    float _686 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _530);
    float _688 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _678);
    int _690 = abs(_660);
    float _692 = _676 * _124;
    int _694 = _612 ? 0 : 1;
    float _696 = _674 ? _682 : 0.0;
    float _698 = float(_634);
    float _700 = fma(_532, _626, _532);
    float _702 = float(_690);
    if (_654)
    {
        float _704 = _696 * _662;
        _126 = _704;
    }
    float _706 = _126;
    int _708 = ~_694;
    int _710 = _708 + 1;
    int _712 = _710 + 1;
    float _714 = _432 + (-0.5);
    int _716 = _712;
    if (!_602)
    {
        int _718 = ~_694;
        int _720 = _718 + 1;
        _716 = _720;
    }
    int _722 = _716;
    float _724 = fma(_626, _636, _636);
    float _726 = _702 * _698;
    float _728 = -_492;
    float _730 = _728 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _732 = -_500;
    float _734 = _732 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _736 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[196].x, _724);
    bool _738 = !_490;
    int _740 = _738 ? 0 : 1;
    float _742 = _730 * _730;
    float _744 = _434 + _426;
    float _746 = -_504;
    float _748 = _746 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _750 = abs(_740);
    float _752 = fma(_734, _734, _742);
    float _754 = _744 + (-1.0);
    float _756 = _726 * (-2.0);
    float _758 = fma(_748, _748, _752);
    float _760 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _762 = float(_722);
    float _764 = fma(_700, _706, _736);
    float _766 = float(_750);
    float _768 = _434 + (-0.5);
    float _770 = fma(_756, _638, _638);
    float _772 = _764 * 0.15915493667125701904296875;
    float _774 = fma(_760, _756, _760);
    float _776 = _766 * _762;
    float _778 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[196].y, _770);
    float _780 = rsqrt(_758);
    float _782 = in.m_49.x;
    float _784 = in.m_49.y;
    float _786 = in.m_49.z;
    float _788 = _426 + _432;
    float _790 = _776 * (-2.0);
    float _792 = fma(_774, _706, _778);
    float _794 = _788 + (-1.0);
    float _796 = _426 + (-0.5);
    float _798 = fma(_790, _640, _640);
    float _800 = _792 * 0.15915493667125701904296875;
    float _802 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _804 = _772 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[196].z, _798);
    float _810 = fma(_802, _790, _802);
    float _812 = _734 * _780;
    float _814 = in.m_57.x;
    float _816 = in.m_57.y;
    float _818 = in.m_57.z;
    float _820 = fma(_810, _706, _808);
    float _822 = _772 * 6.283185482025146484375;
    float _824 = cos(_822);
    float _826 = _748 * _780;
    float _828 = _730 * _780;
    float _830 = _820 * 0.15915493667125701904296875;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _834 = _826 * _832;
    float _836 = _782 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _838 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _840 = _828 * _838;
    float _842 = _800 * 6.283185482025146484375;
    float _844 = sin(_842);
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _848 = _812 * _846;
    float _850 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _852 = -_834;
    float _854 = fma(_828, _850, _852);
    bool _856 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _858 = isnan(0.5);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _864 = _860 || _862;
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _868 = -_848;
    float _870 = fma(_826, _866, _868);
    float _872 = _784 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _876 = -_840;
    float _878 = fma(_812, _874, _876);
    float _880 = _800 * 6.283185482025146484375;
    float _882 = cos(_880);
    float _884 = _870 * _870;
    float _886 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _816);
    float _890 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _818);
    float _892 = _830 * 6.283185482025146484375;
    float _894 = sin(_892);
    float _896 = _786 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _898 = fma(_854, _854, _884);
    float _900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _814);
    float _902 = _824 * _844;
    float _904 = _896 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _906 = fma(_878, _878, _898);
    float _908 = _836 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _910 = _830 * 6.283185482025146484375;
    float _912 = cos(_910);
    float _914 = _806 * _882;
    float _916 = _904 * _890;
    float _918 = _908 * _900;
    float _920 = rsqrt(_906);
    float _922 = _886 * _888;
    float _924 = -_902;
    float _926 = fma(_894, _914, _924);
    float _928 = -_914;
    float _930 = fma(_894, _902, _928);
    float _932 = _806 * _844;
    float _934 = _824 * _882;
    float _936 = -_922;
    float _938 = _894 * _936;
    float _940 = _912 * _922;
    float _942 = _844 * _912;
    float _944 = fma(_894, _934, _932);
    float _946 = fma(_894, _932, _934);
    float _948 = _824 * _940;
    float _950 = _882 * _912;
    float _952 = _806 * _940;
    float _954 = _854 * _920;
    float _956 = fma(_944, _918, _948);
    float _958 = _870 * _920;
    float _960 = _878 * _920;
    float _962 = _828 * _954;
    float _964 = fma(_930, _916, _956);
    float _966 = fma(_950, _918, _938);
    float _968 = _826 * _958;
    float _970 = -_962;
    float _972 = fma(_812, _958, _970);
    float _974 = fma(_926, _918, _952);
    float _976 = fma(_942, _916, _966);
    float _978 = -_968;
    float _980 = fma(_828, _960, _978);
    float _982 = _972 * _964;
    float _984 = fma(_946, _916, _974);
    float _986 = _980 * _964;
    float _988 = fma(_960, _976, _982);
    float _990 = fma(_954, _976, _986);
    float _992 = fma(_826, _984, _988);
    float _994 = fma(_812, _984, _990);
    float _996 = _504 + _992;
    float _998 = _492 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1000 = _812 * _960;
    float _1002 = _500 + _994;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1006 = _996 + _1004;
    float _1008 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[11].x, _998);
    float _1010 = -_1000;
    float _1012 = fma(_826, _954, _1010);
    float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1016 = _1002 + _1014;
    float _1018 = _1006 * _1006;
    float _1020 = _1012 * _964;
    float _1022 = _1012;
    float _1024 = _1020;
    float _1026 = _1002;
    float _1028 = _930;
    if (_864)
    {
        _1022 = 1.0;
    }
    float _1030 = _1022;
    float _1032 = fma(_1016, _1016, _1018);
    float _1034 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1008);
    float _1036 = _492 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1038 = fma(_958, _976, _1020);
    float _1040 = sqrt(_1032);
    float _1042 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1044 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1036);
    float _1046 = fma(_828, _984, _1038);
    float _1048 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1044);
    float _1050 = _492 + _1046;
    float _1052 = 1.0 / _1042;
    float _1054 = _1048 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1056 = _1054 + _1042;
    bool _1058 = _1040 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1060 = _1056 * _1052;
    float _1062 = _1060 * 0.5;
    float _1064 = _1038;
    float _1066 = _1056;
    float _1068 = _1030;
    if (!_1058)
    {
        _1024 = _1002;
    }
    float _1070 = _1024;
    float _1072 = _1070;
    if (!_1058)
    {
        _1064 = _996;
    }
    float _1074 = _1064;
    float _1076 = _1074;
    if (!_1058)
    {
        _1066 = _1050;
    }
    float _1078 = _1066;
    bool _1080 = !_1058;
    float _1082 = _1078;
    if (!_1080)
    {
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1088 = _1040 + _1086;
        float _1090 = rsqrt(_1032);
        float _1092 = _1088 * _1084;
        float _1094 = _1050 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1096 = _1092 * 0.15915493667125701904296875;
        float _1098 = _1096 * 6.283185482025146484375;
        float _1100 = cos(_1098);
        float _1102 = _1096 * 6.283185482025146484375;
        float _1104 = sin(_1102);
        float _1106 = _1100 + (-1.0);
        float _1108 = fma(_1104, _1094, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1106 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = _1090 * _1108;
        float _1114 = fma(_1050, _1100, _1110);
        float _1116 = fma(_1016, _1112, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1118 = fma(_1006, _1112, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _584 = _1096;
        _1082 = _1114;
        _1072 = _1116;
        _1076 = _1118;
    }
    float _1120 = _584;
    float _1122 = _1082;
    float _1124 = _1072;
    float _1126 = _1076;
    float _1128 = _1120;
    if (!_864)
    {
        float _1130 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1132 = _1130 * 0.15915493667125701904296875;
        float _1134 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1138 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1136);
        float _1140 = _1132 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        float _1144 = _1134 * 0.15915493667125701904296875;
        float _1146 = _1132 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        float _1150 = 1.0 / _1142;
        float _1152 = _1144 * 6.283185482025146484375;
        float _1154 = cos(_1152);
        float _1156 = _1148 * _1150;
        float _1158 = _1144 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        float _1162 = _1154 * _1156;
        float _1164 = 1.0 / _1138;
        float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1168 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1166;
        float _1170 = 1.0 / _1162;
        float _1172 = 1.0 / _1168;
        float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1176 = _1164 * _1174;
        float _1178 = _1160 * _1170;
        float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1182 = fma(_1178, _1176, _1180);
        float _1184 = _1182 * _1172;
        float _1186 = precise::clamp(_1184, 0.0, 1.0);
        _1128 = _1176;
        _1068 = _1186;
    }
    float _1188 = _1128;
    float _1190 = _1068;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1194 = _1122 + _1192;
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1198 = _1124 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1202 = _1126 + _1200;
    float _1204 = _1194 * _1194;
    float _1206 = fma(_1198, _1198, _1204);
    float _1208 = fma(_1202, _1202, _1206);
    float _1210 = rsqrt(_1208);
    float _1212 = sqrt(_1208);
    float _1214 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1216 = _1198 * _1214;
    float _1218 = _1202 * _1214;
    float _1220 = _1216 * _1216;
    float _1222 = _1218 * _1218;
    float _1224 = _1220 + _1222;
    float _1226 = sqrt(_1224);
    bool _1228 = _1226 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = _1226 + _1230;
    float _1234 = _1206;
    float _1236 = _1210;
    float _1238 = _1232;
    float _1240 = _1194;
    if (_1228)
    {
        float _1242 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1234 = _1242;
    }
    float _1244 = _1234;
    if (_1228)
    {
        float _1246 = rsqrt(_1224);
        _1236 = _1246;
    }
    float _1248 = _1236;
    float _1250 = _1244;
    float _1252 = _1248;
    if (_1228)
    {
        float _1254 = _1232 * _1244;
        _1238 = _1254;
    }
    float _1256 = _1238;
    if (_1228)
    {
        float _1258 = _1256 * 0.15915493667125701904296875;
        _1250 = _1258;
    }
    float _1260 = _1250;
    float _1262 = _1202;
    float _1264 = _1260;
    if (_1228)
    {
        float _1266 = _1260 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        _1262 = _1268;
    }
    float _1270 = _1262;
    float _1272 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1274 = precise::max(0.0, _1272);
    float _1276 = _1188;
    float _1278 = _1274;
    if (_1228)
    {
        float _1280 = _1260 * 6.283185482025146484375;
        float _1282 = cos(_1280);
        _1276 = _1282;
    }
    float _1284 = _1276;
    float _1286 = -_1214;
    float _1288 = -_1274;
    float _1290 = fma(_1194, _1286, _1288);
    if (_1228)
    {
        float _1292 = _1290 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1240 = _1292;
    }
    float _1294 = _1240;
    float _1296 = _1294;
    if (!_1228)
    {
        _1264 = _1220;
    }
    float _1298 = _1264;
    float _1300 = _1270;
    float _1302 = _1298;
    if (_1228)
    {
        float _1304 = fma(_1270, _1294, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1296 = _1304;
    }
    float _1306 = _1296;
    float _1308 = _1306;
    if (!_1228)
    {
        _1300 = _1290;
    }
    float _1310 = _1300;
    float _1312 = _1310;
    if (_1228)
    {
        float _1314 = _1284 + (-1.0);
        _1278 = _1314;
    }
    float _1316 = _1278;
    float _1318 = _1316;
    if (_1228)
    {
        float _1320 = _1248 * _1306;
        _1026 = _1320;
    }
    float _1322 = _1026;
    if (!_1228)
    {
        _1252 = _1216;
    }
    float _1324 = _1252;
    float _1326 = _1324;
    if (_1228)
    {
        float _1328 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1318 = _1328;
    }
    float _1330 = _1318;
    float _1332 = _1330;
    if (_1228)
    {
        float _1334 = _1216 * _1322;
        _1326 = _1334;
    }
    float _1336 = _1326;
    if (!_1228)
    {
        _1308 = _1218;
    }
    float _1338 = _1308;
    float _1340 = _1338;
    if (_1228)
    {
        float _1342 = _1218 * _1322;
        _1340 = _1342;
    }
    float _1344 = _1340;
    if (_1228)
    {
        float _1346 = fma(_1290, _1284, _1330);
        _1312 = _1346;
    }
    float _1348 = _1312;
    if (_1228)
    {
        float _1350 = _1336 * _1336;
        _1302 = _1350;
    }
    float _1352 = _1302;
    if (!_1228)
    {
        _1332 = _1222;
    }
    float _1354 = _1332;
    float _1356 = _1354;
    if (_1228)
    {
        float _1358 = _1344 * _1344;
        _1356 = _1358;
    }
    float _1360 = _1356;
    float _1362 = fma(_1348, _1348, _1352);
    float _1364 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1366 = _1362 + _1360;
    float _1368 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1364);
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1372 = fma(_1212, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1370);
    float _1374 = precise::clamp(_1372, 0.0, 1.0);
    float _1376 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1378 = rsqrt(_1366);
    float _1380 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1368);
    float _1382 = -_1374;
    float _1384 = _1382 + 1.0;
    float _1386 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1388 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1376);
    float _1390 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1392 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1394 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1386);
    float _1396 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1388);
    float _1398 = abs(_1384);
    float _1400 = log2(_1398);
    float _1402 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1392);
    float _1404 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1394);
    float _1406 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1408 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1410 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1416 = _1378 * _1336;
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1420 = _1378 * _1348;
    float _1422 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1414);
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1426 = _1378 * _1344;
    float _1428 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1430 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1422);
    float _1432 = -_1424;
    float _1434 = fma(_1420, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1432);
    float _1436 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1438 = -_1428;
    float _1440 = fma(_1438, _1390, 1.0);
    float _1442 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1430);
    float _1444 = -_1426;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1434);
    float _1448 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1450 = exp2(_1436);
    float _1452 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1454 = fma(_1446, -0.5, 0.5);
    float _1456 = fma(_1446, 0.5, 0.5);
    float _1458 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1448);
    float _1460 = _1420 + 1.0;
    float _1462 = fma(_1456, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1464 = log2(_1440);
    float _1466 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1452);
    float _1468 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1458);
    float _1470 = fma(_1456, _1462, -0.212114393711090087890625);
    float _1472 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1466);
    float _1474 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1468);
    float _1476 = fma(_1456, _1470, 1.570728778839111328125);
    float _1478 = 1.0 / _1442;
    float _1480 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1472);
    float _1482 = -_1420;
    float _1484 = fma(_1450, _1460, _1482);
    float _1486 = fma(_1484, 0.5, 0.5);
    float _1488 = sqrt(_1454);
    float _1490 = _1464 * 0.693147182464599609375;
    float _1492 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1494 = _1474 * _1478;
    float _1496 = _1480 * _1478;
    float _1498 = fma(_1494, 0.5, 0.5);
    float _1500 = fma(_1496, -0.5, 0.5);
    float _1502 = _1488 * 0.636619746685028076171875;
    float _1504 = -_1476;
    float _1506 = fma(_1502, _1504, 1.0);
    float3 _4637 = float3(_1498, _1500, _1492);
    float _1508 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4637, float3(0.0), isnan(_4637)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4637, float3(0.0), isnan(_4637)), level(0.0)).x;
    float3 _4648 = float3(_1498, _1500, _1492);
    float4 _1511 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4648, float3(0.0), isnan(_4648)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4648, float3(0.0), isnan(_4648)), level(0.0)).xyzw;
    float _1513 = _1511.x;
    float _1515 = _1511.y;
    float _1517 = _1511.z;
    float _1519 = _1511.w;
    float2 _4665 = float2(_1506, _1486);
    float3 _1523 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4665, float2(0.0), isnan(_4665)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4665, float2(0.0), isnan(_4665)), level(0.0)).xyz;
    float _1525 = _1523.x;
    float _1527 = _1523.y;
    float _1529 = _1523.z;
    float _1531 = float(uint(_564));
    float _1533 = trunc(_656);
    int _1535 = int(_1533);
    int _1537 = ~_564;
    int _1539 = _1537 + 1;
    float _1541 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1543 = abs(_462);
    int _1545 = abs(_476);
    float _1547 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1541);
    float _1549 = 1.0 / _1531;
    float _1551 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1547);
    int _1553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1555 = _1553 != 0;
    float _1557 = float(uint(_1535));
    bool _1559 = !_1555;
    float _1561 = _1559 ? 7.345489978790283203125 : 1.0;
    float _1563 = float(_90);
    float _1565 = float(_1535);
    float _1567 = _1561 * _432;
    int _1569 = as_type<int>(_1549) + (-2);
    bool _1571 = _1565 >= _676;
    bool _1573 = isnan(_1565);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan(_676);
    bool _1579 = _1575 || _1577;
    float _1581 = float(_1579);
    float _1583 = floor(_1567);
    float _1585 = as_type<float>(_1569) * _1557;
    float _1587 = trunc(_1585);
    float _1589 = precise::max(_1587, 0.0);
    uint _1592 = uint(_1589);
    float _1594 = 1.0 / _1563;
    float _1596 = -_1583;
    float _1598 = _1567 + _1596;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1602 = _1600 != 0;
    int _1604 = _1539 * int(_1592);
    int _1606 = _1604 + _1535;
    float _1608 = trunc(_1581);
    int _1610 = int(_1608);
    float _1612 = float(uint(_1606));
    float _1614 = _692 * _1594;
    bool _1616 = !_1602;
    int _1618 = _1616 ? 0 : 1;
    float _1620 = as_type<float>(_1569) * _1612;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1624 = _1622 != 0;
    int _1626 = abs(_1618);
    float _1628 = trunc(_1620);
    float _1630 = precise::max(_1628, 0.0);
    uint _1632 = uint(_1630);
    float _1634 = in.m_59.x;
    float _1636 = trunc(_1614);
    int _1638 = int(_1636);
    int _1640 = int(_1592) + int(_1632);
    int _1642 = _1539 * _1640;
    int _1644 = _1642 + _1535;
    bool _1646 = uint(_1644) >= uint(_564);
    bool _1648 = !_1646;
    int _1650 = _1648 ? 0 : (-1);
    bool _1652 = _564 == 0;
    int _1654 = ~_1640;
    int _1656 = _1654 + _1650;
    int _1658 = _1656 + 1;
    float _1660 = _1598 * _676;
    int _1662 = ~_1610;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    int _1668 = _564 + (-1);
    int _1670 = _564 * _1658;
    int _1672 = _1670 + _1535;
    float _1674 = trunc(_1660);
    int _1676 = int(_1674);
    bool _1678 = !_1652;
    int _1680 = _1678 ? _1672 : (-1);
    int _1682 = _1680 * _1666;
    int _1684 = ~_564;
    int _1686 = _1684 + 1;
    float _1688 = in.m_61.w;
    int _1690 = _1610 * _1668;
    int _1692 = _1690 + _1682;
    int _1694 = abs(_470);
    int _1696 = _1676 * _1626;
    int _1698 = _1696 + _1535;
    bool _1700 = !_1624;
    int _1702 = _1700 ? 0 : 1;
    int _1704 = _1692 * _1543;
    int _1706 = abs(_1702);
    int _1708 = _1638 * _1694;
    int _1710 = _1708 + _1704;
    int _1712 = ~_564;
    int _1714 = _1712 + 1;
    float _1716 = float(uint(_1698));
    int _1718 = _1698 * _1545;
    int _1720 = _1718 + _1710;
    int _1722 = _1676 * _1706;
    int _1724 = _1722 + _1720;
    int _1726 = ~_564;
    int _1728 = _1726 + 1;
    float _1730 = as_type<float>(_1569) * _1716;
    out.m_63.w = _1688;
    float _1732 = float(uint(_1724));
    float _1734 = trunc(_1730);
    float _1736 = precise::max(_1734, 0.0);
    uint _1738 = uint(_1736);
    float _1740 = as_type<float>(_1569) * _1732;
    float _1742 = trunc(_1740);
    float _1744 = precise::max(_1742, 0.0);
    uint _1746 = uint(_1744);
    int _1748 = _1728 * int(_1746);
    int _1750 = _1748 + _1724;
    float _1752 = float(uint(_1750));
    float _1754 = as_type<float>(_1569) * _1752;
    float _1756 = trunc(_1754);
    float _1758 = precise::max(_1756, 0.0);
    uint _1760 = uint(_1758);
    int _1762 = int(_1746) + int(_1760);
    int _1764 = ~_564;
    int _1766 = _1764 + 1;
    int _1768 = _1714 * _1762;
    int _1770 = _1768 + _1724;
    bool _1772 = uint(_1770) >= uint(_564);
    bool _1774 = !_1772;
    int _1776 = _1774 ? 0 : (-1);
    int _1778 = ~_1762;
    int _1780 = _1778 + _1776;
    int _1782 = _1780 + 1;
    int _1784 = _564 * _1782;
    int _1786 = _1784 + _1724;
    int _1788 = _1766 * int(_1738);
    int _1790 = _1788 + _1698;
    bool _1792 = !_1652;
    int _1794 = _1792 ? _1786 : (-1);
    float _1796 = float(uint(_1790));
    int _1798 = _1794 >> 31;
    int _1800 = _1794 & 3;
    bool _1802 = _1800 != 0;
    float _1804 = as_type<float>(_1569) * _1796;
    int _1806 = _1798 & 3;
    int _1808 = _1794 + _1806;
    float _1810 = trunc(_1804);
    float _1812 = precise::max(_1810, 0.0);
    uint _1814 = uint(_1812);
    int _1816 = _1808 >> 2;
    int _1818 = _1816 << 4;
    int _1820 = _1818 + 368;
    int _1822 = _1794 & 3;
    bool _1824 = _1822 != 0;
    uint _1826 = uint(int(uint(_1820) >> uint(2)));
    uint _1828 = uint(int(uint(int(_1826)) >> uint(2)));
    int _1830 = int(_1826) & 3;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[int(_1828)][_1830];
    int _1834 = int(_1826) + 1;
    uint _1836 = uint(int(uint(_1834) >> uint(2)));
    int _1838 = _1834 & 3;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[int(_1836)][_1838];
    int _1842 = _1802 ? 0 : 1;
    bool _1844 = uint(_1822) > 1u;
    int _1846 = int(_1738) + int(_1814);
    bool _1848 = _1822 != 3;
    int _1850 = _1820 + 8;
    uint _1852 = uint(int(uint(_1850) >> uint(2)));
    uint _1854 = uint(int(uint(int(_1852)) >> uint(2)));
    int _1856 = int(_1852) & 3;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[int(_1854)][_1856];
    int _1860 = int(_1852) + 1;
    uint _1862 = uint(int(uint(_1860) >> uint(2)));
    int _1864 = _1860 & 3;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[int(_1862)][_1864];
    int _1868 = _1686 * _1846;
    int _1870 = _1868 + _1698;
    bool _1872 = uint(_1870) >= uint(_564);
    float _1874 = in.m_61.z;
    bool _1876 = !_1872;
    int _1878 = _1876 ? 0 : (-1);
    bool _1880 = uint(_1822) >= 2u;
    int _1882 = ~_1846;
    int _1884 = _1882 + _1878;
    int _1886 = _1884 + 1;
    int _1888 = ~_1842;
    int _1890 = _1888 + 1;
    int _1892 = _1890 + 1;
    int _1894 = _1892;
    if (!_1844)
    {
        int _1896 = ~_1842;
        int _1898 = _1896 + 1;
        _1894 = _1898;
    }
    int _1900 = _1894;
    int _1902 = _564 * _1886;
    int _1904 = _1902 + _1698;
    int _1906 = _1880 ? 0 : 1;
    bool _1908 = !_1824;
    int _1910 = _1908 ? 0 : 1;
    int _1912 = abs(_1900);
    bool _1914 = _1822 != 3;
    int _1916 = ~_1906;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    int _1922 = _1920;
    if (_1848)
    {
        int _1924 = ~_1906;
        int _1926 = _1924 + 1;
        _1922 = _1926;
    }
    int _1928 = _1922;
    int _1930 = abs(_1910);
    out.m_63.z = _1874;
    float _1932 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1934 = int(_1932);
    int _1936 = ~_1912;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    bool _1942 = !_1914;
    int _1944 = _1942 ? 0 : (-1);
    int _1946 = abs(_1928);
    int _1948 = _1940 * as_type<int>(_1840);
    int _1950 = ~_1930;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    int _1956 = abs(_1944);
    int _1958 = _1954 * as_type<int>(_1832);
    int _1960 = _1958 + _1948;
    int _1962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1964 = _1962 != 0;
    int _1966 = ~_1946;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    float _1972 = in.m_61.x;
    bool _1974 = !_1964;
    int _1976 = _1974 ? 0 : 1;
    int _1978 = ~_1956;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    int _1984 = _1970 * as_type<int>(_1858);
    int _1986 = _1984 + _1960;
    int _1988 = abs(_1976);
    int _1990 = abs(_1934);
    int _1992 = _1982 * as_type<int>(_1866);
    int _1994 = _1992 + _1986;
    float _1996 = float(uint(_1934));
    float _1998 = float(uint(_1990));
    int _2000 = ~_1988;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    float _2006 = 1.0 / _1996;
    int _2008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2010 = _2008 != 0;
    int _2012 = _1994 * _2004;
    bool _2014 = !_1652;
    int _2016 = _2014 ? _1904 : (-1);
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2020 = _2018 != 0;
    float _2022 = in.m_61.y;
    float _2024 = 1.0 / _1998;
    int _2026 = _2016 * _1988;
    int _2028 = _2026 + _2012;
    int _2030 = ~_1934;
    int _2032 = _2030 + 1;
    out.m_63.x = _1972;
    bool _2034 = _434 > 0.5;
    int _2036 = abs(_2028);
    if (_2010)
    {
        float _2038 = in.m_51.x;
        _1028 = _2038;
    }
    float _2040 = _1028;
    int _2042 = as_type<int>(_2006) + (-2);
    float _2044 = float(uint(_2028));
    int _2046 = ~_1990;
    int _2048 = _2046 + 1;
    float _2050 = as_type<float>(_2042) * _2044;
    int _2052 = as_type<int>(_2024) + (-2);
    float _2054 = in.m_59.y;
    float _2056 = float(uint(_2036));
    float _2058 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2058;
    float _2062 = trunc(_2050);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    float _2068 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2070 = _424 + _2068;
    float _2072 = as_type<float>(_2052) * _2056;
    out.m_63.y = _2022;
    bool _2074 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2076 = isnan(_424);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2082 = _2078 || _2080;
    float _2084 = float(_2082);
    float _2086 = trunc(_2072);
    float _2088 = precise::max(_2086, 0.0);
    uint _2090 = uint(_2088);
    float _2092 = 1.0 / _2060;
    int _2094 = _2032 * int(_2066);
    int _2096 = _2094 + _2028;
    float _2098 = float(uint(_2096));
    int _2100 = _2048 * int(_2090);
    int _2102 = _2100 + _2036;
    float _2104 = -_2054;
    float _2106 = _2104 + 1.0;
    float _2108 = as_type<float>(_2042) * _2098;
    bool _2110 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2112 = isnan(_424);
    bool _2114 = _2110 || _2112;
    bool _2116 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2118 = _2114 || _2116;
    float _2120 = float(_2118);
    float _2122 = float(uint(_2102));
    float _2124 = _2070 * _2092;
    float _2126 = trunc(_2108);
    float _2128 = precise::max(_2126, 0.0);
    uint _2130 = uint(_2128);
    float _2132 = as_type<float>(_2052) * _2122;
    float _2134 = _2054;
    float _2136 = as_type<float>(_2052);
    if (_2020)
    {
        float _2138 = _2034 ? _2106 : _2054;
        _2134 = _2138;
    }
    float _2140 = _2134;
    float _2142 = -_2120;
    float _2144 = _2142 + 1.0;
    bool _2146 = _2040 > 0.5;
    bool _2148 = _2146 && _2010;
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2150;
    float _2154 = _2152;
    if (_2010)
    {
        _2136 = _1634;
    }
    float _2156 = _2136;
    float _2158 = _2084 * _2144;
    float _2160 = trunc(_2132);
    float _2162 = precise::max(_2160, 0.0);
    uint _2164 = uint(_2162);
    float _2166 = fma(_2152, _2124, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2168 = _2156;
    if (!_2010)
    {
        _2154 = _1634;
    }
    float _2170 = _2154;
    float _2172 = -_2084;
    float _2174 = _2172 + 1.0;
    int _2176 = ~_1934;
    int _2178 = _2176 + 1;
    float _2180 = _2166 * _2158;
    int _2182 = ~_1990;
    int _2184 = _2182 + 1;
    int _2186 = int(_2066) + int(_2130);
    float _2188 = _2170;
    if (_2148)
    {
        float _2190 = -_2156;
        float _2192 = _2190 + 1.0;
        _2168 = _2192;
    }
    float _2194 = _2168;
    float _2196 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2180);
    int _2198 = _2178 * _2186;
    int _2200 = _2198 + _2028;
    if (_2010)
    {
        _2188 = _2194;
    }
    float _2202 = _2188;
    float _2204 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2206 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2204;
    int _2208 = int(_2090) + int(_2164);
    float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2212 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2210;
    float _2214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2216 = uint(_2200) >= uint(_1934);
    float _2218 = fma(_2206, _2124, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    int _2220 = _2184 * _2208;
    int _2222 = _2220 + _2036;
    float _2224 = fma(_2212, _2124, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2226 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2196);
    float _2228 = _2218 * _2158;
    bool _2230 = uint(_2222) >= uint(_1990);
    float _2232 = _2224 * _2158;
    int _2234 = _2028 ^ _1934;
    float _2236 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2228);
    bool _2238 = !_2230;
    int _2240 = _2238 ? 0 : (-1);
    float _2242 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2232);
    uint _2244 = uint(int(uint(_2234) >> uint(31)));
    float _2246 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2236);
    bool _2248 = !_2216;
    int _2250 = _2248 ? 0 : (-1);
    float _2252 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2242);
    int _2254 = ~_2240;
    int _2256 = _2208 + _2254;
    int _2258 = _2256 + 1;
    float _2260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2262 = ~_2186;
    int _2264 = _2262 + _2250;
    int _2266 = _2264 + 1;
    float _2268 = _2226 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2270 = ~int(_2244);
    int _2272 = _2270 + 1;
    float _2274 = _2214 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2276 = _1934 == 0;
    int _2278 = _1934 * _2266;
    int _2280 = _2278 + _2028;
    int _2282 = _2258 ^ _2272;
    float _2284 = fma(_2274, _2202, -0.5);
    bool _2286 = _1934 == 0;
    float _2288 = _2246 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2290 = !_2276;
    int _2292 = _2290 ? _2280 : (-1);
    float _2294 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2296 = _2252 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2298 = ~_2272;
    int _2300 = _2298 + _2282;
    int _2302 = _2300 + 1;
    float _2304 = _2268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2306 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2308 = _2288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2310 = exp2(_2294);
    float _2312 = _2296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2314 = !_2286;
    int _2316 = _2314 ? _2302 : (-1);
    float _2318 = fma(_2306, _2140, -0.5);
    float _2320 = float(_2292);
    float _2322 = float(_2316);
    out.m_65.x = _2304;
    out.m_65.y = _2308;
    out.m_65.z = _2312;
    bool _2324 = _1190 > 0.0;
    bool _2326 = isnan(_1190);
    bool _2328 = _2324 || _2326;
    bool _2330 = isnan(0.0);
    bool _2332 = _2328 || _2330;
    float _2334 = fma(_2274, _2320, _540);
    float _2336 = -_684;
    float _2338 = fma(_2306, _2322, _2336);
    float _2340 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1551);
    float _2342 = fma(_688, _2284, _2334);
    float _2344 = _1442 * 0.5;
    float _2346 = fma(_686, _2318, _2338);
    float _2348 = -_2310;
    float _2350 = _2348 + 1.0;
    float _2352 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2354 = _2340 + _1442;
    float _2356 = _1474 + _1442;
    float _2358 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1474;
    out.gl_Position.y = _1480;
    out.gl_Position.z = _2340;
    out.gl_Position.w = _1442;
    float _2360 = _2354 * 0.5;
    float _2362 = _2358 * _1508;
    float _2364 = -_2358;
    float _2366 = _2364 + 1.0;
    float _2368 = _2356 * 0.5;
    float _2370 = fma(_1480, -0.5, _2344);
    float _2372 = _1519 * _2362;
    float _2374 = _1529 * _2362;
    float _2376 = _2342 + 0.5;
    float _2378 = _2346 + 0.5;
    float _2380 = fma(_1525, _2372, _1513);
    float _2382 = _2352 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2384 = fma(_1527, _2372, _1515);
    float _2386 = _1519 * _2366;
    float _2388 = fma(_1519, _2374, _1517);
    out.m_67.x = _2368;
    out.m_67.y = _2370;
    out.m_67.z = _2360;
    out.m_67.w = _1442;
    out.m_69.x = _2376;
    out.m_69.y = _2378;
    out.m_45.x = _2382;
    out.m_71.x = _2380;
    out.m_71.y = _2384;
    out.m_71.z = _2388;
    out.m_71.w = _2386;
    if (_2332)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2390 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2390;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _416 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2447 = as_type<float>(_106);
        out.gl_Position.z = _2447;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2517 = as_type<float>(_144);
        out.gl_Position.z = _2517;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_312;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _334;
    float _338 = 1.0 / _316;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _342 = _328 * _332;
    float _344 = -_328;
    float _346 = _344 + 1.0;
    float _348 = _300 * _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _350;
    float _354 = fma(_336, _348, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _356;
    float _360 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _362 = _354 * _342;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _366 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _368 = _360 * _342;
    float _370 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[107].x, _362);
    float _372 = _366 * _342;
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[107].z, _368);
    float _376 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[108].x, _370);
    float _378 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[107].y, _372);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[108].z, _374);
    float _382 = _376 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _384 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[108].y, _378);
    float _386 = _380 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _388 = _382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _390 = _384 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _392 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _388;
    out.m_53.y = _394;
    out.m_53.z = _392;
    out.m_53.w = _364;
    bool _396 = !_340;
    float _414;
    if (!_396)
    {
        float _398 = in.m_51.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_90);
        float _420 = 1.0 / _418;
        float _422 = _124 * _420;
        _414 = _422;
    }
    _416 = false;
    float _424 = _414;
    float _426 = in.m_51.z;
    float _428 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _430 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _432 = in.m_51.x;
    float _434 = in.m_51.y;
    float _436 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _428);
    float _438 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _450 = _448 != 0;
    float _452 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
    float _454 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _430);
    float _456 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _438);
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _460 = !_446;
    int _462 = _460 ? 0 : 1;
    float _464 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _466 = int(_464);
    bool _468 = !_442;
    int _470 = _468 ? 0 : 1;
    float _472 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _454);
    bool _474 = !_450;
    int _476 = _474 ? 0 : 1;
    float _478 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _456);
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _490 = _488 != 0;
    float _492 = _452 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _494 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _496 = log2(_494);
    float _498 = _426 * 2.0;
    float _500 = _472 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _504 = _478 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _506 = _432 * 2.0;
    float _508 = _434 * 2.0;
    float _510 = floor(_498);
    float _512 = _432 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _514 = _434 + _432;
    float _516 = _434 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _520 = -_458;
    float _522 = fma(_512, 2.0, _520);
    float _524 = _514 + (-1.0);
    float _526 = floor(_506);
    float _528 = fma(_516, -2.0, _502);
    float _530 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[78].w, _518);
    float _532 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _534 = !_482;
    int _536 = _534 ? 0 : 1;
    float _538 = -_124;
    float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[76].x, _522);
    bool _542 = _510 > 0.0;
    float _544 = floor(_508);
    bool _546 = _510 >= 0.0;
    bool _548 = isnan(_510);
    bool _550 = _546 || _548;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    int _556 = abs(_536);
    int _558 = _554 ? 0 : 1;
    bool _560 = _526 > 0.0;
    float _562 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _564 = int(_562);
    bool _566 = _526 >= 0.0;
    bool _568 = isnan(_526);
    bool _570 = _566 || _568;
    bool _572 = isnan(0.0);
    bool _574 = _570 || _572;
    int _576 = ~_558;
    int _578 = _576 + 1;
    int _580 = _578 + 1;
    int _582 = _580;
    float _584 = _504;
    if (!_542)
    {
        int _586 = ~_558;
        int _588 = _586 + 1;
        _582 = _588;
    }
    int _590 = _582;
    int _592 = _574 ? 0 : 1;
    float _594 = float(_466);
    float _596 = float(_556);
    float _598 = float(_590);
    float _600 = 1.0 / _594;
    bool _602 = _544 > 0.0;
    bool _604 = _544 >= 0.0;
    bool _606 = isnan(_544);
    bool _608 = _604 || _606;
    bool _610 = isnan(0.0);
    bool _612 = _608 || _610;
    float _614 = _496 * _124;
    float _616 = _596 * _598;
    int _618 = ~_592;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = exp2(_614);
    float _626 = _616 * (-2.0);
    int _628 = _622;
    if (!_560)
    {
        int _630 = ~_592;
        int _632 = _630 + 1;
        _628 = _632;
    }
    int _634 = _628;
    float _636 = in.m_55.x;
    float _638 = in.m_55.y;
    float _640 = in.m_55.z;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _644 = 1.0 + _642;
    bool _646 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _648 = isnan(1.0);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _654 = _650 || _652;
    float _656 = _600 * _124;
    bool _658 = !_486;
    int _660 = _658 ? 0 : 1;
    float _662 = 1.0 / _644;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _666 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _674 = _670 || _672;
    float _676 = float(_564);
    float _678 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[78].z, _664);
    float _680 = -_624;
    float _682 = _680 + 1.0;
    float _684 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _528);
    float _686 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _530);
    float _688 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _678);
    int _690 = abs(_660);
    float _692 = _676 * _124;
    int _694 = _612 ? 0 : 1;
    float _696 = _674 ? _682 : 0.0;
    float _698 = float(_634);
    float _700 = fma(_532, _626, _532);
    float _702 = float(_690);
    if (_654)
    {
        float _704 = _696 * _662;
        _126 = _704;
    }
    float _706 = _126;
    int _708 = ~_694;
    int _710 = _708 + 1;
    int _712 = _710 + 1;
    float _714 = _432 + (-0.5);
    int _716 = _712;
    if (!_602)
    {
        int _718 = ~_694;
        int _720 = _718 + 1;
        _716 = _720;
    }
    int _722 = _716;
    float _724 = fma(_626, _636, _636);
    float _726 = _702 * _698;
    float _728 = -_492;
    float _730 = _728 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _732 = -_500;
    float _734 = _732 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _736 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[196].x, _724);
    bool _738 = !_490;
    int _740 = _738 ? 0 : 1;
    float _742 = _730 * _730;
    float _744 = _434 + _426;
    float _746 = -_504;
    float _748 = _746 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _750 = abs(_740);
    float _752 = fma(_734, _734, _742);
    float _754 = _744 + (-1.0);
    float _756 = _726 * (-2.0);
    float _758 = fma(_748, _748, _752);
    float _760 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _762 = float(_722);
    float _764 = fma(_700, _706, _736);
    float _766 = float(_750);
    float _768 = _434 + (-0.5);
    float _770 = fma(_756, _638, _638);
    float _772 = _764 * 0.15915493667125701904296875;
    float _774 = fma(_760, _756, _760);
    float _776 = _766 * _762;
    float _778 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[196].y, _770);
    float _780 = rsqrt(_758);
    float _782 = in.m_49.x;
    float _784 = in.m_49.y;
    float _786 = in.m_49.z;
    float _788 = _426 + _432;
    float _790 = _776 * (-2.0);
    float _792 = fma(_774, _706, _778);
    float _794 = _788 + (-1.0);
    float _796 = _426 + (-0.5);
    float _798 = fma(_790, _640, _640);
    float _800 = _792 * 0.15915493667125701904296875;
    float _802 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _804 = _772 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[196].z, _798);
    float _810 = fma(_802, _790, _802);
    float _812 = _734 * _780;
    float _814 = in.m_57.x;
    float _816 = in.m_57.y;
    float _818 = in.m_57.z;
    float _820 = fma(_810, _706, _808);
    float _822 = _772 * 6.283185482025146484375;
    float _824 = cos(_822);
    float _826 = _748 * _780;
    float _828 = _730 * _780;
    float _830 = _820 * 0.15915493667125701904296875;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _834 = _826 * _832;
    float _836 = _782 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _838 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _840 = _828 * _838;
    float _842 = _800 * 6.283185482025146484375;
    float _844 = sin(_842);
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _848 = _812 * _846;
    float _850 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _852 = -_834;
    float _854 = fma(_828, _850, _852);
    bool _856 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _858 = isnan(0.5);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _864 = _860 || _862;
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _868 = -_848;
    float _870 = fma(_826, _866, _868);
    float _872 = _784 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _876 = -_840;
    float _878 = fma(_812, _874, _876);
    float _880 = _800 * 6.283185482025146484375;
    float _882 = cos(_880);
    float _884 = _870 * _870;
    float _886 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _816);
    float _890 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _818);
    float _892 = _830 * 6.283185482025146484375;
    float _894 = sin(_892);
    float _896 = _786 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _898 = fma(_854, _854, _884);
    float _900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _814);
    float _902 = _824 * _844;
    float _904 = _896 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _906 = fma(_878, _878, _898);
    float _908 = _836 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _910 = _830 * 6.283185482025146484375;
    float _912 = cos(_910);
    float _914 = _806 * _882;
    float _916 = _904 * _890;
    float _918 = _908 * _900;
    float _920 = rsqrt(_906);
    float _922 = _886 * _888;
    float _924 = -_902;
    float _926 = fma(_894, _914, _924);
    float _928 = -_914;
    float _930 = fma(_894, _902, _928);
    float _932 = _806 * _844;
    float _934 = _824 * _882;
    float _936 = -_922;
    float _938 = _894 * _936;
    float _940 = _912 * _922;
    float _942 = _844 * _912;
    float _944 = fma(_894, _934, _932);
    float _946 = fma(_894, _932, _934);
    float _948 = _824 * _940;
    float _950 = _882 * _912;
    float _952 = _806 * _940;
    float _954 = _854 * _920;
    float _956 = fma(_944, _918, _948);
    float _958 = _870 * _920;
    float _960 = _878 * _920;
    float _962 = _828 * _954;
    float _964 = fma(_930, _916, _956);
    float _966 = fma(_950, _918, _938);
    float _968 = _826 * _958;
    float _970 = -_962;
    float _972 = fma(_812, _958, _970);
    float _974 = fma(_926, _918, _952);
    float _976 = fma(_942, _916, _966);
    float _978 = -_968;
    float _980 = fma(_828, _960, _978);
    float _982 = _972 * _964;
    float _984 = fma(_946, _916, _974);
    float _986 = _980 * _964;
    float _988 = fma(_960, _976, _982);
    float _990 = fma(_954, _976, _986);
    float _992 = fma(_826, _984, _988);
    float _994 = fma(_812, _984, _990);
    float _996 = _504 + _992;
    float _998 = _492 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1000 = _812 * _960;
    float _1002 = _500 + _994;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1006 = _996 + _1004;
    float _1008 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[11].x, _998);
    float _1010 = -_1000;
    float _1012 = fma(_826, _954, _1010);
    float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1016 = _1002 + _1014;
    float _1018 = _1006 * _1006;
    float _1020 = _1012 * _964;
    float _1022 = _1012;
    float _1024 = _1020;
    float _1026 = _1002;
    float _1028 = _930;
    if (_864)
    {
        _1022 = 1.0;
    }
    float _1030 = _1022;
    float _1032 = fma(_1016, _1016, _1018);
    float _1034 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1008);
    float _1036 = _492 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1038 = fma(_958, _976, _1020);
    float _1040 = sqrt(_1032);
    float _1042 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1044 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1036);
    float _1046 = fma(_828, _984, _1038);
    float _1048 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1044);
    float _1050 = _492 + _1046;
    float _1052 = 1.0 / _1042;
    float _1054 = _1048 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1056 = _1054 + _1042;
    bool _1058 = _1040 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1060 = _1056 * _1052;
    float _1062 = _1060 * 0.5;
    float _1064 = _1038;
    float _1066 = _1056;
    float _1068 = _1030;
    if (!_1058)
    {
        _1024 = _1002;
    }
    float _1070 = _1024;
    float _1072 = _1070;
    if (!_1058)
    {
        _1064 = _996;
    }
    float _1074 = _1064;
    float _1076 = _1074;
    if (!_1058)
    {
        _1066 = _1050;
    }
    float _1078 = _1066;
    bool _1080 = !_1058;
    float _1082 = _1078;
    if (!_1080)
    {
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1088 = _1040 + _1086;
        float _1090 = rsqrt(_1032);
        float _1092 = _1088 * _1084;
        float _1094 = _1050 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1096 = _1092 * 0.15915493667125701904296875;
        float _1098 = _1096 * 6.283185482025146484375;
        float _1100 = cos(_1098);
        float _1102 = _1096 * 6.283185482025146484375;
        float _1104 = sin(_1102);
        float _1106 = _1100 + (-1.0);
        float _1108 = fma(_1104, _1094, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1106 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = _1090 * _1108;
        float _1114 = fma(_1050, _1100, _1110);
        float _1116 = fma(_1016, _1112, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1118 = fma(_1006, _1112, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _584 = _1096;
        _1082 = _1114;
        _1072 = _1116;
        _1076 = _1118;
    }
    float _1120 = _584;
    float _1122 = _1082;
    float _1124 = _1072;
    float _1126 = _1076;
    float _1128 = _1120;
    if (!_864)
    {
        float _1130 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1132 = _1130 * 0.15915493667125701904296875;
        float _1134 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1138 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1136);
        float _1140 = _1132 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        float _1144 = _1134 * 0.15915493667125701904296875;
        float _1146 = _1132 * 6.283185482025146484375;
        float _1148 = sin(_1146);
        float _1150 = 1.0 / _1142;
        float _1152 = _1144 * 6.283185482025146484375;
        float _1154 = cos(_1152);
        float _1156 = _1148 * _1150;
        float _1158 = _1144 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        float _1162 = _1154 * _1156;
        float _1164 = 1.0 / _1138;
        float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1168 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1166;
        float _1170 = 1.0 / _1162;
        float _1172 = 1.0 / _1168;
        float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1176 = _1164 * _1174;
        float _1178 = _1160 * _1170;
        float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1182 = fma(_1178, _1176, _1180);
        float _1184 = _1182 * _1172;
        float _1186 = precise::clamp(_1184, 0.0, 1.0);
        _1128 = _1176;
        _1068 = _1186;
    }
    float _1188 = _1128;
    float _1190 = _1068;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1194 = _1122 + _1192;
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1198 = _1124 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1202 = _1126 + _1200;
    float _1204 = _1194 * _1194;
    float _1206 = fma(_1198, _1198, _1204);
    float _1208 = fma(_1202, _1202, _1206);
    float _1210 = rsqrt(_1208);
    float _1212 = sqrt(_1208);
    float _1214 = _1210 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1216 = _1198 * _1214;
    float _1218 = _1202 * _1214;
    float _1220 = _1216 * _1216;
    float _1222 = _1218 * _1218;
    float _1224 = _1220 + _1222;
    float _1226 = sqrt(_1224);
    bool _1228 = _1226 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = _1226 + _1230;
    float _1234 = _1206;
    float _1236 = _1210;
    float _1238 = _1232;
    float _1240 = _1194;
    if (_1228)
    {
        float _1242 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1234 = _1242;
    }
    float _1244 = _1234;
    if (_1228)
    {
        float _1246 = rsqrt(_1224);
        _1236 = _1246;
    }
    float _1248 = _1236;
    float _1250 = _1244;
    float _1252 = _1248;
    if (_1228)
    {
        float _1254 = _1232 * _1244;
        _1238 = _1254;
    }
    float _1256 = _1238;
    if (_1228)
    {
        float _1258 = _1256 * 0.15915493667125701904296875;
        _1250 = _1258;
    }
    float _1260 = _1250;
    float _1262 = _1202;
    float _1264 = _1260;
    if (_1228)
    {
        float _1266 = _1260 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        _1262 = _1268;
    }
    float _1270 = _1262;
    float _1272 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1274 = precise::max(0.0, _1272);
    float _1276 = _1188;
    float _1278 = _1274;
    if (_1228)
    {
        float _1280 = _1260 * 6.283185482025146484375;
        float _1282 = cos(_1280);
        _1276 = _1282;
    }
    float _1284 = _1276;
    float _1286 = -_1214;
    float _1288 = -_1274;
    float _1290 = fma(_1194, _1286, _1288);
    if (_1228)
    {
        float _1292 = _1290 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1240 = _1292;
    }
    float _1294 = _1240;
    float _1296 = _1294;
    if (!_1228)
    {
        _1264 = _1220;
    }
    float _1298 = _1264;
    float _1300 = _1270;
    float _1302 = _1298;
    if (_1228)
    {
        float _1304 = fma(_1270, _1294, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1296 = _1304;
    }
    float _1306 = _1296;
    float _1308 = _1306;
    if (!_1228)
    {
        _1300 = _1290;
    }
    float _1310 = _1300;
    float _1312 = _1310;
    if (_1228)
    {
        float _1314 = _1284 + (-1.0);
        _1278 = _1314;
    }
    float _1316 = _1278;
    float _1318 = _1316;
    if (_1228)
    {
        float _1320 = _1248 * _1306;
        _1026 = _1320;
    }
    float _1322 = _1026;
    if (!_1228)
    {
        _1252 = _1216;
    }
    float _1324 = _1252;
    float _1326 = _1324;
    if (_1228)
    {
        float _1328 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1318 = _1328;
    }
    float _1330 = _1318;
    float _1332 = _1330;
    if (_1228)
    {
        float _1334 = _1216 * _1322;
        _1326 = _1334;
    }
    float _1336 = _1326;
    if (!_1228)
    {
        _1308 = _1218;
    }
    float _1338 = _1308;
    float _1340 = _1338;
    if (_1228)
    {
        float _1342 = _1218 * _1322;
        _1340 = _1342;
    }
    float _1344 = _1340;
    if (_1228)
    {
        float _1346 = fma(_1290, _1284, _1330);
        _1312 = _1346;
    }
    float _1348 = _1312;
    if (_1228)
    {
        float _1350 = _1336 * _1336;
        _1302 = _1350;
    }
    float _1352 = _1302;
    if (!_1228)
    {
        _1332 = _1222;
    }
    float _1354 = _1332;
    float _1356 = _1354;
    if (_1228)
    {
        float _1358 = _1344 * _1344;
        _1356 = _1358;
    }
    float _1360 = _1356;
    float _1362 = fma(_1348, _1348, _1352);
    float _1364 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1366 = _1362 + _1360;
    float _1368 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1364);
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1372 = fma(_1212, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1370);
    float _1374 = precise::clamp(_1372, 0.0, 1.0);
    float _1376 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1378 = rsqrt(_1366);
    float _1380 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1368);
    float _1382 = -_1374;
    float _1384 = _1382 + 1.0;
    float _1386 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1388 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1376);
    float _1390 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1392 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1394 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1386);
    float _1396 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1388);
    float _1398 = abs(_1384);
    float _1400 = log2(_1398);
    float _1402 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1392);
    float _1404 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1394);
    float _1406 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1408 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1410 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1416 = _1378 * _1336;
    float _1418 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1420 = _1378 * _1348;
    float _1422 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1414);
    float _1424 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1426 = _1378 * _1344;
    float _1428 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1430 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1422);
    float _1432 = -_1424;
    float _1434 = fma(_1420, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1432);
    float _1436 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1438 = -_1428;
    float _1440 = fma(_1438, _1390, 1.0);
    float _1442 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1430);
    float _1444 = -_1426;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1434);
    float _1448 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1450 = exp2(_1436);
    float _1452 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1454 = fma(_1446, -0.5, 0.5);
    float _1456 = fma(_1446, 0.5, 0.5);
    float _1458 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1448);
    float _1460 = _1420 + 1.0;
    float _1462 = fma(_1456, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1464 = log2(_1440);
    float _1466 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1452);
    float _1468 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1458);
    float _1470 = fma(_1456, _1462, -0.212114393711090087890625);
    float _1472 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1466);
    float _1474 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1468);
    float _1476 = fma(_1456, _1470, 1.570728778839111328125);
    float _1478 = 1.0 / _1442;
    float _1480 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1472);
    float _1482 = -_1420;
    float _1484 = fma(_1450, _1460, _1482);
    float _1486 = fma(_1484, 0.5, 0.5);
    float _1488 = sqrt(_1454);
    float _1490 = _1464 * 0.693147182464599609375;
    float _1492 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1494 = _1474 * _1478;
    float _1496 = _1480 * _1478;
    float _1498 = fma(_1494, 0.5, 0.5);
    float _1500 = fma(_1496, -0.5, 0.5);
    float _1502 = _1488 * 0.636619746685028076171875;
    float _1504 = -_1476;
    float _1506 = fma(_1502, _1504, 1.0);
    float3 _4637 = float3(_1498, _1500, _1492);
    float _1508 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4637, float3(0.0), isnan(_4637)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4637, float3(0.0), isnan(_4637)), level(0.0)).x;
    float3 _4648 = float3(_1498, _1500, _1492);
    float4 _1511 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4648, float3(0.0), isnan(_4648)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4648, float3(0.0), isnan(_4648)), level(0.0)).xyzw;
    float _1513 = _1511.x;
    float _1515 = _1511.y;
    float _1517 = _1511.z;
    float _1519 = _1511.w;
    float2 _4665 = float2(_1506, _1486);
    float3 _1523 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4665, float2(0.0), isnan(_4665)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4665, float2(0.0), isnan(_4665)), level(0.0)).xyz;
    float _1525 = _1523.x;
    float _1527 = _1523.y;
    float _1529 = _1523.z;
    float _1531 = float(uint(_564));
    float _1533 = trunc(_656);
    int _1535 = int(_1533);
    int _1537 = ~_564;
    int _1539 = _1537 + 1;
    float _1541 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1543 = abs(_462);
    int _1545 = abs(_476);
    float _1547 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1541);
    float _1549 = 1.0 / _1531;
    float _1551 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1547);
    int _1553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1555 = _1553 != 0;
    float _1557 = float(uint(_1535));
    bool _1559 = !_1555;
    float _1561 = _1559 ? 7.345489978790283203125 : 1.0;
    float _1563 = float(_90);
    float _1565 = float(_1535);
    float _1567 = _1561 * _432;
    int _1569 = as_type<int>(_1549) + (-2);
    bool _1571 = _1565 >= _676;
    bool _1573 = isnan(_1565);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan(_676);
    bool _1579 = _1575 || _1577;
    float _1581 = float(_1579);
    float _1583 = floor(_1567);
    float _1585 = as_type<float>(_1569) * _1557;
    float _1587 = trunc(_1585);
    float _1589 = precise::max(_1587, 0.0);
    uint _1592 = uint(_1589);
    float _1594 = 1.0 / _1563;
    float _1596 = -_1583;
    float _1598 = _1567 + _1596;
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1602 = _1600 != 0;
    int _1604 = _1539 * int(_1592);
    int _1606 = _1604 + _1535;
    float _1608 = trunc(_1581);
    int _1610 = int(_1608);
    float _1612 = float(uint(_1606));
    float _1614 = _692 * _1594;
    bool _1616 = !_1602;
    int _1618 = _1616 ? 0 : 1;
    float _1620 = as_type<float>(_1569) * _1612;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1624 = _1622 != 0;
    int _1626 = abs(_1618);
    float _1628 = trunc(_1620);
    float _1630 = precise::max(_1628, 0.0);
    uint _1632 = uint(_1630);
    float _1634 = in.m_59.x;
    float _1636 = trunc(_1614);
    int _1638 = int(_1636);
    int _1640 = int(_1592) + int(_1632);
    int _1642 = _1539 * _1640;
    int _1644 = _1642 + _1535;
    bool _1646 = uint(_1644) >= uint(_564);
    bool _1648 = !_1646;
    int _1650 = _1648 ? 0 : (-1);
    bool _1652 = _564 == 0;
    int _1654 = ~_1640;
    int _1656 = _1654 + _1650;
    int _1658 = _1656 + 1;
    float _1660 = _1598 * _676;
    int _1662 = ~_1610;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    int _1668 = _564 + (-1);
    int _1670 = _564 * _1658;
    int _1672 = _1670 + _1535;
    float _1674 = trunc(_1660);
    int _1676 = int(_1674);
    bool _1678 = !_1652;
    int _1680 = _1678 ? _1672 : (-1);
    int _1682 = _1680 * _1666;
    int _1684 = ~_564;
    int _1686 = _1684 + 1;
    float _1688 = in.m_61.w;
    int _1690 = _1610 * _1668;
    int _1692 = _1690 + _1682;
    int _1694 = abs(_470);
    int _1696 = _1676 * _1626;
    int _1698 = _1696 + _1535;
    bool _1700 = !_1624;
    int _1702 = _1700 ? 0 : 1;
    int _1704 = _1692 * _1543;
    int _1706 = abs(_1702);
    int _1708 = _1638 * _1694;
    int _1710 = _1708 + _1704;
    int _1712 = ~_564;
    int _1714 = _1712 + 1;
    float _1716 = float(uint(_1698));
    int _1718 = _1698 * _1545;
    int _1720 = _1718 + _1710;
    int _1722 = _1676 * _1706;
    int _1724 = _1722 + _1720;
    int _1726 = ~_564;
    int _1728 = _1726 + 1;
    float _1730 = as_type<float>(_1569) * _1716;
    out.m_63.w = _1688;
    float _1732 = float(uint(_1724));
    float _1734 = trunc(_1730);
    float _1736 = precise::max(_1734, 0.0);
    uint _1738 = uint(_1736);
    float _1740 = as_type<float>(_1569) * _1732;
    float _1742 = trunc(_1740);
    float _1744 = precise::max(_1742, 0.0);
    uint _1746 = uint(_1744);
    int _1748 = _1728 * int(_1746);
    int _1750 = _1748 + _1724;
    float _1752 = float(uint(_1750));
    float _1754 = as_type<float>(_1569) * _1752;
    float _1756 = trunc(_1754);
    float _1758 = precise::max(_1756, 0.0);
    uint _1760 = uint(_1758);
    int _1762 = int(_1746) + int(_1760);
    int _1764 = ~_564;
    int _1766 = _1764 + 1;
    int _1768 = _1714 * _1762;
    int _1770 = _1768 + _1724;
    bool _1772 = uint(_1770) >= uint(_564);
    bool _1774 = !_1772;
    int _1776 = _1774 ? 0 : (-1);
    int _1778 = ~_1762;
    int _1780 = _1778 + _1776;
    int _1782 = _1780 + 1;
    int _1784 = _564 * _1782;
    int _1786 = _1784 + _1724;
    int _1788 = _1766 * int(_1738);
    int _1790 = _1788 + _1698;
    bool _1792 = !_1652;
    int _1794 = _1792 ? _1786 : (-1);
    float _1796 = float(uint(_1790));
    int _1798 = _1794 >> 31;
    int _1800 = _1794 & 3;
    bool _1802 = _1800 != 0;
    float _1804 = as_type<float>(_1569) * _1796;
    int _1806 = _1798 & 3;
    int _1808 = _1794 + _1806;
    float _1810 = trunc(_1804);
    float _1812 = precise::max(_1810, 0.0);
    uint _1814 = uint(_1812);
    int _1816 = _1808 >> 2;
    int _1818 = _1816 << 4;
    int _1820 = _1818 + 368;
    int _1822 = _1794 & 3;
    bool _1824 = _1822 != 0;
    uint _1826 = uint(int(uint(_1820) >> uint(2)));
    uint _1828 = uint(int(uint(int(_1826)) >> uint(2)));
    int _1830 = int(_1826) & 3;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[int(_1828)][_1830];
    int _1834 = int(_1826) + 1;
    uint _1836 = uint(int(uint(_1834) >> uint(2)));
    int _1838 = _1834 & 3;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[int(_1836)][_1838];
    int _1842 = _1802 ? 0 : 1;
    bool _1844 = uint(_1822) > 1u;
    int _1846 = int(_1738) + int(_1814);
    bool _1848 = _1822 != 3;
    int _1850 = _1820 + 8;
    uint _1852 = uint(int(uint(_1850) >> uint(2)));
    uint _1854 = uint(int(uint(int(_1852)) >> uint(2)));
    int _1856 = int(_1852) & 3;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[int(_1854)][_1856];
    int _1860 = int(_1852) + 1;
    uint _1862 = uint(int(uint(_1860) >> uint(2)));
    int _1864 = _1860 & 3;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[int(_1862)][_1864];
    int _1868 = _1686 * _1846;
    int _1870 = _1868 + _1698;
    bool _1872 = uint(_1870) >= uint(_564);
    float _1874 = in.m_61.z;
    bool _1876 = !_1872;
    int _1878 = _1876 ? 0 : (-1);
    bool _1880 = uint(_1822) >= 2u;
    int _1882 = ~_1846;
    int _1884 = _1882 + _1878;
    int _1886 = _1884 + 1;
    int _1888 = ~_1842;
    int _1890 = _1888 + 1;
    int _1892 = _1890 + 1;
    int _1894 = _1892;
    if (!_1844)
    {
        int _1896 = ~_1842;
        int _1898 = _1896 + 1;
        _1894 = _1898;
    }
    int _1900 = _1894;
    int _1902 = _564 * _1886;
    int _1904 = _1902 + _1698;
    int _1906 = _1880 ? 0 : 1;
    bool _1908 = !_1824;
    int _1910 = _1908 ? 0 : 1;
    int _1912 = abs(_1900);
    bool _1914 = _1822 != 3;
    int _1916 = ~_1906;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    int _1922 = _1920;
    if (_1848)
    {
        int _1924 = ~_1906;
        int _1926 = _1924 + 1;
        _1922 = _1926;
    }
    int _1928 = _1922;
    int _1930 = abs(_1910);
    out.m_63.z = _1874;
    float _1932 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1934 = int(_1932);
    int _1936 = ~_1912;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    bool _1942 = !_1914;
    int _1944 = _1942 ? 0 : (-1);
    int _1946 = abs(_1928);
    int _1948 = _1940 * as_type<int>(_1840);
    int _1950 = ~_1930;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    int _1956 = abs(_1944);
    int _1958 = _1954 * as_type<int>(_1832);
    int _1960 = _1958 + _1948;
    int _1962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1964 = _1962 != 0;
    int _1966 = ~_1946;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    float _1972 = in.m_61.x;
    bool _1974 = !_1964;
    int _1976 = _1974 ? 0 : 1;
    int _1978 = ~_1956;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    int _1984 = _1970 * as_type<int>(_1858);
    int _1986 = _1984 + _1960;
    int _1988 = abs(_1976);
    int _1990 = abs(_1934);
    int _1992 = _1982 * as_type<int>(_1866);
    int _1994 = _1992 + _1986;
    float _1996 = float(uint(_1934));
    float _1998 = float(uint(_1990));
    int _2000 = ~_1988;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    float _2006 = 1.0 / _1996;
    int _2008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2010 = _2008 != 0;
    int _2012 = _1994 * _2004;
    bool _2014 = !_1652;
    int _2016 = _2014 ? _1904 : (-1);
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2020 = _2018 != 0;
    float _2022 = in.m_61.y;
    float _2024 = 1.0 / _1998;
    int _2026 = _2016 * _1988;
    int _2028 = _2026 + _2012;
    int _2030 = ~_1934;
    int _2032 = _2030 + 1;
    out.m_63.x = _1972;
    bool _2034 = _434 > 0.5;
    int _2036 = abs(_2028);
    if (_2010)
    {
        float _2038 = in.m_51.x;
        _1028 = _2038;
    }
    float _2040 = _1028;
    int _2042 = as_type<int>(_2006) + (-2);
    float _2044 = float(uint(_2028));
    int _2046 = ~_1990;
    int _2048 = _2046 + 1;
    float _2050 = as_type<float>(_2042) * _2044;
    int _2052 = as_type<int>(_2024) + (-2);
    float _2054 = in.m_59.y;
    float _2056 = float(uint(_2036));
    float _2058 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2058;
    float _2062 = trunc(_2050);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    float _2068 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2070 = _424 + _2068;
    float _2072 = as_type<float>(_2052) * _2056;
    out.m_63.y = _2022;
    bool _2074 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2076 = isnan(_424);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2082 = _2078 || _2080;
    float _2084 = float(_2082);
    float _2086 = trunc(_2072);
    float _2088 = precise::max(_2086, 0.0);
    uint _2090 = uint(_2088);
    float _2092 = 1.0 / _2060;
    int _2094 = _2032 * int(_2066);
    int _2096 = _2094 + _2028;
    float _2098 = float(uint(_2096));
    int _2100 = _2048 * int(_2090);
    int _2102 = _2100 + _2036;
    float _2104 = -_2054;
    float _2106 = _2104 + 1.0;
    float _2108 = as_type<float>(_2042) * _2098;
    bool _2110 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2112 = isnan(_424);
    bool _2114 = _2110 || _2112;
    bool _2116 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2118 = _2114 || _2116;
    float _2120 = float(_2118);
    float _2122 = float(uint(_2102));
    float _2124 = _2070 * _2092;
    float _2126 = trunc(_2108);
    float _2128 = precise::max(_2126, 0.0);
    uint _2130 = uint(_2128);
    float _2132 = as_type<float>(_2052) * _2122;
    float _2134 = _2054;
    float _2136 = as_type<float>(_2052);
    if (_2020)
    {
        float _2138 = _2034 ? _2106 : _2054;
        _2134 = _2138;
    }
    float _2140 = _2134;
    float _2142 = -_2120;
    float _2144 = _2142 + 1.0;
    bool _2146 = _2040 > 0.5;
    bool _2148 = _2146 && _2010;
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2150;
    float _2154 = _2152;
    if (_2010)
    {
        _2136 = _1634;
    }
    float _2156 = _2136;
    float _2158 = _2084 * _2144;
    float _2160 = trunc(_2132);
    float _2162 = precise::max(_2160, 0.0);
    uint _2164 = uint(_2162);
    float _2166 = fma(_2152, _2124, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2168 = _2156;
    if (!_2010)
    {
        _2154 = _1634;
    }
    float _2170 = _2154;
    float _2172 = -_2084;
    float _2174 = _2172 + 1.0;
    int _2176 = ~_1934;
    int _2178 = _2176 + 1;
    float _2180 = _2166 * _2158;
    int _2182 = ~_1990;
    int _2184 = _2182 + 1;
    int _2186 = int(_2066) + int(_2130);
    float _2188 = _2170;
    if (_2148)
    {
        float _2190 = -_2156;
        float _2192 = _2190 + 1.0;
        _2168 = _2192;
    }
    float _2194 = _2168;
    float _2196 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2180);
    int _2198 = _2178 * _2186;
    int _2200 = _2198 + _2028;
    if (_2010)
    {
        _2188 = _2194;
    }
    float _2202 = _2188;
    float _2204 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2206 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2204;
    int _2208 = int(_2090) + int(_2164);
    float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2212 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2210;
    float _2214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2216 = uint(_2200) >= uint(_1934);
    float _2218 = fma(_2206, _2124, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    int _2220 = _2184 * _2208;
    int _2222 = _2220 + _2036;
    float _2224 = fma(_2212, _2124, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2226 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2196);
    float _2228 = _2218 * _2158;
    bool _2230 = uint(_2222) >= uint(_1990);
    float _2232 = _2224 * _2158;
    int _2234 = _2028 ^ _1934;
    float _2236 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2228);
    bool _2238 = !_2230;
    int _2240 = _2238 ? 0 : (-1);
    float _2242 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2232);
    uint _2244 = uint(int(uint(_2234) >> uint(31)));
    float _2246 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2236);
    bool _2248 = !_2216;
    int _2250 = _2248 ? 0 : (-1);
    float _2252 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2242);
    int _2254 = ~_2240;
    int _2256 = _2208 + _2254;
    int _2258 = _2256 + 1;
    float _2260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2262 = ~_2186;
    int _2264 = _2262 + _2250;
    int _2266 = _2264 + 1;
    float _2268 = _2226 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2270 = ~int(_2244);
    int _2272 = _2270 + 1;
    float _2274 = _2214 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2276 = _1934 == 0;
    int _2278 = _1934 * _2266;
    int _2280 = _2278 + _2028;
    int _2282 = _2258 ^ _2272;
    float _2284 = fma(_2274, _2202, -0.5);
    bool _2286 = _1934 == 0;
    float _2288 = _2246 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2290 = !_2276;
    int _2292 = _2290 ? _2280 : (-1);
    float _2294 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2296 = _2252 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2298 = ~_2272;
    int _2300 = _2298 + _2282;
    int _2302 = _2300 + 1;
    float _2304 = _2268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2306 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2308 = _2288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2310 = exp2(_2294);
    float _2312 = _2296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2314 = !_2286;
    int _2316 = _2314 ? _2302 : (-1);
    float _2318 = fma(_2306, _2140, -0.5);
    float _2320 = float(_2292);
    float _2322 = float(_2316);
    out.m_65.x = _2304;
    out.m_65.y = _2308;
    out.m_65.z = _2312;
    bool _2324 = _1190 > 0.0;
    bool _2326 = isnan(_1190);
    bool _2328 = _2324 || _2326;
    bool _2330 = isnan(0.0);
    bool _2332 = _2328 || _2330;
    float _2334 = fma(_2274, _2320, _540);
    float _2336 = -_684;
    float _2338 = fma(_2306, _2322, _2336);
    float _2340 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1551);
    float _2342 = fma(_688, _2284, _2334);
    float _2344 = _1442 * 0.5;
    float _2346 = fma(_686, _2318, _2338);
    float _2348 = -_2310;
    float _2350 = _2348 + 1.0;
    float _2352 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2354 = _2340 + _1442;
    float _2356 = _1474 + _1442;
    float _2358 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1474;
    out.gl_Position.y = _1480;
    out.gl_Position.z = _2340;
    out.gl_Position.w = _1442;
    float _2360 = _2354 * 0.5;
    float _2362 = _2358 * _1508;
    float _2364 = -_2358;
    float _2366 = _2364 + 1.0;
    float _2368 = _2356 * 0.5;
    float _2370 = fma(_1480, -0.5, _2344);
    float _2372 = _1519 * _2362;
    float _2374 = _1529 * _2362;
    float _2376 = _2342 + 0.5;
    float _2378 = _2346 + 0.5;
    float _2380 = fma(_1525, _2372, _1513);
    float _2382 = _2352 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2384 = fma(_1527, _2372, _1515);
    float _2386 = _1519 * _2366;
    float _2388 = fma(_1519, _2374, _1517);
    out.m_67.x = _2368;
    out.m_67.y = _2370;
    out.m_67.z = _2360;
    out.m_67.w = _1442;
    out.m_69.x = _2376;
    out.m_69.y = _2378;
    out.m_45.x = _2382;
    out.m_71.x = _2380;
    out.m_71.y = _2384;
    out.m_71.z = _2388;
    out.m_71.w = _2386;
    if (_2332)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2390 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2390;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

