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
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_73 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1897 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2181 = as_type<float>(_120);
        out.gl_Position.z = _2181;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_51.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_106);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    float _154 = 0.0;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_49.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2250 = as_type<float>(_160);
        out.gl_Position.z = _2250;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_53.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
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
        float _190 = _138 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = in.m_55.x;
    float _196 = in.m_55.y;
    float _198 = in.m_55.z;
    float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _202 = log2(_200);
    float _204 = in.m_53.x;
    float _206 = in.m_53.y;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _210 = _208 != 0;
    float _212 = in.m_53.z;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _216 = _214 != 0;
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _220 = _218 != 0;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _224 = _222 != 0;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = 1.0 / _228;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _234 = _196 * _196;
    float _236 = abs(_196);
    float _238 = _236 + 0.001000000047497451305389404296875;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _192 + _240;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _246 = fma(_194, _194, _234);
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _248 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[193].y, 1.0);
    float _254 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[193].x, 1.0);
    float _256 = fma(_198, _198, _246);
    float _258 = 1.0 / _250;
    float _260 = _204 * 2.0;
    float _262 = _252 * _198;
    float _264 = _204 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _266 = _254 * _194;
    float _268 = _196 * (*spvDescriptorSet0.vp_c9)._m0[194].z;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _192 + _270;
    float _274 = -_232;
    float _276 = fma(_264, 2.0, _274);
    float _278 = floor(_260);
    float _280 = _206 * 2.0;
    float _282 = _206 + _204;
    float _284 = _242 * _230;
    float _286 = _206 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _288 = _282 + (-1.0);
    float _290 = _238 * (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _292 = floor(_280);
    float _294 = _272 * _258;
    float _296 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _298;
    float _302 = fma(_286, -2.0, _244);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    bool _312 = _278 >= 0.0;
    bool _314 = isnan(_278);
    bool _316 = _312 || _314;
    bool _318 = isnan(0.0);
    bool _320 = _316 || _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _322;
    float _326 = fma(_300, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _328 = fma(_310, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _330 = _320 ? 0 : 1;
    float _332 = fma(_324, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _338 = _292 > 0.0;
    float _340 = fma(_306, _294, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _342 = _292 >= 0.0;
    bool _344 = isnan(_292);
    bool _346 = _342 || _344;
    bool _348 = isnan(0.0);
    bool _350 = _346 || _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _356 = _278 > 0.0;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _360 = fma(_336, _294, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _362 = _278;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _366 = _294;
    float _368 = (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _370 = _216;
    if (!_210)
    {
        _362 = _206;
    }
    float _372 = _362;
    float _374 = fma(_354, _294, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _376 = _372;
    if (_210)
    {
        _376 = _204;
    }
    float _378 = _376;
    float _380 = -_290;
    float _382 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[194].y, _380);
    float _384 = _378;
    if (!_210)
    {
        _364 = _212;
    }
    float _386 = _364;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _390 = _386;
    if (!_210)
    {
        _366 = _206;
    }
    float _392 = _366;
    float _394 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[83].z, _358);
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _398 = _392;
    if (_210)
    {
        _398 = _204;
    }
    float _400 = _398;
    float _402 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _302);
    if (!_210)
    {
        _368 = _204;
    }
    float _404 = _368;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _408 = _404;
    if (_210)
    {
        _408 = _212;
    }
    float _410 = _408;
    float _412 = _400 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_210)
    {
        _384 = _386;
    }
    float _414 = _384;
    float _416 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _394);
    float _418 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[84].z, _388);
    float _420 = _414;
    if (_210)
    {
        _420 = _206;
    }
    float _422 = _420;
    float _424 = -_406;
    float _426 = fma(_412, 2.0, _424);
    if (_210)
    {
        _390 = _206;
    }
    float _428 = _390;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _432 = _212 * 2.0;
    float _434 = _422 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _436 = ~_330;
    int _438 = _436 + 1;
    int _440 = _438 + 1;
    float _442 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[83].w, _396);
    float _444 = _206 + _212;
    int _446 = _440;
    if (!_356)
    {
        int _448 = ~_330;
        int _450 = _448 + 1;
        _446 = _450;
    }
    int _452 = _446;
    float _454 = fma(_434, -2.0, _430);
    float _456 = _204 + _212;
    float _458 = _444 + (-1.0);
    bool _460 = !_220;
    int _462 = _460 ? 0 : 1;
    float _464 = floor(_432);
    float _466 = _456 + (-1.0);
    float _468 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _470 = abs(_462);
    float _472 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[84].x, _418);
    bool _474 = !_224;
    int _476 = _474 ? 0 : 1;
    int _478 = _350 ? 0 : 1;
    int _480 = abs(_476);
    float _482 = _202 * _138;
    int _484 = ~_478;
    int _486 = _484 + 1;
    int _488 = _486 + 1;
    float _490 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _492 = float(_452);
    float _494 = float(_470);
    float _496 = exp2(_482);
    int _498 = _488;
    if (!_338)
    {
        int _500 = ~_478;
        int _502 = _500 + 1;
        _498 = _502;
    }
    int _504 = _498;
    bool _506 = _464 > 0.0;
    float _508 = _494 * _492;
    float _510 = float(_504);
    float _512 = -_138;
    float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[76].x, _276);
    float _516 = abs(_238);
    float _518 = log2(_516);
    float _520 = _508 * (-2.0);
    bool _522 = _464 >= 0.0;
    bool _524 = isnan(_464);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _534 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _536 = isnan(0.0);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _542 = _538 || _540;
    float _544 = float(_480);
    float _546 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[78].w, _532);
    float _548 = -_496;
    float _550 = _548 + 1.0;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _554 = 1.0 + _552;
    float _556 = sqrt(_256);
    float _558 = _544 * _510;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _562 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _564 = isnan(1.0);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _570 = _566 || _568;
    float _572 = in.m_57.x;
    float _574 = in.m_57.y;
    float _576 = in.m_57.z;
    float _578 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _546);
    float _580 = _558 * (-2.0);
    float _582 = fma(_468, _520, _468);
    float _584 = 1.0 / _554;
    int _586 = _530 ? 0 : 1;
    float _588 = fma(_490, _580, _490);
    float _590 = _542 ? _550 : 0.0;
    float _592 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[78].z, _560);
    bool _594 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _596 = isnan(_192);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -_138;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[81].x, _426);
    float _610 = _382 * 0.01745329238474369049072265625;
    float _612 = abs(_556);
    float _614 = log2(_612);
    int _616 = ~_586;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _442);
    bool _624 = !_216;
    int _626 = _624 ? 0 : 1;
    float _628 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _592);
    int _630 = _620;
    if (!_506)
    {
        int _632 = ~_586;
        int _634 = _632 + 1;
        _630 = _634;
    }
    int _636 = _630;
    float _638 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _454);
    float _640 = _212 + (-0.5);
    if (_570)
    {
        float _642 = _590 * _584;
        _142 = _642;
    }
    float _644 = _142;
    float _646 = _518 * 0.5;
    bool _648 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _650 = isnan(_192);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = _204 + (-0.5);
    float _662 = fma(_520, _574, _574);
    float _664 = _206 + (-0.5);
    float _666 = fma(_580, _576, _576);
    float _668 = -_604;
    float _670 = _668 + 1.0;
    float _672 = _610 * 0.15915493667125701904296875;
    float _674 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[196].y, _662);
    bool _676 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _678 = isnan(_192);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[196].z, _666);
    int _690 = abs(_626);
    float _692 = fma(_582, _644, _674);
    float _694 = float(_636);
    float _696 = _686 * _670;
    float _698 = _614 * 1.5;
    float _700 = -_686;
    float _702 = _700 + 1.0;
    float _704 = _672 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = float(_690);
    float _710 = _692 * 0.15915493667125701904296875;
    float _712 = _658 * _702;
    float _714 = fma(_588, _644, _688);
    float _716 = -_658;
    float _718 = _716 + 1.0;
    float _720 = _708 * _694;
    float _722 = _326 * _712;
    float _724 = exp2(_646);
    float _726 = _328 * _712;
    float _728 = _720 * (-2.0);
    float _730 = _332 * _712;
    float _732 = _714 * 0.15915493667125701904296875;
    float _734 = fma(_728, _572, _572);
    float _736 = fma(_296, _728, _296);
    float _738 = in.m_59.x;
    float _740 = in.m_59.y;
    float _742 = in.m_59.z;
    float _744 = exp2(_698);
    float _746 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[196].x, _734);
    float _748 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[143].x, _722);
    float _750 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[143].y, _726);
    float _752 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[143].z, _730);
    float _754 = fma(_736, _644, _746);
    float _756 = fma(_706, 0.5, 0.5);
    float _758 = fma(_340, _696, _748);
    float _760 = _754 * 0.15915493667125701904296875;
    float _762 = _724 * _756;
    float _764 = fma(_374, _696, _752);
    float _766 = fma(_360, _696, _750);
    float _768 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].x, _758);
    float _770 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[193].w, 1.0);
    float _772 = _710 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].z, _764);
    float _778 = _744 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _780 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].y, _766);
    float _782 = _770 * _262;
    float _784 = fma(_266, _770, _778);
    float _786 = _710 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _768 * _738;
    float _792 = _780 * _740;
    float _794 = in.m_46.x;
    float _796 = in.m_46.y;
    float _798 = in.m_46.z;
    float _800 = _776 * _742;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _268);
    float _804 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _806 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _808 = _760 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _800 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _784);
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _782);
    float _818 = _802 * _804;
    float _820 = _814 * _806;
    float _822 = _816 * _812;
    float _824 = _760 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _732 * 6.283185482025146484375;
    float _830 = cos(_828);
    float _832 = _810 * _788;
    float _834 = _810 * _774;
    float _836 = _796 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _838 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[4].x, _836);
    float _840 = _732 * 6.283185482025146484375;
    float _842 = sin(_840);
    float _844 = _826 * _774;
    float _846 = _826 * _788;
    float _848 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[4].z, _838);
    float _850 = _826 * _830;
    float _852 = _788 * _830;
    float _854 = _774 * _830;
    float _856 = _810 * _830;
    float _858 = _856 * _818;
    float _860 = -_844;
    float _862 = fma(_842, _832, _860);
    float _864 = -_832;
    float _866 = fma(_842, _844, _864);
    float _868 = fma(_842, _846, _834);
    float _870 = _850 * _818;
    float _872 = fma(_842, _834, _846);
    float _874 = -_818;
    float _876 = _842 * _874;
    float _878 = _796 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _880 = fma(_868, _820, _870);
    float _882 = fma(_862, _820, _858);
    float _884 = fma(_852, _820, _876);
    float _886 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[6].x, _878);
    float _888 = fma(_866, _822, _880);
    float _890 = fma(_872, _822, _882);
    float _892 = fma(_854, _822, _884);
    float _894 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _896 = _888 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _898 = _888 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _900 = _888 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _902 = _894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _904 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[10].x, _896);
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[8].x, _898);
    float _908 = _848 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _910 = _796 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _912 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[10].z, _904);
    float _914 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[8].z, _906);
    float _916 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[9].x, _900);
    float _918 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[5].x, _910);
    float _920 = _902 + _912;
    float _922 = _908 + _914;
    float _924 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[9].z, _916);
    float _926 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[5].z, _918);
    float _928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _930 = _920 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _934 = _922 + _932;
    float _936 = _926 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _938 = _930 * _930;
    float _940 = fma(_934, _934, _938);
    float _942 = _924 * _924;
    float _944 = _936 + _924;
    float _946 = sqrt(_940);
    float _948 = fma(_914, _914, _942);
    float _950 = fma(_912, _912, _948);
    float _952 = -_950;
    float _954 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[194].w, _944);
    bool _956 = _946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _958 = _794;
    float _960 = _798;
    float _962 = _926;
    float _964 = _922;
    if (!_956)
    {
        _958 = _922;
    }
    float _966 = _958;
    float _968 = _966;
    if (!_956)
    {
        _960 = _920;
    }
    float _970 = _960;
    float _972 = _970;
    if (!_956)
    {
        _962 = _954;
    }
    float _974 = _962;
    bool _976 = !_956;
    float _978 = _974;
    if (!_976)
    {
        float _980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _982 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _984 = _946 + _982;
        float _986 = _954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = _984 * _980;
        float _990 = rsqrt(_940);
        float _992 = _988 * 0.15915493667125701904296875;
        float _994 = _992 * 6.283185482025146484375;
        float _996 = cos(_994);
        float _998 = _992 * 6.283185482025146484375;
        float _1000 = sin(_998);
        float _1002 = _996 + (-1.0);
        float _1004 = _1002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1006 = fma(_1000, _986, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1008 = fma(_954, _996, _1004);
        float _1010 = _990 * _1006;
        float _1012 = fma(_934, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1014 = fma(_930, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _978 = _1008;
        _968 = _1012;
        _972 = _1014;
    }
    float _1016 = _978;
    float _1018 = _968;
    float _1020 = _972;
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1024 = _1016 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1028 = _1018 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1032 = _1020 + _1030;
    float _1034 = _1024 * _1024;
    float _1036 = fma(_1028, _1028, _1034);
    float _1038 = fma(_1032, _1032, _1036);
    float _1040 = rsqrt(_1038);
    float _1042 = sqrt(_1038);
    float _1044 = _1040 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1046 = _1028 * _1044;
    float _1048 = _1032 * _1044;
    float _1050 = _1046 * _1046;
    float _1052 = _1048 * _1048;
    float _1054 = _1050 + _1052;
    float _1056 = sqrt(_1054);
    bool _1058 = _1056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = _1056 + _1060;
    float _1064 = _1032;
    float _1066 = _1054;
    float _1068 = _1062;
    float _1070 = _1024;
    if (_1058)
    {
        float _1072 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1064 = _1072;
    }
    float _1074 = _1064;
    if (_1058)
    {
        float _1076 = rsqrt(_1054);
        _1066 = _1076;
    }
    float _1078 = _1066;
    float _1080 = _1078;
    if (_1058)
    {
        float _1082 = _1062 * _1074;
        _1068 = _1082;
    }
    float _1084 = _1068;
    if (_1058)
    {
        float _1086 = _1084 * 0.15915493667125701904296875;
        _964 = _1086;
    }
    float _1088 = _964;
    float _1090 = _1040;
    float _1092 = _1088;
    if (_1058)
    {
        float _1094 = _1088 * 6.283185482025146484375;
        float _1096 = cos(_1094);
        _1090 = _1096;
    }
    float _1098 = _1090;
    float _1100 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1102 = precise::max(0.0, _1100);
    float _1104 = _912;
    float _1106 = _1102;
    float _1108 = _1100;
    if (_1058)
    {
        float _1110 = _1088 * 6.283185482025146484375;
        float _1112 = sin(_1110);
        _1104 = _1112;
    }
    float _1114 = _1104;
    float _1116 = -_1044;
    float _1118 = -_1102;
    float _1120 = fma(_1024, _1116, _1118);
    if (_1058)
    {
        float _1122 = _1120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1106 = _1122;
    }
    float _1124 = _1106;
    float _1126 = _1124;
    float _1128 = _1098;
    if (_1058)
    {
        float _1130 = _1098 + (-1.0);
        _1108 = _1130;
    }
    float _1132 = _1108;
    float _1134 = _1132;
    if (!_1058)
    {
        _1092 = _1048;
    }
    float _1136 = _1092;
    float _1138 = _1114;
    float _1140 = _1136;
    if (_1058)
    {
        float _1142 = fma(_1114, _1124, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1070 = _1142;
    }
    float _1144 = _1070;
    float _1146 = _1144;
    if (_1058)
    {
        float _1148 = _1132 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1126 = _1148;
    }
    float _1150 = _1126;
    if (!_1058)
    {
        _1138 = _1120;
    }
    float _1152 = _1138;
    float _1154 = _1152;
    if (_1058)
    {
        float _1156 = _1078 * _1144;
        _1134 = _1156;
    }
    float _1158 = _1134;
    if (!_1058)
    {
        _1146 = _1046;
    }
    float _1160 = _1146;
    float _1162 = _1160;
    if (_1058)
    {
        float _1164 = fma(_1120, _1098, _1150);
        _1154 = _1164;
    }
    float _1166 = _1154;
    if (!_1058)
    {
        _1080 = _1050;
    }
    float _1168 = _1080;
    float _1170 = _1168;
    if (_1058)
    {
        float _1172 = _1046 * _1158;
        _1162 = _1172;
    }
    float _1174 = _1162;
    if (_1058)
    {
        float _1176 = _1048 * _1158;
        _1140 = _1176;
    }
    float _1178 = _1140;
    float _1180 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1058)
    {
        _1128 = _1052;
    }
    float _1182 = _1128;
    float _1184 = _1182;
    if (_1058)
    {
        float _1186 = _1174 * _1174;
        _1170 = _1186;
    }
    float _1188 = _1170;
    if (_1058)
    {
        float _1190 = _1178 * _1178;
        _1184 = _1190;
    }
    float _1192 = _1184;
    float _1194 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1180);
    float _1196 = fma(_1166, _1166, _1188);
    float _1198 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1194);
    float _1200 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1202 = _1196 + _1192;
    float _1204 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1208 = fma(_1042, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1206);
    float _1210 = precise::clamp(_1208, 0.0, 1.0);
    float _1212 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1214 = fma(_908, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1216 = rsqrt(_1202);
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1220 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1222 = -_1210;
    float _1224 = _1222 + 1.0;
    float _1226 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1212);
    float _1228 = -_1220;
    float _1230 = fma(_1228, _1218, 1.0);
    float _1232 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1234 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1226);
    float _1236 = abs(_1224);
    float _1238 = log2(_1236);
    float _1240 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1200);
    float _1242 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1232);
    float _1244 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1246 = fma(_902, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1248 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1240);
    float _1250 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1242);
    float _1252 = _1216 * _1174;
    float _1254 = floor(_1214);
    float _1256 = _1216 * _1166;
    float _1258 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1260 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1262 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1264 = _1216 * _1178;
    float _1266 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1268 = -_1260;
    float _1270 = fma(_1256, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1268);
    float _1272 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1262);
    float _1274 = floor(_1246);
    float _1276 = _1238 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1278 = -_1264;
    float _1280 = fma(_1278, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1270);
    float _1282 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1284 = fma(_1280, -0.5, 0.5);
    float _1286 = -_1254;
    float _1288 = _1214 + _1286;
    float _1290 = log2(_1230);
    float _1292 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1294 = fma(_1280, 0.5, 0.5);
    float _1296 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1282);
    float _1298 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1292);
    float _1300 = fma(_1294, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1302 = exp2(_1276);
    float _1304 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1272);
    float _1306 = -_1274;
    float _1308 = _1246 + _1306;
    float _1310 = fma(_1294, _1300, -0.212114393711090087890625);
    float _1312 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1298);
    float _1314 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1304);
    float _1316 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1296);
    float _1318 = _1256 + 1.0;
    float _1320 = sqrt(_1284);
    float _1322 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1312);
    float _1324 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1316);
    float _1326 = _1290 * 0.693147182464599609375;
    float2 _4142 = float2(_1288, _1308);
    float _1328 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4142, float2(0.0), isnan(_4142)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4142, float2(0.0), isnan(_4142)), level(0.0)).x;
    float _1330 = fma(_1294, _1310, 1.570728778839111328125);
    float _1332 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1334 = 1.0 / _1314;
    float _1336 = -_1256;
    float _1338 = fma(_1302, _1318, _1336);
    float _1340 = fma(_1338, 0.5, 0.5);
    float _1342 = _1320 * 0.636619746685028076171875;
    float _1344 = -_1330;
    float _1346 = fma(_1342, _1344, 1.0);
    float _1348 = _1322 * _1334;
    float _1350 = _1324 * _1334;
    float _1352 = fma(_1348, 0.5, 0.5);
    float _1354 = fma(_1350, -0.5, 0.5);
    float3 _4189 = float3(_1352, _1354, _1332);
    float _1356 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4189, float3(0.0), isnan(_4189)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4189, float3(0.0), isnan(_4189)), level(0.0)).x;
    float3 _4200 = float3(_1352, _1354, _1332);
    float4 _1359 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4200, float3(0.0), isnan(_4200)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4200, float3(0.0), isnan(_4200)), level(0.0)).xyzw;
    float _1361 = _1359.x;
    float _1363 = _1359.y;
    float _1365 = _1359.z;
    float _1367 = _1359.w;
    float2 _4216 = float2(_1346, _1340);
    float3 _1371 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4216, float2(0.0), isnan(_4216)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4216, float2(0.0), isnan(_4216)), level(0.0)).xyz;
    float _1373 = _1371.x;
    float _1375 = _1371.y;
    float _1377 = _1371.z;
    float _1379 = _936 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1381 = _936 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1383 = _206 > 0.5;
    float _1385 = in.m_61.y;
    float _1387 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1379);
    float _1389 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1381);
    float _1391 = in.m_61.x;
    float _1393 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1387);
    float _1395 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1389);
    int _1397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1399 = _1397 != 0;
    float _1401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1403 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1405 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1407 = in.m_53.w;
    int _1409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1411 = _1409 != 0;
    float _1413 = _1405 + _1403;
    int _1415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1417 = _1415 != 0;
    float _1419 = 1.0 / _1403;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1423 = _1421 != 0;
    float _1425 = _472 * (-0.15915493667125701904296875);
    float _1427 = 0.0;
    bool _1429 = _1383;
    float _1431 = _1314;
    float _1433 = _1324;
    if (_1399)
    {
        float _1435 = in.m_53.x;
        _1427 = _1435;
    }
    float _1437 = _1427;
    float _1439 = _1238 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1445 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1417)
    {
        bool _1447 = _212 > 0.5;
        _370 = _1447;
    }
    bool _1449 = _370;
    float _1451 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1453 = -_1385;
    float _1455 = _1453 + 1.0;
    float _1457 = _1413 * _1419;
    float _1459 = _1457 * 0.5;
    float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1463 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1469 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1467);
    bool _1471 = _1407 > 0.5;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1475 = _1465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1477 = 1.0 / _1469;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1481 = _1383 ? as_type<int>(_1455) : as_type<int>(_1385);
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1485 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1487 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1493 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1495 = _1411 ? as_type<float>(_1481) : _1385;
    out.m_63.x = _1445;
    out.m_63.y = _1487;
    out.m_63.z = _1463;
    out.m_63.w = _1443;
    float _1497 = _1385;
    int _1499 = as_type<int>(_1455);
    int _1501 = as_type<int>(_1463);
    float _1503 = _1487;
    float _1505 = _1461;
    if (_1423)
    {
        float _1507 = _1471 ? _1455 : _1385;
        _1497 = _1507;
    }
    float _1509 = _1497;
    if (_1417)
    {
        float _1511 = -_1391;
        float _1513 = _1511 + 1.0;
        _1499 = as_type<int>(_1513);
    }
    int _1515 = _1499;
    float _1517 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_65.x = _1493;
    out.m_65.y = _1475;
    out.m_65.z = _1485;
    out.m_65.w = _1489;
    float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1521 = _1477 * _1519;
    float _1523 = _1425 * 6.283185482025146484375;
    float _1525 = sin(_1523);
    if (_1399)
    {
        bool _1527 = _1437 > 0.5;
        _1429 = _1527;
    }
    bool _1529 = _1429;
    float _1531 = in.m_67.x;
    float _1533 = in.m_67.y;
    float _1535 = in.m_67.z;
    float _1537 = fma(_1517, _1509, -0.5);
    float _1539 = _1461 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1541 = _268 != 0.0;
    bool _1543 = isnan(_268);
    bool _1545 = _1541 || _1543;
    bool _1547 = isnan(0.0);
    bool _1549 = _1545 || _1547;
    float _1551 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1553 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1555 = abs(_1521);
    float _1557 = log2(_1555);
    if (_1399)
    {
        float _1559 = -_1391;
        float _1561 = _1559 + 1.0;
        _1501 = as_type<int>(_1561);
    }
    int _1563 = _1501;
    if (!_1417)
    {
        _1503 = _1391;
    }
    float _1565 = _1503;
    float _1567 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1551);
    float _1569 = _1565;
    if (_1417)
    {
        float _1571 = _1449 ? as_type<float>(_1515) : _1391;
        _1569 = _1571;
    }
    float _1573 = _1569;
    float _1575 = fma(_1539, _1495, -0.5);
    if (!_1399)
    {
        _1505 = _1391;
    }
    float _1577 = _1505;
    out.m_69.x = _382;
    float _1579 = _1425 * 6.283185482025146484375;
    float _1581 = cos(_1579);
    float _1583 = _1577;
    if (_1399)
    {
        float _1585 = _1529 ? as_type<float>(_1563) : _1391;
        _1583 = _1585;
    }
    float _1587 = _1583;
    float _1589 = _1525 * _1537;
    bool _1591 = _784 == 0.0;
    bool _1593 = !_1549;
    bool _1595 = _1591 && _1593;
    float _1597 = fma(_1553, _1573, -0.5);
    float _1599 = -_402;
    float _1601 = fma(_578, _1575, _1599);
    bool _1603 = _782 == 0.0;
    bool _1605 = _1603 && _1595;
    float _1607 = _1557 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1611 = _1521 <= 8000.0;
    bool _1613 = isnan(_1521);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(8000.0);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    out.m_71.x = _1018;
    out.m_71.y = _1016;
    out.m_71.z = _1020;
    float _1623 = _1581 * _1537;
    float _1625 = exp2(_1607);
    float _1627 = -_1589;
    float _1629 = fma(_1581, _1597, _1627);
    float _1631 = fma(_1525, _1597, _1623);
    float _1633 = _1533;
    float _1635 = _1531;
    float _1637 = _1535;
    if (!_1605)
    {
        float _1639 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1533);
        _1633 = _1639;
    }
    float _1641 = _1633;
    float _1643 = fma(_416, _1629, _608);
    if (!_1605)
    {
        float _1645 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1531);
        _1635 = _1645;
    }
    float _1647 = _1635;
    float _1649 = -_638;
    float _1651 = fma(_622, _1631, _1649);
    float _1653 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1655 = _850 * _1641;
    float _1657 = -_1641;
    float _1659 = _842 * _1657;
    float _1661 = _856 * _1641;
    float _1663 = fma(_1653, _1587, -0.5);
    if (!_1605)
    {
        float _1665 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1535);
        _1637 = _1665;
    }
    float _1667 = _1637;
    float _1669 = fma(_868, _1647, _1655);
    float _1671 = fma(_1625, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1673 = precise::clamp(_1671, 0.0, 1.0);
    float _1675 = _1601 + 0.5;
    float _1677 = fma(_628, _1663, _514);
    float _1679 = exp2(_1439);
    float _1681 = fma(_1673, -2.0, 3.0);
    float _1683 = _1673 * _1673;
    float _1685 = _1677 + 0.5;
    float _1687 = _1643 + 0.5;
    float _1689 = _1651 + 0.5;
    float _1691 = _1683 * _1681;
    float _1693 = fma(_852, _1647, _1659);
    float _1695 = fma(_866, _1667, _1669);
    float _1697 = in.m_73.x;
    float _1699 = -_1691;
    float _1701 = _1699 + 1.0;
    float _1703 = fma(_854, _1667, _1693);
    float _1705 = fma(_862, _1647, _1661);
    out.m_75.x = _1685;
    out.m_75.y = _1675;
    out.m_75.z = _1687;
    out.m_75.w = _1689;
    float _1707 = fma(_1701, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1691);
    float _1709 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1567);
    float _1711 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1713 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1715 = fma(_872, _1667, _1705);
    float _1717 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1709);
    float _1719 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1711);
    float _1721 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1713);
    float _1723 = -_1679;
    float _1725 = _1723 + 1.0;
    float _1727 = _1717 + _1314;
    float _1729 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1719);
    bool _1731 = _1042 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1733 = isnan(_1042);
    bool _1735 = _1731 || _1733;
    bool _1737 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1739 = _1735 || _1737;
    float _1741 = _1621 * _1707;
    float _1743 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1745 = _1727 * 0.5;
    float _1747 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1743);
    out.gl_Position.x = _1322;
    out.gl_Position.y = _1324;
    out.gl_Position.z = _1717;
    out.gl_Position.w = _1314;
    float _1749 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1747);
    float _1751 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1753 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1721);
    float _1755 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _1745;
    out.m_77.w = _1314;
    out.m_79.x = _1749;
    out.m_79.y = _1729;
    out.m_79.z = _1753;
    float _1757 = -_1755;
    float _1759 = _1757 + 1.0;
    float _1761 = _1745;
    float _1763 = _1717;
    float _1765 = _1759;
    if (!_1739)
    {
        _1431 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1767 = _1431;
    float _1769 = _1767;
    float _1771 = _1767;
    if (!_1739)
    {
        _1761 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1773 = _1761;
    float _1775 = _1773;
    float _1777 = _1773;
    if (!_1739)
    {
        _1763 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1779 = _1763;
    float _1781 = _1779;
    float _1783 = _1779;
    if (!_1739)
    {
        _1433 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1785 = _1433;
    float _1787 = -_1328;
    float _1789 = _1787 + 1.0;
    float _1791 = _1789 * _1751;
    float _1793 = precise::clamp(_1791, 0.0, 1.0);
    float _1795 = -_1793;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1799 = _1797 * _1697;
    float _1801 = _1755 * _1356;
    float _1803 = _1799 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1805 = _1367 * _1759;
    float _1807 = _1799;
    float _1809 = _1785;
    float _1811 = _1785;
    if (!_1739)
    {
        _1765 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1813 = _1765;
    float _1815 = _1367 * _1801;
    float _1817 = _1377 * _1801;
    out.m_81.x = _1803;
    float _1819 = _1813;
    float _1821 = _1813;
    if (!_1739)
    {
        _1807 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1823 = _1807;
    float _1825 = fma(_1373, _1815, _1361);
    float _1827 = fma(_1375, _1815, _1363);
    float _1829 = fma(_1367, _1817, _1365);
    out.m_83.x = _1825;
    out.m_83.y = _1827;
    out.m_83.z = _1829;
    out.m_83.w = _1805;
    bool _1831 = !_1739;
    float _1833 = _1823;
    float _1835 = _1823;
    if (!_1831)
    {
        bool _1837 = _1042 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1839 = isnan(_1042);
        bool _1841 = _1837 || _1839;
        bool _1843 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1845 = _1841 || _1843;
        if (!_1845)
        {
            float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1849 = _1042 + _1847;
            float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1853 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1851;
            float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1857 = _1855 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1859 = 1.0 / _1853;
            float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1863 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1867 = _1865 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1871 = _1869 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1875 = _1873 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1877 = _1849 * _1859;
            float _1879 = precise::clamp(_1877, 0.0, 1.0);
            float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1885 = fma(_1879, _1857, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1887 = fma(_1879, _1883, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1889 = fma(_1879, _1863, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1891 = fma(_1879, _1867, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1893 = fma(_1879, _1871, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1895 = fma(_1879, _1875, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1771 = _1889;
            _1821 = _1893;
            _1777 = _1885;
            _1811 = _1891;
            _1783 = _1887;
            _1835 = _1895;
            _1897 = true;
        }
        else
        {
            bool _1899 = _1042 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1901 = isnan(_1042);
            bool _1903 = _1899 || _1901;
            bool _1905 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1907 = _1903 || _1905;
            if (!_1907)
            {
                _1775 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1909 = _1775;
            _1777 = _1909;
            if (!_1907)
            {
                _1769 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1911 = _1769;
            _1771 = _1911;
            if (!_1907)
            {
                _1781 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1913 = _1781;
            _1783 = _1913;
            if (!_1907)
            {
                _1809 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1915 = _1809;
            _1811 = _1915;
            if (!_1907)
            {
                _1819 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1917 = _1819;
            _1821 = _1917;
            if (!_1907)
            {
                _1833 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1919 = _1833;
            bool _1921 = !_1907;
            _1835 = _1919;
            if (!_1921)
            {
                bool _1923 = _1042 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1925 = isnan(_1042);
                bool _1927 = _1923 || _1925;
                bool _1929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1931 = _1927 || _1929;
                if (!_1931)
                {
                    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1935 = _1042 + _1933;
                    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1939 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1937;
                    float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1943 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1945 = 1.0 / _1939;
                    float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1949 = _1947 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1963 = _1935 * _1945;
                    float _1965 = precise::clamp(_1963, 0.0, 1.0);
                    float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1971 = fma(_1965, _1943, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1973 = fma(_1965, _1969, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1975 = fma(_1965, _1949, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1977 = fma(_1965, _1953, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1979 = fma(_1965, _1957, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1981 = fma(_1965, _1961, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1771 = _1975;
                    _1821 = _1979;
                    _1777 = _1971;
                    _1811 = _1977;
                    _1783 = _1973;
                    _1835 = _1981;
                    _1897 = true;
                }
                else
                {
                    _1771 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1821 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1777 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1811 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1783 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1835 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1897 = false;
    float _1983 = _1771;
    float _1985 = _1821;
    float _1987 = _1777;
    float _1989 = _1811;
    float _1991 = _1783;
    float _1993 = _1835;
    float _1995 = fma(_1729, -0.5, 0.5);
    float _1997 = precise::clamp(_1995, 0.0, 1.0);
    float _1999 = -_1983;
    float _2001 = _1999 + _1985;
    float _2003 = -_1987;
    float _2005 = _2003 + _1989;
    float _2007 = -_1991;
    float _2009 = _2007 + _1993;
    bool _2011 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2013 = fma(_1997, _2001, _1983);
    float _2015 = fma(_1997, _2005, _1987);
    float _2017 = fma(_1997, _2009, _1991);
    float _2019 = _2013 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2021 = fma(_2015, 0.298911988735198974609375, _2019);
    float _2023 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2025 = fma(_2017, 0.114477999508380889892578125, _2021);
    out.m_81.w = _2023;
    float _2027 = -_2025;
    float _2029 = _2015 + _2027;
    float _2031 = -_2025;
    float _2033 = _2013 + _2031;
    float _2035 = -_2025;
    float _2037 = _2017 + _2035;
    out.m_85.x = 0.0;
    float _2039 = fma(_2029, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2025);
    float _2041 = fma(_2033, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2025);
    float _2043 = fma(_2037, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2025);
    out.m_87.x = _2039;
    out.m_87.y = _2041;
    out.m_87.z = _2043;
    if (!_2011)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2045 = -_1016;
    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2049 = -_1018;
    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2053 = -_1020;
    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2057 = _2047 * _2047;
    float _2059 = fma(_2051, _2051, _2057);
    float _2061 = fma(_2055, _2055, _2059);
    float _2063 = sqrt(_2061);
    float _2065 = rsqrt(_2061);
    float _2067 = -_2063;
    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2071 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2073 = precise::clamp(_2071, 0.0, 1.0);
    float _2075 = _2051 * _2065;
    float _2077 = _2047 * _2065;
    float _2079 = abs(_2073);
    float _2081 = log2(_2079);
    float _2083 = _2055 * _2065;
    float _2085 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2087 = _1729 * _2077;
    float _2089 = -_2077;
    float _2091 = -_2085;
    float _2093 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2091);
    float _2095 = fma(_1749, _2075, _2087);
    float _2097 = -_2083;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2093);
    float _2101 = fma(_1753, _2083, _2095);
    float _2103 = precise::clamp(_2101, 0.0, 1.0);
    float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2107 = _2099 + _2105;
    float _2109 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2111 = _2107 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2113 = precise::clamp(_2111, 0.0, 1.0);
    float _2115 = exp2(_2109);
    float _2117 = _2115 * _2113;
    float _2119 = _2103 * _2117;
    float _2121 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2123 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2125 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2121;
    out.m_85.y = _2123;
    out.m_85.z = _2125;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1897 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2181 = as_type<float>(_120);
        out.gl_Position.z = _2181;
    }
    if (!_110)
    {
        return out;
    }
    float _124 = in.m_51.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_106);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    float _154 = 0.0;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_49.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2250 = as_type<float>(_160);
        out.gl_Position.z = _2250;
    }
    if (_152)
    {
        return out;
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_53.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
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
        float _190 = _138 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = in.m_55.x;
    float _196 = in.m_55.y;
    float _198 = in.m_55.z;
    float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _202 = log2(_200);
    float _204 = in.m_53.x;
    float _206 = in.m_53.y;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _210 = _208 != 0;
    float _212 = in.m_53.z;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _216 = _214 != 0;
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _220 = _218 != 0;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _224 = _222 != 0;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = 1.0 / _228;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _234 = _196 * _196;
    float _236 = abs(_196);
    float _238 = _236 + 0.001000000047497451305389404296875;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _192 + _240;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _246 = fma(_194, _194, _234);
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _248 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[193].y, 1.0);
    float _254 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[193].x, 1.0);
    float _256 = fma(_198, _198, _246);
    float _258 = 1.0 / _250;
    float _260 = _204 * 2.0;
    float _262 = _252 * _198;
    float _264 = _204 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _266 = _254 * _194;
    float _268 = _196 * (*spvDescriptorSet0.vp_c9)._m0[194].z;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _192 + _270;
    float _274 = -_232;
    float _276 = fma(_264, 2.0, _274);
    float _278 = floor(_260);
    float _280 = _206 * 2.0;
    float _282 = _206 + _204;
    float _284 = _242 * _230;
    float _286 = _206 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _288 = _282 + (-1.0);
    float _290 = _238 * (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _292 = floor(_280);
    float _294 = _272 * _258;
    float _296 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _298;
    float _302 = fma(_286, -2.0, _244);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    bool _312 = _278 >= 0.0;
    bool _314 = isnan(_278);
    bool _316 = _312 || _314;
    bool _318 = isnan(0.0);
    bool _320 = _316 || _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _322;
    float _326 = fma(_300, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _328 = fma(_310, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _330 = _320 ? 0 : 1;
    float _332 = fma(_324, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _338 = _292 > 0.0;
    float _340 = fma(_306, _294, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _342 = _292 >= 0.0;
    bool _344 = isnan(_292);
    bool _346 = _342 || _344;
    bool _348 = isnan(0.0);
    bool _350 = _346 || _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _356 = _278 > 0.0;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _360 = fma(_336, _294, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _362 = _278;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _366 = _294;
    float _368 = (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _370 = _216;
    if (!_210)
    {
        _362 = _206;
    }
    float _372 = _362;
    float _374 = fma(_354, _294, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _376 = _372;
    if (_210)
    {
        _376 = _204;
    }
    float _378 = _376;
    float _380 = -_290;
    float _382 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[194].y, _380);
    float _384 = _378;
    if (!_210)
    {
        _364 = _212;
    }
    float _386 = _364;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _390 = _386;
    if (!_210)
    {
        _366 = _206;
    }
    float _392 = _366;
    float _394 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[83].z, _358);
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _398 = _392;
    if (_210)
    {
        _398 = _204;
    }
    float _400 = _398;
    float _402 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _302);
    if (!_210)
    {
        _368 = _204;
    }
    float _404 = _368;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _408 = _404;
    if (_210)
    {
        _408 = _212;
    }
    float _410 = _408;
    float _412 = _400 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_210)
    {
        _384 = _386;
    }
    float _414 = _384;
    float _416 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _394);
    float _418 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[84].z, _388);
    float _420 = _414;
    if (_210)
    {
        _420 = _206;
    }
    float _422 = _420;
    float _424 = -_406;
    float _426 = fma(_412, 2.0, _424);
    if (_210)
    {
        _390 = _206;
    }
    float _428 = _390;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _432 = _212 * 2.0;
    float _434 = _422 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _436 = ~_330;
    int _438 = _436 + 1;
    int _440 = _438 + 1;
    float _442 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[83].w, _396);
    float _444 = _206 + _212;
    int _446 = _440;
    if (!_356)
    {
        int _448 = ~_330;
        int _450 = _448 + 1;
        _446 = _450;
    }
    int _452 = _446;
    float _454 = fma(_434, -2.0, _430);
    float _456 = _204 + _212;
    float _458 = _444 + (-1.0);
    bool _460 = !_220;
    int _462 = _460 ? 0 : 1;
    float _464 = floor(_432);
    float _466 = _456 + (-1.0);
    float _468 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _470 = abs(_462);
    float _472 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[84].x, _418);
    bool _474 = !_224;
    int _476 = _474 ? 0 : 1;
    int _478 = _350 ? 0 : 1;
    int _480 = abs(_476);
    float _482 = _202 * _138;
    int _484 = ~_478;
    int _486 = _484 + 1;
    int _488 = _486 + 1;
    float _490 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _492 = float(_452);
    float _494 = float(_470);
    float _496 = exp2(_482);
    int _498 = _488;
    if (!_338)
    {
        int _500 = ~_478;
        int _502 = _500 + 1;
        _498 = _502;
    }
    int _504 = _498;
    bool _506 = _464 > 0.0;
    float _508 = _494 * _492;
    float _510 = float(_504);
    float _512 = -_138;
    float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[76].x, _276);
    float _516 = abs(_238);
    float _518 = log2(_516);
    float _520 = _508 * (-2.0);
    bool _522 = _464 >= 0.0;
    bool _524 = isnan(_464);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _534 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _536 = isnan(0.0);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _542 = _538 || _540;
    float _544 = float(_480);
    float _546 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[78].w, _532);
    float _548 = -_496;
    float _550 = _548 + 1.0;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _554 = 1.0 + _552;
    float _556 = sqrt(_256);
    float _558 = _544 * _510;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _562 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _564 = isnan(1.0);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _570 = _566 || _568;
    float _572 = in.m_57.x;
    float _574 = in.m_57.y;
    float _576 = in.m_57.z;
    float _578 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _546);
    float _580 = _558 * (-2.0);
    float _582 = fma(_468, _520, _468);
    float _584 = 1.0 / _554;
    int _586 = _530 ? 0 : 1;
    float _588 = fma(_490, _580, _490);
    float _590 = _542 ? _550 : 0.0;
    float _592 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[78].z, _560);
    bool _594 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _596 = isnan(_192);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -_138;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[81].x, _426);
    float _610 = _382 * 0.01745329238474369049072265625;
    float _612 = abs(_556);
    float _614 = log2(_612);
    int _616 = ~_586;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _442);
    bool _624 = !_216;
    int _626 = _624 ? 0 : 1;
    float _628 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _592);
    int _630 = _620;
    if (!_506)
    {
        int _632 = ~_586;
        int _634 = _632 + 1;
        _630 = _634;
    }
    int _636 = _630;
    float _638 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _454);
    float _640 = _212 + (-0.5);
    if (_570)
    {
        float _642 = _590 * _584;
        _142 = _642;
    }
    float _644 = _142;
    float _646 = _518 * 0.5;
    bool _648 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _650 = isnan(_192);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = _204 + (-0.5);
    float _662 = fma(_520, _574, _574);
    float _664 = _206 + (-0.5);
    float _666 = fma(_580, _576, _576);
    float _668 = -_604;
    float _670 = _668 + 1.0;
    float _672 = _610 * 0.15915493667125701904296875;
    float _674 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[196].y, _662);
    bool _676 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _678 = isnan(_192);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[196].z, _666);
    int _690 = abs(_626);
    float _692 = fma(_582, _644, _674);
    float _694 = float(_636);
    float _696 = _686 * _670;
    float _698 = _614 * 1.5;
    float _700 = -_686;
    float _702 = _700 + 1.0;
    float _704 = _672 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = float(_690);
    float _710 = _692 * 0.15915493667125701904296875;
    float _712 = _658 * _702;
    float _714 = fma(_588, _644, _688);
    float _716 = -_658;
    float _718 = _716 + 1.0;
    float _720 = _708 * _694;
    float _722 = _326 * _712;
    float _724 = exp2(_646);
    float _726 = _328 * _712;
    float _728 = _720 * (-2.0);
    float _730 = _332 * _712;
    float _732 = _714 * 0.15915493667125701904296875;
    float _734 = fma(_728, _572, _572);
    float _736 = fma(_296, _728, _296);
    float _738 = in.m_59.x;
    float _740 = in.m_59.y;
    float _742 = in.m_59.z;
    float _744 = exp2(_698);
    float _746 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[196].x, _734);
    float _748 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[143].x, _722);
    float _750 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[143].y, _726);
    float _752 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[143].z, _730);
    float _754 = fma(_736, _644, _746);
    float _756 = fma(_706, 0.5, 0.5);
    float _758 = fma(_340, _696, _748);
    float _760 = _754 * 0.15915493667125701904296875;
    float _762 = _724 * _756;
    float _764 = fma(_374, _696, _752);
    float _766 = fma(_360, _696, _750);
    float _768 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].x, _758);
    float _770 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[193].w, 1.0);
    float _772 = _710 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].z, _764);
    float _778 = _744 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _780 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].y, _766);
    float _782 = _770 * _262;
    float _784 = fma(_266, _770, _778);
    float _786 = _710 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _768 * _738;
    float _792 = _780 * _740;
    float _794 = in.m_46.x;
    float _796 = in.m_46.y;
    float _798 = in.m_46.z;
    float _800 = _776 * _742;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _268);
    float _804 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _806 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _808 = _760 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _800 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _784);
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _782);
    float _818 = _802 * _804;
    float _820 = _814 * _806;
    float _822 = _816 * _812;
    float _824 = _760 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _732 * 6.283185482025146484375;
    float _830 = cos(_828);
    float _832 = _810 * _788;
    float _834 = _810 * _774;
    float _836 = _796 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _838 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[4].x, _836);
    float _840 = _732 * 6.283185482025146484375;
    float _842 = sin(_840);
    float _844 = _826 * _774;
    float _846 = _826 * _788;
    float _848 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[4].z, _838);
    float _850 = _826 * _830;
    float _852 = _788 * _830;
    float _854 = _774 * _830;
    float _856 = _810 * _830;
    float _858 = _856 * _818;
    float _860 = -_844;
    float _862 = fma(_842, _832, _860);
    float _864 = -_832;
    float _866 = fma(_842, _844, _864);
    float _868 = fma(_842, _846, _834);
    float _870 = _850 * _818;
    float _872 = fma(_842, _834, _846);
    float _874 = -_818;
    float _876 = _842 * _874;
    float _878 = _796 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _880 = fma(_868, _820, _870);
    float _882 = fma(_862, _820, _858);
    float _884 = fma(_852, _820, _876);
    float _886 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[6].x, _878);
    float _888 = fma(_866, _822, _880);
    float _890 = fma(_872, _822, _882);
    float _892 = fma(_854, _822, _884);
    float _894 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _896 = _888 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _898 = _888 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _900 = _888 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _902 = _894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _904 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[10].x, _896);
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[8].x, _898);
    float _908 = _848 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _910 = _796 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _912 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[10].z, _904);
    float _914 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[8].z, _906);
    float _916 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[9].x, _900);
    float _918 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[5].x, _910);
    float _920 = _902 + _912;
    float _922 = _908 + _914;
    float _924 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[9].z, _916);
    float _926 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[5].z, _918);
    float _928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _930 = _920 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _934 = _922 + _932;
    float _936 = _926 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _938 = _930 * _930;
    float _940 = fma(_934, _934, _938);
    float _942 = _924 * _924;
    float _944 = _936 + _924;
    float _946 = sqrt(_940);
    float _948 = fma(_914, _914, _942);
    float _950 = fma(_912, _912, _948);
    float _952 = -_950;
    float _954 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[194].w, _944);
    bool _956 = _946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _958 = _794;
    float _960 = _798;
    float _962 = _926;
    float _964 = _922;
    if (!_956)
    {
        _958 = _922;
    }
    float _966 = _958;
    float _968 = _966;
    if (!_956)
    {
        _960 = _920;
    }
    float _970 = _960;
    float _972 = _970;
    if (!_956)
    {
        _962 = _954;
    }
    float _974 = _962;
    bool _976 = !_956;
    float _978 = _974;
    if (!_976)
    {
        float _980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _982 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _984 = _946 + _982;
        float _986 = _954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = _984 * _980;
        float _990 = rsqrt(_940);
        float _992 = _988 * 0.15915493667125701904296875;
        float _994 = _992 * 6.283185482025146484375;
        float _996 = cos(_994);
        float _998 = _992 * 6.283185482025146484375;
        float _1000 = sin(_998);
        float _1002 = _996 + (-1.0);
        float _1004 = _1002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1006 = fma(_1000, _986, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1008 = fma(_954, _996, _1004);
        float _1010 = _990 * _1006;
        float _1012 = fma(_934, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1014 = fma(_930, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _978 = _1008;
        _968 = _1012;
        _972 = _1014;
    }
    float _1016 = _978;
    float _1018 = _968;
    float _1020 = _972;
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1024 = _1016 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1028 = _1018 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1032 = _1020 + _1030;
    float _1034 = _1024 * _1024;
    float _1036 = fma(_1028, _1028, _1034);
    float _1038 = fma(_1032, _1032, _1036);
    float _1040 = rsqrt(_1038);
    float _1042 = sqrt(_1038);
    float _1044 = _1040 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1046 = _1028 * _1044;
    float _1048 = _1032 * _1044;
    float _1050 = _1046 * _1046;
    float _1052 = _1048 * _1048;
    float _1054 = _1050 + _1052;
    float _1056 = sqrt(_1054);
    bool _1058 = _1056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = _1056 + _1060;
    float _1064 = _1032;
    float _1066 = _1054;
    float _1068 = _1062;
    float _1070 = _1024;
    if (_1058)
    {
        float _1072 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1064 = _1072;
    }
    float _1074 = _1064;
    if (_1058)
    {
        float _1076 = rsqrt(_1054);
        _1066 = _1076;
    }
    float _1078 = _1066;
    float _1080 = _1078;
    if (_1058)
    {
        float _1082 = _1062 * _1074;
        _1068 = _1082;
    }
    float _1084 = _1068;
    if (_1058)
    {
        float _1086 = _1084 * 0.15915493667125701904296875;
        _964 = _1086;
    }
    float _1088 = _964;
    float _1090 = _1040;
    float _1092 = _1088;
    if (_1058)
    {
        float _1094 = _1088 * 6.283185482025146484375;
        float _1096 = cos(_1094);
        _1090 = _1096;
    }
    float _1098 = _1090;
    float _1100 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1102 = precise::max(0.0, _1100);
    float _1104 = _912;
    float _1106 = _1102;
    float _1108 = _1100;
    if (_1058)
    {
        float _1110 = _1088 * 6.283185482025146484375;
        float _1112 = sin(_1110);
        _1104 = _1112;
    }
    float _1114 = _1104;
    float _1116 = -_1044;
    float _1118 = -_1102;
    float _1120 = fma(_1024, _1116, _1118);
    if (_1058)
    {
        float _1122 = _1120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1106 = _1122;
    }
    float _1124 = _1106;
    float _1126 = _1124;
    float _1128 = _1098;
    if (_1058)
    {
        float _1130 = _1098 + (-1.0);
        _1108 = _1130;
    }
    float _1132 = _1108;
    float _1134 = _1132;
    if (!_1058)
    {
        _1092 = _1048;
    }
    float _1136 = _1092;
    float _1138 = _1114;
    float _1140 = _1136;
    if (_1058)
    {
        float _1142 = fma(_1114, _1124, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1070 = _1142;
    }
    float _1144 = _1070;
    float _1146 = _1144;
    if (_1058)
    {
        float _1148 = _1132 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1126 = _1148;
    }
    float _1150 = _1126;
    if (!_1058)
    {
        _1138 = _1120;
    }
    float _1152 = _1138;
    float _1154 = _1152;
    if (_1058)
    {
        float _1156 = _1078 * _1144;
        _1134 = _1156;
    }
    float _1158 = _1134;
    if (!_1058)
    {
        _1146 = _1046;
    }
    float _1160 = _1146;
    float _1162 = _1160;
    if (_1058)
    {
        float _1164 = fma(_1120, _1098, _1150);
        _1154 = _1164;
    }
    float _1166 = _1154;
    if (!_1058)
    {
        _1080 = _1050;
    }
    float _1168 = _1080;
    float _1170 = _1168;
    if (_1058)
    {
        float _1172 = _1046 * _1158;
        _1162 = _1172;
    }
    float _1174 = _1162;
    if (_1058)
    {
        float _1176 = _1048 * _1158;
        _1140 = _1176;
    }
    float _1178 = _1140;
    float _1180 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1058)
    {
        _1128 = _1052;
    }
    float _1182 = _1128;
    float _1184 = _1182;
    if (_1058)
    {
        float _1186 = _1174 * _1174;
        _1170 = _1186;
    }
    float _1188 = _1170;
    if (_1058)
    {
        float _1190 = _1178 * _1178;
        _1184 = _1190;
    }
    float _1192 = _1184;
    float _1194 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1180);
    float _1196 = fma(_1166, _1166, _1188);
    float _1198 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1194);
    float _1200 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1202 = _1196 + _1192;
    float _1204 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1208 = fma(_1042, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1206);
    float _1210 = precise::clamp(_1208, 0.0, 1.0);
    float _1212 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1214 = fma(_908, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1216 = rsqrt(_1202);
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1220 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1222 = -_1210;
    float _1224 = _1222 + 1.0;
    float _1226 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1212);
    float _1228 = -_1220;
    float _1230 = fma(_1228, _1218, 1.0);
    float _1232 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1234 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1226);
    float _1236 = abs(_1224);
    float _1238 = log2(_1236);
    float _1240 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1200);
    float _1242 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1232);
    float _1244 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1246 = fma(_902, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1248 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1240);
    float _1250 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1242);
    float _1252 = _1216 * _1174;
    float _1254 = floor(_1214);
    float _1256 = _1216 * _1166;
    float _1258 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1260 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1262 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1264 = _1216 * _1178;
    float _1266 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1268 = -_1260;
    float _1270 = fma(_1256, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1268);
    float _1272 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1262);
    float _1274 = floor(_1246);
    float _1276 = _1238 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1278 = -_1264;
    float _1280 = fma(_1278, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1270);
    float _1282 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1284 = fma(_1280, -0.5, 0.5);
    float _1286 = -_1254;
    float _1288 = _1214 + _1286;
    float _1290 = log2(_1230);
    float _1292 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1294 = fma(_1280, 0.5, 0.5);
    float _1296 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1282);
    float _1298 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1292);
    float _1300 = fma(_1294, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1302 = exp2(_1276);
    float _1304 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1272);
    float _1306 = -_1274;
    float _1308 = _1246 + _1306;
    float _1310 = fma(_1294, _1300, -0.212114393711090087890625);
    float _1312 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1298);
    float _1314 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1304);
    float _1316 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1296);
    float _1318 = _1256 + 1.0;
    float _1320 = sqrt(_1284);
    float _1322 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1312);
    float _1324 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1316);
    float _1326 = _1290 * 0.693147182464599609375;
    float2 _4142 = float2(_1288, _1308);
    float _1328 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4142, float2(0.0), isnan(_4142)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4142, float2(0.0), isnan(_4142)), level(0.0)).x;
    float _1330 = fma(_1294, _1310, 1.570728778839111328125);
    float _1332 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1334 = 1.0 / _1314;
    float _1336 = -_1256;
    float _1338 = fma(_1302, _1318, _1336);
    float _1340 = fma(_1338, 0.5, 0.5);
    float _1342 = _1320 * 0.636619746685028076171875;
    float _1344 = -_1330;
    float _1346 = fma(_1342, _1344, 1.0);
    float _1348 = _1322 * _1334;
    float _1350 = _1324 * _1334;
    float _1352 = fma(_1348, 0.5, 0.5);
    float _1354 = fma(_1350, -0.5, 0.5);
    float3 _4189 = float3(_1352, _1354, _1332);
    float _1356 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4189, float3(0.0), isnan(_4189)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4189, float3(0.0), isnan(_4189)), level(0.0)).x;
    float3 _4200 = float3(_1352, _1354, _1332);
    float4 _1359 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4200, float3(0.0), isnan(_4200)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4200, float3(0.0), isnan(_4200)), level(0.0)).xyzw;
    float _1361 = _1359.x;
    float _1363 = _1359.y;
    float _1365 = _1359.z;
    float _1367 = _1359.w;
    float2 _4216 = float2(_1346, _1340);
    float3 _1371 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4216, float2(0.0), isnan(_4216)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4216, float2(0.0), isnan(_4216)), level(0.0)).xyz;
    float _1373 = _1371.x;
    float _1375 = _1371.y;
    float _1377 = _1371.z;
    float _1379 = _936 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1381 = _936 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1383 = _206 > 0.5;
    float _1385 = in.m_61.y;
    float _1387 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1379);
    float _1389 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1381);
    float _1391 = in.m_61.x;
    float _1393 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1387);
    float _1395 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1389);
    int _1397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1399 = _1397 != 0;
    float _1401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1403 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1405 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1407 = in.m_53.w;
    int _1409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1411 = _1409 != 0;
    float _1413 = _1405 + _1403;
    int _1415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1417 = _1415 != 0;
    float _1419 = 1.0 / _1403;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1423 = _1421 != 0;
    float _1425 = _472 * (-0.15915493667125701904296875);
    float _1427 = 0.0;
    bool _1429 = _1383;
    float _1431 = _1314;
    float _1433 = _1324;
    if (_1399)
    {
        float _1435 = in.m_53.x;
        _1427 = _1435;
    }
    float _1437 = _1427;
    float _1439 = _1238 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1445 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1417)
    {
        bool _1447 = _212 > 0.5;
        _370 = _1447;
    }
    bool _1449 = _370;
    float _1451 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1453 = -_1385;
    float _1455 = _1453 + 1.0;
    float _1457 = _1413 * _1419;
    float _1459 = _1457 * 0.5;
    float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1463 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1469 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1467);
    bool _1471 = _1407 > 0.5;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1475 = _1465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1477 = 1.0 / _1469;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1481 = _1383 ? as_type<int>(_1455) : as_type<int>(_1385);
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1485 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1487 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1493 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1495 = _1411 ? as_type<float>(_1481) : _1385;
    out.m_63.x = _1445;
    out.m_63.y = _1487;
    out.m_63.z = _1463;
    out.m_63.w = _1443;
    float _1497 = _1385;
    int _1499 = as_type<int>(_1455);
    int _1501 = as_type<int>(_1463);
    float _1503 = _1487;
    float _1505 = _1461;
    if (_1423)
    {
        float _1507 = _1471 ? _1455 : _1385;
        _1497 = _1507;
    }
    float _1509 = _1497;
    if (_1417)
    {
        float _1511 = -_1391;
        float _1513 = _1511 + 1.0;
        _1499 = as_type<int>(_1513);
    }
    int _1515 = _1499;
    float _1517 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_65.x = _1493;
    out.m_65.y = _1475;
    out.m_65.z = _1485;
    out.m_65.w = _1489;
    float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1521 = _1477 * _1519;
    float _1523 = _1425 * 6.283185482025146484375;
    float _1525 = sin(_1523);
    if (_1399)
    {
        bool _1527 = _1437 > 0.5;
        _1429 = _1527;
    }
    bool _1529 = _1429;
    float _1531 = in.m_67.x;
    float _1533 = in.m_67.y;
    float _1535 = in.m_67.z;
    float _1537 = fma(_1517, _1509, -0.5);
    float _1539 = _1461 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1541 = _268 != 0.0;
    bool _1543 = isnan(_268);
    bool _1545 = _1541 || _1543;
    bool _1547 = isnan(0.0);
    bool _1549 = _1545 || _1547;
    float _1551 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1553 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1555 = abs(_1521);
    float _1557 = log2(_1555);
    if (_1399)
    {
        float _1559 = -_1391;
        float _1561 = _1559 + 1.0;
        _1501 = as_type<int>(_1561);
    }
    int _1563 = _1501;
    if (!_1417)
    {
        _1503 = _1391;
    }
    float _1565 = _1503;
    float _1567 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1551);
    float _1569 = _1565;
    if (_1417)
    {
        float _1571 = _1449 ? as_type<float>(_1515) : _1391;
        _1569 = _1571;
    }
    float _1573 = _1569;
    float _1575 = fma(_1539, _1495, -0.5);
    if (!_1399)
    {
        _1505 = _1391;
    }
    float _1577 = _1505;
    out.m_69.x = _382;
    float _1579 = _1425 * 6.283185482025146484375;
    float _1581 = cos(_1579);
    float _1583 = _1577;
    if (_1399)
    {
        float _1585 = _1529 ? as_type<float>(_1563) : _1391;
        _1583 = _1585;
    }
    float _1587 = _1583;
    float _1589 = _1525 * _1537;
    bool _1591 = _784 == 0.0;
    bool _1593 = !_1549;
    bool _1595 = _1591 && _1593;
    float _1597 = fma(_1553, _1573, -0.5);
    float _1599 = -_402;
    float _1601 = fma(_578, _1575, _1599);
    bool _1603 = _782 == 0.0;
    bool _1605 = _1603 && _1595;
    float _1607 = _1557 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1611 = _1521 <= 8000.0;
    bool _1613 = isnan(_1521);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(8000.0);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    out.m_71.x = _1018;
    out.m_71.y = _1016;
    out.m_71.z = _1020;
    float _1623 = _1581 * _1537;
    float _1625 = exp2(_1607);
    float _1627 = -_1589;
    float _1629 = fma(_1581, _1597, _1627);
    float _1631 = fma(_1525, _1597, _1623);
    float _1633 = _1533;
    float _1635 = _1531;
    float _1637 = _1535;
    if (!_1605)
    {
        float _1639 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1533);
        _1633 = _1639;
    }
    float _1641 = _1633;
    float _1643 = fma(_416, _1629, _608);
    if (!_1605)
    {
        float _1645 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1531);
        _1635 = _1645;
    }
    float _1647 = _1635;
    float _1649 = -_638;
    float _1651 = fma(_622, _1631, _1649);
    float _1653 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1655 = _850 * _1641;
    float _1657 = -_1641;
    float _1659 = _842 * _1657;
    float _1661 = _856 * _1641;
    float _1663 = fma(_1653, _1587, -0.5);
    if (!_1605)
    {
        float _1665 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1535);
        _1637 = _1665;
    }
    float _1667 = _1637;
    float _1669 = fma(_868, _1647, _1655);
    float _1671 = fma(_1625, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1673 = precise::clamp(_1671, 0.0, 1.0);
    float _1675 = _1601 + 0.5;
    float _1677 = fma(_628, _1663, _514);
    float _1679 = exp2(_1439);
    float _1681 = fma(_1673, -2.0, 3.0);
    float _1683 = _1673 * _1673;
    float _1685 = _1677 + 0.5;
    float _1687 = _1643 + 0.5;
    float _1689 = _1651 + 0.5;
    float _1691 = _1683 * _1681;
    float _1693 = fma(_852, _1647, _1659);
    float _1695 = fma(_866, _1667, _1669);
    float _1697 = in.m_73.x;
    float _1699 = -_1691;
    float _1701 = _1699 + 1.0;
    float _1703 = fma(_854, _1667, _1693);
    float _1705 = fma(_862, _1647, _1661);
    out.m_75.x = _1685;
    out.m_75.y = _1675;
    out.m_75.z = _1687;
    out.m_75.w = _1689;
    float _1707 = fma(_1701, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1691);
    float _1709 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1567);
    float _1711 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1713 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1715 = fma(_872, _1667, _1705);
    float _1717 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1709);
    float _1719 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1711);
    float _1721 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1713);
    float _1723 = -_1679;
    float _1725 = _1723 + 1.0;
    float _1727 = _1717 + _1314;
    float _1729 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1719);
    bool _1731 = _1042 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1733 = isnan(_1042);
    bool _1735 = _1731 || _1733;
    bool _1737 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1739 = _1735 || _1737;
    float _1741 = _1621 * _1707;
    float _1743 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1745 = _1727 * 0.5;
    float _1747 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1743);
    out.gl_Position.x = _1322;
    out.gl_Position.y = _1324;
    out.gl_Position.z = _1717;
    out.gl_Position.w = _1314;
    float _1749 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1747);
    float _1751 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1753 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1721);
    float _1755 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _1745;
    out.m_77.w = _1314;
    out.m_79.x = _1749;
    out.m_79.y = _1729;
    out.m_79.z = _1753;
    float _1757 = -_1755;
    float _1759 = _1757 + 1.0;
    float _1761 = _1745;
    float _1763 = _1717;
    float _1765 = _1759;
    if (!_1739)
    {
        _1431 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1767 = _1431;
    float _1769 = _1767;
    float _1771 = _1767;
    if (!_1739)
    {
        _1761 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1773 = _1761;
    float _1775 = _1773;
    float _1777 = _1773;
    if (!_1739)
    {
        _1763 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1779 = _1763;
    float _1781 = _1779;
    float _1783 = _1779;
    if (!_1739)
    {
        _1433 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1785 = _1433;
    float _1787 = -_1328;
    float _1789 = _1787 + 1.0;
    float _1791 = _1789 * _1751;
    float _1793 = precise::clamp(_1791, 0.0, 1.0);
    float _1795 = -_1793;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1799 = _1797 * _1697;
    float _1801 = _1755 * _1356;
    float _1803 = _1799 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1805 = _1367 * _1759;
    float _1807 = _1799;
    float _1809 = _1785;
    float _1811 = _1785;
    if (!_1739)
    {
        _1765 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1813 = _1765;
    float _1815 = _1367 * _1801;
    float _1817 = _1377 * _1801;
    out.m_81.x = _1803;
    float _1819 = _1813;
    float _1821 = _1813;
    if (!_1739)
    {
        _1807 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1823 = _1807;
    float _1825 = fma(_1373, _1815, _1361);
    float _1827 = fma(_1375, _1815, _1363);
    float _1829 = fma(_1367, _1817, _1365);
    out.m_83.x = _1825;
    out.m_83.y = _1827;
    out.m_83.z = _1829;
    out.m_83.w = _1805;
    bool _1831 = !_1739;
    float _1833 = _1823;
    float _1835 = _1823;
    if (!_1831)
    {
        bool _1837 = _1042 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1839 = isnan(_1042);
        bool _1841 = _1837 || _1839;
        bool _1843 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1845 = _1841 || _1843;
        if (!_1845)
        {
            float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1849 = _1042 + _1847;
            float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1853 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1851;
            float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1857 = _1855 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1859 = 1.0 / _1853;
            float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1863 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1867 = _1865 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1871 = _1869 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1875 = _1873 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1877 = _1849 * _1859;
            float _1879 = precise::clamp(_1877, 0.0, 1.0);
            float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1885 = fma(_1879, _1857, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1887 = fma(_1879, _1883, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1889 = fma(_1879, _1863, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1891 = fma(_1879, _1867, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1893 = fma(_1879, _1871, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1895 = fma(_1879, _1875, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1771 = _1889;
            _1821 = _1893;
            _1777 = _1885;
            _1811 = _1891;
            _1783 = _1887;
            _1835 = _1895;
            _1897 = true;
        }
        else
        {
            bool _1899 = _1042 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1901 = isnan(_1042);
            bool _1903 = _1899 || _1901;
            bool _1905 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1907 = _1903 || _1905;
            if (!_1907)
            {
                _1775 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1909 = _1775;
            _1777 = _1909;
            if (!_1907)
            {
                _1769 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1911 = _1769;
            _1771 = _1911;
            if (!_1907)
            {
                _1781 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1913 = _1781;
            _1783 = _1913;
            if (!_1907)
            {
                _1809 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1915 = _1809;
            _1811 = _1915;
            if (!_1907)
            {
                _1819 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1917 = _1819;
            _1821 = _1917;
            if (!_1907)
            {
                _1833 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1919 = _1833;
            bool _1921 = !_1907;
            _1835 = _1919;
            if (!_1921)
            {
                bool _1923 = _1042 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1925 = isnan(_1042);
                bool _1927 = _1923 || _1925;
                bool _1929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1931 = _1927 || _1929;
                if (!_1931)
                {
                    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1935 = _1042 + _1933;
                    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1939 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1937;
                    float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1943 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1945 = 1.0 / _1939;
                    float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1949 = _1947 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1963 = _1935 * _1945;
                    float _1965 = precise::clamp(_1963, 0.0, 1.0);
                    float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1971 = fma(_1965, _1943, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1973 = fma(_1965, _1969, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1975 = fma(_1965, _1949, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1977 = fma(_1965, _1953, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1979 = fma(_1965, _1957, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1981 = fma(_1965, _1961, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1771 = _1975;
                    _1821 = _1979;
                    _1777 = _1971;
                    _1811 = _1977;
                    _1783 = _1973;
                    _1835 = _1981;
                    _1897 = true;
                }
                else
                {
                    _1771 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1821 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1777 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1811 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1783 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1835 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1897 = false;
    float _1983 = _1771;
    float _1985 = _1821;
    float _1987 = _1777;
    float _1989 = _1811;
    float _1991 = _1783;
    float _1993 = _1835;
    float _1995 = fma(_1729, -0.5, 0.5);
    float _1997 = precise::clamp(_1995, 0.0, 1.0);
    float _1999 = -_1983;
    float _2001 = _1999 + _1985;
    float _2003 = -_1987;
    float _2005 = _2003 + _1989;
    float _2007 = -_1991;
    float _2009 = _2007 + _1993;
    bool _2011 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2013 = fma(_1997, _2001, _1983);
    float _2015 = fma(_1997, _2005, _1987);
    float _2017 = fma(_1997, _2009, _1991);
    float _2019 = _2013 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2021 = fma(_2015, 0.298911988735198974609375, _2019);
    float _2023 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2025 = fma(_2017, 0.114477999508380889892578125, _2021);
    out.m_81.w = _2023;
    float _2027 = -_2025;
    float _2029 = _2015 + _2027;
    float _2031 = -_2025;
    float _2033 = _2013 + _2031;
    float _2035 = -_2025;
    float _2037 = _2017 + _2035;
    out.m_85.x = 0.0;
    float _2039 = fma(_2029, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2025);
    float _2041 = fma(_2033, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2025);
    float _2043 = fma(_2037, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2025);
    out.m_87.x = _2039;
    out.m_87.y = _2041;
    out.m_87.z = _2043;
    if (!_2011)
    {
        return out;
    }
    float _2045 = -_1016;
    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2049 = -_1018;
    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2053 = -_1020;
    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2057 = _2047 * _2047;
    float _2059 = fma(_2051, _2051, _2057);
    float _2061 = fma(_2055, _2055, _2059);
    float _2063 = sqrt(_2061);
    float _2065 = rsqrt(_2061);
    float _2067 = -_2063;
    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2071 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2073 = precise::clamp(_2071, 0.0, 1.0);
    float _2075 = _2051 * _2065;
    float _2077 = _2047 * _2065;
    float _2079 = abs(_2073);
    float _2081 = log2(_2079);
    float _2083 = _2055 * _2065;
    float _2085 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2087 = _1729 * _2077;
    float _2089 = -_2077;
    float _2091 = -_2085;
    float _2093 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2091);
    float _2095 = fma(_1749, _2075, _2087);
    float _2097 = -_2083;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2093);
    float _2101 = fma(_1753, _2083, _2095);
    float _2103 = precise::clamp(_2101, 0.0, 1.0);
    float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2107 = _2099 + _2105;
    float _2109 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2111 = _2107 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2113 = precise::clamp(_2111, 0.0, 1.0);
    float _2115 = exp2(_2109);
    float _2117 = _2115 * _2113;
    float _2119 = _2103 * _2117;
    float _2121 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2123 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2125 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2121;
    out.m_85.y = _2123;
    out.m_85.z = _2125;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1897 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2181 = as_type<float>(_120);
        out.gl_Position.z = _2181;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_51.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_106);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    float _154 = 0.0;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_49.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2250 = as_type<float>(_160);
        out.gl_Position.z = _2250;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_53.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
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
        float _190 = _138 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = in.m_55.x;
    float _196 = in.m_55.y;
    float _198 = in.m_55.z;
    float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _202 = log2(_200);
    float _204 = in.m_53.x;
    float _206 = in.m_53.y;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _210 = _208 != 0;
    float _212 = in.m_53.z;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _216 = _214 != 0;
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _220 = _218 != 0;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _224 = _222 != 0;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = 1.0 / _228;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _234 = _196 * _196;
    float _236 = abs(_196);
    float _238 = _236 + 0.001000000047497451305389404296875;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = _192 + _240;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _246 = fma(_194, _194, _234);
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _248 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _252 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[193].y, 1.0);
    float _254 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[193].x, 1.0);
    float _256 = fma(_198, _198, _246);
    float _258 = 1.0 / _250;
    float _260 = _204 * 2.0;
    float _262 = _252 * _198;
    float _264 = _204 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _266 = _254 * _194;
    float _268 = _196 * (*spvDescriptorSet0.vp_c9)._m0[194].z;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _192 + _270;
    float _274 = -_232;
    float _276 = fma(_264, 2.0, _274);
    float _278 = floor(_260);
    float _280 = _206 * 2.0;
    float _282 = _206 + _204;
    float _284 = _242 * _230;
    float _286 = _206 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _288 = _282 + (-1.0);
    float _290 = _238 * (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _292 = floor(_280);
    float _294 = _272 * _258;
    float _296 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _298;
    float _302 = fma(_286, -2.0, _244);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _308;
    bool _312 = _278 >= 0.0;
    bool _314 = isnan(_278);
    bool _316 = _312 || _314;
    bool _318 = isnan(0.0);
    bool _320 = _316 || _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _322;
    float _326 = fma(_300, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _328 = fma(_310, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _330 = _320 ? 0 : 1;
    float _332 = fma(_324, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _338 = _292 > 0.0;
    float _340 = fma(_306, _294, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _342 = _292 >= 0.0;
    bool _344 = isnan(_292);
    bool _346 = _342 || _344;
    bool _348 = isnan(0.0);
    bool _350 = _346 || _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _356 = _278 > 0.0;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _360 = fma(_336, _294, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _362 = _278;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _366 = _294;
    float _368 = (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _370 = _216;
    if (!_210)
    {
        _362 = _206;
    }
    float _372 = _362;
    float _374 = fma(_354, _294, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _376 = _372;
    if (_210)
    {
        _376 = _204;
    }
    float _378 = _376;
    float _380 = -_290;
    float _382 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[194].y, _380);
    float _384 = _378;
    if (!_210)
    {
        _364 = _212;
    }
    float _386 = _364;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _390 = _386;
    if (!_210)
    {
        _366 = _206;
    }
    float _392 = _366;
    float _394 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[83].z, _358);
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _398 = _392;
    if (_210)
    {
        _398 = _204;
    }
    float _400 = _398;
    float _402 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _302);
    if (!_210)
    {
        _368 = _204;
    }
    float _404 = _368;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _408 = _404;
    if (_210)
    {
        _408 = _212;
    }
    float _410 = _408;
    float _412 = _400 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_210)
    {
        _384 = _386;
    }
    float _414 = _384;
    float _416 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _394);
    float _418 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[84].z, _388);
    float _420 = _414;
    if (_210)
    {
        _420 = _206;
    }
    float _422 = _420;
    float _424 = -_406;
    float _426 = fma(_412, 2.0, _424);
    if (_210)
    {
        _390 = _206;
    }
    float _428 = _390;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _432 = _212 * 2.0;
    float _434 = _422 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _436 = ~_330;
    int _438 = _436 + 1;
    int _440 = _438 + 1;
    float _442 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[83].w, _396);
    float _444 = _206 + _212;
    int _446 = _440;
    if (!_356)
    {
        int _448 = ~_330;
        int _450 = _448 + 1;
        _446 = _450;
    }
    int _452 = _446;
    float _454 = fma(_434, -2.0, _430);
    float _456 = _204 + _212;
    float _458 = _444 + (-1.0);
    bool _460 = !_220;
    int _462 = _460 ? 0 : 1;
    float _464 = floor(_432);
    float _466 = _456 + (-1.0);
    float _468 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _470 = abs(_462);
    float _472 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[84].x, _418);
    bool _474 = !_224;
    int _476 = _474 ? 0 : 1;
    int _478 = _350 ? 0 : 1;
    int _480 = abs(_476);
    float _482 = _202 * _138;
    int _484 = ~_478;
    int _486 = _484 + 1;
    int _488 = _486 + 1;
    float _490 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _492 = float(_452);
    float _494 = float(_470);
    float _496 = exp2(_482);
    int _498 = _488;
    if (!_338)
    {
        int _500 = ~_478;
        int _502 = _500 + 1;
        _498 = _502;
    }
    int _504 = _498;
    bool _506 = _464 > 0.0;
    float _508 = _494 * _492;
    float _510 = float(_504);
    float _512 = -_138;
    float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[76].x, _276);
    float _516 = abs(_238);
    float _518 = log2(_516);
    float _520 = _508 * (-2.0);
    bool _522 = _464 >= 0.0;
    bool _524 = isnan(_464);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _534 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _536 = isnan(0.0);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _542 = _538 || _540;
    float _544 = float(_480);
    float _546 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[78].w, _532);
    float _548 = -_496;
    float _550 = _548 + 1.0;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _554 = 1.0 + _552;
    float _556 = sqrt(_256);
    float _558 = _544 * _510;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _562 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _564 = isnan(1.0);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _570 = _566 || _568;
    float _572 = in.m_57.x;
    float _574 = in.m_57.y;
    float _576 = in.m_57.z;
    float _578 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _546);
    float _580 = _558 * (-2.0);
    float _582 = fma(_468, _520, _468);
    float _584 = 1.0 / _554;
    int _586 = _530 ? 0 : 1;
    float _588 = fma(_490, _580, _490);
    float _590 = _542 ? _550 : 0.0;
    float _592 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[78].z, _560);
    bool _594 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _596 = isnan(_192);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -_138;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[81].x, _426);
    float _610 = _382 * 0.01745329238474369049072265625;
    float _612 = abs(_556);
    float _614 = log2(_612);
    int _616 = ~_586;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _442);
    bool _624 = !_216;
    int _626 = _624 ? 0 : 1;
    float _628 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _592);
    int _630 = _620;
    if (!_506)
    {
        int _632 = ~_586;
        int _634 = _632 + 1;
        _630 = _634;
    }
    int _636 = _630;
    float _638 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _454);
    float _640 = _212 + (-0.5);
    if (_570)
    {
        float _642 = _590 * _584;
        _142 = _642;
    }
    float _644 = _142;
    float _646 = _518 * 0.5;
    bool _648 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _650 = isnan(_192);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = _204 + (-0.5);
    float _662 = fma(_520, _574, _574);
    float _664 = _206 + (-0.5);
    float _666 = fma(_580, _576, _576);
    float _668 = -_604;
    float _670 = _668 + 1.0;
    float _672 = _610 * 0.15915493667125701904296875;
    float _674 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[196].y, _662);
    bool _676 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _678 = isnan(_192);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[196].z, _666);
    int _690 = abs(_626);
    float _692 = fma(_582, _644, _674);
    float _694 = float(_636);
    float _696 = _686 * _670;
    float _698 = _614 * 1.5;
    float _700 = -_686;
    float _702 = _700 + 1.0;
    float _704 = _672 * 6.283185482025146484375;
    float _706 = sin(_704);
    float _708 = float(_690);
    float _710 = _692 * 0.15915493667125701904296875;
    float _712 = _658 * _702;
    float _714 = fma(_588, _644, _688);
    float _716 = -_658;
    float _718 = _716 + 1.0;
    float _720 = _708 * _694;
    float _722 = _326 * _712;
    float _724 = exp2(_646);
    float _726 = _328 * _712;
    float _728 = _720 * (-2.0);
    float _730 = _332 * _712;
    float _732 = _714 * 0.15915493667125701904296875;
    float _734 = fma(_728, _572, _572);
    float _736 = fma(_296, _728, _296);
    float _738 = in.m_59.x;
    float _740 = in.m_59.y;
    float _742 = in.m_59.z;
    float _744 = exp2(_698);
    float _746 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[196].x, _734);
    float _748 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[143].x, _722);
    float _750 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[143].y, _726);
    float _752 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[143].z, _730);
    float _754 = fma(_736, _644, _746);
    float _756 = fma(_706, 0.5, 0.5);
    float _758 = fma(_340, _696, _748);
    float _760 = _754 * 0.15915493667125701904296875;
    float _762 = _724 * _756;
    float _764 = fma(_374, _696, _752);
    float _766 = fma(_360, _696, _750);
    float _768 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].x, _758);
    float _770 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[193].w, 1.0);
    float _772 = _710 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].z, _764);
    float _778 = _744 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _780 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[145].y, _766);
    float _782 = _770 * _262;
    float _784 = fma(_266, _770, _778);
    float _786 = _710 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _768 * _738;
    float _792 = _780 * _740;
    float _794 = in.m_46.x;
    float _796 = in.m_46.y;
    float _798 = in.m_46.z;
    float _800 = _776 * _742;
    float _802 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _268);
    float _804 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _806 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _808 = _760 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = _800 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _784);
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _782);
    float _818 = _802 * _804;
    float _820 = _814 * _806;
    float _822 = _816 * _812;
    float _824 = _760 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _732 * 6.283185482025146484375;
    float _830 = cos(_828);
    float _832 = _810 * _788;
    float _834 = _810 * _774;
    float _836 = _796 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _838 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[4].x, _836);
    float _840 = _732 * 6.283185482025146484375;
    float _842 = sin(_840);
    float _844 = _826 * _774;
    float _846 = _826 * _788;
    float _848 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[4].z, _838);
    float _850 = _826 * _830;
    float _852 = _788 * _830;
    float _854 = _774 * _830;
    float _856 = _810 * _830;
    float _858 = _856 * _818;
    float _860 = -_844;
    float _862 = fma(_842, _832, _860);
    float _864 = -_832;
    float _866 = fma(_842, _844, _864);
    float _868 = fma(_842, _846, _834);
    float _870 = _850 * _818;
    float _872 = fma(_842, _834, _846);
    float _874 = -_818;
    float _876 = _842 * _874;
    float _878 = _796 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _880 = fma(_868, _820, _870);
    float _882 = fma(_862, _820, _858);
    float _884 = fma(_852, _820, _876);
    float _886 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[6].x, _878);
    float _888 = fma(_866, _822, _880);
    float _890 = fma(_872, _822, _882);
    float _892 = fma(_854, _822, _884);
    float _894 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[6].z, _886);
    float _896 = _888 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _898 = _888 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _900 = _888 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _902 = _894 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _904 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[10].x, _896);
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[8].x, _898);
    float _908 = _848 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _910 = _796 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _912 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[10].z, _904);
    float _914 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[8].z, _906);
    float _916 = fma(_892, (*spvDescriptorSet0.vp_c10)._m0[9].x, _900);
    float _918 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[5].x, _910);
    float _920 = _902 + _912;
    float _922 = _908 + _914;
    float _924 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[9].z, _916);
    float _926 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[5].z, _918);
    float _928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _930 = _920 + _928;
    float _932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _934 = _922 + _932;
    float _936 = _926 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _938 = _930 * _930;
    float _940 = fma(_934, _934, _938);
    float _942 = _924 * _924;
    float _944 = _936 + _924;
    float _946 = sqrt(_940);
    float _948 = fma(_914, _914, _942);
    float _950 = fma(_912, _912, _948);
    float _952 = -_950;
    float _954 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[194].w, _944);
    bool _956 = _946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _958 = _794;
    float _960 = _798;
    float _962 = _926;
    float _964 = _922;
    if (!_956)
    {
        _958 = _922;
    }
    float _966 = _958;
    float _968 = _966;
    if (!_956)
    {
        _960 = _920;
    }
    float _970 = _960;
    float _972 = _970;
    if (!_956)
    {
        _962 = _954;
    }
    float _974 = _962;
    bool _976 = !_956;
    float _978 = _974;
    if (!_976)
    {
        float _980 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _982 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _984 = _946 + _982;
        float _986 = _954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = _984 * _980;
        float _990 = rsqrt(_940);
        float _992 = _988 * 0.15915493667125701904296875;
        float _994 = _992 * 6.283185482025146484375;
        float _996 = cos(_994);
        float _998 = _992 * 6.283185482025146484375;
        float _1000 = sin(_998);
        float _1002 = _996 + (-1.0);
        float _1004 = _1002 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1006 = fma(_1000, _986, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1008 = fma(_954, _996, _1004);
        float _1010 = _990 * _1006;
        float _1012 = fma(_934, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1014 = fma(_930, _1010, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _978 = _1008;
        _968 = _1012;
        _972 = _1014;
    }
    float _1016 = _978;
    float _1018 = _968;
    float _1020 = _972;
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1024 = _1016 + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1028 = _1018 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1032 = _1020 + _1030;
    float _1034 = _1024 * _1024;
    float _1036 = fma(_1028, _1028, _1034);
    float _1038 = fma(_1032, _1032, _1036);
    float _1040 = rsqrt(_1038);
    float _1042 = sqrt(_1038);
    float _1044 = _1040 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1046 = _1028 * _1044;
    float _1048 = _1032 * _1044;
    float _1050 = _1046 * _1046;
    float _1052 = _1048 * _1048;
    float _1054 = _1050 + _1052;
    float _1056 = sqrt(_1054);
    bool _1058 = _1056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1060 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = _1056 + _1060;
    float _1064 = _1032;
    float _1066 = _1054;
    float _1068 = _1062;
    float _1070 = _1024;
    if (_1058)
    {
        float _1072 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1064 = _1072;
    }
    float _1074 = _1064;
    if (_1058)
    {
        float _1076 = rsqrt(_1054);
        _1066 = _1076;
    }
    float _1078 = _1066;
    float _1080 = _1078;
    if (_1058)
    {
        float _1082 = _1062 * _1074;
        _1068 = _1082;
    }
    float _1084 = _1068;
    if (_1058)
    {
        float _1086 = _1084 * 0.15915493667125701904296875;
        _964 = _1086;
    }
    float _1088 = _964;
    float _1090 = _1040;
    float _1092 = _1088;
    if (_1058)
    {
        float _1094 = _1088 * 6.283185482025146484375;
        float _1096 = cos(_1094);
        _1090 = _1096;
    }
    float _1098 = _1090;
    float _1100 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1102 = precise::max(0.0, _1100);
    float _1104 = _912;
    float _1106 = _1102;
    float _1108 = _1100;
    if (_1058)
    {
        float _1110 = _1088 * 6.283185482025146484375;
        float _1112 = sin(_1110);
        _1104 = _1112;
    }
    float _1114 = _1104;
    float _1116 = -_1044;
    float _1118 = -_1102;
    float _1120 = fma(_1024, _1116, _1118);
    if (_1058)
    {
        float _1122 = _1120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1106 = _1122;
    }
    float _1124 = _1106;
    float _1126 = _1124;
    float _1128 = _1098;
    if (_1058)
    {
        float _1130 = _1098 + (-1.0);
        _1108 = _1130;
    }
    float _1132 = _1108;
    float _1134 = _1132;
    if (!_1058)
    {
        _1092 = _1048;
    }
    float _1136 = _1092;
    float _1138 = _1114;
    float _1140 = _1136;
    if (_1058)
    {
        float _1142 = fma(_1114, _1124, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1070 = _1142;
    }
    float _1144 = _1070;
    float _1146 = _1144;
    if (_1058)
    {
        float _1148 = _1132 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1126 = _1148;
    }
    float _1150 = _1126;
    if (!_1058)
    {
        _1138 = _1120;
    }
    float _1152 = _1138;
    float _1154 = _1152;
    if (_1058)
    {
        float _1156 = _1078 * _1144;
        _1134 = _1156;
    }
    float _1158 = _1134;
    if (!_1058)
    {
        _1146 = _1046;
    }
    float _1160 = _1146;
    float _1162 = _1160;
    if (_1058)
    {
        float _1164 = fma(_1120, _1098, _1150);
        _1154 = _1164;
    }
    float _1166 = _1154;
    if (!_1058)
    {
        _1080 = _1050;
    }
    float _1168 = _1080;
    float _1170 = _1168;
    if (_1058)
    {
        float _1172 = _1046 * _1158;
        _1162 = _1172;
    }
    float _1174 = _1162;
    if (_1058)
    {
        float _1176 = _1048 * _1158;
        _1140 = _1176;
    }
    float _1178 = _1140;
    float _1180 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1058)
    {
        _1128 = _1052;
    }
    float _1182 = _1128;
    float _1184 = _1182;
    if (_1058)
    {
        float _1186 = _1174 * _1174;
        _1170 = _1186;
    }
    float _1188 = _1170;
    if (_1058)
    {
        float _1190 = _1178 * _1178;
        _1184 = _1190;
    }
    float _1192 = _1184;
    float _1194 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1180);
    float _1196 = fma(_1166, _1166, _1188);
    float _1198 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1194);
    float _1200 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1202 = _1196 + _1192;
    float _1204 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1208 = fma(_1042, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1206);
    float _1210 = precise::clamp(_1208, 0.0, 1.0);
    float _1212 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1214 = fma(_908, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1216 = rsqrt(_1202);
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1220 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1222 = -_1210;
    float _1224 = _1222 + 1.0;
    float _1226 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1212);
    float _1228 = -_1220;
    float _1230 = fma(_1228, _1218, 1.0);
    float _1232 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1234 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1226);
    float _1236 = abs(_1224);
    float _1238 = log2(_1236);
    float _1240 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1200);
    float _1242 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1232);
    float _1244 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1246 = fma(_902, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1248 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1240);
    float _1250 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1242);
    float _1252 = _1216 * _1174;
    float _1254 = floor(_1214);
    float _1256 = _1216 * _1166;
    float _1258 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1260 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1262 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1264 = _1216 * _1178;
    float _1266 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1268 = -_1260;
    float _1270 = fma(_1256, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1268);
    float _1272 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1262);
    float _1274 = floor(_1246);
    float _1276 = _1238 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1278 = -_1264;
    float _1280 = fma(_1278, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1270);
    float _1282 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1284 = fma(_1280, -0.5, 0.5);
    float _1286 = -_1254;
    float _1288 = _1214 + _1286;
    float _1290 = log2(_1230);
    float _1292 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1294 = fma(_1280, 0.5, 0.5);
    float _1296 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1282);
    float _1298 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1292);
    float _1300 = fma(_1294, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1302 = exp2(_1276);
    float _1304 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1272);
    float _1306 = -_1274;
    float _1308 = _1246 + _1306;
    float _1310 = fma(_1294, _1300, -0.212114393711090087890625);
    float _1312 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1298);
    float _1314 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1304);
    float _1316 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1296);
    float _1318 = _1256 + 1.0;
    float _1320 = sqrt(_1284);
    float _1322 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1312);
    float _1324 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1316);
    float _1326 = _1290 * 0.693147182464599609375;
    float2 _4142 = float2(_1288, _1308);
    float _1328 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4142, float2(0.0), isnan(_4142)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4142, float2(0.0), isnan(_4142)), level(0.0)).x;
    float _1330 = fma(_1294, _1310, 1.570728778839111328125);
    float _1332 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1334 = 1.0 / _1314;
    float _1336 = -_1256;
    float _1338 = fma(_1302, _1318, _1336);
    float _1340 = fma(_1338, 0.5, 0.5);
    float _1342 = _1320 * 0.636619746685028076171875;
    float _1344 = -_1330;
    float _1346 = fma(_1342, _1344, 1.0);
    float _1348 = _1322 * _1334;
    float _1350 = _1324 * _1334;
    float _1352 = fma(_1348, 0.5, 0.5);
    float _1354 = fma(_1350, -0.5, 0.5);
    float3 _4189 = float3(_1352, _1354, _1332);
    float _1356 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4189, float3(0.0), isnan(_4189)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4189, float3(0.0), isnan(_4189)), level(0.0)).x;
    float3 _4200 = float3(_1352, _1354, _1332);
    float4 _1359 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4200, float3(0.0), isnan(_4200)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4200, float3(0.0), isnan(_4200)), level(0.0)).xyzw;
    float _1361 = _1359.x;
    float _1363 = _1359.y;
    float _1365 = _1359.z;
    float _1367 = _1359.w;
    float2 _4216 = float2(_1346, _1340);
    float3 _1371 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4216, float2(0.0), isnan(_4216)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4216, float2(0.0), isnan(_4216)), level(0.0)).xyz;
    float _1373 = _1371.x;
    float _1375 = _1371.y;
    float _1377 = _1371.z;
    float _1379 = _936 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1381 = _936 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1383 = _206 > 0.5;
    float _1385 = in.m_61.y;
    float _1387 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1379);
    float _1389 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1381);
    float _1391 = in.m_61.x;
    float _1393 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1387);
    float _1395 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1389);
    int _1397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1399 = _1397 != 0;
    float _1401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1403 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1405 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1407 = in.m_53.w;
    int _1409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1411 = _1409 != 0;
    float _1413 = _1405 + _1403;
    int _1415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1417 = _1415 != 0;
    float _1419 = 1.0 / _1403;
    int _1421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1423 = _1421 != 0;
    float _1425 = _472 * (-0.15915493667125701904296875);
    float _1427 = 0.0;
    bool _1429 = _1383;
    float _1431 = _1314;
    float _1433 = _1324;
    if (_1399)
    {
        float _1435 = in.m_53.x;
        _1427 = _1435;
    }
    float _1437 = _1427;
    float _1439 = _1238 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1445 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1417)
    {
        bool _1447 = _212 > 0.5;
        _370 = _1447;
    }
    bool _1449 = _370;
    float _1451 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1453 = -_1385;
    float _1455 = _1453 + 1.0;
    float _1457 = _1413 * _1419;
    float _1459 = _1457 * 0.5;
    float _1461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1463 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1469 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1467);
    bool _1471 = _1407 > 0.5;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1475 = _1465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1477 = 1.0 / _1469;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1481 = _1383 ? as_type<int>(_1455) : as_type<int>(_1385);
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1485 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1487 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1493 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1495 = _1411 ? as_type<float>(_1481) : _1385;
    out.m_63.x = _1445;
    out.m_63.y = _1487;
    out.m_63.z = _1463;
    out.m_63.w = _1443;
    float _1497 = _1385;
    int _1499 = as_type<int>(_1455);
    int _1501 = as_type<int>(_1463);
    float _1503 = _1487;
    float _1505 = _1461;
    if (_1423)
    {
        float _1507 = _1471 ? _1455 : _1385;
        _1497 = _1507;
    }
    float _1509 = _1497;
    if (_1417)
    {
        float _1511 = -_1391;
        float _1513 = _1511 + 1.0;
        _1499 = as_type<int>(_1513);
    }
    int _1515 = _1499;
    float _1517 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    out.m_65.x = _1493;
    out.m_65.y = _1475;
    out.m_65.z = _1485;
    out.m_65.w = _1489;
    float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1521 = _1477 * _1519;
    float _1523 = _1425 * 6.283185482025146484375;
    float _1525 = sin(_1523);
    if (_1399)
    {
        bool _1527 = _1437 > 0.5;
        _1429 = _1527;
    }
    bool _1529 = _1429;
    float _1531 = in.m_67.x;
    float _1533 = in.m_67.y;
    float _1535 = in.m_67.z;
    float _1537 = fma(_1517, _1509, -0.5);
    float _1539 = _1461 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1541 = _268 != 0.0;
    bool _1543 = isnan(_268);
    bool _1545 = _1541 || _1543;
    bool _1547 = isnan(0.0);
    bool _1549 = _1545 || _1547;
    float _1551 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1553 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1555 = abs(_1521);
    float _1557 = log2(_1555);
    if (_1399)
    {
        float _1559 = -_1391;
        float _1561 = _1559 + 1.0;
        _1501 = as_type<int>(_1561);
    }
    int _1563 = _1501;
    if (!_1417)
    {
        _1503 = _1391;
    }
    float _1565 = _1503;
    float _1567 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1551);
    float _1569 = _1565;
    if (_1417)
    {
        float _1571 = _1449 ? as_type<float>(_1515) : _1391;
        _1569 = _1571;
    }
    float _1573 = _1569;
    float _1575 = fma(_1539, _1495, -0.5);
    if (!_1399)
    {
        _1505 = _1391;
    }
    float _1577 = _1505;
    out.m_69.x = _382;
    float _1579 = _1425 * 6.283185482025146484375;
    float _1581 = cos(_1579);
    float _1583 = _1577;
    if (_1399)
    {
        float _1585 = _1529 ? as_type<float>(_1563) : _1391;
        _1583 = _1585;
    }
    float _1587 = _1583;
    float _1589 = _1525 * _1537;
    bool _1591 = _784 == 0.0;
    bool _1593 = !_1549;
    bool _1595 = _1591 && _1593;
    float _1597 = fma(_1553, _1573, -0.5);
    float _1599 = -_402;
    float _1601 = fma(_578, _1575, _1599);
    bool _1603 = _782 == 0.0;
    bool _1605 = _1603 && _1595;
    float _1607 = _1557 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1611 = _1521 <= 8000.0;
    bool _1613 = isnan(_1521);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(8000.0);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    out.m_71.x = _1018;
    out.m_71.y = _1016;
    out.m_71.z = _1020;
    float _1623 = _1581 * _1537;
    float _1625 = exp2(_1607);
    float _1627 = -_1589;
    float _1629 = fma(_1581, _1597, _1627);
    float _1631 = fma(_1525, _1597, _1623);
    float _1633 = _1533;
    float _1635 = _1531;
    float _1637 = _1535;
    if (!_1605)
    {
        float _1639 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1533);
        _1633 = _1639;
    }
    float _1641 = _1633;
    float _1643 = fma(_416, _1629, _608);
    if (!_1605)
    {
        float _1645 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1531);
        _1635 = _1645;
    }
    float _1647 = _1635;
    float _1649 = -_638;
    float _1651 = fma(_622, _1631, _1649);
    float _1653 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1655 = _850 * _1641;
    float _1657 = -_1641;
    float _1659 = _842 * _1657;
    float _1661 = _856 * _1641;
    float _1663 = fma(_1653, _1587, -0.5);
    if (!_1605)
    {
        float _1665 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1535);
        _1637 = _1665;
    }
    float _1667 = _1637;
    float _1669 = fma(_868, _1647, _1655);
    float _1671 = fma(_1625, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1673 = precise::clamp(_1671, 0.0, 1.0);
    float _1675 = _1601 + 0.5;
    float _1677 = fma(_628, _1663, _514);
    float _1679 = exp2(_1439);
    float _1681 = fma(_1673, -2.0, 3.0);
    float _1683 = _1673 * _1673;
    float _1685 = _1677 + 0.5;
    float _1687 = _1643 + 0.5;
    float _1689 = _1651 + 0.5;
    float _1691 = _1683 * _1681;
    float _1693 = fma(_852, _1647, _1659);
    float _1695 = fma(_866, _1667, _1669);
    float _1697 = in.m_73.x;
    float _1699 = -_1691;
    float _1701 = _1699 + 1.0;
    float _1703 = fma(_854, _1667, _1693);
    float _1705 = fma(_862, _1647, _1661);
    out.m_75.x = _1685;
    out.m_75.y = _1675;
    out.m_75.z = _1687;
    out.m_75.w = _1689;
    float _1707 = fma(_1701, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1691);
    float _1709 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1567);
    float _1711 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1713 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1715 = fma(_872, _1667, _1705);
    float _1717 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1709);
    float _1719 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1711);
    float _1721 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1713);
    float _1723 = -_1679;
    float _1725 = _1723 + 1.0;
    float _1727 = _1717 + _1314;
    float _1729 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1719);
    bool _1731 = _1042 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1733 = isnan(_1042);
    bool _1735 = _1731 || _1733;
    bool _1737 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1739 = _1735 || _1737;
    float _1741 = _1621 * _1707;
    float _1743 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1745 = _1727 * 0.5;
    float _1747 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1743);
    out.gl_Position.x = _1322;
    out.gl_Position.y = _1324;
    out.gl_Position.z = _1717;
    out.gl_Position.w = _1314;
    float _1749 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1747);
    float _1751 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1753 = fma(_1715, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1721);
    float _1755 = _1725 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _1745;
    out.m_77.w = _1314;
    out.m_79.x = _1749;
    out.m_79.y = _1729;
    out.m_79.z = _1753;
    float _1757 = -_1755;
    float _1759 = _1757 + 1.0;
    float _1761 = _1745;
    float _1763 = _1717;
    float _1765 = _1759;
    if (!_1739)
    {
        _1431 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1767 = _1431;
    float _1769 = _1767;
    float _1771 = _1767;
    if (!_1739)
    {
        _1761 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1773 = _1761;
    float _1775 = _1773;
    float _1777 = _1773;
    if (!_1739)
    {
        _1763 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1779 = _1763;
    float _1781 = _1779;
    float _1783 = _1779;
    if (!_1739)
    {
        _1433 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1785 = _1433;
    float _1787 = -_1328;
    float _1789 = _1787 + 1.0;
    float _1791 = _1789 * _1751;
    float _1793 = precise::clamp(_1791, 0.0, 1.0);
    float _1795 = -_1793;
    float _1797 = fma(_1795, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1799 = _1797 * _1697;
    float _1801 = _1755 * _1356;
    float _1803 = _1799 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1805 = _1367 * _1759;
    float _1807 = _1799;
    float _1809 = _1785;
    float _1811 = _1785;
    if (!_1739)
    {
        _1765 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1813 = _1765;
    float _1815 = _1367 * _1801;
    float _1817 = _1377 * _1801;
    out.m_81.x = _1803;
    float _1819 = _1813;
    float _1821 = _1813;
    if (!_1739)
    {
        _1807 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1823 = _1807;
    float _1825 = fma(_1373, _1815, _1361);
    float _1827 = fma(_1375, _1815, _1363);
    float _1829 = fma(_1367, _1817, _1365);
    out.m_83.x = _1825;
    out.m_83.y = _1827;
    out.m_83.z = _1829;
    out.m_83.w = _1805;
    bool _1831 = !_1739;
    float _1833 = _1823;
    float _1835 = _1823;
    if (!_1831)
    {
        bool _1837 = _1042 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1839 = isnan(_1042);
        bool _1841 = _1837 || _1839;
        bool _1843 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1845 = _1841 || _1843;
        if (!_1845)
        {
            float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1849 = _1042 + _1847;
            float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1853 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1851;
            float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1857 = _1855 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1859 = 1.0 / _1853;
            float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1863 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1867 = _1865 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1871 = _1869 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1875 = _1873 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1877 = _1849 * _1859;
            float _1879 = precise::clamp(_1877, 0.0, 1.0);
            float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1885 = fma(_1879, _1857, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1887 = fma(_1879, _1883, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1889 = fma(_1879, _1863, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1891 = fma(_1879, _1867, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1893 = fma(_1879, _1871, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1895 = fma(_1879, _1875, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1771 = _1889;
            _1821 = _1893;
            _1777 = _1885;
            _1811 = _1891;
            _1783 = _1887;
            _1835 = _1895;
            _1897 = true;
        }
        else
        {
            bool _1899 = _1042 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1901 = isnan(_1042);
            bool _1903 = _1899 || _1901;
            bool _1905 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1907 = _1903 || _1905;
            if (!_1907)
            {
                _1775 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1909 = _1775;
            _1777 = _1909;
            if (!_1907)
            {
                _1769 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1911 = _1769;
            _1771 = _1911;
            if (!_1907)
            {
                _1781 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1913 = _1781;
            _1783 = _1913;
            if (!_1907)
            {
                _1809 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1915 = _1809;
            _1811 = _1915;
            if (!_1907)
            {
                _1819 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1917 = _1819;
            _1821 = _1917;
            if (!_1907)
            {
                _1833 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1919 = _1833;
            bool _1921 = !_1907;
            _1835 = _1919;
            if (!_1921)
            {
                bool _1923 = _1042 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1925 = isnan(_1042);
                bool _1927 = _1923 || _1925;
                bool _1929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1931 = _1927 || _1929;
                if (!_1931)
                {
                    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1935 = _1042 + _1933;
                    float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1939 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1937;
                    float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1943 = _1941 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1945 = 1.0 / _1939;
                    float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1949 = _1947 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1963 = _1935 * _1945;
                    float _1965 = precise::clamp(_1963, 0.0, 1.0);
                    float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1971 = fma(_1965, _1943, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1973 = fma(_1965, _1969, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1975 = fma(_1965, _1949, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1977 = fma(_1965, _1953, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1979 = fma(_1965, _1957, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1981 = fma(_1965, _1961, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1771 = _1975;
                    _1821 = _1979;
                    _1777 = _1971;
                    _1811 = _1977;
                    _1783 = _1973;
                    _1835 = _1981;
                    _1897 = true;
                }
                else
                {
                    _1771 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1821 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1777 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1811 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1783 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1835 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1897 = false;
    float _1983 = _1771;
    float _1985 = _1821;
    float _1987 = _1777;
    float _1989 = _1811;
    float _1991 = _1783;
    float _1993 = _1835;
    float _1995 = fma(_1729, -0.5, 0.5);
    float _1997 = precise::clamp(_1995, 0.0, 1.0);
    float _1999 = -_1983;
    float _2001 = _1999 + _1985;
    float _2003 = -_1987;
    float _2005 = _2003 + _1989;
    float _2007 = -_1991;
    float _2009 = _2007 + _1993;
    bool _2011 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2013 = fma(_1997, _2001, _1983);
    float _2015 = fma(_1997, _2005, _1987);
    float _2017 = fma(_1997, _2009, _1991);
    float _2019 = _2013 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2021 = fma(_2015, 0.298911988735198974609375, _2019);
    float _2023 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2025 = fma(_2017, 0.114477999508380889892578125, _2021);
    out.m_81.w = _2023;
    float _2027 = -_2025;
    float _2029 = _2015 + _2027;
    float _2031 = -_2025;
    float _2033 = _2013 + _2031;
    float _2035 = -_2025;
    float _2037 = _2017 + _2035;
    out.m_85.x = 0.0;
    float _2039 = fma(_2029, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2025);
    float _2041 = fma(_2033, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2025);
    float _2043 = fma(_2037, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2025);
    out.m_87.x = _2039;
    out.m_87.y = _2041;
    out.m_87.z = _2043;
    if (!_2011)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2045 = -_1016;
    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2049 = -_1018;
    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2053 = -_1020;
    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2057 = _2047 * _2047;
    float _2059 = fma(_2051, _2051, _2057);
    float _2061 = fma(_2055, _2055, _2059);
    float _2063 = sqrt(_2061);
    float _2065 = rsqrt(_2061);
    float _2067 = -_2063;
    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2071 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2073 = precise::clamp(_2071, 0.0, 1.0);
    float _2075 = _2051 * _2065;
    float _2077 = _2047 * _2065;
    float _2079 = abs(_2073);
    float _2081 = log2(_2079);
    float _2083 = _2055 * _2065;
    float _2085 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2087 = _1729 * _2077;
    float _2089 = -_2077;
    float _2091 = -_2085;
    float _2093 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2091);
    float _2095 = fma(_1749, _2075, _2087);
    float _2097 = -_2083;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2093);
    float _2101 = fma(_1753, _2083, _2095);
    float _2103 = precise::clamp(_2101, 0.0, 1.0);
    float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2107 = _2099 + _2105;
    float _2109 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2111 = _2107 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2113 = precise::clamp(_2111, 0.0, 1.0);
    float _2115 = exp2(_2109);
    float _2117 = _2115 * _2113;
    float _2119 = _2103 * _2117;
    float _2121 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2123 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2125 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2121;
    out.m_85.y = _2123;
    out.m_85.z = _2125;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

