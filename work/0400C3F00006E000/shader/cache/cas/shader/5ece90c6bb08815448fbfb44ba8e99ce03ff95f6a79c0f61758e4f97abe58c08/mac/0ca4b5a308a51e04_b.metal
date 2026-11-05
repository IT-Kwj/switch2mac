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
    bool _4856 = false;
    bool _1224 = false;
    bool _1014 = false;
    bool _908 = false;
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
        float _5102 = as_type<float>(_132);
        out.gl_Position.z = _5102;
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
        float _5174 = as_type<float>(_172);
        out.gl_Position.z = _5174;
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
    bool _816 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _818 = isnan(_814);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _824 = _820 || _822;
    float _826 = float(_824);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _832 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _834 = isnan(_814);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _844;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _850 = _814 + _848;
    float _852 = 1.0 / _830;
    float _854 = -_826;
    float _856 = _854 + 1.0;
    bool _858 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _860 = _842 * _856;
    float _862 = -_842;
    float _864 = _862 + 1.0;
    float _866 = _846 * _852;
    float _868 = fma(_866, _850, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _870 = _868 * _860;
    float _872 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[115].x, _870);
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _880 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[116].x, _872);
    float _882 = _874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _884 = _876 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _886 = _878 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _888 = _880 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _882;
    out.m_61.y = _884;
    out.m_61.z = _886;
    out.m_61.w = _888;
    bool _890 = !_858;
    float _906;
    if (!_890)
    {
        float _892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _894 = _174 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[11].z, _144);
        float _898 = _896 * _892;
        float _900 = floor(_898);
        float _902 = -_900;
        float _904 = _898 + _902;
        _906 = _904;
        _908 = true;
    }
    else
    {
        _906 = _156;
    }
    _908 = false;
    float _910 = _906;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _914 = _910 + _912;
    bool _916 = _910 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _918 = isnan(_910);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _924 = _920 || _922;
    float _926 = float(_924);
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _928;
    bool _932 = _910 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _934 = isnan(_910);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = 1.0 / _930;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _946;
    bool _950 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _952;
    float _956 = _914 * _944;
    float _958 = -_926;
    float _960 = _958 + 1.0;
    float _962 = fma(_948, _956, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _964 = fma(_954, _956, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _966;
    float _970 = _942 * _960;
    float _972 = -_942;
    float _974 = _972 + 1.0;
    float _976 = fma(_968, _956, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _978 = _962 * _970;
    float _980 = _976 * _970;
    float _982 = _964 * _970;
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].x, _978);
    float _986 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].y, _980);
    float _988 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].z, _982);
    float _990 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[124].x, _984);
    float _992 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[124].y, _986);
    float _994 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[124].z, _988);
    bool _996 = !_950;
    float _1012;
    if (!_996)
    {
        float _998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1000 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _1004 = _1002 * _998;
        float _1006 = floor(_1004);
        float _1008 = -_1006;
        float _1010 = _1004 + _1008;
        _1012 = _1010;
        _1014 = true;
    }
    else
    {
        _1012 = _156;
    }
    _1014 = false;
    float _1016 = _1012;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1022;
    bool _1026 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1028 = isnan(_1016);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1034 = _1030 || _1032;
    float _1036 = float(_1034);
    float _1038 = 1.0 / _1020;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1048 = -_1036;
    float _1050 = _1048 + 1.0;
    bool _1052 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1054 = isnan(_1016);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = 1.0 / _1042;
    bool _1066 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1068 = isnan(_1016);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    bool _1078 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1080 = _1076 * _1050;
    float _1082 = -_1076;
    float _1084 = _1082 + 1.0;
    float _1086 = _1024 * _1038;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1090 = _1016 + _1088;
    float _1092 = 1.0 / _1046;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1098 = _1062 * _1084;
    float _1100 = fma(_1086, _1090, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1106 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1108 = isnan(_1016);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1118;
    float _1122 = _1096 * _1064;
    float _1124 = 1.0 / _1104;
    float _1126 = _1100 * _1098;
    float _1128 = -_1116;
    float _1130 = _1128 + 1.0;
    float _1132 = -_1062;
    float _1134 = _1132 + 1.0;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1140 = _1036 * _1130;
    bool _1142 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1144 = isnan(_1016);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = _1120 * _1092;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1158 = _1016 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1162 = _1016 + _1160;
    float _1164 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1126);
    float _1166 = -_1152;
    float _1168 = _1166 + 1.0;
    float _1170 = fma(_1122, _1158, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1172 = fma(_1154, _1162, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1176 = _1016 + _1174;
    float _1178 = _1138 * _1124;
    float _1180 = fma(_1170, _1080, _1164);
    float _1182 = _1116 * _1168;
    float _1184 = _992 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1186 = fma(_1178, _1176, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1188 = fma(_1172, _1140, _1180);
    float _1190 = _990 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1192 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1194 = fma(_1186, _1182, _1188);
    float _1196 = _994 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1198 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1194);
    float _1202 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1204 = _1200 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _1198;
    out.m_63.y = _1192;
    out.m_63.z = _1202;
    out.m_63.w = _1204;
    bool _1206 = !_1078;
    float _1222;
    if (!_1206)
    {
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1210 = _174 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _1214 = _1212 * _1208;
        float _1216 = floor(_1214);
        float _1218 = -_1216;
        float _1220 = _1214 + _1218;
        _1222 = _1220;
        _1224 = true;
    }
    else
    {
        _1222 = _156;
    }
    _1224 = false;
    float _1226 = _1222;
    float _1228 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1230 = int(_1228);
    float _1232 = in.m_53.y;
    float _1234 = _600 * _788;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1238 = _1236 != 0;
    float _1240 = in.m_53.z;
    float _1242 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1244 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1246 = int(_1244);
    float _1248 = in.m_65.w;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1252 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1254 = int(_1252);
    float _1256 = float(_1230);
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1262 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1258);
    float _1264 = 1.0 / _1256;
    float _1266 = float(uint(_1246));
    float _1268 = float(_1246);
    float _1270 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1272 = _1246 == 0;
    float _1274 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _1276 = _1246 + (-1);
    float _1278 = 1.0 / _1266;
    float _1280 = float(_1254);
    out.m_67.w = _1248;
    float _1282 = _144 * _1264;
    float _1284 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1286 = int(_1284);
    int _1288 = ~_1246;
    int _1290 = _1288 + 1;
    float _1292 = -_1270;
    float _1294 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1292);
    float _1296 = -_1274;
    float _1298 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1296);
    int _1300 = as_type<int>(_1278) + (-2);
    float _1302 = trunc(_1282);
    int _1304 = int(_1302);
    float _1306 = 1.0 / _1280;
    float _1308 = float(uint(_1286));
    int _1310 = ~_1286;
    int _1312 = _1310 + 1;
    float _1314 = float(uint(_1304));
    float _1316 = 1.0 / _1308;
    float _1318 = as_type<float>(_1300) * _1314;
    float _1320 = _144 * _1306;
    float _1322 = trunc(_1318);
    float _1324 = precise::max(_1322, 0.0);
    uint _1327 = uint(_1324);
    float _1329 = trunc(_1320);
    int _1331 = int(_1329);
    int _1333 = ~_1246;
    int _1335 = _1333 + 1;
    int _1337 = _1290 * int(_1327);
    int _1339 = _1337 + _1304;
    float _1341 = float(uint(_1339));
    float _1343 = float(uint(_1331));
    float _1345 = as_type<float>(_1300) * _1341;
    float _1347 = _1341;
    float _1349 = _1240;
    if (_1238)
    {
        _1347 = 1.0;
    }
    float _1351 = _1347;
    float _1353 = _1351;
    if (!_1238)
    {
        _1353 = 7.345489978790283203125;
    }
    float _1355 = _1353;
    float _1357 = trunc(_1345);
    float _1359 = precise::max(_1357, 0.0);
    uint _1361 = uint(_1359);
    float _1363 = _1355 * _174;
    int _1365 = as_type<int>(_1316) + (-2);
    float _1367 = floor(_1363);
    float _1369 = as_type<float>(_1365) * _1343;
    int _1371 = int(_1327) + int(_1361);
    float _1373 = trunc(_1369);
    float _1375 = precise::max(_1373, 0.0);
    uint _1377 = uint(_1375);
    float _1379 = float(_1304);
    int _1381 = _1335 * _1371;
    int _1383 = _1381 + _1304;
    int _1385 = ~_1286;
    int _1387 = _1385 + 1;
    bool _1389 = _1379 >= _1268;
    bool _1391 = isnan(_1379);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan(_1268);
    bool _1397 = _1393 || _1395;
    float _1399 = float(_1397);
    float _1401 = -_1367;
    float _1403 = _1363 + _1401;
    bool _1405 = uint(_1383) >= uint(_1246);
    bool _1407 = !_1405;
    int _1409 = _1407 ? 0 : (-1);
    float _1411 = trunc(_1399);
    int _1413 = int(_1411);
    int _1415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1417 = _1415 != 0;
    int _1419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1421 = _1419 != 0;
    int _1423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1425 = _1423 != 0;
    int _1427 = ~_1371;
    int _1429 = _1427 + _1409;
    int _1431 = _1429 + 1;
    float _1433 = _1403 * _1268;
    int _1435 = _1387 * int(_1377);
    int _1437 = _1435 + _1331;
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1441 = _1439 != 0;
    float _1443 = _156 * _1268;
    int _1445 = _1246 * _1431;
    int _1447 = _1445 + _1304;
    float _1449 = trunc(_1433);
    int _1451 = int(_1449);
    float _1453 = float(uint(_1437));
    bool _1455 = !_1441;
    int _1457 = _1455 ? 0 : 1;
    bool _1459 = !_1272;
    float _1461 = _1459 ? as_type<float>(_1447) : as_type<float>(0xffffffffu /* nan */);
    float _1463 = as_type<float>(_1365) * _1453;
    int _1465 = ~_1413;
    int _1467 = _1465 + 1;
    int _1469 = _1467 + 1;
    float _1471 = trunc(_1443);
    int _1473 = int(_1471);
    bool _1475 = !_1417;
    int _1477 = _1475 ? 0 : 1;
    int _1479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1481 = _1479 != 0;
    int _1483 = as_type<int>(_1461) * _1469;
    bool _1485 = !_1421;
    int _1487 = _1485 ? 0 : 1;
    int _1489 = abs(_1457);
    float _1491 = trunc(_1463);
    float _1493 = precise::max(_1491, 0.0);
    uint _1495 = uint(_1493);
    int _1497 = abs(_1487);
    int _1499 = _1413 * _1276;
    int _1501 = _1499 + _1483;
    int _1503 = abs(_1477);
    int _1505 = _1451 * _1489;
    int _1507 = _1505 + _1304;
    float _1509 = as_type<float>(_1469);
    float _1511 = _1461;
    if (_1481)
    {
        _1509 = _174;
    }
    float _1513 = _1509;
    float _1515 = _1513;
    if (_1481)
    {
        _1511 = 1.0;
    }
    float _1517 = _1511;
    int _1519 = _1501 * _1497;
    float _1521 = _1517;
    if (!_1481)
    {
        _1515 = _1232;
    }
    float _1523 = _1515;
    if (!_1481)
    {
        _1521 = 1.2345600128173828125;
    }
    float _1525 = _1521;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1529 = _1527 != 0;
    float _1531 = _1523 * _1525;
    bool _1533 = !_1425;
    int _1535 = _1533 ? 0 : 1;
    bool _1537 = !_1529;
    int _1539 = _1537 ? 0 : 1;
    int _1541 = _1473 * _1503;
    int _1543 = _1541 + _1519;
    int _1545 = abs(_1535);
    float _1547 = floor(_1531);
    int _1549 = int(_1377) + int(_1495);
    int _1551 = ~_1286;
    int _1553 = _1551 + 1;
    int _1555 = _1507 * _1545;
    int _1557 = _1555 + _1543;
    int _1559 = abs(_1539);
    float _1561 = float(_1286);
    int _1563 = _1553 * _1549;
    int _1565 = _1563 + _1331;
    float _1567 = float(_1331);
    int _1569 = ~_1246;
    int _1571 = _1569 + 1;
    bool _1573 = _1567 >= _1561;
    bool _1575 = isnan(_1567);
    bool _1577 = _1573 || _1575;
    bool _1579 = isnan(_1561);
    bool _1581 = _1577 || _1579;
    float _1583 = float(_1581);
    int _1585 = _1451 * _1559;
    int _1587 = _1585 + _1557;
    bool _1589 = uint(_1565) >= uint(_1286);
    float _1591 = -_1547;
    float _1593 = _1531 + _1591;
    int _1595 = 0;
    int _1597 = _1549;
    if (_1481)
    {
        _1595 = 0;
    }
    int _1599 = _1595;
    float _1601 = trunc(_1583);
    int _1603 = int(_1601);
    float _1605 = float(uint(_1587));
    bool _1607 = !_1589;
    int _1609 = _1607 ? 0 : (-1);
    int _1611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1613 = _1611 != 0;
    int _1615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1617 = _1615 != 0;
    int _1619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1621 = _1619 != 0;
    int _1623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1625 = _1623 != 0;
    float _1627 = as_type<float>(_1300) * _1605;
    int _1629 = ~_1549;
    int _1631 = _1629 + _1609;
    int _1633 = _1631 + 1;
    bool _1635 = _1246 == 0;
    bool _1637 = !_1617;
    int _1639 = _1637 ? 0 : 1;
    int _1641 = _1286 * _1633;
    int _1643 = _1641 + _1331;
    bool _1645 = _1286 == 0;
    float _1647 = trunc(_1627);
    float _1649 = precise::max(_1647, 0.0);
    uint _1651 = uint(_1649);
    int _1653 = abs(_1639);
    int _1655 = ~_1603;
    int _1657 = _1655 + 1;
    int _1659 = _1657 + 1;
    bool _1661 = !_1645;
    int _1663 = _1661 ? _1643 : (-1);
    float _1665 = _1593 * _1561;
    float _1667 = _156 * _1561;
    bool _1669 = !_1613;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = _1663 * _1659;
    int _1675 = _1286 + (-1);
    float _1677 = trunc(_1665);
    int _1679 = int(_1677);
    int _1681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1683 = _1681 != 0;
    int _1685 = abs(_1671);
    int _1687 = _1603 * _1675;
    int _1689 = _1687 + _1673;
    bool _1691 = !_1621;
    int _1693 = _1691 ? 0 : 1;
    int _1695 = _1571 * int(_1651);
    int _1697 = _1695 + _1587;
    bool _1699 = !_1683;
    int _1701 = _1699 ? 0 : 1;
    float _1703 = trunc(_1667);
    int _1705 = int(_1703);
    bool _1707 = !_1625;
    int _1709 = _1707 ? 0 : 1;
    int _1711 = _1689 * _1653;
    float _1713 = float(uint(_1697));
    int _1715 = abs(_1701);
    int _1717 = abs(_1693);
    float _1719 = as_type<float>(_1300) * _1713;
    float _1721 = trunc(_1719);
    float _1723 = precise::max(_1721, 0.0);
    uint _1725 = uint(_1723);
    int _1727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1729 = _1727 != 0;
    int _1731 = _1679 * _1715;
    int _1733 = _1731 + _1331;
    int _1735 = abs(_1709);
    int _1737 = _1705 * _1685;
    int _1739 = _1737 + _1711;
    int _1741 = ~_1286;
    int _1743 = _1741 + 1;
    float _1745 = float(uint(_1733));
    int _1747 = _1733 * _1717;
    int _1749 = _1747 + _1739;
    int _1751 = _1599;
    int _1753 = as_type<int>(_1719);
    bool _1755 = _1683;
    float _1757 = as_type<float>(_1651);
    if (!_1481)
    {
        _1751 = 2;
    }
    int _1759 = _1751;
    int _1761 = _1679 * _1735;
    int _1763 = _1761 + _1749;
    if (_1729)
    {
        float _1765 = -_352;
        float _1767 = _1765 + 1.0;
        _1753 = as_type<int>(_1767);
    }
    int _1769 = _1753;
    if (_1729)
    {
        bool _1771 = _174 > 0.5;
        _1755 = _1771;
    }
    bool _1773 = _1755;
    float _1775 = as_type<float>(_1365) * _1745;
    int _1777 = int(_1651) + int(_1725);
    float _1779 = float(uint(_1763));
    float _1781 = trunc(_1775);
    float _1783 = precise::max(_1781, 0.0);
    uint _1785 = uint(_1783);
    if (!_1729)
    {
        _1757 = _352;
    }
    float _1787 = _1757;
    float _1789 = float(uint(_1507));
    float _1791 = as_type<float>(_1365) * _1779;
    float _1793 = _1787;
    if (_1729)
    {
        float _1795 = _1773 ? as_type<float>(_1769) : _352;
        _1793 = _1795;
    }
    float _1797 = _1793;
    float _1799 = in.m_53.w;
    int _1801 = ~_1246;
    int _1803 = _1801 + 1;
    float _1805 = as_type<float>(_1300) * _1789;
    float _1807 = trunc(_1791);
    float _1809 = precise::max(_1807, 0.0);
    uint _1811 = uint(_1809);
    int _1813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1815 = _1813 != 0;
    int _1817 = _1803 * _1777;
    int _1819 = _1817 + _1587;
    bool _1821 = _1232 > 0.5;
    float _1823 = trunc(_1805);
    float _1825 = precise::max(_1823, 0.0);
    uint _1827 = uint(_1825);
    bool _1829 = uint(_1819) >= uint(_1246);
    float _1831 = -_498;
    float _1833 = _1831 + 1.0;
    bool _1835 = !_1829;
    int _1837 = _1835 ? 0 : (-1);
    if (_1815)
    {
        float _1839 = -_352;
        float _1841 = _1839 + 1.0;
        _1597 = as_type<int>(_1841);
    }
    int _1843 = _1597;
    int _1845 = _1821 ? as_type<int>(_1833) : as_type<int>(_498);
    int _1847 = _1743 * int(_1811);
    int _1849 = _1847 + _1763;
    bool _1851 = _1240 > 0.5;
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1855 = _1853 != 0;
    float _1857 = float(uint(_1849));
    int _1859 = ~_1246;
    int _1861 = _1859 + 1;
    float _1863 = _1855 ? as_type<float>(_1845) : _498;
    float _1865 = as_type<float>(_1365) * _1857;
    float _1867 = _1857;
    if (!_1815)
    {
        _1867 = _352;
    }
    float _1869 = _1867;
    float _1871 = _1869;
    if (_1815)
    {
        float _1873 = _1851 ? as_type<float>(_1843) : _352;
        _1871 = _1873;
    }
    float _1875 = _1871;
    float _1877 = trunc(_1865);
    float _1879 = precise::max(_1877, 0.0);
    uint _1881 = uint(_1879);
    bool _1883 = _1799 > 0.5;
    int _1885 = _1861 * int(_1827);
    int _1887 = _1885 + _1507;
    int _1889 = ~_1777;
    int _1891 = _1889 + _1837;
    int _1893 = _1891 + 1;
    int _1895 = _1312 * int(_1785);
    int _1897 = _1895 + _1733;
    int _1899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1901 = _1899 != 0;
    float _1903 = float(uint(_1887));
    int _1905 = _1246 * _1893;
    int _1907 = _1905 + _1587;
    int _1909 = _1883 ? as_type<int>(_1833) : as_type<int>(_498);
    float _1911 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1915 = _1913 != 0;
    float _1917 = as_type<float>(_1300) * _1903;
    bool _1919 = !_1635;
    int _1921 = _1919 ? _1907 : (-1);
    float _1923 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1925 = _1915 ? as_type<float>(_1909) : _498;
    float _1927 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1929 = _1921 & 3;
    bool _1931 = _1929 != 0;
    float _1933 = trunc(_1917);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    if (_1901)
    {
        float _1939 = _1851 ? _1833 : _498;
        _614 = _1939;
    }
    float _1941 = _614;
    float _1943 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1911);
    int _1945 = int(_1811) + int(_1881);
    int _1947 = ~_1286;
    int _1949 = _1947 + 1;
    float _1951 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1943);
    float _1953 = float(uint(_1897));
    bool _1955 = uint(_1929) > 1u;
    int _1957 = _1949 * _1945;
    int _1959 = _1957 + _1763;
    int _1961 = _1921 & 3;
    bool _1963 = _1961 != 0;
    float _1965 = as_type<float>(_1365) * _1953;
    float _1967 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1923);
    int _1969 = ~_1246;
    int _1971 = _1969 + 1;
    float _1973 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1927);
    int _1975 = _1963 ? 0 : 1;
    float _1977 = trunc(_1965);
    float _1979 = precise::max(_1977, 0.0);
    uint _1981 = uint(_1979);
    bool _1983 = uint(_1959) >= uint(_1286);
    float _1985 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1967);
    int _1987 = ~_1975;
    int _1989 = _1987 + 1;
    int _1991 = _1989 + 1;
    float _1993 = _1951 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1995 = !_1983;
    int _1997 = _1995 ? 0 : (-1);
    float _1999 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1973);
    bool _2001 = _1929 != 3;
    int _2003 = _1991;
    if (!_1955)
    {
        int _2005 = ~_1975;
        int _2007 = _2005 + 1;
        _2003 = _2007;
    }
    int _2009 = _2003;
    float _2011 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2013 = int(_1827) + int(_1937);
    float _2015 = _1985 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2017 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2019 = _1993 + _2017;
    bool _2021 = uint(_1929) >= 2u;
    float _2023 = _2011 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _2025 = ~_1945;
    int _2027 = _2025 + _1997;
    int _2029 = _2027 + 1;
    int _2031 = _1971 * _2013;
    int _2033 = _2031 + _1507;
    int _2035 = _2021 ? 0 : 1;
    float _2037 = _2019 * _2019;
    int _2039 = int(_1785) + int(_1981);
    int _2041 = _1286 * _2029;
    int _2043 = _2041 + _1763;
    int _2045 = ~_2035;
    int _2047 = _2045 + 1;
    int _2049 = _2047 + 1;
    float _2051 = _1999 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2053 = _2049;
    int _2055 = int(_1937);
    if (_2001)
    {
        int _2057 = ~_2035;
        int _2059 = _2057 + 1;
        _2053 = _2059;
    }
    int _2061 = _2053;
    float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2065 = _2015 + _2063;
    bool _2067 = !_1645;
    int _2069 = _2067 ? _2043 : (-1);
    float _2071 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2073 = _2051 + _2071;
    if (_1481)
    {
        _2055 = 0;
    }
    int _2075 = _2055;
    float _2077 = fma(_2065, _2065, _2037);
    bool _2079 = uint(_2033) >= uint(_1246);
    float _2081 = -_2051;
    float _2083 = _2081 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _2085 = _2075;
    if (!_1481)
    {
        _2085 = 1;
    }
    int _2087 = _2085;
    float _2089 = fma(_2073, _2073, _2077);
    int _2091 = _2069 & 3;
    bool _2093 = _2091 != 0;
    bool _2095 = !_2079;
    int _2097 = _2095 ? 0 : (-1);
    float _2099 = sqrt(_2089);
    int _2101 = _2069 & 3;
    bool _2103 = _2101 != 0;
    bool _2105 = uint(_2091) >= 2u;
    int _2107 = _2103 ? 0 : 1;
    bool _2109 = uint(_2091) > 1u;
    float _2111 = rsqrt(_2089);
    int _2113 = _2105 ? 0 : 1;
    bool _2115 = _2091 != 3;
    int _2117 = ~_1286;
    int _2119 = _2117 + 1;
    int _2121 = ~_2107;
    int _2123 = _2121 + 1;
    int _2125 = _2123 + 1;
    float _2127 = _2099 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2129 = ~_2113;
    int _2131 = _2129 + 1;
    int _2133 = _2131 + 1;
    int _2135 = _2119 * _2039;
    int _2137 = _2135 + _1733;
    bool _2139 = !_1931;
    int _2141 = _2139 ? 0 : 1;
    int _2143 = _2125;
    int _2145 = _2133;
    if (!_2109)
    {
        int _2147 = ~_2107;
        int _2149 = _2147 + 1;
        _2143 = _2149;
    }
    int _2151 = _2143;
    bool _2153 = uint(_2137) >= uint(_1286);
    if (_2115)
    {
        int _2155 = ~_2113;
        int _2157 = _2155 + 1;
        _2145 = _2157;
    }
    int _2159 = _2145;
    float _2161 = in.m_69.x;
    float _2163 = in.m_69.y;
    float _2165 = in.m_69.z;
    int _2167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2169 = _2167 != 0;
    bool _2171 = !_2153;
    int _2173 = _2171 ? 0 : (-1);
    bool _2175 = _1232 > 0.5;
    bool _2177 = _2175 && _2169;
    float _2179 = precise::min(_2023, _2127);
    bool _2181 = _1759 != 2;
    int _2183 = ~_2013;
    int _2185 = _2183 + _2097;
    int _2187 = _2185 + 1;
    float _2189 = _2111 * _2179;
    int _2191 = abs(_2009);
    out.m_71.w = _2179;
    float _2193 = 0.0;
    if (!_2169)
    {
        _2193 = _352;
    }
    float _2195 = _2193;
    float _2197 = _2019 * _2189;
    float _2199 = _2073 * _2189;
    float _2201 = _2195;
    if (_2177)
    {
        float _2203 = -_352;
        float _2205 = _2203 + 1.0;
        _430 = _2205;
    }
    float _2207 = _430;
    bool _2209 = _2087 != 1;
    float _2211 = _2065 * _2189;
    float _2213 = -_2197;
    float _2215 = _2019 + _2213;
    float _2217 = -_2199;
    float _2219 = _2073 + _2217;
    if (_2169)
    {
        _2201 = _2207;
    }
    float _2221 = _2201;
    float _2223 = -_2211;
    float _2225 = _2065 + _2223;
    float _2227 = _2215 * _2215;
    float _2229 = in.m_73.x;
    float _2231 = in.m_73.y;
    float _2233 = in.m_73.z;
    bool _2235 = _2163 != 0.0;
    bool _2237 = isnan(_2163);
    bool _2239 = _2235 || _2237;
    bool _2241 = isnan(0.0);
    bool _2243 = _2239 || _2241;
    float _2245 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2161);
    float _2247 = fma(_2225, _2225, _2227);
    float _2249 = in.m_75.x;
    float _2251 = in.m_75.y;
    float _2253 = in.m_75.z;
    float _2255 = in.m_75.w;
    bool _2257 = _2161 == 0.0;
    bool _2259 = !_2243;
    bool _2261 = _2257 && _2259;
    float _2263 = _610 * _790;
    float _2265 = fma(_2219, _2219, _2247);
    float _2267 = 0.0;
    if (!_2209)
    {
        _2267 = _1232;
    }
    float _2269 = _2267;
    int _2271 = _1246 * _2187;
    int _2273 = _2271 + _1507;
    bool _2275 = _2165 == 0.0;
    bool _2277 = _2275 && _2261;
    float _2279 = 0.0;
    float _2281 = _2269;
    if (_2181)
    {
        _2279 = _174;
    }
    float _2283 = _2279;
    float _2285 = sqrt(_2265);
    float _2287 = 0.0;
    float _2289 = _2283;
    if (!_2209)
    {
        _2287 = _2269;
    }
    float _2291 = _2287;
    float _2293 = _2291;
    if (!_2181)
    {
        _2289 = _1240;
    }
    float _2295 = _2289;
    float _2297 = 0.0;
    if (!_2209)
    {
        _2297 = _1240;
    }
    float _2299 = _2297;
    float _2301 = 0.0;
    float _2303 = _2299;
    if (_2181)
    {
        _2301 = _1232;
    }
    float _2305 = _2301;
    float _2307 = _2305;
    if (_2209)
    {
        _2293 = _174;
    }
    float _2309 = _2293;
    if (_2209)
    {
        _2281 = _174;
    }
    float _2311 = _2281;
    if (_2209)
    {
        _1349 = _1232;
    }
    float _2313 = _1349;
    float _2315 = _2309 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2317 = _2233 * _2251;
    float _2319 = _2229 * _2253;
    float _2321 = _2231 * _2249;
    float _2323 = _2317;
    float _2325 = _2255;
    if (_2209)
    {
        _2303 = _1232;
    }
    float _2327 = _2303;
    float _2329 = _2111 * _2285;
    if (!_2181)
    {
        _2307 = _174;
    }
    float _2331 = _2307;
    float _2333 = -_2319;
    float _2335 = fma(_2233, _2249, _2333);
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2339 = _2337 != 0;
    float _2341 = -_2321;
    float _2343 = fma(_2251, _2229, _2341);
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2347 = _2345 != 0;
    float _2349 = -_2317;
    float _2351 = fma(_2253, _2231, _2349);
    if (_2277)
    {
        _2323 = _2231;
    }
    float _2353 = _2323;
    float _2355 = _1242 * _2329;
    float _2357 = _2353;
    if (!_2277)
    {
        float _2359 = fma(_2163, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2231);
        _2357 = _2359;
    }
    float _2361 = _2357;
    float _2363 = _2351 * _2255;
    float _2365 = _2335 * _2255;
    float _2367 = _2343 * _2255;
    float _2369 = _2263 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_2277)
    {
        _2325 = _2233;
    }
    float _2371 = _2325;
    float _2373 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2163);
    float _2375 = _2371;
    if (!_2277)
    {
        float _2377 = fma(_2165, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2233);
        _2375 = _2377;
    }
    float _2379 = _2375;
    float _2381 = _2355 * _2165;
    float _2383 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2385 = _2369 * _2329;
    float _2387 = 0.0;
    float _2389 = _2379;
    if (_2277)
    {
        _2387 = _2229;
    }
    float _2391 = _2387;
    float _2393 = _2391;
    if (!_2277)
    {
        float _2395 = fma(_2161, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2229);
        _2393 = _2395;
    }
    float _2397 = _2393;
    float _2399 = -_1250;
    float _2401 = fma(_2383, 2.0, _2399);
    float _2403 = _2385 * _2373;
    float _2405 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2407 = _2405 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2409 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2411 = 1.0 / _2407;
    float _2413 = -_2015;
    float _2415 = _2413 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2417 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2419 = fma(_2409, -2.0, _1260);
    float _2421 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2417);
    float _2423 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2425 = _2423 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2427 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2429 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2431 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2433 = _2431 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2435 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2427);
    float _2437 = -_1993;
    float _2439 = _2437 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2441 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2429);
    float _2443 = 1.0 / _2433;
    float _2445 = _2439 * _2439;
    float _2447 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2449 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2451 = fma(_2415, _2415, _2445);
    float _2453 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2455 = -_2447;
    float _2457 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2455);
    float _2459 = 1.0 / _2425;
    float _2461 = fma(_2083, _2083, _2451);
    float _2463 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2465 = _2463 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2467 = -_2449;
    float _2469 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2467);
    float _2471 = -_2453;
    float _2473 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2471);
    float _2475 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2441);
    float _2477 = rsqrt(_2461);
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2481 = _2479 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2483 = _2331 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2485 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2487 = _2485 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2489 = _2313 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2491 = _2011 * _2329;
    float _2493 = 1.0 / _2481;
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2497 = _2495 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2499;
    int _2503 = ~_2191;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    float _2509 = _2491 * _2245;
    int _2511 = abs(_2141);
    float _2513 = _2501 * _2459;
    bool _2515 = !_2093;
    int _2517 = _2515 ? 0 : 1;
    float _2519 = 1.0 / _2465;
    float _2521 = _2415 * _2477;
    float _2523 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2525 = _2439 * _2477;
    int _2527 = abs(_2517);
    float _2529 = -_2523;
    float _2531 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2529);
    bool _2533 = _1929 != 3;
    float _2535 = 1.0 / _2487;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2537;
    float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2543 = _2541 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2545 = ~_2039;
    int _2547 = _2545 + _2173;
    int _2549 = _2547 + 1;
    float _2551 = _2539 * _2411;
    float _2553 = _2543 * _2443;
    float _2555 = _2521 * _2521;
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2559 = _2557 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2561 = _2083 * _2477;
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2565 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2563;
    float _2567 = 1.0 / _2497;
    float _2569 = fma(_2561, _2561, _2555);
    float _2571 = _2565 * _2493;
    float _2573 = _2559 * _2519;
    float _2575 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2577 = _2575 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2581 = _1226 + _2579;
    float _2583 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2585 = _1226 + _2583;
    bool _2587 = !_2533;
    int _2589 = _2587 ? 0 : (-1);
    float _2591 = rsqrt(_2569);
    float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2595 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2593;
    float _2597 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2599 = _1226 + _2597;
    float _2601 = _2577 * _2535;
    float _2603 = fma(_2553, _2581, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2605 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2607 = _1226 + _2605;
    float _2609 = fma(_2551, _2599, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2611 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2613 = _1226 + _2611;
    float _2615 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2617 = _1226 + _2615;
    float _2619 = _2595 * _2567;
    float _2621 = _2469 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2623 = fma(_2513, _2613, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2625 = fma(_2571, _2607, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2627 = fma(_2601, _2585, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2629 = _2473 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2631 = fma(_2573, _2617, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2633 = _2561 * _2591;
    float _2635 = _2521 * _2591;
    float _2637 = _2469 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2639 = -_2629;
    float _2641 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2639);
    float _2643 = -_2633;
    float _2645 = _2561 * _2643;
    float _2647 = _2473 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2649 = -_2637;
    float _2651 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2649);
    float _2653 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2641);
    float _2655 = -_2645;
    float _2657 = fma(_2521, _2635, _2655);
    float _2659 = _2473 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2661 = _2525 * _2635;
    float _2663 = -_2621;
    float _2665 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2663);
    float _2667 = _2657 * _2657;
    float _2669 = -_2647;
    float _2671 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2669);
    float _2673 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2651);
    float _2675 = _2653 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2677 = -_2659;
    float _2679 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2677);
    float _2681 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2683 = fma(_2661, _2661, _2667);
    float _2685 = -_2633;
    float _2687 = _2525 * _2685;
    float _2689 = -_2675;
    float _2691 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2689);
    float _2693 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2679);
    float _2695 = -_2681;
    float _2697 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2695);
    float _2699 = fma(_2687, _2687, _2683);
    float _2701 = _2473 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2703 = fma(_2693, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2691);
    float _2705 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2697);
    bool _2707 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2709 = isnan(_1226);
    bool _2711 = _2707 || _2709;
    bool _2713 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2715 = _2711 || _2713;
    float _2717 = float(_2715);
    float _2719 = -_2701;
    float _2721 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2719);
    float _2723 = rsqrt(_2699);
    float _2725 = -_2705;
    float _2727 = fma(_2725, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2703);
    bool _2729 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2731 = isnan(_1226);
    bool _2733 = _2729 || _2731;
    bool _2735 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2737 = _2733 || _2735;
    float _2739 = float(_2737);
    float _2741 = -_2717;
    float _2743 = _2741 + 1.0;
    bool _2745 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2747 = isnan(_1226);
    bool _2749 = _2745 || _2747;
    bool _2751 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2753 = _2749 || _2751;
    float _2755 = float(_2753);
    float _2757 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2671);
    float _2759 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2665);
    float _2761 = _2739 * _2743;
    float _2763 = 1.0 / _2727;
    float _2765 = -_2739;
    float _2767 = _2765 + 1.0;
    bool _2769 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2771 = isnan(_1226);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2777 = _2773 || _2775;
    float _2779 = float(_2777);
    float _2781 = -_2755;
    float _2783 = _2781 + 1.0;
    float _2785 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2721);
    float _2787 = _2755 * _2767;
    bool _2789 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2791 = isnan(_1226);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2797 = _2793 || _2795;
    float _2799 = float(_2797);
    float _2801 = -_2779;
    float _2803 = _2801 + 1.0;
    float _2805 = _2657 * _2723;
    float _2807 = precise::clamp(_2805, 0.0, 1.0);
    bool _2809 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2811 = isnan(_1226);
    bool _2813 = _2809 || _2811;
    bool _2815 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2817 = _2813 || _2815;
    float _2819 = float(_2817);
    float _2821 = _2779 * _2783;
    float _2823 = _2799 * _2803;
    float _2825 = -_2799;
    float _2827 = _2825 + 1.0;
    float _2829 = -_2807;
    float _2831 = _2829 + 1.0;
    bool _2833 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2835 = isnan(_1226);
    bool _2837 = _2833 || _2835;
    bool _2839 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2841 = _2837 || _2839;
    float _2843 = float(_2841);
    float _2845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2847 = fma(_2757, _2763, -1.0);
    float _2849 = -_2819;
    float _2851 = _2849 + 1.0;
    float _2853 = _2819 * _2827;
    float _2855 = _2831 * _2763;
    float _2857 = fma(_2831, _2847, 1.0);
    bool _2859 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2861 = isnan(_1226);
    bool _2863 = _2859 || _2861;
    bool _2865 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2867 = _2863 || _2865;
    float _2869 = float(_2867);
    float _2871 = _2843 * _2851;
    float _2873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2875 = -_2843;
    float _2877 = _2875 + 1.0;
    float _2879 = _2759 * _2855;
    float _2881 = _2857 * _2857;
    float _2883 = _2785 * _2855;
    float _2885 = _2869 * _2877;
    float _2887 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2889 = _1226 + _2887;
    float _2891 = fma(_2879, _2879, _2881);
    float _2893 = -_2869;
    float _2895 = _2893 + 1.0;
    float _2897 = _2609 * _2885;
    float _2899 = fma(_2619, _2889, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2901 = fma(_2883, _2883, _2891);
    float _2903 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2905 = fma(_2895, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2897);
    int _2907 = _1286 * _2549;
    int _2909 = _2907 + _1733;
    float _2911 = fma(_2903, _1941, -0.5);
    float _2913 = _2873 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2915 = rsqrt(_2901);
    float _2917 = fma(_2603, _2871, _2905);
    float _2919 = fma(_2913, _2221, -0.5);
    float _2921 = _2295 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2923 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2925 = fma(_2623, _2853, _2917);
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2929 = -_2923;
    float _2931 = fma(_2921, 2.0, _2929);
    float _2933 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2935 = fma(_2631, _2823, _2925);
    float _2937 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2927);
    float _2939 = -_144;
    float _2941 = fma(_2939, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2931);
    float _2943 = fma(_2327, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2933);
    float _2945 = _2883 * _2915;
    float _2947 = _2857 * _2915;
    float _2949 = fma(_2475, _2919, _2941);
    int _2951 = _1921 >> 31;
    float _2953 = fma(_2625, _2821, _2935);
    float _2955 = _2879 * _2915;
    float _2957 = -_2945;
    float _2959 = _2521 * _2957;
    float _2961 = _2561 * _2947;
    int _2963 = _2951 & 3;
    float _2965 = fma(_2627, _2787, _2953);
    float _2967 = -_2955;
    float _2969 = -_2959;
    float _2971 = fma(_2561, _2967, _2969);
    float _2973 = -_2945;
    float _2975 = -_2961;
    float _2977 = fma(_2525, _2973, _2975);
    int _2979 = _2069 >> 31;
    float _2981 = -_2955;
    float _2983 = _2525 * _2981;
    int _2985 = _1921 + _2963;
    float _2987 = _2971 * _2971;
    int _2989 = _2979 & 3;
    float _2991 = -_2983;
    float _2993 = fma(_2521, _2947, _2991);
    int _2995 = _2985 >> 2;
    float _2997 = fma(_2977, _2977, _2987);
    int _2999 = _2069 + _2989;
    float _3001 = fma(_2899, _2761, _2965);
    int _3003 = _2995 << 4;
    int _3005 = _3003 + 368;
    float _3007 = fma(_2993, _2993, _2997);
    float _3009 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2435);
    uint _3011 = uint(int(uint(_3005) >> uint(2)));
    uint _3013 = uint(int(uint(int(_3011)) >> uint(2)));
    int _3015 = int(_3011) & 3;
    float _3017 = (*spvDescriptorSet0.vp_c9)._m0[int(_3013)][_3015];
    int _3019 = int(_3011) + 1;
    uint _3021 = uint(int(uint(_3019) >> uint(2)));
    int _3023 = _3019 & 3;
    float _3025 = (*spvDescriptorSet0.vp_c9)._m0[int(_3021)][_3023];
    int _3027 = _2999 >> 2;
    float _3029 = rsqrt(_3007);
    float _3031 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3033 = fma(_2717, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3001);
    int _3035 = _3027 << 4;
    int _3037 = _3035 + 512;
    float _3039 = -_3031;
    float _3041 = fma(_2315, 2.0, _3039);
    int _3043 = _3005 + 8;
    uint _3045 = uint(int(uint(_3043) >> uint(2)));
    uint _3047 = uint(int(uint(int(_3045)) >> uint(2)));
    int _3049 = int(_3045) & 3;
    float _3051 = (*spvDescriptorSet0.vp_c9)._m0[int(_3047)][_3049];
    int _3053 = int(_3045) + 1;
    uint _3055 = uint(int(uint(_3053) >> uint(2)));
    int _3057 = _3053 & 3;
    float _3059 = (*spvDescriptorSet0.vp_c9)._m0[int(_3055)][_3057];
    float _3061 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3063 = abs(_2159);
    float _3065 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _3067 = _2091 != 3;
    float _3069 = fma(_2489, -2.0, _3061);
    out.m_77.x = _3033;
    float _3071 = fma(_2483, -2.0, _3065);
    uint _3073 = uint(int(uint(_3037) >> uint(2)));
    uint _3075 = uint(int(uint(int(_3073)) >> uint(2)));
    int _3077 = int(_3073) & 3;
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[int(_3075)][_3077];
    int _3081 = int(_3073) + 1;
    uint _3083 = uint(int(uint(_3081) >> uint(2)));
    int _3085 = _3081 & 3;
    float _3087 = (*spvDescriptorSet0.vp_c9)._m0[int(_3083)][_3085];
    float _3089 = _2977 * _3029;
    float _3091 = _2993 * _3029;
    float _3093 = _2971 * _3029;
    float _3095 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3071);
    float _3097 = _2561 * _3089;
    float _3099 = _2525 * _3091;
    int _3101 = _3037 + 8;
    uint _3103 = uint(int(uint(_3101) >> uint(2)));
    uint _3105 = uint(int(uint(int(_3103)) >> uint(2)));
    int _3107 = int(_3103) & 3;
    float _3109 = (*spvDescriptorSet0.vp_c9)._m0[int(_3105)][_3107];
    int _3111 = int(_3103) + 1;
    uint _3113 = uint(int(uint(_3111) >> uint(2)));
    int _3115 = _3111 & 3;
    float _3117 = (*spvDescriptorSet0.vp_c9)._m0[int(_3113)][_3115];
    float _3119 = _2521 * _3093;
    float _3121 = -_3097;
    float _3123 = fma(_2521, _3091, _3121);
    float _3125 = -_3099;
    float _3127 = fma(_2561, _3093, _3125);
    int _3129 = abs(_2151);
    float _3131 = -_3119;
    float _3133 = fma(_2525, _3089, _3131);
    float _3135 = _3123 * _3123;
    float _3137 = -_3095;
    float _3139 = fma(_3009, _2911, _3137);
    int _3141 = ~_3129;
    int _3143 = _3141 + 1;
    int _3145 = _3143 + 1;
    float _3147 = fma(_3127, _3127, _3135);
    float _3149 = fma(_3133, _3133, _3147);
    float _3151 = rsqrt(_3149);
    int _3153 = _2507 * as_type<int>(_3025);
    float _3155 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3157 = int(_3155);
    int _3159 = ~_2511;
    int _3161 = _3159 + 1;
    int _3163 = _3161 + 1;
    int _3165 = _3163 * as_type<int>(_3017);
    int _3167 = _3165 + _3153;
    int _3169 = abs(_2061);
    float _3171 = _3133 * _3151;
    float _3173 = _3127 * _3151;
    int _3175 = ~_3169;
    int _3177 = _3175 + 1;
    int _3179 = _3177 + 1;
    int _3181 = _3145 * as_type<int>(_3087);
    int _3183 = ~_2527;
    int _3185 = _3183 + 1;
    int _3187 = _3185 + 1;
    float _3189 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3191 = int(_3189);
    int _3193 = abs(_2589);
    int _3195 = _3179 * as_type<int>(_3051);
    int _3197 = _3195 + _3167;
    bool _3199 = !_2347;
    int _3201 = _3199 ? 0 : 1;
    int _3203 = _3187 * as_type<int>(_3079);
    int _3205 = _3203 + _3181;
    int _3207 = ~_3193;
    int _3209 = _3207 + 1;
    int _3211 = _3209 + 1;
    float _3213 = _3123 * _3151;
    bool _3215 = !_2339;
    int _3217 = _3215 ? 0 : 1;
    float _3219 = _3171 * _2251;
    int _3221 = abs(_3201);
    float _3223 = _2521 * _3171;
    int _3225 = _3211 * as_type<int>(_3059);
    int _3227 = _3225 + _3197;
    float _3229 = float(uint(_3157));
    float _3231 = _2561 * _3213;
    int _3233 = abs(_3217);
    float _3235 = -_3223;
    float _3237 = fma(_2561, _3173, _3235);
    bool _3239 = !_3067;
    int _3241 = _3239 ? 0 : (-1);
    float _3243 = 1.0 / _3229;
    int _3245 = ~_3063;
    int _3247 = _3245 + 1;
    int _3249 = _3247 + 1;
    float _3251 = -_3231;
    float _3253 = fma(_2525, _3171, _3251);
    float _3255 = _3237 * _3237;
    int _3257 = ~_3157;
    int _3259 = _3257 + 1;
    float _3261 = _2365 * _3213;
    int _3263 = _3249 * as_type<int>(_3109);
    int _3265 = _3263 + _3205;
    float _3267 = float(uint(_3191));
    float _3269 = fma(_3253, _3253, _3255);
    int _3271 = abs(_3241);
    float _3273 = _2525 * _3173;
    float _3275 = 1.0 / _3267;
    int _3277 = ~_3191;
    int _3279 = _3277 + 1;
    float _3281 = _2365 * _3171;
    float _3283 = -_3273;
    float _3285 = fma(_2521, _3213, _3283);
    int _3287 = ~_3233;
    int _3289 = _3287 + 1;
    int _3291 = _3289 + 1;
    int _3293 = ~_3271;
    int _3295 = _3293 + 1;
    int _3297 = _3295 + 1;
    float _3299 = fma(_3285, _3285, _3269);
    int _3301 = abs(_3157);
    int _3303 = _3227 * _3291;
    int _3305 = ~_3221;
    int _3307 = _3305 + 1;
    int _3309 = _3307 + 1;
    int _3311 = _3297 * as_type<int>(_3117);
    int _3313 = _3311 + _3265;
    bool _3315 = !_1635;
    int _3317 = _3315 ? _2273 : (-1);
    float _3319 = rsqrt(_3299);
    int _3321 = _3313 * _3309;
    bool _3323 = !_1645;
    int _3325 = _3323 ? _2909 : (-1);
    int _3327 = _3317 * _3233;
    int _3329 = _3327 + _3303;
    int _3331 = abs(_3191);
    float _3333 = _2403 * _3171;
    int _3335 = as_type<int>(_3243) + (-2);
    int _3337 = _3325 * _3221;
    int _3339 = _3337 + _3321;
    float _3341 = float(uint(_3331));
    float _3343 = _2403 * _3173;
    float _3345 = float(uint(_3301));
    float _3347 = _3171 * _2361;
    float _3349 = 1.0 / _3341;
    int _3351 = as_type<int>(_3275) + (-2);
    float _3353 = _3285 * _3319;
    float _3355 = float(uint(_3329));
    float _3357 = _3253 * _3319;
    int _3359 = abs(_3329);
    float _3361 = fma(_2509, _3353, _3333);
    float _3363 = 1.0 / _3345;
    float _3365 = as_type<float>(_3335) * _3355;
    float _3367 = float(uint(_3339));
    float _3369 = fma(_2561, _2381, _3361);
    float _3371 = fma(_2509, _3357, _3343);
    int _3373 = ~_3331;
    int _3375 = _3373 + 1;
    float _3377 = as_type<float>(_3351) * _3367;
    float _3379 = trunc(_3365);
    float _3381 = precise::max(_3379, 0.0);
    uint _3383 = uint(_3381);
    int _3385 = as_type<int>(_3349) + (-2);
    float _3387 = fma(_2521, _2381, _3371);
    float _3389 = _2051 + _3369;
    float _3391 = fma(_3353, _2249, _3219);
    float _3393 = _2015 + _3387;
    float _3395 = float(uint(_3359));
    float _3397 = trunc(_3377);
    float _3399 = precise::max(_3397, 0.0);
    uint _3401 = uint(_3399);
    int _3403 = as_type<int>(_3363) + (-2);
    float _3405 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3407 = _3389 + _3405;
    int _3409 = abs(_3339);
    float _3411 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3413 = _3393 + _3411;
    float _3415 = as_type<float>(_3403) * _3395;
    float _3417 = _3407 * _3407;
    int _3419 = _3259 * int(_3383);
    int _3421 = _3419 + _3329;
    float _3423 = _3139 + 0.5;
    float _3425 = fma(_3413, _3413, _3417);
    float _3427 = trunc(_3415);
    float _3429 = precise::max(_3427, 0.0);
    uint _3431 = uint(_3429);
    float _3433 = float(uint(_3421));
    float _3435 = _2949 + 0.5;
    int _3437 = ~_3301;
    int _3439 = _3437 + 1;
    int _3441 = _3279 * int(_3401);
    int _3443 = _3441 + _3339;
    float _3445 = float(uint(_3409));
    float _3447 = as_type<float>(_3335) * _3433;
    out.m_79.x = _3435;
    out.m_79.y = _3423;
    float _3449 = sqrt(_3425);
    float _3451 = float(uint(_3443));
    float _3453 = as_type<float>(_3385) * _3445;
    float _3455 = _3213 * _2251;
    float _3457 = as_type<float>(_3351) * _3451;
    float _3459 = _3173 * _2251;
    float _3461 = trunc(_3453);
    float _3463 = precise::max(_3461, 0.0);
    uint _3465 = uint(_3463);
    int _3467 = _3439 * int(_3431);
    int _3469 = _3467 + _3359;
    float _3471 = _2365 * _3173;
    float _3473 = _3213 * _2361;
    float _3475 = _2403 * _3213;
    float _3477 = fma(_3357, _2249, _3459);
    float _3479 = float(uint(_3469));
    float _3481 = _3237 * _3319;
    float _3483 = trunc(_3447);
    float _3485 = precise::max(_3483, 0.0);
    uint _3487 = uint(_3485);
    float _3489 = _3173 * _2361;
    bool _3491 = _3449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3493 = as_type<float>(_3403) * _3479;
    float _3495 = fma(_2509, _3481, _3475);
    int _3497 = ~_3157;
    int _3499 = _3497 + 1;
    float _3501 = fma(_3481, _2249, _3455);
    float _3503 = fma(_2363, _3357, _3471);
    int _3505 = _3375 * int(_3465);
    int _3507 = _3505 + _3409;
    float _3509 = trunc(_3457);
    float _3511 = precise::max(_3509, 0.0);
    uint _3513 = uint(_3511);
    float _3515 = fma(_2525, _2381, _3495);
    int _3517 = ~_3191;
    int _3519 = _3517 + 1;
    float _3521 = fma(_2363, _3481, _3261);
    float _3523 = float(uint(_3507));
    float _3525 = fma(_2363, _3353, _3281);
    float _3527 = fma(_3481, _2397, _3473);
    int _3529 = int(_3383) + int(_3487);
    float _3531 = trunc(_3493);
    float _3533 = precise::max(_3531, 0.0);
    uint _3535 = uint(_3533);
    float _3537 = as_type<float>(_3385) * _3523;
    float _3539 = fma(_3353, _2397, _3347);
    float _3541 = fma(_2521, _2253, _3477);
    int _3543 = _3499 * _3529;
    int _3545 = _3543 + _3329;
    float _3547 = fma(_2525, _2253, _3501);
    float _3549 = fma(_3357, _2397, _3489);
    float _3551 = fma(_2561, _2253, _3391);
    float _3553 = trunc(_3537);
    float _3555 = precise::max(_3553, 0.0);
    uint _3557 = uint(_3555);
    int _3559 = int(_3401) + int(_3513);
    float _3561 = _1993 + _3515;
    bool _3563 = uint(_3545) >= uint(_3157);
    int _3565 = ~_3301;
    int _3567 = _3565 + 1;
    int _3569 = _3519 * _3559;
    int _3571 = _3569 + _3339;
    int _3573 = ~_3331;
    int _3575 = _3573 + 1;
    int _3577 = int(_3431) + int(_3535);
    float _3579 = as_type<float>(_3545);
    float _3581 = _3515;
    float _3583 = _3473;
    float _3585 = _3541;
    float _3587 = _3547;
    if (!_3491)
    {
        _3579 = _3393;
    }
    float _3589 = _3579;
    float _3591 = _3589;
    if (!_3491)
    {
        _3581 = _3389;
    }
    float _3593 = _3581;
    float _3595 = _3593;
    if (!_3491)
    {
        _3583 = _3561;
    }
    float _3597 = _3583;
    int _3599 = int(_3465) + int(_3557);
    bool _3601 = !_3491;
    float _3603 = _3597;
    if (!_3601)
    {
        float _3605 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3607 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3609 = _3449 + _3607;
        float _3611 = _3561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3613 = rsqrt(_3425);
        float _3615 = _3609 * _3605;
        float _3617 = _3615 * 0.15915493667125701904296875;
        float _3619 = _3617 * 6.283185482025146484375;
        float _3621 = cos(_3619);
        float _3623 = _3617 * 6.283185482025146484375;
        float _3625 = sin(_3623);
        float _3627 = _3621 + (-1.0);
        float _3629 = fma(_3625, _3611, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3631 = _3627 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3633 = _3613 * _3629;
        float _3635 = fma(_3561, _3621, _3631);
        float _3637 = fma(_3413, _3633, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3639 = fma(_3407, _3633, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3591 = _3637;
        _3603 = _3635;
        _3595 = _3639;
    }
    float _3641 = _3591;
    float _3643 = _3603;
    float _3645 = _3595;
    bool _3647 = !_3563;
    int _3649 = _3647 ? 0 : (-1);
    float _3651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3653 = _3567 * _3577;
    int _3655 = _3653 + _3359;
    bool _3657 = uint(_3571) >= uint(_3191);
    int _3659 = _3575 * _3599;
    int _3661 = _3659 + _3409;
    int _3663 = ~_3529;
    int _3665 = _3663 + _3649;
    int _3667 = _3665 + 1;
    float _3669 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2419);
    bool _3671 = uint(_3655) >= uint(_3301);
    float _3673 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3069);
    bool _3675 = !_3657;
    int _3677 = _3675 ? 0 : (-1);
    int _3679 = _3157 * _3667;
    int _3681 = _3679 + _3329;
    bool _3683 = _3157 == 0;
    float _3685 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2421);
    bool _3687 = _3157 == 0;
    float _3689 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2943);
    int _3691 = _3329 ^ _3157;
    out.m_81.x = _2491;
    int _3693 = ~_3559;
    int _3695 = _3693 + _3677;
    int _3697 = _3695 + 1;
    float _3699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3701 = !_3683;
    int _3703 = _3701 ? _3681 : (-1);
    bool _3705 = uint(_3661) >= uint(_3331);
    int _3707 = _3191 * _3697;
    int _3709 = _3707 + _3339;
    int _3711 = _3339 ^ _3191;
    float _3713 = _3651 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3715 = _3191 == 0;
    float _3717 = fma(_2561, _2379, _3539);
    bool _3719 = _3191 == 0;
    float _3721 = -_144;
    float _3723 = fma(_3721, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2401);
    float _3725 = float(_3703);
    float _3727 = fma(_3713, _1797, -0.5);
    bool _3729 = !_3705;
    int _3731 = _3729 ? 0 : (-1);
    float _3733 = -_2211;
    float _3735 = _2015 + _3733;
    bool _3737 = !_3671;
    int _3739 = _3737 ? 0 : (-1);
    float _3741 = fma(_3713, _3725, _3723);
    uint _3743 = uint(int(uint(_3691) >> uint(31)));
    float _3745 = _3699 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3747 = ~_3731;
    int _3749 = _3599 + _3747;
    int _3751 = _3749 + 1;
    float _3753 = -_144;
    float _3755 = fma(_3753, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3041);
    bool _3757 = !_3715;
    int _3759 = _3757 ? _3709 : (-1);
    float _3761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _3763 = uint(int(uint(_3711) >> uint(31)));
    float _3765 = fma(_3745, _1875, -0.5);
    int _3767 = ~_3739;
    int _3769 = _3577 + _3767;
    int _3771 = _3769 + 1;
    float _3773 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1262);
    int _3775 = ~int(_3743);
    int _3777 = _3775 + 1;
    float _3779 = fma(_2521, _2379, _3549);
    float _3781 = float(_3759);
    float _3783 = fma(_3773, _3727, _3741);
    int _3785 = ~int(_3763);
    int _3787 = _3785 + 1;
    out.m_83.x = _3541;
    out.m_83.y = _3547;
    out.m_83.z = _3551;
    int _3789 = _3771 ^ _3777;
    float _3791 = fma(_3745, _3781, _3755);
    int _3793 = _3751 ^ _3787;
    float _3795 = -_2199;
    float _3797 = _2051 + _3795;
    int _3799 = ~_3777;
    int _3801 = _3799 + _3789;
    int _3803 = _3801 + 1;
    float _3805 = _3761 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3807 = ~_3787;
    int _3809 = _3807 + _3793;
    int _3811 = _3809 + 1;
    float _3813 = _2367 * _2521;
    float _3815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3817 = !_3687;
    int _3819 = _3817 ? _3803 : (-1);
    float _3821 = fma(_1863, _3805, -0.5);
    float _3823 = _2367 * _2525;
    float _3825 = _2367 * _2561;
    float _3827 = float(_3819);
    float _3829 = _3813 + _3503;
    bool _3831 = !_3719;
    int _3833 = _3831 ? _3811 : (-1);
    float _3835 = _3823 + _3521;
    float _3837 = -_2015;
    float _3839 = _3837 + _3641;
    float _3841 = -_3669;
    float _3843 = fma(_3805, _3827, _3841);
    float _3845 = -_1993;
    float _3847 = _3845 + _3643;
    float _3849 = _3825 + _3525;
    float _3851 = float(_3833);
    float _3853 = -_2051;
    float _3855 = _3853 + _3645;
    float _3857 = _3847 * _3847;
    float _3859 = _3815 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3861 = fma(_3685, _3821, _3843);
    float _3863 = fma(_2525, _2379, _3527);
    float _3865 = fma(_3839, _3839, _3857);
    float _3867 = fma(_1925, _3859, -0.5);
    float _3869 = -_3673;
    float _3871 = fma(_3859, _3851, _3869);
    float _3873 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2937);
    float _3875 = fma(_3855, _3855, _3865);
    float _3877 = _3783 + 0.5;
    float _3879 = _3861 + 0.5;
    float _3881 = fma(_3873, _3765, _3791);
    float _3883 = fma(_3689, _3867, _3871);
    float _3885 = sqrt(_3875);
    out.m_85.x = _3829;
    out.m_85.y = _3835;
    out.m_85.z = _3849;
    float _3887 = _3881 + 0.5;
    float _3889 = _3883 + 0.5;
    float _3891 = -_2211;
    float _3893 = _3891 + _3641;
    out.m_87.x = _3779;
    out.m_87.y = _3863;
    out.m_87.z = _3717;
    float _3895 = -_2197;
    float _3897 = _3895 + _3643;
    float _3899 = -_2197;
    float _3901 = _1993 + _3899;
    out.m_89.x = _3877;
    out.m_89.y = _3879;
    out.m_89.z = _3887;
    out.m_89.w = _3889;
    bool _3903 = _3885 > 0.0;
    float _3905 = -_2199;
    float _3907 = _3905 + _3645;
    float _3909 = _3835;
    float _3911 = _3829;
    float _3913 = _3847;
    if (!_3903)
    {
        _2389 = _3893;
    }
    float _3915 = _2389;
    float _3917 = _3915;
    float _3919 = _3915;
    if (!_3903)
    {
        _3585 = _3897;
    }
    float _3921 = _3585;
    float _3923 = _3921;
    float _3925 = _3921;
    if (!_3903)
    {
        _3587 = _3907;
    }
    float _3927 = _3587;
    bool _3929 = !_3903;
    float _3931 = _3927;
    float _3933 = _3927;
    if (!_3929)
    {
        bool _3935 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3937 = _3551;
        if (_3935)
        {
            float _3939 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3937 = _3939;
        }
        float _3941 = _3937;
        float _3943 = _3941;
        if (_3935)
        {
            float _3945 = _602 * _3941;
            _3909 = _3945;
        }
        float _3947 = _3909;
        float _3949 = _3947;
        if (_3935)
        {
            float _3951 = _604 * _3941;
            _3911 = _3951;
        }
        float _3953 = _3911;
        float _3955 = _3953;
        if (_3935)
        {
            float _3957 = _606 * _3941;
            _3943 = _3957;
        }
        float _3959 = _3943;
        float _3961 = _3959;
        if (!_3935)
        {
            bool _3963 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3965 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3967 = _3963 || _3965;
            bool _3969 = isnan(1.0);
            bool _3971 = _3967 || _3969;
            float _3973 = _144 + 1.0;
            if (!_3971)
            {
                float _3975 = _3973 * _3973;
                float _3977 = _3975 * 0.5;
                _166 = _3977;
            }
            float _3979 = _166;
            float _3981 = _3979;
            if (!_3971)
            {
                float _3983 = _3979 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3981 = _3983;
            }
            float _3985 = _3981;
            bool _3987 = !_3971;
            float _3989 = _3985;
            if (!_3987)
            {
                float _3991 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3993 = log2(_3991);
                float _3995 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3997 = _3995 + 1.0;
                float _3999 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4001 = _3993 * _3973;
                float _4003 = 1.0 / _3997;
                float _4005 = _3999 * 0.693147182464599609375;
                float _4007 = exp2(_4001);
                float _4009 = 1.0 / _4005;
                float _4011 = _4007 + (-1.0);
                float _4013 = -_4011;
                float _4015 = fma(_4013, _4009, _3973);
                float _4017 = _4015 * _4003;
                float _4019 = _4017 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3989 = _4019;
            }
            float _4021 = _3989;
            float _4023 = _4021 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _4025 = _4021 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4027 = _4021 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4029 = _4021;
            if (!_3971)
            {
                _4029 = _3973;
            }
            float _4031 = _4029;
            float _4033 = _4023 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _4035 = _4023 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _4037 = _4023 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _4039 = fma(_4025, (*spvDescriptorSet0.vp_c10)._m0[8].y, _4033);
            float _4041 = fma(_4025, (*spvDescriptorSet0.vp_c10)._m0[8].x, _4035);
            float _4043 = fma(_4027, (*spvDescriptorSet0.vp_c10)._m0[10].y, _4039);
            bool _4045 = !_3971;
            float _4047 = _4031;
            if (!_4045)
            {
                float _4049 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4051 = log2(_4049);
                float _4053 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4055 = _4053 + 1.0;
                float _4057 = 1.0 / _4055;
                float _4059 = _4051 * _3973;
                float _4061 = exp2(_4059);
                float _4063 = -_4061;
                float _4065 = _4063 + 1.0;
                float _4067 = _4065 * _4057;
                _4047 = _4067;
                _202 = _4057;
            }
            float _4069 = _4047;
            float _4071 = _202;
            float _4073 = fma(_4025, (*spvDescriptorSet0.vp_c10)._m0[8].z, _4037);
            float _4075 = fma(_4069, _314, _4043);
            float _4077 = fma(_4027, (*spvDescriptorSet0.vp_c10)._m0[10].x, _4041);
            float _4079 = fma(_4027, (*spvDescriptorSet0.vp_c10)._m0[10].z, _4073);
            float _4081 = -_540;
            float _4083 = _4081 + _4075;
            float _4085 = fma(_4069, _312, _4077);
            float _4087 = fma(_4069, _316, _4079);
            float _4089 = _4083 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4091 = _4083 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4093 = -_544;
            float _4095 = _4093 + _4085;
            float _4097 = _4083 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4099 = -_546;
            float _4101 = _4099 + _4087;
            float _4103 = fma(_4095, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4089);
            float _4105 = fma(_4095, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4091);
            float _4107 = fma(_4095, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4097);
            float _4109 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4103);
            float _4111 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4105);
            float _4113 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4107);
            _616 = _4111;
            _618 = _4109;
            _620 = _4113;
            _3949 = _4109;
            _3955 = _4111;
            _3961 = _4113;
            _3917 = _4079;
            _3923 = _4107;
            _3931 = _4077;
            _390 = _4105;
            _204 = _4071;
        }
        float _4115 = _616;
        float _4117 = _618;
        float _4119 = _620;
        float _4121 = _3949;
        float _4123 = _3955;
        float _4125 = _3961;
        float _4127 = _3917;
        float _4129 = _3923;
        float _4131 = _3931;
        float _4133 = _390;
        float _4135 = _204;
        float _4137 = _4115 * _4115;
        float _4139 = rsqrt(_3875);
        float _4141 = fma(_4117, _4117, _4137);
        float _4143 = fma(_4119, _4119, _4141);
        float _4145 = sqrt(_4143);
        float _4147 = _3839 * _4139;
        float _4149 = _3847 * _4139;
        float _4151 = _3855 * _4139;
        bool _4153 = _4145 > 0.0;
        float _4155 = _4127;
        float _4157 = _4129;
        float _4159 = _4131;
        _392 = _4133;
        _3913 = _4149;
        _622 = _4115;
        _206 = _4135;
        if (!_4153)
        {
            _4155 = _3893;
        }
        float _4161 = _4155;
        _3919 = _4161;
        if (!_4153)
        {
            _4157 = _3897;
        }
        float _4163 = _4157;
        _3925 = _4163;
        if (!_4153)
        {
            _4159 = _3907;
        }
        float _4165 = _4159;
        bool _4167 = !_4153;
        _3933 = _4165;
        if (!_4167)
        {
            float _4169 = rsqrt(_4143);
            float _4171 = _4169 * _4115;
            float _4173 = _4169 * _4117;
            float _4175 = _4169 * _4119;
            float _4177 = _4149 * _4171;
            float _4179 = fma(_4147, _4173, _4177);
            float _4181 = fma(_4151, _4175, _4179);
            float _4183 = _4181 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4185 = fma(_4121, _4183, _3893);
            float _4187 = fma(_4123, _4183, _3897);
            float _4189 = fma(_4125, _4183, _3907);
            _3919 = _4185;
            _3925 = _4187;
            _3933 = _4189;
            _392 = _4177;
        }
    }
    float _4191 = _3919;
    float _4193 = _3925;
    float _4195 = _3933;
    float _4197 = _392;
    float _4199 = _3913;
    float _4201 = _622;
    float _4203 = _206;
    float _4205 = _3901 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4207 = fma(_3735, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4205);
    float _4209 = _3901 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4211 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4213 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4215 = _4211 || _4213;
    bool _4217 = isnan(0.5);
    bool _4219 = _4215 || _4217;
    float _4221 = fma(_3797, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4207);
    float _4223 = fma(_3735, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4209);
    float _4225 = _4221 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4227 = fma(_3797, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4223);
    bool _4229 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4231 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4233 = _4229 || _4231;
    bool _4235 = isnan(0.5);
    bool _4237 = _4233 || _4235;
    float _4239 = 1.0 / _4225;
    float _4241 = _4227 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4243 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4245 = _4241;
    float _4247 = _4197;
    float _4249 = _4221;
    float _4251 = _4199;
    float _4253 = _4201;
    float _4255 = _4203;
    if (_4219)
    {
        _4243 = _4191;
    }
    float _4257 = _4243;
    float _4259 = _4241 + _4225;
    float _4261 = _4257;
    if (_4219)
    {
        _4245 = _4193;
    }
    float _4263 = _4245;
    float _4265 = _4263;
    if (_4219)
    {
        _4247 = _4195;
    }
    float _4267 = _4247;
    float _4269 = _4267;
    if (!_4219)
    {
        float _4271 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4273 = _3901 + _4271;
        float _4275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4277 = _3735 + _4275;
        float _4279 = -_3735;
        float _4281 = _4279 + _4191;
        float _4283 = -_3901;
        float _4285 = _4283 + _4193;
        float _4287 = _4273 * _4273;
        float _4289 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4291 = _3797 + _4289;
        float _4293 = -_3797;
        float _4295 = _4293 + _4195;
        float _4297 = fma(_4277, _4277, _4287);
        float _4299 = fma(_4291, _4291, _4297);
        float _4301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4303 = sqrt(_4299);
        float _4305 = precise::min(_4303, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4307 = _4305 * _4301;
        float _4309 = fma(_4281, _4307, _3735);
        float _4311 = fma(_4285, _4307, _3901);
        float _4313 = fma(_4295, _4307, _3797);
        _4265 = _4311;
        _4261 = _4309;
        _4269 = _4313;
        _4249 = _4303;
    }
    float _4315 = _4265;
    float _4317 = _4261;
    float _4319 = _4269;
    float _4321 = _4249;
    float _4323 = _4321;
    if (_4237)
    {
        _4323 = 1.0;
    }
    float _4325 = _4323;
    float _4327 = _4259 * _4239;
    float _4329 = _4327 * 0.5;
    float _4331 = _4325;
    float _4333 = _4329;
    if (!_4237)
    {
        float _4335 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4337 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4339 = fma(_4329, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4337);
        float _4341 = _4335 * 0.15915493667125701904296875;
        float _4343 = _4341 * 6.283185482025146484375;
        float _4345 = cos(_4343);
        float _4347 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4349 = _4347 * 0.15915493667125701904296875;
        float _4351 = _4341 * 6.283185482025146484375;
        float _4353 = sin(_4351);
        float _4355 = 1.0 / _4345;
        float _4357 = _4349 * 6.283185482025146484375;
        float _4359 = cos(_4357);
        float _4361 = _4353 * _4355;
        float _4363 = 1.0 / _4339;
        float _4365 = _4359 * _4361;
        float _4367 = _4349 * 6.283185482025146484375;
        float _4369 = sin(_4367);
        float _4371 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4373 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4371;
        float _4375 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4377 = _4363 * _4375;
        float _4379 = 1.0 / _4365;
        float _4381 = 1.0 / _4373;
        float _4383 = _4369 * _4379;
        float _4385 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4387 = fma(_4383, _4377, _4385);
        float _4389 = _4387 * _4381;
        float _4391 = precise::clamp(_4389, 0.0, 1.0);
        _4331 = _4391;
    }
    float _4393 = _4331;
    float _4395 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4397 = _4315 + _4395;
    float _4399 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4401 = _4317 + _4399;
    float _4403 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4405 = _4319 + _4403;
    float _4407 = _4397 * _4397;
    float _4409 = fma(_4401, _4401, _4407);
    float _4411 = fma(_4405, _4405, _4409);
    float _4413 = rsqrt(_4411);
    float _4415 = sqrt(_4411);
    float _4417 = _4413 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4419 = _4401 * _4417;
    float _4421 = _4405 * _4417;
    float _4423 = _4419 * _4419;
    float _4425 = _4421 * _4421;
    float _4427 = _4423 + _4425;
    float _4429 = sqrt(_4427);
    bool _4431 = _4429 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4433 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4435 = _4429 + _4433;
    float _4437 = _4413;
    float _4439 = _4427;
    float _4441 = _4435;
    float _4443 = _4397;
    if (_4431)
    {
        float _4445 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4437 = _4445;
    }
    float _4447 = _4437;
    if (_4431)
    {
        float _4449 = rsqrt(_4427);
        _4439 = _4449;
    }
    float _4451 = _4439;
    if (_4431)
    {
        float _4453 = _4435 * _4447;
        _4441 = _4453;
    }
    float _4455 = _4441;
    if (_4431)
    {
        float _4457 = _4455 * 0.15915493667125701904296875;
        _4251 = _4457;
    }
    float _4459 = _4251;
    float _4461 = _4405;
    if (_4431)
    {
        float _4463 = _4459 * 6.283185482025146484375;
        float _4465 = sin(_4463);
        _4461 = _4465;
    }
    float _4467 = _4461;
    float _4469 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4471 = precise::max(0.0, _4469);
    float _4473 = _4447;
    float _4475 = _4471;
    if (_4431)
    {
        float _4477 = _4459 * 6.283185482025146484375;
        float _4479 = cos(_4477);
        _4473 = _4479;
    }
    float _4481 = _4473;
    float _4483 = -_4417;
    float _4485 = -_4471;
    float _4487 = fma(_4397, _4483, _4485);
    if (_4431)
    {
        float _4489 = _4487 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4443 = _4489;
    }
    float _4491 = _4443;
    float _4493 = _4467;
    float _4495 = _4491;
    if (_4431)
    {
        float _4497 = fma(_4467, _4491, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4333 = _4497;
    }
    float _4499 = _4333;
    float _4501 = _4499;
    if (!_4431)
    {
        _4493 = _4419;
    }
    float _4503 = _4493;
    float _4505 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4507 = fma(_4415, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4505);
    float _4509 = precise::clamp(_4507, 0.0, 1.0);
    float _4511 = _4503;
    if (!_4431)
    {
        _4495 = _4487;
    }
    float _4513 = _4495;
    float _4515 = _4513;
    float _4517 = _4481;
    if (_4431)
    {
        float _4519 = _4481 + (-1.0);
        _4475 = _4519;
    }
    float _4521 = _4475;
    float _4523 = _4521;
    if (_4431)
    {
        float _4525 = _4451 * _4499;
        _4253 = _4525;
    }
    float _4527 = _4253;
    if (!_4431)
    {
        _4501 = _4423;
    }
    float _4529 = _4501;
    float _4531 = _4315 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4533 = _4529;
    if (_4431)
    {
        float _4535 = _4521 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4255 = _4535;
    }
    float _4537 = _4255;
    if (_4431)
    {
        float _4539 = _4419 * _4527;
        _4511 = _4539;
    }
    float _4541 = _4511;
    if (!_4431)
    {
        _4523 = _4421;
    }
    float _4543 = _4523;
    float _4545 = _4543;
    if (_4431)
    {
        float _4547 = _4421 * _4527;
        _4545 = _4547;
    }
    float _4549 = _4545;
    if (_4431)
    {
        float _4551 = fma(_4487, _4481, _4537);
        _4515 = _4551;
    }
    float _4553 = _4515;
    if (_4431)
    {
        float _4555 = _4541 * _4541;
        _4533 = _4555;
    }
    float _4557 = _4533;
    if (!_4431)
    {
        _4517 = _4425;
    }
    float _4559 = _4517;
    float _4561 = _4559;
    if (_4431)
    {
        float _4563 = _4549 * _4549;
        _4561 = _4563;
    }
    float _4565 = _4561;
    float _4567 = -_4509;
    float _4569 = _4567 + 1.0;
    float _4571 = fma(_4553, _4553, _4557);
    float _4573 = _4315 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4575 = _4571 + _4565;
    float _4577 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4531);
    float _4579 = _4315 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4581 = abs(_4569);
    float _4583 = log2(_4581);
    float _4585 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4587 = fma(_4319, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4577);
    float _4589 = _4315 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4591 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4579);
    float _4593 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4573);
    float _4595 = _4587 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4597 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4589);
    float _4599 = rsqrt(_4575);
    float _4601 = fma(_4319, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4591);
    float _4603 = fma(_4319, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4593);
    float _4605 = fma(_4319, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4597);
    float _4607 = _4601 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4609 = _4603 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4611 = _4605 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4613 = _4583 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4615 = _4595 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4617 = -_4615;
    float _4619 = fma(_4617, _4585, 1.0);
    float _4621 = _4607 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4623 = exp2(_4613);
    float _4625 = _4599 * _4541;
    float _4627 = _4599 * _4553;
    float _4629 = fma(_4611, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4621);
    float _4631 = _4599 * _4549;
    float _4633 = _4625 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4635 = fma(_4595, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4629);
    float _4637 = log2(_4619);
    float _4639 = -_4633;
    float _4641 = fma(_4627, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4639);
    float _4643 = _4607 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4645 = fma(_4609, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4635);
    float _4647 = -_4631;
    float _4649 = fma(_4647, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4641);
    float _4651 = _4607 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4653 = fma(_4611, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4643);
    float _4655 = 1.0 / _4645;
    float _4657 = fma(_4649, -0.5, 0.5);
    float _4659 = fma(_4611, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4651);
    float _4661 = fma(_4649, 0.5, 0.5);
    float _4663 = _4627 + 1.0;
    float _4665 = fma(_4595, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4653);
    float _4667 = fma(_4595, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4659);
    float _4669 = fma(_4661, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4671 = sqrt(_4657);
    float _4673 = -_4627;
    float _4675 = fma(_4623, _4663, _4673);
    float _4677 = fma(_4609, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4667);
    float _4679 = fma(_4609, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4665);
    float _4681 = fma(_4661, _4669, -0.212114393711090087890625);
    float _4683 = _4637 * 0.693147182464599609375;
    float _4685 = fma(_4675, 0.5, 0.5);
    float _4687 = _4677 * _4655;
    float _4689 = _4679 * _4655;
    float _4691 = fma(_4661, _4681, 1.570728778839111328125);
    float _4693 = _4683 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4695 = fma(_4687, 0.5, 0.5);
    float _4697 = fma(_4689, -0.5, 0.5);
    float _4699 = _4671 * 0.636619746685028076171875;
    float3 _12094 = float3(_4695, _4697, _4693);
    float _4701 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12094, float3(0.0), isnan(_12094)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12094, float3(0.0), isnan(_12094)), level(0.0)).x;
    float3 _12105 = float3(_4695, _4697, _4693);
    float4 _4704 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12105, float3(0.0), isnan(_12105)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12105, float3(0.0), isnan(_12105)), level(0.0)).xyzw;
    float _4706 = _4704.x;
    float _4708 = _4704.y;
    float _4710 = _4704.z;
    float _4712 = _4704.w;
    float _4714 = -_4691;
    float _4716 = fma(_4699, _4714, 1.0);
    float2 _12127 = float2(_4716, _4685);
    float3 _4720 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12127, float2(0.0), isnan(_12127)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12127, float2(0.0), isnan(_12127)), level(0.0)).xyz;
    float _4722 = _4720.x;
    float _4724 = _4720.y;
    float _4726 = _4720.z;
    float _4728 = _4583 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4730 = _4607 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_91.x = _3735;
    out.m_91.y = _3901;
    out.m_91.z = _3797;
    bool _4732 = _4415 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4734 = isnan(_4415);
    bool _4736 = _4732 || _4734;
    bool _4738 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4740 = _4736 || _4738;
    float _4742 = fma(_4611, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4730);
    float _4744 = exp2(_4728);
    float _4746 = _4677 + _4645;
    out.m_93.x = _4317;
    out.m_93.y = _4315;
    out.m_93.z = _4319;
    float _4748 = fma(_4595, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4742);
    float _4750 = _4645 * 0.5;
    float _4752 = _4746 * 0.5;
    float _4754 = fma(_4609, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4748);
    float _4756 = fma(_4679, -0.5, _4750);
    float _4758 = _4754 + _4645;
    out.gl_Position.x = _4677;
    out.gl_Position.y = _4679;
    out.gl_Position.z = _4754;
    out.gl_Position.w = _4645;
    float _4760 = _4758 * 0.5;
    float _4762 = -_4744;
    float _4764 = _4762 + 1.0;
    float _4766 = _4764 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_95.x = _4752;
    out.m_95.y = _4756;
    out.m_95.z = _4760;
    out.m_95.w = _4645;
    float _4768 = -_4766;
    float _4770 = _4768 + 1.0;
    float _4772 = _4754;
    float _4774 = _4679;
    float _4776 = _4677;
    if (!_4740)
    {
        _4772 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4778 = _4772;
    float _4780 = _4778;
    float _4782 = _4778;
    if (!_4740)
    {
        _4774 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4784 = _4774;
    float _4786 = _4784;
    float _4788 = _4784;
    if (!_4740)
    {
        _4776 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4790 = _4776;
    float _4792 = _4766 * _4701;
    float _4794 = _4712 * _4770;
    float _4796 = _4393 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4798 = _4712 * _4792;
    float _4800 = _4726 * _4792;
    float _4802 = fma(_4722, _4798, _4706);
    float _4804 = fma(_4724, _4798, _4708);
    float _4806 = fma(_4712, _4800, _4710);
    out.m_97.x = _4802;
    out.m_97.y = _4804;
    out.m_97.z = _4806;
    out.m_97.w = _4794;
    bool _4808 = !_4740;
    float _4810 = _4790;
    float _4812 = _4790;
    if (!_4808)
    {
        bool _4814 = _4415 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4816 = isnan(_4415);
        bool _4818 = _4814 || _4816;
        bool _4820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4822 = _4818 || _4820;
        if (!_4822)
        {
            float _4824 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4826 = _4415 + _4824;
            float _4828 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4830 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4828;
            float _4832 = 1.0 / _4830;
            float _4834 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4836 = _4834 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4838 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4840 = _4838 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4842 = _4826 * _4832;
            float _4844 = precise::clamp(_4842, 0.0, 1.0);
            float _4846 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4848 = _4846 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4850 = fma(_4844, _4840, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4852 = fma(_4844, _4848, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4854 = fma(_4844, _4836, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4788 = _4854;
            _4782 = _4852;
            _4812 = _4850;
            _4856 = true;
        }
        else
        {
            bool _4858 = _4415 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4860 = isnan(_4415);
            bool _4862 = _4858 || _4860;
            bool _4864 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4866 = _4862 || _4864;
            if (!_4866)
            {
                _4780 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4868 = _4780;
            _4782 = _4868;
            if (!_4866)
            {
                _4786 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4870 = _4786;
            _4788 = _4870;
            if (!_4866)
            {
                _4810 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4872 = _4810;
            bool _4874 = !_4866;
            _4812 = _4872;
            if (!_4874)
            {
                bool _4876 = _4415 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4878 = isnan(_4415);
                bool _4880 = _4876 || _4878;
                bool _4882 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4884 = _4880 || _4882;
                if (!_4884)
                {
                    float _4886 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4888 = _4415 + _4886;
                    float _4890 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4892 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4890;
                    float _4894 = 1.0 / _4892;
                    float _4896 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4898 = _4896 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4900 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4902 = _4900 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4904 = _4888 * _4894;
                    float _4906 = precise::clamp(_4904, 0.0, 1.0);
                    float _4908 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4910 = _4908 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4912 = fma(_4906, _4902, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4914 = fma(_4906, _4910, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4916 = fma(_4906, _4898, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4788 = _4916;
                    _4782 = _4914;
                    _4812 = _4912;
                    _4856 = true;
                }
                else
                {
                    _4788 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4782 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4812 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4856 = false;
    float _4918 = _4788;
    float _4920 = _4782;
    float _4922 = _4812;
    float _4924 = _4796 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_99.x = 0.0;
    float _4926 = _4918 * 0.586610972881317138671875;
    bool _4928 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _4924;
    float _4930 = fma(_4920, 0.298911988735198974609375, _4926);
    bool _4932 = _4393 > 0.0;
    bool _4934 = isnan(_4393);
    bool _4936 = _4932 || _4934;
    bool _4938 = isnan(0.0);
    bool _4940 = _4936 || _4938;
    float _4942 = fma(_4922, 0.114477999508380889892578125, _4930);
    float _4944 = -_4942;
    float _4946 = _4944 + _4920;
    float _4948 = -_4942;
    float _4950 = _4948 + _4918;
    float _4952 = -_4942;
    float _4954 = _4952 + _4922;
    float _4956 = fma(_4946, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4942);
    float _4958 = fma(_4950, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4942);
    float _4960 = fma(_4954, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4942);
    bool _4962 = !_4928;
    if (!_4962)
    {
        float _4964 = -_4315;
        float _4966 = _4964 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4968 = -_4317;
        float _4970 = _4968 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4972 = -_4319;
        float _4974 = _4972 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4976 = _4966 * _4966;
        float _4978 = fma(_4970, _4970, _4976);
        float _4980 = fma(_4974, _4974, _4978);
        float _4982 = sqrt(_4980);
        float _4984 = rsqrt(_4980);
        float _4986 = -_4982;
        float _4988 = _4986 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4990 = _4988 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4992 = precise::clamp(_4990, 0.0, 1.0);
        float _4994 = _4970 * _4984;
        float _4996 = _4966 * _4984;
        float _4998 = abs(_4992);
        float _5000 = log2(_4998);
        float _5002 = _4974 * _4984;
        float _5004 = _4994 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5006 = _3863 * _4996;
        float _5008 = -_4996;
        float _5010 = -_5004;
        float _5012 = fma(_5008, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5010);
        float _5014 = fma(_3779, _4994, _5006);
        float _5016 = -_5002;
        float _5018 = fma(_5016, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5012);
        float _5020 = fma(_3717, _5002, _5014);
        float _5022 = precise::clamp(_5020, 0.0, 1.0);
        float _5024 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5026 = _5018 + _5024;
        float _5028 = _5000 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5030 = _5026 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5032 = precise::clamp(_5030, 0.0, 1.0);
        float _5034 = exp2(_5028);
        float _5036 = _5034 * _5032;
        float _5038 = _5022 * _5036;
        float _5040 = _5038 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5042 = _5038 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5044 = _5038 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _5040;
        out.m_99.y = _5042;
        out.m_99.z = _5044;
    }
    out.m_71.x = _4956;
    out.m_71.y = _4958;
    out.m_71.z = _4960;
    if (_4940)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _5046 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5046;
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
    bool _4856 = false;
    bool _1224 = false;
    bool _1014 = false;
    bool _908 = false;
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
        float _5102 = as_type<float>(_132);
        out.gl_Position.z = _5102;
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
        float _5174 = as_type<float>(_172);
        out.gl_Position.z = _5174;
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
    bool _816 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _818 = isnan(_814);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _824 = _820 || _822;
    float _826 = float(_824);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _832 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _834 = isnan(_814);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _844;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _850 = _814 + _848;
    float _852 = 1.0 / _830;
    float _854 = -_826;
    float _856 = _854 + 1.0;
    bool _858 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _860 = _842 * _856;
    float _862 = -_842;
    float _864 = _862 + 1.0;
    float _866 = _846 * _852;
    float _868 = fma(_866, _850, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _870 = _868 * _860;
    float _872 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[115].x, _870);
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _880 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[116].x, _872);
    float _882 = _874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _884 = _876 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _886 = _878 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _888 = _880 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _882;
    out.m_61.y = _884;
    out.m_61.z = _886;
    out.m_61.w = _888;
    bool _890 = !_858;
    float _906;
    if (!_890)
    {
        float _892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _894 = _174 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[11].z, _144);
        float _898 = _896 * _892;
        float _900 = floor(_898);
        float _902 = -_900;
        float _904 = _898 + _902;
        _906 = _904;
        _908 = true;
    }
    else
    {
        _906 = _156;
    }
    _908 = false;
    float _910 = _906;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _914 = _910 + _912;
    bool _916 = _910 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _918 = isnan(_910);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _924 = _920 || _922;
    float _926 = float(_924);
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _928;
    bool _932 = _910 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _934 = isnan(_910);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = 1.0 / _930;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _946;
    bool _950 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _952;
    float _956 = _914 * _944;
    float _958 = -_926;
    float _960 = _958 + 1.0;
    float _962 = fma(_948, _956, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _964 = fma(_954, _956, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _966;
    float _970 = _942 * _960;
    float _972 = -_942;
    float _974 = _972 + 1.0;
    float _976 = fma(_968, _956, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _978 = _962 * _970;
    float _980 = _976 * _970;
    float _982 = _964 * _970;
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].x, _978);
    float _986 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].y, _980);
    float _988 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].z, _982);
    float _990 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[124].x, _984);
    float _992 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[124].y, _986);
    float _994 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[124].z, _988);
    bool _996 = !_950;
    float _1012;
    if (!_996)
    {
        float _998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1000 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _1004 = _1002 * _998;
        float _1006 = floor(_1004);
        float _1008 = -_1006;
        float _1010 = _1004 + _1008;
        _1012 = _1010;
        _1014 = true;
    }
    else
    {
        _1012 = _156;
    }
    _1014 = false;
    float _1016 = _1012;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1022;
    bool _1026 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1028 = isnan(_1016);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1034 = _1030 || _1032;
    float _1036 = float(_1034);
    float _1038 = 1.0 / _1020;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1048 = -_1036;
    float _1050 = _1048 + 1.0;
    bool _1052 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1054 = isnan(_1016);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = 1.0 / _1042;
    bool _1066 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1068 = isnan(_1016);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    bool _1078 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1080 = _1076 * _1050;
    float _1082 = -_1076;
    float _1084 = _1082 + 1.0;
    float _1086 = _1024 * _1038;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1090 = _1016 + _1088;
    float _1092 = 1.0 / _1046;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1098 = _1062 * _1084;
    float _1100 = fma(_1086, _1090, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1106 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1108 = isnan(_1016);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1118;
    float _1122 = _1096 * _1064;
    float _1124 = 1.0 / _1104;
    float _1126 = _1100 * _1098;
    float _1128 = -_1116;
    float _1130 = _1128 + 1.0;
    float _1132 = -_1062;
    float _1134 = _1132 + 1.0;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1140 = _1036 * _1130;
    bool _1142 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1144 = isnan(_1016);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = _1120 * _1092;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1158 = _1016 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1162 = _1016 + _1160;
    float _1164 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1126);
    float _1166 = -_1152;
    float _1168 = _1166 + 1.0;
    float _1170 = fma(_1122, _1158, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1172 = fma(_1154, _1162, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1176 = _1016 + _1174;
    float _1178 = _1138 * _1124;
    float _1180 = fma(_1170, _1080, _1164);
    float _1182 = _1116 * _1168;
    float _1184 = _992 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1186 = fma(_1178, _1176, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1188 = fma(_1172, _1140, _1180);
    float _1190 = _990 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1192 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1194 = fma(_1186, _1182, _1188);
    float _1196 = _994 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1198 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1194);
    float _1202 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1204 = _1200 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _1198;
    out.m_63.y = _1192;
    out.m_63.z = _1202;
    out.m_63.w = _1204;
    bool _1206 = !_1078;
    float _1222;
    if (!_1206)
    {
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1210 = _174 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _1214 = _1212 * _1208;
        float _1216 = floor(_1214);
        float _1218 = -_1216;
        float _1220 = _1214 + _1218;
        _1222 = _1220;
        _1224 = true;
    }
    else
    {
        _1222 = _156;
    }
    _1224 = false;
    float _1226 = _1222;
    float _1228 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1230 = int(_1228);
    float _1232 = in.m_53.y;
    float _1234 = _600 * _788;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1238 = _1236 != 0;
    float _1240 = in.m_53.z;
    float _1242 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1244 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1246 = int(_1244);
    float _1248 = in.m_65.w;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1252 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1254 = int(_1252);
    float _1256 = float(_1230);
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1262 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1258);
    float _1264 = 1.0 / _1256;
    float _1266 = float(uint(_1246));
    float _1268 = float(_1246);
    float _1270 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1272 = _1246 == 0;
    float _1274 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _1276 = _1246 + (-1);
    float _1278 = 1.0 / _1266;
    float _1280 = float(_1254);
    out.m_67.w = _1248;
    float _1282 = _144 * _1264;
    float _1284 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1286 = int(_1284);
    int _1288 = ~_1246;
    int _1290 = _1288 + 1;
    float _1292 = -_1270;
    float _1294 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1292);
    float _1296 = -_1274;
    float _1298 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1296);
    int _1300 = as_type<int>(_1278) + (-2);
    float _1302 = trunc(_1282);
    int _1304 = int(_1302);
    float _1306 = 1.0 / _1280;
    float _1308 = float(uint(_1286));
    int _1310 = ~_1286;
    int _1312 = _1310 + 1;
    float _1314 = float(uint(_1304));
    float _1316 = 1.0 / _1308;
    float _1318 = as_type<float>(_1300) * _1314;
    float _1320 = _144 * _1306;
    float _1322 = trunc(_1318);
    float _1324 = precise::max(_1322, 0.0);
    uint _1327 = uint(_1324);
    float _1329 = trunc(_1320);
    int _1331 = int(_1329);
    int _1333 = ~_1246;
    int _1335 = _1333 + 1;
    int _1337 = _1290 * int(_1327);
    int _1339 = _1337 + _1304;
    float _1341 = float(uint(_1339));
    float _1343 = float(uint(_1331));
    float _1345 = as_type<float>(_1300) * _1341;
    float _1347 = _1341;
    float _1349 = _1240;
    if (_1238)
    {
        _1347 = 1.0;
    }
    float _1351 = _1347;
    float _1353 = _1351;
    if (!_1238)
    {
        _1353 = 7.345489978790283203125;
    }
    float _1355 = _1353;
    float _1357 = trunc(_1345);
    float _1359 = precise::max(_1357, 0.0);
    uint _1361 = uint(_1359);
    float _1363 = _1355 * _174;
    int _1365 = as_type<int>(_1316) + (-2);
    float _1367 = floor(_1363);
    float _1369 = as_type<float>(_1365) * _1343;
    int _1371 = int(_1327) + int(_1361);
    float _1373 = trunc(_1369);
    float _1375 = precise::max(_1373, 0.0);
    uint _1377 = uint(_1375);
    float _1379 = float(_1304);
    int _1381 = _1335 * _1371;
    int _1383 = _1381 + _1304;
    int _1385 = ~_1286;
    int _1387 = _1385 + 1;
    bool _1389 = _1379 >= _1268;
    bool _1391 = isnan(_1379);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan(_1268);
    bool _1397 = _1393 || _1395;
    float _1399 = float(_1397);
    float _1401 = -_1367;
    float _1403 = _1363 + _1401;
    bool _1405 = uint(_1383) >= uint(_1246);
    bool _1407 = !_1405;
    int _1409 = _1407 ? 0 : (-1);
    float _1411 = trunc(_1399);
    int _1413 = int(_1411);
    int _1415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1417 = _1415 != 0;
    int _1419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1421 = _1419 != 0;
    int _1423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1425 = _1423 != 0;
    int _1427 = ~_1371;
    int _1429 = _1427 + _1409;
    int _1431 = _1429 + 1;
    float _1433 = _1403 * _1268;
    int _1435 = _1387 * int(_1377);
    int _1437 = _1435 + _1331;
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1441 = _1439 != 0;
    float _1443 = _156 * _1268;
    int _1445 = _1246 * _1431;
    int _1447 = _1445 + _1304;
    float _1449 = trunc(_1433);
    int _1451 = int(_1449);
    float _1453 = float(uint(_1437));
    bool _1455 = !_1441;
    int _1457 = _1455 ? 0 : 1;
    bool _1459 = !_1272;
    float _1461 = _1459 ? as_type<float>(_1447) : as_type<float>(0xffffffffu /* nan */);
    float _1463 = as_type<float>(_1365) * _1453;
    int _1465 = ~_1413;
    int _1467 = _1465 + 1;
    int _1469 = _1467 + 1;
    float _1471 = trunc(_1443);
    int _1473 = int(_1471);
    bool _1475 = !_1417;
    int _1477 = _1475 ? 0 : 1;
    int _1479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1481 = _1479 != 0;
    int _1483 = as_type<int>(_1461) * _1469;
    bool _1485 = !_1421;
    int _1487 = _1485 ? 0 : 1;
    int _1489 = abs(_1457);
    float _1491 = trunc(_1463);
    float _1493 = precise::max(_1491, 0.0);
    uint _1495 = uint(_1493);
    int _1497 = abs(_1487);
    int _1499 = _1413 * _1276;
    int _1501 = _1499 + _1483;
    int _1503 = abs(_1477);
    int _1505 = _1451 * _1489;
    int _1507 = _1505 + _1304;
    float _1509 = as_type<float>(_1469);
    float _1511 = _1461;
    if (_1481)
    {
        _1509 = _174;
    }
    float _1513 = _1509;
    float _1515 = _1513;
    if (_1481)
    {
        _1511 = 1.0;
    }
    float _1517 = _1511;
    int _1519 = _1501 * _1497;
    float _1521 = _1517;
    if (!_1481)
    {
        _1515 = _1232;
    }
    float _1523 = _1515;
    if (!_1481)
    {
        _1521 = 1.2345600128173828125;
    }
    float _1525 = _1521;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1529 = _1527 != 0;
    float _1531 = _1523 * _1525;
    bool _1533 = !_1425;
    int _1535 = _1533 ? 0 : 1;
    bool _1537 = !_1529;
    int _1539 = _1537 ? 0 : 1;
    int _1541 = _1473 * _1503;
    int _1543 = _1541 + _1519;
    int _1545 = abs(_1535);
    float _1547 = floor(_1531);
    int _1549 = int(_1377) + int(_1495);
    int _1551 = ~_1286;
    int _1553 = _1551 + 1;
    int _1555 = _1507 * _1545;
    int _1557 = _1555 + _1543;
    int _1559 = abs(_1539);
    float _1561 = float(_1286);
    int _1563 = _1553 * _1549;
    int _1565 = _1563 + _1331;
    float _1567 = float(_1331);
    int _1569 = ~_1246;
    int _1571 = _1569 + 1;
    bool _1573 = _1567 >= _1561;
    bool _1575 = isnan(_1567);
    bool _1577 = _1573 || _1575;
    bool _1579 = isnan(_1561);
    bool _1581 = _1577 || _1579;
    float _1583 = float(_1581);
    int _1585 = _1451 * _1559;
    int _1587 = _1585 + _1557;
    bool _1589 = uint(_1565) >= uint(_1286);
    float _1591 = -_1547;
    float _1593 = _1531 + _1591;
    int _1595 = 0;
    int _1597 = _1549;
    if (_1481)
    {
        _1595 = 0;
    }
    int _1599 = _1595;
    float _1601 = trunc(_1583);
    int _1603 = int(_1601);
    float _1605 = float(uint(_1587));
    bool _1607 = !_1589;
    int _1609 = _1607 ? 0 : (-1);
    int _1611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1613 = _1611 != 0;
    int _1615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1617 = _1615 != 0;
    int _1619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1621 = _1619 != 0;
    int _1623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1625 = _1623 != 0;
    float _1627 = as_type<float>(_1300) * _1605;
    int _1629 = ~_1549;
    int _1631 = _1629 + _1609;
    int _1633 = _1631 + 1;
    bool _1635 = _1246 == 0;
    bool _1637 = !_1617;
    int _1639 = _1637 ? 0 : 1;
    int _1641 = _1286 * _1633;
    int _1643 = _1641 + _1331;
    bool _1645 = _1286 == 0;
    float _1647 = trunc(_1627);
    float _1649 = precise::max(_1647, 0.0);
    uint _1651 = uint(_1649);
    int _1653 = abs(_1639);
    int _1655 = ~_1603;
    int _1657 = _1655 + 1;
    int _1659 = _1657 + 1;
    bool _1661 = !_1645;
    int _1663 = _1661 ? _1643 : (-1);
    float _1665 = _1593 * _1561;
    float _1667 = _156 * _1561;
    bool _1669 = !_1613;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = _1663 * _1659;
    int _1675 = _1286 + (-1);
    float _1677 = trunc(_1665);
    int _1679 = int(_1677);
    int _1681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1683 = _1681 != 0;
    int _1685 = abs(_1671);
    int _1687 = _1603 * _1675;
    int _1689 = _1687 + _1673;
    bool _1691 = !_1621;
    int _1693 = _1691 ? 0 : 1;
    int _1695 = _1571 * int(_1651);
    int _1697 = _1695 + _1587;
    bool _1699 = !_1683;
    int _1701 = _1699 ? 0 : 1;
    float _1703 = trunc(_1667);
    int _1705 = int(_1703);
    bool _1707 = !_1625;
    int _1709 = _1707 ? 0 : 1;
    int _1711 = _1689 * _1653;
    float _1713 = float(uint(_1697));
    int _1715 = abs(_1701);
    int _1717 = abs(_1693);
    float _1719 = as_type<float>(_1300) * _1713;
    float _1721 = trunc(_1719);
    float _1723 = precise::max(_1721, 0.0);
    uint _1725 = uint(_1723);
    int _1727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1729 = _1727 != 0;
    int _1731 = _1679 * _1715;
    int _1733 = _1731 + _1331;
    int _1735 = abs(_1709);
    int _1737 = _1705 * _1685;
    int _1739 = _1737 + _1711;
    int _1741 = ~_1286;
    int _1743 = _1741 + 1;
    float _1745 = float(uint(_1733));
    int _1747 = _1733 * _1717;
    int _1749 = _1747 + _1739;
    int _1751 = _1599;
    int _1753 = as_type<int>(_1719);
    bool _1755 = _1683;
    float _1757 = as_type<float>(_1651);
    if (!_1481)
    {
        _1751 = 2;
    }
    int _1759 = _1751;
    int _1761 = _1679 * _1735;
    int _1763 = _1761 + _1749;
    if (_1729)
    {
        float _1765 = -_352;
        float _1767 = _1765 + 1.0;
        _1753 = as_type<int>(_1767);
    }
    int _1769 = _1753;
    if (_1729)
    {
        bool _1771 = _174 > 0.5;
        _1755 = _1771;
    }
    bool _1773 = _1755;
    float _1775 = as_type<float>(_1365) * _1745;
    int _1777 = int(_1651) + int(_1725);
    float _1779 = float(uint(_1763));
    float _1781 = trunc(_1775);
    float _1783 = precise::max(_1781, 0.0);
    uint _1785 = uint(_1783);
    if (!_1729)
    {
        _1757 = _352;
    }
    float _1787 = _1757;
    float _1789 = float(uint(_1507));
    float _1791 = as_type<float>(_1365) * _1779;
    float _1793 = _1787;
    if (_1729)
    {
        float _1795 = _1773 ? as_type<float>(_1769) : _352;
        _1793 = _1795;
    }
    float _1797 = _1793;
    float _1799 = in.m_53.w;
    int _1801 = ~_1246;
    int _1803 = _1801 + 1;
    float _1805 = as_type<float>(_1300) * _1789;
    float _1807 = trunc(_1791);
    float _1809 = precise::max(_1807, 0.0);
    uint _1811 = uint(_1809);
    int _1813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1815 = _1813 != 0;
    int _1817 = _1803 * _1777;
    int _1819 = _1817 + _1587;
    bool _1821 = _1232 > 0.5;
    float _1823 = trunc(_1805);
    float _1825 = precise::max(_1823, 0.0);
    uint _1827 = uint(_1825);
    bool _1829 = uint(_1819) >= uint(_1246);
    float _1831 = -_498;
    float _1833 = _1831 + 1.0;
    bool _1835 = !_1829;
    int _1837 = _1835 ? 0 : (-1);
    if (_1815)
    {
        float _1839 = -_352;
        float _1841 = _1839 + 1.0;
        _1597 = as_type<int>(_1841);
    }
    int _1843 = _1597;
    int _1845 = _1821 ? as_type<int>(_1833) : as_type<int>(_498);
    int _1847 = _1743 * int(_1811);
    int _1849 = _1847 + _1763;
    bool _1851 = _1240 > 0.5;
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1855 = _1853 != 0;
    float _1857 = float(uint(_1849));
    int _1859 = ~_1246;
    int _1861 = _1859 + 1;
    float _1863 = _1855 ? as_type<float>(_1845) : _498;
    float _1865 = as_type<float>(_1365) * _1857;
    float _1867 = _1857;
    if (!_1815)
    {
        _1867 = _352;
    }
    float _1869 = _1867;
    float _1871 = _1869;
    if (_1815)
    {
        float _1873 = _1851 ? as_type<float>(_1843) : _352;
        _1871 = _1873;
    }
    float _1875 = _1871;
    float _1877 = trunc(_1865);
    float _1879 = precise::max(_1877, 0.0);
    uint _1881 = uint(_1879);
    bool _1883 = _1799 > 0.5;
    int _1885 = _1861 * int(_1827);
    int _1887 = _1885 + _1507;
    int _1889 = ~_1777;
    int _1891 = _1889 + _1837;
    int _1893 = _1891 + 1;
    int _1895 = _1312 * int(_1785);
    int _1897 = _1895 + _1733;
    int _1899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1901 = _1899 != 0;
    float _1903 = float(uint(_1887));
    int _1905 = _1246 * _1893;
    int _1907 = _1905 + _1587;
    int _1909 = _1883 ? as_type<int>(_1833) : as_type<int>(_498);
    float _1911 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1915 = _1913 != 0;
    float _1917 = as_type<float>(_1300) * _1903;
    bool _1919 = !_1635;
    int _1921 = _1919 ? _1907 : (-1);
    float _1923 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1925 = _1915 ? as_type<float>(_1909) : _498;
    float _1927 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1929 = _1921 & 3;
    bool _1931 = _1929 != 0;
    float _1933 = trunc(_1917);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    if (_1901)
    {
        float _1939 = _1851 ? _1833 : _498;
        _614 = _1939;
    }
    float _1941 = _614;
    float _1943 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1911);
    int _1945 = int(_1811) + int(_1881);
    int _1947 = ~_1286;
    int _1949 = _1947 + 1;
    float _1951 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1943);
    float _1953 = float(uint(_1897));
    bool _1955 = uint(_1929) > 1u;
    int _1957 = _1949 * _1945;
    int _1959 = _1957 + _1763;
    int _1961 = _1921 & 3;
    bool _1963 = _1961 != 0;
    float _1965 = as_type<float>(_1365) * _1953;
    float _1967 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1923);
    int _1969 = ~_1246;
    int _1971 = _1969 + 1;
    float _1973 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1927);
    int _1975 = _1963 ? 0 : 1;
    float _1977 = trunc(_1965);
    float _1979 = precise::max(_1977, 0.0);
    uint _1981 = uint(_1979);
    bool _1983 = uint(_1959) >= uint(_1286);
    float _1985 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1967);
    int _1987 = ~_1975;
    int _1989 = _1987 + 1;
    int _1991 = _1989 + 1;
    float _1993 = _1951 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1995 = !_1983;
    int _1997 = _1995 ? 0 : (-1);
    float _1999 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1973);
    bool _2001 = _1929 != 3;
    int _2003 = _1991;
    if (!_1955)
    {
        int _2005 = ~_1975;
        int _2007 = _2005 + 1;
        _2003 = _2007;
    }
    int _2009 = _2003;
    float _2011 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2013 = int(_1827) + int(_1937);
    float _2015 = _1985 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2017 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2019 = _1993 + _2017;
    bool _2021 = uint(_1929) >= 2u;
    float _2023 = _2011 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _2025 = ~_1945;
    int _2027 = _2025 + _1997;
    int _2029 = _2027 + 1;
    int _2031 = _1971 * _2013;
    int _2033 = _2031 + _1507;
    int _2035 = _2021 ? 0 : 1;
    float _2037 = _2019 * _2019;
    int _2039 = int(_1785) + int(_1981);
    int _2041 = _1286 * _2029;
    int _2043 = _2041 + _1763;
    int _2045 = ~_2035;
    int _2047 = _2045 + 1;
    int _2049 = _2047 + 1;
    float _2051 = _1999 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2053 = _2049;
    int _2055 = int(_1937);
    if (_2001)
    {
        int _2057 = ~_2035;
        int _2059 = _2057 + 1;
        _2053 = _2059;
    }
    int _2061 = _2053;
    float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2065 = _2015 + _2063;
    bool _2067 = !_1645;
    int _2069 = _2067 ? _2043 : (-1);
    float _2071 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2073 = _2051 + _2071;
    if (_1481)
    {
        _2055 = 0;
    }
    int _2075 = _2055;
    float _2077 = fma(_2065, _2065, _2037);
    bool _2079 = uint(_2033) >= uint(_1246);
    float _2081 = -_2051;
    float _2083 = _2081 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _2085 = _2075;
    if (!_1481)
    {
        _2085 = 1;
    }
    int _2087 = _2085;
    float _2089 = fma(_2073, _2073, _2077);
    int _2091 = _2069 & 3;
    bool _2093 = _2091 != 0;
    bool _2095 = !_2079;
    int _2097 = _2095 ? 0 : (-1);
    float _2099 = sqrt(_2089);
    int _2101 = _2069 & 3;
    bool _2103 = _2101 != 0;
    bool _2105 = uint(_2091) >= 2u;
    int _2107 = _2103 ? 0 : 1;
    bool _2109 = uint(_2091) > 1u;
    float _2111 = rsqrt(_2089);
    int _2113 = _2105 ? 0 : 1;
    bool _2115 = _2091 != 3;
    int _2117 = ~_1286;
    int _2119 = _2117 + 1;
    int _2121 = ~_2107;
    int _2123 = _2121 + 1;
    int _2125 = _2123 + 1;
    float _2127 = _2099 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2129 = ~_2113;
    int _2131 = _2129 + 1;
    int _2133 = _2131 + 1;
    int _2135 = _2119 * _2039;
    int _2137 = _2135 + _1733;
    bool _2139 = !_1931;
    int _2141 = _2139 ? 0 : 1;
    int _2143 = _2125;
    int _2145 = _2133;
    if (!_2109)
    {
        int _2147 = ~_2107;
        int _2149 = _2147 + 1;
        _2143 = _2149;
    }
    int _2151 = _2143;
    bool _2153 = uint(_2137) >= uint(_1286);
    if (_2115)
    {
        int _2155 = ~_2113;
        int _2157 = _2155 + 1;
        _2145 = _2157;
    }
    int _2159 = _2145;
    float _2161 = in.m_69.x;
    float _2163 = in.m_69.y;
    float _2165 = in.m_69.z;
    int _2167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2169 = _2167 != 0;
    bool _2171 = !_2153;
    int _2173 = _2171 ? 0 : (-1);
    bool _2175 = _1232 > 0.5;
    bool _2177 = _2175 && _2169;
    float _2179 = precise::min(_2023, _2127);
    bool _2181 = _1759 != 2;
    int _2183 = ~_2013;
    int _2185 = _2183 + _2097;
    int _2187 = _2185 + 1;
    float _2189 = _2111 * _2179;
    int _2191 = abs(_2009);
    out.m_71.w = _2179;
    float _2193 = 0.0;
    if (!_2169)
    {
        _2193 = _352;
    }
    float _2195 = _2193;
    float _2197 = _2019 * _2189;
    float _2199 = _2073 * _2189;
    float _2201 = _2195;
    if (_2177)
    {
        float _2203 = -_352;
        float _2205 = _2203 + 1.0;
        _430 = _2205;
    }
    float _2207 = _430;
    bool _2209 = _2087 != 1;
    float _2211 = _2065 * _2189;
    float _2213 = -_2197;
    float _2215 = _2019 + _2213;
    float _2217 = -_2199;
    float _2219 = _2073 + _2217;
    if (_2169)
    {
        _2201 = _2207;
    }
    float _2221 = _2201;
    float _2223 = -_2211;
    float _2225 = _2065 + _2223;
    float _2227 = _2215 * _2215;
    float _2229 = in.m_73.x;
    float _2231 = in.m_73.y;
    float _2233 = in.m_73.z;
    bool _2235 = _2163 != 0.0;
    bool _2237 = isnan(_2163);
    bool _2239 = _2235 || _2237;
    bool _2241 = isnan(0.0);
    bool _2243 = _2239 || _2241;
    float _2245 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2161);
    float _2247 = fma(_2225, _2225, _2227);
    float _2249 = in.m_75.x;
    float _2251 = in.m_75.y;
    float _2253 = in.m_75.z;
    float _2255 = in.m_75.w;
    bool _2257 = _2161 == 0.0;
    bool _2259 = !_2243;
    bool _2261 = _2257 && _2259;
    float _2263 = _610 * _790;
    float _2265 = fma(_2219, _2219, _2247);
    float _2267 = 0.0;
    if (!_2209)
    {
        _2267 = _1232;
    }
    float _2269 = _2267;
    int _2271 = _1246 * _2187;
    int _2273 = _2271 + _1507;
    bool _2275 = _2165 == 0.0;
    bool _2277 = _2275 && _2261;
    float _2279 = 0.0;
    float _2281 = _2269;
    if (_2181)
    {
        _2279 = _174;
    }
    float _2283 = _2279;
    float _2285 = sqrt(_2265);
    float _2287 = 0.0;
    float _2289 = _2283;
    if (!_2209)
    {
        _2287 = _2269;
    }
    float _2291 = _2287;
    float _2293 = _2291;
    if (!_2181)
    {
        _2289 = _1240;
    }
    float _2295 = _2289;
    float _2297 = 0.0;
    if (!_2209)
    {
        _2297 = _1240;
    }
    float _2299 = _2297;
    float _2301 = 0.0;
    float _2303 = _2299;
    if (_2181)
    {
        _2301 = _1232;
    }
    float _2305 = _2301;
    float _2307 = _2305;
    if (_2209)
    {
        _2293 = _174;
    }
    float _2309 = _2293;
    if (_2209)
    {
        _2281 = _174;
    }
    float _2311 = _2281;
    if (_2209)
    {
        _1349 = _1232;
    }
    float _2313 = _1349;
    float _2315 = _2309 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2317 = _2233 * _2251;
    float _2319 = _2229 * _2253;
    float _2321 = _2231 * _2249;
    float _2323 = _2317;
    float _2325 = _2255;
    if (_2209)
    {
        _2303 = _1232;
    }
    float _2327 = _2303;
    float _2329 = _2111 * _2285;
    if (!_2181)
    {
        _2307 = _174;
    }
    float _2331 = _2307;
    float _2333 = -_2319;
    float _2335 = fma(_2233, _2249, _2333);
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2339 = _2337 != 0;
    float _2341 = -_2321;
    float _2343 = fma(_2251, _2229, _2341);
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2347 = _2345 != 0;
    float _2349 = -_2317;
    float _2351 = fma(_2253, _2231, _2349);
    if (_2277)
    {
        _2323 = _2231;
    }
    float _2353 = _2323;
    float _2355 = _1242 * _2329;
    float _2357 = _2353;
    if (!_2277)
    {
        float _2359 = fma(_2163, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2231);
        _2357 = _2359;
    }
    float _2361 = _2357;
    float _2363 = _2351 * _2255;
    float _2365 = _2335 * _2255;
    float _2367 = _2343 * _2255;
    float _2369 = _2263 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_2277)
    {
        _2325 = _2233;
    }
    float _2371 = _2325;
    float _2373 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2163);
    float _2375 = _2371;
    if (!_2277)
    {
        float _2377 = fma(_2165, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2233);
        _2375 = _2377;
    }
    float _2379 = _2375;
    float _2381 = _2355 * _2165;
    float _2383 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2385 = _2369 * _2329;
    float _2387 = 0.0;
    float _2389 = _2379;
    if (_2277)
    {
        _2387 = _2229;
    }
    float _2391 = _2387;
    float _2393 = _2391;
    if (!_2277)
    {
        float _2395 = fma(_2161, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2229);
        _2393 = _2395;
    }
    float _2397 = _2393;
    float _2399 = -_1250;
    float _2401 = fma(_2383, 2.0, _2399);
    float _2403 = _2385 * _2373;
    float _2405 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2407 = _2405 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2409 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2411 = 1.0 / _2407;
    float _2413 = -_2015;
    float _2415 = _2413 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2417 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2419 = fma(_2409, -2.0, _1260);
    float _2421 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2417);
    float _2423 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2425 = _2423 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2427 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2429 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2431 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2433 = _2431 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2435 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2427);
    float _2437 = -_1993;
    float _2439 = _2437 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2441 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2429);
    float _2443 = 1.0 / _2433;
    float _2445 = _2439 * _2439;
    float _2447 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2449 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2451 = fma(_2415, _2415, _2445);
    float _2453 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2455 = -_2447;
    float _2457 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2455);
    float _2459 = 1.0 / _2425;
    float _2461 = fma(_2083, _2083, _2451);
    float _2463 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2465 = _2463 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2467 = -_2449;
    float _2469 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2467);
    float _2471 = -_2453;
    float _2473 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2471);
    float _2475 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2441);
    float _2477 = rsqrt(_2461);
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2481 = _2479 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2483 = _2331 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2485 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2487 = _2485 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2489 = _2313 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2491 = _2011 * _2329;
    float _2493 = 1.0 / _2481;
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2497 = _2495 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2499;
    int _2503 = ~_2191;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    float _2509 = _2491 * _2245;
    int _2511 = abs(_2141);
    float _2513 = _2501 * _2459;
    bool _2515 = !_2093;
    int _2517 = _2515 ? 0 : 1;
    float _2519 = 1.0 / _2465;
    float _2521 = _2415 * _2477;
    float _2523 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2525 = _2439 * _2477;
    int _2527 = abs(_2517);
    float _2529 = -_2523;
    float _2531 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2529);
    bool _2533 = _1929 != 3;
    float _2535 = 1.0 / _2487;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2537;
    float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2543 = _2541 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2545 = ~_2039;
    int _2547 = _2545 + _2173;
    int _2549 = _2547 + 1;
    float _2551 = _2539 * _2411;
    float _2553 = _2543 * _2443;
    float _2555 = _2521 * _2521;
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2559 = _2557 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2561 = _2083 * _2477;
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2565 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2563;
    float _2567 = 1.0 / _2497;
    float _2569 = fma(_2561, _2561, _2555);
    float _2571 = _2565 * _2493;
    float _2573 = _2559 * _2519;
    float _2575 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2577 = _2575 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2581 = _1226 + _2579;
    float _2583 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2585 = _1226 + _2583;
    bool _2587 = !_2533;
    int _2589 = _2587 ? 0 : (-1);
    float _2591 = rsqrt(_2569);
    float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2595 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2593;
    float _2597 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2599 = _1226 + _2597;
    float _2601 = _2577 * _2535;
    float _2603 = fma(_2553, _2581, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2605 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2607 = _1226 + _2605;
    float _2609 = fma(_2551, _2599, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2611 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2613 = _1226 + _2611;
    float _2615 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2617 = _1226 + _2615;
    float _2619 = _2595 * _2567;
    float _2621 = _2469 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2623 = fma(_2513, _2613, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2625 = fma(_2571, _2607, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2627 = fma(_2601, _2585, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2629 = _2473 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2631 = fma(_2573, _2617, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2633 = _2561 * _2591;
    float _2635 = _2521 * _2591;
    float _2637 = _2469 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2639 = -_2629;
    float _2641 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2639);
    float _2643 = -_2633;
    float _2645 = _2561 * _2643;
    float _2647 = _2473 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2649 = -_2637;
    float _2651 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2649);
    float _2653 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2641);
    float _2655 = -_2645;
    float _2657 = fma(_2521, _2635, _2655);
    float _2659 = _2473 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2661 = _2525 * _2635;
    float _2663 = -_2621;
    float _2665 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2663);
    float _2667 = _2657 * _2657;
    float _2669 = -_2647;
    float _2671 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2669);
    float _2673 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2651);
    float _2675 = _2653 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2677 = -_2659;
    float _2679 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2677);
    float _2681 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2683 = fma(_2661, _2661, _2667);
    float _2685 = -_2633;
    float _2687 = _2525 * _2685;
    float _2689 = -_2675;
    float _2691 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2689);
    float _2693 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2679);
    float _2695 = -_2681;
    float _2697 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2695);
    float _2699 = fma(_2687, _2687, _2683);
    float _2701 = _2473 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2703 = fma(_2693, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2691);
    float _2705 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2697);
    bool _2707 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2709 = isnan(_1226);
    bool _2711 = _2707 || _2709;
    bool _2713 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2715 = _2711 || _2713;
    float _2717 = float(_2715);
    float _2719 = -_2701;
    float _2721 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2719);
    float _2723 = rsqrt(_2699);
    float _2725 = -_2705;
    float _2727 = fma(_2725, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2703);
    bool _2729 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2731 = isnan(_1226);
    bool _2733 = _2729 || _2731;
    bool _2735 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2737 = _2733 || _2735;
    float _2739 = float(_2737);
    float _2741 = -_2717;
    float _2743 = _2741 + 1.0;
    bool _2745 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2747 = isnan(_1226);
    bool _2749 = _2745 || _2747;
    bool _2751 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2753 = _2749 || _2751;
    float _2755 = float(_2753);
    float _2757 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2671);
    float _2759 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2665);
    float _2761 = _2739 * _2743;
    float _2763 = 1.0 / _2727;
    float _2765 = -_2739;
    float _2767 = _2765 + 1.0;
    bool _2769 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2771 = isnan(_1226);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2777 = _2773 || _2775;
    float _2779 = float(_2777);
    float _2781 = -_2755;
    float _2783 = _2781 + 1.0;
    float _2785 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2721);
    float _2787 = _2755 * _2767;
    bool _2789 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2791 = isnan(_1226);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2797 = _2793 || _2795;
    float _2799 = float(_2797);
    float _2801 = -_2779;
    float _2803 = _2801 + 1.0;
    float _2805 = _2657 * _2723;
    float _2807 = precise::clamp(_2805, 0.0, 1.0);
    bool _2809 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2811 = isnan(_1226);
    bool _2813 = _2809 || _2811;
    bool _2815 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2817 = _2813 || _2815;
    float _2819 = float(_2817);
    float _2821 = _2779 * _2783;
    float _2823 = _2799 * _2803;
    float _2825 = -_2799;
    float _2827 = _2825 + 1.0;
    float _2829 = -_2807;
    float _2831 = _2829 + 1.0;
    bool _2833 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2835 = isnan(_1226);
    bool _2837 = _2833 || _2835;
    bool _2839 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2841 = _2837 || _2839;
    float _2843 = float(_2841);
    float _2845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2847 = fma(_2757, _2763, -1.0);
    float _2849 = -_2819;
    float _2851 = _2849 + 1.0;
    float _2853 = _2819 * _2827;
    float _2855 = _2831 * _2763;
    float _2857 = fma(_2831, _2847, 1.0);
    bool _2859 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2861 = isnan(_1226);
    bool _2863 = _2859 || _2861;
    bool _2865 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2867 = _2863 || _2865;
    float _2869 = float(_2867);
    float _2871 = _2843 * _2851;
    float _2873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2875 = -_2843;
    float _2877 = _2875 + 1.0;
    float _2879 = _2759 * _2855;
    float _2881 = _2857 * _2857;
    float _2883 = _2785 * _2855;
    float _2885 = _2869 * _2877;
    float _2887 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2889 = _1226 + _2887;
    float _2891 = fma(_2879, _2879, _2881);
    float _2893 = -_2869;
    float _2895 = _2893 + 1.0;
    float _2897 = _2609 * _2885;
    float _2899 = fma(_2619, _2889, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2901 = fma(_2883, _2883, _2891);
    float _2903 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2905 = fma(_2895, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2897);
    int _2907 = _1286 * _2549;
    int _2909 = _2907 + _1733;
    float _2911 = fma(_2903, _1941, -0.5);
    float _2913 = _2873 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2915 = rsqrt(_2901);
    float _2917 = fma(_2603, _2871, _2905);
    float _2919 = fma(_2913, _2221, -0.5);
    float _2921 = _2295 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2923 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2925 = fma(_2623, _2853, _2917);
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2929 = -_2923;
    float _2931 = fma(_2921, 2.0, _2929);
    float _2933 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2935 = fma(_2631, _2823, _2925);
    float _2937 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2927);
    float _2939 = -_144;
    float _2941 = fma(_2939, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2931);
    float _2943 = fma(_2327, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2933);
    float _2945 = _2883 * _2915;
    float _2947 = _2857 * _2915;
    float _2949 = fma(_2475, _2919, _2941);
    int _2951 = _1921 >> 31;
    float _2953 = fma(_2625, _2821, _2935);
    float _2955 = _2879 * _2915;
    float _2957 = -_2945;
    float _2959 = _2521 * _2957;
    float _2961 = _2561 * _2947;
    int _2963 = _2951 & 3;
    float _2965 = fma(_2627, _2787, _2953);
    float _2967 = -_2955;
    float _2969 = -_2959;
    float _2971 = fma(_2561, _2967, _2969);
    float _2973 = -_2945;
    float _2975 = -_2961;
    float _2977 = fma(_2525, _2973, _2975);
    int _2979 = _2069 >> 31;
    float _2981 = -_2955;
    float _2983 = _2525 * _2981;
    int _2985 = _1921 + _2963;
    float _2987 = _2971 * _2971;
    int _2989 = _2979 & 3;
    float _2991 = -_2983;
    float _2993 = fma(_2521, _2947, _2991);
    int _2995 = _2985 >> 2;
    float _2997 = fma(_2977, _2977, _2987);
    int _2999 = _2069 + _2989;
    float _3001 = fma(_2899, _2761, _2965);
    int _3003 = _2995 << 4;
    int _3005 = _3003 + 368;
    float _3007 = fma(_2993, _2993, _2997);
    float _3009 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2435);
    uint _3011 = uint(int(uint(_3005) >> uint(2)));
    uint _3013 = uint(int(uint(int(_3011)) >> uint(2)));
    int _3015 = int(_3011) & 3;
    float _3017 = (*spvDescriptorSet0.vp_c9)._m0[int(_3013)][_3015];
    int _3019 = int(_3011) + 1;
    uint _3021 = uint(int(uint(_3019) >> uint(2)));
    int _3023 = _3019 & 3;
    float _3025 = (*spvDescriptorSet0.vp_c9)._m0[int(_3021)][_3023];
    int _3027 = _2999 >> 2;
    float _3029 = rsqrt(_3007);
    float _3031 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3033 = fma(_2717, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3001);
    int _3035 = _3027 << 4;
    int _3037 = _3035 + 512;
    float _3039 = -_3031;
    float _3041 = fma(_2315, 2.0, _3039);
    int _3043 = _3005 + 8;
    uint _3045 = uint(int(uint(_3043) >> uint(2)));
    uint _3047 = uint(int(uint(int(_3045)) >> uint(2)));
    int _3049 = int(_3045) & 3;
    float _3051 = (*spvDescriptorSet0.vp_c9)._m0[int(_3047)][_3049];
    int _3053 = int(_3045) + 1;
    uint _3055 = uint(int(uint(_3053) >> uint(2)));
    int _3057 = _3053 & 3;
    float _3059 = (*spvDescriptorSet0.vp_c9)._m0[int(_3055)][_3057];
    float _3061 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3063 = abs(_2159);
    float _3065 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _3067 = _2091 != 3;
    float _3069 = fma(_2489, -2.0, _3061);
    out.m_77.x = _3033;
    float _3071 = fma(_2483, -2.0, _3065);
    uint _3073 = uint(int(uint(_3037) >> uint(2)));
    uint _3075 = uint(int(uint(int(_3073)) >> uint(2)));
    int _3077 = int(_3073) & 3;
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[int(_3075)][_3077];
    int _3081 = int(_3073) + 1;
    uint _3083 = uint(int(uint(_3081) >> uint(2)));
    int _3085 = _3081 & 3;
    float _3087 = (*spvDescriptorSet0.vp_c9)._m0[int(_3083)][_3085];
    float _3089 = _2977 * _3029;
    float _3091 = _2993 * _3029;
    float _3093 = _2971 * _3029;
    float _3095 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3071);
    float _3097 = _2561 * _3089;
    float _3099 = _2525 * _3091;
    int _3101 = _3037 + 8;
    uint _3103 = uint(int(uint(_3101) >> uint(2)));
    uint _3105 = uint(int(uint(int(_3103)) >> uint(2)));
    int _3107 = int(_3103) & 3;
    float _3109 = (*spvDescriptorSet0.vp_c9)._m0[int(_3105)][_3107];
    int _3111 = int(_3103) + 1;
    uint _3113 = uint(int(uint(_3111) >> uint(2)));
    int _3115 = _3111 & 3;
    float _3117 = (*spvDescriptorSet0.vp_c9)._m0[int(_3113)][_3115];
    float _3119 = _2521 * _3093;
    float _3121 = -_3097;
    float _3123 = fma(_2521, _3091, _3121);
    float _3125 = -_3099;
    float _3127 = fma(_2561, _3093, _3125);
    int _3129 = abs(_2151);
    float _3131 = -_3119;
    float _3133 = fma(_2525, _3089, _3131);
    float _3135 = _3123 * _3123;
    float _3137 = -_3095;
    float _3139 = fma(_3009, _2911, _3137);
    int _3141 = ~_3129;
    int _3143 = _3141 + 1;
    int _3145 = _3143 + 1;
    float _3147 = fma(_3127, _3127, _3135);
    float _3149 = fma(_3133, _3133, _3147);
    float _3151 = rsqrt(_3149);
    int _3153 = _2507 * as_type<int>(_3025);
    float _3155 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3157 = int(_3155);
    int _3159 = ~_2511;
    int _3161 = _3159 + 1;
    int _3163 = _3161 + 1;
    int _3165 = _3163 * as_type<int>(_3017);
    int _3167 = _3165 + _3153;
    int _3169 = abs(_2061);
    float _3171 = _3133 * _3151;
    float _3173 = _3127 * _3151;
    int _3175 = ~_3169;
    int _3177 = _3175 + 1;
    int _3179 = _3177 + 1;
    int _3181 = _3145 * as_type<int>(_3087);
    int _3183 = ~_2527;
    int _3185 = _3183 + 1;
    int _3187 = _3185 + 1;
    float _3189 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3191 = int(_3189);
    int _3193 = abs(_2589);
    int _3195 = _3179 * as_type<int>(_3051);
    int _3197 = _3195 + _3167;
    bool _3199 = !_2347;
    int _3201 = _3199 ? 0 : 1;
    int _3203 = _3187 * as_type<int>(_3079);
    int _3205 = _3203 + _3181;
    int _3207 = ~_3193;
    int _3209 = _3207 + 1;
    int _3211 = _3209 + 1;
    float _3213 = _3123 * _3151;
    bool _3215 = !_2339;
    int _3217 = _3215 ? 0 : 1;
    float _3219 = _3171 * _2251;
    int _3221 = abs(_3201);
    float _3223 = _2521 * _3171;
    int _3225 = _3211 * as_type<int>(_3059);
    int _3227 = _3225 + _3197;
    float _3229 = float(uint(_3157));
    float _3231 = _2561 * _3213;
    int _3233 = abs(_3217);
    float _3235 = -_3223;
    float _3237 = fma(_2561, _3173, _3235);
    bool _3239 = !_3067;
    int _3241 = _3239 ? 0 : (-1);
    float _3243 = 1.0 / _3229;
    int _3245 = ~_3063;
    int _3247 = _3245 + 1;
    int _3249 = _3247 + 1;
    float _3251 = -_3231;
    float _3253 = fma(_2525, _3171, _3251);
    float _3255 = _3237 * _3237;
    int _3257 = ~_3157;
    int _3259 = _3257 + 1;
    float _3261 = _2365 * _3213;
    int _3263 = _3249 * as_type<int>(_3109);
    int _3265 = _3263 + _3205;
    float _3267 = float(uint(_3191));
    float _3269 = fma(_3253, _3253, _3255);
    int _3271 = abs(_3241);
    float _3273 = _2525 * _3173;
    float _3275 = 1.0 / _3267;
    int _3277 = ~_3191;
    int _3279 = _3277 + 1;
    float _3281 = _2365 * _3171;
    float _3283 = -_3273;
    float _3285 = fma(_2521, _3213, _3283);
    int _3287 = ~_3233;
    int _3289 = _3287 + 1;
    int _3291 = _3289 + 1;
    int _3293 = ~_3271;
    int _3295 = _3293 + 1;
    int _3297 = _3295 + 1;
    float _3299 = fma(_3285, _3285, _3269);
    int _3301 = abs(_3157);
    int _3303 = _3227 * _3291;
    int _3305 = ~_3221;
    int _3307 = _3305 + 1;
    int _3309 = _3307 + 1;
    int _3311 = _3297 * as_type<int>(_3117);
    int _3313 = _3311 + _3265;
    bool _3315 = !_1635;
    int _3317 = _3315 ? _2273 : (-1);
    float _3319 = rsqrt(_3299);
    int _3321 = _3313 * _3309;
    bool _3323 = !_1645;
    int _3325 = _3323 ? _2909 : (-1);
    int _3327 = _3317 * _3233;
    int _3329 = _3327 + _3303;
    int _3331 = abs(_3191);
    float _3333 = _2403 * _3171;
    int _3335 = as_type<int>(_3243) + (-2);
    int _3337 = _3325 * _3221;
    int _3339 = _3337 + _3321;
    float _3341 = float(uint(_3331));
    float _3343 = _2403 * _3173;
    float _3345 = float(uint(_3301));
    float _3347 = _3171 * _2361;
    float _3349 = 1.0 / _3341;
    int _3351 = as_type<int>(_3275) + (-2);
    float _3353 = _3285 * _3319;
    float _3355 = float(uint(_3329));
    float _3357 = _3253 * _3319;
    int _3359 = abs(_3329);
    float _3361 = fma(_2509, _3353, _3333);
    float _3363 = 1.0 / _3345;
    float _3365 = as_type<float>(_3335) * _3355;
    float _3367 = float(uint(_3339));
    float _3369 = fma(_2561, _2381, _3361);
    float _3371 = fma(_2509, _3357, _3343);
    int _3373 = ~_3331;
    int _3375 = _3373 + 1;
    float _3377 = as_type<float>(_3351) * _3367;
    float _3379 = trunc(_3365);
    float _3381 = precise::max(_3379, 0.0);
    uint _3383 = uint(_3381);
    int _3385 = as_type<int>(_3349) + (-2);
    float _3387 = fma(_2521, _2381, _3371);
    float _3389 = _2051 + _3369;
    float _3391 = fma(_3353, _2249, _3219);
    float _3393 = _2015 + _3387;
    float _3395 = float(uint(_3359));
    float _3397 = trunc(_3377);
    float _3399 = precise::max(_3397, 0.0);
    uint _3401 = uint(_3399);
    int _3403 = as_type<int>(_3363) + (-2);
    float _3405 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3407 = _3389 + _3405;
    int _3409 = abs(_3339);
    float _3411 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3413 = _3393 + _3411;
    float _3415 = as_type<float>(_3403) * _3395;
    float _3417 = _3407 * _3407;
    int _3419 = _3259 * int(_3383);
    int _3421 = _3419 + _3329;
    float _3423 = _3139 + 0.5;
    float _3425 = fma(_3413, _3413, _3417);
    float _3427 = trunc(_3415);
    float _3429 = precise::max(_3427, 0.0);
    uint _3431 = uint(_3429);
    float _3433 = float(uint(_3421));
    float _3435 = _2949 + 0.5;
    int _3437 = ~_3301;
    int _3439 = _3437 + 1;
    int _3441 = _3279 * int(_3401);
    int _3443 = _3441 + _3339;
    float _3445 = float(uint(_3409));
    float _3447 = as_type<float>(_3335) * _3433;
    out.m_79.x = _3435;
    out.m_79.y = _3423;
    float _3449 = sqrt(_3425);
    float _3451 = float(uint(_3443));
    float _3453 = as_type<float>(_3385) * _3445;
    float _3455 = _3213 * _2251;
    float _3457 = as_type<float>(_3351) * _3451;
    float _3459 = _3173 * _2251;
    float _3461 = trunc(_3453);
    float _3463 = precise::max(_3461, 0.0);
    uint _3465 = uint(_3463);
    int _3467 = _3439 * int(_3431);
    int _3469 = _3467 + _3359;
    float _3471 = _2365 * _3173;
    float _3473 = _3213 * _2361;
    float _3475 = _2403 * _3213;
    float _3477 = fma(_3357, _2249, _3459);
    float _3479 = float(uint(_3469));
    float _3481 = _3237 * _3319;
    float _3483 = trunc(_3447);
    float _3485 = precise::max(_3483, 0.0);
    uint _3487 = uint(_3485);
    float _3489 = _3173 * _2361;
    bool _3491 = _3449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3493 = as_type<float>(_3403) * _3479;
    float _3495 = fma(_2509, _3481, _3475);
    int _3497 = ~_3157;
    int _3499 = _3497 + 1;
    float _3501 = fma(_3481, _2249, _3455);
    float _3503 = fma(_2363, _3357, _3471);
    int _3505 = _3375 * int(_3465);
    int _3507 = _3505 + _3409;
    float _3509 = trunc(_3457);
    float _3511 = precise::max(_3509, 0.0);
    uint _3513 = uint(_3511);
    float _3515 = fma(_2525, _2381, _3495);
    int _3517 = ~_3191;
    int _3519 = _3517 + 1;
    float _3521 = fma(_2363, _3481, _3261);
    float _3523 = float(uint(_3507));
    float _3525 = fma(_2363, _3353, _3281);
    float _3527 = fma(_3481, _2397, _3473);
    int _3529 = int(_3383) + int(_3487);
    float _3531 = trunc(_3493);
    float _3533 = precise::max(_3531, 0.0);
    uint _3535 = uint(_3533);
    float _3537 = as_type<float>(_3385) * _3523;
    float _3539 = fma(_3353, _2397, _3347);
    float _3541 = fma(_2521, _2253, _3477);
    int _3543 = _3499 * _3529;
    int _3545 = _3543 + _3329;
    float _3547 = fma(_2525, _2253, _3501);
    float _3549 = fma(_3357, _2397, _3489);
    float _3551 = fma(_2561, _2253, _3391);
    float _3553 = trunc(_3537);
    float _3555 = precise::max(_3553, 0.0);
    uint _3557 = uint(_3555);
    int _3559 = int(_3401) + int(_3513);
    float _3561 = _1993 + _3515;
    bool _3563 = uint(_3545) >= uint(_3157);
    int _3565 = ~_3301;
    int _3567 = _3565 + 1;
    int _3569 = _3519 * _3559;
    int _3571 = _3569 + _3339;
    int _3573 = ~_3331;
    int _3575 = _3573 + 1;
    int _3577 = int(_3431) + int(_3535);
    float _3579 = as_type<float>(_3545);
    float _3581 = _3515;
    float _3583 = _3473;
    float _3585 = _3541;
    float _3587 = _3547;
    if (!_3491)
    {
        _3579 = _3393;
    }
    float _3589 = _3579;
    float _3591 = _3589;
    if (!_3491)
    {
        _3581 = _3389;
    }
    float _3593 = _3581;
    float _3595 = _3593;
    if (!_3491)
    {
        _3583 = _3561;
    }
    float _3597 = _3583;
    int _3599 = int(_3465) + int(_3557);
    bool _3601 = !_3491;
    float _3603 = _3597;
    if (!_3601)
    {
        float _3605 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3607 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3609 = _3449 + _3607;
        float _3611 = _3561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3613 = rsqrt(_3425);
        float _3615 = _3609 * _3605;
        float _3617 = _3615 * 0.15915493667125701904296875;
        float _3619 = _3617 * 6.283185482025146484375;
        float _3621 = cos(_3619);
        float _3623 = _3617 * 6.283185482025146484375;
        float _3625 = sin(_3623);
        float _3627 = _3621 + (-1.0);
        float _3629 = fma(_3625, _3611, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3631 = _3627 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3633 = _3613 * _3629;
        float _3635 = fma(_3561, _3621, _3631);
        float _3637 = fma(_3413, _3633, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3639 = fma(_3407, _3633, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3591 = _3637;
        _3603 = _3635;
        _3595 = _3639;
    }
    float _3641 = _3591;
    float _3643 = _3603;
    float _3645 = _3595;
    bool _3647 = !_3563;
    int _3649 = _3647 ? 0 : (-1);
    float _3651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3653 = _3567 * _3577;
    int _3655 = _3653 + _3359;
    bool _3657 = uint(_3571) >= uint(_3191);
    int _3659 = _3575 * _3599;
    int _3661 = _3659 + _3409;
    int _3663 = ~_3529;
    int _3665 = _3663 + _3649;
    int _3667 = _3665 + 1;
    float _3669 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2419);
    bool _3671 = uint(_3655) >= uint(_3301);
    float _3673 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3069);
    bool _3675 = !_3657;
    int _3677 = _3675 ? 0 : (-1);
    int _3679 = _3157 * _3667;
    int _3681 = _3679 + _3329;
    bool _3683 = _3157 == 0;
    float _3685 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2421);
    bool _3687 = _3157 == 0;
    float _3689 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2943);
    int _3691 = _3329 ^ _3157;
    out.m_81.x = _2491;
    int _3693 = ~_3559;
    int _3695 = _3693 + _3677;
    int _3697 = _3695 + 1;
    float _3699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3701 = !_3683;
    int _3703 = _3701 ? _3681 : (-1);
    bool _3705 = uint(_3661) >= uint(_3331);
    int _3707 = _3191 * _3697;
    int _3709 = _3707 + _3339;
    int _3711 = _3339 ^ _3191;
    float _3713 = _3651 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3715 = _3191 == 0;
    float _3717 = fma(_2561, _2379, _3539);
    bool _3719 = _3191 == 0;
    float _3721 = -_144;
    float _3723 = fma(_3721, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2401);
    float _3725 = float(_3703);
    float _3727 = fma(_3713, _1797, -0.5);
    bool _3729 = !_3705;
    int _3731 = _3729 ? 0 : (-1);
    float _3733 = -_2211;
    float _3735 = _2015 + _3733;
    bool _3737 = !_3671;
    int _3739 = _3737 ? 0 : (-1);
    float _3741 = fma(_3713, _3725, _3723);
    uint _3743 = uint(int(uint(_3691) >> uint(31)));
    float _3745 = _3699 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3747 = ~_3731;
    int _3749 = _3599 + _3747;
    int _3751 = _3749 + 1;
    float _3753 = -_144;
    float _3755 = fma(_3753, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3041);
    bool _3757 = !_3715;
    int _3759 = _3757 ? _3709 : (-1);
    float _3761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _3763 = uint(int(uint(_3711) >> uint(31)));
    float _3765 = fma(_3745, _1875, -0.5);
    int _3767 = ~_3739;
    int _3769 = _3577 + _3767;
    int _3771 = _3769 + 1;
    float _3773 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1262);
    int _3775 = ~int(_3743);
    int _3777 = _3775 + 1;
    float _3779 = fma(_2521, _2379, _3549);
    float _3781 = float(_3759);
    float _3783 = fma(_3773, _3727, _3741);
    int _3785 = ~int(_3763);
    int _3787 = _3785 + 1;
    out.m_83.x = _3541;
    out.m_83.y = _3547;
    out.m_83.z = _3551;
    int _3789 = _3771 ^ _3777;
    float _3791 = fma(_3745, _3781, _3755);
    int _3793 = _3751 ^ _3787;
    float _3795 = -_2199;
    float _3797 = _2051 + _3795;
    int _3799 = ~_3777;
    int _3801 = _3799 + _3789;
    int _3803 = _3801 + 1;
    float _3805 = _3761 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3807 = ~_3787;
    int _3809 = _3807 + _3793;
    int _3811 = _3809 + 1;
    float _3813 = _2367 * _2521;
    float _3815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3817 = !_3687;
    int _3819 = _3817 ? _3803 : (-1);
    float _3821 = fma(_1863, _3805, -0.5);
    float _3823 = _2367 * _2525;
    float _3825 = _2367 * _2561;
    float _3827 = float(_3819);
    float _3829 = _3813 + _3503;
    bool _3831 = !_3719;
    int _3833 = _3831 ? _3811 : (-1);
    float _3835 = _3823 + _3521;
    float _3837 = -_2015;
    float _3839 = _3837 + _3641;
    float _3841 = -_3669;
    float _3843 = fma(_3805, _3827, _3841);
    float _3845 = -_1993;
    float _3847 = _3845 + _3643;
    float _3849 = _3825 + _3525;
    float _3851 = float(_3833);
    float _3853 = -_2051;
    float _3855 = _3853 + _3645;
    float _3857 = _3847 * _3847;
    float _3859 = _3815 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3861 = fma(_3685, _3821, _3843);
    float _3863 = fma(_2525, _2379, _3527);
    float _3865 = fma(_3839, _3839, _3857);
    float _3867 = fma(_1925, _3859, -0.5);
    float _3869 = -_3673;
    float _3871 = fma(_3859, _3851, _3869);
    float _3873 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2937);
    float _3875 = fma(_3855, _3855, _3865);
    float _3877 = _3783 + 0.5;
    float _3879 = _3861 + 0.5;
    float _3881 = fma(_3873, _3765, _3791);
    float _3883 = fma(_3689, _3867, _3871);
    float _3885 = sqrt(_3875);
    out.m_85.x = _3829;
    out.m_85.y = _3835;
    out.m_85.z = _3849;
    float _3887 = _3881 + 0.5;
    float _3889 = _3883 + 0.5;
    float _3891 = -_2211;
    float _3893 = _3891 + _3641;
    out.m_87.x = _3779;
    out.m_87.y = _3863;
    out.m_87.z = _3717;
    float _3895 = -_2197;
    float _3897 = _3895 + _3643;
    float _3899 = -_2197;
    float _3901 = _1993 + _3899;
    out.m_89.x = _3877;
    out.m_89.y = _3879;
    out.m_89.z = _3887;
    out.m_89.w = _3889;
    bool _3903 = _3885 > 0.0;
    float _3905 = -_2199;
    float _3907 = _3905 + _3645;
    float _3909 = _3835;
    float _3911 = _3829;
    float _3913 = _3847;
    if (!_3903)
    {
        _2389 = _3893;
    }
    float _3915 = _2389;
    float _3917 = _3915;
    float _3919 = _3915;
    if (!_3903)
    {
        _3585 = _3897;
    }
    float _3921 = _3585;
    float _3923 = _3921;
    float _3925 = _3921;
    if (!_3903)
    {
        _3587 = _3907;
    }
    float _3927 = _3587;
    bool _3929 = !_3903;
    float _3931 = _3927;
    float _3933 = _3927;
    if (!_3929)
    {
        bool _3935 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3937 = _3551;
        if (_3935)
        {
            float _3939 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3937 = _3939;
        }
        float _3941 = _3937;
        float _3943 = _3941;
        if (_3935)
        {
            float _3945 = _602 * _3941;
            _3909 = _3945;
        }
        float _3947 = _3909;
        float _3949 = _3947;
        if (_3935)
        {
            float _3951 = _604 * _3941;
            _3911 = _3951;
        }
        float _3953 = _3911;
        float _3955 = _3953;
        if (_3935)
        {
            float _3957 = _606 * _3941;
            _3943 = _3957;
        }
        float _3959 = _3943;
        float _3961 = _3959;
        if (!_3935)
        {
            bool _3963 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3965 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3967 = _3963 || _3965;
            bool _3969 = isnan(1.0);
            bool _3971 = _3967 || _3969;
            float _3973 = _144 + 1.0;
            if (!_3971)
            {
                float _3975 = _3973 * _3973;
                float _3977 = _3975 * 0.5;
                _166 = _3977;
            }
            float _3979 = _166;
            float _3981 = _3979;
            if (!_3971)
            {
                float _3983 = _3979 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3981 = _3983;
            }
            float _3985 = _3981;
            bool _3987 = !_3971;
            float _3989 = _3985;
            if (!_3987)
            {
                float _3991 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3993 = log2(_3991);
                float _3995 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3997 = _3995 + 1.0;
                float _3999 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4001 = _3993 * _3973;
                float _4003 = 1.0 / _3997;
                float _4005 = _3999 * 0.693147182464599609375;
                float _4007 = exp2(_4001);
                float _4009 = 1.0 / _4005;
                float _4011 = _4007 + (-1.0);
                float _4013 = -_4011;
                float _4015 = fma(_4013, _4009, _3973);
                float _4017 = _4015 * _4003;
                float _4019 = _4017 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3989 = _4019;
            }
            float _4021 = _3989;
            float _4023 = _4021 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _4025 = _4021 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4027 = _4021 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4029 = _4021;
            if (!_3971)
            {
                _4029 = _3973;
            }
            float _4031 = _4029;
            float _4033 = _4023 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _4035 = _4023 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _4037 = _4023 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _4039 = fma(_4025, (*spvDescriptorSet0.vp_c10)._m0[8].y, _4033);
            float _4041 = fma(_4025, (*spvDescriptorSet0.vp_c10)._m0[8].x, _4035);
            float _4043 = fma(_4027, (*spvDescriptorSet0.vp_c10)._m0[10].y, _4039);
            bool _4045 = !_3971;
            float _4047 = _4031;
            if (!_4045)
            {
                float _4049 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4051 = log2(_4049);
                float _4053 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4055 = _4053 + 1.0;
                float _4057 = 1.0 / _4055;
                float _4059 = _4051 * _3973;
                float _4061 = exp2(_4059);
                float _4063 = -_4061;
                float _4065 = _4063 + 1.0;
                float _4067 = _4065 * _4057;
                _4047 = _4067;
                _202 = _4057;
            }
            float _4069 = _4047;
            float _4071 = _202;
            float _4073 = fma(_4025, (*spvDescriptorSet0.vp_c10)._m0[8].z, _4037);
            float _4075 = fma(_4069, _314, _4043);
            float _4077 = fma(_4027, (*spvDescriptorSet0.vp_c10)._m0[10].x, _4041);
            float _4079 = fma(_4027, (*spvDescriptorSet0.vp_c10)._m0[10].z, _4073);
            float _4081 = -_540;
            float _4083 = _4081 + _4075;
            float _4085 = fma(_4069, _312, _4077);
            float _4087 = fma(_4069, _316, _4079);
            float _4089 = _4083 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4091 = _4083 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4093 = -_544;
            float _4095 = _4093 + _4085;
            float _4097 = _4083 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4099 = -_546;
            float _4101 = _4099 + _4087;
            float _4103 = fma(_4095, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4089);
            float _4105 = fma(_4095, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4091);
            float _4107 = fma(_4095, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4097);
            float _4109 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4103);
            float _4111 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4105);
            float _4113 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4107);
            _616 = _4111;
            _618 = _4109;
            _620 = _4113;
            _3949 = _4109;
            _3955 = _4111;
            _3961 = _4113;
            _3917 = _4079;
            _3923 = _4107;
            _3931 = _4077;
            _390 = _4105;
            _204 = _4071;
        }
        float _4115 = _616;
        float _4117 = _618;
        float _4119 = _620;
        float _4121 = _3949;
        float _4123 = _3955;
        float _4125 = _3961;
        float _4127 = _3917;
        float _4129 = _3923;
        float _4131 = _3931;
        float _4133 = _390;
        float _4135 = _204;
        float _4137 = _4115 * _4115;
        float _4139 = rsqrt(_3875);
        float _4141 = fma(_4117, _4117, _4137);
        float _4143 = fma(_4119, _4119, _4141);
        float _4145 = sqrt(_4143);
        float _4147 = _3839 * _4139;
        float _4149 = _3847 * _4139;
        float _4151 = _3855 * _4139;
        bool _4153 = _4145 > 0.0;
        float _4155 = _4127;
        float _4157 = _4129;
        float _4159 = _4131;
        _392 = _4133;
        _3913 = _4149;
        _622 = _4115;
        _206 = _4135;
        if (!_4153)
        {
            _4155 = _3893;
        }
        float _4161 = _4155;
        _3919 = _4161;
        if (!_4153)
        {
            _4157 = _3897;
        }
        float _4163 = _4157;
        _3925 = _4163;
        if (!_4153)
        {
            _4159 = _3907;
        }
        float _4165 = _4159;
        bool _4167 = !_4153;
        _3933 = _4165;
        if (!_4167)
        {
            float _4169 = rsqrt(_4143);
            float _4171 = _4169 * _4115;
            float _4173 = _4169 * _4117;
            float _4175 = _4169 * _4119;
            float _4177 = _4149 * _4171;
            float _4179 = fma(_4147, _4173, _4177);
            float _4181 = fma(_4151, _4175, _4179);
            float _4183 = _4181 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4185 = fma(_4121, _4183, _3893);
            float _4187 = fma(_4123, _4183, _3897);
            float _4189 = fma(_4125, _4183, _3907);
            _3919 = _4185;
            _3925 = _4187;
            _3933 = _4189;
            _392 = _4177;
        }
    }
    float _4191 = _3919;
    float _4193 = _3925;
    float _4195 = _3933;
    float _4197 = _392;
    float _4199 = _3913;
    float _4201 = _622;
    float _4203 = _206;
    float _4205 = _3901 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4207 = fma(_3735, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4205);
    float _4209 = _3901 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4211 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4213 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4215 = _4211 || _4213;
    bool _4217 = isnan(0.5);
    bool _4219 = _4215 || _4217;
    float _4221 = fma(_3797, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4207);
    float _4223 = fma(_3735, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4209);
    float _4225 = _4221 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4227 = fma(_3797, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4223);
    bool _4229 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4231 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4233 = _4229 || _4231;
    bool _4235 = isnan(0.5);
    bool _4237 = _4233 || _4235;
    float _4239 = 1.0 / _4225;
    float _4241 = _4227 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4243 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4245 = _4241;
    float _4247 = _4197;
    float _4249 = _4221;
    float _4251 = _4199;
    float _4253 = _4201;
    float _4255 = _4203;
    if (_4219)
    {
        _4243 = _4191;
    }
    float _4257 = _4243;
    float _4259 = _4241 + _4225;
    float _4261 = _4257;
    if (_4219)
    {
        _4245 = _4193;
    }
    float _4263 = _4245;
    float _4265 = _4263;
    if (_4219)
    {
        _4247 = _4195;
    }
    float _4267 = _4247;
    float _4269 = _4267;
    if (!_4219)
    {
        float _4271 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4273 = _3901 + _4271;
        float _4275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4277 = _3735 + _4275;
        float _4279 = -_3735;
        float _4281 = _4279 + _4191;
        float _4283 = -_3901;
        float _4285 = _4283 + _4193;
        float _4287 = _4273 * _4273;
        float _4289 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4291 = _3797 + _4289;
        float _4293 = -_3797;
        float _4295 = _4293 + _4195;
        float _4297 = fma(_4277, _4277, _4287);
        float _4299 = fma(_4291, _4291, _4297);
        float _4301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4303 = sqrt(_4299);
        float _4305 = precise::min(_4303, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4307 = _4305 * _4301;
        float _4309 = fma(_4281, _4307, _3735);
        float _4311 = fma(_4285, _4307, _3901);
        float _4313 = fma(_4295, _4307, _3797);
        _4265 = _4311;
        _4261 = _4309;
        _4269 = _4313;
        _4249 = _4303;
    }
    float _4315 = _4265;
    float _4317 = _4261;
    float _4319 = _4269;
    float _4321 = _4249;
    float _4323 = _4321;
    if (_4237)
    {
        _4323 = 1.0;
    }
    float _4325 = _4323;
    float _4327 = _4259 * _4239;
    float _4329 = _4327 * 0.5;
    float _4331 = _4325;
    float _4333 = _4329;
    if (!_4237)
    {
        float _4335 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4337 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4339 = fma(_4329, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4337);
        float _4341 = _4335 * 0.15915493667125701904296875;
        float _4343 = _4341 * 6.283185482025146484375;
        float _4345 = cos(_4343);
        float _4347 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4349 = _4347 * 0.15915493667125701904296875;
        float _4351 = _4341 * 6.283185482025146484375;
        float _4353 = sin(_4351);
        float _4355 = 1.0 / _4345;
        float _4357 = _4349 * 6.283185482025146484375;
        float _4359 = cos(_4357);
        float _4361 = _4353 * _4355;
        float _4363 = 1.0 / _4339;
        float _4365 = _4359 * _4361;
        float _4367 = _4349 * 6.283185482025146484375;
        float _4369 = sin(_4367);
        float _4371 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4373 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4371;
        float _4375 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4377 = _4363 * _4375;
        float _4379 = 1.0 / _4365;
        float _4381 = 1.0 / _4373;
        float _4383 = _4369 * _4379;
        float _4385 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4387 = fma(_4383, _4377, _4385);
        float _4389 = _4387 * _4381;
        float _4391 = precise::clamp(_4389, 0.0, 1.0);
        _4331 = _4391;
    }
    float _4393 = _4331;
    float _4395 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4397 = _4315 + _4395;
    float _4399 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4401 = _4317 + _4399;
    float _4403 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4405 = _4319 + _4403;
    float _4407 = _4397 * _4397;
    float _4409 = fma(_4401, _4401, _4407);
    float _4411 = fma(_4405, _4405, _4409);
    float _4413 = rsqrt(_4411);
    float _4415 = sqrt(_4411);
    float _4417 = _4413 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4419 = _4401 * _4417;
    float _4421 = _4405 * _4417;
    float _4423 = _4419 * _4419;
    float _4425 = _4421 * _4421;
    float _4427 = _4423 + _4425;
    float _4429 = sqrt(_4427);
    bool _4431 = _4429 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4433 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4435 = _4429 + _4433;
    float _4437 = _4413;
    float _4439 = _4427;
    float _4441 = _4435;
    float _4443 = _4397;
    if (_4431)
    {
        float _4445 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4437 = _4445;
    }
    float _4447 = _4437;
    if (_4431)
    {
        float _4449 = rsqrt(_4427);
        _4439 = _4449;
    }
    float _4451 = _4439;
    if (_4431)
    {
        float _4453 = _4435 * _4447;
        _4441 = _4453;
    }
    float _4455 = _4441;
    if (_4431)
    {
        float _4457 = _4455 * 0.15915493667125701904296875;
        _4251 = _4457;
    }
    float _4459 = _4251;
    float _4461 = _4405;
    if (_4431)
    {
        float _4463 = _4459 * 6.283185482025146484375;
        float _4465 = sin(_4463);
        _4461 = _4465;
    }
    float _4467 = _4461;
    float _4469 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4471 = precise::max(0.0, _4469);
    float _4473 = _4447;
    float _4475 = _4471;
    if (_4431)
    {
        float _4477 = _4459 * 6.283185482025146484375;
        float _4479 = cos(_4477);
        _4473 = _4479;
    }
    float _4481 = _4473;
    float _4483 = -_4417;
    float _4485 = -_4471;
    float _4487 = fma(_4397, _4483, _4485);
    if (_4431)
    {
        float _4489 = _4487 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4443 = _4489;
    }
    float _4491 = _4443;
    float _4493 = _4467;
    float _4495 = _4491;
    if (_4431)
    {
        float _4497 = fma(_4467, _4491, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4333 = _4497;
    }
    float _4499 = _4333;
    float _4501 = _4499;
    if (!_4431)
    {
        _4493 = _4419;
    }
    float _4503 = _4493;
    float _4505 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4507 = fma(_4415, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4505);
    float _4509 = precise::clamp(_4507, 0.0, 1.0);
    float _4511 = _4503;
    if (!_4431)
    {
        _4495 = _4487;
    }
    float _4513 = _4495;
    float _4515 = _4513;
    float _4517 = _4481;
    if (_4431)
    {
        float _4519 = _4481 + (-1.0);
        _4475 = _4519;
    }
    float _4521 = _4475;
    float _4523 = _4521;
    if (_4431)
    {
        float _4525 = _4451 * _4499;
        _4253 = _4525;
    }
    float _4527 = _4253;
    if (!_4431)
    {
        _4501 = _4423;
    }
    float _4529 = _4501;
    float _4531 = _4315 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4533 = _4529;
    if (_4431)
    {
        float _4535 = _4521 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4255 = _4535;
    }
    float _4537 = _4255;
    if (_4431)
    {
        float _4539 = _4419 * _4527;
        _4511 = _4539;
    }
    float _4541 = _4511;
    if (!_4431)
    {
        _4523 = _4421;
    }
    float _4543 = _4523;
    float _4545 = _4543;
    if (_4431)
    {
        float _4547 = _4421 * _4527;
        _4545 = _4547;
    }
    float _4549 = _4545;
    if (_4431)
    {
        float _4551 = fma(_4487, _4481, _4537);
        _4515 = _4551;
    }
    float _4553 = _4515;
    if (_4431)
    {
        float _4555 = _4541 * _4541;
        _4533 = _4555;
    }
    float _4557 = _4533;
    if (!_4431)
    {
        _4517 = _4425;
    }
    float _4559 = _4517;
    float _4561 = _4559;
    if (_4431)
    {
        float _4563 = _4549 * _4549;
        _4561 = _4563;
    }
    float _4565 = _4561;
    float _4567 = -_4509;
    float _4569 = _4567 + 1.0;
    float _4571 = fma(_4553, _4553, _4557);
    float _4573 = _4315 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4575 = _4571 + _4565;
    float _4577 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4531);
    float _4579 = _4315 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4581 = abs(_4569);
    float _4583 = log2(_4581);
    float _4585 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4587 = fma(_4319, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4577);
    float _4589 = _4315 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4591 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4579);
    float _4593 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4573);
    float _4595 = _4587 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4597 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4589);
    float _4599 = rsqrt(_4575);
    float _4601 = fma(_4319, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4591);
    float _4603 = fma(_4319, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4593);
    float _4605 = fma(_4319, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4597);
    float _4607 = _4601 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4609 = _4603 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4611 = _4605 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4613 = _4583 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4615 = _4595 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4617 = -_4615;
    float _4619 = fma(_4617, _4585, 1.0);
    float _4621 = _4607 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4623 = exp2(_4613);
    float _4625 = _4599 * _4541;
    float _4627 = _4599 * _4553;
    float _4629 = fma(_4611, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4621);
    float _4631 = _4599 * _4549;
    float _4633 = _4625 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4635 = fma(_4595, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4629);
    float _4637 = log2(_4619);
    float _4639 = -_4633;
    float _4641 = fma(_4627, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4639);
    float _4643 = _4607 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4645 = fma(_4609, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4635);
    float _4647 = -_4631;
    float _4649 = fma(_4647, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4641);
    float _4651 = _4607 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4653 = fma(_4611, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4643);
    float _4655 = 1.0 / _4645;
    float _4657 = fma(_4649, -0.5, 0.5);
    float _4659 = fma(_4611, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4651);
    float _4661 = fma(_4649, 0.5, 0.5);
    float _4663 = _4627 + 1.0;
    float _4665 = fma(_4595, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4653);
    float _4667 = fma(_4595, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4659);
    float _4669 = fma(_4661, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4671 = sqrt(_4657);
    float _4673 = -_4627;
    float _4675 = fma(_4623, _4663, _4673);
    float _4677 = fma(_4609, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4667);
    float _4679 = fma(_4609, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4665);
    float _4681 = fma(_4661, _4669, -0.212114393711090087890625);
    float _4683 = _4637 * 0.693147182464599609375;
    float _4685 = fma(_4675, 0.5, 0.5);
    float _4687 = _4677 * _4655;
    float _4689 = _4679 * _4655;
    float _4691 = fma(_4661, _4681, 1.570728778839111328125);
    float _4693 = _4683 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4695 = fma(_4687, 0.5, 0.5);
    float _4697 = fma(_4689, -0.5, 0.5);
    float _4699 = _4671 * 0.636619746685028076171875;
    float3 _12094 = float3(_4695, _4697, _4693);
    float _4701 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12094, float3(0.0), isnan(_12094)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12094, float3(0.0), isnan(_12094)), level(0.0)).x;
    float3 _12105 = float3(_4695, _4697, _4693);
    float4 _4704 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12105, float3(0.0), isnan(_12105)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12105, float3(0.0), isnan(_12105)), level(0.0)).xyzw;
    float _4706 = _4704.x;
    float _4708 = _4704.y;
    float _4710 = _4704.z;
    float _4712 = _4704.w;
    float _4714 = -_4691;
    float _4716 = fma(_4699, _4714, 1.0);
    float2 _12127 = float2(_4716, _4685);
    float3 _4720 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12127, float2(0.0), isnan(_12127)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12127, float2(0.0), isnan(_12127)), level(0.0)).xyz;
    float _4722 = _4720.x;
    float _4724 = _4720.y;
    float _4726 = _4720.z;
    float _4728 = _4583 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4730 = _4607 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_91.x = _3735;
    out.m_91.y = _3901;
    out.m_91.z = _3797;
    bool _4732 = _4415 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4734 = isnan(_4415);
    bool _4736 = _4732 || _4734;
    bool _4738 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4740 = _4736 || _4738;
    float _4742 = fma(_4611, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4730);
    float _4744 = exp2(_4728);
    float _4746 = _4677 + _4645;
    out.m_93.x = _4317;
    out.m_93.y = _4315;
    out.m_93.z = _4319;
    float _4748 = fma(_4595, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4742);
    float _4750 = _4645 * 0.5;
    float _4752 = _4746 * 0.5;
    float _4754 = fma(_4609, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4748);
    float _4756 = fma(_4679, -0.5, _4750);
    float _4758 = _4754 + _4645;
    out.gl_Position.x = _4677;
    out.gl_Position.y = _4679;
    out.gl_Position.z = _4754;
    out.gl_Position.w = _4645;
    float _4760 = _4758 * 0.5;
    float _4762 = -_4744;
    float _4764 = _4762 + 1.0;
    float _4766 = _4764 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_95.x = _4752;
    out.m_95.y = _4756;
    out.m_95.z = _4760;
    out.m_95.w = _4645;
    float _4768 = -_4766;
    float _4770 = _4768 + 1.0;
    float _4772 = _4754;
    float _4774 = _4679;
    float _4776 = _4677;
    if (!_4740)
    {
        _4772 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4778 = _4772;
    float _4780 = _4778;
    float _4782 = _4778;
    if (!_4740)
    {
        _4774 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4784 = _4774;
    float _4786 = _4784;
    float _4788 = _4784;
    if (!_4740)
    {
        _4776 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4790 = _4776;
    float _4792 = _4766 * _4701;
    float _4794 = _4712 * _4770;
    float _4796 = _4393 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4798 = _4712 * _4792;
    float _4800 = _4726 * _4792;
    float _4802 = fma(_4722, _4798, _4706);
    float _4804 = fma(_4724, _4798, _4708);
    float _4806 = fma(_4712, _4800, _4710);
    out.m_97.x = _4802;
    out.m_97.y = _4804;
    out.m_97.z = _4806;
    out.m_97.w = _4794;
    bool _4808 = !_4740;
    float _4810 = _4790;
    float _4812 = _4790;
    if (!_4808)
    {
        bool _4814 = _4415 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4816 = isnan(_4415);
        bool _4818 = _4814 || _4816;
        bool _4820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4822 = _4818 || _4820;
        if (!_4822)
        {
            float _4824 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4826 = _4415 + _4824;
            float _4828 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4830 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4828;
            float _4832 = 1.0 / _4830;
            float _4834 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4836 = _4834 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4838 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4840 = _4838 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4842 = _4826 * _4832;
            float _4844 = precise::clamp(_4842, 0.0, 1.0);
            float _4846 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4848 = _4846 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4850 = fma(_4844, _4840, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4852 = fma(_4844, _4848, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4854 = fma(_4844, _4836, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4788 = _4854;
            _4782 = _4852;
            _4812 = _4850;
            _4856 = true;
        }
        else
        {
            bool _4858 = _4415 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4860 = isnan(_4415);
            bool _4862 = _4858 || _4860;
            bool _4864 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4866 = _4862 || _4864;
            if (!_4866)
            {
                _4780 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4868 = _4780;
            _4782 = _4868;
            if (!_4866)
            {
                _4786 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4870 = _4786;
            _4788 = _4870;
            if (!_4866)
            {
                _4810 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4872 = _4810;
            bool _4874 = !_4866;
            _4812 = _4872;
            if (!_4874)
            {
                bool _4876 = _4415 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4878 = isnan(_4415);
                bool _4880 = _4876 || _4878;
                bool _4882 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4884 = _4880 || _4882;
                if (!_4884)
                {
                    float _4886 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4888 = _4415 + _4886;
                    float _4890 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4892 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4890;
                    float _4894 = 1.0 / _4892;
                    float _4896 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4898 = _4896 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4900 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4902 = _4900 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4904 = _4888 * _4894;
                    float _4906 = precise::clamp(_4904, 0.0, 1.0);
                    float _4908 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4910 = _4908 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4912 = fma(_4906, _4902, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4914 = fma(_4906, _4910, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4916 = fma(_4906, _4898, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4788 = _4916;
                    _4782 = _4914;
                    _4812 = _4912;
                    _4856 = true;
                }
                else
                {
                    _4788 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4782 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4812 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4856 = false;
    float _4918 = _4788;
    float _4920 = _4782;
    float _4922 = _4812;
    float _4924 = _4796 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_99.x = 0.0;
    float _4926 = _4918 * 0.586610972881317138671875;
    bool _4928 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _4924;
    float _4930 = fma(_4920, 0.298911988735198974609375, _4926);
    bool _4932 = _4393 > 0.0;
    bool _4934 = isnan(_4393);
    bool _4936 = _4932 || _4934;
    bool _4938 = isnan(0.0);
    bool _4940 = _4936 || _4938;
    float _4942 = fma(_4922, 0.114477999508380889892578125, _4930);
    float _4944 = -_4942;
    float _4946 = _4944 + _4920;
    float _4948 = -_4942;
    float _4950 = _4948 + _4918;
    float _4952 = -_4942;
    float _4954 = _4952 + _4922;
    float _4956 = fma(_4946, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4942);
    float _4958 = fma(_4950, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4942);
    float _4960 = fma(_4954, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4942);
    bool _4962 = !_4928;
    if (!_4962)
    {
        float _4964 = -_4315;
        float _4966 = _4964 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4968 = -_4317;
        float _4970 = _4968 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4972 = -_4319;
        float _4974 = _4972 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4976 = _4966 * _4966;
        float _4978 = fma(_4970, _4970, _4976);
        float _4980 = fma(_4974, _4974, _4978);
        float _4982 = sqrt(_4980);
        float _4984 = rsqrt(_4980);
        float _4986 = -_4982;
        float _4988 = _4986 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4990 = _4988 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4992 = precise::clamp(_4990, 0.0, 1.0);
        float _4994 = _4970 * _4984;
        float _4996 = _4966 * _4984;
        float _4998 = abs(_4992);
        float _5000 = log2(_4998);
        float _5002 = _4974 * _4984;
        float _5004 = _4994 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5006 = _3863 * _4996;
        float _5008 = -_4996;
        float _5010 = -_5004;
        float _5012 = fma(_5008, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5010);
        float _5014 = fma(_3779, _4994, _5006);
        float _5016 = -_5002;
        float _5018 = fma(_5016, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5012);
        float _5020 = fma(_3717, _5002, _5014);
        float _5022 = precise::clamp(_5020, 0.0, 1.0);
        float _5024 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5026 = _5018 + _5024;
        float _5028 = _5000 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5030 = _5026 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5032 = precise::clamp(_5030, 0.0, 1.0);
        float _5034 = exp2(_5028);
        float _5036 = _5034 * _5032;
        float _5038 = _5022 * _5036;
        float _5040 = _5038 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5042 = _5038 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5044 = _5038 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _5040;
        out.m_99.y = _5042;
        out.m_99.z = _5044;
    }
    out.m_71.x = _4956;
    out.m_71.y = _4958;
    out.m_71.z = _4960;
    if (_4940)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _5046 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5046;
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
    bool _4856 = false;
    bool _1224 = false;
    bool _1014 = false;
    bool _908 = false;
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
        float _5102 = as_type<float>(_132);
        out.gl_Position.z = _5102;
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
        float _5174 = as_type<float>(_172);
        out.gl_Position.z = _5174;
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
    bool _816 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _818 = isnan(_814);
    bool _820 = _816 || _818;
    bool _822 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _824 = _820 || _822;
    float _826 = float(_824);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _832 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _834 = isnan(_814);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _844;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _850 = _814 + _848;
    float _852 = 1.0 / _830;
    float _854 = -_826;
    float _856 = _854 + 1.0;
    bool _858 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _860 = _842 * _856;
    float _862 = -_842;
    float _864 = _862 + 1.0;
    float _866 = _846 * _852;
    float _868 = fma(_866, _850, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _870 = _868 * _860;
    float _872 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[115].x, _870);
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _880 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[116].x, _872);
    float _882 = _874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _884 = _876 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _886 = _878 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _888 = _880 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _882;
    out.m_61.y = _884;
    out.m_61.z = _886;
    out.m_61.w = _888;
    bool _890 = !_858;
    float _906;
    if (!_890)
    {
        float _892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _894 = _174 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[11].z, _144);
        float _898 = _896 * _892;
        float _900 = floor(_898);
        float _902 = -_900;
        float _904 = _898 + _902;
        _906 = _904;
        _908 = true;
    }
    else
    {
        _906 = _156;
    }
    _908 = false;
    float _910 = _906;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _914 = _910 + _912;
    bool _916 = _910 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _918 = isnan(_910);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _924 = _920 || _922;
    float _926 = float(_924);
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _928;
    bool _932 = _910 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _934 = isnan(_910);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = 1.0 / _930;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _946;
    bool _950 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _952;
    float _956 = _914 * _944;
    float _958 = -_926;
    float _960 = _958 + 1.0;
    float _962 = fma(_948, _956, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _964 = fma(_954, _956, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _966;
    float _970 = _942 * _960;
    float _972 = -_942;
    float _974 = _972 + 1.0;
    float _976 = fma(_968, _956, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _978 = _962 * _970;
    float _980 = _976 * _970;
    float _982 = _964 * _970;
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].x, _978);
    float _986 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].y, _980);
    float _988 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].z, _982);
    float _990 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[124].x, _984);
    float _992 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[124].y, _986);
    float _994 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[124].z, _988);
    bool _996 = !_950;
    float _1012;
    if (!_996)
    {
        float _998 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1000 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _1004 = _1002 * _998;
        float _1006 = floor(_1004);
        float _1008 = -_1006;
        float _1010 = _1004 + _1008;
        _1012 = _1010;
        _1014 = true;
    }
    else
    {
        _1012 = _156;
    }
    _1014 = false;
    float _1016 = _1012;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1022;
    bool _1026 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1028 = isnan(_1016);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1034 = _1030 || _1032;
    float _1036 = float(_1034);
    float _1038 = 1.0 / _1020;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1048 = -_1036;
    float _1050 = _1048 + 1.0;
    bool _1052 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1054 = isnan(_1016);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = 1.0 / _1042;
    bool _1066 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1068 = isnan(_1016);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    bool _1078 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1080 = _1076 * _1050;
    float _1082 = -_1076;
    float _1084 = _1082 + 1.0;
    float _1086 = _1024 * _1038;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1090 = _1016 + _1088;
    float _1092 = 1.0 / _1046;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1098 = _1062 * _1084;
    float _1100 = fma(_1086, _1090, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1106 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1108 = isnan(_1016);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1118;
    float _1122 = _1096 * _1064;
    float _1124 = 1.0 / _1104;
    float _1126 = _1100 * _1098;
    float _1128 = -_1116;
    float _1130 = _1128 + 1.0;
    float _1132 = -_1062;
    float _1134 = _1132 + 1.0;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1140 = _1036 * _1130;
    bool _1142 = _1016 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1144 = isnan(_1016);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = _1120 * _1092;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1158 = _1016 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1162 = _1016 + _1160;
    float _1164 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1126);
    float _1166 = -_1152;
    float _1168 = _1166 + 1.0;
    float _1170 = fma(_1122, _1158, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1172 = fma(_1154, _1162, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1176 = _1016 + _1174;
    float _1178 = _1138 * _1124;
    float _1180 = fma(_1170, _1080, _1164);
    float _1182 = _1116 * _1168;
    float _1184 = _992 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1186 = fma(_1178, _1176, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1188 = fma(_1172, _1140, _1180);
    float _1190 = _990 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1192 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1194 = fma(_1186, _1182, _1188);
    float _1196 = _994 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1198 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1194);
    float _1202 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1204 = _1200 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _1198;
    out.m_63.y = _1192;
    out.m_63.z = _1202;
    out.m_63.w = _1204;
    bool _1206 = !_1078;
    float _1222;
    if (!_1206)
    {
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1210 = _174 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _1214 = _1212 * _1208;
        float _1216 = floor(_1214);
        float _1218 = -_1216;
        float _1220 = _1214 + _1218;
        _1222 = _1220;
        _1224 = true;
    }
    else
    {
        _1222 = _156;
    }
    _1224 = false;
    float _1226 = _1222;
    float _1228 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1230 = int(_1228);
    float _1232 = in.m_53.y;
    float _1234 = _600 * _788;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1238 = _1236 != 0;
    float _1240 = in.m_53.z;
    float _1242 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1244 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1246 = int(_1244);
    float _1248 = in.m_65.w;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1252 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1254 = int(_1252);
    float _1256 = float(_1230);
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1262 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1258);
    float _1264 = 1.0 / _1256;
    float _1266 = float(uint(_1246));
    float _1268 = float(_1246);
    float _1270 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1272 = _1246 == 0;
    float _1274 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _1276 = _1246 + (-1);
    float _1278 = 1.0 / _1266;
    float _1280 = float(_1254);
    out.m_67.w = _1248;
    float _1282 = _144 * _1264;
    float _1284 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1286 = int(_1284);
    int _1288 = ~_1246;
    int _1290 = _1288 + 1;
    float _1292 = -_1270;
    float _1294 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1292);
    float _1296 = -_1274;
    float _1298 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1296);
    int _1300 = as_type<int>(_1278) + (-2);
    float _1302 = trunc(_1282);
    int _1304 = int(_1302);
    float _1306 = 1.0 / _1280;
    float _1308 = float(uint(_1286));
    int _1310 = ~_1286;
    int _1312 = _1310 + 1;
    float _1314 = float(uint(_1304));
    float _1316 = 1.0 / _1308;
    float _1318 = as_type<float>(_1300) * _1314;
    float _1320 = _144 * _1306;
    float _1322 = trunc(_1318);
    float _1324 = precise::max(_1322, 0.0);
    uint _1327 = uint(_1324);
    float _1329 = trunc(_1320);
    int _1331 = int(_1329);
    int _1333 = ~_1246;
    int _1335 = _1333 + 1;
    int _1337 = _1290 * int(_1327);
    int _1339 = _1337 + _1304;
    float _1341 = float(uint(_1339));
    float _1343 = float(uint(_1331));
    float _1345 = as_type<float>(_1300) * _1341;
    float _1347 = _1341;
    float _1349 = _1240;
    if (_1238)
    {
        _1347 = 1.0;
    }
    float _1351 = _1347;
    float _1353 = _1351;
    if (!_1238)
    {
        _1353 = 7.345489978790283203125;
    }
    float _1355 = _1353;
    float _1357 = trunc(_1345);
    float _1359 = precise::max(_1357, 0.0);
    uint _1361 = uint(_1359);
    float _1363 = _1355 * _174;
    int _1365 = as_type<int>(_1316) + (-2);
    float _1367 = floor(_1363);
    float _1369 = as_type<float>(_1365) * _1343;
    int _1371 = int(_1327) + int(_1361);
    float _1373 = trunc(_1369);
    float _1375 = precise::max(_1373, 0.0);
    uint _1377 = uint(_1375);
    float _1379 = float(_1304);
    int _1381 = _1335 * _1371;
    int _1383 = _1381 + _1304;
    int _1385 = ~_1286;
    int _1387 = _1385 + 1;
    bool _1389 = _1379 >= _1268;
    bool _1391 = isnan(_1379);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan(_1268);
    bool _1397 = _1393 || _1395;
    float _1399 = float(_1397);
    float _1401 = -_1367;
    float _1403 = _1363 + _1401;
    bool _1405 = uint(_1383) >= uint(_1246);
    bool _1407 = !_1405;
    int _1409 = _1407 ? 0 : (-1);
    float _1411 = trunc(_1399);
    int _1413 = int(_1411);
    int _1415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1417 = _1415 != 0;
    int _1419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1421 = _1419 != 0;
    int _1423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1425 = _1423 != 0;
    int _1427 = ~_1371;
    int _1429 = _1427 + _1409;
    int _1431 = _1429 + 1;
    float _1433 = _1403 * _1268;
    int _1435 = _1387 * int(_1377);
    int _1437 = _1435 + _1331;
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1441 = _1439 != 0;
    float _1443 = _156 * _1268;
    int _1445 = _1246 * _1431;
    int _1447 = _1445 + _1304;
    float _1449 = trunc(_1433);
    int _1451 = int(_1449);
    float _1453 = float(uint(_1437));
    bool _1455 = !_1441;
    int _1457 = _1455 ? 0 : 1;
    bool _1459 = !_1272;
    float _1461 = _1459 ? as_type<float>(_1447) : as_type<float>(0xffffffffu /* nan */);
    float _1463 = as_type<float>(_1365) * _1453;
    int _1465 = ~_1413;
    int _1467 = _1465 + 1;
    int _1469 = _1467 + 1;
    float _1471 = trunc(_1443);
    int _1473 = int(_1471);
    bool _1475 = !_1417;
    int _1477 = _1475 ? 0 : 1;
    int _1479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1481 = _1479 != 0;
    int _1483 = as_type<int>(_1461) * _1469;
    bool _1485 = !_1421;
    int _1487 = _1485 ? 0 : 1;
    int _1489 = abs(_1457);
    float _1491 = trunc(_1463);
    float _1493 = precise::max(_1491, 0.0);
    uint _1495 = uint(_1493);
    int _1497 = abs(_1487);
    int _1499 = _1413 * _1276;
    int _1501 = _1499 + _1483;
    int _1503 = abs(_1477);
    int _1505 = _1451 * _1489;
    int _1507 = _1505 + _1304;
    float _1509 = as_type<float>(_1469);
    float _1511 = _1461;
    if (_1481)
    {
        _1509 = _174;
    }
    float _1513 = _1509;
    float _1515 = _1513;
    if (_1481)
    {
        _1511 = 1.0;
    }
    float _1517 = _1511;
    int _1519 = _1501 * _1497;
    float _1521 = _1517;
    if (!_1481)
    {
        _1515 = _1232;
    }
    float _1523 = _1515;
    if (!_1481)
    {
        _1521 = 1.2345600128173828125;
    }
    float _1525 = _1521;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1529 = _1527 != 0;
    float _1531 = _1523 * _1525;
    bool _1533 = !_1425;
    int _1535 = _1533 ? 0 : 1;
    bool _1537 = !_1529;
    int _1539 = _1537 ? 0 : 1;
    int _1541 = _1473 * _1503;
    int _1543 = _1541 + _1519;
    int _1545 = abs(_1535);
    float _1547 = floor(_1531);
    int _1549 = int(_1377) + int(_1495);
    int _1551 = ~_1286;
    int _1553 = _1551 + 1;
    int _1555 = _1507 * _1545;
    int _1557 = _1555 + _1543;
    int _1559 = abs(_1539);
    float _1561 = float(_1286);
    int _1563 = _1553 * _1549;
    int _1565 = _1563 + _1331;
    float _1567 = float(_1331);
    int _1569 = ~_1246;
    int _1571 = _1569 + 1;
    bool _1573 = _1567 >= _1561;
    bool _1575 = isnan(_1567);
    bool _1577 = _1573 || _1575;
    bool _1579 = isnan(_1561);
    bool _1581 = _1577 || _1579;
    float _1583 = float(_1581);
    int _1585 = _1451 * _1559;
    int _1587 = _1585 + _1557;
    bool _1589 = uint(_1565) >= uint(_1286);
    float _1591 = -_1547;
    float _1593 = _1531 + _1591;
    int _1595 = 0;
    int _1597 = _1549;
    if (_1481)
    {
        _1595 = 0;
    }
    int _1599 = _1595;
    float _1601 = trunc(_1583);
    int _1603 = int(_1601);
    float _1605 = float(uint(_1587));
    bool _1607 = !_1589;
    int _1609 = _1607 ? 0 : (-1);
    int _1611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1613 = _1611 != 0;
    int _1615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1617 = _1615 != 0;
    int _1619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1621 = _1619 != 0;
    int _1623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1625 = _1623 != 0;
    float _1627 = as_type<float>(_1300) * _1605;
    int _1629 = ~_1549;
    int _1631 = _1629 + _1609;
    int _1633 = _1631 + 1;
    bool _1635 = _1246 == 0;
    bool _1637 = !_1617;
    int _1639 = _1637 ? 0 : 1;
    int _1641 = _1286 * _1633;
    int _1643 = _1641 + _1331;
    bool _1645 = _1286 == 0;
    float _1647 = trunc(_1627);
    float _1649 = precise::max(_1647, 0.0);
    uint _1651 = uint(_1649);
    int _1653 = abs(_1639);
    int _1655 = ~_1603;
    int _1657 = _1655 + 1;
    int _1659 = _1657 + 1;
    bool _1661 = !_1645;
    int _1663 = _1661 ? _1643 : (-1);
    float _1665 = _1593 * _1561;
    float _1667 = _156 * _1561;
    bool _1669 = !_1613;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = _1663 * _1659;
    int _1675 = _1286 + (-1);
    float _1677 = trunc(_1665);
    int _1679 = int(_1677);
    int _1681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1683 = _1681 != 0;
    int _1685 = abs(_1671);
    int _1687 = _1603 * _1675;
    int _1689 = _1687 + _1673;
    bool _1691 = !_1621;
    int _1693 = _1691 ? 0 : 1;
    int _1695 = _1571 * int(_1651);
    int _1697 = _1695 + _1587;
    bool _1699 = !_1683;
    int _1701 = _1699 ? 0 : 1;
    float _1703 = trunc(_1667);
    int _1705 = int(_1703);
    bool _1707 = !_1625;
    int _1709 = _1707 ? 0 : 1;
    int _1711 = _1689 * _1653;
    float _1713 = float(uint(_1697));
    int _1715 = abs(_1701);
    int _1717 = abs(_1693);
    float _1719 = as_type<float>(_1300) * _1713;
    float _1721 = trunc(_1719);
    float _1723 = precise::max(_1721, 0.0);
    uint _1725 = uint(_1723);
    int _1727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1729 = _1727 != 0;
    int _1731 = _1679 * _1715;
    int _1733 = _1731 + _1331;
    int _1735 = abs(_1709);
    int _1737 = _1705 * _1685;
    int _1739 = _1737 + _1711;
    int _1741 = ~_1286;
    int _1743 = _1741 + 1;
    float _1745 = float(uint(_1733));
    int _1747 = _1733 * _1717;
    int _1749 = _1747 + _1739;
    int _1751 = _1599;
    int _1753 = as_type<int>(_1719);
    bool _1755 = _1683;
    float _1757 = as_type<float>(_1651);
    if (!_1481)
    {
        _1751 = 2;
    }
    int _1759 = _1751;
    int _1761 = _1679 * _1735;
    int _1763 = _1761 + _1749;
    if (_1729)
    {
        float _1765 = -_352;
        float _1767 = _1765 + 1.0;
        _1753 = as_type<int>(_1767);
    }
    int _1769 = _1753;
    if (_1729)
    {
        bool _1771 = _174 > 0.5;
        _1755 = _1771;
    }
    bool _1773 = _1755;
    float _1775 = as_type<float>(_1365) * _1745;
    int _1777 = int(_1651) + int(_1725);
    float _1779 = float(uint(_1763));
    float _1781 = trunc(_1775);
    float _1783 = precise::max(_1781, 0.0);
    uint _1785 = uint(_1783);
    if (!_1729)
    {
        _1757 = _352;
    }
    float _1787 = _1757;
    float _1789 = float(uint(_1507));
    float _1791 = as_type<float>(_1365) * _1779;
    float _1793 = _1787;
    if (_1729)
    {
        float _1795 = _1773 ? as_type<float>(_1769) : _352;
        _1793 = _1795;
    }
    float _1797 = _1793;
    float _1799 = in.m_53.w;
    int _1801 = ~_1246;
    int _1803 = _1801 + 1;
    float _1805 = as_type<float>(_1300) * _1789;
    float _1807 = trunc(_1791);
    float _1809 = precise::max(_1807, 0.0);
    uint _1811 = uint(_1809);
    int _1813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1815 = _1813 != 0;
    int _1817 = _1803 * _1777;
    int _1819 = _1817 + _1587;
    bool _1821 = _1232 > 0.5;
    float _1823 = trunc(_1805);
    float _1825 = precise::max(_1823, 0.0);
    uint _1827 = uint(_1825);
    bool _1829 = uint(_1819) >= uint(_1246);
    float _1831 = -_498;
    float _1833 = _1831 + 1.0;
    bool _1835 = !_1829;
    int _1837 = _1835 ? 0 : (-1);
    if (_1815)
    {
        float _1839 = -_352;
        float _1841 = _1839 + 1.0;
        _1597 = as_type<int>(_1841);
    }
    int _1843 = _1597;
    int _1845 = _1821 ? as_type<int>(_1833) : as_type<int>(_498);
    int _1847 = _1743 * int(_1811);
    int _1849 = _1847 + _1763;
    bool _1851 = _1240 > 0.5;
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1855 = _1853 != 0;
    float _1857 = float(uint(_1849));
    int _1859 = ~_1246;
    int _1861 = _1859 + 1;
    float _1863 = _1855 ? as_type<float>(_1845) : _498;
    float _1865 = as_type<float>(_1365) * _1857;
    float _1867 = _1857;
    if (!_1815)
    {
        _1867 = _352;
    }
    float _1869 = _1867;
    float _1871 = _1869;
    if (_1815)
    {
        float _1873 = _1851 ? as_type<float>(_1843) : _352;
        _1871 = _1873;
    }
    float _1875 = _1871;
    float _1877 = trunc(_1865);
    float _1879 = precise::max(_1877, 0.0);
    uint _1881 = uint(_1879);
    bool _1883 = _1799 > 0.5;
    int _1885 = _1861 * int(_1827);
    int _1887 = _1885 + _1507;
    int _1889 = ~_1777;
    int _1891 = _1889 + _1837;
    int _1893 = _1891 + 1;
    int _1895 = _1312 * int(_1785);
    int _1897 = _1895 + _1733;
    int _1899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1901 = _1899 != 0;
    float _1903 = float(uint(_1887));
    int _1905 = _1246 * _1893;
    int _1907 = _1905 + _1587;
    int _1909 = _1883 ? as_type<int>(_1833) : as_type<int>(_498);
    float _1911 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1915 = _1913 != 0;
    float _1917 = as_type<float>(_1300) * _1903;
    bool _1919 = !_1635;
    int _1921 = _1919 ? _1907 : (-1);
    float _1923 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1925 = _1915 ? as_type<float>(_1909) : _498;
    float _1927 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1929 = _1921 & 3;
    bool _1931 = _1929 != 0;
    float _1933 = trunc(_1917);
    float _1935 = precise::max(_1933, 0.0);
    uint _1937 = uint(_1935);
    if (_1901)
    {
        float _1939 = _1851 ? _1833 : _498;
        _614 = _1939;
    }
    float _1941 = _614;
    float _1943 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1911);
    int _1945 = int(_1811) + int(_1881);
    int _1947 = ~_1286;
    int _1949 = _1947 + 1;
    float _1951 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1943);
    float _1953 = float(uint(_1897));
    bool _1955 = uint(_1929) > 1u;
    int _1957 = _1949 * _1945;
    int _1959 = _1957 + _1763;
    int _1961 = _1921 & 3;
    bool _1963 = _1961 != 0;
    float _1965 = as_type<float>(_1365) * _1953;
    float _1967 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1923);
    int _1969 = ~_1246;
    int _1971 = _1969 + 1;
    float _1973 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1927);
    int _1975 = _1963 ? 0 : 1;
    float _1977 = trunc(_1965);
    float _1979 = precise::max(_1977, 0.0);
    uint _1981 = uint(_1979);
    bool _1983 = uint(_1959) >= uint(_1286);
    float _1985 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1967);
    int _1987 = ~_1975;
    int _1989 = _1987 + 1;
    int _1991 = _1989 + 1;
    float _1993 = _1951 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1995 = !_1983;
    int _1997 = _1995 ? 0 : (-1);
    float _1999 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1973);
    bool _2001 = _1929 != 3;
    int _2003 = _1991;
    if (!_1955)
    {
        int _2005 = ~_1975;
        int _2007 = _2005 + 1;
        _2003 = _2007;
    }
    int _2009 = _2003;
    float _2011 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2013 = int(_1827) + int(_1937);
    float _2015 = _1985 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2017 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2019 = _1993 + _2017;
    bool _2021 = uint(_1929) >= 2u;
    float _2023 = _2011 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _2025 = ~_1945;
    int _2027 = _2025 + _1997;
    int _2029 = _2027 + 1;
    int _2031 = _1971 * _2013;
    int _2033 = _2031 + _1507;
    int _2035 = _2021 ? 0 : 1;
    float _2037 = _2019 * _2019;
    int _2039 = int(_1785) + int(_1981);
    int _2041 = _1286 * _2029;
    int _2043 = _2041 + _1763;
    int _2045 = ~_2035;
    int _2047 = _2045 + 1;
    int _2049 = _2047 + 1;
    float _2051 = _1999 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2053 = _2049;
    int _2055 = int(_1937);
    if (_2001)
    {
        int _2057 = ~_2035;
        int _2059 = _2057 + 1;
        _2053 = _2059;
    }
    int _2061 = _2053;
    float _2063 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2065 = _2015 + _2063;
    bool _2067 = !_1645;
    int _2069 = _2067 ? _2043 : (-1);
    float _2071 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2073 = _2051 + _2071;
    if (_1481)
    {
        _2055 = 0;
    }
    int _2075 = _2055;
    float _2077 = fma(_2065, _2065, _2037);
    bool _2079 = uint(_2033) >= uint(_1246);
    float _2081 = -_2051;
    float _2083 = _2081 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _2085 = _2075;
    if (!_1481)
    {
        _2085 = 1;
    }
    int _2087 = _2085;
    float _2089 = fma(_2073, _2073, _2077);
    int _2091 = _2069 & 3;
    bool _2093 = _2091 != 0;
    bool _2095 = !_2079;
    int _2097 = _2095 ? 0 : (-1);
    float _2099 = sqrt(_2089);
    int _2101 = _2069 & 3;
    bool _2103 = _2101 != 0;
    bool _2105 = uint(_2091) >= 2u;
    int _2107 = _2103 ? 0 : 1;
    bool _2109 = uint(_2091) > 1u;
    float _2111 = rsqrt(_2089);
    int _2113 = _2105 ? 0 : 1;
    bool _2115 = _2091 != 3;
    int _2117 = ~_1286;
    int _2119 = _2117 + 1;
    int _2121 = ~_2107;
    int _2123 = _2121 + 1;
    int _2125 = _2123 + 1;
    float _2127 = _2099 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2129 = ~_2113;
    int _2131 = _2129 + 1;
    int _2133 = _2131 + 1;
    int _2135 = _2119 * _2039;
    int _2137 = _2135 + _1733;
    bool _2139 = !_1931;
    int _2141 = _2139 ? 0 : 1;
    int _2143 = _2125;
    int _2145 = _2133;
    if (!_2109)
    {
        int _2147 = ~_2107;
        int _2149 = _2147 + 1;
        _2143 = _2149;
    }
    int _2151 = _2143;
    bool _2153 = uint(_2137) >= uint(_1286);
    if (_2115)
    {
        int _2155 = ~_2113;
        int _2157 = _2155 + 1;
        _2145 = _2157;
    }
    int _2159 = _2145;
    float _2161 = in.m_69.x;
    float _2163 = in.m_69.y;
    float _2165 = in.m_69.z;
    int _2167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2169 = _2167 != 0;
    bool _2171 = !_2153;
    int _2173 = _2171 ? 0 : (-1);
    bool _2175 = _1232 > 0.5;
    bool _2177 = _2175 && _2169;
    float _2179 = precise::min(_2023, _2127);
    bool _2181 = _1759 != 2;
    int _2183 = ~_2013;
    int _2185 = _2183 + _2097;
    int _2187 = _2185 + 1;
    float _2189 = _2111 * _2179;
    int _2191 = abs(_2009);
    out.m_71.w = _2179;
    float _2193 = 0.0;
    if (!_2169)
    {
        _2193 = _352;
    }
    float _2195 = _2193;
    float _2197 = _2019 * _2189;
    float _2199 = _2073 * _2189;
    float _2201 = _2195;
    if (_2177)
    {
        float _2203 = -_352;
        float _2205 = _2203 + 1.0;
        _430 = _2205;
    }
    float _2207 = _430;
    bool _2209 = _2087 != 1;
    float _2211 = _2065 * _2189;
    float _2213 = -_2197;
    float _2215 = _2019 + _2213;
    float _2217 = -_2199;
    float _2219 = _2073 + _2217;
    if (_2169)
    {
        _2201 = _2207;
    }
    float _2221 = _2201;
    float _2223 = -_2211;
    float _2225 = _2065 + _2223;
    float _2227 = _2215 * _2215;
    float _2229 = in.m_73.x;
    float _2231 = in.m_73.y;
    float _2233 = in.m_73.z;
    bool _2235 = _2163 != 0.0;
    bool _2237 = isnan(_2163);
    bool _2239 = _2235 || _2237;
    bool _2241 = isnan(0.0);
    bool _2243 = _2239 || _2241;
    float _2245 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2161);
    float _2247 = fma(_2225, _2225, _2227);
    float _2249 = in.m_75.x;
    float _2251 = in.m_75.y;
    float _2253 = in.m_75.z;
    float _2255 = in.m_75.w;
    bool _2257 = _2161 == 0.0;
    bool _2259 = !_2243;
    bool _2261 = _2257 && _2259;
    float _2263 = _610 * _790;
    float _2265 = fma(_2219, _2219, _2247);
    float _2267 = 0.0;
    if (!_2209)
    {
        _2267 = _1232;
    }
    float _2269 = _2267;
    int _2271 = _1246 * _2187;
    int _2273 = _2271 + _1507;
    bool _2275 = _2165 == 0.0;
    bool _2277 = _2275 && _2261;
    float _2279 = 0.0;
    float _2281 = _2269;
    if (_2181)
    {
        _2279 = _174;
    }
    float _2283 = _2279;
    float _2285 = sqrt(_2265);
    float _2287 = 0.0;
    float _2289 = _2283;
    if (!_2209)
    {
        _2287 = _2269;
    }
    float _2291 = _2287;
    float _2293 = _2291;
    if (!_2181)
    {
        _2289 = _1240;
    }
    float _2295 = _2289;
    float _2297 = 0.0;
    if (!_2209)
    {
        _2297 = _1240;
    }
    float _2299 = _2297;
    float _2301 = 0.0;
    float _2303 = _2299;
    if (_2181)
    {
        _2301 = _1232;
    }
    float _2305 = _2301;
    float _2307 = _2305;
    if (_2209)
    {
        _2293 = _174;
    }
    float _2309 = _2293;
    if (_2209)
    {
        _2281 = _174;
    }
    float _2311 = _2281;
    if (_2209)
    {
        _1349 = _1232;
    }
    float _2313 = _1349;
    float _2315 = _2309 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2317 = _2233 * _2251;
    float _2319 = _2229 * _2253;
    float _2321 = _2231 * _2249;
    float _2323 = _2317;
    float _2325 = _2255;
    if (_2209)
    {
        _2303 = _1232;
    }
    float _2327 = _2303;
    float _2329 = _2111 * _2285;
    if (!_2181)
    {
        _2307 = _174;
    }
    float _2331 = _2307;
    float _2333 = -_2319;
    float _2335 = fma(_2233, _2249, _2333);
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2339 = _2337 != 0;
    float _2341 = -_2321;
    float _2343 = fma(_2251, _2229, _2341);
    int _2345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2347 = _2345 != 0;
    float _2349 = -_2317;
    float _2351 = fma(_2253, _2231, _2349);
    if (_2277)
    {
        _2323 = _2231;
    }
    float _2353 = _2323;
    float _2355 = _1242 * _2329;
    float _2357 = _2353;
    if (!_2277)
    {
        float _2359 = fma(_2163, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2231);
        _2357 = _2359;
    }
    float _2361 = _2357;
    float _2363 = _2351 * _2255;
    float _2365 = _2335 * _2255;
    float _2367 = _2343 * _2255;
    float _2369 = _2263 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_2277)
    {
        _2325 = _2233;
    }
    float _2371 = _2325;
    float _2373 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2163);
    float _2375 = _2371;
    if (!_2277)
    {
        float _2377 = fma(_2165, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2233);
        _2375 = _2377;
    }
    float _2379 = _2375;
    float _2381 = _2355 * _2165;
    float _2383 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2385 = _2369 * _2329;
    float _2387 = 0.0;
    float _2389 = _2379;
    if (_2277)
    {
        _2387 = _2229;
    }
    float _2391 = _2387;
    float _2393 = _2391;
    if (!_2277)
    {
        float _2395 = fma(_2161, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2229);
        _2393 = _2395;
    }
    float _2397 = _2393;
    float _2399 = -_1250;
    float _2401 = fma(_2383, 2.0, _2399);
    float _2403 = _2385 * _2373;
    float _2405 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2407 = _2405 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2409 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2411 = 1.0 / _2407;
    float _2413 = -_2015;
    float _2415 = _2413 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2417 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2419 = fma(_2409, -2.0, _1260);
    float _2421 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2417);
    float _2423 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2425 = _2423 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2427 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2429 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2431 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2433 = _2431 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2435 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2427);
    float _2437 = -_1993;
    float _2439 = _2437 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2441 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2429);
    float _2443 = 1.0 / _2433;
    float _2445 = _2439 * _2439;
    float _2447 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2449 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2451 = fma(_2415, _2415, _2445);
    float _2453 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2455 = -_2447;
    float _2457 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2455);
    float _2459 = 1.0 / _2425;
    float _2461 = fma(_2083, _2083, _2451);
    float _2463 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2465 = _2463 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2467 = -_2449;
    float _2469 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2467);
    float _2471 = -_2453;
    float _2473 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2471);
    float _2475 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2441);
    float _2477 = rsqrt(_2461);
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2481 = _2479 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2483 = _2331 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2485 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2487 = _2485 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2489 = _2313 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2491 = _2011 * _2329;
    float _2493 = 1.0 / _2481;
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2497 = _2495 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2499 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2499;
    int _2503 = ~_2191;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    float _2509 = _2491 * _2245;
    int _2511 = abs(_2141);
    float _2513 = _2501 * _2459;
    bool _2515 = !_2093;
    int _2517 = _2515 ? 0 : 1;
    float _2519 = 1.0 / _2465;
    float _2521 = _2415 * _2477;
    float _2523 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2525 = _2439 * _2477;
    int _2527 = abs(_2517);
    float _2529 = -_2523;
    float _2531 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2529);
    bool _2533 = _1929 != 3;
    float _2535 = 1.0 / _2487;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2537;
    float _2541 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2543 = _2541 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2545 = ~_2039;
    int _2547 = _2545 + _2173;
    int _2549 = _2547 + 1;
    float _2551 = _2539 * _2411;
    float _2553 = _2543 * _2443;
    float _2555 = _2521 * _2521;
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2559 = _2557 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2561 = _2083 * _2477;
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2565 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2563;
    float _2567 = 1.0 / _2497;
    float _2569 = fma(_2561, _2561, _2555);
    float _2571 = _2565 * _2493;
    float _2573 = _2559 * _2519;
    float _2575 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2577 = _2575 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2581 = _1226 + _2579;
    float _2583 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2585 = _1226 + _2583;
    bool _2587 = !_2533;
    int _2589 = _2587 ? 0 : (-1);
    float _2591 = rsqrt(_2569);
    float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2595 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2593;
    float _2597 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2599 = _1226 + _2597;
    float _2601 = _2577 * _2535;
    float _2603 = fma(_2553, _2581, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2605 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2607 = _1226 + _2605;
    float _2609 = fma(_2551, _2599, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2611 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2613 = _1226 + _2611;
    float _2615 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2617 = _1226 + _2615;
    float _2619 = _2595 * _2567;
    float _2621 = _2469 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2623 = fma(_2513, _2613, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2625 = fma(_2571, _2607, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2627 = fma(_2601, _2585, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2629 = _2473 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2631 = fma(_2573, _2617, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2633 = _2561 * _2591;
    float _2635 = _2521 * _2591;
    float _2637 = _2469 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2639 = -_2629;
    float _2641 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2639);
    float _2643 = -_2633;
    float _2645 = _2561 * _2643;
    float _2647 = _2473 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2649 = -_2637;
    float _2651 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2649);
    float _2653 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2641);
    float _2655 = -_2645;
    float _2657 = fma(_2521, _2635, _2655);
    float _2659 = _2473 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2661 = _2525 * _2635;
    float _2663 = -_2621;
    float _2665 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2663);
    float _2667 = _2657 * _2657;
    float _2669 = -_2647;
    float _2671 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2669);
    float _2673 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2651);
    float _2675 = _2653 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2677 = -_2659;
    float _2679 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2677);
    float _2681 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2683 = fma(_2661, _2661, _2667);
    float _2685 = -_2633;
    float _2687 = _2525 * _2685;
    float _2689 = -_2675;
    float _2691 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2689);
    float _2693 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2679);
    float _2695 = -_2681;
    float _2697 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2695);
    float _2699 = fma(_2687, _2687, _2683);
    float _2701 = _2473 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2703 = fma(_2693, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2691);
    float _2705 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2697);
    bool _2707 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2709 = isnan(_1226);
    bool _2711 = _2707 || _2709;
    bool _2713 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2715 = _2711 || _2713;
    float _2717 = float(_2715);
    float _2719 = -_2701;
    float _2721 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2719);
    float _2723 = rsqrt(_2699);
    float _2725 = -_2705;
    float _2727 = fma(_2725, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2703);
    bool _2729 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2731 = isnan(_1226);
    bool _2733 = _2729 || _2731;
    bool _2735 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2737 = _2733 || _2735;
    float _2739 = float(_2737);
    float _2741 = -_2717;
    float _2743 = _2741 + 1.0;
    bool _2745 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2747 = isnan(_1226);
    bool _2749 = _2745 || _2747;
    bool _2751 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2753 = _2749 || _2751;
    float _2755 = float(_2753);
    float _2757 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2671);
    float _2759 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2665);
    float _2761 = _2739 * _2743;
    float _2763 = 1.0 / _2727;
    float _2765 = -_2739;
    float _2767 = _2765 + 1.0;
    bool _2769 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2771 = isnan(_1226);
    bool _2773 = _2769 || _2771;
    bool _2775 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2777 = _2773 || _2775;
    float _2779 = float(_2777);
    float _2781 = -_2755;
    float _2783 = _2781 + 1.0;
    float _2785 = fma(_2531, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2721);
    float _2787 = _2755 * _2767;
    bool _2789 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2791 = isnan(_1226);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2797 = _2793 || _2795;
    float _2799 = float(_2797);
    float _2801 = -_2779;
    float _2803 = _2801 + 1.0;
    float _2805 = _2657 * _2723;
    float _2807 = precise::clamp(_2805, 0.0, 1.0);
    bool _2809 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2811 = isnan(_1226);
    bool _2813 = _2809 || _2811;
    bool _2815 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2817 = _2813 || _2815;
    float _2819 = float(_2817);
    float _2821 = _2779 * _2783;
    float _2823 = _2799 * _2803;
    float _2825 = -_2799;
    float _2827 = _2825 + 1.0;
    float _2829 = -_2807;
    float _2831 = _2829 + 1.0;
    bool _2833 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2835 = isnan(_1226);
    bool _2837 = _2833 || _2835;
    bool _2839 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2841 = _2837 || _2839;
    float _2843 = float(_2841);
    float _2845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2847 = fma(_2757, _2763, -1.0);
    float _2849 = -_2819;
    float _2851 = _2849 + 1.0;
    float _2853 = _2819 * _2827;
    float _2855 = _2831 * _2763;
    float _2857 = fma(_2831, _2847, 1.0);
    bool _2859 = _1226 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2861 = isnan(_1226);
    bool _2863 = _2859 || _2861;
    bool _2865 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2867 = _2863 || _2865;
    float _2869 = float(_2867);
    float _2871 = _2843 * _2851;
    float _2873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2875 = -_2843;
    float _2877 = _2875 + 1.0;
    float _2879 = _2759 * _2855;
    float _2881 = _2857 * _2857;
    float _2883 = _2785 * _2855;
    float _2885 = _2869 * _2877;
    float _2887 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2889 = _1226 + _2887;
    float _2891 = fma(_2879, _2879, _2881);
    float _2893 = -_2869;
    float _2895 = _2893 + 1.0;
    float _2897 = _2609 * _2885;
    float _2899 = fma(_2619, _2889, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2901 = fma(_2883, _2883, _2891);
    float _2903 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2905 = fma(_2895, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2897);
    int _2907 = _1286 * _2549;
    int _2909 = _2907 + _1733;
    float _2911 = fma(_2903, _1941, -0.5);
    float _2913 = _2873 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2915 = rsqrt(_2901);
    float _2917 = fma(_2603, _2871, _2905);
    float _2919 = fma(_2913, _2221, -0.5);
    float _2921 = _2295 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2923 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2925 = fma(_2623, _2853, _2917);
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2929 = -_2923;
    float _2931 = fma(_2921, 2.0, _2929);
    float _2933 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2935 = fma(_2631, _2823, _2925);
    float _2937 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2927);
    float _2939 = -_144;
    float _2941 = fma(_2939, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2931);
    float _2943 = fma(_2327, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2933);
    float _2945 = _2883 * _2915;
    float _2947 = _2857 * _2915;
    float _2949 = fma(_2475, _2919, _2941);
    int _2951 = _1921 >> 31;
    float _2953 = fma(_2625, _2821, _2935);
    float _2955 = _2879 * _2915;
    float _2957 = -_2945;
    float _2959 = _2521 * _2957;
    float _2961 = _2561 * _2947;
    int _2963 = _2951 & 3;
    float _2965 = fma(_2627, _2787, _2953);
    float _2967 = -_2955;
    float _2969 = -_2959;
    float _2971 = fma(_2561, _2967, _2969);
    float _2973 = -_2945;
    float _2975 = -_2961;
    float _2977 = fma(_2525, _2973, _2975);
    int _2979 = _2069 >> 31;
    float _2981 = -_2955;
    float _2983 = _2525 * _2981;
    int _2985 = _1921 + _2963;
    float _2987 = _2971 * _2971;
    int _2989 = _2979 & 3;
    float _2991 = -_2983;
    float _2993 = fma(_2521, _2947, _2991);
    int _2995 = _2985 >> 2;
    float _2997 = fma(_2977, _2977, _2987);
    int _2999 = _2069 + _2989;
    float _3001 = fma(_2899, _2761, _2965);
    int _3003 = _2995 << 4;
    int _3005 = _3003 + 368;
    float _3007 = fma(_2993, _2993, _2997);
    float _3009 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2435);
    uint _3011 = uint(int(uint(_3005) >> uint(2)));
    uint _3013 = uint(int(uint(int(_3011)) >> uint(2)));
    int _3015 = int(_3011) & 3;
    float _3017 = (*spvDescriptorSet0.vp_c9)._m0[int(_3013)][_3015];
    int _3019 = int(_3011) + 1;
    uint _3021 = uint(int(uint(_3019) >> uint(2)));
    int _3023 = _3019 & 3;
    float _3025 = (*spvDescriptorSet0.vp_c9)._m0[int(_3021)][_3023];
    int _3027 = _2999 >> 2;
    float _3029 = rsqrt(_3007);
    float _3031 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3033 = fma(_2717, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3001);
    int _3035 = _3027 << 4;
    int _3037 = _3035 + 512;
    float _3039 = -_3031;
    float _3041 = fma(_2315, 2.0, _3039);
    int _3043 = _3005 + 8;
    uint _3045 = uint(int(uint(_3043) >> uint(2)));
    uint _3047 = uint(int(uint(int(_3045)) >> uint(2)));
    int _3049 = int(_3045) & 3;
    float _3051 = (*spvDescriptorSet0.vp_c9)._m0[int(_3047)][_3049];
    int _3053 = int(_3045) + 1;
    uint _3055 = uint(int(uint(_3053) >> uint(2)));
    int _3057 = _3053 & 3;
    float _3059 = (*spvDescriptorSet0.vp_c9)._m0[int(_3055)][_3057];
    float _3061 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3063 = abs(_2159);
    float _3065 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _3067 = _2091 != 3;
    float _3069 = fma(_2489, -2.0, _3061);
    out.m_77.x = _3033;
    float _3071 = fma(_2483, -2.0, _3065);
    uint _3073 = uint(int(uint(_3037) >> uint(2)));
    uint _3075 = uint(int(uint(int(_3073)) >> uint(2)));
    int _3077 = int(_3073) & 3;
    float _3079 = (*spvDescriptorSet0.vp_c9)._m0[int(_3075)][_3077];
    int _3081 = int(_3073) + 1;
    uint _3083 = uint(int(uint(_3081) >> uint(2)));
    int _3085 = _3081 & 3;
    float _3087 = (*spvDescriptorSet0.vp_c9)._m0[int(_3083)][_3085];
    float _3089 = _2977 * _3029;
    float _3091 = _2993 * _3029;
    float _3093 = _2971 * _3029;
    float _3095 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3071);
    float _3097 = _2561 * _3089;
    float _3099 = _2525 * _3091;
    int _3101 = _3037 + 8;
    uint _3103 = uint(int(uint(_3101) >> uint(2)));
    uint _3105 = uint(int(uint(int(_3103)) >> uint(2)));
    int _3107 = int(_3103) & 3;
    float _3109 = (*spvDescriptorSet0.vp_c9)._m0[int(_3105)][_3107];
    int _3111 = int(_3103) + 1;
    uint _3113 = uint(int(uint(_3111) >> uint(2)));
    int _3115 = _3111 & 3;
    float _3117 = (*spvDescriptorSet0.vp_c9)._m0[int(_3113)][_3115];
    float _3119 = _2521 * _3093;
    float _3121 = -_3097;
    float _3123 = fma(_2521, _3091, _3121);
    float _3125 = -_3099;
    float _3127 = fma(_2561, _3093, _3125);
    int _3129 = abs(_2151);
    float _3131 = -_3119;
    float _3133 = fma(_2525, _3089, _3131);
    float _3135 = _3123 * _3123;
    float _3137 = -_3095;
    float _3139 = fma(_3009, _2911, _3137);
    int _3141 = ~_3129;
    int _3143 = _3141 + 1;
    int _3145 = _3143 + 1;
    float _3147 = fma(_3127, _3127, _3135);
    float _3149 = fma(_3133, _3133, _3147);
    float _3151 = rsqrt(_3149);
    int _3153 = _2507 * as_type<int>(_3025);
    float _3155 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3157 = int(_3155);
    int _3159 = ~_2511;
    int _3161 = _3159 + 1;
    int _3163 = _3161 + 1;
    int _3165 = _3163 * as_type<int>(_3017);
    int _3167 = _3165 + _3153;
    int _3169 = abs(_2061);
    float _3171 = _3133 * _3151;
    float _3173 = _3127 * _3151;
    int _3175 = ~_3169;
    int _3177 = _3175 + 1;
    int _3179 = _3177 + 1;
    int _3181 = _3145 * as_type<int>(_3087);
    int _3183 = ~_2527;
    int _3185 = _3183 + 1;
    int _3187 = _3185 + 1;
    float _3189 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3191 = int(_3189);
    int _3193 = abs(_2589);
    int _3195 = _3179 * as_type<int>(_3051);
    int _3197 = _3195 + _3167;
    bool _3199 = !_2347;
    int _3201 = _3199 ? 0 : 1;
    int _3203 = _3187 * as_type<int>(_3079);
    int _3205 = _3203 + _3181;
    int _3207 = ~_3193;
    int _3209 = _3207 + 1;
    int _3211 = _3209 + 1;
    float _3213 = _3123 * _3151;
    bool _3215 = !_2339;
    int _3217 = _3215 ? 0 : 1;
    float _3219 = _3171 * _2251;
    int _3221 = abs(_3201);
    float _3223 = _2521 * _3171;
    int _3225 = _3211 * as_type<int>(_3059);
    int _3227 = _3225 + _3197;
    float _3229 = float(uint(_3157));
    float _3231 = _2561 * _3213;
    int _3233 = abs(_3217);
    float _3235 = -_3223;
    float _3237 = fma(_2561, _3173, _3235);
    bool _3239 = !_3067;
    int _3241 = _3239 ? 0 : (-1);
    float _3243 = 1.0 / _3229;
    int _3245 = ~_3063;
    int _3247 = _3245 + 1;
    int _3249 = _3247 + 1;
    float _3251 = -_3231;
    float _3253 = fma(_2525, _3171, _3251);
    float _3255 = _3237 * _3237;
    int _3257 = ~_3157;
    int _3259 = _3257 + 1;
    float _3261 = _2365 * _3213;
    int _3263 = _3249 * as_type<int>(_3109);
    int _3265 = _3263 + _3205;
    float _3267 = float(uint(_3191));
    float _3269 = fma(_3253, _3253, _3255);
    int _3271 = abs(_3241);
    float _3273 = _2525 * _3173;
    float _3275 = 1.0 / _3267;
    int _3277 = ~_3191;
    int _3279 = _3277 + 1;
    float _3281 = _2365 * _3171;
    float _3283 = -_3273;
    float _3285 = fma(_2521, _3213, _3283);
    int _3287 = ~_3233;
    int _3289 = _3287 + 1;
    int _3291 = _3289 + 1;
    int _3293 = ~_3271;
    int _3295 = _3293 + 1;
    int _3297 = _3295 + 1;
    float _3299 = fma(_3285, _3285, _3269);
    int _3301 = abs(_3157);
    int _3303 = _3227 * _3291;
    int _3305 = ~_3221;
    int _3307 = _3305 + 1;
    int _3309 = _3307 + 1;
    int _3311 = _3297 * as_type<int>(_3117);
    int _3313 = _3311 + _3265;
    bool _3315 = !_1635;
    int _3317 = _3315 ? _2273 : (-1);
    float _3319 = rsqrt(_3299);
    int _3321 = _3313 * _3309;
    bool _3323 = !_1645;
    int _3325 = _3323 ? _2909 : (-1);
    int _3327 = _3317 * _3233;
    int _3329 = _3327 + _3303;
    int _3331 = abs(_3191);
    float _3333 = _2403 * _3171;
    int _3335 = as_type<int>(_3243) + (-2);
    int _3337 = _3325 * _3221;
    int _3339 = _3337 + _3321;
    float _3341 = float(uint(_3331));
    float _3343 = _2403 * _3173;
    float _3345 = float(uint(_3301));
    float _3347 = _3171 * _2361;
    float _3349 = 1.0 / _3341;
    int _3351 = as_type<int>(_3275) + (-2);
    float _3353 = _3285 * _3319;
    float _3355 = float(uint(_3329));
    float _3357 = _3253 * _3319;
    int _3359 = abs(_3329);
    float _3361 = fma(_2509, _3353, _3333);
    float _3363 = 1.0 / _3345;
    float _3365 = as_type<float>(_3335) * _3355;
    float _3367 = float(uint(_3339));
    float _3369 = fma(_2561, _2381, _3361);
    float _3371 = fma(_2509, _3357, _3343);
    int _3373 = ~_3331;
    int _3375 = _3373 + 1;
    float _3377 = as_type<float>(_3351) * _3367;
    float _3379 = trunc(_3365);
    float _3381 = precise::max(_3379, 0.0);
    uint _3383 = uint(_3381);
    int _3385 = as_type<int>(_3349) + (-2);
    float _3387 = fma(_2521, _2381, _3371);
    float _3389 = _2051 + _3369;
    float _3391 = fma(_3353, _2249, _3219);
    float _3393 = _2015 + _3387;
    float _3395 = float(uint(_3359));
    float _3397 = trunc(_3377);
    float _3399 = precise::max(_3397, 0.0);
    uint _3401 = uint(_3399);
    int _3403 = as_type<int>(_3363) + (-2);
    float _3405 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3407 = _3389 + _3405;
    int _3409 = abs(_3339);
    float _3411 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3413 = _3393 + _3411;
    float _3415 = as_type<float>(_3403) * _3395;
    float _3417 = _3407 * _3407;
    int _3419 = _3259 * int(_3383);
    int _3421 = _3419 + _3329;
    float _3423 = _3139 + 0.5;
    float _3425 = fma(_3413, _3413, _3417);
    float _3427 = trunc(_3415);
    float _3429 = precise::max(_3427, 0.0);
    uint _3431 = uint(_3429);
    float _3433 = float(uint(_3421));
    float _3435 = _2949 + 0.5;
    int _3437 = ~_3301;
    int _3439 = _3437 + 1;
    int _3441 = _3279 * int(_3401);
    int _3443 = _3441 + _3339;
    float _3445 = float(uint(_3409));
    float _3447 = as_type<float>(_3335) * _3433;
    out.m_79.x = _3435;
    out.m_79.y = _3423;
    float _3449 = sqrt(_3425);
    float _3451 = float(uint(_3443));
    float _3453 = as_type<float>(_3385) * _3445;
    float _3455 = _3213 * _2251;
    float _3457 = as_type<float>(_3351) * _3451;
    float _3459 = _3173 * _2251;
    float _3461 = trunc(_3453);
    float _3463 = precise::max(_3461, 0.0);
    uint _3465 = uint(_3463);
    int _3467 = _3439 * int(_3431);
    int _3469 = _3467 + _3359;
    float _3471 = _2365 * _3173;
    float _3473 = _3213 * _2361;
    float _3475 = _2403 * _3213;
    float _3477 = fma(_3357, _2249, _3459);
    float _3479 = float(uint(_3469));
    float _3481 = _3237 * _3319;
    float _3483 = trunc(_3447);
    float _3485 = precise::max(_3483, 0.0);
    uint _3487 = uint(_3485);
    float _3489 = _3173 * _2361;
    bool _3491 = _3449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3493 = as_type<float>(_3403) * _3479;
    float _3495 = fma(_2509, _3481, _3475);
    int _3497 = ~_3157;
    int _3499 = _3497 + 1;
    float _3501 = fma(_3481, _2249, _3455);
    float _3503 = fma(_2363, _3357, _3471);
    int _3505 = _3375 * int(_3465);
    int _3507 = _3505 + _3409;
    float _3509 = trunc(_3457);
    float _3511 = precise::max(_3509, 0.0);
    uint _3513 = uint(_3511);
    float _3515 = fma(_2525, _2381, _3495);
    int _3517 = ~_3191;
    int _3519 = _3517 + 1;
    float _3521 = fma(_2363, _3481, _3261);
    float _3523 = float(uint(_3507));
    float _3525 = fma(_2363, _3353, _3281);
    float _3527 = fma(_3481, _2397, _3473);
    int _3529 = int(_3383) + int(_3487);
    float _3531 = trunc(_3493);
    float _3533 = precise::max(_3531, 0.0);
    uint _3535 = uint(_3533);
    float _3537 = as_type<float>(_3385) * _3523;
    float _3539 = fma(_3353, _2397, _3347);
    float _3541 = fma(_2521, _2253, _3477);
    int _3543 = _3499 * _3529;
    int _3545 = _3543 + _3329;
    float _3547 = fma(_2525, _2253, _3501);
    float _3549 = fma(_3357, _2397, _3489);
    float _3551 = fma(_2561, _2253, _3391);
    float _3553 = trunc(_3537);
    float _3555 = precise::max(_3553, 0.0);
    uint _3557 = uint(_3555);
    int _3559 = int(_3401) + int(_3513);
    float _3561 = _1993 + _3515;
    bool _3563 = uint(_3545) >= uint(_3157);
    int _3565 = ~_3301;
    int _3567 = _3565 + 1;
    int _3569 = _3519 * _3559;
    int _3571 = _3569 + _3339;
    int _3573 = ~_3331;
    int _3575 = _3573 + 1;
    int _3577 = int(_3431) + int(_3535);
    float _3579 = as_type<float>(_3545);
    float _3581 = _3515;
    float _3583 = _3473;
    float _3585 = _3541;
    float _3587 = _3547;
    if (!_3491)
    {
        _3579 = _3393;
    }
    float _3589 = _3579;
    float _3591 = _3589;
    if (!_3491)
    {
        _3581 = _3389;
    }
    float _3593 = _3581;
    float _3595 = _3593;
    if (!_3491)
    {
        _3583 = _3561;
    }
    float _3597 = _3583;
    int _3599 = int(_3465) + int(_3557);
    bool _3601 = !_3491;
    float _3603 = _3597;
    if (!_3601)
    {
        float _3605 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3607 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3609 = _3449 + _3607;
        float _3611 = _3561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3613 = rsqrt(_3425);
        float _3615 = _3609 * _3605;
        float _3617 = _3615 * 0.15915493667125701904296875;
        float _3619 = _3617 * 6.283185482025146484375;
        float _3621 = cos(_3619);
        float _3623 = _3617 * 6.283185482025146484375;
        float _3625 = sin(_3623);
        float _3627 = _3621 + (-1.0);
        float _3629 = fma(_3625, _3611, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3631 = _3627 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3633 = _3613 * _3629;
        float _3635 = fma(_3561, _3621, _3631);
        float _3637 = fma(_3413, _3633, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3639 = fma(_3407, _3633, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3591 = _3637;
        _3603 = _3635;
        _3595 = _3639;
    }
    float _3641 = _3591;
    float _3643 = _3603;
    float _3645 = _3595;
    bool _3647 = !_3563;
    int _3649 = _3647 ? 0 : (-1);
    float _3651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3653 = _3567 * _3577;
    int _3655 = _3653 + _3359;
    bool _3657 = uint(_3571) >= uint(_3191);
    int _3659 = _3575 * _3599;
    int _3661 = _3659 + _3409;
    int _3663 = ~_3529;
    int _3665 = _3663 + _3649;
    int _3667 = _3665 + 1;
    float _3669 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2419);
    bool _3671 = uint(_3655) >= uint(_3301);
    float _3673 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3069);
    bool _3675 = !_3657;
    int _3677 = _3675 ? 0 : (-1);
    int _3679 = _3157 * _3667;
    int _3681 = _3679 + _3329;
    bool _3683 = _3157 == 0;
    float _3685 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2421);
    bool _3687 = _3157 == 0;
    float _3689 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2943);
    int _3691 = _3329 ^ _3157;
    out.m_81.x = _2491;
    int _3693 = ~_3559;
    int _3695 = _3693 + _3677;
    int _3697 = _3695 + 1;
    float _3699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3701 = !_3683;
    int _3703 = _3701 ? _3681 : (-1);
    bool _3705 = uint(_3661) >= uint(_3331);
    int _3707 = _3191 * _3697;
    int _3709 = _3707 + _3339;
    int _3711 = _3339 ^ _3191;
    float _3713 = _3651 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3715 = _3191 == 0;
    float _3717 = fma(_2561, _2379, _3539);
    bool _3719 = _3191 == 0;
    float _3721 = -_144;
    float _3723 = fma(_3721, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2401);
    float _3725 = float(_3703);
    float _3727 = fma(_3713, _1797, -0.5);
    bool _3729 = !_3705;
    int _3731 = _3729 ? 0 : (-1);
    float _3733 = -_2211;
    float _3735 = _2015 + _3733;
    bool _3737 = !_3671;
    int _3739 = _3737 ? 0 : (-1);
    float _3741 = fma(_3713, _3725, _3723);
    uint _3743 = uint(int(uint(_3691) >> uint(31)));
    float _3745 = _3699 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3747 = ~_3731;
    int _3749 = _3599 + _3747;
    int _3751 = _3749 + 1;
    float _3753 = -_144;
    float _3755 = fma(_3753, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3041);
    bool _3757 = !_3715;
    int _3759 = _3757 ? _3709 : (-1);
    float _3761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _3763 = uint(int(uint(_3711) >> uint(31)));
    float _3765 = fma(_3745, _1875, -0.5);
    int _3767 = ~_3739;
    int _3769 = _3577 + _3767;
    int _3771 = _3769 + 1;
    float _3773 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1262);
    int _3775 = ~int(_3743);
    int _3777 = _3775 + 1;
    float _3779 = fma(_2521, _2379, _3549);
    float _3781 = float(_3759);
    float _3783 = fma(_3773, _3727, _3741);
    int _3785 = ~int(_3763);
    int _3787 = _3785 + 1;
    out.m_83.x = _3541;
    out.m_83.y = _3547;
    out.m_83.z = _3551;
    int _3789 = _3771 ^ _3777;
    float _3791 = fma(_3745, _3781, _3755);
    int _3793 = _3751 ^ _3787;
    float _3795 = -_2199;
    float _3797 = _2051 + _3795;
    int _3799 = ~_3777;
    int _3801 = _3799 + _3789;
    int _3803 = _3801 + 1;
    float _3805 = _3761 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3807 = ~_3787;
    int _3809 = _3807 + _3793;
    int _3811 = _3809 + 1;
    float _3813 = _2367 * _2521;
    float _3815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3817 = !_3687;
    int _3819 = _3817 ? _3803 : (-1);
    float _3821 = fma(_1863, _3805, -0.5);
    float _3823 = _2367 * _2525;
    float _3825 = _2367 * _2561;
    float _3827 = float(_3819);
    float _3829 = _3813 + _3503;
    bool _3831 = !_3719;
    int _3833 = _3831 ? _3811 : (-1);
    float _3835 = _3823 + _3521;
    float _3837 = -_2015;
    float _3839 = _3837 + _3641;
    float _3841 = -_3669;
    float _3843 = fma(_3805, _3827, _3841);
    float _3845 = -_1993;
    float _3847 = _3845 + _3643;
    float _3849 = _3825 + _3525;
    float _3851 = float(_3833);
    float _3853 = -_2051;
    float _3855 = _3853 + _3645;
    float _3857 = _3847 * _3847;
    float _3859 = _3815 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3861 = fma(_3685, _3821, _3843);
    float _3863 = fma(_2525, _2379, _3527);
    float _3865 = fma(_3839, _3839, _3857);
    float _3867 = fma(_1925, _3859, -0.5);
    float _3869 = -_3673;
    float _3871 = fma(_3859, _3851, _3869);
    float _3873 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2937);
    float _3875 = fma(_3855, _3855, _3865);
    float _3877 = _3783 + 0.5;
    float _3879 = _3861 + 0.5;
    float _3881 = fma(_3873, _3765, _3791);
    float _3883 = fma(_3689, _3867, _3871);
    float _3885 = sqrt(_3875);
    out.m_85.x = _3829;
    out.m_85.y = _3835;
    out.m_85.z = _3849;
    float _3887 = _3881 + 0.5;
    float _3889 = _3883 + 0.5;
    float _3891 = -_2211;
    float _3893 = _3891 + _3641;
    out.m_87.x = _3779;
    out.m_87.y = _3863;
    out.m_87.z = _3717;
    float _3895 = -_2197;
    float _3897 = _3895 + _3643;
    float _3899 = -_2197;
    float _3901 = _1993 + _3899;
    out.m_89.x = _3877;
    out.m_89.y = _3879;
    out.m_89.z = _3887;
    out.m_89.w = _3889;
    bool _3903 = _3885 > 0.0;
    float _3905 = -_2199;
    float _3907 = _3905 + _3645;
    float _3909 = _3835;
    float _3911 = _3829;
    float _3913 = _3847;
    if (!_3903)
    {
        _2389 = _3893;
    }
    float _3915 = _2389;
    float _3917 = _3915;
    float _3919 = _3915;
    if (!_3903)
    {
        _3585 = _3897;
    }
    float _3921 = _3585;
    float _3923 = _3921;
    float _3925 = _3921;
    if (!_3903)
    {
        _3587 = _3907;
    }
    float _3927 = _3587;
    bool _3929 = !_3903;
    float _3931 = _3927;
    float _3933 = _3927;
    if (!_3929)
    {
        bool _3935 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3937 = _3551;
        if (_3935)
        {
            float _3939 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3937 = _3939;
        }
        float _3941 = _3937;
        float _3943 = _3941;
        if (_3935)
        {
            float _3945 = _602 * _3941;
            _3909 = _3945;
        }
        float _3947 = _3909;
        float _3949 = _3947;
        if (_3935)
        {
            float _3951 = _604 * _3941;
            _3911 = _3951;
        }
        float _3953 = _3911;
        float _3955 = _3953;
        if (_3935)
        {
            float _3957 = _606 * _3941;
            _3943 = _3957;
        }
        float _3959 = _3943;
        float _3961 = _3959;
        if (!_3935)
        {
            bool _3963 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3965 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3967 = _3963 || _3965;
            bool _3969 = isnan(1.0);
            bool _3971 = _3967 || _3969;
            float _3973 = _144 + 1.0;
            if (!_3971)
            {
                float _3975 = _3973 * _3973;
                float _3977 = _3975 * 0.5;
                _166 = _3977;
            }
            float _3979 = _166;
            float _3981 = _3979;
            if (!_3971)
            {
                float _3983 = _3979 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3981 = _3983;
            }
            float _3985 = _3981;
            bool _3987 = !_3971;
            float _3989 = _3985;
            if (!_3987)
            {
                float _3991 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3993 = log2(_3991);
                float _3995 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3997 = _3995 + 1.0;
                float _3999 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4001 = _3993 * _3973;
                float _4003 = 1.0 / _3997;
                float _4005 = _3999 * 0.693147182464599609375;
                float _4007 = exp2(_4001);
                float _4009 = 1.0 / _4005;
                float _4011 = _4007 + (-1.0);
                float _4013 = -_4011;
                float _4015 = fma(_4013, _4009, _3973);
                float _4017 = _4015 * _4003;
                float _4019 = _4017 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3989 = _4019;
            }
            float _4021 = _3989;
            float _4023 = _4021 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _4025 = _4021 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4027 = _4021 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4029 = _4021;
            if (!_3971)
            {
                _4029 = _3973;
            }
            float _4031 = _4029;
            float _4033 = _4023 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _4035 = _4023 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _4037 = _4023 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _4039 = fma(_4025, (*spvDescriptorSet0.vp_c10)._m0[8].y, _4033);
            float _4041 = fma(_4025, (*spvDescriptorSet0.vp_c10)._m0[8].x, _4035);
            float _4043 = fma(_4027, (*spvDescriptorSet0.vp_c10)._m0[10].y, _4039);
            bool _4045 = !_3971;
            float _4047 = _4031;
            if (!_4045)
            {
                float _4049 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4051 = log2(_4049);
                float _4053 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4055 = _4053 + 1.0;
                float _4057 = 1.0 / _4055;
                float _4059 = _4051 * _3973;
                float _4061 = exp2(_4059);
                float _4063 = -_4061;
                float _4065 = _4063 + 1.0;
                float _4067 = _4065 * _4057;
                _4047 = _4067;
                _202 = _4057;
            }
            float _4069 = _4047;
            float _4071 = _202;
            float _4073 = fma(_4025, (*spvDescriptorSet0.vp_c10)._m0[8].z, _4037);
            float _4075 = fma(_4069, _314, _4043);
            float _4077 = fma(_4027, (*spvDescriptorSet0.vp_c10)._m0[10].x, _4041);
            float _4079 = fma(_4027, (*spvDescriptorSet0.vp_c10)._m0[10].z, _4073);
            float _4081 = -_540;
            float _4083 = _4081 + _4075;
            float _4085 = fma(_4069, _312, _4077);
            float _4087 = fma(_4069, _316, _4079);
            float _4089 = _4083 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4091 = _4083 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4093 = -_544;
            float _4095 = _4093 + _4085;
            float _4097 = _4083 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4099 = -_546;
            float _4101 = _4099 + _4087;
            float _4103 = fma(_4095, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4089);
            float _4105 = fma(_4095, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4091);
            float _4107 = fma(_4095, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4097);
            float _4109 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4103);
            float _4111 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4105);
            float _4113 = fma(_4101, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4107);
            _616 = _4111;
            _618 = _4109;
            _620 = _4113;
            _3949 = _4109;
            _3955 = _4111;
            _3961 = _4113;
            _3917 = _4079;
            _3923 = _4107;
            _3931 = _4077;
            _390 = _4105;
            _204 = _4071;
        }
        float _4115 = _616;
        float _4117 = _618;
        float _4119 = _620;
        float _4121 = _3949;
        float _4123 = _3955;
        float _4125 = _3961;
        float _4127 = _3917;
        float _4129 = _3923;
        float _4131 = _3931;
        float _4133 = _390;
        float _4135 = _204;
        float _4137 = _4115 * _4115;
        float _4139 = rsqrt(_3875);
        float _4141 = fma(_4117, _4117, _4137);
        float _4143 = fma(_4119, _4119, _4141);
        float _4145 = sqrt(_4143);
        float _4147 = _3839 * _4139;
        float _4149 = _3847 * _4139;
        float _4151 = _3855 * _4139;
        bool _4153 = _4145 > 0.0;
        float _4155 = _4127;
        float _4157 = _4129;
        float _4159 = _4131;
        _392 = _4133;
        _3913 = _4149;
        _622 = _4115;
        _206 = _4135;
        if (!_4153)
        {
            _4155 = _3893;
        }
        float _4161 = _4155;
        _3919 = _4161;
        if (!_4153)
        {
            _4157 = _3897;
        }
        float _4163 = _4157;
        _3925 = _4163;
        if (!_4153)
        {
            _4159 = _3907;
        }
        float _4165 = _4159;
        bool _4167 = !_4153;
        _3933 = _4165;
        if (!_4167)
        {
            float _4169 = rsqrt(_4143);
            float _4171 = _4169 * _4115;
            float _4173 = _4169 * _4117;
            float _4175 = _4169 * _4119;
            float _4177 = _4149 * _4171;
            float _4179 = fma(_4147, _4173, _4177);
            float _4181 = fma(_4151, _4175, _4179);
            float _4183 = _4181 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4185 = fma(_4121, _4183, _3893);
            float _4187 = fma(_4123, _4183, _3897);
            float _4189 = fma(_4125, _4183, _3907);
            _3919 = _4185;
            _3925 = _4187;
            _3933 = _4189;
            _392 = _4177;
        }
    }
    float _4191 = _3919;
    float _4193 = _3925;
    float _4195 = _3933;
    float _4197 = _392;
    float _4199 = _3913;
    float _4201 = _622;
    float _4203 = _206;
    float _4205 = _3901 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4207 = fma(_3735, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4205);
    float _4209 = _3901 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4211 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4213 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4215 = _4211 || _4213;
    bool _4217 = isnan(0.5);
    bool _4219 = _4215 || _4217;
    float _4221 = fma(_3797, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4207);
    float _4223 = fma(_3735, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4209);
    float _4225 = _4221 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4227 = fma(_3797, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4223);
    bool _4229 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4231 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4233 = _4229 || _4231;
    bool _4235 = isnan(0.5);
    bool _4237 = _4233 || _4235;
    float _4239 = 1.0 / _4225;
    float _4241 = _4227 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4243 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4245 = _4241;
    float _4247 = _4197;
    float _4249 = _4221;
    float _4251 = _4199;
    float _4253 = _4201;
    float _4255 = _4203;
    if (_4219)
    {
        _4243 = _4191;
    }
    float _4257 = _4243;
    float _4259 = _4241 + _4225;
    float _4261 = _4257;
    if (_4219)
    {
        _4245 = _4193;
    }
    float _4263 = _4245;
    float _4265 = _4263;
    if (_4219)
    {
        _4247 = _4195;
    }
    float _4267 = _4247;
    float _4269 = _4267;
    if (!_4219)
    {
        float _4271 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4273 = _3901 + _4271;
        float _4275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4277 = _3735 + _4275;
        float _4279 = -_3735;
        float _4281 = _4279 + _4191;
        float _4283 = -_3901;
        float _4285 = _4283 + _4193;
        float _4287 = _4273 * _4273;
        float _4289 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4291 = _3797 + _4289;
        float _4293 = -_3797;
        float _4295 = _4293 + _4195;
        float _4297 = fma(_4277, _4277, _4287);
        float _4299 = fma(_4291, _4291, _4297);
        float _4301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4303 = sqrt(_4299);
        float _4305 = precise::min(_4303, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4307 = _4305 * _4301;
        float _4309 = fma(_4281, _4307, _3735);
        float _4311 = fma(_4285, _4307, _3901);
        float _4313 = fma(_4295, _4307, _3797);
        _4265 = _4311;
        _4261 = _4309;
        _4269 = _4313;
        _4249 = _4303;
    }
    float _4315 = _4265;
    float _4317 = _4261;
    float _4319 = _4269;
    float _4321 = _4249;
    float _4323 = _4321;
    if (_4237)
    {
        _4323 = 1.0;
    }
    float _4325 = _4323;
    float _4327 = _4259 * _4239;
    float _4329 = _4327 * 0.5;
    float _4331 = _4325;
    float _4333 = _4329;
    if (!_4237)
    {
        float _4335 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4337 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4339 = fma(_4329, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4337);
        float _4341 = _4335 * 0.15915493667125701904296875;
        float _4343 = _4341 * 6.283185482025146484375;
        float _4345 = cos(_4343);
        float _4347 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4349 = _4347 * 0.15915493667125701904296875;
        float _4351 = _4341 * 6.283185482025146484375;
        float _4353 = sin(_4351);
        float _4355 = 1.0 / _4345;
        float _4357 = _4349 * 6.283185482025146484375;
        float _4359 = cos(_4357);
        float _4361 = _4353 * _4355;
        float _4363 = 1.0 / _4339;
        float _4365 = _4359 * _4361;
        float _4367 = _4349 * 6.283185482025146484375;
        float _4369 = sin(_4367);
        float _4371 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4373 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4371;
        float _4375 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4377 = _4363 * _4375;
        float _4379 = 1.0 / _4365;
        float _4381 = 1.0 / _4373;
        float _4383 = _4369 * _4379;
        float _4385 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4387 = fma(_4383, _4377, _4385);
        float _4389 = _4387 * _4381;
        float _4391 = precise::clamp(_4389, 0.0, 1.0);
        _4331 = _4391;
    }
    float _4393 = _4331;
    float _4395 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4397 = _4315 + _4395;
    float _4399 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4401 = _4317 + _4399;
    float _4403 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4405 = _4319 + _4403;
    float _4407 = _4397 * _4397;
    float _4409 = fma(_4401, _4401, _4407);
    float _4411 = fma(_4405, _4405, _4409);
    float _4413 = rsqrt(_4411);
    float _4415 = sqrt(_4411);
    float _4417 = _4413 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4419 = _4401 * _4417;
    float _4421 = _4405 * _4417;
    float _4423 = _4419 * _4419;
    float _4425 = _4421 * _4421;
    float _4427 = _4423 + _4425;
    float _4429 = sqrt(_4427);
    bool _4431 = _4429 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4433 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4435 = _4429 + _4433;
    float _4437 = _4413;
    float _4439 = _4427;
    float _4441 = _4435;
    float _4443 = _4397;
    if (_4431)
    {
        float _4445 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4437 = _4445;
    }
    float _4447 = _4437;
    if (_4431)
    {
        float _4449 = rsqrt(_4427);
        _4439 = _4449;
    }
    float _4451 = _4439;
    if (_4431)
    {
        float _4453 = _4435 * _4447;
        _4441 = _4453;
    }
    float _4455 = _4441;
    if (_4431)
    {
        float _4457 = _4455 * 0.15915493667125701904296875;
        _4251 = _4457;
    }
    float _4459 = _4251;
    float _4461 = _4405;
    if (_4431)
    {
        float _4463 = _4459 * 6.283185482025146484375;
        float _4465 = sin(_4463);
        _4461 = _4465;
    }
    float _4467 = _4461;
    float _4469 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4471 = precise::max(0.0, _4469);
    float _4473 = _4447;
    float _4475 = _4471;
    if (_4431)
    {
        float _4477 = _4459 * 6.283185482025146484375;
        float _4479 = cos(_4477);
        _4473 = _4479;
    }
    float _4481 = _4473;
    float _4483 = -_4417;
    float _4485 = -_4471;
    float _4487 = fma(_4397, _4483, _4485);
    if (_4431)
    {
        float _4489 = _4487 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4443 = _4489;
    }
    float _4491 = _4443;
    float _4493 = _4467;
    float _4495 = _4491;
    if (_4431)
    {
        float _4497 = fma(_4467, _4491, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4333 = _4497;
    }
    float _4499 = _4333;
    float _4501 = _4499;
    if (!_4431)
    {
        _4493 = _4419;
    }
    float _4503 = _4493;
    float _4505 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4507 = fma(_4415, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4505);
    float _4509 = precise::clamp(_4507, 0.0, 1.0);
    float _4511 = _4503;
    if (!_4431)
    {
        _4495 = _4487;
    }
    float _4513 = _4495;
    float _4515 = _4513;
    float _4517 = _4481;
    if (_4431)
    {
        float _4519 = _4481 + (-1.0);
        _4475 = _4519;
    }
    float _4521 = _4475;
    float _4523 = _4521;
    if (_4431)
    {
        float _4525 = _4451 * _4499;
        _4253 = _4525;
    }
    float _4527 = _4253;
    if (!_4431)
    {
        _4501 = _4423;
    }
    float _4529 = _4501;
    float _4531 = _4315 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4533 = _4529;
    if (_4431)
    {
        float _4535 = _4521 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4255 = _4535;
    }
    float _4537 = _4255;
    if (_4431)
    {
        float _4539 = _4419 * _4527;
        _4511 = _4539;
    }
    float _4541 = _4511;
    if (!_4431)
    {
        _4523 = _4421;
    }
    float _4543 = _4523;
    float _4545 = _4543;
    if (_4431)
    {
        float _4547 = _4421 * _4527;
        _4545 = _4547;
    }
    float _4549 = _4545;
    if (_4431)
    {
        float _4551 = fma(_4487, _4481, _4537);
        _4515 = _4551;
    }
    float _4553 = _4515;
    if (_4431)
    {
        float _4555 = _4541 * _4541;
        _4533 = _4555;
    }
    float _4557 = _4533;
    if (!_4431)
    {
        _4517 = _4425;
    }
    float _4559 = _4517;
    float _4561 = _4559;
    if (_4431)
    {
        float _4563 = _4549 * _4549;
        _4561 = _4563;
    }
    float _4565 = _4561;
    float _4567 = -_4509;
    float _4569 = _4567 + 1.0;
    float _4571 = fma(_4553, _4553, _4557);
    float _4573 = _4315 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4575 = _4571 + _4565;
    float _4577 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4531);
    float _4579 = _4315 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4581 = abs(_4569);
    float _4583 = log2(_4581);
    float _4585 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4587 = fma(_4319, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4577);
    float _4589 = _4315 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4591 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4579);
    float _4593 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4573);
    float _4595 = _4587 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4597 = fma(_4317, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4589);
    float _4599 = rsqrt(_4575);
    float _4601 = fma(_4319, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4591);
    float _4603 = fma(_4319, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4593);
    float _4605 = fma(_4319, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4597);
    float _4607 = _4601 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4609 = _4603 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4611 = _4605 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4613 = _4583 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4615 = _4595 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4617 = -_4615;
    float _4619 = fma(_4617, _4585, 1.0);
    float _4621 = _4607 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4623 = exp2(_4613);
    float _4625 = _4599 * _4541;
    float _4627 = _4599 * _4553;
    float _4629 = fma(_4611, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4621);
    float _4631 = _4599 * _4549;
    float _4633 = _4625 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4635 = fma(_4595, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4629);
    float _4637 = log2(_4619);
    float _4639 = -_4633;
    float _4641 = fma(_4627, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4639);
    float _4643 = _4607 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4645 = fma(_4609, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4635);
    float _4647 = -_4631;
    float _4649 = fma(_4647, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4641);
    float _4651 = _4607 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4653 = fma(_4611, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4643);
    float _4655 = 1.0 / _4645;
    float _4657 = fma(_4649, -0.5, 0.5);
    float _4659 = fma(_4611, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4651);
    float _4661 = fma(_4649, 0.5, 0.5);
    float _4663 = _4627 + 1.0;
    float _4665 = fma(_4595, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4653);
    float _4667 = fma(_4595, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4659);
    float _4669 = fma(_4661, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4671 = sqrt(_4657);
    float _4673 = -_4627;
    float _4675 = fma(_4623, _4663, _4673);
    float _4677 = fma(_4609, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4667);
    float _4679 = fma(_4609, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4665);
    float _4681 = fma(_4661, _4669, -0.212114393711090087890625);
    float _4683 = _4637 * 0.693147182464599609375;
    float _4685 = fma(_4675, 0.5, 0.5);
    float _4687 = _4677 * _4655;
    float _4689 = _4679 * _4655;
    float _4691 = fma(_4661, _4681, 1.570728778839111328125);
    float _4693 = _4683 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4695 = fma(_4687, 0.5, 0.5);
    float _4697 = fma(_4689, -0.5, 0.5);
    float _4699 = _4671 * 0.636619746685028076171875;
    float3 _12094 = float3(_4695, _4697, _4693);
    float _4701 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12094, float3(0.0), isnan(_12094)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12094, float3(0.0), isnan(_12094)), level(0.0)).x;
    float3 _12105 = float3(_4695, _4697, _4693);
    float4 _4704 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12105, float3(0.0), isnan(_12105)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12105, float3(0.0), isnan(_12105)), level(0.0)).xyzw;
    float _4706 = _4704.x;
    float _4708 = _4704.y;
    float _4710 = _4704.z;
    float _4712 = _4704.w;
    float _4714 = -_4691;
    float _4716 = fma(_4699, _4714, 1.0);
    float2 _12127 = float2(_4716, _4685);
    float3 _4720 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12127, float2(0.0), isnan(_12127)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12127, float2(0.0), isnan(_12127)), level(0.0)).xyz;
    float _4722 = _4720.x;
    float _4724 = _4720.y;
    float _4726 = _4720.z;
    float _4728 = _4583 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4730 = _4607 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_91.x = _3735;
    out.m_91.y = _3901;
    out.m_91.z = _3797;
    bool _4732 = _4415 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4734 = isnan(_4415);
    bool _4736 = _4732 || _4734;
    bool _4738 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4740 = _4736 || _4738;
    float _4742 = fma(_4611, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4730);
    float _4744 = exp2(_4728);
    float _4746 = _4677 + _4645;
    out.m_93.x = _4317;
    out.m_93.y = _4315;
    out.m_93.z = _4319;
    float _4748 = fma(_4595, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4742);
    float _4750 = _4645 * 0.5;
    float _4752 = _4746 * 0.5;
    float _4754 = fma(_4609, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4748);
    float _4756 = fma(_4679, -0.5, _4750);
    float _4758 = _4754 + _4645;
    out.gl_Position.x = _4677;
    out.gl_Position.y = _4679;
    out.gl_Position.z = _4754;
    out.gl_Position.w = _4645;
    float _4760 = _4758 * 0.5;
    float _4762 = -_4744;
    float _4764 = _4762 + 1.0;
    float _4766 = _4764 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_95.x = _4752;
    out.m_95.y = _4756;
    out.m_95.z = _4760;
    out.m_95.w = _4645;
    float _4768 = -_4766;
    float _4770 = _4768 + 1.0;
    float _4772 = _4754;
    float _4774 = _4679;
    float _4776 = _4677;
    if (!_4740)
    {
        _4772 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4778 = _4772;
    float _4780 = _4778;
    float _4782 = _4778;
    if (!_4740)
    {
        _4774 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4784 = _4774;
    float _4786 = _4784;
    float _4788 = _4784;
    if (!_4740)
    {
        _4776 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4790 = _4776;
    float _4792 = _4766 * _4701;
    float _4794 = _4712 * _4770;
    float _4796 = _4393 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4798 = _4712 * _4792;
    float _4800 = _4726 * _4792;
    float _4802 = fma(_4722, _4798, _4706);
    float _4804 = fma(_4724, _4798, _4708);
    float _4806 = fma(_4712, _4800, _4710);
    out.m_97.x = _4802;
    out.m_97.y = _4804;
    out.m_97.z = _4806;
    out.m_97.w = _4794;
    bool _4808 = !_4740;
    float _4810 = _4790;
    float _4812 = _4790;
    if (!_4808)
    {
        bool _4814 = _4415 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4816 = isnan(_4415);
        bool _4818 = _4814 || _4816;
        bool _4820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4822 = _4818 || _4820;
        if (!_4822)
        {
            float _4824 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4826 = _4415 + _4824;
            float _4828 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4830 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4828;
            float _4832 = 1.0 / _4830;
            float _4834 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4836 = _4834 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4838 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4840 = _4838 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4842 = _4826 * _4832;
            float _4844 = precise::clamp(_4842, 0.0, 1.0);
            float _4846 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4848 = _4846 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4850 = fma(_4844, _4840, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4852 = fma(_4844, _4848, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4854 = fma(_4844, _4836, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4788 = _4854;
            _4782 = _4852;
            _4812 = _4850;
            _4856 = true;
        }
        else
        {
            bool _4858 = _4415 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4860 = isnan(_4415);
            bool _4862 = _4858 || _4860;
            bool _4864 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4866 = _4862 || _4864;
            if (!_4866)
            {
                _4780 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4868 = _4780;
            _4782 = _4868;
            if (!_4866)
            {
                _4786 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4870 = _4786;
            _4788 = _4870;
            if (!_4866)
            {
                _4810 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4872 = _4810;
            bool _4874 = !_4866;
            _4812 = _4872;
            if (!_4874)
            {
                bool _4876 = _4415 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4878 = isnan(_4415);
                bool _4880 = _4876 || _4878;
                bool _4882 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4884 = _4880 || _4882;
                if (!_4884)
                {
                    float _4886 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4888 = _4415 + _4886;
                    float _4890 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4892 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4890;
                    float _4894 = 1.0 / _4892;
                    float _4896 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4898 = _4896 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4900 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4902 = _4900 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4904 = _4888 * _4894;
                    float _4906 = precise::clamp(_4904, 0.0, 1.0);
                    float _4908 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4910 = _4908 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4912 = fma(_4906, _4902, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4914 = fma(_4906, _4910, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4916 = fma(_4906, _4898, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4788 = _4916;
                    _4782 = _4914;
                    _4812 = _4912;
                    _4856 = true;
                }
                else
                {
                    _4788 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4782 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4812 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4856 = false;
    float _4918 = _4788;
    float _4920 = _4782;
    float _4922 = _4812;
    float _4924 = _4796 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_99.x = 0.0;
    float _4926 = _4918 * 0.586610972881317138671875;
    bool _4928 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _4924;
    float _4930 = fma(_4920, 0.298911988735198974609375, _4926);
    bool _4932 = _4393 > 0.0;
    bool _4934 = isnan(_4393);
    bool _4936 = _4932 || _4934;
    bool _4938 = isnan(0.0);
    bool _4940 = _4936 || _4938;
    float _4942 = fma(_4922, 0.114477999508380889892578125, _4930);
    float _4944 = -_4942;
    float _4946 = _4944 + _4920;
    float _4948 = -_4942;
    float _4950 = _4948 + _4918;
    float _4952 = -_4942;
    float _4954 = _4952 + _4922;
    float _4956 = fma(_4946, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4942);
    float _4958 = fma(_4950, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4942);
    float _4960 = fma(_4954, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4942);
    bool _4962 = !_4928;
    if (!_4962)
    {
        float _4964 = -_4315;
        float _4966 = _4964 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4968 = -_4317;
        float _4970 = _4968 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4972 = -_4319;
        float _4974 = _4972 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4976 = _4966 * _4966;
        float _4978 = fma(_4970, _4970, _4976);
        float _4980 = fma(_4974, _4974, _4978);
        float _4982 = sqrt(_4980);
        float _4984 = rsqrt(_4980);
        float _4986 = -_4982;
        float _4988 = _4986 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4990 = _4988 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4992 = precise::clamp(_4990, 0.0, 1.0);
        float _4994 = _4970 * _4984;
        float _4996 = _4966 * _4984;
        float _4998 = abs(_4992);
        float _5000 = log2(_4998);
        float _5002 = _4974 * _4984;
        float _5004 = _4994 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5006 = _3863 * _4996;
        float _5008 = -_4996;
        float _5010 = -_5004;
        float _5012 = fma(_5008, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5010);
        float _5014 = fma(_3779, _4994, _5006);
        float _5016 = -_5002;
        float _5018 = fma(_5016, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5012);
        float _5020 = fma(_3717, _5002, _5014);
        float _5022 = precise::clamp(_5020, 0.0, 1.0);
        float _5024 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5026 = _5018 + _5024;
        float _5028 = _5000 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5030 = _5026 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5032 = precise::clamp(_5030, 0.0, 1.0);
        float _5034 = exp2(_5028);
        float _5036 = _5034 * _5032;
        float _5038 = _5022 * _5036;
        float _5040 = _5038 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5042 = _5038 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5044 = _5038 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _5040;
        out.m_99.y = _5042;
        out.m_99.z = _5044;
    }
    out.m_71.x = _4956;
    out.m_71.y = _4958;
    out.m_71.z = _4960;
    if (_4940)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _5046 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5046;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

