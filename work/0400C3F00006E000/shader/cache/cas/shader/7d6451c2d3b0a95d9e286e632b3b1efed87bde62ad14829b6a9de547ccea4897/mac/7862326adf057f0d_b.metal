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
    float4 m_63 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1388 = as_type<float>(_104);
        out.gl_Position.z = _1388;
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
        float _1458 = as_type<float>(_142);
        out.gl_Position.z = _1458;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.x;
    float _146 = in.m_49.y;
    float _148 = in.m_49.z;
    float _150 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _152 = log2(_150);
    float _154 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = 0.0;
    float _168 = _154;
    if (!_164)
    {
        float _170 = _154 * _154;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_164)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    float _182 = _148 * 2.0;
    float _184 = _144 * 2.0;
    float _186 = _146 * 2.0;
    float _188 = floor(_184);
    float _190 = floor(_182);
    bool _192 = _190 > 0.0;
    bool _194 = _190 >= 0.0;
    bool _196 = isnan(_190);
    bool _198 = _194 || _196;
    bool _200 = isnan(0.0);
    bool _202 = _198 || _200;
    bool _204 = !_164;
    float _206 = _180;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _154 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _154);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_164;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _154 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _168 = _260;
    }
    float _262 = _168;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _266 = _264 != 0;
    int _268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _270 = _268 != 0;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _274 = _272 != 0;
    float _276 = floor(_186);
    bool _278 = _188 > 0.0;
    float _280 = _152 * _122;
    int _282 = _202 ? 0 : 1;
    float _284 = in.m_51.w;
    bool _286 = _188 >= 0.0;
    bool _288 = isnan(_188);
    bool _290 = _286 || _288;
    bool _292 = isnan(0.0);
    bool _294 = _290 || _292;
    int _296 = ~_282;
    int _298 = _296 + 1;
    int _300 = _298 + 1;
    float _302 = exp2(_280);
    int _304 = _300;
    if (!_192)
    {
        int _306 = ~_282;
        int _308 = _306 + 1;
        _304 = _308;
    }
    int _310 = _304;
    bool _312 = !_266;
    int _314 = _312 ? 0 : 1;
    int _316 = _294 ? 0 : 1;
    int _318 = abs(_314);
    int _320 = ~_316;
    int _322 = _320 + 1;
    int _324 = _322 + 1;
    float _326 = _146 + _144;
    float _328 = float(_310);
    float _330 = _326 + (-1.0);
    int _332 = _324;
    if (!_278)
    {
        int _334 = ~_316;
        int _336 = _334 + 1;
        _332 = _336;
    }
    int _338 = _332;
    float _340 = -_302;
    float _342 = _340 + 1.0;
    float _344 = in.m_53.x;
    float _346 = in.m_53.y;
    float _348 = in.m_53.z;
    bool _350 = _276 > 0.0;
    bool _352 = _276 >= 0.0;
    bool _354 = isnan(_276);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _364 = 1.0 + _362;
    float _366 = float(_318);
    bool _368 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _370 = isnan(1.0);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _376 = _372 || _374;
    float _378 = 1.0 / _364;
    bool _380 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _382 = isnan(0.0);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _388 = _384 || _386;
    float _390 = _366 * _328;
    bool _392 = !_270;
    int _394 = _392 ? 0 : 1;
    float _396 = _390 * (-2.0);
    int _398 = abs(_394);
    float _400 = float(_338);
    float _402 = float(_398);
    float _404 = _388 ? _342 : 0.0;
    float _406 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _408 = _144 + (-0.5);
    float _410 = _402 * _400;
    float _412 = fma(_396, _344, _344);
    if (_376)
    {
        float _414 = _404 * _378;
        _124 = _414;
    }
    float _416 = _124;
    bool _418 = !_274;
    int _420 = _418 ? 0 : 1;
    float _422 = _146 + _148;
    float _424 = fma(_406, _396, _406);
    int _426 = _360 ? 0 : 1;
    float _428 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[196].x, _412);
    float _430 = _422 + (-1.0);
    int _432 = abs(_420);
    float _434 = _410 * (-2.0);
    int _436 = ~_426;
    int _438 = _436 + 1;
    int _440 = _438 + 1;
    float _442 = fma(_424, _416, _428);
    int _444 = _440;
    if (!_350)
    {
        int _446 = ~_426;
        int _448 = _446 + 1;
        _444 = _448;
    }
    int _450 = _444;
    float _452 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _454 = fma(_434, _346, _346);
    float _456 = float(_450);
    float _458 = fma(_452, _434, _452);
    float _460 = float(_432);
    float _462 = _442 * 0.15915493667125701904296875;
    float _464 = _146 + (-0.5);
    float _466 = in.m_51.x;
    float _468 = in.m_51.y;
    float _470 = in.m_51.z;
    float _472 = _144 + _148;
    float _474 = _460 * _456;
    float _476 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[196].y, _454);
    float _478 = in.m_55.x;
    float _480 = _472 + (-1.0);
    float _482 = _474 * (-2.0);
    float _484 = in.m_55.y;
    float _486 = fma(_458, _416, _476);
    float _488 = _148 + (-0.5);
    float _490 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _492 = fma(_482, _348, _348);
    float _494 = in.m_55.z;
    float _496 = _486 * 0.15915493667125701904296875;
    float _498 = fma(_490, _482, _490);
    float _500 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[196].z, _492);
    float _502 = in.m_47.x;
    float _504 = in.m_47.y;
    float _506 = in.m_47.z;
    float _508 = _462 * 6.283185482025146484375;
    float _510 = sin(_508);
    float _512 = fma(_498, _416, _500);
    float _514 = in.m_42.x;
    float _516 = in.m_42.y;
    float _518 = in.m_42.z;
    float _520 = _466 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _522 = _512 * 0.15915493667125701904296875;
    float _524 = _462 * 6.283185482025146484375;
    float _526 = cos(_524);
    float _528 = _468 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _530 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _478);
    float _534 = _470 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _536 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _538 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _484);
    float _540 = _496 * 6.283185482025146484375;
    float _542 = sin(_540);
    float _544 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _546 = _538 * _536;
    float _548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _494);
    float _550 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _552 = _548 * _544;
    float _554 = _496 * 6.283185482025146484375;
    float _556 = cos(_554);
    float _558 = fma(_262, _504, _550);
    float _560 = fma(_558, _284, _516);
    float _562 = _522 * 6.283185482025146484375;
    float _564 = sin(_562);
    float _566 = _532 * _530;
    float _568 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _570 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _572 = _510 * _542;
    float _574 = _526 * _542;
    float _576 = fma(_262, _502, _568);
    float _578 = fma(_262, _506, _570);
    float _580 = _522 * 6.283185482025146484375;
    float _582 = cos(_580);
    float _584 = _526 * _556;
    float _586 = fma(_576, _284, _514);
    float _588 = fma(_564, _584, _572);
    float _590 = fma(_564, _572, _584);
    float _592 = fma(_578, _284, _518);
    float _594 = _582 * _546;
    float _596 = _542 * _582;
    float _598 = _556 * _582;
    float _600 = _510 * _556;
    float _602 = _526 * _594;
    float _604 = -_546;
    float _606 = _564 * _604;
    float _608 = _510 * _594;
    float _610 = -_574;
    float _612 = fma(_564, _600, _610);
    float _614 = -_600;
    float _616 = fma(_564, _574, _614);
    float _618 = fma(_588, _566, _602);
    float _620 = fma(_598, _566, _606);
    float _622 = fma(_612, _566, _608);
    float _624 = _560 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _626 = fma(_616, _552, _618);
    float _628 = fma(_596, _552, _620);
    float _630 = _560 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _632 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[6].x, _624);
    float _634 = _626 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _636 = fma(_590, _552, _622);
    float _638 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[4].x, _630);
    float _640 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[6].z, _632);
    float _642 = _626 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _644 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[10].x, _634);
    float _646 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[4].z, _638);
    float _648 = _640 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _650 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[8].x, _642);
    float _652 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[10].z, _644);
    float _654 = _646 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _656 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[8].z, _650);
    float _658 = _648 + _652;
    float _660 = _654 + _656;
    float _662 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _664 = _658 + _662;
    float _666 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _668 = _660 + _666;
    float _670 = _664 * _664;
    float _672 = fma(_668, _668, _670);
    float _674 = _560 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _676 = sqrt(_672);
    float _678 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[5].x, _674);
    float _680 = _626 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _682 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[5].z, _678);
    float _684 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[9].x, _680);
    float _686 = _682 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _688 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[9].z, _684);
    float _690 = _686 + _688;
    bool _692 = _676 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _694 = _682;
    float _696 = _636;
    float _698 = _660;
    float _700 = _668;
    float _702 = _622;
    float _704 = _672;
    float _706 = 0.5;
    float _708 = _648;
    if (!_692)
    {
        _694 = _658;
    }
    float _710 = _694;
    float _712 = _710;
    if (!_692)
    {
        _696 = _690;
    }
    float _714 = _696;
    bool _716 = !_692;
    float _718 = _714;
    if (!_716)
    {
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _722 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _724 = _676 + _722;
        float _726 = rsqrt(_672);
        float _728 = _724 * _720;
        float _730 = _690 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _732 = _728 * 0.15915493667125701904296875;
        float _734 = _732 * 6.283185482025146484375;
        float _736 = cos(_734);
        float _738 = _732 * 6.283185482025146484375;
        float _740 = sin(_738);
        float _742 = _736 + (-1.0);
        float _744 = _742 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _746 = fma(_740, _730, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _748 = fma(_690, _736, _744);
        float _750 = _726 * _746;
        float _752 = fma(_668, _750, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _754 = fma(_664, _750, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _718 = _748;
        _698 = _752;
        _712 = _754;
    }
    float _756 = _718;
    float _758 = _698;
    float _760 = _712;
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _764 = _756 + _762;
    float _766 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _768 = _758 + _766;
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _772 = _760 + _770;
    float _774 = _764 * _764;
    float _776 = fma(_768, _768, _774);
    float _778 = fma(_772, _772, _776);
    float _780 = rsqrt(_778);
    float _782 = sqrt(_778);
    float _784 = _780 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _786 = _768 * _784;
    float _788 = _772 * _784;
    float _790 = _786 * _786;
    float _792 = _788 * _788;
    float _794 = _790 + _792;
    float _796 = sqrt(_794);
    bool _798 = _796 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _800 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _802 = _796 + _800;
    float _804 = _780;
    float _806 = _794;
    float _808 = _802;
    float _810 = _764;
    if (_798)
    {
        float _812 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _804 = _812;
    }
    float _814 = _804;
    if (_798)
    {
        float _816 = rsqrt(_794);
        _806 = _816;
    }
    float _818 = _806;
    float _820 = _818;
    if (_798)
    {
        float _822 = _802 * _814;
        _808 = _822;
    }
    float _824 = _808;
    if (_798)
    {
        float _826 = _824 * 0.15915493667125701904296875;
        _700 = _826;
    }
    float _828 = _700;
    float _830 = _772;
    if (_798)
    {
        float _832 = _828 * 6.283185482025146484375;
        float _834 = sin(_832);
        _830 = _834;
    }
    float _836 = _830;
    float _838 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _840 = precise::max(0.0, _838);
    float _842 = _814;
    float _844 = _840;
    if (_798)
    {
        float _846 = _828 * 6.283185482025146484375;
        float _848 = cos(_846);
        _842 = _848;
    }
    float _850 = _842;
    float _852 = -_784;
    float _854 = -_840;
    float _856 = fma(_764, _852, _854);
    if (_798)
    {
        float _858 = _856 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _810 = _858;
    }
    float _860 = _810;
    float _862 = _756 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _864 = _860;
    float _866 = _836;
    if (_798)
    {
        float _868 = fma(_836, _860, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _864 = _868;
    }
    float _870 = _864;
    float _872 = _870;
    if (!_798)
    {
        _866 = _786;
    }
    float _874 = _866;
    float _876 = _874;
    float _878 = _850;
    if (_798)
    {
        float _880 = _850 + (-1.0);
        _844 = _880;
    }
    float _882 = _844;
    float _884 = _882;
    if (_798)
    {
        float _886 = _818 * _870;
        _702 = _886;
    }
    float _888 = _702;
    if (!_798)
    {
        _872 = _856;
    }
    float _890 = _872;
    float _892 = _890;
    if (_798)
    {
        float _894 = _882 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _704 = _894;
    }
    float _896 = _704;
    if (_798)
    {
        float _898 = _786 * _888;
        _876 = _898;
    }
    float _900 = _876;
    if (!_798)
    {
        _884 = _788;
    }
    float _902 = _884;
    float _904 = _902;
    if (_798)
    {
        float _906 = _788 * _888;
        _904 = _906;
    }
    float _908 = _904;
    if (!_798)
    {
        _820 = _790;
    }
    float _910 = _820;
    float _912 = _910;
    if (_798)
    {
        float _914 = fma(_856, _850, _896);
        _892 = _914;
    }
    float _916 = _892;
    if (_798)
    {
        float _918 = _900 * _900;
        _912 = _918;
    }
    float _920 = _912;
    if (!_798)
    {
        _878 = _792;
    }
    float _922 = _878;
    float _924 = _922;
    if (_798)
    {
        float _926 = _908 * _908;
        _924 = _926;
    }
    float _928 = _924;
    float _930 = fma(_916, _916, _920);
    float _932 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _934 = _930 + _928;
    float _936 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[2].x, _862);
    float _938 = _756 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _942 = fma(_782, (*spvDescriptorSet0.vp_c15)._m0[23].w, _940);
    float _944 = precise::clamp(_942, 0.0, 1.0);
    float _946 = rsqrt(_934);
    float _948 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[2].z, _936);
    float _950 = _756 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _952 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[1].x, _938);
    float _954 = _756 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _956 = -_944;
    float _958 = _956 + 1.0;
    float _960 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[0].x, _950);
    float _962 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[1].z, _952);
    float _964 = _948 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _966 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[3].x, _954);
    float _968 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[0].z, _960);
    float _970 = _962 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _972 = abs(_958);
    float _974 = log2(_972);
    float _976 = _964 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _978 = _968 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _980 = _970 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _982 = _946 * _900;
    float _984 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[3].z, _966);
    float _986 = -_976;
    float _988 = fma(_986, _932, 1.0);
    float _990 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[7].x, _980);
    float _992 = _946 * _916;
    float _994 = _982 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _996 = _984 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _998 = _946 * _908;
    float _1000 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[7].z, _990);
    float _1002 = -_994;
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1002);
    float _1006 = log2(_988);
    float _1008 = _970 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1010 = _974 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1012 = -_998;
    float _1014 = fma(_1012, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1004);
    float _1016 = _970 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1018 = fma(_1014, -0.5, 0.5);
    float _1020 = exp2(_1010);
    float _1022 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1000);
    float _1024 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1016);
    float _1026 = fma(_1014, 0.5, 0.5);
    float _1028 = _992 + 1.0;
    float _1030 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1024);
    float _1032 = fma(_1026, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1034 = 1.0 / _1022;
    float _1036 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1008);
    float _1038 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1030);
    float _1040 = fma(_1026, _1032, -0.212114393711090087890625);
    float _1042 = _1006 * 0.693147182464599609375;
    float _1044 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1036);
    float _1046 = fma(_1026, _1040, 1.570728778839111328125);
    float _1048 = sqrt(_1018);
    float _1050 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1044);
    float _1052 = -_992;
    float _1054 = fma(_1020, _1028, _1052);
    float _1056 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1058 = _1038 * _1034;
    float _1060 = _1050 * _1034;
    float _1062 = fma(_1058, 0.5, 0.5);
    float _1064 = fma(_1060, -0.5, 0.5);
    float _1066 = _1048 * 0.636619746685028076171875;
    float3 _2889 = float3(_1062, _1064, _1056);
    float _1068 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2889, float3(0.0), isnan(_2889)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2889, float3(0.0), isnan(_2889)), level(0.0)).x;
    float _1070 = -_1046;
    float _1072 = fma(_1066, _1070, 1.0);
    float _1074 = fma(_1054, 0.5, 0.5);
    float3 _2907 = float3(_1062, _1064, _1056);
    float4 _1077 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2907, float3(0.0), isnan(_2907)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2907, float3(0.0), isnan(_2907)), level(0.0)).xyzw;
    float _1079 = _1077.x;
    float _1081 = _1077.y;
    float _1083 = _1077.z;
    float _1085 = _1077.w;
    float2 _2924 = float2(_1072, _1074);
    float3 _1089 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2924, float2(0.0), isnan(_2924)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2924, float2(0.0), isnan(_2924)), level(0.0)).xyz;
    float _1091 = _1089.x;
    float _1093 = _1089.y;
    float _1095 = _1089.z;
    float _1097 = _686 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1099 = in.m_49.w;
    bool _1101 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1103 = isnan(0.5);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1109 = _1105 || _1107;
    float _1111 = _974 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1115 = _1113 != 0;
    float _1117 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1097);
    float _1119 = in.m_57.y;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1123 = _1121 != 0;
    float _1125 = _970 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1127 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1117);
    float _1129 = _686 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1131 = in.m_57.x;
    float _1133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1135 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1137 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1129);
    out.m_59.y = _484;
    float _1139 = _1119;
    float _1141 = _1133;
    if (!_1109)
    {
        _706 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1143 = _706;
    float _1145 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1137);
    float _1147 = 0.0;
    float _1149 = _1143;
    if (_1115)
    {
        float _1151 = in.m_49.z;
        _1147 = _1151;
    }
    float _1153 = _1147;
    float _1155 = 1.0 / _1135;
    float _1157 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1161 = _1099 > 0.5;
    float _1163 = _1157 + _1135;
    out.m_59.x = _478;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1167 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_59.z = _494;
    float _1171 = _1131;
    if (!_1115)
    {
        _708 = _1131;
    }
    float _1173 = _708;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1177 = _1163 * _1155;
    float _1179 = _1177 * 0.5;
    float _1181 = -_1119;
    float _1183 = _1181 + 1.0;
    float _1185 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1187 = _1173;
    if (!_1109)
    {
        float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1191 = fma(_1179, _1143, _1189);
        _1149 = _1191;
    }
    float _1193 = _1149;
    float _1195 = exp2(_1111);
    float _1197 = _1193;
    if (_1123)
    {
        float _1199 = _1161 ? _1183 : _1119;
        _1139 = _1199;
    }
    float _1201 = _1139;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1205 = _1153 > 0.5;
    bool _1207 = _1205 && _1115;
    float _1209 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1125);
    float _1211 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1213 = _1201;
    float _1215 = _1211;
    if (!_1109)
    {
        _1213 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1217 = _1213;
    float _1219 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1221 = _1211 * _1133;
    float _1223 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1209);
    if (!_1109)
    {
        float _1225 = -_1217;
        float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1215 = _1227;
    }
    float _1229 = _1215;
    out.m_61.x = _1167;
    out.m_61.y = _1219;
    out.m_61.z = _1185;
    out.m_61.w = _1165;
    if (_1207)
    {
        float _1231 = -_1131;
        float _1233 = _1231 + 1.0;
        _1171 = _1233;
    }
    float _1235 = _1171;
    if (!_1109)
    {
        float _1237 = 1.0 / _1229;
        _1141 = _1237;
    }
    float _1239 = _1141;
    if (_1115)
    {
        _1187 = _1235;
    }
    float _1241 = _1187;
    float _1243 = _1235;
    if (!_1109)
    {
        float _1245 = 1.0 / _1193;
        _1243 = _1245;
    }
    float _1247 = _1243;
    float _1249 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1251 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1255 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1223);
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1259 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1263 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1265 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1267 = _1249 * _1169;
    float _1269 = -_1195;
    float _1271 = _1269 + 1.0;
    float _1273 = _1249;
    if (_1109)
    {
        _1197 = 1.0;
    }
    float _1275 = _1197;
    float _1277 = _1255 + _1022;
    float _1279 = _1275;
    if (!_1109)
    {
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1283 = -_1217;
        float _1285 = fma(_1247, _1281, _1283);
        _1273 = _1285;
    }
    float _1287 = _1273;
    out.m_63.x = _1259;
    out.m_63.y = _1263;
    out.m_63.z = _1265;
    out.m_63.w = _1261;
    float _1289 = _1277 * 0.5;
    if (!_1109)
    {
        float _1291 = _1287 * _1239;
        float _1293 = precise::clamp(_1291, 0.0, 1.0);
        _1279 = _1293;
    }
    float _1295 = _1279;
    out.m_65.z = _1267;
    out.m_65.w = _1221;
    float _1297 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1299 = _1295 > 0.0;
    bool _1301 = isnan(_1295);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan(0.0);
    bool _1307 = _1303 || _1305;
    out.gl_Position.x = _1038;
    out.gl_Position.y = _1050;
    out.gl_Position.z = _1255;
    out.gl_Position.w = _1022;
    out.m_67.z = _1289;
    out.m_67.w = _1022;
    float _1309 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1311 = _1297 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1313 = -_1309;
    float _1315 = _1313 + 1.0;
    out.m_45.x = _1311;
    float _1317 = _1309 * _1068;
    float _1319 = _1085 * _1317;
    float _1321 = _1085 * _1315;
    float _1323 = _1095 * _1317;
    float _1325 = fma(_1091, _1319, _1079);
    float _1327 = fma(_1093, _1319, _1081);
    float _1329 = fma(_1085, _1323, _1083);
    out.m_69.x = _1325;
    out.m_69.y = _1327;
    out.m_69.z = _1329;
    out.m_69.w = _1321;
    if (_1307)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1331 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1331;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1388 = as_type<float>(_104);
        out.gl_Position.z = _1388;
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
        float _1458 = as_type<float>(_142);
        out.gl_Position.z = _1458;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.x;
    float _146 = in.m_49.y;
    float _148 = in.m_49.z;
    float _150 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _152 = log2(_150);
    float _154 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = 0.0;
    float _168 = _154;
    if (!_164)
    {
        float _170 = _154 * _154;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_164)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    float _182 = _148 * 2.0;
    float _184 = _144 * 2.0;
    float _186 = _146 * 2.0;
    float _188 = floor(_184);
    float _190 = floor(_182);
    bool _192 = _190 > 0.0;
    bool _194 = _190 >= 0.0;
    bool _196 = isnan(_190);
    bool _198 = _194 || _196;
    bool _200 = isnan(0.0);
    bool _202 = _198 || _200;
    bool _204 = !_164;
    float _206 = _180;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _154 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _154);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_164;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _154 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _168 = _260;
    }
    float _262 = _168;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _266 = _264 != 0;
    int _268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _270 = _268 != 0;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _274 = _272 != 0;
    float _276 = floor(_186);
    bool _278 = _188 > 0.0;
    float _280 = _152 * _122;
    int _282 = _202 ? 0 : 1;
    float _284 = in.m_51.w;
    bool _286 = _188 >= 0.0;
    bool _288 = isnan(_188);
    bool _290 = _286 || _288;
    bool _292 = isnan(0.0);
    bool _294 = _290 || _292;
    int _296 = ~_282;
    int _298 = _296 + 1;
    int _300 = _298 + 1;
    float _302 = exp2(_280);
    int _304 = _300;
    if (!_192)
    {
        int _306 = ~_282;
        int _308 = _306 + 1;
        _304 = _308;
    }
    int _310 = _304;
    bool _312 = !_266;
    int _314 = _312 ? 0 : 1;
    int _316 = _294 ? 0 : 1;
    int _318 = abs(_314);
    int _320 = ~_316;
    int _322 = _320 + 1;
    int _324 = _322 + 1;
    float _326 = _146 + _144;
    float _328 = float(_310);
    float _330 = _326 + (-1.0);
    int _332 = _324;
    if (!_278)
    {
        int _334 = ~_316;
        int _336 = _334 + 1;
        _332 = _336;
    }
    int _338 = _332;
    float _340 = -_302;
    float _342 = _340 + 1.0;
    float _344 = in.m_53.x;
    float _346 = in.m_53.y;
    float _348 = in.m_53.z;
    bool _350 = _276 > 0.0;
    bool _352 = _276 >= 0.0;
    bool _354 = isnan(_276);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _364 = 1.0 + _362;
    float _366 = float(_318);
    bool _368 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _370 = isnan(1.0);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _376 = _372 || _374;
    float _378 = 1.0 / _364;
    bool _380 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _382 = isnan(0.0);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _388 = _384 || _386;
    float _390 = _366 * _328;
    bool _392 = !_270;
    int _394 = _392 ? 0 : 1;
    float _396 = _390 * (-2.0);
    int _398 = abs(_394);
    float _400 = float(_338);
    float _402 = float(_398);
    float _404 = _388 ? _342 : 0.0;
    float _406 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _408 = _144 + (-0.5);
    float _410 = _402 * _400;
    float _412 = fma(_396, _344, _344);
    if (_376)
    {
        float _414 = _404 * _378;
        _124 = _414;
    }
    float _416 = _124;
    bool _418 = !_274;
    int _420 = _418 ? 0 : 1;
    float _422 = _146 + _148;
    float _424 = fma(_406, _396, _406);
    int _426 = _360 ? 0 : 1;
    float _428 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[196].x, _412);
    float _430 = _422 + (-1.0);
    int _432 = abs(_420);
    float _434 = _410 * (-2.0);
    int _436 = ~_426;
    int _438 = _436 + 1;
    int _440 = _438 + 1;
    float _442 = fma(_424, _416, _428);
    int _444 = _440;
    if (!_350)
    {
        int _446 = ~_426;
        int _448 = _446 + 1;
        _444 = _448;
    }
    int _450 = _444;
    float _452 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _454 = fma(_434, _346, _346);
    float _456 = float(_450);
    float _458 = fma(_452, _434, _452);
    float _460 = float(_432);
    float _462 = _442 * 0.15915493667125701904296875;
    float _464 = _146 + (-0.5);
    float _466 = in.m_51.x;
    float _468 = in.m_51.y;
    float _470 = in.m_51.z;
    float _472 = _144 + _148;
    float _474 = _460 * _456;
    float _476 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[196].y, _454);
    float _478 = in.m_55.x;
    float _480 = _472 + (-1.0);
    float _482 = _474 * (-2.0);
    float _484 = in.m_55.y;
    float _486 = fma(_458, _416, _476);
    float _488 = _148 + (-0.5);
    float _490 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _492 = fma(_482, _348, _348);
    float _494 = in.m_55.z;
    float _496 = _486 * 0.15915493667125701904296875;
    float _498 = fma(_490, _482, _490);
    float _500 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[196].z, _492);
    float _502 = in.m_47.x;
    float _504 = in.m_47.y;
    float _506 = in.m_47.z;
    float _508 = _462 * 6.283185482025146484375;
    float _510 = sin(_508);
    float _512 = fma(_498, _416, _500);
    float _514 = in.m_42.x;
    float _516 = in.m_42.y;
    float _518 = in.m_42.z;
    float _520 = _466 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _522 = _512 * 0.15915493667125701904296875;
    float _524 = _462 * 6.283185482025146484375;
    float _526 = cos(_524);
    float _528 = _468 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _530 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _478);
    float _534 = _470 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _536 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _538 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _484);
    float _540 = _496 * 6.283185482025146484375;
    float _542 = sin(_540);
    float _544 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _546 = _538 * _536;
    float _548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _494);
    float _550 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _552 = _548 * _544;
    float _554 = _496 * 6.283185482025146484375;
    float _556 = cos(_554);
    float _558 = fma(_262, _504, _550);
    float _560 = fma(_558, _284, _516);
    float _562 = _522 * 6.283185482025146484375;
    float _564 = sin(_562);
    float _566 = _532 * _530;
    float _568 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _570 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _572 = _510 * _542;
    float _574 = _526 * _542;
    float _576 = fma(_262, _502, _568);
    float _578 = fma(_262, _506, _570);
    float _580 = _522 * 6.283185482025146484375;
    float _582 = cos(_580);
    float _584 = _526 * _556;
    float _586 = fma(_576, _284, _514);
    float _588 = fma(_564, _584, _572);
    float _590 = fma(_564, _572, _584);
    float _592 = fma(_578, _284, _518);
    float _594 = _582 * _546;
    float _596 = _542 * _582;
    float _598 = _556 * _582;
    float _600 = _510 * _556;
    float _602 = _526 * _594;
    float _604 = -_546;
    float _606 = _564 * _604;
    float _608 = _510 * _594;
    float _610 = -_574;
    float _612 = fma(_564, _600, _610);
    float _614 = -_600;
    float _616 = fma(_564, _574, _614);
    float _618 = fma(_588, _566, _602);
    float _620 = fma(_598, _566, _606);
    float _622 = fma(_612, _566, _608);
    float _624 = _560 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _626 = fma(_616, _552, _618);
    float _628 = fma(_596, _552, _620);
    float _630 = _560 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _632 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[6].x, _624);
    float _634 = _626 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _636 = fma(_590, _552, _622);
    float _638 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[4].x, _630);
    float _640 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[6].z, _632);
    float _642 = _626 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _644 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[10].x, _634);
    float _646 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[4].z, _638);
    float _648 = _640 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _650 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[8].x, _642);
    float _652 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[10].z, _644);
    float _654 = _646 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _656 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[8].z, _650);
    float _658 = _648 + _652;
    float _660 = _654 + _656;
    float _662 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _664 = _658 + _662;
    float _666 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _668 = _660 + _666;
    float _670 = _664 * _664;
    float _672 = fma(_668, _668, _670);
    float _674 = _560 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _676 = sqrt(_672);
    float _678 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[5].x, _674);
    float _680 = _626 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _682 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[5].z, _678);
    float _684 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[9].x, _680);
    float _686 = _682 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _688 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[9].z, _684);
    float _690 = _686 + _688;
    bool _692 = _676 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _694 = _682;
    float _696 = _636;
    float _698 = _660;
    float _700 = _668;
    float _702 = _622;
    float _704 = _672;
    float _706 = 0.5;
    float _708 = _648;
    if (!_692)
    {
        _694 = _658;
    }
    float _710 = _694;
    float _712 = _710;
    if (!_692)
    {
        _696 = _690;
    }
    float _714 = _696;
    bool _716 = !_692;
    float _718 = _714;
    if (!_716)
    {
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _722 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _724 = _676 + _722;
        float _726 = rsqrt(_672);
        float _728 = _724 * _720;
        float _730 = _690 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _732 = _728 * 0.15915493667125701904296875;
        float _734 = _732 * 6.283185482025146484375;
        float _736 = cos(_734);
        float _738 = _732 * 6.283185482025146484375;
        float _740 = sin(_738);
        float _742 = _736 + (-1.0);
        float _744 = _742 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _746 = fma(_740, _730, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _748 = fma(_690, _736, _744);
        float _750 = _726 * _746;
        float _752 = fma(_668, _750, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _754 = fma(_664, _750, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _718 = _748;
        _698 = _752;
        _712 = _754;
    }
    float _756 = _718;
    float _758 = _698;
    float _760 = _712;
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _764 = _756 + _762;
    float _766 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _768 = _758 + _766;
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _772 = _760 + _770;
    float _774 = _764 * _764;
    float _776 = fma(_768, _768, _774);
    float _778 = fma(_772, _772, _776);
    float _780 = rsqrt(_778);
    float _782 = sqrt(_778);
    float _784 = _780 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _786 = _768 * _784;
    float _788 = _772 * _784;
    float _790 = _786 * _786;
    float _792 = _788 * _788;
    float _794 = _790 + _792;
    float _796 = sqrt(_794);
    bool _798 = _796 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _800 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _802 = _796 + _800;
    float _804 = _780;
    float _806 = _794;
    float _808 = _802;
    float _810 = _764;
    if (_798)
    {
        float _812 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _804 = _812;
    }
    float _814 = _804;
    if (_798)
    {
        float _816 = rsqrt(_794);
        _806 = _816;
    }
    float _818 = _806;
    float _820 = _818;
    if (_798)
    {
        float _822 = _802 * _814;
        _808 = _822;
    }
    float _824 = _808;
    if (_798)
    {
        float _826 = _824 * 0.15915493667125701904296875;
        _700 = _826;
    }
    float _828 = _700;
    float _830 = _772;
    if (_798)
    {
        float _832 = _828 * 6.283185482025146484375;
        float _834 = sin(_832);
        _830 = _834;
    }
    float _836 = _830;
    float _838 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _840 = precise::max(0.0, _838);
    float _842 = _814;
    float _844 = _840;
    if (_798)
    {
        float _846 = _828 * 6.283185482025146484375;
        float _848 = cos(_846);
        _842 = _848;
    }
    float _850 = _842;
    float _852 = -_784;
    float _854 = -_840;
    float _856 = fma(_764, _852, _854);
    if (_798)
    {
        float _858 = _856 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _810 = _858;
    }
    float _860 = _810;
    float _862 = _756 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _864 = _860;
    float _866 = _836;
    if (_798)
    {
        float _868 = fma(_836, _860, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _864 = _868;
    }
    float _870 = _864;
    float _872 = _870;
    if (!_798)
    {
        _866 = _786;
    }
    float _874 = _866;
    float _876 = _874;
    float _878 = _850;
    if (_798)
    {
        float _880 = _850 + (-1.0);
        _844 = _880;
    }
    float _882 = _844;
    float _884 = _882;
    if (_798)
    {
        float _886 = _818 * _870;
        _702 = _886;
    }
    float _888 = _702;
    if (!_798)
    {
        _872 = _856;
    }
    float _890 = _872;
    float _892 = _890;
    if (_798)
    {
        float _894 = _882 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _704 = _894;
    }
    float _896 = _704;
    if (_798)
    {
        float _898 = _786 * _888;
        _876 = _898;
    }
    float _900 = _876;
    if (!_798)
    {
        _884 = _788;
    }
    float _902 = _884;
    float _904 = _902;
    if (_798)
    {
        float _906 = _788 * _888;
        _904 = _906;
    }
    float _908 = _904;
    if (!_798)
    {
        _820 = _790;
    }
    float _910 = _820;
    float _912 = _910;
    if (_798)
    {
        float _914 = fma(_856, _850, _896);
        _892 = _914;
    }
    float _916 = _892;
    if (_798)
    {
        float _918 = _900 * _900;
        _912 = _918;
    }
    float _920 = _912;
    if (!_798)
    {
        _878 = _792;
    }
    float _922 = _878;
    float _924 = _922;
    if (_798)
    {
        float _926 = _908 * _908;
        _924 = _926;
    }
    float _928 = _924;
    float _930 = fma(_916, _916, _920);
    float _932 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _934 = _930 + _928;
    float _936 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[2].x, _862);
    float _938 = _756 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _942 = fma(_782, (*spvDescriptorSet0.vp_c15)._m0[23].w, _940);
    float _944 = precise::clamp(_942, 0.0, 1.0);
    float _946 = rsqrt(_934);
    float _948 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[2].z, _936);
    float _950 = _756 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _952 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[1].x, _938);
    float _954 = _756 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _956 = -_944;
    float _958 = _956 + 1.0;
    float _960 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[0].x, _950);
    float _962 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[1].z, _952);
    float _964 = _948 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _966 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[3].x, _954);
    float _968 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[0].z, _960);
    float _970 = _962 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _972 = abs(_958);
    float _974 = log2(_972);
    float _976 = _964 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _978 = _968 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _980 = _970 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _982 = _946 * _900;
    float _984 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[3].z, _966);
    float _986 = -_976;
    float _988 = fma(_986, _932, 1.0);
    float _990 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[7].x, _980);
    float _992 = _946 * _916;
    float _994 = _982 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _996 = _984 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _998 = _946 * _908;
    float _1000 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[7].z, _990);
    float _1002 = -_994;
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1002);
    float _1006 = log2(_988);
    float _1008 = _970 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1010 = _974 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1012 = -_998;
    float _1014 = fma(_1012, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1004);
    float _1016 = _970 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1018 = fma(_1014, -0.5, 0.5);
    float _1020 = exp2(_1010);
    float _1022 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1000);
    float _1024 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1016);
    float _1026 = fma(_1014, 0.5, 0.5);
    float _1028 = _992 + 1.0;
    float _1030 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1024);
    float _1032 = fma(_1026, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1034 = 1.0 / _1022;
    float _1036 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1008);
    float _1038 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1030);
    float _1040 = fma(_1026, _1032, -0.212114393711090087890625);
    float _1042 = _1006 * 0.693147182464599609375;
    float _1044 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1036);
    float _1046 = fma(_1026, _1040, 1.570728778839111328125);
    float _1048 = sqrt(_1018);
    float _1050 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1044);
    float _1052 = -_992;
    float _1054 = fma(_1020, _1028, _1052);
    float _1056 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1058 = _1038 * _1034;
    float _1060 = _1050 * _1034;
    float _1062 = fma(_1058, 0.5, 0.5);
    float _1064 = fma(_1060, -0.5, 0.5);
    float _1066 = _1048 * 0.636619746685028076171875;
    float3 _2889 = float3(_1062, _1064, _1056);
    float _1068 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2889, float3(0.0), isnan(_2889)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2889, float3(0.0), isnan(_2889)), level(0.0)).x;
    float _1070 = -_1046;
    float _1072 = fma(_1066, _1070, 1.0);
    float _1074 = fma(_1054, 0.5, 0.5);
    float3 _2907 = float3(_1062, _1064, _1056);
    float4 _1077 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2907, float3(0.0), isnan(_2907)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2907, float3(0.0), isnan(_2907)), level(0.0)).xyzw;
    float _1079 = _1077.x;
    float _1081 = _1077.y;
    float _1083 = _1077.z;
    float _1085 = _1077.w;
    float2 _2924 = float2(_1072, _1074);
    float3 _1089 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2924, float2(0.0), isnan(_2924)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2924, float2(0.0), isnan(_2924)), level(0.0)).xyz;
    float _1091 = _1089.x;
    float _1093 = _1089.y;
    float _1095 = _1089.z;
    float _1097 = _686 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1099 = in.m_49.w;
    bool _1101 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1103 = isnan(0.5);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1109 = _1105 || _1107;
    float _1111 = _974 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1115 = _1113 != 0;
    float _1117 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1097);
    float _1119 = in.m_57.y;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1123 = _1121 != 0;
    float _1125 = _970 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1127 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1117);
    float _1129 = _686 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1131 = in.m_57.x;
    float _1133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1135 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1137 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1129);
    out.m_59.y = _484;
    float _1139 = _1119;
    float _1141 = _1133;
    if (!_1109)
    {
        _706 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1143 = _706;
    float _1145 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1137);
    float _1147 = 0.0;
    float _1149 = _1143;
    if (_1115)
    {
        float _1151 = in.m_49.z;
        _1147 = _1151;
    }
    float _1153 = _1147;
    float _1155 = 1.0 / _1135;
    float _1157 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1161 = _1099 > 0.5;
    float _1163 = _1157 + _1135;
    out.m_59.x = _478;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1167 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_59.z = _494;
    float _1171 = _1131;
    if (!_1115)
    {
        _708 = _1131;
    }
    float _1173 = _708;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1177 = _1163 * _1155;
    float _1179 = _1177 * 0.5;
    float _1181 = -_1119;
    float _1183 = _1181 + 1.0;
    float _1185 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1187 = _1173;
    if (!_1109)
    {
        float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1191 = fma(_1179, _1143, _1189);
        _1149 = _1191;
    }
    float _1193 = _1149;
    float _1195 = exp2(_1111);
    float _1197 = _1193;
    if (_1123)
    {
        float _1199 = _1161 ? _1183 : _1119;
        _1139 = _1199;
    }
    float _1201 = _1139;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1205 = _1153 > 0.5;
    bool _1207 = _1205 && _1115;
    float _1209 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1125);
    float _1211 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1213 = _1201;
    float _1215 = _1211;
    if (!_1109)
    {
        _1213 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1217 = _1213;
    float _1219 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1221 = _1211 * _1133;
    float _1223 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1209);
    if (!_1109)
    {
        float _1225 = -_1217;
        float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1215 = _1227;
    }
    float _1229 = _1215;
    out.m_61.x = _1167;
    out.m_61.y = _1219;
    out.m_61.z = _1185;
    out.m_61.w = _1165;
    if (_1207)
    {
        float _1231 = -_1131;
        float _1233 = _1231 + 1.0;
        _1171 = _1233;
    }
    float _1235 = _1171;
    if (!_1109)
    {
        float _1237 = 1.0 / _1229;
        _1141 = _1237;
    }
    float _1239 = _1141;
    if (_1115)
    {
        _1187 = _1235;
    }
    float _1241 = _1187;
    float _1243 = _1235;
    if (!_1109)
    {
        float _1245 = 1.0 / _1193;
        _1243 = _1245;
    }
    float _1247 = _1243;
    float _1249 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1251 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1255 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1223);
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1259 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1263 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1265 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1267 = _1249 * _1169;
    float _1269 = -_1195;
    float _1271 = _1269 + 1.0;
    float _1273 = _1249;
    if (_1109)
    {
        _1197 = 1.0;
    }
    float _1275 = _1197;
    float _1277 = _1255 + _1022;
    float _1279 = _1275;
    if (!_1109)
    {
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1283 = -_1217;
        float _1285 = fma(_1247, _1281, _1283);
        _1273 = _1285;
    }
    float _1287 = _1273;
    out.m_63.x = _1259;
    out.m_63.y = _1263;
    out.m_63.z = _1265;
    out.m_63.w = _1261;
    float _1289 = _1277 * 0.5;
    if (!_1109)
    {
        float _1291 = _1287 * _1239;
        float _1293 = precise::clamp(_1291, 0.0, 1.0);
        _1279 = _1293;
    }
    float _1295 = _1279;
    out.m_65.z = _1267;
    out.m_65.w = _1221;
    float _1297 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1299 = _1295 > 0.0;
    bool _1301 = isnan(_1295);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan(0.0);
    bool _1307 = _1303 || _1305;
    out.gl_Position.x = _1038;
    out.gl_Position.y = _1050;
    out.gl_Position.z = _1255;
    out.gl_Position.w = _1022;
    out.m_67.z = _1289;
    out.m_67.w = _1022;
    float _1309 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1311 = _1297 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1313 = -_1309;
    float _1315 = _1313 + 1.0;
    out.m_45.x = _1311;
    float _1317 = _1309 * _1068;
    float _1319 = _1085 * _1317;
    float _1321 = _1085 * _1315;
    float _1323 = _1095 * _1317;
    float _1325 = fma(_1091, _1319, _1079);
    float _1327 = fma(_1093, _1319, _1081);
    float _1329 = fma(_1085, _1323, _1083);
    out.m_69.x = _1325;
    out.m_69.y = _1327;
    out.m_69.z = _1329;
    out.m_69.w = _1321;
    if (_1307)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1331 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1331;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1388 = as_type<float>(_104);
        out.gl_Position.z = _1388;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1458 = as_type<float>(_142);
        out.gl_Position.z = _1458;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.x;
    float _146 = in.m_49.y;
    float _148 = in.m_49.z;
    float _150 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _152 = log2(_150);
    float _154 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = 0.0;
    float _168 = _154;
    if (!_164)
    {
        float _170 = _154 * _154;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_164)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    float _182 = _148 * 2.0;
    float _184 = _144 * 2.0;
    float _186 = _146 * 2.0;
    float _188 = floor(_184);
    float _190 = floor(_182);
    bool _192 = _190 > 0.0;
    bool _194 = _190 >= 0.0;
    bool _196 = isnan(_190);
    bool _198 = _194 || _196;
    bool _200 = isnan(0.0);
    bool _202 = _198 || _200;
    bool _204 = !_164;
    float _206 = _180;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _154 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _154);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_164;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _154 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _168 = _260;
    }
    float _262 = _168;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _266 = _264 != 0;
    int _268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _270 = _268 != 0;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _274 = _272 != 0;
    float _276 = floor(_186);
    bool _278 = _188 > 0.0;
    float _280 = _152 * _122;
    int _282 = _202 ? 0 : 1;
    float _284 = in.m_51.w;
    bool _286 = _188 >= 0.0;
    bool _288 = isnan(_188);
    bool _290 = _286 || _288;
    bool _292 = isnan(0.0);
    bool _294 = _290 || _292;
    int _296 = ~_282;
    int _298 = _296 + 1;
    int _300 = _298 + 1;
    float _302 = exp2(_280);
    int _304 = _300;
    if (!_192)
    {
        int _306 = ~_282;
        int _308 = _306 + 1;
        _304 = _308;
    }
    int _310 = _304;
    bool _312 = !_266;
    int _314 = _312 ? 0 : 1;
    int _316 = _294 ? 0 : 1;
    int _318 = abs(_314);
    int _320 = ~_316;
    int _322 = _320 + 1;
    int _324 = _322 + 1;
    float _326 = _146 + _144;
    float _328 = float(_310);
    float _330 = _326 + (-1.0);
    int _332 = _324;
    if (!_278)
    {
        int _334 = ~_316;
        int _336 = _334 + 1;
        _332 = _336;
    }
    int _338 = _332;
    float _340 = -_302;
    float _342 = _340 + 1.0;
    float _344 = in.m_53.x;
    float _346 = in.m_53.y;
    float _348 = in.m_53.z;
    bool _350 = _276 > 0.0;
    bool _352 = _276 >= 0.0;
    bool _354 = isnan(_276);
    bool _356 = _352 || _354;
    bool _358 = isnan(0.0);
    bool _360 = _356 || _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _364 = 1.0 + _362;
    float _366 = float(_318);
    bool _368 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _370 = isnan(1.0);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _376 = _372 || _374;
    float _378 = 1.0 / _364;
    bool _380 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _382 = isnan(0.0);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _388 = _384 || _386;
    float _390 = _366 * _328;
    bool _392 = !_270;
    int _394 = _392 ? 0 : 1;
    float _396 = _390 * (-2.0);
    int _398 = abs(_394);
    float _400 = float(_338);
    float _402 = float(_398);
    float _404 = _388 ? _342 : 0.0;
    float _406 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _408 = _144 + (-0.5);
    float _410 = _402 * _400;
    float _412 = fma(_396, _344, _344);
    if (_376)
    {
        float _414 = _404 * _378;
        _124 = _414;
    }
    float _416 = _124;
    bool _418 = !_274;
    int _420 = _418 ? 0 : 1;
    float _422 = _146 + _148;
    float _424 = fma(_406, _396, _406);
    int _426 = _360 ? 0 : 1;
    float _428 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[196].x, _412);
    float _430 = _422 + (-1.0);
    int _432 = abs(_420);
    float _434 = _410 * (-2.0);
    int _436 = ~_426;
    int _438 = _436 + 1;
    int _440 = _438 + 1;
    float _442 = fma(_424, _416, _428);
    int _444 = _440;
    if (!_350)
    {
        int _446 = ~_426;
        int _448 = _446 + 1;
        _444 = _448;
    }
    int _450 = _444;
    float _452 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _454 = fma(_434, _346, _346);
    float _456 = float(_450);
    float _458 = fma(_452, _434, _452);
    float _460 = float(_432);
    float _462 = _442 * 0.15915493667125701904296875;
    float _464 = _146 + (-0.5);
    float _466 = in.m_51.x;
    float _468 = in.m_51.y;
    float _470 = in.m_51.z;
    float _472 = _144 + _148;
    float _474 = _460 * _456;
    float _476 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[196].y, _454);
    float _478 = in.m_55.x;
    float _480 = _472 + (-1.0);
    float _482 = _474 * (-2.0);
    float _484 = in.m_55.y;
    float _486 = fma(_458, _416, _476);
    float _488 = _148 + (-0.5);
    float _490 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _492 = fma(_482, _348, _348);
    float _494 = in.m_55.z;
    float _496 = _486 * 0.15915493667125701904296875;
    float _498 = fma(_490, _482, _490);
    float _500 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[196].z, _492);
    float _502 = in.m_47.x;
    float _504 = in.m_47.y;
    float _506 = in.m_47.z;
    float _508 = _462 * 6.283185482025146484375;
    float _510 = sin(_508);
    float _512 = fma(_498, _416, _500);
    float _514 = in.m_42.x;
    float _516 = in.m_42.y;
    float _518 = in.m_42.z;
    float _520 = _466 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _522 = _512 * 0.15915493667125701904296875;
    float _524 = _462 * 6.283185482025146484375;
    float _526 = cos(_524);
    float _528 = _468 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _530 = _520 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _478);
    float _534 = _470 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _536 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _538 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _484);
    float _540 = _496 * 6.283185482025146484375;
    float _542 = sin(_540);
    float _544 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _546 = _538 * _536;
    float _548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _494);
    float _550 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _552 = _548 * _544;
    float _554 = _496 * 6.283185482025146484375;
    float _556 = cos(_554);
    float _558 = fma(_262, _504, _550);
    float _560 = fma(_558, _284, _516);
    float _562 = _522 * 6.283185482025146484375;
    float _564 = sin(_562);
    float _566 = _532 * _530;
    float _568 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _570 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _572 = _510 * _542;
    float _574 = _526 * _542;
    float _576 = fma(_262, _502, _568);
    float _578 = fma(_262, _506, _570);
    float _580 = _522 * 6.283185482025146484375;
    float _582 = cos(_580);
    float _584 = _526 * _556;
    float _586 = fma(_576, _284, _514);
    float _588 = fma(_564, _584, _572);
    float _590 = fma(_564, _572, _584);
    float _592 = fma(_578, _284, _518);
    float _594 = _582 * _546;
    float _596 = _542 * _582;
    float _598 = _556 * _582;
    float _600 = _510 * _556;
    float _602 = _526 * _594;
    float _604 = -_546;
    float _606 = _564 * _604;
    float _608 = _510 * _594;
    float _610 = -_574;
    float _612 = fma(_564, _600, _610);
    float _614 = -_600;
    float _616 = fma(_564, _574, _614);
    float _618 = fma(_588, _566, _602);
    float _620 = fma(_598, _566, _606);
    float _622 = fma(_612, _566, _608);
    float _624 = _560 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _626 = fma(_616, _552, _618);
    float _628 = fma(_596, _552, _620);
    float _630 = _560 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _632 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[6].x, _624);
    float _634 = _626 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _636 = fma(_590, _552, _622);
    float _638 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[4].x, _630);
    float _640 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[6].z, _632);
    float _642 = _626 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _644 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[10].x, _634);
    float _646 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[4].z, _638);
    float _648 = _640 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _650 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[8].x, _642);
    float _652 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[10].z, _644);
    float _654 = _646 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _656 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[8].z, _650);
    float _658 = _648 + _652;
    float _660 = _654 + _656;
    float _662 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _664 = _658 + _662;
    float _666 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _668 = _660 + _666;
    float _670 = _664 * _664;
    float _672 = fma(_668, _668, _670);
    float _674 = _560 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _676 = sqrt(_672);
    float _678 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[5].x, _674);
    float _680 = _626 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _682 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[5].z, _678);
    float _684 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[9].x, _680);
    float _686 = _682 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _688 = fma(_636, (*spvDescriptorSet0.vp_c10)._m0[9].z, _684);
    float _690 = _686 + _688;
    bool _692 = _676 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _694 = _682;
    float _696 = _636;
    float _698 = _660;
    float _700 = _668;
    float _702 = _622;
    float _704 = _672;
    float _706 = 0.5;
    float _708 = _648;
    if (!_692)
    {
        _694 = _658;
    }
    float _710 = _694;
    float _712 = _710;
    if (!_692)
    {
        _696 = _690;
    }
    float _714 = _696;
    bool _716 = !_692;
    float _718 = _714;
    if (!_716)
    {
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _722 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _724 = _676 + _722;
        float _726 = rsqrt(_672);
        float _728 = _724 * _720;
        float _730 = _690 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _732 = _728 * 0.15915493667125701904296875;
        float _734 = _732 * 6.283185482025146484375;
        float _736 = cos(_734);
        float _738 = _732 * 6.283185482025146484375;
        float _740 = sin(_738);
        float _742 = _736 + (-1.0);
        float _744 = _742 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _746 = fma(_740, _730, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _748 = fma(_690, _736, _744);
        float _750 = _726 * _746;
        float _752 = fma(_668, _750, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _754 = fma(_664, _750, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _718 = _748;
        _698 = _752;
        _712 = _754;
    }
    float _756 = _718;
    float _758 = _698;
    float _760 = _712;
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _764 = _756 + _762;
    float _766 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _768 = _758 + _766;
    float _770 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _772 = _760 + _770;
    float _774 = _764 * _764;
    float _776 = fma(_768, _768, _774);
    float _778 = fma(_772, _772, _776);
    float _780 = rsqrt(_778);
    float _782 = sqrt(_778);
    float _784 = _780 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _786 = _768 * _784;
    float _788 = _772 * _784;
    float _790 = _786 * _786;
    float _792 = _788 * _788;
    float _794 = _790 + _792;
    float _796 = sqrt(_794);
    bool _798 = _796 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _800 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _802 = _796 + _800;
    float _804 = _780;
    float _806 = _794;
    float _808 = _802;
    float _810 = _764;
    if (_798)
    {
        float _812 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _804 = _812;
    }
    float _814 = _804;
    if (_798)
    {
        float _816 = rsqrt(_794);
        _806 = _816;
    }
    float _818 = _806;
    float _820 = _818;
    if (_798)
    {
        float _822 = _802 * _814;
        _808 = _822;
    }
    float _824 = _808;
    if (_798)
    {
        float _826 = _824 * 0.15915493667125701904296875;
        _700 = _826;
    }
    float _828 = _700;
    float _830 = _772;
    if (_798)
    {
        float _832 = _828 * 6.283185482025146484375;
        float _834 = sin(_832);
        _830 = _834;
    }
    float _836 = _830;
    float _838 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _840 = precise::max(0.0, _838);
    float _842 = _814;
    float _844 = _840;
    if (_798)
    {
        float _846 = _828 * 6.283185482025146484375;
        float _848 = cos(_846);
        _842 = _848;
    }
    float _850 = _842;
    float _852 = -_784;
    float _854 = -_840;
    float _856 = fma(_764, _852, _854);
    if (_798)
    {
        float _858 = _856 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _810 = _858;
    }
    float _860 = _810;
    float _862 = _756 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _864 = _860;
    float _866 = _836;
    if (_798)
    {
        float _868 = fma(_836, _860, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _864 = _868;
    }
    float _870 = _864;
    float _872 = _870;
    if (!_798)
    {
        _866 = _786;
    }
    float _874 = _866;
    float _876 = _874;
    float _878 = _850;
    if (_798)
    {
        float _880 = _850 + (-1.0);
        _844 = _880;
    }
    float _882 = _844;
    float _884 = _882;
    if (_798)
    {
        float _886 = _818 * _870;
        _702 = _886;
    }
    float _888 = _702;
    if (!_798)
    {
        _872 = _856;
    }
    float _890 = _872;
    float _892 = _890;
    if (_798)
    {
        float _894 = _882 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _704 = _894;
    }
    float _896 = _704;
    if (_798)
    {
        float _898 = _786 * _888;
        _876 = _898;
    }
    float _900 = _876;
    if (!_798)
    {
        _884 = _788;
    }
    float _902 = _884;
    float _904 = _902;
    if (_798)
    {
        float _906 = _788 * _888;
        _904 = _906;
    }
    float _908 = _904;
    if (!_798)
    {
        _820 = _790;
    }
    float _910 = _820;
    float _912 = _910;
    if (_798)
    {
        float _914 = fma(_856, _850, _896);
        _892 = _914;
    }
    float _916 = _892;
    if (_798)
    {
        float _918 = _900 * _900;
        _912 = _918;
    }
    float _920 = _912;
    if (!_798)
    {
        _878 = _792;
    }
    float _922 = _878;
    float _924 = _922;
    if (_798)
    {
        float _926 = _908 * _908;
        _924 = _926;
    }
    float _928 = _924;
    float _930 = fma(_916, _916, _920);
    float _932 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _934 = _930 + _928;
    float _936 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[2].x, _862);
    float _938 = _756 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _942 = fma(_782, (*spvDescriptorSet0.vp_c15)._m0[23].w, _940);
    float _944 = precise::clamp(_942, 0.0, 1.0);
    float _946 = rsqrt(_934);
    float _948 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[2].z, _936);
    float _950 = _756 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _952 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[1].x, _938);
    float _954 = _756 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _956 = -_944;
    float _958 = _956 + 1.0;
    float _960 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[0].x, _950);
    float _962 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[1].z, _952);
    float _964 = _948 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _966 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[3].x, _954);
    float _968 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[0].z, _960);
    float _970 = _962 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _972 = abs(_958);
    float _974 = log2(_972);
    float _976 = _964 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _978 = _968 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _980 = _970 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _982 = _946 * _900;
    float _984 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[3].z, _966);
    float _986 = -_976;
    float _988 = fma(_986, _932, 1.0);
    float _990 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[7].x, _980);
    float _992 = _946 * _916;
    float _994 = _982 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _996 = _984 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _998 = _946 * _908;
    float _1000 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[7].z, _990);
    float _1002 = -_994;
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1002);
    float _1006 = log2(_988);
    float _1008 = _970 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1010 = _974 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1012 = -_998;
    float _1014 = fma(_1012, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1004);
    float _1016 = _970 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1018 = fma(_1014, -0.5, 0.5);
    float _1020 = exp2(_1010);
    float _1022 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1000);
    float _1024 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1016);
    float _1026 = fma(_1014, 0.5, 0.5);
    float _1028 = _992 + 1.0;
    float _1030 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1024);
    float _1032 = fma(_1026, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1034 = 1.0 / _1022;
    float _1036 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1008);
    float _1038 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1030);
    float _1040 = fma(_1026, _1032, -0.212114393711090087890625);
    float _1042 = _1006 * 0.693147182464599609375;
    float _1044 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1036);
    float _1046 = fma(_1026, _1040, 1.570728778839111328125);
    float _1048 = sqrt(_1018);
    float _1050 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1044);
    float _1052 = -_992;
    float _1054 = fma(_1020, _1028, _1052);
    float _1056 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1058 = _1038 * _1034;
    float _1060 = _1050 * _1034;
    float _1062 = fma(_1058, 0.5, 0.5);
    float _1064 = fma(_1060, -0.5, 0.5);
    float _1066 = _1048 * 0.636619746685028076171875;
    float3 _2889 = float3(_1062, _1064, _1056);
    float _1068 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2889, float3(0.0), isnan(_2889)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2889, float3(0.0), isnan(_2889)), level(0.0)).x;
    float _1070 = -_1046;
    float _1072 = fma(_1066, _1070, 1.0);
    float _1074 = fma(_1054, 0.5, 0.5);
    float3 _2907 = float3(_1062, _1064, _1056);
    float4 _1077 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2907, float3(0.0), isnan(_2907)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2907, float3(0.0), isnan(_2907)), level(0.0)).xyzw;
    float _1079 = _1077.x;
    float _1081 = _1077.y;
    float _1083 = _1077.z;
    float _1085 = _1077.w;
    float2 _2924 = float2(_1072, _1074);
    float3 _1089 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2924, float2(0.0), isnan(_2924)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2924, float2(0.0), isnan(_2924)), level(0.0)).xyz;
    float _1091 = _1089.x;
    float _1093 = _1089.y;
    float _1095 = _1089.z;
    float _1097 = _686 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1099 = in.m_49.w;
    bool _1101 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1103 = isnan(0.5);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1109 = _1105 || _1107;
    float _1111 = _974 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1115 = _1113 != 0;
    float _1117 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1097);
    float _1119 = in.m_57.y;
    int _1121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1123 = _1121 != 0;
    float _1125 = _970 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1127 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1117);
    float _1129 = _686 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1131 = in.m_57.x;
    float _1133 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1135 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1137 = fma(_654, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1129);
    out.m_59.y = _484;
    float _1139 = _1119;
    float _1141 = _1133;
    if (!_1109)
    {
        _706 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1143 = _706;
    float _1145 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1137);
    float _1147 = 0.0;
    float _1149 = _1143;
    if (_1115)
    {
        float _1151 = in.m_49.z;
        _1147 = _1151;
    }
    float _1153 = _1147;
    float _1155 = 1.0 / _1135;
    float _1157 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1161 = _1099 > 0.5;
    float _1163 = _1157 + _1135;
    out.m_59.x = _478;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1167 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_59.z = _494;
    float _1171 = _1131;
    if (!_1115)
    {
        _708 = _1131;
    }
    float _1173 = _708;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1177 = _1163 * _1155;
    float _1179 = _1177 * 0.5;
    float _1181 = -_1119;
    float _1183 = _1181 + 1.0;
    float _1185 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1187 = _1173;
    if (!_1109)
    {
        float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1191 = fma(_1179, _1143, _1189);
        _1149 = _1191;
    }
    float _1193 = _1149;
    float _1195 = exp2(_1111);
    float _1197 = _1193;
    if (_1123)
    {
        float _1199 = _1161 ? _1183 : _1119;
        _1139 = _1199;
    }
    float _1201 = _1139;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1205 = _1153 > 0.5;
    bool _1207 = _1205 && _1115;
    float _1209 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1125);
    float _1211 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1213 = _1201;
    float _1215 = _1211;
    if (!_1109)
    {
        _1213 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1217 = _1213;
    float _1219 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1221 = _1211 * _1133;
    float _1223 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1209);
    if (!_1109)
    {
        float _1225 = -_1217;
        float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1215 = _1227;
    }
    float _1229 = _1215;
    out.m_61.x = _1167;
    out.m_61.y = _1219;
    out.m_61.z = _1185;
    out.m_61.w = _1165;
    if (_1207)
    {
        float _1231 = -_1131;
        float _1233 = _1231 + 1.0;
        _1171 = _1233;
    }
    float _1235 = _1171;
    if (!_1109)
    {
        float _1237 = 1.0 / _1229;
        _1141 = _1237;
    }
    float _1239 = _1141;
    if (_1115)
    {
        _1187 = _1235;
    }
    float _1241 = _1187;
    float _1243 = _1235;
    if (!_1109)
    {
        float _1245 = 1.0 / _1193;
        _1243 = _1245;
    }
    float _1247 = _1243;
    float _1249 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1251 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1255 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1223);
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1259 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1263 = _1253 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1265 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1267 = _1249 * _1169;
    float _1269 = -_1195;
    float _1271 = _1269 + 1.0;
    float _1273 = _1249;
    if (_1109)
    {
        _1197 = 1.0;
    }
    float _1275 = _1197;
    float _1277 = _1255 + _1022;
    float _1279 = _1275;
    if (!_1109)
    {
        float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1283 = -_1217;
        float _1285 = fma(_1247, _1281, _1283);
        _1273 = _1285;
    }
    float _1287 = _1273;
    out.m_63.x = _1259;
    out.m_63.y = _1263;
    out.m_63.z = _1265;
    out.m_63.w = _1261;
    float _1289 = _1277 * 0.5;
    if (!_1109)
    {
        float _1291 = _1287 * _1239;
        float _1293 = precise::clamp(_1291, 0.0, 1.0);
        _1279 = _1293;
    }
    float _1295 = _1279;
    out.m_65.z = _1267;
    out.m_65.w = _1221;
    float _1297 = _1295 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1299 = _1295 > 0.0;
    bool _1301 = isnan(_1295);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan(0.0);
    bool _1307 = _1303 || _1305;
    out.gl_Position.x = _1038;
    out.gl_Position.y = _1050;
    out.gl_Position.z = _1255;
    out.gl_Position.w = _1022;
    out.m_67.z = _1289;
    out.m_67.w = _1022;
    float _1309 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1311 = _1297 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1313 = -_1309;
    float _1315 = _1313 + 1.0;
    out.m_45.x = _1311;
    float _1317 = _1309 * _1068;
    float _1319 = _1085 * _1317;
    float _1321 = _1085 * _1315;
    float _1323 = _1095 * _1317;
    float _1325 = fma(_1091, _1319, _1079);
    float _1327 = fma(_1093, _1319, _1081);
    float _1329 = fma(_1085, _1323, _1083);
    out.m_69.x = _1325;
    out.m_69.y = _1327;
    out.m_69.z = _1329;
    out.m_69.w = _1321;
    if (_1307)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1331 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1331;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

