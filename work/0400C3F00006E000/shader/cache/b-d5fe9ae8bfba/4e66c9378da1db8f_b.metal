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
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_81 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_79 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_63 [[attribute(10)]];
    float4 m_55 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2071 = false;
    bool _310 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2371 = as_type<float>(_116);
        out.gl_Position.z = _2371;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_49.w;
    float _122 = float(_100);
    float _124 = -_120;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_120);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    bool _138 = _126 >= _122;
    bool _140 = !_136;
    bool _142 = _138 || _140;
    float _144 = _126;
    if (_142)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _108;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _118 = as_type<int>(_148);
    }
    int _150 = _118;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2435 = as_type<float>(_150);
        out.gl_Position.z = _2435;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_51.x;
    float _154 = in.m_51.y;
    float _156 = in.m_51.z;
    float _158 = 1.0 / _122;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _162 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _164 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _166 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _168 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _162);
    float _170 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _164);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _166);
    float _174 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _168);
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _170);
    float _178 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _172);
    float _180 = _126 * _158;
    bool _182 = !_160;
    float _200;
    if (!_182)
    {
        float _184 = in.m_53.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        _200 = _180;
    }
    _202 = false;
    float _204 = _200;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _204 + _206;
    bool _210 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = 1.0 / _224;
    float _230 = -_220;
    float _232 = _230 + 1.0;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _234;
    float _238 = _208 * _228;
    bool _240 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _242 = isnan(_204);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _252;
    float _256 = fma(_236, _238, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _258;
    float _262 = _250 * _232;
    float _264 = fma(_254, _238, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = fma(_260, _238, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = -_250;
    float _270 = _268 + 1.0;
    float _272 = _256 * _262;
    float _274 = _264 * _262;
    float _276 = _266 * _262;
    float _278 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].x, _274);
    float _280 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].y, _276);
    float _282 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].z, _272);
    float _284 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].x, _278);
    float _286 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].y, _280);
    float _288 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].z, _282);
    bool _290 = !_226;
    float _308;
    if (!_290)
    {
        float _292 = in.m_53.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        _308 = _180;
    }
    _310 = false;
    float _312 = _308;
    float _314 = in.m_53.z;
    float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _318 = log2(_316);
    float _320 = in.m_55.x;
    float _322 = in.m_55.y;
    float _324 = in.m_55.z;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _332 = _330 != 0;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _336 = _334 != 0;
    float _338 = in.m_44.x;
    float _340 = in.m_44.y;
    float _342 = in.m_44.z;
    float _344 = abs(_180);
    float _346 = log2(_344);
    float _348 = in.m_57.x;
    float _350 = in.m_57.y;
    float _352 = in.m_57.z;
    float _354 = in.m_53.x;
    float _356 = _318 * _126;
    float _358 = in.m_53.y;
    float _360 = _314 * 2.0;
    float _362 = exp2(_356);
    float _364 = fma(_320, 2.0, -1.0);
    float _366 = fma(_322, 2.0, -1.0);
    float _368 = fma(_324, 2.0, -1.0);
    float _370 = _340 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _372 = floor(_360);
    float _374 = _340 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = _340 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _378 = _288 * _352;
    float _380 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[5].x, _370);
    float _382 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _384 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[6].x, _376);
    float _386 = _354 * 2.0;
    float _388 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].z, _380);
    float _390 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].z, _382);
    float _392 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].z, _384);
    float _394 = _358 * 2.0;
    float _396 = floor(_386);
    float _398 = _358 + _314;
    bool _400 = !_332;
    int _402 = _400 ? 0 : 1;
    float _404 = -_362;
    float _406 = _404 + 1.0;
    bool _408 = _372 > 0.0;
    float _410 = _398 + (-1.0);
    bool _412 = _372 >= 0.0;
    bool _414 = isnan(_372);
    bool _416 = _412 || _414;
    bool _418 = isnan(0.0);
    bool _420 = _416 || _418;
    float _422 = _390 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _424 = floor(_394);
    float _426 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _428 = _420 ? 0 : 1;
    float _430 = _354 + _358;
    float _432 = _286 * _350;
    int _434 = ~_428;
    int _436 = _434 + 1;
    int _438 = _436 + 1;
    float _440 = _430 + (-1.0);
    bool _442 = _396 > 0.0;
    float _444 = _354 + _314;
    int _446 = _438;
    if (!_408)
    {
        int _448 = ~_428;
        int _450 = _448 + 1;
        _446 = _450;
    }
    int _452 = _446;
    float _454 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _456 = _396 >= 0.0;
    bool _458 = isnan(_396);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = _444 + (-1.0);
    bool _468 = !_328;
    int _470 = _468 ? 0 : 1;
    float _472 = _314 + (-0.5);
    bool _474 = _424 > 0.0;
    float _476 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _478 = _424 >= 0.0;
    bool _480 = isnan(_424);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _490 = in.m_59.x;
    float _492 = in.m_59.y;
    float _494 = in.m_59.z;
    int _496 = abs(_470);
    float _498 = float(_452);
    float _500 = float(_496);
    int _502 = _464 ? 0 : 1;
    float _504 = _500 * _498;
    int _506 = _486 ? 0 : 1;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _510 = 1.0 + _508;
    int _512 = ~_502;
    int _514 = _512 + 1;
    int _516 = _514 + 1;
    float _518 = _504 * (-2.0);
    int _520 = _516;
    if (!_442)
    {
        int _522 = ~_502;
        int _524 = _522 + 1;
        _520 = _524;
    }
    int _526 = _520;
    float _528 = 1.0 / _510;
    int _530 = abs(_402);
    float _532 = fma(_454, _518, _454);
    int _534 = ~_506;
    int _536 = _534 + 1;
    int _538 = _536 + 1;
    float _540 = _388 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _542 = _538;
    if (!_474)
    {
        int _544 = ~_506;
        int _546 = _544 + 1;
        _542 = _546;
    }
    int _548 = _542;
    bool _550 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(1.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    float _560 = fma(_518, _490, _490);
    float _562 = _354 + (-0.5);
    bool _564 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _566 = isnan(0.0);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _572 = _568 || _570;
    float _574 = -_540;
    float _576 = _574 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _578 = _346 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _580 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[196].x, _560);
    float _582 = _392 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _584 = float(_526);
    float _586 = _576 * _576;
    float _588 = float(_530);
    float _590 = -_422;
    float _592 = _590 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _594 = _572 ? _406 : 0.0;
    float _596 = exp2(_578);
    bool _598 = !_336;
    int _600 = _598 ? 0 : 1;
    float _602 = _588 * _584;
    if (_558)
    {
        float _604 = _594 * _528;
        _144 = _604;
    }
    float _606 = _144;
    float _608 = -_582;
    float _610 = _608 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _612 = fma(_592, _592, _586);
    int _614 = abs(_600);
    float _616 = _602 * (-2.0);
    float _618 = fma(_532, _606, _580);
    float _620 = in.m_61.x;
    float _622 = in.m_61.y;
    float _624 = in.m_61.z;
    float _626 = fma(_610, _610, _612);
    float _628 = fma(_426, _616, _426);
    float _630 = fma(_616, _492, _492);
    float _632 = _358 + (-0.5);
    float _634 = _618 * 0.15915493667125701904296875;
    float _636 = float(_614);
    float _638 = rsqrt(_626);
    float _640 = float(_548);
    float _642 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[196].y, _630);
    float _644 = _636 * _640;
    float _646 = fma(_628, _606, _642);
    float _648 = _634 * 6.283185482025146484375;
    float _650 = cos(_648);
    float _652 = _644 * (-2.0);
    float _654 = _284 * _348;
    float _656 = _646 * 0.15915493667125701904296875;
    float _658 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _660 = fma(_652, _494, _494);
    float _662 = _576 * _638;
    float _664 = -_620;
    float _666 = _364 + _664;
    float _668 = -_622;
    float _670 = _366 + _668;
    float _672 = _592 * _638;
    float _674 = fma(_658, _652, _658);
    float _676 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[196].z, _660);
    float _678 = fma(_596, _666, _620);
    float _680 = _610 * _638;
    float _682 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _684 = _672 * _682;
    float _686 = -_624;
    float _688 = _368 + _686;
    float _690 = fma(_674, _606, _676);
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _694 = _680 * _692;
    float _696 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _698 = -_684;
    float _700 = fma(_680, _696, _698);
    float _702 = fma(_596, _688, _624);
    float _704 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _706 = _662 * _704;
    float _708 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _710 = -_694;
    float _712 = fma(_662, _708, _710);
    float _714 = _700 * _700;
    float _716 = _690 * 0.15915493667125701904296875;
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _720 = -_706;
    float _722 = fma(_672, _718, _720);
    float _724 = _656 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = fma(_712, _712, _714);
    float _730 = fma(_596, _670, _622);
    float _732 = _654 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _734 = fma(_722, _722, _728);
    float _736 = _656 * 6.283185482025146484375;
    float _738 = cos(_736);
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _730);
    float _742 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _678);
    float _744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _702);
    float _746 = _732 * _742;
    float _748 = _488 * _744;
    float _750 = _634 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = _476 * _740;
    float _756 = _650 * _726;
    float _758 = _716 * 6.283185482025146484375;
    float _760 = cos(_758);
    float _762 = _650 * _738;
    float _764 = _716 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = _752 * _726;
    float _770 = _752 * _738;
    float _772 = rsqrt(_734);
    float _774 = _650 * _760;
    float _776 = _752 * _760;
    float _778 = _738 * _760;
    float _780 = _726 * _760;
    float _782 = _774 * _754;
    float _784 = fma(_766, _762, _768);
    float _786 = fma(_766, _768, _762);
    float _788 = -_756;
    float _790 = fma(_766, _770, _788);
    float _792 = -_754;
    float _794 = _766 * _792;
    float _796 = fma(_784, _746, _782);
    float _798 = -_770;
    float _800 = fma(_766, _756, _798);
    float _802 = _776 * _754;
    float _804 = fma(_778, _746, _794);
    float _806 = _712 * _772;
    float _808 = _700 * _772;
    float _810 = _722 * _772;
    float _812 = fma(_800, _748, _796);
    float _814 = _662 * _806;
    float _816 = _680 * _808;
    float _818 = fma(_790, _746, _802);
    float _820 = fma(_780, _748, _804);
    float _822 = -_814;
    float _824 = fma(_672, _808, _822);
    float _826 = -_816;
    float _828 = fma(_662, _810, _826);
    float _830 = fma(_786, _748, _818);
    float _832 = _672 * _810;
    float _834 = _824 * _812;
    float _836 = _828 * _812;
    float _838 = -_832;
    float _840 = fma(_680, _806, _838);
    float _842 = fma(_810, _820, _834);
    float _844 = fma(_806, _820, _836);
    float _846 = fma(_680, _830, _842);
    float _848 = fma(_672, _830, _844);
    float _850 = _582 + _846;
    float _852 = _422 + _848;
    float _854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _856 = _850 + _854;
    float _858 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _860 = _852 + _858;
    float _862 = _856 * _856;
    float _864 = fma(_860, _860, _862);
    float _866 = _840 * _812;
    float _868 = sqrt(_864);
    float _870 = fma(_808, _820, _866);
    float _872 = fma(_662, _830, _870);
    float _874 = _540 + _872;
    bool _876 = _868 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _878 = _830;
    float _880 = _852;
    float _882 = _866;
    float _884 = _864;
    float _886 = _634;
    if (!_876)
    {
        _878 = _852;
    }
    float _888 = _878;
    float _890 = _888;
    if (!_876)
    {
        _880 = _850;
    }
    float _892 = _880;
    float _894 = _892;
    if (!_876)
    {
        _882 = _874;
    }
    float _896 = _882;
    bool _898 = !_876;
    float _900 = _896;
    if (!_898)
    {
        float _902 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _904 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _906 = _868 + _904;
        float _908 = _874 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _910 = rsqrt(_864);
        float _912 = _906 * _902;
        float _914 = _912 * 0.15915493667125701904296875;
        float _916 = _914 * 6.283185482025146484375;
        float _918 = cos(_916);
        float _920 = _914 * 6.283185482025146484375;
        float _922 = sin(_920);
        float _924 = _918 + (-1.0);
        float _926 = fma(_922, _908, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _928 = _924 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _930 = _910 * _926;
        float _932 = fma(_874, _918, _928);
        float _934 = fma(_860, _930, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _936 = fma(_856, _930, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _900 = _932;
        _890 = _934;
        _894 = _936;
    }
    float _938 = _900;
    float _940 = _890;
    float _942 = _894;
    float _944 = -_540;
    float _946 = _944 + _938;
    float _948 = -_422;
    float _950 = _948 + _940;
    float _952 = -_582;
    float _954 = _952 + _942;
    float _956 = _540 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _958 = _946 * _946;
    bool _960 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _962 = isnan(0.5);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _968 = _964 || _966;
    float _970 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[11].x, _956);
    float _972 = fma(_950, _950, _958);
    bool _974 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _976 = isnan(0.5);
    bool _978 = _974 || _976;
    bool _980 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _982 = _978 || _980;
    float _984 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[11].z, _970);
    float _986 = fma(_954, _954, _972);
    float _988 = _540 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _990 = _984 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _992 = sqrt(_986);
    float _994 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[10].x, _988);
    float _996 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[10].z, _994);
    float _998 = 1.0 / _990;
    float _1000 = _996 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1002 = _1000 + _990;
    bool _1004 = _992 > 0.0;
    float _1006 = _1002 * _998;
    float _1008 = _1006 * 0.5;
    bool _1010 = !_1004;
    float _1012 = _940;
    float _1014 = _938;
    float _1016 = _942;
    float _1018 = _990;
    float _1020 = _992;
    if (!_1010)
    {
        float _1022 = _176 * _176;
        float _1024 = fma(_174, _174, _1022);
        float _1026 = fma(_178, _178, _1024);
        float _1028 = rsqrt(_986);
        float _1030 = sqrt(_1026);
        float _1032 = _950 * _1028;
        float _1034 = _946 * _1028;
        float _1036 = _954 * _1028;
        bool _1038 = _1030 > 0.0;
        bool _1040 = !_1038;
        _884 = _1036;
        _1018 = _1026;
        _1020 = _1034;
        if (!_1040)
        {
            float _1042 = rsqrt(_1026);
            float _1044 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1046 = _176 * _1042;
            float _1048 = _174 * _1042;
            float _1050 = _178 * _1042;
            float _1052 = _1034 * _1046;
            float _1054 = fma(_1032, _1048, _1052);
            float _1056 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1058 = fma(_1036, _1050, _1054);
            float _1060 = _1058 * _1056;
            float _1062 = fma(_174, _1060, _940);
            float _1064 = fma(_176, _1060, _938);
            float _1066 = fma(_178, _1060, _942);
            _1012 = _1062;
            _1014 = _1064;
            _1016 = _1066;
        }
    }
    float _1068 = _1012;
    float _1070 = _1014;
    float _1072 = _1016;
    float _1074 = _884;
    float _1076 = _1018;
    float _1078 = _1020;
    float _1080 = _1078;
    float _1082 = _1074;
    float _1084 = _1068;
    float _1086 = _1076;
    if (_982)
    {
        _1080 = 1.0;
    }
    float _1088 = _1080;
    float _1090 = _1088;
    if (_968)
    {
        _1082 = _1068;
    }
    float _1092 = _1082;
    float _1094 = _1092;
    if (_968)
    {
        _886 = _1070;
    }
    float _1096 = _886;
    float _1098 = 0.0;
    float _1100 = _1096;
    if (_968)
    {
        _1098 = _1072;
    }
    float _1102 = _1098;
    float _1104 = _1102;
    if (!_968)
    {
        float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1108 = _540 + _1106;
        float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1112 = _422 + _1110;
        float _1114 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1116 = -_422;
        float _1118 = _1116 + _1068;
        float _1120 = _1108 * _1108;
        float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1124 = _582 + _1122;
        float _1126 = -_582;
        float _1128 = _1126 + _1072;
        float _1130 = fma(_1112, _1112, _1120);
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1134 = fma(_1124, _1124, _1130);
        float _1136 = sqrt(_1134);
        float _1138 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1140 = precise::min(_1136, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1142 = _1140 * _1132;
        float _1144 = _1138 * _1142;
        float _1146 = -_540;
        float _1148 = _1146 + _1070;
        float _1150 = fma(_1118, _1144, _422);
        float _1152 = fma(_1148, _1144, _540);
        float _1154 = fma(_1128, _1144, _582);
        _1100 = _1152;
        _1094 = _1150;
        _1104 = _1154;
    }
    float _1156 = _1100;
    float _1158 = _1094;
    float _1160 = _1104;
    if (!_982)
    {
        float _1162 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1164 = _1162 * 0.15915493667125701904296875;
        float _1166 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1170 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1168);
        float _1172 = _1164 * 6.283185482025146484375;
        float _1174 = cos(_1172);
        float _1176 = _1166 * 0.15915493667125701904296875;
        float _1178 = _1164 * 6.283185482025146484375;
        float _1180 = sin(_1178);
        float _1182 = 1.0 / _1174;
        float _1184 = _1176 * 6.283185482025146484375;
        float _1186 = cos(_1184);
        float _1188 = _1180 * _1182;
        float _1190 = _1176 * 6.283185482025146484375;
        float _1192 = sin(_1190);
        float _1194 = _1186 * _1188;
        float _1196 = 1.0 / _1170;
        float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1200 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1198;
        float _1202 = 1.0 / _1194;
        float _1204 = 1.0 / _1200;
        float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1208 = _1196 * _1206;
        float _1210 = _1192 * _1202;
        float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1214 = fma(_1210, _1208, _1212);
        float _1216 = _1214 * _1204;
        float _1218 = precise::clamp(_1216, 0.0, 1.0);
        _1084 = _1170;
        _1090 = _1218;
    }
    float _1220 = _1084;
    float _1222 = _1090;
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1226 = _1156 + _1224;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1230 = _1158 + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1234 = _1160 + _1232;
    float _1236 = _1226 * _1226;
    float _1238 = fma(_1230, _1230, _1236);
    float _1240 = fma(_1234, _1234, _1238);
    float _1242 = rsqrt(_1240);
    float _1244 = sqrt(_1240);
    float _1246 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1248 = _1230 * _1246;
    float _1250 = _1234 * _1246;
    float _1252 = _1248 * _1248;
    float _1254 = _1250 * _1250;
    float _1256 = _1252 + _1254;
    float _1258 = sqrt(_1256);
    bool _1260 = _1258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = _1258 + _1262;
    float _1266 = _1234;
    float _1268 = _1256;
    float _1270 = _1264;
    float _1272 = _1220;
    float _1274 = _1226;
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
    float _1284 = _1282;
    if (_1260)
    {
        float _1286 = _1264 * _1278;
        _1270 = _1286;
    }
    float _1288 = _1270;
    if (_1260)
    {
        float _1290 = _1288 * 0.15915493667125701904296875;
        _1272 = _1290;
    }
    float _1292 = _1272;
    float _1294 = _1278;
    float _1296 = _1292;
    if (_1260)
    {
        float _1298 = _1292 * 6.283185482025146484375;
        float _1300 = sin(_1298);
        _1294 = _1300;
    }
    float _1302 = _1294;
    float _1304 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1306 = precise::max(0.0, _1304);
    float _1308 = _1238;
    float _1310 = _1306;
    if (_1260)
    {
        float _1312 = _1292 * 6.283185482025146484375;
        float _1314 = cos(_1312);
        _1308 = _1314;
    }
    float _1316 = _1308;
    float _1318 = -_1246;
    float _1320 = -_1306;
    float _1322 = fma(_1226, _1318, _1320);
    if (_1260)
    {
        float _1324 = _1322 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1310 = _1324;
    }
    float _1326 = _1310;
    float _1328 = _1326;
    float _1330 = _1302;
    if (_1260)
    {
        float _1332 = fma(_1302, _1326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1328 = _1332;
    }
    float _1334 = _1328;
    float _1336 = _1334;
    if (!_1260)
    {
        _1330 = _1248;
    }
    float _1338 = _1330;
    float _1340 = _1338;
    float _1342 = _1316;
    if (_1260)
    {
        float _1344 = _1316 + (-1.0);
        _1274 = _1344;
    }
    float _1346 = _1274;
    float _1348 = _1346;
    if (_1260)
    {
        float _1350 = _1282 * _1334;
        _1086 = _1350;
    }
    float _1352 = _1086;
    if (!_1260)
    {
        _1336 = _1322;
    }
    float _1354 = _1336;
    float _1356 = _1354;
    if (_1260)
    {
        float _1358 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1296 = _1358;
    }
    float _1360 = _1296;
    if (_1260)
    {
        float _1362 = _1248 * _1352;
        _1340 = _1362;
    }
    float _1364 = _1340;
    if (!_1260)
    {
        _1348 = _1250;
    }
    float _1366 = _1348;
    float _1368 = _1366;
    if (_1260)
    {
        float _1370 = _1250 * _1352;
        _1368 = _1370;
    }
    float _1372 = _1368;
    if (!_1260)
    {
        _1284 = _1252;
    }
    float _1374 = _1284;
    float _1376 = _1374;
    if (_1260)
    {
        float _1378 = fma(_1322, _1316, _1360);
        _1356 = _1378;
    }
    float _1380 = _1356;
    if (_1260)
    {
        float _1382 = _1364 * _1364;
        _1376 = _1382;
    }
    float _1384 = _1376;
    if (!_1260)
    {
        _1342 = _1254;
    }
    float _1386 = _1342;
    float _1388 = _1386;
    if (_1260)
    {
        float _1390 = _1372 * _1372;
        _1388 = _1390;
    }
    float _1392 = _1388;
    float _1394 = fma(_1380, _1380, _1384);
    float _1396 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1398 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1400 = _1394 + _1392;
    float _1402 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1396);
    float _1404 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1408 = fma(_1244, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1406);
    float _1410 = precise::clamp(_1408, 0.0, 1.0);
    float _1412 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1414 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1402);
    float _1416 = rsqrt(_1400);
    float _1418 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1420 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1404);
    float _1422 = -_1410;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1412);
    float _1428 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1418);
    float _1430 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1432 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1434 = abs(_1424);
    float _1436 = log2(_1434);
    float _1438 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1428);
    float _1440 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1442 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1426);
    float _1444 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1446 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1448 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1450 = _1416 * _1364;
    float _1452 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1454 = _1416 * _1380;
    float _1456 = _1416 * _1372;
    float _1458 = -_1444;
    float _1460 = fma(_1458, _1398, 1.0);
    float _1462 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1452);
    float _1464 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1466 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1468 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1470 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1462);
    float _1472 = -_1464;
    float _1474 = fma(_1454, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1472);
    float _1476 = log2(_1460);
    float _1478 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1466);
    float _1480 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1470);
    float _1482 = -_1456;
    float _1484 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1474);
    float _1486 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1488 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1478);
    float _1490 = _1454 + 1.0;
    float _1492 = fma(_1484, -0.5, 0.5);
    float _1494 = exp2(_1468);
    float _1496 = fma(_1484, 0.5, 0.5);
    float _1498 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1486);
    float _1500 = fma(_1496, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1502 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1498);
    float _1504 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1488);
    float _1506 = 1.0 / _1480;
    float _1508 = fma(_1496, _1500, -0.212114393711090087890625);
    float _1510 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1502);
    float _1512 = _1476 * 0.693147182464599609375;
    float _1514 = fma(_1496, _1508, 1.570728778839111328125);
    float _1516 = _1512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1518 = sqrt(_1492);
    float _1520 = -_1454;
    float _1522 = fma(_1494, _1490, _1520);
    float _1524 = fma(_1522, 0.5, 0.5);
    float _1526 = _1510 * _1506;
    float _1528 = _1504 * _1506;
    float _1530 = fma(_1526, 0.5, 0.5);
    float _1532 = fma(_1528, -0.5, 0.5);
    float _1534 = _1518 * 0.636619746685028076171875;
    float3 _4558 = float3(_1530, _1532, _1516);
    float _1536 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4558, float3(0.0), isnan(_4558)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4558, float3(0.0), isnan(_4558)), level(0.0)).x;
    float _1538 = -_1514;
    float _1540 = fma(_1534, _1538, 1.0);
    float3 _4574 = float3(_1530, _1532, _1516);
    float4 _1543 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4574, float3(0.0), isnan(_4574)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4574, float3(0.0), isnan(_4574)), level(0.0)).xyzw;
    float _1545 = _1543.x;
    float _1547 = _1543.y;
    float _1549 = _1543.z;
    float _1551 = _1543.w;
    float2 _4591 = float2(_1540, _1524);
    float3 _1555 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4591, float2(0.0), isnan(_4591)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4591, float2(0.0), isnan(_4591)), level(0.0)).xyz;
    float _1557 = _1555.x;
    float _1559 = _1555.y;
    float _1561 = _1555.z;
    float _1563 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1565 = _774 * _824;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1569 = _1567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1571 = _358 > 0.5;
    float _1573 = exp2(_1563);
    int _1575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1577 = _1575 != 0;
    float _1579 = in.m_63.x;
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1587 = _1585 != 0;
    float _1589 = -_766;
    float _1591 = fma(_1589, _810, _1565);
    bool _1593 = _354 > 0.5;
    bool _1595 = _1593 && _1577;
    float _1597 = in.m_63.y;
    float _1599 = 1.0 / _1569;
    float _1601 = fma(_776, _680, _1591);
    bool _1603 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1605 = isnan(_312);
    bool _1607 = _1603 || _1605;
    bool _1609 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1611 = _1607 || _1609;
    float _1613 = float(_1611);
    bool _1615 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1617 = isnan(_312);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1623 = _1619 || _1621;
    float _1625 = float(_1623);
    float _1627 = 1.0 / _1583;
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1631 = _1629 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1633 = -_1613;
    float _1635 = _1633 + 1.0;
    bool _1637 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1639 = isnan(_312);
    bool _1641 = _1637 || _1639;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1645 = _1641 || _1643;
    float _1647 = float(_1645);
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1649;
    float _1653 = -_1625;
    float _1655 = _1653 + 1.0;
    float _1657 = _1625 * _1635;
    float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1661 = _1659 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1663 = _1651 * _1599;
    bool _1665 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1667 = isnan(_312);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1673 = _1669 || _1671;
    float _1675 = float(_1673);
    float _1677 = _1647 * _1655;
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1681 = _312 + _1679;
    float _1683 = -_1647;
    float _1685 = _1683 + 1.0;
    float _1687 = 1.0 / _1631;
    float _1689 = fma(_1663, _1681, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1691 = _1661 * _1627;
    float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1695 = _312 + _1693;
    float _1697 = _1675 * _1685;
    float _1699 = -_1675;
    float _1701 = _1699 + 1.0;
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1705 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1703;
    float _1707 = fma(_1691, _1695, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1709 = _1689 * _1697;
    float _1711 = _1695;
    float _1713 = _1579;
    float _1715 = _1480;
    float _1717 = _1504;
    float _1719 = _1510;
    if (_1577)
    {
        _1711 = _1579;
    }
    float _1721 = _1711;
    float _1723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1727 = _312 + _1725;
    float _1729 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1709);
    float _1731 = -_1597;
    float _1733 = _1731 + 1.0;
    float _1735 = _1721;
    float _1737 = _1597;
    if (_1595)
    {
        float _1739 = -_1721;
        float _1741 = _1739 + 1.0;
        _1735 = _1741;
    }
    float _1743 = _1735;
    float _1745 = _1705 * _1687;
    float _1747 = fma(_1707, _1677, _1729);
    float _1749 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1587)
    {
        float _1751 = _1571 ? _1733 : _1597;
        _1737 = _1751;
    }
    float _1753 = _1737;
    float _1755 = fma(_1745, _1727, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    if (_1577)
    {
        _1713 = _1743;
    }
    float _1757 = _1713;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1761 = _730 != 0.0;
    bool _1763 = isnan(_730);
    bool _1765 = _1761 || _1763;
    bool _1767 = isnan(0.0);
    bool _1769 = _1765 || _1767;
    float _1771 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1773 = fma(_1755, _1657, _1747);
    float _1775 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1777 = _1771 * _1723;
    float _1779 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1773);
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1783 = _678 == 0.0;
    bool _1785 = !_1769;
    bool _1787 = _1783 && _1785;
    float _1789 = _1775 * _1749;
    float _1791 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1793 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1795 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1799 = _1791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1801 = _774 * _840;
    float _1803 = _1797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1805 = _702 == 0.0;
    bool _1807 = _1805 && _1787;
    float _1809 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1813 = _1759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1799;
    out.m_65.y = _1803;
    out.m_65.z = _1795;
    out.m_65.w = _1793;
    float _1815 = _1809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1817 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1819 = _1779 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1821 = in.m_67.x;
    float _1823 = in.m_67.y;
    float _1825 = in.m_67.z;
    float _1827 = _784 * _840;
    float _1829 = _774 * _828;
    float _1831 = _800 * _828;
    out.m_69.x = _1813;
    out.m_69.y = _1815;
    out.m_69.z = _1817;
    out.m_69.w = _1819;
    float _1833 = _800 * _840;
    float _1835 = fma(_778, _808, _1827);
    float _1837 = _784 * _828;
    out.m_71.x = _1789;
    out.m_71.y = _1777;
    float _1839 = fma(_780, _808, _1833);
    float _1841 = -_766;
    float _1843 = fma(_1841, _808, _1801);
    float _1845 = _784 * _824;
    float _1847 = -_1573;
    float _1849 = _1847 + 1.0;
    float _1851 = _800 * _824;
    float _1853 = fma(_778, _810, _1845);
    float _1855 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1857 = fma(_780, _810, _1851);
    float _1859 = fma(_776, _662, _1843);
    float _1861 = -_766;
    float _1863 = fma(_1861, _806, _1829);
    float _1865 = fma(_780, _806, _1831);
    float _1867 = fma(_790, _662, _1835);
    float _1869 = fma(_778, _806, _1837);
    float _1871 = fma(_776, _672, _1863);
    float _1873 = _1823;
    float _1875 = _1821;
    float _1877 = _1825;
    if (!_1807)
    {
        float _1879 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1823);
        _1873 = _1879;
    }
    float _1881 = _1873;
    if (!_1807)
    {
        float _1883 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1821);
        _1875 = _1883;
    }
    float _1885 = _1875;
    float _1887 = fma(_786, _672, _1865);
    float _1889 = fma(_786, _662, _1839);
    float _1891 = _1859 * _1881;
    if (!_1807)
    {
        float _1893 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1825);
        _1877 = _1893;
    }
    float _1895 = _1877;
    float _1897 = _1871 * _1881;
    float _1899 = _1601 * _1881;
    float _1901 = fma(_1867, _1885, _1891);
    float _1903 = fma(_790, _672, _1869);
    float _1905 = fma(_790, _680, _1853);
    float _1907 = fma(_786, _680, _1857);
    float _1909 = fma(_1889, _1895, _1901);
    float _1911 = fma(_1903, _1885, _1897);
    float _1913 = fma(_1905, _1885, _1899);
    float _1915 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1917 = _1244 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1919 = isnan(_1244);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1925 = _1921 || _1923;
    float _1927 = fma(_1887, _1895, _1911);
    float _1929 = fma(_1907, _1895, _1913);
    float _1931 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1915);
    float _1933 = _1510 + _1480;
    float _1935 = _1480 * 0.5;
    out.m_73.x = _1927;
    out.m_73.y = _1909;
    out.m_73.z = _1929;
    float _1937 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1931);
    float _1939 = _1933 * 0.5;
    float _1941 = fma(_1504, -0.5, _1935);
    float _1943 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1937);
    float _1945 = _1943 + _1480;
    out.gl_Position.x = _1510;
    out.gl_Position.y = _1504;
    out.gl_Position.z = _1943;
    out.gl_Position.w = _1480;
    float _1947 = _1945 * 0.5;
    out.m_75.x = _1939;
    out.m_75.y = _1941;
    out.m_75.z = _1947;
    out.m_75.w = _1480;
    float _1949 = _1943;
    float _1951 = _1939;
    if (!_1925)
    {
        _1715 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1953 = _1715;
    float _1955 = _1953;
    float _1957 = _1953;
    if (!_1925)
    {
        _1949 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1959 = _1949;
    float _1961 = _1959;
    float _1963 = _1959;
    if (!_1925)
    {
        _1717 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1965 = _1717;
    float _1967 = _1965;
    float _1969 = _1965;
    if (!_1925)
    {
        _1719 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1971 = _1719;
    float _1973 = _1971;
    float _1975 = _1971;
    if (!_1925)
    {
        _1951 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1977 = _1951;
    float _1979 = _1855 * _1536;
    float _1981 = -_1855;
    float _1983 = _1981 + 1.0;
    float _1985 = _1551 * _1979;
    float _1987 = _1551 * _1983;
    float _1989 = _1561 * _1979;
    float _1991 = fma(_1557, _1985, _1545);
    float _1993 = fma(_1559, _1985, _1547);
    float _1995 = _1985;
    float _1997 = _1977;
    float _1999 = _1977;
    if (!_1925)
    {
        _1995 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2001 = _1995;
    float _2003 = fma(_1551, _1989, _1549);
    out.m_77.x = _1991;
    out.m_77.y = _1993;
    out.m_77.z = _2003;
    out.m_77.w = _1987;
    bool _2005 = !_1925;
    float _2007 = _2001;
    float _2009 = _2001;
    if (!_2005)
    {
        bool _2011 = _1244 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2013 = isnan(_1244);
        bool _2015 = _2011 || _2013;
        bool _2017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2019 = _2015 || _2017;
        if (!_2019)
        {
            float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2023 = _1244 + _2021;
            float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2027 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2025;
            float _2029 = 1.0 / _2027;
            float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2033 = _2031 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2037 = _2035 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2041 = _2039 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2045 = _2043 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2049 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2051 = _2023 * _2029;
            float _2053 = precise::clamp(_2051, 0.0, 1.0);
            float _2055 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2057 = _2055 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2059 = fma(_2053, _2033, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2061 = fma(_2053, _2057, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2063 = fma(_2053, _2037, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2065 = fma(_2053, _2041, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2067 = fma(_2053, _2045, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2069 = fma(_2053, _2049, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1999 = _2061;
            _1969 = _2067;
            _2009 = _2059;
            _1963 = _2065;
            _1957 = _2063;
            _1975 = _2069;
            _2071 = true;
        }
        else
        {
            bool _2073 = _1244 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2075 = isnan(_1244);
            bool _2077 = _2073 || _2075;
            bool _2079 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2081 = _2077 || _2079;
            if (!_2081)
            {
                _2007 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2083 = _2007;
            _2009 = _2083;
            if (!_2081)
            {
                _1997 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2085 = _1997;
            _1999 = _2085;
            if (!_2081)
            {
                _1955 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2087 = _1955;
            _1957 = _2087;
            if (!_2081)
            {
                _1961 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2089 = _1961;
            _1963 = _2089;
            if (!_2081)
            {
                _1967 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2091 = _1967;
            _1969 = _2091;
            if (!_2081)
            {
                _1973 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2093 = _1973;
            bool _2095 = !_2081;
            _1975 = _2093;
            if (!_2095)
            {
                bool _2097 = _1244 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2099 = isnan(_1244);
                bool _2101 = _2097 || _2099;
                bool _2103 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2105 = _2101 || _2103;
                if (!_2105)
                {
                    float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2109 = _1244 + _2107;
                    float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2113 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2111;
                    float _2115 = 1.0 / _2113;
                    float _2117 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2119 = _2117 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2123 = _2121 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2125 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2127 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2131 = _2129 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2133 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2135 = _2133 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2137 = _2109 * _2115;
                    float _2139 = precise::clamp(_2137, 0.0, 1.0);
                    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2143 = _2141 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2145 = fma(_2139, _2119, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2147 = fma(_2139, _2143, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2149 = fma(_2139, _2123, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2151 = fma(_2139, _2127, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2153 = fma(_2139, _2131, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2155 = fma(_2139, _2135, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1999 = _2147;
                    _1969 = _2153;
                    _2009 = _2145;
                    _1963 = _2151;
                    _1957 = _2149;
                    _1975 = _2155;
                    _2071 = true;
                }
                else
                {
                    _1999 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1969 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2009 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1963 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1957 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1975 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2071 = false;
    float _2157 = _1999;
    float _2159 = _1969;
    float _2161 = _2009;
    float _2163 = _1963;
    float _2165 = _1957;
    float _2167 = _1975;
    float _2169 = fma(_1909, -0.5, 0.5);
    float _2171 = precise::clamp(_2169, 0.0, 1.0);
    float _2173 = -_2157;
    float _2175 = _2173 + _2159;
    float _2177 = _1222 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2179 = -_2161;
    float _2181 = _2179 + _2163;
    float _2183 = fma(_2171, _2175, _2157);
    out.m_79.x = 0.0;
    float _2185 = -_2165;
    float _2187 = _2185 + _2167;
    float _2189 = fma(_2171, _2181, _2161);
    float _2191 = _2183 * 0.586610972881317138671875;
    out.m_47.x = _2177;
    bool _2193 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2195 = fma(_2171, _2187, _2165);
    float _2197 = fma(_2189, 0.298911988735198974609375, _2191);
    bool _2199 = _1222 > 0.0;
    bool _2201 = isnan(_1222);
    bool _2203 = _2199 || _2201;
    bool _2205 = isnan(0.0);
    bool _2207 = _2203 || _2205;
    float _2209 = fma(_2195, 0.114477999508380889892578125, _2197);
    float _2211 = -_2209;
    float _2213 = _2189 + _2211;
    float _2215 = -_2209;
    float _2217 = _2183 + _2215;
    float _2219 = -_2209;
    float _2221 = _2195 + _2219;
    float _2223 = fma(_2213, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    float _2225 = fma(_2217, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    float _2227 = fma(_2221, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    bool _2229 = !_2193;
    if (!_2229)
    {
        float _2231 = -_1156;
        float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2235 = -_1158;
        float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2239 = -_1160;
        float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2243 = _2233 * _2233;
        float _2245 = fma(_2237, _2237, _2243);
        float _2247 = fma(_2241, _2241, _2245);
        float _2249 = sqrt(_2247);
        float _2251 = rsqrt(_2247);
        float _2253 = -_2249;
        float _2255 = _2253 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2257 = _2255 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2259 = precise::clamp(_2257, 0.0, 1.0);
        float _2261 = _2237 * _2251;
        float _2263 = _2233 * _2251;
        float _2265 = abs(_2259);
        float _2267 = log2(_2265);
        float _2269 = _2241 * _2251;
        float _2271 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2273 = _1909 * _2263;
        float _2275 = -_2263;
        float _2277 = -_2271;
        float _2279 = fma(_2275, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2277);
        float _2281 = fma(_1927, _2261, _2273);
        float _2283 = -_2269;
        float _2285 = fma(_2283, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2279);
        float _2287 = fma(_1929, _2269, _2281);
        float _2289 = precise::clamp(_2287, 0.0, 1.0);
        float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2293 = _2285 + _2291;
        float _2295 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2297 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2299 = precise::clamp(_2297, 0.0, 1.0);
        float _2301 = exp2(_2295);
        float _2303 = _2301 * _2299;
        float _2305 = _2289 * _2303;
        float _2307 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2309 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2311 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _2307;
        out.m_79.y = _2309;
        out.m_79.z = _2311;
    }
    out.m_81.x = _2223;
    out.m_81.y = _2225;
    out.m_81.z = _2227;
    if (_2207)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2313 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2313;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2071 = false;
    bool _310 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2371 = as_type<float>(_116);
        out.gl_Position.z = _2371;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_49.w;
    float _122 = float(_100);
    float _124 = -_120;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_120);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    bool _138 = _126 >= _122;
    bool _140 = !_136;
    bool _142 = _138 || _140;
    float _144 = _126;
    if (_142)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _108;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _118 = as_type<int>(_148);
    }
    int _150 = _118;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2435 = as_type<float>(_150);
        out.gl_Position.z = _2435;
    }
    if (_142)
    {
        return out;
    }
    float _152 = in.m_51.x;
    float _154 = in.m_51.y;
    float _156 = in.m_51.z;
    float _158 = 1.0 / _122;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _162 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _164 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _166 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _168 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _162);
    float _170 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _164);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _166);
    float _174 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _168);
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _170);
    float _178 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _172);
    float _180 = _126 * _158;
    bool _182 = !_160;
    float _200;
    if (!_182)
    {
        float _184 = in.m_53.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        _200 = _180;
    }
    _202 = false;
    float _204 = _200;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _204 + _206;
    bool _210 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = 1.0 / _224;
    float _230 = -_220;
    float _232 = _230 + 1.0;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _234;
    float _238 = _208 * _228;
    bool _240 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _242 = isnan(_204);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _252;
    float _256 = fma(_236, _238, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _258;
    float _262 = _250 * _232;
    float _264 = fma(_254, _238, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = fma(_260, _238, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = -_250;
    float _270 = _268 + 1.0;
    float _272 = _256 * _262;
    float _274 = _264 * _262;
    float _276 = _266 * _262;
    float _278 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].x, _274);
    float _280 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].y, _276);
    float _282 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].z, _272);
    float _284 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].x, _278);
    float _286 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].y, _280);
    float _288 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].z, _282);
    bool _290 = !_226;
    float _308;
    if (!_290)
    {
        float _292 = in.m_53.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        _308 = _180;
    }
    _310 = false;
    float _312 = _308;
    float _314 = in.m_53.z;
    float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _318 = log2(_316);
    float _320 = in.m_55.x;
    float _322 = in.m_55.y;
    float _324 = in.m_55.z;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _332 = _330 != 0;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _336 = _334 != 0;
    float _338 = in.m_44.x;
    float _340 = in.m_44.y;
    float _342 = in.m_44.z;
    float _344 = abs(_180);
    float _346 = log2(_344);
    float _348 = in.m_57.x;
    float _350 = in.m_57.y;
    float _352 = in.m_57.z;
    float _354 = in.m_53.x;
    float _356 = _318 * _126;
    float _358 = in.m_53.y;
    float _360 = _314 * 2.0;
    float _362 = exp2(_356);
    float _364 = fma(_320, 2.0, -1.0);
    float _366 = fma(_322, 2.0, -1.0);
    float _368 = fma(_324, 2.0, -1.0);
    float _370 = _340 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _372 = floor(_360);
    float _374 = _340 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = _340 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _378 = _288 * _352;
    float _380 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[5].x, _370);
    float _382 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _384 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[6].x, _376);
    float _386 = _354 * 2.0;
    float _388 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].z, _380);
    float _390 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].z, _382);
    float _392 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].z, _384);
    float _394 = _358 * 2.0;
    float _396 = floor(_386);
    float _398 = _358 + _314;
    bool _400 = !_332;
    int _402 = _400 ? 0 : 1;
    float _404 = -_362;
    float _406 = _404 + 1.0;
    bool _408 = _372 > 0.0;
    float _410 = _398 + (-1.0);
    bool _412 = _372 >= 0.0;
    bool _414 = isnan(_372);
    bool _416 = _412 || _414;
    bool _418 = isnan(0.0);
    bool _420 = _416 || _418;
    float _422 = _390 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _424 = floor(_394);
    float _426 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _428 = _420 ? 0 : 1;
    float _430 = _354 + _358;
    float _432 = _286 * _350;
    int _434 = ~_428;
    int _436 = _434 + 1;
    int _438 = _436 + 1;
    float _440 = _430 + (-1.0);
    bool _442 = _396 > 0.0;
    float _444 = _354 + _314;
    int _446 = _438;
    if (!_408)
    {
        int _448 = ~_428;
        int _450 = _448 + 1;
        _446 = _450;
    }
    int _452 = _446;
    float _454 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _456 = _396 >= 0.0;
    bool _458 = isnan(_396);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = _444 + (-1.0);
    bool _468 = !_328;
    int _470 = _468 ? 0 : 1;
    float _472 = _314 + (-0.5);
    bool _474 = _424 > 0.0;
    float _476 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _478 = _424 >= 0.0;
    bool _480 = isnan(_424);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _490 = in.m_59.x;
    float _492 = in.m_59.y;
    float _494 = in.m_59.z;
    int _496 = abs(_470);
    float _498 = float(_452);
    float _500 = float(_496);
    int _502 = _464 ? 0 : 1;
    float _504 = _500 * _498;
    int _506 = _486 ? 0 : 1;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _510 = 1.0 + _508;
    int _512 = ~_502;
    int _514 = _512 + 1;
    int _516 = _514 + 1;
    float _518 = _504 * (-2.0);
    int _520 = _516;
    if (!_442)
    {
        int _522 = ~_502;
        int _524 = _522 + 1;
        _520 = _524;
    }
    int _526 = _520;
    float _528 = 1.0 / _510;
    int _530 = abs(_402);
    float _532 = fma(_454, _518, _454);
    int _534 = ~_506;
    int _536 = _534 + 1;
    int _538 = _536 + 1;
    float _540 = _388 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _542 = _538;
    if (!_474)
    {
        int _544 = ~_506;
        int _546 = _544 + 1;
        _542 = _546;
    }
    int _548 = _542;
    bool _550 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(1.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    float _560 = fma(_518, _490, _490);
    float _562 = _354 + (-0.5);
    bool _564 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _566 = isnan(0.0);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _572 = _568 || _570;
    float _574 = -_540;
    float _576 = _574 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _578 = _346 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _580 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[196].x, _560);
    float _582 = _392 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _584 = float(_526);
    float _586 = _576 * _576;
    float _588 = float(_530);
    float _590 = -_422;
    float _592 = _590 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _594 = _572 ? _406 : 0.0;
    float _596 = exp2(_578);
    bool _598 = !_336;
    int _600 = _598 ? 0 : 1;
    float _602 = _588 * _584;
    if (_558)
    {
        float _604 = _594 * _528;
        _144 = _604;
    }
    float _606 = _144;
    float _608 = -_582;
    float _610 = _608 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _612 = fma(_592, _592, _586);
    int _614 = abs(_600);
    float _616 = _602 * (-2.0);
    float _618 = fma(_532, _606, _580);
    float _620 = in.m_61.x;
    float _622 = in.m_61.y;
    float _624 = in.m_61.z;
    float _626 = fma(_610, _610, _612);
    float _628 = fma(_426, _616, _426);
    float _630 = fma(_616, _492, _492);
    float _632 = _358 + (-0.5);
    float _634 = _618 * 0.15915493667125701904296875;
    float _636 = float(_614);
    float _638 = rsqrt(_626);
    float _640 = float(_548);
    float _642 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[196].y, _630);
    float _644 = _636 * _640;
    float _646 = fma(_628, _606, _642);
    float _648 = _634 * 6.283185482025146484375;
    float _650 = cos(_648);
    float _652 = _644 * (-2.0);
    float _654 = _284 * _348;
    float _656 = _646 * 0.15915493667125701904296875;
    float _658 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _660 = fma(_652, _494, _494);
    float _662 = _576 * _638;
    float _664 = -_620;
    float _666 = _364 + _664;
    float _668 = -_622;
    float _670 = _366 + _668;
    float _672 = _592 * _638;
    float _674 = fma(_658, _652, _658);
    float _676 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[196].z, _660);
    float _678 = fma(_596, _666, _620);
    float _680 = _610 * _638;
    float _682 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _684 = _672 * _682;
    float _686 = -_624;
    float _688 = _368 + _686;
    float _690 = fma(_674, _606, _676);
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _694 = _680 * _692;
    float _696 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _698 = -_684;
    float _700 = fma(_680, _696, _698);
    float _702 = fma(_596, _688, _624);
    float _704 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _706 = _662 * _704;
    float _708 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _710 = -_694;
    float _712 = fma(_662, _708, _710);
    float _714 = _700 * _700;
    float _716 = _690 * 0.15915493667125701904296875;
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _720 = -_706;
    float _722 = fma(_672, _718, _720);
    float _724 = _656 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = fma(_712, _712, _714);
    float _730 = fma(_596, _670, _622);
    float _732 = _654 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _734 = fma(_722, _722, _728);
    float _736 = _656 * 6.283185482025146484375;
    float _738 = cos(_736);
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _730);
    float _742 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _678);
    float _744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _702);
    float _746 = _732 * _742;
    float _748 = _488 * _744;
    float _750 = _634 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = _476 * _740;
    float _756 = _650 * _726;
    float _758 = _716 * 6.283185482025146484375;
    float _760 = cos(_758);
    float _762 = _650 * _738;
    float _764 = _716 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = _752 * _726;
    float _770 = _752 * _738;
    float _772 = rsqrt(_734);
    float _774 = _650 * _760;
    float _776 = _752 * _760;
    float _778 = _738 * _760;
    float _780 = _726 * _760;
    float _782 = _774 * _754;
    float _784 = fma(_766, _762, _768);
    float _786 = fma(_766, _768, _762);
    float _788 = -_756;
    float _790 = fma(_766, _770, _788);
    float _792 = -_754;
    float _794 = _766 * _792;
    float _796 = fma(_784, _746, _782);
    float _798 = -_770;
    float _800 = fma(_766, _756, _798);
    float _802 = _776 * _754;
    float _804 = fma(_778, _746, _794);
    float _806 = _712 * _772;
    float _808 = _700 * _772;
    float _810 = _722 * _772;
    float _812 = fma(_800, _748, _796);
    float _814 = _662 * _806;
    float _816 = _680 * _808;
    float _818 = fma(_790, _746, _802);
    float _820 = fma(_780, _748, _804);
    float _822 = -_814;
    float _824 = fma(_672, _808, _822);
    float _826 = -_816;
    float _828 = fma(_662, _810, _826);
    float _830 = fma(_786, _748, _818);
    float _832 = _672 * _810;
    float _834 = _824 * _812;
    float _836 = _828 * _812;
    float _838 = -_832;
    float _840 = fma(_680, _806, _838);
    float _842 = fma(_810, _820, _834);
    float _844 = fma(_806, _820, _836);
    float _846 = fma(_680, _830, _842);
    float _848 = fma(_672, _830, _844);
    float _850 = _582 + _846;
    float _852 = _422 + _848;
    float _854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _856 = _850 + _854;
    float _858 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _860 = _852 + _858;
    float _862 = _856 * _856;
    float _864 = fma(_860, _860, _862);
    float _866 = _840 * _812;
    float _868 = sqrt(_864);
    float _870 = fma(_808, _820, _866);
    float _872 = fma(_662, _830, _870);
    float _874 = _540 + _872;
    bool _876 = _868 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _878 = _830;
    float _880 = _852;
    float _882 = _866;
    float _884 = _864;
    float _886 = _634;
    if (!_876)
    {
        _878 = _852;
    }
    float _888 = _878;
    float _890 = _888;
    if (!_876)
    {
        _880 = _850;
    }
    float _892 = _880;
    float _894 = _892;
    if (!_876)
    {
        _882 = _874;
    }
    float _896 = _882;
    bool _898 = !_876;
    float _900 = _896;
    if (!_898)
    {
        float _902 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _904 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _906 = _868 + _904;
        float _908 = _874 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _910 = rsqrt(_864);
        float _912 = _906 * _902;
        float _914 = _912 * 0.15915493667125701904296875;
        float _916 = _914 * 6.283185482025146484375;
        float _918 = cos(_916);
        float _920 = _914 * 6.283185482025146484375;
        float _922 = sin(_920);
        float _924 = _918 + (-1.0);
        float _926 = fma(_922, _908, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _928 = _924 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _930 = _910 * _926;
        float _932 = fma(_874, _918, _928);
        float _934 = fma(_860, _930, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _936 = fma(_856, _930, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _900 = _932;
        _890 = _934;
        _894 = _936;
    }
    float _938 = _900;
    float _940 = _890;
    float _942 = _894;
    float _944 = -_540;
    float _946 = _944 + _938;
    float _948 = -_422;
    float _950 = _948 + _940;
    float _952 = -_582;
    float _954 = _952 + _942;
    float _956 = _540 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _958 = _946 * _946;
    bool _960 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _962 = isnan(0.5);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _968 = _964 || _966;
    float _970 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[11].x, _956);
    float _972 = fma(_950, _950, _958);
    bool _974 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _976 = isnan(0.5);
    bool _978 = _974 || _976;
    bool _980 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _982 = _978 || _980;
    float _984 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[11].z, _970);
    float _986 = fma(_954, _954, _972);
    float _988 = _540 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _990 = _984 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _992 = sqrt(_986);
    float _994 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[10].x, _988);
    float _996 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[10].z, _994);
    float _998 = 1.0 / _990;
    float _1000 = _996 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1002 = _1000 + _990;
    bool _1004 = _992 > 0.0;
    float _1006 = _1002 * _998;
    float _1008 = _1006 * 0.5;
    bool _1010 = !_1004;
    float _1012 = _940;
    float _1014 = _938;
    float _1016 = _942;
    float _1018 = _990;
    float _1020 = _992;
    if (!_1010)
    {
        float _1022 = _176 * _176;
        float _1024 = fma(_174, _174, _1022);
        float _1026 = fma(_178, _178, _1024);
        float _1028 = rsqrt(_986);
        float _1030 = sqrt(_1026);
        float _1032 = _950 * _1028;
        float _1034 = _946 * _1028;
        float _1036 = _954 * _1028;
        bool _1038 = _1030 > 0.0;
        bool _1040 = !_1038;
        _884 = _1036;
        _1018 = _1026;
        _1020 = _1034;
        if (!_1040)
        {
            float _1042 = rsqrt(_1026);
            float _1044 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1046 = _176 * _1042;
            float _1048 = _174 * _1042;
            float _1050 = _178 * _1042;
            float _1052 = _1034 * _1046;
            float _1054 = fma(_1032, _1048, _1052);
            float _1056 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1058 = fma(_1036, _1050, _1054);
            float _1060 = _1058 * _1056;
            float _1062 = fma(_174, _1060, _940);
            float _1064 = fma(_176, _1060, _938);
            float _1066 = fma(_178, _1060, _942);
            _1012 = _1062;
            _1014 = _1064;
            _1016 = _1066;
        }
    }
    float _1068 = _1012;
    float _1070 = _1014;
    float _1072 = _1016;
    float _1074 = _884;
    float _1076 = _1018;
    float _1078 = _1020;
    float _1080 = _1078;
    float _1082 = _1074;
    float _1084 = _1068;
    float _1086 = _1076;
    if (_982)
    {
        _1080 = 1.0;
    }
    float _1088 = _1080;
    float _1090 = _1088;
    if (_968)
    {
        _1082 = _1068;
    }
    float _1092 = _1082;
    float _1094 = _1092;
    if (_968)
    {
        _886 = _1070;
    }
    float _1096 = _886;
    float _1098 = 0.0;
    float _1100 = _1096;
    if (_968)
    {
        _1098 = _1072;
    }
    float _1102 = _1098;
    float _1104 = _1102;
    if (!_968)
    {
        float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1108 = _540 + _1106;
        float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1112 = _422 + _1110;
        float _1114 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1116 = -_422;
        float _1118 = _1116 + _1068;
        float _1120 = _1108 * _1108;
        float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1124 = _582 + _1122;
        float _1126 = -_582;
        float _1128 = _1126 + _1072;
        float _1130 = fma(_1112, _1112, _1120);
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1134 = fma(_1124, _1124, _1130);
        float _1136 = sqrt(_1134);
        float _1138 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1140 = precise::min(_1136, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1142 = _1140 * _1132;
        float _1144 = _1138 * _1142;
        float _1146 = -_540;
        float _1148 = _1146 + _1070;
        float _1150 = fma(_1118, _1144, _422);
        float _1152 = fma(_1148, _1144, _540);
        float _1154 = fma(_1128, _1144, _582);
        _1100 = _1152;
        _1094 = _1150;
        _1104 = _1154;
    }
    float _1156 = _1100;
    float _1158 = _1094;
    float _1160 = _1104;
    if (!_982)
    {
        float _1162 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1164 = _1162 * 0.15915493667125701904296875;
        float _1166 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1170 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1168);
        float _1172 = _1164 * 6.283185482025146484375;
        float _1174 = cos(_1172);
        float _1176 = _1166 * 0.15915493667125701904296875;
        float _1178 = _1164 * 6.283185482025146484375;
        float _1180 = sin(_1178);
        float _1182 = 1.0 / _1174;
        float _1184 = _1176 * 6.283185482025146484375;
        float _1186 = cos(_1184);
        float _1188 = _1180 * _1182;
        float _1190 = _1176 * 6.283185482025146484375;
        float _1192 = sin(_1190);
        float _1194 = _1186 * _1188;
        float _1196 = 1.0 / _1170;
        float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1200 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1198;
        float _1202 = 1.0 / _1194;
        float _1204 = 1.0 / _1200;
        float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1208 = _1196 * _1206;
        float _1210 = _1192 * _1202;
        float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1214 = fma(_1210, _1208, _1212);
        float _1216 = _1214 * _1204;
        float _1218 = precise::clamp(_1216, 0.0, 1.0);
        _1084 = _1170;
        _1090 = _1218;
    }
    float _1220 = _1084;
    float _1222 = _1090;
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1226 = _1156 + _1224;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1230 = _1158 + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1234 = _1160 + _1232;
    float _1236 = _1226 * _1226;
    float _1238 = fma(_1230, _1230, _1236);
    float _1240 = fma(_1234, _1234, _1238);
    float _1242 = rsqrt(_1240);
    float _1244 = sqrt(_1240);
    float _1246 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1248 = _1230 * _1246;
    float _1250 = _1234 * _1246;
    float _1252 = _1248 * _1248;
    float _1254 = _1250 * _1250;
    float _1256 = _1252 + _1254;
    float _1258 = sqrt(_1256);
    bool _1260 = _1258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = _1258 + _1262;
    float _1266 = _1234;
    float _1268 = _1256;
    float _1270 = _1264;
    float _1272 = _1220;
    float _1274 = _1226;
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
    float _1284 = _1282;
    if (_1260)
    {
        float _1286 = _1264 * _1278;
        _1270 = _1286;
    }
    float _1288 = _1270;
    if (_1260)
    {
        float _1290 = _1288 * 0.15915493667125701904296875;
        _1272 = _1290;
    }
    float _1292 = _1272;
    float _1294 = _1278;
    float _1296 = _1292;
    if (_1260)
    {
        float _1298 = _1292 * 6.283185482025146484375;
        float _1300 = sin(_1298);
        _1294 = _1300;
    }
    float _1302 = _1294;
    float _1304 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1306 = precise::max(0.0, _1304);
    float _1308 = _1238;
    float _1310 = _1306;
    if (_1260)
    {
        float _1312 = _1292 * 6.283185482025146484375;
        float _1314 = cos(_1312);
        _1308 = _1314;
    }
    float _1316 = _1308;
    float _1318 = -_1246;
    float _1320 = -_1306;
    float _1322 = fma(_1226, _1318, _1320);
    if (_1260)
    {
        float _1324 = _1322 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1310 = _1324;
    }
    float _1326 = _1310;
    float _1328 = _1326;
    float _1330 = _1302;
    if (_1260)
    {
        float _1332 = fma(_1302, _1326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1328 = _1332;
    }
    float _1334 = _1328;
    float _1336 = _1334;
    if (!_1260)
    {
        _1330 = _1248;
    }
    float _1338 = _1330;
    float _1340 = _1338;
    float _1342 = _1316;
    if (_1260)
    {
        float _1344 = _1316 + (-1.0);
        _1274 = _1344;
    }
    float _1346 = _1274;
    float _1348 = _1346;
    if (_1260)
    {
        float _1350 = _1282 * _1334;
        _1086 = _1350;
    }
    float _1352 = _1086;
    if (!_1260)
    {
        _1336 = _1322;
    }
    float _1354 = _1336;
    float _1356 = _1354;
    if (_1260)
    {
        float _1358 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1296 = _1358;
    }
    float _1360 = _1296;
    if (_1260)
    {
        float _1362 = _1248 * _1352;
        _1340 = _1362;
    }
    float _1364 = _1340;
    if (!_1260)
    {
        _1348 = _1250;
    }
    float _1366 = _1348;
    float _1368 = _1366;
    if (_1260)
    {
        float _1370 = _1250 * _1352;
        _1368 = _1370;
    }
    float _1372 = _1368;
    if (!_1260)
    {
        _1284 = _1252;
    }
    float _1374 = _1284;
    float _1376 = _1374;
    if (_1260)
    {
        float _1378 = fma(_1322, _1316, _1360);
        _1356 = _1378;
    }
    float _1380 = _1356;
    if (_1260)
    {
        float _1382 = _1364 * _1364;
        _1376 = _1382;
    }
    float _1384 = _1376;
    if (!_1260)
    {
        _1342 = _1254;
    }
    float _1386 = _1342;
    float _1388 = _1386;
    if (_1260)
    {
        float _1390 = _1372 * _1372;
        _1388 = _1390;
    }
    float _1392 = _1388;
    float _1394 = fma(_1380, _1380, _1384);
    float _1396 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1398 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1400 = _1394 + _1392;
    float _1402 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1396);
    float _1404 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1408 = fma(_1244, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1406);
    float _1410 = precise::clamp(_1408, 0.0, 1.0);
    float _1412 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1414 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1402);
    float _1416 = rsqrt(_1400);
    float _1418 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1420 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1404);
    float _1422 = -_1410;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1412);
    float _1428 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1418);
    float _1430 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1432 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1434 = abs(_1424);
    float _1436 = log2(_1434);
    float _1438 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1428);
    float _1440 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1442 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1426);
    float _1444 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1446 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1448 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1450 = _1416 * _1364;
    float _1452 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1454 = _1416 * _1380;
    float _1456 = _1416 * _1372;
    float _1458 = -_1444;
    float _1460 = fma(_1458, _1398, 1.0);
    float _1462 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1452);
    float _1464 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1466 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1468 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1470 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1462);
    float _1472 = -_1464;
    float _1474 = fma(_1454, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1472);
    float _1476 = log2(_1460);
    float _1478 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1466);
    float _1480 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1470);
    float _1482 = -_1456;
    float _1484 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1474);
    float _1486 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1488 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1478);
    float _1490 = _1454 + 1.0;
    float _1492 = fma(_1484, -0.5, 0.5);
    float _1494 = exp2(_1468);
    float _1496 = fma(_1484, 0.5, 0.5);
    float _1498 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1486);
    float _1500 = fma(_1496, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1502 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1498);
    float _1504 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1488);
    float _1506 = 1.0 / _1480;
    float _1508 = fma(_1496, _1500, -0.212114393711090087890625);
    float _1510 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1502);
    float _1512 = _1476 * 0.693147182464599609375;
    float _1514 = fma(_1496, _1508, 1.570728778839111328125);
    float _1516 = _1512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1518 = sqrt(_1492);
    float _1520 = -_1454;
    float _1522 = fma(_1494, _1490, _1520);
    float _1524 = fma(_1522, 0.5, 0.5);
    float _1526 = _1510 * _1506;
    float _1528 = _1504 * _1506;
    float _1530 = fma(_1526, 0.5, 0.5);
    float _1532 = fma(_1528, -0.5, 0.5);
    float _1534 = _1518 * 0.636619746685028076171875;
    float3 _4558 = float3(_1530, _1532, _1516);
    float _1536 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4558, float3(0.0), isnan(_4558)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4558, float3(0.0), isnan(_4558)), level(0.0)).x;
    float _1538 = -_1514;
    float _1540 = fma(_1534, _1538, 1.0);
    float3 _4574 = float3(_1530, _1532, _1516);
    float4 _1543 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4574, float3(0.0), isnan(_4574)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4574, float3(0.0), isnan(_4574)), level(0.0)).xyzw;
    float _1545 = _1543.x;
    float _1547 = _1543.y;
    float _1549 = _1543.z;
    float _1551 = _1543.w;
    float2 _4591 = float2(_1540, _1524);
    float3 _1555 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4591, float2(0.0), isnan(_4591)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4591, float2(0.0), isnan(_4591)), level(0.0)).xyz;
    float _1557 = _1555.x;
    float _1559 = _1555.y;
    float _1561 = _1555.z;
    float _1563 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1565 = _774 * _824;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1569 = _1567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1571 = _358 > 0.5;
    float _1573 = exp2(_1563);
    int _1575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1577 = _1575 != 0;
    float _1579 = in.m_63.x;
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1587 = _1585 != 0;
    float _1589 = -_766;
    float _1591 = fma(_1589, _810, _1565);
    bool _1593 = _354 > 0.5;
    bool _1595 = _1593 && _1577;
    float _1597 = in.m_63.y;
    float _1599 = 1.0 / _1569;
    float _1601 = fma(_776, _680, _1591);
    bool _1603 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1605 = isnan(_312);
    bool _1607 = _1603 || _1605;
    bool _1609 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1611 = _1607 || _1609;
    float _1613 = float(_1611);
    bool _1615 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1617 = isnan(_312);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1623 = _1619 || _1621;
    float _1625 = float(_1623);
    float _1627 = 1.0 / _1583;
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1631 = _1629 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1633 = -_1613;
    float _1635 = _1633 + 1.0;
    bool _1637 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1639 = isnan(_312);
    bool _1641 = _1637 || _1639;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1645 = _1641 || _1643;
    float _1647 = float(_1645);
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1649;
    float _1653 = -_1625;
    float _1655 = _1653 + 1.0;
    float _1657 = _1625 * _1635;
    float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1661 = _1659 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1663 = _1651 * _1599;
    bool _1665 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1667 = isnan(_312);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1673 = _1669 || _1671;
    float _1675 = float(_1673);
    float _1677 = _1647 * _1655;
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1681 = _312 + _1679;
    float _1683 = -_1647;
    float _1685 = _1683 + 1.0;
    float _1687 = 1.0 / _1631;
    float _1689 = fma(_1663, _1681, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1691 = _1661 * _1627;
    float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1695 = _312 + _1693;
    float _1697 = _1675 * _1685;
    float _1699 = -_1675;
    float _1701 = _1699 + 1.0;
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1705 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1703;
    float _1707 = fma(_1691, _1695, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1709 = _1689 * _1697;
    float _1711 = _1695;
    float _1713 = _1579;
    float _1715 = _1480;
    float _1717 = _1504;
    float _1719 = _1510;
    if (_1577)
    {
        _1711 = _1579;
    }
    float _1721 = _1711;
    float _1723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1727 = _312 + _1725;
    float _1729 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1709);
    float _1731 = -_1597;
    float _1733 = _1731 + 1.0;
    float _1735 = _1721;
    float _1737 = _1597;
    if (_1595)
    {
        float _1739 = -_1721;
        float _1741 = _1739 + 1.0;
        _1735 = _1741;
    }
    float _1743 = _1735;
    float _1745 = _1705 * _1687;
    float _1747 = fma(_1707, _1677, _1729);
    float _1749 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1587)
    {
        float _1751 = _1571 ? _1733 : _1597;
        _1737 = _1751;
    }
    float _1753 = _1737;
    float _1755 = fma(_1745, _1727, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    if (_1577)
    {
        _1713 = _1743;
    }
    float _1757 = _1713;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1761 = _730 != 0.0;
    bool _1763 = isnan(_730);
    bool _1765 = _1761 || _1763;
    bool _1767 = isnan(0.0);
    bool _1769 = _1765 || _1767;
    float _1771 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1773 = fma(_1755, _1657, _1747);
    float _1775 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1777 = _1771 * _1723;
    float _1779 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1773);
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1783 = _678 == 0.0;
    bool _1785 = !_1769;
    bool _1787 = _1783 && _1785;
    float _1789 = _1775 * _1749;
    float _1791 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1793 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1795 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1799 = _1791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1801 = _774 * _840;
    float _1803 = _1797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1805 = _702 == 0.0;
    bool _1807 = _1805 && _1787;
    float _1809 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1813 = _1759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1799;
    out.m_65.y = _1803;
    out.m_65.z = _1795;
    out.m_65.w = _1793;
    float _1815 = _1809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1817 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1819 = _1779 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1821 = in.m_67.x;
    float _1823 = in.m_67.y;
    float _1825 = in.m_67.z;
    float _1827 = _784 * _840;
    float _1829 = _774 * _828;
    float _1831 = _800 * _828;
    out.m_69.x = _1813;
    out.m_69.y = _1815;
    out.m_69.z = _1817;
    out.m_69.w = _1819;
    float _1833 = _800 * _840;
    float _1835 = fma(_778, _808, _1827);
    float _1837 = _784 * _828;
    out.m_71.x = _1789;
    out.m_71.y = _1777;
    float _1839 = fma(_780, _808, _1833);
    float _1841 = -_766;
    float _1843 = fma(_1841, _808, _1801);
    float _1845 = _784 * _824;
    float _1847 = -_1573;
    float _1849 = _1847 + 1.0;
    float _1851 = _800 * _824;
    float _1853 = fma(_778, _810, _1845);
    float _1855 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1857 = fma(_780, _810, _1851);
    float _1859 = fma(_776, _662, _1843);
    float _1861 = -_766;
    float _1863 = fma(_1861, _806, _1829);
    float _1865 = fma(_780, _806, _1831);
    float _1867 = fma(_790, _662, _1835);
    float _1869 = fma(_778, _806, _1837);
    float _1871 = fma(_776, _672, _1863);
    float _1873 = _1823;
    float _1875 = _1821;
    float _1877 = _1825;
    if (!_1807)
    {
        float _1879 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1823);
        _1873 = _1879;
    }
    float _1881 = _1873;
    if (!_1807)
    {
        float _1883 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1821);
        _1875 = _1883;
    }
    float _1885 = _1875;
    float _1887 = fma(_786, _672, _1865);
    float _1889 = fma(_786, _662, _1839);
    float _1891 = _1859 * _1881;
    if (!_1807)
    {
        float _1893 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1825);
        _1877 = _1893;
    }
    float _1895 = _1877;
    float _1897 = _1871 * _1881;
    float _1899 = _1601 * _1881;
    float _1901 = fma(_1867, _1885, _1891);
    float _1903 = fma(_790, _672, _1869);
    float _1905 = fma(_790, _680, _1853);
    float _1907 = fma(_786, _680, _1857);
    float _1909 = fma(_1889, _1895, _1901);
    float _1911 = fma(_1903, _1885, _1897);
    float _1913 = fma(_1905, _1885, _1899);
    float _1915 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1917 = _1244 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1919 = isnan(_1244);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1925 = _1921 || _1923;
    float _1927 = fma(_1887, _1895, _1911);
    float _1929 = fma(_1907, _1895, _1913);
    float _1931 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1915);
    float _1933 = _1510 + _1480;
    float _1935 = _1480 * 0.5;
    out.m_73.x = _1927;
    out.m_73.y = _1909;
    out.m_73.z = _1929;
    float _1937 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1931);
    float _1939 = _1933 * 0.5;
    float _1941 = fma(_1504, -0.5, _1935);
    float _1943 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1937);
    float _1945 = _1943 + _1480;
    out.gl_Position.x = _1510;
    out.gl_Position.y = _1504;
    out.gl_Position.z = _1943;
    out.gl_Position.w = _1480;
    float _1947 = _1945 * 0.5;
    out.m_75.x = _1939;
    out.m_75.y = _1941;
    out.m_75.z = _1947;
    out.m_75.w = _1480;
    float _1949 = _1943;
    float _1951 = _1939;
    if (!_1925)
    {
        _1715 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1953 = _1715;
    float _1955 = _1953;
    float _1957 = _1953;
    if (!_1925)
    {
        _1949 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1959 = _1949;
    float _1961 = _1959;
    float _1963 = _1959;
    if (!_1925)
    {
        _1717 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1965 = _1717;
    float _1967 = _1965;
    float _1969 = _1965;
    if (!_1925)
    {
        _1719 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1971 = _1719;
    float _1973 = _1971;
    float _1975 = _1971;
    if (!_1925)
    {
        _1951 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1977 = _1951;
    float _1979 = _1855 * _1536;
    float _1981 = -_1855;
    float _1983 = _1981 + 1.0;
    float _1985 = _1551 * _1979;
    float _1987 = _1551 * _1983;
    float _1989 = _1561 * _1979;
    float _1991 = fma(_1557, _1985, _1545);
    float _1993 = fma(_1559, _1985, _1547);
    float _1995 = _1985;
    float _1997 = _1977;
    float _1999 = _1977;
    if (!_1925)
    {
        _1995 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2001 = _1995;
    float _2003 = fma(_1551, _1989, _1549);
    out.m_77.x = _1991;
    out.m_77.y = _1993;
    out.m_77.z = _2003;
    out.m_77.w = _1987;
    bool _2005 = !_1925;
    float _2007 = _2001;
    float _2009 = _2001;
    if (!_2005)
    {
        bool _2011 = _1244 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2013 = isnan(_1244);
        bool _2015 = _2011 || _2013;
        bool _2017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2019 = _2015 || _2017;
        if (!_2019)
        {
            float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2023 = _1244 + _2021;
            float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2027 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2025;
            float _2029 = 1.0 / _2027;
            float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2033 = _2031 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2037 = _2035 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2041 = _2039 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2045 = _2043 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2049 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2051 = _2023 * _2029;
            float _2053 = precise::clamp(_2051, 0.0, 1.0);
            float _2055 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2057 = _2055 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2059 = fma(_2053, _2033, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2061 = fma(_2053, _2057, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2063 = fma(_2053, _2037, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2065 = fma(_2053, _2041, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2067 = fma(_2053, _2045, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2069 = fma(_2053, _2049, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1999 = _2061;
            _1969 = _2067;
            _2009 = _2059;
            _1963 = _2065;
            _1957 = _2063;
            _1975 = _2069;
            _2071 = true;
        }
        else
        {
            bool _2073 = _1244 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2075 = isnan(_1244);
            bool _2077 = _2073 || _2075;
            bool _2079 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2081 = _2077 || _2079;
            if (!_2081)
            {
                _2007 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2083 = _2007;
            _2009 = _2083;
            if (!_2081)
            {
                _1997 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2085 = _1997;
            _1999 = _2085;
            if (!_2081)
            {
                _1955 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2087 = _1955;
            _1957 = _2087;
            if (!_2081)
            {
                _1961 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2089 = _1961;
            _1963 = _2089;
            if (!_2081)
            {
                _1967 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2091 = _1967;
            _1969 = _2091;
            if (!_2081)
            {
                _1973 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2093 = _1973;
            bool _2095 = !_2081;
            _1975 = _2093;
            if (!_2095)
            {
                bool _2097 = _1244 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2099 = isnan(_1244);
                bool _2101 = _2097 || _2099;
                bool _2103 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2105 = _2101 || _2103;
                if (!_2105)
                {
                    float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2109 = _1244 + _2107;
                    float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2113 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2111;
                    float _2115 = 1.0 / _2113;
                    float _2117 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2119 = _2117 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2123 = _2121 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2125 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2127 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2131 = _2129 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2133 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2135 = _2133 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2137 = _2109 * _2115;
                    float _2139 = precise::clamp(_2137, 0.0, 1.0);
                    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2143 = _2141 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2145 = fma(_2139, _2119, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2147 = fma(_2139, _2143, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2149 = fma(_2139, _2123, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2151 = fma(_2139, _2127, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2153 = fma(_2139, _2131, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2155 = fma(_2139, _2135, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1999 = _2147;
                    _1969 = _2153;
                    _2009 = _2145;
                    _1963 = _2151;
                    _1957 = _2149;
                    _1975 = _2155;
                    _2071 = true;
                }
                else
                {
                    _1999 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1969 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2009 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1963 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1957 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1975 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2071 = false;
    float _2157 = _1999;
    float _2159 = _1969;
    float _2161 = _2009;
    float _2163 = _1963;
    float _2165 = _1957;
    float _2167 = _1975;
    float _2169 = fma(_1909, -0.5, 0.5);
    float _2171 = precise::clamp(_2169, 0.0, 1.0);
    float _2173 = -_2157;
    float _2175 = _2173 + _2159;
    float _2177 = _1222 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2179 = -_2161;
    float _2181 = _2179 + _2163;
    float _2183 = fma(_2171, _2175, _2157);
    out.m_79.x = 0.0;
    float _2185 = -_2165;
    float _2187 = _2185 + _2167;
    float _2189 = fma(_2171, _2181, _2161);
    float _2191 = _2183 * 0.586610972881317138671875;
    out.m_47.x = _2177;
    bool _2193 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2195 = fma(_2171, _2187, _2165);
    float _2197 = fma(_2189, 0.298911988735198974609375, _2191);
    bool _2199 = _1222 > 0.0;
    bool _2201 = isnan(_1222);
    bool _2203 = _2199 || _2201;
    bool _2205 = isnan(0.0);
    bool _2207 = _2203 || _2205;
    float _2209 = fma(_2195, 0.114477999508380889892578125, _2197);
    float _2211 = -_2209;
    float _2213 = _2189 + _2211;
    float _2215 = -_2209;
    float _2217 = _2183 + _2215;
    float _2219 = -_2209;
    float _2221 = _2195 + _2219;
    float _2223 = fma(_2213, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    float _2225 = fma(_2217, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    float _2227 = fma(_2221, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    bool _2229 = !_2193;
    if (!_2229)
    {
        float _2231 = -_1156;
        float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2235 = -_1158;
        float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2239 = -_1160;
        float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2243 = _2233 * _2233;
        float _2245 = fma(_2237, _2237, _2243);
        float _2247 = fma(_2241, _2241, _2245);
        float _2249 = sqrt(_2247);
        float _2251 = rsqrt(_2247);
        float _2253 = -_2249;
        float _2255 = _2253 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2257 = _2255 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2259 = precise::clamp(_2257, 0.0, 1.0);
        float _2261 = _2237 * _2251;
        float _2263 = _2233 * _2251;
        float _2265 = abs(_2259);
        float _2267 = log2(_2265);
        float _2269 = _2241 * _2251;
        float _2271 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2273 = _1909 * _2263;
        float _2275 = -_2263;
        float _2277 = -_2271;
        float _2279 = fma(_2275, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2277);
        float _2281 = fma(_1927, _2261, _2273);
        float _2283 = -_2269;
        float _2285 = fma(_2283, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2279);
        float _2287 = fma(_1929, _2269, _2281);
        float _2289 = precise::clamp(_2287, 0.0, 1.0);
        float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2293 = _2285 + _2291;
        float _2295 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2297 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2299 = precise::clamp(_2297, 0.0, 1.0);
        float _2301 = exp2(_2295);
        float _2303 = _2301 * _2299;
        float _2305 = _2289 * _2303;
        float _2307 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2309 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2311 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _2307;
        out.m_79.y = _2309;
        out.m_79.z = _2311;
    }
    out.m_81.x = _2223;
    out.m_81.y = _2225;
    out.m_81.z = _2227;
    if (_2207)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2313 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2313;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2071 = false;
    bool _310 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2371 = as_type<float>(_116);
        out.gl_Position.z = _2371;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_49.w;
    float _122 = float(_100);
    float _124 = -_120;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_120);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    bool _138 = _126 >= _122;
    bool _140 = !_136;
    bool _142 = _138 || _140;
    float _144 = _126;
    if (_142)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _108;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _118 = as_type<int>(_148);
    }
    int _150 = _118;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2435 = as_type<float>(_150);
        out.gl_Position.z = _2435;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_51.x;
    float _154 = in.m_51.y;
    float _156 = in.m_51.z;
    float _158 = 1.0 / _122;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _162 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _164 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _166 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _168 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _162);
    float _170 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _164);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _166);
    float _174 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _168);
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _170);
    float _178 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _172);
    float _180 = _126 * _158;
    bool _182 = !_160;
    float _200;
    if (!_182)
    {
        float _184 = in.m_53.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        _200 = _180;
    }
    _202 = false;
    float _204 = _200;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _204 + _206;
    bool _210 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = 1.0 / _224;
    float _230 = -_220;
    float _232 = _230 + 1.0;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _234;
    float _238 = _208 * _228;
    bool _240 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _242 = isnan(_204);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _252;
    float _256 = fma(_236, _238, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _258;
    float _262 = _250 * _232;
    float _264 = fma(_254, _238, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = fma(_260, _238, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = -_250;
    float _270 = _268 + 1.0;
    float _272 = _256 * _262;
    float _274 = _264 * _262;
    float _276 = _266 * _262;
    float _278 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].x, _274);
    float _280 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].y, _276);
    float _282 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].z, _272);
    float _284 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].x, _278);
    float _286 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].y, _280);
    float _288 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].z, _282);
    bool _290 = !_226;
    float _308;
    if (!_290)
    {
        float _292 = in.m_53.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        _308 = _180;
    }
    _310 = false;
    float _312 = _308;
    float _314 = in.m_53.z;
    float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _318 = log2(_316);
    float _320 = in.m_55.x;
    float _322 = in.m_55.y;
    float _324 = in.m_55.z;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _332 = _330 != 0;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _336 = _334 != 0;
    float _338 = in.m_44.x;
    float _340 = in.m_44.y;
    float _342 = in.m_44.z;
    float _344 = abs(_180);
    float _346 = log2(_344);
    float _348 = in.m_57.x;
    float _350 = in.m_57.y;
    float _352 = in.m_57.z;
    float _354 = in.m_53.x;
    float _356 = _318 * _126;
    float _358 = in.m_53.y;
    float _360 = _314 * 2.0;
    float _362 = exp2(_356);
    float _364 = fma(_320, 2.0, -1.0);
    float _366 = fma(_322, 2.0, -1.0);
    float _368 = fma(_324, 2.0, -1.0);
    float _370 = _340 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _372 = floor(_360);
    float _374 = _340 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _376 = _340 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _378 = _288 * _352;
    float _380 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[5].x, _370);
    float _382 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[4].x, _374);
    float _384 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[6].x, _376);
    float _386 = _354 * 2.0;
    float _388 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].z, _380);
    float _390 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].z, _382);
    float _392 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].z, _384);
    float _394 = _358 * 2.0;
    float _396 = floor(_386);
    float _398 = _358 + _314;
    bool _400 = !_332;
    int _402 = _400 ? 0 : 1;
    float _404 = -_362;
    float _406 = _404 + 1.0;
    bool _408 = _372 > 0.0;
    float _410 = _398 + (-1.0);
    bool _412 = _372 >= 0.0;
    bool _414 = isnan(_372);
    bool _416 = _412 || _414;
    bool _418 = isnan(0.0);
    bool _420 = _416 || _418;
    float _422 = _390 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _424 = floor(_394);
    float _426 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _428 = _420 ? 0 : 1;
    float _430 = _354 + _358;
    float _432 = _286 * _350;
    int _434 = ~_428;
    int _436 = _434 + 1;
    int _438 = _436 + 1;
    float _440 = _430 + (-1.0);
    bool _442 = _396 > 0.0;
    float _444 = _354 + _314;
    int _446 = _438;
    if (!_408)
    {
        int _448 = ~_428;
        int _450 = _448 + 1;
        _446 = _450;
    }
    int _452 = _446;
    float _454 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _456 = _396 >= 0.0;
    bool _458 = isnan(_396);
    bool _460 = _456 || _458;
    bool _462 = isnan(0.0);
    bool _464 = _460 || _462;
    float _466 = _444 + (-1.0);
    bool _468 = !_328;
    int _470 = _468 ? 0 : 1;
    float _472 = _314 + (-0.5);
    bool _474 = _424 > 0.0;
    float _476 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _478 = _424 >= 0.0;
    bool _480 = isnan(_424);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _490 = in.m_59.x;
    float _492 = in.m_59.y;
    float _494 = in.m_59.z;
    int _496 = abs(_470);
    float _498 = float(_452);
    float _500 = float(_496);
    int _502 = _464 ? 0 : 1;
    float _504 = _500 * _498;
    int _506 = _486 ? 0 : 1;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _510 = 1.0 + _508;
    int _512 = ~_502;
    int _514 = _512 + 1;
    int _516 = _514 + 1;
    float _518 = _504 * (-2.0);
    int _520 = _516;
    if (!_442)
    {
        int _522 = ~_502;
        int _524 = _522 + 1;
        _520 = _524;
    }
    int _526 = _520;
    float _528 = 1.0 / _510;
    int _530 = abs(_402);
    float _532 = fma(_454, _518, _454);
    int _534 = ~_506;
    int _536 = _534 + 1;
    int _538 = _536 + 1;
    float _540 = _388 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _542 = _538;
    if (!_474)
    {
        int _544 = ~_506;
        int _546 = _544 + 1;
        _542 = _546;
    }
    int _548 = _542;
    bool _550 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(1.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    float _560 = fma(_518, _490, _490);
    float _562 = _354 + (-0.5);
    bool _564 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _566 = isnan(0.0);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _572 = _568 || _570;
    float _574 = -_540;
    float _576 = _574 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _578 = _346 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _580 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[196].x, _560);
    float _582 = _392 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _584 = float(_526);
    float _586 = _576 * _576;
    float _588 = float(_530);
    float _590 = -_422;
    float _592 = _590 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _594 = _572 ? _406 : 0.0;
    float _596 = exp2(_578);
    bool _598 = !_336;
    int _600 = _598 ? 0 : 1;
    float _602 = _588 * _584;
    if (_558)
    {
        float _604 = _594 * _528;
        _144 = _604;
    }
    float _606 = _144;
    float _608 = -_582;
    float _610 = _608 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _612 = fma(_592, _592, _586);
    int _614 = abs(_600);
    float _616 = _602 * (-2.0);
    float _618 = fma(_532, _606, _580);
    float _620 = in.m_61.x;
    float _622 = in.m_61.y;
    float _624 = in.m_61.z;
    float _626 = fma(_610, _610, _612);
    float _628 = fma(_426, _616, _426);
    float _630 = fma(_616, _492, _492);
    float _632 = _358 + (-0.5);
    float _634 = _618 * 0.15915493667125701904296875;
    float _636 = float(_614);
    float _638 = rsqrt(_626);
    float _640 = float(_548);
    float _642 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[196].y, _630);
    float _644 = _636 * _640;
    float _646 = fma(_628, _606, _642);
    float _648 = _634 * 6.283185482025146484375;
    float _650 = cos(_648);
    float _652 = _644 * (-2.0);
    float _654 = _284 * _348;
    float _656 = _646 * 0.15915493667125701904296875;
    float _658 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _660 = fma(_652, _494, _494);
    float _662 = _576 * _638;
    float _664 = -_620;
    float _666 = _364 + _664;
    float _668 = -_622;
    float _670 = _366 + _668;
    float _672 = _592 * _638;
    float _674 = fma(_658, _652, _658);
    float _676 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[196].z, _660);
    float _678 = fma(_596, _666, _620);
    float _680 = _610 * _638;
    float _682 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _684 = _672 * _682;
    float _686 = -_624;
    float _688 = _368 + _686;
    float _690 = fma(_674, _606, _676);
    float _692 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _694 = _680 * _692;
    float _696 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _698 = -_684;
    float _700 = fma(_680, _696, _698);
    float _702 = fma(_596, _688, _624);
    float _704 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _706 = _662 * _704;
    float _708 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _710 = -_694;
    float _712 = fma(_662, _708, _710);
    float _714 = _700 * _700;
    float _716 = _690 * 0.15915493667125701904296875;
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _720 = -_706;
    float _722 = fma(_672, _718, _720);
    float _724 = _656 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = fma(_712, _712, _714);
    float _730 = fma(_596, _670, _622);
    float _732 = _654 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _734 = fma(_722, _722, _728);
    float _736 = _656 * 6.283185482025146484375;
    float _738 = cos(_736);
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _730);
    float _742 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _678);
    float _744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _702);
    float _746 = _732 * _742;
    float _748 = _488 * _744;
    float _750 = _634 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = _476 * _740;
    float _756 = _650 * _726;
    float _758 = _716 * 6.283185482025146484375;
    float _760 = cos(_758);
    float _762 = _650 * _738;
    float _764 = _716 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = _752 * _726;
    float _770 = _752 * _738;
    float _772 = rsqrt(_734);
    float _774 = _650 * _760;
    float _776 = _752 * _760;
    float _778 = _738 * _760;
    float _780 = _726 * _760;
    float _782 = _774 * _754;
    float _784 = fma(_766, _762, _768);
    float _786 = fma(_766, _768, _762);
    float _788 = -_756;
    float _790 = fma(_766, _770, _788);
    float _792 = -_754;
    float _794 = _766 * _792;
    float _796 = fma(_784, _746, _782);
    float _798 = -_770;
    float _800 = fma(_766, _756, _798);
    float _802 = _776 * _754;
    float _804 = fma(_778, _746, _794);
    float _806 = _712 * _772;
    float _808 = _700 * _772;
    float _810 = _722 * _772;
    float _812 = fma(_800, _748, _796);
    float _814 = _662 * _806;
    float _816 = _680 * _808;
    float _818 = fma(_790, _746, _802);
    float _820 = fma(_780, _748, _804);
    float _822 = -_814;
    float _824 = fma(_672, _808, _822);
    float _826 = -_816;
    float _828 = fma(_662, _810, _826);
    float _830 = fma(_786, _748, _818);
    float _832 = _672 * _810;
    float _834 = _824 * _812;
    float _836 = _828 * _812;
    float _838 = -_832;
    float _840 = fma(_680, _806, _838);
    float _842 = fma(_810, _820, _834);
    float _844 = fma(_806, _820, _836);
    float _846 = fma(_680, _830, _842);
    float _848 = fma(_672, _830, _844);
    float _850 = _582 + _846;
    float _852 = _422 + _848;
    float _854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _856 = _850 + _854;
    float _858 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _860 = _852 + _858;
    float _862 = _856 * _856;
    float _864 = fma(_860, _860, _862);
    float _866 = _840 * _812;
    float _868 = sqrt(_864);
    float _870 = fma(_808, _820, _866);
    float _872 = fma(_662, _830, _870);
    float _874 = _540 + _872;
    bool _876 = _868 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _878 = _830;
    float _880 = _852;
    float _882 = _866;
    float _884 = _864;
    float _886 = _634;
    if (!_876)
    {
        _878 = _852;
    }
    float _888 = _878;
    float _890 = _888;
    if (!_876)
    {
        _880 = _850;
    }
    float _892 = _880;
    float _894 = _892;
    if (!_876)
    {
        _882 = _874;
    }
    float _896 = _882;
    bool _898 = !_876;
    float _900 = _896;
    if (!_898)
    {
        float _902 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _904 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _906 = _868 + _904;
        float _908 = _874 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _910 = rsqrt(_864);
        float _912 = _906 * _902;
        float _914 = _912 * 0.15915493667125701904296875;
        float _916 = _914 * 6.283185482025146484375;
        float _918 = cos(_916);
        float _920 = _914 * 6.283185482025146484375;
        float _922 = sin(_920);
        float _924 = _918 + (-1.0);
        float _926 = fma(_922, _908, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _928 = _924 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _930 = _910 * _926;
        float _932 = fma(_874, _918, _928);
        float _934 = fma(_860, _930, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _936 = fma(_856, _930, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _900 = _932;
        _890 = _934;
        _894 = _936;
    }
    float _938 = _900;
    float _940 = _890;
    float _942 = _894;
    float _944 = -_540;
    float _946 = _944 + _938;
    float _948 = -_422;
    float _950 = _948 + _940;
    float _952 = -_582;
    float _954 = _952 + _942;
    float _956 = _540 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _958 = _946 * _946;
    bool _960 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _962 = isnan(0.5);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _968 = _964 || _966;
    float _970 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[11].x, _956);
    float _972 = fma(_950, _950, _958);
    bool _974 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _976 = isnan(0.5);
    bool _978 = _974 || _976;
    bool _980 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _982 = _978 || _980;
    float _984 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[11].z, _970);
    float _986 = fma(_954, _954, _972);
    float _988 = _540 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _990 = _984 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _992 = sqrt(_986);
    float _994 = fma(_422, (*spvDescriptorSet0.vp_c8)._m0[10].x, _988);
    float _996 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[10].z, _994);
    float _998 = 1.0 / _990;
    float _1000 = _996 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1002 = _1000 + _990;
    bool _1004 = _992 > 0.0;
    float _1006 = _1002 * _998;
    float _1008 = _1006 * 0.5;
    bool _1010 = !_1004;
    float _1012 = _940;
    float _1014 = _938;
    float _1016 = _942;
    float _1018 = _990;
    float _1020 = _992;
    if (!_1010)
    {
        float _1022 = _176 * _176;
        float _1024 = fma(_174, _174, _1022);
        float _1026 = fma(_178, _178, _1024);
        float _1028 = rsqrt(_986);
        float _1030 = sqrt(_1026);
        float _1032 = _950 * _1028;
        float _1034 = _946 * _1028;
        float _1036 = _954 * _1028;
        bool _1038 = _1030 > 0.0;
        bool _1040 = !_1038;
        _884 = _1036;
        _1018 = _1026;
        _1020 = _1034;
        if (!_1040)
        {
            float _1042 = rsqrt(_1026);
            float _1044 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1046 = _176 * _1042;
            float _1048 = _174 * _1042;
            float _1050 = _178 * _1042;
            float _1052 = _1034 * _1046;
            float _1054 = fma(_1032, _1048, _1052);
            float _1056 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1058 = fma(_1036, _1050, _1054);
            float _1060 = _1058 * _1056;
            float _1062 = fma(_174, _1060, _940);
            float _1064 = fma(_176, _1060, _938);
            float _1066 = fma(_178, _1060, _942);
            _1012 = _1062;
            _1014 = _1064;
            _1016 = _1066;
        }
    }
    float _1068 = _1012;
    float _1070 = _1014;
    float _1072 = _1016;
    float _1074 = _884;
    float _1076 = _1018;
    float _1078 = _1020;
    float _1080 = _1078;
    float _1082 = _1074;
    float _1084 = _1068;
    float _1086 = _1076;
    if (_982)
    {
        _1080 = 1.0;
    }
    float _1088 = _1080;
    float _1090 = _1088;
    if (_968)
    {
        _1082 = _1068;
    }
    float _1092 = _1082;
    float _1094 = _1092;
    if (_968)
    {
        _886 = _1070;
    }
    float _1096 = _886;
    float _1098 = 0.0;
    float _1100 = _1096;
    if (_968)
    {
        _1098 = _1072;
    }
    float _1102 = _1098;
    float _1104 = _1102;
    if (!_968)
    {
        float _1106 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1108 = _540 + _1106;
        float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1112 = _422 + _1110;
        float _1114 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1116 = -_422;
        float _1118 = _1116 + _1068;
        float _1120 = _1108 * _1108;
        float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1124 = _582 + _1122;
        float _1126 = -_582;
        float _1128 = _1126 + _1072;
        float _1130 = fma(_1112, _1112, _1120);
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1134 = fma(_1124, _1124, _1130);
        float _1136 = sqrt(_1134);
        float _1138 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1140 = precise::min(_1136, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1142 = _1140 * _1132;
        float _1144 = _1138 * _1142;
        float _1146 = -_540;
        float _1148 = _1146 + _1070;
        float _1150 = fma(_1118, _1144, _422);
        float _1152 = fma(_1148, _1144, _540);
        float _1154 = fma(_1128, _1144, _582);
        _1100 = _1152;
        _1094 = _1150;
        _1104 = _1154;
    }
    float _1156 = _1100;
    float _1158 = _1094;
    float _1160 = _1104;
    if (!_982)
    {
        float _1162 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1164 = _1162 * 0.15915493667125701904296875;
        float _1166 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1170 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1168);
        float _1172 = _1164 * 6.283185482025146484375;
        float _1174 = cos(_1172);
        float _1176 = _1166 * 0.15915493667125701904296875;
        float _1178 = _1164 * 6.283185482025146484375;
        float _1180 = sin(_1178);
        float _1182 = 1.0 / _1174;
        float _1184 = _1176 * 6.283185482025146484375;
        float _1186 = cos(_1184);
        float _1188 = _1180 * _1182;
        float _1190 = _1176 * 6.283185482025146484375;
        float _1192 = sin(_1190);
        float _1194 = _1186 * _1188;
        float _1196 = 1.0 / _1170;
        float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1200 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1198;
        float _1202 = 1.0 / _1194;
        float _1204 = 1.0 / _1200;
        float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1208 = _1196 * _1206;
        float _1210 = _1192 * _1202;
        float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1214 = fma(_1210, _1208, _1212);
        float _1216 = _1214 * _1204;
        float _1218 = precise::clamp(_1216, 0.0, 1.0);
        _1084 = _1170;
        _1090 = _1218;
    }
    float _1220 = _1084;
    float _1222 = _1090;
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1226 = _1156 + _1224;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1230 = _1158 + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1234 = _1160 + _1232;
    float _1236 = _1226 * _1226;
    float _1238 = fma(_1230, _1230, _1236);
    float _1240 = fma(_1234, _1234, _1238);
    float _1242 = rsqrt(_1240);
    float _1244 = sqrt(_1240);
    float _1246 = _1242 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1248 = _1230 * _1246;
    float _1250 = _1234 * _1246;
    float _1252 = _1248 * _1248;
    float _1254 = _1250 * _1250;
    float _1256 = _1252 + _1254;
    float _1258 = sqrt(_1256);
    bool _1260 = _1258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = _1258 + _1262;
    float _1266 = _1234;
    float _1268 = _1256;
    float _1270 = _1264;
    float _1272 = _1220;
    float _1274 = _1226;
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
    float _1284 = _1282;
    if (_1260)
    {
        float _1286 = _1264 * _1278;
        _1270 = _1286;
    }
    float _1288 = _1270;
    if (_1260)
    {
        float _1290 = _1288 * 0.15915493667125701904296875;
        _1272 = _1290;
    }
    float _1292 = _1272;
    float _1294 = _1278;
    float _1296 = _1292;
    if (_1260)
    {
        float _1298 = _1292 * 6.283185482025146484375;
        float _1300 = sin(_1298);
        _1294 = _1300;
    }
    float _1302 = _1294;
    float _1304 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1306 = precise::max(0.0, _1304);
    float _1308 = _1238;
    float _1310 = _1306;
    if (_1260)
    {
        float _1312 = _1292 * 6.283185482025146484375;
        float _1314 = cos(_1312);
        _1308 = _1314;
    }
    float _1316 = _1308;
    float _1318 = -_1246;
    float _1320 = -_1306;
    float _1322 = fma(_1226, _1318, _1320);
    if (_1260)
    {
        float _1324 = _1322 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1310 = _1324;
    }
    float _1326 = _1310;
    float _1328 = _1326;
    float _1330 = _1302;
    if (_1260)
    {
        float _1332 = fma(_1302, _1326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1328 = _1332;
    }
    float _1334 = _1328;
    float _1336 = _1334;
    if (!_1260)
    {
        _1330 = _1248;
    }
    float _1338 = _1330;
    float _1340 = _1338;
    float _1342 = _1316;
    if (_1260)
    {
        float _1344 = _1316 + (-1.0);
        _1274 = _1344;
    }
    float _1346 = _1274;
    float _1348 = _1346;
    if (_1260)
    {
        float _1350 = _1282 * _1334;
        _1086 = _1350;
    }
    float _1352 = _1086;
    if (!_1260)
    {
        _1336 = _1322;
    }
    float _1354 = _1336;
    float _1356 = _1354;
    if (_1260)
    {
        float _1358 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1296 = _1358;
    }
    float _1360 = _1296;
    if (_1260)
    {
        float _1362 = _1248 * _1352;
        _1340 = _1362;
    }
    float _1364 = _1340;
    if (!_1260)
    {
        _1348 = _1250;
    }
    float _1366 = _1348;
    float _1368 = _1366;
    if (_1260)
    {
        float _1370 = _1250 * _1352;
        _1368 = _1370;
    }
    float _1372 = _1368;
    if (!_1260)
    {
        _1284 = _1252;
    }
    float _1374 = _1284;
    float _1376 = _1374;
    if (_1260)
    {
        float _1378 = fma(_1322, _1316, _1360);
        _1356 = _1378;
    }
    float _1380 = _1356;
    if (_1260)
    {
        float _1382 = _1364 * _1364;
        _1376 = _1382;
    }
    float _1384 = _1376;
    if (!_1260)
    {
        _1342 = _1254;
    }
    float _1386 = _1342;
    float _1388 = _1386;
    if (_1260)
    {
        float _1390 = _1372 * _1372;
        _1388 = _1390;
    }
    float _1392 = _1388;
    float _1394 = fma(_1380, _1380, _1384);
    float _1396 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1398 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1400 = _1394 + _1392;
    float _1402 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1396);
    float _1404 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1408 = fma(_1244, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1406);
    float _1410 = precise::clamp(_1408, 0.0, 1.0);
    float _1412 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1414 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1402);
    float _1416 = rsqrt(_1400);
    float _1418 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1420 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1404);
    float _1422 = -_1410;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1412);
    float _1428 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1418);
    float _1430 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1432 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1434 = abs(_1424);
    float _1436 = log2(_1434);
    float _1438 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1428);
    float _1440 = _1430 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1442 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1426);
    float _1444 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1446 = _1438 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1448 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1450 = _1416 * _1364;
    float _1452 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1454 = _1416 * _1380;
    float _1456 = _1416 * _1372;
    float _1458 = -_1444;
    float _1460 = fma(_1458, _1398, 1.0);
    float _1462 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1452);
    float _1464 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1466 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1468 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1470 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1462);
    float _1472 = -_1464;
    float _1474 = fma(_1454, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1472);
    float _1476 = log2(_1460);
    float _1478 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1466);
    float _1480 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1470);
    float _1482 = -_1456;
    float _1484 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1474);
    float _1486 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1488 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1478);
    float _1490 = _1454 + 1.0;
    float _1492 = fma(_1484, -0.5, 0.5);
    float _1494 = exp2(_1468);
    float _1496 = fma(_1484, 0.5, 0.5);
    float _1498 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1486);
    float _1500 = fma(_1496, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1502 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1498);
    float _1504 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1488);
    float _1506 = 1.0 / _1480;
    float _1508 = fma(_1496, _1500, -0.212114393711090087890625);
    float _1510 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1502);
    float _1512 = _1476 * 0.693147182464599609375;
    float _1514 = fma(_1496, _1508, 1.570728778839111328125);
    float _1516 = _1512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1518 = sqrt(_1492);
    float _1520 = -_1454;
    float _1522 = fma(_1494, _1490, _1520);
    float _1524 = fma(_1522, 0.5, 0.5);
    float _1526 = _1510 * _1506;
    float _1528 = _1504 * _1506;
    float _1530 = fma(_1526, 0.5, 0.5);
    float _1532 = fma(_1528, -0.5, 0.5);
    float _1534 = _1518 * 0.636619746685028076171875;
    float3 _4558 = float3(_1530, _1532, _1516);
    float _1536 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4558, float3(0.0), isnan(_4558)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4558, float3(0.0), isnan(_4558)), level(0.0)).x;
    float _1538 = -_1514;
    float _1540 = fma(_1534, _1538, 1.0);
    float3 _4574 = float3(_1530, _1532, _1516);
    float4 _1543 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4574, float3(0.0), isnan(_4574)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4574, float3(0.0), isnan(_4574)), level(0.0)).xyzw;
    float _1545 = _1543.x;
    float _1547 = _1543.y;
    float _1549 = _1543.z;
    float _1551 = _1543.w;
    float2 _4591 = float2(_1540, _1524);
    float3 _1555 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4591, float2(0.0), isnan(_4591)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4591, float2(0.0), isnan(_4591)), level(0.0)).xyz;
    float _1557 = _1555.x;
    float _1559 = _1555.y;
    float _1561 = _1555.z;
    float _1563 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1565 = _774 * _824;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1569 = _1567 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1571 = _358 > 0.5;
    float _1573 = exp2(_1563);
    int _1575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1577 = _1575 != 0;
    float _1579 = in.m_63.x;
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1587 = _1585 != 0;
    float _1589 = -_766;
    float _1591 = fma(_1589, _810, _1565);
    bool _1593 = _354 > 0.5;
    bool _1595 = _1593 && _1577;
    float _1597 = in.m_63.y;
    float _1599 = 1.0 / _1569;
    float _1601 = fma(_776, _680, _1591);
    bool _1603 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1605 = isnan(_312);
    bool _1607 = _1603 || _1605;
    bool _1609 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1611 = _1607 || _1609;
    float _1613 = float(_1611);
    bool _1615 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1617 = isnan(_312);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1623 = _1619 || _1621;
    float _1625 = float(_1623);
    float _1627 = 1.0 / _1583;
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1631 = _1629 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1633 = -_1613;
    float _1635 = _1633 + 1.0;
    bool _1637 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1639 = isnan(_312);
    bool _1641 = _1637 || _1639;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1645 = _1641 || _1643;
    float _1647 = float(_1645);
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1649;
    float _1653 = -_1625;
    float _1655 = _1653 + 1.0;
    float _1657 = _1625 * _1635;
    float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1661 = _1659 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1663 = _1651 * _1599;
    bool _1665 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1667 = isnan(_312);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1673 = _1669 || _1671;
    float _1675 = float(_1673);
    float _1677 = _1647 * _1655;
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1681 = _312 + _1679;
    float _1683 = -_1647;
    float _1685 = _1683 + 1.0;
    float _1687 = 1.0 / _1631;
    float _1689 = fma(_1663, _1681, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1691 = _1661 * _1627;
    float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1695 = _312 + _1693;
    float _1697 = _1675 * _1685;
    float _1699 = -_1675;
    float _1701 = _1699 + 1.0;
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1705 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1703;
    float _1707 = fma(_1691, _1695, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1709 = _1689 * _1697;
    float _1711 = _1695;
    float _1713 = _1579;
    float _1715 = _1480;
    float _1717 = _1504;
    float _1719 = _1510;
    if (_1577)
    {
        _1711 = _1579;
    }
    float _1721 = _1711;
    float _1723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1725 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1727 = _312 + _1725;
    float _1729 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1709);
    float _1731 = -_1597;
    float _1733 = _1731 + 1.0;
    float _1735 = _1721;
    float _1737 = _1597;
    if (_1595)
    {
        float _1739 = -_1721;
        float _1741 = _1739 + 1.0;
        _1735 = _1741;
    }
    float _1743 = _1735;
    float _1745 = _1705 * _1687;
    float _1747 = fma(_1707, _1677, _1729);
    float _1749 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1587)
    {
        float _1751 = _1571 ? _1733 : _1597;
        _1737 = _1751;
    }
    float _1753 = _1737;
    float _1755 = fma(_1745, _1727, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    if (_1577)
    {
        _1713 = _1743;
    }
    float _1757 = _1713;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1761 = _730 != 0.0;
    bool _1763 = isnan(_730);
    bool _1765 = _1761 || _1763;
    bool _1767 = isnan(0.0);
    bool _1769 = _1765 || _1767;
    float _1771 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1773 = fma(_1755, _1657, _1747);
    float _1775 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1777 = _1771 * _1723;
    float _1779 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1773);
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1783 = _678 == 0.0;
    bool _1785 = !_1769;
    bool _1787 = _1783 && _1785;
    float _1789 = _1775 * _1749;
    float _1791 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1793 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1795 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1799 = _1791 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1801 = _774 * _840;
    float _1803 = _1797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1805 = _702 == 0.0;
    bool _1807 = _1805 && _1787;
    float _1809 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1813 = _1759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1799;
    out.m_65.y = _1803;
    out.m_65.z = _1795;
    out.m_65.w = _1793;
    float _1815 = _1809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1817 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1819 = _1779 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1821 = in.m_67.x;
    float _1823 = in.m_67.y;
    float _1825 = in.m_67.z;
    float _1827 = _784 * _840;
    float _1829 = _774 * _828;
    float _1831 = _800 * _828;
    out.m_69.x = _1813;
    out.m_69.y = _1815;
    out.m_69.z = _1817;
    out.m_69.w = _1819;
    float _1833 = _800 * _840;
    float _1835 = fma(_778, _808, _1827);
    float _1837 = _784 * _828;
    out.m_71.x = _1789;
    out.m_71.y = _1777;
    float _1839 = fma(_780, _808, _1833);
    float _1841 = -_766;
    float _1843 = fma(_1841, _808, _1801);
    float _1845 = _784 * _824;
    float _1847 = -_1573;
    float _1849 = _1847 + 1.0;
    float _1851 = _800 * _824;
    float _1853 = fma(_778, _810, _1845);
    float _1855 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1857 = fma(_780, _810, _1851);
    float _1859 = fma(_776, _662, _1843);
    float _1861 = -_766;
    float _1863 = fma(_1861, _806, _1829);
    float _1865 = fma(_780, _806, _1831);
    float _1867 = fma(_790, _662, _1835);
    float _1869 = fma(_778, _806, _1837);
    float _1871 = fma(_776, _672, _1863);
    float _1873 = _1823;
    float _1875 = _1821;
    float _1877 = _1825;
    if (!_1807)
    {
        float _1879 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1823);
        _1873 = _1879;
    }
    float _1881 = _1873;
    if (!_1807)
    {
        float _1883 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1821);
        _1875 = _1883;
    }
    float _1885 = _1875;
    float _1887 = fma(_786, _672, _1865);
    float _1889 = fma(_786, _662, _1839);
    float _1891 = _1859 * _1881;
    if (!_1807)
    {
        float _1893 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1825);
        _1877 = _1893;
    }
    float _1895 = _1877;
    float _1897 = _1871 * _1881;
    float _1899 = _1601 * _1881;
    float _1901 = fma(_1867, _1885, _1891);
    float _1903 = fma(_790, _672, _1869);
    float _1905 = fma(_790, _680, _1853);
    float _1907 = fma(_786, _680, _1857);
    float _1909 = fma(_1889, _1895, _1901);
    float _1911 = fma(_1903, _1885, _1897);
    float _1913 = fma(_1905, _1885, _1899);
    float _1915 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1917 = _1244 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1919 = isnan(_1244);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1925 = _1921 || _1923;
    float _1927 = fma(_1887, _1895, _1911);
    float _1929 = fma(_1907, _1895, _1913);
    float _1931 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1915);
    float _1933 = _1510 + _1480;
    float _1935 = _1480 * 0.5;
    out.m_73.x = _1927;
    out.m_73.y = _1909;
    out.m_73.z = _1929;
    float _1937 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1931);
    float _1939 = _1933 * 0.5;
    float _1941 = fma(_1504, -0.5, _1935);
    float _1943 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1937);
    float _1945 = _1943 + _1480;
    out.gl_Position.x = _1510;
    out.gl_Position.y = _1504;
    out.gl_Position.z = _1943;
    out.gl_Position.w = _1480;
    float _1947 = _1945 * 0.5;
    out.m_75.x = _1939;
    out.m_75.y = _1941;
    out.m_75.z = _1947;
    out.m_75.w = _1480;
    float _1949 = _1943;
    float _1951 = _1939;
    if (!_1925)
    {
        _1715 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1953 = _1715;
    float _1955 = _1953;
    float _1957 = _1953;
    if (!_1925)
    {
        _1949 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1959 = _1949;
    float _1961 = _1959;
    float _1963 = _1959;
    if (!_1925)
    {
        _1717 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1965 = _1717;
    float _1967 = _1965;
    float _1969 = _1965;
    if (!_1925)
    {
        _1719 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1971 = _1719;
    float _1973 = _1971;
    float _1975 = _1971;
    if (!_1925)
    {
        _1951 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1977 = _1951;
    float _1979 = _1855 * _1536;
    float _1981 = -_1855;
    float _1983 = _1981 + 1.0;
    float _1985 = _1551 * _1979;
    float _1987 = _1551 * _1983;
    float _1989 = _1561 * _1979;
    float _1991 = fma(_1557, _1985, _1545);
    float _1993 = fma(_1559, _1985, _1547);
    float _1995 = _1985;
    float _1997 = _1977;
    float _1999 = _1977;
    if (!_1925)
    {
        _1995 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2001 = _1995;
    float _2003 = fma(_1551, _1989, _1549);
    out.m_77.x = _1991;
    out.m_77.y = _1993;
    out.m_77.z = _2003;
    out.m_77.w = _1987;
    bool _2005 = !_1925;
    float _2007 = _2001;
    float _2009 = _2001;
    if (!_2005)
    {
        bool _2011 = _1244 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2013 = isnan(_1244);
        bool _2015 = _2011 || _2013;
        bool _2017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2019 = _2015 || _2017;
        if (!_2019)
        {
            float _2021 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2023 = _1244 + _2021;
            float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2027 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2025;
            float _2029 = 1.0 / _2027;
            float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2033 = _2031 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2037 = _2035 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2039 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2041 = _2039 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2045 = _2043 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2047 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2049 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2051 = _2023 * _2029;
            float _2053 = precise::clamp(_2051, 0.0, 1.0);
            float _2055 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2057 = _2055 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2059 = fma(_2053, _2033, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2061 = fma(_2053, _2057, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2063 = fma(_2053, _2037, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2065 = fma(_2053, _2041, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2067 = fma(_2053, _2045, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2069 = fma(_2053, _2049, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1999 = _2061;
            _1969 = _2067;
            _2009 = _2059;
            _1963 = _2065;
            _1957 = _2063;
            _1975 = _2069;
            _2071 = true;
        }
        else
        {
            bool _2073 = _1244 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2075 = isnan(_1244);
            bool _2077 = _2073 || _2075;
            bool _2079 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2081 = _2077 || _2079;
            if (!_2081)
            {
                _2007 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2083 = _2007;
            _2009 = _2083;
            if (!_2081)
            {
                _1997 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2085 = _1997;
            _1999 = _2085;
            if (!_2081)
            {
                _1955 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2087 = _1955;
            _1957 = _2087;
            if (!_2081)
            {
                _1961 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2089 = _1961;
            _1963 = _2089;
            if (!_2081)
            {
                _1967 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2091 = _1967;
            _1969 = _2091;
            if (!_2081)
            {
                _1973 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2093 = _1973;
            bool _2095 = !_2081;
            _1975 = _2093;
            if (!_2095)
            {
                bool _2097 = _1244 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2099 = isnan(_1244);
                bool _2101 = _2097 || _2099;
                bool _2103 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2105 = _2101 || _2103;
                if (!_2105)
                {
                    float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2109 = _1244 + _2107;
                    float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2113 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2111;
                    float _2115 = 1.0 / _2113;
                    float _2117 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2119 = _2117 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2123 = _2121 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2125 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2127 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2129 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2131 = _2129 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2133 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2135 = _2133 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2137 = _2109 * _2115;
                    float _2139 = precise::clamp(_2137, 0.0, 1.0);
                    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2143 = _2141 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2145 = fma(_2139, _2119, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2147 = fma(_2139, _2143, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2149 = fma(_2139, _2123, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2151 = fma(_2139, _2127, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2153 = fma(_2139, _2131, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2155 = fma(_2139, _2135, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1999 = _2147;
                    _1969 = _2153;
                    _2009 = _2145;
                    _1963 = _2151;
                    _1957 = _2149;
                    _1975 = _2155;
                    _2071 = true;
                }
                else
                {
                    _1999 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1969 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2009 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1963 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1957 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1975 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2071 = false;
    float _2157 = _1999;
    float _2159 = _1969;
    float _2161 = _2009;
    float _2163 = _1963;
    float _2165 = _1957;
    float _2167 = _1975;
    float _2169 = fma(_1909, -0.5, 0.5);
    float _2171 = precise::clamp(_2169, 0.0, 1.0);
    float _2173 = -_2157;
    float _2175 = _2173 + _2159;
    float _2177 = _1222 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2179 = -_2161;
    float _2181 = _2179 + _2163;
    float _2183 = fma(_2171, _2175, _2157);
    out.m_79.x = 0.0;
    float _2185 = -_2165;
    float _2187 = _2185 + _2167;
    float _2189 = fma(_2171, _2181, _2161);
    float _2191 = _2183 * 0.586610972881317138671875;
    out.m_47.x = _2177;
    bool _2193 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2195 = fma(_2171, _2187, _2165);
    float _2197 = fma(_2189, 0.298911988735198974609375, _2191);
    bool _2199 = _1222 > 0.0;
    bool _2201 = isnan(_1222);
    bool _2203 = _2199 || _2201;
    bool _2205 = isnan(0.0);
    bool _2207 = _2203 || _2205;
    float _2209 = fma(_2195, 0.114477999508380889892578125, _2197);
    float _2211 = -_2209;
    float _2213 = _2189 + _2211;
    float _2215 = -_2209;
    float _2217 = _2183 + _2215;
    float _2219 = -_2209;
    float _2221 = _2195 + _2219;
    float _2223 = fma(_2213, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    float _2225 = fma(_2217, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    float _2227 = fma(_2221, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2209);
    bool _2229 = !_2193;
    if (!_2229)
    {
        float _2231 = -_1156;
        float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2235 = -_1158;
        float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2239 = -_1160;
        float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2243 = _2233 * _2233;
        float _2245 = fma(_2237, _2237, _2243);
        float _2247 = fma(_2241, _2241, _2245);
        float _2249 = sqrt(_2247);
        float _2251 = rsqrt(_2247);
        float _2253 = -_2249;
        float _2255 = _2253 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2257 = _2255 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2259 = precise::clamp(_2257, 0.0, 1.0);
        float _2261 = _2237 * _2251;
        float _2263 = _2233 * _2251;
        float _2265 = abs(_2259);
        float _2267 = log2(_2265);
        float _2269 = _2241 * _2251;
        float _2271 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2273 = _1909 * _2263;
        float _2275 = -_2263;
        float _2277 = -_2271;
        float _2279 = fma(_2275, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2277);
        float _2281 = fma(_1927, _2261, _2273);
        float _2283 = -_2269;
        float _2285 = fma(_2283, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2279);
        float _2287 = fma(_1929, _2269, _2281);
        float _2289 = precise::clamp(_2287, 0.0, 1.0);
        float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2293 = _2285 + _2291;
        float _2295 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2297 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2299 = precise::clamp(_2297, 0.0, 1.0);
        float _2301 = exp2(_2295);
        float _2303 = _2301 * _2299;
        float _2305 = _2289 * _2303;
        float _2307 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2309 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2311 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _2307;
        out.m_79.y = _2309;
        out.m_79.z = _2311;
    }
    out.m_81.x = _2223;
    out.m_81.y = _2225;
    out.m_81.z = _2227;
    if (_2207)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2313 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2313;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

