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
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_24Smplr_w [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_91 [[user(locn13)]];
    float4 m_89 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_53 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1834 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_44.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_47.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2120 = as_type<float>(_130);
        out.gl_Position.z = _2120;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_49.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _122 = _152;
    }
    float _154 = _122;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_47.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2190 = as_type<float>(_168);
        out.gl_Position.z = _2190;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _170 = in.m_51.z;
    float _172 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _174 = log2(_172);
    float _176 = in.m_51.x;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _180 = _178 != 0;
    float _182 = in.m_51.y;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _194 = _192 != 0;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _202 = _170 * 2.0;
    float _204 = _176 * 2.0;
    float _206 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _208 = floor(_202);
    float _210 = _182 * 2.0;
    float _212 = -_196;
    float _214 = fma(_206, 2.0, _212);
    float _216 = _182 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _218 = _182 + _170;
    float _220 = -_148;
    float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[76].x, _214);
    float _224 = floor(_204);
    float _226 = fma(_216, -2.0, _198);
    float _228 = _218 + (-1.0);
    float _230 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _226);
    float _232 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _234 = _208 > 0.0;
    float _236 = floor(_210);
    bool _238 = _208 >= 0.0;
    bool _240 = isnan(_208);
    bool _242 = _238 || _240;
    bool _244 = isnan(0.0);
    bool _246 = _242 || _244;
    float _248 = _182 + _176;
    float _250 = _246 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _252 = _248 + (-1.0);
    bool _254 = _224 > 0.0;
    int _256 = ~as_type<int>(_250);
    int _258 = _256 + 1;
    int _260 = _258 + 1;
    float _262 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _264 = _252;
    int _266 = _260;
    float _268 = _250;
    float _270 = _176;
    if (_180)
    {
        _264 = _176;
    }
    float _272 = _264;
    bool _274 = _224 >= 0.0;
    bool _276 = isnan(_224);
    bool _278 = _274 || _276;
    bool _280 = isnan(0.0);
    bool _282 = _278 || _280;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _286 = _272;
    float _288 = _284;
    if (!_180)
    {
        _286 = _170;
    }
    float _290 = _286;
    if (!_234)
    {
        int _292 = ~as_type<int>(_250);
        int _294 = _292 + 1;
        _266 = _294;
    }
    int _296 = _266;
    if (!_180)
    {
        _268 = _182;
    }
    float _298 = _268;
    float _300 = _290 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _302 = _298;
    if (_180)
    {
        _302 = _176;
    }
    float _304 = _302;
    int _306 = _282 ? 0 : 1;
    bool _308 = _236 > 0.0;
    float _310 = _304 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _312 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[83].z, _284);
    int _314 = ~_306;
    int _316 = _314 + 1;
    int _318 = _316 + 1;
    float _320 = -_200;
    float _322 = fma(_300, 2.0, _320);
    bool _324 = _236 >= 0.0;
    bool _326 = isnan(_236);
    bool _328 = _324 || _326;
    bool _330 = isnan(0.0);
    bool _332 = _328 || _330;
    float _334 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _312);
    int _336 = _318;
    float _338 = _310;
    if (!_254)
    {
        int _340 = ~_306;
        int _342 = _340 + 1;
        _336 = _342;
    }
    int _344 = _336;
    float _346 = -_148;
    float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[86].x, _322);
    bool _350 = !_186;
    float _352 = _350 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _354 = _176 + (-0.5);
    bool _356 = !_190;
    int _358 = _356 ? 0 : 1;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _362 = abs(as_type<int>(_352));
    int _364 = abs(_358);
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _370 = _352;
    if (!_180)
    {
        _288 = _170;
    }
    float _372 = _288;
    float _374 = -_360;
    float _376 = fma(_310, 2.0, _374);
    float _378 = float(_362);
    float _380 = float(_296);
    float _382 = -_148;
    float _384 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[81].x, _376);
    float _386 = _372;
    if (_180)
    {
        _386 = _182;
    }
    float _388 = _386;
    if (_180)
    {
        _370 = _182;
    }
    float _390 = _370;
    float _392 = _388 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _394 = _390;
    if (!_180)
    {
        _338 = _170;
    }
    float _396 = _338;
    float _398 = _396;
    if (!_180)
    {
        _394 = _176;
    }
    float _400 = _394;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_180)
    {
        _398 = _182;
    }
    float _404 = _398;
    float _406 = float(_344);
    float _408 = _378 * _380;
    float _410 = float(_364);
    float _412 = _174 * _148;
    float _414 = _400 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _416 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[83].w, _368);
    float _418 = fma(_392, -2.0, _366);
    float _420 = _410 * _406;
    float _422 = fma(_414, -2.0, _402);
    float _424 = exp2(_412);
    float _426 = in.m_53.x;
    float _428 = in.m_53.y;
    float _430 = in.m_53.z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _440 = 1.0 + _438;
    float _442 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].z, _432);
    bool _444 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _446 = isnan(1.0);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _452 = _448 || _450;
    float _454 = 1.0 / _440;
    bool _456 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _464 = _460 || _462;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _468 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[78].w, _434);
    float _470 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[88].w, _436);
    float _472 = _408 * (-2.0);
    float _474 = -_424;
    float _476 = _474 + 1.0;
    float _478 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].z, _466);
    bool _480 = !_194;
    int _482 = _480 ? 0 : 1;
    float _484 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _442);
    float _486 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _468);
    float _488 = _464 ? _476 : 0.0;
    float _490 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _478);
    float _492 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _470);
    float _494 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _416);
    float _496 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _418);
    float _498 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _422);
    int _500 = as_type<int>(_486);
    if (_452)
    {
        float _502 = _488 * _454;
        _150 = _502;
    }
    float _504 = _150;
    int _506 = _332 ? 0 : 1;
    float _508 = fma(_472, _426, _426);
    int _510 = abs(_482);
    float _512 = fma(_262, _472, _262);
    int _514 = ~_506;
    int _516 = _514 + 1;
    int _518 = _516 + 1;
    float _520 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[196].x, _508);
    int _522 = _518;
    if (!_308)
    {
        int _524 = ~_506;
        int _526 = _524 + 1;
        _522 = _526;
    }
    int _528 = _522;
    float _530 = _420 * (-2.0);
    float _532 = fma(_512, _504, _520);
    float _534 = _182 + (-0.5);
    float _536 = fma(_530, _428, _428);
    float _538 = float(_510);
    float _540 = _532 * 0.15915493667125701904296875;
    float _542 = float(_528);
    float _544 = fma(_232, _530, _232);
    float _546 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[196].y, _536);
    float _548 = _176 + _170;
    float _550 = _538 * _542;
    float _552 = fma(_544, _504, _546);
    float _554 = in.m_55.x;
    float _556 = in.m_55.y;
    float _558 = in.m_55.z;
    float _560 = _548 + (-1.0);
    float _562 = _550 * (-2.0);
    float _564 = _552 * 0.15915493667125701904296875;
    float _566 = in.m_57.x;
    float _568 = in.m_57.y;
    float _570 = in.m_57.z;
    float _572 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _574 = fma(_562, _430, _430);
    float _576 = _170 + (-0.5);
    float _578 = _540 * 6.283185482025146484375;
    float _580 = cos(_578);
    float _582 = fma(_572, _562, _572);
    float _584 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[196].z, _574);
    float _586 = fma(_582, _504, _584);
    float _588 = _564 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = _586 * 0.15915493667125701904296875;
    float _594 = _564 * 6.283185482025146484375;
    float _596 = cos(_594);
    float _598 = _554 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _600 = _556 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _602 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _566);
    float _604 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _606 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _568);
    float _608 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _610 = _540 * 6.283185482025146484375;
    float _612 = sin(_610);
    float _614 = _602 * _604;
    float _616 = _580 * _590;
    float _618 = _606 * _608;
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _570);
    float _622 = _592 * 6.283185482025146484375;
    float _624 = cos(_622);
    float _626 = _558 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _628 = _580 * _596;
    float _630 = in.m_44.x;
    float _632 = in.m_44.y;
    float _634 = in.m_44.z;
    float _636 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _638 = _592 * 6.283185482025146484375;
    float _640 = sin(_638);
    float _642 = _612 * _590;
    float _644 = _612 * _596;
    float _646 = _620 * _636;
    float _648 = _580 * _624;
    float _650 = _612 * _624;
    float _652 = _596 * _624;
    float _654 = _590 * _624;
    float _656 = _648 * _618;
    float _658 = fma(_640, _628, _642);
    float _660 = fma(_640, _642, _628);
    float _662 = -_616;
    float _664 = fma(_640, _644, _662);
    float _666 = -_644;
    float _668 = fma(_640, _616, _666);
    float _670 = -_618;
    float _672 = _640 * _670;
    float _674 = fma(_658, _614, _656);
    float _676 = _650 * _618;
    float _678 = _632 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _680 = fma(_652, _614, _672);
    float _682 = fma(_668, _646, _674);
    float _684 = fma(_664, _614, _676);
    float _686 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[5].x, _678);
    float _688 = fma(_654, _646, _680);
    float _690 = _682 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _692 = fma(_660, _646, _684);
    float _694 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[5].z, _686);
    float _696 = _632 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _698 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[9].x, _690);
    float _700 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _702 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[6].x, _696);
    float _704 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[9].z, _698);
    float _706 = _632 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _708 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.310000002384185791015625);
    float _710 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.550000011920928955078125);
    float _712 = _700 + _704;
    float _714 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.2800000011920928955078125);
    float _716 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[6].z, _702);
    float _718 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[4].x, _706);
    float _720 = fma(_712, 0.3499999940395355224609375, _708);
    float _722 = fma(_712, 0.75, _710);
    float _724 = fma(_712, 0.4000000059604644775390625, _714);
    float _726 = _716 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _728 = _720 * 0.15915493667125701904296875;
    float _730 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.60000002384185791015625);
    float _732 = _722 * 0.15915493667125701904296875;
    float _734 = _724 * 0.15915493667125701904296875;
    float _736 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[4].z, _718);
    float _738 = fma(_712, 0.85000002384185791015625, _730);
    float _740 = _728 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _736 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _746 = _738 * 0.15915493667125701904296875;
    float _748 = _682 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _750 = _682 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _752 = _732 * 6.283185482025146484375;
    float _754 = sin(_752);
    float _756 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[10].x, _748);
    float _758 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[8].x, _750);
    float _760 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.17000000178813934326171875;
    float _762 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.300000011920928955078125;
    float _764 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[10].z, _756);
    float _766 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[8].z, _758);
    float _768 = _734 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = _726 + _764;
    float _774 = _744 + _766;
    float _776 = fma(_772, 0.550000011920928955078125, _760);
    float _778 = fma(_774, 0.89999997615814208984375, _762);
    float _780 = _746 * 6.283185482025146484375;
    float _782 = sin(_780);
    float _784 = _742 + _754;
    float _786 = _776 * 0.15915493667125701904296875;
    float _788 = _778 * 0.15915493667125701904296875;
    float _790 = fma(_784, 0.00999999977648258209228515625, _772);
    float _792 = _786 * 6.283185482025146484375;
    float _794 = sin(_792);
    float _796 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _798 = _790 + _796;
    float _800 = _798 * _798;
    float _802 = _770 + _782;
    float _804 = _788 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = fma(_802, 0.00999999977648258209228515625, _774);
    float _810 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _812 = _808 + _810;
    float _814 = _794 * 0.20999999344348907470703125;
    float _816 = fma(_812, _812, _800);
    float _818 = sqrt(_816);
    float _820 = fma(_806, 0.300000011920928955078125, _814);
    float _822 = _712 + _820;
    bool _824 = _818 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _826 = _716;
    float _828 = _808;
    float _830 = _790;
    int _832 = as_type<int>(_726);
    if (!_824)
    {
        _826 = _822;
    }
    float _834 = _826;
    bool _836 = !_824;
    float _838 = _834;
    if (!_836)
    {
        float _840 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _842 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _844 = _818 + _842;
        float _846 = rsqrt(_816);
        float _848 = _844 * _840;
        float _850 = _822 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = _848 * 0.15915493667125701904296875;
        float _854 = _852 * 6.283185482025146484375;
        float _856 = cos(_854);
        float _858 = _852 * 6.283185482025146484375;
        float _860 = sin(_858);
        float _862 = _856 + (-1.0);
        float _864 = _862 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _866 = fma(_860, _850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _868 = fma(_822, _856, _864);
        float _870 = _846 * _866;
        float _872 = fma(_812, _870, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _874 = fma(_798, _870, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _838 = _868;
        _828 = _872;
        _830 = _874;
    }
    float _876 = _838;
    float _878 = _828;
    float _880 = _830;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _884 = _876 + _882;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _888 = _878 + _886;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _892 = _880 + _890;
    float _894 = _884 * _884;
    float _896 = fma(_888, _888, _894);
    float _898 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _900 = fma(_892, _892, _896);
    float _902 = precise::max(0.0, _898);
    float _904 = rsqrt(_900);
    float _906 = sqrt(_900);
    float _908 = _904 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _910 = _888 * _908;
    float _912 = _892 * _908;
    float _914 = fma(_744, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _916 = -_908;
    float _918 = -_902;
    float _920 = fma(_884, _916, _918);
    float _922 = _910 * _910;
    float _924 = _912 * _912;
    float _926 = floor(_914);
    float _928 = _922 + _924;
    float _930 = sqrt(_928);
    bool _932 = _930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _934 = _902;
    float _936 = _884;
    float _938 = _922;
    float _940 = _910;
    float _942 = _912;
    if (!_932)
    {
        _934 = _922;
    }
    float _944 = _934;
    float _946 = _944;
    if (!_932)
    {
        _936 = _924;
    }
    float _948 = _936;
    float _950 = _948;
    if (!_932)
    {
        _938 = _920;
    }
    float _952 = _938;
    bool _954 = !_932;
    float _956 = _952;
    if (!_954)
    {
        float _958 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _960 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _962 = _930 + _960;
        float _964 = rsqrt(_928);
        float _966 = _962 * _958;
        float _968 = _920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _970 = _966 * 0.15915493667125701904296875;
        float _972 = _970 * 6.283185482025146484375;
        float _974 = sin(_972);
        float _976 = _970 * 6.283185482025146484375;
        float _978 = cos(_976);
        float _980 = fma(_974, _968, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _982 = _964 * _980;
        float _984 = _978 + (-1.0);
        float _986 = _910 * _982;
        float _988 = _912 * _982;
        float _990 = _984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _992 = _988 * _988;
        float _994 = fma(_920, _978, _990);
        float _996 = _986 * _986;
        _956 = _994;
        _946 = _996;
        _950 = _992;
        _940 = _986;
        _942 = _988;
    }
    float _998 = _956;
    float _1000 = _946;
    float _1002 = _950;
    float _1004 = _940;
    float _1006 = _942;
    float _1008 = fma(_998, _998, _1000);
    float _1010 = _876 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1012 = _876 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1014 = _1008 + _1002;
    float _1016 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1010);
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1020 = fma(_906, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1018);
    float _1022 = precise::clamp(_1020, 0.0, 1.0);
    float _1024 = rsqrt(_1014);
    float _1026 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1016);
    float _1028 = -_1022;
    float _1030 = _1028 + 1.0;
    float _1032 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1034 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1036 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1012);
    float _1038 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1040 = _876 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1042 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1044 = abs(_1030);
    float _1046 = log2(_1044);
    float _1048 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1040);
    float _1050 = -_1042;
    float _1052 = fma(_1038, _1050, 1.0);
    float _1054 = _876 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1056 = -_926;
    float _1058 = _914 + _1056;
    float _1060 = _1024 * _1004;
    float _1062 = _1024 * _998;
    float _1064 = _1024 * _1006;
    float _1066 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1054);
    float _1068 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1036);
    float _1070 = _1060 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1072 = floor(_1032);
    float _1074 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1066);
    float _1076 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1078 = -_1070;
    float _1080 = fma(_1062, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1078);
    float _1082 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1048);
    float _1084 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1086 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1088 = -_1064;
    float _1090 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1080);
    float _1092 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1094 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1096 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1086);
    float _1098 = fma(_1090, -0.5, 0.5);
    float _1100 = exp2(_1092);
    float _1102 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1104 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1096);
    float _1106 = -_1072;
    float _1108 = _1032 + _1106;
    float _1110 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1102);
    float _1112 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1104);
    float _1114 = fma(_1090, 0.5, 0.5);
    float _1116 = log2(_1052);
    float _1118 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1120 = _1062 + 1.0;
    float _1122 = fma(_1114, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1124 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1110);
    float _1126 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1118);
    float _1128 = fma(_1114, _1122, -0.212114393711090087890625);
    float _1130 = sqrt(_1098);
    float _1132 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1126);
    float _1134 = -_1062;
    float _1136 = fma(_1100, _1120, _1134);
    float _1138 = fma(_1114, _1128, 1.570728778839111328125);
    float _1140 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1124);
    float _1142 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1132);
    float2 _3765 = float2(_1058, _1108);
    float _1144 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3765, float2(0.0), isnan(_3765)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3765, float2(0.0), isnan(_3765)), level(0.0)).x;
    float _1146 = fma(_1136, 0.5, 0.5);
    float _1148 = 1.0 / _1112;
    float _1150 = _1116 * 0.693147182464599609375;
    float _1152 = _1130 * 0.636619746685028076171875;
    float _1154 = -_1138;
    float _1156 = fma(_1152, _1154, 1.0);
    float _1158 = _1140 * _1148;
    float _1160 = _1142 * _1148;
    float _1162 = _1150 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1164 = fma(_1158, 0.5, 0.5);
    float _1166 = fma(_1160, -0.5, 0.5);
    float3 _3805 = float3(_1164, _1166, _1162);
    float _1168 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3805, float3(0.0), isnan(_3805)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3805, float3(0.0), isnan(_3805)), level(0.0)).x;
    float2 _3815 = float2(_1156, _1146);
    float3 _1172 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3815, float2(0.0), isnan(_3815)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3815, float2(0.0), isnan(_3815)), level(0.0)).xyz;
    float _1174 = _1172.x;
    float _1176 = _1172.y;
    float _1178 = _1172.z;
    float _1180 = in.m_59.y;
    bool _1182 = _182 > 0.5;
    float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1186 = _170 > 0.5;
    float _1188 = in.m_51.w;
    float _1190 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1192 = in.m_61.w;
    float _1194 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1198 = in.m_61.z;
    float _1200 = in.m_61.x;
    float _1202 = in.m_61.y;
    float _1204 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1206 = -_1180;
    float _1208 = _1206 + 1.0;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1212 = _1210 != 0;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1218 = _1216 != 0;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1222 = _1188 > 0.5;
    float _1224 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1226 = _1182 ? as_type<int>(_1208) : as_type<int>(_1180);
    out.m_63.w = _1192;
    int _1228 = _1222 ? as_type<int>(_1208) : as_type<int>(_1180);
    float _1230 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1232 = _1212 ? as_type<float>(_1226) : _1180;
    out.m_63.z = _1198;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1236 = _1234 != 0;
    float _1238 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1194);
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1242 = _1240 != 0;
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_63.x = _1200;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1248 = _1246 != 0;
    float _1250 = _1112 * 0.5;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1254 = _1252 != 0;
    float _1256 = in.m_59.x;
    float _1258 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1238);
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_65.x = _1224;
    out.m_65.y = _1230;
    out.m_65.z = _1204;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1266 = _1248 ? as_type<float>(_1228) : _1180;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_63.y = _1202;
    float _1270 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1272 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1274 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1276 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1278 = _1180;
    bool _1280 = _1248;
    float _1282 = _1208;
    int _1284 = as_type<int>(_1272);
    float _1286 = _1140;
    if (_1254)
    {
        float _1288 = _1186 ? _1208 : _1180;
        _1278 = _1288;
    }
    float _1290 = _1278;
    float _1292 = _1140 + _1112;
    float _1294 = _700 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1296 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_67.x = _1270;
    out.m_67.y = _1272;
    out.m_67.z = _1274;
    float _1298 = fma(_1266, _1276, -0.5);
    float _1300 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1294);
    float _1302 = fma(_1296, _1232, -0.5);
    float _1304 = _700 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_1218)
    {
        bool _1306 = _176 > 0.5;
        _1280 = _1306;
    }
    bool _1308 = _1280;
    float _1310 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1300);
    float _1312 = _1256;
    if (!_1218)
    {
        _270 = _1256;
    }
    float _1314 = _270;
    float _1316 = -_230;
    float _1318 = fma(_486, _1302, _1316);
    float _1320 = _1314;
    if (_1236)
    {
        float _1322 = -_1256;
        float _1324 = _1322 + 1.0;
        _500 = as_type<int>(_1324);
    }
    int _1326 = _500;
    float _1328 = in.m_69.x;
    float _1330 = in.m_69.y;
    float _1332 = in.m_69.z;
    if (!_1236)
    {
        _1282 = _1256;
    }
    float _1334 = _1282;
    float _1336 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1338 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1340 = _1334;
    if (_1218)
    {
        float _1342 = -_1256;
        float _1344 = _1342 + 1.0;
        _1284 = as_type<int>(_1344);
    }
    int _1346 = _1284;
    float _1348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1350 = fma(_1336, _1290, -0.5);
    float _1352 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1304);
    if (_1236)
    {
        float _1354 = _1186 ? as_type<float>(_1326) : _1256;
        _1340 = _1354;
    }
    float _1356 = _1340;
    float _1358 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1258);
    if (_1218)
    {
        float _1360 = _1308 ? as_type<float>(_1346) : _1256;
        _1320 = _1360;
    }
    float _1362 = _1320;
    float _1364 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1352);
    float _1366 = 1.0 / _1338;
    bool _1368 = _568 != 0.0;
    bool _1370 = isnan(_568);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.0);
    bool _1376 = _1372 || _1374;
    float _1378 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1242)
    {
        float _1380 = -_1256;
        float _1382 = _1380 + 1.0;
        _832 = as_type<int>(_1382);
    }
    int _1384 = _832;
    float _1386 = _1292 * 0.5;
    bool _1388 = _566 == 0.0;
    bool _1390 = !_1376;
    bool _1392 = _1388 && _1390;
    float _1394 = _1378 + _1338;
    out.m_71.w = _1112;
    float _1396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1398 = _570 == 0.0;
    bool _1400 = _1398 && _1392;
    float _1402 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1404 = in.m_73.x;
    float _1406 = in.m_73.y;
    float _1408 = in.m_73.z;
    float _1410 = in.m_73.w;
    float _1412 = _1394;
    float _1414 = as_type<float>(_1384);
    float _1416 = _1386;
    if (_1242)
    {
        float _1418 = _1182 ? as_type<float>(_1384) : _1256;
        _1312 = _1418;
    }
    float _1420 = _1312;
    float _1422 = fma(_1402, _1362, -0.5);
    out.m_75.x = _878;
    out.m_75.y = _876;
    out.m_75.z = _880;
    float _1424 = _1394 * _1366;
    float _1426 = _1424 * 0.5;
    float _1428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    out.gl_Position.x = _1140;
    out.gl_Position.y = _1142;
    out.gl_Position.z = _1358;
    out.gl_Position.w = _1112;
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1432 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1430);
    if (_1400)
    {
        _1412 = _1328;
    }
    float _1434 = _1412;
    float _1436 = _1434;
    if (!_1400)
    {
        float _1438 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1328);
        _1436 = _1438;
    }
    float _1440 = _1436;
    float _1442 = fma(_484, _1422, _222);
    if (_1400)
    {
        _1414 = _1330;
    }
    float _1444 = _1414;
    float _1446 = 1.0 / _1432;
    float _1448 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1450 = _1396;
    float _1452 = _1444;
    if (_1400)
    {
        _1450 = _1332;
    }
    float _1454 = _1450;
    float _1456 = _1454;
    if (!_1400)
    {
        float _1458 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1330);
        _1452 = _1458;
    }
    float _1460 = _1452;
    if (!_1400)
    {
        float _1462 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1332);
        _1456 = _1462;
    }
    float _1464 = _1456;
    float _1466 = fma(_1448, _1356, -0.5);
    float _1468 = _1442 + 0.5;
    float _1470 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1472 = _906 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1474 = isnan(_906);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1480 = _1476 || _1478;
    float _1482 = _1408 * _1328;
    float _1484 = _1406 * _1332;
    float _1486 = fma(_1470, _1420, -0.5);
    float _1488 = fma(_334, _1466, _384);
    float _1490 = -_1482;
    float _1492 = fma(_1404, _1332, _1490);
    float _1494 = -_496;
    float _1496 = fma(_494, _1298, _1494);
    float _1498 = _1404 * _1330;
    float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1502 = _1446 * _1500;
    float _1504 = -_1484;
    float _1506 = fma(_1408, _1330, _1504);
    float _1508 = fma(_490, _1486, _348);
    float _1510 = -_1498;
    float _1512 = fma(_1406, _1328, _1510);
    float _1514 = abs(_1502);
    float _1516 = log2(_1514);
    float _1518 = -_498;
    float _1520 = fma(_492, _1350, _1518);
    float _1522 = _1318 + 0.5;
    float _1524 = _1488 + 0.5;
    float _1526 = _1496 + 0.5;
    float _1528 = _1492 * _1410;
    float _1530 = _1508 + 0.5;
    float _1532 = _1520 + 0.5;
    float _1534 = _1506 * _1410;
    float _1536 = _1512 * _1410;
    out.m_77.x = _1468;
    out.m_77.y = _1522;
    out.m_77.z = _1524;
    out.m_77.w = _1526;
    float _1538 = -_1460;
    float _1540 = _640 * _1538;
    float _1542 = -_1406;
    float _1544 = _640 * _1542;
    float _1546 = -_1528;
    float _1548 = _640 * _1546;
    out.m_79.x = _1530;
    out.m_79.y = _1532;
    float _1550 = fma(_652, _1440, _1540);
    float _1552 = _1516 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1554 = fma(_652, _1404, _1544);
    float _1556 = fma(_652, _1534, _1548);
    float _1558 = _648 * _1406;
    float _1560 = _650 * _1406;
    float _1562 = fma(_654, _1408, _1554);
    float _1564 = exp2(_1552);
    float _1566 = fma(_654, _1536, _1556);
    float _1568 = _648 * _1528;
    float _1570 = _648 * _1460;
    float _1572 = _650 * _1460;
    float _1574 = fma(_658, _1404, _1558);
    float _1576 = fma(_658, _1534, _1568);
    float _1578 = fma(_658, _1440, _1570);
    float _1580 = fma(_664, _1440, _1572);
    float _1582 = fma(_664, _1404, _1560);
    float _1584 = fma(_668, _1408, _1574);
    float _1586 = fma(_654, _1464, _1550);
    float _1588 = _650 * _1528;
    float _1590 = fma(_660, _1408, _1582);
    float _1592 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1594 = precise::clamp(_1592, 0.0, 1.0);
    float _1596 = fma(_668, _1464, _1578);
    float _1598 = fma(_660, _1464, _1580);
    float _1600 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1602 = fma(_1594, -2.0, 3.0);
    float _1604 = _1594 * _1594;
    float _1606 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1608 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1610 = fma(_668, _1536, _1576);
    float _1612 = _1604 * _1602;
    float _1614 = fma(_1562, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1600);
    float _1616 = fma(_1562, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1606);
    float _1618 = fma(_1562, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1608);
    float _1620 = fma(_664, _1534, _1588);
    float _1622 = _1610 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1624 = _1610 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1626 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1614);
    float _1628 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1616);
    float _1630 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1618);
    float _1632 = _1610 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1634 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1636 = fma(_660, _1536, _1620);
    float _1638 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1622);
    float _1640 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1642 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1624);
    float _1644 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1632);
    float _1646 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1648 = fma(_1636, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1638);
    float _1650 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1634);
    float _1652 = fma(_1636, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1642);
    float _1654 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1640);
    float _1656 = exp2(_1190);
    float _1658 = -_1612;
    float _1660 = _1658 + 1.0;
    float _1662 = in.m_81.x;
    bool _1664 = _1502 <= 8000.0;
    bool _1666 = isnan(_1502);
    bool _1668 = _1664 || _1666;
    bool _1670 = isnan(8000.0);
    bool _1672 = _1668 || _1670;
    float _1674 = float(_1672);
    float _1676 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1646);
    float _1678 = fma(_1660, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1612);
    out.m_83.x = _1626;
    out.m_83.y = _1628;
    out.m_83.z = _1630;
    float _1680 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1650);
    float _1682 = fma(_1636, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1644);
    float _1684 = _1674 * _1678;
    float _1686 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1654);
    out.m_71.x = _1386;
    if (!_1480)
    {
        _1286 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1688 = _1286;
    float _1690 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_85.x = _1648;
    out.m_85.y = _1652;
    out.m_85.z = _1682;
    float _1692 = -_1656;
    float _1694 = _1692 + 1.0;
    float _1696 = fma(_1142, -0.5, _1250);
    float _1698 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1676);
    float _1700 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1702 = _1688;
    float _1704 = _1688;
    if (!_1480)
    {
        _1416 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1706 = _1416;
    out.m_71.y = _1696;
    float _1708 = -_1700;
    float _1710 = _1708 + 1.0;
    out.m_87.x = _1680;
    out.m_87.y = _1686;
    out.m_87.z = _1698;
    float _1712 = -_1144;
    float _1714 = _1712 + 1.0;
    float _1716 = _1714 * _1690;
    float _1718 = precise::clamp(_1716, 0.0, 1.0);
    float _1720 = -_1718;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1724 = _1722 * _1662;
    float _1726 = _1700 * _1168;
    float _1728 = _1176 * _1726;
    float _1730 = _1174 * _1726;
    float _1732 = _1178 * _1726;
    float _1734 = _1724 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1736 = _1178;
    float _1738 = _1174;
    float _1740 = _1726;
    float _1742 = _1724;
    float _1744 = _1706;
    float _1746 = _1706;
    if (!_1480)
    {
        _1736 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1748 = _1736;
    float _1750 = _1748;
    float _1752 = _1748;
    if (!_1480)
    {
        _1738 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1754 = _1738;
    out.m_89.x = _1730;
    out.m_89.y = _1728;
    out.m_89.z = _1732;
    out.m_89.w = _1710;
    float _1756 = _1754;
    float _1758 = _1754;
    if (!_1480)
    {
        _1740 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1760 = _1740;
    float _1762 = _1760;
    float _1764 = _1760;
    if (!_1480)
    {
        _1742 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1766 = _1742;
    out.m_91.x = _1734;
    bool _1768 = !_1480;
    float _1770 = _1766;
    float _1772 = _1766;
    if (!_1768)
    {
        bool _1774 = _906 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1776 = isnan(_906);
        bool _1778 = _1774 || _1776;
        bool _1780 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1782 = _1778 || _1780;
        if (!_1782)
        {
            float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1786 = _906 + _1784;
            float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1790 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1788;
            float _1792 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1794 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1796 = 1.0 / _1790;
            float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1800 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1804 = _1802 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1808 = _1806 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1812 = _1810 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1814 = _1786 * _1796;
            float _1816 = precise::clamp(_1814, 0.0, 1.0);
            float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1820 = _1818 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1822 = fma(_1816, _1794, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1824 = fma(_1816, _1820, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1826 = fma(_1816, _1800, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1828 = fma(_1816, _1804, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1830 = fma(_1816, _1808, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1832 = fma(_1816, _1812, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1704 = _1822;
            _1746 = _1830;
            _1752 = _1826;
            _1764 = _1828;
            _1758 = _1824;
            _1772 = _1832;
            _1834 = true;
        }
        else
        {
            bool _1836 = _906 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1838 = isnan(_906);
            bool _1840 = _1836 || _1838;
            bool _1842 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1844 = _1840 || _1842;
            if (!_1844)
            {
                _1750 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1846 = _1750;
            _1752 = _1846;
            if (!_1844)
            {
                _1702 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1848 = _1702;
            _1704 = _1848;
            if (!_1844)
            {
                _1756 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1850 = _1756;
            _1758 = _1850;
            if (!_1844)
            {
                _1762 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1852 = _1762;
            _1764 = _1852;
            if (!_1844)
            {
                _1744 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1854 = _1744;
            _1746 = _1854;
            if (!_1844)
            {
                _1770 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1856 = _1770;
            bool _1858 = !_1844;
            _1772 = _1856;
            if (!_1858)
            {
                bool _1860 = _906 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1862 = isnan(_906);
                bool _1864 = _1860 || _1862;
                bool _1866 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1868 = _1864 || _1866;
                if (!_1868)
                {
                    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1872 = _906 + _1870;
                    float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1876 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1874;
                    float _1878 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1880 = _1878 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1882 = 1.0 / _1876;
                    float _1884 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1886 = _1884 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1890 = _1888 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1894 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1898 = _1896 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1900 = _1872 * _1882;
                    float _1902 = precise::clamp(_1900, 0.0, 1.0);
                    float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1906 = _1904 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1908 = fma(_1902, _1880, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1910 = fma(_1902, _1906, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1912 = fma(_1902, _1886, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1914 = fma(_1902, _1890, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1916 = fma(_1902, _1894, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1918 = fma(_1902, _1898, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1704 = _1908;
                    _1746 = _1916;
                    _1752 = _1912;
                    _1764 = _1914;
                    _1758 = _1910;
                    _1772 = _1918;
                    _1834 = true;
                }
                else
                {
                    _1704 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1746 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1752 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1764 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1758 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1772 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1834 = false;
    float _1920 = _1704;
    float _1922 = _1746;
    float _1924 = _1752;
    float _1926 = _1764;
    float _1928 = _1758;
    float _1930 = _1772;
    float _1932 = fma(_1686, -0.5, 0.5);
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = -_1920;
    float _1938 = _1936 + _1922;
    float _1940 = -_1924;
    float _1942 = _1940 + _1926;
    float _1944 = -_1928;
    float _1946 = _1944 + _1930;
    bool _1948 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1950 = fma(_1934, _1938, _1920);
    float _1952 = fma(_1934, _1942, _1924);
    float _1954 = fma(_1934, _1946, _1928);
    float _1956 = _1950 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _1958 = fma(_1952, 0.298911988735198974609375, _1956);
    float _1960 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1962 = fma(_1954, 0.114477999508380889892578125, _1958);
    out.m_91.w = _1960;
    float _1964 = -_1962;
    float _1966 = _1952 + _1964;
    float _1968 = -_1962;
    float _1970 = _1950 + _1968;
    float _1972 = -_1962;
    float _1974 = _1954 + _1972;
    out.m_93.x = 0.0;
    float _1976 = fma(_1966, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1962);
    float _1978 = fma(_1970, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1962);
    float _1980 = fma(_1974, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1962);
    out.m_95.x = _1976;
    out.m_95.y = _1978;
    out.m_95.z = _1980;
    if (!_1948)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1982 = -_876;
    float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1986 = -_878;
    float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1990 = -_880;
    float _1992 = _1990 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1994 = _1984 * _1984;
    float _1996 = fma(_1988, _1988, _1994);
    float _1998 = fma(_1992, _1992, _1996);
    float _2000 = sqrt(_1998);
    float _2002 = rsqrt(_1998);
    float _2004 = -_2000;
    float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2008 = _2006 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2010 = precise::clamp(_2008, 0.0, 1.0);
    float _2012 = _1988 * _2002;
    float _2014 = _1984 * _2002;
    float _2016 = abs(_2010);
    float _2018 = log2(_2016);
    float _2020 = _1992 * _2002;
    float _2022 = _2012 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2024 = _1686 * _2014;
    float _2026 = -_2014;
    float _2028 = -_2022;
    float _2030 = fma(_2026, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2028);
    float _2032 = fma(_1680, _2012, _2024);
    float _2034 = -_2020;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2030);
    float _2038 = fma(_1698, _2020, _2032);
    float _2040 = precise::clamp(_2038, 0.0, 1.0);
    float _2042 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2044 = _2036 + _2042;
    float _2046 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2048 = _2044 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2050 = precise::clamp(_2048, 0.0, 1.0);
    float _2052 = exp2(_2046);
    float _2054 = _2052 * _2050;
    float _2056 = _2040 * _2054;
    float _2058 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2060 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2062 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2058;
    out.m_93.y = _2060;
    out.m_93.z = _2062;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1834 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_44.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_47.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2120 = as_type<float>(_130);
        out.gl_Position.z = _2120;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_49.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _122 = _152;
    }
    float _154 = _122;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_47.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2190 = as_type<float>(_168);
        out.gl_Position.z = _2190;
    }
    if (_160)
    {
        return out;
    }
    float _170 = in.m_51.z;
    float _172 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _174 = log2(_172);
    float _176 = in.m_51.x;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _180 = _178 != 0;
    float _182 = in.m_51.y;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _194 = _192 != 0;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _202 = _170 * 2.0;
    float _204 = _176 * 2.0;
    float _206 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _208 = floor(_202);
    float _210 = _182 * 2.0;
    float _212 = -_196;
    float _214 = fma(_206, 2.0, _212);
    float _216 = _182 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _218 = _182 + _170;
    float _220 = -_148;
    float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[76].x, _214);
    float _224 = floor(_204);
    float _226 = fma(_216, -2.0, _198);
    float _228 = _218 + (-1.0);
    float _230 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _226);
    float _232 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _234 = _208 > 0.0;
    float _236 = floor(_210);
    bool _238 = _208 >= 0.0;
    bool _240 = isnan(_208);
    bool _242 = _238 || _240;
    bool _244 = isnan(0.0);
    bool _246 = _242 || _244;
    float _248 = _182 + _176;
    float _250 = _246 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _252 = _248 + (-1.0);
    bool _254 = _224 > 0.0;
    int _256 = ~as_type<int>(_250);
    int _258 = _256 + 1;
    int _260 = _258 + 1;
    float _262 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _264 = _252;
    int _266 = _260;
    float _268 = _250;
    float _270 = _176;
    if (_180)
    {
        _264 = _176;
    }
    float _272 = _264;
    bool _274 = _224 >= 0.0;
    bool _276 = isnan(_224);
    bool _278 = _274 || _276;
    bool _280 = isnan(0.0);
    bool _282 = _278 || _280;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _286 = _272;
    float _288 = _284;
    if (!_180)
    {
        _286 = _170;
    }
    float _290 = _286;
    if (!_234)
    {
        int _292 = ~as_type<int>(_250);
        int _294 = _292 + 1;
        _266 = _294;
    }
    int _296 = _266;
    if (!_180)
    {
        _268 = _182;
    }
    float _298 = _268;
    float _300 = _290 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _302 = _298;
    if (_180)
    {
        _302 = _176;
    }
    float _304 = _302;
    int _306 = _282 ? 0 : 1;
    bool _308 = _236 > 0.0;
    float _310 = _304 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _312 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[83].z, _284);
    int _314 = ~_306;
    int _316 = _314 + 1;
    int _318 = _316 + 1;
    float _320 = -_200;
    float _322 = fma(_300, 2.0, _320);
    bool _324 = _236 >= 0.0;
    bool _326 = isnan(_236);
    bool _328 = _324 || _326;
    bool _330 = isnan(0.0);
    bool _332 = _328 || _330;
    float _334 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _312);
    int _336 = _318;
    float _338 = _310;
    if (!_254)
    {
        int _340 = ~_306;
        int _342 = _340 + 1;
        _336 = _342;
    }
    int _344 = _336;
    float _346 = -_148;
    float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[86].x, _322);
    bool _350 = !_186;
    float _352 = _350 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _354 = _176 + (-0.5);
    bool _356 = !_190;
    int _358 = _356 ? 0 : 1;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _362 = abs(as_type<int>(_352));
    int _364 = abs(_358);
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _370 = _352;
    if (!_180)
    {
        _288 = _170;
    }
    float _372 = _288;
    float _374 = -_360;
    float _376 = fma(_310, 2.0, _374);
    float _378 = float(_362);
    float _380 = float(_296);
    float _382 = -_148;
    float _384 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[81].x, _376);
    float _386 = _372;
    if (_180)
    {
        _386 = _182;
    }
    float _388 = _386;
    if (_180)
    {
        _370 = _182;
    }
    float _390 = _370;
    float _392 = _388 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _394 = _390;
    if (!_180)
    {
        _338 = _170;
    }
    float _396 = _338;
    float _398 = _396;
    if (!_180)
    {
        _394 = _176;
    }
    float _400 = _394;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_180)
    {
        _398 = _182;
    }
    float _404 = _398;
    float _406 = float(_344);
    float _408 = _378 * _380;
    float _410 = float(_364);
    float _412 = _174 * _148;
    float _414 = _400 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _416 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[83].w, _368);
    float _418 = fma(_392, -2.0, _366);
    float _420 = _410 * _406;
    float _422 = fma(_414, -2.0, _402);
    float _424 = exp2(_412);
    float _426 = in.m_53.x;
    float _428 = in.m_53.y;
    float _430 = in.m_53.z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _440 = 1.0 + _438;
    float _442 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].z, _432);
    bool _444 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _446 = isnan(1.0);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _452 = _448 || _450;
    float _454 = 1.0 / _440;
    bool _456 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _464 = _460 || _462;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _468 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[78].w, _434);
    float _470 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[88].w, _436);
    float _472 = _408 * (-2.0);
    float _474 = -_424;
    float _476 = _474 + 1.0;
    float _478 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].z, _466);
    bool _480 = !_194;
    int _482 = _480 ? 0 : 1;
    float _484 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _442);
    float _486 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _468);
    float _488 = _464 ? _476 : 0.0;
    float _490 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _478);
    float _492 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _470);
    float _494 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _416);
    float _496 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _418);
    float _498 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _422);
    int _500 = as_type<int>(_486);
    if (_452)
    {
        float _502 = _488 * _454;
        _150 = _502;
    }
    float _504 = _150;
    int _506 = _332 ? 0 : 1;
    float _508 = fma(_472, _426, _426);
    int _510 = abs(_482);
    float _512 = fma(_262, _472, _262);
    int _514 = ~_506;
    int _516 = _514 + 1;
    int _518 = _516 + 1;
    float _520 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[196].x, _508);
    int _522 = _518;
    if (!_308)
    {
        int _524 = ~_506;
        int _526 = _524 + 1;
        _522 = _526;
    }
    int _528 = _522;
    float _530 = _420 * (-2.0);
    float _532 = fma(_512, _504, _520);
    float _534 = _182 + (-0.5);
    float _536 = fma(_530, _428, _428);
    float _538 = float(_510);
    float _540 = _532 * 0.15915493667125701904296875;
    float _542 = float(_528);
    float _544 = fma(_232, _530, _232);
    float _546 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[196].y, _536);
    float _548 = _176 + _170;
    float _550 = _538 * _542;
    float _552 = fma(_544, _504, _546);
    float _554 = in.m_55.x;
    float _556 = in.m_55.y;
    float _558 = in.m_55.z;
    float _560 = _548 + (-1.0);
    float _562 = _550 * (-2.0);
    float _564 = _552 * 0.15915493667125701904296875;
    float _566 = in.m_57.x;
    float _568 = in.m_57.y;
    float _570 = in.m_57.z;
    float _572 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _574 = fma(_562, _430, _430);
    float _576 = _170 + (-0.5);
    float _578 = _540 * 6.283185482025146484375;
    float _580 = cos(_578);
    float _582 = fma(_572, _562, _572);
    float _584 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[196].z, _574);
    float _586 = fma(_582, _504, _584);
    float _588 = _564 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = _586 * 0.15915493667125701904296875;
    float _594 = _564 * 6.283185482025146484375;
    float _596 = cos(_594);
    float _598 = _554 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _600 = _556 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _602 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _566);
    float _604 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _606 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _568);
    float _608 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _610 = _540 * 6.283185482025146484375;
    float _612 = sin(_610);
    float _614 = _602 * _604;
    float _616 = _580 * _590;
    float _618 = _606 * _608;
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _570);
    float _622 = _592 * 6.283185482025146484375;
    float _624 = cos(_622);
    float _626 = _558 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _628 = _580 * _596;
    float _630 = in.m_44.x;
    float _632 = in.m_44.y;
    float _634 = in.m_44.z;
    float _636 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _638 = _592 * 6.283185482025146484375;
    float _640 = sin(_638);
    float _642 = _612 * _590;
    float _644 = _612 * _596;
    float _646 = _620 * _636;
    float _648 = _580 * _624;
    float _650 = _612 * _624;
    float _652 = _596 * _624;
    float _654 = _590 * _624;
    float _656 = _648 * _618;
    float _658 = fma(_640, _628, _642);
    float _660 = fma(_640, _642, _628);
    float _662 = -_616;
    float _664 = fma(_640, _644, _662);
    float _666 = -_644;
    float _668 = fma(_640, _616, _666);
    float _670 = -_618;
    float _672 = _640 * _670;
    float _674 = fma(_658, _614, _656);
    float _676 = _650 * _618;
    float _678 = _632 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _680 = fma(_652, _614, _672);
    float _682 = fma(_668, _646, _674);
    float _684 = fma(_664, _614, _676);
    float _686 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[5].x, _678);
    float _688 = fma(_654, _646, _680);
    float _690 = _682 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _692 = fma(_660, _646, _684);
    float _694 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[5].z, _686);
    float _696 = _632 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _698 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[9].x, _690);
    float _700 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _702 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[6].x, _696);
    float _704 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[9].z, _698);
    float _706 = _632 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _708 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.310000002384185791015625);
    float _710 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.550000011920928955078125);
    float _712 = _700 + _704;
    float _714 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.2800000011920928955078125);
    float _716 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[6].z, _702);
    float _718 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[4].x, _706);
    float _720 = fma(_712, 0.3499999940395355224609375, _708);
    float _722 = fma(_712, 0.75, _710);
    float _724 = fma(_712, 0.4000000059604644775390625, _714);
    float _726 = _716 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _728 = _720 * 0.15915493667125701904296875;
    float _730 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.60000002384185791015625);
    float _732 = _722 * 0.15915493667125701904296875;
    float _734 = _724 * 0.15915493667125701904296875;
    float _736 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[4].z, _718);
    float _738 = fma(_712, 0.85000002384185791015625, _730);
    float _740 = _728 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _736 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _746 = _738 * 0.15915493667125701904296875;
    float _748 = _682 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _750 = _682 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _752 = _732 * 6.283185482025146484375;
    float _754 = sin(_752);
    float _756 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[10].x, _748);
    float _758 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[8].x, _750);
    float _760 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.17000000178813934326171875;
    float _762 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.300000011920928955078125;
    float _764 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[10].z, _756);
    float _766 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[8].z, _758);
    float _768 = _734 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = _726 + _764;
    float _774 = _744 + _766;
    float _776 = fma(_772, 0.550000011920928955078125, _760);
    float _778 = fma(_774, 0.89999997615814208984375, _762);
    float _780 = _746 * 6.283185482025146484375;
    float _782 = sin(_780);
    float _784 = _742 + _754;
    float _786 = _776 * 0.15915493667125701904296875;
    float _788 = _778 * 0.15915493667125701904296875;
    float _790 = fma(_784, 0.00999999977648258209228515625, _772);
    float _792 = _786 * 6.283185482025146484375;
    float _794 = sin(_792);
    float _796 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _798 = _790 + _796;
    float _800 = _798 * _798;
    float _802 = _770 + _782;
    float _804 = _788 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = fma(_802, 0.00999999977648258209228515625, _774);
    float _810 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _812 = _808 + _810;
    float _814 = _794 * 0.20999999344348907470703125;
    float _816 = fma(_812, _812, _800);
    float _818 = sqrt(_816);
    float _820 = fma(_806, 0.300000011920928955078125, _814);
    float _822 = _712 + _820;
    bool _824 = _818 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _826 = _716;
    float _828 = _808;
    float _830 = _790;
    int _832 = as_type<int>(_726);
    if (!_824)
    {
        _826 = _822;
    }
    float _834 = _826;
    bool _836 = !_824;
    float _838 = _834;
    if (!_836)
    {
        float _840 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _842 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _844 = _818 + _842;
        float _846 = rsqrt(_816);
        float _848 = _844 * _840;
        float _850 = _822 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = _848 * 0.15915493667125701904296875;
        float _854 = _852 * 6.283185482025146484375;
        float _856 = cos(_854);
        float _858 = _852 * 6.283185482025146484375;
        float _860 = sin(_858);
        float _862 = _856 + (-1.0);
        float _864 = _862 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _866 = fma(_860, _850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _868 = fma(_822, _856, _864);
        float _870 = _846 * _866;
        float _872 = fma(_812, _870, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _874 = fma(_798, _870, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _838 = _868;
        _828 = _872;
        _830 = _874;
    }
    float _876 = _838;
    float _878 = _828;
    float _880 = _830;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _884 = _876 + _882;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _888 = _878 + _886;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _892 = _880 + _890;
    float _894 = _884 * _884;
    float _896 = fma(_888, _888, _894);
    float _898 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _900 = fma(_892, _892, _896);
    float _902 = precise::max(0.0, _898);
    float _904 = rsqrt(_900);
    float _906 = sqrt(_900);
    float _908 = _904 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _910 = _888 * _908;
    float _912 = _892 * _908;
    float _914 = fma(_744, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _916 = -_908;
    float _918 = -_902;
    float _920 = fma(_884, _916, _918);
    float _922 = _910 * _910;
    float _924 = _912 * _912;
    float _926 = floor(_914);
    float _928 = _922 + _924;
    float _930 = sqrt(_928);
    bool _932 = _930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _934 = _902;
    float _936 = _884;
    float _938 = _922;
    float _940 = _910;
    float _942 = _912;
    if (!_932)
    {
        _934 = _922;
    }
    float _944 = _934;
    float _946 = _944;
    if (!_932)
    {
        _936 = _924;
    }
    float _948 = _936;
    float _950 = _948;
    if (!_932)
    {
        _938 = _920;
    }
    float _952 = _938;
    bool _954 = !_932;
    float _956 = _952;
    if (!_954)
    {
        float _958 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _960 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _962 = _930 + _960;
        float _964 = rsqrt(_928);
        float _966 = _962 * _958;
        float _968 = _920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _970 = _966 * 0.15915493667125701904296875;
        float _972 = _970 * 6.283185482025146484375;
        float _974 = sin(_972);
        float _976 = _970 * 6.283185482025146484375;
        float _978 = cos(_976);
        float _980 = fma(_974, _968, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _982 = _964 * _980;
        float _984 = _978 + (-1.0);
        float _986 = _910 * _982;
        float _988 = _912 * _982;
        float _990 = _984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _992 = _988 * _988;
        float _994 = fma(_920, _978, _990);
        float _996 = _986 * _986;
        _956 = _994;
        _946 = _996;
        _950 = _992;
        _940 = _986;
        _942 = _988;
    }
    float _998 = _956;
    float _1000 = _946;
    float _1002 = _950;
    float _1004 = _940;
    float _1006 = _942;
    float _1008 = fma(_998, _998, _1000);
    float _1010 = _876 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1012 = _876 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1014 = _1008 + _1002;
    float _1016 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1010);
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1020 = fma(_906, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1018);
    float _1022 = precise::clamp(_1020, 0.0, 1.0);
    float _1024 = rsqrt(_1014);
    float _1026 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1016);
    float _1028 = -_1022;
    float _1030 = _1028 + 1.0;
    float _1032 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1034 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1036 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1012);
    float _1038 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1040 = _876 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1042 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1044 = abs(_1030);
    float _1046 = log2(_1044);
    float _1048 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1040);
    float _1050 = -_1042;
    float _1052 = fma(_1038, _1050, 1.0);
    float _1054 = _876 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1056 = -_926;
    float _1058 = _914 + _1056;
    float _1060 = _1024 * _1004;
    float _1062 = _1024 * _998;
    float _1064 = _1024 * _1006;
    float _1066 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1054);
    float _1068 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1036);
    float _1070 = _1060 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1072 = floor(_1032);
    float _1074 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1066);
    float _1076 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1078 = -_1070;
    float _1080 = fma(_1062, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1078);
    float _1082 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1048);
    float _1084 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1086 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1088 = -_1064;
    float _1090 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1080);
    float _1092 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1094 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1096 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1086);
    float _1098 = fma(_1090, -0.5, 0.5);
    float _1100 = exp2(_1092);
    float _1102 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1104 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1096);
    float _1106 = -_1072;
    float _1108 = _1032 + _1106;
    float _1110 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1102);
    float _1112 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1104);
    float _1114 = fma(_1090, 0.5, 0.5);
    float _1116 = log2(_1052);
    float _1118 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1120 = _1062 + 1.0;
    float _1122 = fma(_1114, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1124 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1110);
    float _1126 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1118);
    float _1128 = fma(_1114, _1122, -0.212114393711090087890625);
    float _1130 = sqrt(_1098);
    float _1132 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1126);
    float _1134 = -_1062;
    float _1136 = fma(_1100, _1120, _1134);
    float _1138 = fma(_1114, _1128, 1.570728778839111328125);
    float _1140 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1124);
    float _1142 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1132);
    float2 _3765 = float2(_1058, _1108);
    float _1144 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3765, float2(0.0), isnan(_3765)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3765, float2(0.0), isnan(_3765)), level(0.0)).x;
    float _1146 = fma(_1136, 0.5, 0.5);
    float _1148 = 1.0 / _1112;
    float _1150 = _1116 * 0.693147182464599609375;
    float _1152 = _1130 * 0.636619746685028076171875;
    float _1154 = -_1138;
    float _1156 = fma(_1152, _1154, 1.0);
    float _1158 = _1140 * _1148;
    float _1160 = _1142 * _1148;
    float _1162 = _1150 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1164 = fma(_1158, 0.5, 0.5);
    float _1166 = fma(_1160, -0.5, 0.5);
    float3 _3805 = float3(_1164, _1166, _1162);
    float _1168 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3805, float3(0.0), isnan(_3805)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3805, float3(0.0), isnan(_3805)), level(0.0)).x;
    float2 _3815 = float2(_1156, _1146);
    float3 _1172 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3815, float2(0.0), isnan(_3815)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3815, float2(0.0), isnan(_3815)), level(0.0)).xyz;
    float _1174 = _1172.x;
    float _1176 = _1172.y;
    float _1178 = _1172.z;
    float _1180 = in.m_59.y;
    bool _1182 = _182 > 0.5;
    float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1186 = _170 > 0.5;
    float _1188 = in.m_51.w;
    float _1190 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1192 = in.m_61.w;
    float _1194 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1198 = in.m_61.z;
    float _1200 = in.m_61.x;
    float _1202 = in.m_61.y;
    float _1204 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1206 = -_1180;
    float _1208 = _1206 + 1.0;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1212 = _1210 != 0;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1218 = _1216 != 0;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1222 = _1188 > 0.5;
    float _1224 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1226 = _1182 ? as_type<int>(_1208) : as_type<int>(_1180);
    out.m_63.w = _1192;
    int _1228 = _1222 ? as_type<int>(_1208) : as_type<int>(_1180);
    float _1230 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1232 = _1212 ? as_type<float>(_1226) : _1180;
    out.m_63.z = _1198;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1236 = _1234 != 0;
    float _1238 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1194);
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1242 = _1240 != 0;
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_63.x = _1200;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1248 = _1246 != 0;
    float _1250 = _1112 * 0.5;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1254 = _1252 != 0;
    float _1256 = in.m_59.x;
    float _1258 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1238);
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_65.x = _1224;
    out.m_65.y = _1230;
    out.m_65.z = _1204;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1266 = _1248 ? as_type<float>(_1228) : _1180;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_63.y = _1202;
    float _1270 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1272 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1274 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1276 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1278 = _1180;
    bool _1280 = _1248;
    float _1282 = _1208;
    int _1284 = as_type<int>(_1272);
    float _1286 = _1140;
    if (_1254)
    {
        float _1288 = _1186 ? _1208 : _1180;
        _1278 = _1288;
    }
    float _1290 = _1278;
    float _1292 = _1140 + _1112;
    float _1294 = _700 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1296 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_67.x = _1270;
    out.m_67.y = _1272;
    out.m_67.z = _1274;
    float _1298 = fma(_1266, _1276, -0.5);
    float _1300 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1294);
    float _1302 = fma(_1296, _1232, -0.5);
    float _1304 = _700 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_1218)
    {
        bool _1306 = _176 > 0.5;
        _1280 = _1306;
    }
    bool _1308 = _1280;
    float _1310 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1300);
    float _1312 = _1256;
    if (!_1218)
    {
        _270 = _1256;
    }
    float _1314 = _270;
    float _1316 = -_230;
    float _1318 = fma(_486, _1302, _1316);
    float _1320 = _1314;
    if (_1236)
    {
        float _1322 = -_1256;
        float _1324 = _1322 + 1.0;
        _500 = as_type<int>(_1324);
    }
    int _1326 = _500;
    float _1328 = in.m_69.x;
    float _1330 = in.m_69.y;
    float _1332 = in.m_69.z;
    if (!_1236)
    {
        _1282 = _1256;
    }
    float _1334 = _1282;
    float _1336 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1338 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1340 = _1334;
    if (_1218)
    {
        float _1342 = -_1256;
        float _1344 = _1342 + 1.0;
        _1284 = as_type<int>(_1344);
    }
    int _1346 = _1284;
    float _1348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1350 = fma(_1336, _1290, -0.5);
    float _1352 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1304);
    if (_1236)
    {
        float _1354 = _1186 ? as_type<float>(_1326) : _1256;
        _1340 = _1354;
    }
    float _1356 = _1340;
    float _1358 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1258);
    if (_1218)
    {
        float _1360 = _1308 ? as_type<float>(_1346) : _1256;
        _1320 = _1360;
    }
    float _1362 = _1320;
    float _1364 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1352);
    float _1366 = 1.0 / _1338;
    bool _1368 = _568 != 0.0;
    bool _1370 = isnan(_568);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.0);
    bool _1376 = _1372 || _1374;
    float _1378 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1242)
    {
        float _1380 = -_1256;
        float _1382 = _1380 + 1.0;
        _832 = as_type<int>(_1382);
    }
    int _1384 = _832;
    float _1386 = _1292 * 0.5;
    bool _1388 = _566 == 0.0;
    bool _1390 = !_1376;
    bool _1392 = _1388 && _1390;
    float _1394 = _1378 + _1338;
    out.m_71.w = _1112;
    float _1396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1398 = _570 == 0.0;
    bool _1400 = _1398 && _1392;
    float _1402 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1404 = in.m_73.x;
    float _1406 = in.m_73.y;
    float _1408 = in.m_73.z;
    float _1410 = in.m_73.w;
    float _1412 = _1394;
    float _1414 = as_type<float>(_1384);
    float _1416 = _1386;
    if (_1242)
    {
        float _1418 = _1182 ? as_type<float>(_1384) : _1256;
        _1312 = _1418;
    }
    float _1420 = _1312;
    float _1422 = fma(_1402, _1362, -0.5);
    out.m_75.x = _878;
    out.m_75.y = _876;
    out.m_75.z = _880;
    float _1424 = _1394 * _1366;
    float _1426 = _1424 * 0.5;
    float _1428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    out.gl_Position.x = _1140;
    out.gl_Position.y = _1142;
    out.gl_Position.z = _1358;
    out.gl_Position.w = _1112;
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1432 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1430);
    if (_1400)
    {
        _1412 = _1328;
    }
    float _1434 = _1412;
    float _1436 = _1434;
    if (!_1400)
    {
        float _1438 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1328);
        _1436 = _1438;
    }
    float _1440 = _1436;
    float _1442 = fma(_484, _1422, _222);
    if (_1400)
    {
        _1414 = _1330;
    }
    float _1444 = _1414;
    float _1446 = 1.0 / _1432;
    float _1448 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1450 = _1396;
    float _1452 = _1444;
    if (_1400)
    {
        _1450 = _1332;
    }
    float _1454 = _1450;
    float _1456 = _1454;
    if (!_1400)
    {
        float _1458 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1330);
        _1452 = _1458;
    }
    float _1460 = _1452;
    if (!_1400)
    {
        float _1462 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1332);
        _1456 = _1462;
    }
    float _1464 = _1456;
    float _1466 = fma(_1448, _1356, -0.5);
    float _1468 = _1442 + 0.5;
    float _1470 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1472 = _906 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1474 = isnan(_906);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1480 = _1476 || _1478;
    float _1482 = _1408 * _1328;
    float _1484 = _1406 * _1332;
    float _1486 = fma(_1470, _1420, -0.5);
    float _1488 = fma(_334, _1466, _384);
    float _1490 = -_1482;
    float _1492 = fma(_1404, _1332, _1490);
    float _1494 = -_496;
    float _1496 = fma(_494, _1298, _1494);
    float _1498 = _1404 * _1330;
    float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1502 = _1446 * _1500;
    float _1504 = -_1484;
    float _1506 = fma(_1408, _1330, _1504);
    float _1508 = fma(_490, _1486, _348);
    float _1510 = -_1498;
    float _1512 = fma(_1406, _1328, _1510);
    float _1514 = abs(_1502);
    float _1516 = log2(_1514);
    float _1518 = -_498;
    float _1520 = fma(_492, _1350, _1518);
    float _1522 = _1318 + 0.5;
    float _1524 = _1488 + 0.5;
    float _1526 = _1496 + 0.5;
    float _1528 = _1492 * _1410;
    float _1530 = _1508 + 0.5;
    float _1532 = _1520 + 0.5;
    float _1534 = _1506 * _1410;
    float _1536 = _1512 * _1410;
    out.m_77.x = _1468;
    out.m_77.y = _1522;
    out.m_77.z = _1524;
    out.m_77.w = _1526;
    float _1538 = -_1460;
    float _1540 = _640 * _1538;
    float _1542 = -_1406;
    float _1544 = _640 * _1542;
    float _1546 = -_1528;
    float _1548 = _640 * _1546;
    out.m_79.x = _1530;
    out.m_79.y = _1532;
    float _1550 = fma(_652, _1440, _1540);
    float _1552 = _1516 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1554 = fma(_652, _1404, _1544);
    float _1556 = fma(_652, _1534, _1548);
    float _1558 = _648 * _1406;
    float _1560 = _650 * _1406;
    float _1562 = fma(_654, _1408, _1554);
    float _1564 = exp2(_1552);
    float _1566 = fma(_654, _1536, _1556);
    float _1568 = _648 * _1528;
    float _1570 = _648 * _1460;
    float _1572 = _650 * _1460;
    float _1574 = fma(_658, _1404, _1558);
    float _1576 = fma(_658, _1534, _1568);
    float _1578 = fma(_658, _1440, _1570);
    float _1580 = fma(_664, _1440, _1572);
    float _1582 = fma(_664, _1404, _1560);
    float _1584 = fma(_668, _1408, _1574);
    float _1586 = fma(_654, _1464, _1550);
    float _1588 = _650 * _1528;
    float _1590 = fma(_660, _1408, _1582);
    float _1592 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1594 = precise::clamp(_1592, 0.0, 1.0);
    float _1596 = fma(_668, _1464, _1578);
    float _1598 = fma(_660, _1464, _1580);
    float _1600 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1602 = fma(_1594, -2.0, 3.0);
    float _1604 = _1594 * _1594;
    float _1606 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1608 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1610 = fma(_668, _1536, _1576);
    float _1612 = _1604 * _1602;
    float _1614 = fma(_1562, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1600);
    float _1616 = fma(_1562, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1606);
    float _1618 = fma(_1562, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1608);
    float _1620 = fma(_664, _1534, _1588);
    float _1622 = _1610 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1624 = _1610 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1626 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1614);
    float _1628 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1616);
    float _1630 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1618);
    float _1632 = _1610 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1634 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1636 = fma(_660, _1536, _1620);
    float _1638 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1622);
    float _1640 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1642 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1624);
    float _1644 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1632);
    float _1646 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1648 = fma(_1636, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1638);
    float _1650 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1634);
    float _1652 = fma(_1636, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1642);
    float _1654 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1640);
    float _1656 = exp2(_1190);
    float _1658 = -_1612;
    float _1660 = _1658 + 1.0;
    float _1662 = in.m_81.x;
    bool _1664 = _1502 <= 8000.0;
    bool _1666 = isnan(_1502);
    bool _1668 = _1664 || _1666;
    bool _1670 = isnan(8000.0);
    bool _1672 = _1668 || _1670;
    float _1674 = float(_1672);
    float _1676 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1646);
    float _1678 = fma(_1660, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1612);
    out.m_83.x = _1626;
    out.m_83.y = _1628;
    out.m_83.z = _1630;
    float _1680 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1650);
    float _1682 = fma(_1636, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1644);
    float _1684 = _1674 * _1678;
    float _1686 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1654);
    out.m_71.x = _1386;
    if (!_1480)
    {
        _1286 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1688 = _1286;
    float _1690 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_85.x = _1648;
    out.m_85.y = _1652;
    out.m_85.z = _1682;
    float _1692 = -_1656;
    float _1694 = _1692 + 1.0;
    float _1696 = fma(_1142, -0.5, _1250);
    float _1698 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1676);
    float _1700 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1702 = _1688;
    float _1704 = _1688;
    if (!_1480)
    {
        _1416 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1706 = _1416;
    out.m_71.y = _1696;
    float _1708 = -_1700;
    float _1710 = _1708 + 1.0;
    out.m_87.x = _1680;
    out.m_87.y = _1686;
    out.m_87.z = _1698;
    float _1712 = -_1144;
    float _1714 = _1712 + 1.0;
    float _1716 = _1714 * _1690;
    float _1718 = precise::clamp(_1716, 0.0, 1.0);
    float _1720 = -_1718;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1724 = _1722 * _1662;
    float _1726 = _1700 * _1168;
    float _1728 = _1176 * _1726;
    float _1730 = _1174 * _1726;
    float _1732 = _1178 * _1726;
    float _1734 = _1724 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1736 = _1178;
    float _1738 = _1174;
    float _1740 = _1726;
    float _1742 = _1724;
    float _1744 = _1706;
    float _1746 = _1706;
    if (!_1480)
    {
        _1736 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1748 = _1736;
    float _1750 = _1748;
    float _1752 = _1748;
    if (!_1480)
    {
        _1738 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1754 = _1738;
    out.m_89.x = _1730;
    out.m_89.y = _1728;
    out.m_89.z = _1732;
    out.m_89.w = _1710;
    float _1756 = _1754;
    float _1758 = _1754;
    if (!_1480)
    {
        _1740 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1760 = _1740;
    float _1762 = _1760;
    float _1764 = _1760;
    if (!_1480)
    {
        _1742 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1766 = _1742;
    out.m_91.x = _1734;
    bool _1768 = !_1480;
    float _1770 = _1766;
    float _1772 = _1766;
    if (!_1768)
    {
        bool _1774 = _906 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1776 = isnan(_906);
        bool _1778 = _1774 || _1776;
        bool _1780 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1782 = _1778 || _1780;
        if (!_1782)
        {
            float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1786 = _906 + _1784;
            float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1790 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1788;
            float _1792 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1794 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1796 = 1.0 / _1790;
            float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1800 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1804 = _1802 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1808 = _1806 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1812 = _1810 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1814 = _1786 * _1796;
            float _1816 = precise::clamp(_1814, 0.0, 1.0);
            float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1820 = _1818 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1822 = fma(_1816, _1794, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1824 = fma(_1816, _1820, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1826 = fma(_1816, _1800, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1828 = fma(_1816, _1804, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1830 = fma(_1816, _1808, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1832 = fma(_1816, _1812, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1704 = _1822;
            _1746 = _1830;
            _1752 = _1826;
            _1764 = _1828;
            _1758 = _1824;
            _1772 = _1832;
            _1834 = true;
        }
        else
        {
            bool _1836 = _906 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1838 = isnan(_906);
            bool _1840 = _1836 || _1838;
            bool _1842 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1844 = _1840 || _1842;
            if (!_1844)
            {
                _1750 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1846 = _1750;
            _1752 = _1846;
            if (!_1844)
            {
                _1702 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1848 = _1702;
            _1704 = _1848;
            if (!_1844)
            {
                _1756 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1850 = _1756;
            _1758 = _1850;
            if (!_1844)
            {
                _1762 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1852 = _1762;
            _1764 = _1852;
            if (!_1844)
            {
                _1744 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1854 = _1744;
            _1746 = _1854;
            if (!_1844)
            {
                _1770 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1856 = _1770;
            bool _1858 = !_1844;
            _1772 = _1856;
            if (!_1858)
            {
                bool _1860 = _906 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1862 = isnan(_906);
                bool _1864 = _1860 || _1862;
                bool _1866 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1868 = _1864 || _1866;
                if (!_1868)
                {
                    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1872 = _906 + _1870;
                    float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1876 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1874;
                    float _1878 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1880 = _1878 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1882 = 1.0 / _1876;
                    float _1884 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1886 = _1884 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1890 = _1888 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1894 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1898 = _1896 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1900 = _1872 * _1882;
                    float _1902 = precise::clamp(_1900, 0.0, 1.0);
                    float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1906 = _1904 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1908 = fma(_1902, _1880, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1910 = fma(_1902, _1906, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1912 = fma(_1902, _1886, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1914 = fma(_1902, _1890, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1916 = fma(_1902, _1894, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1918 = fma(_1902, _1898, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1704 = _1908;
                    _1746 = _1916;
                    _1752 = _1912;
                    _1764 = _1914;
                    _1758 = _1910;
                    _1772 = _1918;
                    _1834 = true;
                }
                else
                {
                    _1704 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1746 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1752 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1764 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1758 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1772 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1834 = false;
    float _1920 = _1704;
    float _1922 = _1746;
    float _1924 = _1752;
    float _1926 = _1764;
    float _1928 = _1758;
    float _1930 = _1772;
    float _1932 = fma(_1686, -0.5, 0.5);
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = -_1920;
    float _1938 = _1936 + _1922;
    float _1940 = -_1924;
    float _1942 = _1940 + _1926;
    float _1944 = -_1928;
    float _1946 = _1944 + _1930;
    bool _1948 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1950 = fma(_1934, _1938, _1920);
    float _1952 = fma(_1934, _1942, _1924);
    float _1954 = fma(_1934, _1946, _1928);
    float _1956 = _1950 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _1958 = fma(_1952, 0.298911988735198974609375, _1956);
    float _1960 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1962 = fma(_1954, 0.114477999508380889892578125, _1958);
    out.m_91.w = _1960;
    float _1964 = -_1962;
    float _1966 = _1952 + _1964;
    float _1968 = -_1962;
    float _1970 = _1950 + _1968;
    float _1972 = -_1962;
    float _1974 = _1954 + _1972;
    out.m_93.x = 0.0;
    float _1976 = fma(_1966, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1962);
    float _1978 = fma(_1970, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1962);
    float _1980 = fma(_1974, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1962);
    out.m_95.x = _1976;
    out.m_95.y = _1978;
    out.m_95.z = _1980;
    if (!_1948)
    {
        return out;
    }
    float _1982 = -_876;
    float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1986 = -_878;
    float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1990 = -_880;
    float _1992 = _1990 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1994 = _1984 * _1984;
    float _1996 = fma(_1988, _1988, _1994);
    float _1998 = fma(_1992, _1992, _1996);
    float _2000 = sqrt(_1998);
    float _2002 = rsqrt(_1998);
    float _2004 = -_2000;
    float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2008 = _2006 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2010 = precise::clamp(_2008, 0.0, 1.0);
    float _2012 = _1988 * _2002;
    float _2014 = _1984 * _2002;
    float _2016 = abs(_2010);
    float _2018 = log2(_2016);
    float _2020 = _1992 * _2002;
    float _2022 = _2012 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2024 = _1686 * _2014;
    float _2026 = -_2014;
    float _2028 = -_2022;
    float _2030 = fma(_2026, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2028);
    float _2032 = fma(_1680, _2012, _2024);
    float _2034 = -_2020;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2030);
    float _2038 = fma(_1698, _2020, _2032);
    float _2040 = precise::clamp(_2038, 0.0, 1.0);
    float _2042 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2044 = _2036 + _2042;
    float _2046 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2048 = _2044 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2050 = precise::clamp(_2048, 0.0, 1.0);
    float _2052 = exp2(_2046);
    float _2054 = _2052 * _2050;
    float _2056 = _2040 * _2054;
    float _2058 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2060 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2062 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2058;
    out.m_93.y = _2060;
    out.m_93.z = _2062;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1834 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_44.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_47.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2120 = as_type<float>(_130);
        out.gl_Position.z = _2120;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_49.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _122 = _152;
    }
    float _154 = _122;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    float _162 = _154;
    if (_160)
    {
        _162 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _162;
    if (_160)
    {
        out.m_47.x = 0.0;
    }
    if (_160)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2190 = as_type<float>(_168);
        out.gl_Position.z = _2190;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _170 = in.m_51.z;
    float _172 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _174 = log2(_172);
    float _176 = in.m_51.x;
    int _178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _180 = _178 != 0;
    float _182 = in.m_51.y;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _186 = _184 != 0;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _194 = _192 != 0;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _202 = _170 * 2.0;
    float _204 = _176 * 2.0;
    float _206 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _208 = floor(_202);
    float _210 = _182 * 2.0;
    float _212 = -_196;
    float _214 = fma(_206, 2.0, _212);
    float _216 = _182 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _218 = _182 + _170;
    float _220 = -_148;
    float _222 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[76].x, _214);
    float _224 = floor(_204);
    float _226 = fma(_216, -2.0, _198);
    float _228 = _218 + (-1.0);
    float _230 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[76].y, _226);
    float _232 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _234 = _208 > 0.0;
    float _236 = floor(_210);
    bool _238 = _208 >= 0.0;
    bool _240 = isnan(_208);
    bool _242 = _238 || _240;
    bool _244 = isnan(0.0);
    bool _246 = _242 || _244;
    float _248 = _182 + _176;
    float _250 = _246 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _252 = _248 + (-1.0);
    bool _254 = _224 > 0.0;
    int _256 = ~as_type<int>(_250);
    int _258 = _256 + 1;
    int _260 = _258 + 1;
    float _262 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _264 = _252;
    int _266 = _260;
    float _268 = _250;
    float _270 = _176;
    if (_180)
    {
        _264 = _176;
    }
    float _272 = _264;
    bool _274 = _224 >= 0.0;
    bool _276 = isnan(_224);
    bool _278 = _274 || _276;
    bool _280 = isnan(0.0);
    bool _282 = _278 || _280;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _286 = _272;
    float _288 = _284;
    if (!_180)
    {
        _286 = _170;
    }
    float _290 = _286;
    if (!_234)
    {
        int _292 = ~as_type<int>(_250);
        int _294 = _292 + 1;
        _266 = _294;
    }
    int _296 = _266;
    if (!_180)
    {
        _268 = _182;
    }
    float _298 = _268;
    float _300 = _290 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _302 = _298;
    if (_180)
    {
        _302 = _176;
    }
    float _304 = _302;
    int _306 = _282 ? 0 : 1;
    bool _308 = _236 > 0.0;
    float _310 = _304 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _312 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[83].z, _284);
    int _314 = ~_306;
    int _316 = _314 + 1;
    int _318 = _316 + 1;
    float _320 = -_200;
    float _322 = fma(_300, 2.0, _320);
    bool _324 = _236 >= 0.0;
    bool _326 = isnan(_236);
    bool _328 = _324 || _326;
    bool _330 = isnan(0.0);
    bool _332 = _328 || _330;
    float _334 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _312);
    int _336 = _318;
    float _338 = _310;
    if (!_254)
    {
        int _340 = ~_306;
        int _342 = _340 + 1;
        _336 = _342;
    }
    int _344 = _336;
    float _346 = -_148;
    float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[86].x, _322);
    bool _350 = !_186;
    float _352 = _350 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _354 = _176 + (-0.5);
    bool _356 = !_190;
    int _358 = _356 ? 0 : 1;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _362 = abs(as_type<int>(_352));
    int _364 = abs(_358);
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _370 = _352;
    if (!_180)
    {
        _288 = _170;
    }
    float _372 = _288;
    float _374 = -_360;
    float _376 = fma(_310, 2.0, _374);
    float _378 = float(_362);
    float _380 = float(_296);
    float _382 = -_148;
    float _384 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[81].x, _376);
    float _386 = _372;
    if (_180)
    {
        _386 = _182;
    }
    float _388 = _386;
    if (_180)
    {
        _370 = _182;
    }
    float _390 = _370;
    float _392 = _388 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _394 = _390;
    if (!_180)
    {
        _338 = _170;
    }
    float _396 = _338;
    float _398 = _396;
    if (!_180)
    {
        _394 = _176;
    }
    float _400 = _394;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_180)
    {
        _398 = _182;
    }
    float _404 = _398;
    float _406 = float(_344);
    float _408 = _378 * _380;
    float _410 = float(_364);
    float _412 = _174 * _148;
    float _414 = _400 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _416 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[83].w, _368);
    float _418 = fma(_392, -2.0, _366);
    float _420 = _410 * _406;
    float _422 = fma(_414, -2.0, _402);
    float _424 = exp2(_412);
    float _426 = in.m_53.x;
    float _428 = in.m_53.y;
    float _430 = in.m_53.z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _440 = 1.0 + _438;
    float _442 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].z, _432);
    bool _444 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _446 = isnan(1.0);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _452 = _448 || _450;
    float _454 = 1.0 / _440;
    bool _456 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _464 = _460 || _462;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _468 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[78].w, _434);
    float _470 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[88].w, _436);
    float _472 = _408 * (-2.0);
    float _474 = -_424;
    float _476 = _474 + 1.0;
    float _478 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[88].z, _466);
    bool _480 = !_194;
    int _482 = _480 ? 0 : 1;
    float _484 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].z, _442);
    float _486 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[77].w, _468);
    float _488 = _464 ? _476 : 0.0;
    float _490 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _478);
    float _492 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _470);
    float _494 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _416);
    float _496 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _418);
    float _498 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _422);
    int _500 = as_type<int>(_486);
    if (_452)
    {
        float _502 = _488 * _454;
        _150 = _502;
    }
    float _504 = _150;
    int _506 = _332 ? 0 : 1;
    float _508 = fma(_472, _426, _426);
    int _510 = abs(_482);
    float _512 = fma(_262, _472, _262);
    int _514 = ~_506;
    int _516 = _514 + 1;
    int _518 = _516 + 1;
    float _520 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[196].x, _508);
    int _522 = _518;
    if (!_308)
    {
        int _524 = ~_506;
        int _526 = _524 + 1;
        _522 = _526;
    }
    int _528 = _522;
    float _530 = _420 * (-2.0);
    float _532 = fma(_512, _504, _520);
    float _534 = _182 + (-0.5);
    float _536 = fma(_530, _428, _428);
    float _538 = float(_510);
    float _540 = _532 * 0.15915493667125701904296875;
    float _542 = float(_528);
    float _544 = fma(_232, _530, _232);
    float _546 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[196].y, _536);
    float _548 = _176 + _170;
    float _550 = _538 * _542;
    float _552 = fma(_544, _504, _546);
    float _554 = in.m_55.x;
    float _556 = in.m_55.y;
    float _558 = in.m_55.z;
    float _560 = _548 + (-1.0);
    float _562 = _550 * (-2.0);
    float _564 = _552 * 0.15915493667125701904296875;
    float _566 = in.m_57.x;
    float _568 = in.m_57.y;
    float _570 = in.m_57.z;
    float _572 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _574 = fma(_562, _430, _430);
    float _576 = _170 + (-0.5);
    float _578 = _540 * 6.283185482025146484375;
    float _580 = cos(_578);
    float _582 = fma(_572, _562, _572);
    float _584 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[196].z, _574);
    float _586 = fma(_582, _504, _584);
    float _588 = _564 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = _586 * 0.15915493667125701904296875;
    float _594 = _564 * 6.283185482025146484375;
    float _596 = cos(_594);
    float _598 = _554 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _600 = _556 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _602 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _566);
    float _604 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _606 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _568);
    float _608 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _610 = _540 * 6.283185482025146484375;
    float _612 = sin(_610);
    float _614 = _602 * _604;
    float _616 = _580 * _590;
    float _618 = _606 * _608;
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _570);
    float _622 = _592 * 6.283185482025146484375;
    float _624 = cos(_622);
    float _626 = _558 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _628 = _580 * _596;
    float _630 = in.m_44.x;
    float _632 = in.m_44.y;
    float _634 = in.m_44.z;
    float _636 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _638 = _592 * 6.283185482025146484375;
    float _640 = sin(_638);
    float _642 = _612 * _590;
    float _644 = _612 * _596;
    float _646 = _620 * _636;
    float _648 = _580 * _624;
    float _650 = _612 * _624;
    float _652 = _596 * _624;
    float _654 = _590 * _624;
    float _656 = _648 * _618;
    float _658 = fma(_640, _628, _642);
    float _660 = fma(_640, _642, _628);
    float _662 = -_616;
    float _664 = fma(_640, _644, _662);
    float _666 = -_644;
    float _668 = fma(_640, _616, _666);
    float _670 = -_618;
    float _672 = _640 * _670;
    float _674 = fma(_658, _614, _656);
    float _676 = _650 * _618;
    float _678 = _632 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _680 = fma(_652, _614, _672);
    float _682 = fma(_668, _646, _674);
    float _684 = fma(_664, _614, _676);
    float _686 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[5].x, _678);
    float _688 = fma(_654, _646, _680);
    float _690 = _682 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _692 = fma(_660, _646, _684);
    float _694 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[5].z, _686);
    float _696 = _632 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _698 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[9].x, _690);
    float _700 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _702 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[6].x, _696);
    float _704 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[9].z, _698);
    float _706 = _632 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _708 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.310000002384185791015625);
    float _710 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.550000011920928955078125);
    float _712 = _700 + _704;
    float _714 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.2800000011920928955078125);
    float _716 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[6].z, _702);
    float _718 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[4].x, _706);
    float _720 = fma(_712, 0.3499999940395355224609375, _708);
    float _722 = fma(_712, 0.75, _710);
    float _724 = fma(_712, 0.4000000059604644775390625, _714);
    float _726 = _716 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _728 = _720 * 0.15915493667125701904296875;
    float _730 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (-0.60000002384185791015625);
    float _732 = _722 * 0.15915493667125701904296875;
    float _734 = _724 * 0.15915493667125701904296875;
    float _736 = fma(_634, (*spvDescriptorSet0.vp_c10)._m0[4].z, _718);
    float _738 = fma(_712, 0.85000002384185791015625, _730);
    float _740 = _728 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _736 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _746 = _738 * 0.15915493667125701904296875;
    float _748 = _682 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _750 = _682 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _752 = _732 * 6.283185482025146484375;
    float _754 = sin(_752);
    float _756 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[10].x, _748);
    float _758 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[8].x, _750);
    float _760 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.17000000178813934326171875;
    float _762 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.300000011920928955078125;
    float _764 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[10].z, _756);
    float _766 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[8].z, _758);
    float _768 = _734 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = _726 + _764;
    float _774 = _744 + _766;
    float _776 = fma(_772, 0.550000011920928955078125, _760);
    float _778 = fma(_774, 0.89999997615814208984375, _762);
    float _780 = _746 * 6.283185482025146484375;
    float _782 = sin(_780);
    float _784 = _742 + _754;
    float _786 = _776 * 0.15915493667125701904296875;
    float _788 = _778 * 0.15915493667125701904296875;
    float _790 = fma(_784, 0.00999999977648258209228515625, _772);
    float _792 = _786 * 6.283185482025146484375;
    float _794 = sin(_792);
    float _796 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _798 = _790 + _796;
    float _800 = _798 * _798;
    float _802 = _770 + _782;
    float _804 = _788 * 6.283185482025146484375;
    float _806 = sin(_804);
    float _808 = fma(_802, 0.00999999977648258209228515625, _774);
    float _810 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _812 = _808 + _810;
    float _814 = _794 * 0.20999999344348907470703125;
    float _816 = fma(_812, _812, _800);
    float _818 = sqrt(_816);
    float _820 = fma(_806, 0.300000011920928955078125, _814);
    float _822 = _712 + _820;
    bool _824 = _818 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _826 = _716;
    float _828 = _808;
    float _830 = _790;
    int _832 = as_type<int>(_726);
    if (!_824)
    {
        _826 = _822;
    }
    float _834 = _826;
    bool _836 = !_824;
    float _838 = _834;
    if (!_836)
    {
        float _840 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _842 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _844 = _818 + _842;
        float _846 = rsqrt(_816);
        float _848 = _844 * _840;
        float _850 = _822 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = _848 * 0.15915493667125701904296875;
        float _854 = _852 * 6.283185482025146484375;
        float _856 = cos(_854);
        float _858 = _852 * 6.283185482025146484375;
        float _860 = sin(_858);
        float _862 = _856 + (-1.0);
        float _864 = _862 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _866 = fma(_860, _850, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _868 = fma(_822, _856, _864);
        float _870 = _846 * _866;
        float _872 = fma(_812, _870, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _874 = fma(_798, _870, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _838 = _868;
        _828 = _872;
        _830 = _874;
    }
    float _876 = _838;
    float _878 = _828;
    float _880 = _830;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _884 = _876 + _882;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _888 = _878 + _886;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _892 = _880 + _890;
    float _894 = _884 * _884;
    float _896 = fma(_888, _888, _894);
    float _898 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _900 = fma(_892, _892, _896);
    float _902 = precise::max(0.0, _898);
    float _904 = rsqrt(_900);
    float _906 = sqrt(_900);
    float _908 = _904 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _910 = _888 * _908;
    float _912 = _892 * _908;
    float _914 = fma(_744, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _916 = -_908;
    float _918 = -_902;
    float _920 = fma(_884, _916, _918);
    float _922 = _910 * _910;
    float _924 = _912 * _912;
    float _926 = floor(_914);
    float _928 = _922 + _924;
    float _930 = sqrt(_928);
    bool _932 = _930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _934 = _902;
    float _936 = _884;
    float _938 = _922;
    float _940 = _910;
    float _942 = _912;
    if (!_932)
    {
        _934 = _922;
    }
    float _944 = _934;
    float _946 = _944;
    if (!_932)
    {
        _936 = _924;
    }
    float _948 = _936;
    float _950 = _948;
    if (!_932)
    {
        _938 = _920;
    }
    float _952 = _938;
    bool _954 = !_932;
    float _956 = _952;
    if (!_954)
    {
        float _958 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _960 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _962 = _930 + _960;
        float _964 = rsqrt(_928);
        float _966 = _962 * _958;
        float _968 = _920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _970 = _966 * 0.15915493667125701904296875;
        float _972 = _970 * 6.283185482025146484375;
        float _974 = sin(_972);
        float _976 = _970 * 6.283185482025146484375;
        float _978 = cos(_976);
        float _980 = fma(_974, _968, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _982 = _964 * _980;
        float _984 = _978 + (-1.0);
        float _986 = _910 * _982;
        float _988 = _912 * _982;
        float _990 = _984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _992 = _988 * _988;
        float _994 = fma(_920, _978, _990);
        float _996 = _986 * _986;
        _956 = _994;
        _946 = _996;
        _950 = _992;
        _940 = _986;
        _942 = _988;
    }
    float _998 = _956;
    float _1000 = _946;
    float _1002 = _950;
    float _1004 = _940;
    float _1006 = _942;
    float _1008 = fma(_998, _998, _1000);
    float _1010 = _876 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1012 = _876 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1014 = _1008 + _1002;
    float _1016 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1010);
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1020 = fma(_906, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1018);
    float _1022 = precise::clamp(_1020, 0.0, 1.0);
    float _1024 = rsqrt(_1014);
    float _1026 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1016);
    float _1028 = -_1022;
    float _1030 = _1028 + 1.0;
    float _1032 = fma(_726, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1034 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1036 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1012);
    float _1038 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1040 = _876 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1042 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1044 = abs(_1030);
    float _1046 = log2(_1044);
    float _1048 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1040);
    float _1050 = -_1042;
    float _1052 = fma(_1038, _1050, 1.0);
    float _1054 = _876 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1056 = -_926;
    float _1058 = _914 + _1056;
    float _1060 = _1024 * _1004;
    float _1062 = _1024 * _998;
    float _1064 = _1024 * _1006;
    float _1066 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1054);
    float _1068 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1036);
    float _1070 = _1060 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1072 = floor(_1032);
    float _1074 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1066);
    float _1076 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1078 = -_1070;
    float _1080 = fma(_1062, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1078);
    float _1082 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1048);
    float _1084 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1086 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1088 = -_1064;
    float _1090 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1080);
    float _1092 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1094 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1096 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1086);
    float _1098 = fma(_1090, -0.5, 0.5);
    float _1100 = exp2(_1092);
    float _1102 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1104 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1096);
    float _1106 = -_1072;
    float _1108 = _1032 + _1106;
    float _1110 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1102);
    float _1112 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1104);
    float _1114 = fma(_1090, 0.5, 0.5);
    float _1116 = log2(_1052);
    float _1118 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1120 = _1062 + 1.0;
    float _1122 = fma(_1114, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1124 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1110);
    float _1126 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1118);
    float _1128 = fma(_1114, _1122, -0.212114393711090087890625);
    float _1130 = sqrt(_1098);
    float _1132 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1126);
    float _1134 = -_1062;
    float _1136 = fma(_1100, _1120, _1134);
    float _1138 = fma(_1114, _1128, 1.570728778839111328125);
    float _1140 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1124);
    float _1142 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1132);
    float2 _3765 = float2(_1058, _1108);
    float _1144 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3765, float2(0.0), isnan(_3765)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3765, float2(0.0), isnan(_3765)), level(0.0)).x;
    float _1146 = fma(_1136, 0.5, 0.5);
    float _1148 = 1.0 / _1112;
    float _1150 = _1116 * 0.693147182464599609375;
    float _1152 = _1130 * 0.636619746685028076171875;
    float _1154 = -_1138;
    float _1156 = fma(_1152, _1154, 1.0);
    float _1158 = _1140 * _1148;
    float _1160 = _1142 * _1148;
    float _1162 = _1150 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1164 = fma(_1158, 0.5, 0.5);
    float _1166 = fma(_1160, -0.5, 0.5);
    float3 _3805 = float3(_1164, _1166, _1162);
    float _1168 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3805, float3(0.0), isnan(_3805)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3805, float3(0.0), isnan(_3805)), level(0.0)).x;
    float2 _3815 = float2(_1156, _1146);
    float3 _1172 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3815, float2(0.0), isnan(_3815)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3815, float2(0.0), isnan(_3815)), level(0.0)).xyz;
    float _1174 = _1172.x;
    float _1176 = _1172.y;
    float _1178 = _1172.z;
    float _1180 = in.m_59.y;
    bool _1182 = _182 > 0.5;
    float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1186 = _170 > 0.5;
    float _1188 = in.m_51.w;
    float _1190 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1192 = in.m_61.w;
    float _1194 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1198 = in.m_61.z;
    float _1200 = in.m_61.x;
    float _1202 = in.m_61.y;
    float _1204 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1206 = -_1180;
    float _1208 = _1206 + 1.0;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1212 = _1210 != 0;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1218 = _1216 != 0;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1222 = _1188 > 0.5;
    float _1224 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1226 = _1182 ? as_type<int>(_1208) : as_type<int>(_1180);
    out.m_63.w = _1192;
    int _1228 = _1222 ? as_type<int>(_1208) : as_type<int>(_1180);
    float _1230 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1232 = _1212 ? as_type<float>(_1226) : _1180;
    out.m_63.z = _1198;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1236 = _1234 != 0;
    float _1238 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1194);
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1242 = _1240 != 0;
    float _1244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_63.x = _1200;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1248 = _1246 != 0;
    float _1250 = _1112 * 0.5;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1254 = _1252 != 0;
    float _1256 = in.m_59.x;
    float _1258 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1238);
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_65.x = _1224;
    out.m_65.y = _1230;
    out.m_65.z = _1204;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1266 = _1248 ? as_type<float>(_1228) : _1180;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_63.y = _1202;
    float _1270 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1272 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1274 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1276 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1278 = _1180;
    bool _1280 = _1248;
    float _1282 = _1208;
    int _1284 = as_type<int>(_1272);
    float _1286 = _1140;
    if (_1254)
    {
        float _1288 = _1186 ? _1208 : _1180;
        _1278 = _1288;
    }
    float _1290 = _1278;
    float _1292 = _1140 + _1112;
    float _1294 = _700 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1296 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_67.x = _1270;
    out.m_67.y = _1272;
    out.m_67.z = _1274;
    float _1298 = fma(_1266, _1276, -0.5);
    float _1300 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1294);
    float _1302 = fma(_1296, _1232, -0.5);
    float _1304 = _700 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_1218)
    {
        bool _1306 = _176 > 0.5;
        _1280 = _1306;
    }
    bool _1308 = _1280;
    float _1310 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1300);
    float _1312 = _1256;
    if (!_1218)
    {
        _270 = _1256;
    }
    float _1314 = _270;
    float _1316 = -_230;
    float _1318 = fma(_486, _1302, _1316);
    float _1320 = _1314;
    if (_1236)
    {
        float _1322 = -_1256;
        float _1324 = _1322 + 1.0;
        _500 = as_type<int>(_1324);
    }
    int _1326 = _500;
    float _1328 = in.m_69.x;
    float _1330 = in.m_69.y;
    float _1332 = in.m_69.z;
    if (!_1236)
    {
        _1282 = _1256;
    }
    float _1334 = _1282;
    float _1336 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1338 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1340 = _1334;
    if (_1218)
    {
        float _1342 = -_1256;
        float _1344 = _1342 + 1.0;
        _1284 = as_type<int>(_1344);
    }
    int _1346 = _1284;
    float _1348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1350 = fma(_1336, _1290, -0.5);
    float _1352 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1304);
    if (_1236)
    {
        float _1354 = _1186 ? as_type<float>(_1326) : _1256;
        _1340 = _1354;
    }
    float _1356 = _1340;
    float _1358 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1258);
    if (_1218)
    {
        float _1360 = _1308 ? as_type<float>(_1346) : _1256;
        _1320 = _1360;
    }
    float _1362 = _1320;
    float _1364 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1352);
    float _1366 = 1.0 / _1338;
    bool _1368 = _568 != 0.0;
    bool _1370 = isnan(_568);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.0);
    bool _1376 = _1372 || _1374;
    float _1378 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1242)
    {
        float _1380 = -_1256;
        float _1382 = _1380 + 1.0;
        _832 = as_type<int>(_1382);
    }
    int _1384 = _832;
    float _1386 = _1292 * 0.5;
    bool _1388 = _566 == 0.0;
    bool _1390 = !_1376;
    bool _1392 = _1388 && _1390;
    float _1394 = _1378 + _1338;
    out.m_71.w = _1112;
    float _1396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1398 = _570 == 0.0;
    bool _1400 = _1398 && _1392;
    float _1402 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1404 = in.m_73.x;
    float _1406 = in.m_73.y;
    float _1408 = in.m_73.z;
    float _1410 = in.m_73.w;
    float _1412 = _1394;
    float _1414 = as_type<float>(_1384);
    float _1416 = _1386;
    if (_1242)
    {
        float _1418 = _1182 ? as_type<float>(_1384) : _1256;
        _1312 = _1418;
    }
    float _1420 = _1312;
    float _1422 = fma(_1402, _1362, -0.5);
    out.m_75.x = _878;
    out.m_75.y = _876;
    out.m_75.z = _880;
    float _1424 = _1394 * _1366;
    float _1426 = _1424 * 0.5;
    float _1428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    out.gl_Position.x = _1140;
    out.gl_Position.y = _1142;
    out.gl_Position.z = _1358;
    out.gl_Position.w = _1112;
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1432 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1430);
    if (_1400)
    {
        _1412 = _1328;
    }
    float _1434 = _1412;
    float _1436 = _1434;
    if (!_1400)
    {
        float _1438 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1328);
        _1436 = _1438;
    }
    float _1440 = _1436;
    float _1442 = fma(_484, _1422, _222);
    if (_1400)
    {
        _1414 = _1330;
    }
    float _1444 = _1414;
    float _1446 = 1.0 / _1432;
    float _1448 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1450 = _1396;
    float _1452 = _1444;
    if (_1400)
    {
        _1450 = _1332;
    }
    float _1454 = _1450;
    float _1456 = _1454;
    if (!_1400)
    {
        float _1458 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1330);
        _1452 = _1458;
    }
    float _1460 = _1452;
    if (!_1400)
    {
        float _1462 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1332);
        _1456 = _1462;
    }
    float _1464 = _1456;
    float _1466 = fma(_1448, _1356, -0.5);
    float _1468 = _1442 + 0.5;
    float _1470 = _1428 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _1472 = _906 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1474 = isnan(_906);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1480 = _1476 || _1478;
    float _1482 = _1408 * _1328;
    float _1484 = _1406 * _1332;
    float _1486 = fma(_1470, _1420, -0.5);
    float _1488 = fma(_334, _1466, _384);
    float _1490 = -_1482;
    float _1492 = fma(_1404, _1332, _1490);
    float _1494 = -_496;
    float _1496 = fma(_494, _1298, _1494);
    float _1498 = _1404 * _1330;
    float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1502 = _1446 * _1500;
    float _1504 = -_1484;
    float _1506 = fma(_1408, _1330, _1504);
    float _1508 = fma(_490, _1486, _348);
    float _1510 = -_1498;
    float _1512 = fma(_1406, _1328, _1510);
    float _1514 = abs(_1502);
    float _1516 = log2(_1514);
    float _1518 = -_498;
    float _1520 = fma(_492, _1350, _1518);
    float _1522 = _1318 + 0.5;
    float _1524 = _1488 + 0.5;
    float _1526 = _1496 + 0.5;
    float _1528 = _1492 * _1410;
    float _1530 = _1508 + 0.5;
    float _1532 = _1520 + 0.5;
    float _1534 = _1506 * _1410;
    float _1536 = _1512 * _1410;
    out.m_77.x = _1468;
    out.m_77.y = _1522;
    out.m_77.z = _1524;
    out.m_77.w = _1526;
    float _1538 = -_1460;
    float _1540 = _640 * _1538;
    float _1542 = -_1406;
    float _1544 = _640 * _1542;
    float _1546 = -_1528;
    float _1548 = _640 * _1546;
    out.m_79.x = _1530;
    out.m_79.y = _1532;
    float _1550 = fma(_652, _1440, _1540);
    float _1552 = _1516 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1554 = fma(_652, _1404, _1544);
    float _1556 = fma(_652, _1534, _1548);
    float _1558 = _648 * _1406;
    float _1560 = _650 * _1406;
    float _1562 = fma(_654, _1408, _1554);
    float _1564 = exp2(_1552);
    float _1566 = fma(_654, _1536, _1556);
    float _1568 = _648 * _1528;
    float _1570 = _648 * _1460;
    float _1572 = _650 * _1460;
    float _1574 = fma(_658, _1404, _1558);
    float _1576 = fma(_658, _1534, _1568);
    float _1578 = fma(_658, _1440, _1570);
    float _1580 = fma(_664, _1440, _1572);
    float _1582 = fma(_664, _1404, _1560);
    float _1584 = fma(_668, _1408, _1574);
    float _1586 = fma(_654, _1464, _1550);
    float _1588 = _650 * _1528;
    float _1590 = fma(_660, _1408, _1582);
    float _1592 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1594 = precise::clamp(_1592, 0.0, 1.0);
    float _1596 = fma(_668, _1464, _1578);
    float _1598 = fma(_660, _1464, _1580);
    float _1600 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1602 = fma(_1594, -2.0, 3.0);
    float _1604 = _1594 * _1594;
    float _1606 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1608 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1610 = fma(_668, _1536, _1576);
    float _1612 = _1604 * _1602;
    float _1614 = fma(_1562, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1600);
    float _1616 = fma(_1562, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1606);
    float _1618 = fma(_1562, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1608);
    float _1620 = fma(_664, _1534, _1588);
    float _1622 = _1610 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1624 = _1610 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1626 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1614);
    float _1628 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1616);
    float _1630 = fma(_1590, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1618);
    float _1632 = _1610 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1634 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1636 = fma(_660, _1536, _1620);
    float _1638 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1622);
    float _1640 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1642 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1624);
    float _1644 = fma(_1566, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1632);
    float _1646 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1648 = fma(_1636, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1638);
    float _1650 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1634);
    float _1652 = fma(_1636, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1642);
    float _1654 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1640);
    float _1656 = exp2(_1190);
    float _1658 = -_1612;
    float _1660 = _1658 + 1.0;
    float _1662 = in.m_81.x;
    bool _1664 = _1502 <= 8000.0;
    bool _1666 = isnan(_1502);
    bool _1668 = _1664 || _1666;
    bool _1670 = isnan(8000.0);
    bool _1672 = _1668 || _1670;
    float _1674 = float(_1672);
    float _1676 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1646);
    float _1678 = fma(_1660, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1612);
    out.m_83.x = _1626;
    out.m_83.y = _1628;
    out.m_83.z = _1630;
    float _1680 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1650);
    float _1682 = fma(_1636, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1644);
    float _1684 = _1674 * _1678;
    float _1686 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1654);
    out.m_71.x = _1386;
    if (!_1480)
    {
        _1286 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1688 = _1286;
    float _1690 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_85.x = _1648;
    out.m_85.y = _1652;
    out.m_85.z = _1682;
    float _1692 = -_1656;
    float _1694 = _1692 + 1.0;
    float _1696 = fma(_1142, -0.5, _1250);
    float _1698 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1676);
    float _1700 = _1694 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1702 = _1688;
    float _1704 = _1688;
    if (!_1480)
    {
        _1416 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1706 = _1416;
    out.m_71.y = _1696;
    float _1708 = -_1700;
    float _1710 = _1708 + 1.0;
    out.m_87.x = _1680;
    out.m_87.y = _1686;
    out.m_87.z = _1698;
    float _1712 = -_1144;
    float _1714 = _1712 + 1.0;
    float _1716 = _1714 * _1690;
    float _1718 = precise::clamp(_1716, 0.0, 1.0);
    float _1720 = -_1718;
    float _1722 = fma(_1720, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1724 = _1722 * _1662;
    float _1726 = _1700 * _1168;
    float _1728 = _1176 * _1726;
    float _1730 = _1174 * _1726;
    float _1732 = _1178 * _1726;
    float _1734 = _1724 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1736 = _1178;
    float _1738 = _1174;
    float _1740 = _1726;
    float _1742 = _1724;
    float _1744 = _1706;
    float _1746 = _1706;
    if (!_1480)
    {
        _1736 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1748 = _1736;
    float _1750 = _1748;
    float _1752 = _1748;
    if (!_1480)
    {
        _1738 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1754 = _1738;
    out.m_89.x = _1730;
    out.m_89.y = _1728;
    out.m_89.z = _1732;
    out.m_89.w = _1710;
    float _1756 = _1754;
    float _1758 = _1754;
    if (!_1480)
    {
        _1740 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1760 = _1740;
    float _1762 = _1760;
    float _1764 = _1760;
    if (!_1480)
    {
        _1742 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1766 = _1742;
    out.m_91.x = _1734;
    bool _1768 = !_1480;
    float _1770 = _1766;
    float _1772 = _1766;
    if (!_1768)
    {
        bool _1774 = _906 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1776 = isnan(_906);
        bool _1778 = _1774 || _1776;
        bool _1780 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1782 = _1778 || _1780;
        if (!_1782)
        {
            float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1786 = _906 + _1784;
            float _1788 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1790 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1788;
            float _1792 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1794 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1796 = 1.0 / _1790;
            float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1800 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1804 = _1802 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1808 = _1806 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1812 = _1810 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1814 = _1786 * _1796;
            float _1816 = precise::clamp(_1814, 0.0, 1.0);
            float _1818 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1820 = _1818 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1822 = fma(_1816, _1794, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1824 = fma(_1816, _1820, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1826 = fma(_1816, _1800, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1828 = fma(_1816, _1804, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1830 = fma(_1816, _1808, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1832 = fma(_1816, _1812, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1704 = _1822;
            _1746 = _1830;
            _1752 = _1826;
            _1764 = _1828;
            _1758 = _1824;
            _1772 = _1832;
            _1834 = true;
        }
        else
        {
            bool _1836 = _906 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1838 = isnan(_906);
            bool _1840 = _1836 || _1838;
            bool _1842 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1844 = _1840 || _1842;
            if (!_1844)
            {
                _1750 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1846 = _1750;
            _1752 = _1846;
            if (!_1844)
            {
                _1702 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1848 = _1702;
            _1704 = _1848;
            if (!_1844)
            {
                _1756 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1850 = _1756;
            _1758 = _1850;
            if (!_1844)
            {
                _1762 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1852 = _1762;
            _1764 = _1852;
            if (!_1844)
            {
                _1744 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1854 = _1744;
            _1746 = _1854;
            if (!_1844)
            {
                _1770 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1856 = _1770;
            bool _1858 = !_1844;
            _1772 = _1856;
            if (!_1858)
            {
                bool _1860 = _906 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1862 = isnan(_906);
                bool _1864 = _1860 || _1862;
                bool _1866 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1868 = _1864 || _1866;
                if (!_1868)
                {
                    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1872 = _906 + _1870;
                    float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1876 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1874;
                    float _1878 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1880 = _1878 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1882 = 1.0 / _1876;
                    float _1884 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1886 = _1884 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1890 = _1888 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1894 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1898 = _1896 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1900 = _1872 * _1882;
                    float _1902 = precise::clamp(_1900, 0.0, 1.0);
                    float _1904 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1906 = _1904 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1908 = fma(_1902, _1880, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1910 = fma(_1902, _1906, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1912 = fma(_1902, _1886, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1914 = fma(_1902, _1890, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1916 = fma(_1902, _1894, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1918 = fma(_1902, _1898, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1704 = _1908;
                    _1746 = _1916;
                    _1752 = _1912;
                    _1764 = _1914;
                    _1758 = _1910;
                    _1772 = _1918;
                    _1834 = true;
                }
                else
                {
                    _1704 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1746 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1752 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1764 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1758 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1772 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1834 = false;
    float _1920 = _1704;
    float _1922 = _1746;
    float _1924 = _1752;
    float _1926 = _1764;
    float _1928 = _1758;
    float _1930 = _1772;
    float _1932 = fma(_1686, -0.5, 0.5);
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = -_1920;
    float _1938 = _1936 + _1922;
    float _1940 = -_1924;
    float _1942 = _1940 + _1926;
    float _1944 = -_1928;
    float _1946 = _1944 + _1930;
    bool _1948 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1950 = fma(_1934, _1938, _1920);
    float _1952 = fma(_1934, _1942, _1924);
    float _1954 = fma(_1934, _1946, _1928);
    float _1956 = _1950 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _1958 = fma(_1952, 0.298911988735198974609375, _1956);
    float _1960 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1962 = fma(_1954, 0.114477999508380889892578125, _1958);
    out.m_91.w = _1960;
    float _1964 = -_1962;
    float _1966 = _1952 + _1964;
    float _1968 = -_1962;
    float _1970 = _1950 + _1968;
    float _1972 = -_1962;
    float _1974 = _1954 + _1972;
    out.m_93.x = 0.0;
    float _1976 = fma(_1966, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1962);
    float _1978 = fma(_1970, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1962);
    float _1980 = fma(_1974, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1962);
    out.m_95.x = _1976;
    out.m_95.y = _1978;
    out.m_95.z = _1980;
    if (!_1948)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1982 = -_876;
    float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1986 = -_878;
    float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1990 = -_880;
    float _1992 = _1990 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1994 = _1984 * _1984;
    float _1996 = fma(_1988, _1988, _1994);
    float _1998 = fma(_1992, _1992, _1996);
    float _2000 = sqrt(_1998);
    float _2002 = rsqrt(_1998);
    float _2004 = -_2000;
    float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2008 = _2006 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2010 = precise::clamp(_2008, 0.0, 1.0);
    float _2012 = _1988 * _2002;
    float _2014 = _1984 * _2002;
    float _2016 = abs(_2010);
    float _2018 = log2(_2016);
    float _2020 = _1992 * _2002;
    float _2022 = _2012 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2024 = _1686 * _2014;
    float _2026 = -_2014;
    float _2028 = -_2022;
    float _2030 = fma(_2026, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2028);
    float _2032 = fma(_1680, _2012, _2024);
    float _2034 = -_2020;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2030);
    float _2038 = fma(_1698, _2020, _2032);
    float _2040 = precise::clamp(_2038, 0.0, 1.0);
    float _2042 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2044 = _2036 + _2042;
    float _2046 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2048 = _2044 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2050 = precise::clamp(_2048, 0.0, 1.0);
    float _2052 = exp2(_2046);
    float _2054 = _2052 * _2050;
    float _2056 = _2040 * _2054;
    float _2058 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2060 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2062 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2058;
    out.m_93.y = _2060;
    out.m_93.z = _2062;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

