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
    texture2d<float> vp_t_tcb_1C [[id(7)]];
    sampler vp_t_tcb_1CSmplr [[id(8)]];
    sampler vp_t_tcb_32Smplr_w [[id(9)]];
    sampler vp_t_tcb_1CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_75 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_79 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_40 [[attribute(2)]];
    float4 m_45 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _292 = false;
    bool _178 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_40.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_43.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1631 = as_type<float>(_114);
        out.gl_Position.z = _1631;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_45.w;
    float _120 = in.m_47.w;
    bool _122 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_118);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_118;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.w = _120;
    float _136 = _134;
    if (_130)
    {
        float _138 = float(_98);
        _108 = _138;
    }
    float _140 = _108;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    float _148 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_43.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _116 = as_type<int>(_152);
    }
    int _154 = _116;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1705 = as_type<float>(_154);
        out.gl_Position.z = _1705;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _156 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _158 = !_156;
    float _176;
    if (!_158)
    {
        float _160 = in.m_47.x;
        float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _166 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _168 = _166 * _162;
        float _170 = floor(_168);
        float _172 = -_170;
        float _174 = _168 + _172;
        _176 = _174;
        _178 = true;
    }
    else
    {
        float _180 = float(_98);
        float _182 = 1.0 / _180;
        float _184 = _134 * _182;
        _176 = _184;
    }
    _178 = false;
    float _186 = _176;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _190 = _186 + _188;
    bool _192 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _194 = isnan(_186);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _200 = _196 || _198;
    float _202 = float(_200);
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    bool _208 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _210 = 1.0 / _206;
    float _212 = -_202;
    float _214 = _212 + 1.0;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _216;
    float _220 = _190 * _210;
    bool _222 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _224 = isnan(_186);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    float _238 = fma(_218, _220, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _240;
    float _244 = _232 * _214;
    float _246 = fma(_236, _220, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _248 = fma(_242, _220, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _250 = -_232;
    float _252 = _250 + 1.0;
    float _254 = _238 * _244;
    float _256 = _246 * _244;
    float _258 = _248 * _244;
    float _260 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].z, _254);
    float _262 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].x, _256);
    float _264 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].y, _258);
    float _266 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].x, _262);
    float _268 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].y, _264);
    float _270 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].z, _260);
    bool _272 = !_208;
    float _290;
    if (!_272)
    {
        float _274 = in.m_47.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_98);
        float _296 = 1.0 / _294;
        float _298 = _134 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = in.m_47.z;
    float _304 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _306 = log2(_304);
    float _308 = in.m_47.x;
    float _310 = in.m_47.y;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _314 = _312 != 0;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _318 = _316 != 0;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _322 = _320 != 0;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _326 = 1.0 + _324;
    bool _328 = !_314;
    int _330 = _328 ? 0 : 1;
    bool _332 = !_318;
    int _334 = _332 ? 0 : 1;
    float _336 = 1.0 / _326;
    float _338 = _306 * _134;
    int _340 = abs(_330);
    int _342 = abs(_334);
    float _344 = _302 * 2.0;
    float _346 = exp2(_338);
    float _348 = float(_340);
    float _350 = _308 * 2.0;
    float _352 = _310 * 2.0;
    float _354 = floor(_344);
    float _356 = floor(_350);
    float _358 = -_346;
    float _360 = _358 + 1.0;
    bool _362 = _354 > 0.0;
    float _364 = floor(_352);
    bool _366 = _354 >= 0.0;
    bool _368 = isnan(_354);
    bool _370 = _366 || _368;
    bool _372 = isnan(0.0);
    bool _374 = _370 || _372;
    float _376 = _302 + _310;
    int _378 = _374 ? 0 : 1;
    float _380 = _376 + (-1.0);
    bool _382 = _356 > 0.0;
    bool _384 = _356 >= 0.0;
    bool _386 = isnan(_356);
    bool _388 = _384 || _386;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _396 = ~_378;
    int _398 = _396 + 1;
    int _400 = _398 + 1;
    float _402 = _308 + _310;
    int _404 = _392 ? 0 : 1;
    float _406 = _310 + (-0.5);
    int _408 = _400;
    if (!_362)
    {
        int _410 = ~_378;
        int _412 = _410 + 1;
        _408 = _412;
    }
    int _414 = _408;
    float _416 = _402 + (-1.0);
    int _418 = ~_404;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    bool _424 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _432 = _428 || _430;
    float _434 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _436 = _422;
    if (!_382)
    {
        int _438 = ~_404;
        int _440 = _438 + 1;
        _436 = _440;
    }
    int _442 = _436;
    float _444 = in.m_51.x;
    float _446 = in.m_51.y;
    float _448 = in.m_51.z;
    bool _450 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _452 = isnan(1.0);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _458 = _454 || _456;
    float _460 = float(_414);
    float _462 = _432 ? _360 : 0.0;
    bool _464 = _364 > 0.0;
    float _466 = _348 * _460;
    float _468 = float(_342);
    float _470 = float(_442);
    float _472 = _466 * (-2.0);
    bool _474 = _364 >= 0.0;
    bool _476 = isnan(_364);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    if (_458)
    {
        float _484 = _462 * _336;
        _136 = _484;
    }
    float _486 = _136;
    bool _488 = !_322;
    int _490 = _488 ? 0 : 1;
    float _492 = _468 * _470;
    int _494 = _482 ? 0 : 1;
    float _496 = _308 + (-0.5);
    int _498 = abs(_490);
    float _500 = fma(_434, _472, _434);
    float _502 = _302 + _308;
    float _504 = fma(_472, _444, _444);
    int _506 = ~_494;
    int _508 = _506 + 1;
    int _510 = _508 + 1;
    float _512 = _502 + (-1.0);
    int _514 = _510;
    if (!_464)
    {
        int _516 = ~_494;
        int _518 = _516 + 1;
        _514 = _518;
    }
    int _520 = _514;
    float _522 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[196].x, _504);
    float _524 = _492 * (-2.0);
    float _526 = fma(_500, _486, _522);
    float _528 = fma(_524, _446, _446);
    float _530 = float(_498);
    float _532 = fma(_394, _524, _394);
    float _534 = float(_520);
    float _536 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[196].y, _528);
    float _538 = _526 * 0.15915493667125701904296875;
    float _540 = _530 * _534;
    float _542 = fma(_532, _486, _536);
    float _544 = in.m_53.x;
    float _546 = in.m_53.y;
    float _548 = in.m_53.z;
    float _550 = _540 * (-2.0);
    float _552 = _542 * 0.15915493667125701904296875;
    float _554 = _302 + (-0.5);
    float _556 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _558 = fma(_550, _448, _448);
    float _560 = in.m_55.x;
    float _562 = in.m_55.y;
    float _564 = in.m_55.z;
    float _566 = _538 * 6.283185482025146484375;
    float _568 = sin(_566);
    float _570 = fma(_556, _550, _556);
    float _572 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[196].z, _558);
    float _574 = fma(_570, _486, _572);
    float _576 = _538 * 6.283185482025146484375;
    float _578 = cos(_576);
    float _580 = _574 * 0.15915493667125701904296875;
    bool _582 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _584 = isnan(0.5);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _590 = _586 || _588;
    float _592 = in.m_40.x;
    float _594 = in.m_40.y;
    float _596 = in.m_40.z;
    float _598 = _552 * 6.283185482025146484375;
    float _600 = sin(_598);
    float _602 = _268 * _546;
    float _604 = _266 * _544;
    float _606 = _270 * _548;
    float _608 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _560);
    float _612 = _552 * 6.283185482025146484375;
    float _614 = cos(_612);
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _562);
    float _618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _564);
    float _620 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _622 = _616 * _608;
    float _624 = _618 * _620;
    float _626 = _580 * 6.283185482025146484375;
    float _628 = cos(_626);
    float _630 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _632 = _568 * _600;
    float _634 = _594 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _636 = _610 * _630;
    float _638 = _578 * _600;
    float _640 = _580 * 6.283185482025146484375;
    float _642 = sin(_640);
    float _644 = _568 * _614;
    float _646 = _578 * _614;
    float _648 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[6].x, _634);
    float _650 = _578 * _628;
    float _652 = _614 * _628;
    float _654 = _568 * _628;
    float _656 = _600 * _628;
    float _658 = _654 * _622;
    float _660 = -_638;
    float _662 = fma(_642, _644, _660);
    float _664 = -_644;
    float _666 = fma(_642, _638, _664);
    float _668 = fma(_642, _646, _632);
    float _670 = _650 * _622;
    float _672 = fma(_642, _632, _646);
    float _674 = -_622;
    float _676 = _642 * _674;
    float _678 = fma(_662, _636, _658);
    float _680 = fma(_668, _636, _670);
    float _682 = _594 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _684 = fma(_652, _636, _676);
    float _686 = fma(_672, _624, _678);
    float _688 = fma(_666, _624, _680);
    float _690 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[4].x, _682);
    float _692 = fma(_656, _624, _684);
    float _694 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[6].z, _648);
    float _696 = _688 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _698 = _688 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _700 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[4].z, _690);
    float _702 = _694 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _704 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[10].x, _696);
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[8].x, _698);
    float _708 = _700 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _710 = _594 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _712 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[10].z, _704);
    float _714 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[8].z, _706);
    float _716 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[5].x, _710);
    float _718 = _702 + _712;
    float _720 = _708 + _714;
    float _722 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[5].z, _716);
    float _724 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _726 = _718 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _730 = _720 + _728;
    float _732 = _726 * _726;
    float _734 = fma(_730, _730, _732);
    float _736 = _688 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _738 = sqrt(_734);
    float _740 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[9].x, _736);
    float _742 = _722 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _744 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[9].z, _740);
    float _746 = _742 + _744;
    bool _748 = _738 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _750 = _592;
    float _752 = _596;
    float _754 = _722;
    if (!_748)
    {
        _750 = _720;
    }
    float _756 = _750;
    float _758 = _756;
    if (!_748)
    {
        _752 = _718;
    }
    float _760 = _752;
    float _762 = _760;
    if (!_748)
    {
        _754 = _746;
    }
    float _764 = _754;
    bool _766 = !_748;
    float _768 = _764;
    if (!_766)
    {
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _772 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _774 = _738 + _772;
        float _776 = _746 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _778 = rsqrt(_734);
        float _780 = _774 * _770;
        float _782 = _780 * 0.15915493667125701904296875;
        float _784 = _782 * 6.283185482025146484375;
        float _786 = cos(_784);
        float _788 = _782 * 6.283185482025146484375;
        float _790 = sin(_788);
        float _792 = _786 + (-1.0);
        float _794 = _792 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _796 = fma(_790, _776, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _798 = fma(_746, _786, _794);
        float _800 = _778 * _796;
        float _802 = fma(_730, _800, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _804 = fma(_726, _800, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _758 = _802;
        _768 = _798;
        _762 = _804;
    }
    float _806 = _758;
    float _808 = _768;
    float _810 = _762;
    float _812 = _808;
    float _814 = _806;
    float _816 = _810;
    if (!_590)
    {
        float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _820 = _742 + _818;
        float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _824 = _708 + _822;
        float _826 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _828 = -_708;
        float _830 = _828 + _806;
        float _832 = _820 * _820;
        float _834 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _836 = _702 + _834;
        float _838 = -_742;
        float _840 = _838 + _808;
        float _842 = fma(_824, _824, _832);
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _846 = fma(_836, _836, _842);
        float _848 = sqrt(_846);
        float _850 = _826 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _852 = precise::min(_848, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _854 = _852 * _844;
        float _856 = _850 * _854;
        float _858 = -_702;
        float _860 = _858 + _810;
        float _862 = fma(_830, _856, _708);
        float _864 = fma(_840, _856, _742);
        float _866 = fma(_860, _856, _702);
        _812 = _864;
        _814 = _862;
        _816 = _866;
    }
    float _868 = _812;
    float _870 = _814;
    float _872 = _816;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _876 = _868 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _880 = _870 + _878;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _884 = _872 + _882;
    float _886 = _876 * _876;
    float _888 = fma(_880, _880, _886);
    float _890 = fma(_884, _884, _888);
    float _892 = rsqrt(_890);
    float _894 = sqrt(_890);
    float _896 = _892 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _898 = _880 * _896;
    float _900 = _884 * _896;
    float _902 = _898 * _898;
    float _904 = _900 * _900;
    float _906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _908 = _902 + _904;
    float _910 = precise::max(0.0, _906);
    float _912 = sqrt(_908);
    float _914 = -_896;
    float _916 = -_910;
    float _918 = fma(_876, _914, _916);
    bool _920 = _912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _922 = _896;
    float _924 = _876;
    float _926 = _910;
    float _928 = _902;
    float _930 = _904;
    if (!_920)
    {
        _922 = _898;
    }
    float _932 = _922;
    float _934 = _932;
    if (!_920)
    {
        _924 = _918;
    }
    float _936 = _924;
    float _938 = _936;
    if (!_920)
    {
        _926 = _900;
    }
    float _940 = _926;
    bool _942 = !_920;
    float _944 = _940;
    if (!_942)
    {
        float _946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _950 = _912 + _948;
        float _952 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = rsqrt(_908);
        float _956 = _950 * _946;
        float _958 = _956 * 0.15915493667125701904296875;
        float _960 = _958 * 6.283185482025146484375;
        float _962 = sin(_960);
        float _964 = _958 * 6.283185482025146484375;
        float _966 = cos(_964);
        float _968 = fma(_962, _952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _970 = _954 * _968;
        float _972 = _966 + (-1.0);
        float _974 = _898 * _970;
        float _976 = _972 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _978 = _900 * _970;
        float _980 = fma(_918, _966, _976);
        float _982 = _974 * _974;
        float _984 = _978 * _978;
        _938 = _980;
        _928 = _982;
        _930 = _984;
        _934 = _974;
        _944 = _978;
    }
    float _986 = _938;
    float _988 = _928;
    float _990 = _930;
    float _992 = _934;
    float _994 = _944;
    float _996 = fma(_986, _986, _988);
    float _998 = _868 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1000 = _996 + _990;
    float _1002 = _868 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1006 = fma(_894, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1004);
    float _1008 = precise::clamp(_1006, 0.0, 1.0);
    float _1010 = _868 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1012 = rsqrt(_1000);
    float _1014 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1002);
    float _1016 = -_1008;
    float _1018 = _1016 + 1.0;
    float _1020 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1010);
    float _1022 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1024 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1014);
    float _1026 = _868 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1028 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1020);
    float _1030 = abs(_1018);
    float _1032 = log2(_1030);
    float _1034 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1036 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1026);
    float _1038 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1040 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[3].x, _998);
    float _1042 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1044 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1036);
    float _1046 = _1012 * _992;
    float _1048 = -_1042;
    float _1050 = fma(_1022, _1048, 1.0);
    float _1052 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1054 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1056 = _1012 * _986;
    float _1058 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1060 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1040);
    float _1062 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1054);
    float _1064 = _1012 * _994;
    float _1066 = -_1058;
    float _1068 = fma(_1056, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1066);
    float _1070 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1072 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1062);
    float _1074 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1076 = -_1064;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1068);
    float _1080 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1072);
    float _1084 = log2(_1050);
    float _1086 = fma(_1078, -0.5, 0.5);
    float _1088 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1090 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1080);
    float _1092 = fma(_1078, 0.5, 0.5);
    float _1094 = _1056 + 1.0;
    float _1096 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1088);
    float _1098 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1090);
    float _1100 = 1.0 / _1082;
    float _1102 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1096);
    float _1104 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1098);
    float _1106 = fma(_1092, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1108 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1102);
    float _1110 = sqrt(_1086);
    float _1112 = _1084 * 0.693147182464599609375;
    float _1114 = fma(_1092, _1106, -0.212114393711090087890625);
    float _1116 = fma(_1092, _1114, 1.570728778839111328125);
    float _1118 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1120 = exp2(_1074);
    float _1122 = _1104 * _1100;
    float _1124 = _1108 * _1100;
    float _1126 = fma(_1122, 0.5, 0.5);
    float _1128 = fma(_1124, -0.5, 0.5);
    float _1130 = _1110 * 0.636619746685028076171875;
    float _1132 = -_1056;
    float _1134 = fma(_1120, _1094, _1132);
    float _1136 = -_1116;
    float _1138 = fma(_1130, _1136, 1.0);
    float3 _3230 = float3(_1126, _1128, _1118);
    float _1140 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3230, float3(0.0), isnan(_3230)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3230, float3(0.0), isnan(_3230)), level(0.0)).x;
    float _1142 = fma(_1134, 0.5, 0.5);
    float2 _3243 = float2(_1138, _1142);
    float3 _1146 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3243, float2(0.0), isnan(_3243)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3243, float2(0.0), isnan(_3243)), level(0.0)).xyz;
    float _1148 = _1146.x;
    float _1150 = _1146.y;
    float _1152 = _1146.z;
    float _1154 = in.m_57.y;
    float _1156 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1160 = _1158 != 0;
    float _1162 = in.m_57.x;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1166 = _1164 != 0;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1168;
    bool _1172 = _302 > 0.5;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1176 = _300 + _1174;
    out.m_43.x = 1.0;
    bool _1178 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1180 = isnan(_300);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = 1.0 / _1170;
    bool _1192 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1194 = isnan(_300);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_59.x = _870;
    out.m_59.y = _868;
    out.m_59.z = _872;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1206;
    float _1210 = _1124;
    if (_1160)
    {
        float _1212 = in.m_47.y;
        _1210 = _1212;
    }
    float _1214 = _1210;
    float _1216 = -_1188;
    float _1218 = _1216 + 1.0;
    float _1220 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1222 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1204);
    out.m_61.w = _1082;
    float _1224 = -_1154;
    float _1226 = _1224 + 1.0;
    float _1228 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1222);
    float _1230 = _1176 * _1190;
    float _1232 = exp2(_1156);
    float _1234 = fma(_1208, _1230, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1236 = _1154;
    if (_1166)
    {
        float _1238 = _1172 ? _1226 : _1154;
        _1236 = _1238;
    }
    float _1240 = _1236;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1242;
    float _1246 = in.m_63.x;
    float _1248 = in.m_63.y;
    float _1250 = in.m_63.z;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1252;
    bool _1256 = _562 != 0.0;
    bool _1258 = isnan(_562);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan(0.0);
    bool _1264 = _1260 || _1262;
    float _1266 = fma(_1244, _1230, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1268 = 0.0;
    float _1270 = _1162;
    if (_1160)
    {
        _1268 = _1162;
    }
    float _1272 = _1268;
    float _1274 = fma(_1254, _1230, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1276 = _560 == 0.0;
    bool _1278 = !_1264;
    bool _1280 = _1276 && _1278;
    float _1282 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1284 = _1214 > 0.5;
    bool _1286 = _1284 && _1160;
    float _1288 = _1202 * _1218;
    float _1290 = -_1202;
    float _1292 = _1290 + 1.0;
    bool _1294 = _564 == 0.0;
    bool _1296 = _1294 && _1280;
    float _1298 = -_1232;
    float _1300 = _1298 + 1.0;
    float _1302 = _1266 * _1288;
    float _1304 = _1274 * _1288;
    float _1306 = _1234 * _1288;
    float _1308 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1310 = in.m_65.x;
    float _1312 = in.m_65.y;
    float _1314 = in.m_65.z;
    float _1316 = in.m_65.w;
    float _1318 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1302);
    float _1320 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1306);
    float _1322 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1304);
    float _1324 = _1272;
    float _1326 = _1306;
    float _1328 = _1292;
    float _1330 = _1302;
    if (_1286)
    {
        float _1332 = -_1272;
        float _1334 = _1332 + 1.0;
        _1324 = _1334;
    }
    float _1336 = _1324;
    float _1338 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1228);
    float _1340 = 0.0;
    if (_1296)
    {
        _1340 = _1246;
    }
    float _1342 = _1340;
    float _1344 = _1342;
    if (_1160)
    {
        _1270 = _1336;
    }
    float _1346 = _1270;
    out.gl_Position.x = _1104;
    out.gl_Position.y = _1108;
    out.gl_Position.z = _1338;
    out.gl_Position.w = _1082;
    float _1348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1350 = 0.0;
    if (_1296)
    {
        _1350 = _1248;
    }
    float _1352 = _1350;
    float _1354 = 0.0;
    float _1356 = _1352;
    if (_1296)
    {
        _1354 = _1250;
    }
    float _1358 = _1354;
    float _1360 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1362 = _1358;
    if (_1296)
    {
        _1326 = _1342;
    }
    float _1364 = _1326;
    float _1366 = _1364;
    if (!_1296)
    {
        _1344 = _1246;
    }
    float _1368 = _1344;
    float _1370 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1322);
    if (_1296)
    {
        _1328 = _1352;
    }
    float _1372 = _1328;
    float _1374 = _1372;
    if (_1296)
    {
        _1330 = _1358;
    }
    float _1376 = _1330;
    float _1378 = _1376;
    if (!_1296)
    {
        float _1380 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1368);
        _1366 = _1380;
    }
    float _1382 = _1366;
    if (!_1296)
    {
        _1356 = _1248;
    }
    float _1384 = _1356;
    float _1386 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1320);
    if (!_1296)
    {
        _1362 = _1250;
    }
    float _1388 = _1362;
    float _1390 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1318);
    float _1392 = _1314 * _1368;
    float _1394 = _1360 * _1220;
    if (!_1296)
    {
        float _1396 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1384);
        _1374 = _1396;
    }
    float _1398 = _1374;
    float _1400 = _1312 * _1388;
    if (!_1296)
    {
        float _1402 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1388);
        _1378 = _1402;
    }
    float _1404 = _1378;
    float _1406 = -_1392;
    float _1408 = fma(_1310, _1388, _1406);
    float _1410 = _1282 * _1348;
    float _1412 = _1310 * _1384;
    float _1414 = -_1400;
    float _1416 = fma(_1314, _1384, _1414);
    float _1418 = _1408 * _1316;
    float _1420 = -_1398;
    float _1422 = _642 * _1420;
    float _1424 = -_1412;
    float _1426 = fma(_1312, _1368, _1424);
    out.m_67.x = _1394;
    out.m_67.y = _1410;
    float _1428 = -_1312;
    float _1430 = _642 * _1428;
    float _1432 = -_1418;
    float _1434 = _642 * _1432;
    float _1436 = _1416 * _1316;
    float _1438 = _1426 * _1316;
    float _1440 = _654 * _1398;
    float _1442 = _650 * _1418;
    float _1444 = fma(_652, _1382, _1422);
    float _1446 = fma(_652, _1436, _1434);
    float _1448 = fma(_662, _1382, _1440);
    float _1450 = _650 * _1312;
    float _1452 = _650 * _1398;
    float _1454 = _654 * _1312;
    float _1456 = _654 * _1418;
    float _1458 = fma(_668, _1310, _1450);
    float _1460 = fma(_668, _1382, _1452);
    float _1462 = fma(_662, _1310, _1454);
    float _1464 = fma(_668, _1436, _1442);
    float _1466 = fma(_662, _1436, _1456);
    float _1468 = fma(_652, _1310, _1430);
    float _1470 = fma(_666, _1314, _1458);
    float _1472 = fma(_656, _1404, _1444);
    float _1474 = fma(_666, _1404, _1460);
    float _1476 = fma(_672, _1404, _1448);
    float _1478 = fma(_672, _1314, _1462);
    float _1480 = fma(_656, _1438, _1446);
    float _1482 = fma(_666, _1438, _1464);
    float _1484 = fma(_672, _1438, _1466);
    float _1486 = fma(_656, _1314, _1468);
    float _1488 = _1470 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1490 = _1470 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1492 = _1470 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1494 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1496 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1498 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1500 = fma(_1486, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1488);
    float _1502 = fma(_1486, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1490);
    float _1504 = _1482 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1506 = _1482 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1508 = _1482 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1510 = fma(_1486, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1492);
    float _1512 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1504);
    float _1514 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1506);
    float _1516 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1508);
    float _1518 = fma(_1472, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1494);
    float _1520 = fma(_1478, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1502);
    float _1522 = fma(_1484, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1512);
    float _1524 = fma(_1478, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1500);
    float _1526 = fma(_1478, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1510);
    float _1528 = fma(_1484, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1514);
    float _1530 = fma(_1484, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1516);
    float _1532 = _1370 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1534 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1518);
    float _1536 = fma(_1472, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1496);
    float _1538 = fma(_1472, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1498);
    float _1540 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1542 = _1386 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1544 = _1104 + _1082;
    float _1546 = _1082 * 0.5;
    out.m_69.x = _1524;
    out.m_69.y = _1520;
    out.m_69.z = _1526;
    float _1548 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1550 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1552 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1554 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1536);
    float _1556 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1538);
    float _1558 = _1544 * 0.5;
    float _1560 = fma(_1108, -0.5, _1546);
    out.m_71.x = _1548;
    out.m_71.y = _1550;
    out.m_71.z = _1552;
    float _1562 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1564 = -_1308;
    float _1566 = _1564 + 1.0;
    out.m_73.x = _1534;
    out.m_73.y = _1554;
    out.m_73.z = _1556;
    out.m_75.x = _1528;
    out.m_75.y = _1522;
    out.m_75.z = _1530;
    out.m_61.x = _1558;
    out.m_61.y = _1560;
    out.m_77.w = _1562;
    float _1568 = _1308 * _1140;
    float _1570 = _1148 * _1568;
    float _1572 = _1150 * _1568;
    float _1574 = _1152 * _1568;
    out.m_79.x = _1570;
    out.m_79.y = _1572;
    out.m_79.z = _1574;
    out.m_79.w = _1566;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _292 = false;
    bool _178 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_40.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_43.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1631 = as_type<float>(_114);
        out.gl_Position.z = _1631;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_45.w;
    float _120 = in.m_47.w;
    bool _122 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_118);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_118;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.w = _120;
    float _136 = _134;
    if (_130)
    {
        float _138 = float(_98);
        _108 = _138;
    }
    float _140 = _108;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    float _148 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_43.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _116 = as_type<int>(_152);
    }
    int _154 = _116;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1705 = as_type<float>(_154);
        out.gl_Position.z = _1705;
    }
    if (_146)
    {
        return out;
    }
    bool _156 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _158 = !_156;
    float _176;
    if (!_158)
    {
        float _160 = in.m_47.x;
        float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _166 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _168 = _166 * _162;
        float _170 = floor(_168);
        float _172 = -_170;
        float _174 = _168 + _172;
        _176 = _174;
        _178 = true;
    }
    else
    {
        float _180 = float(_98);
        float _182 = 1.0 / _180;
        float _184 = _134 * _182;
        _176 = _184;
    }
    _178 = false;
    float _186 = _176;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _190 = _186 + _188;
    bool _192 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _194 = isnan(_186);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _200 = _196 || _198;
    float _202 = float(_200);
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    bool _208 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _210 = 1.0 / _206;
    float _212 = -_202;
    float _214 = _212 + 1.0;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _216;
    float _220 = _190 * _210;
    bool _222 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _224 = isnan(_186);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    float _238 = fma(_218, _220, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _240;
    float _244 = _232 * _214;
    float _246 = fma(_236, _220, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _248 = fma(_242, _220, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _250 = -_232;
    float _252 = _250 + 1.0;
    float _254 = _238 * _244;
    float _256 = _246 * _244;
    float _258 = _248 * _244;
    float _260 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].z, _254);
    float _262 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].x, _256);
    float _264 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].y, _258);
    float _266 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].x, _262);
    float _268 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].y, _264);
    float _270 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].z, _260);
    bool _272 = !_208;
    float _290;
    if (!_272)
    {
        float _274 = in.m_47.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_98);
        float _296 = 1.0 / _294;
        float _298 = _134 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = in.m_47.z;
    float _304 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _306 = log2(_304);
    float _308 = in.m_47.x;
    float _310 = in.m_47.y;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _314 = _312 != 0;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _318 = _316 != 0;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _322 = _320 != 0;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _326 = 1.0 + _324;
    bool _328 = !_314;
    int _330 = _328 ? 0 : 1;
    bool _332 = !_318;
    int _334 = _332 ? 0 : 1;
    float _336 = 1.0 / _326;
    float _338 = _306 * _134;
    int _340 = abs(_330);
    int _342 = abs(_334);
    float _344 = _302 * 2.0;
    float _346 = exp2(_338);
    float _348 = float(_340);
    float _350 = _308 * 2.0;
    float _352 = _310 * 2.0;
    float _354 = floor(_344);
    float _356 = floor(_350);
    float _358 = -_346;
    float _360 = _358 + 1.0;
    bool _362 = _354 > 0.0;
    float _364 = floor(_352);
    bool _366 = _354 >= 0.0;
    bool _368 = isnan(_354);
    bool _370 = _366 || _368;
    bool _372 = isnan(0.0);
    bool _374 = _370 || _372;
    float _376 = _302 + _310;
    int _378 = _374 ? 0 : 1;
    float _380 = _376 + (-1.0);
    bool _382 = _356 > 0.0;
    bool _384 = _356 >= 0.0;
    bool _386 = isnan(_356);
    bool _388 = _384 || _386;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _396 = ~_378;
    int _398 = _396 + 1;
    int _400 = _398 + 1;
    float _402 = _308 + _310;
    int _404 = _392 ? 0 : 1;
    float _406 = _310 + (-0.5);
    int _408 = _400;
    if (!_362)
    {
        int _410 = ~_378;
        int _412 = _410 + 1;
        _408 = _412;
    }
    int _414 = _408;
    float _416 = _402 + (-1.0);
    int _418 = ~_404;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    bool _424 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _432 = _428 || _430;
    float _434 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _436 = _422;
    if (!_382)
    {
        int _438 = ~_404;
        int _440 = _438 + 1;
        _436 = _440;
    }
    int _442 = _436;
    float _444 = in.m_51.x;
    float _446 = in.m_51.y;
    float _448 = in.m_51.z;
    bool _450 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _452 = isnan(1.0);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _458 = _454 || _456;
    float _460 = float(_414);
    float _462 = _432 ? _360 : 0.0;
    bool _464 = _364 > 0.0;
    float _466 = _348 * _460;
    float _468 = float(_342);
    float _470 = float(_442);
    float _472 = _466 * (-2.0);
    bool _474 = _364 >= 0.0;
    bool _476 = isnan(_364);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    if (_458)
    {
        float _484 = _462 * _336;
        _136 = _484;
    }
    float _486 = _136;
    bool _488 = !_322;
    int _490 = _488 ? 0 : 1;
    float _492 = _468 * _470;
    int _494 = _482 ? 0 : 1;
    float _496 = _308 + (-0.5);
    int _498 = abs(_490);
    float _500 = fma(_434, _472, _434);
    float _502 = _302 + _308;
    float _504 = fma(_472, _444, _444);
    int _506 = ~_494;
    int _508 = _506 + 1;
    int _510 = _508 + 1;
    float _512 = _502 + (-1.0);
    int _514 = _510;
    if (!_464)
    {
        int _516 = ~_494;
        int _518 = _516 + 1;
        _514 = _518;
    }
    int _520 = _514;
    float _522 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[196].x, _504);
    float _524 = _492 * (-2.0);
    float _526 = fma(_500, _486, _522);
    float _528 = fma(_524, _446, _446);
    float _530 = float(_498);
    float _532 = fma(_394, _524, _394);
    float _534 = float(_520);
    float _536 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[196].y, _528);
    float _538 = _526 * 0.15915493667125701904296875;
    float _540 = _530 * _534;
    float _542 = fma(_532, _486, _536);
    float _544 = in.m_53.x;
    float _546 = in.m_53.y;
    float _548 = in.m_53.z;
    float _550 = _540 * (-2.0);
    float _552 = _542 * 0.15915493667125701904296875;
    float _554 = _302 + (-0.5);
    float _556 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _558 = fma(_550, _448, _448);
    float _560 = in.m_55.x;
    float _562 = in.m_55.y;
    float _564 = in.m_55.z;
    float _566 = _538 * 6.283185482025146484375;
    float _568 = sin(_566);
    float _570 = fma(_556, _550, _556);
    float _572 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[196].z, _558);
    float _574 = fma(_570, _486, _572);
    float _576 = _538 * 6.283185482025146484375;
    float _578 = cos(_576);
    float _580 = _574 * 0.15915493667125701904296875;
    bool _582 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _584 = isnan(0.5);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _590 = _586 || _588;
    float _592 = in.m_40.x;
    float _594 = in.m_40.y;
    float _596 = in.m_40.z;
    float _598 = _552 * 6.283185482025146484375;
    float _600 = sin(_598);
    float _602 = _268 * _546;
    float _604 = _266 * _544;
    float _606 = _270 * _548;
    float _608 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _560);
    float _612 = _552 * 6.283185482025146484375;
    float _614 = cos(_612);
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _562);
    float _618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _564);
    float _620 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _622 = _616 * _608;
    float _624 = _618 * _620;
    float _626 = _580 * 6.283185482025146484375;
    float _628 = cos(_626);
    float _630 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _632 = _568 * _600;
    float _634 = _594 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _636 = _610 * _630;
    float _638 = _578 * _600;
    float _640 = _580 * 6.283185482025146484375;
    float _642 = sin(_640);
    float _644 = _568 * _614;
    float _646 = _578 * _614;
    float _648 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[6].x, _634);
    float _650 = _578 * _628;
    float _652 = _614 * _628;
    float _654 = _568 * _628;
    float _656 = _600 * _628;
    float _658 = _654 * _622;
    float _660 = -_638;
    float _662 = fma(_642, _644, _660);
    float _664 = -_644;
    float _666 = fma(_642, _638, _664);
    float _668 = fma(_642, _646, _632);
    float _670 = _650 * _622;
    float _672 = fma(_642, _632, _646);
    float _674 = -_622;
    float _676 = _642 * _674;
    float _678 = fma(_662, _636, _658);
    float _680 = fma(_668, _636, _670);
    float _682 = _594 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _684 = fma(_652, _636, _676);
    float _686 = fma(_672, _624, _678);
    float _688 = fma(_666, _624, _680);
    float _690 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[4].x, _682);
    float _692 = fma(_656, _624, _684);
    float _694 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[6].z, _648);
    float _696 = _688 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _698 = _688 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _700 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[4].z, _690);
    float _702 = _694 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _704 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[10].x, _696);
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[8].x, _698);
    float _708 = _700 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _710 = _594 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _712 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[10].z, _704);
    float _714 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[8].z, _706);
    float _716 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[5].x, _710);
    float _718 = _702 + _712;
    float _720 = _708 + _714;
    float _722 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[5].z, _716);
    float _724 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _726 = _718 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _730 = _720 + _728;
    float _732 = _726 * _726;
    float _734 = fma(_730, _730, _732);
    float _736 = _688 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _738 = sqrt(_734);
    float _740 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[9].x, _736);
    float _742 = _722 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _744 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[9].z, _740);
    float _746 = _742 + _744;
    bool _748 = _738 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _750 = _592;
    float _752 = _596;
    float _754 = _722;
    if (!_748)
    {
        _750 = _720;
    }
    float _756 = _750;
    float _758 = _756;
    if (!_748)
    {
        _752 = _718;
    }
    float _760 = _752;
    float _762 = _760;
    if (!_748)
    {
        _754 = _746;
    }
    float _764 = _754;
    bool _766 = !_748;
    float _768 = _764;
    if (!_766)
    {
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _772 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _774 = _738 + _772;
        float _776 = _746 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _778 = rsqrt(_734);
        float _780 = _774 * _770;
        float _782 = _780 * 0.15915493667125701904296875;
        float _784 = _782 * 6.283185482025146484375;
        float _786 = cos(_784);
        float _788 = _782 * 6.283185482025146484375;
        float _790 = sin(_788);
        float _792 = _786 + (-1.0);
        float _794 = _792 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _796 = fma(_790, _776, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _798 = fma(_746, _786, _794);
        float _800 = _778 * _796;
        float _802 = fma(_730, _800, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _804 = fma(_726, _800, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _758 = _802;
        _768 = _798;
        _762 = _804;
    }
    float _806 = _758;
    float _808 = _768;
    float _810 = _762;
    float _812 = _808;
    float _814 = _806;
    float _816 = _810;
    if (!_590)
    {
        float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _820 = _742 + _818;
        float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _824 = _708 + _822;
        float _826 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _828 = -_708;
        float _830 = _828 + _806;
        float _832 = _820 * _820;
        float _834 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _836 = _702 + _834;
        float _838 = -_742;
        float _840 = _838 + _808;
        float _842 = fma(_824, _824, _832);
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _846 = fma(_836, _836, _842);
        float _848 = sqrt(_846);
        float _850 = _826 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _852 = precise::min(_848, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _854 = _852 * _844;
        float _856 = _850 * _854;
        float _858 = -_702;
        float _860 = _858 + _810;
        float _862 = fma(_830, _856, _708);
        float _864 = fma(_840, _856, _742);
        float _866 = fma(_860, _856, _702);
        _812 = _864;
        _814 = _862;
        _816 = _866;
    }
    float _868 = _812;
    float _870 = _814;
    float _872 = _816;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _876 = _868 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _880 = _870 + _878;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _884 = _872 + _882;
    float _886 = _876 * _876;
    float _888 = fma(_880, _880, _886);
    float _890 = fma(_884, _884, _888);
    float _892 = rsqrt(_890);
    float _894 = sqrt(_890);
    float _896 = _892 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _898 = _880 * _896;
    float _900 = _884 * _896;
    float _902 = _898 * _898;
    float _904 = _900 * _900;
    float _906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _908 = _902 + _904;
    float _910 = precise::max(0.0, _906);
    float _912 = sqrt(_908);
    float _914 = -_896;
    float _916 = -_910;
    float _918 = fma(_876, _914, _916);
    bool _920 = _912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _922 = _896;
    float _924 = _876;
    float _926 = _910;
    float _928 = _902;
    float _930 = _904;
    if (!_920)
    {
        _922 = _898;
    }
    float _932 = _922;
    float _934 = _932;
    if (!_920)
    {
        _924 = _918;
    }
    float _936 = _924;
    float _938 = _936;
    if (!_920)
    {
        _926 = _900;
    }
    float _940 = _926;
    bool _942 = !_920;
    float _944 = _940;
    if (!_942)
    {
        float _946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _950 = _912 + _948;
        float _952 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = rsqrt(_908);
        float _956 = _950 * _946;
        float _958 = _956 * 0.15915493667125701904296875;
        float _960 = _958 * 6.283185482025146484375;
        float _962 = sin(_960);
        float _964 = _958 * 6.283185482025146484375;
        float _966 = cos(_964);
        float _968 = fma(_962, _952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _970 = _954 * _968;
        float _972 = _966 + (-1.0);
        float _974 = _898 * _970;
        float _976 = _972 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _978 = _900 * _970;
        float _980 = fma(_918, _966, _976);
        float _982 = _974 * _974;
        float _984 = _978 * _978;
        _938 = _980;
        _928 = _982;
        _930 = _984;
        _934 = _974;
        _944 = _978;
    }
    float _986 = _938;
    float _988 = _928;
    float _990 = _930;
    float _992 = _934;
    float _994 = _944;
    float _996 = fma(_986, _986, _988);
    float _998 = _868 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1000 = _996 + _990;
    float _1002 = _868 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1006 = fma(_894, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1004);
    float _1008 = precise::clamp(_1006, 0.0, 1.0);
    float _1010 = _868 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1012 = rsqrt(_1000);
    float _1014 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1002);
    float _1016 = -_1008;
    float _1018 = _1016 + 1.0;
    float _1020 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1010);
    float _1022 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1024 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1014);
    float _1026 = _868 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1028 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1020);
    float _1030 = abs(_1018);
    float _1032 = log2(_1030);
    float _1034 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1036 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1026);
    float _1038 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1040 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[3].x, _998);
    float _1042 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1044 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1036);
    float _1046 = _1012 * _992;
    float _1048 = -_1042;
    float _1050 = fma(_1022, _1048, 1.0);
    float _1052 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1054 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1056 = _1012 * _986;
    float _1058 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1060 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1040);
    float _1062 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1054);
    float _1064 = _1012 * _994;
    float _1066 = -_1058;
    float _1068 = fma(_1056, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1066);
    float _1070 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1072 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1062);
    float _1074 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1076 = -_1064;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1068);
    float _1080 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1072);
    float _1084 = log2(_1050);
    float _1086 = fma(_1078, -0.5, 0.5);
    float _1088 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1090 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1080);
    float _1092 = fma(_1078, 0.5, 0.5);
    float _1094 = _1056 + 1.0;
    float _1096 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1088);
    float _1098 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1090);
    float _1100 = 1.0 / _1082;
    float _1102 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1096);
    float _1104 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1098);
    float _1106 = fma(_1092, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1108 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1102);
    float _1110 = sqrt(_1086);
    float _1112 = _1084 * 0.693147182464599609375;
    float _1114 = fma(_1092, _1106, -0.212114393711090087890625);
    float _1116 = fma(_1092, _1114, 1.570728778839111328125);
    float _1118 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1120 = exp2(_1074);
    float _1122 = _1104 * _1100;
    float _1124 = _1108 * _1100;
    float _1126 = fma(_1122, 0.5, 0.5);
    float _1128 = fma(_1124, -0.5, 0.5);
    float _1130 = _1110 * 0.636619746685028076171875;
    float _1132 = -_1056;
    float _1134 = fma(_1120, _1094, _1132);
    float _1136 = -_1116;
    float _1138 = fma(_1130, _1136, 1.0);
    float3 _3230 = float3(_1126, _1128, _1118);
    float _1140 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3230, float3(0.0), isnan(_3230)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3230, float3(0.0), isnan(_3230)), level(0.0)).x;
    float _1142 = fma(_1134, 0.5, 0.5);
    float2 _3243 = float2(_1138, _1142);
    float3 _1146 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3243, float2(0.0), isnan(_3243)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3243, float2(0.0), isnan(_3243)), level(0.0)).xyz;
    float _1148 = _1146.x;
    float _1150 = _1146.y;
    float _1152 = _1146.z;
    float _1154 = in.m_57.y;
    float _1156 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1160 = _1158 != 0;
    float _1162 = in.m_57.x;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1166 = _1164 != 0;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1168;
    bool _1172 = _302 > 0.5;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1176 = _300 + _1174;
    out.m_43.x = 1.0;
    bool _1178 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1180 = isnan(_300);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = 1.0 / _1170;
    bool _1192 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1194 = isnan(_300);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_59.x = _870;
    out.m_59.y = _868;
    out.m_59.z = _872;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1206;
    float _1210 = _1124;
    if (_1160)
    {
        float _1212 = in.m_47.y;
        _1210 = _1212;
    }
    float _1214 = _1210;
    float _1216 = -_1188;
    float _1218 = _1216 + 1.0;
    float _1220 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1222 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1204);
    out.m_61.w = _1082;
    float _1224 = -_1154;
    float _1226 = _1224 + 1.0;
    float _1228 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1222);
    float _1230 = _1176 * _1190;
    float _1232 = exp2(_1156);
    float _1234 = fma(_1208, _1230, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1236 = _1154;
    if (_1166)
    {
        float _1238 = _1172 ? _1226 : _1154;
        _1236 = _1238;
    }
    float _1240 = _1236;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1242;
    float _1246 = in.m_63.x;
    float _1248 = in.m_63.y;
    float _1250 = in.m_63.z;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1252;
    bool _1256 = _562 != 0.0;
    bool _1258 = isnan(_562);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan(0.0);
    bool _1264 = _1260 || _1262;
    float _1266 = fma(_1244, _1230, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1268 = 0.0;
    float _1270 = _1162;
    if (_1160)
    {
        _1268 = _1162;
    }
    float _1272 = _1268;
    float _1274 = fma(_1254, _1230, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1276 = _560 == 0.0;
    bool _1278 = !_1264;
    bool _1280 = _1276 && _1278;
    float _1282 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1284 = _1214 > 0.5;
    bool _1286 = _1284 && _1160;
    float _1288 = _1202 * _1218;
    float _1290 = -_1202;
    float _1292 = _1290 + 1.0;
    bool _1294 = _564 == 0.0;
    bool _1296 = _1294 && _1280;
    float _1298 = -_1232;
    float _1300 = _1298 + 1.0;
    float _1302 = _1266 * _1288;
    float _1304 = _1274 * _1288;
    float _1306 = _1234 * _1288;
    float _1308 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1310 = in.m_65.x;
    float _1312 = in.m_65.y;
    float _1314 = in.m_65.z;
    float _1316 = in.m_65.w;
    float _1318 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1302);
    float _1320 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1306);
    float _1322 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1304);
    float _1324 = _1272;
    float _1326 = _1306;
    float _1328 = _1292;
    float _1330 = _1302;
    if (_1286)
    {
        float _1332 = -_1272;
        float _1334 = _1332 + 1.0;
        _1324 = _1334;
    }
    float _1336 = _1324;
    float _1338 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1228);
    float _1340 = 0.0;
    if (_1296)
    {
        _1340 = _1246;
    }
    float _1342 = _1340;
    float _1344 = _1342;
    if (_1160)
    {
        _1270 = _1336;
    }
    float _1346 = _1270;
    out.gl_Position.x = _1104;
    out.gl_Position.y = _1108;
    out.gl_Position.z = _1338;
    out.gl_Position.w = _1082;
    float _1348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1350 = 0.0;
    if (_1296)
    {
        _1350 = _1248;
    }
    float _1352 = _1350;
    float _1354 = 0.0;
    float _1356 = _1352;
    if (_1296)
    {
        _1354 = _1250;
    }
    float _1358 = _1354;
    float _1360 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1362 = _1358;
    if (_1296)
    {
        _1326 = _1342;
    }
    float _1364 = _1326;
    float _1366 = _1364;
    if (!_1296)
    {
        _1344 = _1246;
    }
    float _1368 = _1344;
    float _1370 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1322);
    if (_1296)
    {
        _1328 = _1352;
    }
    float _1372 = _1328;
    float _1374 = _1372;
    if (_1296)
    {
        _1330 = _1358;
    }
    float _1376 = _1330;
    float _1378 = _1376;
    if (!_1296)
    {
        float _1380 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1368);
        _1366 = _1380;
    }
    float _1382 = _1366;
    if (!_1296)
    {
        _1356 = _1248;
    }
    float _1384 = _1356;
    float _1386 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1320);
    if (!_1296)
    {
        _1362 = _1250;
    }
    float _1388 = _1362;
    float _1390 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1318);
    float _1392 = _1314 * _1368;
    float _1394 = _1360 * _1220;
    if (!_1296)
    {
        float _1396 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1384);
        _1374 = _1396;
    }
    float _1398 = _1374;
    float _1400 = _1312 * _1388;
    if (!_1296)
    {
        float _1402 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1388);
        _1378 = _1402;
    }
    float _1404 = _1378;
    float _1406 = -_1392;
    float _1408 = fma(_1310, _1388, _1406);
    float _1410 = _1282 * _1348;
    float _1412 = _1310 * _1384;
    float _1414 = -_1400;
    float _1416 = fma(_1314, _1384, _1414);
    float _1418 = _1408 * _1316;
    float _1420 = -_1398;
    float _1422 = _642 * _1420;
    float _1424 = -_1412;
    float _1426 = fma(_1312, _1368, _1424);
    out.m_67.x = _1394;
    out.m_67.y = _1410;
    float _1428 = -_1312;
    float _1430 = _642 * _1428;
    float _1432 = -_1418;
    float _1434 = _642 * _1432;
    float _1436 = _1416 * _1316;
    float _1438 = _1426 * _1316;
    float _1440 = _654 * _1398;
    float _1442 = _650 * _1418;
    float _1444 = fma(_652, _1382, _1422);
    float _1446 = fma(_652, _1436, _1434);
    float _1448 = fma(_662, _1382, _1440);
    float _1450 = _650 * _1312;
    float _1452 = _650 * _1398;
    float _1454 = _654 * _1312;
    float _1456 = _654 * _1418;
    float _1458 = fma(_668, _1310, _1450);
    float _1460 = fma(_668, _1382, _1452);
    float _1462 = fma(_662, _1310, _1454);
    float _1464 = fma(_668, _1436, _1442);
    float _1466 = fma(_662, _1436, _1456);
    float _1468 = fma(_652, _1310, _1430);
    float _1470 = fma(_666, _1314, _1458);
    float _1472 = fma(_656, _1404, _1444);
    float _1474 = fma(_666, _1404, _1460);
    float _1476 = fma(_672, _1404, _1448);
    float _1478 = fma(_672, _1314, _1462);
    float _1480 = fma(_656, _1438, _1446);
    float _1482 = fma(_666, _1438, _1464);
    float _1484 = fma(_672, _1438, _1466);
    float _1486 = fma(_656, _1314, _1468);
    float _1488 = _1470 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1490 = _1470 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1492 = _1470 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1494 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1496 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1498 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1500 = fma(_1486, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1488);
    float _1502 = fma(_1486, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1490);
    float _1504 = _1482 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1506 = _1482 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1508 = _1482 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1510 = fma(_1486, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1492);
    float _1512 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1504);
    float _1514 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1506);
    float _1516 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1508);
    float _1518 = fma(_1472, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1494);
    float _1520 = fma(_1478, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1502);
    float _1522 = fma(_1484, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1512);
    float _1524 = fma(_1478, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1500);
    float _1526 = fma(_1478, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1510);
    float _1528 = fma(_1484, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1514);
    float _1530 = fma(_1484, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1516);
    float _1532 = _1370 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1534 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1518);
    float _1536 = fma(_1472, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1496);
    float _1538 = fma(_1472, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1498);
    float _1540 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1542 = _1386 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1544 = _1104 + _1082;
    float _1546 = _1082 * 0.5;
    out.m_69.x = _1524;
    out.m_69.y = _1520;
    out.m_69.z = _1526;
    float _1548 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1550 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1552 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1554 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1536);
    float _1556 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1538);
    float _1558 = _1544 * 0.5;
    float _1560 = fma(_1108, -0.5, _1546);
    out.m_71.x = _1548;
    out.m_71.y = _1550;
    out.m_71.z = _1552;
    float _1562 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1564 = -_1308;
    float _1566 = _1564 + 1.0;
    out.m_73.x = _1534;
    out.m_73.y = _1554;
    out.m_73.z = _1556;
    out.m_75.x = _1528;
    out.m_75.y = _1522;
    out.m_75.z = _1530;
    out.m_61.x = _1558;
    out.m_61.y = _1560;
    out.m_77.w = _1562;
    float _1568 = _1308 * _1140;
    float _1570 = _1148 * _1568;
    float _1572 = _1150 * _1568;
    float _1574 = _1152 * _1568;
    out.m_79.x = _1570;
    out.m_79.y = _1572;
    out.m_79.z = _1574;
    out.m_79.w = _1566;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _292 = false;
    bool _178 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_40.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_43.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1631 = as_type<float>(_114);
        out.gl_Position.z = _1631;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_45.w;
    float _120 = in.m_47.w;
    bool _122 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_118);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_118;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.w = _120;
    float _136 = _134;
    if (_130)
    {
        float _138 = float(_98);
        _108 = _138;
    }
    float _140 = _108;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    float _148 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_43.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _116 = as_type<int>(_152);
    }
    int _154 = _116;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1705 = as_type<float>(_154);
        out.gl_Position.z = _1705;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _156 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _158 = !_156;
    float _176;
    if (!_158)
    {
        float _160 = in.m_47.x;
        float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _164 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _166 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _168 = _166 * _162;
        float _170 = floor(_168);
        float _172 = -_170;
        float _174 = _168 + _172;
        _176 = _174;
        _178 = true;
    }
    else
    {
        float _180 = float(_98);
        float _182 = 1.0 / _180;
        float _184 = _134 * _182;
        _176 = _184;
    }
    _178 = false;
    float _186 = _176;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _190 = _186 + _188;
    bool _192 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _194 = isnan(_186);
    bool _196 = _192 || _194;
    bool _198 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _200 = _196 || _198;
    float _202 = float(_200);
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    bool _208 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _210 = 1.0 / _206;
    float _212 = -_202;
    float _214 = _212 + 1.0;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _216;
    float _220 = _190 * _210;
    bool _222 = _186 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _224 = isnan(_186);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    float _238 = fma(_218, _220, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _240;
    float _244 = _232 * _214;
    float _246 = fma(_236, _220, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _248 = fma(_242, _220, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _250 = -_232;
    float _252 = _250 + 1.0;
    float _254 = _238 * _244;
    float _256 = _246 * _244;
    float _258 = _248 * _244;
    float _260 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].z, _254);
    float _262 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].x, _256);
    float _264 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[143].y, _258);
    float _266 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].x, _262);
    float _268 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].y, _264);
    float _270 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[144].z, _260);
    bool _272 = !_208;
    float _290;
    if (!_272)
    {
        float _274 = in.m_47.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_98);
        float _296 = 1.0 / _294;
        float _298 = _134 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = in.m_47.z;
    float _304 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _306 = log2(_304);
    float _308 = in.m_47.x;
    float _310 = in.m_47.y;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _314 = _312 != 0;
    int _316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _318 = _316 != 0;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _322 = _320 != 0;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _326 = 1.0 + _324;
    bool _328 = !_314;
    int _330 = _328 ? 0 : 1;
    bool _332 = !_318;
    int _334 = _332 ? 0 : 1;
    float _336 = 1.0 / _326;
    float _338 = _306 * _134;
    int _340 = abs(_330);
    int _342 = abs(_334);
    float _344 = _302 * 2.0;
    float _346 = exp2(_338);
    float _348 = float(_340);
    float _350 = _308 * 2.0;
    float _352 = _310 * 2.0;
    float _354 = floor(_344);
    float _356 = floor(_350);
    float _358 = -_346;
    float _360 = _358 + 1.0;
    bool _362 = _354 > 0.0;
    float _364 = floor(_352);
    bool _366 = _354 >= 0.0;
    bool _368 = isnan(_354);
    bool _370 = _366 || _368;
    bool _372 = isnan(0.0);
    bool _374 = _370 || _372;
    float _376 = _302 + _310;
    int _378 = _374 ? 0 : 1;
    float _380 = _376 + (-1.0);
    bool _382 = _356 > 0.0;
    bool _384 = _356 >= 0.0;
    bool _386 = isnan(_356);
    bool _388 = _384 || _386;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _396 = ~_378;
    int _398 = _396 + 1;
    int _400 = _398 + 1;
    float _402 = _308 + _310;
    int _404 = _392 ? 0 : 1;
    float _406 = _310 + (-0.5);
    int _408 = _400;
    if (!_362)
    {
        int _410 = ~_378;
        int _412 = _410 + 1;
        _408 = _412;
    }
    int _414 = _408;
    float _416 = _402 + (-1.0);
    int _418 = ~_404;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    bool _424 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _432 = _428 || _430;
    float _434 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _436 = _422;
    if (!_382)
    {
        int _438 = ~_404;
        int _440 = _438 + 1;
        _436 = _440;
    }
    int _442 = _436;
    float _444 = in.m_51.x;
    float _446 = in.m_51.y;
    float _448 = in.m_51.z;
    bool _450 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _452 = isnan(1.0);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _458 = _454 || _456;
    float _460 = float(_414);
    float _462 = _432 ? _360 : 0.0;
    bool _464 = _364 > 0.0;
    float _466 = _348 * _460;
    float _468 = float(_342);
    float _470 = float(_442);
    float _472 = _466 * (-2.0);
    bool _474 = _364 >= 0.0;
    bool _476 = isnan(_364);
    bool _478 = _474 || _476;
    bool _480 = isnan(0.0);
    bool _482 = _478 || _480;
    if (_458)
    {
        float _484 = _462 * _336;
        _136 = _484;
    }
    float _486 = _136;
    bool _488 = !_322;
    int _490 = _488 ? 0 : 1;
    float _492 = _468 * _470;
    int _494 = _482 ? 0 : 1;
    float _496 = _308 + (-0.5);
    int _498 = abs(_490);
    float _500 = fma(_434, _472, _434);
    float _502 = _302 + _308;
    float _504 = fma(_472, _444, _444);
    int _506 = ~_494;
    int _508 = _506 + 1;
    int _510 = _508 + 1;
    float _512 = _502 + (-1.0);
    int _514 = _510;
    if (!_464)
    {
        int _516 = ~_494;
        int _518 = _516 + 1;
        _514 = _518;
    }
    int _520 = _514;
    float _522 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[196].x, _504);
    float _524 = _492 * (-2.0);
    float _526 = fma(_500, _486, _522);
    float _528 = fma(_524, _446, _446);
    float _530 = float(_498);
    float _532 = fma(_394, _524, _394);
    float _534 = float(_520);
    float _536 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[196].y, _528);
    float _538 = _526 * 0.15915493667125701904296875;
    float _540 = _530 * _534;
    float _542 = fma(_532, _486, _536);
    float _544 = in.m_53.x;
    float _546 = in.m_53.y;
    float _548 = in.m_53.z;
    float _550 = _540 * (-2.0);
    float _552 = _542 * 0.15915493667125701904296875;
    float _554 = _302 + (-0.5);
    float _556 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _558 = fma(_550, _448, _448);
    float _560 = in.m_55.x;
    float _562 = in.m_55.y;
    float _564 = in.m_55.z;
    float _566 = _538 * 6.283185482025146484375;
    float _568 = sin(_566);
    float _570 = fma(_556, _550, _556);
    float _572 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[196].z, _558);
    float _574 = fma(_570, _486, _572);
    float _576 = _538 * 6.283185482025146484375;
    float _578 = cos(_576);
    float _580 = _574 * 0.15915493667125701904296875;
    bool _582 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _584 = isnan(0.5);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _590 = _586 || _588;
    float _592 = in.m_40.x;
    float _594 = in.m_40.y;
    float _596 = in.m_40.z;
    float _598 = _552 * 6.283185482025146484375;
    float _600 = sin(_598);
    float _602 = _268 * _546;
    float _604 = _266 * _544;
    float _606 = _270 * _548;
    float _608 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _560);
    float _612 = _552 * 6.283185482025146484375;
    float _614 = cos(_612);
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _562);
    float _618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _564);
    float _620 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _622 = _616 * _608;
    float _624 = _618 * _620;
    float _626 = _580 * 6.283185482025146484375;
    float _628 = cos(_626);
    float _630 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _632 = _568 * _600;
    float _634 = _594 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _636 = _610 * _630;
    float _638 = _578 * _600;
    float _640 = _580 * 6.283185482025146484375;
    float _642 = sin(_640);
    float _644 = _568 * _614;
    float _646 = _578 * _614;
    float _648 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[6].x, _634);
    float _650 = _578 * _628;
    float _652 = _614 * _628;
    float _654 = _568 * _628;
    float _656 = _600 * _628;
    float _658 = _654 * _622;
    float _660 = -_638;
    float _662 = fma(_642, _644, _660);
    float _664 = -_644;
    float _666 = fma(_642, _638, _664);
    float _668 = fma(_642, _646, _632);
    float _670 = _650 * _622;
    float _672 = fma(_642, _632, _646);
    float _674 = -_622;
    float _676 = _642 * _674;
    float _678 = fma(_662, _636, _658);
    float _680 = fma(_668, _636, _670);
    float _682 = _594 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _684 = fma(_652, _636, _676);
    float _686 = fma(_672, _624, _678);
    float _688 = fma(_666, _624, _680);
    float _690 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[4].x, _682);
    float _692 = fma(_656, _624, _684);
    float _694 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[6].z, _648);
    float _696 = _688 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _698 = _688 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _700 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[4].z, _690);
    float _702 = _694 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _704 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[10].x, _696);
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[8].x, _698);
    float _708 = _700 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _710 = _594 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _712 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[10].z, _704);
    float _714 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[8].z, _706);
    float _716 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[5].x, _710);
    float _718 = _702 + _712;
    float _720 = _708 + _714;
    float _722 = fma(_596, (*spvDescriptorSet0.vp_c10)._m0[5].z, _716);
    float _724 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _726 = _718 + _724;
    float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _730 = _720 + _728;
    float _732 = _726 * _726;
    float _734 = fma(_730, _730, _732);
    float _736 = _688 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _738 = sqrt(_734);
    float _740 = fma(_692, (*spvDescriptorSet0.vp_c10)._m0[9].x, _736);
    float _742 = _722 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _744 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[9].z, _740);
    float _746 = _742 + _744;
    bool _748 = _738 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _750 = _592;
    float _752 = _596;
    float _754 = _722;
    if (!_748)
    {
        _750 = _720;
    }
    float _756 = _750;
    float _758 = _756;
    if (!_748)
    {
        _752 = _718;
    }
    float _760 = _752;
    float _762 = _760;
    if (!_748)
    {
        _754 = _746;
    }
    float _764 = _754;
    bool _766 = !_748;
    float _768 = _764;
    if (!_766)
    {
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _772 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _774 = _738 + _772;
        float _776 = _746 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _778 = rsqrt(_734);
        float _780 = _774 * _770;
        float _782 = _780 * 0.15915493667125701904296875;
        float _784 = _782 * 6.283185482025146484375;
        float _786 = cos(_784);
        float _788 = _782 * 6.283185482025146484375;
        float _790 = sin(_788);
        float _792 = _786 + (-1.0);
        float _794 = _792 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _796 = fma(_790, _776, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _798 = fma(_746, _786, _794);
        float _800 = _778 * _796;
        float _802 = fma(_730, _800, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _804 = fma(_726, _800, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _758 = _802;
        _768 = _798;
        _762 = _804;
    }
    float _806 = _758;
    float _808 = _768;
    float _810 = _762;
    float _812 = _808;
    float _814 = _806;
    float _816 = _810;
    if (!_590)
    {
        float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _820 = _742 + _818;
        float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _824 = _708 + _822;
        float _826 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _828 = -_708;
        float _830 = _828 + _806;
        float _832 = _820 * _820;
        float _834 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _836 = _702 + _834;
        float _838 = -_742;
        float _840 = _838 + _808;
        float _842 = fma(_824, _824, _832);
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _846 = fma(_836, _836, _842);
        float _848 = sqrt(_846);
        float _850 = _826 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _852 = precise::min(_848, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _854 = _852 * _844;
        float _856 = _850 * _854;
        float _858 = -_702;
        float _860 = _858 + _810;
        float _862 = fma(_830, _856, _708);
        float _864 = fma(_840, _856, _742);
        float _866 = fma(_860, _856, _702);
        _812 = _864;
        _814 = _862;
        _816 = _866;
    }
    float _868 = _812;
    float _870 = _814;
    float _872 = _816;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _876 = _868 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _880 = _870 + _878;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _884 = _872 + _882;
    float _886 = _876 * _876;
    float _888 = fma(_880, _880, _886);
    float _890 = fma(_884, _884, _888);
    float _892 = rsqrt(_890);
    float _894 = sqrt(_890);
    float _896 = _892 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _898 = _880 * _896;
    float _900 = _884 * _896;
    float _902 = _898 * _898;
    float _904 = _900 * _900;
    float _906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _908 = _902 + _904;
    float _910 = precise::max(0.0, _906);
    float _912 = sqrt(_908);
    float _914 = -_896;
    float _916 = -_910;
    float _918 = fma(_876, _914, _916);
    bool _920 = _912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _922 = _896;
    float _924 = _876;
    float _926 = _910;
    float _928 = _902;
    float _930 = _904;
    if (!_920)
    {
        _922 = _898;
    }
    float _932 = _922;
    float _934 = _932;
    if (!_920)
    {
        _924 = _918;
    }
    float _936 = _924;
    float _938 = _936;
    if (!_920)
    {
        _926 = _900;
    }
    float _940 = _926;
    bool _942 = !_920;
    float _944 = _940;
    if (!_942)
    {
        float _946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _950 = _912 + _948;
        float _952 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _954 = rsqrt(_908);
        float _956 = _950 * _946;
        float _958 = _956 * 0.15915493667125701904296875;
        float _960 = _958 * 6.283185482025146484375;
        float _962 = sin(_960);
        float _964 = _958 * 6.283185482025146484375;
        float _966 = cos(_964);
        float _968 = fma(_962, _952, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _970 = _954 * _968;
        float _972 = _966 + (-1.0);
        float _974 = _898 * _970;
        float _976 = _972 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _978 = _900 * _970;
        float _980 = fma(_918, _966, _976);
        float _982 = _974 * _974;
        float _984 = _978 * _978;
        _938 = _980;
        _928 = _982;
        _930 = _984;
        _934 = _974;
        _944 = _978;
    }
    float _986 = _938;
    float _988 = _928;
    float _990 = _930;
    float _992 = _934;
    float _994 = _944;
    float _996 = fma(_986, _986, _988);
    float _998 = _868 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1000 = _996 + _990;
    float _1002 = _868 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1006 = fma(_894, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1004);
    float _1008 = precise::clamp(_1006, 0.0, 1.0);
    float _1010 = _868 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1012 = rsqrt(_1000);
    float _1014 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1002);
    float _1016 = -_1008;
    float _1018 = _1016 + 1.0;
    float _1020 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1010);
    float _1022 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1024 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1014);
    float _1026 = _868 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1028 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1020);
    float _1030 = abs(_1018);
    float _1032 = log2(_1030);
    float _1034 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1036 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1026);
    float _1038 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1040 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[3].x, _998);
    float _1042 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1044 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1036);
    float _1046 = _1012 * _992;
    float _1048 = -_1042;
    float _1050 = fma(_1022, _1048, 1.0);
    float _1052 = _1044 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1054 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1056 = _1012 * _986;
    float _1058 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1060 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1040);
    float _1062 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1054);
    float _1064 = _1012 * _994;
    float _1066 = -_1058;
    float _1068 = fma(_1056, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1066);
    float _1070 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1072 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1062);
    float _1074 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1076 = -_1064;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1068);
    float _1080 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1082 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1072);
    float _1084 = log2(_1050);
    float _1086 = fma(_1078, -0.5, 0.5);
    float _1088 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1090 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1080);
    float _1092 = fma(_1078, 0.5, 0.5);
    float _1094 = _1056 + 1.0;
    float _1096 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1088);
    float _1098 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1090);
    float _1100 = 1.0 / _1082;
    float _1102 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1096);
    float _1104 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1098);
    float _1106 = fma(_1092, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1108 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1102);
    float _1110 = sqrt(_1086);
    float _1112 = _1084 * 0.693147182464599609375;
    float _1114 = fma(_1092, _1106, -0.212114393711090087890625);
    float _1116 = fma(_1092, _1114, 1.570728778839111328125);
    float _1118 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1120 = exp2(_1074);
    float _1122 = _1104 * _1100;
    float _1124 = _1108 * _1100;
    float _1126 = fma(_1122, 0.5, 0.5);
    float _1128 = fma(_1124, -0.5, 0.5);
    float _1130 = _1110 * 0.636619746685028076171875;
    float _1132 = -_1056;
    float _1134 = fma(_1120, _1094, _1132);
    float _1136 = -_1116;
    float _1138 = fma(_1130, _1136, 1.0);
    float3 _3230 = float3(_1126, _1128, _1118);
    float _1140 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3230, float3(0.0), isnan(_3230)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3230, float3(0.0), isnan(_3230)), level(0.0)).x;
    float _1142 = fma(_1134, 0.5, 0.5);
    float2 _3243 = float2(_1138, _1142);
    float3 _1146 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3243, float2(0.0), isnan(_3243)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3243, float2(0.0), isnan(_3243)), level(0.0)).xyz;
    float _1148 = _1146.x;
    float _1150 = _1146.y;
    float _1152 = _1146.z;
    float _1154 = in.m_57.y;
    float _1156 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1160 = _1158 != 0;
    float _1162 = in.m_57.x;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1166 = _1164 != 0;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1168;
    bool _1172 = _302 > 0.5;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1176 = _300 + _1174;
    out.m_43.x = 1.0;
    bool _1178 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1180 = isnan(_300);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = 1.0 / _1170;
    bool _1192 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1194 = isnan(_300);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_59.x = _870;
    out.m_59.y = _868;
    out.m_59.z = _872;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1206;
    float _1210 = _1124;
    if (_1160)
    {
        float _1212 = in.m_47.y;
        _1210 = _1212;
    }
    float _1214 = _1210;
    float _1216 = -_1188;
    float _1218 = _1216 + 1.0;
    float _1220 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1222 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1204);
    out.m_61.w = _1082;
    float _1224 = -_1154;
    float _1226 = _1224 + 1.0;
    float _1228 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1222);
    float _1230 = _1176 * _1190;
    float _1232 = exp2(_1156);
    float _1234 = fma(_1208, _1230, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1236 = _1154;
    if (_1166)
    {
        float _1238 = _1172 ? _1226 : _1154;
        _1236 = _1238;
    }
    float _1240 = _1236;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1242;
    float _1246 = in.m_63.x;
    float _1248 = in.m_63.y;
    float _1250 = in.m_63.z;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1252;
    bool _1256 = _562 != 0.0;
    bool _1258 = isnan(_562);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan(0.0);
    bool _1264 = _1260 || _1262;
    float _1266 = fma(_1244, _1230, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1268 = 0.0;
    float _1270 = _1162;
    if (_1160)
    {
        _1268 = _1162;
    }
    float _1272 = _1268;
    float _1274 = fma(_1254, _1230, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1276 = _560 == 0.0;
    bool _1278 = !_1264;
    bool _1280 = _1276 && _1278;
    float _1282 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1284 = _1214 > 0.5;
    bool _1286 = _1284 && _1160;
    float _1288 = _1202 * _1218;
    float _1290 = -_1202;
    float _1292 = _1290 + 1.0;
    bool _1294 = _564 == 0.0;
    bool _1296 = _1294 && _1280;
    float _1298 = -_1232;
    float _1300 = _1298 + 1.0;
    float _1302 = _1266 * _1288;
    float _1304 = _1274 * _1288;
    float _1306 = _1234 * _1288;
    float _1308 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1310 = in.m_65.x;
    float _1312 = in.m_65.y;
    float _1314 = in.m_65.z;
    float _1316 = in.m_65.w;
    float _1318 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1302);
    float _1320 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1306);
    float _1322 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1304);
    float _1324 = _1272;
    float _1326 = _1306;
    float _1328 = _1292;
    float _1330 = _1302;
    if (_1286)
    {
        float _1332 = -_1272;
        float _1334 = _1332 + 1.0;
        _1324 = _1334;
    }
    float _1336 = _1324;
    float _1338 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1228);
    float _1340 = 0.0;
    if (_1296)
    {
        _1340 = _1246;
    }
    float _1342 = _1340;
    float _1344 = _1342;
    if (_1160)
    {
        _1270 = _1336;
    }
    float _1346 = _1270;
    out.gl_Position.x = _1104;
    out.gl_Position.y = _1108;
    out.gl_Position.z = _1338;
    out.gl_Position.w = _1082;
    float _1348 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1350 = 0.0;
    if (_1296)
    {
        _1350 = _1248;
    }
    float _1352 = _1350;
    float _1354 = 0.0;
    float _1356 = _1352;
    if (_1296)
    {
        _1354 = _1250;
    }
    float _1358 = _1354;
    float _1360 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1362 = _1358;
    if (_1296)
    {
        _1326 = _1342;
    }
    float _1364 = _1326;
    float _1366 = _1364;
    if (!_1296)
    {
        _1344 = _1246;
    }
    float _1368 = _1344;
    float _1370 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1322);
    if (_1296)
    {
        _1328 = _1352;
    }
    float _1372 = _1328;
    float _1374 = _1372;
    if (_1296)
    {
        _1330 = _1358;
    }
    float _1376 = _1330;
    float _1378 = _1376;
    if (!_1296)
    {
        float _1380 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1368);
        _1366 = _1380;
    }
    float _1382 = _1366;
    if (!_1296)
    {
        _1356 = _1248;
    }
    float _1384 = _1356;
    float _1386 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1320);
    if (!_1296)
    {
        _1362 = _1250;
    }
    float _1388 = _1362;
    float _1390 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1318);
    float _1392 = _1314 * _1368;
    float _1394 = _1360 * _1220;
    if (!_1296)
    {
        float _1396 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1384);
        _1374 = _1396;
    }
    float _1398 = _1374;
    float _1400 = _1312 * _1388;
    if (!_1296)
    {
        float _1402 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1388);
        _1378 = _1402;
    }
    float _1404 = _1378;
    float _1406 = -_1392;
    float _1408 = fma(_1310, _1388, _1406);
    float _1410 = _1282 * _1348;
    float _1412 = _1310 * _1384;
    float _1414 = -_1400;
    float _1416 = fma(_1314, _1384, _1414);
    float _1418 = _1408 * _1316;
    float _1420 = -_1398;
    float _1422 = _642 * _1420;
    float _1424 = -_1412;
    float _1426 = fma(_1312, _1368, _1424);
    out.m_67.x = _1394;
    out.m_67.y = _1410;
    float _1428 = -_1312;
    float _1430 = _642 * _1428;
    float _1432 = -_1418;
    float _1434 = _642 * _1432;
    float _1436 = _1416 * _1316;
    float _1438 = _1426 * _1316;
    float _1440 = _654 * _1398;
    float _1442 = _650 * _1418;
    float _1444 = fma(_652, _1382, _1422);
    float _1446 = fma(_652, _1436, _1434);
    float _1448 = fma(_662, _1382, _1440);
    float _1450 = _650 * _1312;
    float _1452 = _650 * _1398;
    float _1454 = _654 * _1312;
    float _1456 = _654 * _1418;
    float _1458 = fma(_668, _1310, _1450);
    float _1460 = fma(_668, _1382, _1452);
    float _1462 = fma(_662, _1310, _1454);
    float _1464 = fma(_668, _1436, _1442);
    float _1466 = fma(_662, _1436, _1456);
    float _1468 = fma(_652, _1310, _1430);
    float _1470 = fma(_666, _1314, _1458);
    float _1472 = fma(_656, _1404, _1444);
    float _1474 = fma(_666, _1404, _1460);
    float _1476 = fma(_672, _1404, _1448);
    float _1478 = fma(_672, _1314, _1462);
    float _1480 = fma(_656, _1438, _1446);
    float _1482 = fma(_666, _1438, _1464);
    float _1484 = fma(_672, _1438, _1466);
    float _1486 = fma(_656, _1314, _1468);
    float _1488 = _1470 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1490 = _1470 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1492 = _1470 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1494 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1496 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1498 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1500 = fma(_1486, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1488);
    float _1502 = fma(_1486, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1490);
    float _1504 = _1482 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1506 = _1482 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1508 = _1482 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1510 = fma(_1486, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1492);
    float _1512 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1504);
    float _1514 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1506);
    float _1516 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1508);
    float _1518 = fma(_1472, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1494);
    float _1520 = fma(_1478, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1502);
    float _1522 = fma(_1484, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1512);
    float _1524 = fma(_1478, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1500);
    float _1526 = fma(_1478, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1510);
    float _1528 = fma(_1484, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1514);
    float _1530 = fma(_1484, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1516);
    float _1532 = _1370 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1534 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1518);
    float _1536 = fma(_1472, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1496);
    float _1538 = fma(_1472, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1498);
    float _1540 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1542 = _1386 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1544 = _1104 + _1082;
    float _1546 = _1082 * 0.5;
    out.m_69.x = _1524;
    out.m_69.y = _1520;
    out.m_69.z = _1526;
    float _1548 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1550 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1552 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1554 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1536);
    float _1556 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1538);
    float _1558 = _1544 * 0.5;
    float _1560 = fma(_1108, -0.5, _1546);
    out.m_71.x = _1548;
    out.m_71.y = _1550;
    out.m_71.z = _1552;
    float _1562 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1564 = -_1308;
    float _1566 = _1564 + 1.0;
    out.m_73.x = _1534;
    out.m_73.y = _1554;
    out.m_73.z = _1556;
    out.m_75.x = _1528;
    out.m_75.y = _1522;
    out.m_75.z = _1530;
    out.m_61.x = _1558;
    out.m_61.y = _1560;
    out.m_77.w = _1562;
    float _1568 = _1308 * _1140;
    float _1570 = _1148 * _1568;
    float _1572 = _1150 * _1568;
    float _1574 = _1152 * _1568;
    out.m_79.x = _1570;
    out.m_79.y = _1572;
    out.m_79.z = _1574;
    out.m_79.w = _1566;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

