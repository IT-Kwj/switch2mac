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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_61 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 m_95 [[user(locn11)]];
    float4 m_47 [[user(locn12)]];
    float4 m_67 [[user(locn13)]];
    float4 m_93 [[user(locn14)]];
    float4 m_83 [[user(locn15)]];
    float4 m_99 [[user(locn16)]];
    float4 m_97 [[user(locn17)]];
    float4 m_71 [[user(locn18)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_69 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_75 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4932 = false;
    bool _1300 = false;
    bool _1090 = false;
    bool _984 = false;
    bool _812 = false;
    bool _640 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_44.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (!_122)
    {
        out.m_47.x = 0.0;
    }
    int _128 = 0;
    if (!_122)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5178 = as_type<float>(_132);
        out.gl_Position.z = _5178;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_49.w;
    float _138 = float(_118);
    float _140 = 1.0 / _138;
    float _142 = -_136;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_136);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = _144 * _140;
    bool _158 = _144 >= _138;
    bool _160 = !_154;
    bool _162 = _158 || _160;
    out.m_51.x = _156;
    float _164 = _136;
    float _166 = _144;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _164;
    if (_162)
    {
        out.m_47.x = 0.0;
    }
    if (_162)
    {
        float _170 = _168 * 5.0;
        _134 = as_type<int>(_170);
    }
    int _172 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5250 = as_type<float>(_172);
        out.gl_Position.z = _5250;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _174 = in.m_53.x;
    float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _178 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _180 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _182 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _184 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _186 = _182 || _184;
    bool _188 = isnan(1.0);
    bool _190 = _186 || _188;
    float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _194 = _178 * _176;
    float _196 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _198 = 0.0;
    float _200 = _180;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_190)
    {
        float _208 = _180 * _180;
        float _210 = _208 * 0.5;
        _198 = _210;
    }
    float _212 = _198;
    float _214 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[20].x, _194);
    float _216 = _196 * _192;
    float _218 = _212;
    if (!_190)
    {
        float _220 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _220;
    }
    float _222 = _218;
    float _224 = floor(_214);
    float _226 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[20].y, _216);
    float _228 = _214 * 6.283185482025146484375;
    float _230 = _228 * 0.15915493667125701904296875;
    int _232 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _234 = _232 != 0;
    float _236 = floor(_226);
    float _238 = _230 * 6.283185482025146484375;
    float _240 = cos(_238);
    float _242 = -_224;
    float _244 = _214 + _242;
    bool _246 = !_190;
    float _248 = _222;
    if (!_246)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = _180 * _252;
        float _262 = 1.0 / _256;
        float _264 = _258 * 0.693147182464599609375;
        float _266 = exp2(_260);
        float _268 = 1.0 / _264;
        float _270 = _266 + (-1.0);
        float _272 = -_270;
        float _274 = fma(_272, _268, _180);
        float _276 = _274 * _262;
        float _278 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _248 = _278;
    }
    float _280 = _248;
    bool _282 = !_190;
    if (!_282)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = 1.0 / _290;
        float _294 = _180 * _286;
        float _296 = exp2(_294);
        float _298 = -_296;
        float _300 = _298 + 1.0;
        float _302 = _300 * _292;
        _200 = _302;
    }
    float _304 = _200;
    float _306 = -_236;
    float _308 = _226 + _306;
    float _310 = _226 * 6.283185482025146484375;
    float _312 = in.m_49.x;
    float _314 = in.m_49.y;
    float _316 = in.m_49.z;
    float _318 = _310 * 0.15915493667125701904296875;
    float _320 = fma(_240, 0.5, 0.5);
    float _322 = in.m_55.w;
    bool _324 = _244 < 0.5;
    float _326 = float(_324);
    float _328 = -_244;
    float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _332 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = in.m_44.x;
    float _336 = in.m_44.y;
    float _338 = in.m_44.z;
    float _340 = -_320;
    float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _344 = _318 * 6.283185482025146484375;
    float _346 = cos(_344);
    float _348 = -_326;
    float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _352 = in.m_57.x;
    float _354 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _356 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _358 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _360 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _362 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _364 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[8].x, _354);
    float _366 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[8].z, _360);
    float _368 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[8].y, _356);
    bool _370 = _308 < 0.5;
    float _372 = float(_370);
    float _374 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[10].x, _364);
    float _376 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[10].z, _366);
    float _378 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[10].y, _368);
    float _380 = fma(_346, 0.5, 0.5);
    float _382 = fma(_304, _312, _374);
    float _384 = fma(_304, _316, _376);
    float _386 = fma(_304, _314, _378);
    float _388 = _376;
    float _390 = _316;
    float _392 = _316;
    if (!_190)
    {
        float _394 = _144 * _144;
        float _396 = _394 * 0.5;
        _388 = _396;
    }
    float _398 = _388;
    float _400 = -_308;
    float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _404 = -_372;
    float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _408 = fma(_382, _322, _334);
    float _410 = -_380;
    float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _414 = fma(_386, _322, _336);
    float _416 = fma(_384, _322, _338);
    float _418 = _334;
    float _420 = _336;
    if (!_190)
    {
        float _422 = _398 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _418 = _422;
    }
    float _424 = _418;
    bool _426 = !_190;
    float _428 = _424;
    float _430 = _352;
    if (!_426)
    {
        float _432 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _434 = log2(_432);
        float _436 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _438 = _436 + 1.0;
        float _440 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _442 = _144 * _434;
        float _444 = 1.0 / _438;
        float _446 = _440 * 0.693147182464599609375;
        float _448 = exp2(_442);
        float _450 = 1.0 / _446;
        float _452 = _448 + (-1.0);
        float _454 = -_452;
        float _456 = fma(_454, _450, _144);
        float _458 = _456 * _444;
        float _460 = _458 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _428 = _460;
        _420 = _448;
    }
    float _462 = _428;
    float _464 = _420;
    float _466 = _462 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _468 = _464;
    if (!_190)
    {
        _468 = _144;
    }
    float _470 = _468;
    bool _472 = !_190;
    float _474 = _470;
    if (!_472)
    {
        float _476 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _478 = log2(_476);
        float _480 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _482 = _480 + 1.0;
        float _484 = 1.0 / _482;
        float _486 = _144 * _478;
        float _488 = exp2(_486);
        float _490 = -_488;
        float _492 = _490 + 1.0;
        float _494 = _492 * _484;
        _474 = _494;
    }
    float _496 = _474;
    float _498 = in.m_57.y;
    float _500 = _462 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _502 = _466 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _506 = _504 != 0;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _510 = _508 != 0;
    float _512 = _466 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _514 = _466 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _516 = _462 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _518 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[8].y, _502);
    bool _520 = !_506;
    int _522 = _520 ? 0 : 1;
    float _524 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[8].x, _512);
    float _526 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[8].z, _514);
    float _528 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[10].y, _518);
    int _530 = abs(_522);
    float _532 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[10].x, _524);
    float _534 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[10].z, _526);
    out.m_59.x = _352;
    bool _536 = !_234;
    int _538 = _536 ? 0 : 1;
    float _540 = fma(_496, _314, _528);
    float _542 = float(_530);
    float _544 = fma(_496, _312, _532);
    float _546 = fma(_496, _316, _534);
    int _548 = abs(_538);
    float _550 = -_540;
    float _552 = _386 + _550;
    bool _554 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    out.m_59.y = _498;
    bool _556 = !_510;
    int _558 = _556 ? 0 : 1;
    float _560 = abs(_330);
    float _562 = _542 * _560;
    float _564 = abs(_402);
    float _566 = _542 * _564;
    float _568 = float(_548);
    float _570 = -_544;
    float _572 = _382 + _570;
    float _574 = _552 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _576 = abs(_558);
    float _578 = _552 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _580 = _552 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _582 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[4].x, _574);
    float _584 = fma(_568, _342, _562);
    float _586 = float(_576);
    float _588 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[5].x, _578);
    float _590 = -_546;
    float _592 = _384 + _590;
    float _594 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
    float _596 = fma(_568, _412, _566);
    float _598 = abs(_350);
    float _600 = fma(_586, _598, _584);
    float _602 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[4].z, _582);
    float _604 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[5].z, _588);
    float _606 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[6].z, _594);
    float _608 = abs(_406);
    float _610 = fma(_586, _608, _596);
    bool _612 = !_554;
    float _614 = _498;
    float _616 = _604;
    float _618 = _602;
    float _620 = _606;
    float _622 = _604;
    float _638;
    if (!_612)
    {
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _626 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _630 = _628 * _624;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _636;
        _640 = true;
    }
    else
    {
        _638 = _156;
    }
    _640 = false;
    float _642 = _638;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _646 = _642 + _644;
    bool _648 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _650 = isnan(_642);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _662 = _642 + _660;
    bool _664 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _666 = isnan(_642);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _684 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _686 = isnan(_642);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -_658;
    float _698 = _696 + 1.0;
    float _700 = 1.0 / _682;
    float _702 = _694 * _698;
    float _704 = -_694;
    float _706 = _704 + 1.0;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _708;
    bool _712 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _714 = 1.0 / _678;
    float _716 = _674 * _706;
    float _718 = -_674;
    float _720 = _718 + 1.0;
    float _722 = _662 * _700;
    float _724 = _646 * _714;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _730;
    float _734 = fma(_710, _724, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _736 = fma(_728, _724, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _738 = fma(_732, _724, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _740 = in.m_55.x;
    float _742 = in.m_55.y;
    float _744 = in.m_55.z;
    float _746 = _734 * _716;
    float _748 = _736 * _716;
    float _750 = _738 * _716;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _764 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].x, _746);
    float _766 = fma(_754, _722, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _768 = fma(_758, _722, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _770 = fma(_762, _722, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _772 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].y, _748);
    float _774 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].z, _750);
    float _776 = fma(_766, _702, _764);
    float _778 = fma(_768, _702, _772);
    float _780 = fma(_770, _702, _774);
    float _782 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[145].x, _776);
    float _784 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[145].y, _778);
    float _786 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[145].z, _780);
    float _788 = _782 * _740;
    float _790 = _784 * _742;
    float _792 = _786 * _744;
    bool _794 = !_712;
    float _810;
    if (!_794)
    {
        float _796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _798 = _174 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _802 = _800 * _796;
        float _804 = floor(_802);
        float _806 = -_804;
        float _808 = _802 + _806;
        _810 = _808;
        _812 = true;
    }
    else
    {
        _810 = _156;
    }
    _812 = false;
    float _814 = _810;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _824 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _826 = isnan(_814);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = 1.0 / _818;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _842 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _844 = isnan(_814);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _854;
    float _858 = -_834;
    float _860 = _858 + 1.0;
    bool _862 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _864 = isnan(_814);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    bool _874 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _876 = 1.0 / _822;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _882 = _852 * _860;
    float _884 = -_852;
    float _886 = _884 + 1.0;
    float _888 = _872 * _886;
    float _890 = 1.0 / _840;
    float _892 = _856 * _836;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _896 = _814 + _894;
    float _898 = -_872;
    float _900 = _898 + 1.0;
    float _902 = fma(_892, _896, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _906 = _814 + _904;
    float _908 = _880 * _876;
    bool _910 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _912 = isnan(_814);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _922;
    float _926 = _902 * _888;
    float _928 = fma(_908, _906, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _932 = _814 + _930;
    float _934 = -_920;
    float _936 = _934 + 1.0;
    float _938 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[115].x, _926);
    float _940 = _924 * _890;
    float _942 = _834 * _936;
    float _944 = fma(_928, _882, _938);
    float _946 = fma(_940, _932, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _950 = fma(_946, _942, _944);
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _954 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _958 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[118].x, _950);
    float _960 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _958 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _954;
    out.m_61.y = _960;
    out.m_61.z = _962;
    out.m_61.w = _964;
    bool _966 = !_874;
    float _982;
    if (!_966)
    {
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _970 = _174 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[11].z, _144);
        float _974 = _972 * _968;
        float _976 = floor(_974);
        float _978 = -_976;
        float _980 = _974 + _978;
        _982 = _980;
        _984 = true;
    }
    else
    {
        _982 = _156;
    }
    _984 = false;
    float _986 = _982;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _990 = _986 + _988;
    bool _992 = _986 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _994 = isnan(_986);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1004;
    bool _1008 = _986 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1010 = isnan(_986);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = 1.0 / _1006;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1022;
    bool _1026 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1028;
    float _1032 = _990 * _1020;
    float _1034 = -_1002;
    float _1036 = _1034 + 1.0;
    float _1038 = fma(_1024, _1032, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1040 = fma(_1030, _1032, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1042;
    float _1046 = _1018 * _1036;
    float _1048 = -_1018;
    float _1050 = _1048 + 1.0;
    float _1052 = fma(_1044, _1032, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1054 = _1038 * _1046;
    float _1056 = _1052 * _1046;
    float _1058 = _1040 * _1046;
    float _1060 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1054);
    float _1062 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1056);
    float _1064 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1058);
    float _1066 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1060);
    float _1068 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1062);
    float _1070 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1064);
    bool _1072 = !_1026;
    float _1088;
    if (!_1072)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1076 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _1080 = _1078 * _1074;
        float _1082 = floor(_1080);
        float _1084 = -_1082;
        float _1086 = _1080 + _1084;
        _1088 = _1086;
        _1090 = true;
    }
    else
    {
        _1088 = _156;
    }
    _1090 = false;
    float _1092 = _1088;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1098;
    bool _1102 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1104 = isnan(_1092);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1110 = _1106 || _1108;
    float _1112 = float(_1110);
    float _1114 = 1.0 / _1096;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1124 = -_1112;
    float _1126 = _1124 + 1.0;
    bool _1128 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1130 = isnan(_1092);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = 1.0 / _1118;
    bool _1142 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1144 = isnan(_1092);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    bool _1154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1156 = _1152 * _1126;
    float _1158 = -_1152;
    float _1160 = _1158 + 1.0;
    float _1162 = _1100 * _1114;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1166 = _1092 + _1164;
    float _1168 = 1.0 / _1122;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1174 = _1138 * _1160;
    float _1176 = fma(_1162, _1166, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1182 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1184 = isnan(_1092);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1194;
    float _1198 = _1172 * _1140;
    float _1200 = 1.0 / _1180;
    float _1202 = _1176 * _1174;
    float _1204 = -_1192;
    float _1206 = _1204 + 1.0;
    float _1208 = -_1138;
    float _1210 = _1208 + 1.0;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1216 = _1112 * _1206;
    bool _1218 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1220 = isnan(_1092);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1226 = _1222 || _1224;
    float _1228 = float(_1226);
    float _1230 = _1196 * _1168;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1234 = _1092 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1238 = _1092 + _1236;
    float _1240 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1202);
    float _1242 = -_1228;
    float _1244 = _1242 + 1.0;
    float _1246 = fma(_1198, _1234, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1248 = fma(_1230, _1238, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1252 = _1092 + _1250;
    float _1254 = _1214 * _1200;
    float _1256 = fma(_1246, _1156, _1240);
    float _1258 = _1192 * _1244;
    float _1260 = _1068 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1262 = fma(_1254, _1252, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1264 = fma(_1248, _1216, _1256);
    float _1266 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1268 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = fma(_1262, _1258, _1264);
    float _1272 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1274 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1276 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1270);
    float _1278 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1276 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _1274;
    out.m_63.y = _1268;
    out.m_63.z = _1278;
    out.m_63.w = _1280;
    bool _1282 = !_1154;
    float _1298;
    if (!_1282)
    {
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1286 = _174 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _1290 = _1288 * _1284;
        float _1292 = floor(_1290);
        float _1294 = -_1292;
        float _1296 = _1290 + _1294;
        _1298 = _1296;
        _1300 = true;
    }
    else
    {
        _1298 = _156;
    }
    _1300 = false;
    float _1302 = _1298;
    float _1304 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1306 = int(_1304);
    float _1308 = in.m_53.y;
    float _1310 = _600 * _788;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1314 = _1312 != 0;
    float _1316 = in.m_53.z;
    float _1318 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1320 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1322 = int(_1320);
    float _1324 = in.m_65.w;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1328 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1330 = int(_1328);
    float _1332 = float(_1306);
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1338 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1334);
    float _1340 = 1.0 / _1332;
    float _1342 = float(uint(_1322));
    float _1344 = float(_1322);
    float _1346 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1348 = _1322 == 0;
    float _1350 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _1352 = _1322 + (-1);
    float _1354 = 1.0 / _1342;
    float _1356 = float(_1330);
    out.m_67.w = _1324;
    float _1358 = _144 * _1340;
    float _1360 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1362 = int(_1360);
    int _1364 = ~_1322;
    int _1366 = _1364 + 1;
    float _1368 = -_1346;
    float _1370 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1368);
    float _1372 = -_1350;
    float _1374 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1372);
    int _1376 = as_type<int>(_1354) + (-2);
    float _1378 = trunc(_1358);
    int _1380 = int(_1378);
    float _1382 = 1.0 / _1356;
    float _1384 = float(uint(_1362));
    int _1386 = ~_1362;
    int _1388 = _1386 + 1;
    float _1390 = float(uint(_1380));
    float _1392 = 1.0 / _1384;
    float _1394 = as_type<float>(_1376) * _1390;
    float _1396 = _144 * _1382;
    float _1398 = trunc(_1394);
    float _1400 = precise::max(_1398, 0.0);
    uint _1403 = uint(_1400);
    float _1405 = trunc(_1396);
    int _1407 = int(_1405);
    int _1409 = ~_1322;
    int _1411 = _1409 + 1;
    int _1413 = _1366 * int(_1403);
    int _1415 = _1413 + _1380;
    float _1417 = float(uint(_1415));
    float _1419 = float(uint(_1407));
    float _1421 = as_type<float>(_1376) * _1417;
    float _1423 = _1417;
    float _1425 = _1316;
    if (_1314)
    {
        _1423 = 1.0;
    }
    float _1427 = _1423;
    float _1429 = _1427;
    if (!_1314)
    {
        _1429 = 7.345489978790283203125;
    }
    float _1431 = _1429;
    float _1433 = trunc(_1421);
    float _1435 = precise::max(_1433, 0.0);
    uint _1437 = uint(_1435);
    float _1439 = _1431 * _174;
    int _1441 = as_type<int>(_1392) + (-2);
    float _1443 = floor(_1439);
    float _1445 = as_type<float>(_1441) * _1419;
    int _1447 = int(_1403) + int(_1437);
    float _1449 = trunc(_1445);
    float _1451 = precise::max(_1449, 0.0);
    uint _1453 = uint(_1451);
    float _1455 = float(_1380);
    int _1457 = _1411 * _1447;
    int _1459 = _1457 + _1380;
    int _1461 = ~_1362;
    int _1463 = _1461 + 1;
    bool _1465 = _1455 >= _1344;
    bool _1467 = isnan(_1455);
    bool _1469 = _1465 || _1467;
    bool _1471 = isnan(_1344);
    bool _1473 = _1469 || _1471;
    float _1475 = float(_1473);
    float _1477 = -_1443;
    float _1479 = _1439 + _1477;
    bool _1481 = uint(_1459) >= uint(_1322);
    bool _1483 = !_1481;
    int _1485 = _1483 ? 0 : (-1);
    float _1487 = trunc(_1475);
    int _1489 = int(_1487);
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1493 = _1491 != 0;
    int _1495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1497 = _1495 != 0;
    int _1499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1501 = _1499 != 0;
    int _1503 = ~_1447;
    int _1505 = _1503 + _1485;
    int _1507 = _1505 + 1;
    float _1509 = _1479 * _1344;
    int _1511 = _1463 * int(_1453);
    int _1513 = _1511 + _1407;
    int _1515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1517 = _1515 != 0;
    float _1519 = _156 * _1344;
    int _1521 = _1322 * _1507;
    int _1523 = _1521 + _1380;
    float _1525 = trunc(_1509);
    int _1527 = int(_1525);
    float _1529 = float(uint(_1513));
    bool _1531 = !_1517;
    int _1533 = _1531 ? 0 : 1;
    bool _1535 = !_1348;
    float _1537 = _1535 ? as_type<float>(_1523) : as_type<float>(0xffffffffu /* nan */);
    float _1539 = as_type<float>(_1441) * _1529;
    int _1541 = ~_1489;
    int _1543 = _1541 + 1;
    int _1545 = _1543 + 1;
    float _1547 = trunc(_1519);
    int _1549 = int(_1547);
    bool _1551 = !_1493;
    int _1553 = _1551 ? 0 : 1;
    int _1555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1557 = _1555 != 0;
    int _1559 = as_type<int>(_1537) * _1545;
    bool _1561 = !_1497;
    int _1563 = _1561 ? 0 : 1;
    int _1565 = abs(_1533);
    float _1567 = trunc(_1539);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    int _1573 = abs(_1563);
    int _1575 = _1489 * _1352;
    int _1577 = _1575 + _1559;
    int _1579 = abs(_1553);
    int _1581 = _1527 * _1565;
    int _1583 = _1581 + _1380;
    float _1585 = as_type<float>(_1545);
    float _1587 = _1537;
    if (_1557)
    {
        _1585 = _174;
    }
    float _1589 = _1585;
    float _1591 = _1589;
    if (_1557)
    {
        _1587 = 1.0;
    }
    float _1593 = _1587;
    int _1595 = _1577 * _1573;
    float _1597 = _1593;
    if (!_1557)
    {
        _1591 = _1308;
    }
    float _1599 = _1591;
    if (!_1557)
    {
        _1597 = 1.2345600128173828125;
    }
    float _1601 = _1597;
    int _1603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1605 = _1603 != 0;
    float _1607 = _1599 * _1601;
    bool _1609 = !_1501;
    int _1611 = _1609 ? 0 : 1;
    bool _1613 = !_1605;
    int _1615 = _1613 ? 0 : 1;
    int _1617 = _1549 * _1579;
    int _1619 = _1617 + _1595;
    int _1621 = abs(_1611);
    float _1623 = floor(_1607);
    int _1625 = int(_1453) + int(_1571);
    int _1627 = ~_1362;
    int _1629 = _1627 + 1;
    int _1631 = _1583 * _1621;
    int _1633 = _1631 + _1619;
    int _1635 = abs(_1615);
    float _1637 = float(_1362);
    int _1639 = _1629 * _1625;
    int _1641 = _1639 + _1407;
    float _1643 = float(_1407);
    int _1645 = ~_1322;
    int _1647 = _1645 + 1;
    bool _1649 = _1643 >= _1637;
    bool _1651 = isnan(_1643);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan(_1637);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    int _1661 = _1527 * _1635;
    int _1663 = _1661 + _1633;
    bool _1665 = uint(_1641) >= uint(_1362);
    float _1667 = -_1623;
    float _1669 = _1607 + _1667;
    int _1671 = 0;
    int _1673 = _1625;
    if (_1557)
    {
        _1671 = 0;
    }
    int _1675 = _1671;
    float _1677 = trunc(_1659);
    int _1679 = int(_1677);
    float _1681 = float(uint(_1663));
    bool _1683 = !_1665;
    int _1685 = _1683 ? 0 : (-1);
    int _1687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1689 = _1687 != 0;
    int _1691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1693 = _1691 != 0;
    int _1695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1697 = _1695 != 0;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1701 = _1699 != 0;
    float _1703 = as_type<float>(_1376) * _1681;
    int _1705 = ~_1625;
    int _1707 = _1705 + _1685;
    int _1709 = _1707 + 1;
    bool _1711 = _1322 == 0;
    bool _1713 = !_1693;
    int _1715 = _1713 ? 0 : 1;
    int _1717 = _1362 * _1709;
    int _1719 = _1717 + _1407;
    bool _1721 = _1362 == 0;
    float _1723 = trunc(_1703);
    float _1725 = precise::max(_1723, 0.0);
    uint _1727 = uint(_1725);
    int _1729 = abs(_1715);
    int _1731 = ~_1679;
    int _1733 = _1731 + 1;
    int _1735 = _1733 + 1;
    bool _1737 = !_1721;
    int _1739 = _1737 ? _1719 : (-1);
    float _1741 = _1669 * _1637;
    float _1743 = _156 * _1637;
    bool _1745 = !_1689;
    int _1747 = _1745 ? 0 : 1;
    int _1749 = _1739 * _1735;
    int _1751 = _1362 + (-1);
    float _1753 = trunc(_1741);
    int _1755 = int(_1753);
    int _1757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1759 = _1757 != 0;
    int _1761 = abs(_1747);
    int _1763 = _1679 * _1751;
    int _1765 = _1763 + _1749;
    bool _1767 = !_1697;
    int _1769 = _1767 ? 0 : 1;
    int _1771 = _1647 * int(_1727);
    int _1773 = _1771 + _1663;
    bool _1775 = !_1759;
    int _1777 = _1775 ? 0 : 1;
    float _1779 = trunc(_1743);
    int _1781 = int(_1779);
    bool _1783 = !_1701;
    int _1785 = _1783 ? 0 : 1;
    int _1787 = _1765 * _1729;
    float _1789 = float(uint(_1773));
    int _1791 = abs(_1777);
    int _1793 = abs(_1769);
    float _1795 = as_type<float>(_1376) * _1789;
    float _1797 = trunc(_1795);
    float _1799 = precise::max(_1797, 0.0);
    uint _1801 = uint(_1799);
    int _1803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1805 = _1803 != 0;
    int _1807 = _1755 * _1791;
    int _1809 = _1807 + _1407;
    int _1811 = abs(_1785);
    int _1813 = _1781 * _1761;
    int _1815 = _1813 + _1787;
    int _1817 = ~_1362;
    int _1819 = _1817 + 1;
    float _1821 = float(uint(_1809));
    int _1823 = _1809 * _1793;
    int _1825 = _1823 + _1815;
    int _1827 = _1675;
    int _1829 = as_type<int>(_1795);
    bool _1831 = _1759;
    float _1833 = as_type<float>(_1727);
    if (!_1557)
    {
        _1827 = 2;
    }
    int _1835 = _1827;
    int _1837 = _1755 * _1811;
    int _1839 = _1837 + _1825;
    if (_1805)
    {
        float _1841 = -_352;
        float _1843 = _1841 + 1.0;
        _1829 = as_type<int>(_1843);
    }
    int _1845 = _1829;
    if (_1805)
    {
        bool _1847 = _174 > 0.5;
        _1831 = _1847;
    }
    bool _1849 = _1831;
    float _1851 = as_type<float>(_1441) * _1821;
    int _1853 = int(_1727) + int(_1801);
    float _1855 = float(uint(_1839));
    float _1857 = trunc(_1851);
    float _1859 = precise::max(_1857, 0.0);
    uint _1861 = uint(_1859);
    if (!_1805)
    {
        _1833 = _352;
    }
    float _1863 = _1833;
    float _1865 = float(uint(_1583));
    float _1867 = as_type<float>(_1441) * _1855;
    float _1869 = _1863;
    if (_1805)
    {
        float _1871 = _1849 ? as_type<float>(_1845) : _352;
        _1869 = _1871;
    }
    float _1873 = _1869;
    float _1875 = in.m_53.w;
    int _1877 = ~_1322;
    int _1879 = _1877 + 1;
    float _1881 = as_type<float>(_1376) * _1865;
    float _1883 = trunc(_1867);
    float _1885 = precise::max(_1883, 0.0);
    uint _1887 = uint(_1885);
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1891 = _1889 != 0;
    int _1893 = _1879 * _1853;
    int _1895 = _1893 + _1663;
    bool _1897 = _1308 > 0.5;
    float _1899 = trunc(_1881);
    float _1901 = precise::max(_1899, 0.0);
    uint _1903 = uint(_1901);
    bool _1905 = uint(_1895) >= uint(_1322);
    float _1907 = -_498;
    float _1909 = _1907 + 1.0;
    bool _1911 = !_1905;
    int _1913 = _1911 ? 0 : (-1);
    if (_1891)
    {
        float _1915 = -_352;
        float _1917 = _1915 + 1.0;
        _1673 = as_type<int>(_1917);
    }
    int _1919 = _1673;
    int _1921 = _1897 ? as_type<int>(_1909) : as_type<int>(_498);
    int _1923 = _1819 * int(_1887);
    int _1925 = _1923 + _1839;
    bool _1927 = _1316 > 0.5;
    int _1929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1931 = _1929 != 0;
    float _1933 = float(uint(_1925));
    int _1935 = ~_1322;
    int _1937 = _1935 + 1;
    float _1939 = _1931 ? as_type<float>(_1921) : _498;
    float _1941 = as_type<float>(_1441) * _1933;
    float _1943 = _1933;
    if (!_1891)
    {
        _1943 = _352;
    }
    float _1945 = _1943;
    float _1947 = _1945;
    if (_1891)
    {
        float _1949 = _1927 ? as_type<float>(_1919) : _352;
        _1947 = _1949;
    }
    float _1951 = _1947;
    float _1953 = trunc(_1941);
    float _1955 = precise::max(_1953, 0.0);
    uint _1957 = uint(_1955);
    bool _1959 = _1875 > 0.5;
    int _1961 = _1937 * int(_1903);
    int _1963 = _1961 + _1583;
    int _1965 = ~_1853;
    int _1967 = _1965 + _1913;
    int _1969 = _1967 + 1;
    int _1971 = _1388 * int(_1861);
    int _1973 = _1971 + _1809;
    int _1975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1977 = _1975 != 0;
    float _1979 = float(uint(_1963));
    int _1981 = _1322 * _1969;
    int _1983 = _1981 + _1663;
    int _1985 = _1959 ? as_type<int>(_1909) : as_type<int>(_498);
    float _1987 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1991 = _1989 != 0;
    float _1993 = as_type<float>(_1376) * _1979;
    bool _1995 = !_1711;
    int _1997 = _1995 ? _1983 : (-1);
    float _1999 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2001 = _1991 ? as_type<float>(_1985) : _498;
    float _2003 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2005 = _1997 & 3;
    bool _2007 = _2005 != 0;
    float _2009 = trunc(_1993);
    float _2011 = precise::max(_2009, 0.0);
    uint _2013 = uint(_2011);
    if (_1977)
    {
        float _2015 = _1927 ? _1909 : _498;
        _614 = _2015;
    }
    float _2017 = _614;
    float _2019 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1987);
    int _2021 = int(_1887) + int(_1957);
    int _2023 = ~_1362;
    int _2025 = _2023 + 1;
    float _2027 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2019);
    float _2029 = float(uint(_1973));
    bool _2031 = uint(_2005) > 1u;
    int _2033 = _2025 * _2021;
    int _2035 = _2033 + _1839;
    int _2037 = _1997 & 3;
    bool _2039 = _2037 != 0;
    float _2041 = as_type<float>(_1441) * _2029;
    float _2043 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1999);
    int _2045 = ~_1322;
    int _2047 = _2045 + 1;
    float _2049 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2003);
    int _2051 = _2039 ? 0 : 1;
    float _2053 = trunc(_2041);
    float _2055 = precise::max(_2053, 0.0);
    uint _2057 = uint(_2055);
    bool _2059 = uint(_2035) >= uint(_1362);
    float _2061 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2043);
    int _2063 = ~_2051;
    int _2065 = _2063 + 1;
    int _2067 = _2065 + 1;
    float _2069 = _2027 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2071 = !_2059;
    int _2073 = _2071 ? 0 : (-1);
    float _2075 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2049);
    bool _2077 = _2005 != 3;
    int _2079 = _2067;
    if (!_2031)
    {
        int _2081 = ~_2051;
        int _2083 = _2081 + 1;
        _2079 = _2083;
    }
    int _2085 = _2079;
    float _2087 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2089 = int(_1903) + int(_2013);
    float _2091 = _2061 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2093 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2095 = _2069 + _2093;
    bool _2097 = uint(_2005) >= 2u;
    float _2099 = _2087 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _2101 = ~_2021;
    int _2103 = _2101 + _2073;
    int _2105 = _2103 + 1;
    int _2107 = _2047 * _2089;
    int _2109 = _2107 + _1583;
    int _2111 = _2097 ? 0 : 1;
    float _2113 = _2095 * _2095;
    int _2115 = int(_1861) + int(_2057);
    int _2117 = _1362 * _2105;
    int _2119 = _2117 + _1839;
    int _2121 = ~_2111;
    int _2123 = _2121 + 1;
    int _2125 = _2123 + 1;
    float _2127 = _2075 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2129 = _2125;
    int _2131 = int(_2013);
    if (_2077)
    {
        int _2133 = ~_2111;
        int _2135 = _2133 + 1;
        _2129 = _2135;
    }
    int _2137 = _2129;
    float _2139 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2141 = _2091 + _2139;
    bool _2143 = !_1721;
    int _2145 = _2143 ? _2119 : (-1);
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2149 = _2127 + _2147;
    if (_1557)
    {
        _2131 = 0;
    }
    int _2151 = _2131;
    float _2153 = fma(_2141, _2141, _2113);
    bool _2155 = uint(_2109) >= uint(_1322);
    float _2157 = -_2127;
    float _2159 = _2157 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _2161 = _2151;
    if (!_1557)
    {
        _2161 = 1;
    }
    int _2163 = _2161;
    float _2165 = fma(_2149, _2149, _2153);
    int _2167 = _2145 & 3;
    bool _2169 = _2167 != 0;
    bool _2171 = !_2155;
    int _2173 = _2171 ? 0 : (-1);
    float _2175 = sqrt(_2165);
    int _2177 = _2145 & 3;
    bool _2179 = _2177 != 0;
    bool _2181 = uint(_2167) >= 2u;
    int _2183 = _2179 ? 0 : 1;
    bool _2185 = uint(_2167) > 1u;
    float _2187 = rsqrt(_2165);
    int _2189 = _2181 ? 0 : 1;
    bool _2191 = _2167 != 3;
    int _2193 = ~_1362;
    int _2195 = _2193 + 1;
    int _2197 = ~_2183;
    int _2199 = _2197 + 1;
    int _2201 = _2199 + 1;
    float _2203 = _2175 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2205 = ~_2189;
    int _2207 = _2205 + 1;
    int _2209 = _2207 + 1;
    int _2211 = _2195 * _2115;
    int _2213 = _2211 + _1809;
    bool _2215 = !_2007;
    int _2217 = _2215 ? 0 : 1;
    int _2219 = _2201;
    int _2221 = _2209;
    if (!_2185)
    {
        int _2223 = ~_2183;
        int _2225 = _2223 + 1;
        _2219 = _2225;
    }
    int _2227 = _2219;
    bool _2229 = uint(_2213) >= uint(_1362);
    if (_2191)
    {
        int _2231 = ~_2189;
        int _2233 = _2231 + 1;
        _2221 = _2233;
    }
    int _2235 = _2221;
    float _2237 = in.m_69.x;
    float _2239 = in.m_69.y;
    float _2241 = in.m_69.z;
    int _2243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2245 = _2243 != 0;
    bool _2247 = !_2229;
    int _2249 = _2247 ? 0 : (-1);
    bool _2251 = _1308 > 0.5;
    bool _2253 = _2251 && _2245;
    float _2255 = precise::min(_2099, _2203);
    bool _2257 = _1835 != 2;
    int _2259 = ~_2089;
    int _2261 = _2259 + _2173;
    int _2263 = _2261 + 1;
    float _2265 = _2187 * _2255;
    int _2267 = abs(_2085);
    out.m_71.w = _2255;
    float _2269 = 0.0;
    if (!_2245)
    {
        _2269 = _352;
    }
    float _2271 = _2269;
    float _2273 = _2095 * _2265;
    float _2275 = _2149 * _2265;
    float _2277 = _2271;
    if (_2253)
    {
        float _2279 = -_352;
        float _2281 = _2279 + 1.0;
        _430 = _2281;
    }
    float _2283 = _430;
    bool _2285 = _2163 != 1;
    float _2287 = _2141 * _2265;
    float _2289 = -_2273;
    float _2291 = _2095 + _2289;
    float _2293 = -_2275;
    float _2295 = _2149 + _2293;
    if (_2245)
    {
        _2277 = _2283;
    }
    float _2297 = _2277;
    float _2299 = -_2287;
    float _2301 = _2141 + _2299;
    float _2303 = _2291 * _2291;
    float _2305 = in.m_73.x;
    float _2307 = in.m_73.y;
    float _2309 = in.m_73.z;
    bool _2311 = _2239 != 0.0;
    bool _2313 = isnan(_2239);
    bool _2315 = _2311 || _2313;
    bool _2317 = isnan(0.0);
    bool _2319 = _2315 || _2317;
    float _2321 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2237);
    float _2323 = fma(_2301, _2301, _2303);
    float _2325 = in.m_75.x;
    float _2327 = in.m_75.y;
    float _2329 = in.m_75.z;
    float _2331 = in.m_75.w;
    bool _2333 = _2237 == 0.0;
    bool _2335 = !_2319;
    bool _2337 = _2333 && _2335;
    float _2339 = _610 * _790;
    float _2341 = fma(_2295, _2295, _2323);
    float _2343 = 0.0;
    if (!_2285)
    {
        _2343 = _1308;
    }
    float _2345 = _2343;
    int _2347 = _1322 * _2263;
    int _2349 = _2347 + _1583;
    bool _2351 = _2241 == 0.0;
    bool _2353 = _2351 && _2337;
    float _2355 = 0.0;
    float _2357 = _2345;
    if (_2257)
    {
        _2355 = _174;
    }
    float _2359 = _2355;
    float _2361 = sqrt(_2341);
    float _2363 = 0.0;
    float _2365 = _2359;
    if (!_2285)
    {
        _2363 = _2345;
    }
    float _2367 = _2363;
    float _2369 = _2367;
    if (!_2257)
    {
        _2365 = _1316;
    }
    float _2371 = _2365;
    float _2373 = 0.0;
    if (!_2285)
    {
        _2373 = _1316;
    }
    float _2375 = _2373;
    float _2377 = 0.0;
    float _2379 = _2375;
    if (_2257)
    {
        _2377 = _1308;
    }
    float _2381 = _2377;
    float _2383 = _2381;
    if (_2285)
    {
        _2369 = _174;
    }
    float _2385 = _2369;
    if (_2285)
    {
        _2357 = _174;
    }
    float _2387 = _2357;
    if (_2285)
    {
        _1425 = _1308;
    }
    float _2389 = _1425;
    float _2391 = _2385 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2393 = _2309 * _2327;
    float _2395 = _2305 * _2329;
    float _2397 = _2307 * _2325;
    float _2399 = _2393;
    float _2401 = _2331;
    if (_2285)
    {
        _2379 = _1308;
    }
    float _2403 = _2379;
    float _2405 = _2187 * _2361;
    if (!_2257)
    {
        _2383 = _174;
    }
    float _2407 = _2383;
    float _2409 = -_2395;
    float _2411 = fma(_2309, _2325, _2409);
    int _2413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2415 = _2413 != 0;
    float _2417 = -_2397;
    float _2419 = fma(_2327, _2305, _2417);
    int _2421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2423 = _2421 != 0;
    float _2425 = -_2393;
    float _2427 = fma(_2329, _2307, _2425);
    if (_2353)
    {
        _2399 = _2307;
    }
    float _2429 = _2399;
    float _2431 = _1318 * _2405;
    float _2433 = _2429;
    if (!_2353)
    {
        float _2435 = fma(_2239, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2307);
        _2433 = _2435;
    }
    float _2437 = _2433;
    float _2439 = _2427 * _2331;
    float _2441 = _2411 * _2331;
    float _2443 = _2419 * _2331;
    float _2445 = _2339 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_2353)
    {
        _2401 = _2309;
    }
    float _2447 = _2401;
    float _2449 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2239);
    float _2451 = _2447;
    if (!_2353)
    {
        float _2453 = fma(_2241, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2309);
        _2451 = _2453;
    }
    float _2455 = _2451;
    float _2457 = _2431 * _2241;
    float _2459 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2461 = _2445 * _2405;
    float _2463 = 0.0;
    float _2465 = _2455;
    if (_2353)
    {
        _2463 = _2305;
    }
    float _2467 = _2463;
    float _2469 = _2467;
    if (!_2353)
    {
        float _2471 = fma(_2237, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2305);
        _2469 = _2471;
    }
    float _2473 = _2469;
    float _2475 = -_1326;
    float _2477 = fma(_2459, 2.0, _2475);
    float _2479 = _2461 * _2449;
    float _2481 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2483 = _2481 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2485 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2487 = 1.0 / _2483;
    float _2489 = -_2091;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2493 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2495 = fma(_2485, -2.0, _1336);
    float _2497 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2493);
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2501 = _2499 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2503 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2505 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2507 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2509 = _2507 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2511 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2503);
    float _2513 = -_2069;
    float _2515 = _2513 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2517 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2505);
    float _2519 = 1.0 / _2509;
    float _2521 = _2515 * _2515;
    float _2523 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2525 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2527 = fma(_2491, _2491, _2521);
    float _2529 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2531 = -_2523;
    float _2533 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2531);
    float _2535 = 1.0 / _2501;
    float _2537 = fma(_2159, _2159, _2527);
    float _2539 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2541 = _2539 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2543 = -_2525;
    float _2545 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2543);
    float _2547 = -_2529;
    float _2549 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2547);
    float _2551 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2517);
    float _2553 = rsqrt(_2537);
    float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2557 = _2555 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2559 = _2407 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2561 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2563 = _2561 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2565 = _2389 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2567 = _2087 * _2405;
    float _2569 = 1.0 / _2557;
    float _2571 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2573 = _2571 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2575 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2577 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2575;
    int _2579 = ~_2267;
    int _2581 = _2579 + 1;
    int _2583 = _2581 + 1;
    float _2585 = _2567 * _2321;
    int _2587 = abs(_2217);
    float _2589 = _2577 * _2535;
    bool _2591 = !_2169;
    int _2593 = _2591 ? 0 : 1;
    float _2595 = 1.0 / _2541;
    float _2597 = _2491 * _2553;
    float _2599 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2601 = _2515 * _2553;
    int _2603 = abs(_2593);
    float _2605 = -_2599;
    float _2607 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2605);
    bool _2609 = _2005 != 3;
    float _2611 = 1.0 / _2563;
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2613;
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2619 = _2617 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2621 = ~_2115;
    int _2623 = _2621 + _2249;
    int _2625 = _2623 + 1;
    float _2627 = _2615 * _2487;
    float _2629 = _2619 * _2519;
    float _2631 = _2597 * _2597;
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2635 = _2633 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2637 = _2159 * _2553;
    float _2639 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2639;
    float _2643 = 1.0 / _2573;
    float _2645 = fma(_2637, _2637, _2631);
    float _2647 = _2641 * _2569;
    float _2649 = _2635 * _2595;
    float _2651 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2653 = _2651 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2655 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2657 = _1302 + _2655;
    float _2659 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2661 = _1302 + _2659;
    bool _2663 = !_2609;
    int _2665 = _2663 ? 0 : (-1);
    float _2667 = rsqrt(_2645);
    float _2669 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2671 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2669;
    float _2673 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2675 = _1302 + _2673;
    float _2677 = _2653 * _2611;
    float _2679 = fma(_2629, _2657, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2681 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2683 = _1302 + _2681;
    float _2685 = fma(_2627, _2675, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2689 = _1302 + _2687;
    float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2693 = _1302 + _2691;
    float _2695 = _2671 * _2643;
    float _2697 = _2545 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2699 = fma(_2589, _2689, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2701 = fma(_2647, _2683, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2703 = fma(_2677, _2661, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2705 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2707 = fma(_2649, _2693, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2709 = _2637 * _2667;
    float _2711 = _2597 * _2667;
    float _2713 = _2545 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2715 = -_2705;
    float _2717 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2715);
    float _2719 = -_2709;
    float _2721 = _2637 * _2719;
    float _2723 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2725 = -_2713;
    float _2727 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2725);
    float _2729 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2717);
    float _2731 = -_2721;
    float _2733 = fma(_2597, _2711, _2731);
    float _2735 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2737 = _2601 * _2711;
    float _2739 = -_2697;
    float _2741 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2739);
    float _2743 = _2733 * _2733;
    float _2745 = -_2723;
    float _2747 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2745);
    float _2749 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2727);
    float _2751 = _2729 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2753 = -_2735;
    float _2755 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2753);
    float _2757 = _1374 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2759 = fma(_2737, _2737, _2743);
    float _2761 = -_2709;
    float _2763 = _2601 * _2761;
    float _2765 = -_2751;
    float _2767 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2765);
    float _2769 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2755);
    float _2771 = -_2757;
    float _2773 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2771);
    float _2775 = fma(_2763, _2763, _2759);
    float _2777 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2779 = fma(_2769, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2767);
    float _2781 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2773);
    bool _2783 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2785 = isnan(_1302);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2791 = _2787 || _2789;
    float _2793 = float(_2791);
    float _2795 = -_2777;
    float _2797 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2795);
    float _2799 = rsqrt(_2775);
    float _2801 = -_2781;
    float _2803 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2779);
    bool _2805 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2807 = isnan(_1302);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2813 = _2809 || _2811;
    float _2815 = float(_2813);
    float _2817 = -_2793;
    float _2819 = _2817 + 1.0;
    bool _2821 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2823 = isnan(_1302);
    bool _2825 = _2821 || _2823;
    bool _2827 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2829 = _2825 || _2827;
    float _2831 = float(_2829);
    float _2833 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2747);
    float _2835 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2741);
    float _2837 = _2815 * _2819;
    float _2839 = 1.0 / _2803;
    float _2841 = -_2815;
    float _2843 = _2841 + 1.0;
    bool _2845 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2847 = isnan(_1302);
    bool _2849 = _2845 || _2847;
    bool _2851 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2853 = _2849 || _2851;
    float _2855 = float(_2853);
    float _2857 = -_2831;
    float _2859 = _2857 + 1.0;
    float _2861 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2797);
    float _2863 = _2831 * _2843;
    bool _2865 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2867 = isnan(_1302);
    bool _2869 = _2865 || _2867;
    bool _2871 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2873 = _2869 || _2871;
    float _2875 = float(_2873);
    float _2877 = -_2855;
    float _2879 = _2877 + 1.0;
    float _2881 = _2733 * _2799;
    float _2883 = precise::clamp(_2881, 0.0, 1.0);
    bool _2885 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2887 = isnan(_1302);
    bool _2889 = _2885 || _2887;
    bool _2891 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2893 = _2889 || _2891;
    float _2895 = float(_2893);
    float _2897 = _2855 * _2859;
    float _2899 = _2875 * _2879;
    float _2901 = -_2875;
    float _2903 = _2901 + 1.0;
    float _2905 = -_2883;
    float _2907 = _2905 + 1.0;
    bool _2909 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2911 = isnan(_1302);
    bool _2913 = _2909 || _2911;
    bool _2915 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2917 = _2913 || _2915;
    float _2919 = float(_2917);
    float _2921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2923 = fma(_2833, _2839, -1.0);
    float _2925 = -_2895;
    float _2927 = _2925 + 1.0;
    float _2929 = _2895 * _2903;
    float _2931 = _2907 * _2839;
    float _2933 = fma(_2907, _2923, 1.0);
    bool _2935 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2937 = isnan(_1302);
    bool _2939 = _2935 || _2937;
    bool _2941 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2943 = _2939 || _2941;
    float _2945 = float(_2943);
    float _2947 = _2919 * _2927;
    float _2949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2951 = -_2919;
    float _2953 = _2951 + 1.0;
    float _2955 = _2835 * _2931;
    float _2957 = _2933 * _2933;
    float _2959 = _2861 * _2931;
    float _2961 = _2945 * _2953;
    float _2963 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2965 = _1302 + _2963;
    float _2967 = fma(_2955, _2955, _2957);
    float _2969 = -_2945;
    float _2971 = _2969 + 1.0;
    float _2973 = _2685 * _2961;
    float _2975 = fma(_2695, _2965, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2977 = fma(_2959, _2959, _2967);
    float _2979 = _2921 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2981 = fma(_2971, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2973);
    int _2983 = _1362 * _2625;
    int _2985 = _2983 + _1809;
    float _2987 = fma(_2979, _2017, -0.5);
    float _2989 = _2949 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2991 = rsqrt(_2977);
    float _2993 = fma(_2679, _2947, _2981);
    float _2995 = fma(_2989, _2297, -0.5);
    float _2997 = _2371 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2999 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3001 = fma(_2699, _2929, _2993);
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3005 = -_2999;
    float _3007 = fma(_2997, 2.0, _3005);
    float _3009 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3011 = fma(_2707, _2899, _3001);
    float _3013 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3003);
    float _3015 = -_144;
    float _3017 = fma(_3015, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3007);
    float _3019 = fma(_2403, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3009);
    float _3021 = _2959 * _2991;
    float _3023 = _2933 * _2991;
    float _3025 = fma(_2551, _2995, _3017);
    int _3027 = _1997 >> 31;
    float _3029 = fma(_2701, _2897, _3011);
    float _3031 = _2955 * _2991;
    float _3033 = -_3021;
    float _3035 = _2597 * _3033;
    float _3037 = _2637 * _3023;
    int _3039 = _3027 & 3;
    float _3041 = fma(_2703, _2863, _3029);
    float _3043 = -_3031;
    float _3045 = -_3035;
    float _3047 = fma(_2637, _3043, _3045);
    float _3049 = -_3021;
    float _3051 = -_3037;
    float _3053 = fma(_2601, _3049, _3051);
    int _3055 = _2145 >> 31;
    float _3057 = -_3031;
    float _3059 = _2601 * _3057;
    int _3061 = _1997 + _3039;
    float _3063 = _3047 * _3047;
    int _3065 = _3055 & 3;
    float _3067 = -_3059;
    float _3069 = fma(_2597, _3023, _3067);
    int _3071 = _3061 >> 2;
    float _3073 = fma(_3053, _3053, _3063);
    int _3075 = _2145 + _3065;
    float _3077 = fma(_2975, _2837, _3041);
    int _3079 = _3071 << 4;
    int _3081 = _3079 + 368;
    float _3083 = fma(_3069, _3069, _3073);
    float _3085 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2511);
    uint _3087 = uint(int(uint(_3081) >> uint(2)));
    uint _3089 = uint(int(uint(int(_3087)) >> uint(2)));
    int _3091 = int(_3087) & 3;
    float _3093 = (*spvDescriptorSet0.vp_c9)._m0[int(_3089)][_3091];
    int _3095 = int(_3087) + 1;
    uint _3097 = uint(int(uint(_3095) >> uint(2)));
    int _3099 = _3095 & 3;
    float _3101 = (*spvDescriptorSet0.vp_c9)._m0[int(_3097)][_3099];
    int _3103 = _3075 >> 2;
    float _3105 = rsqrt(_3083);
    float _3107 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3109 = fma(_2793, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3077);
    int _3111 = _3103 << 4;
    int _3113 = _3111 + 512;
    float _3115 = -_3107;
    float _3117 = fma(_2391, 2.0, _3115);
    int _3119 = _3081 + 8;
    uint _3121 = uint(int(uint(_3119) >> uint(2)));
    uint _3123 = uint(int(uint(int(_3121)) >> uint(2)));
    int _3125 = int(_3121) & 3;
    float _3127 = (*spvDescriptorSet0.vp_c9)._m0[int(_3123)][_3125];
    int _3129 = int(_3121) + 1;
    uint _3131 = uint(int(uint(_3129) >> uint(2)));
    int _3133 = _3129 & 3;
    float _3135 = (*spvDescriptorSet0.vp_c9)._m0[int(_3131)][_3133];
    float _3137 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3139 = abs(_2235);
    float _3141 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _3143 = _2167 != 3;
    float _3145 = fma(_2565, -2.0, _3137);
    out.m_77.x = _3109;
    float _3147 = fma(_2559, -2.0, _3141);
    uint _3149 = uint(int(uint(_3113) >> uint(2)));
    uint _3151 = uint(int(uint(int(_3149)) >> uint(2)));
    int _3153 = int(_3149) & 3;
    float _3155 = (*spvDescriptorSet0.vp_c9)._m0[int(_3151)][_3153];
    int _3157 = int(_3149) + 1;
    uint _3159 = uint(int(uint(_3157) >> uint(2)));
    int _3161 = _3157 & 3;
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[int(_3159)][_3161];
    float _3165 = _3053 * _3105;
    float _3167 = _3069 * _3105;
    float _3169 = _3047 * _3105;
    float _3171 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3147);
    float _3173 = _2637 * _3165;
    float _3175 = _2601 * _3167;
    int _3177 = _3113 + 8;
    uint _3179 = uint(int(uint(_3177) >> uint(2)));
    uint _3181 = uint(int(uint(int(_3179)) >> uint(2)));
    int _3183 = int(_3179) & 3;
    float _3185 = (*spvDescriptorSet0.vp_c9)._m0[int(_3181)][_3183];
    int _3187 = int(_3179) + 1;
    uint _3189 = uint(int(uint(_3187) >> uint(2)));
    int _3191 = _3187 & 3;
    float _3193 = (*spvDescriptorSet0.vp_c9)._m0[int(_3189)][_3191];
    float _3195 = _2597 * _3169;
    float _3197 = -_3173;
    float _3199 = fma(_2597, _3167, _3197);
    float _3201 = -_3175;
    float _3203 = fma(_2637, _3169, _3201);
    int _3205 = abs(_2227);
    float _3207 = -_3195;
    float _3209 = fma(_2601, _3165, _3207);
    float _3211 = _3199 * _3199;
    float _3213 = -_3171;
    float _3215 = fma(_3085, _2987, _3213);
    int _3217 = ~_3205;
    int _3219 = _3217 + 1;
    int _3221 = _3219 + 1;
    float _3223 = fma(_3203, _3203, _3211);
    float _3225 = fma(_3209, _3209, _3223);
    float _3227 = rsqrt(_3225);
    int _3229 = _2583 * as_type<int>(_3101);
    float _3231 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3233 = int(_3231);
    int _3235 = ~_2587;
    int _3237 = _3235 + 1;
    int _3239 = _3237 + 1;
    int _3241 = _3239 * as_type<int>(_3093);
    int _3243 = _3241 + _3229;
    int _3245 = abs(_2137);
    float _3247 = _3209 * _3227;
    float _3249 = _3203 * _3227;
    int _3251 = ~_3245;
    int _3253 = _3251 + 1;
    int _3255 = _3253 + 1;
    int _3257 = _3221 * as_type<int>(_3163);
    int _3259 = ~_2603;
    int _3261 = _3259 + 1;
    int _3263 = _3261 + 1;
    float _3265 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3267 = int(_3265);
    int _3269 = abs(_2665);
    int _3271 = _3255 * as_type<int>(_3127);
    int _3273 = _3271 + _3243;
    bool _3275 = !_2423;
    int _3277 = _3275 ? 0 : 1;
    int _3279 = _3263 * as_type<int>(_3155);
    int _3281 = _3279 + _3257;
    int _3283 = ~_3269;
    int _3285 = _3283 + 1;
    int _3287 = _3285 + 1;
    float _3289 = _3199 * _3227;
    bool _3291 = !_2415;
    int _3293 = _3291 ? 0 : 1;
    float _3295 = _3247 * _2327;
    int _3297 = abs(_3277);
    float _3299 = _2597 * _3247;
    int _3301 = _3287 * as_type<int>(_3135);
    int _3303 = _3301 + _3273;
    float _3305 = float(uint(_3233));
    float _3307 = _2637 * _3289;
    int _3309 = abs(_3293);
    float _3311 = -_3299;
    float _3313 = fma(_2637, _3249, _3311);
    bool _3315 = !_3143;
    int _3317 = _3315 ? 0 : (-1);
    float _3319 = 1.0 / _3305;
    int _3321 = ~_3139;
    int _3323 = _3321 + 1;
    int _3325 = _3323 + 1;
    float _3327 = -_3307;
    float _3329 = fma(_2601, _3247, _3327);
    float _3331 = _3313 * _3313;
    int _3333 = ~_3233;
    int _3335 = _3333 + 1;
    float _3337 = _2441 * _3289;
    int _3339 = _3325 * as_type<int>(_3185);
    int _3341 = _3339 + _3281;
    float _3343 = float(uint(_3267));
    float _3345 = fma(_3329, _3329, _3331);
    int _3347 = abs(_3317);
    float _3349 = _2601 * _3249;
    float _3351 = 1.0 / _3343;
    int _3353 = ~_3267;
    int _3355 = _3353 + 1;
    float _3357 = _2441 * _3247;
    float _3359 = -_3349;
    float _3361 = fma(_2597, _3289, _3359);
    int _3363 = ~_3309;
    int _3365 = _3363 + 1;
    int _3367 = _3365 + 1;
    int _3369 = ~_3347;
    int _3371 = _3369 + 1;
    int _3373 = _3371 + 1;
    float _3375 = fma(_3361, _3361, _3345);
    int _3377 = abs(_3233);
    int _3379 = _3303 * _3367;
    int _3381 = ~_3297;
    int _3383 = _3381 + 1;
    int _3385 = _3383 + 1;
    int _3387 = _3373 * as_type<int>(_3193);
    int _3389 = _3387 + _3341;
    bool _3391 = !_1711;
    int _3393 = _3391 ? _2349 : (-1);
    float _3395 = rsqrt(_3375);
    int _3397 = _3389 * _3385;
    bool _3399 = !_1721;
    int _3401 = _3399 ? _2985 : (-1);
    int _3403 = _3393 * _3309;
    int _3405 = _3403 + _3379;
    int _3407 = abs(_3267);
    float _3409 = _2479 * _3247;
    int _3411 = as_type<int>(_3319) + (-2);
    int _3413 = _3401 * _3297;
    int _3415 = _3413 + _3397;
    float _3417 = float(uint(_3407));
    float _3419 = _2479 * _3249;
    float _3421 = float(uint(_3377));
    float _3423 = _3247 * _2437;
    float _3425 = 1.0 / _3417;
    int _3427 = as_type<int>(_3351) + (-2);
    float _3429 = _3361 * _3395;
    float _3431 = float(uint(_3405));
    float _3433 = _3329 * _3395;
    int _3435 = abs(_3405);
    float _3437 = fma(_2585, _3429, _3409);
    float _3439 = 1.0 / _3421;
    float _3441 = as_type<float>(_3411) * _3431;
    float _3443 = float(uint(_3415));
    float _3445 = fma(_2637, _2457, _3437);
    float _3447 = fma(_2585, _3433, _3419);
    int _3449 = ~_3407;
    int _3451 = _3449 + 1;
    float _3453 = as_type<float>(_3427) * _3443;
    float _3455 = trunc(_3441);
    float _3457 = precise::max(_3455, 0.0);
    uint _3459 = uint(_3457);
    int _3461 = as_type<int>(_3425) + (-2);
    float _3463 = fma(_2597, _2457, _3447);
    float _3465 = _2127 + _3445;
    float _3467 = fma(_3429, _2325, _3295);
    float _3469 = _2091 + _3463;
    float _3471 = float(uint(_3435));
    float _3473 = trunc(_3453);
    float _3475 = precise::max(_3473, 0.0);
    uint _3477 = uint(_3475);
    int _3479 = as_type<int>(_3439) + (-2);
    float _3481 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3483 = _3465 + _3481;
    int _3485 = abs(_3415);
    float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3489 = _3469 + _3487;
    float _3491 = as_type<float>(_3479) * _3471;
    float _3493 = _3483 * _3483;
    int _3495 = _3335 * int(_3459);
    int _3497 = _3495 + _3405;
    float _3499 = _3215 + 0.5;
    float _3501 = fma(_3489, _3489, _3493);
    float _3503 = trunc(_3491);
    float _3505 = precise::max(_3503, 0.0);
    uint _3507 = uint(_3505);
    float _3509 = float(uint(_3497));
    float _3511 = _3025 + 0.5;
    int _3513 = ~_3377;
    int _3515 = _3513 + 1;
    int _3517 = _3355 * int(_3477);
    int _3519 = _3517 + _3415;
    float _3521 = float(uint(_3485));
    float _3523 = as_type<float>(_3411) * _3509;
    out.m_79.x = _3511;
    out.m_79.y = _3499;
    float _3525 = sqrt(_3501);
    float _3527 = float(uint(_3519));
    float _3529 = as_type<float>(_3461) * _3521;
    float _3531 = _3289 * _2327;
    float _3533 = as_type<float>(_3427) * _3527;
    float _3535 = _3249 * _2327;
    float _3537 = trunc(_3529);
    float _3539 = precise::max(_3537, 0.0);
    uint _3541 = uint(_3539);
    int _3543 = _3515 * int(_3507);
    int _3545 = _3543 + _3435;
    float _3547 = _2441 * _3249;
    float _3549 = _3289 * _2437;
    float _3551 = _2479 * _3289;
    float _3553 = fma(_3433, _2325, _3535);
    float _3555 = float(uint(_3545));
    float _3557 = _3313 * _3395;
    float _3559 = trunc(_3523);
    float _3561 = precise::max(_3559, 0.0);
    uint _3563 = uint(_3561);
    float _3565 = _3249 * _2437;
    bool _3567 = _3525 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3569 = as_type<float>(_3479) * _3555;
    float _3571 = fma(_2585, _3557, _3551);
    int _3573 = ~_3233;
    int _3575 = _3573 + 1;
    float _3577 = fma(_3557, _2325, _3531);
    float _3579 = fma(_2439, _3433, _3547);
    int _3581 = _3451 * int(_3541);
    int _3583 = _3581 + _3485;
    float _3585 = trunc(_3533);
    float _3587 = precise::max(_3585, 0.0);
    uint _3589 = uint(_3587);
    float _3591 = fma(_2601, _2457, _3571);
    int _3593 = ~_3267;
    int _3595 = _3593 + 1;
    float _3597 = fma(_2439, _3557, _3337);
    float _3599 = float(uint(_3583));
    float _3601 = fma(_2439, _3429, _3357);
    float _3603 = fma(_3557, _2473, _3549);
    int _3605 = int(_3459) + int(_3563);
    float _3607 = trunc(_3569);
    float _3609 = precise::max(_3607, 0.0);
    uint _3611 = uint(_3609);
    float _3613 = as_type<float>(_3461) * _3599;
    float _3615 = fma(_3429, _2473, _3423);
    float _3617 = fma(_2597, _2329, _3553);
    int _3619 = _3575 * _3605;
    int _3621 = _3619 + _3405;
    float _3623 = fma(_2601, _2329, _3577);
    float _3625 = fma(_3433, _2473, _3565);
    float _3627 = fma(_2637, _2329, _3467);
    float _3629 = trunc(_3613);
    float _3631 = precise::max(_3629, 0.0);
    uint _3633 = uint(_3631);
    int _3635 = int(_3477) + int(_3589);
    float _3637 = _2069 + _3591;
    bool _3639 = uint(_3621) >= uint(_3233);
    int _3641 = ~_3377;
    int _3643 = _3641 + 1;
    int _3645 = _3595 * _3635;
    int _3647 = _3645 + _3415;
    int _3649 = ~_3407;
    int _3651 = _3649 + 1;
    int _3653 = int(_3507) + int(_3611);
    float _3655 = as_type<float>(_3621);
    float _3657 = _3591;
    float _3659 = _3549;
    float _3661 = _3617;
    float _3663 = _3623;
    if (!_3567)
    {
        _3655 = _3469;
    }
    float _3665 = _3655;
    float _3667 = _3665;
    if (!_3567)
    {
        _3657 = _3465;
    }
    float _3669 = _3657;
    float _3671 = _3669;
    if (!_3567)
    {
        _3659 = _3637;
    }
    float _3673 = _3659;
    int _3675 = int(_3541) + int(_3633);
    bool _3677 = !_3567;
    float _3679 = _3673;
    if (!_3677)
    {
        float _3681 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3685 = _3525 + _3683;
        float _3687 = _3637 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3689 = rsqrt(_3501);
        float _3691 = _3685 * _3681;
        float _3693 = _3691 * 0.15915493667125701904296875;
        float _3695 = _3693 * 6.283185482025146484375;
        float _3697 = cos(_3695);
        float _3699 = _3693 * 6.283185482025146484375;
        float _3701 = sin(_3699);
        float _3703 = _3697 + (-1.0);
        float _3705 = fma(_3701, _3687, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3707 = _3703 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3709 = _3689 * _3705;
        float _3711 = fma(_3637, _3697, _3707);
        float _3713 = fma(_3489, _3709, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3715 = fma(_3483, _3709, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3667 = _3713;
        _3679 = _3711;
        _3671 = _3715;
    }
    float _3717 = _3667;
    float _3719 = _3679;
    float _3721 = _3671;
    bool _3723 = !_3639;
    int _3725 = _3723 ? 0 : (-1);
    float _3727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3729 = _3643 * _3653;
    int _3731 = _3729 + _3435;
    bool _3733 = uint(_3647) >= uint(_3267);
    int _3735 = _3651 * _3675;
    int _3737 = _3735 + _3485;
    int _3739 = ~_3605;
    int _3741 = _3739 + _3725;
    int _3743 = _3741 + 1;
    float _3745 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2495);
    bool _3747 = uint(_3731) >= uint(_3377);
    float _3749 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3145);
    bool _3751 = !_3733;
    int _3753 = _3751 ? 0 : (-1);
    int _3755 = _3233 * _3743;
    int _3757 = _3755 + _3405;
    bool _3759 = _3233 == 0;
    float _3761 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2497);
    bool _3763 = _3233 == 0;
    float _3765 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3019);
    int _3767 = _3405 ^ _3233;
    out.m_81.x = _2567;
    int _3769 = ~_3635;
    int _3771 = _3769 + _3753;
    int _3773 = _3771 + 1;
    float _3775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3777 = !_3759;
    int _3779 = _3777 ? _3757 : (-1);
    bool _3781 = uint(_3737) >= uint(_3407);
    int _3783 = _3267 * _3773;
    int _3785 = _3783 + _3415;
    int _3787 = _3415 ^ _3267;
    float _3789 = _3727 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3791 = _3267 == 0;
    float _3793 = fma(_2637, _2455, _3615);
    bool _3795 = _3267 == 0;
    float _3797 = -_144;
    float _3799 = fma(_3797, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2477);
    float _3801 = float(_3779);
    float _3803 = fma(_3789, _1873, -0.5);
    bool _3805 = !_3781;
    int _3807 = _3805 ? 0 : (-1);
    float _3809 = -_2287;
    float _3811 = _2091 + _3809;
    bool _3813 = !_3747;
    int _3815 = _3813 ? 0 : (-1);
    float _3817 = fma(_3789, _3801, _3799);
    uint _3819 = uint(int(uint(_3767) >> uint(31)));
    float _3821 = _3775 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3823 = ~_3807;
    int _3825 = _3675 + _3823;
    int _3827 = _3825 + 1;
    float _3829 = -_144;
    float _3831 = fma(_3829, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3117);
    bool _3833 = !_3791;
    int _3835 = _3833 ? _3785 : (-1);
    float _3837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _3839 = uint(int(uint(_3787) >> uint(31)));
    float _3841 = fma(_3821, _1951, -0.5);
    int _3843 = ~_3815;
    int _3845 = _3653 + _3843;
    int _3847 = _3845 + 1;
    float _3849 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1338);
    int _3851 = ~int(_3819);
    int _3853 = _3851 + 1;
    float _3855 = fma(_2597, _2455, _3625);
    float _3857 = float(_3835);
    float _3859 = fma(_3849, _3803, _3817);
    int _3861 = ~int(_3839);
    int _3863 = _3861 + 1;
    out.m_83.x = _3617;
    out.m_83.y = _3623;
    out.m_83.z = _3627;
    int _3865 = _3847 ^ _3853;
    float _3867 = fma(_3821, _3857, _3831);
    int _3869 = _3827 ^ _3863;
    float _3871 = -_2275;
    float _3873 = _2127 + _3871;
    int _3875 = ~_3853;
    int _3877 = _3875 + _3865;
    int _3879 = _3877 + 1;
    float _3881 = _3837 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3883 = ~_3863;
    int _3885 = _3883 + _3869;
    int _3887 = _3885 + 1;
    float _3889 = _2443 * _2597;
    float _3891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3893 = !_3763;
    int _3895 = _3893 ? _3879 : (-1);
    float _3897 = fma(_1939, _3881, -0.5);
    float _3899 = _2443 * _2601;
    float _3901 = _2443 * _2637;
    float _3903 = float(_3895);
    float _3905 = _3889 + _3579;
    bool _3907 = !_3795;
    int _3909 = _3907 ? _3887 : (-1);
    float _3911 = _3899 + _3597;
    float _3913 = -_2091;
    float _3915 = _3913 + _3717;
    float _3917 = -_3745;
    float _3919 = fma(_3881, _3903, _3917);
    float _3921 = -_2069;
    float _3923 = _3921 + _3719;
    float _3925 = _3901 + _3601;
    float _3927 = float(_3909);
    float _3929 = -_2127;
    float _3931 = _3929 + _3721;
    float _3933 = _3923 * _3923;
    float _3935 = _3891 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3937 = fma(_3761, _3897, _3919);
    float _3939 = fma(_2601, _2455, _3603);
    float _3941 = fma(_3915, _3915, _3933);
    float _3943 = fma(_2001, _3935, -0.5);
    float _3945 = -_3749;
    float _3947 = fma(_3935, _3927, _3945);
    float _3949 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3013);
    float _3951 = fma(_3931, _3931, _3941);
    float _3953 = _3859 + 0.5;
    float _3955 = _3937 + 0.5;
    float _3957 = fma(_3949, _3841, _3867);
    float _3959 = fma(_3765, _3943, _3947);
    float _3961 = sqrt(_3951);
    out.m_85.x = _3905;
    out.m_85.y = _3911;
    out.m_85.z = _3925;
    float _3963 = _3957 + 0.5;
    float _3965 = _3959 + 0.5;
    float _3967 = -_2287;
    float _3969 = _3967 + _3717;
    out.m_87.x = _3855;
    out.m_87.y = _3939;
    out.m_87.z = _3793;
    float _3971 = -_2273;
    float _3973 = _3971 + _3719;
    float _3975 = -_2273;
    float _3977 = _2069 + _3975;
    out.m_89.x = _3953;
    out.m_89.y = _3955;
    out.m_89.z = _3963;
    out.m_89.w = _3965;
    bool _3979 = _3961 > 0.0;
    float _3981 = -_2275;
    float _3983 = _3981 + _3721;
    float _3985 = _3911;
    float _3987 = _3905;
    float _3989 = _3923;
    if (!_3979)
    {
        _2465 = _3969;
    }
    float _3991 = _2465;
    float _3993 = _3991;
    float _3995 = _3991;
    if (!_3979)
    {
        _3661 = _3973;
    }
    float _3997 = _3661;
    float _3999 = _3997;
    float _4001 = _3997;
    if (!_3979)
    {
        _3663 = _3983;
    }
    float _4003 = _3663;
    bool _4005 = !_3979;
    float _4007 = _4003;
    float _4009 = _4003;
    if (!_4005)
    {
        bool _4011 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4013 = _3627;
        if (_4011)
        {
            float _4015 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4013 = _4015;
        }
        float _4017 = _4013;
        float _4019 = _4017;
        if (_4011)
        {
            float _4021 = _602 * _4017;
            _3985 = _4021;
        }
        float _4023 = _3985;
        float _4025 = _4023;
        if (_4011)
        {
            float _4027 = _604 * _4017;
            _3987 = _4027;
        }
        float _4029 = _3987;
        float _4031 = _4029;
        if (_4011)
        {
            float _4033 = _606 * _4017;
            _4019 = _4033;
        }
        float _4035 = _4019;
        float _4037 = _4035;
        if (!_4011)
        {
            bool _4039 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4041 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4043 = _4039 || _4041;
            bool _4045 = isnan(1.0);
            bool _4047 = _4043 || _4045;
            float _4049 = _144 + 1.0;
            if (!_4047)
            {
                float _4051 = _4049 * _4049;
                float _4053 = _4051 * 0.5;
                _166 = _4053;
            }
            float _4055 = _166;
            float _4057 = _4055;
            if (!_4047)
            {
                float _4059 = _4055 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4057 = _4059;
            }
            float _4061 = _4057;
            bool _4063 = !_4047;
            float _4065 = _4061;
            if (!_4063)
            {
                float _4067 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4069 = log2(_4067);
                float _4071 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4073 = _4071 + 1.0;
                float _4075 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4077 = _4069 * _4049;
                float _4079 = 1.0 / _4073;
                float _4081 = _4075 * 0.693147182464599609375;
                float _4083 = exp2(_4077);
                float _4085 = 1.0 / _4081;
                float _4087 = _4083 + (-1.0);
                float _4089 = -_4087;
                float _4091 = fma(_4089, _4085, _4049);
                float _4093 = _4091 * _4079;
                float _4095 = _4093 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4065 = _4095;
            }
            float _4097 = _4065;
            float _4099 = _4097 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _4101 = _4097 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4103 = _4097 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4105 = _4097;
            if (!_4047)
            {
                _4105 = _4049;
            }
            float _4107 = _4105;
            float _4109 = _4099 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _4111 = _4099 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _4113 = _4099 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _4115 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[8].y, _4109);
            float _4117 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[8].x, _4111);
            float _4119 = fma(_4103, (*spvDescriptorSet0.vp_c10)._m0[10].y, _4115);
            bool _4121 = !_4047;
            float _4123 = _4107;
            if (!_4121)
            {
                float _4125 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4127 = log2(_4125);
                float _4129 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4131 = _4129 + 1.0;
                float _4133 = 1.0 / _4131;
                float _4135 = _4127 * _4049;
                float _4137 = exp2(_4135);
                float _4139 = -_4137;
                float _4141 = _4139 + 1.0;
                float _4143 = _4141 * _4133;
                _4123 = _4143;
                _202 = _4133;
            }
            float _4145 = _4123;
            float _4147 = _202;
            float _4149 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[8].z, _4113);
            float _4151 = fma(_4145, _314, _4119);
            float _4153 = fma(_4103, (*spvDescriptorSet0.vp_c10)._m0[10].x, _4117);
            float _4155 = fma(_4103, (*spvDescriptorSet0.vp_c10)._m0[10].z, _4149);
            float _4157 = -_540;
            float _4159 = _4157 + _4151;
            float _4161 = fma(_4145, _312, _4153);
            float _4163 = fma(_4145, _316, _4155);
            float _4165 = _4159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4167 = _4159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4169 = -_544;
            float _4171 = _4169 + _4161;
            float _4173 = _4159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4175 = -_546;
            float _4177 = _4175 + _4163;
            float _4179 = fma(_4171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4165);
            float _4181 = fma(_4171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4167);
            float _4183 = fma(_4171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4173);
            float _4185 = fma(_4177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4179);
            float _4187 = fma(_4177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4181);
            float _4189 = fma(_4177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4183);
            _616 = _4187;
            _618 = _4185;
            _620 = _4189;
            _4025 = _4185;
            _4031 = _4187;
            _4037 = _4189;
            _3993 = _4155;
            _3999 = _4183;
            _4007 = _4153;
            _390 = _4181;
            _204 = _4147;
        }
        float _4191 = _616;
        float _4193 = _618;
        float _4195 = _620;
        float _4197 = _4025;
        float _4199 = _4031;
        float _4201 = _4037;
        float _4203 = _3993;
        float _4205 = _3999;
        float _4207 = _4007;
        float _4209 = _390;
        float _4211 = _204;
        float _4213 = _4191 * _4191;
        float _4215 = rsqrt(_3951);
        float _4217 = fma(_4193, _4193, _4213);
        float _4219 = fma(_4195, _4195, _4217);
        float _4221 = sqrt(_4219);
        float _4223 = _3915 * _4215;
        float _4225 = _3923 * _4215;
        float _4227 = _3931 * _4215;
        bool _4229 = _4221 > 0.0;
        float _4231 = _4203;
        float _4233 = _4205;
        float _4235 = _4207;
        _392 = _4209;
        _3989 = _4225;
        _622 = _4191;
        _206 = _4211;
        if (!_4229)
        {
            _4231 = _3969;
        }
        float _4237 = _4231;
        _3995 = _4237;
        if (!_4229)
        {
            _4233 = _3973;
        }
        float _4239 = _4233;
        _4001 = _4239;
        if (!_4229)
        {
            _4235 = _3983;
        }
        float _4241 = _4235;
        bool _4243 = !_4229;
        _4009 = _4241;
        if (!_4243)
        {
            float _4245 = rsqrt(_4219);
            float _4247 = _4245 * _4191;
            float _4249 = _4245 * _4193;
            float _4251 = _4245 * _4195;
            float _4253 = _4225 * _4247;
            float _4255 = fma(_4223, _4249, _4253);
            float _4257 = fma(_4227, _4251, _4255);
            float _4259 = _4257 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4261 = fma(_4197, _4259, _3969);
            float _4263 = fma(_4199, _4259, _3973);
            float _4265 = fma(_4201, _4259, _3983);
            _3995 = _4261;
            _4001 = _4263;
            _4009 = _4265;
            _392 = _4253;
        }
    }
    float _4267 = _3995;
    float _4269 = _4001;
    float _4271 = _4009;
    float _4273 = _392;
    float _4275 = _3989;
    float _4277 = _622;
    float _4279 = _206;
    float _4281 = _3977 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4283 = fma(_3811, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4281);
    float _4285 = _3977 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4287 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4289 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4291 = _4287 || _4289;
    bool _4293 = isnan(0.5);
    bool _4295 = _4291 || _4293;
    float _4297 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4283);
    float _4299 = fma(_3811, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4285);
    float _4301 = _4297 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4303 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4299);
    bool _4305 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4307 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4309 = _4305 || _4307;
    bool _4311 = isnan(0.5);
    bool _4313 = _4309 || _4311;
    float _4315 = 1.0 / _4301;
    float _4317 = _4303 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4319 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4321 = _4317;
    float _4323 = _4273;
    float _4325 = _4297;
    float _4327 = _4275;
    float _4329 = _4277;
    float _4331 = _4279;
    if (_4295)
    {
        _4319 = _4267;
    }
    float _4333 = _4319;
    float _4335 = _4317 + _4301;
    float _4337 = _4333;
    if (_4295)
    {
        _4321 = _4269;
    }
    float _4339 = _4321;
    float _4341 = _4339;
    if (_4295)
    {
        _4323 = _4271;
    }
    float _4343 = _4323;
    float _4345 = _4343;
    if (!_4295)
    {
        float _4347 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4349 = _3977 + _4347;
        float _4351 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4353 = _3811 + _4351;
        float _4355 = -_3811;
        float _4357 = _4355 + _4267;
        float _4359 = -_3977;
        float _4361 = _4359 + _4269;
        float _4363 = _4349 * _4349;
        float _4365 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4367 = _3873 + _4365;
        float _4369 = -_3873;
        float _4371 = _4369 + _4271;
        float _4373 = fma(_4353, _4353, _4363);
        float _4375 = fma(_4367, _4367, _4373);
        float _4377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4379 = sqrt(_4375);
        float _4381 = precise::min(_4379, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4383 = _4381 * _4377;
        float _4385 = fma(_4357, _4383, _3811);
        float _4387 = fma(_4361, _4383, _3977);
        float _4389 = fma(_4371, _4383, _3873);
        _4341 = _4387;
        _4337 = _4385;
        _4345 = _4389;
        _4325 = _4379;
    }
    float _4391 = _4341;
    float _4393 = _4337;
    float _4395 = _4345;
    float _4397 = _4325;
    float _4399 = _4397;
    if (_4313)
    {
        _4399 = 1.0;
    }
    float _4401 = _4399;
    float _4403 = _4335 * _4315;
    float _4405 = _4403 * 0.5;
    float _4407 = _4401;
    float _4409 = _4405;
    if (!_4313)
    {
        float _4411 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4413 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4415 = fma(_4405, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4413);
        float _4417 = _4411 * 0.15915493667125701904296875;
        float _4419 = _4417 * 6.283185482025146484375;
        float _4421 = cos(_4419);
        float _4423 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4425 = _4423 * 0.15915493667125701904296875;
        float _4427 = _4417 * 6.283185482025146484375;
        float _4429 = sin(_4427);
        float _4431 = 1.0 / _4421;
        float _4433 = _4425 * 6.283185482025146484375;
        float _4435 = cos(_4433);
        float _4437 = _4429 * _4431;
        float _4439 = 1.0 / _4415;
        float _4441 = _4435 * _4437;
        float _4443 = _4425 * 6.283185482025146484375;
        float _4445 = sin(_4443);
        float _4447 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4449 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4447;
        float _4451 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4453 = _4439 * _4451;
        float _4455 = 1.0 / _4441;
        float _4457 = 1.0 / _4449;
        float _4459 = _4445 * _4455;
        float _4461 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4463 = fma(_4459, _4453, _4461);
        float _4465 = _4463 * _4457;
        float _4467 = precise::clamp(_4465, 0.0, 1.0);
        _4407 = _4467;
    }
    float _4469 = _4407;
    float _4471 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4473 = _4391 + _4471;
    float _4475 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4477 = _4393 + _4475;
    float _4479 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4481 = _4395 + _4479;
    float _4483 = _4473 * _4473;
    float _4485 = fma(_4477, _4477, _4483);
    float _4487 = fma(_4481, _4481, _4485);
    float _4489 = rsqrt(_4487);
    float _4491 = sqrt(_4487);
    float _4493 = _4489 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4495 = _4477 * _4493;
    float _4497 = _4481 * _4493;
    float _4499 = _4495 * _4495;
    float _4501 = _4497 * _4497;
    float _4503 = _4499 + _4501;
    float _4505 = sqrt(_4503);
    bool _4507 = _4505 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4509 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4511 = _4505 + _4509;
    float _4513 = _4489;
    float _4515 = _4503;
    float _4517 = _4511;
    float _4519 = _4473;
    if (_4507)
    {
        float _4521 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4513 = _4521;
    }
    float _4523 = _4513;
    if (_4507)
    {
        float _4525 = rsqrt(_4503);
        _4515 = _4525;
    }
    float _4527 = _4515;
    if (_4507)
    {
        float _4529 = _4511 * _4523;
        _4517 = _4529;
    }
    float _4531 = _4517;
    if (_4507)
    {
        float _4533 = _4531 * 0.15915493667125701904296875;
        _4327 = _4533;
    }
    float _4535 = _4327;
    float _4537 = _4481;
    if (_4507)
    {
        float _4539 = _4535 * 6.283185482025146484375;
        float _4541 = sin(_4539);
        _4537 = _4541;
    }
    float _4543 = _4537;
    float _4545 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4547 = precise::max(0.0, _4545);
    float _4549 = _4523;
    float _4551 = _4547;
    if (_4507)
    {
        float _4553 = _4535 * 6.283185482025146484375;
        float _4555 = cos(_4553);
        _4549 = _4555;
    }
    float _4557 = _4549;
    float _4559 = -_4493;
    float _4561 = -_4547;
    float _4563 = fma(_4473, _4559, _4561);
    if (_4507)
    {
        float _4565 = _4563 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4519 = _4565;
    }
    float _4567 = _4519;
    float _4569 = _4543;
    float _4571 = _4567;
    if (_4507)
    {
        float _4573 = fma(_4543, _4567, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4409 = _4573;
    }
    float _4575 = _4409;
    float _4577 = _4575;
    if (!_4507)
    {
        _4569 = _4495;
    }
    float _4579 = _4569;
    float _4581 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4583 = fma(_4491, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4581);
    float _4585 = precise::clamp(_4583, 0.0, 1.0);
    float _4587 = _4579;
    if (!_4507)
    {
        _4571 = _4563;
    }
    float _4589 = _4571;
    float _4591 = _4589;
    float _4593 = _4557;
    if (_4507)
    {
        float _4595 = _4557 + (-1.0);
        _4551 = _4595;
    }
    float _4597 = _4551;
    float _4599 = _4597;
    if (_4507)
    {
        float _4601 = _4527 * _4575;
        _4329 = _4601;
    }
    float _4603 = _4329;
    if (!_4507)
    {
        _4577 = _4499;
    }
    float _4605 = _4577;
    float _4607 = _4391 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4609 = _4605;
    if (_4507)
    {
        float _4611 = _4597 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4331 = _4611;
    }
    float _4613 = _4331;
    if (_4507)
    {
        float _4615 = _4495 * _4603;
        _4587 = _4615;
    }
    float _4617 = _4587;
    if (!_4507)
    {
        _4599 = _4497;
    }
    float _4619 = _4599;
    float _4621 = _4619;
    if (_4507)
    {
        float _4623 = _4497 * _4603;
        _4621 = _4623;
    }
    float _4625 = _4621;
    if (_4507)
    {
        float _4627 = fma(_4563, _4557, _4613);
        _4591 = _4627;
    }
    float _4629 = _4591;
    if (_4507)
    {
        float _4631 = _4617 * _4617;
        _4609 = _4631;
    }
    float _4633 = _4609;
    if (!_4507)
    {
        _4593 = _4501;
    }
    float _4635 = _4593;
    float _4637 = _4635;
    if (_4507)
    {
        float _4639 = _4625 * _4625;
        _4637 = _4639;
    }
    float _4641 = _4637;
    float _4643 = -_4585;
    float _4645 = _4643 + 1.0;
    float _4647 = fma(_4629, _4629, _4633);
    float _4649 = _4391 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4651 = _4647 + _4641;
    float _4653 = fma(_4393, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4607);
    float _4655 = _4391 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4657 = abs(_4645);
    float _4659 = log2(_4657);
    float _4661 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4663 = fma(_4395, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4653);
    float _4665 = _4391 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4667 = fma(_4393, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4655);
    float _4669 = fma(_4393, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4649);
    float _4671 = _4663 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4673 = fma(_4393, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4665);
    float _4675 = rsqrt(_4651);
    float _4677 = fma(_4395, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4667);
    float _4679 = fma(_4395, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4669);
    float _4681 = fma(_4395, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4673);
    float _4683 = _4677 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4685 = _4679 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4687 = _4681 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4689 = _4659 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4691 = _4671 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4693 = -_4691;
    float _4695 = fma(_4693, _4661, 1.0);
    float _4697 = _4683 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4699 = exp2(_4689);
    float _4701 = _4675 * _4617;
    float _4703 = _4675 * _4629;
    float _4705 = fma(_4687, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4697);
    float _4707 = _4675 * _4625;
    float _4709 = _4701 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4711 = fma(_4671, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4705);
    float _4713 = log2(_4695);
    float _4715 = -_4709;
    float _4717 = fma(_4703, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4715);
    float _4719 = _4683 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4721 = fma(_4685, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4711);
    float _4723 = -_4707;
    float _4725 = fma(_4723, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4717);
    float _4727 = _4683 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4729 = fma(_4687, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4719);
    float _4731 = 1.0 / _4721;
    float _4733 = fma(_4725, -0.5, 0.5);
    float _4735 = fma(_4687, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4727);
    float _4737 = fma(_4725, 0.5, 0.5);
    float _4739 = _4703 + 1.0;
    float _4741 = fma(_4671, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4729);
    float _4743 = fma(_4671, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4735);
    float _4745 = fma(_4737, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4747 = sqrt(_4733);
    float _4749 = -_4703;
    float _4751 = fma(_4699, _4739, _4749);
    float _4753 = fma(_4685, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4743);
    float _4755 = fma(_4685, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4741);
    float _4757 = fma(_4737, _4745, -0.212114393711090087890625);
    float _4759 = _4713 * 0.693147182464599609375;
    float _4761 = fma(_4751, 0.5, 0.5);
    float _4763 = _4753 * _4731;
    float _4765 = _4755 * _4731;
    float _4767 = fma(_4737, _4757, 1.570728778839111328125);
    float _4769 = _4759 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4771 = fma(_4763, 0.5, 0.5);
    float _4773 = fma(_4765, -0.5, 0.5);
    float _4775 = _4747 * 0.636619746685028076171875;
    float3 _12288 = float3(_4771, _4773, _4769);
    float _4777 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12288, float3(0.0), isnan(_12288)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12288, float3(0.0), isnan(_12288)), level(0.0)).x;
    float3 _12299 = float3(_4771, _4773, _4769);
    float4 _4780 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12299, float3(0.0), isnan(_12299)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12299, float3(0.0), isnan(_12299)), level(0.0)).xyzw;
    float _4782 = _4780.x;
    float _4784 = _4780.y;
    float _4786 = _4780.z;
    float _4788 = _4780.w;
    float _4790 = -_4767;
    float _4792 = fma(_4775, _4790, 1.0);
    float2 _12321 = float2(_4792, _4761);
    float3 _4796 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12321, float2(0.0), isnan(_12321)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12321, float2(0.0), isnan(_12321)), level(0.0)).xyz;
    float _4798 = _4796.x;
    float _4800 = _4796.y;
    float _4802 = _4796.z;
    float _4804 = _4659 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4806 = _4683 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_91.x = _3811;
    out.m_91.y = _3977;
    out.m_91.z = _3873;
    bool _4808 = _4491 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4810 = isnan(_4491);
    bool _4812 = _4808 || _4810;
    bool _4814 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4816 = _4812 || _4814;
    float _4818 = fma(_4687, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4806);
    float _4820 = exp2(_4804);
    float _4822 = _4753 + _4721;
    out.m_93.x = _4393;
    out.m_93.y = _4391;
    out.m_93.z = _4395;
    float _4824 = fma(_4671, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4818);
    float _4826 = _4721 * 0.5;
    float _4828 = _4822 * 0.5;
    float _4830 = fma(_4685, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4824);
    float _4832 = fma(_4755, -0.5, _4826);
    float _4834 = _4830 + _4721;
    out.gl_Position.x = _4753;
    out.gl_Position.y = _4755;
    out.gl_Position.z = _4830;
    out.gl_Position.w = _4721;
    float _4836 = _4834 * 0.5;
    float _4838 = -_4820;
    float _4840 = _4838 + 1.0;
    float _4842 = _4840 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_95.x = _4828;
    out.m_95.y = _4832;
    out.m_95.z = _4836;
    out.m_95.w = _4721;
    float _4844 = -_4842;
    float _4846 = _4844 + 1.0;
    float _4848 = _4830;
    float _4850 = _4755;
    float _4852 = _4753;
    if (!_4816)
    {
        _4848 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4854 = _4848;
    float _4856 = _4854;
    float _4858 = _4854;
    if (!_4816)
    {
        _4850 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4860 = _4850;
    float _4862 = _4860;
    float _4864 = _4860;
    if (!_4816)
    {
        _4852 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4866 = _4852;
    float _4868 = _4842 * _4777;
    float _4870 = _4788 * _4846;
    float _4872 = _4469 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4874 = _4788 * _4868;
    float _4876 = _4802 * _4868;
    float _4878 = fma(_4798, _4874, _4782);
    float _4880 = fma(_4800, _4874, _4784);
    float _4882 = fma(_4788, _4876, _4786);
    out.m_97.x = _4878;
    out.m_97.y = _4880;
    out.m_97.z = _4882;
    out.m_97.w = _4870;
    bool _4884 = !_4816;
    float _4886 = _4866;
    float _4888 = _4866;
    if (!_4884)
    {
        bool _4890 = _4491 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4892 = isnan(_4491);
        bool _4894 = _4890 || _4892;
        bool _4896 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4898 = _4894 || _4896;
        if (!_4898)
        {
            float _4900 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4902 = _4491 + _4900;
            float _4904 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4906 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4904;
            float _4908 = 1.0 / _4906;
            float _4910 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4912 = _4910 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4914 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4916 = _4914 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4918 = _4902 * _4908;
            float _4920 = precise::clamp(_4918, 0.0, 1.0);
            float _4922 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4924 = _4922 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4926 = fma(_4920, _4916, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4928 = fma(_4920, _4924, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4930 = fma(_4920, _4912, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4864 = _4930;
            _4858 = _4928;
            _4888 = _4926;
            _4932 = true;
        }
        else
        {
            bool _4934 = _4491 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4936 = isnan(_4491);
            bool _4938 = _4934 || _4936;
            bool _4940 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4942 = _4938 || _4940;
            if (!_4942)
            {
                _4856 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4944 = _4856;
            _4858 = _4944;
            if (!_4942)
            {
                _4862 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4946 = _4862;
            _4864 = _4946;
            if (!_4942)
            {
                _4886 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4948 = _4886;
            bool _4950 = !_4942;
            _4888 = _4948;
            if (!_4950)
            {
                bool _4952 = _4491 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4954 = isnan(_4491);
                bool _4956 = _4952 || _4954;
                bool _4958 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4960 = _4956 || _4958;
                if (!_4960)
                {
                    float _4962 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4964 = _4491 + _4962;
                    float _4966 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4968 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4966;
                    float _4970 = 1.0 / _4968;
                    float _4972 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4974 = _4972 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4976 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4978 = _4976 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4980 = _4964 * _4970;
                    float _4982 = precise::clamp(_4980, 0.0, 1.0);
                    float _4984 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4986 = _4984 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4988 = fma(_4982, _4978, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4990 = fma(_4982, _4986, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4992 = fma(_4982, _4974, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4864 = _4992;
                    _4858 = _4990;
                    _4888 = _4988;
                    _4932 = true;
                }
                else
                {
                    _4864 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4858 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4888 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4932 = false;
    float _4994 = _4864;
    float _4996 = _4858;
    float _4998 = _4888;
    float _5000 = _4872 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_99.x = 0.0;
    float _5002 = _4994 * 0.586610972881317138671875;
    bool _5004 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _5000;
    float _5006 = fma(_4996, 0.298911988735198974609375, _5002);
    bool _5008 = _4469 > 0.0;
    bool _5010 = isnan(_4469);
    bool _5012 = _5008 || _5010;
    bool _5014 = isnan(0.0);
    bool _5016 = _5012 || _5014;
    float _5018 = fma(_4998, 0.114477999508380889892578125, _5006);
    float _5020 = -_5018;
    float _5022 = _5020 + _4996;
    float _5024 = -_5018;
    float _5026 = _5024 + _4994;
    float _5028 = -_5018;
    float _5030 = _5028 + _4998;
    float _5032 = fma(_5022, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5018);
    float _5034 = fma(_5026, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5018);
    float _5036 = fma(_5030, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5018);
    bool _5038 = !_5004;
    if (!_5038)
    {
        float _5040 = -_4391;
        float _5042 = _5040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5044 = -_4393;
        float _5046 = _5044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5048 = -_4395;
        float _5050 = _5048 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5052 = _5042 * _5042;
        float _5054 = fma(_5046, _5046, _5052);
        float _5056 = fma(_5050, _5050, _5054);
        float _5058 = sqrt(_5056);
        float _5060 = rsqrt(_5056);
        float _5062 = -_5058;
        float _5064 = _5062 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5066 = _5064 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5068 = precise::clamp(_5066, 0.0, 1.0);
        float _5070 = _5046 * _5060;
        float _5072 = _5042 * _5060;
        float _5074 = abs(_5068);
        float _5076 = log2(_5074);
        float _5078 = _5050 * _5060;
        float _5080 = _5070 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5082 = _3939 * _5072;
        float _5084 = -_5072;
        float _5086 = -_5080;
        float _5088 = fma(_5084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5086);
        float _5090 = fma(_3855, _5070, _5082);
        float _5092 = -_5078;
        float _5094 = fma(_5092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5088);
        float _5096 = fma(_3793, _5078, _5090);
        float _5098 = precise::clamp(_5096, 0.0, 1.0);
        float _5100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5102 = _5094 + _5100;
        float _5104 = _5076 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5106 = _5102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5108 = precise::clamp(_5106, 0.0, 1.0);
        float _5110 = exp2(_5104);
        float _5112 = _5110 * _5108;
        float _5114 = _5098 * _5112;
        float _5116 = _5114 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5118 = _5114 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5120 = _5114 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _5116;
        out.m_99.y = _5118;
        out.m_99.z = _5120;
    }
    out.m_71.x = _5032;
    out.m_71.y = _5034;
    out.m_71.z = _5036;
    if (_5016)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _5122 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5122;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4932 = false;
    bool _1300 = false;
    bool _1090 = false;
    bool _984 = false;
    bool _812 = false;
    bool _640 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_44.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (!_122)
    {
        out.m_47.x = 0.0;
    }
    int _128 = 0;
    if (!_122)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5178 = as_type<float>(_132);
        out.gl_Position.z = _5178;
    }
    if (!_122)
    {
        return out;
    }
    float _136 = in.m_49.w;
    float _138 = float(_118);
    float _140 = 1.0 / _138;
    float _142 = -_136;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_136);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = _144 * _140;
    bool _158 = _144 >= _138;
    bool _160 = !_154;
    bool _162 = _158 || _160;
    out.m_51.x = _156;
    float _164 = _136;
    float _166 = _144;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _164;
    if (_162)
    {
        out.m_47.x = 0.0;
    }
    if (_162)
    {
        float _170 = _168 * 5.0;
        _134 = as_type<int>(_170);
    }
    int _172 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5250 = as_type<float>(_172);
        out.gl_Position.z = _5250;
    }
    if (_162)
    {
        return out;
    }
    float _174 = in.m_53.x;
    float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _178 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _180 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _182 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _184 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _186 = _182 || _184;
    bool _188 = isnan(1.0);
    bool _190 = _186 || _188;
    float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _194 = _178 * _176;
    float _196 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _198 = 0.0;
    float _200 = _180;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_190)
    {
        float _208 = _180 * _180;
        float _210 = _208 * 0.5;
        _198 = _210;
    }
    float _212 = _198;
    float _214 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[20].x, _194);
    float _216 = _196 * _192;
    float _218 = _212;
    if (!_190)
    {
        float _220 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _220;
    }
    float _222 = _218;
    float _224 = floor(_214);
    float _226 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[20].y, _216);
    float _228 = _214 * 6.283185482025146484375;
    float _230 = _228 * 0.15915493667125701904296875;
    int _232 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _234 = _232 != 0;
    float _236 = floor(_226);
    float _238 = _230 * 6.283185482025146484375;
    float _240 = cos(_238);
    float _242 = -_224;
    float _244 = _214 + _242;
    bool _246 = !_190;
    float _248 = _222;
    if (!_246)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = _180 * _252;
        float _262 = 1.0 / _256;
        float _264 = _258 * 0.693147182464599609375;
        float _266 = exp2(_260);
        float _268 = 1.0 / _264;
        float _270 = _266 + (-1.0);
        float _272 = -_270;
        float _274 = fma(_272, _268, _180);
        float _276 = _274 * _262;
        float _278 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _248 = _278;
    }
    float _280 = _248;
    bool _282 = !_190;
    if (!_282)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = 1.0 / _290;
        float _294 = _180 * _286;
        float _296 = exp2(_294);
        float _298 = -_296;
        float _300 = _298 + 1.0;
        float _302 = _300 * _292;
        _200 = _302;
    }
    float _304 = _200;
    float _306 = -_236;
    float _308 = _226 + _306;
    float _310 = _226 * 6.283185482025146484375;
    float _312 = in.m_49.x;
    float _314 = in.m_49.y;
    float _316 = in.m_49.z;
    float _318 = _310 * 0.15915493667125701904296875;
    float _320 = fma(_240, 0.5, 0.5);
    float _322 = in.m_55.w;
    bool _324 = _244 < 0.5;
    float _326 = float(_324);
    float _328 = -_244;
    float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _332 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = in.m_44.x;
    float _336 = in.m_44.y;
    float _338 = in.m_44.z;
    float _340 = -_320;
    float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _344 = _318 * 6.283185482025146484375;
    float _346 = cos(_344);
    float _348 = -_326;
    float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _352 = in.m_57.x;
    float _354 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _356 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _358 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _360 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _362 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _364 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[8].x, _354);
    float _366 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[8].z, _360);
    float _368 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[8].y, _356);
    bool _370 = _308 < 0.5;
    float _372 = float(_370);
    float _374 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[10].x, _364);
    float _376 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[10].z, _366);
    float _378 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[10].y, _368);
    float _380 = fma(_346, 0.5, 0.5);
    float _382 = fma(_304, _312, _374);
    float _384 = fma(_304, _316, _376);
    float _386 = fma(_304, _314, _378);
    float _388 = _376;
    float _390 = _316;
    float _392 = _316;
    if (!_190)
    {
        float _394 = _144 * _144;
        float _396 = _394 * 0.5;
        _388 = _396;
    }
    float _398 = _388;
    float _400 = -_308;
    float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _404 = -_372;
    float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _408 = fma(_382, _322, _334);
    float _410 = -_380;
    float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _414 = fma(_386, _322, _336);
    float _416 = fma(_384, _322, _338);
    float _418 = _334;
    float _420 = _336;
    if (!_190)
    {
        float _422 = _398 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _418 = _422;
    }
    float _424 = _418;
    bool _426 = !_190;
    float _428 = _424;
    float _430 = _352;
    if (!_426)
    {
        float _432 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _434 = log2(_432);
        float _436 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _438 = _436 + 1.0;
        float _440 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _442 = _144 * _434;
        float _444 = 1.0 / _438;
        float _446 = _440 * 0.693147182464599609375;
        float _448 = exp2(_442);
        float _450 = 1.0 / _446;
        float _452 = _448 + (-1.0);
        float _454 = -_452;
        float _456 = fma(_454, _450, _144);
        float _458 = _456 * _444;
        float _460 = _458 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _428 = _460;
        _420 = _448;
    }
    float _462 = _428;
    float _464 = _420;
    float _466 = _462 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _468 = _464;
    if (!_190)
    {
        _468 = _144;
    }
    float _470 = _468;
    bool _472 = !_190;
    float _474 = _470;
    if (!_472)
    {
        float _476 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _478 = log2(_476);
        float _480 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _482 = _480 + 1.0;
        float _484 = 1.0 / _482;
        float _486 = _144 * _478;
        float _488 = exp2(_486);
        float _490 = -_488;
        float _492 = _490 + 1.0;
        float _494 = _492 * _484;
        _474 = _494;
    }
    float _496 = _474;
    float _498 = in.m_57.y;
    float _500 = _462 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _502 = _466 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _506 = _504 != 0;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _510 = _508 != 0;
    float _512 = _466 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _514 = _466 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _516 = _462 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _518 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[8].y, _502);
    bool _520 = !_506;
    int _522 = _520 ? 0 : 1;
    float _524 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[8].x, _512);
    float _526 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[8].z, _514);
    float _528 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[10].y, _518);
    int _530 = abs(_522);
    float _532 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[10].x, _524);
    float _534 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[10].z, _526);
    out.m_59.x = _352;
    bool _536 = !_234;
    int _538 = _536 ? 0 : 1;
    float _540 = fma(_496, _314, _528);
    float _542 = float(_530);
    float _544 = fma(_496, _312, _532);
    float _546 = fma(_496, _316, _534);
    int _548 = abs(_538);
    float _550 = -_540;
    float _552 = _386 + _550;
    bool _554 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    out.m_59.y = _498;
    bool _556 = !_510;
    int _558 = _556 ? 0 : 1;
    float _560 = abs(_330);
    float _562 = _542 * _560;
    float _564 = abs(_402);
    float _566 = _542 * _564;
    float _568 = float(_548);
    float _570 = -_544;
    float _572 = _382 + _570;
    float _574 = _552 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _576 = abs(_558);
    float _578 = _552 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _580 = _552 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _582 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[4].x, _574);
    float _584 = fma(_568, _342, _562);
    float _586 = float(_576);
    float _588 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[5].x, _578);
    float _590 = -_546;
    float _592 = _384 + _590;
    float _594 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
    float _596 = fma(_568, _412, _566);
    float _598 = abs(_350);
    float _600 = fma(_586, _598, _584);
    float _602 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[4].z, _582);
    float _604 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[5].z, _588);
    float _606 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[6].z, _594);
    float _608 = abs(_406);
    float _610 = fma(_586, _608, _596);
    bool _612 = !_554;
    float _614 = _498;
    float _616 = _604;
    float _618 = _602;
    float _620 = _606;
    float _622 = _604;
    float _638;
    if (!_612)
    {
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _626 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _630 = _628 * _624;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _636;
        _640 = true;
    }
    else
    {
        _638 = _156;
    }
    _640 = false;
    float _642 = _638;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _646 = _642 + _644;
    bool _648 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _650 = isnan(_642);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _662 = _642 + _660;
    bool _664 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _666 = isnan(_642);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _684 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _686 = isnan(_642);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -_658;
    float _698 = _696 + 1.0;
    float _700 = 1.0 / _682;
    float _702 = _694 * _698;
    float _704 = -_694;
    float _706 = _704 + 1.0;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _708;
    bool _712 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _714 = 1.0 / _678;
    float _716 = _674 * _706;
    float _718 = -_674;
    float _720 = _718 + 1.0;
    float _722 = _662 * _700;
    float _724 = _646 * _714;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _730;
    float _734 = fma(_710, _724, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _736 = fma(_728, _724, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _738 = fma(_732, _724, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _740 = in.m_55.x;
    float _742 = in.m_55.y;
    float _744 = in.m_55.z;
    float _746 = _734 * _716;
    float _748 = _736 * _716;
    float _750 = _738 * _716;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _764 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].x, _746);
    float _766 = fma(_754, _722, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _768 = fma(_758, _722, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _770 = fma(_762, _722, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _772 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].y, _748);
    float _774 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].z, _750);
    float _776 = fma(_766, _702, _764);
    float _778 = fma(_768, _702, _772);
    float _780 = fma(_770, _702, _774);
    float _782 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[145].x, _776);
    float _784 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[145].y, _778);
    float _786 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[145].z, _780);
    float _788 = _782 * _740;
    float _790 = _784 * _742;
    float _792 = _786 * _744;
    bool _794 = !_712;
    float _810;
    if (!_794)
    {
        float _796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _798 = _174 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _802 = _800 * _796;
        float _804 = floor(_802);
        float _806 = -_804;
        float _808 = _802 + _806;
        _810 = _808;
        _812 = true;
    }
    else
    {
        _810 = _156;
    }
    _812 = false;
    float _814 = _810;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _824 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _826 = isnan(_814);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = 1.0 / _818;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _842 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _844 = isnan(_814);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _854;
    float _858 = -_834;
    float _860 = _858 + 1.0;
    bool _862 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _864 = isnan(_814);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    bool _874 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _876 = 1.0 / _822;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _882 = _852 * _860;
    float _884 = -_852;
    float _886 = _884 + 1.0;
    float _888 = _872 * _886;
    float _890 = 1.0 / _840;
    float _892 = _856 * _836;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _896 = _814 + _894;
    float _898 = -_872;
    float _900 = _898 + 1.0;
    float _902 = fma(_892, _896, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _906 = _814 + _904;
    float _908 = _880 * _876;
    bool _910 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _912 = isnan(_814);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _922;
    float _926 = _902 * _888;
    float _928 = fma(_908, _906, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _932 = _814 + _930;
    float _934 = -_920;
    float _936 = _934 + 1.0;
    float _938 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[115].x, _926);
    float _940 = _924 * _890;
    float _942 = _834 * _936;
    float _944 = fma(_928, _882, _938);
    float _946 = fma(_940, _932, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _950 = fma(_946, _942, _944);
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _954 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _958 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[118].x, _950);
    float _960 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _958 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _954;
    out.m_61.y = _960;
    out.m_61.z = _962;
    out.m_61.w = _964;
    bool _966 = !_874;
    float _982;
    if (!_966)
    {
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _970 = _174 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[11].z, _144);
        float _974 = _972 * _968;
        float _976 = floor(_974);
        float _978 = -_976;
        float _980 = _974 + _978;
        _982 = _980;
        _984 = true;
    }
    else
    {
        _982 = _156;
    }
    _984 = false;
    float _986 = _982;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _990 = _986 + _988;
    bool _992 = _986 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _994 = isnan(_986);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1004;
    bool _1008 = _986 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1010 = isnan(_986);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = 1.0 / _1006;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1022;
    bool _1026 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1028;
    float _1032 = _990 * _1020;
    float _1034 = -_1002;
    float _1036 = _1034 + 1.0;
    float _1038 = fma(_1024, _1032, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1040 = fma(_1030, _1032, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1042;
    float _1046 = _1018 * _1036;
    float _1048 = -_1018;
    float _1050 = _1048 + 1.0;
    float _1052 = fma(_1044, _1032, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1054 = _1038 * _1046;
    float _1056 = _1052 * _1046;
    float _1058 = _1040 * _1046;
    float _1060 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1054);
    float _1062 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1056);
    float _1064 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1058);
    float _1066 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1060);
    float _1068 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1062);
    float _1070 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1064);
    bool _1072 = !_1026;
    float _1088;
    if (!_1072)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1076 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _1080 = _1078 * _1074;
        float _1082 = floor(_1080);
        float _1084 = -_1082;
        float _1086 = _1080 + _1084;
        _1088 = _1086;
        _1090 = true;
    }
    else
    {
        _1088 = _156;
    }
    _1090 = false;
    float _1092 = _1088;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1098;
    bool _1102 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1104 = isnan(_1092);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1110 = _1106 || _1108;
    float _1112 = float(_1110);
    float _1114 = 1.0 / _1096;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1124 = -_1112;
    float _1126 = _1124 + 1.0;
    bool _1128 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1130 = isnan(_1092);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = 1.0 / _1118;
    bool _1142 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1144 = isnan(_1092);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    bool _1154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1156 = _1152 * _1126;
    float _1158 = -_1152;
    float _1160 = _1158 + 1.0;
    float _1162 = _1100 * _1114;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1166 = _1092 + _1164;
    float _1168 = 1.0 / _1122;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1174 = _1138 * _1160;
    float _1176 = fma(_1162, _1166, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1182 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1184 = isnan(_1092);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1194;
    float _1198 = _1172 * _1140;
    float _1200 = 1.0 / _1180;
    float _1202 = _1176 * _1174;
    float _1204 = -_1192;
    float _1206 = _1204 + 1.0;
    float _1208 = -_1138;
    float _1210 = _1208 + 1.0;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1216 = _1112 * _1206;
    bool _1218 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1220 = isnan(_1092);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1226 = _1222 || _1224;
    float _1228 = float(_1226);
    float _1230 = _1196 * _1168;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1234 = _1092 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1238 = _1092 + _1236;
    float _1240 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1202);
    float _1242 = -_1228;
    float _1244 = _1242 + 1.0;
    float _1246 = fma(_1198, _1234, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1248 = fma(_1230, _1238, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1252 = _1092 + _1250;
    float _1254 = _1214 * _1200;
    float _1256 = fma(_1246, _1156, _1240);
    float _1258 = _1192 * _1244;
    float _1260 = _1068 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1262 = fma(_1254, _1252, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1264 = fma(_1248, _1216, _1256);
    float _1266 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1268 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = fma(_1262, _1258, _1264);
    float _1272 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1274 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1276 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1270);
    float _1278 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1276 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _1274;
    out.m_63.y = _1268;
    out.m_63.z = _1278;
    out.m_63.w = _1280;
    bool _1282 = !_1154;
    float _1298;
    if (!_1282)
    {
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1286 = _174 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _1290 = _1288 * _1284;
        float _1292 = floor(_1290);
        float _1294 = -_1292;
        float _1296 = _1290 + _1294;
        _1298 = _1296;
        _1300 = true;
    }
    else
    {
        _1298 = _156;
    }
    _1300 = false;
    float _1302 = _1298;
    float _1304 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1306 = int(_1304);
    float _1308 = in.m_53.y;
    float _1310 = _600 * _788;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1314 = _1312 != 0;
    float _1316 = in.m_53.z;
    float _1318 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1320 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1322 = int(_1320);
    float _1324 = in.m_65.w;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1328 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1330 = int(_1328);
    float _1332 = float(_1306);
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1338 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1334);
    float _1340 = 1.0 / _1332;
    float _1342 = float(uint(_1322));
    float _1344 = float(_1322);
    float _1346 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1348 = _1322 == 0;
    float _1350 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _1352 = _1322 + (-1);
    float _1354 = 1.0 / _1342;
    float _1356 = float(_1330);
    out.m_67.w = _1324;
    float _1358 = _144 * _1340;
    float _1360 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1362 = int(_1360);
    int _1364 = ~_1322;
    int _1366 = _1364 + 1;
    float _1368 = -_1346;
    float _1370 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1368);
    float _1372 = -_1350;
    float _1374 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1372);
    int _1376 = as_type<int>(_1354) + (-2);
    float _1378 = trunc(_1358);
    int _1380 = int(_1378);
    float _1382 = 1.0 / _1356;
    float _1384 = float(uint(_1362));
    int _1386 = ~_1362;
    int _1388 = _1386 + 1;
    float _1390 = float(uint(_1380));
    float _1392 = 1.0 / _1384;
    float _1394 = as_type<float>(_1376) * _1390;
    float _1396 = _144 * _1382;
    float _1398 = trunc(_1394);
    float _1400 = precise::max(_1398, 0.0);
    uint _1403 = uint(_1400);
    float _1405 = trunc(_1396);
    int _1407 = int(_1405);
    int _1409 = ~_1322;
    int _1411 = _1409 + 1;
    int _1413 = _1366 * int(_1403);
    int _1415 = _1413 + _1380;
    float _1417 = float(uint(_1415));
    float _1419 = float(uint(_1407));
    float _1421 = as_type<float>(_1376) * _1417;
    float _1423 = _1417;
    float _1425 = _1316;
    if (_1314)
    {
        _1423 = 1.0;
    }
    float _1427 = _1423;
    float _1429 = _1427;
    if (!_1314)
    {
        _1429 = 7.345489978790283203125;
    }
    float _1431 = _1429;
    float _1433 = trunc(_1421);
    float _1435 = precise::max(_1433, 0.0);
    uint _1437 = uint(_1435);
    float _1439 = _1431 * _174;
    int _1441 = as_type<int>(_1392) + (-2);
    float _1443 = floor(_1439);
    float _1445 = as_type<float>(_1441) * _1419;
    int _1447 = int(_1403) + int(_1437);
    float _1449 = trunc(_1445);
    float _1451 = precise::max(_1449, 0.0);
    uint _1453 = uint(_1451);
    float _1455 = float(_1380);
    int _1457 = _1411 * _1447;
    int _1459 = _1457 + _1380;
    int _1461 = ~_1362;
    int _1463 = _1461 + 1;
    bool _1465 = _1455 >= _1344;
    bool _1467 = isnan(_1455);
    bool _1469 = _1465 || _1467;
    bool _1471 = isnan(_1344);
    bool _1473 = _1469 || _1471;
    float _1475 = float(_1473);
    float _1477 = -_1443;
    float _1479 = _1439 + _1477;
    bool _1481 = uint(_1459) >= uint(_1322);
    bool _1483 = !_1481;
    int _1485 = _1483 ? 0 : (-1);
    float _1487 = trunc(_1475);
    int _1489 = int(_1487);
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1493 = _1491 != 0;
    int _1495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1497 = _1495 != 0;
    int _1499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1501 = _1499 != 0;
    int _1503 = ~_1447;
    int _1505 = _1503 + _1485;
    int _1507 = _1505 + 1;
    float _1509 = _1479 * _1344;
    int _1511 = _1463 * int(_1453);
    int _1513 = _1511 + _1407;
    int _1515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1517 = _1515 != 0;
    float _1519 = _156 * _1344;
    int _1521 = _1322 * _1507;
    int _1523 = _1521 + _1380;
    float _1525 = trunc(_1509);
    int _1527 = int(_1525);
    float _1529 = float(uint(_1513));
    bool _1531 = !_1517;
    int _1533 = _1531 ? 0 : 1;
    bool _1535 = !_1348;
    float _1537 = _1535 ? as_type<float>(_1523) : as_type<float>(0xffffffffu /* nan */);
    float _1539 = as_type<float>(_1441) * _1529;
    int _1541 = ~_1489;
    int _1543 = _1541 + 1;
    int _1545 = _1543 + 1;
    float _1547 = trunc(_1519);
    int _1549 = int(_1547);
    bool _1551 = !_1493;
    int _1553 = _1551 ? 0 : 1;
    int _1555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1557 = _1555 != 0;
    int _1559 = as_type<int>(_1537) * _1545;
    bool _1561 = !_1497;
    int _1563 = _1561 ? 0 : 1;
    int _1565 = abs(_1533);
    float _1567 = trunc(_1539);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    int _1573 = abs(_1563);
    int _1575 = _1489 * _1352;
    int _1577 = _1575 + _1559;
    int _1579 = abs(_1553);
    int _1581 = _1527 * _1565;
    int _1583 = _1581 + _1380;
    float _1585 = as_type<float>(_1545);
    float _1587 = _1537;
    if (_1557)
    {
        _1585 = _174;
    }
    float _1589 = _1585;
    float _1591 = _1589;
    if (_1557)
    {
        _1587 = 1.0;
    }
    float _1593 = _1587;
    int _1595 = _1577 * _1573;
    float _1597 = _1593;
    if (!_1557)
    {
        _1591 = _1308;
    }
    float _1599 = _1591;
    if (!_1557)
    {
        _1597 = 1.2345600128173828125;
    }
    float _1601 = _1597;
    int _1603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1605 = _1603 != 0;
    float _1607 = _1599 * _1601;
    bool _1609 = !_1501;
    int _1611 = _1609 ? 0 : 1;
    bool _1613 = !_1605;
    int _1615 = _1613 ? 0 : 1;
    int _1617 = _1549 * _1579;
    int _1619 = _1617 + _1595;
    int _1621 = abs(_1611);
    float _1623 = floor(_1607);
    int _1625 = int(_1453) + int(_1571);
    int _1627 = ~_1362;
    int _1629 = _1627 + 1;
    int _1631 = _1583 * _1621;
    int _1633 = _1631 + _1619;
    int _1635 = abs(_1615);
    float _1637 = float(_1362);
    int _1639 = _1629 * _1625;
    int _1641 = _1639 + _1407;
    float _1643 = float(_1407);
    int _1645 = ~_1322;
    int _1647 = _1645 + 1;
    bool _1649 = _1643 >= _1637;
    bool _1651 = isnan(_1643);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan(_1637);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    int _1661 = _1527 * _1635;
    int _1663 = _1661 + _1633;
    bool _1665 = uint(_1641) >= uint(_1362);
    float _1667 = -_1623;
    float _1669 = _1607 + _1667;
    int _1671 = 0;
    int _1673 = _1625;
    if (_1557)
    {
        _1671 = 0;
    }
    int _1675 = _1671;
    float _1677 = trunc(_1659);
    int _1679 = int(_1677);
    float _1681 = float(uint(_1663));
    bool _1683 = !_1665;
    int _1685 = _1683 ? 0 : (-1);
    int _1687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1689 = _1687 != 0;
    int _1691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1693 = _1691 != 0;
    int _1695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1697 = _1695 != 0;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1701 = _1699 != 0;
    float _1703 = as_type<float>(_1376) * _1681;
    int _1705 = ~_1625;
    int _1707 = _1705 + _1685;
    int _1709 = _1707 + 1;
    bool _1711 = _1322 == 0;
    bool _1713 = !_1693;
    int _1715 = _1713 ? 0 : 1;
    int _1717 = _1362 * _1709;
    int _1719 = _1717 + _1407;
    bool _1721 = _1362 == 0;
    float _1723 = trunc(_1703);
    float _1725 = precise::max(_1723, 0.0);
    uint _1727 = uint(_1725);
    int _1729 = abs(_1715);
    int _1731 = ~_1679;
    int _1733 = _1731 + 1;
    int _1735 = _1733 + 1;
    bool _1737 = !_1721;
    int _1739 = _1737 ? _1719 : (-1);
    float _1741 = _1669 * _1637;
    float _1743 = _156 * _1637;
    bool _1745 = !_1689;
    int _1747 = _1745 ? 0 : 1;
    int _1749 = _1739 * _1735;
    int _1751 = _1362 + (-1);
    float _1753 = trunc(_1741);
    int _1755 = int(_1753);
    int _1757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1759 = _1757 != 0;
    int _1761 = abs(_1747);
    int _1763 = _1679 * _1751;
    int _1765 = _1763 + _1749;
    bool _1767 = !_1697;
    int _1769 = _1767 ? 0 : 1;
    int _1771 = _1647 * int(_1727);
    int _1773 = _1771 + _1663;
    bool _1775 = !_1759;
    int _1777 = _1775 ? 0 : 1;
    float _1779 = trunc(_1743);
    int _1781 = int(_1779);
    bool _1783 = !_1701;
    int _1785 = _1783 ? 0 : 1;
    int _1787 = _1765 * _1729;
    float _1789 = float(uint(_1773));
    int _1791 = abs(_1777);
    int _1793 = abs(_1769);
    float _1795 = as_type<float>(_1376) * _1789;
    float _1797 = trunc(_1795);
    float _1799 = precise::max(_1797, 0.0);
    uint _1801 = uint(_1799);
    int _1803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1805 = _1803 != 0;
    int _1807 = _1755 * _1791;
    int _1809 = _1807 + _1407;
    int _1811 = abs(_1785);
    int _1813 = _1781 * _1761;
    int _1815 = _1813 + _1787;
    int _1817 = ~_1362;
    int _1819 = _1817 + 1;
    float _1821 = float(uint(_1809));
    int _1823 = _1809 * _1793;
    int _1825 = _1823 + _1815;
    int _1827 = _1675;
    int _1829 = as_type<int>(_1795);
    bool _1831 = _1759;
    float _1833 = as_type<float>(_1727);
    if (!_1557)
    {
        _1827 = 2;
    }
    int _1835 = _1827;
    int _1837 = _1755 * _1811;
    int _1839 = _1837 + _1825;
    if (_1805)
    {
        float _1841 = -_352;
        float _1843 = _1841 + 1.0;
        _1829 = as_type<int>(_1843);
    }
    int _1845 = _1829;
    if (_1805)
    {
        bool _1847 = _174 > 0.5;
        _1831 = _1847;
    }
    bool _1849 = _1831;
    float _1851 = as_type<float>(_1441) * _1821;
    int _1853 = int(_1727) + int(_1801);
    float _1855 = float(uint(_1839));
    float _1857 = trunc(_1851);
    float _1859 = precise::max(_1857, 0.0);
    uint _1861 = uint(_1859);
    if (!_1805)
    {
        _1833 = _352;
    }
    float _1863 = _1833;
    float _1865 = float(uint(_1583));
    float _1867 = as_type<float>(_1441) * _1855;
    float _1869 = _1863;
    if (_1805)
    {
        float _1871 = _1849 ? as_type<float>(_1845) : _352;
        _1869 = _1871;
    }
    float _1873 = _1869;
    float _1875 = in.m_53.w;
    int _1877 = ~_1322;
    int _1879 = _1877 + 1;
    float _1881 = as_type<float>(_1376) * _1865;
    float _1883 = trunc(_1867);
    float _1885 = precise::max(_1883, 0.0);
    uint _1887 = uint(_1885);
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1891 = _1889 != 0;
    int _1893 = _1879 * _1853;
    int _1895 = _1893 + _1663;
    bool _1897 = _1308 > 0.5;
    float _1899 = trunc(_1881);
    float _1901 = precise::max(_1899, 0.0);
    uint _1903 = uint(_1901);
    bool _1905 = uint(_1895) >= uint(_1322);
    float _1907 = -_498;
    float _1909 = _1907 + 1.0;
    bool _1911 = !_1905;
    int _1913 = _1911 ? 0 : (-1);
    if (_1891)
    {
        float _1915 = -_352;
        float _1917 = _1915 + 1.0;
        _1673 = as_type<int>(_1917);
    }
    int _1919 = _1673;
    int _1921 = _1897 ? as_type<int>(_1909) : as_type<int>(_498);
    int _1923 = _1819 * int(_1887);
    int _1925 = _1923 + _1839;
    bool _1927 = _1316 > 0.5;
    int _1929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1931 = _1929 != 0;
    float _1933 = float(uint(_1925));
    int _1935 = ~_1322;
    int _1937 = _1935 + 1;
    float _1939 = _1931 ? as_type<float>(_1921) : _498;
    float _1941 = as_type<float>(_1441) * _1933;
    float _1943 = _1933;
    if (!_1891)
    {
        _1943 = _352;
    }
    float _1945 = _1943;
    float _1947 = _1945;
    if (_1891)
    {
        float _1949 = _1927 ? as_type<float>(_1919) : _352;
        _1947 = _1949;
    }
    float _1951 = _1947;
    float _1953 = trunc(_1941);
    float _1955 = precise::max(_1953, 0.0);
    uint _1957 = uint(_1955);
    bool _1959 = _1875 > 0.5;
    int _1961 = _1937 * int(_1903);
    int _1963 = _1961 + _1583;
    int _1965 = ~_1853;
    int _1967 = _1965 + _1913;
    int _1969 = _1967 + 1;
    int _1971 = _1388 * int(_1861);
    int _1973 = _1971 + _1809;
    int _1975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1977 = _1975 != 0;
    float _1979 = float(uint(_1963));
    int _1981 = _1322 * _1969;
    int _1983 = _1981 + _1663;
    int _1985 = _1959 ? as_type<int>(_1909) : as_type<int>(_498);
    float _1987 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1991 = _1989 != 0;
    float _1993 = as_type<float>(_1376) * _1979;
    bool _1995 = !_1711;
    int _1997 = _1995 ? _1983 : (-1);
    float _1999 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2001 = _1991 ? as_type<float>(_1985) : _498;
    float _2003 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2005 = _1997 & 3;
    bool _2007 = _2005 != 0;
    float _2009 = trunc(_1993);
    float _2011 = precise::max(_2009, 0.0);
    uint _2013 = uint(_2011);
    if (_1977)
    {
        float _2015 = _1927 ? _1909 : _498;
        _614 = _2015;
    }
    float _2017 = _614;
    float _2019 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1987);
    int _2021 = int(_1887) + int(_1957);
    int _2023 = ~_1362;
    int _2025 = _2023 + 1;
    float _2027 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2019);
    float _2029 = float(uint(_1973));
    bool _2031 = uint(_2005) > 1u;
    int _2033 = _2025 * _2021;
    int _2035 = _2033 + _1839;
    int _2037 = _1997 & 3;
    bool _2039 = _2037 != 0;
    float _2041 = as_type<float>(_1441) * _2029;
    float _2043 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1999);
    int _2045 = ~_1322;
    int _2047 = _2045 + 1;
    float _2049 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2003);
    int _2051 = _2039 ? 0 : 1;
    float _2053 = trunc(_2041);
    float _2055 = precise::max(_2053, 0.0);
    uint _2057 = uint(_2055);
    bool _2059 = uint(_2035) >= uint(_1362);
    float _2061 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2043);
    int _2063 = ~_2051;
    int _2065 = _2063 + 1;
    int _2067 = _2065 + 1;
    float _2069 = _2027 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2071 = !_2059;
    int _2073 = _2071 ? 0 : (-1);
    float _2075 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2049);
    bool _2077 = _2005 != 3;
    int _2079 = _2067;
    if (!_2031)
    {
        int _2081 = ~_2051;
        int _2083 = _2081 + 1;
        _2079 = _2083;
    }
    int _2085 = _2079;
    float _2087 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2089 = int(_1903) + int(_2013);
    float _2091 = _2061 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2093 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2095 = _2069 + _2093;
    bool _2097 = uint(_2005) >= 2u;
    float _2099 = _2087 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _2101 = ~_2021;
    int _2103 = _2101 + _2073;
    int _2105 = _2103 + 1;
    int _2107 = _2047 * _2089;
    int _2109 = _2107 + _1583;
    int _2111 = _2097 ? 0 : 1;
    float _2113 = _2095 * _2095;
    int _2115 = int(_1861) + int(_2057);
    int _2117 = _1362 * _2105;
    int _2119 = _2117 + _1839;
    int _2121 = ~_2111;
    int _2123 = _2121 + 1;
    int _2125 = _2123 + 1;
    float _2127 = _2075 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2129 = _2125;
    int _2131 = int(_2013);
    if (_2077)
    {
        int _2133 = ~_2111;
        int _2135 = _2133 + 1;
        _2129 = _2135;
    }
    int _2137 = _2129;
    float _2139 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2141 = _2091 + _2139;
    bool _2143 = !_1721;
    int _2145 = _2143 ? _2119 : (-1);
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2149 = _2127 + _2147;
    if (_1557)
    {
        _2131 = 0;
    }
    int _2151 = _2131;
    float _2153 = fma(_2141, _2141, _2113);
    bool _2155 = uint(_2109) >= uint(_1322);
    float _2157 = -_2127;
    float _2159 = _2157 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _2161 = _2151;
    if (!_1557)
    {
        _2161 = 1;
    }
    int _2163 = _2161;
    float _2165 = fma(_2149, _2149, _2153);
    int _2167 = _2145 & 3;
    bool _2169 = _2167 != 0;
    bool _2171 = !_2155;
    int _2173 = _2171 ? 0 : (-1);
    float _2175 = sqrt(_2165);
    int _2177 = _2145 & 3;
    bool _2179 = _2177 != 0;
    bool _2181 = uint(_2167) >= 2u;
    int _2183 = _2179 ? 0 : 1;
    bool _2185 = uint(_2167) > 1u;
    float _2187 = rsqrt(_2165);
    int _2189 = _2181 ? 0 : 1;
    bool _2191 = _2167 != 3;
    int _2193 = ~_1362;
    int _2195 = _2193 + 1;
    int _2197 = ~_2183;
    int _2199 = _2197 + 1;
    int _2201 = _2199 + 1;
    float _2203 = _2175 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2205 = ~_2189;
    int _2207 = _2205 + 1;
    int _2209 = _2207 + 1;
    int _2211 = _2195 * _2115;
    int _2213 = _2211 + _1809;
    bool _2215 = !_2007;
    int _2217 = _2215 ? 0 : 1;
    int _2219 = _2201;
    int _2221 = _2209;
    if (!_2185)
    {
        int _2223 = ~_2183;
        int _2225 = _2223 + 1;
        _2219 = _2225;
    }
    int _2227 = _2219;
    bool _2229 = uint(_2213) >= uint(_1362);
    if (_2191)
    {
        int _2231 = ~_2189;
        int _2233 = _2231 + 1;
        _2221 = _2233;
    }
    int _2235 = _2221;
    float _2237 = in.m_69.x;
    float _2239 = in.m_69.y;
    float _2241 = in.m_69.z;
    int _2243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2245 = _2243 != 0;
    bool _2247 = !_2229;
    int _2249 = _2247 ? 0 : (-1);
    bool _2251 = _1308 > 0.5;
    bool _2253 = _2251 && _2245;
    float _2255 = precise::min(_2099, _2203);
    bool _2257 = _1835 != 2;
    int _2259 = ~_2089;
    int _2261 = _2259 + _2173;
    int _2263 = _2261 + 1;
    float _2265 = _2187 * _2255;
    int _2267 = abs(_2085);
    out.m_71.w = _2255;
    float _2269 = 0.0;
    if (!_2245)
    {
        _2269 = _352;
    }
    float _2271 = _2269;
    float _2273 = _2095 * _2265;
    float _2275 = _2149 * _2265;
    float _2277 = _2271;
    if (_2253)
    {
        float _2279 = -_352;
        float _2281 = _2279 + 1.0;
        _430 = _2281;
    }
    float _2283 = _430;
    bool _2285 = _2163 != 1;
    float _2287 = _2141 * _2265;
    float _2289 = -_2273;
    float _2291 = _2095 + _2289;
    float _2293 = -_2275;
    float _2295 = _2149 + _2293;
    if (_2245)
    {
        _2277 = _2283;
    }
    float _2297 = _2277;
    float _2299 = -_2287;
    float _2301 = _2141 + _2299;
    float _2303 = _2291 * _2291;
    float _2305 = in.m_73.x;
    float _2307 = in.m_73.y;
    float _2309 = in.m_73.z;
    bool _2311 = _2239 != 0.0;
    bool _2313 = isnan(_2239);
    bool _2315 = _2311 || _2313;
    bool _2317 = isnan(0.0);
    bool _2319 = _2315 || _2317;
    float _2321 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2237);
    float _2323 = fma(_2301, _2301, _2303);
    float _2325 = in.m_75.x;
    float _2327 = in.m_75.y;
    float _2329 = in.m_75.z;
    float _2331 = in.m_75.w;
    bool _2333 = _2237 == 0.0;
    bool _2335 = !_2319;
    bool _2337 = _2333 && _2335;
    float _2339 = _610 * _790;
    float _2341 = fma(_2295, _2295, _2323);
    float _2343 = 0.0;
    if (!_2285)
    {
        _2343 = _1308;
    }
    float _2345 = _2343;
    int _2347 = _1322 * _2263;
    int _2349 = _2347 + _1583;
    bool _2351 = _2241 == 0.0;
    bool _2353 = _2351 && _2337;
    float _2355 = 0.0;
    float _2357 = _2345;
    if (_2257)
    {
        _2355 = _174;
    }
    float _2359 = _2355;
    float _2361 = sqrt(_2341);
    float _2363 = 0.0;
    float _2365 = _2359;
    if (!_2285)
    {
        _2363 = _2345;
    }
    float _2367 = _2363;
    float _2369 = _2367;
    if (!_2257)
    {
        _2365 = _1316;
    }
    float _2371 = _2365;
    float _2373 = 0.0;
    if (!_2285)
    {
        _2373 = _1316;
    }
    float _2375 = _2373;
    float _2377 = 0.0;
    float _2379 = _2375;
    if (_2257)
    {
        _2377 = _1308;
    }
    float _2381 = _2377;
    float _2383 = _2381;
    if (_2285)
    {
        _2369 = _174;
    }
    float _2385 = _2369;
    if (_2285)
    {
        _2357 = _174;
    }
    float _2387 = _2357;
    if (_2285)
    {
        _1425 = _1308;
    }
    float _2389 = _1425;
    float _2391 = _2385 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2393 = _2309 * _2327;
    float _2395 = _2305 * _2329;
    float _2397 = _2307 * _2325;
    float _2399 = _2393;
    float _2401 = _2331;
    if (_2285)
    {
        _2379 = _1308;
    }
    float _2403 = _2379;
    float _2405 = _2187 * _2361;
    if (!_2257)
    {
        _2383 = _174;
    }
    float _2407 = _2383;
    float _2409 = -_2395;
    float _2411 = fma(_2309, _2325, _2409);
    int _2413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2415 = _2413 != 0;
    float _2417 = -_2397;
    float _2419 = fma(_2327, _2305, _2417);
    int _2421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2423 = _2421 != 0;
    float _2425 = -_2393;
    float _2427 = fma(_2329, _2307, _2425);
    if (_2353)
    {
        _2399 = _2307;
    }
    float _2429 = _2399;
    float _2431 = _1318 * _2405;
    float _2433 = _2429;
    if (!_2353)
    {
        float _2435 = fma(_2239, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2307);
        _2433 = _2435;
    }
    float _2437 = _2433;
    float _2439 = _2427 * _2331;
    float _2441 = _2411 * _2331;
    float _2443 = _2419 * _2331;
    float _2445 = _2339 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_2353)
    {
        _2401 = _2309;
    }
    float _2447 = _2401;
    float _2449 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2239);
    float _2451 = _2447;
    if (!_2353)
    {
        float _2453 = fma(_2241, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2309);
        _2451 = _2453;
    }
    float _2455 = _2451;
    float _2457 = _2431 * _2241;
    float _2459 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2461 = _2445 * _2405;
    float _2463 = 0.0;
    float _2465 = _2455;
    if (_2353)
    {
        _2463 = _2305;
    }
    float _2467 = _2463;
    float _2469 = _2467;
    if (!_2353)
    {
        float _2471 = fma(_2237, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2305);
        _2469 = _2471;
    }
    float _2473 = _2469;
    float _2475 = -_1326;
    float _2477 = fma(_2459, 2.0, _2475);
    float _2479 = _2461 * _2449;
    float _2481 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2483 = _2481 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2485 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2487 = 1.0 / _2483;
    float _2489 = -_2091;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2493 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2495 = fma(_2485, -2.0, _1336);
    float _2497 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2493);
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2501 = _2499 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2503 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2505 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2507 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2509 = _2507 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2511 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2503);
    float _2513 = -_2069;
    float _2515 = _2513 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2517 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2505);
    float _2519 = 1.0 / _2509;
    float _2521 = _2515 * _2515;
    float _2523 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2525 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2527 = fma(_2491, _2491, _2521);
    float _2529 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2531 = -_2523;
    float _2533 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2531);
    float _2535 = 1.0 / _2501;
    float _2537 = fma(_2159, _2159, _2527);
    float _2539 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2541 = _2539 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2543 = -_2525;
    float _2545 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2543);
    float _2547 = -_2529;
    float _2549 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2547);
    float _2551 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2517);
    float _2553 = rsqrt(_2537);
    float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2557 = _2555 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2559 = _2407 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2561 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2563 = _2561 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2565 = _2389 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2567 = _2087 * _2405;
    float _2569 = 1.0 / _2557;
    float _2571 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2573 = _2571 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2575 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2577 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2575;
    int _2579 = ~_2267;
    int _2581 = _2579 + 1;
    int _2583 = _2581 + 1;
    float _2585 = _2567 * _2321;
    int _2587 = abs(_2217);
    float _2589 = _2577 * _2535;
    bool _2591 = !_2169;
    int _2593 = _2591 ? 0 : 1;
    float _2595 = 1.0 / _2541;
    float _2597 = _2491 * _2553;
    float _2599 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2601 = _2515 * _2553;
    int _2603 = abs(_2593);
    float _2605 = -_2599;
    float _2607 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2605);
    bool _2609 = _2005 != 3;
    float _2611 = 1.0 / _2563;
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2613;
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2619 = _2617 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2621 = ~_2115;
    int _2623 = _2621 + _2249;
    int _2625 = _2623 + 1;
    float _2627 = _2615 * _2487;
    float _2629 = _2619 * _2519;
    float _2631 = _2597 * _2597;
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2635 = _2633 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2637 = _2159 * _2553;
    float _2639 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2639;
    float _2643 = 1.0 / _2573;
    float _2645 = fma(_2637, _2637, _2631);
    float _2647 = _2641 * _2569;
    float _2649 = _2635 * _2595;
    float _2651 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2653 = _2651 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2655 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2657 = _1302 + _2655;
    float _2659 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2661 = _1302 + _2659;
    bool _2663 = !_2609;
    int _2665 = _2663 ? 0 : (-1);
    float _2667 = rsqrt(_2645);
    float _2669 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2671 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2669;
    float _2673 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2675 = _1302 + _2673;
    float _2677 = _2653 * _2611;
    float _2679 = fma(_2629, _2657, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2681 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2683 = _1302 + _2681;
    float _2685 = fma(_2627, _2675, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2689 = _1302 + _2687;
    float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2693 = _1302 + _2691;
    float _2695 = _2671 * _2643;
    float _2697 = _2545 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2699 = fma(_2589, _2689, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2701 = fma(_2647, _2683, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2703 = fma(_2677, _2661, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2705 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2707 = fma(_2649, _2693, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2709 = _2637 * _2667;
    float _2711 = _2597 * _2667;
    float _2713 = _2545 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2715 = -_2705;
    float _2717 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2715);
    float _2719 = -_2709;
    float _2721 = _2637 * _2719;
    float _2723 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2725 = -_2713;
    float _2727 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2725);
    float _2729 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2717);
    float _2731 = -_2721;
    float _2733 = fma(_2597, _2711, _2731);
    float _2735 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2737 = _2601 * _2711;
    float _2739 = -_2697;
    float _2741 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2739);
    float _2743 = _2733 * _2733;
    float _2745 = -_2723;
    float _2747 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2745);
    float _2749 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2727);
    float _2751 = _2729 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2753 = -_2735;
    float _2755 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2753);
    float _2757 = _1374 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2759 = fma(_2737, _2737, _2743);
    float _2761 = -_2709;
    float _2763 = _2601 * _2761;
    float _2765 = -_2751;
    float _2767 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2765);
    float _2769 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2755);
    float _2771 = -_2757;
    float _2773 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2771);
    float _2775 = fma(_2763, _2763, _2759);
    float _2777 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2779 = fma(_2769, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2767);
    float _2781 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2773);
    bool _2783 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2785 = isnan(_1302);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2791 = _2787 || _2789;
    float _2793 = float(_2791);
    float _2795 = -_2777;
    float _2797 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2795);
    float _2799 = rsqrt(_2775);
    float _2801 = -_2781;
    float _2803 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2779);
    bool _2805 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2807 = isnan(_1302);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2813 = _2809 || _2811;
    float _2815 = float(_2813);
    float _2817 = -_2793;
    float _2819 = _2817 + 1.0;
    bool _2821 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2823 = isnan(_1302);
    bool _2825 = _2821 || _2823;
    bool _2827 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2829 = _2825 || _2827;
    float _2831 = float(_2829);
    float _2833 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2747);
    float _2835 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2741);
    float _2837 = _2815 * _2819;
    float _2839 = 1.0 / _2803;
    float _2841 = -_2815;
    float _2843 = _2841 + 1.0;
    bool _2845 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2847 = isnan(_1302);
    bool _2849 = _2845 || _2847;
    bool _2851 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2853 = _2849 || _2851;
    float _2855 = float(_2853);
    float _2857 = -_2831;
    float _2859 = _2857 + 1.0;
    float _2861 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2797);
    float _2863 = _2831 * _2843;
    bool _2865 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2867 = isnan(_1302);
    bool _2869 = _2865 || _2867;
    bool _2871 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2873 = _2869 || _2871;
    float _2875 = float(_2873);
    float _2877 = -_2855;
    float _2879 = _2877 + 1.0;
    float _2881 = _2733 * _2799;
    float _2883 = precise::clamp(_2881, 0.0, 1.0);
    bool _2885 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2887 = isnan(_1302);
    bool _2889 = _2885 || _2887;
    bool _2891 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2893 = _2889 || _2891;
    float _2895 = float(_2893);
    float _2897 = _2855 * _2859;
    float _2899 = _2875 * _2879;
    float _2901 = -_2875;
    float _2903 = _2901 + 1.0;
    float _2905 = -_2883;
    float _2907 = _2905 + 1.0;
    bool _2909 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2911 = isnan(_1302);
    bool _2913 = _2909 || _2911;
    bool _2915 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2917 = _2913 || _2915;
    float _2919 = float(_2917);
    float _2921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2923 = fma(_2833, _2839, -1.0);
    float _2925 = -_2895;
    float _2927 = _2925 + 1.0;
    float _2929 = _2895 * _2903;
    float _2931 = _2907 * _2839;
    float _2933 = fma(_2907, _2923, 1.0);
    bool _2935 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2937 = isnan(_1302);
    bool _2939 = _2935 || _2937;
    bool _2941 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2943 = _2939 || _2941;
    float _2945 = float(_2943);
    float _2947 = _2919 * _2927;
    float _2949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2951 = -_2919;
    float _2953 = _2951 + 1.0;
    float _2955 = _2835 * _2931;
    float _2957 = _2933 * _2933;
    float _2959 = _2861 * _2931;
    float _2961 = _2945 * _2953;
    float _2963 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2965 = _1302 + _2963;
    float _2967 = fma(_2955, _2955, _2957);
    float _2969 = -_2945;
    float _2971 = _2969 + 1.0;
    float _2973 = _2685 * _2961;
    float _2975 = fma(_2695, _2965, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2977 = fma(_2959, _2959, _2967);
    float _2979 = _2921 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2981 = fma(_2971, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2973);
    int _2983 = _1362 * _2625;
    int _2985 = _2983 + _1809;
    float _2987 = fma(_2979, _2017, -0.5);
    float _2989 = _2949 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2991 = rsqrt(_2977);
    float _2993 = fma(_2679, _2947, _2981);
    float _2995 = fma(_2989, _2297, -0.5);
    float _2997 = _2371 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2999 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3001 = fma(_2699, _2929, _2993);
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3005 = -_2999;
    float _3007 = fma(_2997, 2.0, _3005);
    float _3009 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3011 = fma(_2707, _2899, _3001);
    float _3013 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3003);
    float _3015 = -_144;
    float _3017 = fma(_3015, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3007);
    float _3019 = fma(_2403, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3009);
    float _3021 = _2959 * _2991;
    float _3023 = _2933 * _2991;
    float _3025 = fma(_2551, _2995, _3017);
    int _3027 = _1997 >> 31;
    float _3029 = fma(_2701, _2897, _3011);
    float _3031 = _2955 * _2991;
    float _3033 = -_3021;
    float _3035 = _2597 * _3033;
    float _3037 = _2637 * _3023;
    int _3039 = _3027 & 3;
    float _3041 = fma(_2703, _2863, _3029);
    float _3043 = -_3031;
    float _3045 = -_3035;
    float _3047 = fma(_2637, _3043, _3045);
    float _3049 = -_3021;
    float _3051 = -_3037;
    float _3053 = fma(_2601, _3049, _3051);
    int _3055 = _2145 >> 31;
    float _3057 = -_3031;
    float _3059 = _2601 * _3057;
    int _3061 = _1997 + _3039;
    float _3063 = _3047 * _3047;
    int _3065 = _3055 & 3;
    float _3067 = -_3059;
    float _3069 = fma(_2597, _3023, _3067);
    int _3071 = _3061 >> 2;
    float _3073 = fma(_3053, _3053, _3063);
    int _3075 = _2145 + _3065;
    float _3077 = fma(_2975, _2837, _3041);
    int _3079 = _3071 << 4;
    int _3081 = _3079 + 368;
    float _3083 = fma(_3069, _3069, _3073);
    float _3085 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2511);
    uint _3087 = uint(int(uint(_3081) >> uint(2)));
    uint _3089 = uint(int(uint(int(_3087)) >> uint(2)));
    int _3091 = int(_3087) & 3;
    float _3093 = (*spvDescriptorSet0.vp_c9)._m0[int(_3089)][_3091];
    int _3095 = int(_3087) + 1;
    uint _3097 = uint(int(uint(_3095) >> uint(2)));
    int _3099 = _3095 & 3;
    float _3101 = (*spvDescriptorSet0.vp_c9)._m0[int(_3097)][_3099];
    int _3103 = _3075 >> 2;
    float _3105 = rsqrt(_3083);
    float _3107 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3109 = fma(_2793, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3077);
    int _3111 = _3103 << 4;
    int _3113 = _3111 + 512;
    float _3115 = -_3107;
    float _3117 = fma(_2391, 2.0, _3115);
    int _3119 = _3081 + 8;
    uint _3121 = uint(int(uint(_3119) >> uint(2)));
    uint _3123 = uint(int(uint(int(_3121)) >> uint(2)));
    int _3125 = int(_3121) & 3;
    float _3127 = (*spvDescriptorSet0.vp_c9)._m0[int(_3123)][_3125];
    int _3129 = int(_3121) + 1;
    uint _3131 = uint(int(uint(_3129) >> uint(2)));
    int _3133 = _3129 & 3;
    float _3135 = (*spvDescriptorSet0.vp_c9)._m0[int(_3131)][_3133];
    float _3137 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3139 = abs(_2235);
    float _3141 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _3143 = _2167 != 3;
    float _3145 = fma(_2565, -2.0, _3137);
    out.m_77.x = _3109;
    float _3147 = fma(_2559, -2.0, _3141);
    uint _3149 = uint(int(uint(_3113) >> uint(2)));
    uint _3151 = uint(int(uint(int(_3149)) >> uint(2)));
    int _3153 = int(_3149) & 3;
    float _3155 = (*spvDescriptorSet0.vp_c9)._m0[int(_3151)][_3153];
    int _3157 = int(_3149) + 1;
    uint _3159 = uint(int(uint(_3157) >> uint(2)));
    int _3161 = _3157 & 3;
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[int(_3159)][_3161];
    float _3165 = _3053 * _3105;
    float _3167 = _3069 * _3105;
    float _3169 = _3047 * _3105;
    float _3171 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3147);
    float _3173 = _2637 * _3165;
    float _3175 = _2601 * _3167;
    int _3177 = _3113 + 8;
    uint _3179 = uint(int(uint(_3177) >> uint(2)));
    uint _3181 = uint(int(uint(int(_3179)) >> uint(2)));
    int _3183 = int(_3179) & 3;
    float _3185 = (*spvDescriptorSet0.vp_c9)._m0[int(_3181)][_3183];
    int _3187 = int(_3179) + 1;
    uint _3189 = uint(int(uint(_3187) >> uint(2)));
    int _3191 = _3187 & 3;
    float _3193 = (*spvDescriptorSet0.vp_c9)._m0[int(_3189)][_3191];
    float _3195 = _2597 * _3169;
    float _3197 = -_3173;
    float _3199 = fma(_2597, _3167, _3197);
    float _3201 = -_3175;
    float _3203 = fma(_2637, _3169, _3201);
    int _3205 = abs(_2227);
    float _3207 = -_3195;
    float _3209 = fma(_2601, _3165, _3207);
    float _3211 = _3199 * _3199;
    float _3213 = -_3171;
    float _3215 = fma(_3085, _2987, _3213);
    int _3217 = ~_3205;
    int _3219 = _3217 + 1;
    int _3221 = _3219 + 1;
    float _3223 = fma(_3203, _3203, _3211);
    float _3225 = fma(_3209, _3209, _3223);
    float _3227 = rsqrt(_3225);
    int _3229 = _2583 * as_type<int>(_3101);
    float _3231 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3233 = int(_3231);
    int _3235 = ~_2587;
    int _3237 = _3235 + 1;
    int _3239 = _3237 + 1;
    int _3241 = _3239 * as_type<int>(_3093);
    int _3243 = _3241 + _3229;
    int _3245 = abs(_2137);
    float _3247 = _3209 * _3227;
    float _3249 = _3203 * _3227;
    int _3251 = ~_3245;
    int _3253 = _3251 + 1;
    int _3255 = _3253 + 1;
    int _3257 = _3221 * as_type<int>(_3163);
    int _3259 = ~_2603;
    int _3261 = _3259 + 1;
    int _3263 = _3261 + 1;
    float _3265 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3267 = int(_3265);
    int _3269 = abs(_2665);
    int _3271 = _3255 * as_type<int>(_3127);
    int _3273 = _3271 + _3243;
    bool _3275 = !_2423;
    int _3277 = _3275 ? 0 : 1;
    int _3279 = _3263 * as_type<int>(_3155);
    int _3281 = _3279 + _3257;
    int _3283 = ~_3269;
    int _3285 = _3283 + 1;
    int _3287 = _3285 + 1;
    float _3289 = _3199 * _3227;
    bool _3291 = !_2415;
    int _3293 = _3291 ? 0 : 1;
    float _3295 = _3247 * _2327;
    int _3297 = abs(_3277);
    float _3299 = _2597 * _3247;
    int _3301 = _3287 * as_type<int>(_3135);
    int _3303 = _3301 + _3273;
    float _3305 = float(uint(_3233));
    float _3307 = _2637 * _3289;
    int _3309 = abs(_3293);
    float _3311 = -_3299;
    float _3313 = fma(_2637, _3249, _3311);
    bool _3315 = !_3143;
    int _3317 = _3315 ? 0 : (-1);
    float _3319 = 1.0 / _3305;
    int _3321 = ~_3139;
    int _3323 = _3321 + 1;
    int _3325 = _3323 + 1;
    float _3327 = -_3307;
    float _3329 = fma(_2601, _3247, _3327);
    float _3331 = _3313 * _3313;
    int _3333 = ~_3233;
    int _3335 = _3333 + 1;
    float _3337 = _2441 * _3289;
    int _3339 = _3325 * as_type<int>(_3185);
    int _3341 = _3339 + _3281;
    float _3343 = float(uint(_3267));
    float _3345 = fma(_3329, _3329, _3331);
    int _3347 = abs(_3317);
    float _3349 = _2601 * _3249;
    float _3351 = 1.0 / _3343;
    int _3353 = ~_3267;
    int _3355 = _3353 + 1;
    float _3357 = _2441 * _3247;
    float _3359 = -_3349;
    float _3361 = fma(_2597, _3289, _3359);
    int _3363 = ~_3309;
    int _3365 = _3363 + 1;
    int _3367 = _3365 + 1;
    int _3369 = ~_3347;
    int _3371 = _3369 + 1;
    int _3373 = _3371 + 1;
    float _3375 = fma(_3361, _3361, _3345);
    int _3377 = abs(_3233);
    int _3379 = _3303 * _3367;
    int _3381 = ~_3297;
    int _3383 = _3381 + 1;
    int _3385 = _3383 + 1;
    int _3387 = _3373 * as_type<int>(_3193);
    int _3389 = _3387 + _3341;
    bool _3391 = !_1711;
    int _3393 = _3391 ? _2349 : (-1);
    float _3395 = rsqrt(_3375);
    int _3397 = _3389 * _3385;
    bool _3399 = !_1721;
    int _3401 = _3399 ? _2985 : (-1);
    int _3403 = _3393 * _3309;
    int _3405 = _3403 + _3379;
    int _3407 = abs(_3267);
    float _3409 = _2479 * _3247;
    int _3411 = as_type<int>(_3319) + (-2);
    int _3413 = _3401 * _3297;
    int _3415 = _3413 + _3397;
    float _3417 = float(uint(_3407));
    float _3419 = _2479 * _3249;
    float _3421 = float(uint(_3377));
    float _3423 = _3247 * _2437;
    float _3425 = 1.0 / _3417;
    int _3427 = as_type<int>(_3351) + (-2);
    float _3429 = _3361 * _3395;
    float _3431 = float(uint(_3405));
    float _3433 = _3329 * _3395;
    int _3435 = abs(_3405);
    float _3437 = fma(_2585, _3429, _3409);
    float _3439 = 1.0 / _3421;
    float _3441 = as_type<float>(_3411) * _3431;
    float _3443 = float(uint(_3415));
    float _3445 = fma(_2637, _2457, _3437);
    float _3447 = fma(_2585, _3433, _3419);
    int _3449 = ~_3407;
    int _3451 = _3449 + 1;
    float _3453 = as_type<float>(_3427) * _3443;
    float _3455 = trunc(_3441);
    float _3457 = precise::max(_3455, 0.0);
    uint _3459 = uint(_3457);
    int _3461 = as_type<int>(_3425) + (-2);
    float _3463 = fma(_2597, _2457, _3447);
    float _3465 = _2127 + _3445;
    float _3467 = fma(_3429, _2325, _3295);
    float _3469 = _2091 + _3463;
    float _3471 = float(uint(_3435));
    float _3473 = trunc(_3453);
    float _3475 = precise::max(_3473, 0.0);
    uint _3477 = uint(_3475);
    int _3479 = as_type<int>(_3439) + (-2);
    float _3481 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3483 = _3465 + _3481;
    int _3485 = abs(_3415);
    float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3489 = _3469 + _3487;
    float _3491 = as_type<float>(_3479) * _3471;
    float _3493 = _3483 * _3483;
    int _3495 = _3335 * int(_3459);
    int _3497 = _3495 + _3405;
    float _3499 = _3215 + 0.5;
    float _3501 = fma(_3489, _3489, _3493);
    float _3503 = trunc(_3491);
    float _3505 = precise::max(_3503, 0.0);
    uint _3507 = uint(_3505);
    float _3509 = float(uint(_3497));
    float _3511 = _3025 + 0.5;
    int _3513 = ~_3377;
    int _3515 = _3513 + 1;
    int _3517 = _3355 * int(_3477);
    int _3519 = _3517 + _3415;
    float _3521 = float(uint(_3485));
    float _3523 = as_type<float>(_3411) * _3509;
    out.m_79.x = _3511;
    out.m_79.y = _3499;
    float _3525 = sqrt(_3501);
    float _3527 = float(uint(_3519));
    float _3529 = as_type<float>(_3461) * _3521;
    float _3531 = _3289 * _2327;
    float _3533 = as_type<float>(_3427) * _3527;
    float _3535 = _3249 * _2327;
    float _3537 = trunc(_3529);
    float _3539 = precise::max(_3537, 0.0);
    uint _3541 = uint(_3539);
    int _3543 = _3515 * int(_3507);
    int _3545 = _3543 + _3435;
    float _3547 = _2441 * _3249;
    float _3549 = _3289 * _2437;
    float _3551 = _2479 * _3289;
    float _3553 = fma(_3433, _2325, _3535);
    float _3555 = float(uint(_3545));
    float _3557 = _3313 * _3395;
    float _3559 = trunc(_3523);
    float _3561 = precise::max(_3559, 0.0);
    uint _3563 = uint(_3561);
    float _3565 = _3249 * _2437;
    bool _3567 = _3525 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3569 = as_type<float>(_3479) * _3555;
    float _3571 = fma(_2585, _3557, _3551);
    int _3573 = ~_3233;
    int _3575 = _3573 + 1;
    float _3577 = fma(_3557, _2325, _3531);
    float _3579 = fma(_2439, _3433, _3547);
    int _3581 = _3451 * int(_3541);
    int _3583 = _3581 + _3485;
    float _3585 = trunc(_3533);
    float _3587 = precise::max(_3585, 0.0);
    uint _3589 = uint(_3587);
    float _3591 = fma(_2601, _2457, _3571);
    int _3593 = ~_3267;
    int _3595 = _3593 + 1;
    float _3597 = fma(_2439, _3557, _3337);
    float _3599 = float(uint(_3583));
    float _3601 = fma(_2439, _3429, _3357);
    float _3603 = fma(_3557, _2473, _3549);
    int _3605 = int(_3459) + int(_3563);
    float _3607 = trunc(_3569);
    float _3609 = precise::max(_3607, 0.0);
    uint _3611 = uint(_3609);
    float _3613 = as_type<float>(_3461) * _3599;
    float _3615 = fma(_3429, _2473, _3423);
    float _3617 = fma(_2597, _2329, _3553);
    int _3619 = _3575 * _3605;
    int _3621 = _3619 + _3405;
    float _3623 = fma(_2601, _2329, _3577);
    float _3625 = fma(_3433, _2473, _3565);
    float _3627 = fma(_2637, _2329, _3467);
    float _3629 = trunc(_3613);
    float _3631 = precise::max(_3629, 0.0);
    uint _3633 = uint(_3631);
    int _3635 = int(_3477) + int(_3589);
    float _3637 = _2069 + _3591;
    bool _3639 = uint(_3621) >= uint(_3233);
    int _3641 = ~_3377;
    int _3643 = _3641 + 1;
    int _3645 = _3595 * _3635;
    int _3647 = _3645 + _3415;
    int _3649 = ~_3407;
    int _3651 = _3649 + 1;
    int _3653 = int(_3507) + int(_3611);
    float _3655 = as_type<float>(_3621);
    float _3657 = _3591;
    float _3659 = _3549;
    float _3661 = _3617;
    float _3663 = _3623;
    if (!_3567)
    {
        _3655 = _3469;
    }
    float _3665 = _3655;
    float _3667 = _3665;
    if (!_3567)
    {
        _3657 = _3465;
    }
    float _3669 = _3657;
    float _3671 = _3669;
    if (!_3567)
    {
        _3659 = _3637;
    }
    float _3673 = _3659;
    int _3675 = int(_3541) + int(_3633);
    bool _3677 = !_3567;
    float _3679 = _3673;
    if (!_3677)
    {
        float _3681 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3685 = _3525 + _3683;
        float _3687 = _3637 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3689 = rsqrt(_3501);
        float _3691 = _3685 * _3681;
        float _3693 = _3691 * 0.15915493667125701904296875;
        float _3695 = _3693 * 6.283185482025146484375;
        float _3697 = cos(_3695);
        float _3699 = _3693 * 6.283185482025146484375;
        float _3701 = sin(_3699);
        float _3703 = _3697 + (-1.0);
        float _3705 = fma(_3701, _3687, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3707 = _3703 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3709 = _3689 * _3705;
        float _3711 = fma(_3637, _3697, _3707);
        float _3713 = fma(_3489, _3709, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3715 = fma(_3483, _3709, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3667 = _3713;
        _3679 = _3711;
        _3671 = _3715;
    }
    float _3717 = _3667;
    float _3719 = _3679;
    float _3721 = _3671;
    bool _3723 = !_3639;
    int _3725 = _3723 ? 0 : (-1);
    float _3727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3729 = _3643 * _3653;
    int _3731 = _3729 + _3435;
    bool _3733 = uint(_3647) >= uint(_3267);
    int _3735 = _3651 * _3675;
    int _3737 = _3735 + _3485;
    int _3739 = ~_3605;
    int _3741 = _3739 + _3725;
    int _3743 = _3741 + 1;
    float _3745 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2495);
    bool _3747 = uint(_3731) >= uint(_3377);
    float _3749 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3145);
    bool _3751 = !_3733;
    int _3753 = _3751 ? 0 : (-1);
    int _3755 = _3233 * _3743;
    int _3757 = _3755 + _3405;
    bool _3759 = _3233 == 0;
    float _3761 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2497);
    bool _3763 = _3233 == 0;
    float _3765 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3019);
    int _3767 = _3405 ^ _3233;
    out.m_81.x = _2567;
    int _3769 = ~_3635;
    int _3771 = _3769 + _3753;
    int _3773 = _3771 + 1;
    float _3775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3777 = !_3759;
    int _3779 = _3777 ? _3757 : (-1);
    bool _3781 = uint(_3737) >= uint(_3407);
    int _3783 = _3267 * _3773;
    int _3785 = _3783 + _3415;
    int _3787 = _3415 ^ _3267;
    float _3789 = _3727 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3791 = _3267 == 0;
    float _3793 = fma(_2637, _2455, _3615);
    bool _3795 = _3267 == 0;
    float _3797 = -_144;
    float _3799 = fma(_3797, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2477);
    float _3801 = float(_3779);
    float _3803 = fma(_3789, _1873, -0.5);
    bool _3805 = !_3781;
    int _3807 = _3805 ? 0 : (-1);
    float _3809 = -_2287;
    float _3811 = _2091 + _3809;
    bool _3813 = !_3747;
    int _3815 = _3813 ? 0 : (-1);
    float _3817 = fma(_3789, _3801, _3799);
    uint _3819 = uint(int(uint(_3767) >> uint(31)));
    float _3821 = _3775 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3823 = ~_3807;
    int _3825 = _3675 + _3823;
    int _3827 = _3825 + 1;
    float _3829 = -_144;
    float _3831 = fma(_3829, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3117);
    bool _3833 = !_3791;
    int _3835 = _3833 ? _3785 : (-1);
    float _3837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _3839 = uint(int(uint(_3787) >> uint(31)));
    float _3841 = fma(_3821, _1951, -0.5);
    int _3843 = ~_3815;
    int _3845 = _3653 + _3843;
    int _3847 = _3845 + 1;
    float _3849 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1338);
    int _3851 = ~int(_3819);
    int _3853 = _3851 + 1;
    float _3855 = fma(_2597, _2455, _3625);
    float _3857 = float(_3835);
    float _3859 = fma(_3849, _3803, _3817);
    int _3861 = ~int(_3839);
    int _3863 = _3861 + 1;
    out.m_83.x = _3617;
    out.m_83.y = _3623;
    out.m_83.z = _3627;
    int _3865 = _3847 ^ _3853;
    float _3867 = fma(_3821, _3857, _3831);
    int _3869 = _3827 ^ _3863;
    float _3871 = -_2275;
    float _3873 = _2127 + _3871;
    int _3875 = ~_3853;
    int _3877 = _3875 + _3865;
    int _3879 = _3877 + 1;
    float _3881 = _3837 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3883 = ~_3863;
    int _3885 = _3883 + _3869;
    int _3887 = _3885 + 1;
    float _3889 = _2443 * _2597;
    float _3891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3893 = !_3763;
    int _3895 = _3893 ? _3879 : (-1);
    float _3897 = fma(_1939, _3881, -0.5);
    float _3899 = _2443 * _2601;
    float _3901 = _2443 * _2637;
    float _3903 = float(_3895);
    float _3905 = _3889 + _3579;
    bool _3907 = !_3795;
    int _3909 = _3907 ? _3887 : (-1);
    float _3911 = _3899 + _3597;
    float _3913 = -_2091;
    float _3915 = _3913 + _3717;
    float _3917 = -_3745;
    float _3919 = fma(_3881, _3903, _3917);
    float _3921 = -_2069;
    float _3923 = _3921 + _3719;
    float _3925 = _3901 + _3601;
    float _3927 = float(_3909);
    float _3929 = -_2127;
    float _3931 = _3929 + _3721;
    float _3933 = _3923 * _3923;
    float _3935 = _3891 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3937 = fma(_3761, _3897, _3919);
    float _3939 = fma(_2601, _2455, _3603);
    float _3941 = fma(_3915, _3915, _3933);
    float _3943 = fma(_2001, _3935, -0.5);
    float _3945 = -_3749;
    float _3947 = fma(_3935, _3927, _3945);
    float _3949 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3013);
    float _3951 = fma(_3931, _3931, _3941);
    float _3953 = _3859 + 0.5;
    float _3955 = _3937 + 0.5;
    float _3957 = fma(_3949, _3841, _3867);
    float _3959 = fma(_3765, _3943, _3947);
    float _3961 = sqrt(_3951);
    out.m_85.x = _3905;
    out.m_85.y = _3911;
    out.m_85.z = _3925;
    float _3963 = _3957 + 0.5;
    float _3965 = _3959 + 0.5;
    float _3967 = -_2287;
    float _3969 = _3967 + _3717;
    out.m_87.x = _3855;
    out.m_87.y = _3939;
    out.m_87.z = _3793;
    float _3971 = -_2273;
    float _3973 = _3971 + _3719;
    float _3975 = -_2273;
    float _3977 = _2069 + _3975;
    out.m_89.x = _3953;
    out.m_89.y = _3955;
    out.m_89.z = _3963;
    out.m_89.w = _3965;
    bool _3979 = _3961 > 0.0;
    float _3981 = -_2275;
    float _3983 = _3981 + _3721;
    float _3985 = _3911;
    float _3987 = _3905;
    float _3989 = _3923;
    if (!_3979)
    {
        _2465 = _3969;
    }
    float _3991 = _2465;
    float _3993 = _3991;
    float _3995 = _3991;
    if (!_3979)
    {
        _3661 = _3973;
    }
    float _3997 = _3661;
    float _3999 = _3997;
    float _4001 = _3997;
    if (!_3979)
    {
        _3663 = _3983;
    }
    float _4003 = _3663;
    bool _4005 = !_3979;
    float _4007 = _4003;
    float _4009 = _4003;
    if (!_4005)
    {
        bool _4011 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4013 = _3627;
        if (_4011)
        {
            float _4015 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4013 = _4015;
        }
        float _4017 = _4013;
        float _4019 = _4017;
        if (_4011)
        {
            float _4021 = _602 * _4017;
            _3985 = _4021;
        }
        float _4023 = _3985;
        float _4025 = _4023;
        if (_4011)
        {
            float _4027 = _604 * _4017;
            _3987 = _4027;
        }
        float _4029 = _3987;
        float _4031 = _4029;
        if (_4011)
        {
            float _4033 = _606 * _4017;
            _4019 = _4033;
        }
        float _4035 = _4019;
        float _4037 = _4035;
        if (!_4011)
        {
            bool _4039 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4041 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4043 = _4039 || _4041;
            bool _4045 = isnan(1.0);
            bool _4047 = _4043 || _4045;
            float _4049 = _144 + 1.0;
            if (!_4047)
            {
                float _4051 = _4049 * _4049;
                float _4053 = _4051 * 0.5;
                _166 = _4053;
            }
            float _4055 = _166;
            float _4057 = _4055;
            if (!_4047)
            {
                float _4059 = _4055 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4057 = _4059;
            }
            float _4061 = _4057;
            bool _4063 = !_4047;
            float _4065 = _4061;
            if (!_4063)
            {
                float _4067 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4069 = log2(_4067);
                float _4071 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4073 = _4071 + 1.0;
                float _4075 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4077 = _4069 * _4049;
                float _4079 = 1.0 / _4073;
                float _4081 = _4075 * 0.693147182464599609375;
                float _4083 = exp2(_4077);
                float _4085 = 1.0 / _4081;
                float _4087 = _4083 + (-1.0);
                float _4089 = -_4087;
                float _4091 = fma(_4089, _4085, _4049);
                float _4093 = _4091 * _4079;
                float _4095 = _4093 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4065 = _4095;
            }
            float _4097 = _4065;
            float _4099 = _4097 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _4101 = _4097 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4103 = _4097 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4105 = _4097;
            if (!_4047)
            {
                _4105 = _4049;
            }
            float _4107 = _4105;
            float _4109 = _4099 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _4111 = _4099 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _4113 = _4099 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _4115 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[8].y, _4109);
            float _4117 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[8].x, _4111);
            float _4119 = fma(_4103, (*spvDescriptorSet0.vp_c10)._m0[10].y, _4115);
            bool _4121 = !_4047;
            float _4123 = _4107;
            if (!_4121)
            {
                float _4125 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4127 = log2(_4125);
                float _4129 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4131 = _4129 + 1.0;
                float _4133 = 1.0 / _4131;
                float _4135 = _4127 * _4049;
                float _4137 = exp2(_4135);
                float _4139 = -_4137;
                float _4141 = _4139 + 1.0;
                float _4143 = _4141 * _4133;
                _4123 = _4143;
                _202 = _4133;
            }
            float _4145 = _4123;
            float _4147 = _202;
            float _4149 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[8].z, _4113);
            float _4151 = fma(_4145, _314, _4119);
            float _4153 = fma(_4103, (*spvDescriptorSet0.vp_c10)._m0[10].x, _4117);
            float _4155 = fma(_4103, (*spvDescriptorSet0.vp_c10)._m0[10].z, _4149);
            float _4157 = -_540;
            float _4159 = _4157 + _4151;
            float _4161 = fma(_4145, _312, _4153);
            float _4163 = fma(_4145, _316, _4155);
            float _4165 = _4159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4167 = _4159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4169 = -_544;
            float _4171 = _4169 + _4161;
            float _4173 = _4159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4175 = -_546;
            float _4177 = _4175 + _4163;
            float _4179 = fma(_4171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4165);
            float _4181 = fma(_4171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4167);
            float _4183 = fma(_4171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4173);
            float _4185 = fma(_4177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4179);
            float _4187 = fma(_4177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4181);
            float _4189 = fma(_4177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4183);
            _616 = _4187;
            _618 = _4185;
            _620 = _4189;
            _4025 = _4185;
            _4031 = _4187;
            _4037 = _4189;
            _3993 = _4155;
            _3999 = _4183;
            _4007 = _4153;
            _390 = _4181;
            _204 = _4147;
        }
        float _4191 = _616;
        float _4193 = _618;
        float _4195 = _620;
        float _4197 = _4025;
        float _4199 = _4031;
        float _4201 = _4037;
        float _4203 = _3993;
        float _4205 = _3999;
        float _4207 = _4007;
        float _4209 = _390;
        float _4211 = _204;
        float _4213 = _4191 * _4191;
        float _4215 = rsqrt(_3951);
        float _4217 = fma(_4193, _4193, _4213);
        float _4219 = fma(_4195, _4195, _4217);
        float _4221 = sqrt(_4219);
        float _4223 = _3915 * _4215;
        float _4225 = _3923 * _4215;
        float _4227 = _3931 * _4215;
        bool _4229 = _4221 > 0.0;
        float _4231 = _4203;
        float _4233 = _4205;
        float _4235 = _4207;
        _392 = _4209;
        _3989 = _4225;
        _622 = _4191;
        _206 = _4211;
        if (!_4229)
        {
            _4231 = _3969;
        }
        float _4237 = _4231;
        _3995 = _4237;
        if (!_4229)
        {
            _4233 = _3973;
        }
        float _4239 = _4233;
        _4001 = _4239;
        if (!_4229)
        {
            _4235 = _3983;
        }
        float _4241 = _4235;
        bool _4243 = !_4229;
        _4009 = _4241;
        if (!_4243)
        {
            float _4245 = rsqrt(_4219);
            float _4247 = _4245 * _4191;
            float _4249 = _4245 * _4193;
            float _4251 = _4245 * _4195;
            float _4253 = _4225 * _4247;
            float _4255 = fma(_4223, _4249, _4253);
            float _4257 = fma(_4227, _4251, _4255);
            float _4259 = _4257 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4261 = fma(_4197, _4259, _3969);
            float _4263 = fma(_4199, _4259, _3973);
            float _4265 = fma(_4201, _4259, _3983);
            _3995 = _4261;
            _4001 = _4263;
            _4009 = _4265;
            _392 = _4253;
        }
    }
    float _4267 = _3995;
    float _4269 = _4001;
    float _4271 = _4009;
    float _4273 = _392;
    float _4275 = _3989;
    float _4277 = _622;
    float _4279 = _206;
    float _4281 = _3977 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4283 = fma(_3811, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4281);
    float _4285 = _3977 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4287 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4289 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4291 = _4287 || _4289;
    bool _4293 = isnan(0.5);
    bool _4295 = _4291 || _4293;
    float _4297 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4283);
    float _4299 = fma(_3811, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4285);
    float _4301 = _4297 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4303 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4299);
    bool _4305 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4307 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4309 = _4305 || _4307;
    bool _4311 = isnan(0.5);
    bool _4313 = _4309 || _4311;
    float _4315 = 1.0 / _4301;
    float _4317 = _4303 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4319 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4321 = _4317;
    float _4323 = _4273;
    float _4325 = _4297;
    float _4327 = _4275;
    float _4329 = _4277;
    float _4331 = _4279;
    if (_4295)
    {
        _4319 = _4267;
    }
    float _4333 = _4319;
    float _4335 = _4317 + _4301;
    float _4337 = _4333;
    if (_4295)
    {
        _4321 = _4269;
    }
    float _4339 = _4321;
    float _4341 = _4339;
    if (_4295)
    {
        _4323 = _4271;
    }
    float _4343 = _4323;
    float _4345 = _4343;
    if (!_4295)
    {
        float _4347 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4349 = _3977 + _4347;
        float _4351 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4353 = _3811 + _4351;
        float _4355 = -_3811;
        float _4357 = _4355 + _4267;
        float _4359 = -_3977;
        float _4361 = _4359 + _4269;
        float _4363 = _4349 * _4349;
        float _4365 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4367 = _3873 + _4365;
        float _4369 = -_3873;
        float _4371 = _4369 + _4271;
        float _4373 = fma(_4353, _4353, _4363);
        float _4375 = fma(_4367, _4367, _4373);
        float _4377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4379 = sqrt(_4375);
        float _4381 = precise::min(_4379, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4383 = _4381 * _4377;
        float _4385 = fma(_4357, _4383, _3811);
        float _4387 = fma(_4361, _4383, _3977);
        float _4389 = fma(_4371, _4383, _3873);
        _4341 = _4387;
        _4337 = _4385;
        _4345 = _4389;
        _4325 = _4379;
    }
    float _4391 = _4341;
    float _4393 = _4337;
    float _4395 = _4345;
    float _4397 = _4325;
    float _4399 = _4397;
    if (_4313)
    {
        _4399 = 1.0;
    }
    float _4401 = _4399;
    float _4403 = _4335 * _4315;
    float _4405 = _4403 * 0.5;
    float _4407 = _4401;
    float _4409 = _4405;
    if (!_4313)
    {
        float _4411 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4413 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4415 = fma(_4405, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4413);
        float _4417 = _4411 * 0.15915493667125701904296875;
        float _4419 = _4417 * 6.283185482025146484375;
        float _4421 = cos(_4419);
        float _4423 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4425 = _4423 * 0.15915493667125701904296875;
        float _4427 = _4417 * 6.283185482025146484375;
        float _4429 = sin(_4427);
        float _4431 = 1.0 / _4421;
        float _4433 = _4425 * 6.283185482025146484375;
        float _4435 = cos(_4433);
        float _4437 = _4429 * _4431;
        float _4439 = 1.0 / _4415;
        float _4441 = _4435 * _4437;
        float _4443 = _4425 * 6.283185482025146484375;
        float _4445 = sin(_4443);
        float _4447 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4449 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4447;
        float _4451 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4453 = _4439 * _4451;
        float _4455 = 1.0 / _4441;
        float _4457 = 1.0 / _4449;
        float _4459 = _4445 * _4455;
        float _4461 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4463 = fma(_4459, _4453, _4461);
        float _4465 = _4463 * _4457;
        float _4467 = precise::clamp(_4465, 0.0, 1.0);
        _4407 = _4467;
    }
    float _4469 = _4407;
    float _4471 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4473 = _4391 + _4471;
    float _4475 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4477 = _4393 + _4475;
    float _4479 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4481 = _4395 + _4479;
    float _4483 = _4473 * _4473;
    float _4485 = fma(_4477, _4477, _4483);
    float _4487 = fma(_4481, _4481, _4485);
    float _4489 = rsqrt(_4487);
    float _4491 = sqrt(_4487);
    float _4493 = _4489 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4495 = _4477 * _4493;
    float _4497 = _4481 * _4493;
    float _4499 = _4495 * _4495;
    float _4501 = _4497 * _4497;
    float _4503 = _4499 + _4501;
    float _4505 = sqrt(_4503);
    bool _4507 = _4505 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4509 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4511 = _4505 + _4509;
    float _4513 = _4489;
    float _4515 = _4503;
    float _4517 = _4511;
    float _4519 = _4473;
    if (_4507)
    {
        float _4521 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4513 = _4521;
    }
    float _4523 = _4513;
    if (_4507)
    {
        float _4525 = rsqrt(_4503);
        _4515 = _4525;
    }
    float _4527 = _4515;
    if (_4507)
    {
        float _4529 = _4511 * _4523;
        _4517 = _4529;
    }
    float _4531 = _4517;
    if (_4507)
    {
        float _4533 = _4531 * 0.15915493667125701904296875;
        _4327 = _4533;
    }
    float _4535 = _4327;
    float _4537 = _4481;
    if (_4507)
    {
        float _4539 = _4535 * 6.283185482025146484375;
        float _4541 = sin(_4539);
        _4537 = _4541;
    }
    float _4543 = _4537;
    float _4545 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4547 = precise::max(0.0, _4545);
    float _4549 = _4523;
    float _4551 = _4547;
    if (_4507)
    {
        float _4553 = _4535 * 6.283185482025146484375;
        float _4555 = cos(_4553);
        _4549 = _4555;
    }
    float _4557 = _4549;
    float _4559 = -_4493;
    float _4561 = -_4547;
    float _4563 = fma(_4473, _4559, _4561);
    if (_4507)
    {
        float _4565 = _4563 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4519 = _4565;
    }
    float _4567 = _4519;
    float _4569 = _4543;
    float _4571 = _4567;
    if (_4507)
    {
        float _4573 = fma(_4543, _4567, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4409 = _4573;
    }
    float _4575 = _4409;
    float _4577 = _4575;
    if (!_4507)
    {
        _4569 = _4495;
    }
    float _4579 = _4569;
    float _4581 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4583 = fma(_4491, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4581);
    float _4585 = precise::clamp(_4583, 0.0, 1.0);
    float _4587 = _4579;
    if (!_4507)
    {
        _4571 = _4563;
    }
    float _4589 = _4571;
    float _4591 = _4589;
    float _4593 = _4557;
    if (_4507)
    {
        float _4595 = _4557 + (-1.0);
        _4551 = _4595;
    }
    float _4597 = _4551;
    float _4599 = _4597;
    if (_4507)
    {
        float _4601 = _4527 * _4575;
        _4329 = _4601;
    }
    float _4603 = _4329;
    if (!_4507)
    {
        _4577 = _4499;
    }
    float _4605 = _4577;
    float _4607 = _4391 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4609 = _4605;
    if (_4507)
    {
        float _4611 = _4597 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4331 = _4611;
    }
    float _4613 = _4331;
    if (_4507)
    {
        float _4615 = _4495 * _4603;
        _4587 = _4615;
    }
    float _4617 = _4587;
    if (!_4507)
    {
        _4599 = _4497;
    }
    float _4619 = _4599;
    float _4621 = _4619;
    if (_4507)
    {
        float _4623 = _4497 * _4603;
        _4621 = _4623;
    }
    float _4625 = _4621;
    if (_4507)
    {
        float _4627 = fma(_4563, _4557, _4613);
        _4591 = _4627;
    }
    float _4629 = _4591;
    if (_4507)
    {
        float _4631 = _4617 * _4617;
        _4609 = _4631;
    }
    float _4633 = _4609;
    if (!_4507)
    {
        _4593 = _4501;
    }
    float _4635 = _4593;
    float _4637 = _4635;
    if (_4507)
    {
        float _4639 = _4625 * _4625;
        _4637 = _4639;
    }
    float _4641 = _4637;
    float _4643 = -_4585;
    float _4645 = _4643 + 1.0;
    float _4647 = fma(_4629, _4629, _4633);
    float _4649 = _4391 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4651 = _4647 + _4641;
    float _4653 = fma(_4393, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4607);
    float _4655 = _4391 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4657 = abs(_4645);
    float _4659 = log2(_4657);
    float _4661 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4663 = fma(_4395, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4653);
    float _4665 = _4391 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4667 = fma(_4393, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4655);
    float _4669 = fma(_4393, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4649);
    float _4671 = _4663 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4673 = fma(_4393, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4665);
    float _4675 = rsqrt(_4651);
    float _4677 = fma(_4395, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4667);
    float _4679 = fma(_4395, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4669);
    float _4681 = fma(_4395, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4673);
    float _4683 = _4677 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4685 = _4679 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4687 = _4681 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4689 = _4659 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4691 = _4671 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4693 = -_4691;
    float _4695 = fma(_4693, _4661, 1.0);
    float _4697 = _4683 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4699 = exp2(_4689);
    float _4701 = _4675 * _4617;
    float _4703 = _4675 * _4629;
    float _4705 = fma(_4687, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4697);
    float _4707 = _4675 * _4625;
    float _4709 = _4701 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4711 = fma(_4671, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4705);
    float _4713 = log2(_4695);
    float _4715 = -_4709;
    float _4717 = fma(_4703, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4715);
    float _4719 = _4683 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4721 = fma(_4685, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4711);
    float _4723 = -_4707;
    float _4725 = fma(_4723, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4717);
    float _4727 = _4683 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4729 = fma(_4687, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4719);
    float _4731 = 1.0 / _4721;
    float _4733 = fma(_4725, -0.5, 0.5);
    float _4735 = fma(_4687, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4727);
    float _4737 = fma(_4725, 0.5, 0.5);
    float _4739 = _4703 + 1.0;
    float _4741 = fma(_4671, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4729);
    float _4743 = fma(_4671, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4735);
    float _4745 = fma(_4737, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4747 = sqrt(_4733);
    float _4749 = -_4703;
    float _4751 = fma(_4699, _4739, _4749);
    float _4753 = fma(_4685, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4743);
    float _4755 = fma(_4685, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4741);
    float _4757 = fma(_4737, _4745, -0.212114393711090087890625);
    float _4759 = _4713 * 0.693147182464599609375;
    float _4761 = fma(_4751, 0.5, 0.5);
    float _4763 = _4753 * _4731;
    float _4765 = _4755 * _4731;
    float _4767 = fma(_4737, _4757, 1.570728778839111328125);
    float _4769 = _4759 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4771 = fma(_4763, 0.5, 0.5);
    float _4773 = fma(_4765, -0.5, 0.5);
    float _4775 = _4747 * 0.636619746685028076171875;
    float3 _12288 = float3(_4771, _4773, _4769);
    float _4777 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12288, float3(0.0), isnan(_12288)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12288, float3(0.0), isnan(_12288)), level(0.0)).x;
    float3 _12299 = float3(_4771, _4773, _4769);
    float4 _4780 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12299, float3(0.0), isnan(_12299)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12299, float3(0.0), isnan(_12299)), level(0.0)).xyzw;
    float _4782 = _4780.x;
    float _4784 = _4780.y;
    float _4786 = _4780.z;
    float _4788 = _4780.w;
    float _4790 = -_4767;
    float _4792 = fma(_4775, _4790, 1.0);
    float2 _12321 = float2(_4792, _4761);
    float3 _4796 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12321, float2(0.0), isnan(_12321)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12321, float2(0.0), isnan(_12321)), level(0.0)).xyz;
    float _4798 = _4796.x;
    float _4800 = _4796.y;
    float _4802 = _4796.z;
    float _4804 = _4659 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4806 = _4683 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_91.x = _3811;
    out.m_91.y = _3977;
    out.m_91.z = _3873;
    bool _4808 = _4491 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4810 = isnan(_4491);
    bool _4812 = _4808 || _4810;
    bool _4814 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4816 = _4812 || _4814;
    float _4818 = fma(_4687, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4806);
    float _4820 = exp2(_4804);
    float _4822 = _4753 + _4721;
    out.m_93.x = _4393;
    out.m_93.y = _4391;
    out.m_93.z = _4395;
    float _4824 = fma(_4671, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4818);
    float _4826 = _4721 * 0.5;
    float _4828 = _4822 * 0.5;
    float _4830 = fma(_4685, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4824);
    float _4832 = fma(_4755, -0.5, _4826);
    float _4834 = _4830 + _4721;
    out.gl_Position.x = _4753;
    out.gl_Position.y = _4755;
    out.gl_Position.z = _4830;
    out.gl_Position.w = _4721;
    float _4836 = _4834 * 0.5;
    float _4838 = -_4820;
    float _4840 = _4838 + 1.0;
    float _4842 = _4840 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_95.x = _4828;
    out.m_95.y = _4832;
    out.m_95.z = _4836;
    out.m_95.w = _4721;
    float _4844 = -_4842;
    float _4846 = _4844 + 1.0;
    float _4848 = _4830;
    float _4850 = _4755;
    float _4852 = _4753;
    if (!_4816)
    {
        _4848 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4854 = _4848;
    float _4856 = _4854;
    float _4858 = _4854;
    if (!_4816)
    {
        _4850 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4860 = _4850;
    float _4862 = _4860;
    float _4864 = _4860;
    if (!_4816)
    {
        _4852 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4866 = _4852;
    float _4868 = _4842 * _4777;
    float _4870 = _4788 * _4846;
    float _4872 = _4469 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4874 = _4788 * _4868;
    float _4876 = _4802 * _4868;
    float _4878 = fma(_4798, _4874, _4782);
    float _4880 = fma(_4800, _4874, _4784);
    float _4882 = fma(_4788, _4876, _4786);
    out.m_97.x = _4878;
    out.m_97.y = _4880;
    out.m_97.z = _4882;
    out.m_97.w = _4870;
    bool _4884 = !_4816;
    float _4886 = _4866;
    float _4888 = _4866;
    if (!_4884)
    {
        bool _4890 = _4491 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4892 = isnan(_4491);
        bool _4894 = _4890 || _4892;
        bool _4896 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4898 = _4894 || _4896;
        if (!_4898)
        {
            float _4900 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4902 = _4491 + _4900;
            float _4904 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4906 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4904;
            float _4908 = 1.0 / _4906;
            float _4910 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4912 = _4910 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4914 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4916 = _4914 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4918 = _4902 * _4908;
            float _4920 = precise::clamp(_4918, 0.0, 1.0);
            float _4922 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4924 = _4922 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4926 = fma(_4920, _4916, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4928 = fma(_4920, _4924, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4930 = fma(_4920, _4912, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4864 = _4930;
            _4858 = _4928;
            _4888 = _4926;
            _4932 = true;
        }
        else
        {
            bool _4934 = _4491 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4936 = isnan(_4491);
            bool _4938 = _4934 || _4936;
            bool _4940 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4942 = _4938 || _4940;
            if (!_4942)
            {
                _4856 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4944 = _4856;
            _4858 = _4944;
            if (!_4942)
            {
                _4862 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4946 = _4862;
            _4864 = _4946;
            if (!_4942)
            {
                _4886 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4948 = _4886;
            bool _4950 = !_4942;
            _4888 = _4948;
            if (!_4950)
            {
                bool _4952 = _4491 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4954 = isnan(_4491);
                bool _4956 = _4952 || _4954;
                bool _4958 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4960 = _4956 || _4958;
                if (!_4960)
                {
                    float _4962 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4964 = _4491 + _4962;
                    float _4966 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4968 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4966;
                    float _4970 = 1.0 / _4968;
                    float _4972 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4974 = _4972 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4976 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4978 = _4976 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4980 = _4964 * _4970;
                    float _4982 = precise::clamp(_4980, 0.0, 1.0);
                    float _4984 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4986 = _4984 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4988 = fma(_4982, _4978, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4990 = fma(_4982, _4986, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4992 = fma(_4982, _4974, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4864 = _4992;
                    _4858 = _4990;
                    _4888 = _4988;
                    _4932 = true;
                }
                else
                {
                    _4864 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4858 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4888 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4932 = false;
    float _4994 = _4864;
    float _4996 = _4858;
    float _4998 = _4888;
    float _5000 = _4872 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_99.x = 0.0;
    float _5002 = _4994 * 0.586610972881317138671875;
    bool _5004 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _5000;
    float _5006 = fma(_4996, 0.298911988735198974609375, _5002);
    bool _5008 = _4469 > 0.0;
    bool _5010 = isnan(_4469);
    bool _5012 = _5008 || _5010;
    bool _5014 = isnan(0.0);
    bool _5016 = _5012 || _5014;
    float _5018 = fma(_4998, 0.114477999508380889892578125, _5006);
    float _5020 = -_5018;
    float _5022 = _5020 + _4996;
    float _5024 = -_5018;
    float _5026 = _5024 + _4994;
    float _5028 = -_5018;
    float _5030 = _5028 + _4998;
    float _5032 = fma(_5022, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5018);
    float _5034 = fma(_5026, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5018);
    float _5036 = fma(_5030, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5018);
    bool _5038 = !_5004;
    if (!_5038)
    {
        float _5040 = -_4391;
        float _5042 = _5040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5044 = -_4393;
        float _5046 = _5044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5048 = -_4395;
        float _5050 = _5048 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5052 = _5042 * _5042;
        float _5054 = fma(_5046, _5046, _5052);
        float _5056 = fma(_5050, _5050, _5054);
        float _5058 = sqrt(_5056);
        float _5060 = rsqrt(_5056);
        float _5062 = -_5058;
        float _5064 = _5062 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5066 = _5064 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5068 = precise::clamp(_5066, 0.0, 1.0);
        float _5070 = _5046 * _5060;
        float _5072 = _5042 * _5060;
        float _5074 = abs(_5068);
        float _5076 = log2(_5074);
        float _5078 = _5050 * _5060;
        float _5080 = _5070 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5082 = _3939 * _5072;
        float _5084 = -_5072;
        float _5086 = -_5080;
        float _5088 = fma(_5084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5086);
        float _5090 = fma(_3855, _5070, _5082);
        float _5092 = -_5078;
        float _5094 = fma(_5092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5088);
        float _5096 = fma(_3793, _5078, _5090);
        float _5098 = precise::clamp(_5096, 0.0, 1.0);
        float _5100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5102 = _5094 + _5100;
        float _5104 = _5076 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5106 = _5102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5108 = precise::clamp(_5106, 0.0, 1.0);
        float _5110 = exp2(_5104);
        float _5112 = _5110 * _5108;
        float _5114 = _5098 * _5112;
        float _5116 = _5114 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5118 = _5114 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5120 = _5114 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _5116;
        out.m_99.y = _5118;
        out.m_99.z = _5120;
    }
    out.m_71.x = _5032;
    out.m_71.y = _5034;
    out.m_71.z = _5036;
    if (_5016)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _5122 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5122;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4932 = false;
    bool _1300 = false;
    bool _1090 = false;
    bool _984 = false;
    bool _812 = false;
    bool _640 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_44.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (!_122)
    {
        out.m_47.x = 0.0;
    }
    int _128 = 0;
    if (!_122)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5178 = as_type<float>(_132);
        out.gl_Position.z = _5178;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_49.w;
    float _138 = float(_118);
    float _140 = 1.0 / _138;
    float _142 = -_136;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_136);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = _144 * _140;
    bool _158 = _144 >= _138;
    bool _160 = !_154;
    bool _162 = _158 || _160;
    out.m_51.x = _156;
    float _164 = _136;
    float _166 = _144;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _164;
    if (_162)
    {
        out.m_47.x = 0.0;
    }
    if (_162)
    {
        float _170 = _168 * 5.0;
        _134 = as_type<int>(_170);
    }
    int _172 = _134;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5250 = as_type<float>(_172);
        out.gl_Position.z = _5250;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _174 = in.m_53.x;
    float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _178 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _180 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _182 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _184 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _186 = _182 || _184;
    bool _188 = isnan(1.0);
    bool _190 = _186 || _188;
    float _192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _194 = _178 * _176;
    float _196 = _144 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _198 = 0.0;
    float _200 = _180;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_190)
    {
        float _208 = _180 * _180;
        float _210 = _208 * 0.5;
        _198 = _210;
    }
    float _212 = _198;
    float _214 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[20].x, _194);
    float _216 = _196 * _192;
    float _218 = _212;
    if (!_190)
    {
        float _220 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _220;
    }
    float _222 = _218;
    float _224 = floor(_214);
    float _226 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[20].y, _216);
    float _228 = _214 * 6.283185482025146484375;
    float _230 = _228 * 0.15915493667125701904296875;
    int _232 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _234 = _232 != 0;
    float _236 = floor(_226);
    float _238 = _230 * 6.283185482025146484375;
    float _240 = cos(_238);
    float _242 = -_224;
    float _244 = _214 + _242;
    bool _246 = !_190;
    float _248 = _222;
    if (!_246)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = _180 * _252;
        float _262 = 1.0 / _256;
        float _264 = _258 * 0.693147182464599609375;
        float _266 = exp2(_260);
        float _268 = 1.0 / _264;
        float _270 = _266 + (-1.0);
        float _272 = -_270;
        float _274 = fma(_272, _268, _180);
        float _276 = _274 * _262;
        float _278 = _276 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _248 = _278;
    }
    float _280 = _248;
    bool _282 = !_190;
    if (!_282)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = 1.0 / _290;
        float _294 = _180 * _286;
        float _296 = exp2(_294);
        float _298 = -_296;
        float _300 = _298 + 1.0;
        float _302 = _300 * _292;
        _200 = _302;
    }
    float _304 = _200;
    float _306 = -_236;
    float _308 = _226 + _306;
    float _310 = _226 * 6.283185482025146484375;
    float _312 = in.m_49.x;
    float _314 = in.m_49.y;
    float _316 = in.m_49.z;
    float _318 = _310 * 0.15915493667125701904296875;
    float _320 = fma(_240, 0.5, 0.5);
    float _322 = in.m_55.w;
    bool _324 = _244 < 0.5;
    float _326 = float(_324);
    float _328 = -_244;
    float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _332 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = in.m_44.x;
    float _336 = in.m_44.y;
    float _338 = in.m_44.z;
    float _340 = -_320;
    float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _344 = _318 * 6.283185482025146484375;
    float _346 = cos(_344);
    float _348 = -_326;
    float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _352 = in.m_57.x;
    float _354 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _356 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _358 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _360 = _332 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _362 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _364 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[8].x, _354);
    float _366 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[8].z, _360);
    float _368 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[8].y, _356);
    bool _370 = _308 < 0.5;
    float _372 = float(_370);
    float _374 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[10].x, _364);
    float _376 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[10].z, _366);
    float _378 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[10].y, _368);
    float _380 = fma(_346, 0.5, 0.5);
    float _382 = fma(_304, _312, _374);
    float _384 = fma(_304, _316, _376);
    float _386 = fma(_304, _314, _378);
    float _388 = _376;
    float _390 = _316;
    float _392 = _316;
    if (!_190)
    {
        float _394 = _144 * _144;
        float _396 = _394 * 0.5;
        _388 = _396;
    }
    float _398 = _388;
    float _400 = -_308;
    float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _404 = -_372;
    float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _408 = fma(_382, _322, _334);
    float _410 = -_380;
    float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _414 = fma(_386, _322, _336);
    float _416 = fma(_384, _322, _338);
    float _418 = _334;
    float _420 = _336;
    if (!_190)
    {
        float _422 = _398 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _418 = _422;
    }
    float _424 = _418;
    bool _426 = !_190;
    float _428 = _424;
    float _430 = _352;
    if (!_426)
    {
        float _432 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _434 = log2(_432);
        float _436 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _438 = _436 + 1.0;
        float _440 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _442 = _144 * _434;
        float _444 = 1.0 / _438;
        float _446 = _440 * 0.693147182464599609375;
        float _448 = exp2(_442);
        float _450 = 1.0 / _446;
        float _452 = _448 + (-1.0);
        float _454 = -_452;
        float _456 = fma(_454, _450, _144);
        float _458 = _456 * _444;
        float _460 = _458 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _428 = _460;
        _420 = _448;
    }
    float _462 = _428;
    float _464 = _420;
    float _466 = _462 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _468 = _464;
    if (!_190)
    {
        _468 = _144;
    }
    float _470 = _468;
    bool _472 = !_190;
    float _474 = _470;
    if (!_472)
    {
        float _476 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _478 = log2(_476);
        float _480 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _482 = _480 + 1.0;
        float _484 = 1.0 / _482;
        float _486 = _144 * _478;
        float _488 = exp2(_486);
        float _490 = -_488;
        float _492 = _490 + 1.0;
        float _494 = _492 * _484;
        _474 = _494;
    }
    float _496 = _474;
    float _498 = in.m_57.y;
    float _500 = _462 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _502 = _466 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _506 = _504 != 0;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _510 = _508 != 0;
    float _512 = _466 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _514 = _466 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _516 = _462 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _518 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[8].y, _502);
    bool _520 = !_506;
    int _522 = _520 ? 0 : 1;
    float _524 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[8].x, _512);
    float _526 = fma(_500, (*spvDescriptorSet0.vp_c10)._m0[8].z, _514);
    float _528 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[10].y, _518);
    int _530 = abs(_522);
    float _532 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[10].x, _524);
    float _534 = fma(_516, (*spvDescriptorSet0.vp_c10)._m0[10].z, _526);
    out.m_59.x = _352;
    bool _536 = !_234;
    int _538 = _536 ? 0 : 1;
    float _540 = fma(_496, _314, _528);
    float _542 = float(_530);
    float _544 = fma(_496, _312, _532);
    float _546 = fma(_496, _316, _534);
    int _548 = abs(_538);
    float _550 = -_540;
    float _552 = _386 + _550;
    bool _554 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    out.m_59.y = _498;
    bool _556 = !_510;
    int _558 = _556 ? 0 : 1;
    float _560 = abs(_330);
    float _562 = _542 * _560;
    float _564 = abs(_402);
    float _566 = _542 * _564;
    float _568 = float(_548);
    float _570 = -_544;
    float _572 = _382 + _570;
    float _574 = _552 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _576 = abs(_558);
    float _578 = _552 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _580 = _552 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _582 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[4].x, _574);
    float _584 = fma(_568, _342, _562);
    float _586 = float(_576);
    float _588 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[5].x, _578);
    float _590 = -_546;
    float _592 = _384 + _590;
    float _594 = fma(_572, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
    float _596 = fma(_568, _412, _566);
    float _598 = abs(_350);
    float _600 = fma(_586, _598, _584);
    float _602 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[4].z, _582);
    float _604 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[5].z, _588);
    float _606 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[6].z, _594);
    float _608 = abs(_406);
    float _610 = fma(_586, _608, _596);
    bool _612 = !_554;
    float _614 = _498;
    float _616 = _604;
    float _618 = _602;
    float _620 = _606;
    float _622 = _604;
    float _638;
    if (!_612)
    {
        float _624 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _626 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _630 = _628 * _624;
        float _632 = floor(_630);
        float _634 = -_632;
        float _636 = _630 + _634;
        _638 = _636;
        _640 = true;
    }
    else
    {
        _638 = _156;
    }
    _640 = false;
    float _642 = _638;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _646 = _642 + _644;
    bool _648 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _650 = isnan(_642);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _662 = _642 + _660;
    bool _664 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _666 = isnan(_642);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _684 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _686 = isnan(_642);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -_658;
    float _698 = _696 + 1.0;
    float _700 = 1.0 / _682;
    float _702 = _694 * _698;
    float _704 = -_694;
    float _706 = _704 + 1.0;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _708;
    bool _712 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _714 = 1.0 / _678;
    float _716 = _674 * _706;
    float _718 = -_674;
    float _720 = _718 + 1.0;
    float _722 = _662 * _700;
    float _724 = _646 * _714;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _730;
    float _734 = fma(_710, _724, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _736 = fma(_728, _724, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _738 = fma(_732, _724, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _740 = in.m_55.x;
    float _742 = in.m_55.y;
    float _744 = in.m_55.z;
    float _746 = _734 * _716;
    float _748 = _736 * _716;
    float _750 = _738 * _716;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _758 = _756 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _764 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].x, _746);
    float _766 = fma(_754, _722, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _768 = fma(_758, _722, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _770 = fma(_762, _722, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _772 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].y, _748);
    float _774 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[143].z, _750);
    float _776 = fma(_766, _702, _764);
    float _778 = fma(_768, _702, _772);
    float _780 = fma(_770, _702, _774);
    float _782 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[145].x, _776);
    float _784 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[145].y, _778);
    float _786 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[145].z, _780);
    float _788 = _782 * _740;
    float _790 = _784 * _742;
    float _792 = _786 * _744;
    bool _794 = !_712;
    float _810;
    if (!_794)
    {
        float _796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _798 = _174 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _800 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _802 = _800 * _796;
        float _804 = floor(_802);
        float _806 = -_804;
        float _808 = _802 + _806;
        _810 = _808;
        _812 = true;
    }
    else
    {
        _810 = _156;
    }
    _812 = false;
    float _814 = _810;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _824 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _826 = isnan(_814);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = 1.0 / _818;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _842 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _844 = isnan(_814);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _854;
    float _858 = -_834;
    float _860 = _858 + 1.0;
    bool _862 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _864 = isnan(_814);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    bool _874 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _876 = 1.0 / _822;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _882 = _852 * _860;
    float _884 = -_852;
    float _886 = _884 + 1.0;
    float _888 = _872 * _886;
    float _890 = 1.0 / _840;
    float _892 = _856 * _836;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _896 = _814 + _894;
    float _898 = -_872;
    float _900 = _898 + 1.0;
    float _902 = fma(_892, _896, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _906 = _814 + _904;
    float _908 = _880 * _876;
    bool _910 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _912 = isnan(_814);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _922;
    float _926 = _902 * _888;
    float _928 = fma(_908, _906, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _932 = _814 + _930;
    float _934 = -_920;
    float _936 = _934 + 1.0;
    float _938 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[115].x, _926);
    float _940 = _924 * _890;
    float _942 = _834 * _936;
    float _944 = fma(_928, _882, _938);
    float _946 = fma(_940, _932, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _950 = fma(_946, _942, _944);
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _954 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _958 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[118].x, _950);
    float _960 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _958 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _954;
    out.m_61.y = _960;
    out.m_61.z = _962;
    out.m_61.w = _964;
    bool _966 = !_874;
    float _982;
    if (!_966)
    {
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _970 = _174 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[11].z, _144);
        float _974 = _972 * _968;
        float _976 = floor(_974);
        float _978 = -_976;
        float _980 = _974 + _978;
        _982 = _980;
        _984 = true;
    }
    else
    {
        _982 = _156;
    }
    _984 = false;
    float _986 = _982;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _990 = _986 + _988;
    bool _992 = _986 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _994 = isnan(_986);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1004;
    bool _1008 = _986 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1010 = isnan(_986);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = 1.0 / _1006;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1022;
    bool _1026 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1028;
    float _1032 = _990 * _1020;
    float _1034 = -_1002;
    float _1036 = _1034 + 1.0;
    float _1038 = fma(_1024, _1032, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1040 = fma(_1030, _1032, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1042;
    float _1046 = _1018 * _1036;
    float _1048 = -_1018;
    float _1050 = _1048 + 1.0;
    float _1052 = fma(_1044, _1032, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1054 = _1038 * _1046;
    float _1056 = _1052 * _1046;
    float _1058 = _1040 * _1046;
    float _1060 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1054);
    float _1062 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1056);
    float _1064 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1058);
    float _1066 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1060);
    float _1068 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1062);
    float _1070 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1064);
    bool _1072 = !_1026;
    float _1088;
    if (!_1072)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1076 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _1080 = _1078 * _1074;
        float _1082 = floor(_1080);
        float _1084 = -_1082;
        float _1086 = _1080 + _1084;
        _1088 = _1086;
        _1090 = true;
    }
    else
    {
        _1088 = _156;
    }
    _1090 = false;
    float _1092 = _1088;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1098;
    bool _1102 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1104 = isnan(_1092);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1110 = _1106 || _1108;
    float _1112 = float(_1110);
    float _1114 = 1.0 / _1096;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1124 = -_1112;
    float _1126 = _1124 + 1.0;
    bool _1128 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1130 = isnan(_1092);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = 1.0 / _1118;
    bool _1142 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1144 = isnan(_1092);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    bool _1154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1156 = _1152 * _1126;
    float _1158 = -_1152;
    float _1160 = _1158 + 1.0;
    float _1162 = _1100 * _1114;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1166 = _1092 + _1164;
    float _1168 = 1.0 / _1122;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1174 = _1138 * _1160;
    float _1176 = fma(_1162, _1166, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1182 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1184 = isnan(_1092);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1194;
    float _1198 = _1172 * _1140;
    float _1200 = 1.0 / _1180;
    float _1202 = _1176 * _1174;
    float _1204 = -_1192;
    float _1206 = _1204 + 1.0;
    float _1208 = -_1138;
    float _1210 = _1208 + 1.0;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1216 = _1112 * _1206;
    bool _1218 = _1092 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1220 = isnan(_1092);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1226 = _1222 || _1224;
    float _1228 = float(_1226);
    float _1230 = _1196 * _1168;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1234 = _1092 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1238 = _1092 + _1236;
    float _1240 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1202);
    float _1242 = -_1228;
    float _1244 = _1242 + 1.0;
    float _1246 = fma(_1198, _1234, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1248 = fma(_1230, _1238, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1252 = _1092 + _1250;
    float _1254 = _1214 * _1200;
    float _1256 = fma(_1246, _1156, _1240);
    float _1258 = _1192 * _1244;
    float _1260 = _1068 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1262 = fma(_1254, _1252, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1264 = fma(_1248, _1216, _1256);
    float _1266 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1268 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = fma(_1262, _1258, _1264);
    float _1272 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1274 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1276 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1270);
    float _1278 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1276 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _1274;
    out.m_63.y = _1268;
    out.m_63.z = _1278;
    out.m_63.w = _1280;
    bool _1282 = !_1154;
    float _1298;
    if (!_1282)
    {
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1286 = _174 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _1290 = _1288 * _1284;
        float _1292 = floor(_1290);
        float _1294 = -_1292;
        float _1296 = _1290 + _1294;
        _1298 = _1296;
        _1300 = true;
    }
    else
    {
        _1298 = _156;
    }
    _1300 = false;
    float _1302 = _1298;
    float _1304 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1306 = int(_1304);
    float _1308 = in.m_53.y;
    float _1310 = _600 * _788;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1314 = _1312 != 0;
    float _1316 = in.m_53.z;
    float _1318 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1320 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1322 = int(_1320);
    float _1324 = in.m_65.w;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1328 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1330 = int(_1328);
    float _1332 = float(_1306);
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1338 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1334);
    float _1340 = 1.0 / _1332;
    float _1342 = float(uint(_1322));
    float _1344 = float(_1322);
    float _1346 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1348 = _1322 == 0;
    float _1350 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _1352 = _1322 + (-1);
    float _1354 = 1.0 / _1342;
    float _1356 = float(_1330);
    out.m_67.w = _1324;
    float _1358 = _144 * _1340;
    float _1360 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1362 = int(_1360);
    int _1364 = ~_1322;
    int _1366 = _1364 + 1;
    float _1368 = -_1346;
    float _1370 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1368);
    float _1372 = -_1350;
    float _1374 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1372);
    int _1376 = as_type<int>(_1354) + (-2);
    float _1378 = trunc(_1358);
    int _1380 = int(_1378);
    float _1382 = 1.0 / _1356;
    float _1384 = float(uint(_1362));
    int _1386 = ~_1362;
    int _1388 = _1386 + 1;
    float _1390 = float(uint(_1380));
    float _1392 = 1.0 / _1384;
    float _1394 = as_type<float>(_1376) * _1390;
    float _1396 = _144 * _1382;
    float _1398 = trunc(_1394);
    float _1400 = precise::max(_1398, 0.0);
    uint _1403 = uint(_1400);
    float _1405 = trunc(_1396);
    int _1407 = int(_1405);
    int _1409 = ~_1322;
    int _1411 = _1409 + 1;
    int _1413 = _1366 * int(_1403);
    int _1415 = _1413 + _1380;
    float _1417 = float(uint(_1415));
    float _1419 = float(uint(_1407));
    float _1421 = as_type<float>(_1376) * _1417;
    float _1423 = _1417;
    float _1425 = _1316;
    if (_1314)
    {
        _1423 = 1.0;
    }
    float _1427 = _1423;
    float _1429 = _1427;
    if (!_1314)
    {
        _1429 = 7.345489978790283203125;
    }
    float _1431 = _1429;
    float _1433 = trunc(_1421);
    float _1435 = precise::max(_1433, 0.0);
    uint _1437 = uint(_1435);
    float _1439 = _1431 * _174;
    int _1441 = as_type<int>(_1392) + (-2);
    float _1443 = floor(_1439);
    float _1445 = as_type<float>(_1441) * _1419;
    int _1447 = int(_1403) + int(_1437);
    float _1449 = trunc(_1445);
    float _1451 = precise::max(_1449, 0.0);
    uint _1453 = uint(_1451);
    float _1455 = float(_1380);
    int _1457 = _1411 * _1447;
    int _1459 = _1457 + _1380;
    int _1461 = ~_1362;
    int _1463 = _1461 + 1;
    bool _1465 = _1455 >= _1344;
    bool _1467 = isnan(_1455);
    bool _1469 = _1465 || _1467;
    bool _1471 = isnan(_1344);
    bool _1473 = _1469 || _1471;
    float _1475 = float(_1473);
    float _1477 = -_1443;
    float _1479 = _1439 + _1477;
    bool _1481 = uint(_1459) >= uint(_1322);
    bool _1483 = !_1481;
    int _1485 = _1483 ? 0 : (-1);
    float _1487 = trunc(_1475);
    int _1489 = int(_1487);
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1493 = _1491 != 0;
    int _1495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1497 = _1495 != 0;
    int _1499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1501 = _1499 != 0;
    int _1503 = ~_1447;
    int _1505 = _1503 + _1485;
    int _1507 = _1505 + 1;
    float _1509 = _1479 * _1344;
    int _1511 = _1463 * int(_1453);
    int _1513 = _1511 + _1407;
    int _1515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1517 = _1515 != 0;
    float _1519 = _156 * _1344;
    int _1521 = _1322 * _1507;
    int _1523 = _1521 + _1380;
    float _1525 = trunc(_1509);
    int _1527 = int(_1525);
    float _1529 = float(uint(_1513));
    bool _1531 = !_1517;
    int _1533 = _1531 ? 0 : 1;
    bool _1535 = !_1348;
    float _1537 = _1535 ? as_type<float>(_1523) : as_type<float>(0xffffffffu /* nan */);
    float _1539 = as_type<float>(_1441) * _1529;
    int _1541 = ~_1489;
    int _1543 = _1541 + 1;
    int _1545 = _1543 + 1;
    float _1547 = trunc(_1519);
    int _1549 = int(_1547);
    bool _1551 = !_1493;
    int _1553 = _1551 ? 0 : 1;
    int _1555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1557 = _1555 != 0;
    int _1559 = as_type<int>(_1537) * _1545;
    bool _1561 = !_1497;
    int _1563 = _1561 ? 0 : 1;
    int _1565 = abs(_1533);
    float _1567 = trunc(_1539);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    int _1573 = abs(_1563);
    int _1575 = _1489 * _1352;
    int _1577 = _1575 + _1559;
    int _1579 = abs(_1553);
    int _1581 = _1527 * _1565;
    int _1583 = _1581 + _1380;
    float _1585 = as_type<float>(_1545);
    float _1587 = _1537;
    if (_1557)
    {
        _1585 = _174;
    }
    float _1589 = _1585;
    float _1591 = _1589;
    if (_1557)
    {
        _1587 = 1.0;
    }
    float _1593 = _1587;
    int _1595 = _1577 * _1573;
    float _1597 = _1593;
    if (!_1557)
    {
        _1591 = _1308;
    }
    float _1599 = _1591;
    if (!_1557)
    {
        _1597 = 1.2345600128173828125;
    }
    float _1601 = _1597;
    int _1603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1605 = _1603 != 0;
    float _1607 = _1599 * _1601;
    bool _1609 = !_1501;
    int _1611 = _1609 ? 0 : 1;
    bool _1613 = !_1605;
    int _1615 = _1613 ? 0 : 1;
    int _1617 = _1549 * _1579;
    int _1619 = _1617 + _1595;
    int _1621 = abs(_1611);
    float _1623 = floor(_1607);
    int _1625 = int(_1453) + int(_1571);
    int _1627 = ~_1362;
    int _1629 = _1627 + 1;
    int _1631 = _1583 * _1621;
    int _1633 = _1631 + _1619;
    int _1635 = abs(_1615);
    float _1637 = float(_1362);
    int _1639 = _1629 * _1625;
    int _1641 = _1639 + _1407;
    float _1643 = float(_1407);
    int _1645 = ~_1322;
    int _1647 = _1645 + 1;
    bool _1649 = _1643 >= _1637;
    bool _1651 = isnan(_1643);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan(_1637);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    int _1661 = _1527 * _1635;
    int _1663 = _1661 + _1633;
    bool _1665 = uint(_1641) >= uint(_1362);
    float _1667 = -_1623;
    float _1669 = _1607 + _1667;
    int _1671 = 0;
    int _1673 = _1625;
    if (_1557)
    {
        _1671 = 0;
    }
    int _1675 = _1671;
    float _1677 = trunc(_1659);
    int _1679 = int(_1677);
    float _1681 = float(uint(_1663));
    bool _1683 = !_1665;
    int _1685 = _1683 ? 0 : (-1);
    int _1687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1689 = _1687 != 0;
    int _1691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1693 = _1691 != 0;
    int _1695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1697 = _1695 != 0;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1701 = _1699 != 0;
    float _1703 = as_type<float>(_1376) * _1681;
    int _1705 = ~_1625;
    int _1707 = _1705 + _1685;
    int _1709 = _1707 + 1;
    bool _1711 = _1322 == 0;
    bool _1713 = !_1693;
    int _1715 = _1713 ? 0 : 1;
    int _1717 = _1362 * _1709;
    int _1719 = _1717 + _1407;
    bool _1721 = _1362 == 0;
    float _1723 = trunc(_1703);
    float _1725 = precise::max(_1723, 0.0);
    uint _1727 = uint(_1725);
    int _1729 = abs(_1715);
    int _1731 = ~_1679;
    int _1733 = _1731 + 1;
    int _1735 = _1733 + 1;
    bool _1737 = !_1721;
    int _1739 = _1737 ? _1719 : (-1);
    float _1741 = _1669 * _1637;
    float _1743 = _156 * _1637;
    bool _1745 = !_1689;
    int _1747 = _1745 ? 0 : 1;
    int _1749 = _1739 * _1735;
    int _1751 = _1362 + (-1);
    float _1753 = trunc(_1741);
    int _1755 = int(_1753);
    int _1757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1759 = _1757 != 0;
    int _1761 = abs(_1747);
    int _1763 = _1679 * _1751;
    int _1765 = _1763 + _1749;
    bool _1767 = !_1697;
    int _1769 = _1767 ? 0 : 1;
    int _1771 = _1647 * int(_1727);
    int _1773 = _1771 + _1663;
    bool _1775 = !_1759;
    int _1777 = _1775 ? 0 : 1;
    float _1779 = trunc(_1743);
    int _1781 = int(_1779);
    bool _1783 = !_1701;
    int _1785 = _1783 ? 0 : 1;
    int _1787 = _1765 * _1729;
    float _1789 = float(uint(_1773));
    int _1791 = abs(_1777);
    int _1793 = abs(_1769);
    float _1795 = as_type<float>(_1376) * _1789;
    float _1797 = trunc(_1795);
    float _1799 = precise::max(_1797, 0.0);
    uint _1801 = uint(_1799);
    int _1803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1805 = _1803 != 0;
    int _1807 = _1755 * _1791;
    int _1809 = _1807 + _1407;
    int _1811 = abs(_1785);
    int _1813 = _1781 * _1761;
    int _1815 = _1813 + _1787;
    int _1817 = ~_1362;
    int _1819 = _1817 + 1;
    float _1821 = float(uint(_1809));
    int _1823 = _1809 * _1793;
    int _1825 = _1823 + _1815;
    int _1827 = _1675;
    int _1829 = as_type<int>(_1795);
    bool _1831 = _1759;
    float _1833 = as_type<float>(_1727);
    if (!_1557)
    {
        _1827 = 2;
    }
    int _1835 = _1827;
    int _1837 = _1755 * _1811;
    int _1839 = _1837 + _1825;
    if (_1805)
    {
        float _1841 = -_352;
        float _1843 = _1841 + 1.0;
        _1829 = as_type<int>(_1843);
    }
    int _1845 = _1829;
    if (_1805)
    {
        bool _1847 = _174 > 0.5;
        _1831 = _1847;
    }
    bool _1849 = _1831;
    float _1851 = as_type<float>(_1441) * _1821;
    int _1853 = int(_1727) + int(_1801);
    float _1855 = float(uint(_1839));
    float _1857 = trunc(_1851);
    float _1859 = precise::max(_1857, 0.0);
    uint _1861 = uint(_1859);
    if (!_1805)
    {
        _1833 = _352;
    }
    float _1863 = _1833;
    float _1865 = float(uint(_1583));
    float _1867 = as_type<float>(_1441) * _1855;
    float _1869 = _1863;
    if (_1805)
    {
        float _1871 = _1849 ? as_type<float>(_1845) : _352;
        _1869 = _1871;
    }
    float _1873 = _1869;
    float _1875 = in.m_53.w;
    int _1877 = ~_1322;
    int _1879 = _1877 + 1;
    float _1881 = as_type<float>(_1376) * _1865;
    float _1883 = trunc(_1867);
    float _1885 = precise::max(_1883, 0.0);
    uint _1887 = uint(_1885);
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1891 = _1889 != 0;
    int _1893 = _1879 * _1853;
    int _1895 = _1893 + _1663;
    bool _1897 = _1308 > 0.5;
    float _1899 = trunc(_1881);
    float _1901 = precise::max(_1899, 0.0);
    uint _1903 = uint(_1901);
    bool _1905 = uint(_1895) >= uint(_1322);
    float _1907 = -_498;
    float _1909 = _1907 + 1.0;
    bool _1911 = !_1905;
    int _1913 = _1911 ? 0 : (-1);
    if (_1891)
    {
        float _1915 = -_352;
        float _1917 = _1915 + 1.0;
        _1673 = as_type<int>(_1917);
    }
    int _1919 = _1673;
    int _1921 = _1897 ? as_type<int>(_1909) : as_type<int>(_498);
    int _1923 = _1819 * int(_1887);
    int _1925 = _1923 + _1839;
    bool _1927 = _1316 > 0.5;
    int _1929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1931 = _1929 != 0;
    float _1933 = float(uint(_1925));
    int _1935 = ~_1322;
    int _1937 = _1935 + 1;
    float _1939 = _1931 ? as_type<float>(_1921) : _498;
    float _1941 = as_type<float>(_1441) * _1933;
    float _1943 = _1933;
    if (!_1891)
    {
        _1943 = _352;
    }
    float _1945 = _1943;
    float _1947 = _1945;
    if (_1891)
    {
        float _1949 = _1927 ? as_type<float>(_1919) : _352;
        _1947 = _1949;
    }
    float _1951 = _1947;
    float _1953 = trunc(_1941);
    float _1955 = precise::max(_1953, 0.0);
    uint _1957 = uint(_1955);
    bool _1959 = _1875 > 0.5;
    int _1961 = _1937 * int(_1903);
    int _1963 = _1961 + _1583;
    int _1965 = ~_1853;
    int _1967 = _1965 + _1913;
    int _1969 = _1967 + 1;
    int _1971 = _1388 * int(_1861);
    int _1973 = _1971 + _1809;
    int _1975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1977 = _1975 != 0;
    float _1979 = float(uint(_1963));
    int _1981 = _1322 * _1969;
    int _1983 = _1981 + _1663;
    int _1985 = _1959 ? as_type<int>(_1909) : as_type<int>(_498);
    float _1987 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1991 = _1989 != 0;
    float _1993 = as_type<float>(_1376) * _1979;
    bool _1995 = !_1711;
    int _1997 = _1995 ? _1983 : (-1);
    float _1999 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2001 = _1991 ? as_type<float>(_1985) : _498;
    float _2003 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _2005 = _1997 & 3;
    bool _2007 = _2005 != 0;
    float _2009 = trunc(_1993);
    float _2011 = precise::max(_2009, 0.0);
    uint _2013 = uint(_2011);
    if (_1977)
    {
        float _2015 = _1927 ? _1909 : _498;
        _614 = _2015;
    }
    float _2017 = _614;
    float _2019 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1987);
    int _2021 = int(_1887) + int(_1957);
    int _2023 = ~_1362;
    int _2025 = _2023 + 1;
    float _2027 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2019);
    float _2029 = float(uint(_1973));
    bool _2031 = uint(_2005) > 1u;
    int _2033 = _2025 * _2021;
    int _2035 = _2033 + _1839;
    int _2037 = _1997 & 3;
    bool _2039 = _2037 != 0;
    float _2041 = as_type<float>(_1441) * _2029;
    float _2043 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1999);
    int _2045 = ~_1322;
    int _2047 = _2045 + 1;
    float _2049 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2003);
    int _2051 = _2039 ? 0 : 1;
    float _2053 = trunc(_2041);
    float _2055 = precise::max(_2053, 0.0);
    uint _2057 = uint(_2055);
    bool _2059 = uint(_2035) >= uint(_1362);
    float _2061 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2043);
    int _2063 = ~_2051;
    int _2065 = _2063 + 1;
    int _2067 = _2065 + 1;
    float _2069 = _2027 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2071 = !_2059;
    int _2073 = _2071 ? 0 : (-1);
    float _2075 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2049);
    bool _2077 = _2005 != 3;
    int _2079 = _2067;
    if (!_2031)
    {
        int _2081 = ~_2051;
        int _2083 = _2081 + 1;
        _2079 = _2083;
    }
    int _2085 = _2079;
    float _2087 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2089 = int(_1903) + int(_2013);
    float _2091 = _2061 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2093 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2095 = _2069 + _2093;
    bool _2097 = uint(_2005) >= 2u;
    float _2099 = _2087 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _2101 = ~_2021;
    int _2103 = _2101 + _2073;
    int _2105 = _2103 + 1;
    int _2107 = _2047 * _2089;
    int _2109 = _2107 + _1583;
    int _2111 = _2097 ? 0 : 1;
    float _2113 = _2095 * _2095;
    int _2115 = int(_1861) + int(_2057);
    int _2117 = _1362 * _2105;
    int _2119 = _2117 + _1839;
    int _2121 = ~_2111;
    int _2123 = _2121 + 1;
    int _2125 = _2123 + 1;
    float _2127 = _2075 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2129 = _2125;
    int _2131 = int(_2013);
    if (_2077)
    {
        int _2133 = ~_2111;
        int _2135 = _2133 + 1;
        _2129 = _2135;
    }
    int _2137 = _2129;
    float _2139 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2141 = _2091 + _2139;
    bool _2143 = !_1721;
    int _2145 = _2143 ? _2119 : (-1);
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2149 = _2127 + _2147;
    if (_1557)
    {
        _2131 = 0;
    }
    int _2151 = _2131;
    float _2153 = fma(_2141, _2141, _2113);
    bool _2155 = uint(_2109) >= uint(_1322);
    float _2157 = -_2127;
    float _2159 = _2157 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _2161 = _2151;
    if (!_1557)
    {
        _2161 = 1;
    }
    int _2163 = _2161;
    float _2165 = fma(_2149, _2149, _2153);
    int _2167 = _2145 & 3;
    bool _2169 = _2167 != 0;
    bool _2171 = !_2155;
    int _2173 = _2171 ? 0 : (-1);
    float _2175 = sqrt(_2165);
    int _2177 = _2145 & 3;
    bool _2179 = _2177 != 0;
    bool _2181 = uint(_2167) >= 2u;
    int _2183 = _2179 ? 0 : 1;
    bool _2185 = uint(_2167) > 1u;
    float _2187 = rsqrt(_2165);
    int _2189 = _2181 ? 0 : 1;
    bool _2191 = _2167 != 3;
    int _2193 = ~_1362;
    int _2195 = _2193 + 1;
    int _2197 = ~_2183;
    int _2199 = _2197 + 1;
    int _2201 = _2199 + 1;
    float _2203 = _2175 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2205 = ~_2189;
    int _2207 = _2205 + 1;
    int _2209 = _2207 + 1;
    int _2211 = _2195 * _2115;
    int _2213 = _2211 + _1809;
    bool _2215 = !_2007;
    int _2217 = _2215 ? 0 : 1;
    int _2219 = _2201;
    int _2221 = _2209;
    if (!_2185)
    {
        int _2223 = ~_2183;
        int _2225 = _2223 + 1;
        _2219 = _2225;
    }
    int _2227 = _2219;
    bool _2229 = uint(_2213) >= uint(_1362);
    if (_2191)
    {
        int _2231 = ~_2189;
        int _2233 = _2231 + 1;
        _2221 = _2233;
    }
    int _2235 = _2221;
    float _2237 = in.m_69.x;
    float _2239 = in.m_69.y;
    float _2241 = in.m_69.z;
    int _2243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2245 = _2243 != 0;
    bool _2247 = !_2229;
    int _2249 = _2247 ? 0 : (-1);
    bool _2251 = _1308 > 0.5;
    bool _2253 = _2251 && _2245;
    float _2255 = precise::min(_2099, _2203);
    bool _2257 = _1835 != 2;
    int _2259 = ~_2089;
    int _2261 = _2259 + _2173;
    int _2263 = _2261 + 1;
    float _2265 = _2187 * _2255;
    int _2267 = abs(_2085);
    out.m_71.w = _2255;
    float _2269 = 0.0;
    if (!_2245)
    {
        _2269 = _352;
    }
    float _2271 = _2269;
    float _2273 = _2095 * _2265;
    float _2275 = _2149 * _2265;
    float _2277 = _2271;
    if (_2253)
    {
        float _2279 = -_352;
        float _2281 = _2279 + 1.0;
        _430 = _2281;
    }
    float _2283 = _430;
    bool _2285 = _2163 != 1;
    float _2287 = _2141 * _2265;
    float _2289 = -_2273;
    float _2291 = _2095 + _2289;
    float _2293 = -_2275;
    float _2295 = _2149 + _2293;
    if (_2245)
    {
        _2277 = _2283;
    }
    float _2297 = _2277;
    float _2299 = -_2287;
    float _2301 = _2141 + _2299;
    float _2303 = _2291 * _2291;
    float _2305 = in.m_73.x;
    float _2307 = in.m_73.y;
    float _2309 = in.m_73.z;
    bool _2311 = _2239 != 0.0;
    bool _2313 = isnan(_2239);
    bool _2315 = _2311 || _2313;
    bool _2317 = isnan(0.0);
    bool _2319 = _2315 || _2317;
    float _2321 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2237);
    float _2323 = fma(_2301, _2301, _2303);
    float _2325 = in.m_75.x;
    float _2327 = in.m_75.y;
    float _2329 = in.m_75.z;
    float _2331 = in.m_75.w;
    bool _2333 = _2237 == 0.0;
    bool _2335 = !_2319;
    bool _2337 = _2333 && _2335;
    float _2339 = _610 * _790;
    float _2341 = fma(_2295, _2295, _2323);
    float _2343 = 0.0;
    if (!_2285)
    {
        _2343 = _1308;
    }
    float _2345 = _2343;
    int _2347 = _1322 * _2263;
    int _2349 = _2347 + _1583;
    bool _2351 = _2241 == 0.0;
    bool _2353 = _2351 && _2337;
    float _2355 = 0.0;
    float _2357 = _2345;
    if (_2257)
    {
        _2355 = _174;
    }
    float _2359 = _2355;
    float _2361 = sqrt(_2341);
    float _2363 = 0.0;
    float _2365 = _2359;
    if (!_2285)
    {
        _2363 = _2345;
    }
    float _2367 = _2363;
    float _2369 = _2367;
    if (!_2257)
    {
        _2365 = _1316;
    }
    float _2371 = _2365;
    float _2373 = 0.0;
    if (!_2285)
    {
        _2373 = _1316;
    }
    float _2375 = _2373;
    float _2377 = 0.0;
    float _2379 = _2375;
    if (_2257)
    {
        _2377 = _1308;
    }
    float _2381 = _2377;
    float _2383 = _2381;
    if (_2285)
    {
        _2369 = _174;
    }
    float _2385 = _2369;
    if (_2285)
    {
        _2357 = _174;
    }
    float _2387 = _2357;
    if (_2285)
    {
        _1425 = _1308;
    }
    float _2389 = _1425;
    float _2391 = _2385 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2393 = _2309 * _2327;
    float _2395 = _2305 * _2329;
    float _2397 = _2307 * _2325;
    float _2399 = _2393;
    float _2401 = _2331;
    if (_2285)
    {
        _2379 = _1308;
    }
    float _2403 = _2379;
    float _2405 = _2187 * _2361;
    if (!_2257)
    {
        _2383 = _174;
    }
    float _2407 = _2383;
    float _2409 = -_2395;
    float _2411 = fma(_2309, _2325, _2409);
    int _2413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2415 = _2413 != 0;
    float _2417 = -_2397;
    float _2419 = fma(_2327, _2305, _2417);
    int _2421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2423 = _2421 != 0;
    float _2425 = -_2393;
    float _2427 = fma(_2329, _2307, _2425);
    if (_2353)
    {
        _2399 = _2307;
    }
    float _2429 = _2399;
    float _2431 = _1318 * _2405;
    float _2433 = _2429;
    if (!_2353)
    {
        float _2435 = fma(_2239, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2307);
        _2433 = _2435;
    }
    float _2437 = _2433;
    float _2439 = _2427 * _2331;
    float _2441 = _2411 * _2331;
    float _2443 = _2419 * _2331;
    float _2445 = _2339 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_2353)
    {
        _2401 = _2309;
    }
    float _2447 = _2401;
    float _2449 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2239);
    float _2451 = _2447;
    if (!_2353)
    {
        float _2453 = fma(_2241, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2309);
        _2451 = _2453;
    }
    float _2455 = _2451;
    float _2457 = _2431 * _2241;
    float _2459 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2461 = _2445 * _2405;
    float _2463 = 0.0;
    float _2465 = _2455;
    if (_2353)
    {
        _2463 = _2305;
    }
    float _2467 = _2463;
    float _2469 = _2467;
    if (!_2353)
    {
        float _2471 = fma(_2237, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2305);
        _2469 = _2471;
    }
    float _2473 = _2469;
    float _2475 = -_1326;
    float _2477 = fma(_2459, 2.0, _2475);
    float _2479 = _2461 * _2449;
    float _2481 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2483 = _2481 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2485 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2487 = 1.0 / _2483;
    float _2489 = -_2091;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2493 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2495 = fma(_2485, -2.0, _1336);
    float _2497 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2493);
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2501 = _2499 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2503 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2505 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2507 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2509 = _2507 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2511 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2503);
    float _2513 = -_2069;
    float _2515 = _2513 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2517 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2505);
    float _2519 = 1.0 / _2509;
    float _2521 = _2515 * _2515;
    float _2523 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2525 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2527 = fma(_2491, _2491, _2521);
    float _2529 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2531 = -_2523;
    float _2533 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2531);
    float _2535 = 1.0 / _2501;
    float _2537 = fma(_2159, _2159, _2527);
    float _2539 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2541 = _2539 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2543 = -_2525;
    float _2545 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2543);
    float _2547 = -_2529;
    float _2549 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2547);
    float _2551 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2517);
    float _2553 = rsqrt(_2537);
    float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2557 = _2555 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2559 = _2407 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2561 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2563 = _2561 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2565 = _2389 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2567 = _2087 * _2405;
    float _2569 = 1.0 / _2557;
    float _2571 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2573 = _2571 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2575 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2577 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2575;
    int _2579 = ~_2267;
    int _2581 = _2579 + 1;
    int _2583 = _2581 + 1;
    float _2585 = _2567 * _2321;
    int _2587 = abs(_2217);
    float _2589 = _2577 * _2535;
    bool _2591 = !_2169;
    int _2593 = _2591 ? 0 : 1;
    float _2595 = 1.0 / _2541;
    float _2597 = _2491 * _2553;
    float _2599 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2601 = _2515 * _2553;
    int _2603 = abs(_2593);
    float _2605 = -_2599;
    float _2607 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2605);
    bool _2609 = _2005 != 3;
    float _2611 = 1.0 / _2563;
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2613;
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2619 = _2617 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2621 = ~_2115;
    int _2623 = _2621 + _2249;
    int _2625 = _2623 + 1;
    float _2627 = _2615 * _2487;
    float _2629 = _2619 * _2519;
    float _2631 = _2597 * _2597;
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2635 = _2633 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2637 = _2159 * _2553;
    float _2639 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2641 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2639;
    float _2643 = 1.0 / _2573;
    float _2645 = fma(_2637, _2637, _2631);
    float _2647 = _2641 * _2569;
    float _2649 = _2635 * _2595;
    float _2651 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2653 = _2651 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2655 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2657 = _1302 + _2655;
    float _2659 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2661 = _1302 + _2659;
    bool _2663 = !_2609;
    int _2665 = _2663 ? 0 : (-1);
    float _2667 = rsqrt(_2645);
    float _2669 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2671 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2669;
    float _2673 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2675 = _1302 + _2673;
    float _2677 = _2653 * _2611;
    float _2679 = fma(_2629, _2657, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2681 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2683 = _1302 + _2681;
    float _2685 = fma(_2627, _2675, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2689 = _1302 + _2687;
    float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2693 = _1302 + _2691;
    float _2695 = _2671 * _2643;
    float _2697 = _2545 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2699 = fma(_2589, _2689, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2701 = fma(_2647, _2683, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2703 = fma(_2677, _2661, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2705 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2707 = fma(_2649, _2693, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2709 = _2637 * _2667;
    float _2711 = _2597 * _2667;
    float _2713 = _2545 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2715 = -_2705;
    float _2717 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2715);
    float _2719 = -_2709;
    float _2721 = _2637 * _2719;
    float _2723 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2725 = -_2713;
    float _2727 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2725);
    float _2729 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2717);
    float _2731 = -_2721;
    float _2733 = fma(_2597, _2711, _2731);
    float _2735 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2737 = _2601 * _2711;
    float _2739 = -_2697;
    float _2741 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2739);
    float _2743 = _2733 * _2733;
    float _2745 = -_2723;
    float _2747 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2745);
    float _2749 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2727);
    float _2751 = _2729 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2753 = -_2735;
    float _2755 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2753);
    float _2757 = _1374 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2759 = fma(_2737, _2737, _2743);
    float _2761 = -_2709;
    float _2763 = _2601 * _2761;
    float _2765 = -_2751;
    float _2767 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2765);
    float _2769 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2755);
    float _2771 = -_2757;
    float _2773 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2771);
    float _2775 = fma(_2763, _2763, _2759);
    float _2777 = _2549 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2779 = fma(_2769, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2767);
    float _2781 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2773);
    bool _2783 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2785 = isnan(_1302);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2791 = _2787 || _2789;
    float _2793 = float(_2791);
    float _2795 = -_2777;
    float _2797 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2795);
    float _2799 = rsqrt(_2775);
    float _2801 = -_2781;
    float _2803 = fma(_2801, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2779);
    bool _2805 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2807 = isnan(_1302);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2813 = _2809 || _2811;
    float _2815 = float(_2813);
    float _2817 = -_2793;
    float _2819 = _2817 + 1.0;
    bool _2821 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2823 = isnan(_1302);
    bool _2825 = _2821 || _2823;
    bool _2827 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2829 = _2825 || _2827;
    float _2831 = float(_2829);
    float _2833 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2747);
    float _2835 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2741);
    float _2837 = _2815 * _2819;
    float _2839 = 1.0 / _2803;
    float _2841 = -_2815;
    float _2843 = _2841 + 1.0;
    bool _2845 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2847 = isnan(_1302);
    bool _2849 = _2845 || _2847;
    bool _2851 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2853 = _2849 || _2851;
    float _2855 = float(_2853);
    float _2857 = -_2831;
    float _2859 = _2857 + 1.0;
    float _2861 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2797);
    float _2863 = _2831 * _2843;
    bool _2865 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2867 = isnan(_1302);
    bool _2869 = _2865 || _2867;
    bool _2871 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2873 = _2869 || _2871;
    float _2875 = float(_2873);
    float _2877 = -_2855;
    float _2879 = _2877 + 1.0;
    float _2881 = _2733 * _2799;
    float _2883 = precise::clamp(_2881, 0.0, 1.0);
    bool _2885 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2887 = isnan(_1302);
    bool _2889 = _2885 || _2887;
    bool _2891 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2893 = _2889 || _2891;
    float _2895 = float(_2893);
    float _2897 = _2855 * _2859;
    float _2899 = _2875 * _2879;
    float _2901 = -_2875;
    float _2903 = _2901 + 1.0;
    float _2905 = -_2883;
    float _2907 = _2905 + 1.0;
    bool _2909 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2911 = isnan(_1302);
    bool _2913 = _2909 || _2911;
    bool _2915 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2917 = _2913 || _2915;
    float _2919 = float(_2917);
    float _2921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2923 = fma(_2833, _2839, -1.0);
    float _2925 = -_2895;
    float _2927 = _2925 + 1.0;
    float _2929 = _2895 * _2903;
    float _2931 = _2907 * _2839;
    float _2933 = fma(_2907, _2923, 1.0);
    bool _2935 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2937 = isnan(_1302);
    bool _2939 = _2935 || _2937;
    bool _2941 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2943 = _2939 || _2941;
    float _2945 = float(_2943);
    float _2947 = _2919 * _2927;
    float _2949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2951 = -_2919;
    float _2953 = _2951 + 1.0;
    float _2955 = _2835 * _2931;
    float _2957 = _2933 * _2933;
    float _2959 = _2861 * _2931;
    float _2961 = _2945 * _2953;
    float _2963 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2965 = _1302 + _2963;
    float _2967 = fma(_2955, _2955, _2957);
    float _2969 = -_2945;
    float _2971 = _2969 + 1.0;
    float _2973 = _2685 * _2961;
    float _2975 = fma(_2695, _2965, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2977 = fma(_2959, _2959, _2967);
    float _2979 = _2921 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2981 = fma(_2971, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2973);
    int _2983 = _1362 * _2625;
    int _2985 = _2983 + _1809;
    float _2987 = fma(_2979, _2017, -0.5);
    float _2989 = _2949 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2991 = rsqrt(_2977);
    float _2993 = fma(_2679, _2947, _2981);
    float _2995 = fma(_2989, _2297, -0.5);
    float _2997 = _2371 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2999 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3001 = fma(_2699, _2929, _2993);
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3005 = -_2999;
    float _3007 = fma(_2997, 2.0, _3005);
    float _3009 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3011 = fma(_2707, _2899, _3001);
    float _3013 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3003);
    float _3015 = -_144;
    float _3017 = fma(_3015, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3007);
    float _3019 = fma(_2403, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3009);
    float _3021 = _2959 * _2991;
    float _3023 = _2933 * _2991;
    float _3025 = fma(_2551, _2995, _3017);
    int _3027 = _1997 >> 31;
    float _3029 = fma(_2701, _2897, _3011);
    float _3031 = _2955 * _2991;
    float _3033 = -_3021;
    float _3035 = _2597 * _3033;
    float _3037 = _2637 * _3023;
    int _3039 = _3027 & 3;
    float _3041 = fma(_2703, _2863, _3029);
    float _3043 = -_3031;
    float _3045 = -_3035;
    float _3047 = fma(_2637, _3043, _3045);
    float _3049 = -_3021;
    float _3051 = -_3037;
    float _3053 = fma(_2601, _3049, _3051);
    int _3055 = _2145 >> 31;
    float _3057 = -_3031;
    float _3059 = _2601 * _3057;
    int _3061 = _1997 + _3039;
    float _3063 = _3047 * _3047;
    int _3065 = _3055 & 3;
    float _3067 = -_3059;
    float _3069 = fma(_2597, _3023, _3067);
    int _3071 = _3061 >> 2;
    float _3073 = fma(_3053, _3053, _3063);
    int _3075 = _2145 + _3065;
    float _3077 = fma(_2975, _2837, _3041);
    int _3079 = _3071 << 4;
    int _3081 = _3079 + 368;
    float _3083 = fma(_3069, _3069, _3073);
    float _3085 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2511);
    uint _3087 = uint(int(uint(_3081) >> uint(2)));
    uint _3089 = uint(int(uint(int(_3087)) >> uint(2)));
    int _3091 = int(_3087) & 3;
    float _3093 = (*spvDescriptorSet0.vp_c9)._m0[int(_3089)][_3091];
    int _3095 = int(_3087) + 1;
    uint _3097 = uint(int(uint(_3095) >> uint(2)));
    int _3099 = _3095 & 3;
    float _3101 = (*spvDescriptorSet0.vp_c9)._m0[int(_3097)][_3099];
    int _3103 = _3075 >> 2;
    float _3105 = rsqrt(_3083);
    float _3107 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3109 = fma(_2793, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3077);
    int _3111 = _3103 << 4;
    int _3113 = _3111 + 512;
    float _3115 = -_3107;
    float _3117 = fma(_2391, 2.0, _3115);
    int _3119 = _3081 + 8;
    uint _3121 = uint(int(uint(_3119) >> uint(2)));
    uint _3123 = uint(int(uint(int(_3121)) >> uint(2)));
    int _3125 = int(_3121) & 3;
    float _3127 = (*spvDescriptorSet0.vp_c9)._m0[int(_3123)][_3125];
    int _3129 = int(_3121) + 1;
    uint _3131 = uint(int(uint(_3129) >> uint(2)));
    int _3133 = _3129 & 3;
    float _3135 = (*spvDescriptorSet0.vp_c9)._m0[int(_3131)][_3133];
    float _3137 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3139 = abs(_2235);
    float _3141 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _3143 = _2167 != 3;
    float _3145 = fma(_2565, -2.0, _3137);
    out.m_77.x = _3109;
    float _3147 = fma(_2559, -2.0, _3141);
    uint _3149 = uint(int(uint(_3113) >> uint(2)));
    uint _3151 = uint(int(uint(int(_3149)) >> uint(2)));
    int _3153 = int(_3149) & 3;
    float _3155 = (*spvDescriptorSet0.vp_c9)._m0[int(_3151)][_3153];
    int _3157 = int(_3149) + 1;
    uint _3159 = uint(int(uint(_3157) >> uint(2)));
    int _3161 = _3157 & 3;
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[int(_3159)][_3161];
    float _3165 = _3053 * _3105;
    float _3167 = _3069 * _3105;
    float _3169 = _3047 * _3105;
    float _3171 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3147);
    float _3173 = _2637 * _3165;
    float _3175 = _2601 * _3167;
    int _3177 = _3113 + 8;
    uint _3179 = uint(int(uint(_3177) >> uint(2)));
    uint _3181 = uint(int(uint(int(_3179)) >> uint(2)));
    int _3183 = int(_3179) & 3;
    float _3185 = (*spvDescriptorSet0.vp_c9)._m0[int(_3181)][_3183];
    int _3187 = int(_3179) + 1;
    uint _3189 = uint(int(uint(_3187) >> uint(2)));
    int _3191 = _3187 & 3;
    float _3193 = (*spvDescriptorSet0.vp_c9)._m0[int(_3189)][_3191];
    float _3195 = _2597 * _3169;
    float _3197 = -_3173;
    float _3199 = fma(_2597, _3167, _3197);
    float _3201 = -_3175;
    float _3203 = fma(_2637, _3169, _3201);
    int _3205 = abs(_2227);
    float _3207 = -_3195;
    float _3209 = fma(_2601, _3165, _3207);
    float _3211 = _3199 * _3199;
    float _3213 = -_3171;
    float _3215 = fma(_3085, _2987, _3213);
    int _3217 = ~_3205;
    int _3219 = _3217 + 1;
    int _3221 = _3219 + 1;
    float _3223 = fma(_3203, _3203, _3211);
    float _3225 = fma(_3209, _3209, _3223);
    float _3227 = rsqrt(_3225);
    int _3229 = _2583 * as_type<int>(_3101);
    float _3231 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3233 = int(_3231);
    int _3235 = ~_2587;
    int _3237 = _3235 + 1;
    int _3239 = _3237 + 1;
    int _3241 = _3239 * as_type<int>(_3093);
    int _3243 = _3241 + _3229;
    int _3245 = abs(_2137);
    float _3247 = _3209 * _3227;
    float _3249 = _3203 * _3227;
    int _3251 = ~_3245;
    int _3253 = _3251 + 1;
    int _3255 = _3253 + 1;
    int _3257 = _3221 * as_type<int>(_3163);
    int _3259 = ~_2603;
    int _3261 = _3259 + 1;
    int _3263 = _3261 + 1;
    float _3265 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3267 = int(_3265);
    int _3269 = abs(_2665);
    int _3271 = _3255 * as_type<int>(_3127);
    int _3273 = _3271 + _3243;
    bool _3275 = !_2423;
    int _3277 = _3275 ? 0 : 1;
    int _3279 = _3263 * as_type<int>(_3155);
    int _3281 = _3279 + _3257;
    int _3283 = ~_3269;
    int _3285 = _3283 + 1;
    int _3287 = _3285 + 1;
    float _3289 = _3199 * _3227;
    bool _3291 = !_2415;
    int _3293 = _3291 ? 0 : 1;
    float _3295 = _3247 * _2327;
    int _3297 = abs(_3277);
    float _3299 = _2597 * _3247;
    int _3301 = _3287 * as_type<int>(_3135);
    int _3303 = _3301 + _3273;
    float _3305 = float(uint(_3233));
    float _3307 = _2637 * _3289;
    int _3309 = abs(_3293);
    float _3311 = -_3299;
    float _3313 = fma(_2637, _3249, _3311);
    bool _3315 = !_3143;
    int _3317 = _3315 ? 0 : (-1);
    float _3319 = 1.0 / _3305;
    int _3321 = ~_3139;
    int _3323 = _3321 + 1;
    int _3325 = _3323 + 1;
    float _3327 = -_3307;
    float _3329 = fma(_2601, _3247, _3327);
    float _3331 = _3313 * _3313;
    int _3333 = ~_3233;
    int _3335 = _3333 + 1;
    float _3337 = _2441 * _3289;
    int _3339 = _3325 * as_type<int>(_3185);
    int _3341 = _3339 + _3281;
    float _3343 = float(uint(_3267));
    float _3345 = fma(_3329, _3329, _3331);
    int _3347 = abs(_3317);
    float _3349 = _2601 * _3249;
    float _3351 = 1.0 / _3343;
    int _3353 = ~_3267;
    int _3355 = _3353 + 1;
    float _3357 = _2441 * _3247;
    float _3359 = -_3349;
    float _3361 = fma(_2597, _3289, _3359);
    int _3363 = ~_3309;
    int _3365 = _3363 + 1;
    int _3367 = _3365 + 1;
    int _3369 = ~_3347;
    int _3371 = _3369 + 1;
    int _3373 = _3371 + 1;
    float _3375 = fma(_3361, _3361, _3345);
    int _3377 = abs(_3233);
    int _3379 = _3303 * _3367;
    int _3381 = ~_3297;
    int _3383 = _3381 + 1;
    int _3385 = _3383 + 1;
    int _3387 = _3373 * as_type<int>(_3193);
    int _3389 = _3387 + _3341;
    bool _3391 = !_1711;
    int _3393 = _3391 ? _2349 : (-1);
    float _3395 = rsqrt(_3375);
    int _3397 = _3389 * _3385;
    bool _3399 = !_1721;
    int _3401 = _3399 ? _2985 : (-1);
    int _3403 = _3393 * _3309;
    int _3405 = _3403 + _3379;
    int _3407 = abs(_3267);
    float _3409 = _2479 * _3247;
    int _3411 = as_type<int>(_3319) + (-2);
    int _3413 = _3401 * _3297;
    int _3415 = _3413 + _3397;
    float _3417 = float(uint(_3407));
    float _3419 = _2479 * _3249;
    float _3421 = float(uint(_3377));
    float _3423 = _3247 * _2437;
    float _3425 = 1.0 / _3417;
    int _3427 = as_type<int>(_3351) + (-2);
    float _3429 = _3361 * _3395;
    float _3431 = float(uint(_3405));
    float _3433 = _3329 * _3395;
    int _3435 = abs(_3405);
    float _3437 = fma(_2585, _3429, _3409);
    float _3439 = 1.0 / _3421;
    float _3441 = as_type<float>(_3411) * _3431;
    float _3443 = float(uint(_3415));
    float _3445 = fma(_2637, _2457, _3437);
    float _3447 = fma(_2585, _3433, _3419);
    int _3449 = ~_3407;
    int _3451 = _3449 + 1;
    float _3453 = as_type<float>(_3427) * _3443;
    float _3455 = trunc(_3441);
    float _3457 = precise::max(_3455, 0.0);
    uint _3459 = uint(_3457);
    int _3461 = as_type<int>(_3425) + (-2);
    float _3463 = fma(_2597, _2457, _3447);
    float _3465 = _2127 + _3445;
    float _3467 = fma(_3429, _2325, _3295);
    float _3469 = _2091 + _3463;
    float _3471 = float(uint(_3435));
    float _3473 = trunc(_3453);
    float _3475 = precise::max(_3473, 0.0);
    uint _3477 = uint(_3475);
    int _3479 = as_type<int>(_3439) + (-2);
    float _3481 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3483 = _3465 + _3481;
    int _3485 = abs(_3415);
    float _3487 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3489 = _3469 + _3487;
    float _3491 = as_type<float>(_3479) * _3471;
    float _3493 = _3483 * _3483;
    int _3495 = _3335 * int(_3459);
    int _3497 = _3495 + _3405;
    float _3499 = _3215 + 0.5;
    float _3501 = fma(_3489, _3489, _3493);
    float _3503 = trunc(_3491);
    float _3505 = precise::max(_3503, 0.0);
    uint _3507 = uint(_3505);
    float _3509 = float(uint(_3497));
    float _3511 = _3025 + 0.5;
    int _3513 = ~_3377;
    int _3515 = _3513 + 1;
    int _3517 = _3355 * int(_3477);
    int _3519 = _3517 + _3415;
    float _3521 = float(uint(_3485));
    float _3523 = as_type<float>(_3411) * _3509;
    out.m_79.x = _3511;
    out.m_79.y = _3499;
    float _3525 = sqrt(_3501);
    float _3527 = float(uint(_3519));
    float _3529 = as_type<float>(_3461) * _3521;
    float _3531 = _3289 * _2327;
    float _3533 = as_type<float>(_3427) * _3527;
    float _3535 = _3249 * _2327;
    float _3537 = trunc(_3529);
    float _3539 = precise::max(_3537, 0.0);
    uint _3541 = uint(_3539);
    int _3543 = _3515 * int(_3507);
    int _3545 = _3543 + _3435;
    float _3547 = _2441 * _3249;
    float _3549 = _3289 * _2437;
    float _3551 = _2479 * _3289;
    float _3553 = fma(_3433, _2325, _3535);
    float _3555 = float(uint(_3545));
    float _3557 = _3313 * _3395;
    float _3559 = trunc(_3523);
    float _3561 = precise::max(_3559, 0.0);
    uint _3563 = uint(_3561);
    float _3565 = _3249 * _2437;
    bool _3567 = _3525 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3569 = as_type<float>(_3479) * _3555;
    float _3571 = fma(_2585, _3557, _3551);
    int _3573 = ~_3233;
    int _3575 = _3573 + 1;
    float _3577 = fma(_3557, _2325, _3531);
    float _3579 = fma(_2439, _3433, _3547);
    int _3581 = _3451 * int(_3541);
    int _3583 = _3581 + _3485;
    float _3585 = trunc(_3533);
    float _3587 = precise::max(_3585, 0.0);
    uint _3589 = uint(_3587);
    float _3591 = fma(_2601, _2457, _3571);
    int _3593 = ~_3267;
    int _3595 = _3593 + 1;
    float _3597 = fma(_2439, _3557, _3337);
    float _3599 = float(uint(_3583));
    float _3601 = fma(_2439, _3429, _3357);
    float _3603 = fma(_3557, _2473, _3549);
    int _3605 = int(_3459) + int(_3563);
    float _3607 = trunc(_3569);
    float _3609 = precise::max(_3607, 0.0);
    uint _3611 = uint(_3609);
    float _3613 = as_type<float>(_3461) * _3599;
    float _3615 = fma(_3429, _2473, _3423);
    float _3617 = fma(_2597, _2329, _3553);
    int _3619 = _3575 * _3605;
    int _3621 = _3619 + _3405;
    float _3623 = fma(_2601, _2329, _3577);
    float _3625 = fma(_3433, _2473, _3565);
    float _3627 = fma(_2637, _2329, _3467);
    float _3629 = trunc(_3613);
    float _3631 = precise::max(_3629, 0.0);
    uint _3633 = uint(_3631);
    int _3635 = int(_3477) + int(_3589);
    float _3637 = _2069 + _3591;
    bool _3639 = uint(_3621) >= uint(_3233);
    int _3641 = ~_3377;
    int _3643 = _3641 + 1;
    int _3645 = _3595 * _3635;
    int _3647 = _3645 + _3415;
    int _3649 = ~_3407;
    int _3651 = _3649 + 1;
    int _3653 = int(_3507) + int(_3611);
    float _3655 = as_type<float>(_3621);
    float _3657 = _3591;
    float _3659 = _3549;
    float _3661 = _3617;
    float _3663 = _3623;
    if (!_3567)
    {
        _3655 = _3469;
    }
    float _3665 = _3655;
    float _3667 = _3665;
    if (!_3567)
    {
        _3657 = _3465;
    }
    float _3669 = _3657;
    float _3671 = _3669;
    if (!_3567)
    {
        _3659 = _3637;
    }
    float _3673 = _3659;
    int _3675 = int(_3541) + int(_3633);
    bool _3677 = !_3567;
    float _3679 = _3673;
    if (!_3677)
    {
        float _3681 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3683 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3685 = _3525 + _3683;
        float _3687 = _3637 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3689 = rsqrt(_3501);
        float _3691 = _3685 * _3681;
        float _3693 = _3691 * 0.15915493667125701904296875;
        float _3695 = _3693 * 6.283185482025146484375;
        float _3697 = cos(_3695);
        float _3699 = _3693 * 6.283185482025146484375;
        float _3701 = sin(_3699);
        float _3703 = _3697 + (-1.0);
        float _3705 = fma(_3701, _3687, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3707 = _3703 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3709 = _3689 * _3705;
        float _3711 = fma(_3637, _3697, _3707);
        float _3713 = fma(_3489, _3709, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3715 = fma(_3483, _3709, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3667 = _3713;
        _3679 = _3711;
        _3671 = _3715;
    }
    float _3717 = _3667;
    float _3719 = _3679;
    float _3721 = _3671;
    bool _3723 = !_3639;
    int _3725 = _3723 ? 0 : (-1);
    float _3727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3729 = _3643 * _3653;
    int _3731 = _3729 + _3435;
    bool _3733 = uint(_3647) >= uint(_3267);
    int _3735 = _3651 * _3675;
    int _3737 = _3735 + _3485;
    int _3739 = ~_3605;
    int _3741 = _3739 + _3725;
    int _3743 = _3741 + 1;
    float _3745 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2495);
    bool _3747 = uint(_3731) >= uint(_3377);
    float _3749 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3145);
    bool _3751 = !_3733;
    int _3753 = _3751 ? 0 : (-1);
    int _3755 = _3233 * _3743;
    int _3757 = _3755 + _3405;
    bool _3759 = _3233 == 0;
    float _3761 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2497);
    bool _3763 = _3233 == 0;
    float _3765 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3019);
    int _3767 = _3405 ^ _3233;
    out.m_81.x = _2567;
    int _3769 = ~_3635;
    int _3771 = _3769 + _3753;
    int _3773 = _3771 + 1;
    float _3775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3777 = !_3759;
    int _3779 = _3777 ? _3757 : (-1);
    bool _3781 = uint(_3737) >= uint(_3407);
    int _3783 = _3267 * _3773;
    int _3785 = _3783 + _3415;
    int _3787 = _3415 ^ _3267;
    float _3789 = _3727 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3791 = _3267 == 0;
    float _3793 = fma(_2637, _2455, _3615);
    bool _3795 = _3267 == 0;
    float _3797 = -_144;
    float _3799 = fma(_3797, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2477);
    float _3801 = float(_3779);
    float _3803 = fma(_3789, _1873, -0.5);
    bool _3805 = !_3781;
    int _3807 = _3805 ? 0 : (-1);
    float _3809 = -_2287;
    float _3811 = _2091 + _3809;
    bool _3813 = !_3747;
    int _3815 = _3813 ? 0 : (-1);
    float _3817 = fma(_3789, _3801, _3799);
    uint _3819 = uint(int(uint(_3767) >> uint(31)));
    float _3821 = _3775 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3823 = ~_3807;
    int _3825 = _3675 + _3823;
    int _3827 = _3825 + 1;
    float _3829 = -_144;
    float _3831 = fma(_3829, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3117);
    bool _3833 = !_3791;
    int _3835 = _3833 ? _3785 : (-1);
    float _3837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _3839 = uint(int(uint(_3787) >> uint(31)));
    float _3841 = fma(_3821, _1951, -0.5);
    int _3843 = ~_3815;
    int _3845 = _3653 + _3843;
    int _3847 = _3845 + 1;
    float _3849 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1338);
    int _3851 = ~int(_3819);
    int _3853 = _3851 + 1;
    float _3855 = fma(_2597, _2455, _3625);
    float _3857 = float(_3835);
    float _3859 = fma(_3849, _3803, _3817);
    int _3861 = ~int(_3839);
    int _3863 = _3861 + 1;
    out.m_83.x = _3617;
    out.m_83.y = _3623;
    out.m_83.z = _3627;
    int _3865 = _3847 ^ _3853;
    float _3867 = fma(_3821, _3857, _3831);
    int _3869 = _3827 ^ _3863;
    float _3871 = -_2275;
    float _3873 = _2127 + _3871;
    int _3875 = ~_3853;
    int _3877 = _3875 + _3865;
    int _3879 = _3877 + 1;
    float _3881 = _3837 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3883 = ~_3863;
    int _3885 = _3883 + _3869;
    int _3887 = _3885 + 1;
    float _3889 = _2443 * _2597;
    float _3891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3893 = !_3763;
    int _3895 = _3893 ? _3879 : (-1);
    float _3897 = fma(_1939, _3881, -0.5);
    float _3899 = _2443 * _2601;
    float _3901 = _2443 * _2637;
    float _3903 = float(_3895);
    float _3905 = _3889 + _3579;
    bool _3907 = !_3795;
    int _3909 = _3907 ? _3887 : (-1);
    float _3911 = _3899 + _3597;
    float _3913 = -_2091;
    float _3915 = _3913 + _3717;
    float _3917 = -_3745;
    float _3919 = fma(_3881, _3903, _3917);
    float _3921 = -_2069;
    float _3923 = _3921 + _3719;
    float _3925 = _3901 + _3601;
    float _3927 = float(_3909);
    float _3929 = -_2127;
    float _3931 = _3929 + _3721;
    float _3933 = _3923 * _3923;
    float _3935 = _3891 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3937 = fma(_3761, _3897, _3919);
    float _3939 = fma(_2601, _2455, _3603);
    float _3941 = fma(_3915, _3915, _3933);
    float _3943 = fma(_2001, _3935, -0.5);
    float _3945 = -_3749;
    float _3947 = fma(_3935, _3927, _3945);
    float _3949 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3013);
    float _3951 = fma(_3931, _3931, _3941);
    float _3953 = _3859 + 0.5;
    float _3955 = _3937 + 0.5;
    float _3957 = fma(_3949, _3841, _3867);
    float _3959 = fma(_3765, _3943, _3947);
    float _3961 = sqrt(_3951);
    out.m_85.x = _3905;
    out.m_85.y = _3911;
    out.m_85.z = _3925;
    float _3963 = _3957 + 0.5;
    float _3965 = _3959 + 0.5;
    float _3967 = -_2287;
    float _3969 = _3967 + _3717;
    out.m_87.x = _3855;
    out.m_87.y = _3939;
    out.m_87.z = _3793;
    float _3971 = -_2273;
    float _3973 = _3971 + _3719;
    float _3975 = -_2273;
    float _3977 = _2069 + _3975;
    out.m_89.x = _3953;
    out.m_89.y = _3955;
    out.m_89.z = _3963;
    out.m_89.w = _3965;
    bool _3979 = _3961 > 0.0;
    float _3981 = -_2275;
    float _3983 = _3981 + _3721;
    float _3985 = _3911;
    float _3987 = _3905;
    float _3989 = _3923;
    if (!_3979)
    {
        _2465 = _3969;
    }
    float _3991 = _2465;
    float _3993 = _3991;
    float _3995 = _3991;
    if (!_3979)
    {
        _3661 = _3973;
    }
    float _3997 = _3661;
    float _3999 = _3997;
    float _4001 = _3997;
    if (!_3979)
    {
        _3663 = _3983;
    }
    float _4003 = _3663;
    bool _4005 = !_3979;
    float _4007 = _4003;
    float _4009 = _4003;
    if (!_4005)
    {
        bool _4011 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4013 = _3627;
        if (_4011)
        {
            float _4015 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4013 = _4015;
        }
        float _4017 = _4013;
        float _4019 = _4017;
        if (_4011)
        {
            float _4021 = _602 * _4017;
            _3985 = _4021;
        }
        float _4023 = _3985;
        float _4025 = _4023;
        if (_4011)
        {
            float _4027 = _604 * _4017;
            _3987 = _4027;
        }
        float _4029 = _3987;
        float _4031 = _4029;
        if (_4011)
        {
            float _4033 = _606 * _4017;
            _4019 = _4033;
        }
        float _4035 = _4019;
        float _4037 = _4035;
        if (!_4011)
        {
            bool _4039 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4041 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4043 = _4039 || _4041;
            bool _4045 = isnan(1.0);
            bool _4047 = _4043 || _4045;
            float _4049 = _144 + 1.0;
            if (!_4047)
            {
                float _4051 = _4049 * _4049;
                float _4053 = _4051 * 0.5;
                _166 = _4053;
            }
            float _4055 = _166;
            float _4057 = _4055;
            if (!_4047)
            {
                float _4059 = _4055 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4057 = _4059;
            }
            float _4061 = _4057;
            bool _4063 = !_4047;
            float _4065 = _4061;
            if (!_4063)
            {
                float _4067 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4069 = log2(_4067);
                float _4071 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4073 = _4071 + 1.0;
                float _4075 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4077 = _4069 * _4049;
                float _4079 = 1.0 / _4073;
                float _4081 = _4075 * 0.693147182464599609375;
                float _4083 = exp2(_4077);
                float _4085 = 1.0 / _4081;
                float _4087 = _4083 + (-1.0);
                float _4089 = -_4087;
                float _4091 = fma(_4089, _4085, _4049);
                float _4093 = _4091 * _4079;
                float _4095 = _4093 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4065 = _4095;
            }
            float _4097 = _4065;
            float _4099 = _4097 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _4101 = _4097 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4103 = _4097 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4105 = _4097;
            if (!_4047)
            {
                _4105 = _4049;
            }
            float _4107 = _4105;
            float _4109 = _4099 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _4111 = _4099 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _4113 = _4099 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _4115 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[8].y, _4109);
            float _4117 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[8].x, _4111);
            float _4119 = fma(_4103, (*spvDescriptorSet0.vp_c10)._m0[10].y, _4115);
            bool _4121 = !_4047;
            float _4123 = _4107;
            if (!_4121)
            {
                float _4125 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4127 = log2(_4125);
                float _4129 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4131 = _4129 + 1.0;
                float _4133 = 1.0 / _4131;
                float _4135 = _4127 * _4049;
                float _4137 = exp2(_4135);
                float _4139 = -_4137;
                float _4141 = _4139 + 1.0;
                float _4143 = _4141 * _4133;
                _4123 = _4143;
                _202 = _4133;
            }
            float _4145 = _4123;
            float _4147 = _202;
            float _4149 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[8].z, _4113);
            float _4151 = fma(_4145, _314, _4119);
            float _4153 = fma(_4103, (*spvDescriptorSet0.vp_c10)._m0[10].x, _4117);
            float _4155 = fma(_4103, (*spvDescriptorSet0.vp_c10)._m0[10].z, _4149);
            float _4157 = -_540;
            float _4159 = _4157 + _4151;
            float _4161 = fma(_4145, _312, _4153);
            float _4163 = fma(_4145, _316, _4155);
            float _4165 = _4159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4167 = _4159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4169 = -_544;
            float _4171 = _4169 + _4161;
            float _4173 = _4159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4175 = -_546;
            float _4177 = _4175 + _4163;
            float _4179 = fma(_4171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4165);
            float _4181 = fma(_4171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4167);
            float _4183 = fma(_4171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4173);
            float _4185 = fma(_4177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4179);
            float _4187 = fma(_4177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4181);
            float _4189 = fma(_4177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4183);
            _616 = _4187;
            _618 = _4185;
            _620 = _4189;
            _4025 = _4185;
            _4031 = _4187;
            _4037 = _4189;
            _3993 = _4155;
            _3999 = _4183;
            _4007 = _4153;
            _390 = _4181;
            _204 = _4147;
        }
        float _4191 = _616;
        float _4193 = _618;
        float _4195 = _620;
        float _4197 = _4025;
        float _4199 = _4031;
        float _4201 = _4037;
        float _4203 = _3993;
        float _4205 = _3999;
        float _4207 = _4007;
        float _4209 = _390;
        float _4211 = _204;
        float _4213 = _4191 * _4191;
        float _4215 = rsqrt(_3951);
        float _4217 = fma(_4193, _4193, _4213);
        float _4219 = fma(_4195, _4195, _4217);
        float _4221 = sqrt(_4219);
        float _4223 = _3915 * _4215;
        float _4225 = _3923 * _4215;
        float _4227 = _3931 * _4215;
        bool _4229 = _4221 > 0.0;
        float _4231 = _4203;
        float _4233 = _4205;
        float _4235 = _4207;
        _392 = _4209;
        _3989 = _4225;
        _622 = _4191;
        _206 = _4211;
        if (!_4229)
        {
            _4231 = _3969;
        }
        float _4237 = _4231;
        _3995 = _4237;
        if (!_4229)
        {
            _4233 = _3973;
        }
        float _4239 = _4233;
        _4001 = _4239;
        if (!_4229)
        {
            _4235 = _3983;
        }
        float _4241 = _4235;
        bool _4243 = !_4229;
        _4009 = _4241;
        if (!_4243)
        {
            float _4245 = rsqrt(_4219);
            float _4247 = _4245 * _4191;
            float _4249 = _4245 * _4193;
            float _4251 = _4245 * _4195;
            float _4253 = _4225 * _4247;
            float _4255 = fma(_4223, _4249, _4253);
            float _4257 = fma(_4227, _4251, _4255);
            float _4259 = _4257 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4261 = fma(_4197, _4259, _3969);
            float _4263 = fma(_4199, _4259, _3973);
            float _4265 = fma(_4201, _4259, _3983);
            _3995 = _4261;
            _4001 = _4263;
            _4009 = _4265;
            _392 = _4253;
        }
    }
    float _4267 = _3995;
    float _4269 = _4001;
    float _4271 = _4009;
    float _4273 = _392;
    float _4275 = _3989;
    float _4277 = _622;
    float _4279 = _206;
    float _4281 = _3977 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4283 = fma(_3811, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4281);
    float _4285 = _3977 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4287 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4289 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4291 = _4287 || _4289;
    bool _4293 = isnan(0.5);
    bool _4295 = _4291 || _4293;
    float _4297 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4283);
    float _4299 = fma(_3811, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4285);
    float _4301 = _4297 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4303 = fma(_3873, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4299);
    bool _4305 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4307 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4309 = _4305 || _4307;
    bool _4311 = isnan(0.5);
    bool _4313 = _4309 || _4311;
    float _4315 = 1.0 / _4301;
    float _4317 = _4303 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4319 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4321 = _4317;
    float _4323 = _4273;
    float _4325 = _4297;
    float _4327 = _4275;
    float _4329 = _4277;
    float _4331 = _4279;
    if (_4295)
    {
        _4319 = _4267;
    }
    float _4333 = _4319;
    float _4335 = _4317 + _4301;
    float _4337 = _4333;
    if (_4295)
    {
        _4321 = _4269;
    }
    float _4339 = _4321;
    float _4341 = _4339;
    if (_4295)
    {
        _4323 = _4271;
    }
    float _4343 = _4323;
    float _4345 = _4343;
    if (!_4295)
    {
        float _4347 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4349 = _3977 + _4347;
        float _4351 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4353 = _3811 + _4351;
        float _4355 = -_3811;
        float _4357 = _4355 + _4267;
        float _4359 = -_3977;
        float _4361 = _4359 + _4269;
        float _4363 = _4349 * _4349;
        float _4365 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4367 = _3873 + _4365;
        float _4369 = -_3873;
        float _4371 = _4369 + _4271;
        float _4373 = fma(_4353, _4353, _4363);
        float _4375 = fma(_4367, _4367, _4373);
        float _4377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4379 = sqrt(_4375);
        float _4381 = precise::min(_4379, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4383 = _4381 * _4377;
        float _4385 = fma(_4357, _4383, _3811);
        float _4387 = fma(_4361, _4383, _3977);
        float _4389 = fma(_4371, _4383, _3873);
        _4341 = _4387;
        _4337 = _4385;
        _4345 = _4389;
        _4325 = _4379;
    }
    float _4391 = _4341;
    float _4393 = _4337;
    float _4395 = _4345;
    float _4397 = _4325;
    float _4399 = _4397;
    if (_4313)
    {
        _4399 = 1.0;
    }
    float _4401 = _4399;
    float _4403 = _4335 * _4315;
    float _4405 = _4403 * 0.5;
    float _4407 = _4401;
    float _4409 = _4405;
    if (!_4313)
    {
        float _4411 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4413 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4415 = fma(_4405, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4413);
        float _4417 = _4411 * 0.15915493667125701904296875;
        float _4419 = _4417 * 6.283185482025146484375;
        float _4421 = cos(_4419);
        float _4423 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4425 = _4423 * 0.15915493667125701904296875;
        float _4427 = _4417 * 6.283185482025146484375;
        float _4429 = sin(_4427);
        float _4431 = 1.0 / _4421;
        float _4433 = _4425 * 6.283185482025146484375;
        float _4435 = cos(_4433);
        float _4437 = _4429 * _4431;
        float _4439 = 1.0 / _4415;
        float _4441 = _4435 * _4437;
        float _4443 = _4425 * 6.283185482025146484375;
        float _4445 = sin(_4443);
        float _4447 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4449 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4447;
        float _4451 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4453 = _4439 * _4451;
        float _4455 = 1.0 / _4441;
        float _4457 = 1.0 / _4449;
        float _4459 = _4445 * _4455;
        float _4461 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4463 = fma(_4459, _4453, _4461);
        float _4465 = _4463 * _4457;
        float _4467 = precise::clamp(_4465, 0.0, 1.0);
        _4407 = _4467;
    }
    float _4469 = _4407;
    float _4471 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4473 = _4391 + _4471;
    float _4475 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4477 = _4393 + _4475;
    float _4479 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4481 = _4395 + _4479;
    float _4483 = _4473 * _4473;
    float _4485 = fma(_4477, _4477, _4483);
    float _4487 = fma(_4481, _4481, _4485);
    float _4489 = rsqrt(_4487);
    float _4491 = sqrt(_4487);
    float _4493 = _4489 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4495 = _4477 * _4493;
    float _4497 = _4481 * _4493;
    float _4499 = _4495 * _4495;
    float _4501 = _4497 * _4497;
    float _4503 = _4499 + _4501;
    float _4505 = sqrt(_4503);
    bool _4507 = _4505 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4509 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4511 = _4505 + _4509;
    float _4513 = _4489;
    float _4515 = _4503;
    float _4517 = _4511;
    float _4519 = _4473;
    if (_4507)
    {
        float _4521 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4513 = _4521;
    }
    float _4523 = _4513;
    if (_4507)
    {
        float _4525 = rsqrt(_4503);
        _4515 = _4525;
    }
    float _4527 = _4515;
    if (_4507)
    {
        float _4529 = _4511 * _4523;
        _4517 = _4529;
    }
    float _4531 = _4517;
    if (_4507)
    {
        float _4533 = _4531 * 0.15915493667125701904296875;
        _4327 = _4533;
    }
    float _4535 = _4327;
    float _4537 = _4481;
    if (_4507)
    {
        float _4539 = _4535 * 6.283185482025146484375;
        float _4541 = sin(_4539);
        _4537 = _4541;
    }
    float _4543 = _4537;
    float _4545 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4547 = precise::max(0.0, _4545);
    float _4549 = _4523;
    float _4551 = _4547;
    if (_4507)
    {
        float _4553 = _4535 * 6.283185482025146484375;
        float _4555 = cos(_4553);
        _4549 = _4555;
    }
    float _4557 = _4549;
    float _4559 = -_4493;
    float _4561 = -_4547;
    float _4563 = fma(_4473, _4559, _4561);
    if (_4507)
    {
        float _4565 = _4563 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4519 = _4565;
    }
    float _4567 = _4519;
    float _4569 = _4543;
    float _4571 = _4567;
    if (_4507)
    {
        float _4573 = fma(_4543, _4567, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4409 = _4573;
    }
    float _4575 = _4409;
    float _4577 = _4575;
    if (!_4507)
    {
        _4569 = _4495;
    }
    float _4579 = _4569;
    float _4581 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4583 = fma(_4491, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4581);
    float _4585 = precise::clamp(_4583, 0.0, 1.0);
    float _4587 = _4579;
    if (!_4507)
    {
        _4571 = _4563;
    }
    float _4589 = _4571;
    float _4591 = _4589;
    float _4593 = _4557;
    if (_4507)
    {
        float _4595 = _4557 + (-1.0);
        _4551 = _4595;
    }
    float _4597 = _4551;
    float _4599 = _4597;
    if (_4507)
    {
        float _4601 = _4527 * _4575;
        _4329 = _4601;
    }
    float _4603 = _4329;
    if (!_4507)
    {
        _4577 = _4499;
    }
    float _4605 = _4577;
    float _4607 = _4391 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4609 = _4605;
    if (_4507)
    {
        float _4611 = _4597 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4331 = _4611;
    }
    float _4613 = _4331;
    if (_4507)
    {
        float _4615 = _4495 * _4603;
        _4587 = _4615;
    }
    float _4617 = _4587;
    if (!_4507)
    {
        _4599 = _4497;
    }
    float _4619 = _4599;
    float _4621 = _4619;
    if (_4507)
    {
        float _4623 = _4497 * _4603;
        _4621 = _4623;
    }
    float _4625 = _4621;
    if (_4507)
    {
        float _4627 = fma(_4563, _4557, _4613);
        _4591 = _4627;
    }
    float _4629 = _4591;
    if (_4507)
    {
        float _4631 = _4617 * _4617;
        _4609 = _4631;
    }
    float _4633 = _4609;
    if (!_4507)
    {
        _4593 = _4501;
    }
    float _4635 = _4593;
    float _4637 = _4635;
    if (_4507)
    {
        float _4639 = _4625 * _4625;
        _4637 = _4639;
    }
    float _4641 = _4637;
    float _4643 = -_4585;
    float _4645 = _4643 + 1.0;
    float _4647 = fma(_4629, _4629, _4633);
    float _4649 = _4391 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4651 = _4647 + _4641;
    float _4653 = fma(_4393, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4607);
    float _4655 = _4391 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4657 = abs(_4645);
    float _4659 = log2(_4657);
    float _4661 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4663 = fma(_4395, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4653);
    float _4665 = _4391 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4667 = fma(_4393, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4655);
    float _4669 = fma(_4393, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4649);
    float _4671 = _4663 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4673 = fma(_4393, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4665);
    float _4675 = rsqrt(_4651);
    float _4677 = fma(_4395, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4667);
    float _4679 = fma(_4395, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4669);
    float _4681 = fma(_4395, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4673);
    float _4683 = _4677 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4685 = _4679 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4687 = _4681 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4689 = _4659 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4691 = _4671 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4693 = -_4691;
    float _4695 = fma(_4693, _4661, 1.0);
    float _4697 = _4683 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4699 = exp2(_4689);
    float _4701 = _4675 * _4617;
    float _4703 = _4675 * _4629;
    float _4705 = fma(_4687, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4697);
    float _4707 = _4675 * _4625;
    float _4709 = _4701 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4711 = fma(_4671, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4705);
    float _4713 = log2(_4695);
    float _4715 = -_4709;
    float _4717 = fma(_4703, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4715);
    float _4719 = _4683 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4721 = fma(_4685, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4711);
    float _4723 = -_4707;
    float _4725 = fma(_4723, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4717);
    float _4727 = _4683 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4729 = fma(_4687, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4719);
    float _4731 = 1.0 / _4721;
    float _4733 = fma(_4725, -0.5, 0.5);
    float _4735 = fma(_4687, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4727);
    float _4737 = fma(_4725, 0.5, 0.5);
    float _4739 = _4703 + 1.0;
    float _4741 = fma(_4671, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4729);
    float _4743 = fma(_4671, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4735);
    float _4745 = fma(_4737, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4747 = sqrt(_4733);
    float _4749 = -_4703;
    float _4751 = fma(_4699, _4739, _4749);
    float _4753 = fma(_4685, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4743);
    float _4755 = fma(_4685, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4741);
    float _4757 = fma(_4737, _4745, -0.212114393711090087890625);
    float _4759 = _4713 * 0.693147182464599609375;
    float _4761 = fma(_4751, 0.5, 0.5);
    float _4763 = _4753 * _4731;
    float _4765 = _4755 * _4731;
    float _4767 = fma(_4737, _4757, 1.570728778839111328125);
    float _4769 = _4759 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4771 = fma(_4763, 0.5, 0.5);
    float _4773 = fma(_4765, -0.5, 0.5);
    float _4775 = _4747 * 0.636619746685028076171875;
    float3 _12288 = float3(_4771, _4773, _4769);
    float _4777 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12288, float3(0.0), isnan(_12288)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12288, float3(0.0), isnan(_12288)), level(0.0)).x;
    float3 _12299 = float3(_4771, _4773, _4769);
    float4 _4780 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12299, float3(0.0), isnan(_12299)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12299, float3(0.0), isnan(_12299)), level(0.0)).xyzw;
    float _4782 = _4780.x;
    float _4784 = _4780.y;
    float _4786 = _4780.z;
    float _4788 = _4780.w;
    float _4790 = -_4767;
    float _4792 = fma(_4775, _4790, 1.0);
    float2 _12321 = float2(_4792, _4761);
    float3 _4796 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12321, float2(0.0), isnan(_12321)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12321, float2(0.0), isnan(_12321)), level(0.0)).xyz;
    float _4798 = _4796.x;
    float _4800 = _4796.y;
    float _4802 = _4796.z;
    float _4804 = _4659 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4806 = _4683 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_91.x = _3811;
    out.m_91.y = _3977;
    out.m_91.z = _3873;
    bool _4808 = _4491 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4810 = isnan(_4491);
    bool _4812 = _4808 || _4810;
    bool _4814 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4816 = _4812 || _4814;
    float _4818 = fma(_4687, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4806);
    float _4820 = exp2(_4804);
    float _4822 = _4753 + _4721;
    out.m_93.x = _4393;
    out.m_93.y = _4391;
    out.m_93.z = _4395;
    float _4824 = fma(_4671, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4818);
    float _4826 = _4721 * 0.5;
    float _4828 = _4822 * 0.5;
    float _4830 = fma(_4685, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4824);
    float _4832 = fma(_4755, -0.5, _4826);
    float _4834 = _4830 + _4721;
    out.gl_Position.x = _4753;
    out.gl_Position.y = _4755;
    out.gl_Position.z = _4830;
    out.gl_Position.w = _4721;
    float _4836 = _4834 * 0.5;
    float _4838 = -_4820;
    float _4840 = _4838 + 1.0;
    float _4842 = _4840 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_95.x = _4828;
    out.m_95.y = _4832;
    out.m_95.z = _4836;
    out.m_95.w = _4721;
    float _4844 = -_4842;
    float _4846 = _4844 + 1.0;
    float _4848 = _4830;
    float _4850 = _4755;
    float _4852 = _4753;
    if (!_4816)
    {
        _4848 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4854 = _4848;
    float _4856 = _4854;
    float _4858 = _4854;
    if (!_4816)
    {
        _4850 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4860 = _4850;
    float _4862 = _4860;
    float _4864 = _4860;
    if (!_4816)
    {
        _4852 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4866 = _4852;
    float _4868 = _4842 * _4777;
    float _4870 = _4788 * _4846;
    float _4872 = _4469 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4874 = _4788 * _4868;
    float _4876 = _4802 * _4868;
    float _4878 = fma(_4798, _4874, _4782);
    float _4880 = fma(_4800, _4874, _4784);
    float _4882 = fma(_4788, _4876, _4786);
    out.m_97.x = _4878;
    out.m_97.y = _4880;
    out.m_97.z = _4882;
    out.m_97.w = _4870;
    bool _4884 = !_4816;
    float _4886 = _4866;
    float _4888 = _4866;
    if (!_4884)
    {
        bool _4890 = _4491 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4892 = isnan(_4491);
        bool _4894 = _4890 || _4892;
        bool _4896 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4898 = _4894 || _4896;
        if (!_4898)
        {
            float _4900 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4902 = _4491 + _4900;
            float _4904 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4906 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4904;
            float _4908 = 1.0 / _4906;
            float _4910 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4912 = _4910 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4914 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4916 = _4914 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4918 = _4902 * _4908;
            float _4920 = precise::clamp(_4918, 0.0, 1.0);
            float _4922 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4924 = _4922 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4926 = fma(_4920, _4916, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4928 = fma(_4920, _4924, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4930 = fma(_4920, _4912, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4864 = _4930;
            _4858 = _4928;
            _4888 = _4926;
            _4932 = true;
        }
        else
        {
            bool _4934 = _4491 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4936 = isnan(_4491);
            bool _4938 = _4934 || _4936;
            bool _4940 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4942 = _4938 || _4940;
            if (!_4942)
            {
                _4856 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4944 = _4856;
            _4858 = _4944;
            if (!_4942)
            {
                _4862 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4946 = _4862;
            _4864 = _4946;
            if (!_4942)
            {
                _4886 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4948 = _4886;
            bool _4950 = !_4942;
            _4888 = _4948;
            if (!_4950)
            {
                bool _4952 = _4491 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4954 = isnan(_4491);
                bool _4956 = _4952 || _4954;
                bool _4958 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4960 = _4956 || _4958;
                if (!_4960)
                {
                    float _4962 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4964 = _4491 + _4962;
                    float _4966 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4968 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4966;
                    float _4970 = 1.0 / _4968;
                    float _4972 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4974 = _4972 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4976 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4978 = _4976 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4980 = _4964 * _4970;
                    float _4982 = precise::clamp(_4980, 0.0, 1.0);
                    float _4984 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4986 = _4984 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4988 = fma(_4982, _4978, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4990 = fma(_4982, _4986, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4992 = fma(_4982, _4974, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4864 = _4992;
                    _4858 = _4990;
                    _4888 = _4988;
                    _4932 = true;
                }
                else
                {
                    _4864 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4858 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4888 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4932 = false;
    float _4994 = _4864;
    float _4996 = _4858;
    float _4998 = _4888;
    float _5000 = _4872 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_99.x = 0.0;
    float _5002 = _4994 * 0.586610972881317138671875;
    bool _5004 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _5000;
    float _5006 = fma(_4996, 0.298911988735198974609375, _5002);
    bool _5008 = _4469 > 0.0;
    bool _5010 = isnan(_4469);
    bool _5012 = _5008 || _5010;
    bool _5014 = isnan(0.0);
    bool _5016 = _5012 || _5014;
    float _5018 = fma(_4998, 0.114477999508380889892578125, _5006);
    float _5020 = -_5018;
    float _5022 = _5020 + _4996;
    float _5024 = -_5018;
    float _5026 = _5024 + _4994;
    float _5028 = -_5018;
    float _5030 = _5028 + _4998;
    float _5032 = fma(_5022, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5018);
    float _5034 = fma(_5026, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5018);
    float _5036 = fma(_5030, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5018);
    bool _5038 = !_5004;
    if (!_5038)
    {
        float _5040 = -_4391;
        float _5042 = _5040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5044 = -_4393;
        float _5046 = _5044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5048 = -_4395;
        float _5050 = _5048 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5052 = _5042 * _5042;
        float _5054 = fma(_5046, _5046, _5052);
        float _5056 = fma(_5050, _5050, _5054);
        float _5058 = sqrt(_5056);
        float _5060 = rsqrt(_5056);
        float _5062 = -_5058;
        float _5064 = _5062 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5066 = _5064 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5068 = precise::clamp(_5066, 0.0, 1.0);
        float _5070 = _5046 * _5060;
        float _5072 = _5042 * _5060;
        float _5074 = abs(_5068);
        float _5076 = log2(_5074);
        float _5078 = _5050 * _5060;
        float _5080 = _5070 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5082 = _3939 * _5072;
        float _5084 = -_5072;
        float _5086 = -_5080;
        float _5088 = fma(_5084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5086);
        float _5090 = fma(_3855, _5070, _5082);
        float _5092 = -_5078;
        float _5094 = fma(_5092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5088);
        float _5096 = fma(_3793, _5078, _5090);
        float _5098 = precise::clamp(_5096, 0.0, 1.0);
        float _5100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5102 = _5094 + _5100;
        float _5104 = _5076 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5106 = _5102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5108 = precise::clamp(_5106, 0.0, 1.0);
        float _5110 = exp2(_5104);
        float _5112 = _5110 * _5108;
        float _5114 = _5098 * _5112;
        float _5116 = _5114 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5118 = _5114 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5120 = _5114 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _5116;
        out.m_99.y = _5118;
        out.m_99.z = _5120;
    }
    out.m_71.x = _5032;
    out.m_71.y = _5034;
    out.m_71.z = _5036;
    if (_5016)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _5122 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5122;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

