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
    float4 m_61 [[user(locn0)]];
    float4 m_63 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_67 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_86);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    float _98 = _96;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_90)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1933 = as_type<float>(_104);
        out.gl_Position.z = _1933;
    }
    if (!_90)
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
        float _126 = float(_86);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _94;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2002 = as_type<float>(_140);
        out.gl_Position.z = _2002;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.y;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = in.m_49.z;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _150 = _148 != 0;
    float _152 = in.m_49.x;
    float _154 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _156 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _158 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _160 = _142 * 2.0;
    float _162 = _142 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _168 = _146 * 2.0;
    float _170 = fma(_162, -2.0, _156);
    float _172 = floor(_160);
    float _174 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _176 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _178 = precise::max(_174, _176);
    float _180 = _152 * 2.0;
    float _182 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _186 = _178 >= 16.0;
    float _188 = -_154;
    float _190 = fma(_182, 2.0, _188);
    float _192 = floor(_168);
    float _194 = _142 + _152;
    float _196 = _178;
    float _198 = _144;
    if (!_150)
    {
        _196 = _142;
    }
    float _200 = _196;
    float _202 = _200;
    if (_150)
    {
        _202 = _152;
    }
    float _204 = _202;
    float _206 = _194 + (-1.0);
    float _208 = floor(_180);
    float _210 = _152 + _146;
    bool _212 = _172 > 0.0;
    float _214 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _216 = _172 >= 0.0;
    bool _218 = isnan(_172);
    bool _220 = _216 || _218;
    bool _222 = isnan(0.0);
    bool _224 = _220 || _222;
    float _226 = _210 + (-1.0);
    float _228 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[83].z, _164);
    bool _230 = _192 >= 0.0;
    bool _232 = isnan(_192);
    bool _234 = _230 || _232;
    bool _236 = isnan(0.0);
    bool _238 = _234 || _236;
    float _240 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _242 = _192 > 0.0;
    float _244 = _204 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _246 = _238 ? 0 : 1;
    float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _250 = log2(_248);
    bool _252 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _256 = _252 || _254;
    bool _258 = isnan(1.0);
    bool _260 = _256 || _258;
    float _262 = -_166;
    float _264 = fma(_244, 2.0, _262);
    float _266 = _226;
    float _268 = _206;
    if (!_150)
    {
        _266 = _146;
    }
    float _270 = _266;
    float _272 = _270;
    if (!_150)
    {
        _268 = _146;
    }
    float _274 = _268;
    float _276 = _274;
    if (_150)
    {
        _272 = _142;
    }
    float _278 = _272;
    if (_150)
    {
        _276 = _142;
    }
    float _280 = _276;
    bool _282 = _208 > 0.0;
    bool _284 = _208 >= 0.0;
    bool _286 = isnan(_208);
    bool _288 = _284 || _286;
    bool _290 = isnan(0.0);
    bool _292 = _288 || _290;
    float _294 = _278 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _296 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[83].w, _158);
    int _298 = _224 ? 0 : 1;
    float _300 = 0.0;
    if (!_260)
    {
        float _302 = _144 * _144;
        float _304 = _302 * 0.5;
        _300 = _304;
    }
    float _306 = _300;
    int _308 = _292 ? 0 : 1;
    float _310 = fma(_294, -2.0, _184);
    int _312 = ~_246;
    int _314 = _312 + 1;
    int _316 = _314 + 1;
    float _318 = _250 * _122;
    int _320 = ~_298;
    int _322 = _320 + 1;
    int _324 = _322 + 1;
    float _326 = _306;
    int _328 = _316;
    int _330 = _324;
    if (!_260)
    {
        float _332 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _326 = _332;
    }
    float _334 = _326;
    int _336 = ~_308;
    int _338 = _336 + 1;
    int _340 = _338 + 1;
    int _342 = _340;
    float _344 = _334;
    if (!_242)
    {
        int _346 = ~_246;
        int _348 = _346 + 1;
        _328 = _348;
    }
    int _350 = _328;
    if (!_212)
    {
        int _352 = ~_298;
        int _354 = _352 + 1;
        _330 = _354;
    }
    int _356 = _330;
    if (!_282)
    {
        int _358 = ~_308;
        int _360 = _358 + 1;
        _342 = _360;
    }
    int _362 = _342;
    bool _364 = !_260;
    if (!_364)
    {
        float _366 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _368 = log2(_366);
        float _370 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _372 = _370 + 1.0;
        float _374 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _376 = _144 * _368;
        float _378 = 1.0 / _372;
        float _380 = _374 * 0.693147182464599609375;
        float _382 = exp2(_376);
        float _384 = 1.0 / _380;
        float _386 = _382 + (-1.0);
        float _388 = -_386;
        float _390 = fma(_388, _384, _144);
        float _392 = _390 * _378;
        float _394 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _344 = _394;
    }
    float _396 = _344;
    bool _398 = !_260;
    if (!_398)
    {
        float _400 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _402 = log2(_400);
        float _404 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _406 = _404 + 1.0;
        float _408 = 1.0 / _406;
        float _410 = _144 * _402;
        float _412 = exp2(_410);
        float _414 = -_412;
        float _416 = _414 + 1.0;
        float _418 = _416 * _408;
        _198 = _418;
    }
    float _420 = _198;
    float _422 = exp2(_318);
    float _424 = in.m_47.x;
    float _426 = in.m_47.y;
    float _428 = in.m_47.z;
    float _430 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _170);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _434 = 1.0 + _432;
    float _436 = in.m_51.w;
    bool _438 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _440 = isnan(1.0);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _446 = _442 || _444;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _450 = 1.0 / _434;
    float _452 = in.m_42.x;
    float _454 = in.m_42.y;
    float _456 = in.m_42.z;
    bool _458 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _460 = isnan(0.0);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _466 = _462 || _464;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _470 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].z, _448);
    float _472 = -_422;
    float _474 = _472 + 1.0;
    float _476 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[78].w, _468);
    float _478 = -_122;
    float _480 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[76].x, _190);
    float _482 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _228);
    float _484 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _470);
    float _486 = _466 ? _474 : 0.0;
    float _488 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _476);
    float _490 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _296);
    float _492 = -_122;
    float _494 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[81].x, _264);
    float _496 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _310);
    float _498 = in.m_53.x;
    float _500 = in.m_53.y;
    float _502 = in.m_53.z;
    float _504 = _490;
    float _506 = _484;
    if (_446)
    {
        float _508 = _486 * _450;
        _124 = _508;
    }
    float _510 = _124;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _518 = _516 != 0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _522 = _520 != 0;
    float _524 = _396 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _526 = _396 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _528 = _396 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _530 = fma(_420, _424, _524);
    float _532 = fma(_420, _426, _526);
    float _534 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _152);
    float _536 = fma(_420, _428, _528);
    float _538 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _540 = _534 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _542 = fma(_532, _436, _454);
    float _544 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _538);
    bool _546 = !_522;
    int _548 = _546 ? 0 : 1;
    float _550 = fma(_530, _436, _452);
    float _552 = float(_350);
    float _554 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _544);
    int _556 = abs(_548);
    float _558 = fma(_536, _436, _456);
    bool _560 = !_514;
    int _562 = _560 ? 0 : 1;
    float _564 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[191].y, _540);
    float _566 = rsqrt(_554);
    float _568 = float(_356);
    float _570 = _564 * 0.15915493667125701904296875;
    float _572 = float(_556);
    float _574 = _542 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _576 = abs(_562);
    float _578 = _542 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _580 = _542 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _582 = _572 * _568;
    float _584 = float(_576);
    float _586 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[5].x, _578);
    float _588 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[4].x, _574);
    float _590 = _582 * (-2.0);
    float _592 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
    float _594 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[5].z, _586);
    float _596 = _584 * _552;
    float _598 = fma(_240, _590, _240);
    float _600 = _566 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _602 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[4].z, _588);
    float _604 = _594 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _606 = _596 * (-2.0);
    float _608 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[6].z, _592);
    float _610 = _600 * (-0.15915493667125701904296875);
    float _612 = _602 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _616 = _604 + _614;
    float _618 = _152 + (-0.5);
    float _620 = fma(_214, _606, _214);
    float _622 = _608 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _624 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _626 = _612 + _624;
    float _628 = _616 * _616;
    float _630 = _618 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _632 = !_518;
    int _634 = _632 ? 0 : 1;
    float _636 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _638 = _622 + _636;
    float _640 = fma(_626, _626, _628);
    float _642 = fma(_620, _510, _630);
    int _644 = abs(_634);
    float _646 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _648 = fma(_638, _638, _640);
    float _650 = _610 * 6.283185482025146484375;
    float _652 = sin(_650);
    float _654 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _656 = float(_644);
    float _658 = _142 + _146;
    float _660 = _186 ? _646 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _662 = _146 + (-0.5);
    float _664 = _658 + (-1.0);
    float _666 = _610 * 6.283185482025146484375;
    float _668 = cos(_666);
    float _670 = _186 ? _654 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _672 = _142 + (-0.5);
    float _674 = abs(_660);
    bool _676 = _674 != 0.0;
    bool _678 = isnan(_674);
    bool _680 = _676 || _678;
    bool _682 = isnan(0.0);
    bool _684 = _680 || _682;
    float _686 = _642 * 0.15915493667125701904296875;
    float _688 = abs(_670);
    bool _690 = _688 == 0.0;
    float _692 = abs(_670);
    bool _694 = _692 == 0.0;
    bool _696 = !_684;
    bool _698 = _694 && _696;
    float _700 = rsqrt(_648);
    float _702 = float(_362);
    float _704 = _662 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _706 = _656 * _702;
    float _708 = fma(_598, _510, _704);
    float _710 = _570 * 6.283185482025146484375;
    float _712 = sin(_710);
    float _714 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _716 = _706 * (-2.0);
    float _718 = _708 * 0.15915493667125701904296875;
    float _720 = in.m_51.x;
    float _722 = in.m_51.y;
    float _724 = in.m_51.z;
    bool _726 = _446;
    int _728 = as_type<int>(_510);
    if (_698)
    {
        bool _730 = as_type<int>(_670) >= 0;
        _726 = _730;
    }
    bool _732 = _726;
    float _734 = fma(_714, _716, _714);
    float _736 = _672 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _738 = _616 * _700;
    float _740 = _718 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _626 * _700;
    float _746 = fma(_734, _510, _736);
    float _748 = -_738;
    float _750 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[18].w, _616);
    float _752 = _750 * _750;
    float _754 = _686 * 6.283185482025146484375;
    float _756 = sin(_754);
    int _758 = as_type<int>(_750);
    int _760 = _732 ? (-1) : 0;
    if (_698)
    {
        int _762 = _732 ? 0 : 1078530011;
        _758 = _762;
    }
    int _764 = _758;
    if (_698)
    {
        int _766 = int(0x80000000) & as_type<int>(_660);
        int _768 = _764 | _766;
        _728 = _768;
    }
    int _770 = _728;
    float _772 = _686 * 6.283185482025146484375;
    float _774 = cos(_772);
    float _776 = -_744;
    float _778 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[18].w, _626);
    float _780 = _638 * _700;
    float _782 = fma(_778, _778, _752);
    float _784 = -_780;
    float _786 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[18].w, _638);
    bool _788 = !_684;
    bool _790 = _788 && _690;
    int _792 = _770;
    float _794 = as_type<float>(_770);
    if (!_790)
    {
        float _796 = abs(_660);
        bool _798 = _796 != as_type<float>(0x7f800000u /* inf */);
        bool _800 = isnan(_796);
        bool _802 = _798 || _800;
        bool _804 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _806 = _802 || _804;
        float _808 = abs(_670);
        bool _810 = _808 == as_type<float>(0x7f800000u /* inf */);
        float _812 = abs(_670);
        bool _814 = _812 == as_type<float>(0x7f800000u /* inf */);
        bool _816 = !_806;
        bool _818 = _814 && _816;
        if (_818)
        {
            bool _820 = as_type<int>(_670) >= 0;
            _760 = _820 ? (-1) : 0;
        }
        int _822 = _760;
        if (_818)
        {
            _792 = 1075235812;
        }
        int _824 = _792;
        int _826 = _824;
        if (_818)
        {
            int _828 = ~_822;
            int _830 = (_828 != 0) ? _824 : 1061752795;
            _826 = _830;
        }
        int _832 = _826;
        float _834 = as_type<float>(_832);
        if (_818)
        {
            int _836 = int(0x80000000) & as_type<int>(_660);
            int _838 = _832 | _836;
            _834 = as_type<float>(_838);
        }
        float _840 = _834;
        bool _842 = !_806;
        bool _844 = _842 && _810;
        _794 = _840;
        if (!_844)
        {
            float _846 = abs(_660);
            float _848 = abs(_670);
            float _850 = precise::max(_846, _848);
            float _852 = abs(_660);
            float _854 = abs(_670);
            float _856 = precise::min(_852, _854);
            float _858 = 1.0 / _850;
            float _860 = abs(_660);
            float _862 = abs(_670);
            bool _864 = _860 > _862;
            bool _866 = as_type<int>(_670) >= 0;
            float _868 = abs(_660);
            float _870 = abs(_670);
            float _872 = _868 + _870;
            int _874 = as_type<int>(_660) & int(0x80000000);
            bool _876 = _872 > as_type<float>(0x7f800000u /* inf */);
            bool _878 = isnan(_872);
            bool _880 = _876 || _878;
            bool _882 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _884 = _880 || _882;
            float _886 = _856 * _858;
            float _888 = _886 * _886;
            float _890 = _888 + 11.33538818359375;
            float _892 = fma(_888, _890, 28.84246826171875);
            float _894 = fma(_888, _892, 19.6966705322265625);
            float _896 = fma(_888, -0.82336294651031494140625, -5.674867153167724609375);
            float _898 = fma(_888, _896, -6.565555095672607421875);
            float _900 = 1.0 / _894;
            float _902 = _888 * _898;
            float _904 = _886 * _902;
            float _906 = fma(_904, _900, _886);
            float _908 = _906;
            _794 = _872;
            if (_864)
            {
                float _910 = -_906;
                float _912 = _910 + 1.57079637050628662109375;
                _908 = _912;
            }
            float _914 = _908;
            int _916 = as_type<int>(_914);
            if (!_866)
            {
                float _918 = -_914;
                float _920 = _918 + 3.1415927410125732421875;
                _916 = as_type<int>(_920);
            }
            int _922 = _916;
            if (!_884)
            {
                int _924 = _874 | _922;
                _794 = as_type<float>(_924);
            }
        }
    }
    float _926 = _794;
    float _928 = fma(_786, _786, _782);
    float _930 = _746 + _926;
    float _932 = _712 * _500;
    float _934 = _720 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _936 = _652 * _502;
    float _938 = _930 * 0.15915493667125701904296875;
    float _940 = sqrt(_928);
    float _942 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[191].z, _498);
    float _944 = _722 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _946 = _668 * _502;
    float _948 = -_936;
    float _950 = fma(_668, _500, _948);
    float _952 = _944 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _954 = _724 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _956 = _938 * 6.283185482025146484375;
    float _958 = sin(_956);
    float _960 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _950);
    float _962 = _934 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _964 = _954 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _966 = fma(_652, _500, _946);
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _942);
    float _970 = _938 * 6.283185482025146484375;
    float _972 = cos(_970);
    float _974 = _700 * _940;
    float _976 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _966);
    float _978 = _952 * _974;
    float _980 = _962 * _974;
    float _982 = _964 * _974;
    float _984 = _718 * 6.283185482025146484375;
    float _986 = sin(_984);
    float _988 = _978 * _960;
    float _990 = _774 * _958;
    float _992 = _980 * _968;
    float _994 = _982 * _976;
    float _996 = _742 * _988;
    float _998 = _756 * _972;
    float _1000 = _756 * _996;
    float _1002 = _756 * _958;
    float _1004 = _774 * _972;
    float _1006 = _972 * _742;
    float _1008 = _958 * _742;
    float _1010 = _774 * _996;
    float _1012 = -_990;
    float _1014 = fma(_986, _998, _1012);
    float _1016 = -_988;
    float _1018 = _986 * _1016;
    float _1020 = -_998;
    float _1022 = fma(_986, _990, _1020);
    float _1024 = fma(_1014, _992, _1000);
    float _1026 = fma(_986, _1002, _1004);
    float _1028 = fma(_1006, _992, _1018);
    float _1030 = fma(_986, _1004, _1002);
    float _1032 = fma(_1026, _994, _1024);
    float _1034 = fma(_1008, _994, _1028);
    float _1036 = fma(_1030, _992, _1010);
    float _1038 = _622 + _1032;
    float _1040 = _612 + _1034;
    float _1042 = fma(_1022, _994, _1036);
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1046 = _1038 + _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1050 = _1040 + _1048;
    float _1052 = _604 + _1042;
    float _1054 = _1046 * _1046;
    float _1056 = fma(_1050, _1050, _1054);
    float _1058 = sqrt(_1056);
    bool _1060 = _1058 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = _1042;
    float _1064 = _1054;
    float _1066 = _976;
    float _1068 = _1050;
    if (!_1060)
    {
        _1062 = _1040;
    }
    float _1070 = _1062;
    float _1072 = _1070;
    if (!_1060)
    {
        _1064 = _1038;
    }
    float _1074 = _1064;
    float _1076 = _1074;
    if (!_1060)
    {
        _1066 = _1052;
    }
    float _1078 = _1066;
    bool _1080 = !_1060;
    float _1082 = _1078;
    if (!_1080)
    {
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1088 = _1058 + _1086;
        float _1090 = rsqrt(_1056);
        float _1092 = _1088 * _1084;
        float _1094 = _1052 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1096 = _1092 * 0.15915493667125701904296875;
        float _1098 = _1096 * 6.283185482025146484375;
        float _1100 = cos(_1098);
        float _1102 = _1096 * 6.283185482025146484375;
        float _1104 = sin(_1102);
        float _1106 = _1100 + (-1.0);
        float _1108 = fma(_1104, _1094, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1106 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = _1090 * _1108;
        float _1114 = fma(_1052, _1100, _1110);
        float _1116 = fma(_1050, _1112, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1118 = fma(_1046, _1112, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1082 = _1114;
        _1072 = _1116;
        _1076 = _1118;
    }
    float _1120 = _1082;
    float _1122 = _1072;
    float _1124 = _1076;
    float _1126 = -_738;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1120);
    float _1130 = -_744;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1122);
    float _1134 = -_780;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1124);
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1140 = _1128 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1144 = _1132 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1148 = _1136 + _1146;
    float _1150 = _1140 * _1140;
    float _1152 = fma(_1144, _1144, _1150);
    float _1154 = fma(_1148, _1148, _1152);
    float _1156 = rsqrt(_1154);
    float _1158 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1160 = _1144 * _1158;
    float _1162 = _1148 * _1158;
    float _1164 = _1160 * _1160;
    float _1166 = _1162 * _1162;
    float _1168 = _1164 + _1166;
    float _1170 = sqrt(_1168);
    bool _1172 = _1170 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1176 = _1170 + _1174;
    float _1178 = _1152;
    float _1180 = _1168;
    float _1182 = _1176;
    float _1184 = _1140;
    float _1186 = _1158;
    if (_1172)
    {
        float _1188 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1178 = _1188;
    }
    float _1190 = _1178;
    if (_1172)
    {
        float _1192 = rsqrt(_1168);
        _1180 = _1192;
    }
    float _1194 = _1180;
    float _1196 = _1190;
    if (_1172)
    {
        float _1198 = _1176 * _1190;
        _1182 = _1198;
    }
    float _1200 = _1182;
    if (_1172)
    {
        float _1202 = _1200 * 0.15915493667125701904296875;
        _1068 = _1202;
    }
    float _1204 = _1068;
    float _1206 = _1148;
    float _1208 = _1204;
    if (_1172)
    {
        float _1210 = _1204 * 6.283185482025146484375;
        float _1212 = sin(_1210);
        _1206 = _1212;
    }
    float _1214 = _1206;
    float _1216 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1218 = precise::max(0.0, _1216);
    float _1220 = _1156;
    float _1222 = _1218;
    if (_1172)
    {
        float _1224 = _1204 * 6.283185482025146484375;
        float _1226 = cos(_1224);
        _1220 = _1226;
    }
    float _1228 = _1220;
    float _1230 = -_1158;
    float _1232 = -_1218;
    float _1234 = fma(_1140, _1230, _1232);
    if (_1172)
    {
        float _1236 = _1234 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1184 = _1236;
    }
    float _1238 = _1184;
    float _1240 = _1214;
    float _1242 = _1238;
    if (_1172)
    {
        float _1244 = fma(_1214, _1238, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1186 = _1244;
    }
    float _1246 = _1186;
    if (!_1172)
    {
        _1240 = _1160;
    }
    float _1248 = _1240;
    float _1250 = _1248;
    if (!_1172)
    {
        _1242 = _1234;
    }
    float _1252 = _1242;
    float _1254 = _1252;
    float _1256 = _1228;
    if (_1172)
    {
        float _1258 = _1228 + (-1.0);
        _1222 = _1258;
    }
    float _1260 = _1222;
    float _1262 = _1260;
    if (_1172)
    {
        float _1264 = _1194 * _1246;
        _1208 = _1264;
    }
    float _1266 = _1208;
    float _1268 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1270 = sqrt(_1154);
    if (_1172)
    {
        float _1272 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1196 = _1272;
    }
    float _1274 = _1196;
    float _1276 = _1274;
    if (_1172)
    {
        float _1278 = _1160 * _1266;
        _1250 = _1278;
    }
    float _1280 = _1250;
    if (!_1172)
    {
        _1262 = _1162;
    }
    float _1282 = _1262;
    float _1284 = _1282;
    if (_1172)
    {
        float _1286 = _1162 * _1266;
        _1284 = _1286;
    }
    float _1288 = _1284;
    if (_1172)
    {
        float _1290 = fma(_1234, _1228, _1274);
        _1254 = _1290;
    }
    float _1292 = _1254;
    if (!_1172)
    {
        _1256 = _1164;
    }
    float _1294 = _1256;
    float _1296 = _1294;
    if (_1172)
    {
        float _1298 = _1280 * _1280;
        _1296 = _1298;
    }
    float _1300 = _1296;
    if (!_1172)
    {
        _1276 = _1166;
    }
    float _1302 = _1276;
    float _1304 = _1302;
    if (_1172)
    {
        float _1306 = _1288 * _1288;
        _1304 = _1306;
    }
    float _1308 = _1304;
    float _1310 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1312 = fma(_1292, _1292, _1300);
    float _1314 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1316 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1268);
    float _1318 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1310);
    float _1320 = _1312 + _1308;
    float _1322 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1324 = fma(_1270, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1322);
    float _1326 = precise::clamp(_1324, 0.0, 1.0);
    float _1328 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1330 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1318);
    float _1332 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1314);
    float _1334 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1316);
    float _1336 = rsqrt(_1320);
    float _1338 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1340 = -_1326;
    float _1342 = _1340 + 1.0;
    float _1344 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1328);
    float _1346 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1348 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1332);
    float _1350 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1352 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1354 = abs(_1342);
    float _1356 = log2(_1354);
    float _1358 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1344);
    float _1360 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1362 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1352);
    float _1364 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1366 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1368 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1362);
    float _1370 = _1336 * _1280;
    float _1372 = _1336 * _1292;
    float _1374 = _1336 * _1288;
    float _1376 = -_1366;
    float _1378 = fma(_1376, _1346, 1.0);
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1382 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1368);
    float _1384 = -_1380;
    float _1386 = fma(_1372, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1384);
    float _1388 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1390 = 1.0 / _1382;
    float _1392 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1394 = -_1374;
    float _1396 = fma(_1394, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1386);
    float _1398 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1400 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1392);
    float _1402 = fma(_1396, -0.5, 0.5);
    float _1404 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1398);
    float _1406 = exp2(_1388);
    float _1408 = fma(_1396, 0.5, 0.5);
    float _1410 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1400);
    float _1412 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1404);
    float _1414 = _1372 + 1.0;
    float _1416 = fma(_1408, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1418 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1412);
    float _1420 = log2(_1378);
    float _1422 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1410);
    float _1424 = fma(_1408, _1416, -0.212114393711090087890625);
    float _1426 = _1418 * _1390;
    float _1428 = fma(_1408, _1424, 1.570728778839111328125);
    float _1430 = fma(_1426, 0.5, 0.5);
    float _1432 = sqrt(_1402);
    float _1434 = -_1372;
    float _1436 = fma(_1406, _1414, _1434);
    float _1438 = _1422 * _1390;
    float _1440 = fma(_1436, 0.5, 0.5);
    float _1442 = fma(_1438, -0.5, 0.5);
    float _1444 = _1420 * 0.693147182464599609375;
    float _1446 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1448 = _1432 * 0.636619746685028076171875;
    float _1450 = -_1428;
    float _1452 = fma(_1448, _1450, 1.0);
    float3 _4060 = float3(_1430, _1442, _1446);
    float _1454 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4060, float3(0.0), isnan(_4060)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4060, float3(0.0), isnan(_4060)), level(0.0)).x;
    float3 _4071 = float3(_1430, _1442, _1446);
    float4 _1457 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4071, float3(0.0), isnan(_4071)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4071, float3(0.0), isnan(_4071)), level(0.0)).xyzw;
    float _1459 = _1457.x;
    float _1461 = _1457.y;
    float _1463 = _1457.z;
    float _1465 = _1457.w;
    float2 _4088 = float2(_1452, _1440);
    float3 _1469 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4088, float2(0.0), isnan(_4088)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4088, float2(0.0), isnan(_4088)), level(0.0)).xyz;
    float _1471 = _1469.x;
    float _1473 = _1469.y;
    float _1475 = _1469.z;
    float _1477 = in.m_55.w;
    float _1479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1481 = _142 > 0.5;
    float _1483 = in.m_55.y;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1487 = _1485 != 0;
    float _1489 = -_738;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[18].w, _604);
    int _1493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1495 = _1493 != 0;
    float _1497 = in.m_49.w;
    int _1499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1501 = _1499 != 0;
    float _1503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1507 = _1505 != 0;
    float _1509 = in.m_55.z;
    float _1511 = -_744;
    float _1513 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[18].w, _612);
    float _1515 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1517 = -_780;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[18].w, _622);
    bool _1521 = _152 > 0.5;
    bool _1523 = _1521 && _1507;
    float _1525 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1527 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1515);
    float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1531 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1533 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1527);
    float _1535 = -_1477;
    float _1537 = _1535 + 1.0;
    float _1539 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1531);
    float _1541 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1543 = -_1483;
    float _1545 = _1543 + 1.0;
    float _1547 = _1477;
    float _1549 = _1483;
    float _1551 = _1545;
    float _1553 = _1519;
    if (_1487)
    {
        float _1555 = _1481 ? _1537 : _1477;
        _1547 = _1555;
    }
    float _1557 = _1547;
    float _1559 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1561 = _146 > 0.5;
    bool _1563 = _1561 && _1495;
    float _1565 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1567 = _1497 > 0.5;
    float _1569 = fma(_1559, _1557, -0.5);
    float _1571 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1573 = in.m_57.x;
    if (_1501)
    {
        float _1575 = _1567 ? _1545 : _1483;
        _1549 = _1575;
    }
    float _1577 = _1549;
    float _1579 = 1.0 / _1565;
    float _1581 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1571);
    float _1583 = in.m_55.x;
    float _1585 = _1577;
    if (_1507)
    {
        _1551 = _1509;
    }
    float _1587 = _1551;
    float _1589 = fma(_1541, _1577, -0.5);
    float _1591 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1581);
    float _1593 = _1587;
    if (!_1507)
    {
        _1553 = _1509;
    }
    float _1595 = _1553;
    float _1597 = in.m_57.z;
    float _1599 = _1595;
    if (_1523)
    {
        float _1601 = -_1587;
        float _1603 = _1601 + 1.0;
        _1593 = _1603;
    }
    float _1605 = _1593;
    float _1607 = _1591 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1609 = in.m_57.y;
    float _1611 = _1607 + _1565;
    if (_1507)
    {
        _1599 = _1605;
    }
    float _1613 = _1599;
    float _1615 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1617 = _1611 * _1579;
    float _1619 = _1617 * 0.5;
    float _1621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1629 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1627);
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_59.x = _1573;
    float _1633 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1635 = _1583;
    if (_1495)
    {
        _1585 = _1583;
    }
    float _1637 = _1585;
    float _1639 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1641 = in.m_57.w;
    float _1643 = _1615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1645 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1647 = _1637;
    if (_1563)
    {
        float _1649 = -_1637;
        float _1651 = _1649 + 1.0;
        _1647 = _1651;
    }
    float _1653 = _1647;
    out.m_59.z = _1597;
    float _1655 = 1.0 / _1629;
    float _1657 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1539);
    out.m_59.y = _1609;
    if (_1495)
    {
        _1635 = _1653;
    }
    float _1659 = _1635;
    bool _1661 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1663 = isnan(0.5);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1669 = _1665 || _1667;
    out.m_61.x = _1633;
    out.m_61.y = _1639;
    out.m_61.z = _1643;
    out.m_61.w = _1623;
    float _1671 = fma(_1645, _1613, -0.5);
    float _1673 = _1621 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1675 = exp2(_1525);
    float _1677 = -_496;
    float _1679 = fma(_490, _1589, _1677);
    float _1681 = fma(_484, _1671, _480);
    float _1683 = fma(_1673, _1659, -0.5);
    float _1685 = -_430;
    float _1687 = fma(_488, _1569, _1685);
    if (_1669)
    {
        _504 = 1.0;
    }
    float _1689 = _504;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1693 = _1655 * _1691;
    float _1695 = fma(_482, _1683, _494);
    float _1697 = _1689;
    if (_1669)
    {
        _506 = 1.0;
    }
    float _1699 = _506;
    float _1701 = _1699;
    if (!_1669)
    {
        float _1703 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1705 = _1703 * 0.15915493667125701904296875;
        float _1707 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1709 = _1705 * 6.283185482025146484375;
        float _1711 = cos(_1709);
        float _1713 = _1707 * 0.15915493667125701904296875;
        float _1715 = _1705 * 6.283185482025146484375;
        float _1717 = sin(_1715);
        float _1719 = 1.0 / _1711;
        float _1721 = _1713 * 6.283185482025146484375;
        float _1723 = cos(_1721);
        float _1725 = _1717 * _1719;
        float _1727 = _1713 * 6.283185482025146484375;
        float _1729 = sin(_1727);
        float _1731 = _1723 * _1725;
        float _1733 = 1.0 / _1731;
        float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1737 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1735;
        float _1739 = 1.0 / _1737;
        float _1741 = _1729 * _1733;
        float _1743 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1745 = fma(_1693, _1741, _1743);
        float _1747 = _1745 * _1739;
        float _1749 = precise::clamp(_1747, 0.0, 1.0);
        _1697 = _1749;
    }
    float _1751 = _1697;
    if (!_1669)
    {
        float _1753 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1755 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1757 = _1753 * 0.15915493667125701904296875;
        float _1759 = _1755 * 0.15915493667125701904296875;
        float _1761 = _1757 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        float _1765 = _1757 * 6.283185482025146484375;
        float _1767 = sin(_1765);
        float _1769 = 1.0 / _1763;
        float _1771 = _1759 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        float _1775 = _1767 * _1769;
        float _1777 = _1759 * 6.283185482025146484375;
        float _1779 = sin(_1777);
        float _1781 = _1773 * _1775;
        float _1783 = 1.0 / _1781;
        float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1787 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1785;
        float _1789 = 1.0 / _1787;
        float _1791 = _1779 * _1783;
        float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1795 = fma(_1693, _1791, _1793);
        float _1797 = _1795 * _1789;
        float _1799 = precise::clamp(_1797, 0.0, 1.0);
        float _1801 = -_1799;
        float _1803 = _1801 + 1.0;
        _1701 = _1803;
    }
    float _1805 = _1701;
    float _1807 = -_1675;
    float _1809 = _1807 + 1.0;
    float _1811 = _1751 * _1805;
    bool _1813 = _1751 > 0.0;
    bool _1815 = isnan(_1751);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan(0.0);
    bool _1821 = _1817 || _1819;
    float _1823 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1657);
    float _1825 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1827 = _1811 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1829 = _1805 <= 0.0;
    bool _1831 = !_1821;
    bool _1833 = _1829 || _1831;
    float _1835 = _1687 + 0.5;
    float _1837 = _1825 * _1454;
    float _1839 = _1681 + 0.5;
    float _1841 = _1695 + 0.5;
    float _1843 = _1679 + 0.5;
    float _1845 = _1827 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1847 = -_1825;
    float _1849 = _1847 + 1.0;
    float _1851 = _1823 + _1382;
    float _1853 = _1418 + _1382;
    float _1855 = _1382 * 0.5;
    float _1857 = _1465 * _1837;
    float _1859 = _1475 * _1837;
    out.m_63.x = _1839;
    out.m_63.y = _1835;
    out.m_63.z = _1841;
    out.m_63.w = _1843;
    float _1861 = _1465 * _1849;
    float _1863 = _1851 * 0.5;
    float _1865 = _1853 * 0.5;
    float _1867 = fma(_1422, -0.5, _1855);
    float _1869 = fma(_1471, _1857, _1459);
    float _1871 = fma(_1473, _1857, _1461);
    float _1873 = fma(_1465, _1859, _1463);
    out.m_59.w = _1641;
    out.m_45.x = _1845;
    out.gl_Position.x = _1418;
    out.gl_Position.y = _1422;
    out.gl_Position.z = _1823;
    out.gl_Position.w = _1382;
    out.m_65.x = _1865;
    out.m_65.y = _1867;
    out.m_65.z = _1863;
    out.m_65.w = _1382;
    out.m_67.x = _1869;
    out.m_67.y = _1871;
    out.m_67.z = _1873;
    out.m_67.w = _1861;
    if (!_1833)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1875 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1875;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_86);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    float _98 = _96;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_90)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1933 = as_type<float>(_104);
        out.gl_Position.z = _1933;
    }
    if (!_90)
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
        float _126 = float(_86);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _94;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2002 = as_type<float>(_140);
        out.gl_Position.z = _2002;
    }
    if (_134)
    {
        return out;
    }
    float _142 = in.m_49.y;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = in.m_49.z;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _150 = _148 != 0;
    float _152 = in.m_49.x;
    float _154 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _156 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _158 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _160 = _142 * 2.0;
    float _162 = _142 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _168 = _146 * 2.0;
    float _170 = fma(_162, -2.0, _156);
    float _172 = floor(_160);
    float _174 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _176 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _178 = precise::max(_174, _176);
    float _180 = _152 * 2.0;
    float _182 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _186 = _178 >= 16.0;
    float _188 = -_154;
    float _190 = fma(_182, 2.0, _188);
    float _192 = floor(_168);
    float _194 = _142 + _152;
    float _196 = _178;
    float _198 = _144;
    if (!_150)
    {
        _196 = _142;
    }
    float _200 = _196;
    float _202 = _200;
    if (_150)
    {
        _202 = _152;
    }
    float _204 = _202;
    float _206 = _194 + (-1.0);
    float _208 = floor(_180);
    float _210 = _152 + _146;
    bool _212 = _172 > 0.0;
    float _214 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _216 = _172 >= 0.0;
    bool _218 = isnan(_172);
    bool _220 = _216 || _218;
    bool _222 = isnan(0.0);
    bool _224 = _220 || _222;
    float _226 = _210 + (-1.0);
    float _228 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[83].z, _164);
    bool _230 = _192 >= 0.0;
    bool _232 = isnan(_192);
    bool _234 = _230 || _232;
    bool _236 = isnan(0.0);
    bool _238 = _234 || _236;
    float _240 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _242 = _192 > 0.0;
    float _244 = _204 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _246 = _238 ? 0 : 1;
    float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _250 = log2(_248);
    bool _252 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _256 = _252 || _254;
    bool _258 = isnan(1.0);
    bool _260 = _256 || _258;
    float _262 = -_166;
    float _264 = fma(_244, 2.0, _262);
    float _266 = _226;
    float _268 = _206;
    if (!_150)
    {
        _266 = _146;
    }
    float _270 = _266;
    float _272 = _270;
    if (!_150)
    {
        _268 = _146;
    }
    float _274 = _268;
    float _276 = _274;
    if (_150)
    {
        _272 = _142;
    }
    float _278 = _272;
    if (_150)
    {
        _276 = _142;
    }
    float _280 = _276;
    bool _282 = _208 > 0.0;
    bool _284 = _208 >= 0.0;
    bool _286 = isnan(_208);
    bool _288 = _284 || _286;
    bool _290 = isnan(0.0);
    bool _292 = _288 || _290;
    float _294 = _278 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _296 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[83].w, _158);
    int _298 = _224 ? 0 : 1;
    float _300 = 0.0;
    if (!_260)
    {
        float _302 = _144 * _144;
        float _304 = _302 * 0.5;
        _300 = _304;
    }
    float _306 = _300;
    int _308 = _292 ? 0 : 1;
    float _310 = fma(_294, -2.0, _184);
    int _312 = ~_246;
    int _314 = _312 + 1;
    int _316 = _314 + 1;
    float _318 = _250 * _122;
    int _320 = ~_298;
    int _322 = _320 + 1;
    int _324 = _322 + 1;
    float _326 = _306;
    int _328 = _316;
    int _330 = _324;
    if (!_260)
    {
        float _332 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _326 = _332;
    }
    float _334 = _326;
    int _336 = ~_308;
    int _338 = _336 + 1;
    int _340 = _338 + 1;
    int _342 = _340;
    float _344 = _334;
    if (!_242)
    {
        int _346 = ~_246;
        int _348 = _346 + 1;
        _328 = _348;
    }
    int _350 = _328;
    if (!_212)
    {
        int _352 = ~_298;
        int _354 = _352 + 1;
        _330 = _354;
    }
    int _356 = _330;
    if (!_282)
    {
        int _358 = ~_308;
        int _360 = _358 + 1;
        _342 = _360;
    }
    int _362 = _342;
    bool _364 = !_260;
    if (!_364)
    {
        float _366 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _368 = log2(_366);
        float _370 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _372 = _370 + 1.0;
        float _374 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _376 = _144 * _368;
        float _378 = 1.0 / _372;
        float _380 = _374 * 0.693147182464599609375;
        float _382 = exp2(_376);
        float _384 = 1.0 / _380;
        float _386 = _382 + (-1.0);
        float _388 = -_386;
        float _390 = fma(_388, _384, _144);
        float _392 = _390 * _378;
        float _394 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _344 = _394;
    }
    float _396 = _344;
    bool _398 = !_260;
    if (!_398)
    {
        float _400 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _402 = log2(_400);
        float _404 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _406 = _404 + 1.0;
        float _408 = 1.0 / _406;
        float _410 = _144 * _402;
        float _412 = exp2(_410);
        float _414 = -_412;
        float _416 = _414 + 1.0;
        float _418 = _416 * _408;
        _198 = _418;
    }
    float _420 = _198;
    float _422 = exp2(_318);
    float _424 = in.m_47.x;
    float _426 = in.m_47.y;
    float _428 = in.m_47.z;
    float _430 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _170);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _434 = 1.0 + _432;
    float _436 = in.m_51.w;
    bool _438 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _440 = isnan(1.0);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _446 = _442 || _444;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _450 = 1.0 / _434;
    float _452 = in.m_42.x;
    float _454 = in.m_42.y;
    float _456 = in.m_42.z;
    bool _458 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _460 = isnan(0.0);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _466 = _462 || _464;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _470 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].z, _448);
    float _472 = -_422;
    float _474 = _472 + 1.0;
    float _476 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[78].w, _468);
    float _478 = -_122;
    float _480 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[76].x, _190);
    float _482 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _228);
    float _484 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _470);
    float _486 = _466 ? _474 : 0.0;
    float _488 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _476);
    float _490 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _296);
    float _492 = -_122;
    float _494 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[81].x, _264);
    float _496 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _310);
    float _498 = in.m_53.x;
    float _500 = in.m_53.y;
    float _502 = in.m_53.z;
    float _504 = _490;
    float _506 = _484;
    if (_446)
    {
        float _508 = _486 * _450;
        _124 = _508;
    }
    float _510 = _124;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _518 = _516 != 0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _522 = _520 != 0;
    float _524 = _396 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _526 = _396 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _528 = _396 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _530 = fma(_420, _424, _524);
    float _532 = fma(_420, _426, _526);
    float _534 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _152);
    float _536 = fma(_420, _428, _528);
    float _538 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _540 = _534 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _542 = fma(_532, _436, _454);
    float _544 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _538);
    bool _546 = !_522;
    int _548 = _546 ? 0 : 1;
    float _550 = fma(_530, _436, _452);
    float _552 = float(_350);
    float _554 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _544);
    int _556 = abs(_548);
    float _558 = fma(_536, _436, _456);
    bool _560 = !_514;
    int _562 = _560 ? 0 : 1;
    float _564 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[191].y, _540);
    float _566 = rsqrt(_554);
    float _568 = float(_356);
    float _570 = _564 * 0.15915493667125701904296875;
    float _572 = float(_556);
    float _574 = _542 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _576 = abs(_562);
    float _578 = _542 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _580 = _542 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _582 = _572 * _568;
    float _584 = float(_576);
    float _586 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[5].x, _578);
    float _588 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[4].x, _574);
    float _590 = _582 * (-2.0);
    float _592 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
    float _594 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[5].z, _586);
    float _596 = _584 * _552;
    float _598 = fma(_240, _590, _240);
    float _600 = _566 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _602 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[4].z, _588);
    float _604 = _594 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _606 = _596 * (-2.0);
    float _608 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[6].z, _592);
    float _610 = _600 * (-0.15915493667125701904296875);
    float _612 = _602 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _616 = _604 + _614;
    float _618 = _152 + (-0.5);
    float _620 = fma(_214, _606, _214);
    float _622 = _608 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _624 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _626 = _612 + _624;
    float _628 = _616 * _616;
    float _630 = _618 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _632 = !_518;
    int _634 = _632 ? 0 : 1;
    float _636 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _638 = _622 + _636;
    float _640 = fma(_626, _626, _628);
    float _642 = fma(_620, _510, _630);
    int _644 = abs(_634);
    float _646 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _648 = fma(_638, _638, _640);
    float _650 = _610 * 6.283185482025146484375;
    float _652 = sin(_650);
    float _654 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _656 = float(_644);
    float _658 = _142 + _146;
    float _660 = _186 ? _646 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _662 = _146 + (-0.5);
    float _664 = _658 + (-1.0);
    float _666 = _610 * 6.283185482025146484375;
    float _668 = cos(_666);
    float _670 = _186 ? _654 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _672 = _142 + (-0.5);
    float _674 = abs(_660);
    bool _676 = _674 != 0.0;
    bool _678 = isnan(_674);
    bool _680 = _676 || _678;
    bool _682 = isnan(0.0);
    bool _684 = _680 || _682;
    float _686 = _642 * 0.15915493667125701904296875;
    float _688 = abs(_670);
    bool _690 = _688 == 0.0;
    float _692 = abs(_670);
    bool _694 = _692 == 0.0;
    bool _696 = !_684;
    bool _698 = _694 && _696;
    float _700 = rsqrt(_648);
    float _702 = float(_362);
    float _704 = _662 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _706 = _656 * _702;
    float _708 = fma(_598, _510, _704);
    float _710 = _570 * 6.283185482025146484375;
    float _712 = sin(_710);
    float _714 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _716 = _706 * (-2.0);
    float _718 = _708 * 0.15915493667125701904296875;
    float _720 = in.m_51.x;
    float _722 = in.m_51.y;
    float _724 = in.m_51.z;
    bool _726 = _446;
    int _728 = as_type<int>(_510);
    if (_698)
    {
        bool _730 = as_type<int>(_670) >= 0;
        _726 = _730;
    }
    bool _732 = _726;
    float _734 = fma(_714, _716, _714);
    float _736 = _672 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _738 = _616 * _700;
    float _740 = _718 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _626 * _700;
    float _746 = fma(_734, _510, _736);
    float _748 = -_738;
    float _750 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[18].w, _616);
    float _752 = _750 * _750;
    float _754 = _686 * 6.283185482025146484375;
    float _756 = sin(_754);
    int _758 = as_type<int>(_750);
    int _760 = _732 ? (-1) : 0;
    if (_698)
    {
        int _762 = _732 ? 0 : 1078530011;
        _758 = _762;
    }
    int _764 = _758;
    if (_698)
    {
        int _766 = int(0x80000000) & as_type<int>(_660);
        int _768 = _764 | _766;
        _728 = _768;
    }
    int _770 = _728;
    float _772 = _686 * 6.283185482025146484375;
    float _774 = cos(_772);
    float _776 = -_744;
    float _778 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[18].w, _626);
    float _780 = _638 * _700;
    float _782 = fma(_778, _778, _752);
    float _784 = -_780;
    float _786 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[18].w, _638);
    bool _788 = !_684;
    bool _790 = _788 && _690;
    int _792 = _770;
    float _794 = as_type<float>(_770);
    if (!_790)
    {
        float _796 = abs(_660);
        bool _798 = _796 != as_type<float>(0x7f800000u /* inf */);
        bool _800 = isnan(_796);
        bool _802 = _798 || _800;
        bool _804 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _806 = _802 || _804;
        float _808 = abs(_670);
        bool _810 = _808 == as_type<float>(0x7f800000u /* inf */);
        float _812 = abs(_670);
        bool _814 = _812 == as_type<float>(0x7f800000u /* inf */);
        bool _816 = !_806;
        bool _818 = _814 && _816;
        if (_818)
        {
            bool _820 = as_type<int>(_670) >= 0;
            _760 = _820 ? (-1) : 0;
        }
        int _822 = _760;
        if (_818)
        {
            _792 = 1075235812;
        }
        int _824 = _792;
        int _826 = _824;
        if (_818)
        {
            int _828 = ~_822;
            int _830 = (_828 != 0) ? _824 : 1061752795;
            _826 = _830;
        }
        int _832 = _826;
        float _834 = as_type<float>(_832);
        if (_818)
        {
            int _836 = int(0x80000000) & as_type<int>(_660);
            int _838 = _832 | _836;
            _834 = as_type<float>(_838);
        }
        float _840 = _834;
        bool _842 = !_806;
        bool _844 = _842 && _810;
        _794 = _840;
        if (!_844)
        {
            float _846 = abs(_660);
            float _848 = abs(_670);
            float _850 = precise::max(_846, _848);
            float _852 = abs(_660);
            float _854 = abs(_670);
            float _856 = precise::min(_852, _854);
            float _858 = 1.0 / _850;
            float _860 = abs(_660);
            float _862 = abs(_670);
            bool _864 = _860 > _862;
            bool _866 = as_type<int>(_670) >= 0;
            float _868 = abs(_660);
            float _870 = abs(_670);
            float _872 = _868 + _870;
            int _874 = as_type<int>(_660) & int(0x80000000);
            bool _876 = _872 > as_type<float>(0x7f800000u /* inf */);
            bool _878 = isnan(_872);
            bool _880 = _876 || _878;
            bool _882 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _884 = _880 || _882;
            float _886 = _856 * _858;
            float _888 = _886 * _886;
            float _890 = _888 + 11.33538818359375;
            float _892 = fma(_888, _890, 28.84246826171875);
            float _894 = fma(_888, _892, 19.6966705322265625);
            float _896 = fma(_888, -0.82336294651031494140625, -5.674867153167724609375);
            float _898 = fma(_888, _896, -6.565555095672607421875);
            float _900 = 1.0 / _894;
            float _902 = _888 * _898;
            float _904 = _886 * _902;
            float _906 = fma(_904, _900, _886);
            float _908 = _906;
            _794 = _872;
            if (_864)
            {
                float _910 = -_906;
                float _912 = _910 + 1.57079637050628662109375;
                _908 = _912;
            }
            float _914 = _908;
            int _916 = as_type<int>(_914);
            if (!_866)
            {
                float _918 = -_914;
                float _920 = _918 + 3.1415927410125732421875;
                _916 = as_type<int>(_920);
            }
            int _922 = _916;
            if (!_884)
            {
                int _924 = _874 | _922;
                _794 = as_type<float>(_924);
            }
        }
    }
    float _926 = _794;
    float _928 = fma(_786, _786, _782);
    float _930 = _746 + _926;
    float _932 = _712 * _500;
    float _934 = _720 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _936 = _652 * _502;
    float _938 = _930 * 0.15915493667125701904296875;
    float _940 = sqrt(_928);
    float _942 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[191].z, _498);
    float _944 = _722 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _946 = _668 * _502;
    float _948 = -_936;
    float _950 = fma(_668, _500, _948);
    float _952 = _944 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _954 = _724 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _956 = _938 * 6.283185482025146484375;
    float _958 = sin(_956);
    float _960 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _950);
    float _962 = _934 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _964 = _954 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _966 = fma(_652, _500, _946);
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _942);
    float _970 = _938 * 6.283185482025146484375;
    float _972 = cos(_970);
    float _974 = _700 * _940;
    float _976 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _966);
    float _978 = _952 * _974;
    float _980 = _962 * _974;
    float _982 = _964 * _974;
    float _984 = _718 * 6.283185482025146484375;
    float _986 = sin(_984);
    float _988 = _978 * _960;
    float _990 = _774 * _958;
    float _992 = _980 * _968;
    float _994 = _982 * _976;
    float _996 = _742 * _988;
    float _998 = _756 * _972;
    float _1000 = _756 * _996;
    float _1002 = _756 * _958;
    float _1004 = _774 * _972;
    float _1006 = _972 * _742;
    float _1008 = _958 * _742;
    float _1010 = _774 * _996;
    float _1012 = -_990;
    float _1014 = fma(_986, _998, _1012);
    float _1016 = -_988;
    float _1018 = _986 * _1016;
    float _1020 = -_998;
    float _1022 = fma(_986, _990, _1020);
    float _1024 = fma(_1014, _992, _1000);
    float _1026 = fma(_986, _1002, _1004);
    float _1028 = fma(_1006, _992, _1018);
    float _1030 = fma(_986, _1004, _1002);
    float _1032 = fma(_1026, _994, _1024);
    float _1034 = fma(_1008, _994, _1028);
    float _1036 = fma(_1030, _992, _1010);
    float _1038 = _622 + _1032;
    float _1040 = _612 + _1034;
    float _1042 = fma(_1022, _994, _1036);
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1046 = _1038 + _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1050 = _1040 + _1048;
    float _1052 = _604 + _1042;
    float _1054 = _1046 * _1046;
    float _1056 = fma(_1050, _1050, _1054);
    float _1058 = sqrt(_1056);
    bool _1060 = _1058 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = _1042;
    float _1064 = _1054;
    float _1066 = _976;
    float _1068 = _1050;
    if (!_1060)
    {
        _1062 = _1040;
    }
    float _1070 = _1062;
    float _1072 = _1070;
    if (!_1060)
    {
        _1064 = _1038;
    }
    float _1074 = _1064;
    float _1076 = _1074;
    if (!_1060)
    {
        _1066 = _1052;
    }
    float _1078 = _1066;
    bool _1080 = !_1060;
    float _1082 = _1078;
    if (!_1080)
    {
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1088 = _1058 + _1086;
        float _1090 = rsqrt(_1056);
        float _1092 = _1088 * _1084;
        float _1094 = _1052 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1096 = _1092 * 0.15915493667125701904296875;
        float _1098 = _1096 * 6.283185482025146484375;
        float _1100 = cos(_1098);
        float _1102 = _1096 * 6.283185482025146484375;
        float _1104 = sin(_1102);
        float _1106 = _1100 + (-1.0);
        float _1108 = fma(_1104, _1094, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1106 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = _1090 * _1108;
        float _1114 = fma(_1052, _1100, _1110);
        float _1116 = fma(_1050, _1112, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1118 = fma(_1046, _1112, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1082 = _1114;
        _1072 = _1116;
        _1076 = _1118;
    }
    float _1120 = _1082;
    float _1122 = _1072;
    float _1124 = _1076;
    float _1126 = -_738;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1120);
    float _1130 = -_744;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1122);
    float _1134 = -_780;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1124);
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1140 = _1128 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1144 = _1132 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1148 = _1136 + _1146;
    float _1150 = _1140 * _1140;
    float _1152 = fma(_1144, _1144, _1150);
    float _1154 = fma(_1148, _1148, _1152);
    float _1156 = rsqrt(_1154);
    float _1158 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1160 = _1144 * _1158;
    float _1162 = _1148 * _1158;
    float _1164 = _1160 * _1160;
    float _1166 = _1162 * _1162;
    float _1168 = _1164 + _1166;
    float _1170 = sqrt(_1168);
    bool _1172 = _1170 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1176 = _1170 + _1174;
    float _1178 = _1152;
    float _1180 = _1168;
    float _1182 = _1176;
    float _1184 = _1140;
    float _1186 = _1158;
    if (_1172)
    {
        float _1188 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1178 = _1188;
    }
    float _1190 = _1178;
    if (_1172)
    {
        float _1192 = rsqrt(_1168);
        _1180 = _1192;
    }
    float _1194 = _1180;
    float _1196 = _1190;
    if (_1172)
    {
        float _1198 = _1176 * _1190;
        _1182 = _1198;
    }
    float _1200 = _1182;
    if (_1172)
    {
        float _1202 = _1200 * 0.15915493667125701904296875;
        _1068 = _1202;
    }
    float _1204 = _1068;
    float _1206 = _1148;
    float _1208 = _1204;
    if (_1172)
    {
        float _1210 = _1204 * 6.283185482025146484375;
        float _1212 = sin(_1210);
        _1206 = _1212;
    }
    float _1214 = _1206;
    float _1216 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1218 = precise::max(0.0, _1216);
    float _1220 = _1156;
    float _1222 = _1218;
    if (_1172)
    {
        float _1224 = _1204 * 6.283185482025146484375;
        float _1226 = cos(_1224);
        _1220 = _1226;
    }
    float _1228 = _1220;
    float _1230 = -_1158;
    float _1232 = -_1218;
    float _1234 = fma(_1140, _1230, _1232);
    if (_1172)
    {
        float _1236 = _1234 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1184 = _1236;
    }
    float _1238 = _1184;
    float _1240 = _1214;
    float _1242 = _1238;
    if (_1172)
    {
        float _1244 = fma(_1214, _1238, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1186 = _1244;
    }
    float _1246 = _1186;
    if (!_1172)
    {
        _1240 = _1160;
    }
    float _1248 = _1240;
    float _1250 = _1248;
    if (!_1172)
    {
        _1242 = _1234;
    }
    float _1252 = _1242;
    float _1254 = _1252;
    float _1256 = _1228;
    if (_1172)
    {
        float _1258 = _1228 + (-1.0);
        _1222 = _1258;
    }
    float _1260 = _1222;
    float _1262 = _1260;
    if (_1172)
    {
        float _1264 = _1194 * _1246;
        _1208 = _1264;
    }
    float _1266 = _1208;
    float _1268 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1270 = sqrt(_1154);
    if (_1172)
    {
        float _1272 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1196 = _1272;
    }
    float _1274 = _1196;
    float _1276 = _1274;
    if (_1172)
    {
        float _1278 = _1160 * _1266;
        _1250 = _1278;
    }
    float _1280 = _1250;
    if (!_1172)
    {
        _1262 = _1162;
    }
    float _1282 = _1262;
    float _1284 = _1282;
    if (_1172)
    {
        float _1286 = _1162 * _1266;
        _1284 = _1286;
    }
    float _1288 = _1284;
    if (_1172)
    {
        float _1290 = fma(_1234, _1228, _1274);
        _1254 = _1290;
    }
    float _1292 = _1254;
    if (!_1172)
    {
        _1256 = _1164;
    }
    float _1294 = _1256;
    float _1296 = _1294;
    if (_1172)
    {
        float _1298 = _1280 * _1280;
        _1296 = _1298;
    }
    float _1300 = _1296;
    if (!_1172)
    {
        _1276 = _1166;
    }
    float _1302 = _1276;
    float _1304 = _1302;
    if (_1172)
    {
        float _1306 = _1288 * _1288;
        _1304 = _1306;
    }
    float _1308 = _1304;
    float _1310 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1312 = fma(_1292, _1292, _1300);
    float _1314 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1316 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1268);
    float _1318 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1310);
    float _1320 = _1312 + _1308;
    float _1322 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1324 = fma(_1270, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1322);
    float _1326 = precise::clamp(_1324, 0.0, 1.0);
    float _1328 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1330 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1318);
    float _1332 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1314);
    float _1334 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1316);
    float _1336 = rsqrt(_1320);
    float _1338 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1340 = -_1326;
    float _1342 = _1340 + 1.0;
    float _1344 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1328);
    float _1346 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1348 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1332);
    float _1350 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1352 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1354 = abs(_1342);
    float _1356 = log2(_1354);
    float _1358 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1344);
    float _1360 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1362 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1352);
    float _1364 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1366 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1368 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1362);
    float _1370 = _1336 * _1280;
    float _1372 = _1336 * _1292;
    float _1374 = _1336 * _1288;
    float _1376 = -_1366;
    float _1378 = fma(_1376, _1346, 1.0);
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1382 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1368);
    float _1384 = -_1380;
    float _1386 = fma(_1372, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1384);
    float _1388 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1390 = 1.0 / _1382;
    float _1392 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1394 = -_1374;
    float _1396 = fma(_1394, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1386);
    float _1398 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1400 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1392);
    float _1402 = fma(_1396, -0.5, 0.5);
    float _1404 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1398);
    float _1406 = exp2(_1388);
    float _1408 = fma(_1396, 0.5, 0.5);
    float _1410 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1400);
    float _1412 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1404);
    float _1414 = _1372 + 1.0;
    float _1416 = fma(_1408, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1418 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1412);
    float _1420 = log2(_1378);
    float _1422 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1410);
    float _1424 = fma(_1408, _1416, -0.212114393711090087890625);
    float _1426 = _1418 * _1390;
    float _1428 = fma(_1408, _1424, 1.570728778839111328125);
    float _1430 = fma(_1426, 0.5, 0.5);
    float _1432 = sqrt(_1402);
    float _1434 = -_1372;
    float _1436 = fma(_1406, _1414, _1434);
    float _1438 = _1422 * _1390;
    float _1440 = fma(_1436, 0.5, 0.5);
    float _1442 = fma(_1438, -0.5, 0.5);
    float _1444 = _1420 * 0.693147182464599609375;
    float _1446 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1448 = _1432 * 0.636619746685028076171875;
    float _1450 = -_1428;
    float _1452 = fma(_1448, _1450, 1.0);
    float3 _4060 = float3(_1430, _1442, _1446);
    float _1454 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4060, float3(0.0), isnan(_4060)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4060, float3(0.0), isnan(_4060)), level(0.0)).x;
    float3 _4071 = float3(_1430, _1442, _1446);
    float4 _1457 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4071, float3(0.0), isnan(_4071)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4071, float3(0.0), isnan(_4071)), level(0.0)).xyzw;
    float _1459 = _1457.x;
    float _1461 = _1457.y;
    float _1463 = _1457.z;
    float _1465 = _1457.w;
    float2 _4088 = float2(_1452, _1440);
    float3 _1469 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4088, float2(0.0), isnan(_4088)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4088, float2(0.0), isnan(_4088)), level(0.0)).xyz;
    float _1471 = _1469.x;
    float _1473 = _1469.y;
    float _1475 = _1469.z;
    float _1477 = in.m_55.w;
    float _1479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1481 = _142 > 0.5;
    float _1483 = in.m_55.y;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1487 = _1485 != 0;
    float _1489 = -_738;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[18].w, _604);
    int _1493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1495 = _1493 != 0;
    float _1497 = in.m_49.w;
    int _1499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1501 = _1499 != 0;
    float _1503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1507 = _1505 != 0;
    float _1509 = in.m_55.z;
    float _1511 = -_744;
    float _1513 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[18].w, _612);
    float _1515 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1517 = -_780;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[18].w, _622);
    bool _1521 = _152 > 0.5;
    bool _1523 = _1521 && _1507;
    float _1525 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1527 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1515);
    float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1531 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1533 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1527);
    float _1535 = -_1477;
    float _1537 = _1535 + 1.0;
    float _1539 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1531);
    float _1541 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1543 = -_1483;
    float _1545 = _1543 + 1.0;
    float _1547 = _1477;
    float _1549 = _1483;
    float _1551 = _1545;
    float _1553 = _1519;
    if (_1487)
    {
        float _1555 = _1481 ? _1537 : _1477;
        _1547 = _1555;
    }
    float _1557 = _1547;
    float _1559 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1561 = _146 > 0.5;
    bool _1563 = _1561 && _1495;
    float _1565 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1567 = _1497 > 0.5;
    float _1569 = fma(_1559, _1557, -0.5);
    float _1571 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1573 = in.m_57.x;
    if (_1501)
    {
        float _1575 = _1567 ? _1545 : _1483;
        _1549 = _1575;
    }
    float _1577 = _1549;
    float _1579 = 1.0 / _1565;
    float _1581 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1571);
    float _1583 = in.m_55.x;
    float _1585 = _1577;
    if (_1507)
    {
        _1551 = _1509;
    }
    float _1587 = _1551;
    float _1589 = fma(_1541, _1577, -0.5);
    float _1591 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1581);
    float _1593 = _1587;
    if (!_1507)
    {
        _1553 = _1509;
    }
    float _1595 = _1553;
    float _1597 = in.m_57.z;
    float _1599 = _1595;
    if (_1523)
    {
        float _1601 = -_1587;
        float _1603 = _1601 + 1.0;
        _1593 = _1603;
    }
    float _1605 = _1593;
    float _1607 = _1591 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1609 = in.m_57.y;
    float _1611 = _1607 + _1565;
    if (_1507)
    {
        _1599 = _1605;
    }
    float _1613 = _1599;
    float _1615 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1617 = _1611 * _1579;
    float _1619 = _1617 * 0.5;
    float _1621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1629 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1627);
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_59.x = _1573;
    float _1633 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1635 = _1583;
    if (_1495)
    {
        _1585 = _1583;
    }
    float _1637 = _1585;
    float _1639 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1641 = in.m_57.w;
    float _1643 = _1615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1645 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1647 = _1637;
    if (_1563)
    {
        float _1649 = -_1637;
        float _1651 = _1649 + 1.0;
        _1647 = _1651;
    }
    float _1653 = _1647;
    out.m_59.z = _1597;
    float _1655 = 1.0 / _1629;
    float _1657 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1539);
    out.m_59.y = _1609;
    if (_1495)
    {
        _1635 = _1653;
    }
    float _1659 = _1635;
    bool _1661 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1663 = isnan(0.5);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1669 = _1665 || _1667;
    out.m_61.x = _1633;
    out.m_61.y = _1639;
    out.m_61.z = _1643;
    out.m_61.w = _1623;
    float _1671 = fma(_1645, _1613, -0.5);
    float _1673 = _1621 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1675 = exp2(_1525);
    float _1677 = -_496;
    float _1679 = fma(_490, _1589, _1677);
    float _1681 = fma(_484, _1671, _480);
    float _1683 = fma(_1673, _1659, -0.5);
    float _1685 = -_430;
    float _1687 = fma(_488, _1569, _1685);
    if (_1669)
    {
        _504 = 1.0;
    }
    float _1689 = _504;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1693 = _1655 * _1691;
    float _1695 = fma(_482, _1683, _494);
    float _1697 = _1689;
    if (_1669)
    {
        _506 = 1.0;
    }
    float _1699 = _506;
    float _1701 = _1699;
    if (!_1669)
    {
        float _1703 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1705 = _1703 * 0.15915493667125701904296875;
        float _1707 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1709 = _1705 * 6.283185482025146484375;
        float _1711 = cos(_1709);
        float _1713 = _1707 * 0.15915493667125701904296875;
        float _1715 = _1705 * 6.283185482025146484375;
        float _1717 = sin(_1715);
        float _1719 = 1.0 / _1711;
        float _1721 = _1713 * 6.283185482025146484375;
        float _1723 = cos(_1721);
        float _1725 = _1717 * _1719;
        float _1727 = _1713 * 6.283185482025146484375;
        float _1729 = sin(_1727);
        float _1731 = _1723 * _1725;
        float _1733 = 1.0 / _1731;
        float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1737 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1735;
        float _1739 = 1.0 / _1737;
        float _1741 = _1729 * _1733;
        float _1743 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1745 = fma(_1693, _1741, _1743);
        float _1747 = _1745 * _1739;
        float _1749 = precise::clamp(_1747, 0.0, 1.0);
        _1697 = _1749;
    }
    float _1751 = _1697;
    if (!_1669)
    {
        float _1753 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1755 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1757 = _1753 * 0.15915493667125701904296875;
        float _1759 = _1755 * 0.15915493667125701904296875;
        float _1761 = _1757 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        float _1765 = _1757 * 6.283185482025146484375;
        float _1767 = sin(_1765);
        float _1769 = 1.0 / _1763;
        float _1771 = _1759 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        float _1775 = _1767 * _1769;
        float _1777 = _1759 * 6.283185482025146484375;
        float _1779 = sin(_1777);
        float _1781 = _1773 * _1775;
        float _1783 = 1.0 / _1781;
        float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1787 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1785;
        float _1789 = 1.0 / _1787;
        float _1791 = _1779 * _1783;
        float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1795 = fma(_1693, _1791, _1793);
        float _1797 = _1795 * _1789;
        float _1799 = precise::clamp(_1797, 0.0, 1.0);
        float _1801 = -_1799;
        float _1803 = _1801 + 1.0;
        _1701 = _1803;
    }
    float _1805 = _1701;
    float _1807 = -_1675;
    float _1809 = _1807 + 1.0;
    float _1811 = _1751 * _1805;
    bool _1813 = _1751 > 0.0;
    bool _1815 = isnan(_1751);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan(0.0);
    bool _1821 = _1817 || _1819;
    float _1823 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1657);
    float _1825 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1827 = _1811 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1829 = _1805 <= 0.0;
    bool _1831 = !_1821;
    bool _1833 = _1829 || _1831;
    float _1835 = _1687 + 0.5;
    float _1837 = _1825 * _1454;
    float _1839 = _1681 + 0.5;
    float _1841 = _1695 + 0.5;
    float _1843 = _1679 + 0.5;
    float _1845 = _1827 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1847 = -_1825;
    float _1849 = _1847 + 1.0;
    float _1851 = _1823 + _1382;
    float _1853 = _1418 + _1382;
    float _1855 = _1382 * 0.5;
    float _1857 = _1465 * _1837;
    float _1859 = _1475 * _1837;
    out.m_63.x = _1839;
    out.m_63.y = _1835;
    out.m_63.z = _1841;
    out.m_63.w = _1843;
    float _1861 = _1465 * _1849;
    float _1863 = _1851 * 0.5;
    float _1865 = _1853 * 0.5;
    float _1867 = fma(_1422, -0.5, _1855);
    float _1869 = fma(_1471, _1857, _1459);
    float _1871 = fma(_1473, _1857, _1461);
    float _1873 = fma(_1465, _1859, _1463);
    out.m_59.w = _1641;
    out.m_45.x = _1845;
    out.gl_Position.x = _1418;
    out.gl_Position.y = _1422;
    out.gl_Position.z = _1823;
    out.gl_Position.w = _1382;
    out.m_65.x = _1865;
    out.m_65.y = _1867;
    out.m_65.z = _1863;
    out.m_65.w = _1382;
    out.m_67.x = _1869;
    out.m_67.y = _1871;
    out.m_67.z = _1873;
    out.m_67.w = _1861;
    if (!_1833)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1875 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1875;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_86);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    float _98 = _96;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_90)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1933 = as_type<float>(_104);
        out.gl_Position.z = _1933;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _126 = float(_86);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _94;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2002 = as_type<float>(_140);
        out.gl_Position.z = _2002;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.y;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = in.m_49.z;
    int _148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _150 = _148 != 0;
    float _152 = in.m_49.x;
    float _154 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _156 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _158 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _160 = _142 * 2.0;
    float _162 = _142 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _168 = _146 * 2.0;
    float _170 = fma(_162, -2.0, _156);
    float _172 = floor(_160);
    float _174 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _176 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _178 = precise::max(_174, _176);
    float _180 = _152 * 2.0;
    float _182 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _186 = _178 >= 16.0;
    float _188 = -_154;
    float _190 = fma(_182, 2.0, _188);
    float _192 = floor(_168);
    float _194 = _142 + _152;
    float _196 = _178;
    float _198 = _144;
    if (!_150)
    {
        _196 = _142;
    }
    float _200 = _196;
    float _202 = _200;
    if (_150)
    {
        _202 = _152;
    }
    float _204 = _202;
    float _206 = _194 + (-1.0);
    float _208 = floor(_180);
    float _210 = _152 + _146;
    bool _212 = _172 > 0.0;
    float _214 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _216 = _172 >= 0.0;
    bool _218 = isnan(_172);
    bool _220 = _216 || _218;
    bool _222 = isnan(0.0);
    bool _224 = _220 || _222;
    float _226 = _210 + (-1.0);
    float _228 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[83].z, _164);
    bool _230 = _192 >= 0.0;
    bool _232 = isnan(_192);
    bool _234 = _230 || _232;
    bool _236 = isnan(0.0);
    bool _238 = _234 || _236;
    float _240 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _242 = _192 > 0.0;
    float _244 = _204 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _246 = _238 ? 0 : 1;
    float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _250 = log2(_248);
    bool _252 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _256 = _252 || _254;
    bool _258 = isnan(1.0);
    bool _260 = _256 || _258;
    float _262 = -_166;
    float _264 = fma(_244, 2.0, _262);
    float _266 = _226;
    float _268 = _206;
    if (!_150)
    {
        _266 = _146;
    }
    float _270 = _266;
    float _272 = _270;
    if (!_150)
    {
        _268 = _146;
    }
    float _274 = _268;
    float _276 = _274;
    if (_150)
    {
        _272 = _142;
    }
    float _278 = _272;
    if (_150)
    {
        _276 = _142;
    }
    float _280 = _276;
    bool _282 = _208 > 0.0;
    bool _284 = _208 >= 0.0;
    bool _286 = isnan(_208);
    bool _288 = _284 || _286;
    bool _290 = isnan(0.0);
    bool _292 = _288 || _290;
    float _294 = _278 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _296 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[83].w, _158);
    int _298 = _224 ? 0 : 1;
    float _300 = 0.0;
    if (!_260)
    {
        float _302 = _144 * _144;
        float _304 = _302 * 0.5;
        _300 = _304;
    }
    float _306 = _300;
    int _308 = _292 ? 0 : 1;
    float _310 = fma(_294, -2.0, _184);
    int _312 = ~_246;
    int _314 = _312 + 1;
    int _316 = _314 + 1;
    float _318 = _250 * _122;
    int _320 = ~_298;
    int _322 = _320 + 1;
    int _324 = _322 + 1;
    float _326 = _306;
    int _328 = _316;
    int _330 = _324;
    if (!_260)
    {
        float _332 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _326 = _332;
    }
    float _334 = _326;
    int _336 = ~_308;
    int _338 = _336 + 1;
    int _340 = _338 + 1;
    int _342 = _340;
    float _344 = _334;
    if (!_242)
    {
        int _346 = ~_246;
        int _348 = _346 + 1;
        _328 = _348;
    }
    int _350 = _328;
    if (!_212)
    {
        int _352 = ~_298;
        int _354 = _352 + 1;
        _330 = _354;
    }
    int _356 = _330;
    if (!_282)
    {
        int _358 = ~_308;
        int _360 = _358 + 1;
        _342 = _360;
    }
    int _362 = _342;
    bool _364 = !_260;
    if (!_364)
    {
        float _366 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _368 = log2(_366);
        float _370 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _372 = _370 + 1.0;
        float _374 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _376 = _144 * _368;
        float _378 = 1.0 / _372;
        float _380 = _374 * 0.693147182464599609375;
        float _382 = exp2(_376);
        float _384 = 1.0 / _380;
        float _386 = _382 + (-1.0);
        float _388 = -_386;
        float _390 = fma(_388, _384, _144);
        float _392 = _390 * _378;
        float _394 = _392 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _344 = _394;
    }
    float _396 = _344;
    bool _398 = !_260;
    if (!_398)
    {
        float _400 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _402 = log2(_400);
        float _404 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _406 = _404 + 1.0;
        float _408 = 1.0 / _406;
        float _410 = _144 * _402;
        float _412 = exp2(_410);
        float _414 = -_412;
        float _416 = _414 + 1.0;
        float _418 = _416 * _408;
        _198 = _418;
    }
    float _420 = _198;
    float _422 = exp2(_318);
    float _424 = in.m_47.x;
    float _426 = in.m_47.y;
    float _428 = in.m_47.z;
    float _430 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _170);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _434 = 1.0 + _432;
    float _436 = in.m_51.w;
    bool _438 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _440 = isnan(1.0);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _446 = _442 || _444;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _450 = 1.0 / _434;
    float _452 = in.m_42.x;
    float _454 = in.m_42.y;
    float _456 = in.m_42.z;
    bool _458 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _460 = isnan(0.0);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _466 = _462 || _464;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _470 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].z, _448);
    float _472 = -_422;
    float _474 = _472 + 1.0;
    float _476 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[78].w, _468);
    float _478 = -_122;
    float _480 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[76].x, _190);
    float _482 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _228);
    float _484 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _470);
    float _486 = _466 ? _474 : 0.0;
    float _488 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _476);
    float _490 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _296);
    float _492 = -_122;
    float _494 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[81].x, _264);
    float _496 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _310);
    float _498 = in.m_53.x;
    float _500 = in.m_53.y;
    float _502 = in.m_53.z;
    float _504 = _490;
    float _506 = _484;
    if (_446)
    {
        float _508 = _486 * _450;
        _124 = _508;
    }
    float _510 = _124;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _518 = _516 != 0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _522 = _520 != 0;
    float _524 = _396 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _526 = _396 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _528 = _396 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _530 = fma(_420, _424, _524);
    float _532 = fma(_420, _426, _526);
    float _534 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _152);
    float _536 = fma(_420, _428, _528);
    float _538 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _540 = _534 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _542 = fma(_532, _436, _454);
    float _544 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _538);
    bool _546 = !_522;
    int _548 = _546 ? 0 : 1;
    float _550 = fma(_530, _436, _452);
    float _552 = float(_350);
    float _554 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _544);
    int _556 = abs(_548);
    float _558 = fma(_536, _436, _456);
    bool _560 = !_514;
    int _562 = _560 ? 0 : 1;
    float _564 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[191].y, _540);
    float _566 = rsqrt(_554);
    float _568 = float(_356);
    float _570 = _564 * 0.15915493667125701904296875;
    float _572 = float(_556);
    float _574 = _542 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _576 = abs(_562);
    float _578 = _542 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _580 = _542 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _582 = _572 * _568;
    float _584 = float(_576);
    float _586 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[5].x, _578);
    float _588 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[4].x, _574);
    float _590 = _582 * (-2.0);
    float _592 = fma(_550, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
    float _594 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[5].z, _586);
    float _596 = _584 * _552;
    float _598 = fma(_240, _590, _240);
    float _600 = _566 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _602 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[4].z, _588);
    float _604 = _594 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _606 = _596 * (-2.0);
    float _608 = fma(_558, (*spvDescriptorSet0.vp_c10)._m0[6].z, _592);
    float _610 = _600 * (-0.15915493667125701904296875);
    float _612 = _602 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _616 = _604 + _614;
    float _618 = _152 + (-0.5);
    float _620 = fma(_214, _606, _214);
    float _622 = _608 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _624 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _626 = _612 + _624;
    float _628 = _616 * _616;
    float _630 = _618 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _632 = !_518;
    int _634 = _632 ? 0 : 1;
    float _636 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _638 = _622 + _636;
    float _640 = fma(_626, _626, _628);
    float _642 = fma(_620, _510, _630);
    int _644 = abs(_634);
    float _646 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _648 = fma(_638, _638, _640);
    float _650 = _610 * 6.283185482025146484375;
    float _652 = sin(_650);
    float _654 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _656 = float(_644);
    float _658 = _142 + _146;
    float _660 = _186 ? _646 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _662 = _146 + (-0.5);
    float _664 = _658 + (-1.0);
    float _666 = _610 * 6.283185482025146484375;
    float _668 = cos(_666);
    float _670 = _186 ? _654 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _672 = _142 + (-0.5);
    float _674 = abs(_660);
    bool _676 = _674 != 0.0;
    bool _678 = isnan(_674);
    bool _680 = _676 || _678;
    bool _682 = isnan(0.0);
    bool _684 = _680 || _682;
    float _686 = _642 * 0.15915493667125701904296875;
    float _688 = abs(_670);
    bool _690 = _688 == 0.0;
    float _692 = abs(_670);
    bool _694 = _692 == 0.0;
    bool _696 = !_684;
    bool _698 = _694 && _696;
    float _700 = rsqrt(_648);
    float _702 = float(_362);
    float _704 = _662 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _706 = _656 * _702;
    float _708 = fma(_598, _510, _704);
    float _710 = _570 * 6.283185482025146484375;
    float _712 = sin(_710);
    float _714 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _716 = _706 * (-2.0);
    float _718 = _708 * 0.15915493667125701904296875;
    float _720 = in.m_51.x;
    float _722 = in.m_51.y;
    float _724 = in.m_51.z;
    bool _726 = _446;
    int _728 = as_type<int>(_510);
    if (_698)
    {
        bool _730 = as_type<int>(_670) >= 0;
        _726 = _730;
    }
    bool _732 = _726;
    float _734 = fma(_714, _716, _714);
    float _736 = _672 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _738 = _616 * _700;
    float _740 = _718 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _626 * _700;
    float _746 = fma(_734, _510, _736);
    float _748 = -_738;
    float _750 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[18].w, _616);
    float _752 = _750 * _750;
    float _754 = _686 * 6.283185482025146484375;
    float _756 = sin(_754);
    int _758 = as_type<int>(_750);
    int _760 = _732 ? (-1) : 0;
    if (_698)
    {
        int _762 = _732 ? 0 : 1078530011;
        _758 = _762;
    }
    int _764 = _758;
    if (_698)
    {
        int _766 = int(0x80000000) & as_type<int>(_660);
        int _768 = _764 | _766;
        _728 = _768;
    }
    int _770 = _728;
    float _772 = _686 * 6.283185482025146484375;
    float _774 = cos(_772);
    float _776 = -_744;
    float _778 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[18].w, _626);
    float _780 = _638 * _700;
    float _782 = fma(_778, _778, _752);
    float _784 = -_780;
    float _786 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[18].w, _638);
    bool _788 = !_684;
    bool _790 = _788 && _690;
    int _792 = _770;
    float _794 = as_type<float>(_770);
    if (!_790)
    {
        float _796 = abs(_660);
        bool _798 = _796 != as_type<float>(0x7f800000u /* inf */);
        bool _800 = isnan(_796);
        bool _802 = _798 || _800;
        bool _804 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _806 = _802 || _804;
        float _808 = abs(_670);
        bool _810 = _808 == as_type<float>(0x7f800000u /* inf */);
        float _812 = abs(_670);
        bool _814 = _812 == as_type<float>(0x7f800000u /* inf */);
        bool _816 = !_806;
        bool _818 = _814 && _816;
        if (_818)
        {
            bool _820 = as_type<int>(_670) >= 0;
            _760 = _820 ? (-1) : 0;
        }
        int _822 = _760;
        if (_818)
        {
            _792 = 1075235812;
        }
        int _824 = _792;
        int _826 = _824;
        if (_818)
        {
            int _828 = ~_822;
            int _830 = (_828 != 0) ? _824 : 1061752795;
            _826 = _830;
        }
        int _832 = _826;
        float _834 = as_type<float>(_832);
        if (_818)
        {
            int _836 = int(0x80000000) & as_type<int>(_660);
            int _838 = _832 | _836;
            _834 = as_type<float>(_838);
        }
        float _840 = _834;
        bool _842 = !_806;
        bool _844 = _842 && _810;
        _794 = _840;
        if (!_844)
        {
            float _846 = abs(_660);
            float _848 = abs(_670);
            float _850 = precise::max(_846, _848);
            float _852 = abs(_660);
            float _854 = abs(_670);
            float _856 = precise::min(_852, _854);
            float _858 = 1.0 / _850;
            float _860 = abs(_660);
            float _862 = abs(_670);
            bool _864 = _860 > _862;
            bool _866 = as_type<int>(_670) >= 0;
            float _868 = abs(_660);
            float _870 = abs(_670);
            float _872 = _868 + _870;
            int _874 = as_type<int>(_660) & int(0x80000000);
            bool _876 = _872 > as_type<float>(0x7f800000u /* inf */);
            bool _878 = isnan(_872);
            bool _880 = _876 || _878;
            bool _882 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _884 = _880 || _882;
            float _886 = _856 * _858;
            float _888 = _886 * _886;
            float _890 = _888 + 11.33538818359375;
            float _892 = fma(_888, _890, 28.84246826171875);
            float _894 = fma(_888, _892, 19.6966705322265625);
            float _896 = fma(_888, -0.82336294651031494140625, -5.674867153167724609375);
            float _898 = fma(_888, _896, -6.565555095672607421875);
            float _900 = 1.0 / _894;
            float _902 = _888 * _898;
            float _904 = _886 * _902;
            float _906 = fma(_904, _900, _886);
            float _908 = _906;
            _794 = _872;
            if (_864)
            {
                float _910 = -_906;
                float _912 = _910 + 1.57079637050628662109375;
                _908 = _912;
            }
            float _914 = _908;
            int _916 = as_type<int>(_914);
            if (!_866)
            {
                float _918 = -_914;
                float _920 = _918 + 3.1415927410125732421875;
                _916 = as_type<int>(_920);
            }
            int _922 = _916;
            if (!_884)
            {
                int _924 = _874 | _922;
                _794 = as_type<float>(_924);
            }
        }
    }
    float _926 = _794;
    float _928 = fma(_786, _786, _782);
    float _930 = _746 + _926;
    float _932 = _712 * _500;
    float _934 = _720 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _936 = _652 * _502;
    float _938 = _930 * 0.15915493667125701904296875;
    float _940 = sqrt(_928);
    float _942 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[191].z, _498);
    float _944 = _722 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _946 = _668 * _502;
    float _948 = -_936;
    float _950 = fma(_668, _500, _948);
    float _952 = _944 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _954 = _724 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _956 = _938 * 6.283185482025146484375;
    float _958 = sin(_956);
    float _960 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _950);
    float _962 = _934 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _964 = _954 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _966 = fma(_652, _500, _946);
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _942);
    float _970 = _938 * 6.283185482025146484375;
    float _972 = cos(_970);
    float _974 = _700 * _940;
    float _976 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _966);
    float _978 = _952 * _974;
    float _980 = _962 * _974;
    float _982 = _964 * _974;
    float _984 = _718 * 6.283185482025146484375;
    float _986 = sin(_984);
    float _988 = _978 * _960;
    float _990 = _774 * _958;
    float _992 = _980 * _968;
    float _994 = _982 * _976;
    float _996 = _742 * _988;
    float _998 = _756 * _972;
    float _1000 = _756 * _996;
    float _1002 = _756 * _958;
    float _1004 = _774 * _972;
    float _1006 = _972 * _742;
    float _1008 = _958 * _742;
    float _1010 = _774 * _996;
    float _1012 = -_990;
    float _1014 = fma(_986, _998, _1012);
    float _1016 = -_988;
    float _1018 = _986 * _1016;
    float _1020 = -_998;
    float _1022 = fma(_986, _990, _1020);
    float _1024 = fma(_1014, _992, _1000);
    float _1026 = fma(_986, _1002, _1004);
    float _1028 = fma(_1006, _992, _1018);
    float _1030 = fma(_986, _1004, _1002);
    float _1032 = fma(_1026, _994, _1024);
    float _1034 = fma(_1008, _994, _1028);
    float _1036 = fma(_1030, _992, _1010);
    float _1038 = _622 + _1032;
    float _1040 = _612 + _1034;
    float _1042 = fma(_1022, _994, _1036);
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1046 = _1038 + _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1050 = _1040 + _1048;
    float _1052 = _604 + _1042;
    float _1054 = _1046 * _1046;
    float _1056 = fma(_1050, _1050, _1054);
    float _1058 = sqrt(_1056);
    bool _1060 = _1058 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = _1042;
    float _1064 = _1054;
    float _1066 = _976;
    float _1068 = _1050;
    if (!_1060)
    {
        _1062 = _1040;
    }
    float _1070 = _1062;
    float _1072 = _1070;
    if (!_1060)
    {
        _1064 = _1038;
    }
    float _1074 = _1064;
    float _1076 = _1074;
    if (!_1060)
    {
        _1066 = _1052;
    }
    float _1078 = _1066;
    bool _1080 = !_1060;
    float _1082 = _1078;
    if (!_1080)
    {
        float _1084 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1088 = _1058 + _1086;
        float _1090 = rsqrt(_1056);
        float _1092 = _1088 * _1084;
        float _1094 = _1052 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1096 = _1092 * 0.15915493667125701904296875;
        float _1098 = _1096 * 6.283185482025146484375;
        float _1100 = cos(_1098);
        float _1102 = _1096 * 6.283185482025146484375;
        float _1104 = sin(_1102);
        float _1106 = _1100 + (-1.0);
        float _1108 = fma(_1104, _1094, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1106 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = _1090 * _1108;
        float _1114 = fma(_1052, _1100, _1110);
        float _1116 = fma(_1050, _1112, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1118 = fma(_1046, _1112, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1082 = _1114;
        _1072 = _1116;
        _1076 = _1118;
    }
    float _1120 = _1082;
    float _1122 = _1072;
    float _1124 = _1076;
    float _1126 = -_738;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1120);
    float _1130 = -_744;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1122);
    float _1134 = -_780;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1124);
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1140 = _1128 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1144 = _1132 + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1148 = _1136 + _1146;
    float _1150 = _1140 * _1140;
    float _1152 = fma(_1144, _1144, _1150);
    float _1154 = fma(_1148, _1148, _1152);
    float _1156 = rsqrt(_1154);
    float _1158 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1160 = _1144 * _1158;
    float _1162 = _1148 * _1158;
    float _1164 = _1160 * _1160;
    float _1166 = _1162 * _1162;
    float _1168 = _1164 + _1166;
    float _1170 = sqrt(_1168);
    bool _1172 = _1170 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1176 = _1170 + _1174;
    float _1178 = _1152;
    float _1180 = _1168;
    float _1182 = _1176;
    float _1184 = _1140;
    float _1186 = _1158;
    if (_1172)
    {
        float _1188 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1178 = _1188;
    }
    float _1190 = _1178;
    if (_1172)
    {
        float _1192 = rsqrt(_1168);
        _1180 = _1192;
    }
    float _1194 = _1180;
    float _1196 = _1190;
    if (_1172)
    {
        float _1198 = _1176 * _1190;
        _1182 = _1198;
    }
    float _1200 = _1182;
    if (_1172)
    {
        float _1202 = _1200 * 0.15915493667125701904296875;
        _1068 = _1202;
    }
    float _1204 = _1068;
    float _1206 = _1148;
    float _1208 = _1204;
    if (_1172)
    {
        float _1210 = _1204 * 6.283185482025146484375;
        float _1212 = sin(_1210);
        _1206 = _1212;
    }
    float _1214 = _1206;
    float _1216 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1218 = precise::max(0.0, _1216);
    float _1220 = _1156;
    float _1222 = _1218;
    if (_1172)
    {
        float _1224 = _1204 * 6.283185482025146484375;
        float _1226 = cos(_1224);
        _1220 = _1226;
    }
    float _1228 = _1220;
    float _1230 = -_1158;
    float _1232 = -_1218;
    float _1234 = fma(_1140, _1230, _1232);
    if (_1172)
    {
        float _1236 = _1234 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1184 = _1236;
    }
    float _1238 = _1184;
    float _1240 = _1214;
    float _1242 = _1238;
    if (_1172)
    {
        float _1244 = fma(_1214, _1238, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1186 = _1244;
    }
    float _1246 = _1186;
    if (!_1172)
    {
        _1240 = _1160;
    }
    float _1248 = _1240;
    float _1250 = _1248;
    if (!_1172)
    {
        _1242 = _1234;
    }
    float _1252 = _1242;
    float _1254 = _1252;
    float _1256 = _1228;
    if (_1172)
    {
        float _1258 = _1228 + (-1.0);
        _1222 = _1258;
    }
    float _1260 = _1222;
    float _1262 = _1260;
    if (_1172)
    {
        float _1264 = _1194 * _1246;
        _1208 = _1264;
    }
    float _1266 = _1208;
    float _1268 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1270 = sqrt(_1154);
    if (_1172)
    {
        float _1272 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1196 = _1272;
    }
    float _1274 = _1196;
    float _1276 = _1274;
    if (_1172)
    {
        float _1278 = _1160 * _1266;
        _1250 = _1278;
    }
    float _1280 = _1250;
    if (!_1172)
    {
        _1262 = _1162;
    }
    float _1282 = _1262;
    float _1284 = _1282;
    if (_1172)
    {
        float _1286 = _1162 * _1266;
        _1284 = _1286;
    }
    float _1288 = _1284;
    if (_1172)
    {
        float _1290 = fma(_1234, _1228, _1274);
        _1254 = _1290;
    }
    float _1292 = _1254;
    if (!_1172)
    {
        _1256 = _1164;
    }
    float _1294 = _1256;
    float _1296 = _1294;
    if (_1172)
    {
        float _1298 = _1280 * _1280;
        _1296 = _1298;
    }
    float _1300 = _1296;
    if (!_1172)
    {
        _1276 = _1166;
    }
    float _1302 = _1276;
    float _1304 = _1302;
    if (_1172)
    {
        float _1306 = _1288 * _1288;
        _1304 = _1306;
    }
    float _1308 = _1304;
    float _1310 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1312 = fma(_1292, _1292, _1300);
    float _1314 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1316 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1268);
    float _1318 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1310);
    float _1320 = _1312 + _1308;
    float _1322 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1324 = fma(_1270, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1322);
    float _1326 = precise::clamp(_1324, 0.0, 1.0);
    float _1328 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1330 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1318);
    float _1332 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1314);
    float _1334 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1316);
    float _1336 = rsqrt(_1320);
    float _1338 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1340 = -_1326;
    float _1342 = _1340 + 1.0;
    float _1344 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1328);
    float _1346 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1348 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1332);
    float _1350 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1352 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1354 = abs(_1342);
    float _1356 = log2(_1354);
    float _1358 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1344);
    float _1360 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1362 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1352);
    float _1364 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1366 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1368 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1362);
    float _1370 = _1336 * _1280;
    float _1372 = _1336 * _1292;
    float _1374 = _1336 * _1288;
    float _1376 = -_1366;
    float _1378 = fma(_1376, _1346, 1.0);
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1382 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1368);
    float _1384 = -_1380;
    float _1386 = fma(_1372, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1384);
    float _1388 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1390 = 1.0 / _1382;
    float _1392 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1394 = -_1374;
    float _1396 = fma(_1394, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1386);
    float _1398 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1400 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1392);
    float _1402 = fma(_1396, -0.5, 0.5);
    float _1404 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1398);
    float _1406 = exp2(_1388);
    float _1408 = fma(_1396, 0.5, 0.5);
    float _1410 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1400);
    float _1412 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1404);
    float _1414 = _1372 + 1.0;
    float _1416 = fma(_1408, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1418 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1412);
    float _1420 = log2(_1378);
    float _1422 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1410);
    float _1424 = fma(_1408, _1416, -0.212114393711090087890625);
    float _1426 = _1418 * _1390;
    float _1428 = fma(_1408, _1424, 1.570728778839111328125);
    float _1430 = fma(_1426, 0.5, 0.5);
    float _1432 = sqrt(_1402);
    float _1434 = -_1372;
    float _1436 = fma(_1406, _1414, _1434);
    float _1438 = _1422 * _1390;
    float _1440 = fma(_1436, 0.5, 0.5);
    float _1442 = fma(_1438, -0.5, 0.5);
    float _1444 = _1420 * 0.693147182464599609375;
    float _1446 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1448 = _1432 * 0.636619746685028076171875;
    float _1450 = -_1428;
    float _1452 = fma(_1448, _1450, 1.0);
    float3 _4060 = float3(_1430, _1442, _1446);
    float _1454 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4060, float3(0.0), isnan(_4060)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4060, float3(0.0), isnan(_4060)), level(0.0)).x;
    float3 _4071 = float3(_1430, _1442, _1446);
    float4 _1457 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4071, float3(0.0), isnan(_4071)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4071, float3(0.0), isnan(_4071)), level(0.0)).xyzw;
    float _1459 = _1457.x;
    float _1461 = _1457.y;
    float _1463 = _1457.z;
    float _1465 = _1457.w;
    float2 _4088 = float2(_1452, _1440);
    float3 _1469 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4088, float2(0.0), isnan(_4088)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4088, float2(0.0), isnan(_4088)), level(0.0)).xyz;
    float _1471 = _1469.x;
    float _1473 = _1469.y;
    float _1475 = _1469.z;
    float _1477 = in.m_55.w;
    float _1479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1481 = _142 > 0.5;
    float _1483 = in.m_55.y;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1487 = _1485 != 0;
    float _1489 = -_738;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[18].w, _604);
    int _1493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1495 = _1493 != 0;
    float _1497 = in.m_49.w;
    int _1499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1501 = _1499 != 0;
    float _1503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1507 = _1505 != 0;
    float _1509 = in.m_55.z;
    float _1511 = -_744;
    float _1513 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[18].w, _612);
    float _1515 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1517 = -_780;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[18].w, _622);
    bool _1521 = _152 > 0.5;
    bool _1523 = _1521 && _1507;
    float _1525 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1527 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1515);
    float _1529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1531 = _1338 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1533 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1527);
    float _1535 = -_1477;
    float _1537 = _1535 + 1.0;
    float _1539 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1531);
    float _1541 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1543 = -_1483;
    float _1545 = _1543 + 1.0;
    float _1547 = _1477;
    float _1549 = _1483;
    float _1551 = _1545;
    float _1553 = _1519;
    if (_1487)
    {
        float _1555 = _1481 ? _1537 : _1477;
        _1547 = _1555;
    }
    float _1557 = _1547;
    float _1559 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1561 = _146 > 0.5;
    bool _1563 = _1561 && _1495;
    float _1565 = _1533 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1567 = _1497 > 0.5;
    float _1569 = fma(_1559, _1557, -0.5);
    float _1571 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1573 = in.m_57.x;
    if (_1501)
    {
        float _1575 = _1567 ? _1545 : _1483;
        _1549 = _1575;
    }
    float _1577 = _1549;
    float _1579 = 1.0 / _1565;
    float _1581 = fma(_1513, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1571);
    float _1583 = in.m_55.x;
    float _1585 = _1577;
    if (_1507)
    {
        _1551 = _1509;
    }
    float _1587 = _1551;
    float _1589 = fma(_1541, _1577, -0.5);
    float _1591 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1581);
    float _1593 = _1587;
    if (!_1507)
    {
        _1553 = _1509;
    }
    float _1595 = _1553;
    float _1597 = in.m_57.z;
    float _1599 = _1595;
    if (_1523)
    {
        float _1601 = -_1587;
        float _1603 = _1601 + 1.0;
        _1593 = _1603;
    }
    float _1605 = _1593;
    float _1607 = _1591 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1609 = in.m_57.y;
    float _1611 = _1607 + _1565;
    if (_1507)
    {
        _1599 = _1605;
    }
    float _1613 = _1599;
    float _1615 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1617 = _1611 * _1579;
    float _1619 = _1617 * 0.5;
    float _1621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1627 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1629 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1627);
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_59.x = _1573;
    float _1633 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1635 = _1583;
    if (_1495)
    {
        _1585 = _1583;
    }
    float _1637 = _1585;
    float _1639 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1641 = in.m_57.w;
    float _1643 = _1615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1645 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1647 = _1637;
    if (_1563)
    {
        float _1649 = -_1637;
        float _1651 = _1649 + 1.0;
        _1647 = _1651;
    }
    float _1653 = _1647;
    out.m_59.z = _1597;
    float _1655 = 1.0 / _1629;
    float _1657 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1539);
    out.m_59.y = _1609;
    if (_1495)
    {
        _1635 = _1653;
    }
    float _1659 = _1635;
    bool _1661 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1663 = isnan(0.5);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1669 = _1665 || _1667;
    out.m_61.x = _1633;
    out.m_61.y = _1639;
    out.m_61.z = _1643;
    out.m_61.w = _1623;
    float _1671 = fma(_1645, _1613, -0.5);
    float _1673 = _1621 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1675 = exp2(_1525);
    float _1677 = -_496;
    float _1679 = fma(_490, _1589, _1677);
    float _1681 = fma(_484, _1671, _480);
    float _1683 = fma(_1673, _1659, -0.5);
    float _1685 = -_430;
    float _1687 = fma(_488, _1569, _1685);
    if (_1669)
    {
        _504 = 1.0;
    }
    float _1689 = _504;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1693 = _1655 * _1691;
    float _1695 = fma(_482, _1683, _494);
    float _1697 = _1689;
    if (_1669)
    {
        _506 = 1.0;
    }
    float _1699 = _506;
    float _1701 = _1699;
    if (!_1669)
    {
        float _1703 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1705 = _1703 * 0.15915493667125701904296875;
        float _1707 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1709 = _1705 * 6.283185482025146484375;
        float _1711 = cos(_1709);
        float _1713 = _1707 * 0.15915493667125701904296875;
        float _1715 = _1705 * 6.283185482025146484375;
        float _1717 = sin(_1715);
        float _1719 = 1.0 / _1711;
        float _1721 = _1713 * 6.283185482025146484375;
        float _1723 = cos(_1721);
        float _1725 = _1717 * _1719;
        float _1727 = _1713 * 6.283185482025146484375;
        float _1729 = sin(_1727);
        float _1731 = _1723 * _1725;
        float _1733 = 1.0 / _1731;
        float _1735 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1737 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1735;
        float _1739 = 1.0 / _1737;
        float _1741 = _1729 * _1733;
        float _1743 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1745 = fma(_1693, _1741, _1743);
        float _1747 = _1745 * _1739;
        float _1749 = precise::clamp(_1747, 0.0, 1.0);
        _1697 = _1749;
    }
    float _1751 = _1697;
    if (!_1669)
    {
        float _1753 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1755 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1757 = _1753 * 0.15915493667125701904296875;
        float _1759 = _1755 * 0.15915493667125701904296875;
        float _1761 = _1757 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        float _1765 = _1757 * 6.283185482025146484375;
        float _1767 = sin(_1765);
        float _1769 = 1.0 / _1763;
        float _1771 = _1759 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        float _1775 = _1767 * _1769;
        float _1777 = _1759 * 6.283185482025146484375;
        float _1779 = sin(_1777);
        float _1781 = _1773 * _1775;
        float _1783 = 1.0 / _1781;
        float _1785 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1787 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1785;
        float _1789 = 1.0 / _1787;
        float _1791 = _1779 * _1783;
        float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1795 = fma(_1693, _1791, _1793);
        float _1797 = _1795 * _1789;
        float _1799 = precise::clamp(_1797, 0.0, 1.0);
        float _1801 = -_1799;
        float _1803 = _1801 + 1.0;
        _1701 = _1803;
    }
    float _1805 = _1701;
    float _1807 = -_1675;
    float _1809 = _1807 + 1.0;
    float _1811 = _1751 * _1805;
    bool _1813 = _1751 > 0.0;
    bool _1815 = isnan(_1751);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan(0.0);
    bool _1821 = _1817 || _1819;
    float _1823 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1657);
    float _1825 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1827 = _1811 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1829 = _1805 <= 0.0;
    bool _1831 = !_1821;
    bool _1833 = _1829 || _1831;
    float _1835 = _1687 + 0.5;
    float _1837 = _1825 * _1454;
    float _1839 = _1681 + 0.5;
    float _1841 = _1695 + 0.5;
    float _1843 = _1679 + 0.5;
    float _1845 = _1827 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1847 = -_1825;
    float _1849 = _1847 + 1.0;
    float _1851 = _1823 + _1382;
    float _1853 = _1418 + _1382;
    float _1855 = _1382 * 0.5;
    float _1857 = _1465 * _1837;
    float _1859 = _1475 * _1837;
    out.m_63.x = _1839;
    out.m_63.y = _1835;
    out.m_63.z = _1841;
    out.m_63.w = _1843;
    float _1861 = _1465 * _1849;
    float _1863 = _1851 * 0.5;
    float _1865 = _1853 * 0.5;
    float _1867 = fma(_1422, -0.5, _1855);
    float _1869 = fma(_1471, _1857, _1459);
    float _1871 = fma(_1473, _1857, _1461);
    float _1873 = fma(_1465, _1859, _1463);
    out.m_59.w = _1641;
    out.m_45.x = _1845;
    out.gl_Position.x = _1418;
    out.gl_Position.y = _1422;
    out.gl_Position.z = _1823;
    out.gl_Position.w = _1382;
    out.m_65.x = _1865;
    out.m_65.y = _1867;
    out.m_65.z = _1863;
    out.m_65.w = _1382;
    out.m_67.x = _1869;
    out.m_67.y = _1871;
    out.m_67.z = _1873;
    out.m_67.w = _1861;
    if (!_1833)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1875 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1875;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

