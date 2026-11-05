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
    float4 m_71 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_75 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _294 = false;
    bool _180 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1696 = as_type<float>(_116);
        out.gl_Position.z = _1696;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_47.w;
    float _122 = in.m_49.w;
    bool _124 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_120);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_120;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.w = _122;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_100);
        _110 = _140;
    }
    float _142 = _110;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _118 = as_type<int>(_154);
    }
    int _156 = _118;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1770 = as_type<float>(_156);
        out.gl_Position.z = _1770;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _160 = !_158;
    float _178;
    if (!_160)
    {
        float _162 = in.m_49.x;
        float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _168 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _170 = _168 * _164;
        float _172 = floor(_170);
        float _174 = -_172;
        float _176 = _170 + _174;
        _178 = _176;
        _180 = true;
    }
    else
    {
        float _182 = float(_100);
        float _184 = 1.0 / _182;
        float _186 = _136 * _184;
        _178 = _186;
    }
    _180 = false;
    float _188 = _178;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _192 = _188 + _190;
    bool _194 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _196 = isnan(_188);
    bool _198 = _194 || _196;
    bool _200 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _202 = _198 || _200;
    float _204 = float(_202);
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _206;
    bool _210 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _212 = 1.0 / _208;
    float _214 = -_204;
    float _216 = _214 + 1.0;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _218;
    float _222 = _192 * _212;
    bool _224 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _226 = isnan(_188);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _236;
    float _240 = fma(_220, _222, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _242;
    float _246 = _234 * _216;
    float _248 = fma(_238, _222, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _250 = fma(_244, _222, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _252 = -_234;
    float _254 = _252 + 1.0;
    float _256 = _240 * _246;
    float _258 = _248 * _246;
    float _260 = _250 * _246;
    float _262 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].z, _256);
    float _264 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].x, _258);
    float _266 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].y, _260);
    float _268 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[144].x, _264);
    float _270 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[144].y, _266);
    float _272 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[144].z, _262);
    bool _274 = !_210;
    float _292;
    if (!_274)
    {
        float _276 = in.m_49.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].x, _136);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_100);
        float _298 = 1.0 / _296;
        float _300 = _136 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = in.m_49.z;
    float _306 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _308 = log2(_306);
    float _310 = in.m_49.x;
    float _312 = in.m_49.y;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _316 = _314 != 0;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _320 = _318 != 0;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _324 = _322 != 0;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _328 = 1.0 + _326;
    bool _330 = !_316;
    int _332 = _330 ? 0 : 1;
    bool _334 = !_320;
    int _336 = _334 ? 0 : 1;
    float _338 = 1.0 / _328;
    float _340 = _308 * _136;
    int _342 = abs(_332);
    int _344 = abs(_336);
    float _346 = _304 * 2.0;
    float _348 = exp2(_340);
    float _350 = float(_342);
    float _352 = _310 * 2.0;
    float _354 = _312 * 2.0;
    float _356 = floor(_346);
    float _358 = floor(_352);
    float _360 = -_348;
    float _362 = _360 + 1.0;
    bool _364 = _356 > 0.0;
    float _366 = floor(_354);
    bool _368 = _356 >= 0.0;
    bool _370 = isnan(_356);
    bool _372 = _368 || _370;
    bool _374 = isnan(0.0);
    bool _376 = _372 || _374;
    float _378 = _304 + _312;
    int _380 = _376 ? 0 : 1;
    float _382 = _378 + (-1.0);
    bool _384 = _358 > 0.0;
    bool _386 = _358 >= 0.0;
    bool _388 = isnan(_358);
    bool _390 = _386 || _388;
    bool _392 = isnan(0.0);
    bool _394 = _390 || _392;
    float _396 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _398 = ~_380;
    int _400 = _398 + 1;
    int _402 = _400 + 1;
    float _404 = _310 + _312;
    int _406 = _394 ? 0 : 1;
    float _408 = _312 + (-0.5);
    int _410 = _402;
    if (!_364)
    {
        int _412 = ~_380;
        int _414 = _412 + 1;
        _410 = _414;
    }
    int _416 = _410;
    float _418 = _404 + (-1.0);
    int _420 = ~_406;
    int _422 = _420 + 1;
    int _424 = _422 + 1;
    bool _426 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _428 = isnan(0.0);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _434 = _430 || _432;
    float _436 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _438 = _424;
    if (!_384)
    {
        int _440 = ~_406;
        int _442 = _440 + 1;
        _438 = _442;
    }
    int _444 = _438;
    float _446 = in.m_53.x;
    float _448 = in.m_53.y;
    float _450 = in.m_53.z;
    bool _452 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _454 = isnan(1.0);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _460 = _456 || _458;
    float _462 = float(_416);
    float _464 = _434 ? _362 : 0.0;
    bool _466 = _366 > 0.0;
    float _468 = _350 * _462;
    float _470 = float(_344);
    float _472 = float(_444);
    float _474 = _468 * (-2.0);
    bool _476 = _366 >= 0.0;
    bool _478 = isnan(_366);
    bool _480 = _476 || _478;
    bool _482 = isnan(0.0);
    bool _484 = _480 || _482;
    if (_460)
    {
        float _486 = _464 * _338;
        _138 = _486;
    }
    float _488 = _138;
    bool _490 = !_324;
    int _492 = _490 ? 0 : 1;
    float _494 = _470 * _472;
    int _496 = _484 ? 0 : 1;
    float _498 = _310 + (-0.5);
    int _500 = abs(_492);
    float _502 = fma(_436, _474, _436);
    float _504 = _304 + _310;
    float _506 = fma(_474, _446, _446);
    int _508 = ~_496;
    int _510 = _508 + 1;
    int _512 = _510 + 1;
    float _514 = _504 + (-1.0);
    int _516 = _512;
    if (!_466)
    {
        int _518 = ~_496;
        int _520 = _518 + 1;
        _516 = _520;
    }
    int _522 = _516;
    float _524 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[196].x, _506);
    float _526 = _494 * (-2.0);
    float _528 = fma(_502, _488, _524);
    float _530 = fma(_526, _448, _448);
    float _532 = float(_500);
    float _534 = fma(_396, _526, _396);
    float _536 = float(_522);
    float _538 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[196].y, _530);
    float _540 = _528 * 0.15915493667125701904296875;
    float _542 = _532 * _536;
    float _544 = fma(_534, _488, _538);
    float _546 = in.m_55.x;
    float _548 = in.m_55.y;
    float _550 = in.m_55.z;
    float _552 = _542 * (-2.0);
    float _554 = _544 * 0.15915493667125701904296875;
    float _556 = _304 + (-0.5);
    float _558 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _560 = fma(_552, _450, _450);
    float _562 = in.m_57.x;
    float _564 = in.m_57.y;
    float _566 = in.m_57.z;
    float _568 = _540 * 6.283185482025146484375;
    float _570 = sin(_568);
    float _572 = fma(_558, _552, _558);
    float _574 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[196].z, _560);
    float _576 = fma(_572, _488, _574);
    float _578 = _540 * 6.283185482025146484375;
    float _580 = cos(_578);
    float _582 = in.m_42.x;
    float _584 = in.m_42.y;
    float _586 = in.m_42.z;
    float _588 = _576 * 0.15915493667125701904296875;
    bool _590 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _592 = isnan(0.5);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _598 = _594 || _596;
    float _600 = _554 * 6.283185482025146484375;
    float _602 = sin(_600);
    float _604 = _268 * _546;
    float _606 = _270 * _548;
    float _608 = _272 * _550;
    float _610 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _562);
    float _614 = _554 * 6.283185482025146484375;
    float _616 = cos(_614);
    float _618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _564);
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _566);
    float _622 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _624 = _618 * _610;
    float _626 = _620 * _622;
    float _628 = _588 * 6.283185482025146484375;
    float _630 = cos(_628);
    float _632 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _634 = _580 * _602;
    float _636 = _570 * _602;
    float _638 = _584 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _640 = _612 * _632;
    float _642 = _584 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _644 = _584 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _646 = _588 * 6.283185482025146484375;
    float _648 = sin(_646);
    float _650 = _570 * _616;
    float _652 = _580 * _616;
    float _654 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[6].x, _638);
    float _656 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[4].x, _642);
    float _658 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[5].x, _644);
    float _660 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[6].z, _654);
    float _662 = _580 * _630;
    float _664 = _570 * _630;
    float _666 = _616 * _630;
    float _668 = _602 * _630;
    float _670 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[5].z, _658);
    float _672 = _664 * _624;
    float _674 = -_634;
    float _676 = fma(_648, _650, _674);
    float _678 = -_650;
    float _680 = fma(_648, _634, _678);
    float _682 = fma(_648, _652, _636);
    float _684 = _662 * _624;
    float _686 = fma(_648, _636, _652);
    float _688 = -_624;
    float _690 = _648 * _688;
    float _692 = fma(_676, _640, _672);
    float _694 = fma(_682, _640, _684);
    float _696 = fma(_666, _640, _690);
    float _698 = fma(_686, _626, _692);
    float _700 = fma(_680, _626, _694);
    float _702 = fma(_668, _626, _696);
    float _704 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[4].z, _656);
    float _706 = _700 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _708 = _700 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _710 = _660 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _712 = _704 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _714 = fma(_702, (*spvDescriptorSet0.vp_c10)._m0[10].x, _706);
    float _716 = fma(_702, (*spvDescriptorSet0.vp_c10)._m0[8].x, _708);
    float _718 = _700 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _720 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[10].z, _714);
    float _722 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[8].z, _716);
    float _724 = fma(_702, (*spvDescriptorSet0.vp_c10)._m0[9].x, _718);
    float _726 = _710 + _720;
    float _728 = _712 + _722;
    float _730 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[9].z, _724);
    float _732 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _734 = _726 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _738 = _728 + _736;
    float _740 = _734 * _734;
    float _742 = fma(_738, _738, _740);
    float _744 = _670 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _746 = sqrt(_742);
    float _748 = _744 + _730;
    bool _750 = _746 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _752 = _582;
    float _754 = _586;
    float _756 = _670;
    float _758 = _746;
    float _760 = _742;
    if (!_750)
    {
        _752 = _728;
    }
    float _762 = _752;
    float _764 = _762;
    if (!_750)
    {
        _754 = _726;
    }
    float _766 = _754;
    float _768 = _766;
    if (!_750)
    {
        _756 = _748;
    }
    float _770 = _756;
    bool _772 = !_750;
    float _774 = _770;
    if (!_772)
    {
        float _776 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _780 = _746 + _778;
        float _782 = _748 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _784 = rsqrt(_742);
        float _786 = _780 * _776;
        float _788 = _786 * 0.15915493667125701904296875;
        float _790 = _788 * 6.283185482025146484375;
        float _792 = cos(_790);
        float _794 = _788 * 6.283185482025146484375;
        float _796 = sin(_794);
        float _798 = _792 + (-1.0);
        float _800 = _798 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _802 = fma(_796, _782, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _804 = fma(_748, _792, _800);
        float _806 = _784 * _802;
        float _808 = fma(_738, _806, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _810 = fma(_734, _806, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _768 = _810;
        _764 = _808;
        _774 = _804;
        _758 = _788;
    }
    float _812 = _768;
    float _814 = _764;
    float _816 = _774;
    float _818 = _758;
    float _820 = _816;
    float _822 = _814;
    float _824 = _812;
    float _826 = _818;
    if (!_598)
    {
        float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _830 = _744 + _828;
        float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _834 = _712 + _832;
        float _836 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _838 = -_710;
        float _840 = _838 + _812;
        float _842 = _830 * _830;
        float _844 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _846 = _710 + _844;
        float _848 = fma(_834, _834, _842);
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _852 = fma(_846, _846, _848);
        float _854 = sqrt(_852);
        float _856 = _836 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _858 = precise::min(_854, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _860 = _858 * _850;
        float _862 = -_712;
        float _864 = _862 + _814;
        float _866 = _856 * _860;
        float _868 = -_744;
        float _870 = _868 + _816;
        float _872 = fma(_864, _866, _712);
        float _874 = fma(_870, _866, _744);
        float _876 = fma(_840, _866, _710);
        _820 = _874;
        _822 = _872;
        _824 = _876;
        _826 = _866;
    }
    float _878 = _820;
    float _880 = _822;
    float _882 = _824;
    float _884 = _826;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _888 = _878 + _886;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _892 = _880 + _890;
    float _894 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _896 = _882 + _894;
    float _898 = _888 * _888;
    float _900 = fma(_892, _892, _898);
    float _902 = fma(_896, _896, _900);
    float _904 = rsqrt(_902);
    float _906 = sqrt(_902);
    float _908 = _904 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _910 = _892 * _908;
    float _912 = _896 * _908;
    float _914 = _910 * _910;
    float _916 = _912 * _912;
    float _918 = _914 + _916;
    float _920 = sqrt(_918);
    bool _922 = _920 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _926 = _920 + _924;
    float _928 = _904;
    float _930 = _918;
    float _932 = _926;
    float _934 = _884;
    float _936 = _888;
    if (_922)
    {
        float _938 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _928 = _938;
    }
    float _940 = _928;
    if (_922)
    {
        float _942 = rsqrt(_918);
        _930 = _942;
    }
    float _944 = _930;
    float _946 = _944;
    if (_922)
    {
        float _948 = _926 * _940;
        _932 = _948;
    }
    float _950 = _932;
    if (_922)
    {
        float _952 = _950 * 0.15915493667125701904296875;
        _934 = _952;
    }
    float _954 = _934;
    float _956 = _896;
    float _958 = _954;
    if (_922)
    {
        float _960 = _954 * 6.283185482025146484375;
        float _962 = sin(_960);
        _956 = _962;
    }
    float _964 = _956;
    float _966 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _968 = precise::max(0.0, _966);
    float _970 = _940;
    float _972 = _968;
    if (_922)
    {
        float _974 = _954 * 6.283185482025146484375;
        float _976 = cos(_974);
        _970 = _976;
    }
    float _978 = _970;
    float _980 = -_908;
    float _982 = -_968;
    float _984 = fma(_888, _980, _982);
    if (_922)
    {
        float _986 = _984 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _936 = _986;
    }
    float _988 = _936;
    float _990 = _988;
    float _992 = _964;
    if (_922)
    {
        float _994 = fma(_964, _988, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _990 = _994;
    }
    float _996 = _990;
    float _998 = _996;
    if (!_922)
    {
        _992 = _910;
    }
    float _1000 = _992;
    float _1002 = _1000;
    float _1004 = _978;
    if (_922)
    {
        float _1006 = _978 + (-1.0);
        _972 = _1006;
    }
    float _1008 = _972;
    float _1010 = _1008;
    if (_922)
    {
        float _1012 = _944 * _996;
        _760 = _1012;
    }
    float _1014 = _760;
    if (!_922)
    {
        _998 = _984;
    }
    float _1016 = _998;
    float _1018 = _1016;
    if (_922)
    {
        float _1020 = _1008 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _958 = _1020;
    }
    float _1022 = _958;
    if (_922)
    {
        float _1024 = _910 * _1014;
        _1002 = _1024;
    }
    float _1026 = _1002;
    if (!_922)
    {
        _1010 = _912;
    }
    float _1028 = _1010;
    float _1030 = _1028;
    if (_922)
    {
        float _1032 = _912 * _1014;
        _1030 = _1032;
    }
    float _1034 = _1030;
    if (!_922)
    {
        _946 = _914;
    }
    float _1036 = _946;
    float _1038 = _1036;
    if (_922)
    {
        float _1040 = fma(_984, _978, _1022);
        _1018 = _1040;
    }
    float _1042 = _1018;
    if (_922)
    {
        float _1044 = _1026 * _1026;
        _1038 = _1044;
    }
    float _1046 = _1038;
    if (!_922)
    {
        _1004 = _916;
    }
    float _1048 = _1004;
    float _1050 = _1048;
    if (_922)
    {
        float _1052 = _1034 * _1034;
        _1050 = _1052;
    }
    float _1054 = _1050;
    float _1056 = fma(_1042, _1042, _1046);
    float _1058 = _878 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1060 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1062 = _1056 + _1054;
    float _1064 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1058);
    float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1068 = fma(_906, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1066);
    float _1070 = precise::clamp(_1068, 0.0, 1.0);
    float _1072 = _878 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1074 = rsqrt(_1062);
    float _1076 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1064);
    float _1078 = _878 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1080 = -_1070;
    float _1082 = _1080 + 1.0;
    float _1084 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1072);
    float _1086 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1088 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1078);
    float _1090 = _878 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1092 = abs(_1082);
    float _1094 = log2(_1092);
    float _1096 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1084);
    float _1098 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1088);
    float _1100 = _1086 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1102 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1090);
    float _1104 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1106 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1108 = -_1100;
    float _1110 = fma(_1108, _1060, 1.0);
    float _1112 = _1074 * _1026;
    float _1114 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1116 = _1074 * _1042;
    float _1118 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1102);
    float _1120 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1122 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1114);
    float _1124 = _1074 * _1034;
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1128 = -_1120;
    float _1130 = fma(_1116, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1128);
    float _1132 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1134 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1122);
    float _1136 = log2(_1110);
    float _1138 = -_1124;
    float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1130);
    float _1142 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1144 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1134);
    float _1146 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1148 = fma(_1140, -0.5, 0.5);
    float _1150 = fma(_1140, 0.5, 0.5);
    float _1152 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1142);
    float _1154 = exp2(_1132);
    float _1156 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1146);
    float _1158 = _1116 + 1.0;
    float _1160 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1152);
    float _1162 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1156);
    float _1164 = 1.0 / _1144;
    float _1166 = fma(_1150, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1168 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1162);
    float _1170 = _1136 * 0.693147182464599609375;
    float _1172 = fma(_1150, _1166, -0.212114393711090087890625);
    float _1174 = _1170 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1176 = sqrt(_1148);
    float _1178 = -_1116;
    float _1180 = fma(_1154, _1158, _1178);
    float _1182 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1160);
    float _1184 = fma(_1150, _1172, 1.570728778839111328125);
    float _1186 = fma(_1180, 0.5, 0.5);
    float _1188 = _1182 * _1164;
    float _1190 = _1168 * _1164;
    float _1192 = fma(_1188, 0.5, 0.5);
    float _1194 = fma(_1190, -0.5, 0.5);
    float _1196 = _1176 * 0.636619746685028076171875;
    float3 _3387 = float3(_1192, _1194, _1174);
    float _1198 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3387, float3(0.0), isnan(_3387)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3387, float3(0.0), isnan(_3387)), level(0.0)).x;
    float _1200 = -_1184;
    float _1202 = fma(_1196, _1200, 1.0);
    float3 _3403 = float3(_1192, _1194, _1174);
    float4 _1205 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3403, float3(0.0), isnan(_3403)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3403, float3(0.0), isnan(_3403)), level(0.0)).xyzw;
    float _1207 = _1205.x;
    float _1209 = _1205.y;
    float _1211 = _1205.z;
    float _1213 = _1205.w;
    float2 _3420 = float2(_1202, _1186);
    float3 _1217 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3420, float2(0.0), isnan(_3420)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3420, float2(0.0), isnan(_3420)), level(0.0)).xyz;
    float _1219 = _1217.x;
    float _1221 = _1217.y;
    float _1223 = _1217.z;
    float _1225 = in.m_59.y;
    float _1227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1231 = _1229 != 0;
    float _1233 = in.m_59.x;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1237 = _1235 != 0;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1239;
    bool _1243 = _304 > 0.5;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1247 = _302 + _1245;
    out.m_45.x = 1.0;
    bool _1249 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1251 = isnan(_302);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = 1.0 / _1241;
    bool _1263 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1265 = isnan(_302);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1271);
    float _1275 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = _880;
    out.m_61.y = _878;
    out.m_61.z = _882;
    float _1277 = -_1259;
    float _1279 = _1277 + 1.0;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1281;
    float _1285 = _1190;
    if (_1231)
    {
        float _1287 = in.m_49.y;
        _1285 = _1287;
    }
    float _1289 = _1285;
    float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1293 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1275);
    float _1295 = -_1225;
    float _1297 = _1295 + 1.0;
    float _1299 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1293);
    float _1301 = _1247 * _1261;
    float _1303 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1299);
    float _1305 = fma(_1283, _1301, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1307 = _1225;
    if (_1237)
    {
        float _1309 = _1243 ? _1297 : _1225;
        _1307 = _1309;
    }
    float _1311 = _1307;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1313;
    bool _1317 = _564 != 0.0;
    bool _1319 = isnan(_564);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan(0.0);
    bool _1325 = _1321 || _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1327;
    float _1331 = 0.0;
    float _1333 = _1233;
    if (_1231)
    {
        _1331 = _1233;
    }
    float _1335 = _1331;
    float _1337 = fma(_1315, _1301, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1339 = _562 == 0.0;
    bool _1341 = !_1325;
    bool _1343 = _1339 && _1341;
    float _1345 = fma(_1329, _1301, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1347 = _1273 * _1279;
    float _1349 = -_1273;
    float _1351 = _1349 + 1.0;
    bool _1353 = _1289 > 0.5;
    bool _1355 = _1353 && _1231;
    float _1357 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1359 = in.m_63.x;
    float _1361 = in.m_63.y;
    float _1363 = in.m_63.z;
    float _1365 = _1337 * _1347;
    float _1367 = _1345 * _1347;
    bool _1369 = _566 == 0.0;
    bool _1371 = _1369 && _1343;
    float _1373 = _1305 * _1347;
    float _1375 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1365);
    float _1377 = in.m_65.x;
    float _1379 = in.m_65.y;
    float _1381 = in.m_65.z;
    float _1383 = in.m_65.w;
    float _1385 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1367);
    float _1387 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1373);
    out.gl_Position.x = _1182;
    out.gl_Position.y = _1168;
    out.gl_Position.z = _1303;
    out.gl_Position.w = _1144;
    float _1389 = _1335;
    float _1391 = _1351;
    float _1393 = _1373;
    float _1395 = _1365;
    if (_1355)
    {
        float _1397 = -_1335;
        float _1399 = _1397 + 1.0;
        _1389 = _1399;
    }
    float _1401 = _1389;
    float _1403 = _1401;
    if (_1231)
    {
        _1333 = _1401;
    }
    float _1405 = _1333;
    float _1407 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1409 = 0.0;
    if (_1371)
    {
        _1409 = _1361;
    }
    float _1411 = _1409;
    float _1413 = _1411;
    if (_1371)
    {
        _1403 = _1359;
    }
    float _1415 = _1403;
    float _1417 = _1415;
    if (_1371)
    {
        _1391 = _1411;
    }
    float _1419 = _1391;
    float _1421 = _1419;
    if (!_1371)
    {
        _1413 = _1361;
    }
    float _1423 = _1413;
    float _1425 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1375);
    if (_1371)
    {
        _1393 = _1415;
    }
    float _1427 = _1393;
    float _1429 = _1427;
    if (!_1371)
    {
        _1417 = _1359;
    }
    float _1431 = _1417;
    if (!_1371)
    {
        float _1433 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1423);
        _1421 = _1433;
    }
    float _1435 = _1421;
    float _1437 = _1357 * _1227;
    if (_1371)
    {
        _1395 = _1363;
    }
    float _1439 = _1395;
    float _1441 = _1439;
    if (!_1371)
    {
        float _1443 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1363);
        _1441 = _1443;
    }
    float _1445 = _1441;
    float _1447 = _1381 * _1431;
    if (!_1371)
    {
        float _1449 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1431);
        _1429 = _1449;
    }
    float _1451 = _1429;
    float _1453 = _1407 * _1291;
    float _1455 = _1379 * _1363;
    float _1457 = -_1447;
    float _1459 = fma(_1377, _1363, _1457);
    float _1461 = _1377 * _1423;
    float _1463 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1385);
    float _1465 = -_1455;
    float _1467 = fma(_1381, _1423, _1465);
    float _1469 = _1459 * _1383;
    float _1471 = -_1461;
    float _1473 = fma(_1379, _1431, _1471);
    out.m_67.x = _1453;
    out.m_67.y = _1437;
    float _1475 = -_1435;
    float _1477 = _648 * _1475;
    float _1479 = -_1379;
    float _1481 = _648 * _1479;
    float _1483 = -_1469;
    float _1485 = _648 * _1483;
    float _1487 = _1467 * _1383;
    float _1489 = _1473 * _1383;
    float _1491 = _664 * _1435;
    float _1493 = _662 * _1469;
    float _1495 = fma(_666, _1487, _1485);
    float _1497 = fma(_666, _1377, _1481);
    float _1499 = _662 * _1379;
    float _1501 = _664 * _1379;
    float _1503 = _662 * _1435;
    float _1505 = _664 * _1469;
    float _1507 = fma(_682, _1377, _1499);
    float _1509 = fma(_676, _1451, _1491);
    float _1511 = fma(_676, _1377, _1501);
    float _1513 = fma(_682, _1451, _1503);
    float _1515 = fma(_682, _1487, _1493);
    float _1517 = fma(_676, _1487, _1505);
    float _1519 = fma(_680, _1381, _1507);
    float _1521 = fma(_666, _1451, _1477);
    float _1523 = fma(_686, _1445, _1509);
    float _1525 = fma(_686, _1381, _1511);
    float _1527 = fma(_668, _1489, _1495);
    float _1529 = fma(_680, _1445, _1513);
    float _1531 = fma(_680, _1489, _1515);
    float _1533 = fma(_686, _1489, _1517);
    float _1535 = fma(_668, _1381, _1497);
    float _1537 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1539 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1541 = fma(_668, _1445, _1521);
    float _1543 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1545 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1547 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1549 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1551 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1537);
    float _1553 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1539);
    float _1555 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1557 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1559 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1561 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1563 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1543);
    float _1565 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1387);
    float _1567 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1545);
    float _1569 = exp2(_1561);
    float _1571 = fma(_1527, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1555);
    float _1573 = fma(_1525, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1551);
    float _1575 = fma(_1525, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1563);
    float _1577 = fma(_1525, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1553);
    float _1579 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1581 = _1463 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1583 = _1565 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1585 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1571);
    float _1587 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1589 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1591 = _1583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1573;
    out.m_69.y = _1575;
    out.m_69.z = _1577;
    float _1593 = _1303 + _1144;
    float _1595 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1547);
    float _1597 = fma(_1527, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1557);
    float _1599 = -_1569;
    float _1601 = _1599 + 1.0;
    out.m_71.x = _1587;
    out.m_71.y = _1589;
    out.m_71.z = _1591;
    float _1603 = _1593 * 0.5;
    float _1605 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1549);
    float _1607 = fma(_1527, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1559);
    float _1609 = fma(_1523, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1595);
    float _1611 = fma(_1523, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1567);
    float _1613 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1597);
    float _1615 = fma(_1523, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1605);
    float _1617 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1607);
    float _1619 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1621 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _1611;
    out.m_73.y = _1609;
    out.m_73.z = _1615;
    out.m_75.x = _1585;
    out.m_75.y = _1613;
    out.m_75.z = _1617;
    out.m_77.z = _1603;
    out.m_77.w = _1144;
    out.m_79.w = _1621;
    float _1623 = _1619 * _1198;
    float _1625 = -_1619;
    float _1627 = _1625 + 1.0;
    float _1629 = _1213 * _1623;
    float _1631 = _1213 * _1627;
    float _1633 = _1223 * _1623;
    float _1635 = fma(_1219, _1629, _1207);
    float _1637 = fma(_1221, _1629, _1209);
    float _1639 = fma(_1213, _1633, _1211);
    out.m_81.x = _1635;
    out.m_81.y = _1637;
    out.m_81.z = _1639;
    out.m_81.w = _1631;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _294 = false;
    bool _180 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1696 = as_type<float>(_116);
        out.gl_Position.z = _1696;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_47.w;
    float _122 = in.m_49.w;
    bool _124 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_120);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_120;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.w = _122;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_100);
        _110 = _140;
    }
    float _142 = _110;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _118 = as_type<int>(_154);
    }
    int _156 = _118;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1770 = as_type<float>(_156);
        out.gl_Position.z = _1770;
    }
    if (_148)
    {
        return out;
    }
    bool _158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _160 = !_158;
    float _178;
    if (!_160)
    {
        float _162 = in.m_49.x;
        float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _168 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _170 = _168 * _164;
        float _172 = floor(_170);
        float _174 = -_172;
        float _176 = _170 + _174;
        _178 = _176;
        _180 = true;
    }
    else
    {
        float _182 = float(_100);
        float _184 = 1.0 / _182;
        float _186 = _136 * _184;
        _178 = _186;
    }
    _180 = false;
    float _188 = _178;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _192 = _188 + _190;
    bool _194 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _196 = isnan(_188);
    bool _198 = _194 || _196;
    bool _200 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _202 = _198 || _200;
    float _204 = float(_202);
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _206;
    bool _210 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _212 = 1.0 / _208;
    float _214 = -_204;
    float _216 = _214 + 1.0;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _218;
    float _222 = _192 * _212;
    bool _224 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _226 = isnan(_188);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _236;
    float _240 = fma(_220, _222, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _242;
    float _246 = _234 * _216;
    float _248 = fma(_238, _222, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _250 = fma(_244, _222, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _252 = -_234;
    float _254 = _252 + 1.0;
    float _256 = _240 * _246;
    float _258 = _248 * _246;
    float _260 = _250 * _246;
    float _262 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].z, _256);
    float _264 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].x, _258);
    float _266 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].y, _260);
    float _268 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[144].x, _264);
    float _270 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[144].y, _266);
    float _272 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[144].z, _262);
    bool _274 = !_210;
    float _292;
    if (!_274)
    {
        float _276 = in.m_49.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].x, _136);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_100);
        float _298 = 1.0 / _296;
        float _300 = _136 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = in.m_49.z;
    float _306 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _308 = log2(_306);
    float _310 = in.m_49.x;
    float _312 = in.m_49.y;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _316 = _314 != 0;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _320 = _318 != 0;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _324 = _322 != 0;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _328 = 1.0 + _326;
    bool _330 = !_316;
    int _332 = _330 ? 0 : 1;
    bool _334 = !_320;
    int _336 = _334 ? 0 : 1;
    float _338 = 1.0 / _328;
    float _340 = _308 * _136;
    int _342 = abs(_332);
    int _344 = abs(_336);
    float _346 = _304 * 2.0;
    float _348 = exp2(_340);
    float _350 = float(_342);
    float _352 = _310 * 2.0;
    float _354 = _312 * 2.0;
    float _356 = floor(_346);
    float _358 = floor(_352);
    float _360 = -_348;
    float _362 = _360 + 1.0;
    bool _364 = _356 > 0.0;
    float _366 = floor(_354);
    bool _368 = _356 >= 0.0;
    bool _370 = isnan(_356);
    bool _372 = _368 || _370;
    bool _374 = isnan(0.0);
    bool _376 = _372 || _374;
    float _378 = _304 + _312;
    int _380 = _376 ? 0 : 1;
    float _382 = _378 + (-1.0);
    bool _384 = _358 > 0.0;
    bool _386 = _358 >= 0.0;
    bool _388 = isnan(_358);
    bool _390 = _386 || _388;
    bool _392 = isnan(0.0);
    bool _394 = _390 || _392;
    float _396 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _398 = ~_380;
    int _400 = _398 + 1;
    int _402 = _400 + 1;
    float _404 = _310 + _312;
    int _406 = _394 ? 0 : 1;
    float _408 = _312 + (-0.5);
    int _410 = _402;
    if (!_364)
    {
        int _412 = ~_380;
        int _414 = _412 + 1;
        _410 = _414;
    }
    int _416 = _410;
    float _418 = _404 + (-1.0);
    int _420 = ~_406;
    int _422 = _420 + 1;
    int _424 = _422 + 1;
    bool _426 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _428 = isnan(0.0);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _434 = _430 || _432;
    float _436 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _438 = _424;
    if (!_384)
    {
        int _440 = ~_406;
        int _442 = _440 + 1;
        _438 = _442;
    }
    int _444 = _438;
    float _446 = in.m_53.x;
    float _448 = in.m_53.y;
    float _450 = in.m_53.z;
    bool _452 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _454 = isnan(1.0);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _460 = _456 || _458;
    float _462 = float(_416);
    float _464 = _434 ? _362 : 0.0;
    bool _466 = _366 > 0.0;
    float _468 = _350 * _462;
    float _470 = float(_344);
    float _472 = float(_444);
    float _474 = _468 * (-2.0);
    bool _476 = _366 >= 0.0;
    bool _478 = isnan(_366);
    bool _480 = _476 || _478;
    bool _482 = isnan(0.0);
    bool _484 = _480 || _482;
    if (_460)
    {
        float _486 = _464 * _338;
        _138 = _486;
    }
    float _488 = _138;
    bool _490 = !_324;
    int _492 = _490 ? 0 : 1;
    float _494 = _470 * _472;
    int _496 = _484 ? 0 : 1;
    float _498 = _310 + (-0.5);
    int _500 = abs(_492);
    float _502 = fma(_436, _474, _436);
    float _504 = _304 + _310;
    float _506 = fma(_474, _446, _446);
    int _508 = ~_496;
    int _510 = _508 + 1;
    int _512 = _510 + 1;
    float _514 = _504 + (-1.0);
    int _516 = _512;
    if (!_466)
    {
        int _518 = ~_496;
        int _520 = _518 + 1;
        _516 = _520;
    }
    int _522 = _516;
    float _524 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[196].x, _506);
    float _526 = _494 * (-2.0);
    float _528 = fma(_502, _488, _524);
    float _530 = fma(_526, _448, _448);
    float _532 = float(_500);
    float _534 = fma(_396, _526, _396);
    float _536 = float(_522);
    float _538 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[196].y, _530);
    float _540 = _528 * 0.15915493667125701904296875;
    float _542 = _532 * _536;
    float _544 = fma(_534, _488, _538);
    float _546 = in.m_55.x;
    float _548 = in.m_55.y;
    float _550 = in.m_55.z;
    float _552 = _542 * (-2.0);
    float _554 = _544 * 0.15915493667125701904296875;
    float _556 = _304 + (-0.5);
    float _558 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _560 = fma(_552, _450, _450);
    float _562 = in.m_57.x;
    float _564 = in.m_57.y;
    float _566 = in.m_57.z;
    float _568 = _540 * 6.283185482025146484375;
    float _570 = sin(_568);
    float _572 = fma(_558, _552, _558);
    float _574 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[196].z, _560);
    float _576 = fma(_572, _488, _574);
    float _578 = _540 * 6.283185482025146484375;
    float _580 = cos(_578);
    float _582 = in.m_42.x;
    float _584 = in.m_42.y;
    float _586 = in.m_42.z;
    float _588 = _576 * 0.15915493667125701904296875;
    bool _590 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _592 = isnan(0.5);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _598 = _594 || _596;
    float _600 = _554 * 6.283185482025146484375;
    float _602 = sin(_600);
    float _604 = _268 * _546;
    float _606 = _270 * _548;
    float _608 = _272 * _550;
    float _610 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _562);
    float _614 = _554 * 6.283185482025146484375;
    float _616 = cos(_614);
    float _618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _564);
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _566);
    float _622 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _624 = _618 * _610;
    float _626 = _620 * _622;
    float _628 = _588 * 6.283185482025146484375;
    float _630 = cos(_628);
    float _632 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _634 = _580 * _602;
    float _636 = _570 * _602;
    float _638 = _584 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _640 = _612 * _632;
    float _642 = _584 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _644 = _584 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _646 = _588 * 6.283185482025146484375;
    float _648 = sin(_646);
    float _650 = _570 * _616;
    float _652 = _580 * _616;
    float _654 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[6].x, _638);
    float _656 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[4].x, _642);
    float _658 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[5].x, _644);
    float _660 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[6].z, _654);
    float _662 = _580 * _630;
    float _664 = _570 * _630;
    float _666 = _616 * _630;
    float _668 = _602 * _630;
    float _670 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[5].z, _658);
    float _672 = _664 * _624;
    float _674 = -_634;
    float _676 = fma(_648, _650, _674);
    float _678 = -_650;
    float _680 = fma(_648, _634, _678);
    float _682 = fma(_648, _652, _636);
    float _684 = _662 * _624;
    float _686 = fma(_648, _636, _652);
    float _688 = -_624;
    float _690 = _648 * _688;
    float _692 = fma(_676, _640, _672);
    float _694 = fma(_682, _640, _684);
    float _696 = fma(_666, _640, _690);
    float _698 = fma(_686, _626, _692);
    float _700 = fma(_680, _626, _694);
    float _702 = fma(_668, _626, _696);
    float _704 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[4].z, _656);
    float _706 = _700 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _708 = _700 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _710 = _660 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _712 = _704 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _714 = fma(_702, (*spvDescriptorSet0.vp_c10)._m0[10].x, _706);
    float _716 = fma(_702, (*spvDescriptorSet0.vp_c10)._m0[8].x, _708);
    float _718 = _700 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _720 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[10].z, _714);
    float _722 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[8].z, _716);
    float _724 = fma(_702, (*spvDescriptorSet0.vp_c10)._m0[9].x, _718);
    float _726 = _710 + _720;
    float _728 = _712 + _722;
    float _730 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[9].z, _724);
    float _732 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _734 = _726 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _738 = _728 + _736;
    float _740 = _734 * _734;
    float _742 = fma(_738, _738, _740);
    float _744 = _670 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _746 = sqrt(_742);
    float _748 = _744 + _730;
    bool _750 = _746 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _752 = _582;
    float _754 = _586;
    float _756 = _670;
    float _758 = _746;
    float _760 = _742;
    if (!_750)
    {
        _752 = _728;
    }
    float _762 = _752;
    float _764 = _762;
    if (!_750)
    {
        _754 = _726;
    }
    float _766 = _754;
    float _768 = _766;
    if (!_750)
    {
        _756 = _748;
    }
    float _770 = _756;
    bool _772 = !_750;
    float _774 = _770;
    if (!_772)
    {
        float _776 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _780 = _746 + _778;
        float _782 = _748 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _784 = rsqrt(_742);
        float _786 = _780 * _776;
        float _788 = _786 * 0.15915493667125701904296875;
        float _790 = _788 * 6.283185482025146484375;
        float _792 = cos(_790);
        float _794 = _788 * 6.283185482025146484375;
        float _796 = sin(_794);
        float _798 = _792 + (-1.0);
        float _800 = _798 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _802 = fma(_796, _782, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _804 = fma(_748, _792, _800);
        float _806 = _784 * _802;
        float _808 = fma(_738, _806, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _810 = fma(_734, _806, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _768 = _810;
        _764 = _808;
        _774 = _804;
        _758 = _788;
    }
    float _812 = _768;
    float _814 = _764;
    float _816 = _774;
    float _818 = _758;
    float _820 = _816;
    float _822 = _814;
    float _824 = _812;
    float _826 = _818;
    if (!_598)
    {
        float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _830 = _744 + _828;
        float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _834 = _712 + _832;
        float _836 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _838 = -_710;
        float _840 = _838 + _812;
        float _842 = _830 * _830;
        float _844 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _846 = _710 + _844;
        float _848 = fma(_834, _834, _842);
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _852 = fma(_846, _846, _848);
        float _854 = sqrt(_852);
        float _856 = _836 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _858 = precise::min(_854, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _860 = _858 * _850;
        float _862 = -_712;
        float _864 = _862 + _814;
        float _866 = _856 * _860;
        float _868 = -_744;
        float _870 = _868 + _816;
        float _872 = fma(_864, _866, _712);
        float _874 = fma(_870, _866, _744);
        float _876 = fma(_840, _866, _710);
        _820 = _874;
        _822 = _872;
        _824 = _876;
        _826 = _866;
    }
    float _878 = _820;
    float _880 = _822;
    float _882 = _824;
    float _884 = _826;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _888 = _878 + _886;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _892 = _880 + _890;
    float _894 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _896 = _882 + _894;
    float _898 = _888 * _888;
    float _900 = fma(_892, _892, _898);
    float _902 = fma(_896, _896, _900);
    float _904 = rsqrt(_902);
    float _906 = sqrt(_902);
    float _908 = _904 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _910 = _892 * _908;
    float _912 = _896 * _908;
    float _914 = _910 * _910;
    float _916 = _912 * _912;
    float _918 = _914 + _916;
    float _920 = sqrt(_918);
    bool _922 = _920 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _926 = _920 + _924;
    float _928 = _904;
    float _930 = _918;
    float _932 = _926;
    float _934 = _884;
    float _936 = _888;
    if (_922)
    {
        float _938 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _928 = _938;
    }
    float _940 = _928;
    if (_922)
    {
        float _942 = rsqrt(_918);
        _930 = _942;
    }
    float _944 = _930;
    float _946 = _944;
    if (_922)
    {
        float _948 = _926 * _940;
        _932 = _948;
    }
    float _950 = _932;
    if (_922)
    {
        float _952 = _950 * 0.15915493667125701904296875;
        _934 = _952;
    }
    float _954 = _934;
    float _956 = _896;
    float _958 = _954;
    if (_922)
    {
        float _960 = _954 * 6.283185482025146484375;
        float _962 = sin(_960);
        _956 = _962;
    }
    float _964 = _956;
    float _966 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _968 = precise::max(0.0, _966);
    float _970 = _940;
    float _972 = _968;
    if (_922)
    {
        float _974 = _954 * 6.283185482025146484375;
        float _976 = cos(_974);
        _970 = _976;
    }
    float _978 = _970;
    float _980 = -_908;
    float _982 = -_968;
    float _984 = fma(_888, _980, _982);
    if (_922)
    {
        float _986 = _984 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _936 = _986;
    }
    float _988 = _936;
    float _990 = _988;
    float _992 = _964;
    if (_922)
    {
        float _994 = fma(_964, _988, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _990 = _994;
    }
    float _996 = _990;
    float _998 = _996;
    if (!_922)
    {
        _992 = _910;
    }
    float _1000 = _992;
    float _1002 = _1000;
    float _1004 = _978;
    if (_922)
    {
        float _1006 = _978 + (-1.0);
        _972 = _1006;
    }
    float _1008 = _972;
    float _1010 = _1008;
    if (_922)
    {
        float _1012 = _944 * _996;
        _760 = _1012;
    }
    float _1014 = _760;
    if (!_922)
    {
        _998 = _984;
    }
    float _1016 = _998;
    float _1018 = _1016;
    if (_922)
    {
        float _1020 = _1008 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _958 = _1020;
    }
    float _1022 = _958;
    if (_922)
    {
        float _1024 = _910 * _1014;
        _1002 = _1024;
    }
    float _1026 = _1002;
    if (!_922)
    {
        _1010 = _912;
    }
    float _1028 = _1010;
    float _1030 = _1028;
    if (_922)
    {
        float _1032 = _912 * _1014;
        _1030 = _1032;
    }
    float _1034 = _1030;
    if (!_922)
    {
        _946 = _914;
    }
    float _1036 = _946;
    float _1038 = _1036;
    if (_922)
    {
        float _1040 = fma(_984, _978, _1022);
        _1018 = _1040;
    }
    float _1042 = _1018;
    if (_922)
    {
        float _1044 = _1026 * _1026;
        _1038 = _1044;
    }
    float _1046 = _1038;
    if (!_922)
    {
        _1004 = _916;
    }
    float _1048 = _1004;
    float _1050 = _1048;
    if (_922)
    {
        float _1052 = _1034 * _1034;
        _1050 = _1052;
    }
    float _1054 = _1050;
    float _1056 = fma(_1042, _1042, _1046);
    float _1058 = _878 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1060 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1062 = _1056 + _1054;
    float _1064 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1058);
    float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1068 = fma(_906, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1066);
    float _1070 = precise::clamp(_1068, 0.0, 1.0);
    float _1072 = _878 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1074 = rsqrt(_1062);
    float _1076 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1064);
    float _1078 = _878 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1080 = -_1070;
    float _1082 = _1080 + 1.0;
    float _1084 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1072);
    float _1086 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1088 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1078);
    float _1090 = _878 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1092 = abs(_1082);
    float _1094 = log2(_1092);
    float _1096 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1084);
    float _1098 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1088);
    float _1100 = _1086 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1102 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1090);
    float _1104 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1106 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1108 = -_1100;
    float _1110 = fma(_1108, _1060, 1.0);
    float _1112 = _1074 * _1026;
    float _1114 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1116 = _1074 * _1042;
    float _1118 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1102);
    float _1120 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1122 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1114);
    float _1124 = _1074 * _1034;
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1128 = -_1120;
    float _1130 = fma(_1116, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1128);
    float _1132 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1134 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1122);
    float _1136 = log2(_1110);
    float _1138 = -_1124;
    float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1130);
    float _1142 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1144 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1134);
    float _1146 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1148 = fma(_1140, -0.5, 0.5);
    float _1150 = fma(_1140, 0.5, 0.5);
    float _1152 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1142);
    float _1154 = exp2(_1132);
    float _1156 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1146);
    float _1158 = _1116 + 1.0;
    float _1160 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1152);
    float _1162 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1156);
    float _1164 = 1.0 / _1144;
    float _1166 = fma(_1150, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1168 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1162);
    float _1170 = _1136 * 0.693147182464599609375;
    float _1172 = fma(_1150, _1166, -0.212114393711090087890625);
    float _1174 = _1170 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1176 = sqrt(_1148);
    float _1178 = -_1116;
    float _1180 = fma(_1154, _1158, _1178);
    float _1182 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1160);
    float _1184 = fma(_1150, _1172, 1.570728778839111328125);
    float _1186 = fma(_1180, 0.5, 0.5);
    float _1188 = _1182 * _1164;
    float _1190 = _1168 * _1164;
    float _1192 = fma(_1188, 0.5, 0.5);
    float _1194 = fma(_1190, -0.5, 0.5);
    float _1196 = _1176 * 0.636619746685028076171875;
    float3 _3387 = float3(_1192, _1194, _1174);
    float _1198 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3387, float3(0.0), isnan(_3387)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3387, float3(0.0), isnan(_3387)), level(0.0)).x;
    float _1200 = -_1184;
    float _1202 = fma(_1196, _1200, 1.0);
    float3 _3403 = float3(_1192, _1194, _1174);
    float4 _1205 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3403, float3(0.0), isnan(_3403)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3403, float3(0.0), isnan(_3403)), level(0.0)).xyzw;
    float _1207 = _1205.x;
    float _1209 = _1205.y;
    float _1211 = _1205.z;
    float _1213 = _1205.w;
    float2 _3420 = float2(_1202, _1186);
    float3 _1217 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3420, float2(0.0), isnan(_3420)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3420, float2(0.0), isnan(_3420)), level(0.0)).xyz;
    float _1219 = _1217.x;
    float _1221 = _1217.y;
    float _1223 = _1217.z;
    float _1225 = in.m_59.y;
    float _1227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1231 = _1229 != 0;
    float _1233 = in.m_59.x;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1237 = _1235 != 0;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1239;
    bool _1243 = _304 > 0.5;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1247 = _302 + _1245;
    out.m_45.x = 1.0;
    bool _1249 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1251 = isnan(_302);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = 1.0 / _1241;
    bool _1263 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1265 = isnan(_302);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1271);
    float _1275 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = _880;
    out.m_61.y = _878;
    out.m_61.z = _882;
    float _1277 = -_1259;
    float _1279 = _1277 + 1.0;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1281;
    float _1285 = _1190;
    if (_1231)
    {
        float _1287 = in.m_49.y;
        _1285 = _1287;
    }
    float _1289 = _1285;
    float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1293 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1275);
    float _1295 = -_1225;
    float _1297 = _1295 + 1.0;
    float _1299 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1293);
    float _1301 = _1247 * _1261;
    float _1303 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1299);
    float _1305 = fma(_1283, _1301, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1307 = _1225;
    if (_1237)
    {
        float _1309 = _1243 ? _1297 : _1225;
        _1307 = _1309;
    }
    float _1311 = _1307;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1313;
    bool _1317 = _564 != 0.0;
    bool _1319 = isnan(_564);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan(0.0);
    bool _1325 = _1321 || _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1327;
    float _1331 = 0.0;
    float _1333 = _1233;
    if (_1231)
    {
        _1331 = _1233;
    }
    float _1335 = _1331;
    float _1337 = fma(_1315, _1301, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1339 = _562 == 0.0;
    bool _1341 = !_1325;
    bool _1343 = _1339 && _1341;
    float _1345 = fma(_1329, _1301, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1347 = _1273 * _1279;
    float _1349 = -_1273;
    float _1351 = _1349 + 1.0;
    bool _1353 = _1289 > 0.5;
    bool _1355 = _1353 && _1231;
    float _1357 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1359 = in.m_63.x;
    float _1361 = in.m_63.y;
    float _1363 = in.m_63.z;
    float _1365 = _1337 * _1347;
    float _1367 = _1345 * _1347;
    bool _1369 = _566 == 0.0;
    bool _1371 = _1369 && _1343;
    float _1373 = _1305 * _1347;
    float _1375 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1365);
    float _1377 = in.m_65.x;
    float _1379 = in.m_65.y;
    float _1381 = in.m_65.z;
    float _1383 = in.m_65.w;
    float _1385 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1367);
    float _1387 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1373);
    out.gl_Position.x = _1182;
    out.gl_Position.y = _1168;
    out.gl_Position.z = _1303;
    out.gl_Position.w = _1144;
    float _1389 = _1335;
    float _1391 = _1351;
    float _1393 = _1373;
    float _1395 = _1365;
    if (_1355)
    {
        float _1397 = -_1335;
        float _1399 = _1397 + 1.0;
        _1389 = _1399;
    }
    float _1401 = _1389;
    float _1403 = _1401;
    if (_1231)
    {
        _1333 = _1401;
    }
    float _1405 = _1333;
    float _1407 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1409 = 0.0;
    if (_1371)
    {
        _1409 = _1361;
    }
    float _1411 = _1409;
    float _1413 = _1411;
    if (_1371)
    {
        _1403 = _1359;
    }
    float _1415 = _1403;
    float _1417 = _1415;
    if (_1371)
    {
        _1391 = _1411;
    }
    float _1419 = _1391;
    float _1421 = _1419;
    if (!_1371)
    {
        _1413 = _1361;
    }
    float _1423 = _1413;
    float _1425 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1375);
    if (_1371)
    {
        _1393 = _1415;
    }
    float _1427 = _1393;
    float _1429 = _1427;
    if (!_1371)
    {
        _1417 = _1359;
    }
    float _1431 = _1417;
    if (!_1371)
    {
        float _1433 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1423);
        _1421 = _1433;
    }
    float _1435 = _1421;
    float _1437 = _1357 * _1227;
    if (_1371)
    {
        _1395 = _1363;
    }
    float _1439 = _1395;
    float _1441 = _1439;
    if (!_1371)
    {
        float _1443 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1363);
        _1441 = _1443;
    }
    float _1445 = _1441;
    float _1447 = _1381 * _1431;
    if (!_1371)
    {
        float _1449 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1431);
        _1429 = _1449;
    }
    float _1451 = _1429;
    float _1453 = _1407 * _1291;
    float _1455 = _1379 * _1363;
    float _1457 = -_1447;
    float _1459 = fma(_1377, _1363, _1457);
    float _1461 = _1377 * _1423;
    float _1463 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1385);
    float _1465 = -_1455;
    float _1467 = fma(_1381, _1423, _1465);
    float _1469 = _1459 * _1383;
    float _1471 = -_1461;
    float _1473 = fma(_1379, _1431, _1471);
    out.m_67.x = _1453;
    out.m_67.y = _1437;
    float _1475 = -_1435;
    float _1477 = _648 * _1475;
    float _1479 = -_1379;
    float _1481 = _648 * _1479;
    float _1483 = -_1469;
    float _1485 = _648 * _1483;
    float _1487 = _1467 * _1383;
    float _1489 = _1473 * _1383;
    float _1491 = _664 * _1435;
    float _1493 = _662 * _1469;
    float _1495 = fma(_666, _1487, _1485);
    float _1497 = fma(_666, _1377, _1481);
    float _1499 = _662 * _1379;
    float _1501 = _664 * _1379;
    float _1503 = _662 * _1435;
    float _1505 = _664 * _1469;
    float _1507 = fma(_682, _1377, _1499);
    float _1509 = fma(_676, _1451, _1491);
    float _1511 = fma(_676, _1377, _1501);
    float _1513 = fma(_682, _1451, _1503);
    float _1515 = fma(_682, _1487, _1493);
    float _1517 = fma(_676, _1487, _1505);
    float _1519 = fma(_680, _1381, _1507);
    float _1521 = fma(_666, _1451, _1477);
    float _1523 = fma(_686, _1445, _1509);
    float _1525 = fma(_686, _1381, _1511);
    float _1527 = fma(_668, _1489, _1495);
    float _1529 = fma(_680, _1445, _1513);
    float _1531 = fma(_680, _1489, _1515);
    float _1533 = fma(_686, _1489, _1517);
    float _1535 = fma(_668, _1381, _1497);
    float _1537 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1539 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1541 = fma(_668, _1445, _1521);
    float _1543 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1545 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1547 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1549 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1551 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1537);
    float _1553 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1539);
    float _1555 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1557 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1559 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1561 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1563 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1543);
    float _1565 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1387);
    float _1567 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1545);
    float _1569 = exp2(_1561);
    float _1571 = fma(_1527, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1555);
    float _1573 = fma(_1525, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1551);
    float _1575 = fma(_1525, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1563);
    float _1577 = fma(_1525, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1553);
    float _1579 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1581 = _1463 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1583 = _1565 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1585 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1571);
    float _1587 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1589 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1591 = _1583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1573;
    out.m_69.y = _1575;
    out.m_69.z = _1577;
    float _1593 = _1303 + _1144;
    float _1595 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1547);
    float _1597 = fma(_1527, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1557);
    float _1599 = -_1569;
    float _1601 = _1599 + 1.0;
    out.m_71.x = _1587;
    out.m_71.y = _1589;
    out.m_71.z = _1591;
    float _1603 = _1593 * 0.5;
    float _1605 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1549);
    float _1607 = fma(_1527, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1559);
    float _1609 = fma(_1523, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1595);
    float _1611 = fma(_1523, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1567);
    float _1613 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1597);
    float _1615 = fma(_1523, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1605);
    float _1617 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1607);
    float _1619 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1621 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _1611;
    out.m_73.y = _1609;
    out.m_73.z = _1615;
    out.m_75.x = _1585;
    out.m_75.y = _1613;
    out.m_75.z = _1617;
    out.m_77.z = _1603;
    out.m_77.w = _1144;
    out.m_79.w = _1621;
    float _1623 = _1619 * _1198;
    float _1625 = -_1619;
    float _1627 = _1625 + 1.0;
    float _1629 = _1213 * _1623;
    float _1631 = _1213 * _1627;
    float _1633 = _1223 * _1623;
    float _1635 = fma(_1219, _1629, _1207);
    float _1637 = fma(_1221, _1629, _1209);
    float _1639 = fma(_1213, _1633, _1211);
    out.m_81.x = _1635;
    out.m_81.y = _1637;
    out.m_81.z = _1639;
    out.m_81.w = _1631;
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
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _294 = false;
    bool _180 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1696 = as_type<float>(_116);
        out.gl_Position.z = _1696;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_47.w;
    float _122 = in.m_49.w;
    bool _124 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_120);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_120;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.w = _122;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_100);
        _110 = _140;
    }
    float _142 = _110;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _118 = as_type<int>(_154);
    }
    int _156 = _118;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1770 = as_type<float>(_156);
        out.gl_Position.z = _1770;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _160 = !_158;
    float _178;
    if (!_160)
    {
        float _162 = in.m_49.x;
        float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _168 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _170 = _168 * _164;
        float _172 = floor(_170);
        float _174 = -_172;
        float _176 = _170 + _174;
        _178 = _176;
        _180 = true;
    }
    else
    {
        float _182 = float(_100);
        float _184 = 1.0 / _182;
        float _186 = _136 * _184;
        _178 = _186;
    }
    _180 = false;
    float _188 = _178;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _192 = _188 + _190;
    bool _194 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _196 = isnan(_188);
    bool _198 = _194 || _196;
    bool _200 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _202 = _198 || _200;
    float _204 = float(_202);
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _206;
    bool _210 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _212 = 1.0 / _208;
    float _214 = -_204;
    float _216 = _214 + 1.0;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _218;
    float _222 = _192 * _212;
    bool _224 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _226 = isnan(_188);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _236;
    float _240 = fma(_220, _222, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _242;
    float _246 = _234 * _216;
    float _248 = fma(_238, _222, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _250 = fma(_244, _222, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _252 = -_234;
    float _254 = _252 + 1.0;
    float _256 = _240 * _246;
    float _258 = _248 * _246;
    float _260 = _250 * _246;
    float _262 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].z, _256);
    float _264 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].x, _258);
    float _266 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].y, _260);
    float _268 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[144].x, _264);
    float _270 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[144].y, _266);
    float _272 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[144].z, _262);
    bool _274 = !_210;
    float _292;
    if (!_274)
    {
        float _276 = in.m_49.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].x, _136);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_100);
        float _298 = 1.0 / _296;
        float _300 = _136 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = in.m_49.z;
    float _306 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _308 = log2(_306);
    float _310 = in.m_49.x;
    float _312 = in.m_49.y;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _316 = _314 != 0;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _320 = _318 != 0;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _324 = _322 != 0;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _328 = 1.0 + _326;
    bool _330 = !_316;
    int _332 = _330 ? 0 : 1;
    bool _334 = !_320;
    int _336 = _334 ? 0 : 1;
    float _338 = 1.0 / _328;
    float _340 = _308 * _136;
    int _342 = abs(_332);
    int _344 = abs(_336);
    float _346 = _304 * 2.0;
    float _348 = exp2(_340);
    float _350 = float(_342);
    float _352 = _310 * 2.0;
    float _354 = _312 * 2.0;
    float _356 = floor(_346);
    float _358 = floor(_352);
    float _360 = -_348;
    float _362 = _360 + 1.0;
    bool _364 = _356 > 0.0;
    float _366 = floor(_354);
    bool _368 = _356 >= 0.0;
    bool _370 = isnan(_356);
    bool _372 = _368 || _370;
    bool _374 = isnan(0.0);
    bool _376 = _372 || _374;
    float _378 = _304 + _312;
    int _380 = _376 ? 0 : 1;
    float _382 = _378 + (-1.0);
    bool _384 = _358 > 0.0;
    bool _386 = _358 >= 0.0;
    bool _388 = isnan(_358);
    bool _390 = _386 || _388;
    bool _392 = isnan(0.0);
    bool _394 = _390 || _392;
    float _396 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _398 = ~_380;
    int _400 = _398 + 1;
    int _402 = _400 + 1;
    float _404 = _310 + _312;
    int _406 = _394 ? 0 : 1;
    float _408 = _312 + (-0.5);
    int _410 = _402;
    if (!_364)
    {
        int _412 = ~_380;
        int _414 = _412 + 1;
        _410 = _414;
    }
    int _416 = _410;
    float _418 = _404 + (-1.0);
    int _420 = ~_406;
    int _422 = _420 + 1;
    int _424 = _422 + 1;
    bool _426 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _428 = isnan(0.0);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _434 = _430 || _432;
    float _436 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _438 = _424;
    if (!_384)
    {
        int _440 = ~_406;
        int _442 = _440 + 1;
        _438 = _442;
    }
    int _444 = _438;
    float _446 = in.m_53.x;
    float _448 = in.m_53.y;
    float _450 = in.m_53.z;
    bool _452 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _454 = isnan(1.0);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _460 = _456 || _458;
    float _462 = float(_416);
    float _464 = _434 ? _362 : 0.0;
    bool _466 = _366 > 0.0;
    float _468 = _350 * _462;
    float _470 = float(_344);
    float _472 = float(_444);
    float _474 = _468 * (-2.0);
    bool _476 = _366 >= 0.0;
    bool _478 = isnan(_366);
    bool _480 = _476 || _478;
    bool _482 = isnan(0.0);
    bool _484 = _480 || _482;
    if (_460)
    {
        float _486 = _464 * _338;
        _138 = _486;
    }
    float _488 = _138;
    bool _490 = !_324;
    int _492 = _490 ? 0 : 1;
    float _494 = _470 * _472;
    int _496 = _484 ? 0 : 1;
    float _498 = _310 + (-0.5);
    int _500 = abs(_492);
    float _502 = fma(_436, _474, _436);
    float _504 = _304 + _310;
    float _506 = fma(_474, _446, _446);
    int _508 = ~_496;
    int _510 = _508 + 1;
    int _512 = _510 + 1;
    float _514 = _504 + (-1.0);
    int _516 = _512;
    if (!_466)
    {
        int _518 = ~_496;
        int _520 = _518 + 1;
        _516 = _520;
    }
    int _522 = _516;
    float _524 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[196].x, _506);
    float _526 = _494 * (-2.0);
    float _528 = fma(_502, _488, _524);
    float _530 = fma(_526, _448, _448);
    float _532 = float(_500);
    float _534 = fma(_396, _526, _396);
    float _536 = float(_522);
    float _538 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[196].y, _530);
    float _540 = _528 * 0.15915493667125701904296875;
    float _542 = _532 * _536;
    float _544 = fma(_534, _488, _538);
    float _546 = in.m_55.x;
    float _548 = in.m_55.y;
    float _550 = in.m_55.z;
    float _552 = _542 * (-2.0);
    float _554 = _544 * 0.15915493667125701904296875;
    float _556 = _304 + (-0.5);
    float _558 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _560 = fma(_552, _450, _450);
    float _562 = in.m_57.x;
    float _564 = in.m_57.y;
    float _566 = in.m_57.z;
    float _568 = _540 * 6.283185482025146484375;
    float _570 = sin(_568);
    float _572 = fma(_558, _552, _558);
    float _574 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[196].z, _560);
    float _576 = fma(_572, _488, _574);
    float _578 = _540 * 6.283185482025146484375;
    float _580 = cos(_578);
    float _582 = in.m_42.x;
    float _584 = in.m_42.y;
    float _586 = in.m_42.z;
    float _588 = _576 * 0.15915493667125701904296875;
    bool _590 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _592 = isnan(0.5);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _598 = _594 || _596;
    float _600 = _554 * 6.283185482025146484375;
    float _602 = sin(_600);
    float _604 = _268 * _546;
    float _606 = _270 * _548;
    float _608 = _272 * _550;
    float _610 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _562);
    float _614 = _554 * 6.283185482025146484375;
    float _616 = cos(_614);
    float _618 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _564);
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _566);
    float _622 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _624 = _618 * _610;
    float _626 = _620 * _622;
    float _628 = _588 * 6.283185482025146484375;
    float _630 = cos(_628);
    float _632 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _634 = _580 * _602;
    float _636 = _570 * _602;
    float _638 = _584 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _640 = _612 * _632;
    float _642 = _584 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _644 = _584 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _646 = _588 * 6.283185482025146484375;
    float _648 = sin(_646);
    float _650 = _570 * _616;
    float _652 = _580 * _616;
    float _654 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[6].x, _638);
    float _656 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[4].x, _642);
    float _658 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[5].x, _644);
    float _660 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[6].z, _654);
    float _662 = _580 * _630;
    float _664 = _570 * _630;
    float _666 = _616 * _630;
    float _668 = _602 * _630;
    float _670 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[5].z, _658);
    float _672 = _664 * _624;
    float _674 = -_634;
    float _676 = fma(_648, _650, _674);
    float _678 = -_650;
    float _680 = fma(_648, _634, _678);
    float _682 = fma(_648, _652, _636);
    float _684 = _662 * _624;
    float _686 = fma(_648, _636, _652);
    float _688 = -_624;
    float _690 = _648 * _688;
    float _692 = fma(_676, _640, _672);
    float _694 = fma(_682, _640, _684);
    float _696 = fma(_666, _640, _690);
    float _698 = fma(_686, _626, _692);
    float _700 = fma(_680, _626, _694);
    float _702 = fma(_668, _626, _696);
    float _704 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[4].z, _656);
    float _706 = _700 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _708 = _700 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _710 = _660 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _712 = _704 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _714 = fma(_702, (*spvDescriptorSet0.vp_c10)._m0[10].x, _706);
    float _716 = fma(_702, (*spvDescriptorSet0.vp_c10)._m0[8].x, _708);
    float _718 = _700 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _720 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[10].z, _714);
    float _722 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[8].z, _716);
    float _724 = fma(_702, (*spvDescriptorSet0.vp_c10)._m0[9].x, _718);
    float _726 = _710 + _720;
    float _728 = _712 + _722;
    float _730 = fma(_698, (*spvDescriptorSet0.vp_c10)._m0[9].z, _724);
    float _732 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _734 = _726 + _732;
    float _736 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _738 = _728 + _736;
    float _740 = _734 * _734;
    float _742 = fma(_738, _738, _740);
    float _744 = _670 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _746 = sqrt(_742);
    float _748 = _744 + _730;
    bool _750 = _746 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _752 = _582;
    float _754 = _586;
    float _756 = _670;
    float _758 = _746;
    float _760 = _742;
    if (!_750)
    {
        _752 = _728;
    }
    float _762 = _752;
    float _764 = _762;
    if (!_750)
    {
        _754 = _726;
    }
    float _766 = _754;
    float _768 = _766;
    if (!_750)
    {
        _756 = _748;
    }
    float _770 = _756;
    bool _772 = !_750;
    float _774 = _770;
    if (!_772)
    {
        float _776 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _780 = _746 + _778;
        float _782 = _748 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _784 = rsqrt(_742);
        float _786 = _780 * _776;
        float _788 = _786 * 0.15915493667125701904296875;
        float _790 = _788 * 6.283185482025146484375;
        float _792 = cos(_790);
        float _794 = _788 * 6.283185482025146484375;
        float _796 = sin(_794);
        float _798 = _792 + (-1.0);
        float _800 = _798 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _802 = fma(_796, _782, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _804 = fma(_748, _792, _800);
        float _806 = _784 * _802;
        float _808 = fma(_738, _806, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _810 = fma(_734, _806, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _768 = _810;
        _764 = _808;
        _774 = _804;
        _758 = _788;
    }
    float _812 = _768;
    float _814 = _764;
    float _816 = _774;
    float _818 = _758;
    float _820 = _816;
    float _822 = _814;
    float _824 = _812;
    float _826 = _818;
    if (!_598)
    {
        float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _830 = _744 + _828;
        float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _834 = _712 + _832;
        float _836 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _838 = -_710;
        float _840 = _838 + _812;
        float _842 = _830 * _830;
        float _844 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _846 = _710 + _844;
        float _848 = fma(_834, _834, _842);
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _852 = fma(_846, _846, _848);
        float _854 = sqrt(_852);
        float _856 = _836 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _858 = precise::min(_854, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _860 = _858 * _850;
        float _862 = -_712;
        float _864 = _862 + _814;
        float _866 = _856 * _860;
        float _868 = -_744;
        float _870 = _868 + _816;
        float _872 = fma(_864, _866, _712);
        float _874 = fma(_870, _866, _744);
        float _876 = fma(_840, _866, _710);
        _820 = _874;
        _822 = _872;
        _824 = _876;
        _826 = _866;
    }
    float _878 = _820;
    float _880 = _822;
    float _882 = _824;
    float _884 = _826;
    float _886 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _888 = _878 + _886;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _892 = _880 + _890;
    float _894 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _896 = _882 + _894;
    float _898 = _888 * _888;
    float _900 = fma(_892, _892, _898);
    float _902 = fma(_896, _896, _900);
    float _904 = rsqrt(_902);
    float _906 = sqrt(_902);
    float _908 = _904 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _910 = _892 * _908;
    float _912 = _896 * _908;
    float _914 = _910 * _910;
    float _916 = _912 * _912;
    float _918 = _914 + _916;
    float _920 = sqrt(_918);
    bool _922 = _920 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _926 = _920 + _924;
    float _928 = _904;
    float _930 = _918;
    float _932 = _926;
    float _934 = _884;
    float _936 = _888;
    if (_922)
    {
        float _938 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _928 = _938;
    }
    float _940 = _928;
    if (_922)
    {
        float _942 = rsqrt(_918);
        _930 = _942;
    }
    float _944 = _930;
    float _946 = _944;
    if (_922)
    {
        float _948 = _926 * _940;
        _932 = _948;
    }
    float _950 = _932;
    if (_922)
    {
        float _952 = _950 * 0.15915493667125701904296875;
        _934 = _952;
    }
    float _954 = _934;
    float _956 = _896;
    float _958 = _954;
    if (_922)
    {
        float _960 = _954 * 6.283185482025146484375;
        float _962 = sin(_960);
        _956 = _962;
    }
    float _964 = _956;
    float _966 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _968 = precise::max(0.0, _966);
    float _970 = _940;
    float _972 = _968;
    if (_922)
    {
        float _974 = _954 * 6.283185482025146484375;
        float _976 = cos(_974);
        _970 = _976;
    }
    float _978 = _970;
    float _980 = -_908;
    float _982 = -_968;
    float _984 = fma(_888, _980, _982);
    if (_922)
    {
        float _986 = _984 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _936 = _986;
    }
    float _988 = _936;
    float _990 = _988;
    float _992 = _964;
    if (_922)
    {
        float _994 = fma(_964, _988, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _990 = _994;
    }
    float _996 = _990;
    float _998 = _996;
    if (!_922)
    {
        _992 = _910;
    }
    float _1000 = _992;
    float _1002 = _1000;
    float _1004 = _978;
    if (_922)
    {
        float _1006 = _978 + (-1.0);
        _972 = _1006;
    }
    float _1008 = _972;
    float _1010 = _1008;
    if (_922)
    {
        float _1012 = _944 * _996;
        _760 = _1012;
    }
    float _1014 = _760;
    if (!_922)
    {
        _998 = _984;
    }
    float _1016 = _998;
    float _1018 = _1016;
    if (_922)
    {
        float _1020 = _1008 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _958 = _1020;
    }
    float _1022 = _958;
    if (_922)
    {
        float _1024 = _910 * _1014;
        _1002 = _1024;
    }
    float _1026 = _1002;
    if (!_922)
    {
        _1010 = _912;
    }
    float _1028 = _1010;
    float _1030 = _1028;
    if (_922)
    {
        float _1032 = _912 * _1014;
        _1030 = _1032;
    }
    float _1034 = _1030;
    if (!_922)
    {
        _946 = _914;
    }
    float _1036 = _946;
    float _1038 = _1036;
    if (_922)
    {
        float _1040 = fma(_984, _978, _1022);
        _1018 = _1040;
    }
    float _1042 = _1018;
    if (_922)
    {
        float _1044 = _1026 * _1026;
        _1038 = _1044;
    }
    float _1046 = _1038;
    if (!_922)
    {
        _1004 = _916;
    }
    float _1048 = _1004;
    float _1050 = _1048;
    if (_922)
    {
        float _1052 = _1034 * _1034;
        _1050 = _1052;
    }
    float _1054 = _1050;
    float _1056 = fma(_1042, _1042, _1046);
    float _1058 = _878 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1060 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1062 = _1056 + _1054;
    float _1064 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1058);
    float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1068 = fma(_906, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1066);
    float _1070 = precise::clamp(_1068, 0.0, 1.0);
    float _1072 = _878 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1074 = rsqrt(_1062);
    float _1076 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1064);
    float _1078 = _878 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1080 = -_1070;
    float _1082 = _1080 + 1.0;
    float _1084 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1072);
    float _1086 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1088 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1078);
    float _1090 = _878 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1092 = abs(_1082);
    float _1094 = log2(_1092);
    float _1096 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1084);
    float _1098 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1088);
    float _1100 = _1086 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1102 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1090);
    float _1104 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1106 = _1098 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1108 = -_1100;
    float _1110 = fma(_1108, _1060, 1.0);
    float _1112 = _1074 * _1026;
    float _1114 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1116 = _1074 * _1042;
    float _1118 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1102);
    float _1120 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1122 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1114);
    float _1124 = _1074 * _1034;
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1128 = -_1120;
    float _1130 = fma(_1116, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1128);
    float _1132 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1134 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1122);
    float _1136 = log2(_1110);
    float _1138 = -_1124;
    float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1130);
    float _1142 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1144 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1134);
    float _1146 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1148 = fma(_1140, -0.5, 0.5);
    float _1150 = fma(_1140, 0.5, 0.5);
    float _1152 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1142);
    float _1154 = exp2(_1132);
    float _1156 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1146);
    float _1158 = _1116 + 1.0;
    float _1160 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1152);
    float _1162 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1156);
    float _1164 = 1.0 / _1144;
    float _1166 = fma(_1150, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1168 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1162);
    float _1170 = _1136 * 0.693147182464599609375;
    float _1172 = fma(_1150, _1166, -0.212114393711090087890625);
    float _1174 = _1170 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1176 = sqrt(_1148);
    float _1178 = -_1116;
    float _1180 = fma(_1154, _1158, _1178);
    float _1182 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1160);
    float _1184 = fma(_1150, _1172, 1.570728778839111328125);
    float _1186 = fma(_1180, 0.5, 0.5);
    float _1188 = _1182 * _1164;
    float _1190 = _1168 * _1164;
    float _1192 = fma(_1188, 0.5, 0.5);
    float _1194 = fma(_1190, -0.5, 0.5);
    float _1196 = _1176 * 0.636619746685028076171875;
    float3 _3387 = float3(_1192, _1194, _1174);
    float _1198 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3387, float3(0.0), isnan(_3387)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3387, float3(0.0), isnan(_3387)), level(0.0)).x;
    float _1200 = -_1184;
    float _1202 = fma(_1196, _1200, 1.0);
    float3 _3403 = float3(_1192, _1194, _1174);
    float4 _1205 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3403, float3(0.0), isnan(_3403)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3403, float3(0.0), isnan(_3403)), level(0.0)).xyzw;
    float _1207 = _1205.x;
    float _1209 = _1205.y;
    float _1211 = _1205.z;
    float _1213 = _1205.w;
    float2 _3420 = float2(_1202, _1186);
    float3 _1217 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3420, float2(0.0), isnan(_3420)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3420, float2(0.0), isnan(_3420)), level(0.0)).xyz;
    float _1219 = _1217.x;
    float _1221 = _1217.y;
    float _1223 = _1217.z;
    float _1225 = in.m_59.y;
    float _1227 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1231 = _1229 != 0;
    float _1233 = in.m_59.x;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1237 = _1235 != 0;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1239;
    bool _1243 = _304 > 0.5;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1247 = _302 + _1245;
    out.m_45.x = 1.0;
    bool _1249 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1251 = isnan(_302);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = 1.0 / _1241;
    bool _1263 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1265 = isnan(_302);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1271);
    float _1275 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = _880;
    out.m_61.y = _878;
    out.m_61.z = _882;
    float _1277 = -_1259;
    float _1279 = _1277 + 1.0;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1281;
    float _1285 = _1190;
    if (_1231)
    {
        float _1287 = in.m_49.y;
        _1285 = _1287;
    }
    float _1289 = _1285;
    float _1291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1293 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1275);
    float _1295 = -_1225;
    float _1297 = _1295 + 1.0;
    float _1299 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1293);
    float _1301 = _1247 * _1261;
    float _1303 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1299);
    float _1305 = fma(_1283, _1301, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1307 = _1225;
    if (_1237)
    {
        float _1309 = _1243 ? _1297 : _1225;
        _1307 = _1309;
    }
    float _1311 = _1307;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1313;
    bool _1317 = _564 != 0.0;
    bool _1319 = isnan(_564);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan(0.0);
    bool _1325 = _1321 || _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1327;
    float _1331 = 0.0;
    float _1333 = _1233;
    if (_1231)
    {
        _1331 = _1233;
    }
    float _1335 = _1331;
    float _1337 = fma(_1315, _1301, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1339 = _562 == 0.0;
    bool _1341 = !_1325;
    bool _1343 = _1339 && _1341;
    float _1345 = fma(_1329, _1301, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1347 = _1273 * _1279;
    float _1349 = -_1273;
    float _1351 = _1349 + 1.0;
    bool _1353 = _1289 > 0.5;
    bool _1355 = _1353 && _1231;
    float _1357 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1359 = in.m_63.x;
    float _1361 = in.m_63.y;
    float _1363 = in.m_63.z;
    float _1365 = _1337 * _1347;
    float _1367 = _1345 * _1347;
    bool _1369 = _566 == 0.0;
    bool _1371 = _1369 && _1343;
    float _1373 = _1305 * _1347;
    float _1375 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1365);
    float _1377 = in.m_65.x;
    float _1379 = in.m_65.y;
    float _1381 = in.m_65.z;
    float _1383 = in.m_65.w;
    float _1385 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1367);
    float _1387 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1373);
    out.gl_Position.x = _1182;
    out.gl_Position.y = _1168;
    out.gl_Position.z = _1303;
    out.gl_Position.w = _1144;
    float _1389 = _1335;
    float _1391 = _1351;
    float _1393 = _1373;
    float _1395 = _1365;
    if (_1355)
    {
        float _1397 = -_1335;
        float _1399 = _1397 + 1.0;
        _1389 = _1399;
    }
    float _1401 = _1389;
    float _1403 = _1401;
    if (_1231)
    {
        _1333 = _1401;
    }
    float _1405 = _1333;
    float _1407 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1409 = 0.0;
    if (_1371)
    {
        _1409 = _1361;
    }
    float _1411 = _1409;
    float _1413 = _1411;
    if (_1371)
    {
        _1403 = _1359;
    }
    float _1415 = _1403;
    float _1417 = _1415;
    if (_1371)
    {
        _1391 = _1411;
    }
    float _1419 = _1391;
    float _1421 = _1419;
    if (!_1371)
    {
        _1413 = _1361;
    }
    float _1423 = _1413;
    float _1425 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1375);
    if (_1371)
    {
        _1393 = _1415;
    }
    float _1427 = _1393;
    float _1429 = _1427;
    if (!_1371)
    {
        _1417 = _1359;
    }
    float _1431 = _1417;
    if (!_1371)
    {
        float _1433 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1423);
        _1421 = _1433;
    }
    float _1435 = _1421;
    float _1437 = _1357 * _1227;
    if (_1371)
    {
        _1395 = _1363;
    }
    float _1439 = _1395;
    float _1441 = _1439;
    if (!_1371)
    {
        float _1443 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1363);
        _1441 = _1443;
    }
    float _1445 = _1441;
    float _1447 = _1381 * _1431;
    if (!_1371)
    {
        float _1449 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1431);
        _1429 = _1449;
    }
    float _1451 = _1429;
    float _1453 = _1407 * _1291;
    float _1455 = _1379 * _1363;
    float _1457 = -_1447;
    float _1459 = fma(_1377, _1363, _1457);
    float _1461 = _1377 * _1423;
    float _1463 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1385);
    float _1465 = -_1455;
    float _1467 = fma(_1381, _1423, _1465);
    float _1469 = _1459 * _1383;
    float _1471 = -_1461;
    float _1473 = fma(_1379, _1431, _1471);
    out.m_67.x = _1453;
    out.m_67.y = _1437;
    float _1475 = -_1435;
    float _1477 = _648 * _1475;
    float _1479 = -_1379;
    float _1481 = _648 * _1479;
    float _1483 = -_1469;
    float _1485 = _648 * _1483;
    float _1487 = _1467 * _1383;
    float _1489 = _1473 * _1383;
    float _1491 = _664 * _1435;
    float _1493 = _662 * _1469;
    float _1495 = fma(_666, _1487, _1485);
    float _1497 = fma(_666, _1377, _1481);
    float _1499 = _662 * _1379;
    float _1501 = _664 * _1379;
    float _1503 = _662 * _1435;
    float _1505 = _664 * _1469;
    float _1507 = fma(_682, _1377, _1499);
    float _1509 = fma(_676, _1451, _1491);
    float _1511 = fma(_676, _1377, _1501);
    float _1513 = fma(_682, _1451, _1503);
    float _1515 = fma(_682, _1487, _1493);
    float _1517 = fma(_676, _1487, _1505);
    float _1519 = fma(_680, _1381, _1507);
    float _1521 = fma(_666, _1451, _1477);
    float _1523 = fma(_686, _1445, _1509);
    float _1525 = fma(_686, _1381, _1511);
    float _1527 = fma(_668, _1489, _1495);
    float _1529 = fma(_680, _1445, _1513);
    float _1531 = fma(_680, _1489, _1515);
    float _1533 = fma(_686, _1489, _1517);
    float _1535 = fma(_668, _1381, _1497);
    float _1537 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1539 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1541 = fma(_668, _1445, _1521);
    float _1543 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1545 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1547 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1549 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1551 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1537);
    float _1553 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1539);
    float _1555 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1557 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1559 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1561 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1563 = fma(_1535, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1543);
    float _1565 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1387);
    float _1567 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1545);
    float _1569 = exp2(_1561);
    float _1571 = fma(_1527, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1555);
    float _1573 = fma(_1525, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1551);
    float _1575 = fma(_1525, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1563);
    float _1577 = fma(_1525, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1553);
    float _1579 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1581 = _1463 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1583 = _1565 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1585 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1571);
    float _1587 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1589 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1591 = _1583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _1573;
    out.m_69.y = _1575;
    out.m_69.z = _1577;
    float _1593 = _1303 + _1144;
    float _1595 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1547);
    float _1597 = fma(_1527, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1557);
    float _1599 = -_1569;
    float _1601 = _1599 + 1.0;
    out.m_71.x = _1587;
    out.m_71.y = _1589;
    out.m_71.z = _1591;
    float _1603 = _1593 * 0.5;
    float _1605 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1549);
    float _1607 = fma(_1527, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1559);
    float _1609 = fma(_1523, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1595);
    float _1611 = fma(_1523, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1567);
    float _1613 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1597);
    float _1615 = fma(_1523, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1605);
    float _1617 = fma(_1533, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1607);
    float _1619 = _1601 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1621 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _1611;
    out.m_73.y = _1609;
    out.m_73.z = _1615;
    out.m_75.x = _1585;
    out.m_75.y = _1613;
    out.m_75.z = _1617;
    out.m_77.z = _1603;
    out.m_77.w = _1144;
    out.m_79.w = _1621;
    float _1623 = _1619 * _1198;
    float _1625 = -_1619;
    float _1627 = _1625 + 1.0;
    float _1629 = _1213 * _1623;
    float _1631 = _1213 * _1627;
    float _1633 = _1223 * _1623;
    float _1635 = fma(_1219, _1629, _1207);
    float _1637 = fma(_1221, _1629, _1209);
    float _1639 = fma(_1213, _1633, _1211);
    out.m_81.x = _1635;
    out.m_81.y = _1637;
    out.m_81.z = _1639;
    out.m_81.w = _1631;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

