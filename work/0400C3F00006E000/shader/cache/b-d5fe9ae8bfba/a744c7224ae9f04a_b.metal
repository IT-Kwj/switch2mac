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
    float4 m_65 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_73 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _390 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2054 = as_type<float>(_108);
        out.gl_Position.z = _2054;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2124 = as_type<float>(_146);
        out.gl_Position.z = _2124;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.x;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _154 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = _152 * _150;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = 0.0;
    if (!_164)
    {
        float _176 = _154 * _154;
        float _178 = _176 * 0.5;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _184 = _180;
    if (!_164)
    {
        float _186 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    float _190 = _182 * 6.283185482025146484375;
    float _192 = floor(_182);
    float _194 = _190 * 0.15915493667125701904296875;
    int _196 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _198 = _196 != 0;
    float _200 = _194 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = 1.4012984643248170709237295832899e-45;
    float _206 = _188;
    if (!_164)
    {
        _204 = _154;
    }
    float _208 = _204;
    float _210 = -_192;
    float _212 = _182 + _210;
    bool _214 = !_164;
    float _216 = _208;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _154 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _154);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _246;
    }
    float _248 = _206;
    bool _250 = !_164;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _154 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _216 = _270;
    }
    float _272 = _216;
    float _274 = in.m_51.w;
    int _276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _278 = _276 != 0;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _282 = _280 != 0;
    float _284 = in.m_42.x;
    float _286 = in.m_42.y;
    float _288 = in.m_42.z;
    float _290 = -_212;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _294 = _212 < 0.5;
    float _296 = float(_294);
    bool _298 = !_278;
    int _300 = _298 ? 0 : 1;
    float _302 = fma(_202, 0.5, 0.5);
    bool _304 = !_198;
    int _306 = _304 ? 0 : 1;
    float _308 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _310 = abs(_300);
    float _312 = -_296;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _316 = -_302;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _320 = fma(_272, _168, _308);
    int _322 = abs(_306);
    float _324 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _326 = !_282;
    int _328 = _326 ? 0 : 1;
    float _330 = fma(_272, _170, _324);
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _334 = abs(_328);
    float _336 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _338 = float(_310);
    float _340 = float(_322);
    float _342 = fma(_272, _172, _336);
    float _344 = abs(_292);
    float _346 = _338 * _344;
    float _348 = fma(_342, _274, _288);
    float _350 = float(_334);
    float _352 = fma(_340, _318, _346);
    float _354 = fma(_320, _274, _284);
    float _356 = fma(_330, _274, _286);
    float _358 = abs(_314);
    float _360 = fma(_350, _358, _352);
    bool _362 = !_332;
    float _364 = _348;
    float _386;
    float _388;
    if (!_362)
    {
        float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _368 = _148 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _370 = float(_92);
        float _372 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _374 = 1.0 / _370;
        float _376 = _372 * _366;
        float _378 = floor(_376);
        float _380 = _126 * _374;
        float _382 = -_378;
        float _384 = _376 + _382;
        _386 = _380;
        _388 = _384;
        _390 = true;
    }
    else
    {
        float _392 = float(_92);
        float _394 = 1.0 / _392;
        float _396 = _126 * _394;
        _386 = _396;
        _388 = _396;
    }
    _390 = false;
    float _398 = _386;
    float _400 = _388;
    float _402 = in.m_49.z;
    float _404 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _406 = _148 * 2.0;
    float _408 = in.m_49.y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _412 = in.m_53.y;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _416 = _414 != 0;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _424 = _422 != 0;
    float _426 = -_410;
    float _428 = fma(_404, 2.0, _426);
    float _430 = floor(_406);
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _434 = _432 != 0;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _438 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _444 = !_416;
    int _446 = _444 ? 0 : 1;
    float _448 = _402 * 2.0;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _452 = _408 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _454 = floor(_448);
    float _456 = _408 * 2.0;
    bool _458 = _430 > 0.0;
    float _460 = fma(_452, -2.0, _436);
    float _462 = _408 + _402;
    bool _464 = _430 >= 0.0;
    bool _466 = isnan(_430);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _476 = _462 + (-1.0);
    float _478 = _438 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _480 = _438;
    if (_434)
    {
        _480 = _148;
    }
    float _482 = _480;
    float _484 = floor(_456);
    float _486 = _482;
    if (!_434)
    {
        _486 = _402;
    }
    float _488 = _486;
    float _490 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _492 = _148 + _408;
    int _494 = _472 ? 0 : 1;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _498 = _488 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _500 = _492 + (-1.0);
    float _502 = ceil(_478);
    bool _504 = _454 > 0.0;
    float _506 = -_442;
    float _508 = fma(_498, 2.0, _506);
    bool _510 = !_420;
    float _512 = _510 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _518 = ~_494;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    float _524 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[78].w, _474);
    bool _526 = _454 >= 0.0;
    bool _528 = isnan(_454);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _538 = _522;
    float _540 = _512;
    if (!_458)
    {
        int _542 = ~_494;
        int _544 = _542 + 1;
        _538 = _544;
    }
    int _546 = _538;
    float _548 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[88].z, _496);
    int _550 = abs(as_type<int>(_512));
    float _552 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[88].w, _516);
    bool _554 = _484 > 0.0;
    float _556 = fma(_502, _440, _412);
    float _558 = _502;
    float _560 = as_type<float>(_546);
    if (!_434)
    {
        _558 = _408;
    }
    float _562 = _558;
    float _564 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _566 = log2(_564);
    float _568 = _562;
    if (_434)
    {
        _568 = _148;
    }
    float _570 = _568;
    float _572 = _408 + (-0.5);
    int _574 = _534 ? 0 : 1;
    float _576 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _524);
    float _578 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[83].z, _536);
    float _580 = float(_550);
    float _582 = _570 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _584 = float(_546);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _588 = _484 >= 0.0;
    bool _590 = isnan(_484);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _460);
    float _600 = _580 * _584;
    int _602 = ~_574;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = -_586;
    float _610 = fma(_582, 2.0, _608);
    int _612 = _606;
    if (!_504)
    {
        int _614 = ~_574;
        int _616 = _614 + 1;
        _612 = _616;
    }
    int _618 = _612;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _622 = _596 ? 0 : 1;
    float _624 = _600 * (-2.0);
    if (!_434)
    {
        _540 = _402;
    }
    float _626 = _540;
    float _628 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _548);
    float _630 = _626;
    if (_434)
    {
        _630 = _408;
    }
    float _632 = _630;
    float _634 = fma(_490, _624, _490);
    int _636 = ~_622;
    int _638 = _636 + 1;
    int _640 = _638 + 1;
    float _642 = fma(_556, _624, _556);
    int _644 = _640;
    float _646 = _632;
    if (!_554)
    {
        int _648 = ~_622;
        int _650 = _648 + 1;
        _644 = _650;
    }
    int _652 = _644;
    float _654 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[83].w, _620);
    float _656 = _566 * _126;
    if (_434)
    {
        _646 = _408;
    }
    float _658 = _646;
    float _660 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _578);
    float _662 = _658;
    if (!_434)
    {
        _662 = _148;
    }
    float _664 = _662;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_434)
    {
        _560 = _402;
    }
    float _668 = _560;
    float _670 = exp2(_656);
    float _672 = _668;
    if (_434)
    {
        _672 = _408;
    }
    float _674 = _672;
    float _676 = _664 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _678 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].z, _666);
    bool _680 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _682 = isnan(0.0);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _688 = _684 || _686;
    float _690 = _674 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _692 = fma(_676, -2.0, _450);
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _696 = -_126;
    float _698 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[76].x, _428);
    int _700 = abs(_446);
    float _702 = fma(_690, -2.0, _694);
    bool _704 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _706 = isnan(1.0);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _712 = _708 || _710;
    float _714 = in.m_53.x;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _718 = 1.0 + _716;
    float _720 = -_670;
    float _722 = _720 + 1.0;
    float _724 = float(_700);
    float _726 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _678);
    float _728 = 1.0 / _718;
    bool _730 = !_424;
    int _732 = _730 ? 0 : 1;
    float _734 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _552);
    float _736 = _688 ? _722 : 0.0;
    float _738 = -_126;
    float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[81].x, _610);
    float _742 = float(_618);
    float _744 = -_126;
    float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[86].x, _508);
    int _748 = abs(_732);
    float _750 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _654);
    float _752 = in.m_53.z;
    float _754 = _724 * _742;
    float _756 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _702);
    float _758 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _692);
    float _760 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[196].y, _642);
    float _762 = _754 * (-2.0);
    float _764 = float(_652);
    if (_712)
    {
        float _766 = _736 * _728;
        _128 = _766;
    }
    float _768 = _128;
    float _770 = _148 + (-0.5);
    float _772 = float(_748);
    float _774 = fma(_762, _714, _714);
    float _776 = fma(_634, _768, _760);
    float _778 = _148 + _402;
    float _780 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].x, _774);
    float _782 = _776 * 0.15915493667125701904296875;
    float _784 = fma(_514, _762, _514);
    float _786 = _772 * _764;
    float _788 = _778 + (-1.0);
    float _790 = in.m_51.x;
    float _792 = in.m_51.y;
    float _794 = in.m_51.z;
    float _796 = fma(_784, _768, _780);
    float _798 = _786 * (-2.0);
    float _800 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _802 = in.m_55.x;
    float _804 = in.m_55.y;
    float _806 = in.m_55.z;
    float _808 = _796 * 0.15915493667125701904296875;
    float _810 = _402 + (-0.5);
    float _812 = fma(_798, _752, _752);
    float _814 = fma(_800, _798, _800);
    float _816 = _782 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[196].z, _812);
    float _822 = fma(_814, _768, _820);
    float _824 = _782 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _792 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _830 = _808 * 6.283185482025146484375;
    float _832 = sin(_830);
    float _834 = _822 * 0.15915493667125701904296875;
    float _836 = _790 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _802);
    float _840 = _794 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _804);
    float _844 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _806);
    float _848 = _808 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _836 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _854 = _840 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _856 = _844 * _842;
    float _858 = _852 * _838;
    float _860 = _854 * _846;
    float _862 = _834 * 6.283185482025146484375;
    float _864 = cos(_862);
    float _866 = _832 * _826;
    float _868 = _832 * _818;
    float _870 = _834 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = _850 * _818;
    float _876 = _850 * _826;
    float _878 = _864 * _856;
    float _880 = _826 * _864;
    float _882 = _818 * _864;
    float _884 = -_874;
    float _886 = fma(_872, _866, _884);
    float _888 = -_866;
    float _890 = fma(_872, _874, _888);
    float _892 = -_856;
    float _894 = _872 * _892;
    float _896 = _850 * _878;
    float _898 = fma(_872, _876, _868);
    float _900 = fma(_872, _868, _876);
    float _902 = _832 * _878;
    float _904 = fma(_880, _858, _894);
    float _906 = fma(_898, _858, _896);
    float _908 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _910 = fma(_886, _858, _902);
    float _912 = fma(_882, _860, _904);
    float _914 = fma(_890, _860, _906);
    float _916 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _918 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].x, _908);
    float _920 = fma(_900, _860, _910);
    float _922 = _914 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _924 = _914 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _926 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].x, _916);
    float _928 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].z, _918);
    float _930 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[10].x, _922);
    float _932 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[8].x, _924);
    float _934 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].z, _926);
    float _936 = _928 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _938 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[10].z, _930);
    float _940 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[8].z, _932);
    float _942 = _934 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _944 = _936 + _938;
    float _946 = _942 + _940;
    float _948 = _914 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _950 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _952 = _944 + _950;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _956 = _946 + _954;
    float _958 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[9].x, _948);
    float _960 = _952 * _952;
    float _962 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[9].z, _958);
    float _964 = fma(_956, _956, _960);
    float _966 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _968 = sqrt(_964);
    float _970 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].x, _966);
    float _972 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].z, _970);
    float _974 = _972 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _976 = _974 + _962;
    bool _978 = _968 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _980 = _958;
    float _982 = _966;
    float _984 = _912;
    float _986 = _864;
    if (!_978)
    {
        _980 = _946;
    }
    float _988 = _980;
    float _990 = _988;
    if (!_978)
    {
        _982 = _944;
    }
    float _992 = _982;
    float _994 = _992;
    if (!_978)
    {
        _984 = _976;
    }
    float _996 = _984;
    bool _998 = !_978;
    float _1000 = _996;
    if (!_998)
    {
        float _1002 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1006 = _968 + _1004;
        float _1008 = rsqrt(_964);
        float _1010 = _1006 * _1002;
        float _1012 = _976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1014 = _1010 * 0.15915493667125701904296875;
        float _1016 = _1014 * 6.283185482025146484375;
        float _1018 = cos(_1016);
        float _1020 = _1014 * 6.283185482025146484375;
        float _1022 = sin(_1020);
        float _1024 = _1018 + (-1.0);
        float _1026 = fma(_1022, _1012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1028 = _1024 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1030 = _1008 * _1026;
        float _1032 = fma(_976, _1018, _1028);
        float _1034 = fma(_956, _1030, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1036 = fma(_952, _1030, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1000 = _1032;
        _990 = _1034;
        _994 = _1036;
    }
    float _1038 = _1000;
    float _1040 = _990;
    float _1042 = _994;
    float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1046 = _1038 + _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1050 = _1040 + _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1054 = _1042 + _1052;
    float _1056 = _1046 * _1046;
    float _1058 = fma(_1050, _1050, _1056);
    float _1060 = fma(_1054, _1054, _1058);
    float _1062 = rsqrt(_1060);
    float _1064 = sqrt(_1060);
    float _1066 = _1062 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1068 = _1050 * _1066;
    float _1070 = _1054 * _1066;
    float _1072 = _1068 * _1068;
    float _1074 = _1070 * _1070;
    float _1076 = _1072 + _1074;
    float _1078 = sqrt(_1076);
    bool _1080 = _1078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1082 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1084 = _1078 + _1082;
    float _1086 = _1062;
    float _1088 = _1076;
    float _1090 = _1084;
    float _1092 = _1046;
    if (_1080)
    {
        float _1094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1086 = _1094;
    }
    float _1096 = _1086;
    if (_1080)
    {
        float _1098 = rsqrt(_1076);
        _1088 = _1098;
    }
    float _1100 = _1088;
    float _1102 = _1100;
    if (_1080)
    {
        float _1104 = _1084 * _1096;
        _1090 = _1104;
    }
    float _1106 = _1090;
    if (_1080)
    {
        float _1108 = _1106 * 0.15915493667125701904296875;
        _364 = _1108;
    }
    float _1110 = _364;
    float _1112 = _1054;
    float _1114 = _1110;
    if (_1080)
    {
        float _1116 = _1110 * 6.283185482025146484375;
        float _1118 = sin(_1116);
        _1112 = _1118;
    }
    float _1120 = _1112;
    float _1122 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1124 = precise::max(0.0, _1122);
    float _1126 = _1096;
    float _1128 = _1124;
    if (_1080)
    {
        float _1130 = _1110 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        _1126 = _1132;
    }
    float _1134 = _1126;
    float _1136 = -_1066;
    float _1138 = -_1124;
    float _1140 = fma(_1046, _1136, _1138);
    if (_1080)
    {
        float _1142 = _1140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1092 = _1142;
    }
    float _1144 = _1092;
    float _1146 = _1144;
    float _1148 = _1120;
    if (_1080)
    {
        float _1150 = fma(_1120, _1144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1146 = _1150;
    }
    float _1152 = _1146;
    float _1154 = _1152;
    if (!_1080)
    {
        _1148 = _1068;
    }
    float _1156 = _1148;
    float _1158 = _1156;
    float _1160 = _1134;
    if (_1080)
    {
        float _1162 = _1134 + (-1.0);
        _1128 = _1162;
    }
    float _1164 = _1128;
    float _1166 = _1164;
    if (_1080)
    {
        float _1168 = _1100 * _1152;
        _986 = _1168;
    }
    float _1170 = _986;
    if (!_1080)
    {
        _1154 = _1140;
    }
    float _1172 = _1154;
    float _1174 = _1172;
    if (_1080)
    {
        float _1176 = _1164 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1114 = _1176;
    }
    float _1178 = _1114;
    if (_1080)
    {
        float _1180 = _1068 * _1170;
        _1158 = _1180;
    }
    float _1182 = _1158;
    if (!_1080)
    {
        _1166 = _1070;
    }
    float _1184 = _1166;
    float _1186 = _1184;
    if (_1080)
    {
        float _1188 = _1070 * _1170;
        _1186 = _1188;
    }
    float _1190 = _1186;
    if (!_1080)
    {
        _1102 = _1072;
    }
    float _1192 = _1102;
    float _1194 = _1192;
    if (_1080)
    {
        float _1196 = fma(_1140, _1134, _1178);
        _1174 = _1196;
    }
    float _1198 = _1174;
    if (_1080)
    {
        float _1200 = _1182 * _1182;
        _1194 = _1200;
    }
    float _1202 = _1194;
    if (!_1080)
    {
        _1160 = _1074;
    }
    float _1204 = _1160;
    float _1206 = _1204;
    if (_1080)
    {
        float _1208 = _1190 * _1190;
        _1206 = _1208;
    }
    float _1210 = _1206;
    float _1212 = fma(_1198, _1198, _1202);
    float _1214 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1216 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1218 = _1212 + _1210;
    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1222 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1220);
    float _1224 = precise::clamp(_1222, 0.0, 1.0);
    float _1226 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1214);
    float _1228 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1230 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1232 = -_1224;
    float _1234 = _1232 + 1.0;
    float _1236 = rsqrt(_1218);
    float _1238 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1226);
    float _1240 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1228);
    float _1242 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1244 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1246 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1230);
    float _1248 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1240);
    float _1250 = abs(_1234);
    float _1252 = log2(_1250);
    float _1254 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1242);
    float _1256 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1246);
    float _1258 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1260 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1262 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1254);
    float _1264 = _1256 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1268 = _1236 * _1182;
    float _1270 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1272 = _1236 * _1198;
    float _1274 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1266);
    float _1276 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1278 = _1236 * _1190;
    float _1280 = -_1260;
    float _1282 = fma(_1280, _1216, 1.0);
    float _1284 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1274);
    float _1286 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1288 = -_1276;
    float _1290 = fma(_1272, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1288);
    float _1292 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1294 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1284);
    float _1296 = log2(_1282);
    float _1298 = -_1278;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1290);
    float _1302 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1304 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1292);
    float _1306 = fma(_1300, -0.5, 0.5);
    float _1308 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1302);
    float _1310 = fma(_1300, 0.5, 0.5);
    float _1312 = exp2(_1286);
    float _1314 = _1272 + 1.0;
    float _1316 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1308);
    float _1318 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1304);
    float _1320 = fma(_1310, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1322 = 1.0 / _1294;
    float _1324 = fma(_1310, _1320, -0.212114393711090087890625);
    float _1326 = _1296 * 0.693147182464599609375;
    float _1328 = fma(_1310, _1324, 1.570728778839111328125);
    float _1330 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1332 = sqrt(_1306);
    float _1334 = -_1272;
    float _1336 = fma(_1312, _1314, _1334);
    float _1338 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1316);
    float _1340 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1318);
    float _1342 = fma(_1336, 0.5, 0.5);
    float _1344 = _1338 * _1322;
    float _1346 = _1340 * _1322;
    float _1348 = fma(_1344, 0.5, 0.5);
    float _1350 = fma(_1346, -0.5, 0.5);
    float _1352 = _1332 * 0.636619746685028076171875;
    float3 _4041 = float3(_1348, _1350, _1330);
    float _1354 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4041, float3(0.0), isnan(_4041)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4041, float3(0.0), isnan(_4041)), level(0.0)).x;
    float3 _4052 = float3(_1348, _1350, _1330);
    float4 _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4052, float3(0.0), isnan(_4052)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4052, float3(0.0), isnan(_4052)), level(0.0)).xyzw;
    float _1359 = _1357.x;
    float _1361 = _1357.y;
    float _1363 = _1357.z;
    float _1365 = _1357.w;
    float _1367 = -_1328;
    float _1369 = fma(_1352, _1367, 1.0);
    float2 _4074 = float2(_1369, _1342);
    float3 _1373 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4074, float2(0.0), isnan(_4074)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4074, float2(0.0), isnan(_4074)), level(0.0)).xyz;
    float _1375 = _1373.x;
    float _1377 = _1373.y;
    float _1379 = _1373.z;
    float _1381 = in.m_57.y;
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1385 = _398 + _1383;
    float _1387 = in.m_49.w;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1395 = _1393 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1397 = _408 > 0.5;
    float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _1401 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1409 = _1407 != 0;
    float _1411 = 1.0 / _1391;
    bool _1413 = _402 > 0.5;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1417 = _1415 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1419 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1421 = -_1381;
    float _1423 = _1421 + 1.0;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1427 = _1425 != 0;
    float _1429 = 1.0 / _1395;
    int _1431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1433 = _1431 != 0;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1437 = _1435 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1439 = _1387 > 0.5;
    float _1441 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1443 = _1397 ? as_type<int>(_1423) : as_type<int>(_1381);
    float _1445 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1419);
    int _1447 = _1439 ? as_type<int>(_1423) : as_type<int>(_1381);
    float _1449 = 1.0 / _1405;
    float _1451 = _1409 ? as_type<float>(_1443) : _1381;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1459 = _1457 != 0;
    float _1461 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1445);
    int _1463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1465 = _1463 != 0;
    float _1467 = fma(_1441, _1451, -0.5);
    int _1469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1471 = _1469 != 0;
    float _1473 = 1.0 / _1417;
    float _1475 = -_598;
    float _1477 = fma(_576, _1467, _1475);
    float _1479 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1461);
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1483 = _1481 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1487 = _1485 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1491 = _1489 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1493 = 1.0 / _1437;
    float _1495 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1497 = _1465 ? as_type<float>(_1447) : _1381;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1501 = _1465;
    float _1503 = _1381;
    int _1505 = as_type<int>(_1467);
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[152].x;
    if (_1427)
    {
        bool _1509 = _148 > 0.5;
        _1501 = _1509;
    }
    bool _1511 = _1501;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1513;
    float _1517 = 1.0 / _1455;
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1519;
    out.m_61.w = _1499;
    float _1523 = _1515 * _1429;
    float _1525 = _1521 * _1411;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1533 = _1531 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1535 = 1.0 / _1483;
    bool _1537 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1539 = isnan(_398);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1545 = _1541 || _1543;
    float _1547 = float(_1545);
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1551 = _1549 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1553 = _1533 * _1449;
    float _1555 = _1477 + 0.5;
    float _1557 = _1551 * _1473;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1559;
    float _1563 = 1.0 / _1487;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1569;
    float _1573 = _1561 * _1517;
    bool _1575 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1577 = isnan(_398);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1583 = _1579 || _1581;
    float _1585 = float(_1583);
    float _1587 = -_1547;
    float _1589 = _1587 + 1.0;
    if (_1471)
    {
        float _1591 = _1413 ? _1423 : _1381;
        _1503 = _1591;
    }
    float _1593 = _1503;
    float _1595 = _1495 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1597 = 1.0 / _1491;
    float _1599 = _1567 * _1535;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1603 = _398 + _1601;
    bool _1605 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1607 = isnan(_398);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1613 = _1609 || _1611;
    float _1615 = float(_1613);
    float _1617 = -_1585;
    float _1619 = _1617 + 1.0;
    bool _1621 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1623 = isnan(_398);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    float _1633 = fma(_1523, _1603, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1637 = _398 + _1635;
    float _1639 = _1571 * _1563;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1643 = _398 + _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1647 = _398 + _1645;
    float _1649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1651 = fma(_1639, _1637, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1653 = fma(_1553, _1643, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1655 = fma(_1573, _1647, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1657 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1659 = isnan(_398);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1665 = _1661 || _1663;
    float _1667 = float(_1665);
    float _1669 = _1529 * _1597;
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1671;
    bool _1675 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1677 = isnan(_398);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = _1585 * _1589;
    float _1689 = -_1667;
    float _1691 = _1689 + 1.0;
    float _1693 = _1673 * _1493;
    bool _1695 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1697 = isnan(_398);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1703 = _1699 || _1701;
    float _1705 = float(_1703);
    float _1707 = _1631 * _1619;
    float _1709 = -_1631;
    float _1711 = _1709 + 1.0;
    float _1713 = fma(_1693, _1385, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1717 = _398 + _1715;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1721 = _400 + _1719;
    float _1723 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1725 = in.m_57.x;
    float _1727 = fma(_1599, _1717, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1729 = _1685 * _1691;
    float _1731 = -_1685;
    float _1733 = _1731 + 1.0;
    float _1735 = _1705 * _1711;
    float _1737 = -_1705;
    float _1739 = _1737 + 1.0;
    float _1741 = fma(_1525, _1721, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1743 = _1615 * _1733;
    float _1745 = -_1615;
    float _1747 = _1745 + 1.0;
    float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1751 = _400 + _1749;
    bool _1753 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1755 = isnan(_400);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1761 = _1757 || _1759;
    float _1763 = float(_1761);
    float _1765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1767 = _1547 * _1747;
    bool _1769 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1771 = isnan(_398);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1777 = _1773 || _1775;
    float _1779 = float(_1777);
    float _1781 = fma(_1669, _1751, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1783 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1785 = isnan(_400);
    bool _1787 = _1783 || _1785;
    bool _1789 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1791 = _1787 || _1789;
    float _1793 = float(_1791);
    float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1797 = _398 + _1795;
    bool _1799 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1801 = isnan(_400);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1807 = _1803 || _1805;
    float _1809 = float(_1807);
    float _1811 = _1779 * _1739;
    float _1813 = -_1779;
    float _1815 = _1813 + 1.0;
    float _1817 = fma(_1557, _1797, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1821 = _1633 * _1811;
    float _1823 = -_1809;
    float _1825 = _1823 + 1.0;
    float _1827 = fma(_1497, _1723, -0.5);
    int _1829 = as_type<int>(_1739);
    int _1831 = as_type<int>(_1723);
    float _1833 = _1725;
    if (_1427)
    {
        float _1835 = -_1725;
        float _1837 = _1835 + 1.0;
        _1505 = as_type<int>(_1837);
    }
    int _1839 = _1505;
    float _1841 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1821);
    float _1843 = _1793 * _1825;
    float _1845 = -_1793;
    float _1847 = _1845 + 1.0;
    float _1849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1851 = fma(_1653, _1735, _1841);
    float _1853 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1855 = _1763 * _1847;
    float _1857 = _1853;
    if (_1433)
    {
        float _1859 = -_1725;
        float _1861 = _1859 + 1.0;
        _1829 = as_type<int>(_1861);
    }
    int _1863 = _1829;
    float _1865 = fma(_1713, _1707, _1851);
    float _1867 = -_1763;
    float _1869 = _1867 + 1.0;
    float _1871 = _1741 * _1855;
    float _1873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_1459)
    {
        float _1875 = -_1725;
        float _1877 = _1875 + 1.0;
        _1831 = as_type<int>(_1877);
    }
    int _1879 = _1831;
    float _1881 = fma(_1817, _1687, _1865);
    float _1883 = fma(_1853, _1593, -0.5);
    if (!_1427)
    {
        _1507 = _1725;
    }
    float _1885 = _1507;
    float _1887 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1871);
    float _1889 = _1885;
    if (!_1433)
    {
        _1857 = _1725;
    }
    float _1891 = _1857;
    float _1893 = fma(_1655, _1767, _1881);
    float _1895 = exp2(_1401);
    float _1897 = _1891;
    if (_1427)
    {
        float _1899 = _1511 ? as_type<float>(_1839) : _1725;
        _1889 = _1899;
    }
    float _1901 = _1889;
    float _1903 = _1849 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1433)
    {
        float _1905 = _1413 ? as_type<float>(_1863) : _1725;
        _1897 = _1905;
    }
    float _1907 = _1897;
    float _1909 = _1819 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1459)
    {
        float _1911 = _1397 ? as_type<float>(_1879) : _1725;
        _1833 = _1911;
    }
    float _1913 = _1833;
    float _1915 = fma(_1727, _1743, _1893);
    float _1917 = fma(_1903, _1901, -0.5);
    float _1919 = _1873 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1921 = fma(_1909, _1907, -0.5);
    float _1923 = fma(_1651, _1729, _1915);
    float _1925 = fma(_726, _1917, _698);
    float _1927 = fma(_1919, _1913, -0.5);
    float _1929 = fma(_660, _1921, _740);
    float _1931 = -_758;
    float _1933 = fma(_734, _1883, _1931);
    float _1935 = fma(_628, _1927, _746);
    float _1937 = fma(_1781, _1843, _1887);
    float _1939 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1923);
    float _1941 = _1479 + _1294;
    float _1943 = -_1895;
    float _1945 = _1943 + 1.0;
    float _1947 = -_756;
    float _1949 = fma(_750, _1827, _1947);
    float _1951 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1937);
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1959 = _1925 + 0.5;
    float _1961 = _1941 * 0.5;
    float _1963 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1965 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1967 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1969 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1971 = _1951 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1973 = _1935 + 0.5;
    float _1975 = _1929 + 0.5;
    float _1977 = _1949 + 0.5;
    out.m_63.x = _1939;
    float _1979 = _1933 + 0.5;
    out.m_65.x = _1965;
    out.m_65.y = _1967;
    out.m_65.z = _1969;
    out.m_65.w = _1971;
    out.m_67.x = _1959;
    out.m_67.y = _1555;
    out.m_67.z = _1975;
    out.m_67.w = _1977;
    out.m_69.x = _1973;
    out.m_69.y = _1979;
    out.gl_Position.x = _1338;
    out.gl_Position.y = _1340;
    out.gl_Position.z = _1479;
    out.gl_Position.w = _1294;
    out.m_71.z = _1961;
    out.m_71.w = _1294;
    out.m_45.x = _1595;
    float _1981 = _1963 * _1354;
    float _1983 = -_1963;
    float _1985 = _1983 + 1.0;
    float _1987 = _1365 * _1981;
    float _1989 = _1365 * _1985;
    float _1991 = _1379 * _1981;
    float _1993 = fma(_1375, _1987, _1359);
    float _1995 = fma(_1377, _1987, _1361);
    float _1997 = fma(_1365, _1991, _1363);
    out.m_73.x = _1993;
    out.m_73.y = _1995;
    out.m_73.z = _1997;
    out.m_73.w = _1989;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _390 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2054 = as_type<float>(_108);
        out.gl_Position.z = _2054;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2124 = as_type<float>(_146);
        out.gl_Position.z = _2124;
    }
    if (_138)
    {
        return out;
    }
    float _148 = in.m_49.x;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _154 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = _152 * _150;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = 0.0;
    if (!_164)
    {
        float _176 = _154 * _154;
        float _178 = _176 * 0.5;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _184 = _180;
    if (!_164)
    {
        float _186 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    float _190 = _182 * 6.283185482025146484375;
    float _192 = floor(_182);
    float _194 = _190 * 0.15915493667125701904296875;
    int _196 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _198 = _196 != 0;
    float _200 = _194 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = 1.4012984643248170709237295832899e-45;
    float _206 = _188;
    if (!_164)
    {
        _204 = _154;
    }
    float _208 = _204;
    float _210 = -_192;
    float _212 = _182 + _210;
    bool _214 = !_164;
    float _216 = _208;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _154 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _154);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _246;
    }
    float _248 = _206;
    bool _250 = !_164;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _154 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _216 = _270;
    }
    float _272 = _216;
    float _274 = in.m_51.w;
    int _276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _278 = _276 != 0;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _282 = _280 != 0;
    float _284 = in.m_42.x;
    float _286 = in.m_42.y;
    float _288 = in.m_42.z;
    float _290 = -_212;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _294 = _212 < 0.5;
    float _296 = float(_294);
    bool _298 = !_278;
    int _300 = _298 ? 0 : 1;
    float _302 = fma(_202, 0.5, 0.5);
    bool _304 = !_198;
    int _306 = _304 ? 0 : 1;
    float _308 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _310 = abs(_300);
    float _312 = -_296;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _316 = -_302;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _320 = fma(_272, _168, _308);
    int _322 = abs(_306);
    float _324 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _326 = !_282;
    int _328 = _326 ? 0 : 1;
    float _330 = fma(_272, _170, _324);
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _334 = abs(_328);
    float _336 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _338 = float(_310);
    float _340 = float(_322);
    float _342 = fma(_272, _172, _336);
    float _344 = abs(_292);
    float _346 = _338 * _344;
    float _348 = fma(_342, _274, _288);
    float _350 = float(_334);
    float _352 = fma(_340, _318, _346);
    float _354 = fma(_320, _274, _284);
    float _356 = fma(_330, _274, _286);
    float _358 = abs(_314);
    float _360 = fma(_350, _358, _352);
    bool _362 = !_332;
    float _364 = _348;
    float _386;
    float _388;
    if (!_362)
    {
        float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _368 = _148 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _370 = float(_92);
        float _372 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _374 = 1.0 / _370;
        float _376 = _372 * _366;
        float _378 = floor(_376);
        float _380 = _126 * _374;
        float _382 = -_378;
        float _384 = _376 + _382;
        _386 = _380;
        _388 = _384;
        _390 = true;
    }
    else
    {
        float _392 = float(_92);
        float _394 = 1.0 / _392;
        float _396 = _126 * _394;
        _386 = _396;
        _388 = _396;
    }
    _390 = false;
    float _398 = _386;
    float _400 = _388;
    float _402 = in.m_49.z;
    float _404 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _406 = _148 * 2.0;
    float _408 = in.m_49.y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _412 = in.m_53.y;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _416 = _414 != 0;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _424 = _422 != 0;
    float _426 = -_410;
    float _428 = fma(_404, 2.0, _426);
    float _430 = floor(_406);
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _434 = _432 != 0;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _438 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _444 = !_416;
    int _446 = _444 ? 0 : 1;
    float _448 = _402 * 2.0;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _452 = _408 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _454 = floor(_448);
    float _456 = _408 * 2.0;
    bool _458 = _430 > 0.0;
    float _460 = fma(_452, -2.0, _436);
    float _462 = _408 + _402;
    bool _464 = _430 >= 0.0;
    bool _466 = isnan(_430);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _476 = _462 + (-1.0);
    float _478 = _438 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _480 = _438;
    if (_434)
    {
        _480 = _148;
    }
    float _482 = _480;
    float _484 = floor(_456);
    float _486 = _482;
    if (!_434)
    {
        _486 = _402;
    }
    float _488 = _486;
    float _490 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _492 = _148 + _408;
    int _494 = _472 ? 0 : 1;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _498 = _488 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _500 = _492 + (-1.0);
    float _502 = ceil(_478);
    bool _504 = _454 > 0.0;
    float _506 = -_442;
    float _508 = fma(_498, 2.0, _506);
    bool _510 = !_420;
    float _512 = _510 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _518 = ~_494;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    float _524 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[78].w, _474);
    bool _526 = _454 >= 0.0;
    bool _528 = isnan(_454);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _538 = _522;
    float _540 = _512;
    if (!_458)
    {
        int _542 = ~_494;
        int _544 = _542 + 1;
        _538 = _544;
    }
    int _546 = _538;
    float _548 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[88].z, _496);
    int _550 = abs(as_type<int>(_512));
    float _552 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[88].w, _516);
    bool _554 = _484 > 0.0;
    float _556 = fma(_502, _440, _412);
    float _558 = _502;
    float _560 = as_type<float>(_546);
    if (!_434)
    {
        _558 = _408;
    }
    float _562 = _558;
    float _564 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _566 = log2(_564);
    float _568 = _562;
    if (_434)
    {
        _568 = _148;
    }
    float _570 = _568;
    float _572 = _408 + (-0.5);
    int _574 = _534 ? 0 : 1;
    float _576 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _524);
    float _578 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[83].z, _536);
    float _580 = float(_550);
    float _582 = _570 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _584 = float(_546);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _588 = _484 >= 0.0;
    bool _590 = isnan(_484);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _460);
    float _600 = _580 * _584;
    int _602 = ~_574;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = -_586;
    float _610 = fma(_582, 2.0, _608);
    int _612 = _606;
    if (!_504)
    {
        int _614 = ~_574;
        int _616 = _614 + 1;
        _612 = _616;
    }
    int _618 = _612;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _622 = _596 ? 0 : 1;
    float _624 = _600 * (-2.0);
    if (!_434)
    {
        _540 = _402;
    }
    float _626 = _540;
    float _628 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _548);
    float _630 = _626;
    if (_434)
    {
        _630 = _408;
    }
    float _632 = _630;
    float _634 = fma(_490, _624, _490);
    int _636 = ~_622;
    int _638 = _636 + 1;
    int _640 = _638 + 1;
    float _642 = fma(_556, _624, _556);
    int _644 = _640;
    float _646 = _632;
    if (!_554)
    {
        int _648 = ~_622;
        int _650 = _648 + 1;
        _644 = _650;
    }
    int _652 = _644;
    float _654 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[83].w, _620);
    float _656 = _566 * _126;
    if (_434)
    {
        _646 = _408;
    }
    float _658 = _646;
    float _660 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _578);
    float _662 = _658;
    if (!_434)
    {
        _662 = _148;
    }
    float _664 = _662;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_434)
    {
        _560 = _402;
    }
    float _668 = _560;
    float _670 = exp2(_656);
    float _672 = _668;
    if (_434)
    {
        _672 = _408;
    }
    float _674 = _672;
    float _676 = _664 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _678 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].z, _666);
    bool _680 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _682 = isnan(0.0);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _688 = _684 || _686;
    float _690 = _674 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _692 = fma(_676, -2.0, _450);
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _696 = -_126;
    float _698 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[76].x, _428);
    int _700 = abs(_446);
    float _702 = fma(_690, -2.0, _694);
    bool _704 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _706 = isnan(1.0);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _712 = _708 || _710;
    float _714 = in.m_53.x;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _718 = 1.0 + _716;
    float _720 = -_670;
    float _722 = _720 + 1.0;
    float _724 = float(_700);
    float _726 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _678);
    float _728 = 1.0 / _718;
    bool _730 = !_424;
    int _732 = _730 ? 0 : 1;
    float _734 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _552);
    float _736 = _688 ? _722 : 0.0;
    float _738 = -_126;
    float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[81].x, _610);
    float _742 = float(_618);
    float _744 = -_126;
    float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[86].x, _508);
    int _748 = abs(_732);
    float _750 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _654);
    float _752 = in.m_53.z;
    float _754 = _724 * _742;
    float _756 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _702);
    float _758 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _692);
    float _760 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[196].y, _642);
    float _762 = _754 * (-2.0);
    float _764 = float(_652);
    if (_712)
    {
        float _766 = _736 * _728;
        _128 = _766;
    }
    float _768 = _128;
    float _770 = _148 + (-0.5);
    float _772 = float(_748);
    float _774 = fma(_762, _714, _714);
    float _776 = fma(_634, _768, _760);
    float _778 = _148 + _402;
    float _780 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].x, _774);
    float _782 = _776 * 0.15915493667125701904296875;
    float _784 = fma(_514, _762, _514);
    float _786 = _772 * _764;
    float _788 = _778 + (-1.0);
    float _790 = in.m_51.x;
    float _792 = in.m_51.y;
    float _794 = in.m_51.z;
    float _796 = fma(_784, _768, _780);
    float _798 = _786 * (-2.0);
    float _800 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _802 = in.m_55.x;
    float _804 = in.m_55.y;
    float _806 = in.m_55.z;
    float _808 = _796 * 0.15915493667125701904296875;
    float _810 = _402 + (-0.5);
    float _812 = fma(_798, _752, _752);
    float _814 = fma(_800, _798, _800);
    float _816 = _782 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[196].z, _812);
    float _822 = fma(_814, _768, _820);
    float _824 = _782 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _792 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _830 = _808 * 6.283185482025146484375;
    float _832 = sin(_830);
    float _834 = _822 * 0.15915493667125701904296875;
    float _836 = _790 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _802);
    float _840 = _794 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _804);
    float _844 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _806);
    float _848 = _808 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _836 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _854 = _840 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _856 = _844 * _842;
    float _858 = _852 * _838;
    float _860 = _854 * _846;
    float _862 = _834 * 6.283185482025146484375;
    float _864 = cos(_862);
    float _866 = _832 * _826;
    float _868 = _832 * _818;
    float _870 = _834 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = _850 * _818;
    float _876 = _850 * _826;
    float _878 = _864 * _856;
    float _880 = _826 * _864;
    float _882 = _818 * _864;
    float _884 = -_874;
    float _886 = fma(_872, _866, _884);
    float _888 = -_866;
    float _890 = fma(_872, _874, _888);
    float _892 = -_856;
    float _894 = _872 * _892;
    float _896 = _850 * _878;
    float _898 = fma(_872, _876, _868);
    float _900 = fma(_872, _868, _876);
    float _902 = _832 * _878;
    float _904 = fma(_880, _858, _894);
    float _906 = fma(_898, _858, _896);
    float _908 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _910 = fma(_886, _858, _902);
    float _912 = fma(_882, _860, _904);
    float _914 = fma(_890, _860, _906);
    float _916 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _918 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].x, _908);
    float _920 = fma(_900, _860, _910);
    float _922 = _914 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _924 = _914 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _926 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].x, _916);
    float _928 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].z, _918);
    float _930 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[10].x, _922);
    float _932 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[8].x, _924);
    float _934 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].z, _926);
    float _936 = _928 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _938 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[10].z, _930);
    float _940 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[8].z, _932);
    float _942 = _934 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _944 = _936 + _938;
    float _946 = _942 + _940;
    float _948 = _914 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _950 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _952 = _944 + _950;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _956 = _946 + _954;
    float _958 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[9].x, _948);
    float _960 = _952 * _952;
    float _962 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[9].z, _958);
    float _964 = fma(_956, _956, _960);
    float _966 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _968 = sqrt(_964);
    float _970 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].x, _966);
    float _972 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].z, _970);
    float _974 = _972 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _976 = _974 + _962;
    bool _978 = _968 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _980 = _958;
    float _982 = _966;
    float _984 = _912;
    float _986 = _864;
    if (!_978)
    {
        _980 = _946;
    }
    float _988 = _980;
    float _990 = _988;
    if (!_978)
    {
        _982 = _944;
    }
    float _992 = _982;
    float _994 = _992;
    if (!_978)
    {
        _984 = _976;
    }
    float _996 = _984;
    bool _998 = !_978;
    float _1000 = _996;
    if (!_998)
    {
        float _1002 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1006 = _968 + _1004;
        float _1008 = rsqrt(_964);
        float _1010 = _1006 * _1002;
        float _1012 = _976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1014 = _1010 * 0.15915493667125701904296875;
        float _1016 = _1014 * 6.283185482025146484375;
        float _1018 = cos(_1016);
        float _1020 = _1014 * 6.283185482025146484375;
        float _1022 = sin(_1020);
        float _1024 = _1018 + (-1.0);
        float _1026 = fma(_1022, _1012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1028 = _1024 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1030 = _1008 * _1026;
        float _1032 = fma(_976, _1018, _1028);
        float _1034 = fma(_956, _1030, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1036 = fma(_952, _1030, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1000 = _1032;
        _990 = _1034;
        _994 = _1036;
    }
    float _1038 = _1000;
    float _1040 = _990;
    float _1042 = _994;
    float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1046 = _1038 + _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1050 = _1040 + _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1054 = _1042 + _1052;
    float _1056 = _1046 * _1046;
    float _1058 = fma(_1050, _1050, _1056);
    float _1060 = fma(_1054, _1054, _1058);
    float _1062 = rsqrt(_1060);
    float _1064 = sqrt(_1060);
    float _1066 = _1062 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1068 = _1050 * _1066;
    float _1070 = _1054 * _1066;
    float _1072 = _1068 * _1068;
    float _1074 = _1070 * _1070;
    float _1076 = _1072 + _1074;
    float _1078 = sqrt(_1076);
    bool _1080 = _1078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1082 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1084 = _1078 + _1082;
    float _1086 = _1062;
    float _1088 = _1076;
    float _1090 = _1084;
    float _1092 = _1046;
    if (_1080)
    {
        float _1094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1086 = _1094;
    }
    float _1096 = _1086;
    if (_1080)
    {
        float _1098 = rsqrt(_1076);
        _1088 = _1098;
    }
    float _1100 = _1088;
    float _1102 = _1100;
    if (_1080)
    {
        float _1104 = _1084 * _1096;
        _1090 = _1104;
    }
    float _1106 = _1090;
    if (_1080)
    {
        float _1108 = _1106 * 0.15915493667125701904296875;
        _364 = _1108;
    }
    float _1110 = _364;
    float _1112 = _1054;
    float _1114 = _1110;
    if (_1080)
    {
        float _1116 = _1110 * 6.283185482025146484375;
        float _1118 = sin(_1116);
        _1112 = _1118;
    }
    float _1120 = _1112;
    float _1122 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1124 = precise::max(0.0, _1122);
    float _1126 = _1096;
    float _1128 = _1124;
    if (_1080)
    {
        float _1130 = _1110 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        _1126 = _1132;
    }
    float _1134 = _1126;
    float _1136 = -_1066;
    float _1138 = -_1124;
    float _1140 = fma(_1046, _1136, _1138);
    if (_1080)
    {
        float _1142 = _1140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1092 = _1142;
    }
    float _1144 = _1092;
    float _1146 = _1144;
    float _1148 = _1120;
    if (_1080)
    {
        float _1150 = fma(_1120, _1144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1146 = _1150;
    }
    float _1152 = _1146;
    float _1154 = _1152;
    if (!_1080)
    {
        _1148 = _1068;
    }
    float _1156 = _1148;
    float _1158 = _1156;
    float _1160 = _1134;
    if (_1080)
    {
        float _1162 = _1134 + (-1.0);
        _1128 = _1162;
    }
    float _1164 = _1128;
    float _1166 = _1164;
    if (_1080)
    {
        float _1168 = _1100 * _1152;
        _986 = _1168;
    }
    float _1170 = _986;
    if (!_1080)
    {
        _1154 = _1140;
    }
    float _1172 = _1154;
    float _1174 = _1172;
    if (_1080)
    {
        float _1176 = _1164 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1114 = _1176;
    }
    float _1178 = _1114;
    if (_1080)
    {
        float _1180 = _1068 * _1170;
        _1158 = _1180;
    }
    float _1182 = _1158;
    if (!_1080)
    {
        _1166 = _1070;
    }
    float _1184 = _1166;
    float _1186 = _1184;
    if (_1080)
    {
        float _1188 = _1070 * _1170;
        _1186 = _1188;
    }
    float _1190 = _1186;
    if (!_1080)
    {
        _1102 = _1072;
    }
    float _1192 = _1102;
    float _1194 = _1192;
    if (_1080)
    {
        float _1196 = fma(_1140, _1134, _1178);
        _1174 = _1196;
    }
    float _1198 = _1174;
    if (_1080)
    {
        float _1200 = _1182 * _1182;
        _1194 = _1200;
    }
    float _1202 = _1194;
    if (!_1080)
    {
        _1160 = _1074;
    }
    float _1204 = _1160;
    float _1206 = _1204;
    if (_1080)
    {
        float _1208 = _1190 * _1190;
        _1206 = _1208;
    }
    float _1210 = _1206;
    float _1212 = fma(_1198, _1198, _1202);
    float _1214 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1216 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1218 = _1212 + _1210;
    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1222 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1220);
    float _1224 = precise::clamp(_1222, 0.0, 1.0);
    float _1226 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1214);
    float _1228 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1230 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1232 = -_1224;
    float _1234 = _1232 + 1.0;
    float _1236 = rsqrt(_1218);
    float _1238 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1226);
    float _1240 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1228);
    float _1242 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1244 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1246 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1230);
    float _1248 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1240);
    float _1250 = abs(_1234);
    float _1252 = log2(_1250);
    float _1254 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1242);
    float _1256 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1246);
    float _1258 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1260 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1262 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1254);
    float _1264 = _1256 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1268 = _1236 * _1182;
    float _1270 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1272 = _1236 * _1198;
    float _1274 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1266);
    float _1276 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1278 = _1236 * _1190;
    float _1280 = -_1260;
    float _1282 = fma(_1280, _1216, 1.0);
    float _1284 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1274);
    float _1286 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1288 = -_1276;
    float _1290 = fma(_1272, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1288);
    float _1292 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1294 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1284);
    float _1296 = log2(_1282);
    float _1298 = -_1278;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1290);
    float _1302 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1304 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1292);
    float _1306 = fma(_1300, -0.5, 0.5);
    float _1308 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1302);
    float _1310 = fma(_1300, 0.5, 0.5);
    float _1312 = exp2(_1286);
    float _1314 = _1272 + 1.0;
    float _1316 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1308);
    float _1318 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1304);
    float _1320 = fma(_1310, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1322 = 1.0 / _1294;
    float _1324 = fma(_1310, _1320, -0.212114393711090087890625);
    float _1326 = _1296 * 0.693147182464599609375;
    float _1328 = fma(_1310, _1324, 1.570728778839111328125);
    float _1330 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1332 = sqrt(_1306);
    float _1334 = -_1272;
    float _1336 = fma(_1312, _1314, _1334);
    float _1338 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1316);
    float _1340 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1318);
    float _1342 = fma(_1336, 0.5, 0.5);
    float _1344 = _1338 * _1322;
    float _1346 = _1340 * _1322;
    float _1348 = fma(_1344, 0.5, 0.5);
    float _1350 = fma(_1346, -0.5, 0.5);
    float _1352 = _1332 * 0.636619746685028076171875;
    float3 _4041 = float3(_1348, _1350, _1330);
    float _1354 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4041, float3(0.0), isnan(_4041)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4041, float3(0.0), isnan(_4041)), level(0.0)).x;
    float3 _4052 = float3(_1348, _1350, _1330);
    float4 _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4052, float3(0.0), isnan(_4052)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4052, float3(0.0), isnan(_4052)), level(0.0)).xyzw;
    float _1359 = _1357.x;
    float _1361 = _1357.y;
    float _1363 = _1357.z;
    float _1365 = _1357.w;
    float _1367 = -_1328;
    float _1369 = fma(_1352, _1367, 1.0);
    float2 _4074 = float2(_1369, _1342);
    float3 _1373 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4074, float2(0.0), isnan(_4074)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4074, float2(0.0), isnan(_4074)), level(0.0)).xyz;
    float _1375 = _1373.x;
    float _1377 = _1373.y;
    float _1379 = _1373.z;
    float _1381 = in.m_57.y;
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1385 = _398 + _1383;
    float _1387 = in.m_49.w;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1395 = _1393 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1397 = _408 > 0.5;
    float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _1401 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1409 = _1407 != 0;
    float _1411 = 1.0 / _1391;
    bool _1413 = _402 > 0.5;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1417 = _1415 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1419 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1421 = -_1381;
    float _1423 = _1421 + 1.0;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1427 = _1425 != 0;
    float _1429 = 1.0 / _1395;
    int _1431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1433 = _1431 != 0;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1437 = _1435 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1439 = _1387 > 0.5;
    float _1441 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1443 = _1397 ? as_type<int>(_1423) : as_type<int>(_1381);
    float _1445 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1419);
    int _1447 = _1439 ? as_type<int>(_1423) : as_type<int>(_1381);
    float _1449 = 1.0 / _1405;
    float _1451 = _1409 ? as_type<float>(_1443) : _1381;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1459 = _1457 != 0;
    float _1461 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1445);
    int _1463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1465 = _1463 != 0;
    float _1467 = fma(_1441, _1451, -0.5);
    int _1469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1471 = _1469 != 0;
    float _1473 = 1.0 / _1417;
    float _1475 = -_598;
    float _1477 = fma(_576, _1467, _1475);
    float _1479 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1461);
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1483 = _1481 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1487 = _1485 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1491 = _1489 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1493 = 1.0 / _1437;
    float _1495 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1497 = _1465 ? as_type<float>(_1447) : _1381;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1501 = _1465;
    float _1503 = _1381;
    int _1505 = as_type<int>(_1467);
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[152].x;
    if (_1427)
    {
        bool _1509 = _148 > 0.5;
        _1501 = _1509;
    }
    bool _1511 = _1501;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1513;
    float _1517 = 1.0 / _1455;
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1519;
    out.m_61.w = _1499;
    float _1523 = _1515 * _1429;
    float _1525 = _1521 * _1411;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1533 = _1531 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1535 = 1.0 / _1483;
    bool _1537 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1539 = isnan(_398);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1545 = _1541 || _1543;
    float _1547 = float(_1545);
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1551 = _1549 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1553 = _1533 * _1449;
    float _1555 = _1477 + 0.5;
    float _1557 = _1551 * _1473;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1559;
    float _1563 = 1.0 / _1487;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1569;
    float _1573 = _1561 * _1517;
    bool _1575 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1577 = isnan(_398);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1583 = _1579 || _1581;
    float _1585 = float(_1583);
    float _1587 = -_1547;
    float _1589 = _1587 + 1.0;
    if (_1471)
    {
        float _1591 = _1413 ? _1423 : _1381;
        _1503 = _1591;
    }
    float _1593 = _1503;
    float _1595 = _1495 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1597 = 1.0 / _1491;
    float _1599 = _1567 * _1535;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1603 = _398 + _1601;
    bool _1605 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1607 = isnan(_398);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1613 = _1609 || _1611;
    float _1615 = float(_1613);
    float _1617 = -_1585;
    float _1619 = _1617 + 1.0;
    bool _1621 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1623 = isnan(_398);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    float _1633 = fma(_1523, _1603, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1637 = _398 + _1635;
    float _1639 = _1571 * _1563;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1643 = _398 + _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1647 = _398 + _1645;
    float _1649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1651 = fma(_1639, _1637, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1653 = fma(_1553, _1643, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1655 = fma(_1573, _1647, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1657 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1659 = isnan(_398);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1665 = _1661 || _1663;
    float _1667 = float(_1665);
    float _1669 = _1529 * _1597;
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1671;
    bool _1675 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1677 = isnan(_398);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = _1585 * _1589;
    float _1689 = -_1667;
    float _1691 = _1689 + 1.0;
    float _1693 = _1673 * _1493;
    bool _1695 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1697 = isnan(_398);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1703 = _1699 || _1701;
    float _1705 = float(_1703);
    float _1707 = _1631 * _1619;
    float _1709 = -_1631;
    float _1711 = _1709 + 1.0;
    float _1713 = fma(_1693, _1385, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1717 = _398 + _1715;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1721 = _400 + _1719;
    float _1723 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1725 = in.m_57.x;
    float _1727 = fma(_1599, _1717, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1729 = _1685 * _1691;
    float _1731 = -_1685;
    float _1733 = _1731 + 1.0;
    float _1735 = _1705 * _1711;
    float _1737 = -_1705;
    float _1739 = _1737 + 1.0;
    float _1741 = fma(_1525, _1721, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1743 = _1615 * _1733;
    float _1745 = -_1615;
    float _1747 = _1745 + 1.0;
    float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1751 = _400 + _1749;
    bool _1753 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1755 = isnan(_400);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1761 = _1757 || _1759;
    float _1763 = float(_1761);
    float _1765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1767 = _1547 * _1747;
    bool _1769 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1771 = isnan(_398);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1777 = _1773 || _1775;
    float _1779 = float(_1777);
    float _1781 = fma(_1669, _1751, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1783 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1785 = isnan(_400);
    bool _1787 = _1783 || _1785;
    bool _1789 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1791 = _1787 || _1789;
    float _1793 = float(_1791);
    float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1797 = _398 + _1795;
    bool _1799 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1801 = isnan(_400);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1807 = _1803 || _1805;
    float _1809 = float(_1807);
    float _1811 = _1779 * _1739;
    float _1813 = -_1779;
    float _1815 = _1813 + 1.0;
    float _1817 = fma(_1557, _1797, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1821 = _1633 * _1811;
    float _1823 = -_1809;
    float _1825 = _1823 + 1.0;
    float _1827 = fma(_1497, _1723, -0.5);
    int _1829 = as_type<int>(_1739);
    int _1831 = as_type<int>(_1723);
    float _1833 = _1725;
    if (_1427)
    {
        float _1835 = -_1725;
        float _1837 = _1835 + 1.0;
        _1505 = as_type<int>(_1837);
    }
    int _1839 = _1505;
    float _1841 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1821);
    float _1843 = _1793 * _1825;
    float _1845 = -_1793;
    float _1847 = _1845 + 1.0;
    float _1849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1851 = fma(_1653, _1735, _1841);
    float _1853 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1855 = _1763 * _1847;
    float _1857 = _1853;
    if (_1433)
    {
        float _1859 = -_1725;
        float _1861 = _1859 + 1.0;
        _1829 = as_type<int>(_1861);
    }
    int _1863 = _1829;
    float _1865 = fma(_1713, _1707, _1851);
    float _1867 = -_1763;
    float _1869 = _1867 + 1.0;
    float _1871 = _1741 * _1855;
    float _1873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_1459)
    {
        float _1875 = -_1725;
        float _1877 = _1875 + 1.0;
        _1831 = as_type<int>(_1877);
    }
    int _1879 = _1831;
    float _1881 = fma(_1817, _1687, _1865);
    float _1883 = fma(_1853, _1593, -0.5);
    if (!_1427)
    {
        _1507 = _1725;
    }
    float _1885 = _1507;
    float _1887 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1871);
    float _1889 = _1885;
    if (!_1433)
    {
        _1857 = _1725;
    }
    float _1891 = _1857;
    float _1893 = fma(_1655, _1767, _1881);
    float _1895 = exp2(_1401);
    float _1897 = _1891;
    if (_1427)
    {
        float _1899 = _1511 ? as_type<float>(_1839) : _1725;
        _1889 = _1899;
    }
    float _1901 = _1889;
    float _1903 = _1849 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1433)
    {
        float _1905 = _1413 ? as_type<float>(_1863) : _1725;
        _1897 = _1905;
    }
    float _1907 = _1897;
    float _1909 = _1819 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1459)
    {
        float _1911 = _1397 ? as_type<float>(_1879) : _1725;
        _1833 = _1911;
    }
    float _1913 = _1833;
    float _1915 = fma(_1727, _1743, _1893);
    float _1917 = fma(_1903, _1901, -0.5);
    float _1919 = _1873 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1921 = fma(_1909, _1907, -0.5);
    float _1923 = fma(_1651, _1729, _1915);
    float _1925 = fma(_726, _1917, _698);
    float _1927 = fma(_1919, _1913, -0.5);
    float _1929 = fma(_660, _1921, _740);
    float _1931 = -_758;
    float _1933 = fma(_734, _1883, _1931);
    float _1935 = fma(_628, _1927, _746);
    float _1937 = fma(_1781, _1843, _1887);
    float _1939 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1923);
    float _1941 = _1479 + _1294;
    float _1943 = -_1895;
    float _1945 = _1943 + 1.0;
    float _1947 = -_756;
    float _1949 = fma(_750, _1827, _1947);
    float _1951 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1937);
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1959 = _1925 + 0.5;
    float _1961 = _1941 * 0.5;
    float _1963 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1965 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1967 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1969 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1971 = _1951 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1973 = _1935 + 0.5;
    float _1975 = _1929 + 0.5;
    float _1977 = _1949 + 0.5;
    out.m_63.x = _1939;
    float _1979 = _1933 + 0.5;
    out.m_65.x = _1965;
    out.m_65.y = _1967;
    out.m_65.z = _1969;
    out.m_65.w = _1971;
    out.m_67.x = _1959;
    out.m_67.y = _1555;
    out.m_67.z = _1975;
    out.m_67.w = _1977;
    out.m_69.x = _1973;
    out.m_69.y = _1979;
    out.gl_Position.x = _1338;
    out.gl_Position.y = _1340;
    out.gl_Position.z = _1479;
    out.gl_Position.w = _1294;
    out.m_71.z = _1961;
    out.m_71.w = _1294;
    out.m_45.x = _1595;
    float _1981 = _1963 * _1354;
    float _1983 = -_1963;
    float _1985 = _1983 + 1.0;
    float _1987 = _1365 * _1981;
    float _1989 = _1365 * _1985;
    float _1991 = _1379 * _1981;
    float _1993 = fma(_1375, _1987, _1359);
    float _1995 = fma(_1377, _1987, _1361);
    float _1997 = fma(_1365, _1991, _1363);
    out.m_73.x = _1993;
    out.m_73.y = _1995;
    out.m_73.z = _1997;
    out.m_73.w = _1989;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _390 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2054 = as_type<float>(_108);
        out.gl_Position.z = _2054;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2124 = as_type<float>(_146);
        out.gl_Position.z = _2124;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.x;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _154 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = _152 * _150;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = 0.0;
    if (!_164)
    {
        float _176 = _154 * _154;
        float _178 = _176 * 0.5;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _184 = _180;
    if (!_164)
    {
        float _186 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    float _190 = _182 * 6.283185482025146484375;
    float _192 = floor(_182);
    float _194 = _190 * 0.15915493667125701904296875;
    int _196 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _198 = _196 != 0;
    float _200 = _194 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = 1.4012984643248170709237295832899e-45;
    float _206 = _188;
    if (!_164)
    {
        _204 = _154;
    }
    float _208 = _204;
    float _210 = -_192;
    float _212 = _182 + _210;
    bool _214 = !_164;
    float _216 = _208;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _154 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _154);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _246;
    }
    float _248 = _206;
    bool _250 = !_164;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _154 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _216 = _270;
    }
    float _272 = _216;
    float _274 = in.m_51.w;
    int _276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _278 = _276 != 0;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _282 = _280 != 0;
    float _284 = in.m_42.x;
    float _286 = in.m_42.y;
    float _288 = in.m_42.z;
    float _290 = -_212;
    float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _294 = _212 < 0.5;
    float _296 = float(_294);
    bool _298 = !_278;
    int _300 = _298 ? 0 : 1;
    float _302 = fma(_202, 0.5, 0.5);
    bool _304 = !_198;
    int _306 = _304 ? 0 : 1;
    float _308 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _310 = abs(_300);
    float _312 = -_296;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _316 = -_302;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _320 = fma(_272, _168, _308);
    int _322 = abs(_306);
    float _324 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _326 = !_282;
    int _328 = _326 ? 0 : 1;
    float _330 = fma(_272, _170, _324);
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _334 = abs(_328);
    float _336 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _338 = float(_310);
    float _340 = float(_322);
    float _342 = fma(_272, _172, _336);
    float _344 = abs(_292);
    float _346 = _338 * _344;
    float _348 = fma(_342, _274, _288);
    float _350 = float(_334);
    float _352 = fma(_340, _318, _346);
    float _354 = fma(_320, _274, _284);
    float _356 = fma(_330, _274, _286);
    float _358 = abs(_314);
    float _360 = fma(_350, _358, _352);
    bool _362 = !_332;
    float _364 = _348;
    float _386;
    float _388;
    if (!_362)
    {
        float _366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _368 = _148 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _370 = float(_92);
        float _372 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _374 = 1.0 / _370;
        float _376 = _372 * _366;
        float _378 = floor(_376);
        float _380 = _126 * _374;
        float _382 = -_378;
        float _384 = _376 + _382;
        _386 = _380;
        _388 = _384;
        _390 = true;
    }
    else
    {
        float _392 = float(_92);
        float _394 = 1.0 / _392;
        float _396 = _126 * _394;
        _386 = _396;
        _388 = _396;
    }
    _390 = false;
    float _398 = _386;
    float _400 = _388;
    float _402 = in.m_49.z;
    float _404 = _148 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _406 = _148 * 2.0;
    float _408 = in.m_49.y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _412 = in.m_53.y;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _416 = _414 != 0;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _424 = _422 != 0;
    float _426 = -_410;
    float _428 = fma(_404, 2.0, _426);
    float _430 = floor(_406);
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _434 = _432 != 0;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _438 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _444 = !_416;
    int _446 = _444 ? 0 : 1;
    float _448 = _402 * 2.0;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _452 = _408 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _454 = floor(_448);
    float _456 = _408 * 2.0;
    bool _458 = _430 > 0.0;
    float _460 = fma(_452, -2.0, _436);
    float _462 = _408 + _402;
    bool _464 = _430 >= 0.0;
    bool _466 = isnan(_430);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _476 = _462 + (-1.0);
    float _478 = _438 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _480 = _438;
    if (_434)
    {
        _480 = _148;
    }
    float _482 = _480;
    float _484 = floor(_456);
    float _486 = _482;
    if (!_434)
    {
        _486 = _402;
    }
    float _488 = _486;
    float _490 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _492 = _148 + _408;
    int _494 = _472 ? 0 : 1;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _498 = _488 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _500 = _492 + (-1.0);
    float _502 = ceil(_478);
    bool _504 = _454 > 0.0;
    float _506 = -_442;
    float _508 = fma(_498, 2.0, _506);
    bool _510 = !_420;
    float _512 = _510 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _518 = ~_494;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    float _524 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[78].w, _474);
    bool _526 = _454 >= 0.0;
    bool _528 = isnan(_454);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _538 = _522;
    float _540 = _512;
    if (!_458)
    {
        int _542 = ~_494;
        int _544 = _542 + 1;
        _538 = _544;
    }
    int _546 = _538;
    float _548 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[88].z, _496);
    int _550 = abs(as_type<int>(_512));
    float _552 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[88].w, _516);
    bool _554 = _484 > 0.0;
    float _556 = fma(_502, _440, _412);
    float _558 = _502;
    float _560 = as_type<float>(_546);
    if (!_434)
    {
        _558 = _408;
    }
    float _562 = _558;
    float _564 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _566 = log2(_564);
    float _568 = _562;
    if (_434)
    {
        _568 = _148;
    }
    float _570 = _568;
    float _572 = _408 + (-0.5);
    int _574 = _534 ? 0 : 1;
    float _576 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _524);
    float _578 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[83].z, _536);
    float _580 = float(_550);
    float _582 = _570 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _584 = float(_546);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _588 = _484 >= 0.0;
    bool _590 = isnan(_484);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _460);
    float _600 = _580 * _584;
    int _602 = ~_574;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = -_586;
    float _610 = fma(_582, 2.0, _608);
    int _612 = _606;
    if (!_504)
    {
        int _614 = ~_574;
        int _616 = _614 + 1;
        _612 = _616;
    }
    int _618 = _612;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _622 = _596 ? 0 : 1;
    float _624 = _600 * (-2.0);
    if (!_434)
    {
        _540 = _402;
    }
    float _626 = _540;
    float _628 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _548);
    float _630 = _626;
    if (_434)
    {
        _630 = _408;
    }
    float _632 = _630;
    float _634 = fma(_490, _624, _490);
    int _636 = ~_622;
    int _638 = _636 + 1;
    int _640 = _638 + 1;
    float _642 = fma(_556, _624, _556);
    int _644 = _640;
    float _646 = _632;
    if (!_554)
    {
        int _648 = ~_622;
        int _650 = _648 + 1;
        _644 = _650;
    }
    int _652 = _644;
    float _654 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[83].w, _620);
    float _656 = _566 * _126;
    if (_434)
    {
        _646 = _408;
    }
    float _658 = _646;
    float _660 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _578);
    float _662 = _658;
    if (!_434)
    {
        _662 = _148;
    }
    float _664 = _662;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_434)
    {
        _560 = _402;
    }
    float _668 = _560;
    float _670 = exp2(_656);
    float _672 = _668;
    if (_434)
    {
        _672 = _408;
    }
    float _674 = _672;
    float _676 = _664 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _678 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[78].z, _666);
    bool _680 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _682 = isnan(0.0);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _688 = _684 || _686;
    float _690 = _674 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _692 = fma(_676, -2.0, _450);
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _696 = -_126;
    float _698 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[76].x, _428);
    int _700 = abs(_446);
    float _702 = fma(_690, -2.0, _694);
    bool _704 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _706 = isnan(1.0);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _712 = _708 || _710;
    float _714 = in.m_53.x;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _718 = 1.0 + _716;
    float _720 = -_670;
    float _722 = _720 + 1.0;
    float _724 = float(_700);
    float _726 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _678);
    float _728 = 1.0 / _718;
    bool _730 = !_424;
    int _732 = _730 ? 0 : 1;
    float _734 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _552);
    float _736 = _688 ? _722 : 0.0;
    float _738 = -_126;
    float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[81].x, _610);
    float _742 = float(_618);
    float _744 = -_126;
    float _746 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[86].x, _508);
    int _748 = abs(_732);
    float _750 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _654);
    float _752 = in.m_53.z;
    float _754 = _724 * _742;
    float _756 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _702);
    float _758 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _692);
    float _760 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[196].y, _642);
    float _762 = _754 * (-2.0);
    float _764 = float(_652);
    if (_712)
    {
        float _766 = _736 * _728;
        _128 = _766;
    }
    float _768 = _128;
    float _770 = _148 + (-0.5);
    float _772 = float(_748);
    float _774 = fma(_762, _714, _714);
    float _776 = fma(_634, _768, _760);
    float _778 = _148 + _402;
    float _780 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].x, _774);
    float _782 = _776 * 0.15915493667125701904296875;
    float _784 = fma(_514, _762, _514);
    float _786 = _772 * _764;
    float _788 = _778 + (-1.0);
    float _790 = in.m_51.x;
    float _792 = in.m_51.y;
    float _794 = in.m_51.z;
    float _796 = fma(_784, _768, _780);
    float _798 = _786 * (-2.0);
    float _800 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _802 = in.m_55.x;
    float _804 = in.m_55.y;
    float _806 = in.m_55.z;
    float _808 = _796 * 0.15915493667125701904296875;
    float _810 = _402 + (-0.5);
    float _812 = fma(_798, _752, _752);
    float _814 = fma(_800, _798, _800);
    float _816 = _782 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[196].z, _812);
    float _822 = fma(_814, _768, _820);
    float _824 = _782 * 6.283185482025146484375;
    float _826 = cos(_824);
    float _828 = _792 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _830 = _808 * 6.283185482025146484375;
    float _832 = sin(_830);
    float _834 = _822 * 0.15915493667125701904296875;
    float _836 = _790 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _802);
    float _840 = _794 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _804);
    float _844 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _806);
    float _848 = _808 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _836 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _854 = _840 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _856 = _844 * _842;
    float _858 = _852 * _838;
    float _860 = _854 * _846;
    float _862 = _834 * 6.283185482025146484375;
    float _864 = cos(_862);
    float _866 = _832 * _826;
    float _868 = _832 * _818;
    float _870 = _834 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = _850 * _818;
    float _876 = _850 * _826;
    float _878 = _864 * _856;
    float _880 = _826 * _864;
    float _882 = _818 * _864;
    float _884 = -_874;
    float _886 = fma(_872, _866, _884);
    float _888 = -_866;
    float _890 = fma(_872, _874, _888);
    float _892 = -_856;
    float _894 = _872 * _892;
    float _896 = _850 * _878;
    float _898 = fma(_872, _876, _868);
    float _900 = fma(_872, _868, _876);
    float _902 = _832 * _878;
    float _904 = fma(_880, _858, _894);
    float _906 = fma(_898, _858, _896);
    float _908 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _910 = fma(_886, _858, _902);
    float _912 = fma(_882, _860, _904);
    float _914 = fma(_890, _860, _906);
    float _916 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _918 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].x, _908);
    float _920 = fma(_900, _860, _910);
    float _922 = _914 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _924 = _914 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _926 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].x, _916);
    float _928 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].z, _918);
    float _930 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[10].x, _922);
    float _932 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[8].x, _924);
    float _934 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].z, _926);
    float _936 = _928 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _938 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[10].z, _930);
    float _940 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[8].z, _932);
    float _942 = _934 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _944 = _936 + _938;
    float _946 = _942 + _940;
    float _948 = _914 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _950 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _952 = _944 + _950;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _956 = _946 + _954;
    float _958 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[9].x, _948);
    float _960 = _952 * _952;
    float _962 = fma(_920, (*spvDescriptorSet0.vp_c10)._m0[9].z, _958);
    float _964 = fma(_956, _956, _960);
    float _966 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _968 = sqrt(_964);
    float _970 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].x, _966);
    float _972 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].z, _970);
    float _974 = _972 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _976 = _974 + _962;
    bool _978 = _968 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _980 = _958;
    float _982 = _966;
    float _984 = _912;
    float _986 = _864;
    if (!_978)
    {
        _980 = _946;
    }
    float _988 = _980;
    float _990 = _988;
    if (!_978)
    {
        _982 = _944;
    }
    float _992 = _982;
    float _994 = _992;
    if (!_978)
    {
        _984 = _976;
    }
    float _996 = _984;
    bool _998 = !_978;
    float _1000 = _996;
    if (!_998)
    {
        float _1002 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1006 = _968 + _1004;
        float _1008 = rsqrt(_964);
        float _1010 = _1006 * _1002;
        float _1012 = _976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1014 = _1010 * 0.15915493667125701904296875;
        float _1016 = _1014 * 6.283185482025146484375;
        float _1018 = cos(_1016);
        float _1020 = _1014 * 6.283185482025146484375;
        float _1022 = sin(_1020);
        float _1024 = _1018 + (-1.0);
        float _1026 = fma(_1022, _1012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1028 = _1024 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1030 = _1008 * _1026;
        float _1032 = fma(_976, _1018, _1028);
        float _1034 = fma(_956, _1030, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1036 = fma(_952, _1030, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1000 = _1032;
        _990 = _1034;
        _994 = _1036;
    }
    float _1038 = _1000;
    float _1040 = _990;
    float _1042 = _994;
    float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1046 = _1038 + _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1050 = _1040 + _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1054 = _1042 + _1052;
    float _1056 = _1046 * _1046;
    float _1058 = fma(_1050, _1050, _1056);
    float _1060 = fma(_1054, _1054, _1058);
    float _1062 = rsqrt(_1060);
    float _1064 = sqrt(_1060);
    float _1066 = _1062 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1068 = _1050 * _1066;
    float _1070 = _1054 * _1066;
    float _1072 = _1068 * _1068;
    float _1074 = _1070 * _1070;
    float _1076 = _1072 + _1074;
    float _1078 = sqrt(_1076);
    bool _1080 = _1078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1082 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1084 = _1078 + _1082;
    float _1086 = _1062;
    float _1088 = _1076;
    float _1090 = _1084;
    float _1092 = _1046;
    if (_1080)
    {
        float _1094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1086 = _1094;
    }
    float _1096 = _1086;
    if (_1080)
    {
        float _1098 = rsqrt(_1076);
        _1088 = _1098;
    }
    float _1100 = _1088;
    float _1102 = _1100;
    if (_1080)
    {
        float _1104 = _1084 * _1096;
        _1090 = _1104;
    }
    float _1106 = _1090;
    if (_1080)
    {
        float _1108 = _1106 * 0.15915493667125701904296875;
        _364 = _1108;
    }
    float _1110 = _364;
    float _1112 = _1054;
    float _1114 = _1110;
    if (_1080)
    {
        float _1116 = _1110 * 6.283185482025146484375;
        float _1118 = sin(_1116);
        _1112 = _1118;
    }
    float _1120 = _1112;
    float _1122 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1124 = precise::max(0.0, _1122);
    float _1126 = _1096;
    float _1128 = _1124;
    if (_1080)
    {
        float _1130 = _1110 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        _1126 = _1132;
    }
    float _1134 = _1126;
    float _1136 = -_1066;
    float _1138 = -_1124;
    float _1140 = fma(_1046, _1136, _1138);
    if (_1080)
    {
        float _1142 = _1140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1092 = _1142;
    }
    float _1144 = _1092;
    float _1146 = _1144;
    float _1148 = _1120;
    if (_1080)
    {
        float _1150 = fma(_1120, _1144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1146 = _1150;
    }
    float _1152 = _1146;
    float _1154 = _1152;
    if (!_1080)
    {
        _1148 = _1068;
    }
    float _1156 = _1148;
    float _1158 = _1156;
    float _1160 = _1134;
    if (_1080)
    {
        float _1162 = _1134 + (-1.0);
        _1128 = _1162;
    }
    float _1164 = _1128;
    float _1166 = _1164;
    if (_1080)
    {
        float _1168 = _1100 * _1152;
        _986 = _1168;
    }
    float _1170 = _986;
    if (!_1080)
    {
        _1154 = _1140;
    }
    float _1172 = _1154;
    float _1174 = _1172;
    if (_1080)
    {
        float _1176 = _1164 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1114 = _1176;
    }
    float _1178 = _1114;
    if (_1080)
    {
        float _1180 = _1068 * _1170;
        _1158 = _1180;
    }
    float _1182 = _1158;
    if (!_1080)
    {
        _1166 = _1070;
    }
    float _1184 = _1166;
    float _1186 = _1184;
    if (_1080)
    {
        float _1188 = _1070 * _1170;
        _1186 = _1188;
    }
    float _1190 = _1186;
    if (!_1080)
    {
        _1102 = _1072;
    }
    float _1192 = _1102;
    float _1194 = _1192;
    if (_1080)
    {
        float _1196 = fma(_1140, _1134, _1178);
        _1174 = _1196;
    }
    float _1198 = _1174;
    if (_1080)
    {
        float _1200 = _1182 * _1182;
        _1194 = _1200;
    }
    float _1202 = _1194;
    if (!_1080)
    {
        _1160 = _1074;
    }
    float _1204 = _1160;
    float _1206 = _1204;
    if (_1080)
    {
        float _1208 = _1190 * _1190;
        _1206 = _1208;
    }
    float _1210 = _1206;
    float _1212 = fma(_1198, _1198, _1202);
    float _1214 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1216 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1218 = _1212 + _1210;
    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1222 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1220);
    float _1224 = precise::clamp(_1222, 0.0, 1.0);
    float _1226 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1214);
    float _1228 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1230 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1232 = -_1224;
    float _1234 = _1232 + 1.0;
    float _1236 = rsqrt(_1218);
    float _1238 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1226);
    float _1240 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1228);
    float _1242 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1244 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1246 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1230);
    float _1248 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1240);
    float _1250 = abs(_1234);
    float _1252 = log2(_1250);
    float _1254 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1242);
    float _1256 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1246);
    float _1258 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1260 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1262 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1254);
    float _1264 = _1256 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1268 = _1236 * _1182;
    float _1270 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1272 = _1236 * _1198;
    float _1274 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1266);
    float _1276 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1278 = _1236 * _1190;
    float _1280 = -_1260;
    float _1282 = fma(_1280, _1216, 1.0);
    float _1284 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1274);
    float _1286 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1288 = -_1276;
    float _1290 = fma(_1272, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1288);
    float _1292 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1294 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1284);
    float _1296 = log2(_1282);
    float _1298 = -_1278;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1290);
    float _1302 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1304 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1292);
    float _1306 = fma(_1300, -0.5, 0.5);
    float _1308 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1302);
    float _1310 = fma(_1300, 0.5, 0.5);
    float _1312 = exp2(_1286);
    float _1314 = _1272 + 1.0;
    float _1316 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1308);
    float _1318 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1304);
    float _1320 = fma(_1310, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1322 = 1.0 / _1294;
    float _1324 = fma(_1310, _1320, -0.212114393711090087890625);
    float _1326 = _1296 * 0.693147182464599609375;
    float _1328 = fma(_1310, _1324, 1.570728778839111328125);
    float _1330 = _1326 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1332 = sqrt(_1306);
    float _1334 = -_1272;
    float _1336 = fma(_1312, _1314, _1334);
    float _1338 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1316);
    float _1340 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1318);
    float _1342 = fma(_1336, 0.5, 0.5);
    float _1344 = _1338 * _1322;
    float _1346 = _1340 * _1322;
    float _1348 = fma(_1344, 0.5, 0.5);
    float _1350 = fma(_1346, -0.5, 0.5);
    float _1352 = _1332 * 0.636619746685028076171875;
    float3 _4041 = float3(_1348, _1350, _1330);
    float _1354 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4041, float3(0.0), isnan(_4041)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4041, float3(0.0), isnan(_4041)), level(0.0)).x;
    float3 _4052 = float3(_1348, _1350, _1330);
    float4 _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4052, float3(0.0), isnan(_4052)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4052, float3(0.0), isnan(_4052)), level(0.0)).xyzw;
    float _1359 = _1357.x;
    float _1361 = _1357.y;
    float _1363 = _1357.z;
    float _1365 = _1357.w;
    float _1367 = -_1328;
    float _1369 = fma(_1352, _1367, 1.0);
    float2 _4074 = float2(_1369, _1342);
    float3 _1373 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4074, float2(0.0), isnan(_4074)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4074, float2(0.0), isnan(_4074)), level(0.0)).xyz;
    float _1375 = _1373.x;
    float _1377 = _1373.y;
    float _1379 = _1373.z;
    float _1381 = in.m_57.y;
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1385 = _398 + _1383;
    float _1387 = in.m_49.w;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1395 = _1393 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1397 = _408 > 0.5;
    float _1399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _1401 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1409 = _1407 != 0;
    float _1411 = 1.0 / _1391;
    bool _1413 = _402 > 0.5;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1417 = _1415 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1419 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1421 = -_1381;
    float _1423 = _1421 + 1.0;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1427 = _1425 != 0;
    float _1429 = 1.0 / _1395;
    int _1431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1433 = _1431 != 0;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1437 = _1435 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1439 = _1387 > 0.5;
    float _1441 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1443 = _1397 ? as_type<int>(_1423) : as_type<int>(_1381);
    float _1445 = fma(_1264, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1419);
    int _1447 = _1439 ? as_type<int>(_1423) : as_type<int>(_1381);
    float _1449 = 1.0 / _1405;
    float _1451 = _1409 ? as_type<float>(_1443) : _1381;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1459 = _1457 != 0;
    float _1461 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1445);
    int _1463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1465 = _1463 != 0;
    float _1467 = fma(_1441, _1451, -0.5);
    int _1469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1471 = _1469 != 0;
    float _1473 = 1.0 / _1417;
    float _1475 = -_598;
    float _1477 = fma(_576, _1467, _1475);
    float _1479 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1461);
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1483 = _1481 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1487 = _1485 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1491 = _1489 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1493 = 1.0 / _1437;
    float _1495 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1497 = _1465 ? as_type<float>(_1447) : _1381;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1501 = _1465;
    float _1503 = _1381;
    int _1505 = as_type<int>(_1467);
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[152].x;
    if (_1427)
    {
        bool _1509 = _148 > 0.5;
        _1501 = _1509;
    }
    bool _1511 = _1501;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1513;
    float _1517 = 1.0 / _1455;
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1519;
    out.m_61.w = _1499;
    float _1523 = _1515 * _1429;
    float _1525 = _1521 * _1411;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1529 = _1527 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1533 = _1531 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1535 = 1.0 / _1483;
    bool _1537 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1539 = isnan(_398);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1545 = _1541 || _1543;
    float _1547 = float(_1545);
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1551 = _1549 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1553 = _1533 * _1449;
    float _1555 = _1477 + 0.5;
    float _1557 = _1551 * _1473;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1559;
    float _1563 = 1.0 / _1487;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1569;
    float _1573 = _1561 * _1517;
    bool _1575 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1577 = isnan(_398);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1583 = _1579 || _1581;
    float _1585 = float(_1583);
    float _1587 = -_1547;
    float _1589 = _1587 + 1.0;
    if (_1471)
    {
        float _1591 = _1413 ? _1423 : _1381;
        _1503 = _1591;
    }
    float _1593 = _1503;
    float _1595 = _1495 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1597 = 1.0 / _1491;
    float _1599 = _1567 * _1535;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1603 = _398 + _1601;
    bool _1605 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1607 = isnan(_398);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1613 = _1609 || _1611;
    float _1615 = float(_1613);
    float _1617 = -_1585;
    float _1619 = _1617 + 1.0;
    bool _1621 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1623 = isnan(_398);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    float _1633 = fma(_1523, _1603, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1637 = _398 + _1635;
    float _1639 = _1571 * _1563;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1643 = _398 + _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1647 = _398 + _1645;
    float _1649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1651 = fma(_1639, _1637, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1653 = fma(_1553, _1643, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1655 = fma(_1573, _1647, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1657 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1659 = isnan(_398);
    bool _1661 = _1657 || _1659;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1665 = _1661 || _1663;
    float _1667 = float(_1665);
    float _1669 = _1529 * _1597;
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1671;
    bool _1675 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1677 = isnan(_398);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = _1585 * _1589;
    float _1689 = -_1667;
    float _1691 = _1689 + 1.0;
    float _1693 = _1673 * _1493;
    bool _1695 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1697 = isnan(_398);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1703 = _1699 || _1701;
    float _1705 = float(_1703);
    float _1707 = _1631 * _1619;
    float _1709 = -_1631;
    float _1711 = _1709 + 1.0;
    float _1713 = fma(_1693, _1385, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1717 = _398 + _1715;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1721 = _400 + _1719;
    float _1723 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1725 = in.m_57.x;
    float _1727 = fma(_1599, _1717, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1729 = _1685 * _1691;
    float _1731 = -_1685;
    float _1733 = _1731 + 1.0;
    float _1735 = _1705 * _1711;
    float _1737 = -_1705;
    float _1739 = _1737 + 1.0;
    float _1741 = fma(_1525, _1721, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1743 = _1615 * _1733;
    float _1745 = -_1615;
    float _1747 = _1745 + 1.0;
    float _1749 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1751 = _400 + _1749;
    bool _1753 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1755 = isnan(_400);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1761 = _1757 || _1759;
    float _1763 = float(_1761);
    float _1765 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1767 = _1547 * _1747;
    bool _1769 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1771 = isnan(_398);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1777 = _1773 || _1775;
    float _1779 = float(_1777);
    float _1781 = fma(_1669, _1751, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1783 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1785 = isnan(_400);
    bool _1787 = _1783 || _1785;
    bool _1789 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1791 = _1787 || _1789;
    float _1793 = float(_1791);
    float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1797 = _398 + _1795;
    bool _1799 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1801 = isnan(_400);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1807 = _1803 || _1805;
    float _1809 = float(_1807);
    float _1811 = _1779 * _1739;
    float _1813 = -_1779;
    float _1815 = _1813 + 1.0;
    float _1817 = fma(_1557, _1797, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1821 = _1633 * _1811;
    float _1823 = -_1809;
    float _1825 = _1823 + 1.0;
    float _1827 = fma(_1497, _1723, -0.5);
    int _1829 = as_type<int>(_1739);
    int _1831 = as_type<int>(_1723);
    float _1833 = _1725;
    if (_1427)
    {
        float _1835 = -_1725;
        float _1837 = _1835 + 1.0;
        _1505 = as_type<int>(_1837);
    }
    int _1839 = _1505;
    float _1841 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1821);
    float _1843 = _1793 * _1825;
    float _1845 = -_1793;
    float _1847 = _1845 + 1.0;
    float _1849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1851 = fma(_1653, _1735, _1841);
    float _1853 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1855 = _1763 * _1847;
    float _1857 = _1853;
    if (_1433)
    {
        float _1859 = -_1725;
        float _1861 = _1859 + 1.0;
        _1829 = as_type<int>(_1861);
    }
    int _1863 = _1829;
    float _1865 = fma(_1713, _1707, _1851);
    float _1867 = -_1763;
    float _1869 = _1867 + 1.0;
    float _1871 = _1741 * _1855;
    float _1873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_1459)
    {
        float _1875 = -_1725;
        float _1877 = _1875 + 1.0;
        _1831 = as_type<int>(_1877);
    }
    int _1879 = _1831;
    float _1881 = fma(_1817, _1687, _1865);
    float _1883 = fma(_1853, _1593, -0.5);
    if (!_1427)
    {
        _1507 = _1725;
    }
    float _1885 = _1507;
    float _1887 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1871);
    float _1889 = _1885;
    if (!_1433)
    {
        _1857 = _1725;
    }
    float _1891 = _1857;
    float _1893 = fma(_1655, _1767, _1881);
    float _1895 = exp2(_1401);
    float _1897 = _1891;
    if (_1427)
    {
        float _1899 = _1511 ? as_type<float>(_1839) : _1725;
        _1889 = _1899;
    }
    float _1901 = _1889;
    float _1903 = _1849 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1433)
    {
        float _1905 = _1413 ? as_type<float>(_1863) : _1725;
        _1897 = _1905;
    }
    float _1907 = _1897;
    float _1909 = _1819 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1459)
    {
        float _1911 = _1397 ? as_type<float>(_1879) : _1725;
        _1833 = _1911;
    }
    float _1913 = _1833;
    float _1915 = fma(_1727, _1743, _1893);
    float _1917 = fma(_1903, _1901, -0.5);
    float _1919 = _1873 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1921 = fma(_1909, _1907, -0.5);
    float _1923 = fma(_1651, _1729, _1915);
    float _1925 = fma(_726, _1917, _698);
    float _1927 = fma(_1919, _1913, -0.5);
    float _1929 = fma(_660, _1921, _740);
    float _1931 = -_758;
    float _1933 = fma(_734, _1883, _1931);
    float _1935 = fma(_628, _1927, _746);
    float _1937 = fma(_1781, _1843, _1887);
    float _1939 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1923);
    float _1941 = _1479 + _1294;
    float _1943 = -_1895;
    float _1945 = _1943 + 1.0;
    float _1947 = -_756;
    float _1949 = fma(_750, _1827, _1947);
    float _1951 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1937);
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1959 = _1925 + 0.5;
    float _1961 = _1941 * 0.5;
    float _1963 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1965 = _1953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1967 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1969 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1971 = _1951 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1973 = _1935 + 0.5;
    float _1975 = _1929 + 0.5;
    float _1977 = _1949 + 0.5;
    out.m_63.x = _1939;
    float _1979 = _1933 + 0.5;
    out.m_65.x = _1965;
    out.m_65.y = _1967;
    out.m_65.z = _1969;
    out.m_65.w = _1971;
    out.m_67.x = _1959;
    out.m_67.y = _1555;
    out.m_67.z = _1975;
    out.m_67.w = _1977;
    out.m_69.x = _1973;
    out.m_69.y = _1979;
    out.gl_Position.x = _1338;
    out.gl_Position.y = _1340;
    out.gl_Position.z = _1479;
    out.gl_Position.w = _1294;
    out.m_71.z = _1961;
    out.m_71.w = _1294;
    out.m_45.x = _1595;
    float _1981 = _1963 * _1354;
    float _1983 = -_1963;
    float _1985 = _1983 + 1.0;
    float _1987 = _1365 * _1981;
    float _1989 = _1365 * _1985;
    float _1991 = _1379 * _1981;
    float _1993 = fma(_1375, _1987, _1359);
    float _1995 = fma(_1377, _1987, _1361);
    float _1997 = fma(_1365, _1991, _1363);
    out.m_73.x = _1993;
    out.m_73.y = _1995;
    out.m_73.z = _1997;
    out.m_73.w = _1989;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

