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
    float4 m_59 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_63 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_51 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1326 = as_type<float>(_102);
        out.gl_Position.z = _1326;
    }
    if (!_90)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_86);
        _94 = _122;
    }
    float _124 = _94;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1395 = as_type<float>(_138);
        out.gl_Position.z = _1395;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_49.w;
    float _142 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_47.x;
    float _156 = in.m_47.y;
    float _158 = in.m_47.z;
    float _160 = in.m_42.x;
    float _162 = in.m_42.y;
    float _164 = in.m_42.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    float _242 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = fma(_240, _156, _242);
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_246, _140, _162);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _260 = fma(_254, _140, _164);
    float _262 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _264 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _266 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _258);
    float _268 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _262);
    float _270 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _264);
    float _272 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _266);
    float _274 = in.m_49.x;
    float _276 = in.m_49.y;
    float _278 = in.m_49.z;
    float _280 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _268);
    float _282 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _270);
    float _284 = _272 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _286 = _280 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _288 = _282 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _290 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _292 = _284 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _296 = _286 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _300 = _288 + _298;
    float _302 = _292 * _292;
    float _304 = fma(_296, _296, _302);
    float _306 = fma(_300, _300, _304);
    float _308 = rsqrt(_306);
    float _310 = _274 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = _278 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _314 = _310 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _316 = _312 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _318 = _292 * _308;
    float _320 = _296 * _308;
    float _322 = _300 * _308;
    float _324 = -_318;
    float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[18].w, _292);
    float _328 = -_320;
    float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _332 = _326 * _326;
    float _334 = -_322;
    float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[18].w, _300);
    float _338 = fma(_330, _330, _332);
    float _340 = in.m_51.x;
    float _342 = in.m_51.y;
    float _344 = in.m_51.z;
    float _346 = fma(_336, _336, _338);
    float _348 = _276 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _350 = sqrt(_346);
    float _352 = _348 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _354 = _308 * _350;
    float _356 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _342);
    float _358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _340);
    float _360 = _352 * _354;
    float _362 = _314 * _354;
    float _364 = _316 * _354;
    float _366 = _360 * _356;
    float _368 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _344);
    float _370 = _362 * _358;
    float _372 = _366 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _374 = _364 * _368;
    float _376 = _366 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _378 = _366 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _380 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[10].x, _372);
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[8].x, _376);
    float _384 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[9].x, _378);
    float _386 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[10].z, _380);
    float _388 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[8].z, _382);
    float _390 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[9].z, _384);
    float _392 = _288 + _386;
    float _394 = _286 + _388;
    float _396 = _284 + _390;
    float _398 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _400 = _392 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _404 = _394 + _402;
    float _406 = _400 * _400;
    float _408 = fma(_404, _404, _406);
    float _410 = sqrt(_408);
    bool _412 = _410 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _416 = _414 != 0;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _420 = _418 != 0;
    bool _422 = !_416;
    int _424 = _422 ? 0 : 1;
    bool _426 = !_420;
    int _428 = _426 ? 0 : 1;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _432 = _374;
    float _434 = _370;
    float _436 = _404;
    float _438 = _408;
    if (!_412)
    {
        _430 = _394;
    }
    float _440 = _430;
    float _442 = _440;
    if (!_412)
    {
        _432 = _392;
    }
    float _444 = _432;
    float _446 = _444;
    if (!_412)
    {
        _434 = _396;
    }
    float _448 = _434;
    bool _450 = !_412;
    float _452 = _448;
    if (!_450)
    {
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _458 = _410 + _456;
        float _460 = _396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _462 = rsqrt(_408);
        float _464 = _458 * _454;
        float _466 = _464 * 0.15915493667125701904296875;
        float _468 = _466 * 6.283185482025146484375;
        float _470 = cos(_468);
        float _472 = _466 * 6.283185482025146484375;
        float _474 = sin(_472);
        float _476 = _470 + (-1.0);
        float _478 = _476 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _480 = fma(_474, _460, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _482 = fma(_396, _470, _478);
        float _484 = _462 * _480;
        float _486 = fma(_404, _484, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _488 = fma(_400, _484, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _452 = _482;
        _442 = _486;
        _446 = _488;
    }
    float _490 = _452;
    float _492 = _442;
    float _494 = _446;
    float _496 = -_318;
    float _498 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[18].w, _490);
    float _500 = -_320;
    float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _504 = -_322;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _510 = _498 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _514 = _502 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _518 = _506 + _516;
    float _520 = _510 * _510;
    float _522 = fma(_514, _514, _520);
    float _524 = fma(_518, _518, _522);
    float _526 = rsqrt(_524);
    float _528 = sqrt(_524);
    float _530 = _526 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _532 = _514 * _530;
    float _534 = _518 * _530;
    float _536 = _532 * _532;
    float _538 = _534 * _534;
    float _540 = _536 + _538;
    float _542 = sqrt(_540);
    bool _544 = _542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _548 = _542 + _546;
    float _550 = _518;
    float _552 = _548;
    float _554 = _510;
    if (_544)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _550 = _556;
    }
    float _558 = _550;
    if (_544)
    {
        float _560 = rsqrt(_540);
        _436 = _560;
    }
    float _562 = _436;
    float _564 = _562;
    if (_544)
    {
        float _566 = _548 * _558;
        _552 = _566;
    }
    float _568 = _552;
    if (_544)
    {
        float _570 = _568 * 0.15915493667125701904296875;
        _438 = _570;
    }
    float _572 = _438;
    float _574 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _576 = _522;
    if (_544)
    {
        float _578 = _572 * 6.283185482025146484375;
        float _580 = sin(_578);
        _576 = _580;
    }
    float _582 = _576;
    float _584 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _586 = precise::max(0.0, _584);
    float _588 = _526;
    float _590 = _586;
    float _592 = _584;
    if (_544)
    {
        float _594 = _572 * 6.283185482025146484375;
        float _596 = cos(_594);
        _588 = _596;
    }
    float _598 = _588;
    float _600 = -_530;
    float _602 = -_586;
    float _604 = fma(_510, _600, _602);
    if (!_544)
    {
        _554 = _532;
    }
    float _606 = _554;
    float _608 = _606;
    if (_544)
    {
        float _610 = _604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _610;
    }
    float _612 = _590;
    float _614 = _612;
    float _616 = _582;
    if (_544)
    {
        float _618 = fma(_582, _612, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _614 = _618;
    }
    float _620 = _614;
    float _622 = _620;
    if (!_544)
    {
        _616 = _536;
    }
    float _624 = _616;
    float _626 = _498 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _628 = _624;
    float _630 = _598;
    if (_544)
    {
        float _632 = _598 + (-1.0);
        _592 = _632;
    }
    float _634 = _592;
    float _636 = 0.0;
    float _638 = _634;
    if (_544)
    {
        float _640 = _562 * _620;
        _636 = _640;
    }
    float _642 = _636;
    if (!_544)
    {
        _622 = _604;
    }
    float _644 = _622;
    float _646 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[3].x, _626);
    float _648 = _644;
    if (_544)
    {
        float _650 = _634 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _564 = _650;
    }
    float _652 = _564;
    if (_544)
    {
        float _654 = _532 * _642;
        _608 = _654;
    }
    float _656 = _608;
    if (!_544)
    {
        _638 = _534;
    }
    float _658 = _638;
    float _660 = _658;
    if (_544)
    {
        float _662 = _534 * _642;
        _660 = _662;
    }
    float _664 = _660;
    if (_544)
    {
        float _666 = fma(_604, _598, _652);
        _648 = _666;
    }
    float _668 = _648;
    if (_544)
    {
        float _670 = _656 * _656;
        _628 = _670;
    }
    float _672 = _628;
    if (!_544)
    {
        _630 = _538;
    }
    float _674 = _630;
    float _676 = _674;
    if (_544)
    {
        float _678 = _664 * _664;
        _676 = _678;
    }
    float _680 = _676;
    float _682 = _498 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _684 = fma(_668, _668, _672);
    float _686 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _688 = fma(_528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _686);
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = _498 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _694 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[2].x, _682);
    float _696 = _684 + _680;
    float _698 = _498 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _700 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[1].x, _692);
    float _702 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[2].z, _694);
    float _704 = -_690;
    float _706 = _704 + 1.0;
    float _708 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[0].x, _698);
    float _710 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[1].z, _700);
    float _712 = rsqrt(_696);
    float _714 = _702 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _716 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[0].z, _708);
    float _718 = _710 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _720 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[3].z, _646);
    float _722 = _714 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _724 = _716 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _726 = _718 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _728 = abs(_706);
    float _730 = log2(_728);
    float _732 = _720 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _734 = -_722;
    float _736 = fma(_734, _574, 1.0);
    float _738 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _726);
    float _740 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[7].z, _738);
    float _742 = _712 * _656;
    float _744 = _712 * _668;
    float _746 = _712 * _664;
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[7].w, _740);
    float _750 = _742 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _752 = log2(_736);
    float _754 = _718 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _756 = -_750;
    float _758 = fma(_744, (*spvDescriptorSet0.vp_c15)._m0[21].y, _756);
    float _760 = _730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _762 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _754);
    float _764 = -_746;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[21].z, _758);
    float _768 = 1.0 / _748;
    float _770 = _718 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _772 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[5].z, _762);
    float _774 = fma(_766, -0.5, 0.5);
    float _776 = fma(_766, 0.5, 0.5);
    float _778 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _770);
    float _780 = _744 + 1.0;
    float _782 = exp2(_760);
    float _784 = fma(_776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _786 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[4].z, _778);
    float _788 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[5].w, _772);
    float _790 = _752 * 0.693147182464599609375;
    float _792 = fma(_776, _784, -0.212114393711090087890625);
    float _794 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[4].w, _786);
    float _796 = sqrt(_774);
    float _798 = fma(_776, _792, 1.570728778839111328125);
    float _800 = _794 * _768;
    float _802 = _788 * _768;
    float _804 = _790 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _806 = fma(_800, 0.5, 0.5);
    float _808 = fma(_802, -0.5, 0.5);
    float _810 = -_744;
    float _812 = fma(_782, _780, _810);
    float _814 = fma(_812, 0.5, 0.5);
    float _816 = _796 * 0.636619746685028076171875;
    float _818 = -_798;
    float _820 = fma(_816, _818, 1.0);
    float3 _2521 = float3(_806, _808, _804);
    float _822 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2521, float3(0.0), isnan(_2521)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2521, float3(0.0), isnan(_2521)), level(0.0)).x;
    float3 _2532 = float3(_806, _808, _804);
    float4 _825 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2532, float3(0.0), isnan(_2532)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2532, float3(0.0), isnan(_2532)), level(0.0)).xyzw;
    float _827 = _825.x;
    float _829 = _825.y;
    float _831 = _825.z;
    float _833 = _825.w;
    float2 _2549 = float2(_820, _814);
    float3 _837 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2549, float2(0.0), isnan(_2549)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2549, float2(0.0), isnan(_2549)), level(0.0)).xyz;
    float _839 = _837.x;
    float _841 = _837.y;
    float _843 = _837.z;
    float _845 = in.m_53.x;
    float _847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _849 = _120 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _851 = in.m_53.w;
    float _853 = -_318;
    float _855 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[18].w, _284);
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _859 = _857 != 0;
    float _861 = in.m_55.w;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _865 = _863 != 0;
    float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _871 = _869 != 0;
    float _873 = in.m_55.x;
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _877 = _875 != 0;
    float _879 = -_320;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[18].w, _286);
    float _883 = in.m_55.z;
    float _885 = _849 * _847;
    float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _889 = 0.0;
    float _891 = 1.4012984643248170709237295832899e-45;
    float _893 = _883;
    if (_859)
    {
        float _895 = in.m_53.z;
        _889 = _895;
    }
    float _897 = _889;
    float _899 = -_322;
    float _901 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[18].w, _288);
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _905 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[20].x, _885);
    bool _907 = _845 > 0.5;
    bool _909 = _907 && _871;
    float _911 = in.m_53.y;
    float _913 = _855 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _915 = _851 > 0.5;
    float _917 = _855 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _919 = floor(_905);
    float _921 = -_861;
    float _923 = _921 + 1.0;
    int _925 = abs(_424);
    float _927 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[10].x, _917);
    float _929 = _730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _933 = _861;
    float _935 = _873;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_877)
    {
        float _939 = _915 ? _923 : _861;
        _933 = _939;
    }
    float _941 = _933;
    float _943 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[10].z, _927);
    float _945 = _923;
    if (!_865)
    {
        float _947 = in.m_53.z;
        _945 = _947;
    }
    float _949 = _945;
    int _951 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _953 = _951 != 0;
    float _955 = _718 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_871)
    {
        _891 = _873;
    }
    float _957 = _891;
    float _959 = _957;
    if (_909)
    {
        float _961 = -_873;
        float _963 = _961 + 1.0;
        _935 = _963;
    }
    float _965 = _935;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _969 = _967 != 0;
    float _971 = exp2(_929);
    bool _973 = _897 > 0.5;
    bool _975 = _973 && _859;
    float _977 = -_919;
    float _979 = _905 + _977;
    float _981 = _905 * 6.283185482025146484375;
    float _983 = _919;
    float _985 = _981;
    if (_871)
    {
        _959 = _965;
    }
    float _987 = _959;
    float _989 = in.m_55.y;
    if (_859)
    {
        _983 = _883;
    }
    float _991 = _983;
    float _993 = _981 * 0.15915493667125701904296875;
    float _995 = _991;
    if (!_865)
    {
        _985 = _911;
    }
    float _997 = _985;
    float _999 = fma((*spvDescriptorSet0.vp_c9)._m0[85].y, _941, -0.5);
    float _1001 = _997;
    if (_865)
    {
        _1001 = _845;
    }
    float _1003 = _1001;
    float _1005 = _987 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1007 = _993 * 6.283185482025146484375;
    float _1009 = cos(_1007);
    if (_975)
    {
        float _1011 = -_991;
        float _1013 = _1011 + 1.0;
        _995 = _1013;
    }
    float _1015 = _995;
    float _1017 = _1005 * _867;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1021 = _949;
    if (!_865)
    {
        _937 = _949;
    }
    float _1023 = _937;
    float _1025 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _955);
    float _1027 = _1023;
    if (_859)
    {
        _893 = _1015;
    }
    float _1029 = _893;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_865)
    {
        _1021 = _911;
    }
    float _1033 = _1021;
    out.m_57.x = _1017;
    float _1035 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1025);
    if (_865)
    {
        _1027 = _911;
    }
    float _1037 = _1027;
    float _1039 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1019);
    bool _1041 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1043 = isnan(0.5);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1049 = _1045 || _1047;
    float _1051 = fma(_1009, 0.5, 0.5);
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1055 = -_989;
    float _1057 = _1055 + 1.0;
    bool _1059 = _911 > 0.5;
    float _1061 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1053);
    float _1063 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1065 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _1067 = _989;
    if (_969)
    {
        float _1069 = _1059 ? _1057 : _989;
        _1067 = _1069;
    }
    float _1071 = _1067;
    float _1073 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1075 = -_903;
    float _1077 = fma(_1063, 2.0, _1075);
    float _1079 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1085 = _979 < 0.5;
    float _1087 = float(_1085);
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1091 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1093 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1095 = -_979;
    float _1097 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1099 = _1089 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1101 = -_1087;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1105 = -_1051;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1109 = _1079 * _887;
    out.m_59.x = _1091;
    out.m_59.y = _1093;
    out.m_59.z = _1099;
    out.m_59.w = _1031;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1113 = fma(_1073, -2.0, _931);
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_57.y = _1109;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1119 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1061);
    float _1125 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1127 = -_120;
    float _1129 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1077);
    float _1131 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1039);
    float _1133 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1113);
    float _1135 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[11].x, _913);
    out.m_61.x = _1119;
    out.m_61.y = _1121;
    out.m_61.z = _1125;
    float _1137 = -_1133;
    float _1139 = fma(_1131, _999, _1137);
    float _1141 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1135);
    bool _1143 = !_953;
    int _1145 = _1143 ? 0 : 1;
    float _1147 = fma(_1123, _1065, _1129);
    float _1149 = float(_925);
    float _1151 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1153 = abs(_1145);
    float _1155 = _943 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1157 = abs(_428);
    float _1159 = abs(_1097);
    float _1161 = _1149 * _1159;
    float _1163 = 1.0 / _1151;
    float _1165 = float(_1153);
    float _1167 = _1155 + _1151;
    float _1169 = float(_1157);
    float _1171 = _1147 + 0.5;
    float _1173 = fma(_1165, _1107, _1161);
    float _1175 = abs(_1103);
    float _1177 = fma(_1169, _1175, _1173);
    float _1179 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1035);
    float _1181 = _1167 * _1163;
    float _1183 = _1181 * 0.5;
    float _1185 = _1139 + 0.5;
    float _1187 = _1139;
    if (_1049)
    {
        _1187 = 1.0;
    }
    float _1189 = _1187;
    float _1191 = _1189;
    if (!_1049)
    {
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1195 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1193);
        float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _1201 = 1.0 / _1195;
        float _1203 = 1.0 / _1199;
        float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1209 = fma(_1201, _1205, _1207);
        float _1211 = _1209 * _1203;
        float _1213 = precise::clamp(_1211, 0.0, 1.0);
        float _1215 = -_1213;
        float _1217 = _1215 + 1.0;
        _1191 = _1217;
    }
    float _1219 = _1191;
    float _1221 = -_971;
    float _1223 = _1221 + 1.0;
    float _1225 = _1219 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1229 = _1179 + _1227;
    bool _1231 = _1219 > 0.0;
    bool _1233 = isnan(_1219);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan(0.0);
    bool _1239 = _1235 || _1237;
    float _1241 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1243 = _1177 * _1225;
    out.m_57.w = _1185;
    float _1245 = _748 + _1229;
    float _1247 = _1241 * _822;
    float _1249 = -_1241;
    float _1251 = _1249 + 1.0;
    out.m_63.x = _502;
    out.m_63.y = _498;
    out.m_63.z = _506;
    float _1253 = _1245 * 0.5;
    float _1255 = _843 * _1247;
    float _1257 = _833 * _1247;
    float _1259 = _1243 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1261 = _833 * _1251;
    float _1263 = fma(_839, _1257, _827);
    float _1265 = fma(_841, _1257, _829);
    float _1267 = fma(_833, _1255, _831);
    out.m_57.z = _1171;
    out.gl_Position.x = _794;
    out.gl_Position.y = _788;
    out.gl_Position.z = _1229;
    out.gl_Position.w = _748;
    out.m_65.z = _1253;
    out.m_65.w = _748;
    out.m_45.x = _1259;
    out.m_67.x = _1263;
    out.m_67.y = _1265;
    out.m_67.z = _1267;
    out.m_67.w = _1261;
    if (_1239)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1269 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1269;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1326 = as_type<float>(_102);
        out.gl_Position.z = _1326;
    }
    if (!_90)
    {
        return out;
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_86);
        _94 = _122;
    }
    float _124 = _94;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1395 = as_type<float>(_138);
        out.gl_Position.z = _1395;
    }
    if (_130)
    {
        return out;
    }
    float _140 = in.m_49.w;
    float _142 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_47.x;
    float _156 = in.m_47.y;
    float _158 = in.m_47.z;
    float _160 = in.m_42.x;
    float _162 = in.m_42.y;
    float _164 = in.m_42.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    float _242 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = fma(_240, _156, _242);
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_246, _140, _162);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _260 = fma(_254, _140, _164);
    float _262 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _264 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _266 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _258);
    float _268 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _262);
    float _270 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _264);
    float _272 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _266);
    float _274 = in.m_49.x;
    float _276 = in.m_49.y;
    float _278 = in.m_49.z;
    float _280 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _268);
    float _282 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _270);
    float _284 = _272 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _286 = _280 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _288 = _282 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _290 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _292 = _284 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _296 = _286 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _300 = _288 + _298;
    float _302 = _292 * _292;
    float _304 = fma(_296, _296, _302);
    float _306 = fma(_300, _300, _304);
    float _308 = rsqrt(_306);
    float _310 = _274 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = _278 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _314 = _310 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _316 = _312 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _318 = _292 * _308;
    float _320 = _296 * _308;
    float _322 = _300 * _308;
    float _324 = -_318;
    float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[18].w, _292);
    float _328 = -_320;
    float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _332 = _326 * _326;
    float _334 = -_322;
    float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[18].w, _300);
    float _338 = fma(_330, _330, _332);
    float _340 = in.m_51.x;
    float _342 = in.m_51.y;
    float _344 = in.m_51.z;
    float _346 = fma(_336, _336, _338);
    float _348 = _276 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _350 = sqrt(_346);
    float _352 = _348 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _354 = _308 * _350;
    float _356 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _342);
    float _358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _340);
    float _360 = _352 * _354;
    float _362 = _314 * _354;
    float _364 = _316 * _354;
    float _366 = _360 * _356;
    float _368 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _344);
    float _370 = _362 * _358;
    float _372 = _366 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _374 = _364 * _368;
    float _376 = _366 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _378 = _366 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _380 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[10].x, _372);
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[8].x, _376);
    float _384 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[9].x, _378);
    float _386 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[10].z, _380);
    float _388 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[8].z, _382);
    float _390 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[9].z, _384);
    float _392 = _288 + _386;
    float _394 = _286 + _388;
    float _396 = _284 + _390;
    float _398 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _400 = _392 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _404 = _394 + _402;
    float _406 = _400 * _400;
    float _408 = fma(_404, _404, _406);
    float _410 = sqrt(_408);
    bool _412 = _410 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _416 = _414 != 0;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _420 = _418 != 0;
    bool _422 = !_416;
    int _424 = _422 ? 0 : 1;
    bool _426 = !_420;
    int _428 = _426 ? 0 : 1;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _432 = _374;
    float _434 = _370;
    float _436 = _404;
    float _438 = _408;
    if (!_412)
    {
        _430 = _394;
    }
    float _440 = _430;
    float _442 = _440;
    if (!_412)
    {
        _432 = _392;
    }
    float _444 = _432;
    float _446 = _444;
    if (!_412)
    {
        _434 = _396;
    }
    float _448 = _434;
    bool _450 = !_412;
    float _452 = _448;
    if (!_450)
    {
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _458 = _410 + _456;
        float _460 = _396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _462 = rsqrt(_408);
        float _464 = _458 * _454;
        float _466 = _464 * 0.15915493667125701904296875;
        float _468 = _466 * 6.283185482025146484375;
        float _470 = cos(_468);
        float _472 = _466 * 6.283185482025146484375;
        float _474 = sin(_472);
        float _476 = _470 + (-1.0);
        float _478 = _476 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _480 = fma(_474, _460, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _482 = fma(_396, _470, _478);
        float _484 = _462 * _480;
        float _486 = fma(_404, _484, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _488 = fma(_400, _484, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _452 = _482;
        _442 = _486;
        _446 = _488;
    }
    float _490 = _452;
    float _492 = _442;
    float _494 = _446;
    float _496 = -_318;
    float _498 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[18].w, _490);
    float _500 = -_320;
    float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _504 = -_322;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _510 = _498 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _514 = _502 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _518 = _506 + _516;
    float _520 = _510 * _510;
    float _522 = fma(_514, _514, _520);
    float _524 = fma(_518, _518, _522);
    float _526 = rsqrt(_524);
    float _528 = sqrt(_524);
    float _530 = _526 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _532 = _514 * _530;
    float _534 = _518 * _530;
    float _536 = _532 * _532;
    float _538 = _534 * _534;
    float _540 = _536 + _538;
    float _542 = sqrt(_540);
    bool _544 = _542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _548 = _542 + _546;
    float _550 = _518;
    float _552 = _548;
    float _554 = _510;
    if (_544)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _550 = _556;
    }
    float _558 = _550;
    if (_544)
    {
        float _560 = rsqrt(_540);
        _436 = _560;
    }
    float _562 = _436;
    float _564 = _562;
    if (_544)
    {
        float _566 = _548 * _558;
        _552 = _566;
    }
    float _568 = _552;
    if (_544)
    {
        float _570 = _568 * 0.15915493667125701904296875;
        _438 = _570;
    }
    float _572 = _438;
    float _574 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _576 = _522;
    if (_544)
    {
        float _578 = _572 * 6.283185482025146484375;
        float _580 = sin(_578);
        _576 = _580;
    }
    float _582 = _576;
    float _584 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _586 = precise::max(0.0, _584);
    float _588 = _526;
    float _590 = _586;
    float _592 = _584;
    if (_544)
    {
        float _594 = _572 * 6.283185482025146484375;
        float _596 = cos(_594);
        _588 = _596;
    }
    float _598 = _588;
    float _600 = -_530;
    float _602 = -_586;
    float _604 = fma(_510, _600, _602);
    if (!_544)
    {
        _554 = _532;
    }
    float _606 = _554;
    float _608 = _606;
    if (_544)
    {
        float _610 = _604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _610;
    }
    float _612 = _590;
    float _614 = _612;
    float _616 = _582;
    if (_544)
    {
        float _618 = fma(_582, _612, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _614 = _618;
    }
    float _620 = _614;
    float _622 = _620;
    if (!_544)
    {
        _616 = _536;
    }
    float _624 = _616;
    float _626 = _498 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _628 = _624;
    float _630 = _598;
    if (_544)
    {
        float _632 = _598 + (-1.0);
        _592 = _632;
    }
    float _634 = _592;
    float _636 = 0.0;
    float _638 = _634;
    if (_544)
    {
        float _640 = _562 * _620;
        _636 = _640;
    }
    float _642 = _636;
    if (!_544)
    {
        _622 = _604;
    }
    float _644 = _622;
    float _646 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[3].x, _626);
    float _648 = _644;
    if (_544)
    {
        float _650 = _634 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _564 = _650;
    }
    float _652 = _564;
    if (_544)
    {
        float _654 = _532 * _642;
        _608 = _654;
    }
    float _656 = _608;
    if (!_544)
    {
        _638 = _534;
    }
    float _658 = _638;
    float _660 = _658;
    if (_544)
    {
        float _662 = _534 * _642;
        _660 = _662;
    }
    float _664 = _660;
    if (_544)
    {
        float _666 = fma(_604, _598, _652);
        _648 = _666;
    }
    float _668 = _648;
    if (_544)
    {
        float _670 = _656 * _656;
        _628 = _670;
    }
    float _672 = _628;
    if (!_544)
    {
        _630 = _538;
    }
    float _674 = _630;
    float _676 = _674;
    if (_544)
    {
        float _678 = _664 * _664;
        _676 = _678;
    }
    float _680 = _676;
    float _682 = _498 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _684 = fma(_668, _668, _672);
    float _686 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _688 = fma(_528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _686);
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = _498 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _694 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[2].x, _682);
    float _696 = _684 + _680;
    float _698 = _498 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _700 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[1].x, _692);
    float _702 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[2].z, _694);
    float _704 = -_690;
    float _706 = _704 + 1.0;
    float _708 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[0].x, _698);
    float _710 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[1].z, _700);
    float _712 = rsqrt(_696);
    float _714 = _702 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _716 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[0].z, _708);
    float _718 = _710 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _720 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[3].z, _646);
    float _722 = _714 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _724 = _716 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _726 = _718 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _728 = abs(_706);
    float _730 = log2(_728);
    float _732 = _720 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _734 = -_722;
    float _736 = fma(_734, _574, 1.0);
    float _738 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _726);
    float _740 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[7].z, _738);
    float _742 = _712 * _656;
    float _744 = _712 * _668;
    float _746 = _712 * _664;
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[7].w, _740);
    float _750 = _742 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _752 = log2(_736);
    float _754 = _718 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _756 = -_750;
    float _758 = fma(_744, (*spvDescriptorSet0.vp_c15)._m0[21].y, _756);
    float _760 = _730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _762 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _754);
    float _764 = -_746;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[21].z, _758);
    float _768 = 1.0 / _748;
    float _770 = _718 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _772 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[5].z, _762);
    float _774 = fma(_766, -0.5, 0.5);
    float _776 = fma(_766, 0.5, 0.5);
    float _778 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _770);
    float _780 = _744 + 1.0;
    float _782 = exp2(_760);
    float _784 = fma(_776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _786 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[4].z, _778);
    float _788 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[5].w, _772);
    float _790 = _752 * 0.693147182464599609375;
    float _792 = fma(_776, _784, -0.212114393711090087890625);
    float _794 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[4].w, _786);
    float _796 = sqrt(_774);
    float _798 = fma(_776, _792, 1.570728778839111328125);
    float _800 = _794 * _768;
    float _802 = _788 * _768;
    float _804 = _790 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _806 = fma(_800, 0.5, 0.5);
    float _808 = fma(_802, -0.5, 0.5);
    float _810 = -_744;
    float _812 = fma(_782, _780, _810);
    float _814 = fma(_812, 0.5, 0.5);
    float _816 = _796 * 0.636619746685028076171875;
    float _818 = -_798;
    float _820 = fma(_816, _818, 1.0);
    float3 _2521 = float3(_806, _808, _804);
    float _822 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2521, float3(0.0), isnan(_2521)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2521, float3(0.0), isnan(_2521)), level(0.0)).x;
    float3 _2532 = float3(_806, _808, _804);
    float4 _825 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2532, float3(0.0), isnan(_2532)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2532, float3(0.0), isnan(_2532)), level(0.0)).xyzw;
    float _827 = _825.x;
    float _829 = _825.y;
    float _831 = _825.z;
    float _833 = _825.w;
    float2 _2549 = float2(_820, _814);
    float3 _837 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2549, float2(0.0), isnan(_2549)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2549, float2(0.0), isnan(_2549)), level(0.0)).xyz;
    float _839 = _837.x;
    float _841 = _837.y;
    float _843 = _837.z;
    float _845 = in.m_53.x;
    float _847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _849 = _120 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _851 = in.m_53.w;
    float _853 = -_318;
    float _855 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[18].w, _284);
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _859 = _857 != 0;
    float _861 = in.m_55.w;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _865 = _863 != 0;
    float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _871 = _869 != 0;
    float _873 = in.m_55.x;
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _877 = _875 != 0;
    float _879 = -_320;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[18].w, _286);
    float _883 = in.m_55.z;
    float _885 = _849 * _847;
    float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _889 = 0.0;
    float _891 = 1.4012984643248170709237295832899e-45;
    float _893 = _883;
    if (_859)
    {
        float _895 = in.m_53.z;
        _889 = _895;
    }
    float _897 = _889;
    float _899 = -_322;
    float _901 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[18].w, _288);
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _905 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[20].x, _885);
    bool _907 = _845 > 0.5;
    bool _909 = _907 && _871;
    float _911 = in.m_53.y;
    float _913 = _855 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _915 = _851 > 0.5;
    float _917 = _855 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _919 = floor(_905);
    float _921 = -_861;
    float _923 = _921 + 1.0;
    int _925 = abs(_424);
    float _927 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[10].x, _917);
    float _929 = _730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _933 = _861;
    float _935 = _873;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_877)
    {
        float _939 = _915 ? _923 : _861;
        _933 = _939;
    }
    float _941 = _933;
    float _943 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[10].z, _927);
    float _945 = _923;
    if (!_865)
    {
        float _947 = in.m_53.z;
        _945 = _947;
    }
    float _949 = _945;
    int _951 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _953 = _951 != 0;
    float _955 = _718 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_871)
    {
        _891 = _873;
    }
    float _957 = _891;
    float _959 = _957;
    if (_909)
    {
        float _961 = -_873;
        float _963 = _961 + 1.0;
        _935 = _963;
    }
    float _965 = _935;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _969 = _967 != 0;
    float _971 = exp2(_929);
    bool _973 = _897 > 0.5;
    bool _975 = _973 && _859;
    float _977 = -_919;
    float _979 = _905 + _977;
    float _981 = _905 * 6.283185482025146484375;
    float _983 = _919;
    float _985 = _981;
    if (_871)
    {
        _959 = _965;
    }
    float _987 = _959;
    float _989 = in.m_55.y;
    if (_859)
    {
        _983 = _883;
    }
    float _991 = _983;
    float _993 = _981 * 0.15915493667125701904296875;
    float _995 = _991;
    if (!_865)
    {
        _985 = _911;
    }
    float _997 = _985;
    float _999 = fma((*spvDescriptorSet0.vp_c9)._m0[85].y, _941, -0.5);
    float _1001 = _997;
    if (_865)
    {
        _1001 = _845;
    }
    float _1003 = _1001;
    float _1005 = _987 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1007 = _993 * 6.283185482025146484375;
    float _1009 = cos(_1007);
    if (_975)
    {
        float _1011 = -_991;
        float _1013 = _1011 + 1.0;
        _995 = _1013;
    }
    float _1015 = _995;
    float _1017 = _1005 * _867;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1021 = _949;
    if (!_865)
    {
        _937 = _949;
    }
    float _1023 = _937;
    float _1025 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _955);
    float _1027 = _1023;
    if (_859)
    {
        _893 = _1015;
    }
    float _1029 = _893;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_865)
    {
        _1021 = _911;
    }
    float _1033 = _1021;
    out.m_57.x = _1017;
    float _1035 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1025);
    if (_865)
    {
        _1027 = _911;
    }
    float _1037 = _1027;
    float _1039 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1019);
    bool _1041 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1043 = isnan(0.5);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1049 = _1045 || _1047;
    float _1051 = fma(_1009, 0.5, 0.5);
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1055 = -_989;
    float _1057 = _1055 + 1.0;
    bool _1059 = _911 > 0.5;
    float _1061 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1053);
    float _1063 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1065 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _1067 = _989;
    if (_969)
    {
        float _1069 = _1059 ? _1057 : _989;
        _1067 = _1069;
    }
    float _1071 = _1067;
    float _1073 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1075 = -_903;
    float _1077 = fma(_1063, 2.0, _1075);
    float _1079 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1085 = _979 < 0.5;
    float _1087 = float(_1085);
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1091 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1093 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1095 = -_979;
    float _1097 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1099 = _1089 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1101 = -_1087;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1105 = -_1051;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1109 = _1079 * _887;
    out.m_59.x = _1091;
    out.m_59.y = _1093;
    out.m_59.z = _1099;
    out.m_59.w = _1031;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1113 = fma(_1073, -2.0, _931);
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_57.y = _1109;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1119 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1061);
    float _1125 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1127 = -_120;
    float _1129 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1077);
    float _1131 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1039);
    float _1133 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1113);
    float _1135 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[11].x, _913);
    out.m_61.x = _1119;
    out.m_61.y = _1121;
    out.m_61.z = _1125;
    float _1137 = -_1133;
    float _1139 = fma(_1131, _999, _1137);
    float _1141 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1135);
    bool _1143 = !_953;
    int _1145 = _1143 ? 0 : 1;
    float _1147 = fma(_1123, _1065, _1129);
    float _1149 = float(_925);
    float _1151 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1153 = abs(_1145);
    float _1155 = _943 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1157 = abs(_428);
    float _1159 = abs(_1097);
    float _1161 = _1149 * _1159;
    float _1163 = 1.0 / _1151;
    float _1165 = float(_1153);
    float _1167 = _1155 + _1151;
    float _1169 = float(_1157);
    float _1171 = _1147 + 0.5;
    float _1173 = fma(_1165, _1107, _1161);
    float _1175 = abs(_1103);
    float _1177 = fma(_1169, _1175, _1173);
    float _1179 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1035);
    float _1181 = _1167 * _1163;
    float _1183 = _1181 * 0.5;
    float _1185 = _1139 + 0.5;
    float _1187 = _1139;
    if (_1049)
    {
        _1187 = 1.0;
    }
    float _1189 = _1187;
    float _1191 = _1189;
    if (!_1049)
    {
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1195 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1193);
        float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _1201 = 1.0 / _1195;
        float _1203 = 1.0 / _1199;
        float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1209 = fma(_1201, _1205, _1207);
        float _1211 = _1209 * _1203;
        float _1213 = precise::clamp(_1211, 0.0, 1.0);
        float _1215 = -_1213;
        float _1217 = _1215 + 1.0;
        _1191 = _1217;
    }
    float _1219 = _1191;
    float _1221 = -_971;
    float _1223 = _1221 + 1.0;
    float _1225 = _1219 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1229 = _1179 + _1227;
    bool _1231 = _1219 > 0.0;
    bool _1233 = isnan(_1219);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan(0.0);
    bool _1239 = _1235 || _1237;
    float _1241 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1243 = _1177 * _1225;
    out.m_57.w = _1185;
    float _1245 = _748 + _1229;
    float _1247 = _1241 * _822;
    float _1249 = -_1241;
    float _1251 = _1249 + 1.0;
    out.m_63.x = _502;
    out.m_63.y = _498;
    out.m_63.z = _506;
    float _1253 = _1245 * 0.5;
    float _1255 = _843 * _1247;
    float _1257 = _833 * _1247;
    float _1259 = _1243 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1261 = _833 * _1251;
    float _1263 = fma(_839, _1257, _827);
    float _1265 = fma(_841, _1257, _829);
    float _1267 = fma(_833, _1255, _831);
    out.m_57.z = _1171;
    out.gl_Position.x = _794;
    out.gl_Position.y = _788;
    out.gl_Position.z = _1229;
    out.gl_Position.w = _748;
    out.m_65.z = _1253;
    out.m_65.w = _748;
    out.m_45.x = _1259;
    out.m_67.x = _1263;
    out.m_67.y = _1265;
    out.m_67.z = _1267;
    out.m_67.w = _1261;
    if (_1239)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1269 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1269;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1326 = as_type<float>(_102);
        out.gl_Position.z = _1326;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_86);
        _94 = _122;
    }
    float _124 = _94;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1395 = as_type<float>(_138);
        out.gl_Position.z = _1395;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_49.w;
    float _142 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_47.x;
    float _156 = in.m_47.y;
    float _158 = in.m_47.z;
    float _160 = in.m_42.x;
    float _162 = in.m_42.y;
    float _164 = in.m_42.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    float _242 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = fma(_240, _156, _242);
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_246, _140, _162);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = _252 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _260 = fma(_254, _140, _164);
    float _262 = _252 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _264 = _252 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _266 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _258);
    float _268 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _262);
    float _270 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _264);
    float _272 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _266);
    float _274 = in.m_49.x;
    float _276 = in.m_49.y;
    float _278 = in.m_49.z;
    float _280 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _268);
    float _282 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _270);
    float _284 = _272 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _286 = _280 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _288 = _282 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _290 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _292 = _284 + _290;
    float _294 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _296 = _286 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _300 = _288 + _298;
    float _302 = _292 * _292;
    float _304 = fma(_296, _296, _302);
    float _306 = fma(_300, _300, _304);
    float _308 = rsqrt(_306);
    float _310 = _274 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _312 = _278 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _314 = _310 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _316 = _312 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _318 = _292 * _308;
    float _320 = _296 * _308;
    float _322 = _300 * _308;
    float _324 = -_318;
    float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[18].w, _292);
    float _328 = -_320;
    float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _332 = _326 * _326;
    float _334 = -_322;
    float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[18].w, _300);
    float _338 = fma(_330, _330, _332);
    float _340 = in.m_51.x;
    float _342 = in.m_51.y;
    float _344 = in.m_51.z;
    float _346 = fma(_336, _336, _338);
    float _348 = _276 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _350 = sqrt(_346);
    float _352 = _348 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _354 = _308 * _350;
    float _356 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _342);
    float _358 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _340);
    float _360 = _352 * _354;
    float _362 = _314 * _354;
    float _364 = _316 * _354;
    float _366 = _360 * _356;
    float _368 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _344);
    float _370 = _362 * _358;
    float _372 = _366 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _374 = _364 * _368;
    float _376 = _366 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _378 = _366 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _380 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[10].x, _372);
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[8].x, _376);
    float _384 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[9].x, _378);
    float _386 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[10].z, _380);
    float _388 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[8].z, _382);
    float _390 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[9].z, _384);
    float _392 = _288 + _386;
    float _394 = _286 + _388;
    float _396 = _284 + _390;
    float _398 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _400 = _392 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _404 = _394 + _402;
    float _406 = _400 * _400;
    float _408 = fma(_404, _404, _406);
    float _410 = sqrt(_408);
    bool _412 = _410 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _416 = _414 != 0;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _420 = _418 != 0;
    bool _422 = !_416;
    int _424 = _422 ? 0 : 1;
    bool _426 = !_420;
    int _428 = _426 ? 0 : 1;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _432 = _374;
    float _434 = _370;
    float _436 = _404;
    float _438 = _408;
    if (!_412)
    {
        _430 = _394;
    }
    float _440 = _430;
    float _442 = _440;
    if (!_412)
    {
        _432 = _392;
    }
    float _444 = _432;
    float _446 = _444;
    if (!_412)
    {
        _434 = _396;
    }
    float _448 = _434;
    bool _450 = !_412;
    float _452 = _448;
    if (!_450)
    {
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _458 = _410 + _456;
        float _460 = _396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _462 = rsqrt(_408);
        float _464 = _458 * _454;
        float _466 = _464 * 0.15915493667125701904296875;
        float _468 = _466 * 6.283185482025146484375;
        float _470 = cos(_468);
        float _472 = _466 * 6.283185482025146484375;
        float _474 = sin(_472);
        float _476 = _470 + (-1.0);
        float _478 = _476 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _480 = fma(_474, _460, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _482 = fma(_396, _470, _478);
        float _484 = _462 * _480;
        float _486 = fma(_404, _484, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _488 = fma(_400, _484, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _452 = _482;
        _442 = _486;
        _446 = _488;
    }
    float _490 = _452;
    float _492 = _442;
    float _494 = _446;
    float _496 = -_318;
    float _498 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[18].w, _490);
    float _500 = -_320;
    float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _504 = -_322;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _510 = _498 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _514 = _502 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _518 = _506 + _516;
    float _520 = _510 * _510;
    float _522 = fma(_514, _514, _520);
    float _524 = fma(_518, _518, _522);
    float _526 = rsqrt(_524);
    float _528 = sqrt(_524);
    float _530 = _526 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _532 = _514 * _530;
    float _534 = _518 * _530;
    float _536 = _532 * _532;
    float _538 = _534 * _534;
    float _540 = _536 + _538;
    float _542 = sqrt(_540);
    bool _544 = _542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _548 = _542 + _546;
    float _550 = _518;
    float _552 = _548;
    float _554 = _510;
    if (_544)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _550 = _556;
    }
    float _558 = _550;
    if (_544)
    {
        float _560 = rsqrt(_540);
        _436 = _560;
    }
    float _562 = _436;
    float _564 = _562;
    if (_544)
    {
        float _566 = _548 * _558;
        _552 = _566;
    }
    float _568 = _552;
    if (_544)
    {
        float _570 = _568 * 0.15915493667125701904296875;
        _438 = _570;
    }
    float _572 = _438;
    float _574 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _576 = _522;
    if (_544)
    {
        float _578 = _572 * 6.283185482025146484375;
        float _580 = sin(_578);
        _576 = _580;
    }
    float _582 = _576;
    float _584 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _586 = precise::max(0.0, _584);
    float _588 = _526;
    float _590 = _586;
    float _592 = _584;
    if (_544)
    {
        float _594 = _572 * 6.283185482025146484375;
        float _596 = cos(_594);
        _588 = _596;
    }
    float _598 = _588;
    float _600 = -_530;
    float _602 = -_586;
    float _604 = fma(_510, _600, _602);
    if (!_544)
    {
        _554 = _532;
    }
    float _606 = _554;
    float _608 = _606;
    if (_544)
    {
        float _610 = _604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _610;
    }
    float _612 = _590;
    float _614 = _612;
    float _616 = _582;
    if (_544)
    {
        float _618 = fma(_582, _612, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _614 = _618;
    }
    float _620 = _614;
    float _622 = _620;
    if (!_544)
    {
        _616 = _536;
    }
    float _624 = _616;
    float _626 = _498 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _628 = _624;
    float _630 = _598;
    if (_544)
    {
        float _632 = _598 + (-1.0);
        _592 = _632;
    }
    float _634 = _592;
    float _636 = 0.0;
    float _638 = _634;
    if (_544)
    {
        float _640 = _562 * _620;
        _636 = _640;
    }
    float _642 = _636;
    if (!_544)
    {
        _622 = _604;
    }
    float _644 = _622;
    float _646 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[3].x, _626);
    float _648 = _644;
    if (_544)
    {
        float _650 = _634 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _564 = _650;
    }
    float _652 = _564;
    if (_544)
    {
        float _654 = _532 * _642;
        _608 = _654;
    }
    float _656 = _608;
    if (!_544)
    {
        _638 = _534;
    }
    float _658 = _638;
    float _660 = _658;
    if (_544)
    {
        float _662 = _534 * _642;
        _660 = _662;
    }
    float _664 = _660;
    if (_544)
    {
        float _666 = fma(_604, _598, _652);
        _648 = _666;
    }
    float _668 = _648;
    if (_544)
    {
        float _670 = _656 * _656;
        _628 = _670;
    }
    float _672 = _628;
    if (!_544)
    {
        _630 = _538;
    }
    float _674 = _630;
    float _676 = _674;
    if (_544)
    {
        float _678 = _664 * _664;
        _676 = _678;
    }
    float _680 = _676;
    float _682 = _498 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _684 = fma(_668, _668, _672);
    float _686 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _688 = fma(_528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _686);
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = _498 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _694 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[2].x, _682);
    float _696 = _684 + _680;
    float _698 = _498 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _700 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[1].x, _692);
    float _702 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[2].z, _694);
    float _704 = -_690;
    float _706 = _704 + 1.0;
    float _708 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[0].x, _698);
    float _710 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[1].z, _700);
    float _712 = rsqrt(_696);
    float _714 = _702 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _716 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[0].z, _708);
    float _718 = _710 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _720 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[3].z, _646);
    float _722 = _714 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _724 = _716 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _726 = _718 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _728 = abs(_706);
    float _730 = log2(_728);
    float _732 = _720 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _734 = -_722;
    float _736 = fma(_734, _574, 1.0);
    float _738 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _726);
    float _740 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[7].z, _738);
    float _742 = _712 * _656;
    float _744 = _712 * _668;
    float _746 = _712 * _664;
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[7].w, _740);
    float _750 = _742 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _752 = log2(_736);
    float _754 = _718 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _756 = -_750;
    float _758 = fma(_744, (*spvDescriptorSet0.vp_c15)._m0[21].y, _756);
    float _760 = _730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _762 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _754);
    float _764 = -_746;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c15)._m0[21].z, _758);
    float _768 = 1.0 / _748;
    float _770 = _718 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _772 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[5].z, _762);
    float _774 = fma(_766, -0.5, 0.5);
    float _776 = fma(_766, 0.5, 0.5);
    float _778 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _770);
    float _780 = _744 + 1.0;
    float _782 = exp2(_760);
    float _784 = fma(_776, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _786 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[4].z, _778);
    float _788 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[5].w, _772);
    float _790 = _752 * 0.693147182464599609375;
    float _792 = fma(_776, _784, -0.212114393711090087890625);
    float _794 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[4].w, _786);
    float _796 = sqrt(_774);
    float _798 = fma(_776, _792, 1.570728778839111328125);
    float _800 = _794 * _768;
    float _802 = _788 * _768;
    float _804 = _790 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _806 = fma(_800, 0.5, 0.5);
    float _808 = fma(_802, -0.5, 0.5);
    float _810 = -_744;
    float _812 = fma(_782, _780, _810);
    float _814 = fma(_812, 0.5, 0.5);
    float _816 = _796 * 0.636619746685028076171875;
    float _818 = -_798;
    float _820 = fma(_816, _818, 1.0);
    float3 _2521 = float3(_806, _808, _804);
    float _822 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2521, float3(0.0), isnan(_2521)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2521, float3(0.0), isnan(_2521)), level(0.0)).x;
    float3 _2532 = float3(_806, _808, _804);
    float4 _825 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2532, float3(0.0), isnan(_2532)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2532, float3(0.0), isnan(_2532)), level(0.0)).xyzw;
    float _827 = _825.x;
    float _829 = _825.y;
    float _831 = _825.z;
    float _833 = _825.w;
    float2 _2549 = float2(_820, _814);
    float3 _837 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2549, float2(0.0), isnan(_2549)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2549, float2(0.0), isnan(_2549)), level(0.0)).xyz;
    float _839 = _837.x;
    float _841 = _837.y;
    float _843 = _837.z;
    float _845 = in.m_53.x;
    float _847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _849 = _120 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _851 = in.m_53.w;
    float _853 = -_318;
    float _855 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[18].w, _284);
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _859 = _857 != 0;
    float _861 = in.m_55.w;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _865 = _863 != 0;
    float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _871 = _869 != 0;
    float _873 = in.m_55.x;
    int _875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _877 = _875 != 0;
    float _879 = -_320;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[18].w, _286);
    float _883 = in.m_55.z;
    float _885 = _849 * _847;
    float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _889 = 0.0;
    float _891 = 1.4012984643248170709237295832899e-45;
    float _893 = _883;
    if (_859)
    {
        float _895 = in.m_53.z;
        _889 = _895;
    }
    float _897 = _889;
    float _899 = -_322;
    float _901 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[18].w, _288);
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _905 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[20].x, _885);
    bool _907 = _845 > 0.5;
    bool _909 = _907 && _871;
    float _911 = in.m_53.y;
    float _913 = _855 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _915 = _851 > 0.5;
    float _917 = _855 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _919 = floor(_905);
    float _921 = -_861;
    float _923 = _921 + 1.0;
    int _925 = abs(_424);
    float _927 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[10].x, _917);
    float _929 = _730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _933 = _861;
    float _935 = _873;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_877)
    {
        float _939 = _915 ? _923 : _861;
        _933 = _939;
    }
    float _941 = _933;
    float _943 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[10].z, _927);
    float _945 = _923;
    if (!_865)
    {
        float _947 = in.m_53.z;
        _945 = _947;
    }
    float _949 = _945;
    int _951 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _953 = _951 != 0;
    float _955 = _718 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_871)
    {
        _891 = _873;
    }
    float _957 = _891;
    float _959 = _957;
    if (_909)
    {
        float _961 = -_873;
        float _963 = _961 + 1.0;
        _935 = _963;
    }
    float _965 = _935;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _969 = _967 != 0;
    float _971 = exp2(_929);
    bool _973 = _897 > 0.5;
    bool _975 = _973 && _859;
    float _977 = -_919;
    float _979 = _905 + _977;
    float _981 = _905 * 6.283185482025146484375;
    float _983 = _919;
    float _985 = _981;
    if (_871)
    {
        _959 = _965;
    }
    float _987 = _959;
    float _989 = in.m_55.y;
    if (_859)
    {
        _983 = _883;
    }
    float _991 = _983;
    float _993 = _981 * 0.15915493667125701904296875;
    float _995 = _991;
    if (!_865)
    {
        _985 = _911;
    }
    float _997 = _985;
    float _999 = fma((*spvDescriptorSet0.vp_c9)._m0[85].y, _941, -0.5);
    float _1001 = _997;
    if (_865)
    {
        _1001 = _845;
    }
    float _1003 = _1001;
    float _1005 = _987 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1007 = _993 * 6.283185482025146484375;
    float _1009 = cos(_1007);
    if (_975)
    {
        float _1011 = -_991;
        float _1013 = _1011 + 1.0;
        _995 = _1013;
    }
    float _1015 = _995;
    float _1017 = _1005 * _867;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1021 = _949;
    if (!_865)
    {
        _937 = _949;
    }
    float _1023 = _937;
    float _1025 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _955);
    float _1027 = _1023;
    if (_859)
    {
        _893 = _1015;
    }
    float _1029 = _893;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_865)
    {
        _1021 = _911;
    }
    float _1033 = _1021;
    out.m_57.x = _1017;
    float _1035 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1025);
    if (_865)
    {
        _1027 = _911;
    }
    float _1037 = _1027;
    float _1039 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1019);
    bool _1041 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1043 = isnan(0.5);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1049 = _1045 || _1047;
    float _1051 = fma(_1009, 0.5, 0.5);
    float _1053 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1055 = -_989;
    float _1057 = _1055 + 1.0;
    bool _1059 = _911 > 0.5;
    float _1061 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1053);
    float _1063 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1065 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _1067 = _989;
    if (_969)
    {
        float _1069 = _1059 ? _1057 : _989;
        _1067 = _1069;
    }
    float _1071 = _1067;
    float _1073 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1075 = -_903;
    float _1077 = fma(_1063, 2.0, _1075);
    float _1079 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1085 = _979 < 0.5;
    float _1087 = float(_1085);
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1091 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1093 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1095 = -_979;
    float _1097 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1099 = _1089 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1101 = -_1087;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1105 = -_1051;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1109 = _1079 * _887;
    out.m_59.x = _1091;
    out.m_59.y = _1093;
    out.m_59.z = _1099;
    out.m_59.w = _1031;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1113 = fma(_1073, -2.0, _931);
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_57.y = _1109;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1119 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1061);
    float _1125 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1127 = -_120;
    float _1129 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1077);
    float _1131 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1039);
    float _1133 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1113);
    float _1135 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[11].x, _913);
    out.m_61.x = _1119;
    out.m_61.y = _1121;
    out.m_61.z = _1125;
    float _1137 = -_1133;
    float _1139 = fma(_1131, _999, _1137);
    float _1141 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1135);
    bool _1143 = !_953;
    int _1145 = _1143 ? 0 : 1;
    float _1147 = fma(_1123, _1065, _1129);
    float _1149 = float(_925);
    float _1151 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    int _1153 = abs(_1145);
    float _1155 = _943 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1157 = abs(_428);
    float _1159 = abs(_1097);
    float _1161 = _1149 * _1159;
    float _1163 = 1.0 / _1151;
    float _1165 = float(_1153);
    float _1167 = _1155 + _1151;
    float _1169 = float(_1157);
    float _1171 = _1147 + 0.5;
    float _1173 = fma(_1165, _1107, _1161);
    float _1175 = abs(_1103);
    float _1177 = fma(_1169, _1175, _1173);
    float _1179 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1035);
    float _1181 = _1167 * _1163;
    float _1183 = _1181 * 0.5;
    float _1185 = _1139 + 0.5;
    float _1187 = _1139;
    if (_1049)
    {
        _1187 = 1.0;
    }
    float _1189 = _1187;
    float _1191 = _1189;
    if (!_1049)
    {
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1195 = fma(_1183, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1193);
        float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1199 = _1197 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        float _1201 = 1.0 / _1195;
        float _1203 = 1.0 / _1199;
        float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1209 = fma(_1201, _1205, _1207);
        float _1211 = _1209 * _1203;
        float _1213 = precise::clamp(_1211, 0.0, 1.0);
        float _1215 = -_1213;
        float _1217 = _1215 + 1.0;
        _1191 = _1217;
    }
    float _1219 = _1191;
    float _1221 = -_971;
    float _1223 = _1221 + 1.0;
    float _1225 = _1219 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1229 = _1179 + _1227;
    bool _1231 = _1219 > 0.0;
    bool _1233 = isnan(_1219);
    bool _1235 = _1231 || _1233;
    bool _1237 = isnan(0.0);
    bool _1239 = _1235 || _1237;
    float _1241 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1243 = _1177 * _1225;
    out.m_57.w = _1185;
    float _1245 = _748 + _1229;
    float _1247 = _1241 * _822;
    float _1249 = -_1241;
    float _1251 = _1249 + 1.0;
    out.m_63.x = _502;
    out.m_63.y = _498;
    out.m_63.z = _506;
    float _1253 = _1245 * 0.5;
    float _1255 = _843 * _1247;
    float _1257 = _833 * _1247;
    float _1259 = _1243 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1261 = _833 * _1251;
    float _1263 = fma(_839, _1257, _827);
    float _1265 = fma(_841, _1257, _829);
    float _1267 = fma(_833, _1255, _831);
    out.m_57.z = _1171;
    out.gl_Position.x = _794;
    out.gl_Position.y = _788;
    out.gl_Position.z = _1229;
    out.gl_Position.w = _748;
    out.m_65.z = _1253;
    out.m_65.w = _748;
    out.m_45.x = _1259;
    out.m_67.x = _1263;
    out.m_67.y = _1265;
    out.m_67.z = _1267;
    out.m_67.w = _1261;
    if (_1239)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1269 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1269;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

