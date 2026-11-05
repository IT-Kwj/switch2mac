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
    float4 m_63 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _286 = false;
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
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1608 = as_type<float>(_104);
        out.gl_Position.z = _1608;
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
        _98 = _126;
    }
    float _128 = _98;
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
        float _1678 = as_type<float>(_142);
        out.gl_Position.z = _1678;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_51.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_88);
        float _290 = 1.0 / _288;
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = in.m_51.x;
    float _298 = in.m_51.y;
    float _300 = in.m_51.z;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = _294 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _294 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _318;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _324 = _322 != 0;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _332 = _330 != 0;
    float _334 = 1.0 / _312;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = _294 + _336;
    bool _340 = !_324;
    int _342 = _340 ? 0 : 1;
    bool _344 = !_328;
    int _346 = _344 ? 0 : 1;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _348;
    float _352 = 1.0 / _316;
    int _354 = abs(_342);
    int _356 = abs(_346);
    float _358 = _296 * 2.0;
    float _360 = _300 * 2.0;
    float _362 = _298 + _300;
    float _364 = _300 + _296;
    float _366 = _300 + (-0.5);
    float _368 = _298 + _296;
    float _370 = _296 + (-0.5);
    float _372 = _298 + (-0.5);
    float _374 = 1.0 / _320;
    float _376 = _298 * 2.0;
    float _378 = _338 * _334;
    float _380 = _368 + (-1.0);
    float _382 = _364 + (-1.0);
    float _384 = _362 + (-1.0);
    float _386 = floor(_360);
    float _388 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _390 = _308 * _352;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = floor(_358);
    float _402 = _304 * _374;
    float _404 = fma(_398, _390, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _406 = fma(_394, _378, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _408 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _410;
    float _414 = floor(_376);
    bool _416 = _386 > 0.0;
    float _418 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _420 = _386 >= 0.0;
    bool _422 = isnan(_386);
    bool _424 = _420 || _422;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    int _430 = _428 ? 0 : 1;
    float _432 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _434 = log2(_432);
    bool _436 = _400 > 0.0;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _438;
    bool _442 = _400 >= 0.0;
    bool _444 = isnan(_400);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = fma(_440, _378, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _458 = _450 ? 0 : 1;
    float _460 = fma(_454, _390, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _462 = _414 > 0.0;
    bool _464 = _414 >= 0.0;
    bool _466 = isnan(_414);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _482 = ~_430;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = fma(_480, _390, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _490 = _434 * _122;
    int _492 = ~_458;
    int _494 = _492 + 1;
    int _496 = _494 + 1;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _500 = 1.0 + _498;
    float _502 = fma(_476, _378, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _504 = _486;
    int _506 = _496;
    if (!_416)
    {
        int _508 = ~_430;
        int _510 = _508 + 1;
        _504 = _510;
    }
    int _512 = _504;
    float _514 = exp2(_490);
    if (!_436)
    {
        int _516 = ~_458;
        int _518 = _516 + 1;
        _506 = _518;
    }
    int _520 = _506;
    float _522 = in.m_53.x;
    float _524 = in.m_53.y;
    float _526 = in.m_53.z;
    bool _528 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _530 = isnan(1.0);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _536 = _532 || _534;
    bool _538 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _546 = _542 || _544;
    float _548 = 1.0 / _500;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _550;
    float _554 = float(_512);
    float _556 = float(_520);
    int _558 = _472 ? 0 : 1;
    float _560 = -_514;
    float _562 = _560 + 1.0;
    float _564 = fma(_412, _402, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _566 = fma(_552, _402, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _568 = float(_354);
    float _570 = fma(_350, _402, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _572 = float(_356);
    float _574 = _546 ? _562 : 0.0;
    float _576 = _568 * _554;
    int _578 = ~_558;
    int _580 = _578 + 1;
    int _582 = _580 + 1;
    float _584 = _572 * _556;
    int _586 = _582;
    if (!_462)
    {
        int _588 = ~_558;
        int _590 = _588 + 1;
        _586 = _590;
    }
    int _592 = _586;
    if (_536)
    {
        float _594 = _574 * _548;
        _124 = _594;
    }
    float _596 = _124;
    float _598 = _576 * (-2.0);
    float _600 = _584 * (-2.0);
    bool _602 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _604 = isnan(_294);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = fma(_388, _598, _388);
    float _616 = fma(_598, _522, _522);
    float _618 = fma(_600, _524, _524);
    bool _620 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _622 = isnan(_294);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -_612;
    float _634 = _632 + 1.0;
    float _636 = fma(_418, _600, _418);
    float _638 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[196].x, _616);
    bool _640 = !_332;
    int _642 = _640 ? 0 : 1;
    float _644 = _630 * _634;
    bool _646 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _648 = isnan(_294);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -_630;
    float _660 = _658 + 1.0;
    int _662 = abs(_642);
    float _664 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[196].y, _618);
    bool _666 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _668 = isnan(_294);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = _656 * _660;
    float _680 = -_656;
    float _682 = _680 + 1.0;
    float _684 = fma(_614, _596, _638);
    float _686 = -_676;
    float _688 = _686 + 1.0;
    float _690 = _676 * _682;
    float _692 = float(_662);
    float _694 = _684 * 0.15915493667125701904296875;
    float _696 = float(_592);
    float _698 = _406 * _690;
    float _700 = _456 * _690;
    float _702 = _502 * _690;
    float _704 = in.m_49.x;
    float _706 = in.m_49.y;
    float _708 = in.m_49.z;
    float _710 = _692 * _696;
    float _712 = fma(_636, _596, _664);
    float _714 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].x, _698);
    float _716 = in.m_55.x;
    float _718 = in.m_55.y;
    float _720 = in.m_55.z;
    float _722 = _710 * (-2.0);
    float _724 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].y, _702);
    float _726 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].z, _700);
    float _728 = fma(_404, _678, _714);
    float _730 = fma(_722, _526, _526);
    float _732 = fma(_408, _722, _408);
    float _734 = fma(_488, _678, _724);
    float _736 = fma(_460, _678, _726);
    float _738 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[196].z, _730);
    float _740 = fma(_564, _644, _728);
    float _742 = _712 * 0.15915493667125701904296875;
    float _744 = fma(_566, _644, _734);
    float _746 = fma(_732, _596, _738);
    float _748 = fma(_570, _644, _736);
    float _750 = _694 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[146].x, _740);
    float _756 = _746 * 0.15915493667125701904296875;
    float _758 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[146].y, _744);
    float _760 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[146].z, _748);
    float _762 = _754 * _704;
    float _764 = _758 * _706;
    float _766 = _742 * 6.283185482025146484375;
    float _768 = sin(_766);
    float _770 = _760 * _708;
    float _772 = _762 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _718);
    float _776 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _720);
    float _778 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _780 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _716);
    float _784 = _742 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = _778 * _774;
    float _790 = _780 * _776;
    float _792 = _772 * _782;
    bool _794 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _796 = isnan(0.5);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _802 = _798 || _800;
    float _804 = _756 * 6.283185482025146484375;
    float _806 = cos(_804);
    float _808 = _752 * _768;
    float _810 = _694 * 6.283185482025146484375;
    float _812 = cos(_810);
    float _814 = _752 * _786;
    float _816 = _756 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = _752 * _806;
    float _822 = _812 * _786;
    float _824 = _812 * _806;
    float _826 = _812 * _768;
    float _828 = _786 * _806;
    float _830 = _768 * _806;
    float _832 = _824 * _788;
    float _834 = _820 * _788;
    float _836 = fma(_818, _822, _808);
    float _838 = fma(_818, _808, _822);
    float _840 = -_826;
    float _842 = fma(_818, _814, _840);
    float _844 = -_814;
    float _846 = fma(_818, _826, _844);
    float _848 = -_788;
    float _850 = _818 * _848;
    float _852 = fma(_836, _792, _832);
    float _854 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _856 = fma(_842, _792, _834);
    float _858 = fma(_828, _792, _850);
    float _860 = fma(_846, _790, _852);
    float _862 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _854);
    float _864 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _866 = fma(_830, _790, _858);
    float _868 = _860 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _870 = fma(_838, _790, _856);
    float _872 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _864);
    float _874 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _862);
    float _876 = _860 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _878 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[10].x, _868);
    float _880 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _872);
    float _882 = _874 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _884 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[8].x, _876);
    float _886 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[10].z, _878);
    float _888 = _880 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _890 = _860 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _892 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].z, _884);
    float _894 = _882 + _886;
    float _896 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[9].x, _890);
    float _898 = _888 + _892;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _902 = _894 + _900;
    float _904 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[9].z, _896);
    float _906 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _908 = _898 + _906;
    float _910 = _902 * _902;
    float _912 = fma(_908, _908, _910);
    float _914 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _916 = sqrt(_912);
    float _918 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _914);
    float _920 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _918);
    float _922 = _920 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _924 = _922 + _904;
    bool _926 = _916 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _928 = _914;
    float _930 = _866;
    float _932 = _904;
    float _934 = _916;
    float _936 = _860;
    float _938 = _912;
    if (!_926)
    {
        _928 = _898;
    }
    float _940 = _928;
    float _942 = _940;
    if (!_926)
    {
        _930 = _894;
    }
    float _944 = _930;
    float _946 = _944;
    if (!_926)
    {
        _932 = _924;
    }
    float _948 = _932;
    bool _950 = !_926;
    float _952 = _948;
    if (!_950)
    {
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _958 = _916 + _956;
        float _960 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _962 = rsqrt(_912);
        float _964 = _958 * _954;
        float _966 = _964 * 0.15915493667125701904296875;
        float _968 = _966 * 6.283185482025146484375;
        float _970 = cos(_968);
        float _972 = _966 * 6.283185482025146484375;
        float _974 = sin(_972);
        float _976 = _970 + (-1.0);
        float _978 = _976 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _980 = fma(_974, _960, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _982 = fma(_924, _970, _978);
        float _984 = _962 * _980;
        float _986 = fma(_908, _984, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _988 = fma(_902, _984, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _952 = _982;
        _946 = _988;
        _942 = _986;
        _934 = _958;
    }
    float _990 = _952;
    float _992 = _946;
    float _994 = _942;
    float _996 = _934;
    float _998 = _990;
    float _1000 = _994;
    float _1002 = _992;
    float _1004 = _996;
    if (!_802)
    {
        float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1008 = _922 + _1006;
        float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1012 = _888 + _1010;
        float _1014 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1016 = -_922;
        float _1018 = _1016 + _990;
        float _1020 = _1008 * _1008;
        float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1024 = _882 + _1022;
        float _1026 = -_882;
        float _1028 = _1026 + _992;
        float _1030 = fma(_1012, _1012, _1020);
        float _1032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1034 = fma(_1024, _1024, _1030);
        float _1036 = sqrt(_1034);
        float _1038 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1040 = precise::min(_1036, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1042 = _1040 * _1032;
        float _1044 = -_888;
        float _1046 = _1044 + _994;
        float _1048 = _1038 * _1042;
        float _1050 = fma(_1046, _1048, _888);
        float _1052 = fma(_1018, _1048, _922);
        float _1054 = fma(_1028, _1048, _882);
        _998 = _1052;
        _1000 = _1050;
        _1002 = _1054;
        _936 = _1042;
    }
    float _1056 = _998;
    float _1058 = _1000;
    float _1060 = _1002;
    float _1062 = _936;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1066 = _1056 + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1070 = _1058 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = _1060 + _1072;
    float _1076 = _1066 * _1066;
    float _1078 = fma(_1070, _1070, _1076);
    float _1080 = fma(_1074, _1074, _1078);
    float _1082 = rsqrt(_1080);
    float _1084 = sqrt(_1080);
    float _1086 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1088 = _1070 * _1086;
    float _1090 = _1074 * _1086;
    float _1092 = _1088 * _1088;
    float _1094 = _1090 * _1090;
    float _1096 = _1092 + _1094;
    float _1098 = sqrt(_1096);
    bool _1100 = _1098 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = _1098 + _1102;
    float _1106 = _1082;
    float _1108 = _1096;
    float _1110 = _1104;
    float _1112 = _1066;
    if (_1100)
    {
        float _1114 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1106 = _1114;
    }
    float _1116 = _1106;
    if (_1100)
    {
        float _1118 = rsqrt(_1096);
        _1108 = _1118;
    }
    float _1120 = _1108;
    float _1122 = _1120;
    if (_1100)
    {
        float _1124 = _1104 * _1116;
        _1110 = _1124;
    }
    float _1126 = _1110;
    if (_1100)
    {
        float _1128 = _1126 * 0.15915493667125701904296875;
        _1004 = _1128;
    }
    float _1130 = _1004;
    float _1132 = _1074;
    if (_1100)
    {
        float _1134 = _1130 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        _1132 = _1136;
    }
    float _1138 = _1132;
    float _1140 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1142 = precise::max(0.0, _1140);
    float _1144 = _1062;
    float _1146 = _1142;
    float _1148 = _1140;
    if (_1100)
    {
        float _1150 = _1130 * 6.283185482025146484375;
        float _1152 = cos(_1150);
        _1144 = _1152;
    }
    float _1154 = _1144;
    float _1156 = -_1086;
    float _1158 = -_1142;
    float _1160 = fma(_1066, _1156, _1158);
    if (!_1100)
    {
        _1112 = _1090;
    }
    float _1162 = _1112;
    float _1164 = _1162;
    if (_1100)
    {
        float _1166 = _1160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1146 = _1166;
    }
    float _1168 = _1146;
    float _1170 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1172 = _1138;
    float _1174 = _1168;
    if (_1100)
    {
        float _1176 = fma(_1138, _1168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1172 = _1176;
    }
    float _1178 = _1172;
    float _1180 = _1178;
    if (!_1100)
    {
        _1174 = _1088;
    }
    float _1182 = _1174;
    float _1184 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1170);
    float _1186 = _1182;
    if (_1100)
    {
        float _1188 = _1154 + (-1.0);
        _1148 = _1188;
    }
    float _1190 = _1148;
    float _1192 = _1190;
    if (_1100)
    {
        float _1194 = _1120 * _1178;
        _938 = _1194;
    }
    float _1196 = _938;
    if (!_1100)
    {
        _1180 = _1160;
    }
    float _1198 = _1180;
    float _1200 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1184);
    float _1202 = _1198;
    if (_1100)
    {
        float _1204 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1192 = _1204;
    }
    float _1206 = _1192;
    float _1208 = _1206;
    if (_1100)
    {
        float _1210 = _1088 * _1196;
        _1186 = _1210;
    }
    float _1212 = _1186;
    if (!_1100)
    {
        _1122 = _1092;
    }
    float _1214 = _1122;
    float _1216 = _1214;
    if (_1100)
    {
        float _1218 = _1090 * _1196;
        _1164 = _1218;
    }
    float _1220 = _1164;
    if (_1100)
    {
        float _1222 = fma(_1160, _1154, _1206);
        _1202 = _1222;
    }
    float _1224 = _1202;
    if (_1100)
    {
        float _1226 = _1212 * _1212;
        _1216 = _1226;
    }
    float _1228 = _1216;
    if (!_1100)
    {
        _1208 = _1094;
    }
    float _1230 = _1208;
    float _1232 = _1230;
    if (_1100)
    {
        float _1234 = _1220 * _1220;
        _1232 = _1234;
    }
    float _1236 = _1232;
    float _1238 = fma(_1224, _1224, _1228);
    float _1240 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1242 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1244 = _1238 + _1236;
    float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1248 = fma(_1084, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1246);
    float _1250 = precise::clamp(_1248, 0.0, 1.0);
    float _1252 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1254 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1256 = rsqrt(_1244);
    float _1258 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1260 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1242);
    float _1262 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1254);
    float _1264 = -_1250;
    float _1266 = _1264 + 1.0;
    float _1268 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1258);
    float _1270 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1260);
    float _1272 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1262);
    float _1274 = abs(_1266);
    float _1276 = log2(_1274);
    float _1278 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1280 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1268);
    float _1282 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1284 = -_1278;
    float _1286 = fma(_1284, _1252, 1.0);
    float _1288 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1292 = _1256 * _1212;
    float _1294 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1296 = _1256 * _1224;
    float _1298 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1290);
    float _1300 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1302 = _1256 * _1220;
    float _1304 = log2(_1286);
    float _1306 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1298);
    float _1308 = -_1300;
    float _1310 = fma(_1296, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1308);
    float _1312 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1314 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1306);
    float _1316 = -_1302;
    float _1318 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1310);
    float _1320 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1322 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1324 = 1.0 / _1314;
    float _1326 = fma(_1318, -0.5, 0.5);
    float _1328 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1320);
    float _1330 = fma(_1318, 0.5, 0.5);
    float _1332 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1322);
    float _1334 = _1296 + 1.0;
    float _1336 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1328);
    float _1338 = fma(_1330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1340 = exp2(_1312);
    float _1342 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1332);
    float _1344 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1336);
    float _1346 = fma(_1330, _1338, -0.212114393711090087890625);
    float _1348 = _1304 * 0.693147182464599609375;
    float _1350 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1342);
    float _1352 = fma(_1330, _1346, 1.570728778839111328125);
    float _1354 = sqrt(_1326);
    float _1356 = _1344 * _1324;
    float _1358 = _1350 * _1324;
    float _1360 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1362 = fma(_1356, 0.5, 0.5);
    float _1364 = fma(_1358, -0.5, 0.5);
    float _1366 = -_1296;
    float _1368 = fma(_1340, _1334, _1366);
    float3 _3593 = float3(_1362, _1364, _1360);
    float _1370 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3593, float3(0.0), isnan(_3593)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3593, float3(0.0), isnan(_3593)), level(0.0)).x;
    float _1372 = _1354 * 0.636619746685028076171875;
    float _1374 = fma(_1368, 0.5, 0.5);
    float _1376 = -_1352;
    float _1378 = fma(_1372, _1376, 1.0);
    float3 _3614 = float3(_1362, _1364, _1360);
    float4 _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3614, float3(0.0), isnan(_3614)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3614, float3(0.0), isnan(_3614)), level(0.0)).xyzw;
    float _1383 = _1381.x;
    float _1385 = _1381.y;
    float _1387 = _1381.z;
    float _1389 = _1381.w;
    float2 _3631 = float2(_1378, _1374);
    float3 _1393 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3631, float2(0.0), isnan(_3631)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3631, float2(0.0), isnan(_3631)), level(0.0)).xyz;
    float _1395 = _1393.x;
    float _1397 = _1393.y;
    float _1399 = _1393.z;
    float _1401 = in.m_57.x;
    float _1403 = in.m_57.y;
    float _1405 = in.m_57.z;
    bool _1407 = _718 != 0.0;
    bool _1409 = isnan(_718);
    bool _1411 = _1407 || _1409;
    bool _1413 = isnan(0.0);
    bool _1415 = _1411 || _1413;
    float _1417 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1419 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_59.x = _1058;
    out.m_59.y = _1056;
    out.m_59.z = _1060;
    bool _1421 = _716 == 0.0;
    bool _1423 = !_1415;
    bool _1425 = _1421 && _1423;
    float _1427 = exp2(_1417);
    bool _1429 = _720 == 0.0;
    bool _1431 = _1429 && _1425;
    float _1433 = _1403;
    float _1435 = _1401;
    float _1437 = _1405;
    if (!_1431)
    {
        float _1439 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1403);
        _1433 = _1439;
    }
    float _1441 = _1433;
    if (!_1431)
    {
        float _1443 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1401);
        _1435 = _1443;
    }
    float _1445 = _1435;
    if (!_1431)
    {
        float _1447 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1405);
        _1437 = _1447;
    }
    float _1449 = _1437;
    float _1451 = _824 * _1441;
    float _1453 = -_1441;
    float _1455 = _818 * _1453;
    float _1457 = _820 * _1441;
    float _1459 = fma(_836, _1445, _1451);
    float _1461 = fma(_828, _1445, _1455);
    float _1463 = fma(_842, _1445, _1457);
    float _1465 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1419);
    float _1467 = fma(_846, _1449, _1459);
    float _1469 = fma(_830, _1449, _1461);
    float _1471 = fma(_838, _1449, _1463);
    float _1473 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1475 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1477 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1479 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1473);
    float _1481 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1475);
    float _1483 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1477);
    float _1485 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1465);
    float _1487 = fma(_1471, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1479);
    float _1489 = fma(_1471, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1481);
    float _1491 = fma(_1471, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1483);
    float _1493 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1485);
    float _1495 = -_1427;
    float _1497 = _1495 + 1.0;
    float _1499 = _1493 + _1314;
    float _1501 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1511 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1513 = _1499 * 0.5;
    float _1515 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1519 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1521 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1523 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1527 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1529 = _1509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1531 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1519;
    out.m_61.y = _1521;
    out.m_61.z = _1523;
    out.m_61.w = _1517;
    out.m_63.x = _1527;
    out.m_63.y = _1529;
    out.m_63.z = _1531;
    out.m_63.w = _1525;
    out.m_65.x = _1487;
    out.m_65.y = _1489;
    out.m_65.z = _1491;
    out.gl_Position.x = _1344;
    out.gl_Position.y = _1350;
    out.gl_Position.z = _1493;
    out.gl_Position.w = _1314;
    out.m_67.z = _1513;
    out.m_67.w = _1314;
    float _1533 = -_1515;
    float _1535 = _1533 + 1.0;
    float _1537 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1537;
    float _1539 = _1515 * _1370;
    float _1541 = _1389 * _1539;
    float _1543 = _1389 * _1535;
    float _1545 = _1399 * _1539;
    float _1547 = fma(_1395, _1541, _1383);
    float _1549 = fma(_1397, _1541, _1385);
    float _1551 = fma(_1389, _1545, _1387);
    out.m_69.x = _1547;
    out.m_69.y = _1549;
    out.m_69.z = _1551;
    out.m_69.w = _1543;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _286 = false;
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
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1608 = as_type<float>(_104);
        out.gl_Position.z = _1608;
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
        _98 = _126;
    }
    float _128 = _98;
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
        float _1678 = as_type<float>(_142);
        out.gl_Position.z = _1678;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_51.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_88);
        float _290 = 1.0 / _288;
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = in.m_51.x;
    float _298 = in.m_51.y;
    float _300 = in.m_51.z;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = _294 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _294 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _318;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _324 = _322 != 0;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _332 = _330 != 0;
    float _334 = 1.0 / _312;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = _294 + _336;
    bool _340 = !_324;
    int _342 = _340 ? 0 : 1;
    bool _344 = !_328;
    int _346 = _344 ? 0 : 1;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _348;
    float _352 = 1.0 / _316;
    int _354 = abs(_342);
    int _356 = abs(_346);
    float _358 = _296 * 2.0;
    float _360 = _300 * 2.0;
    float _362 = _298 + _300;
    float _364 = _300 + _296;
    float _366 = _300 + (-0.5);
    float _368 = _298 + _296;
    float _370 = _296 + (-0.5);
    float _372 = _298 + (-0.5);
    float _374 = 1.0 / _320;
    float _376 = _298 * 2.0;
    float _378 = _338 * _334;
    float _380 = _368 + (-1.0);
    float _382 = _364 + (-1.0);
    float _384 = _362 + (-1.0);
    float _386 = floor(_360);
    float _388 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _390 = _308 * _352;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = floor(_358);
    float _402 = _304 * _374;
    float _404 = fma(_398, _390, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _406 = fma(_394, _378, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _408 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _410;
    float _414 = floor(_376);
    bool _416 = _386 > 0.0;
    float _418 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _420 = _386 >= 0.0;
    bool _422 = isnan(_386);
    bool _424 = _420 || _422;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    int _430 = _428 ? 0 : 1;
    float _432 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _434 = log2(_432);
    bool _436 = _400 > 0.0;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _438;
    bool _442 = _400 >= 0.0;
    bool _444 = isnan(_400);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = fma(_440, _378, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _458 = _450 ? 0 : 1;
    float _460 = fma(_454, _390, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _462 = _414 > 0.0;
    bool _464 = _414 >= 0.0;
    bool _466 = isnan(_414);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _482 = ~_430;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = fma(_480, _390, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _490 = _434 * _122;
    int _492 = ~_458;
    int _494 = _492 + 1;
    int _496 = _494 + 1;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _500 = 1.0 + _498;
    float _502 = fma(_476, _378, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _504 = _486;
    int _506 = _496;
    if (!_416)
    {
        int _508 = ~_430;
        int _510 = _508 + 1;
        _504 = _510;
    }
    int _512 = _504;
    float _514 = exp2(_490);
    if (!_436)
    {
        int _516 = ~_458;
        int _518 = _516 + 1;
        _506 = _518;
    }
    int _520 = _506;
    float _522 = in.m_53.x;
    float _524 = in.m_53.y;
    float _526 = in.m_53.z;
    bool _528 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _530 = isnan(1.0);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _536 = _532 || _534;
    bool _538 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _546 = _542 || _544;
    float _548 = 1.0 / _500;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _550;
    float _554 = float(_512);
    float _556 = float(_520);
    int _558 = _472 ? 0 : 1;
    float _560 = -_514;
    float _562 = _560 + 1.0;
    float _564 = fma(_412, _402, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _566 = fma(_552, _402, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _568 = float(_354);
    float _570 = fma(_350, _402, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _572 = float(_356);
    float _574 = _546 ? _562 : 0.0;
    float _576 = _568 * _554;
    int _578 = ~_558;
    int _580 = _578 + 1;
    int _582 = _580 + 1;
    float _584 = _572 * _556;
    int _586 = _582;
    if (!_462)
    {
        int _588 = ~_558;
        int _590 = _588 + 1;
        _586 = _590;
    }
    int _592 = _586;
    if (_536)
    {
        float _594 = _574 * _548;
        _124 = _594;
    }
    float _596 = _124;
    float _598 = _576 * (-2.0);
    float _600 = _584 * (-2.0);
    bool _602 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _604 = isnan(_294);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = fma(_388, _598, _388);
    float _616 = fma(_598, _522, _522);
    float _618 = fma(_600, _524, _524);
    bool _620 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _622 = isnan(_294);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -_612;
    float _634 = _632 + 1.0;
    float _636 = fma(_418, _600, _418);
    float _638 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[196].x, _616);
    bool _640 = !_332;
    int _642 = _640 ? 0 : 1;
    float _644 = _630 * _634;
    bool _646 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _648 = isnan(_294);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -_630;
    float _660 = _658 + 1.0;
    int _662 = abs(_642);
    float _664 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[196].y, _618);
    bool _666 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _668 = isnan(_294);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = _656 * _660;
    float _680 = -_656;
    float _682 = _680 + 1.0;
    float _684 = fma(_614, _596, _638);
    float _686 = -_676;
    float _688 = _686 + 1.0;
    float _690 = _676 * _682;
    float _692 = float(_662);
    float _694 = _684 * 0.15915493667125701904296875;
    float _696 = float(_592);
    float _698 = _406 * _690;
    float _700 = _456 * _690;
    float _702 = _502 * _690;
    float _704 = in.m_49.x;
    float _706 = in.m_49.y;
    float _708 = in.m_49.z;
    float _710 = _692 * _696;
    float _712 = fma(_636, _596, _664);
    float _714 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].x, _698);
    float _716 = in.m_55.x;
    float _718 = in.m_55.y;
    float _720 = in.m_55.z;
    float _722 = _710 * (-2.0);
    float _724 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].y, _702);
    float _726 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].z, _700);
    float _728 = fma(_404, _678, _714);
    float _730 = fma(_722, _526, _526);
    float _732 = fma(_408, _722, _408);
    float _734 = fma(_488, _678, _724);
    float _736 = fma(_460, _678, _726);
    float _738 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[196].z, _730);
    float _740 = fma(_564, _644, _728);
    float _742 = _712 * 0.15915493667125701904296875;
    float _744 = fma(_566, _644, _734);
    float _746 = fma(_732, _596, _738);
    float _748 = fma(_570, _644, _736);
    float _750 = _694 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[146].x, _740);
    float _756 = _746 * 0.15915493667125701904296875;
    float _758 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[146].y, _744);
    float _760 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[146].z, _748);
    float _762 = _754 * _704;
    float _764 = _758 * _706;
    float _766 = _742 * 6.283185482025146484375;
    float _768 = sin(_766);
    float _770 = _760 * _708;
    float _772 = _762 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _718);
    float _776 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _720);
    float _778 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _780 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _716);
    float _784 = _742 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = _778 * _774;
    float _790 = _780 * _776;
    float _792 = _772 * _782;
    bool _794 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _796 = isnan(0.5);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _802 = _798 || _800;
    float _804 = _756 * 6.283185482025146484375;
    float _806 = cos(_804);
    float _808 = _752 * _768;
    float _810 = _694 * 6.283185482025146484375;
    float _812 = cos(_810);
    float _814 = _752 * _786;
    float _816 = _756 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = _752 * _806;
    float _822 = _812 * _786;
    float _824 = _812 * _806;
    float _826 = _812 * _768;
    float _828 = _786 * _806;
    float _830 = _768 * _806;
    float _832 = _824 * _788;
    float _834 = _820 * _788;
    float _836 = fma(_818, _822, _808);
    float _838 = fma(_818, _808, _822);
    float _840 = -_826;
    float _842 = fma(_818, _814, _840);
    float _844 = -_814;
    float _846 = fma(_818, _826, _844);
    float _848 = -_788;
    float _850 = _818 * _848;
    float _852 = fma(_836, _792, _832);
    float _854 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _856 = fma(_842, _792, _834);
    float _858 = fma(_828, _792, _850);
    float _860 = fma(_846, _790, _852);
    float _862 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _854);
    float _864 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _866 = fma(_830, _790, _858);
    float _868 = _860 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _870 = fma(_838, _790, _856);
    float _872 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _864);
    float _874 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _862);
    float _876 = _860 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _878 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[10].x, _868);
    float _880 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _872);
    float _882 = _874 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _884 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[8].x, _876);
    float _886 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[10].z, _878);
    float _888 = _880 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _890 = _860 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _892 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].z, _884);
    float _894 = _882 + _886;
    float _896 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[9].x, _890);
    float _898 = _888 + _892;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _902 = _894 + _900;
    float _904 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[9].z, _896);
    float _906 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _908 = _898 + _906;
    float _910 = _902 * _902;
    float _912 = fma(_908, _908, _910);
    float _914 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _916 = sqrt(_912);
    float _918 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _914);
    float _920 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _918);
    float _922 = _920 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _924 = _922 + _904;
    bool _926 = _916 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _928 = _914;
    float _930 = _866;
    float _932 = _904;
    float _934 = _916;
    float _936 = _860;
    float _938 = _912;
    if (!_926)
    {
        _928 = _898;
    }
    float _940 = _928;
    float _942 = _940;
    if (!_926)
    {
        _930 = _894;
    }
    float _944 = _930;
    float _946 = _944;
    if (!_926)
    {
        _932 = _924;
    }
    float _948 = _932;
    bool _950 = !_926;
    float _952 = _948;
    if (!_950)
    {
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _958 = _916 + _956;
        float _960 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _962 = rsqrt(_912);
        float _964 = _958 * _954;
        float _966 = _964 * 0.15915493667125701904296875;
        float _968 = _966 * 6.283185482025146484375;
        float _970 = cos(_968);
        float _972 = _966 * 6.283185482025146484375;
        float _974 = sin(_972);
        float _976 = _970 + (-1.0);
        float _978 = _976 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _980 = fma(_974, _960, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _982 = fma(_924, _970, _978);
        float _984 = _962 * _980;
        float _986 = fma(_908, _984, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _988 = fma(_902, _984, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _952 = _982;
        _946 = _988;
        _942 = _986;
        _934 = _958;
    }
    float _990 = _952;
    float _992 = _946;
    float _994 = _942;
    float _996 = _934;
    float _998 = _990;
    float _1000 = _994;
    float _1002 = _992;
    float _1004 = _996;
    if (!_802)
    {
        float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1008 = _922 + _1006;
        float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1012 = _888 + _1010;
        float _1014 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1016 = -_922;
        float _1018 = _1016 + _990;
        float _1020 = _1008 * _1008;
        float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1024 = _882 + _1022;
        float _1026 = -_882;
        float _1028 = _1026 + _992;
        float _1030 = fma(_1012, _1012, _1020);
        float _1032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1034 = fma(_1024, _1024, _1030);
        float _1036 = sqrt(_1034);
        float _1038 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1040 = precise::min(_1036, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1042 = _1040 * _1032;
        float _1044 = -_888;
        float _1046 = _1044 + _994;
        float _1048 = _1038 * _1042;
        float _1050 = fma(_1046, _1048, _888);
        float _1052 = fma(_1018, _1048, _922);
        float _1054 = fma(_1028, _1048, _882);
        _998 = _1052;
        _1000 = _1050;
        _1002 = _1054;
        _936 = _1042;
    }
    float _1056 = _998;
    float _1058 = _1000;
    float _1060 = _1002;
    float _1062 = _936;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1066 = _1056 + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1070 = _1058 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = _1060 + _1072;
    float _1076 = _1066 * _1066;
    float _1078 = fma(_1070, _1070, _1076);
    float _1080 = fma(_1074, _1074, _1078);
    float _1082 = rsqrt(_1080);
    float _1084 = sqrt(_1080);
    float _1086 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1088 = _1070 * _1086;
    float _1090 = _1074 * _1086;
    float _1092 = _1088 * _1088;
    float _1094 = _1090 * _1090;
    float _1096 = _1092 + _1094;
    float _1098 = sqrt(_1096);
    bool _1100 = _1098 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = _1098 + _1102;
    float _1106 = _1082;
    float _1108 = _1096;
    float _1110 = _1104;
    float _1112 = _1066;
    if (_1100)
    {
        float _1114 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1106 = _1114;
    }
    float _1116 = _1106;
    if (_1100)
    {
        float _1118 = rsqrt(_1096);
        _1108 = _1118;
    }
    float _1120 = _1108;
    float _1122 = _1120;
    if (_1100)
    {
        float _1124 = _1104 * _1116;
        _1110 = _1124;
    }
    float _1126 = _1110;
    if (_1100)
    {
        float _1128 = _1126 * 0.15915493667125701904296875;
        _1004 = _1128;
    }
    float _1130 = _1004;
    float _1132 = _1074;
    if (_1100)
    {
        float _1134 = _1130 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        _1132 = _1136;
    }
    float _1138 = _1132;
    float _1140 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1142 = precise::max(0.0, _1140);
    float _1144 = _1062;
    float _1146 = _1142;
    float _1148 = _1140;
    if (_1100)
    {
        float _1150 = _1130 * 6.283185482025146484375;
        float _1152 = cos(_1150);
        _1144 = _1152;
    }
    float _1154 = _1144;
    float _1156 = -_1086;
    float _1158 = -_1142;
    float _1160 = fma(_1066, _1156, _1158);
    if (!_1100)
    {
        _1112 = _1090;
    }
    float _1162 = _1112;
    float _1164 = _1162;
    if (_1100)
    {
        float _1166 = _1160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1146 = _1166;
    }
    float _1168 = _1146;
    float _1170 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1172 = _1138;
    float _1174 = _1168;
    if (_1100)
    {
        float _1176 = fma(_1138, _1168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1172 = _1176;
    }
    float _1178 = _1172;
    float _1180 = _1178;
    if (!_1100)
    {
        _1174 = _1088;
    }
    float _1182 = _1174;
    float _1184 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1170);
    float _1186 = _1182;
    if (_1100)
    {
        float _1188 = _1154 + (-1.0);
        _1148 = _1188;
    }
    float _1190 = _1148;
    float _1192 = _1190;
    if (_1100)
    {
        float _1194 = _1120 * _1178;
        _938 = _1194;
    }
    float _1196 = _938;
    if (!_1100)
    {
        _1180 = _1160;
    }
    float _1198 = _1180;
    float _1200 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1184);
    float _1202 = _1198;
    if (_1100)
    {
        float _1204 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1192 = _1204;
    }
    float _1206 = _1192;
    float _1208 = _1206;
    if (_1100)
    {
        float _1210 = _1088 * _1196;
        _1186 = _1210;
    }
    float _1212 = _1186;
    if (!_1100)
    {
        _1122 = _1092;
    }
    float _1214 = _1122;
    float _1216 = _1214;
    if (_1100)
    {
        float _1218 = _1090 * _1196;
        _1164 = _1218;
    }
    float _1220 = _1164;
    if (_1100)
    {
        float _1222 = fma(_1160, _1154, _1206);
        _1202 = _1222;
    }
    float _1224 = _1202;
    if (_1100)
    {
        float _1226 = _1212 * _1212;
        _1216 = _1226;
    }
    float _1228 = _1216;
    if (!_1100)
    {
        _1208 = _1094;
    }
    float _1230 = _1208;
    float _1232 = _1230;
    if (_1100)
    {
        float _1234 = _1220 * _1220;
        _1232 = _1234;
    }
    float _1236 = _1232;
    float _1238 = fma(_1224, _1224, _1228);
    float _1240 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1242 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1244 = _1238 + _1236;
    float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1248 = fma(_1084, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1246);
    float _1250 = precise::clamp(_1248, 0.0, 1.0);
    float _1252 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1254 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1256 = rsqrt(_1244);
    float _1258 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1260 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1242);
    float _1262 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1254);
    float _1264 = -_1250;
    float _1266 = _1264 + 1.0;
    float _1268 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1258);
    float _1270 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1260);
    float _1272 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1262);
    float _1274 = abs(_1266);
    float _1276 = log2(_1274);
    float _1278 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1280 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1268);
    float _1282 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1284 = -_1278;
    float _1286 = fma(_1284, _1252, 1.0);
    float _1288 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1292 = _1256 * _1212;
    float _1294 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1296 = _1256 * _1224;
    float _1298 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1290);
    float _1300 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1302 = _1256 * _1220;
    float _1304 = log2(_1286);
    float _1306 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1298);
    float _1308 = -_1300;
    float _1310 = fma(_1296, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1308);
    float _1312 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1314 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1306);
    float _1316 = -_1302;
    float _1318 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1310);
    float _1320 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1322 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1324 = 1.0 / _1314;
    float _1326 = fma(_1318, -0.5, 0.5);
    float _1328 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1320);
    float _1330 = fma(_1318, 0.5, 0.5);
    float _1332 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1322);
    float _1334 = _1296 + 1.0;
    float _1336 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1328);
    float _1338 = fma(_1330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1340 = exp2(_1312);
    float _1342 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1332);
    float _1344 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1336);
    float _1346 = fma(_1330, _1338, -0.212114393711090087890625);
    float _1348 = _1304 * 0.693147182464599609375;
    float _1350 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1342);
    float _1352 = fma(_1330, _1346, 1.570728778839111328125);
    float _1354 = sqrt(_1326);
    float _1356 = _1344 * _1324;
    float _1358 = _1350 * _1324;
    float _1360 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1362 = fma(_1356, 0.5, 0.5);
    float _1364 = fma(_1358, -0.5, 0.5);
    float _1366 = -_1296;
    float _1368 = fma(_1340, _1334, _1366);
    float3 _3593 = float3(_1362, _1364, _1360);
    float _1370 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3593, float3(0.0), isnan(_3593)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3593, float3(0.0), isnan(_3593)), level(0.0)).x;
    float _1372 = _1354 * 0.636619746685028076171875;
    float _1374 = fma(_1368, 0.5, 0.5);
    float _1376 = -_1352;
    float _1378 = fma(_1372, _1376, 1.0);
    float3 _3614 = float3(_1362, _1364, _1360);
    float4 _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3614, float3(0.0), isnan(_3614)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3614, float3(0.0), isnan(_3614)), level(0.0)).xyzw;
    float _1383 = _1381.x;
    float _1385 = _1381.y;
    float _1387 = _1381.z;
    float _1389 = _1381.w;
    float2 _3631 = float2(_1378, _1374);
    float3 _1393 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3631, float2(0.0), isnan(_3631)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3631, float2(0.0), isnan(_3631)), level(0.0)).xyz;
    float _1395 = _1393.x;
    float _1397 = _1393.y;
    float _1399 = _1393.z;
    float _1401 = in.m_57.x;
    float _1403 = in.m_57.y;
    float _1405 = in.m_57.z;
    bool _1407 = _718 != 0.0;
    bool _1409 = isnan(_718);
    bool _1411 = _1407 || _1409;
    bool _1413 = isnan(0.0);
    bool _1415 = _1411 || _1413;
    float _1417 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1419 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_59.x = _1058;
    out.m_59.y = _1056;
    out.m_59.z = _1060;
    bool _1421 = _716 == 0.0;
    bool _1423 = !_1415;
    bool _1425 = _1421 && _1423;
    float _1427 = exp2(_1417);
    bool _1429 = _720 == 0.0;
    bool _1431 = _1429 && _1425;
    float _1433 = _1403;
    float _1435 = _1401;
    float _1437 = _1405;
    if (!_1431)
    {
        float _1439 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1403);
        _1433 = _1439;
    }
    float _1441 = _1433;
    if (!_1431)
    {
        float _1443 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1401);
        _1435 = _1443;
    }
    float _1445 = _1435;
    if (!_1431)
    {
        float _1447 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1405);
        _1437 = _1447;
    }
    float _1449 = _1437;
    float _1451 = _824 * _1441;
    float _1453 = -_1441;
    float _1455 = _818 * _1453;
    float _1457 = _820 * _1441;
    float _1459 = fma(_836, _1445, _1451);
    float _1461 = fma(_828, _1445, _1455);
    float _1463 = fma(_842, _1445, _1457);
    float _1465 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1419);
    float _1467 = fma(_846, _1449, _1459);
    float _1469 = fma(_830, _1449, _1461);
    float _1471 = fma(_838, _1449, _1463);
    float _1473 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1475 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1477 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1479 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1473);
    float _1481 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1475);
    float _1483 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1477);
    float _1485 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1465);
    float _1487 = fma(_1471, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1479);
    float _1489 = fma(_1471, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1481);
    float _1491 = fma(_1471, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1483);
    float _1493 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1485);
    float _1495 = -_1427;
    float _1497 = _1495 + 1.0;
    float _1499 = _1493 + _1314;
    float _1501 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1511 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1513 = _1499 * 0.5;
    float _1515 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1519 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1521 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1523 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1527 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1529 = _1509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1531 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1519;
    out.m_61.y = _1521;
    out.m_61.z = _1523;
    out.m_61.w = _1517;
    out.m_63.x = _1527;
    out.m_63.y = _1529;
    out.m_63.z = _1531;
    out.m_63.w = _1525;
    out.m_65.x = _1487;
    out.m_65.y = _1489;
    out.m_65.z = _1491;
    out.gl_Position.x = _1344;
    out.gl_Position.y = _1350;
    out.gl_Position.z = _1493;
    out.gl_Position.w = _1314;
    out.m_67.z = _1513;
    out.m_67.w = _1314;
    float _1533 = -_1515;
    float _1535 = _1533 + 1.0;
    float _1537 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1537;
    float _1539 = _1515 * _1370;
    float _1541 = _1389 * _1539;
    float _1543 = _1389 * _1535;
    float _1545 = _1399 * _1539;
    float _1547 = fma(_1395, _1541, _1383);
    float _1549 = fma(_1397, _1541, _1385);
    float _1551 = fma(_1389, _1545, _1387);
    out.m_69.x = _1547;
    out.m_69.y = _1549;
    out.m_69.z = _1551;
    out.m_69.w = _1543;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _286 = false;
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
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1608 = as_type<float>(_104);
        out.gl_Position.z = _1608;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _98 = _126;
    }
    float _128 = _98;
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
        float _1678 = as_type<float>(_142);
        out.gl_Position.z = _1678;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_51.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_88);
        float _290 = 1.0 / _288;
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = in.m_51.x;
    float _298 = in.m_51.y;
    float _300 = in.m_51.z;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = _294 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _294 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _318;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _324 = _322 != 0;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _332 = _330 != 0;
    float _334 = 1.0 / _312;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = _294 + _336;
    bool _340 = !_324;
    int _342 = _340 ? 0 : 1;
    bool _344 = !_328;
    int _346 = _344 ? 0 : 1;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _348;
    float _352 = 1.0 / _316;
    int _354 = abs(_342);
    int _356 = abs(_346);
    float _358 = _296 * 2.0;
    float _360 = _300 * 2.0;
    float _362 = _298 + _300;
    float _364 = _300 + _296;
    float _366 = _300 + (-0.5);
    float _368 = _298 + _296;
    float _370 = _296 + (-0.5);
    float _372 = _298 + (-0.5);
    float _374 = 1.0 / _320;
    float _376 = _298 * 2.0;
    float _378 = _338 * _334;
    float _380 = _368 + (-1.0);
    float _382 = _364 + (-1.0);
    float _384 = _362 + (-1.0);
    float _386 = floor(_360);
    float _388 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _390 = _308 * _352;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = floor(_358);
    float _402 = _304 * _374;
    float _404 = fma(_398, _390, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _406 = fma(_394, _378, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _408 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _410;
    float _414 = floor(_376);
    bool _416 = _386 > 0.0;
    float _418 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _420 = _386 >= 0.0;
    bool _422 = isnan(_386);
    bool _424 = _420 || _422;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    int _430 = _428 ? 0 : 1;
    float _432 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _434 = log2(_432);
    bool _436 = _400 > 0.0;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _438;
    bool _442 = _400 >= 0.0;
    bool _444 = isnan(_400);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = fma(_440, _378, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _458 = _450 ? 0 : 1;
    float _460 = fma(_454, _390, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _462 = _414 > 0.0;
    bool _464 = _414 >= 0.0;
    bool _466 = isnan(_414);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _482 = ~_430;
    int _484 = _482 + 1;
    int _486 = _484 + 1;
    float _488 = fma(_480, _390, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _490 = _434 * _122;
    int _492 = ~_458;
    int _494 = _492 + 1;
    int _496 = _494 + 1;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _500 = 1.0 + _498;
    float _502 = fma(_476, _378, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _504 = _486;
    int _506 = _496;
    if (!_416)
    {
        int _508 = ~_430;
        int _510 = _508 + 1;
        _504 = _510;
    }
    int _512 = _504;
    float _514 = exp2(_490);
    if (!_436)
    {
        int _516 = ~_458;
        int _518 = _516 + 1;
        _506 = _518;
    }
    int _520 = _506;
    float _522 = in.m_53.x;
    float _524 = in.m_53.y;
    float _526 = in.m_53.z;
    bool _528 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _530 = isnan(1.0);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _536 = _532 || _534;
    bool _538 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _546 = _542 || _544;
    float _548 = 1.0 / _500;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _550;
    float _554 = float(_512);
    float _556 = float(_520);
    int _558 = _472 ? 0 : 1;
    float _560 = -_514;
    float _562 = _560 + 1.0;
    float _564 = fma(_412, _402, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _566 = fma(_552, _402, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _568 = float(_354);
    float _570 = fma(_350, _402, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _572 = float(_356);
    float _574 = _546 ? _562 : 0.0;
    float _576 = _568 * _554;
    int _578 = ~_558;
    int _580 = _578 + 1;
    int _582 = _580 + 1;
    float _584 = _572 * _556;
    int _586 = _582;
    if (!_462)
    {
        int _588 = ~_558;
        int _590 = _588 + 1;
        _586 = _590;
    }
    int _592 = _586;
    if (_536)
    {
        float _594 = _574 * _548;
        _124 = _594;
    }
    float _596 = _124;
    float _598 = _576 * (-2.0);
    float _600 = _584 * (-2.0);
    bool _602 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _604 = isnan(_294);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = fma(_388, _598, _388);
    float _616 = fma(_598, _522, _522);
    float _618 = fma(_600, _524, _524);
    bool _620 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _622 = isnan(_294);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -_612;
    float _634 = _632 + 1.0;
    float _636 = fma(_418, _600, _418);
    float _638 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[196].x, _616);
    bool _640 = !_332;
    int _642 = _640 ? 0 : 1;
    float _644 = _630 * _634;
    bool _646 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _648 = isnan(_294);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -_630;
    float _660 = _658 + 1.0;
    int _662 = abs(_642);
    float _664 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[196].y, _618);
    bool _666 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _668 = isnan(_294);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = _656 * _660;
    float _680 = -_656;
    float _682 = _680 + 1.0;
    float _684 = fma(_614, _596, _638);
    float _686 = -_676;
    float _688 = _686 + 1.0;
    float _690 = _676 * _682;
    float _692 = float(_662);
    float _694 = _684 * 0.15915493667125701904296875;
    float _696 = float(_592);
    float _698 = _406 * _690;
    float _700 = _456 * _690;
    float _702 = _502 * _690;
    float _704 = in.m_49.x;
    float _706 = in.m_49.y;
    float _708 = in.m_49.z;
    float _710 = _692 * _696;
    float _712 = fma(_636, _596, _664);
    float _714 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].x, _698);
    float _716 = in.m_55.x;
    float _718 = in.m_55.y;
    float _720 = in.m_55.z;
    float _722 = _710 * (-2.0);
    float _724 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].y, _702);
    float _726 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[143].z, _700);
    float _728 = fma(_404, _678, _714);
    float _730 = fma(_722, _526, _526);
    float _732 = fma(_408, _722, _408);
    float _734 = fma(_488, _678, _724);
    float _736 = fma(_460, _678, _726);
    float _738 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[196].z, _730);
    float _740 = fma(_564, _644, _728);
    float _742 = _712 * 0.15915493667125701904296875;
    float _744 = fma(_566, _644, _734);
    float _746 = fma(_732, _596, _738);
    float _748 = fma(_570, _644, _736);
    float _750 = _694 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[146].x, _740);
    float _756 = _746 * 0.15915493667125701904296875;
    float _758 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[146].y, _744);
    float _760 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[146].z, _748);
    float _762 = _754 * _704;
    float _764 = _758 * _706;
    float _766 = _742 * 6.283185482025146484375;
    float _768 = sin(_766);
    float _770 = _760 * _708;
    float _772 = _762 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _718);
    float _776 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _720);
    float _778 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _780 = _770 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _716);
    float _784 = _742 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = _778 * _774;
    float _790 = _780 * _776;
    float _792 = _772 * _782;
    bool _794 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _796 = isnan(0.5);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _802 = _798 || _800;
    float _804 = _756 * 6.283185482025146484375;
    float _806 = cos(_804);
    float _808 = _752 * _768;
    float _810 = _694 * 6.283185482025146484375;
    float _812 = cos(_810);
    float _814 = _752 * _786;
    float _816 = _756 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = _752 * _806;
    float _822 = _812 * _786;
    float _824 = _812 * _806;
    float _826 = _812 * _768;
    float _828 = _786 * _806;
    float _830 = _768 * _806;
    float _832 = _824 * _788;
    float _834 = _820 * _788;
    float _836 = fma(_818, _822, _808);
    float _838 = fma(_818, _808, _822);
    float _840 = -_826;
    float _842 = fma(_818, _814, _840);
    float _844 = -_814;
    float _846 = fma(_818, _826, _844);
    float _848 = -_788;
    float _850 = _818 * _848;
    float _852 = fma(_836, _792, _832);
    float _854 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _856 = fma(_842, _792, _834);
    float _858 = fma(_828, _792, _850);
    float _860 = fma(_846, _790, _852);
    float _862 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _854);
    float _864 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _866 = fma(_830, _790, _858);
    float _868 = _860 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _870 = fma(_838, _790, _856);
    float _872 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _864);
    float _874 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _862);
    float _876 = _860 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _878 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[10].x, _868);
    float _880 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _872);
    float _882 = _874 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _884 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[8].x, _876);
    float _886 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[10].z, _878);
    float _888 = _880 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _890 = _860 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _892 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[8].z, _884);
    float _894 = _882 + _886;
    float _896 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[9].x, _890);
    float _898 = _888 + _892;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _902 = _894 + _900;
    float _904 = fma(_870, (*spvDescriptorSet0.vp_c10)._m0[9].z, _896);
    float _906 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _908 = _898 + _906;
    float _910 = _902 * _902;
    float _912 = fma(_908, _908, _910);
    float _914 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _916 = sqrt(_912);
    float _918 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _914);
    float _920 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _918);
    float _922 = _920 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _924 = _922 + _904;
    bool _926 = _916 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _928 = _914;
    float _930 = _866;
    float _932 = _904;
    float _934 = _916;
    float _936 = _860;
    float _938 = _912;
    if (!_926)
    {
        _928 = _898;
    }
    float _940 = _928;
    float _942 = _940;
    if (!_926)
    {
        _930 = _894;
    }
    float _944 = _930;
    float _946 = _944;
    if (!_926)
    {
        _932 = _924;
    }
    float _948 = _932;
    bool _950 = !_926;
    float _952 = _948;
    if (!_950)
    {
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _958 = _916 + _956;
        float _960 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _962 = rsqrt(_912);
        float _964 = _958 * _954;
        float _966 = _964 * 0.15915493667125701904296875;
        float _968 = _966 * 6.283185482025146484375;
        float _970 = cos(_968);
        float _972 = _966 * 6.283185482025146484375;
        float _974 = sin(_972);
        float _976 = _970 + (-1.0);
        float _978 = _976 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _980 = fma(_974, _960, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _982 = fma(_924, _970, _978);
        float _984 = _962 * _980;
        float _986 = fma(_908, _984, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _988 = fma(_902, _984, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _952 = _982;
        _946 = _988;
        _942 = _986;
        _934 = _958;
    }
    float _990 = _952;
    float _992 = _946;
    float _994 = _942;
    float _996 = _934;
    float _998 = _990;
    float _1000 = _994;
    float _1002 = _992;
    float _1004 = _996;
    if (!_802)
    {
        float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1008 = _922 + _1006;
        float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1012 = _888 + _1010;
        float _1014 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1016 = -_922;
        float _1018 = _1016 + _990;
        float _1020 = _1008 * _1008;
        float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1024 = _882 + _1022;
        float _1026 = -_882;
        float _1028 = _1026 + _992;
        float _1030 = fma(_1012, _1012, _1020);
        float _1032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1034 = fma(_1024, _1024, _1030);
        float _1036 = sqrt(_1034);
        float _1038 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1040 = precise::min(_1036, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1042 = _1040 * _1032;
        float _1044 = -_888;
        float _1046 = _1044 + _994;
        float _1048 = _1038 * _1042;
        float _1050 = fma(_1046, _1048, _888);
        float _1052 = fma(_1018, _1048, _922);
        float _1054 = fma(_1028, _1048, _882);
        _998 = _1052;
        _1000 = _1050;
        _1002 = _1054;
        _936 = _1042;
    }
    float _1056 = _998;
    float _1058 = _1000;
    float _1060 = _1002;
    float _1062 = _936;
    float _1064 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1066 = _1056 + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1070 = _1058 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = _1060 + _1072;
    float _1076 = _1066 * _1066;
    float _1078 = fma(_1070, _1070, _1076);
    float _1080 = fma(_1074, _1074, _1078);
    float _1082 = rsqrt(_1080);
    float _1084 = sqrt(_1080);
    float _1086 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1088 = _1070 * _1086;
    float _1090 = _1074 * _1086;
    float _1092 = _1088 * _1088;
    float _1094 = _1090 * _1090;
    float _1096 = _1092 + _1094;
    float _1098 = sqrt(_1096);
    bool _1100 = _1098 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1104 = _1098 + _1102;
    float _1106 = _1082;
    float _1108 = _1096;
    float _1110 = _1104;
    float _1112 = _1066;
    if (_1100)
    {
        float _1114 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1106 = _1114;
    }
    float _1116 = _1106;
    if (_1100)
    {
        float _1118 = rsqrt(_1096);
        _1108 = _1118;
    }
    float _1120 = _1108;
    float _1122 = _1120;
    if (_1100)
    {
        float _1124 = _1104 * _1116;
        _1110 = _1124;
    }
    float _1126 = _1110;
    if (_1100)
    {
        float _1128 = _1126 * 0.15915493667125701904296875;
        _1004 = _1128;
    }
    float _1130 = _1004;
    float _1132 = _1074;
    if (_1100)
    {
        float _1134 = _1130 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        _1132 = _1136;
    }
    float _1138 = _1132;
    float _1140 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1142 = precise::max(0.0, _1140);
    float _1144 = _1062;
    float _1146 = _1142;
    float _1148 = _1140;
    if (_1100)
    {
        float _1150 = _1130 * 6.283185482025146484375;
        float _1152 = cos(_1150);
        _1144 = _1152;
    }
    float _1154 = _1144;
    float _1156 = -_1086;
    float _1158 = -_1142;
    float _1160 = fma(_1066, _1156, _1158);
    if (!_1100)
    {
        _1112 = _1090;
    }
    float _1162 = _1112;
    float _1164 = _1162;
    if (_1100)
    {
        float _1166 = _1160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1146 = _1166;
    }
    float _1168 = _1146;
    float _1170 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1172 = _1138;
    float _1174 = _1168;
    if (_1100)
    {
        float _1176 = fma(_1138, _1168, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1172 = _1176;
    }
    float _1178 = _1172;
    float _1180 = _1178;
    if (!_1100)
    {
        _1174 = _1088;
    }
    float _1182 = _1174;
    float _1184 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1170);
    float _1186 = _1182;
    if (_1100)
    {
        float _1188 = _1154 + (-1.0);
        _1148 = _1188;
    }
    float _1190 = _1148;
    float _1192 = _1190;
    if (_1100)
    {
        float _1194 = _1120 * _1178;
        _938 = _1194;
    }
    float _1196 = _938;
    if (!_1100)
    {
        _1180 = _1160;
    }
    float _1198 = _1180;
    float _1200 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1184);
    float _1202 = _1198;
    if (_1100)
    {
        float _1204 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1192 = _1204;
    }
    float _1206 = _1192;
    float _1208 = _1206;
    if (_1100)
    {
        float _1210 = _1088 * _1196;
        _1186 = _1210;
    }
    float _1212 = _1186;
    if (!_1100)
    {
        _1122 = _1092;
    }
    float _1214 = _1122;
    float _1216 = _1214;
    if (_1100)
    {
        float _1218 = _1090 * _1196;
        _1164 = _1218;
    }
    float _1220 = _1164;
    if (_1100)
    {
        float _1222 = fma(_1160, _1154, _1206);
        _1202 = _1222;
    }
    float _1224 = _1202;
    if (_1100)
    {
        float _1226 = _1212 * _1212;
        _1216 = _1226;
    }
    float _1228 = _1216;
    if (!_1100)
    {
        _1208 = _1094;
    }
    float _1230 = _1208;
    float _1232 = _1230;
    if (_1100)
    {
        float _1234 = _1220 * _1220;
        _1232 = _1234;
    }
    float _1236 = _1232;
    float _1238 = fma(_1224, _1224, _1228);
    float _1240 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1242 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1244 = _1238 + _1236;
    float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1248 = fma(_1084, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1246);
    float _1250 = precise::clamp(_1248, 0.0, 1.0);
    float _1252 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1254 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1256 = rsqrt(_1244);
    float _1258 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1260 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1242);
    float _1262 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1254);
    float _1264 = -_1250;
    float _1266 = _1264 + 1.0;
    float _1268 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1258);
    float _1270 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1260);
    float _1272 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1262);
    float _1274 = abs(_1266);
    float _1276 = log2(_1274);
    float _1278 = _1240 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1280 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1268);
    float _1282 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1284 = -_1278;
    float _1286 = fma(_1284, _1252, 1.0);
    float _1288 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1292 = _1256 * _1212;
    float _1294 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1296 = _1256 * _1224;
    float _1298 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1290);
    float _1300 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1302 = _1256 * _1220;
    float _1304 = log2(_1286);
    float _1306 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1298);
    float _1308 = -_1300;
    float _1310 = fma(_1296, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1308);
    float _1312 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1314 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1306);
    float _1316 = -_1302;
    float _1318 = fma(_1316, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1310);
    float _1320 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1322 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1324 = 1.0 / _1314;
    float _1326 = fma(_1318, -0.5, 0.5);
    float _1328 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1320);
    float _1330 = fma(_1318, 0.5, 0.5);
    float _1332 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1322);
    float _1334 = _1296 + 1.0;
    float _1336 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1328);
    float _1338 = fma(_1330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1340 = exp2(_1312);
    float _1342 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1332);
    float _1344 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1336);
    float _1346 = fma(_1330, _1338, -0.212114393711090087890625);
    float _1348 = _1304 * 0.693147182464599609375;
    float _1350 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1342);
    float _1352 = fma(_1330, _1346, 1.570728778839111328125);
    float _1354 = sqrt(_1326);
    float _1356 = _1344 * _1324;
    float _1358 = _1350 * _1324;
    float _1360 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1362 = fma(_1356, 0.5, 0.5);
    float _1364 = fma(_1358, -0.5, 0.5);
    float _1366 = -_1296;
    float _1368 = fma(_1340, _1334, _1366);
    float3 _3593 = float3(_1362, _1364, _1360);
    float _1370 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3593, float3(0.0), isnan(_3593)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3593, float3(0.0), isnan(_3593)), level(0.0)).x;
    float _1372 = _1354 * 0.636619746685028076171875;
    float _1374 = fma(_1368, 0.5, 0.5);
    float _1376 = -_1352;
    float _1378 = fma(_1372, _1376, 1.0);
    float3 _3614 = float3(_1362, _1364, _1360);
    float4 _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3614, float3(0.0), isnan(_3614)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3614, float3(0.0), isnan(_3614)), level(0.0)).xyzw;
    float _1383 = _1381.x;
    float _1385 = _1381.y;
    float _1387 = _1381.z;
    float _1389 = _1381.w;
    float2 _3631 = float2(_1378, _1374);
    float3 _1393 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3631, float2(0.0), isnan(_3631)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3631, float2(0.0), isnan(_3631)), level(0.0)).xyz;
    float _1395 = _1393.x;
    float _1397 = _1393.y;
    float _1399 = _1393.z;
    float _1401 = in.m_57.x;
    float _1403 = in.m_57.y;
    float _1405 = in.m_57.z;
    bool _1407 = _718 != 0.0;
    bool _1409 = isnan(_718);
    bool _1411 = _1407 || _1409;
    bool _1413 = isnan(0.0);
    bool _1415 = _1411 || _1413;
    float _1417 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1419 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_59.x = _1058;
    out.m_59.y = _1056;
    out.m_59.z = _1060;
    bool _1421 = _716 == 0.0;
    bool _1423 = !_1415;
    bool _1425 = _1421 && _1423;
    float _1427 = exp2(_1417);
    bool _1429 = _720 == 0.0;
    bool _1431 = _1429 && _1425;
    float _1433 = _1403;
    float _1435 = _1401;
    float _1437 = _1405;
    if (!_1431)
    {
        float _1439 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1403);
        _1433 = _1439;
    }
    float _1441 = _1433;
    if (!_1431)
    {
        float _1443 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1401);
        _1435 = _1443;
    }
    float _1445 = _1435;
    if (!_1431)
    {
        float _1447 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1405);
        _1437 = _1447;
    }
    float _1449 = _1437;
    float _1451 = _824 * _1441;
    float _1453 = -_1441;
    float _1455 = _818 * _1453;
    float _1457 = _820 * _1441;
    float _1459 = fma(_836, _1445, _1451);
    float _1461 = fma(_828, _1445, _1455);
    float _1463 = fma(_842, _1445, _1457);
    float _1465 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1419);
    float _1467 = fma(_846, _1449, _1459);
    float _1469 = fma(_830, _1449, _1461);
    float _1471 = fma(_838, _1449, _1463);
    float _1473 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1475 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1477 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1479 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1473);
    float _1481 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1475);
    float _1483 = fma(_1469, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1477);
    float _1485 = fma(_1240, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1465);
    float _1487 = fma(_1471, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1479);
    float _1489 = fma(_1471, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1481);
    float _1491 = fma(_1471, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1483);
    float _1493 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1485);
    float _1495 = -_1427;
    float _1497 = _1495 + 1.0;
    float _1499 = _1493 + _1314;
    float _1501 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1511 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1513 = _1499 * 0.5;
    float _1515 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1519 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1521 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1523 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1527 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1529 = _1509 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1531 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _1519;
    out.m_61.y = _1521;
    out.m_61.z = _1523;
    out.m_61.w = _1517;
    out.m_63.x = _1527;
    out.m_63.y = _1529;
    out.m_63.z = _1531;
    out.m_63.w = _1525;
    out.m_65.x = _1487;
    out.m_65.y = _1489;
    out.m_65.z = _1491;
    out.gl_Position.x = _1344;
    out.gl_Position.y = _1350;
    out.gl_Position.z = _1493;
    out.gl_Position.w = _1314;
    out.m_67.z = _1513;
    out.m_67.w = _1314;
    float _1533 = -_1515;
    float _1535 = _1533 + 1.0;
    float _1537 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1537;
    float _1539 = _1515 * _1370;
    float _1541 = _1389 * _1539;
    float _1543 = _1389 * _1535;
    float _1545 = _1399 * _1539;
    float _1547 = fma(_1395, _1541, _1383);
    float _1549 = fma(_1397, _1541, _1385);
    float _1551 = fma(_1389, _1545, _1387);
    out.m_69.x = _1547;
    out.m_69.y = _1549;
    out.m_69.z = _1551;
    out.m_69.w = _1543;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

