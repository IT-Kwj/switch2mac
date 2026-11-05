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
    bool _4894 = false;
    bool _1262 = false;
    bool _1052 = false;
    bool _946 = false;
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
        float _5140 = as_type<float>(_132);
        out.gl_Position.z = _5140;
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
        float _5212 = as_type<float>(_172);
        out.gl_Position.z = _5212;
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
    bool _820 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _822 = isnan(_814);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _836 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _838 = isnan(_814);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = 1.0 / _818;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _850;
    float _854 = -_830;
    float _856 = _854 + 1.0;
    bool _858 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _860 = isnan(_814);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    bool _870 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _872 = _846 * _856;
    float _874 = -_846;
    float _876 = _874 + 1.0;
    float _878 = 1.0 / _834;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _884 = _852 * _848;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _888 = _814 + _886;
    float _890 = -_868;
    float _892 = _890 + 1.0;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _896 = _814 + _894;
    float _898 = fma(_884, _888, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _900 = _830 * _892;
    float _902 = _882 * _878;
    float _904 = _898 * _872;
    float _906 = fma(_902, _896, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _908 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[115].x, _904);
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _912 = fma(_906, _900, _908);
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _918 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[117].x, _912);
    float _920 = _910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _926 = _918 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _920;
    out.m_61.y = _922;
    out.m_61.z = _924;
    out.m_61.w = _926;
    bool _928 = !_870;
    float _944;
    if (!_928)
    {
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _932 = _174 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[11].z, _144);
        float _936 = _934 * _930;
        float _938 = floor(_936);
        float _940 = -_938;
        float _942 = _936 + _940;
        _944 = _942;
        _946 = true;
    }
    else
    {
        _944 = _156;
    }
    _946 = false;
    float _948 = _944;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _952 = _948 + _950;
    bool _954 = _948 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _956 = isnan(_948);
    bool _958 = _954 || _956;
    bool _960 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _962 = _958 || _960;
    float _964 = float(_962);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _966;
    bool _970 = _948 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _972 = isnan(_948);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = 1.0 / _968;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _984;
    bool _988 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _990;
    float _994 = _952 * _982;
    float _996 = -_964;
    float _998 = _996 + 1.0;
    float _1000 = fma(_986, _994, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1002 = fma(_992, _994, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1004;
    float _1008 = _980 * _998;
    float _1010 = -_980;
    float _1012 = _1010 + 1.0;
    float _1014 = fma(_1006, _994, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1016 = _1000 * _1008;
    float _1018 = _1014 * _1008;
    float _1020 = _1002 * _1008;
    float _1022 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1016);
    float _1024 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1018);
    float _1026 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1020);
    float _1028 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1022);
    float _1030 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1024);
    float _1032 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1026);
    bool _1034 = !_988;
    float _1050;
    if (!_1034)
    {
        float _1036 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1038 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _1042 = _1040 * _1036;
        float _1044 = floor(_1042);
        float _1046 = -_1044;
        float _1048 = _1042 + _1046;
        _1050 = _1048;
        _1052 = true;
    }
    else
    {
        _1050 = _156;
    }
    _1052 = false;
    float _1054 = _1050;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1060;
    bool _1064 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1066 = isnan(_1054);
    bool _1068 = _1064 || _1066;
    bool _1070 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1072 = _1068 || _1070;
    float _1074 = float(_1072);
    float _1076 = 1.0 / _1058;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1086 = -_1074;
    float _1088 = _1086 + 1.0;
    bool _1090 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1092 = isnan(_1054);
    bool _1094 = _1090 || _1092;
    bool _1096 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1098 = _1094 || _1096;
    float _1100 = float(_1098);
    float _1102 = 1.0 / _1080;
    bool _1104 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1106 = isnan(_1054);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    bool _1116 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1118 = _1114 * _1088;
    float _1120 = -_1114;
    float _1122 = _1120 + 1.0;
    float _1124 = _1062 * _1076;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1128 = _1054 + _1126;
    float _1130 = 1.0 / _1084;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1136 = _1100 * _1122;
    float _1138 = fma(_1124, _1128, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1144 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1146 = isnan(_1054);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1152 = _1148 || _1150;
    float _1154 = float(_1152);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1156;
    float _1160 = _1134 * _1102;
    float _1162 = 1.0 / _1142;
    float _1164 = _1138 * _1136;
    float _1166 = -_1154;
    float _1168 = _1166 + 1.0;
    float _1170 = -_1100;
    float _1172 = _1170 + 1.0;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1176 = _1174 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1178 = _1074 * _1168;
    bool _1180 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1182 = isnan(_1054);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = _1158 * _1130;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1196 = _1054 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1200 = _1054 + _1198;
    float _1202 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1164);
    float _1204 = -_1190;
    float _1206 = _1204 + 1.0;
    float _1208 = fma(_1160, _1196, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1210 = fma(_1192, _1200, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1214 = _1054 + _1212;
    float _1216 = _1176 * _1162;
    float _1218 = fma(_1208, _1118, _1202);
    float _1220 = _1154 * _1206;
    float _1222 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1224 = fma(_1216, _1214, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1226 = fma(_1210, _1178, _1218);
    float _1228 = _1028 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1230 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1232 = fma(_1224, _1220, _1226);
    float _1234 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1236 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1238 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1232);
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1242 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _1236;
    out.m_63.y = _1230;
    out.m_63.z = _1240;
    out.m_63.w = _1242;
    bool _1244 = !_1116;
    float _1260;
    if (!_1244)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1248 = _174 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _1252 = _1250 * _1246;
        float _1254 = floor(_1252);
        float _1256 = -_1254;
        float _1258 = _1252 + _1256;
        _1260 = _1258;
        _1262 = true;
    }
    else
    {
        _1260 = _156;
    }
    _1262 = false;
    float _1264 = _1260;
    float _1266 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1268 = int(_1266);
    float _1270 = in.m_53.y;
    float _1272 = _600 * _788;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1276 = _1274 != 0;
    float _1278 = in.m_53.z;
    float _1280 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1282 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1284 = int(_1282);
    float _1286 = in.m_65.w;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1290 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1292 = int(_1290);
    float _1294 = float(_1268);
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1300 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1296);
    float _1302 = 1.0 / _1294;
    float _1304 = float(uint(_1284));
    float _1306 = float(_1284);
    float _1308 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1310 = _1284 == 0;
    float _1312 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _1314 = _1284 + (-1);
    float _1316 = 1.0 / _1304;
    float _1318 = float(_1292);
    out.m_67.w = _1286;
    float _1320 = _144 * _1302;
    float _1322 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1324 = int(_1322);
    int _1326 = ~_1284;
    int _1328 = _1326 + 1;
    float _1330 = -_1308;
    float _1332 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1330);
    float _1334 = -_1312;
    float _1336 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1334);
    int _1338 = as_type<int>(_1316) + (-2);
    float _1340 = trunc(_1320);
    int _1342 = int(_1340);
    float _1344 = 1.0 / _1318;
    float _1346 = float(uint(_1324));
    int _1348 = ~_1324;
    int _1350 = _1348 + 1;
    float _1352 = float(uint(_1342));
    float _1354 = 1.0 / _1346;
    float _1356 = as_type<float>(_1338) * _1352;
    float _1358 = _144 * _1344;
    float _1360 = trunc(_1356);
    float _1362 = precise::max(_1360, 0.0);
    uint _1365 = uint(_1362);
    float _1367 = trunc(_1358);
    int _1369 = int(_1367);
    int _1371 = ~_1284;
    int _1373 = _1371 + 1;
    int _1375 = _1328 * int(_1365);
    int _1377 = _1375 + _1342;
    float _1379 = float(uint(_1377));
    float _1381 = float(uint(_1369));
    float _1383 = as_type<float>(_1338) * _1379;
    float _1385 = _1379;
    float _1387 = _1278;
    if (_1276)
    {
        _1385 = 1.0;
    }
    float _1389 = _1385;
    float _1391 = _1389;
    if (!_1276)
    {
        _1391 = 7.345489978790283203125;
    }
    float _1393 = _1391;
    float _1395 = trunc(_1383);
    float _1397 = precise::max(_1395, 0.0);
    uint _1399 = uint(_1397);
    float _1401 = _1393 * _174;
    int _1403 = as_type<int>(_1354) + (-2);
    float _1405 = floor(_1401);
    float _1407 = as_type<float>(_1403) * _1381;
    int _1409 = int(_1365) + int(_1399);
    float _1411 = trunc(_1407);
    float _1413 = precise::max(_1411, 0.0);
    uint _1415 = uint(_1413);
    float _1417 = float(_1342);
    int _1419 = _1373 * _1409;
    int _1421 = _1419 + _1342;
    int _1423 = ~_1324;
    int _1425 = _1423 + 1;
    bool _1427 = _1417 >= _1306;
    bool _1429 = isnan(_1417);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan(_1306);
    bool _1435 = _1431 || _1433;
    float _1437 = float(_1435);
    float _1439 = -_1405;
    float _1441 = _1401 + _1439;
    bool _1443 = uint(_1421) >= uint(_1284);
    bool _1445 = !_1443;
    int _1447 = _1445 ? 0 : (-1);
    float _1449 = trunc(_1437);
    int _1451 = int(_1449);
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1455 = _1453 != 0;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1459 = _1457 != 0;
    int _1461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1463 = _1461 != 0;
    int _1465 = ~_1409;
    int _1467 = _1465 + _1447;
    int _1469 = _1467 + 1;
    float _1471 = _1441 * _1306;
    int _1473 = _1425 * int(_1415);
    int _1475 = _1473 + _1369;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1479 = _1477 != 0;
    float _1481 = _156 * _1306;
    int _1483 = _1284 * _1469;
    int _1485 = _1483 + _1342;
    float _1487 = trunc(_1471);
    int _1489 = int(_1487);
    float _1491 = float(uint(_1475));
    bool _1493 = !_1479;
    int _1495 = _1493 ? 0 : 1;
    bool _1497 = !_1310;
    float _1499 = _1497 ? as_type<float>(_1485) : as_type<float>(0xffffffffu /* nan */);
    float _1501 = as_type<float>(_1403) * _1491;
    int _1503 = ~_1451;
    int _1505 = _1503 + 1;
    int _1507 = _1505 + 1;
    float _1509 = trunc(_1481);
    int _1511 = int(_1509);
    bool _1513 = !_1455;
    int _1515 = _1513 ? 0 : 1;
    int _1517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1519 = _1517 != 0;
    int _1521 = as_type<int>(_1499) * _1507;
    bool _1523 = !_1459;
    int _1525 = _1523 ? 0 : 1;
    int _1527 = abs(_1495);
    float _1529 = trunc(_1501);
    float _1531 = precise::max(_1529, 0.0);
    uint _1533 = uint(_1531);
    int _1535 = abs(_1525);
    int _1537 = _1451 * _1314;
    int _1539 = _1537 + _1521;
    int _1541 = abs(_1515);
    int _1543 = _1489 * _1527;
    int _1545 = _1543 + _1342;
    float _1547 = as_type<float>(_1507);
    float _1549 = _1499;
    if (_1519)
    {
        _1547 = _174;
    }
    float _1551 = _1547;
    float _1553 = _1551;
    if (_1519)
    {
        _1549 = 1.0;
    }
    float _1555 = _1549;
    int _1557 = _1539 * _1535;
    float _1559 = _1555;
    if (!_1519)
    {
        _1553 = _1270;
    }
    float _1561 = _1553;
    if (!_1519)
    {
        _1559 = 1.2345600128173828125;
    }
    float _1563 = _1559;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1567 = _1565 != 0;
    float _1569 = _1561 * _1563;
    bool _1571 = !_1463;
    int _1573 = _1571 ? 0 : 1;
    bool _1575 = !_1567;
    int _1577 = _1575 ? 0 : 1;
    int _1579 = _1511 * _1541;
    int _1581 = _1579 + _1557;
    int _1583 = abs(_1573);
    float _1585 = floor(_1569);
    int _1587 = int(_1415) + int(_1533);
    int _1589 = ~_1324;
    int _1591 = _1589 + 1;
    int _1593 = _1545 * _1583;
    int _1595 = _1593 + _1581;
    int _1597 = abs(_1577);
    float _1599 = float(_1324);
    int _1601 = _1591 * _1587;
    int _1603 = _1601 + _1369;
    float _1605 = float(_1369);
    int _1607 = ~_1284;
    int _1609 = _1607 + 1;
    bool _1611 = _1605 >= _1599;
    bool _1613 = isnan(_1605);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(_1599);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    int _1623 = _1489 * _1597;
    int _1625 = _1623 + _1595;
    bool _1627 = uint(_1603) >= uint(_1324);
    float _1629 = -_1585;
    float _1631 = _1569 + _1629;
    int _1633 = 0;
    int _1635 = _1587;
    if (_1519)
    {
        _1633 = 0;
    }
    int _1637 = _1633;
    float _1639 = trunc(_1621);
    int _1641 = int(_1639);
    float _1643 = float(uint(_1625));
    bool _1645 = !_1627;
    int _1647 = _1645 ? 0 : (-1);
    int _1649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1651 = _1649 != 0;
    int _1653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1655 = _1653 != 0;
    int _1657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1659 = _1657 != 0;
    int _1661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1663 = _1661 != 0;
    float _1665 = as_type<float>(_1338) * _1643;
    int _1667 = ~_1587;
    int _1669 = _1667 + _1647;
    int _1671 = _1669 + 1;
    bool _1673 = _1284 == 0;
    bool _1675 = !_1655;
    int _1677 = _1675 ? 0 : 1;
    int _1679 = _1324 * _1671;
    int _1681 = _1679 + _1369;
    bool _1683 = _1324 == 0;
    float _1685 = trunc(_1665);
    float _1687 = precise::max(_1685, 0.0);
    uint _1689 = uint(_1687);
    int _1691 = abs(_1677);
    int _1693 = ~_1641;
    int _1695 = _1693 + 1;
    int _1697 = _1695 + 1;
    bool _1699 = !_1683;
    int _1701 = _1699 ? _1681 : (-1);
    float _1703 = _1631 * _1599;
    float _1705 = _156 * _1599;
    bool _1707 = !_1651;
    int _1709 = _1707 ? 0 : 1;
    int _1711 = _1701 * _1697;
    int _1713 = _1324 + (-1);
    float _1715 = trunc(_1703);
    int _1717 = int(_1715);
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1721 = _1719 != 0;
    int _1723 = abs(_1709);
    int _1725 = _1641 * _1713;
    int _1727 = _1725 + _1711;
    bool _1729 = !_1659;
    int _1731 = _1729 ? 0 : 1;
    int _1733 = _1609 * int(_1689);
    int _1735 = _1733 + _1625;
    bool _1737 = !_1721;
    int _1739 = _1737 ? 0 : 1;
    float _1741 = trunc(_1705);
    int _1743 = int(_1741);
    bool _1745 = !_1663;
    int _1747 = _1745 ? 0 : 1;
    int _1749 = _1727 * _1691;
    float _1751 = float(uint(_1735));
    int _1753 = abs(_1739);
    int _1755 = abs(_1731);
    float _1757 = as_type<float>(_1338) * _1751;
    float _1759 = trunc(_1757);
    float _1761 = precise::max(_1759, 0.0);
    uint _1763 = uint(_1761);
    int _1765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1767 = _1765 != 0;
    int _1769 = _1717 * _1753;
    int _1771 = _1769 + _1369;
    int _1773 = abs(_1747);
    int _1775 = _1743 * _1723;
    int _1777 = _1775 + _1749;
    int _1779 = ~_1324;
    int _1781 = _1779 + 1;
    float _1783 = float(uint(_1771));
    int _1785 = _1771 * _1755;
    int _1787 = _1785 + _1777;
    int _1789 = _1637;
    int _1791 = as_type<int>(_1757);
    bool _1793 = _1721;
    float _1795 = as_type<float>(_1689);
    if (!_1519)
    {
        _1789 = 2;
    }
    int _1797 = _1789;
    int _1799 = _1717 * _1773;
    int _1801 = _1799 + _1787;
    if (_1767)
    {
        float _1803 = -_352;
        float _1805 = _1803 + 1.0;
        _1791 = as_type<int>(_1805);
    }
    int _1807 = _1791;
    if (_1767)
    {
        bool _1809 = _174 > 0.5;
        _1793 = _1809;
    }
    bool _1811 = _1793;
    float _1813 = as_type<float>(_1403) * _1783;
    int _1815 = int(_1689) + int(_1763);
    float _1817 = float(uint(_1801));
    float _1819 = trunc(_1813);
    float _1821 = precise::max(_1819, 0.0);
    uint _1823 = uint(_1821);
    if (!_1767)
    {
        _1795 = _352;
    }
    float _1825 = _1795;
    float _1827 = float(uint(_1545));
    float _1829 = as_type<float>(_1403) * _1817;
    float _1831 = _1825;
    if (_1767)
    {
        float _1833 = _1811 ? as_type<float>(_1807) : _352;
        _1831 = _1833;
    }
    float _1835 = _1831;
    float _1837 = in.m_53.w;
    int _1839 = ~_1284;
    int _1841 = _1839 + 1;
    float _1843 = as_type<float>(_1338) * _1827;
    float _1845 = trunc(_1829);
    float _1847 = precise::max(_1845, 0.0);
    uint _1849 = uint(_1847);
    int _1851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1853 = _1851 != 0;
    int _1855 = _1841 * _1815;
    int _1857 = _1855 + _1625;
    bool _1859 = _1270 > 0.5;
    float _1861 = trunc(_1843);
    float _1863 = precise::max(_1861, 0.0);
    uint _1865 = uint(_1863);
    bool _1867 = uint(_1857) >= uint(_1284);
    float _1869 = -_498;
    float _1871 = _1869 + 1.0;
    bool _1873 = !_1867;
    int _1875 = _1873 ? 0 : (-1);
    if (_1853)
    {
        float _1877 = -_352;
        float _1879 = _1877 + 1.0;
        _1635 = as_type<int>(_1879);
    }
    int _1881 = _1635;
    int _1883 = _1859 ? as_type<int>(_1871) : as_type<int>(_498);
    int _1885 = _1781 * int(_1849);
    int _1887 = _1885 + _1801;
    bool _1889 = _1278 > 0.5;
    int _1891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1893 = _1891 != 0;
    float _1895 = float(uint(_1887));
    int _1897 = ~_1284;
    int _1899 = _1897 + 1;
    float _1901 = _1893 ? as_type<float>(_1883) : _498;
    float _1903 = as_type<float>(_1403) * _1895;
    float _1905 = _1895;
    if (!_1853)
    {
        _1905 = _352;
    }
    float _1907 = _1905;
    float _1909 = _1907;
    if (_1853)
    {
        float _1911 = _1889 ? as_type<float>(_1881) : _352;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = trunc(_1903);
    float _1917 = precise::max(_1915, 0.0);
    uint _1919 = uint(_1917);
    bool _1921 = _1837 > 0.5;
    int _1923 = _1899 * int(_1865);
    int _1925 = _1923 + _1545;
    int _1927 = ~_1815;
    int _1929 = _1927 + _1875;
    int _1931 = _1929 + 1;
    int _1933 = _1350 * int(_1823);
    int _1935 = _1933 + _1771;
    int _1937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1939 = _1937 != 0;
    float _1941 = float(uint(_1925));
    int _1943 = _1284 * _1931;
    int _1945 = _1943 + _1625;
    int _1947 = _1921 ? as_type<int>(_1871) : as_type<int>(_498);
    float _1949 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1953 = _1951 != 0;
    float _1955 = as_type<float>(_1338) * _1941;
    bool _1957 = !_1673;
    int _1959 = _1957 ? _1945 : (-1);
    float _1961 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1963 = _1953 ? as_type<float>(_1947) : _498;
    float _1965 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1967 = _1959 & 3;
    bool _1969 = _1967 != 0;
    float _1971 = trunc(_1955);
    float _1973 = precise::max(_1971, 0.0);
    uint _1975 = uint(_1973);
    if (_1939)
    {
        float _1977 = _1889 ? _1871 : _498;
        _614 = _1977;
    }
    float _1979 = _614;
    float _1981 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1949);
    int _1983 = int(_1849) + int(_1919);
    int _1985 = ~_1324;
    int _1987 = _1985 + 1;
    float _1989 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1981);
    float _1991 = float(uint(_1935));
    bool _1993 = uint(_1967) > 1u;
    int _1995 = _1987 * _1983;
    int _1997 = _1995 + _1801;
    int _1999 = _1959 & 3;
    bool _2001 = _1999 != 0;
    float _2003 = as_type<float>(_1403) * _1991;
    float _2005 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1961);
    int _2007 = ~_1284;
    int _2009 = _2007 + 1;
    float _2011 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1965);
    int _2013 = _2001 ? 0 : 1;
    float _2015 = trunc(_2003);
    float _2017 = precise::max(_2015, 0.0);
    uint _2019 = uint(_2017);
    bool _2021 = uint(_1997) >= uint(_1324);
    float _2023 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2005);
    int _2025 = ~_2013;
    int _2027 = _2025 + 1;
    int _2029 = _2027 + 1;
    float _2031 = _1989 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2033 = !_2021;
    int _2035 = _2033 ? 0 : (-1);
    float _2037 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2011);
    bool _2039 = _1967 != 3;
    int _2041 = _2029;
    if (!_1993)
    {
        int _2043 = ~_2013;
        int _2045 = _2043 + 1;
        _2041 = _2045;
    }
    int _2047 = _2041;
    float _2049 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2051 = int(_1865) + int(_1975);
    float _2053 = _2023 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2055 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2057 = _2031 + _2055;
    bool _2059 = uint(_1967) >= 2u;
    float _2061 = _2049 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _2063 = ~_1983;
    int _2065 = _2063 + _2035;
    int _2067 = _2065 + 1;
    int _2069 = _2009 * _2051;
    int _2071 = _2069 + _1545;
    int _2073 = _2059 ? 0 : 1;
    float _2075 = _2057 * _2057;
    int _2077 = int(_1823) + int(_2019);
    int _2079 = _1324 * _2067;
    int _2081 = _2079 + _1801;
    int _2083 = ~_2073;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    float _2089 = _2037 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2091 = _2087;
    int _2093 = int(_1975);
    if (_2039)
    {
        int _2095 = ~_2073;
        int _2097 = _2095 + 1;
        _2091 = _2097;
    }
    int _2099 = _2091;
    float _2101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2103 = _2053 + _2101;
    bool _2105 = !_1683;
    int _2107 = _2105 ? _2081 : (-1);
    float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2111 = _2089 + _2109;
    if (_1519)
    {
        _2093 = 0;
    }
    int _2113 = _2093;
    float _2115 = fma(_2103, _2103, _2075);
    bool _2117 = uint(_2071) >= uint(_1284);
    float _2119 = -_2089;
    float _2121 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _2123 = _2113;
    if (!_1519)
    {
        _2123 = 1;
    }
    int _2125 = _2123;
    float _2127 = fma(_2111, _2111, _2115);
    int _2129 = _2107 & 3;
    bool _2131 = _2129 != 0;
    bool _2133 = !_2117;
    int _2135 = _2133 ? 0 : (-1);
    float _2137 = sqrt(_2127);
    int _2139 = _2107 & 3;
    bool _2141 = _2139 != 0;
    bool _2143 = uint(_2129) >= 2u;
    int _2145 = _2141 ? 0 : 1;
    bool _2147 = uint(_2129) > 1u;
    float _2149 = rsqrt(_2127);
    int _2151 = _2143 ? 0 : 1;
    bool _2153 = _2129 != 3;
    int _2155 = ~_1324;
    int _2157 = _2155 + 1;
    int _2159 = ~_2145;
    int _2161 = _2159 + 1;
    int _2163 = _2161 + 1;
    float _2165 = _2137 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2167 = ~_2151;
    int _2169 = _2167 + 1;
    int _2171 = _2169 + 1;
    int _2173 = _2157 * _2077;
    int _2175 = _2173 + _1771;
    bool _2177 = !_1969;
    int _2179 = _2177 ? 0 : 1;
    int _2181 = _2163;
    int _2183 = _2171;
    if (!_2147)
    {
        int _2185 = ~_2145;
        int _2187 = _2185 + 1;
        _2181 = _2187;
    }
    int _2189 = _2181;
    bool _2191 = uint(_2175) >= uint(_1324);
    if (_2153)
    {
        int _2193 = ~_2151;
        int _2195 = _2193 + 1;
        _2183 = _2195;
    }
    int _2197 = _2183;
    float _2199 = in.m_69.x;
    float _2201 = in.m_69.y;
    float _2203 = in.m_69.z;
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2207 = _2205 != 0;
    bool _2209 = !_2191;
    int _2211 = _2209 ? 0 : (-1);
    bool _2213 = _1270 > 0.5;
    bool _2215 = _2213 && _2207;
    float _2217 = precise::min(_2061, _2165);
    bool _2219 = _1797 != 2;
    int _2221 = ~_2051;
    int _2223 = _2221 + _2135;
    int _2225 = _2223 + 1;
    float _2227 = _2149 * _2217;
    int _2229 = abs(_2047);
    out.m_71.w = _2217;
    float _2231 = 0.0;
    if (!_2207)
    {
        _2231 = _352;
    }
    float _2233 = _2231;
    float _2235 = _2057 * _2227;
    float _2237 = _2111 * _2227;
    float _2239 = _2233;
    if (_2215)
    {
        float _2241 = -_352;
        float _2243 = _2241 + 1.0;
        _430 = _2243;
    }
    float _2245 = _430;
    bool _2247 = _2125 != 1;
    float _2249 = _2103 * _2227;
    float _2251 = -_2235;
    float _2253 = _2057 + _2251;
    float _2255 = -_2237;
    float _2257 = _2111 + _2255;
    if (_2207)
    {
        _2239 = _2245;
    }
    float _2259 = _2239;
    float _2261 = -_2249;
    float _2263 = _2103 + _2261;
    float _2265 = _2253 * _2253;
    float _2267 = in.m_73.x;
    float _2269 = in.m_73.y;
    float _2271 = in.m_73.z;
    bool _2273 = _2201 != 0.0;
    bool _2275 = isnan(_2201);
    bool _2277 = _2273 || _2275;
    bool _2279 = isnan(0.0);
    bool _2281 = _2277 || _2279;
    float _2283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2199);
    float _2285 = fma(_2263, _2263, _2265);
    float _2287 = in.m_75.x;
    float _2289 = in.m_75.y;
    float _2291 = in.m_75.z;
    float _2293 = in.m_75.w;
    bool _2295 = _2199 == 0.0;
    bool _2297 = !_2281;
    bool _2299 = _2295 && _2297;
    float _2301 = _610 * _790;
    float _2303 = fma(_2257, _2257, _2285);
    float _2305 = 0.0;
    if (!_2247)
    {
        _2305 = _1270;
    }
    float _2307 = _2305;
    int _2309 = _1284 * _2225;
    int _2311 = _2309 + _1545;
    bool _2313 = _2203 == 0.0;
    bool _2315 = _2313 && _2299;
    float _2317 = 0.0;
    float _2319 = _2307;
    if (_2219)
    {
        _2317 = _174;
    }
    float _2321 = _2317;
    float _2323 = sqrt(_2303);
    float _2325 = 0.0;
    float _2327 = _2321;
    if (!_2247)
    {
        _2325 = _2307;
    }
    float _2329 = _2325;
    float _2331 = _2329;
    if (!_2219)
    {
        _2327 = _1278;
    }
    float _2333 = _2327;
    float _2335 = 0.0;
    if (!_2247)
    {
        _2335 = _1278;
    }
    float _2337 = _2335;
    float _2339 = 0.0;
    float _2341 = _2337;
    if (_2219)
    {
        _2339 = _1270;
    }
    float _2343 = _2339;
    float _2345 = _2343;
    if (_2247)
    {
        _2331 = _174;
    }
    float _2347 = _2331;
    if (_2247)
    {
        _2319 = _174;
    }
    float _2349 = _2319;
    if (_2247)
    {
        _1387 = _1270;
    }
    float _2351 = _1387;
    float _2353 = _2347 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2355 = _2271 * _2289;
    float _2357 = _2267 * _2291;
    float _2359 = _2269 * _2287;
    float _2361 = _2355;
    float _2363 = _2293;
    if (_2247)
    {
        _2341 = _1270;
    }
    float _2365 = _2341;
    float _2367 = _2149 * _2323;
    if (!_2219)
    {
        _2345 = _174;
    }
    float _2369 = _2345;
    float _2371 = -_2357;
    float _2373 = fma(_2271, _2287, _2371);
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2377 = _2375 != 0;
    float _2379 = -_2359;
    float _2381 = fma(_2289, _2267, _2379);
    int _2383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2385 = _2383 != 0;
    float _2387 = -_2355;
    float _2389 = fma(_2291, _2269, _2387);
    if (_2315)
    {
        _2361 = _2269;
    }
    float _2391 = _2361;
    float _2393 = _1280 * _2367;
    float _2395 = _2391;
    if (!_2315)
    {
        float _2397 = fma(_2201, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2269);
        _2395 = _2397;
    }
    float _2399 = _2395;
    float _2401 = _2389 * _2293;
    float _2403 = _2373 * _2293;
    float _2405 = _2381 * _2293;
    float _2407 = _2301 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_2315)
    {
        _2363 = _2271;
    }
    float _2409 = _2363;
    float _2411 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2201);
    float _2413 = _2409;
    if (!_2315)
    {
        float _2415 = fma(_2203, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2271);
        _2413 = _2415;
    }
    float _2417 = _2413;
    float _2419 = _2393 * _2203;
    float _2421 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2423 = _2407 * _2367;
    float _2425 = 0.0;
    float _2427 = _2417;
    if (_2315)
    {
        _2425 = _2267;
    }
    float _2429 = _2425;
    float _2431 = _2429;
    if (!_2315)
    {
        float _2433 = fma(_2199, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2267);
        _2431 = _2433;
    }
    float _2435 = _2431;
    float _2437 = -_1288;
    float _2439 = fma(_2421, 2.0, _2437);
    float _2441 = _2423 * _2411;
    float _2443 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2445 = _2443 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2447 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2449 = 1.0 / _2445;
    float _2451 = -_2053;
    float _2453 = _2451 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2457 = fma(_2447, -2.0, _1298);
    float _2459 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2455);
    float _2461 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2463 = _2461 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2465 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2467 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2469 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2471 = _2469 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2473 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2465);
    float _2475 = -_2031;
    float _2477 = _2475 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2479 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2467);
    float _2481 = 1.0 / _2471;
    float _2483 = _2477 * _2477;
    float _2485 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2487 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2489 = fma(_2453, _2453, _2483);
    float _2491 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2493 = -_2485;
    float _2495 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2493);
    float _2497 = 1.0 / _2463;
    float _2499 = fma(_2121, _2121, _2489);
    float _2501 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2503 = _2501 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2505 = -_2487;
    float _2507 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2505);
    float _2509 = -_2491;
    float _2511 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2509);
    float _2513 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2479);
    float _2515 = rsqrt(_2499);
    float _2517 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2519 = _2517 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2521 = _2369 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2523 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2525 = _2523 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2527 = _2351 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2529 = _2049 * _2367;
    float _2531 = 1.0 / _2519;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2537;
    int _2541 = ~_2229;
    int _2543 = _2541 + 1;
    int _2545 = _2543 + 1;
    float _2547 = _2529 * _2283;
    int _2549 = abs(_2179);
    float _2551 = _2539 * _2497;
    bool _2553 = !_2131;
    int _2555 = _2553 ? 0 : 1;
    float _2557 = 1.0 / _2503;
    float _2559 = _2453 * _2515;
    float _2561 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2563 = _2477 * _2515;
    int _2565 = abs(_2555);
    float _2567 = -_2561;
    float _2569 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2567);
    bool _2571 = _1967 != 3;
    float _2573 = 1.0 / _2525;
    float _2575 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2577 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2575;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2581 = _2579 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2583 = ~_2077;
    int _2585 = _2583 + _2211;
    int _2587 = _2585 + 1;
    float _2589 = _2577 * _2449;
    float _2591 = _2581 * _2481;
    float _2593 = _2559 * _2559;
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2597 = _2595 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2599 = _2121 * _2515;
    float _2601 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2603 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2601;
    float _2605 = 1.0 / _2535;
    float _2607 = fma(_2599, _2599, _2593);
    float _2609 = _2603 * _2531;
    float _2611 = _2597 * _2557;
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2615 = _2613 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2619 = _1264 + _2617;
    float _2621 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2623 = _1264 + _2621;
    bool _2625 = !_2571;
    int _2627 = _2625 ? 0 : (-1);
    float _2629 = rsqrt(_2607);
    float _2631 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2633 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2631;
    float _2635 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2637 = _1264 + _2635;
    float _2639 = _2615 * _2573;
    float _2641 = fma(_2591, _2619, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2643 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2645 = _1264 + _2643;
    float _2647 = fma(_2589, _2637, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2649 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2651 = _1264 + _2649;
    float _2653 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2655 = _1264 + _2653;
    float _2657 = _2633 * _2605;
    float _2659 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2661 = fma(_2551, _2651, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2663 = fma(_2609, _2645, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2665 = fma(_2639, _2623, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2667 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2669 = fma(_2611, _2655, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2671 = _2599 * _2629;
    float _2673 = _2559 * _2629;
    float _2675 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2677 = -_2667;
    float _2679 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2677);
    float _2681 = -_2671;
    float _2683 = _2599 * _2681;
    float _2685 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2687 = -_2675;
    float _2689 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2687);
    float _2691 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2679);
    float _2693 = -_2683;
    float _2695 = fma(_2559, _2673, _2693);
    float _2697 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2699 = _2563 * _2673;
    float _2701 = -_2659;
    float _2703 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2701);
    float _2705 = _2695 * _2695;
    float _2707 = -_2685;
    float _2709 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2707);
    float _2711 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2689);
    float _2713 = _2691 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2715 = -_2697;
    float _2717 = fma(_2507, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2715);
    float _2719 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2721 = fma(_2699, _2699, _2705);
    float _2723 = -_2671;
    float _2725 = _2563 * _2723;
    float _2727 = -_2713;
    float _2729 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2727);
    float _2731 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2717);
    float _2733 = -_2719;
    float _2735 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2733);
    float _2737 = fma(_2725, _2725, _2721);
    float _2739 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2741 = fma(_2731, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2729);
    float _2743 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2735);
    bool _2745 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2747 = isnan(_1264);
    bool _2749 = _2745 || _2747;
    bool _2751 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2753 = _2749 || _2751;
    float _2755 = float(_2753);
    float _2757 = -_2739;
    float _2759 = fma(_2507, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2757);
    float _2761 = rsqrt(_2737);
    float _2763 = -_2743;
    float _2765 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2741);
    bool _2767 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2769 = isnan(_1264);
    bool _2771 = _2767 || _2769;
    bool _2773 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2775 = _2771 || _2773;
    float _2777 = float(_2775);
    float _2779 = -_2755;
    float _2781 = _2779 + 1.0;
    bool _2783 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2785 = isnan(_1264);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2791 = _2787 || _2789;
    float _2793 = float(_2791);
    float _2795 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2709);
    float _2797 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2703);
    float _2799 = _2777 * _2781;
    float _2801 = 1.0 / _2765;
    float _2803 = -_2777;
    float _2805 = _2803 + 1.0;
    bool _2807 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2809 = isnan(_1264);
    bool _2811 = _2807 || _2809;
    bool _2813 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2815 = _2811 || _2813;
    float _2817 = float(_2815);
    float _2819 = -_2793;
    float _2821 = _2819 + 1.0;
    float _2823 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2759);
    float _2825 = _2793 * _2805;
    bool _2827 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2829 = isnan(_1264);
    bool _2831 = _2827 || _2829;
    bool _2833 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2835 = _2831 || _2833;
    float _2837 = float(_2835);
    float _2839 = -_2817;
    float _2841 = _2839 + 1.0;
    float _2843 = _2695 * _2761;
    float _2845 = precise::clamp(_2843, 0.0, 1.0);
    bool _2847 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2849 = isnan(_1264);
    bool _2851 = _2847 || _2849;
    bool _2853 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2855 = _2851 || _2853;
    float _2857 = float(_2855);
    float _2859 = _2817 * _2821;
    float _2861 = _2837 * _2841;
    float _2863 = -_2837;
    float _2865 = _2863 + 1.0;
    float _2867 = -_2845;
    float _2869 = _2867 + 1.0;
    bool _2871 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2873 = isnan(_1264);
    bool _2875 = _2871 || _2873;
    bool _2877 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2879 = _2875 || _2877;
    float _2881 = float(_2879);
    float _2883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2885 = fma(_2795, _2801, -1.0);
    float _2887 = -_2857;
    float _2889 = _2887 + 1.0;
    float _2891 = _2857 * _2865;
    float _2893 = _2869 * _2801;
    float _2895 = fma(_2869, _2885, 1.0);
    bool _2897 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2899 = isnan(_1264);
    bool _2901 = _2897 || _2899;
    bool _2903 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2905 = _2901 || _2903;
    float _2907 = float(_2905);
    float _2909 = _2881 * _2889;
    float _2911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2913 = -_2881;
    float _2915 = _2913 + 1.0;
    float _2917 = _2797 * _2893;
    float _2919 = _2895 * _2895;
    float _2921 = _2823 * _2893;
    float _2923 = _2907 * _2915;
    float _2925 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2927 = _1264 + _2925;
    float _2929 = fma(_2917, _2917, _2919);
    float _2931 = -_2907;
    float _2933 = _2931 + 1.0;
    float _2935 = _2647 * _2923;
    float _2937 = fma(_2657, _2927, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2939 = fma(_2921, _2921, _2929);
    float _2941 = _2883 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2943 = fma(_2933, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2935);
    int _2945 = _1324 * _2587;
    int _2947 = _2945 + _1771;
    float _2949 = fma(_2941, _1979, -0.5);
    float _2951 = _2911 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2953 = rsqrt(_2939);
    float _2955 = fma(_2641, _2909, _2943);
    float _2957 = fma(_2951, _2259, -0.5);
    float _2959 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2961 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2963 = fma(_2661, _2891, _2955);
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2967 = -_2961;
    float _2969 = fma(_2959, 2.0, _2967);
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2973 = fma(_2669, _2861, _2963);
    float _2975 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2965);
    float _2977 = -_144;
    float _2979 = fma(_2977, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2969);
    float _2981 = fma(_2365, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2971);
    float _2983 = _2921 * _2953;
    float _2985 = _2895 * _2953;
    float _2987 = fma(_2513, _2957, _2979);
    int _2989 = _1959 >> 31;
    float _2991 = fma(_2663, _2859, _2973);
    float _2993 = _2917 * _2953;
    float _2995 = -_2983;
    float _2997 = _2559 * _2995;
    float _2999 = _2599 * _2985;
    int _3001 = _2989 & 3;
    float _3003 = fma(_2665, _2825, _2991);
    float _3005 = -_2993;
    float _3007 = -_2997;
    float _3009 = fma(_2599, _3005, _3007);
    float _3011 = -_2983;
    float _3013 = -_2999;
    float _3015 = fma(_2563, _3011, _3013);
    int _3017 = _2107 >> 31;
    float _3019 = -_2993;
    float _3021 = _2563 * _3019;
    int _3023 = _1959 + _3001;
    float _3025 = _3009 * _3009;
    int _3027 = _3017 & 3;
    float _3029 = -_3021;
    float _3031 = fma(_2559, _2985, _3029);
    int _3033 = _3023 >> 2;
    float _3035 = fma(_3015, _3015, _3025);
    int _3037 = _2107 + _3027;
    float _3039 = fma(_2937, _2799, _3003);
    int _3041 = _3033 << 4;
    int _3043 = _3041 + 368;
    float _3045 = fma(_3031, _3031, _3035);
    float _3047 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2473);
    uint _3049 = uint(int(uint(_3043) >> uint(2)));
    uint _3051 = uint(int(uint(int(_3049)) >> uint(2)));
    int _3053 = int(_3049) & 3;
    float _3055 = (*spvDescriptorSet0.vp_c9)._m0[int(_3051)][_3053];
    int _3057 = int(_3049) + 1;
    uint _3059 = uint(int(uint(_3057) >> uint(2)));
    int _3061 = _3057 & 3;
    float _3063 = (*spvDescriptorSet0.vp_c9)._m0[int(_3059)][_3061];
    int _3065 = _3037 >> 2;
    float _3067 = rsqrt(_3045);
    float _3069 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3071 = fma(_2755, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3039);
    int _3073 = _3065 << 4;
    int _3075 = _3073 + 512;
    float _3077 = -_3069;
    float _3079 = fma(_2353, 2.0, _3077);
    int _3081 = _3043 + 8;
    uint _3083 = uint(int(uint(_3081) >> uint(2)));
    uint _3085 = uint(int(uint(int(_3083)) >> uint(2)));
    int _3087 = int(_3083) & 3;
    float _3089 = (*spvDescriptorSet0.vp_c9)._m0[int(_3085)][_3087];
    int _3091 = int(_3083) + 1;
    uint _3093 = uint(int(uint(_3091) >> uint(2)));
    int _3095 = _3091 & 3;
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[int(_3093)][_3095];
    float _3099 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3101 = abs(_2197);
    float _3103 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _3105 = _2129 != 3;
    float _3107 = fma(_2527, -2.0, _3099);
    out.m_77.x = _3071;
    float _3109 = fma(_2521, -2.0, _3103);
    uint _3111 = uint(int(uint(_3075) >> uint(2)));
    uint _3113 = uint(int(uint(int(_3111)) >> uint(2)));
    int _3115 = int(_3111) & 3;
    float _3117 = (*spvDescriptorSet0.vp_c9)._m0[int(_3113)][_3115];
    int _3119 = int(_3111) + 1;
    uint _3121 = uint(int(uint(_3119) >> uint(2)));
    int _3123 = _3119 & 3;
    float _3125 = (*spvDescriptorSet0.vp_c9)._m0[int(_3121)][_3123];
    float _3127 = _3015 * _3067;
    float _3129 = _3031 * _3067;
    float _3131 = _3009 * _3067;
    float _3133 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3109);
    float _3135 = _2599 * _3127;
    float _3137 = _2563 * _3129;
    int _3139 = _3075 + 8;
    uint _3141 = uint(int(uint(_3139) >> uint(2)));
    uint _3143 = uint(int(uint(int(_3141)) >> uint(2)));
    int _3145 = int(_3141) & 3;
    float _3147 = (*spvDescriptorSet0.vp_c9)._m0[int(_3143)][_3145];
    int _3149 = int(_3141) + 1;
    uint _3151 = uint(int(uint(_3149) >> uint(2)));
    int _3153 = _3149 & 3;
    float _3155 = (*spvDescriptorSet0.vp_c9)._m0[int(_3151)][_3153];
    float _3157 = _2559 * _3131;
    float _3159 = -_3135;
    float _3161 = fma(_2559, _3129, _3159);
    float _3163 = -_3137;
    float _3165 = fma(_2599, _3131, _3163);
    int _3167 = abs(_2189);
    float _3169 = -_3157;
    float _3171 = fma(_2563, _3127, _3169);
    float _3173 = _3161 * _3161;
    float _3175 = -_3133;
    float _3177 = fma(_3047, _2949, _3175);
    int _3179 = ~_3167;
    int _3181 = _3179 + 1;
    int _3183 = _3181 + 1;
    float _3185 = fma(_3165, _3165, _3173);
    float _3187 = fma(_3171, _3171, _3185);
    float _3189 = rsqrt(_3187);
    int _3191 = _2545 * as_type<int>(_3063);
    float _3193 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3195 = int(_3193);
    int _3197 = ~_2549;
    int _3199 = _3197 + 1;
    int _3201 = _3199 + 1;
    int _3203 = _3201 * as_type<int>(_3055);
    int _3205 = _3203 + _3191;
    int _3207 = abs(_2099);
    float _3209 = _3171 * _3189;
    float _3211 = _3165 * _3189;
    int _3213 = ~_3207;
    int _3215 = _3213 + 1;
    int _3217 = _3215 + 1;
    int _3219 = _3183 * as_type<int>(_3125);
    int _3221 = ~_2565;
    int _3223 = _3221 + 1;
    int _3225 = _3223 + 1;
    float _3227 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3229 = int(_3227);
    int _3231 = abs(_2627);
    int _3233 = _3217 * as_type<int>(_3089);
    int _3235 = _3233 + _3205;
    bool _3237 = !_2385;
    int _3239 = _3237 ? 0 : 1;
    int _3241 = _3225 * as_type<int>(_3117);
    int _3243 = _3241 + _3219;
    int _3245 = ~_3231;
    int _3247 = _3245 + 1;
    int _3249 = _3247 + 1;
    float _3251 = _3161 * _3189;
    bool _3253 = !_2377;
    int _3255 = _3253 ? 0 : 1;
    float _3257 = _3209 * _2289;
    int _3259 = abs(_3239);
    float _3261 = _2559 * _3209;
    int _3263 = _3249 * as_type<int>(_3097);
    int _3265 = _3263 + _3235;
    float _3267 = float(uint(_3195));
    float _3269 = _2599 * _3251;
    int _3271 = abs(_3255);
    float _3273 = -_3261;
    float _3275 = fma(_2599, _3211, _3273);
    bool _3277 = !_3105;
    int _3279 = _3277 ? 0 : (-1);
    float _3281 = 1.0 / _3267;
    int _3283 = ~_3101;
    int _3285 = _3283 + 1;
    int _3287 = _3285 + 1;
    float _3289 = -_3269;
    float _3291 = fma(_2563, _3209, _3289);
    float _3293 = _3275 * _3275;
    int _3295 = ~_3195;
    int _3297 = _3295 + 1;
    float _3299 = _2403 * _3251;
    int _3301 = _3287 * as_type<int>(_3147);
    int _3303 = _3301 + _3243;
    float _3305 = float(uint(_3229));
    float _3307 = fma(_3291, _3291, _3293);
    int _3309 = abs(_3279);
    float _3311 = _2563 * _3211;
    float _3313 = 1.0 / _3305;
    int _3315 = ~_3229;
    int _3317 = _3315 + 1;
    float _3319 = _2403 * _3209;
    float _3321 = -_3311;
    float _3323 = fma(_2559, _3251, _3321);
    int _3325 = ~_3271;
    int _3327 = _3325 + 1;
    int _3329 = _3327 + 1;
    int _3331 = ~_3309;
    int _3333 = _3331 + 1;
    int _3335 = _3333 + 1;
    float _3337 = fma(_3323, _3323, _3307);
    int _3339 = abs(_3195);
    int _3341 = _3265 * _3329;
    int _3343 = ~_3259;
    int _3345 = _3343 + 1;
    int _3347 = _3345 + 1;
    int _3349 = _3335 * as_type<int>(_3155);
    int _3351 = _3349 + _3303;
    bool _3353 = !_1673;
    int _3355 = _3353 ? _2311 : (-1);
    float _3357 = rsqrt(_3337);
    int _3359 = _3351 * _3347;
    bool _3361 = !_1683;
    int _3363 = _3361 ? _2947 : (-1);
    int _3365 = _3355 * _3271;
    int _3367 = _3365 + _3341;
    int _3369 = abs(_3229);
    float _3371 = _2441 * _3209;
    int _3373 = as_type<int>(_3281) + (-2);
    int _3375 = _3363 * _3259;
    int _3377 = _3375 + _3359;
    float _3379 = float(uint(_3369));
    float _3381 = _2441 * _3211;
    float _3383 = float(uint(_3339));
    float _3385 = _3209 * _2399;
    float _3387 = 1.0 / _3379;
    int _3389 = as_type<int>(_3313) + (-2);
    float _3391 = _3323 * _3357;
    float _3393 = float(uint(_3367));
    float _3395 = _3291 * _3357;
    int _3397 = abs(_3367);
    float _3399 = fma(_2547, _3391, _3371);
    float _3401 = 1.0 / _3383;
    float _3403 = as_type<float>(_3373) * _3393;
    float _3405 = float(uint(_3377));
    float _3407 = fma(_2599, _2419, _3399);
    float _3409 = fma(_2547, _3395, _3381);
    int _3411 = ~_3369;
    int _3413 = _3411 + 1;
    float _3415 = as_type<float>(_3389) * _3405;
    float _3417 = trunc(_3403);
    float _3419 = precise::max(_3417, 0.0);
    uint _3421 = uint(_3419);
    int _3423 = as_type<int>(_3387) + (-2);
    float _3425 = fma(_2559, _2419, _3409);
    float _3427 = _2089 + _3407;
    float _3429 = fma(_3391, _2287, _3257);
    float _3431 = _2053 + _3425;
    float _3433 = float(uint(_3397));
    float _3435 = trunc(_3415);
    float _3437 = precise::max(_3435, 0.0);
    uint _3439 = uint(_3437);
    int _3441 = as_type<int>(_3401) + (-2);
    float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3445 = _3427 + _3443;
    int _3447 = abs(_3377);
    float _3449 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3451 = _3431 + _3449;
    float _3453 = as_type<float>(_3441) * _3433;
    float _3455 = _3445 * _3445;
    int _3457 = _3297 * int(_3421);
    int _3459 = _3457 + _3367;
    float _3461 = _3177 + 0.5;
    float _3463 = fma(_3451, _3451, _3455);
    float _3465 = trunc(_3453);
    float _3467 = precise::max(_3465, 0.0);
    uint _3469 = uint(_3467);
    float _3471 = float(uint(_3459));
    float _3473 = _2987 + 0.5;
    int _3475 = ~_3339;
    int _3477 = _3475 + 1;
    int _3479 = _3317 * int(_3439);
    int _3481 = _3479 + _3377;
    float _3483 = float(uint(_3447));
    float _3485 = as_type<float>(_3373) * _3471;
    out.m_79.x = _3473;
    out.m_79.y = _3461;
    float _3487 = sqrt(_3463);
    float _3489 = float(uint(_3481));
    float _3491 = as_type<float>(_3423) * _3483;
    float _3493 = _3251 * _2289;
    float _3495 = as_type<float>(_3389) * _3489;
    float _3497 = _3211 * _2289;
    float _3499 = trunc(_3491);
    float _3501 = precise::max(_3499, 0.0);
    uint _3503 = uint(_3501);
    int _3505 = _3477 * int(_3469);
    int _3507 = _3505 + _3397;
    float _3509 = _2403 * _3211;
    float _3511 = _3251 * _2399;
    float _3513 = _2441 * _3251;
    float _3515 = fma(_3395, _2287, _3497);
    float _3517 = float(uint(_3507));
    float _3519 = _3275 * _3357;
    float _3521 = trunc(_3485);
    float _3523 = precise::max(_3521, 0.0);
    uint _3525 = uint(_3523);
    float _3527 = _3211 * _2399;
    bool _3529 = _3487 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3531 = as_type<float>(_3441) * _3517;
    float _3533 = fma(_2547, _3519, _3513);
    int _3535 = ~_3195;
    int _3537 = _3535 + 1;
    float _3539 = fma(_3519, _2287, _3493);
    float _3541 = fma(_2401, _3395, _3509);
    int _3543 = _3413 * int(_3503);
    int _3545 = _3543 + _3447;
    float _3547 = trunc(_3495);
    float _3549 = precise::max(_3547, 0.0);
    uint _3551 = uint(_3549);
    float _3553 = fma(_2563, _2419, _3533);
    int _3555 = ~_3229;
    int _3557 = _3555 + 1;
    float _3559 = fma(_2401, _3519, _3299);
    float _3561 = float(uint(_3545));
    float _3563 = fma(_2401, _3391, _3319);
    float _3565 = fma(_3519, _2435, _3511);
    int _3567 = int(_3421) + int(_3525);
    float _3569 = trunc(_3531);
    float _3571 = precise::max(_3569, 0.0);
    uint _3573 = uint(_3571);
    float _3575 = as_type<float>(_3423) * _3561;
    float _3577 = fma(_3391, _2435, _3385);
    float _3579 = fma(_2559, _2291, _3515);
    int _3581 = _3537 * _3567;
    int _3583 = _3581 + _3367;
    float _3585 = fma(_2563, _2291, _3539);
    float _3587 = fma(_3395, _2435, _3527);
    float _3589 = fma(_2599, _2291, _3429);
    float _3591 = trunc(_3575);
    float _3593 = precise::max(_3591, 0.0);
    uint _3595 = uint(_3593);
    int _3597 = int(_3439) + int(_3551);
    float _3599 = _2031 + _3553;
    bool _3601 = uint(_3583) >= uint(_3195);
    int _3603 = ~_3339;
    int _3605 = _3603 + 1;
    int _3607 = _3557 * _3597;
    int _3609 = _3607 + _3377;
    int _3611 = ~_3369;
    int _3613 = _3611 + 1;
    int _3615 = int(_3469) + int(_3573);
    float _3617 = as_type<float>(_3583);
    float _3619 = _3553;
    float _3621 = _3511;
    float _3623 = _3579;
    float _3625 = _3585;
    if (!_3529)
    {
        _3617 = _3431;
    }
    float _3627 = _3617;
    float _3629 = _3627;
    if (!_3529)
    {
        _3619 = _3427;
    }
    float _3631 = _3619;
    float _3633 = _3631;
    if (!_3529)
    {
        _3621 = _3599;
    }
    float _3635 = _3621;
    int _3637 = int(_3503) + int(_3595);
    bool _3639 = !_3529;
    float _3641 = _3635;
    if (!_3639)
    {
        float _3643 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3647 = _3487 + _3645;
        float _3649 = _3599 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3651 = rsqrt(_3463);
        float _3653 = _3647 * _3643;
        float _3655 = _3653 * 0.15915493667125701904296875;
        float _3657 = _3655 * 6.283185482025146484375;
        float _3659 = cos(_3657);
        float _3661 = _3655 * 6.283185482025146484375;
        float _3663 = sin(_3661);
        float _3665 = _3659 + (-1.0);
        float _3667 = fma(_3663, _3649, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3669 = _3665 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3671 = _3651 * _3667;
        float _3673 = fma(_3599, _3659, _3669);
        float _3675 = fma(_3451, _3671, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3677 = fma(_3445, _3671, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3629 = _3675;
        _3641 = _3673;
        _3633 = _3677;
    }
    float _3679 = _3629;
    float _3681 = _3641;
    float _3683 = _3633;
    bool _3685 = !_3601;
    int _3687 = _3685 ? 0 : (-1);
    float _3689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3691 = _3605 * _3615;
    int _3693 = _3691 + _3397;
    bool _3695 = uint(_3609) >= uint(_3229);
    int _3697 = _3613 * _3637;
    int _3699 = _3697 + _3447;
    int _3701 = ~_3567;
    int _3703 = _3701 + _3687;
    int _3705 = _3703 + 1;
    float _3707 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2457);
    bool _3709 = uint(_3693) >= uint(_3339);
    float _3711 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3107);
    bool _3713 = !_3695;
    int _3715 = _3713 ? 0 : (-1);
    int _3717 = _3195 * _3705;
    int _3719 = _3717 + _3367;
    bool _3721 = _3195 == 0;
    float _3723 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2459);
    bool _3725 = _3195 == 0;
    float _3727 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2981);
    int _3729 = _3367 ^ _3195;
    out.m_81.x = _2529;
    int _3731 = ~_3597;
    int _3733 = _3731 + _3715;
    int _3735 = _3733 + 1;
    float _3737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3739 = !_3721;
    int _3741 = _3739 ? _3719 : (-1);
    bool _3743 = uint(_3699) >= uint(_3369);
    int _3745 = _3229 * _3735;
    int _3747 = _3745 + _3377;
    int _3749 = _3377 ^ _3229;
    float _3751 = _3689 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3753 = _3229 == 0;
    float _3755 = fma(_2599, _2417, _3577);
    bool _3757 = _3229 == 0;
    float _3759 = -_144;
    float _3761 = fma(_3759, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2439);
    float _3763 = float(_3741);
    float _3765 = fma(_3751, _1835, -0.5);
    bool _3767 = !_3743;
    int _3769 = _3767 ? 0 : (-1);
    float _3771 = -_2249;
    float _3773 = _2053 + _3771;
    bool _3775 = !_3709;
    int _3777 = _3775 ? 0 : (-1);
    float _3779 = fma(_3751, _3763, _3761);
    uint _3781 = uint(int(uint(_3729) >> uint(31)));
    float _3783 = _3737 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3785 = ~_3769;
    int _3787 = _3637 + _3785;
    int _3789 = _3787 + 1;
    float _3791 = -_144;
    float _3793 = fma(_3791, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3079);
    bool _3795 = !_3753;
    int _3797 = _3795 ? _3747 : (-1);
    float _3799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _3801 = uint(int(uint(_3749) >> uint(31)));
    float _3803 = fma(_3783, _1913, -0.5);
    int _3805 = ~_3777;
    int _3807 = _3615 + _3805;
    int _3809 = _3807 + 1;
    float _3811 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1300);
    int _3813 = ~int(_3781);
    int _3815 = _3813 + 1;
    float _3817 = fma(_2559, _2417, _3587);
    float _3819 = float(_3797);
    float _3821 = fma(_3811, _3765, _3779);
    int _3823 = ~int(_3801);
    int _3825 = _3823 + 1;
    out.m_83.x = _3579;
    out.m_83.y = _3585;
    out.m_83.z = _3589;
    int _3827 = _3809 ^ _3815;
    float _3829 = fma(_3783, _3819, _3793);
    int _3831 = _3789 ^ _3825;
    float _3833 = -_2237;
    float _3835 = _2089 + _3833;
    int _3837 = ~_3815;
    int _3839 = _3837 + _3827;
    int _3841 = _3839 + 1;
    float _3843 = _3799 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3845 = ~_3825;
    int _3847 = _3845 + _3831;
    int _3849 = _3847 + 1;
    float _3851 = _2405 * _2559;
    float _3853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3855 = !_3725;
    int _3857 = _3855 ? _3841 : (-1);
    float _3859 = fma(_1901, _3843, -0.5);
    float _3861 = _2405 * _2563;
    float _3863 = _2405 * _2599;
    float _3865 = float(_3857);
    float _3867 = _3851 + _3541;
    bool _3869 = !_3757;
    int _3871 = _3869 ? _3849 : (-1);
    float _3873 = _3861 + _3559;
    float _3875 = -_2053;
    float _3877 = _3875 + _3679;
    float _3879 = -_3707;
    float _3881 = fma(_3843, _3865, _3879);
    float _3883 = -_2031;
    float _3885 = _3883 + _3681;
    float _3887 = _3863 + _3563;
    float _3889 = float(_3871);
    float _3891 = -_2089;
    float _3893 = _3891 + _3683;
    float _3895 = _3885 * _3885;
    float _3897 = _3853 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3899 = fma(_3723, _3859, _3881);
    float _3901 = fma(_2563, _2417, _3565);
    float _3903 = fma(_3877, _3877, _3895);
    float _3905 = fma(_1963, _3897, -0.5);
    float _3907 = -_3711;
    float _3909 = fma(_3897, _3889, _3907);
    float _3911 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2975);
    float _3913 = fma(_3893, _3893, _3903);
    float _3915 = _3821 + 0.5;
    float _3917 = _3899 + 0.5;
    float _3919 = fma(_3911, _3803, _3829);
    float _3921 = fma(_3727, _3905, _3909);
    float _3923 = sqrt(_3913);
    out.m_85.x = _3867;
    out.m_85.y = _3873;
    out.m_85.z = _3887;
    float _3925 = _3919 + 0.5;
    float _3927 = _3921 + 0.5;
    float _3929 = -_2249;
    float _3931 = _3929 + _3679;
    out.m_87.x = _3817;
    out.m_87.y = _3901;
    out.m_87.z = _3755;
    float _3933 = -_2235;
    float _3935 = _3933 + _3681;
    float _3937 = -_2235;
    float _3939 = _2031 + _3937;
    out.m_89.x = _3915;
    out.m_89.y = _3917;
    out.m_89.z = _3925;
    out.m_89.w = _3927;
    bool _3941 = _3923 > 0.0;
    float _3943 = -_2237;
    float _3945 = _3943 + _3683;
    float _3947 = _3873;
    float _3949 = _3867;
    float _3951 = _3885;
    if (!_3941)
    {
        _2427 = _3931;
    }
    float _3953 = _2427;
    float _3955 = _3953;
    float _3957 = _3953;
    if (!_3941)
    {
        _3623 = _3935;
    }
    float _3959 = _3623;
    float _3961 = _3959;
    float _3963 = _3959;
    if (!_3941)
    {
        _3625 = _3945;
    }
    float _3965 = _3625;
    bool _3967 = !_3941;
    float _3969 = _3965;
    float _3971 = _3965;
    if (!_3967)
    {
        bool _3973 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3975 = _3589;
        if (_3973)
        {
            float _3977 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3975 = _3977;
        }
        float _3979 = _3975;
        float _3981 = _3979;
        if (_3973)
        {
            float _3983 = _602 * _3979;
            _3947 = _3983;
        }
        float _3985 = _3947;
        float _3987 = _3985;
        if (_3973)
        {
            float _3989 = _604 * _3979;
            _3949 = _3989;
        }
        float _3991 = _3949;
        float _3993 = _3991;
        if (_3973)
        {
            float _3995 = _606 * _3979;
            _3981 = _3995;
        }
        float _3997 = _3981;
        float _3999 = _3997;
        if (!_3973)
        {
            bool _4001 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4003 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4005 = _4001 || _4003;
            bool _4007 = isnan(1.0);
            bool _4009 = _4005 || _4007;
            float _4011 = _144 + 1.0;
            if (!_4009)
            {
                float _4013 = _4011 * _4011;
                float _4015 = _4013 * 0.5;
                _166 = _4015;
            }
            float _4017 = _166;
            float _4019 = _4017;
            if (!_4009)
            {
                float _4021 = _4017 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4019 = _4021;
            }
            float _4023 = _4019;
            bool _4025 = !_4009;
            float _4027 = _4023;
            if (!_4025)
            {
                float _4029 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4031 = log2(_4029);
                float _4033 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4035 = _4033 + 1.0;
                float _4037 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4039 = _4031 * _4011;
                float _4041 = 1.0 / _4035;
                float _4043 = _4037 * 0.693147182464599609375;
                float _4045 = exp2(_4039);
                float _4047 = 1.0 / _4043;
                float _4049 = _4045 + (-1.0);
                float _4051 = -_4049;
                float _4053 = fma(_4051, _4047, _4011);
                float _4055 = _4053 * _4041;
                float _4057 = _4055 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4027 = _4057;
            }
            float _4059 = _4027;
            float _4061 = _4059 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _4063 = _4059 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4065 = _4059 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4067 = _4059;
            if (!_4009)
            {
                _4067 = _4011;
            }
            float _4069 = _4067;
            float _4071 = _4061 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _4073 = _4061 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _4075 = _4061 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _4077 = fma(_4063, (*spvDescriptorSet0.vp_c10)._m0[8].y, _4071);
            float _4079 = fma(_4063, (*spvDescriptorSet0.vp_c10)._m0[8].x, _4073);
            float _4081 = fma(_4065, (*spvDescriptorSet0.vp_c10)._m0[10].y, _4077);
            bool _4083 = !_4009;
            float _4085 = _4069;
            if (!_4083)
            {
                float _4087 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4089 = log2(_4087);
                float _4091 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4093 = _4091 + 1.0;
                float _4095 = 1.0 / _4093;
                float _4097 = _4089 * _4011;
                float _4099 = exp2(_4097);
                float _4101 = -_4099;
                float _4103 = _4101 + 1.0;
                float _4105 = _4103 * _4095;
                _4085 = _4105;
                _202 = _4095;
            }
            float _4107 = _4085;
            float _4109 = _202;
            float _4111 = fma(_4063, (*spvDescriptorSet0.vp_c10)._m0[8].z, _4075);
            float _4113 = fma(_4107, _314, _4081);
            float _4115 = fma(_4065, (*spvDescriptorSet0.vp_c10)._m0[10].x, _4079);
            float _4117 = fma(_4065, (*spvDescriptorSet0.vp_c10)._m0[10].z, _4111);
            float _4119 = -_540;
            float _4121 = _4119 + _4113;
            float _4123 = fma(_4107, _312, _4115);
            float _4125 = fma(_4107, _316, _4117);
            float _4127 = _4121 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4129 = _4121 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4131 = -_544;
            float _4133 = _4131 + _4123;
            float _4135 = _4121 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4137 = -_546;
            float _4139 = _4137 + _4125;
            float _4141 = fma(_4133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4127);
            float _4143 = fma(_4133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4129);
            float _4145 = fma(_4133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4135);
            float _4147 = fma(_4139, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4141);
            float _4149 = fma(_4139, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4143);
            float _4151 = fma(_4139, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4145);
            _616 = _4149;
            _618 = _4147;
            _620 = _4151;
            _3987 = _4147;
            _3993 = _4149;
            _3999 = _4151;
            _3955 = _4117;
            _3961 = _4145;
            _3969 = _4115;
            _390 = _4143;
            _204 = _4109;
        }
        float _4153 = _616;
        float _4155 = _618;
        float _4157 = _620;
        float _4159 = _3987;
        float _4161 = _3993;
        float _4163 = _3999;
        float _4165 = _3955;
        float _4167 = _3961;
        float _4169 = _3969;
        float _4171 = _390;
        float _4173 = _204;
        float _4175 = _4153 * _4153;
        float _4177 = rsqrt(_3913);
        float _4179 = fma(_4155, _4155, _4175);
        float _4181 = fma(_4157, _4157, _4179);
        float _4183 = sqrt(_4181);
        float _4185 = _3877 * _4177;
        float _4187 = _3885 * _4177;
        float _4189 = _3893 * _4177;
        bool _4191 = _4183 > 0.0;
        float _4193 = _4165;
        float _4195 = _4167;
        float _4197 = _4169;
        _392 = _4171;
        _3951 = _4187;
        _622 = _4153;
        _206 = _4173;
        if (!_4191)
        {
            _4193 = _3931;
        }
        float _4199 = _4193;
        _3957 = _4199;
        if (!_4191)
        {
            _4195 = _3935;
        }
        float _4201 = _4195;
        _3963 = _4201;
        if (!_4191)
        {
            _4197 = _3945;
        }
        float _4203 = _4197;
        bool _4205 = !_4191;
        _3971 = _4203;
        if (!_4205)
        {
            float _4207 = rsqrt(_4181);
            float _4209 = _4207 * _4153;
            float _4211 = _4207 * _4155;
            float _4213 = _4207 * _4157;
            float _4215 = _4187 * _4209;
            float _4217 = fma(_4185, _4211, _4215);
            float _4219 = fma(_4189, _4213, _4217);
            float _4221 = _4219 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4223 = fma(_4159, _4221, _3931);
            float _4225 = fma(_4161, _4221, _3935);
            float _4227 = fma(_4163, _4221, _3945);
            _3957 = _4223;
            _3963 = _4225;
            _3971 = _4227;
            _392 = _4215;
        }
    }
    float _4229 = _3957;
    float _4231 = _3963;
    float _4233 = _3971;
    float _4235 = _392;
    float _4237 = _3951;
    float _4239 = _622;
    float _4241 = _206;
    float _4243 = _3939 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4245 = fma(_3773, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4243);
    float _4247 = _3939 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4249 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4251 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4253 = _4249 || _4251;
    bool _4255 = isnan(0.5);
    bool _4257 = _4253 || _4255;
    float _4259 = fma(_3835, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4245);
    float _4261 = fma(_3773, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4247);
    float _4263 = _4259 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4265 = fma(_3835, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4261);
    bool _4267 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4269 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4271 = _4267 || _4269;
    bool _4273 = isnan(0.5);
    bool _4275 = _4271 || _4273;
    float _4277 = 1.0 / _4263;
    float _4279 = _4265 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4281 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4283 = _4279;
    float _4285 = _4235;
    float _4287 = _4259;
    float _4289 = _4237;
    float _4291 = _4239;
    float _4293 = _4241;
    if (_4257)
    {
        _4281 = _4229;
    }
    float _4295 = _4281;
    float _4297 = _4279 + _4263;
    float _4299 = _4295;
    if (_4257)
    {
        _4283 = _4231;
    }
    float _4301 = _4283;
    float _4303 = _4301;
    if (_4257)
    {
        _4285 = _4233;
    }
    float _4305 = _4285;
    float _4307 = _4305;
    if (!_4257)
    {
        float _4309 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4311 = _3939 + _4309;
        float _4313 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4315 = _3773 + _4313;
        float _4317 = -_3773;
        float _4319 = _4317 + _4229;
        float _4321 = -_3939;
        float _4323 = _4321 + _4231;
        float _4325 = _4311 * _4311;
        float _4327 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4329 = _3835 + _4327;
        float _4331 = -_3835;
        float _4333 = _4331 + _4233;
        float _4335 = fma(_4315, _4315, _4325);
        float _4337 = fma(_4329, _4329, _4335);
        float _4339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4341 = sqrt(_4337);
        float _4343 = precise::min(_4341, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4345 = _4343 * _4339;
        float _4347 = fma(_4319, _4345, _3773);
        float _4349 = fma(_4323, _4345, _3939);
        float _4351 = fma(_4333, _4345, _3835);
        _4303 = _4349;
        _4299 = _4347;
        _4307 = _4351;
        _4287 = _4341;
    }
    float _4353 = _4303;
    float _4355 = _4299;
    float _4357 = _4307;
    float _4359 = _4287;
    float _4361 = _4359;
    if (_4275)
    {
        _4361 = 1.0;
    }
    float _4363 = _4361;
    float _4365 = _4297 * _4277;
    float _4367 = _4365 * 0.5;
    float _4369 = _4363;
    float _4371 = _4367;
    if (!_4275)
    {
        float _4373 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4375 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4377 = fma(_4367, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4375);
        float _4379 = _4373 * 0.15915493667125701904296875;
        float _4381 = _4379 * 6.283185482025146484375;
        float _4383 = cos(_4381);
        float _4385 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4387 = _4385 * 0.15915493667125701904296875;
        float _4389 = _4379 * 6.283185482025146484375;
        float _4391 = sin(_4389);
        float _4393 = 1.0 / _4383;
        float _4395 = _4387 * 6.283185482025146484375;
        float _4397 = cos(_4395);
        float _4399 = _4391 * _4393;
        float _4401 = 1.0 / _4377;
        float _4403 = _4397 * _4399;
        float _4405 = _4387 * 6.283185482025146484375;
        float _4407 = sin(_4405);
        float _4409 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4411 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4409;
        float _4413 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4415 = _4401 * _4413;
        float _4417 = 1.0 / _4403;
        float _4419 = 1.0 / _4411;
        float _4421 = _4407 * _4417;
        float _4423 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4425 = fma(_4421, _4415, _4423);
        float _4427 = _4425 * _4419;
        float _4429 = precise::clamp(_4427, 0.0, 1.0);
        _4369 = _4429;
    }
    float _4431 = _4369;
    float _4433 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4435 = _4353 + _4433;
    float _4437 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4439 = _4355 + _4437;
    float _4441 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4443 = _4357 + _4441;
    float _4445 = _4435 * _4435;
    float _4447 = fma(_4439, _4439, _4445);
    float _4449 = fma(_4443, _4443, _4447);
    float _4451 = rsqrt(_4449);
    float _4453 = sqrt(_4449);
    float _4455 = _4451 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4457 = _4439 * _4455;
    float _4459 = _4443 * _4455;
    float _4461 = _4457 * _4457;
    float _4463 = _4459 * _4459;
    float _4465 = _4461 + _4463;
    float _4467 = sqrt(_4465);
    bool _4469 = _4467 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4471 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4473 = _4467 + _4471;
    float _4475 = _4451;
    float _4477 = _4465;
    float _4479 = _4473;
    float _4481 = _4435;
    if (_4469)
    {
        float _4483 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4475 = _4483;
    }
    float _4485 = _4475;
    if (_4469)
    {
        float _4487 = rsqrt(_4465);
        _4477 = _4487;
    }
    float _4489 = _4477;
    if (_4469)
    {
        float _4491 = _4473 * _4485;
        _4479 = _4491;
    }
    float _4493 = _4479;
    if (_4469)
    {
        float _4495 = _4493 * 0.15915493667125701904296875;
        _4289 = _4495;
    }
    float _4497 = _4289;
    float _4499 = _4443;
    if (_4469)
    {
        float _4501 = _4497 * 6.283185482025146484375;
        float _4503 = sin(_4501);
        _4499 = _4503;
    }
    float _4505 = _4499;
    float _4507 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4509 = precise::max(0.0, _4507);
    float _4511 = _4485;
    float _4513 = _4509;
    if (_4469)
    {
        float _4515 = _4497 * 6.283185482025146484375;
        float _4517 = cos(_4515);
        _4511 = _4517;
    }
    float _4519 = _4511;
    float _4521 = -_4455;
    float _4523 = -_4509;
    float _4525 = fma(_4435, _4521, _4523);
    if (_4469)
    {
        float _4527 = _4525 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4481 = _4527;
    }
    float _4529 = _4481;
    float _4531 = _4505;
    float _4533 = _4529;
    if (_4469)
    {
        float _4535 = fma(_4505, _4529, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4371 = _4535;
    }
    float _4537 = _4371;
    float _4539 = _4537;
    if (!_4469)
    {
        _4531 = _4457;
    }
    float _4541 = _4531;
    float _4543 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4545 = fma(_4453, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4543);
    float _4547 = precise::clamp(_4545, 0.0, 1.0);
    float _4549 = _4541;
    if (!_4469)
    {
        _4533 = _4525;
    }
    float _4551 = _4533;
    float _4553 = _4551;
    float _4555 = _4519;
    if (_4469)
    {
        float _4557 = _4519 + (-1.0);
        _4513 = _4557;
    }
    float _4559 = _4513;
    float _4561 = _4559;
    if (_4469)
    {
        float _4563 = _4489 * _4537;
        _4291 = _4563;
    }
    float _4565 = _4291;
    if (!_4469)
    {
        _4539 = _4461;
    }
    float _4567 = _4539;
    float _4569 = _4353 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4571 = _4567;
    if (_4469)
    {
        float _4573 = _4559 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4293 = _4573;
    }
    float _4575 = _4293;
    if (_4469)
    {
        float _4577 = _4457 * _4565;
        _4549 = _4577;
    }
    float _4579 = _4549;
    if (!_4469)
    {
        _4561 = _4459;
    }
    float _4581 = _4561;
    float _4583 = _4581;
    if (_4469)
    {
        float _4585 = _4459 * _4565;
        _4583 = _4585;
    }
    float _4587 = _4583;
    if (_4469)
    {
        float _4589 = fma(_4525, _4519, _4575);
        _4553 = _4589;
    }
    float _4591 = _4553;
    if (_4469)
    {
        float _4593 = _4579 * _4579;
        _4571 = _4593;
    }
    float _4595 = _4571;
    if (!_4469)
    {
        _4555 = _4463;
    }
    float _4597 = _4555;
    float _4599 = _4597;
    if (_4469)
    {
        float _4601 = _4587 * _4587;
        _4599 = _4601;
    }
    float _4603 = _4599;
    float _4605 = -_4547;
    float _4607 = _4605 + 1.0;
    float _4609 = fma(_4591, _4591, _4595);
    float _4611 = _4353 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4613 = _4609 + _4603;
    float _4615 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4569);
    float _4617 = _4353 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4619 = abs(_4607);
    float _4621 = log2(_4619);
    float _4623 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4625 = fma(_4357, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4615);
    float _4627 = _4353 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4629 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4617);
    float _4631 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4611);
    float _4633 = _4625 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4635 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4627);
    float _4637 = rsqrt(_4613);
    float _4639 = fma(_4357, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4629);
    float _4641 = fma(_4357, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4631);
    float _4643 = fma(_4357, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4635);
    float _4645 = _4639 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4647 = _4641 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4649 = _4643 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4651 = _4621 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4653 = _4633 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4655 = -_4653;
    float _4657 = fma(_4655, _4623, 1.0);
    float _4659 = _4645 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4661 = exp2(_4651);
    float _4663 = _4637 * _4579;
    float _4665 = _4637 * _4591;
    float _4667 = fma(_4649, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4659);
    float _4669 = _4637 * _4587;
    float _4671 = _4663 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4673 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4667);
    float _4675 = log2(_4657);
    float _4677 = -_4671;
    float _4679 = fma(_4665, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4677);
    float _4681 = _4645 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4683 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4673);
    float _4685 = -_4669;
    float _4687 = fma(_4685, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4679);
    float _4689 = _4645 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4691 = fma(_4649, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4681);
    float _4693 = 1.0 / _4683;
    float _4695 = fma(_4687, -0.5, 0.5);
    float _4697 = fma(_4649, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4689);
    float _4699 = fma(_4687, 0.5, 0.5);
    float _4701 = _4665 + 1.0;
    float _4703 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4691);
    float _4705 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4697);
    float _4707 = fma(_4699, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4709 = sqrt(_4695);
    float _4711 = -_4665;
    float _4713 = fma(_4661, _4701, _4711);
    float _4715 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4705);
    float _4717 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4703);
    float _4719 = fma(_4699, _4707, -0.212114393711090087890625);
    float _4721 = _4675 * 0.693147182464599609375;
    float _4723 = fma(_4713, 0.5, 0.5);
    float _4725 = _4715 * _4693;
    float _4727 = _4717 * _4693;
    float _4729 = fma(_4699, _4719, 1.570728778839111328125);
    float _4731 = _4721 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4733 = fma(_4725, 0.5, 0.5);
    float _4735 = fma(_4727, -0.5, 0.5);
    float _4737 = _4709 * 0.636619746685028076171875;
    float3 _12191 = float3(_4733, _4735, _4731);
    float _4739 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12191, float3(0.0), isnan(_12191)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12191, float3(0.0), isnan(_12191)), level(0.0)).x;
    float3 _12202 = float3(_4733, _4735, _4731);
    float4 _4742 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12202, float3(0.0), isnan(_12202)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12202, float3(0.0), isnan(_12202)), level(0.0)).xyzw;
    float _4744 = _4742.x;
    float _4746 = _4742.y;
    float _4748 = _4742.z;
    float _4750 = _4742.w;
    float _4752 = -_4729;
    float _4754 = fma(_4737, _4752, 1.0);
    float2 _12224 = float2(_4754, _4723);
    float3 _4758 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12224, float2(0.0), isnan(_12224)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12224, float2(0.0), isnan(_12224)), level(0.0)).xyz;
    float _4760 = _4758.x;
    float _4762 = _4758.y;
    float _4764 = _4758.z;
    float _4766 = _4621 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4768 = _4645 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_91.x = _3773;
    out.m_91.y = _3939;
    out.m_91.z = _3835;
    bool _4770 = _4453 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4772 = isnan(_4453);
    bool _4774 = _4770 || _4772;
    bool _4776 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4778 = _4774 || _4776;
    float _4780 = fma(_4649, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4768);
    float _4782 = exp2(_4766);
    float _4784 = _4715 + _4683;
    out.m_93.x = _4355;
    out.m_93.y = _4353;
    out.m_93.z = _4357;
    float _4786 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4780);
    float _4788 = _4683 * 0.5;
    float _4790 = _4784 * 0.5;
    float _4792 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4786);
    float _4794 = fma(_4717, -0.5, _4788);
    float _4796 = _4792 + _4683;
    out.gl_Position.x = _4715;
    out.gl_Position.y = _4717;
    out.gl_Position.z = _4792;
    out.gl_Position.w = _4683;
    float _4798 = _4796 * 0.5;
    float _4800 = -_4782;
    float _4802 = _4800 + 1.0;
    float _4804 = _4802 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_95.x = _4790;
    out.m_95.y = _4794;
    out.m_95.z = _4798;
    out.m_95.w = _4683;
    float _4806 = -_4804;
    float _4808 = _4806 + 1.0;
    float _4810 = _4792;
    float _4812 = _4717;
    float _4814 = _4715;
    if (!_4778)
    {
        _4810 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4816 = _4810;
    float _4818 = _4816;
    float _4820 = _4816;
    if (!_4778)
    {
        _4812 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4822 = _4812;
    float _4824 = _4822;
    float _4826 = _4822;
    if (!_4778)
    {
        _4814 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4828 = _4814;
    float _4830 = _4804 * _4739;
    float _4832 = _4750 * _4808;
    float _4834 = _4431 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4836 = _4750 * _4830;
    float _4838 = _4764 * _4830;
    float _4840 = fma(_4760, _4836, _4744);
    float _4842 = fma(_4762, _4836, _4746);
    float _4844 = fma(_4750, _4838, _4748);
    out.m_97.x = _4840;
    out.m_97.y = _4842;
    out.m_97.z = _4844;
    out.m_97.w = _4832;
    bool _4846 = !_4778;
    float _4848 = _4828;
    float _4850 = _4828;
    if (!_4846)
    {
        bool _4852 = _4453 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4854 = isnan(_4453);
        bool _4856 = _4852 || _4854;
        bool _4858 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4860 = _4856 || _4858;
        if (!_4860)
        {
            float _4862 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4864 = _4453 + _4862;
            float _4866 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4868 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4866;
            float _4870 = 1.0 / _4868;
            float _4872 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4874 = _4872 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4876 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4878 = _4876 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4880 = _4864 * _4870;
            float _4882 = precise::clamp(_4880, 0.0, 1.0);
            float _4884 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4886 = _4884 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4888 = fma(_4882, _4878, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4890 = fma(_4882, _4886, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4892 = fma(_4882, _4874, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4826 = _4892;
            _4820 = _4890;
            _4850 = _4888;
            _4894 = true;
        }
        else
        {
            bool _4896 = _4453 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4898 = isnan(_4453);
            bool _4900 = _4896 || _4898;
            bool _4902 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4904 = _4900 || _4902;
            if (!_4904)
            {
                _4818 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4906 = _4818;
            _4820 = _4906;
            if (!_4904)
            {
                _4824 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4908 = _4824;
            _4826 = _4908;
            if (!_4904)
            {
                _4848 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4910 = _4848;
            bool _4912 = !_4904;
            _4850 = _4910;
            if (!_4912)
            {
                bool _4914 = _4453 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4916 = isnan(_4453);
                bool _4918 = _4914 || _4916;
                bool _4920 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4922 = _4918 || _4920;
                if (!_4922)
                {
                    float _4924 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4926 = _4453 + _4924;
                    float _4928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4930 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4928;
                    float _4932 = 1.0 / _4930;
                    float _4934 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4936 = _4934 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4938 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4940 = _4938 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4942 = _4926 * _4932;
                    float _4944 = precise::clamp(_4942, 0.0, 1.0);
                    float _4946 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4948 = _4946 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4950 = fma(_4944, _4940, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4952 = fma(_4944, _4948, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4954 = fma(_4944, _4936, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4826 = _4954;
                    _4820 = _4952;
                    _4850 = _4950;
                    _4894 = true;
                }
                else
                {
                    _4826 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4820 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4850 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4894 = false;
    float _4956 = _4826;
    float _4958 = _4820;
    float _4960 = _4850;
    float _4962 = _4834 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_99.x = 0.0;
    float _4964 = _4956 * 0.586610972881317138671875;
    bool _4966 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _4962;
    float _4968 = fma(_4958, 0.298911988735198974609375, _4964);
    bool _4970 = _4431 > 0.0;
    bool _4972 = isnan(_4431);
    bool _4974 = _4970 || _4972;
    bool _4976 = isnan(0.0);
    bool _4978 = _4974 || _4976;
    float _4980 = fma(_4960, 0.114477999508380889892578125, _4968);
    float _4982 = -_4980;
    float _4984 = _4982 + _4958;
    float _4986 = -_4980;
    float _4988 = _4986 + _4956;
    float _4990 = -_4980;
    float _4992 = _4990 + _4960;
    float _4994 = fma(_4984, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4980);
    float _4996 = fma(_4988, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4980);
    float _4998 = fma(_4992, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4980);
    bool _5000 = !_4966;
    if (!_5000)
    {
        float _5002 = -_4353;
        float _5004 = _5002 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5006 = -_4355;
        float _5008 = _5006 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5010 = -_4357;
        float _5012 = _5010 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5014 = _5004 * _5004;
        float _5016 = fma(_5008, _5008, _5014);
        float _5018 = fma(_5012, _5012, _5016);
        float _5020 = sqrt(_5018);
        float _5022 = rsqrt(_5018);
        float _5024 = -_5020;
        float _5026 = _5024 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5028 = _5026 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5030 = precise::clamp(_5028, 0.0, 1.0);
        float _5032 = _5008 * _5022;
        float _5034 = _5004 * _5022;
        float _5036 = abs(_5030);
        float _5038 = log2(_5036);
        float _5040 = _5012 * _5022;
        float _5042 = _5032 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5044 = _3901 * _5034;
        float _5046 = -_5034;
        float _5048 = -_5042;
        float _5050 = fma(_5046, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5048);
        float _5052 = fma(_3817, _5032, _5044);
        float _5054 = -_5040;
        float _5056 = fma(_5054, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5050);
        float _5058 = fma(_3755, _5040, _5052);
        float _5060 = precise::clamp(_5058, 0.0, 1.0);
        float _5062 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5064 = _5056 + _5062;
        float _5066 = _5038 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5068 = _5064 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5070 = precise::clamp(_5068, 0.0, 1.0);
        float _5072 = exp2(_5066);
        float _5074 = _5072 * _5070;
        float _5076 = _5060 * _5074;
        float _5078 = _5076 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5080 = _5076 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5082 = _5076 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _5078;
        out.m_99.y = _5080;
        out.m_99.z = _5082;
    }
    out.m_71.x = _4994;
    out.m_71.y = _4996;
    out.m_71.z = _4998;
    if (_4978)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _5084 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5084;
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
    bool _4894 = false;
    bool _1262 = false;
    bool _1052 = false;
    bool _946 = false;
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
        float _5140 = as_type<float>(_132);
        out.gl_Position.z = _5140;
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
        float _5212 = as_type<float>(_172);
        out.gl_Position.z = _5212;
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
    bool _820 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _822 = isnan(_814);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _836 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _838 = isnan(_814);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = 1.0 / _818;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _850;
    float _854 = -_830;
    float _856 = _854 + 1.0;
    bool _858 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _860 = isnan(_814);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    bool _870 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _872 = _846 * _856;
    float _874 = -_846;
    float _876 = _874 + 1.0;
    float _878 = 1.0 / _834;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _884 = _852 * _848;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _888 = _814 + _886;
    float _890 = -_868;
    float _892 = _890 + 1.0;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _896 = _814 + _894;
    float _898 = fma(_884, _888, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _900 = _830 * _892;
    float _902 = _882 * _878;
    float _904 = _898 * _872;
    float _906 = fma(_902, _896, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _908 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[115].x, _904);
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _912 = fma(_906, _900, _908);
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _918 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[117].x, _912);
    float _920 = _910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _926 = _918 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _920;
    out.m_61.y = _922;
    out.m_61.z = _924;
    out.m_61.w = _926;
    bool _928 = !_870;
    float _944;
    if (!_928)
    {
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _932 = _174 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[11].z, _144);
        float _936 = _934 * _930;
        float _938 = floor(_936);
        float _940 = -_938;
        float _942 = _936 + _940;
        _944 = _942;
        _946 = true;
    }
    else
    {
        _944 = _156;
    }
    _946 = false;
    float _948 = _944;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _952 = _948 + _950;
    bool _954 = _948 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _956 = isnan(_948);
    bool _958 = _954 || _956;
    bool _960 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _962 = _958 || _960;
    float _964 = float(_962);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _966;
    bool _970 = _948 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _972 = isnan(_948);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = 1.0 / _968;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _984;
    bool _988 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _990;
    float _994 = _952 * _982;
    float _996 = -_964;
    float _998 = _996 + 1.0;
    float _1000 = fma(_986, _994, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1002 = fma(_992, _994, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1004;
    float _1008 = _980 * _998;
    float _1010 = -_980;
    float _1012 = _1010 + 1.0;
    float _1014 = fma(_1006, _994, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1016 = _1000 * _1008;
    float _1018 = _1014 * _1008;
    float _1020 = _1002 * _1008;
    float _1022 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1016);
    float _1024 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1018);
    float _1026 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1020);
    float _1028 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1022);
    float _1030 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1024);
    float _1032 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1026);
    bool _1034 = !_988;
    float _1050;
    if (!_1034)
    {
        float _1036 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1038 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _1042 = _1040 * _1036;
        float _1044 = floor(_1042);
        float _1046 = -_1044;
        float _1048 = _1042 + _1046;
        _1050 = _1048;
        _1052 = true;
    }
    else
    {
        _1050 = _156;
    }
    _1052 = false;
    float _1054 = _1050;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1060;
    bool _1064 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1066 = isnan(_1054);
    bool _1068 = _1064 || _1066;
    bool _1070 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1072 = _1068 || _1070;
    float _1074 = float(_1072);
    float _1076 = 1.0 / _1058;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1086 = -_1074;
    float _1088 = _1086 + 1.0;
    bool _1090 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1092 = isnan(_1054);
    bool _1094 = _1090 || _1092;
    bool _1096 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1098 = _1094 || _1096;
    float _1100 = float(_1098);
    float _1102 = 1.0 / _1080;
    bool _1104 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1106 = isnan(_1054);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    bool _1116 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1118 = _1114 * _1088;
    float _1120 = -_1114;
    float _1122 = _1120 + 1.0;
    float _1124 = _1062 * _1076;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1128 = _1054 + _1126;
    float _1130 = 1.0 / _1084;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1136 = _1100 * _1122;
    float _1138 = fma(_1124, _1128, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1144 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1146 = isnan(_1054);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1152 = _1148 || _1150;
    float _1154 = float(_1152);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1156;
    float _1160 = _1134 * _1102;
    float _1162 = 1.0 / _1142;
    float _1164 = _1138 * _1136;
    float _1166 = -_1154;
    float _1168 = _1166 + 1.0;
    float _1170 = -_1100;
    float _1172 = _1170 + 1.0;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1176 = _1174 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1178 = _1074 * _1168;
    bool _1180 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1182 = isnan(_1054);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = _1158 * _1130;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1196 = _1054 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1200 = _1054 + _1198;
    float _1202 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1164);
    float _1204 = -_1190;
    float _1206 = _1204 + 1.0;
    float _1208 = fma(_1160, _1196, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1210 = fma(_1192, _1200, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1214 = _1054 + _1212;
    float _1216 = _1176 * _1162;
    float _1218 = fma(_1208, _1118, _1202);
    float _1220 = _1154 * _1206;
    float _1222 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1224 = fma(_1216, _1214, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1226 = fma(_1210, _1178, _1218);
    float _1228 = _1028 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1230 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1232 = fma(_1224, _1220, _1226);
    float _1234 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1236 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1238 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1232);
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1242 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _1236;
    out.m_63.y = _1230;
    out.m_63.z = _1240;
    out.m_63.w = _1242;
    bool _1244 = !_1116;
    float _1260;
    if (!_1244)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1248 = _174 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _1252 = _1250 * _1246;
        float _1254 = floor(_1252);
        float _1256 = -_1254;
        float _1258 = _1252 + _1256;
        _1260 = _1258;
        _1262 = true;
    }
    else
    {
        _1260 = _156;
    }
    _1262 = false;
    float _1264 = _1260;
    float _1266 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1268 = int(_1266);
    float _1270 = in.m_53.y;
    float _1272 = _600 * _788;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1276 = _1274 != 0;
    float _1278 = in.m_53.z;
    float _1280 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1282 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1284 = int(_1282);
    float _1286 = in.m_65.w;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1290 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1292 = int(_1290);
    float _1294 = float(_1268);
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1300 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1296);
    float _1302 = 1.0 / _1294;
    float _1304 = float(uint(_1284));
    float _1306 = float(_1284);
    float _1308 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1310 = _1284 == 0;
    float _1312 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _1314 = _1284 + (-1);
    float _1316 = 1.0 / _1304;
    float _1318 = float(_1292);
    out.m_67.w = _1286;
    float _1320 = _144 * _1302;
    float _1322 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1324 = int(_1322);
    int _1326 = ~_1284;
    int _1328 = _1326 + 1;
    float _1330 = -_1308;
    float _1332 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1330);
    float _1334 = -_1312;
    float _1336 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1334);
    int _1338 = as_type<int>(_1316) + (-2);
    float _1340 = trunc(_1320);
    int _1342 = int(_1340);
    float _1344 = 1.0 / _1318;
    float _1346 = float(uint(_1324));
    int _1348 = ~_1324;
    int _1350 = _1348 + 1;
    float _1352 = float(uint(_1342));
    float _1354 = 1.0 / _1346;
    float _1356 = as_type<float>(_1338) * _1352;
    float _1358 = _144 * _1344;
    float _1360 = trunc(_1356);
    float _1362 = precise::max(_1360, 0.0);
    uint _1365 = uint(_1362);
    float _1367 = trunc(_1358);
    int _1369 = int(_1367);
    int _1371 = ~_1284;
    int _1373 = _1371 + 1;
    int _1375 = _1328 * int(_1365);
    int _1377 = _1375 + _1342;
    float _1379 = float(uint(_1377));
    float _1381 = float(uint(_1369));
    float _1383 = as_type<float>(_1338) * _1379;
    float _1385 = _1379;
    float _1387 = _1278;
    if (_1276)
    {
        _1385 = 1.0;
    }
    float _1389 = _1385;
    float _1391 = _1389;
    if (!_1276)
    {
        _1391 = 7.345489978790283203125;
    }
    float _1393 = _1391;
    float _1395 = trunc(_1383);
    float _1397 = precise::max(_1395, 0.0);
    uint _1399 = uint(_1397);
    float _1401 = _1393 * _174;
    int _1403 = as_type<int>(_1354) + (-2);
    float _1405 = floor(_1401);
    float _1407 = as_type<float>(_1403) * _1381;
    int _1409 = int(_1365) + int(_1399);
    float _1411 = trunc(_1407);
    float _1413 = precise::max(_1411, 0.0);
    uint _1415 = uint(_1413);
    float _1417 = float(_1342);
    int _1419 = _1373 * _1409;
    int _1421 = _1419 + _1342;
    int _1423 = ~_1324;
    int _1425 = _1423 + 1;
    bool _1427 = _1417 >= _1306;
    bool _1429 = isnan(_1417);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan(_1306);
    bool _1435 = _1431 || _1433;
    float _1437 = float(_1435);
    float _1439 = -_1405;
    float _1441 = _1401 + _1439;
    bool _1443 = uint(_1421) >= uint(_1284);
    bool _1445 = !_1443;
    int _1447 = _1445 ? 0 : (-1);
    float _1449 = trunc(_1437);
    int _1451 = int(_1449);
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1455 = _1453 != 0;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1459 = _1457 != 0;
    int _1461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1463 = _1461 != 0;
    int _1465 = ~_1409;
    int _1467 = _1465 + _1447;
    int _1469 = _1467 + 1;
    float _1471 = _1441 * _1306;
    int _1473 = _1425 * int(_1415);
    int _1475 = _1473 + _1369;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1479 = _1477 != 0;
    float _1481 = _156 * _1306;
    int _1483 = _1284 * _1469;
    int _1485 = _1483 + _1342;
    float _1487 = trunc(_1471);
    int _1489 = int(_1487);
    float _1491 = float(uint(_1475));
    bool _1493 = !_1479;
    int _1495 = _1493 ? 0 : 1;
    bool _1497 = !_1310;
    float _1499 = _1497 ? as_type<float>(_1485) : as_type<float>(0xffffffffu /* nan */);
    float _1501 = as_type<float>(_1403) * _1491;
    int _1503 = ~_1451;
    int _1505 = _1503 + 1;
    int _1507 = _1505 + 1;
    float _1509 = trunc(_1481);
    int _1511 = int(_1509);
    bool _1513 = !_1455;
    int _1515 = _1513 ? 0 : 1;
    int _1517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1519 = _1517 != 0;
    int _1521 = as_type<int>(_1499) * _1507;
    bool _1523 = !_1459;
    int _1525 = _1523 ? 0 : 1;
    int _1527 = abs(_1495);
    float _1529 = trunc(_1501);
    float _1531 = precise::max(_1529, 0.0);
    uint _1533 = uint(_1531);
    int _1535 = abs(_1525);
    int _1537 = _1451 * _1314;
    int _1539 = _1537 + _1521;
    int _1541 = abs(_1515);
    int _1543 = _1489 * _1527;
    int _1545 = _1543 + _1342;
    float _1547 = as_type<float>(_1507);
    float _1549 = _1499;
    if (_1519)
    {
        _1547 = _174;
    }
    float _1551 = _1547;
    float _1553 = _1551;
    if (_1519)
    {
        _1549 = 1.0;
    }
    float _1555 = _1549;
    int _1557 = _1539 * _1535;
    float _1559 = _1555;
    if (!_1519)
    {
        _1553 = _1270;
    }
    float _1561 = _1553;
    if (!_1519)
    {
        _1559 = 1.2345600128173828125;
    }
    float _1563 = _1559;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1567 = _1565 != 0;
    float _1569 = _1561 * _1563;
    bool _1571 = !_1463;
    int _1573 = _1571 ? 0 : 1;
    bool _1575 = !_1567;
    int _1577 = _1575 ? 0 : 1;
    int _1579 = _1511 * _1541;
    int _1581 = _1579 + _1557;
    int _1583 = abs(_1573);
    float _1585 = floor(_1569);
    int _1587 = int(_1415) + int(_1533);
    int _1589 = ~_1324;
    int _1591 = _1589 + 1;
    int _1593 = _1545 * _1583;
    int _1595 = _1593 + _1581;
    int _1597 = abs(_1577);
    float _1599 = float(_1324);
    int _1601 = _1591 * _1587;
    int _1603 = _1601 + _1369;
    float _1605 = float(_1369);
    int _1607 = ~_1284;
    int _1609 = _1607 + 1;
    bool _1611 = _1605 >= _1599;
    bool _1613 = isnan(_1605);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(_1599);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    int _1623 = _1489 * _1597;
    int _1625 = _1623 + _1595;
    bool _1627 = uint(_1603) >= uint(_1324);
    float _1629 = -_1585;
    float _1631 = _1569 + _1629;
    int _1633 = 0;
    int _1635 = _1587;
    if (_1519)
    {
        _1633 = 0;
    }
    int _1637 = _1633;
    float _1639 = trunc(_1621);
    int _1641 = int(_1639);
    float _1643 = float(uint(_1625));
    bool _1645 = !_1627;
    int _1647 = _1645 ? 0 : (-1);
    int _1649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1651 = _1649 != 0;
    int _1653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1655 = _1653 != 0;
    int _1657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1659 = _1657 != 0;
    int _1661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1663 = _1661 != 0;
    float _1665 = as_type<float>(_1338) * _1643;
    int _1667 = ~_1587;
    int _1669 = _1667 + _1647;
    int _1671 = _1669 + 1;
    bool _1673 = _1284 == 0;
    bool _1675 = !_1655;
    int _1677 = _1675 ? 0 : 1;
    int _1679 = _1324 * _1671;
    int _1681 = _1679 + _1369;
    bool _1683 = _1324 == 0;
    float _1685 = trunc(_1665);
    float _1687 = precise::max(_1685, 0.0);
    uint _1689 = uint(_1687);
    int _1691 = abs(_1677);
    int _1693 = ~_1641;
    int _1695 = _1693 + 1;
    int _1697 = _1695 + 1;
    bool _1699 = !_1683;
    int _1701 = _1699 ? _1681 : (-1);
    float _1703 = _1631 * _1599;
    float _1705 = _156 * _1599;
    bool _1707 = !_1651;
    int _1709 = _1707 ? 0 : 1;
    int _1711 = _1701 * _1697;
    int _1713 = _1324 + (-1);
    float _1715 = trunc(_1703);
    int _1717 = int(_1715);
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1721 = _1719 != 0;
    int _1723 = abs(_1709);
    int _1725 = _1641 * _1713;
    int _1727 = _1725 + _1711;
    bool _1729 = !_1659;
    int _1731 = _1729 ? 0 : 1;
    int _1733 = _1609 * int(_1689);
    int _1735 = _1733 + _1625;
    bool _1737 = !_1721;
    int _1739 = _1737 ? 0 : 1;
    float _1741 = trunc(_1705);
    int _1743 = int(_1741);
    bool _1745 = !_1663;
    int _1747 = _1745 ? 0 : 1;
    int _1749 = _1727 * _1691;
    float _1751 = float(uint(_1735));
    int _1753 = abs(_1739);
    int _1755 = abs(_1731);
    float _1757 = as_type<float>(_1338) * _1751;
    float _1759 = trunc(_1757);
    float _1761 = precise::max(_1759, 0.0);
    uint _1763 = uint(_1761);
    int _1765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1767 = _1765 != 0;
    int _1769 = _1717 * _1753;
    int _1771 = _1769 + _1369;
    int _1773 = abs(_1747);
    int _1775 = _1743 * _1723;
    int _1777 = _1775 + _1749;
    int _1779 = ~_1324;
    int _1781 = _1779 + 1;
    float _1783 = float(uint(_1771));
    int _1785 = _1771 * _1755;
    int _1787 = _1785 + _1777;
    int _1789 = _1637;
    int _1791 = as_type<int>(_1757);
    bool _1793 = _1721;
    float _1795 = as_type<float>(_1689);
    if (!_1519)
    {
        _1789 = 2;
    }
    int _1797 = _1789;
    int _1799 = _1717 * _1773;
    int _1801 = _1799 + _1787;
    if (_1767)
    {
        float _1803 = -_352;
        float _1805 = _1803 + 1.0;
        _1791 = as_type<int>(_1805);
    }
    int _1807 = _1791;
    if (_1767)
    {
        bool _1809 = _174 > 0.5;
        _1793 = _1809;
    }
    bool _1811 = _1793;
    float _1813 = as_type<float>(_1403) * _1783;
    int _1815 = int(_1689) + int(_1763);
    float _1817 = float(uint(_1801));
    float _1819 = trunc(_1813);
    float _1821 = precise::max(_1819, 0.0);
    uint _1823 = uint(_1821);
    if (!_1767)
    {
        _1795 = _352;
    }
    float _1825 = _1795;
    float _1827 = float(uint(_1545));
    float _1829 = as_type<float>(_1403) * _1817;
    float _1831 = _1825;
    if (_1767)
    {
        float _1833 = _1811 ? as_type<float>(_1807) : _352;
        _1831 = _1833;
    }
    float _1835 = _1831;
    float _1837 = in.m_53.w;
    int _1839 = ~_1284;
    int _1841 = _1839 + 1;
    float _1843 = as_type<float>(_1338) * _1827;
    float _1845 = trunc(_1829);
    float _1847 = precise::max(_1845, 0.0);
    uint _1849 = uint(_1847);
    int _1851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1853 = _1851 != 0;
    int _1855 = _1841 * _1815;
    int _1857 = _1855 + _1625;
    bool _1859 = _1270 > 0.5;
    float _1861 = trunc(_1843);
    float _1863 = precise::max(_1861, 0.0);
    uint _1865 = uint(_1863);
    bool _1867 = uint(_1857) >= uint(_1284);
    float _1869 = -_498;
    float _1871 = _1869 + 1.0;
    bool _1873 = !_1867;
    int _1875 = _1873 ? 0 : (-1);
    if (_1853)
    {
        float _1877 = -_352;
        float _1879 = _1877 + 1.0;
        _1635 = as_type<int>(_1879);
    }
    int _1881 = _1635;
    int _1883 = _1859 ? as_type<int>(_1871) : as_type<int>(_498);
    int _1885 = _1781 * int(_1849);
    int _1887 = _1885 + _1801;
    bool _1889 = _1278 > 0.5;
    int _1891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1893 = _1891 != 0;
    float _1895 = float(uint(_1887));
    int _1897 = ~_1284;
    int _1899 = _1897 + 1;
    float _1901 = _1893 ? as_type<float>(_1883) : _498;
    float _1903 = as_type<float>(_1403) * _1895;
    float _1905 = _1895;
    if (!_1853)
    {
        _1905 = _352;
    }
    float _1907 = _1905;
    float _1909 = _1907;
    if (_1853)
    {
        float _1911 = _1889 ? as_type<float>(_1881) : _352;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = trunc(_1903);
    float _1917 = precise::max(_1915, 0.0);
    uint _1919 = uint(_1917);
    bool _1921 = _1837 > 0.5;
    int _1923 = _1899 * int(_1865);
    int _1925 = _1923 + _1545;
    int _1927 = ~_1815;
    int _1929 = _1927 + _1875;
    int _1931 = _1929 + 1;
    int _1933 = _1350 * int(_1823);
    int _1935 = _1933 + _1771;
    int _1937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1939 = _1937 != 0;
    float _1941 = float(uint(_1925));
    int _1943 = _1284 * _1931;
    int _1945 = _1943 + _1625;
    int _1947 = _1921 ? as_type<int>(_1871) : as_type<int>(_498);
    float _1949 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1953 = _1951 != 0;
    float _1955 = as_type<float>(_1338) * _1941;
    bool _1957 = !_1673;
    int _1959 = _1957 ? _1945 : (-1);
    float _1961 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1963 = _1953 ? as_type<float>(_1947) : _498;
    float _1965 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1967 = _1959 & 3;
    bool _1969 = _1967 != 0;
    float _1971 = trunc(_1955);
    float _1973 = precise::max(_1971, 0.0);
    uint _1975 = uint(_1973);
    if (_1939)
    {
        float _1977 = _1889 ? _1871 : _498;
        _614 = _1977;
    }
    float _1979 = _614;
    float _1981 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1949);
    int _1983 = int(_1849) + int(_1919);
    int _1985 = ~_1324;
    int _1987 = _1985 + 1;
    float _1989 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1981);
    float _1991 = float(uint(_1935));
    bool _1993 = uint(_1967) > 1u;
    int _1995 = _1987 * _1983;
    int _1997 = _1995 + _1801;
    int _1999 = _1959 & 3;
    bool _2001 = _1999 != 0;
    float _2003 = as_type<float>(_1403) * _1991;
    float _2005 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1961);
    int _2007 = ~_1284;
    int _2009 = _2007 + 1;
    float _2011 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1965);
    int _2013 = _2001 ? 0 : 1;
    float _2015 = trunc(_2003);
    float _2017 = precise::max(_2015, 0.0);
    uint _2019 = uint(_2017);
    bool _2021 = uint(_1997) >= uint(_1324);
    float _2023 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2005);
    int _2025 = ~_2013;
    int _2027 = _2025 + 1;
    int _2029 = _2027 + 1;
    float _2031 = _1989 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2033 = !_2021;
    int _2035 = _2033 ? 0 : (-1);
    float _2037 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2011);
    bool _2039 = _1967 != 3;
    int _2041 = _2029;
    if (!_1993)
    {
        int _2043 = ~_2013;
        int _2045 = _2043 + 1;
        _2041 = _2045;
    }
    int _2047 = _2041;
    float _2049 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2051 = int(_1865) + int(_1975);
    float _2053 = _2023 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2055 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2057 = _2031 + _2055;
    bool _2059 = uint(_1967) >= 2u;
    float _2061 = _2049 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _2063 = ~_1983;
    int _2065 = _2063 + _2035;
    int _2067 = _2065 + 1;
    int _2069 = _2009 * _2051;
    int _2071 = _2069 + _1545;
    int _2073 = _2059 ? 0 : 1;
    float _2075 = _2057 * _2057;
    int _2077 = int(_1823) + int(_2019);
    int _2079 = _1324 * _2067;
    int _2081 = _2079 + _1801;
    int _2083 = ~_2073;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    float _2089 = _2037 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2091 = _2087;
    int _2093 = int(_1975);
    if (_2039)
    {
        int _2095 = ~_2073;
        int _2097 = _2095 + 1;
        _2091 = _2097;
    }
    int _2099 = _2091;
    float _2101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2103 = _2053 + _2101;
    bool _2105 = !_1683;
    int _2107 = _2105 ? _2081 : (-1);
    float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2111 = _2089 + _2109;
    if (_1519)
    {
        _2093 = 0;
    }
    int _2113 = _2093;
    float _2115 = fma(_2103, _2103, _2075);
    bool _2117 = uint(_2071) >= uint(_1284);
    float _2119 = -_2089;
    float _2121 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _2123 = _2113;
    if (!_1519)
    {
        _2123 = 1;
    }
    int _2125 = _2123;
    float _2127 = fma(_2111, _2111, _2115);
    int _2129 = _2107 & 3;
    bool _2131 = _2129 != 0;
    bool _2133 = !_2117;
    int _2135 = _2133 ? 0 : (-1);
    float _2137 = sqrt(_2127);
    int _2139 = _2107 & 3;
    bool _2141 = _2139 != 0;
    bool _2143 = uint(_2129) >= 2u;
    int _2145 = _2141 ? 0 : 1;
    bool _2147 = uint(_2129) > 1u;
    float _2149 = rsqrt(_2127);
    int _2151 = _2143 ? 0 : 1;
    bool _2153 = _2129 != 3;
    int _2155 = ~_1324;
    int _2157 = _2155 + 1;
    int _2159 = ~_2145;
    int _2161 = _2159 + 1;
    int _2163 = _2161 + 1;
    float _2165 = _2137 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2167 = ~_2151;
    int _2169 = _2167 + 1;
    int _2171 = _2169 + 1;
    int _2173 = _2157 * _2077;
    int _2175 = _2173 + _1771;
    bool _2177 = !_1969;
    int _2179 = _2177 ? 0 : 1;
    int _2181 = _2163;
    int _2183 = _2171;
    if (!_2147)
    {
        int _2185 = ~_2145;
        int _2187 = _2185 + 1;
        _2181 = _2187;
    }
    int _2189 = _2181;
    bool _2191 = uint(_2175) >= uint(_1324);
    if (_2153)
    {
        int _2193 = ~_2151;
        int _2195 = _2193 + 1;
        _2183 = _2195;
    }
    int _2197 = _2183;
    float _2199 = in.m_69.x;
    float _2201 = in.m_69.y;
    float _2203 = in.m_69.z;
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2207 = _2205 != 0;
    bool _2209 = !_2191;
    int _2211 = _2209 ? 0 : (-1);
    bool _2213 = _1270 > 0.5;
    bool _2215 = _2213 && _2207;
    float _2217 = precise::min(_2061, _2165);
    bool _2219 = _1797 != 2;
    int _2221 = ~_2051;
    int _2223 = _2221 + _2135;
    int _2225 = _2223 + 1;
    float _2227 = _2149 * _2217;
    int _2229 = abs(_2047);
    out.m_71.w = _2217;
    float _2231 = 0.0;
    if (!_2207)
    {
        _2231 = _352;
    }
    float _2233 = _2231;
    float _2235 = _2057 * _2227;
    float _2237 = _2111 * _2227;
    float _2239 = _2233;
    if (_2215)
    {
        float _2241 = -_352;
        float _2243 = _2241 + 1.0;
        _430 = _2243;
    }
    float _2245 = _430;
    bool _2247 = _2125 != 1;
    float _2249 = _2103 * _2227;
    float _2251 = -_2235;
    float _2253 = _2057 + _2251;
    float _2255 = -_2237;
    float _2257 = _2111 + _2255;
    if (_2207)
    {
        _2239 = _2245;
    }
    float _2259 = _2239;
    float _2261 = -_2249;
    float _2263 = _2103 + _2261;
    float _2265 = _2253 * _2253;
    float _2267 = in.m_73.x;
    float _2269 = in.m_73.y;
    float _2271 = in.m_73.z;
    bool _2273 = _2201 != 0.0;
    bool _2275 = isnan(_2201);
    bool _2277 = _2273 || _2275;
    bool _2279 = isnan(0.0);
    bool _2281 = _2277 || _2279;
    float _2283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2199);
    float _2285 = fma(_2263, _2263, _2265);
    float _2287 = in.m_75.x;
    float _2289 = in.m_75.y;
    float _2291 = in.m_75.z;
    float _2293 = in.m_75.w;
    bool _2295 = _2199 == 0.0;
    bool _2297 = !_2281;
    bool _2299 = _2295 && _2297;
    float _2301 = _610 * _790;
    float _2303 = fma(_2257, _2257, _2285);
    float _2305 = 0.0;
    if (!_2247)
    {
        _2305 = _1270;
    }
    float _2307 = _2305;
    int _2309 = _1284 * _2225;
    int _2311 = _2309 + _1545;
    bool _2313 = _2203 == 0.0;
    bool _2315 = _2313 && _2299;
    float _2317 = 0.0;
    float _2319 = _2307;
    if (_2219)
    {
        _2317 = _174;
    }
    float _2321 = _2317;
    float _2323 = sqrt(_2303);
    float _2325 = 0.0;
    float _2327 = _2321;
    if (!_2247)
    {
        _2325 = _2307;
    }
    float _2329 = _2325;
    float _2331 = _2329;
    if (!_2219)
    {
        _2327 = _1278;
    }
    float _2333 = _2327;
    float _2335 = 0.0;
    if (!_2247)
    {
        _2335 = _1278;
    }
    float _2337 = _2335;
    float _2339 = 0.0;
    float _2341 = _2337;
    if (_2219)
    {
        _2339 = _1270;
    }
    float _2343 = _2339;
    float _2345 = _2343;
    if (_2247)
    {
        _2331 = _174;
    }
    float _2347 = _2331;
    if (_2247)
    {
        _2319 = _174;
    }
    float _2349 = _2319;
    if (_2247)
    {
        _1387 = _1270;
    }
    float _2351 = _1387;
    float _2353 = _2347 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2355 = _2271 * _2289;
    float _2357 = _2267 * _2291;
    float _2359 = _2269 * _2287;
    float _2361 = _2355;
    float _2363 = _2293;
    if (_2247)
    {
        _2341 = _1270;
    }
    float _2365 = _2341;
    float _2367 = _2149 * _2323;
    if (!_2219)
    {
        _2345 = _174;
    }
    float _2369 = _2345;
    float _2371 = -_2357;
    float _2373 = fma(_2271, _2287, _2371);
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2377 = _2375 != 0;
    float _2379 = -_2359;
    float _2381 = fma(_2289, _2267, _2379);
    int _2383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2385 = _2383 != 0;
    float _2387 = -_2355;
    float _2389 = fma(_2291, _2269, _2387);
    if (_2315)
    {
        _2361 = _2269;
    }
    float _2391 = _2361;
    float _2393 = _1280 * _2367;
    float _2395 = _2391;
    if (!_2315)
    {
        float _2397 = fma(_2201, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2269);
        _2395 = _2397;
    }
    float _2399 = _2395;
    float _2401 = _2389 * _2293;
    float _2403 = _2373 * _2293;
    float _2405 = _2381 * _2293;
    float _2407 = _2301 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_2315)
    {
        _2363 = _2271;
    }
    float _2409 = _2363;
    float _2411 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2201);
    float _2413 = _2409;
    if (!_2315)
    {
        float _2415 = fma(_2203, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2271);
        _2413 = _2415;
    }
    float _2417 = _2413;
    float _2419 = _2393 * _2203;
    float _2421 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2423 = _2407 * _2367;
    float _2425 = 0.0;
    float _2427 = _2417;
    if (_2315)
    {
        _2425 = _2267;
    }
    float _2429 = _2425;
    float _2431 = _2429;
    if (!_2315)
    {
        float _2433 = fma(_2199, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2267);
        _2431 = _2433;
    }
    float _2435 = _2431;
    float _2437 = -_1288;
    float _2439 = fma(_2421, 2.0, _2437);
    float _2441 = _2423 * _2411;
    float _2443 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2445 = _2443 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2447 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2449 = 1.0 / _2445;
    float _2451 = -_2053;
    float _2453 = _2451 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2457 = fma(_2447, -2.0, _1298);
    float _2459 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2455);
    float _2461 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2463 = _2461 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2465 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2467 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2469 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2471 = _2469 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2473 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2465);
    float _2475 = -_2031;
    float _2477 = _2475 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2479 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2467);
    float _2481 = 1.0 / _2471;
    float _2483 = _2477 * _2477;
    float _2485 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2487 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2489 = fma(_2453, _2453, _2483);
    float _2491 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2493 = -_2485;
    float _2495 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2493);
    float _2497 = 1.0 / _2463;
    float _2499 = fma(_2121, _2121, _2489);
    float _2501 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2503 = _2501 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2505 = -_2487;
    float _2507 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2505);
    float _2509 = -_2491;
    float _2511 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2509);
    float _2513 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2479);
    float _2515 = rsqrt(_2499);
    float _2517 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2519 = _2517 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2521 = _2369 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2523 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2525 = _2523 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2527 = _2351 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2529 = _2049 * _2367;
    float _2531 = 1.0 / _2519;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2537;
    int _2541 = ~_2229;
    int _2543 = _2541 + 1;
    int _2545 = _2543 + 1;
    float _2547 = _2529 * _2283;
    int _2549 = abs(_2179);
    float _2551 = _2539 * _2497;
    bool _2553 = !_2131;
    int _2555 = _2553 ? 0 : 1;
    float _2557 = 1.0 / _2503;
    float _2559 = _2453 * _2515;
    float _2561 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2563 = _2477 * _2515;
    int _2565 = abs(_2555);
    float _2567 = -_2561;
    float _2569 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2567);
    bool _2571 = _1967 != 3;
    float _2573 = 1.0 / _2525;
    float _2575 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2577 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2575;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2581 = _2579 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2583 = ~_2077;
    int _2585 = _2583 + _2211;
    int _2587 = _2585 + 1;
    float _2589 = _2577 * _2449;
    float _2591 = _2581 * _2481;
    float _2593 = _2559 * _2559;
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2597 = _2595 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2599 = _2121 * _2515;
    float _2601 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2603 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2601;
    float _2605 = 1.0 / _2535;
    float _2607 = fma(_2599, _2599, _2593);
    float _2609 = _2603 * _2531;
    float _2611 = _2597 * _2557;
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2615 = _2613 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2619 = _1264 + _2617;
    float _2621 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2623 = _1264 + _2621;
    bool _2625 = !_2571;
    int _2627 = _2625 ? 0 : (-1);
    float _2629 = rsqrt(_2607);
    float _2631 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2633 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2631;
    float _2635 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2637 = _1264 + _2635;
    float _2639 = _2615 * _2573;
    float _2641 = fma(_2591, _2619, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2643 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2645 = _1264 + _2643;
    float _2647 = fma(_2589, _2637, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2649 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2651 = _1264 + _2649;
    float _2653 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2655 = _1264 + _2653;
    float _2657 = _2633 * _2605;
    float _2659 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2661 = fma(_2551, _2651, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2663 = fma(_2609, _2645, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2665 = fma(_2639, _2623, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2667 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2669 = fma(_2611, _2655, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2671 = _2599 * _2629;
    float _2673 = _2559 * _2629;
    float _2675 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2677 = -_2667;
    float _2679 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2677);
    float _2681 = -_2671;
    float _2683 = _2599 * _2681;
    float _2685 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2687 = -_2675;
    float _2689 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2687);
    float _2691 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2679);
    float _2693 = -_2683;
    float _2695 = fma(_2559, _2673, _2693);
    float _2697 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2699 = _2563 * _2673;
    float _2701 = -_2659;
    float _2703 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2701);
    float _2705 = _2695 * _2695;
    float _2707 = -_2685;
    float _2709 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2707);
    float _2711 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2689);
    float _2713 = _2691 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2715 = -_2697;
    float _2717 = fma(_2507, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2715);
    float _2719 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2721 = fma(_2699, _2699, _2705);
    float _2723 = -_2671;
    float _2725 = _2563 * _2723;
    float _2727 = -_2713;
    float _2729 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2727);
    float _2731 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2717);
    float _2733 = -_2719;
    float _2735 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2733);
    float _2737 = fma(_2725, _2725, _2721);
    float _2739 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2741 = fma(_2731, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2729);
    float _2743 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2735);
    bool _2745 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2747 = isnan(_1264);
    bool _2749 = _2745 || _2747;
    bool _2751 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2753 = _2749 || _2751;
    float _2755 = float(_2753);
    float _2757 = -_2739;
    float _2759 = fma(_2507, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2757);
    float _2761 = rsqrt(_2737);
    float _2763 = -_2743;
    float _2765 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2741);
    bool _2767 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2769 = isnan(_1264);
    bool _2771 = _2767 || _2769;
    bool _2773 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2775 = _2771 || _2773;
    float _2777 = float(_2775);
    float _2779 = -_2755;
    float _2781 = _2779 + 1.0;
    bool _2783 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2785 = isnan(_1264);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2791 = _2787 || _2789;
    float _2793 = float(_2791);
    float _2795 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2709);
    float _2797 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2703);
    float _2799 = _2777 * _2781;
    float _2801 = 1.0 / _2765;
    float _2803 = -_2777;
    float _2805 = _2803 + 1.0;
    bool _2807 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2809 = isnan(_1264);
    bool _2811 = _2807 || _2809;
    bool _2813 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2815 = _2811 || _2813;
    float _2817 = float(_2815);
    float _2819 = -_2793;
    float _2821 = _2819 + 1.0;
    float _2823 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2759);
    float _2825 = _2793 * _2805;
    bool _2827 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2829 = isnan(_1264);
    bool _2831 = _2827 || _2829;
    bool _2833 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2835 = _2831 || _2833;
    float _2837 = float(_2835);
    float _2839 = -_2817;
    float _2841 = _2839 + 1.0;
    float _2843 = _2695 * _2761;
    float _2845 = precise::clamp(_2843, 0.0, 1.0);
    bool _2847 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2849 = isnan(_1264);
    bool _2851 = _2847 || _2849;
    bool _2853 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2855 = _2851 || _2853;
    float _2857 = float(_2855);
    float _2859 = _2817 * _2821;
    float _2861 = _2837 * _2841;
    float _2863 = -_2837;
    float _2865 = _2863 + 1.0;
    float _2867 = -_2845;
    float _2869 = _2867 + 1.0;
    bool _2871 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2873 = isnan(_1264);
    bool _2875 = _2871 || _2873;
    bool _2877 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2879 = _2875 || _2877;
    float _2881 = float(_2879);
    float _2883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2885 = fma(_2795, _2801, -1.0);
    float _2887 = -_2857;
    float _2889 = _2887 + 1.0;
    float _2891 = _2857 * _2865;
    float _2893 = _2869 * _2801;
    float _2895 = fma(_2869, _2885, 1.0);
    bool _2897 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2899 = isnan(_1264);
    bool _2901 = _2897 || _2899;
    bool _2903 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2905 = _2901 || _2903;
    float _2907 = float(_2905);
    float _2909 = _2881 * _2889;
    float _2911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2913 = -_2881;
    float _2915 = _2913 + 1.0;
    float _2917 = _2797 * _2893;
    float _2919 = _2895 * _2895;
    float _2921 = _2823 * _2893;
    float _2923 = _2907 * _2915;
    float _2925 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2927 = _1264 + _2925;
    float _2929 = fma(_2917, _2917, _2919);
    float _2931 = -_2907;
    float _2933 = _2931 + 1.0;
    float _2935 = _2647 * _2923;
    float _2937 = fma(_2657, _2927, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2939 = fma(_2921, _2921, _2929);
    float _2941 = _2883 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2943 = fma(_2933, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2935);
    int _2945 = _1324 * _2587;
    int _2947 = _2945 + _1771;
    float _2949 = fma(_2941, _1979, -0.5);
    float _2951 = _2911 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2953 = rsqrt(_2939);
    float _2955 = fma(_2641, _2909, _2943);
    float _2957 = fma(_2951, _2259, -0.5);
    float _2959 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2961 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2963 = fma(_2661, _2891, _2955);
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2967 = -_2961;
    float _2969 = fma(_2959, 2.0, _2967);
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2973 = fma(_2669, _2861, _2963);
    float _2975 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2965);
    float _2977 = -_144;
    float _2979 = fma(_2977, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2969);
    float _2981 = fma(_2365, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2971);
    float _2983 = _2921 * _2953;
    float _2985 = _2895 * _2953;
    float _2987 = fma(_2513, _2957, _2979);
    int _2989 = _1959 >> 31;
    float _2991 = fma(_2663, _2859, _2973);
    float _2993 = _2917 * _2953;
    float _2995 = -_2983;
    float _2997 = _2559 * _2995;
    float _2999 = _2599 * _2985;
    int _3001 = _2989 & 3;
    float _3003 = fma(_2665, _2825, _2991);
    float _3005 = -_2993;
    float _3007 = -_2997;
    float _3009 = fma(_2599, _3005, _3007);
    float _3011 = -_2983;
    float _3013 = -_2999;
    float _3015 = fma(_2563, _3011, _3013);
    int _3017 = _2107 >> 31;
    float _3019 = -_2993;
    float _3021 = _2563 * _3019;
    int _3023 = _1959 + _3001;
    float _3025 = _3009 * _3009;
    int _3027 = _3017 & 3;
    float _3029 = -_3021;
    float _3031 = fma(_2559, _2985, _3029);
    int _3033 = _3023 >> 2;
    float _3035 = fma(_3015, _3015, _3025);
    int _3037 = _2107 + _3027;
    float _3039 = fma(_2937, _2799, _3003);
    int _3041 = _3033 << 4;
    int _3043 = _3041 + 368;
    float _3045 = fma(_3031, _3031, _3035);
    float _3047 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2473);
    uint _3049 = uint(int(uint(_3043) >> uint(2)));
    uint _3051 = uint(int(uint(int(_3049)) >> uint(2)));
    int _3053 = int(_3049) & 3;
    float _3055 = (*spvDescriptorSet0.vp_c9)._m0[int(_3051)][_3053];
    int _3057 = int(_3049) + 1;
    uint _3059 = uint(int(uint(_3057) >> uint(2)));
    int _3061 = _3057 & 3;
    float _3063 = (*spvDescriptorSet0.vp_c9)._m0[int(_3059)][_3061];
    int _3065 = _3037 >> 2;
    float _3067 = rsqrt(_3045);
    float _3069 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3071 = fma(_2755, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3039);
    int _3073 = _3065 << 4;
    int _3075 = _3073 + 512;
    float _3077 = -_3069;
    float _3079 = fma(_2353, 2.0, _3077);
    int _3081 = _3043 + 8;
    uint _3083 = uint(int(uint(_3081) >> uint(2)));
    uint _3085 = uint(int(uint(int(_3083)) >> uint(2)));
    int _3087 = int(_3083) & 3;
    float _3089 = (*spvDescriptorSet0.vp_c9)._m0[int(_3085)][_3087];
    int _3091 = int(_3083) + 1;
    uint _3093 = uint(int(uint(_3091) >> uint(2)));
    int _3095 = _3091 & 3;
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[int(_3093)][_3095];
    float _3099 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3101 = abs(_2197);
    float _3103 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _3105 = _2129 != 3;
    float _3107 = fma(_2527, -2.0, _3099);
    out.m_77.x = _3071;
    float _3109 = fma(_2521, -2.0, _3103);
    uint _3111 = uint(int(uint(_3075) >> uint(2)));
    uint _3113 = uint(int(uint(int(_3111)) >> uint(2)));
    int _3115 = int(_3111) & 3;
    float _3117 = (*spvDescriptorSet0.vp_c9)._m0[int(_3113)][_3115];
    int _3119 = int(_3111) + 1;
    uint _3121 = uint(int(uint(_3119) >> uint(2)));
    int _3123 = _3119 & 3;
    float _3125 = (*spvDescriptorSet0.vp_c9)._m0[int(_3121)][_3123];
    float _3127 = _3015 * _3067;
    float _3129 = _3031 * _3067;
    float _3131 = _3009 * _3067;
    float _3133 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3109);
    float _3135 = _2599 * _3127;
    float _3137 = _2563 * _3129;
    int _3139 = _3075 + 8;
    uint _3141 = uint(int(uint(_3139) >> uint(2)));
    uint _3143 = uint(int(uint(int(_3141)) >> uint(2)));
    int _3145 = int(_3141) & 3;
    float _3147 = (*spvDescriptorSet0.vp_c9)._m0[int(_3143)][_3145];
    int _3149 = int(_3141) + 1;
    uint _3151 = uint(int(uint(_3149) >> uint(2)));
    int _3153 = _3149 & 3;
    float _3155 = (*spvDescriptorSet0.vp_c9)._m0[int(_3151)][_3153];
    float _3157 = _2559 * _3131;
    float _3159 = -_3135;
    float _3161 = fma(_2559, _3129, _3159);
    float _3163 = -_3137;
    float _3165 = fma(_2599, _3131, _3163);
    int _3167 = abs(_2189);
    float _3169 = -_3157;
    float _3171 = fma(_2563, _3127, _3169);
    float _3173 = _3161 * _3161;
    float _3175 = -_3133;
    float _3177 = fma(_3047, _2949, _3175);
    int _3179 = ~_3167;
    int _3181 = _3179 + 1;
    int _3183 = _3181 + 1;
    float _3185 = fma(_3165, _3165, _3173);
    float _3187 = fma(_3171, _3171, _3185);
    float _3189 = rsqrt(_3187);
    int _3191 = _2545 * as_type<int>(_3063);
    float _3193 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3195 = int(_3193);
    int _3197 = ~_2549;
    int _3199 = _3197 + 1;
    int _3201 = _3199 + 1;
    int _3203 = _3201 * as_type<int>(_3055);
    int _3205 = _3203 + _3191;
    int _3207 = abs(_2099);
    float _3209 = _3171 * _3189;
    float _3211 = _3165 * _3189;
    int _3213 = ~_3207;
    int _3215 = _3213 + 1;
    int _3217 = _3215 + 1;
    int _3219 = _3183 * as_type<int>(_3125);
    int _3221 = ~_2565;
    int _3223 = _3221 + 1;
    int _3225 = _3223 + 1;
    float _3227 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3229 = int(_3227);
    int _3231 = abs(_2627);
    int _3233 = _3217 * as_type<int>(_3089);
    int _3235 = _3233 + _3205;
    bool _3237 = !_2385;
    int _3239 = _3237 ? 0 : 1;
    int _3241 = _3225 * as_type<int>(_3117);
    int _3243 = _3241 + _3219;
    int _3245 = ~_3231;
    int _3247 = _3245 + 1;
    int _3249 = _3247 + 1;
    float _3251 = _3161 * _3189;
    bool _3253 = !_2377;
    int _3255 = _3253 ? 0 : 1;
    float _3257 = _3209 * _2289;
    int _3259 = abs(_3239);
    float _3261 = _2559 * _3209;
    int _3263 = _3249 * as_type<int>(_3097);
    int _3265 = _3263 + _3235;
    float _3267 = float(uint(_3195));
    float _3269 = _2599 * _3251;
    int _3271 = abs(_3255);
    float _3273 = -_3261;
    float _3275 = fma(_2599, _3211, _3273);
    bool _3277 = !_3105;
    int _3279 = _3277 ? 0 : (-1);
    float _3281 = 1.0 / _3267;
    int _3283 = ~_3101;
    int _3285 = _3283 + 1;
    int _3287 = _3285 + 1;
    float _3289 = -_3269;
    float _3291 = fma(_2563, _3209, _3289);
    float _3293 = _3275 * _3275;
    int _3295 = ~_3195;
    int _3297 = _3295 + 1;
    float _3299 = _2403 * _3251;
    int _3301 = _3287 * as_type<int>(_3147);
    int _3303 = _3301 + _3243;
    float _3305 = float(uint(_3229));
    float _3307 = fma(_3291, _3291, _3293);
    int _3309 = abs(_3279);
    float _3311 = _2563 * _3211;
    float _3313 = 1.0 / _3305;
    int _3315 = ~_3229;
    int _3317 = _3315 + 1;
    float _3319 = _2403 * _3209;
    float _3321 = -_3311;
    float _3323 = fma(_2559, _3251, _3321);
    int _3325 = ~_3271;
    int _3327 = _3325 + 1;
    int _3329 = _3327 + 1;
    int _3331 = ~_3309;
    int _3333 = _3331 + 1;
    int _3335 = _3333 + 1;
    float _3337 = fma(_3323, _3323, _3307);
    int _3339 = abs(_3195);
    int _3341 = _3265 * _3329;
    int _3343 = ~_3259;
    int _3345 = _3343 + 1;
    int _3347 = _3345 + 1;
    int _3349 = _3335 * as_type<int>(_3155);
    int _3351 = _3349 + _3303;
    bool _3353 = !_1673;
    int _3355 = _3353 ? _2311 : (-1);
    float _3357 = rsqrt(_3337);
    int _3359 = _3351 * _3347;
    bool _3361 = !_1683;
    int _3363 = _3361 ? _2947 : (-1);
    int _3365 = _3355 * _3271;
    int _3367 = _3365 + _3341;
    int _3369 = abs(_3229);
    float _3371 = _2441 * _3209;
    int _3373 = as_type<int>(_3281) + (-2);
    int _3375 = _3363 * _3259;
    int _3377 = _3375 + _3359;
    float _3379 = float(uint(_3369));
    float _3381 = _2441 * _3211;
    float _3383 = float(uint(_3339));
    float _3385 = _3209 * _2399;
    float _3387 = 1.0 / _3379;
    int _3389 = as_type<int>(_3313) + (-2);
    float _3391 = _3323 * _3357;
    float _3393 = float(uint(_3367));
    float _3395 = _3291 * _3357;
    int _3397 = abs(_3367);
    float _3399 = fma(_2547, _3391, _3371);
    float _3401 = 1.0 / _3383;
    float _3403 = as_type<float>(_3373) * _3393;
    float _3405 = float(uint(_3377));
    float _3407 = fma(_2599, _2419, _3399);
    float _3409 = fma(_2547, _3395, _3381);
    int _3411 = ~_3369;
    int _3413 = _3411 + 1;
    float _3415 = as_type<float>(_3389) * _3405;
    float _3417 = trunc(_3403);
    float _3419 = precise::max(_3417, 0.0);
    uint _3421 = uint(_3419);
    int _3423 = as_type<int>(_3387) + (-2);
    float _3425 = fma(_2559, _2419, _3409);
    float _3427 = _2089 + _3407;
    float _3429 = fma(_3391, _2287, _3257);
    float _3431 = _2053 + _3425;
    float _3433 = float(uint(_3397));
    float _3435 = trunc(_3415);
    float _3437 = precise::max(_3435, 0.0);
    uint _3439 = uint(_3437);
    int _3441 = as_type<int>(_3401) + (-2);
    float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3445 = _3427 + _3443;
    int _3447 = abs(_3377);
    float _3449 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3451 = _3431 + _3449;
    float _3453 = as_type<float>(_3441) * _3433;
    float _3455 = _3445 * _3445;
    int _3457 = _3297 * int(_3421);
    int _3459 = _3457 + _3367;
    float _3461 = _3177 + 0.5;
    float _3463 = fma(_3451, _3451, _3455);
    float _3465 = trunc(_3453);
    float _3467 = precise::max(_3465, 0.0);
    uint _3469 = uint(_3467);
    float _3471 = float(uint(_3459));
    float _3473 = _2987 + 0.5;
    int _3475 = ~_3339;
    int _3477 = _3475 + 1;
    int _3479 = _3317 * int(_3439);
    int _3481 = _3479 + _3377;
    float _3483 = float(uint(_3447));
    float _3485 = as_type<float>(_3373) * _3471;
    out.m_79.x = _3473;
    out.m_79.y = _3461;
    float _3487 = sqrt(_3463);
    float _3489 = float(uint(_3481));
    float _3491 = as_type<float>(_3423) * _3483;
    float _3493 = _3251 * _2289;
    float _3495 = as_type<float>(_3389) * _3489;
    float _3497 = _3211 * _2289;
    float _3499 = trunc(_3491);
    float _3501 = precise::max(_3499, 0.0);
    uint _3503 = uint(_3501);
    int _3505 = _3477 * int(_3469);
    int _3507 = _3505 + _3397;
    float _3509 = _2403 * _3211;
    float _3511 = _3251 * _2399;
    float _3513 = _2441 * _3251;
    float _3515 = fma(_3395, _2287, _3497);
    float _3517 = float(uint(_3507));
    float _3519 = _3275 * _3357;
    float _3521 = trunc(_3485);
    float _3523 = precise::max(_3521, 0.0);
    uint _3525 = uint(_3523);
    float _3527 = _3211 * _2399;
    bool _3529 = _3487 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3531 = as_type<float>(_3441) * _3517;
    float _3533 = fma(_2547, _3519, _3513);
    int _3535 = ~_3195;
    int _3537 = _3535 + 1;
    float _3539 = fma(_3519, _2287, _3493);
    float _3541 = fma(_2401, _3395, _3509);
    int _3543 = _3413 * int(_3503);
    int _3545 = _3543 + _3447;
    float _3547 = trunc(_3495);
    float _3549 = precise::max(_3547, 0.0);
    uint _3551 = uint(_3549);
    float _3553 = fma(_2563, _2419, _3533);
    int _3555 = ~_3229;
    int _3557 = _3555 + 1;
    float _3559 = fma(_2401, _3519, _3299);
    float _3561 = float(uint(_3545));
    float _3563 = fma(_2401, _3391, _3319);
    float _3565 = fma(_3519, _2435, _3511);
    int _3567 = int(_3421) + int(_3525);
    float _3569 = trunc(_3531);
    float _3571 = precise::max(_3569, 0.0);
    uint _3573 = uint(_3571);
    float _3575 = as_type<float>(_3423) * _3561;
    float _3577 = fma(_3391, _2435, _3385);
    float _3579 = fma(_2559, _2291, _3515);
    int _3581 = _3537 * _3567;
    int _3583 = _3581 + _3367;
    float _3585 = fma(_2563, _2291, _3539);
    float _3587 = fma(_3395, _2435, _3527);
    float _3589 = fma(_2599, _2291, _3429);
    float _3591 = trunc(_3575);
    float _3593 = precise::max(_3591, 0.0);
    uint _3595 = uint(_3593);
    int _3597 = int(_3439) + int(_3551);
    float _3599 = _2031 + _3553;
    bool _3601 = uint(_3583) >= uint(_3195);
    int _3603 = ~_3339;
    int _3605 = _3603 + 1;
    int _3607 = _3557 * _3597;
    int _3609 = _3607 + _3377;
    int _3611 = ~_3369;
    int _3613 = _3611 + 1;
    int _3615 = int(_3469) + int(_3573);
    float _3617 = as_type<float>(_3583);
    float _3619 = _3553;
    float _3621 = _3511;
    float _3623 = _3579;
    float _3625 = _3585;
    if (!_3529)
    {
        _3617 = _3431;
    }
    float _3627 = _3617;
    float _3629 = _3627;
    if (!_3529)
    {
        _3619 = _3427;
    }
    float _3631 = _3619;
    float _3633 = _3631;
    if (!_3529)
    {
        _3621 = _3599;
    }
    float _3635 = _3621;
    int _3637 = int(_3503) + int(_3595);
    bool _3639 = !_3529;
    float _3641 = _3635;
    if (!_3639)
    {
        float _3643 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3647 = _3487 + _3645;
        float _3649 = _3599 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3651 = rsqrt(_3463);
        float _3653 = _3647 * _3643;
        float _3655 = _3653 * 0.15915493667125701904296875;
        float _3657 = _3655 * 6.283185482025146484375;
        float _3659 = cos(_3657);
        float _3661 = _3655 * 6.283185482025146484375;
        float _3663 = sin(_3661);
        float _3665 = _3659 + (-1.0);
        float _3667 = fma(_3663, _3649, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3669 = _3665 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3671 = _3651 * _3667;
        float _3673 = fma(_3599, _3659, _3669);
        float _3675 = fma(_3451, _3671, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3677 = fma(_3445, _3671, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3629 = _3675;
        _3641 = _3673;
        _3633 = _3677;
    }
    float _3679 = _3629;
    float _3681 = _3641;
    float _3683 = _3633;
    bool _3685 = !_3601;
    int _3687 = _3685 ? 0 : (-1);
    float _3689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3691 = _3605 * _3615;
    int _3693 = _3691 + _3397;
    bool _3695 = uint(_3609) >= uint(_3229);
    int _3697 = _3613 * _3637;
    int _3699 = _3697 + _3447;
    int _3701 = ~_3567;
    int _3703 = _3701 + _3687;
    int _3705 = _3703 + 1;
    float _3707 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2457);
    bool _3709 = uint(_3693) >= uint(_3339);
    float _3711 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3107);
    bool _3713 = !_3695;
    int _3715 = _3713 ? 0 : (-1);
    int _3717 = _3195 * _3705;
    int _3719 = _3717 + _3367;
    bool _3721 = _3195 == 0;
    float _3723 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2459);
    bool _3725 = _3195 == 0;
    float _3727 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2981);
    int _3729 = _3367 ^ _3195;
    out.m_81.x = _2529;
    int _3731 = ~_3597;
    int _3733 = _3731 + _3715;
    int _3735 = _3733 + 1;
    float _3737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3739 = !_3721;
    int _3741 = _3739 ? _3719 : (-1);
    bool _3743 = uint(_3699) >= uint(_3369);
    int _3745 = _3229 * _3735;
    int _3747 = _3745 + _3377;
    int _3749 = _3377 ^ _3229;
    float _3751 = _3689 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3753 = _3229 == 0;
    float _3755 = fma(_2599, _2417, _3577);
    bool _3757 = _3229 == 0;
    float _3759 = -_144;
    float _3761 = fma(_3759, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2439);
    float _3763 = float(_3741);
    float _3765 = fma(_3751, _1835, -0.5);
    bool _3767 = !_3743;
    int _3769 = _3767 ? 0 : (-1);
    float _3771 = -_2249;
    float _3773 = _2053 + _3771;
    bool _3775 = !_3709;
    int _3777 = _3775 ? 0 : (-1);
    float _3779 = fma(_3751, _3763, _3761);
    uint _3781 = uint(int(uint(_3729) >> uint(31)));
    float _3783 = _3737 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3785 = ~_3769;
    int _3787 = _3637 + _3785;
    int _3789 = _3787 + 1;
    float _3791 = -_144;
    float _3793 = fma(_3791, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3079);
    bool _3795 = !_3753;
    int _3797 = _3795 ? _3747 : (-1);
    float _3799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _3801 = uint(int(uint(_3749) >> uint(31)));
    float _3803 = fma(_3783, _1913, -0.5);
    int _3805 = ~_3777;
    int _3807 = _3615 + _3805;
    int _3809 = _3807 + 1;
    float _3811 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1300);
    int _3813 = ~int(_3781);
    int _3815 = _3813 + 1;
    float _3817 = fma(_2559, _2417, _3587);
    float _3819 = float(_3797);
    float _3821 = fma(_3811, _3765, _3779);
    int _3823 = ~int(_3801);
    int _3825 = _3823 + 1;
    out.m_83.x = _3579;
    out.m_83.y = _3585;
    out.m_83.z = _3589;
    int _3827 = _3809 ^ _3815;
    float _3829 = fma(_3783, _3819, _3793);
    int _3831 = _3789 ^ _3825;
    float _3833 = -_2237;
    float _3835 = _2089 + _3833;
    int _3837 = ~_3815;
    int _3839 = _3837 + _3827;
    int _3841 = _3839 + 1;
    float _3843 = _3799 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3845 = ~_3825;
    int _3847 = _3845 + _3831;
    int _3849 = _3847 + 1;
    float _3851 = _2405 * _2559;
    float _3853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3855 = !_3725;
    int _3857 = _3855 ? _3841 : (-1);
    float _3859 = fma(_1901, _3843, -0.5);
    float _3861 = _2405 * _2563;
    float _3863 = _2405 * _2599;
    float _3865 = float(_3857);
    float _3867 = _3851 + _3541;
    bool _3869 = !_3757;
    int _3871 = _3869 ? _3849 : (-1);
    float _3873 = _3861 + _3559;
    float _3875 = -_2053;
    float _3877 = _3875 + _3679;
    float _3879 = -_3707;
    float _3881 = fma(_3843, _3865, _3879);
    float _3883 = -_2031;
    float _3885 = _3883 + _3681;
    float _3887 = _3863 + _3563;
    float _3889 = float(_3871);
    float _3891 = -_2089;
    float _3893 = _3891 + _3683;
    float _3895 = _3885 * _3885;
    float _3897 = _3853 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3899 = fma(_3723, _3859, _3881);
    float _3901 = fma(_2563, _2417, _3565);
    float _3903 = fma(_3877, _3877, _3895);
    float _3905 = fma(_1963, _3897, -0.5);
    float _3907 = -_3711;
    float _3909 = fma(_3897, _3889, _3907);
    float _3911 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2975);
    float _3913 = fma(_3893, _3893, _3903);
    float _3915 = _3821 + 0.5;
    float _3917 = _3899 + 0.5;
    float _3919 = fma(_3911, _3803, _3829);
    float _3921 = fma(_3727, _3905, _3909);
    float _3923 = sqrt(_3913);
    out.m_85.x = _3867;
    out.m_85.y = _3873;
    out.m_85.z = _3887;
    float _3925 = _3919 + 0.5;
    float _3927 = _3921 + 0.5;
    float _3929 = -_2249;
    float _3931 = _3929 + _3679;
    out.m_87.x = _3817;
    out.m_87.y = _3901;
    out.m_87.z = _3755;
    float _3933 = -_2235;
    float _3935 = _3933 + _3681;
    float _3937 = -_2235;
    float _3939 = _2031 + _3937;
    out.m_89.x = _3915;
    out.m_89.y = _3917;
    out.m_89.z = _3925;
    out.m_89.w = _3927;
    bool _3941 = _3923 > 0.0;
    float _3943 = -_2237;
    float _3945 = _3943 + _3683;
    float _3947 = _3873;
    float _3949 = _3867;
    float _3951 = _3885;
    if (!_3941)
    {
        _2427 = _3931;
    }
    float _3953 = _2427;
    float _3955 = _3953;
    float _3957 = _3953;
    if (!_3941)
    {
        _3623 = _3935;
    }
    float _3959 = _3623;
    float _3961 = _3959;
    float _3963 = _3959;
    if (!_3941)
    {
        _3625 = _3945;
    }
    float _3965 = _3625;
    bool _3967 = !_3941;
    float _3969 = _3965;
    float _3971 = _3965;
    if (!_3967)
    {
        bool _3973 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3975 = _3589;
        if (_3973)
        {
            float _3977 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3975 = _3977;
        }
        float _3979 = _3975;
        float _3981 = _3979;
        if (_3973)
        {
            float _3983 = _602 * _3979;
            _3947 = _3983;
        }
        float _3985 = _3947;
        float _3987 = _3985;
        if (_3973)
        {
            float _3989 = _604 * _3979;
            _3949 = _3989;
        }
        float _3991 = _3949;
        float _3993 = _3991;
        if (_3973)
        {
            float _3995 = _606 * _3979;
            _3981 = _3995;
        }
        float _3997 = _3981;
        float _3999 = _3997;
        if (!_3973)
        {
            bool _4001 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4003 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4005 = _4001 || _4003;
            bool _4007 = isnan(1.0);
            bool _4009 = _4005 || _4007;
            float _4011 = _144 + 1.0;
            if (!_4009)
            {
                float _4013 = _4011 * _4011;
                float _4015 = _4013 * 0.5;
                _166 = _4015;
            }
            float _4017 = _166;
            float _4019 = _4017;
            if (!_4009)
            {
                float _4021 = _4017 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4019 = _4021;
            }
            float _4023 = _4019;
            bool _4025 = !_4009;
            float _4027 = _4023;
            if (!_4025)
            {
                float _4029 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4031 = log2(_4029);
                float _4033 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4035 = _4033 + 1.0;
                float _4037 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4039 = _4031 * _4011;
                float _4041 = 1.0 / _4035;
                float _4043 = _4037 * 0.693147182464599609375;
                float _4045 = exp2(_4039);
                float _4047 = 1.0 / _4043;
                float _4049 = _4045 + (-1.0);
                float _4051 = -_4049;
                float _4053 = fma(_4051, _4047, _4011);
                float _4055 = _4053 * _4041;
                float _4057 = _4055 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4027 = _4057;
            }
            float _4059 = _4027;
            float _4061 = _4059 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _4063 = _4059 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4065 = _4059 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4067 = _4059;
            if (!_4009)
            {
                _4067 = _4011;
            }
            float _4069 = _4067;
            float _4071 = _4061 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _4073 = _4061 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _4075 = _4061 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _4077 = fma(_4063, (*spvDescriptorSet0.vp_c10)._m0[8].y, _4071);
            float _4079 = fma(_4063, (*spvDescriptorSet0.vp_c10)._m0[8].x, _4073);
            float _4081 = fma(_4065, (*spvDescriptorSet0.vp_c10)._m0[10].y, _4077);
            bool _4083 = !_4009;
            float _4085 = _4069;
            if (!_4083)
            {
                float _4087 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4089 = log2(_4087);
                float _4091 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4093 = _4091 + 1.0;
                float _4095 = 1.0 / _4093;
                float _4097 = _4089 * _4011;
                float _4099 = exp2(_4097);
                float _4101 = -_4099;
                float _4103 = _4101 + 1.0;
                float _4105 = _4103 * _4095;
                _4085 = _4105;
                _202 = _4095;
            }
            float _4107 = _4085;
            float _4109 = _202;
            float _4111 = fma(_4063, (*spvDescriptorSet0.vp_c10)._m0[8].z, _4075);
            float _4113 = fma(_4107, _314, _4081);
            float _4115 = fma(_4065, (*spvDescriptorSet0.vp_c10)._m0[10].x, _4079);
            float _4117 = fma(_4065, (*spvDescriptorSet0.vp_c10)._m0[10].z, _4111);
            float _4119 = -_540;
            float _4121 = _4119 + _4113;
            float _4123 = fma(_4107, _312, _4115);
            float _4125 = fma(_4107, _316, _4117);
            float _4127 = _4121 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4129 = _4121 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4131 = -_544;
            float _4133 = _4131 + _4123;
            float _4135 = _4121 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4137 = -_546;
            float _4139 = _4137 + _4125;
            float _4141 = fma(_4133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4127);
            float _4143 = fma(_4133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4129);
            float _4145 = fma(_4133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4135);
            float _4147 = fma(_4139, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4141);
            float _4149 = fma(_4139, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4143);
            float _4151 = fma(_4139, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4145);
            _616 = _4149;
            _618 = _4147;
            _620 = _4151;
            _3987 = _4147;
            _3993 = _4149;
            _3999 = _4151;
            _3955 = _4117;
            _3961 = _4145;
            _3969 = _4115;
            _390 = _4143;
            _204 = _4109;
        }
        float _4153 = _616;
        float _4155 = _618;
        float _4157 = _620;
        float _4159 = _3987;
        float _4161 = _3993;
        float _4163 = _3999;
        float _4165 = _3955;
        float _4167 = _3961;
        float _4169 = _3969;
        float _4171 = _390;
        float _4173 = _204;
        float _4175 = _4153 * _4153;
        float _4177 = rsqrt(_3913);
        float _4179 = fma(_4155, _4155, _4175);
        float _4181 = fma(_4157, _4157, _4179);
        float _4183 = sqrt(_4181);
        float _4185 = _3877 * _4177;
        float _4187 = _3885 * _4177;
        float _4189 = _3893 * _4177;
        bool _4191 = _4183 > 0.0;
        float _4193 = _4165;
        float _4195 = _4167;
        float _4197 = _4169;
        _392 = _4171;
        _3951 = _4187;
        _622 = _4153;
        _206 = _4173;
        if (!_4191)
        {
            _4193 = _3931;
        }
        float _4199 = _4193;
        _3957 = _4199;
        if (!_4191)
        {
            _4195 = _3935;
        }
        float _4201 = _4195;
        _3963 = _4201;
        if (!_4191)
        {
            _4197 = _3945;
        }
        float _4203 = _4197;
        bool _4205 = !_4191;
        _3971 = _4203;
        if (!_4205)
        {
            float _4207 = rsqrt(_4181);
            float _4209 = _4207 * _4153;
            float _4211 = _4207 * _4155;
            float _4213 = _4207 * _4157;
            float _4215 = _4187 * _4209;
            float _4217 = fma(_4185, _4211, _4215);
            float _4219 = fma(_4189, _4213, _4217);
            float _4221 = _4219 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4223 = fma(_4159, _4221, _3931);
            float _4225 = fma(_4161, _4221, _3935);
            float _4227 = fma(_4163, _4221, _3945);
            _3957 = _4223;
            _3963 = _4225;
            _3971 = _4227;
            _392 = _4215;
        }
    }
    float _4229 = _3957;
    float _4231 = _3963;
    float _4233 = _3971;
    float _4235 = _392;
    float _4237 = _3951;
    float _4239 = _622;
    float _4241 = _206;
    float _4243 = _3939 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4245 = fma(_3773, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4243);
    float _4247 = _3939 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4249 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4251 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4253 = _4249 || _4251;
    bool _4255 = isnan(0.5);
    bool _4257 = _4253 || _4255;
    float _4259 = fma(_3835, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4245);
    float _4261 = fma(_3773, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4247);
    float _4263 = _4259 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4265 = fma(_3835, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4261);
    bool _4267 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4269 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4271 = _4267 || _4269;
    bool _4273 = isnan(0.5);
    bool _4275 = _4271 || _4273;
    float _4277 = 1.0 / _4263;
    float _4279 = _4265 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4281 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4283 = _4279;
    float _4285 = _4235;
    float _4287 = _4259;
    float _4289 = _4237;
    float _4291 = _4239;
    float _4293 = _4241;
    if (_4257)
    {
        _4281 = _4229;
    }
    float _4295 = _4281;
    float _4297 = _4279 + _4263;
    float _4299 = _4295;
    if (_4257)
    {
        _4283 = _4231;
    }
    float _4301 = _4283;
    float _4303 = _4301;
    if (_4257)
    {
        _4285 = _4233;
    }
    float _4305 = _4285;
    float _4307 = _4305;
    if (!_4257)
    {
        float _4309 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4311 = _3939 + _4309;
        float _4313 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4315 = _3773 + _4313;
        float _4317 = -_3773;
        float _4319 = _4317 + _4229;
        float _4321 = -_3939;
        float _4323 = _4321 + _4231;
        float _4325 = _4311 * _4311;
        float _4327 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4329 = _3835 + _4327;
        float _4331 = -_3835;
        float _4333 = _4331 + _4233;
        float _4335 = fma(_4315, _4315, _4325);
        float _4337 = fma(_4329, _4329, _4335);
        float _4339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4341 = sqrt(_4337);
        float _4343 = precise::min(_4341, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4345 = _4343 * _4339;
        float _4347 = fma(_4319, _4345, _3773);
        float _4349 = fma(_4323, _4345, _3939);
        float _4351 = fma(_4333, _4345, _3835);
        _4303 = _4349;
        _4299 = _4347;
        _4307 = _4351;
        _4287 = _4341;
    }
    float _4353 = _4303;
    float _4355 = _4299;
    float _4357 = _4307;
    float _4359 = _4287;
    float _4361 = _4359;
    if (_4275)
    {
        _4361 = 1.0;
    }
    float _4363 = _4361;
    float _4365 = _4297 * _4277;
    float _4367 = _4365 * 0.5;
    float _4369 = _4363;
    float _4371 = _4367;
    if (!_4275)
    {
        float _4373 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4375 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4377 = fma(_4367, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4375);
        float _4379 = _4373 * 0.15915493667125701904296875;
        float _4381 = _4379 * 6.283185482025146484375;
        float _4383 = cos(_4381);
        float _4385 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4387 = _4385 * 0.15915493667125701904296875;
        float _4389 = _4379 * 6.283185482025146484375;
        float _4391 = sin(_4389);
        float _4393 = 1.0 / _4383;
        float _4395 = _4387 * 6.283185482025146484375;
        float _4397 = cos(_4395);
        float _4399 = _4391 * _4393;
        float _4401 = 1.0 / _4377;
        float _4403 = _4397 * _4399;
        float _4405 = _4387 * 6.283185482025146484375;
        float _4407 = sin(_4405);
        float _4409 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4411 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4409;
        float _4413 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4415 = _4401 * _4413;
        float _4417 = 1.0 / _4403;
        float _4419 = 1.0 / _4411;
        float _4421 = _4407 * _4417;
        float _4423 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4425 = fma(_4421, _4415, _4423);
        float _4427 = _4425 * _4419;
        float _4429 = precise::clamp(_4427, 0.0, 1.0);
        _4369 = _4429;
    }
    float _4431 = _4369;
    float _4433 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4435 = _4353 + _4433;
    float _4437 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4439 = _4355 + _4437;
    float _4441 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4443 = _4357 + _4441;
    float _4445 = _4435 * _4435;
    float _4447 = fma(_4439, _4439, _4445);
    float _4449 = fma(_4443, _4443, _4447);
    float _4451 = rsqrt(_4449);
    float _4453 = sqrt(_4449);
    float _4455 = _4451 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4457 = _4439 * _4455;
    float _4459 = _4443 * _4455;
    float _4461 = _4457 * _4457;
    float _4463 = _4459 * _4459;
    float _4465 = _4461 + _4463;
    float _4467 = sqrt(_4465);
    bool _4469 = _4467 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4471 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4473 = _4467 + _4471;
    float _4475 = _4451;
    float _4477 = _4465;
    float _4479 = _4473;
    float _4481 = _4435;
    if (_4469)
    {
        float _4483 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4475 = _4483;
    }
    float _4485 = _4475;
    if (_4469)
    {
        float _4487 = rsqrt(_4465);
        _4477 = _4487;
    }
    float _4489 = _4477;
    if (_4469)
    {
        float _4491 = _4473 * _4485;
        _4479 = _4491;
    }
    float _4493 = _4479;
    if (_4469)
    {
        float _4495 = _4493 * 0.15915493667125701904296875;
        _4289 = _4495;
    }
    float _4497 = _4289;
    float _4499 = _4443;
    if (_4469)
    {
        float _4501 = _4497 * 6.283185482025146484375;
        float _4503 = sin(_4501);
        _4499 = _4503;
    }
    float _4505 = _4499;
    float _4507 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4509 = precise::max(0.0, _4507);
    float _4511 = _4485;
    float _4513 = _4509;
    if (_4469)
    {
        float _4515 = _4497 * 6.283185482025146484375;
        float _4517 = cos(_4515);
        _4511 = _4517;
    }
    float _4519 = _4511;
    float _4521 = -_4455;
    float _4523 = -_4509;
    float _4525 = fma(_4435, _4521, _4523);
    if (_4469)
    {
        float _4527 = _4525 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4481 = _4527;
    }
    float _4529 = _4481;
    float _4531 = _4505;
    float _4533 = _4529;
    if (_4469)
    {
        float _4535 = fma(_4505, _4529, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4371 = _4535;
    }
    float _4537 = _4371;
    float _4539 = _4537;
    if (!_4469)
    {
        _4531 = _4457;
    }
    float _4541 = _4531;
    float _4543 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4545 = fma(_4453, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4543);
    float _4547 = precise::clamp(_4545, 0.0, 1.0);
    float _4549 = _4541;
    if (!_4469)
    {
        _4533 = _4525;
    }
    float _4551 = _4533;
    float _4553 = _4551;
    float _4555 = _4519;
    if (_4469)
    {
        float _4557 = _4519 + (-1.0);
        _4513 = _4557;
    }
    float _4559 = _4513;
    float _4561 = _4559;
    if (_4469)
    {
        float _4563 = _4489 * _4537;
        _4291 = _4563;
    }
    float _4565 = _4291;
    if (!_4469)
    {
        _4539 = _4461;
    }
    float _4567 = _4539;
    float _4569 = _4353 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4571 = _4567;
    if (_4469)
    {
        float _4573 = _4559 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4293 = _4573;
    }
    float _4575 = _4293;
    if (_4469)
    {
        float _4577 = _4457 * _4565;
        _4549 = _4577;
    }
    float _4579 = _4549;
    if (!_4469)
    {
        _4561 = _4459;
    }
    float _4581 = _4561;
    float _4583 = _4581;
    if (_4469)
    {
        float _4585 = _4459 * _4565;
        _4583 = _4585;
    }
    float _4587 = _4583;
    if (_4469)
    {
        float _4589 = fma(_4525, _4519, _4575);
        _4553 = _4589;
    }
    float _4591 = _4553;
    if (_4469)
    {
        float _4593 = _4579 * _4579;
        _4571 = _4593;
    }
    float _4595 = _4571;
    if (!_4469)
    {
        _4555 = _4463;
    }
    float _4597 = _4555;
    float _4599 = _4597;
    if (_4469)
    {
        float _4601 = _4587 * _4587;
        _4599 = _4601;
    }
    float _4603 = _4599;
    float _4605 = -_4547;
    float _4607 = _4605 + 1.0;
    float _4609 = fma(_4591, _4591, _4595);
    float _4611 = _4353 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4613 = _4609 + _4603;
    float _4615 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4569);
    float _4617 = _4353 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4619 = abs(_4607);
    float _4621 = log2(_4619);
    float _4623 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4625 = fma(_4357, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4615);
    float _4627 = _4353 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4629 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4617);
    float _4631 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4611);
    float _4633 = _4625 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4635 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4627);
    float _4637 = rsqrt(_4613);
    float _4639 = fma(_4357, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4629);
    float _4641 = fma(_4357, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4631);
    float _4643 = fma(_4357, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4635);
    float _4645 = _4639 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4647 = _4641 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4649 = _4643 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4651 = _4621 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4653 = _4633 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4655 = -_4653;
    float _4657 = fma(_4655, _4623, 1.0);
    float _4659 = _4645 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4661 = exp2(_4651);
    float _4663 = _4637 * _4579;
    float _4665 = _4637 * _4591;
    float _4667 = fma(_4649, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4659);
    float _4669 = _4637 * _4587;
    float _4671 = _4663 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4673 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4667);
    float _4675 = log2(_4657);
    float _4677 = -_4671;
    float _4679 = fma(_4665, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4677);
    float _4681 = _4645 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4683 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4673);
    float _4685 = -_4669;
    float _4687 = fma(_4685, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4679);
    float _4689 = _4645 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4691 = fma(_4649, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4681);
    float _4693 = 1.0 / _4683;
    float _4695 = fma(_4687, -0.5, 0.5);
    float _4697 = fma(_4649, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4689);
    float _4699 = fma(_4687, 0.5, 0.5);
    float _4701 = _4665 + 1.0;
    float _4703 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4691);
    float _4705 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4697);
    float _4707 = fma(_4699, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4709 = sqrt(_4695);
    float _4711 = -_4665;
    float _4713 = fma(_4661, _4701, _4711);
    float _4715 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4705);
    float _4717 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4703);
    float _4719 = fma(_4699, _4707, -0.212114393711090087890625);
    float _4721 = _4675 * 0.693147182464599609375;
    float _4723 = fma(_4713, 0.5, 0.5);
    float _4725 = _4715 * _4693;
    float _4727 = _4717 * _4693;
    float _4729 = fma(_4699, _4719, 1.570728778839111328125);
    float _4731 = _4721 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4733 = fma(_4725, 0.5, 0.5);
    float _4735 = fma(_4727, -0.5, 0.5);
    float _4737 = _4709 * 0.636619746685028076171875;
    float3 _12191 = float3(_4733, _4735, _4731);
    float _4739 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12191, float3(0.0), isnan(_12191)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12191, float3(0.0), isnan(_12191)), level(0.0)).x;
    float3 _12202 = float3(_4733, _4735, _4731);
    float4 _4742 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12202, float3(0.0), isnan(_12202)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12202, float3(0.0), isnan(_12202)), level(0.0)).xyzw;
    float _4744 = _4742.x;
    float _4746 = _4742.y;
    float _4748 = _4742.z;
    float _4750 = _4742.w;
    float _4752 = -_4729;
    float _4754 = fma(_4737, _4752, 1.0);
    float2 _12224 = float2(_4754, _4723);
    float3 _4758 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12224, float2(0.0), isnan(_12224)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12224, float2(0.0), isnan(_12224)), level(0.0)).xyz;
    float _4760 = _4758.x;
    float _4762 = _4758.y;
    float _4764 = _4758.z;
    float _4766 = _4621 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4768 = _4645 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_91.x = _3773;
    out.m_91.y = _3939;
    out.m_91.z = _3835;
    bool _4770 = _4453 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4772 = isnan(_4453);
    bool _4774 = _4770 || _4772;
    bool _4776 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4778 = _4774 || _4776;
    float _4780 = fma(_4649, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4768);
    float _4782 = exp2(_4766);
    float _4784 = _4715 + _4683;
    out.m_93.x = _4355;
    out.m_93.y = _4353;
    out.m_93.z = _4357;
    float _4786 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4780);
    float _4788 = _4683 * 0.5;
    float _4790 = _4784 * 0.5;
    float _4792 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4786);
    float _4794 = fma(_4717, -0.5, _4788);
    float _4796 = _4792 + _4683;
    out.gl_Position.x = _4715;
    out.gl_Position.y = _4717;
    out.gl_Position.z = _4792;
    out.gl_Position.w = _4683;
    float _4798 = _4796 * 0.5;
    float _4800 = -_4782;
    float _4802 = _4800 + 1.0;
    float _4804 = _4802 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_95.x = _4790;
    out.m_95.y = _4794;
    out.m_95.z = _4798;
    out.m_95.w = _4683;
    float _4806 = -_4804;
    float _4808 = _4806 + 1.0;
    float _4810 = _4792;
    float _4812 = _4717;
    float _4814 = _4715;
    if (!_4778)
    {
        _4810 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4816 = _4810;
    float _4818 = _4816;
    float _4820 = _4816;
    if (!_4778)
    {
        _4812 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4822 = _4812;
    float _4824 = _4822;
    float _4826 = _4822;
    if (!_4778)
    {
        _4814 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4828 = _4814;
    float _4830 = _4804 * _4739;
    float _4832 = _4750 * _4808;
    float _4834 = _4431 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4836 = _4750 * _4830;
    float _4838 = _4764 * _4830;
    float _4840 = fma(_4760, _4836, _4744);
    float _4842 = fma(_4762, _4836, _4746);
    float _4844 = fma(_4750, _4838, _4748);
    out.m_97.x = _4840;
    out.m_97.y = _4842;
    out.m_97.z = _4844;
    out.m_97.w = _4832;
    bool _4846 = !_4778;
    float _4848 = _4828;
    float _4850 = _4828;
    if (!_4846)
    {
        bool _4852 = _4453 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4854 = isnan(_4453);
        bool _4856 = _4852 || _4854;
        bool _4858 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4860 = _4856 || _4858;
        if (!_4860)
        {
            float _4862 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4864 = _4453 + _4862;
            float _4866 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4868 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4866;
            float _4870 = 1.0 / _4868;
            float _4872 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4874 = _4872 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4876 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4878 = _4876 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4880 = _4864 * _4870;
            float _4882 = precise::clamp(_4880, 0.0, 1.0);
            float _4884 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4886 = _4884 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4888 = fma(_4882, _4878, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4890 = fma(_4882, _4886, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4892 = fma(_4882, _4874, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4826 = _4892;
            _4820 = _4890;
            _4850 = _4888;
            _4894 = true;
        }
        else
        {
            bool _4896 = _4453 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4898 = isnan(_4453);
            bool _4900 = _4896 || _4898;
            bool _4902 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4904 = _4900 || _4902;
            if (!_4904)
            {
                _4818 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4906 = _4818;
            _4820 = _4906;
            if (!_4904)
            {
                _4824 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4908 = _4824;
            _4826 = _4908;
            if (!_4904)
            {
                _4848 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4910 = _4848;
            bool _4912 = !_4904;
            _4850 = _4910;
            if (!_4912)
            {
                bool _4914 = _4453 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4916 = isnan(_4453);
                bool _4918 = _4914 || _4916;
                bool _4920 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4922 = _4918 || _4920;
                if (!_4922)
                {
                    float _4924 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4926 = _4453 + _4924;
                    float _4928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4930 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4928;
                    float _4932 = 1.0 / _4930;
                    float _4934 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4936 = _4934 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4938 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4940 = _4938 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4942 = _4926 * _4932;
                    float _4944 = precise::clamp(_4942, 0.0, 1.0);
                    float _4946 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4948 = _4946 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4950 = fma(_4944, _4940, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4952 = fma(_4944, _4948, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4954 = fma(_4944, _4936, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4826 = _4954;
                    _4820 = _4952;
                    _4850 = _4950;
                    _4894 = true;
                }
                else
                {
                    _4826 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4820 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4850 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4894 = false;
    float _4956 = _4826;
    float _4958 = _4820;
    float _4960 = _4850;
    float _4962 = _4834 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_99.x = 0.0;
    float _4964 = _4956 * 0.586610972881317138671875;
    bool _4966 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _4962;
    float _4968 = fma(_4958, 0.298911988735198974609375, _4964);
    bool _4970 = _4431 > 0.0;
    bool _4972 = isnan(_4431);
    bool _4974 = _4970 || _4972;
    bool _4976 = isnan(0.0);
    bool _4978 = _4974 || _4976;
    float _4980 = fma(_4960, 0.114477999508380889892578125, _4968);
    float _4982 = -_4980;
    float _4984 = _4982 + _4958;
    float _4986 = -_4980;
    float _4988 = _4986 + _4956;
    float _4990 = -_4980;
    float _4992 = _4990 + _4960;
    float _4994 = fma(_4984, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4980);
    float _4996 = fma(_4988, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4980);
    float _4998 = fma(_4992, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4980);
    bool _5000 = !_4966;
    if (!_5000)
    {
        float _5002 = -_4353;
        float _5004 = _5002 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5006 = -_4355;
        float _5008 = _5006 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5010 = -_4357;
        float _5012 = _5010 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5014 = _5004 * _5004;
        float _5016 = fma(_5008, _5008, _5014);
        float _5018 = fma(_5012, _5012, _5016);
        float _5020 = sqrt(_5018);
        float _5022 = rsqrt(_5018);
        float _5024 = -_5020;
        float _5026 = _5024 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5028 = _5026 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5030 = precise::clamp(_5028, 0.0, 1.0);
        float _5032 = _5008 * _5022;
        float _5034 = _5004 * _5022;
        float _5036 = abs(_5030);
        float _5038 = log2(_5036);
        float _5040 = _5012 * _5022;
        float _5042 = _5032 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5044 = _3901 * _5034;
        float _5046 = -_5034;
        float _5048 = -_5042;
        float _5050 = fma(_5046, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5048);
        float _5052 = fma(_3817, _5032, _5044);
        float _5054 = -_5040;
        float _5056 = fma(_5054, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5050);
        float _5058 = fma(_3755, _5040, _5052);
        float _5060 = precise::clamp(_5058, 0.0, 1.0);
        float _5062 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5064 = _5056 + _5062;
        float _5066 = _5038 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5068 = _5064 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5070 = precise::clamp(_5068, 0.0, 1.0);
        float _5072 = exp2(_5066);
        float _5074 = _5072 * _5070;
        float _5076 = _5060 * _5074;
        float _5078 = _5076 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5080 = _5076 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5082 = _5076 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _5078;
        out.m_99.y = _5080;
        out.m_99.z = _5082;
    }
    out.m_71.x = _4994;
    out.m_71.y = _4996;
    out.m_71.z = _4998;
    if (_4978)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _5084 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5084;
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
    bool _4894 = false;
    bool _1262 = false;
    bool _1052 = false;
    bool _946 = false;
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
        float _5140 = as_type<float>(_132);
        out.gl_Position.z = _5140;
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
        float _5212 = as_type<float>(_172);
        out.gl_Position.z = _5212;
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
    bool _820 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _822 = isnan(_814);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _836 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _838 = isnan(_814);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = 1.0 / _818;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _850;
    float _854 = -_830;
    float _856 = _854 + 1.0;
    bool _858 = _814 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _860 = isnan(_814);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    bool _870 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _872 = _846 * _856;
    float _874 = -_846;
    float _876 = _874 + 1.0;
    float _878 = 1.0 / _834;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _884 = _852 * _848;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _888 = _814 + _886;
    float _890 = -_868;
    float _892 = _890 + 1.0;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _896 = _814 + _894;
    float _898 = fma(_884, _888, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _900 = _830 * _892;
    float _902 = _882 * _878;
    float _904 = _898 * _872;
    float _906 = fma(_902, _896, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _908 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[115].x, _904);
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _912 = fma(_906, _900, _908);
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _918 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[117].x, _912);
    float _920 = _910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _926 = _918 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _920;
    out.m_61.y = _922;
    out.m_61.z = _924;
    out.m_61.w = _926;
    bool _928 = !_870;
    float _944;
    if (!_928)
    {
        float _930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _932 = _174 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[11].z, _144);
        float _936 = _934 * _930;
        float _938 = floor(_936);
        float _940 = -_938;
        float _942 = _936 + _940;
        _944 = _942;
        _946 = true;
    }
    else
    {
        _944 = _156;
    }
    _946 = false;
    float _948 = _944;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _952 = _948 + _950;
    bool _954 = _948 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _956 = isnan(_948);
    bool _958 = _954 || _956;
    bool _960 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _962 = _958 || _960;
    float _964 = float(_962);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _966;
    bool _970 = _948 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _972 = isnan(_948);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = 1.0 / _968;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _984;
    bool _988 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _990;
    float _994 = _952 * _982;
    float _996 = -_964;
    float _998 = _996 + 1.0;
    float _1000 = fma(_986, _994, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1002 = fma(_992, _994, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1004;
    float _1008 = _980 * _998;
    float _1010 = -_980;
    float _1012 = _1010 + 1.0;
    float _1014 = fma(_1006, _994, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1016 = _1000 * _1008;
    float _1018 = _1014 * _1008;
    float _1020 = _1002 * _1008;
    float _1022 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1016);
    float _1024 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1018);
    float _1026 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1020);
    float _1028 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1022);
    float _1030 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1024);
    float _1032 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1026);
    bool _1034 = !_988;
    float _1050;
    if (!_1034)
    {
        float _1036 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1038 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1040 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _1042 = _1040 * _1036;
        float _1044 = floor(_1042);
        float _1046 = -_1044;
        float _1048 = _1042 + _1046;
        _1050 = _1048;
        _1052 = true;
    }
    else
    {
        _1050 = _156;
    }
    _1052 = false;
    float _1054 = _1050;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1060;
    bool _1064 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1066 = isnan(_1054);
    bool _1068 = _1064 || _1066;
    bool _1070 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1072 = _1068 || _1070;
    float _1074 = float(_1072);
    float _1076 = 1.0 / _1058;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1086 = -_1074;
    float _1088 = _1086 + 1.0;
    bool _1090 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1092 = isnan(_1054);
    bool _1094 = _1090 || _1092;
    bool _1096 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1098 = _1094 || _1096;
    float _1100 = float(_1098);
    float _1102 = 1.0 / _1080;
    bool _1104 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1106 = isnan(_1054);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    bool _1116 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1118 = _1114 * _1088;
    float _1120 = -_1114;
    float _1122 = _1120 + 1.0;
    float _1124 = _1062 * _1076;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1128 = _1054 + _1126;
    float _1130 = 1.0 / _1084;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1136 = _1100 * _1122;
    float _1138 = fma(_1124, _1128, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1144 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1146 = isnan(_1054);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1152 = _1148 || _1150;
    float _1154 = float(_1152);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1158 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1156;
    float _1160 = _1134 * _1102;
    float _1162 = 1.0 / _1142;
    float _1164 = _1138 * _1136;
    float _1166 = -_1154;
    float _1168 = _1166 + 1.0;
    float _1170 = -_1100;
    float _1172 = _1170 + 1.0;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1176 = _1174 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1178 = _1074 * _1168;
    bool _1180 = _1054 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1182 = isnan(_1054);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = _1158 * _1130;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1196 = _1054 + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1200 = _1054 + _1198;
    float _1202 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1164);
    float _1204 = -_1190;
    float _1206 = _1204 + 1.0;
    float _1208 = fma(_1160, _1196, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1210 = fma(_1192, _1200, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1214 = _1054 + _1212;
    float _1216 = _1176 * _1162;
    float _1218 = fma(_1208, _1118, _1202);
    float _1220 = _1154 * _1206;
    float _1222 = _1030 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1224 = fma(_1216, _1214, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1226 = fma(_1210, _1178, _1218);
    float _1228 = _1028 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1230 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1232 = fma(_1224, _1220, _1226);
    float _1234 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1236 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1238 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1232);
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1242 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _1236;
    out.m_63.y = _1230;
    out.m_63.z = _1240;
    out.m_63.w = _1242;
    bool _1244 = !_1116;
    float _1260;
    if (!_1244)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1248 = _174 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1250 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _1252 = _1250 * _1246;
        float _1254 = floor(_1252);
        float _1256 = -_1254;
        float _1258 = _1252 + _1256;
        _1260 = _1258;
        _1262 = true;
    }
    else
    {
        _1260 = _156;
    }
    _1262 = false;
    float _1264 = _1260;
    float _1266 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1268 = int(_1266);
    float _1270 = in.m_53.y;
    float _1272 = _600 * _788;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1276 = _1274 != 0;
    float _1278 = in.m_53.z;
    float _1280 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1282 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1284 = int(_1282);
    float _1286 = in.m_65.w;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1290 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1292 = int(_1290);
    float _1294 = float(_1268);
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1300 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1296);
    float _1302 = 1.0 / _1294;
    float _1304 = float(uint(_1284));
    float _1306 = float(_1284);
    float _1308 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1310 = _1284 == 0;
    float _1312 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _1314 = _1284 + (-1);
    float _1316 = 1.0 / _1304;
    float _1318 = float(_1292);
    out.m_67.w = _1286;
    float _1320 = _144 * _1302;
    float _1322 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1324 = int(_1322);
    int _1326 = ~_1284;
    int _1328 = _1326 + 1;
    float _1330 = -_1308;
    float _1332 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1330);
    float _1334 = -_1312;
    float _1336 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1334);
    int _1338 = as_type<int>(_1316) + (-2);
    float _1340 = trunc(_1320);
    int _1342 = int(_1340);
    float _1344 = 1.0 / _1318;
    float _1346 = float(uint(_1324));
    int _1348 = ~_1324;
    int _1350 = _1348 + 1;
    float _1352 = float(uint(_1342));
    float _1354 = 1.0 / _1346;
    float _1356 = as_type<float>(_1338) * _1352;
    float _1358 = _144 * _1344;
    float _1360 = trunc(_1356);
    float _1362 = precise::max(_1360, 0.0);
    uint _1365 = uint(_1362);
    float _1367 = trunc(_1358);
    int _1369 = int(_1367);
    int _1371 = ~_1284;
    int _1373 = _1371 + 1;
    int _1375 = _1328 * int(_1365);
    int _1377 = _1375 + _1342;
    float _1379 = float(uint(_1377));
    float _1381 = float(uint(_1369));
    float _1383 = as_type<float>(_1338) * _1379;
    float _1385 = _1379;
    float _1387 = _1278;
    if (_1276)
    {
        _1385 = 1.0;
    }
    float _1389 = _1385;
    float _1391 = _1389;
    if (!_1276)
    {
        _1391 = 7.345489978790283203125;
    }
    float _1393 = _1391;
    float _1395 = trunc(_1383);
    float _1397 = precise::max(_1395, 0.0);
    uint _1399 = uint(_1397);
    float _1401 = _1393 * _174;
    int _1403 = as_type<int>(_1354) + (-2);
    float _1405 = floor(_1401);
    float _1407 = as_type<float>(_1403) * _1381;
    int _1409 = int(_1365) + int(_1399);
    float _1411 = trunc(_1407);
    float _1413 = precise::max(_1411, 0.0);
    uint _1415 = uint(_1413);
    float _1417 = float(_1342);
    int _1419 = _1373 * _1409;
    int _1421 = _1419 + _1342;
    int _1423 = ~_1324;
    int _1425 = _1423 + 1;
    bool _1427 = _1417 >= _1306;
    bool _1429 = isnan(_1417);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan(_1306);
    bool _1435 = _1431 || _1433;
    float _1437 = float(_1435);
    float _1439 = -_1405;
    float _1441 = _1401 + _1439;
    bool _1443 = uint(_1421) >= uint(_1284);
    bool _1445 = !_1443;
    int _1447 = _1445 ? 0 : (-1);
    float _1449 = trunc(_1437);
    int _1451 = int(_1449);
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1455 = _1453 != 0;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1459 = _1457 != 0;
    int _1461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1463 = _1461 != 0;
    int _1465 = ~_1409;
    int _1467 = _1465 + _1447;
    int _1469 = _1467 + 1;
    float _1471 = _1441 * _1306;
    int _1473 = _1425 * int(_1415);
    int _1475 = _1473 + _1369;
    int _1477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1479 = _1477 != 0;
    float _1481 = _156 * _1306;
    int _1483 = _1284 * _1469;
    int _1485 = _1483 + _1342;
    float _1487 = trunc(_1471);
    int _1489 = int(_1487);
    float _1491 = float(uint(_1475));
    bool _1493 = !_1479;
    int _1495 = _1493 ? 0 : 1;
    bool _1497 = !_1310;
    float _1499 = _1497 ? as_type<float>(_1485) : as_type<float>(0xffffffffu /* nan */);
    float _1501 = as_type<float>(_1403) * _1491;
    int _1503 = ~_1451;
    int _1505 = _1503 + 1;
    int _1507 = _1505 + 1;
    float _1509 = trunc(_1481);
    int _1511 = int(_1509);
    bool _1513 = !_1455;
    int _1515 = _1513 ? 0 : 1;
    int _1517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1519 = _1517 != 0;
    int _1521 = as_type<int>(_1499) * _1507;
    bool _1523 = !_1459;
    int _1525 = _1523 ? 0 : 1;
    int _1527 = abs(_1495);
    float _1529 = trunc(_1501);
    float _1531 = precise::max(_1529, 0.0);
    uint _1533 = uint(_1531);
    int _1535 = abs(_1525);
    int _1537 = _1451 * _1314;
    int _1539 = _1537 + _1521;
    int _1541 = abs(_1515);
    int _1543 = _1489 * _1527;
    int _1545 = _1543 + _1342;
    float _1547 = as_type<float>(_1507);
    float _1549 = _1499;
    if (_1519)
    {
        _1547 = _174;
    }
    float _1551 = _1547;
    float _1553 = _1551;
    if (_1519)
    {
        _1549 = 1.0;
    }
    float _1555 = _1549;
    int _1557 = _1539 * _1535;
    float _1559 = _1555;
    if (!_1519)
    {
        _1553 = _1270;
    }
    float _1561 = _1553;
    if (!_1519)
    {
        _1559 = 1.2345600128173828125;
    }
    float _1563 = _1559;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1567 = _1565 != 0;
    float _1569 = _1561 * _1563;
    bool _1571 = !_1463;
    int _1573 = _1571 ? 0 : 1;
    bool _1575 = !_1567;
    int _1577 = _1575 ? 0 : 1;
    int _1579 = _1511 * _1541;
    int _1581 = _1579 + _1557;
    int _1583 = abs(_1573);
    float _1585 = floor(_1569);
    int _1587 = int(_1415) + int(_1533);
    int _1589 = ~_1324;
    int _1591 = _1589 + 1;
    int _1593 = _1545 * _1583;
    int _1595 = _1593 + _1581;
    int _1597 = abs(_1577);
    float _1599 = float(_1324);
    int _1601 = _1591 * _1587;
    int _1603 = _1601 + _1369;
    float _1605 = float(_1369);
    int _1607 = ~_1284;
    int _1609 = _1607 + 1;
    bool _1611 = _1605 >= _1599;
    bool _1613 = isnan(_1605);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(_1599);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    int _1623 = _1489 * _1597;
    int _1625 = _1623 + _1595;
    bool _1627 = uint(_1603) >= uint(_1324);
    float _1629 = -_1585;
    float _1631 = _1569 + _1629;
    int _1633 = 0;
    int _1635 = _1587;
    if (_1519)
    {
        _1633 = 0;
    }
    int _1637 = _1633;
    float _1639 = trunc(_1621);
    int _1641 = int(_1639);
    float _1643 = float(uint(_1625));
    bool _1645 = !_1627;
    int _1647 = _1645 ? 0 : (-1);
    int _1649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1651 = _1649 != 0;
    int _1653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1655 = _1653 != 0;
    int _1657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1659 = _1657 != 0;
    int _1661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1663 = _1661 != 0;
    float _1665 = as_type<float>(_1338) * _1643;
    int _1667 = ~_1587;
    int _1669 = _1667 + _1647;
    int _1671 = _1669 + 1;
    bool _1673 = _1284 == 0;
    bool _1675 = !_1655;
    int _1677 = _1675 ? 0 : 1;
    int _1679 = _1324 * _1671;
    int _1681 = _1679 + _1369;
    bool _1683 = _1324 == 0;
    float _1685 = trunc(_1665);
    float _1687 = precise::max(_1685, 0.0);
    uint _1689 = uint(_1687);
    int _1691 = abs(_1677);
    int _1693 = ~_1641;
    int _1695 = _1693 + 1;
    int _1697 = _1695 + 1;
    bool _1699 = !_1683;
    int _1701 = _1699 ? _1681 : (-1);
    float _1703 = _1631 * _1599;
    float _1705 = _156 * _1599;
    bool _1707 = !_1651;
    int _1709 = _1707 ? 0 : 1;
    int _1711 = _1701 * _1697;
    int _1713 = _1324 + (-1);
    float _1715 = trunc(_1703);
    int _1717 = int(_1715);
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1721 = _1719 != 0;
    int _1723 = abs(_1709);
    int _1725 = _1641 * _1713;
    int _1727 = _1725 + _1711;
    bool _1729 = !_1659;
    int _1731 = _1729 ? 0 : 1;
    int _1733 = _1609 * int(_1689);
    int _1735 = _1733 + _1625;
    bool _1737 = !_1721;
    int _1739 = _1737 ? 0 : 1;
    float _1741 = trunc(_1705);
    int _1743 = int(_1741);
    bool _1745 = !_1663;
    int _1747 = _1745 ? 0 : 1;
    int _1749 = _1727 * _1691;
    float _1751 = float(uint(_1735));
    int _1753 = abs(_1739);
    int _1755 = abs(_1731);
    float _1757 = as_type<float>(_1338) * _1751;
    float _1759 = trunc(_1757);
    float _1761 = precise::max(_1759, 0.0);
    uint _1763 = uint(_1761);
    int _1765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1767 = _1765 != 0;
    int _1769 = _1717 * _1753;
    int _1771 = _1769 + _1369;
    int _1773 = abs(_1747);
    int _1775 = _1743 * _1723;
    int _1777 = _1775 + _1749;
    int _1779 = ~_1324;
    int _1781 = _1779 + 1;
    float _1783 = float(uint(_1771));
    int _1785 = _1771 * _1755;
    int _1787 = _1785 + _1777;
    int _1789 = _1637;
    int _1791 = as_type<int>(_1757);
    bool _1793 = _1721;
    float _1795 = as_type<float>(_1689);
    if (!_1519)
    {
        _1789 = 2;
    }
    int _1797 = _1789;
    int _1799 = _1717 * _1773;
    int _1801 = _1799 + _1787;
    if (_1767)
    {
        float _1803 = -_352;
        float _1805 = _1803 + 1.0;
        _1791 = as_type<int>(_1805);
    }
    int _1807 = _1791;
    if (_1767)
    {
        bool _1809 = _174 > 0.5;
        _1793 = _1809;
    }
    bool _1811 = _1793;
    float _1813 = as_type<float>(_1403) * _1783;
    int _1815 = int(_1689) + int(_1763);
    float _1817 = float(uint(_1801));
    float _1819 = trunc(_1813);
    float _1821 = precise::max(_1819, 0.0);
    uint _1823 = uint(_1821);
    if (!_1767)
    {
        _1795 = _352;
    }
    float _1825 = _1795;
    float _1827 = float(uint(_1545));
    float _1829 = as_type<float>(_1403) * _1817;
    float _1831 = _1825;
    if (_1767)
    {
        float _1833 = _1811 ? as_type<float>(_1807) : _352;
        _1831 = _1833;
    }
    float _1835 = _1831;
    float _1837 = in.m_53.w;
    int _1839 = ~_1284;
    int _1841 = _1839 + 1;
    float _1843 = as_type<float>(_1338) * _1827;
    float _1845 = trunc(_1829);
    float _1847 = precise::max(_1845, 0.0);
    uint _1849 = uint(_1847);
    int _1851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1853 = _1851 != 0;
    int _1855 = _1841 * _1815;
    int _1857 = _1855 + _1625;
    bool _1859 = _1270 > 0.5;
    float _1861 = trunc(_1843);
    float _1863 = precise::max(_1861, 0.0);
    uint _1865 = uint(_1863);
    bool _1867 = uint(_1857) >= uint(_1284);
    float _1869 = -_498;
    float _1871 = _1869 + 1.0;
    bool _1873 = !_1867;
    int _1875 = _1873 ? 0 : (-1);
    if (_1853)
    {
        float _1877 = -_352;
        float _1879 = _1877 + 1.0;
        _1635 = as_type<int>(_1879);
    }
    int _1881 = _1635;
    int _1883 = _1859 ? as_type<int>(_1871) : as_type<int>(_498);
    int _1885 = _1781 * int(_1849);
    int _1887 = _1885 + _1801;
    bool _1889 = _1278 > 0.5;
    int _1891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1893 = _1891 != 0;
    float _1895 = float(uint(_1887));
    int _1897 = ~_1284;
    int _1899 = _1897 + 1;
    float _1901 = _1893 ? as_type<float>(_1883) : _498;
    float _1903 = as_type<float>(_1403) * _1895;
    float _1905 = _1895;
    if (!_1853)
    {
        _1905 = _352;
    }
    float _1907 = _1905;
    float _1909 = _1907;
    if (_1853)
    {
        float _1911 = _1889 ? as_type<float>(_1881) : _352;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = trunc(_1903);
    float _1917 = precise::max(_1915, 0.0);
    uint _1919 = uint(_1917);
    bool _1921 = _1837 > 0.5;
    int _1923 = _1899 * int(_1865);
    int _1925 = _1923 + _1545;
    int _1927 = ~_1815;
    int _1929 = _1927 + _1875;
    int _1931 = _1929 + 1;
    int _1933 = _1350 * int(_1823);
    int _1935 = _1933 + _1771;
    int _1937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1939 = _1937 != 0;
    float _1941 = float(uint(_1925));
    int _1943 = _1284 * _1931;
    int _1945 = _1943 + _1625;
    int _1947 = _1921 ? as_type<int>(_1871) : as_type<int>(_498);
    float _1949 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1953 = _1951 != 0;
    float _1955 = as_type<float>(_1338) * _1941;
    bool _1957 = !_1673;
    int _1959 = _1957 ? _1945 : (-1);
    float _1961 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1963 = _1953 ? as_type<float>(_1947) : _498;
    float _1965 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1967 = _1959 & 3;
    bool _1969 = _1967 != 0;
    float _1971 = trunc(_1955);
    float _1973 = precise::max(_1971, 0.0);
    uint _1975 = uint(_1973);
    if (_1939)
    {
        float _1977 = _1889 ? _1871 : _498;
        _614 = _1977;
    }
    float _1979 = _614;
    float _1981 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1949);
    int _1983 = int(_1849) + int(_1919);
    int _1985 = ~_1324;
    int _1987 = _1985 + 1;
    float _1989 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1981);
    float _1991 = float(uint(_1935));
    bool _1993 = uint(_1967) > 1u;
    int _1995 = _1987 * _1983;
    int _1997 = _1995 + _1801;
    int _1999 = _1959 & 3;
    bool _2001 = _1999 != 0;
    float _2003 = as_type<float>(_1403) * _1991;
    float _2005 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1961);
    int _2007 = ~_1284;
    int _2009 = _2007 + 1;
    float _2011 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1965);
    int _2013 = _2001 ? 0 : 1;
    float _2015 = trunc(_2003);
    float _2017 = precise::max(_2015, 0.0);
    uint _2019 = uint(_2017);
    bool _2021 = uint(_1997) >= uint(_1324);
    float _2023 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2005);
    int _2025 = ~_2013;
    int _2027 = _2025 + 1;
    int _2029 = _2027 + 1;
    float _2031 = _1989 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2033 = !_2021;
    int _2035 = _2033 ? 0 : (-1);
    float _2037 = fma(_416, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2011);
    bool _2039 = _1967 != 3;
    int _2041 = _2029;
    if (!_1993)
    {
        int _2043 = ~_2013;
        int _2045 = _2043 + 1;
        _2041 = _2045;
    }
    int _2047 = _2041;
    float _2049 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2051 = int(_1865) + int(_1975);
    float _2053 = _2023 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2055 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2057 = _2031 + _2055;
    bool _2059 = uint(_1967) >= 2u;
    float _2061 = _2049 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _2063 = ~_1983;
    int _2065 = _2063 + _2035;
    int _2067 = _2065 + 1;
    int _2069 = _2009 * _2051;
    int _2071 = _2069 + _1545;
    int _2073 = _2059 ? 0 : 1;
    float _2075 = _2057 * _2057;
    int _2077 = int(_1823) + int(_2019);
    int _2079 = _1324 * _2067;
    int _2081 = _2079 + _1801;
    int _2083 = ~_2073;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    float _2089 = _2037 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2091 = _2087;
    int _2093 = int(_1975);
    if (_2039)
    {
        int _2095 = ~_2073;
        int _2097 = _2095 + 1;
        _2091 = _2097;
    }
    int _2099 = _2091;
    float _2101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2103 = _2053 + _2101;
    bool _2105 = !_1683;
    int _2107 = _2105 ? _2081 : (-1);
    float _2109 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2111 = _2089 + _2109;
    if (_1519)
    {
        _2093 = 0;
    }
    int _2113 = _2093;
    float _2115 = fma(_2103, _2103, _2075);
    bool _2117 = uint(_2071) >= uint(_1284);
    float _2119 = -_2089;
    float _2121 = _2119 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _2123 = _2113;
    if (!_1519)
    {
        _2123 = 1;
    }
    int _2125 = _2123;
    float _2127 = fma(_2111, _2111, _2115);
    int _2129 = _2107 & 3;
    bool _2131 = _2129 != 0;
    bool _2133 = !_2117;
    int _2135 = _2133 ? 0 : (-1);
    float _2137 = sqrt(_2127);
    int _2139 = _2107 & 3;
    bool _2141 = _2139 != 0;
    bool _2143 = uint(_2129) >= 2u;
    int _2145 = _2141 ? 0 : 1;
    bool _2147 = uint(_2129) > 1u;
    float _2149 = rsqrt(_2127);
    int _2151 = _2143 ? 0 : 1;
    bool _2153 = _2129 != 3;
    int _2155 = ~_1324;
    int _2157 = _2155 + 1;
    int _2159 = ~_2145;
    int _2161 = _2159 + 1;
    int _2163 = _2161 + 1;
    float _2165 = _2137 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2167 = ~_2151;
    int _2169 = _2167 + 1;
    int _2171 = _2169 + 1;
    int _2173 = _2157 * _2077;
    int _2175 = _2173 + _1771;
    bool _2177 = !_1969;
    int _2179 = _2177 ? 0 : 1;
    int _2181 = _2163;
    int _2183 = _2171;
    if (!_2147)
    {
        int _2185 = ~_2145;
        int _2187 = _2185 + 1;
        _2181 = _2187;
    }
    int _2189 = _2181;
    bool _2191 = uint(_2175) >= uint(_1324);
    if (_2153)
    {
        int _2193 = ~_2151;
        int _2195 = _2193 + 1;
        _2183 = _2195;
    }
    int _2197 = _2183;
    float _2199 = in.m_69.x;
    float _2201 = in.m_69.y;
    float _2203 = in.m_69.z;
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2207 = _2205 != 0;
    bool _2209 = !_2191;
    int _2211 = _2209 ? 0 : (-1);
    bool _2213 = _1270 > 0.5;
    bool _2215 = _2213 && _2207;
    float _2217 = precise::min(_2061, _2165);
    bool _2219 = _1797 != 2;
    int _2221 = ~_2051;
    int _2223 = _2221 + _2135;
    int _2225 = _2223 + 1;
    float _2227 = _2149 * _2217;
    int _2229 = abs(_2047);
    out.m_71.w = _2217;
    float _2231 = 0.0;
    if (!_2207)
    {
        _2231 = _352;
    }
    float _2233 = _2231;
    float _2235 = _2057 * _2227;
    float _2237 = _2111 * _2227;
    float _2239 = _2233;
    if (_2215)
    {
        float _2241 = -_352;
        float _2243 = _2241 + 1.0;
        _430 = _2243;
    }
    float _2245 = _430;
    bool _2247 = _2125 != 1;
    float _2249 = _2103 * _2227;
    float _2251 = -_2235;
    float _2253 = _2057 + _2251;
    float _2255 = -_2237;
    float _2257 = _2111 + _2255;
    if (_2207)
    {
        _2239 = _2245;
    }
    float _2259 = _2239;
    float _2261 = -_2249;
    float _2263 = _2103 + _2261;
    float _2265 = _2253 * _2253;
    float _2267 = in.m_73.x;
    float _2269 = in.m_73.y;
    float _2271 = in.m_73.z;
    bool _2273 = _2201 != 0.0;
    bool _2275 = isnan(_2201);
    bool _2277 = _2273 || _2275;
    bool _2279 = isnan(0.0);
    bool _2281 = _2277 || _2279;
    float _2283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2199);
    float _2285 = fma(_2263, _2263, _2265);
    float _2287 = in.m_75.x;
    float _2289 = in.m_75.y;
    float _2291 = in.m_75.z;
    float _2293 = in.m_75.w;
    bool _2295 = _2199 == 0.0;
    bool _2297 = !_2281;
    bool _2299 = _2295 && _2297;
    float _2301 = _610 * _790;
    float _2303 = fma(_2257, _2257, _2285);
    float _2305 = 0.0;
    if (!_2247)
    {
        _2305 = _1270;
    }
    float _2307 = _2305;
    int _2309 = _1284 * _2225;
    int _2311 = _2309 + _1545;
    bool _2313 = _2203 == 0.0;
    bool _2315 = _2313 && _2299;
    float _2317 = 0.0;
    float _2319 = _2307;
    if (_2219)
    {
        _2317 = _174;
    }
    float _2321 = _2317;
    float _2323 = sqrt(_2303);
    float _2325 = 0.0;
    float _2327 = _2321;
    if (!_2247)
    {
        _2325 = _2307;
    }
    float _2329 = _2325;
    float _2331 = _2329;
    if (!_2219)
    {
        _2327 = _1278;
    }
    float _2333 = _2327;
    float _2335 = 0.0;
    if (!_2247)
    {
        _2335 = _1278;
    }
    float _2337 = _2335;
    float _2339 = 0.0;
    float _2341 = _2337;
    if (_2219)
    {
        _2339 = _1270;
    }
    float _2343 = _2339;
    float _2345 = _2343;
    if (_2247)
    {
        _2331 = _174;
    }
    float _2347 = _2331;
    if (_2247)
    {
        _2319 = _174;
    }
    float _2349 = _2319;
    if (_2247)
    {
        _1387 = _1270;
    }
    float _2351 = _1387;
    float _2353 = _2347 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2355 = _2271 * _2289;
    float _2357 = _2267 * _2291;
    float _2359 = _2269 * _2287;
    float _2361 = _2355;
    float _2363 = _2293;
    if (_2247)
    {
        _2341 = _1270;
    }
    float _2365 = _2341;
    float _2367 = _2149 * _2323;
    if (!_2219)
    {
        _2345 = _174;
    }
    float _2369 = _2345;
    float _2371 = -_2357;
    float _2373 = fma(_2271, _2287, _2371);
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2377 = _2375 != 0;
    float _2379 = -_2359;
    float _2381 = fma(_2289, _2267, _2379);
    int _2383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2385 = _2383 != 0;
    float _2387 = -_2355;
    float _2389 = fma(_2291, _2269, _2387);
    if (_2315)
    {
        _2361 = _2269;
    }
    float _2391 = _2361;
    float _2393 = _1280 * _2367;
    float _2395 = _2391;
    if (!_2315)
    {
        float _2397 = fma(_2201, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2269);
        _2395 = _2397;
    }
    float _2399 = _2395;
    float _2401 = _2389 * _2293;
    float _2403 = _2373 * _2293;
    float _2405 = _2381 * _2293;
    float _2407 = _2301 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_2315)
    {
        _2363 = _2271;
    }
    float _2409 = _2363;
    float _2411 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2201);
    float _2413 = _2409;
    if (!_2315)
    {
        float _2415 = fma(_2203, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2271);
        _2413 = _2415;
    }
    float _2417 = _2413;
    float _2419 = _2393 * _2203;
    float _2421 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2423 = _2407 * _2367;
    float _2425 = 0.0;
    float _2427 = _2417;
    if (_2315)
    {
        _2425 = _2267;
    }
    float _2429 = _2425;
    float _2431 = _2429;
    if (!_2315)
    {
        float _2433 = fma(_2199, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2267);
        _2431 = _2433;
    }
    float _2435 = _2431;
    float _2437 = -_1288;
    float _2439 = fma(_2421, 2.0, _2437);
    float _2441 = _2423 * _2411;
    float _2443 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2445 = _2443 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2447 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2449 = 1.0 / _2445;
    float _2451 = -_2053;
    float _2453 = _2451 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2457 = fma(_2447, -2.0, _1298);
    float _2459 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2455);
    float _2461 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2463 = _2461 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2465 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2467 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2469 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2471 = _2469 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2473 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2465);
    float _2475 = -_2031;
    float _2477 = _2475 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2479 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2467);
    float _2481 = 1.0 / _2471;
    float _2483 = _2477 * _2477;
    float _2485 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2487 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2489 = fma(_2453, _2453, _2483);
    float _2491 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2493 = -_2485;
    float _2495 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2493);
    float _2497 = 1.0 / _2463;
    float _2499 = fma(_2121, _2121, _2489);
    float _2501 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2503 = _2501 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2505 = -_2487;
    float _2507 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2505);
    float _2509 = -_2491;
    float _2511 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2509);
    float _2513 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2479);
    float _2515 = rsqrt(_2499);
    float _2517 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2519 = _2517 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2521 = _2369 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2523 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2525 = _2523 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2527 = _2351 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2529 = _2049 * _2367;
    float _2531 = 1.0 / _2519;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2537;
    int _2541 = ~_2229;
    int _2543 = _2541 + 1;
    int _2545 = _2543 + 1;
    float _2547 = _2529 * _2283;
    int _2549 = abs(_2179);
    float _2551 = _2539 * _2497;
    bool _2553 = !_2131;
    int _2555 = _2553 ? 0 : 1;
    float _2557 = 1.0 / _2503;
    float _2559 = _2453 * _2515;
    float _2561 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2563 = _2477 * _2515;
    int _2565 = abs(_2555);
    float _2567 = -_2561;
    float _2569 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2567);
    bool _2571 = _1967 != 3;
    float _2573 = 1.0 / _2525;
    float _2575 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2577 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2575;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2581 = _2579 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2583 = ~_2077;
    int _2585 = _2583 + _2211;
    int _2587 = _2585 + 1;
    float _2589 = _2577 * _2449;
    float _2591 = _2581 * _2481;
    float _2593 = _2559 * _2559;
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2597 = _2595 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2599 = _2121 * _2515;
    float _2601 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2603 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2601;
    float _2605 = 1.0 / _2535;
    float _2607 = fma(_2599, _2599, _2593);
    float _2609 = _2603 * _2531;
    float _2611 = _2597 * _2557;
    float _2613 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2615 = _2613 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2619 = _1264 + _2617;
    float _2621 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2623 = _1264 + _2621;
    bool _2625 = !_2571;
    int _2627 = _2625 ? 0 : (-1);
    float _2629 = rsqrt(_2607);
    float _2631 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2633 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2631;
    float _2635 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2637 = _1264 + _2635;
    float _2639 = _2615 * _2573;
    float _2641 = fma(_2591, _2619, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2643 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2645 = _1264 + _2643;
    float _2647 = fma(_2589, _2637, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2649 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2651 = _1264 + _2649;
    float _2653 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2655 = _1264 + _2653;
    float _2657 = _2633 * _2605;
    float _2659 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2661 = fma(_2551, _2651, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2663 = fma(_2609, _2645, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2665 = fma(_2639, _2623, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2667 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2669 = fma(_2611, _2655, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2671 = _2599 * _2629;
    float _2673 = _2559 * _2629;
    float _2675 = _2507 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2677 = -_2667;
    float _2679 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2677);
    float _2681 = -_2671;
    float _2683 = _2599 * _2681;
    float _2685 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2687 = -_2675;
    float _2689 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2687);
    float _2691 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2679);
    float _2693 = -_2683;
    float _2695 = fma(_2559, _2673, _2693);
    float _2697 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2699 = _2563 * _2673;
    float _2701 = -_2659;
    float _2703 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2701);
    float _2705 = _2695 * _2695;
    float _2707 = -_2685;
    float _2709 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2707);
    float _2711 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2689);
    float _2713 = _2691 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2715 = -_2697;
    float _2717 = fma(_2507, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2715);
    float _2719 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2721 = fma(_2699, _2699, _2705);
    float _2723 = -_2671;
    float _2725 = _2563 * _2723;
    float _2727 = -_2713;
    float _2729 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2727);
    float _2731 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2717);
    float _2733 = -_2719;
    float _2735 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2733);
    float _2737 = fma(_2725, _2725, _2721);
    float _2739 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2741 = fma(_2731, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2729);
    float _2743 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2735);
    bool _2745 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2747 = isnan(_1264);
    bool _2749 = _2745 || _2747;
    bool _2751 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2753 = _2749 || _2751;
    float _2755 = float(_2753);
    float _2757 = -_2739;
    float _2759 = fma(_2507, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2757);
    float _2761 = rsqrt(_2737);
    float _2763 = -_2743;
    float _2765 = fma(_2763, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2741);
    bool _2767 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2769 = isnan(_1264);
    bool _2771 = _2767 || _2769;
    bool _2773 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2775 = _2771 || _2773;
    float _2777 = float(_2775);
    float _2779 = -_2755;
    float _2781 = _2779 + 1.0;
    bool _2783 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2785 = isnan(_1264);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2791 = _2787 || _2789;
    float _2793 = float(_2791);
    float _2795 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2709);
    float _2797 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2703);
    float _2799 = _2777 * _2781;
    float _2801 = 1.0 / _2765;
    float _2803 = -_2777;
    float _2805 = _2803 + 1.0;
    bool _2807 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2809 = isnan(_1264);
    bool _2811 = _2807 || _2809;
    bool _2813 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2815 = _2811 || _2813;
    float _2817 = float(_2815);
    float _2819 = -_2793;
    float _2821 = _2819 + 1.0;
    float _2823 = fma(_2569, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2759);
    float _2825 = _2793 * _2805;
    bool _2827 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2829 = isnan(_1264);
    bool _2831 = _2827 || _2829;
    bool _2833 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2835 = _2831 || _2833;
    float _2837 = float(_2835);
    float _2839 = -_2817;
    float _2841 = _2839 + 1.0;
    float _2843 = _2695 * _2761;
    float _2845 = precise::clamp(_2843, 0.0, 1.0);
    bool _2847 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2849 = isnan(_1264);
    bool _2851 = _2847 || _2849;
    bool _2853 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2855 = _2851 || _2853;
    float _2857 = float(_2855);
    float _2859 = _2817 * _2821;
    float _2861 = _2837 * _2841;
    float _2863 = -_2837;
    float _2865 = _2863 + 1.0;
    float _2867 = -_2845;
    float _2869 = _2867 + 1.0;
    bool _2871 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2873 = isnan(_1264);
    bool _2875 = _2871 || _2873;
    bool _2877 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2879 = _2875 || _2877;
    float _2881 = float(_2879);
    float _2883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2885 = fma(_2795, _2801, -1.0);
    float _2887 = -_2857;
    float _2889 = _2887 + 1.0;
    float _2891 = _2857 * _2865;
    float _2893 = _2869 * _2801;
    float _2895 = fma(_2869, _2885, 1.0);
    bool _2897 = _1264 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2899 = isnan(_1264);
    bool _2901 = _2897 || _2899;
    bool _2903 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2905 = _2901 || _2903;
    float _2907 = float(_2905);
    float _2909 = _2881 * _2889;
    float _2911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2913 = -_2881;
    float _2915 = _2913 + 1.0;
    float _2917 = _2797 * _2893;
    float _2919 = _2895 * _2895;
    float _2921 = _2823 * _2893;
    float _2923 = _2907 * _2915;
    float _2925 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2927 = _1264 + _2925;
    float _2929 = fma(_2917, _2917, _2919);
    float _2931 = -_2907;
    float _2933 = _2931 + 1.0;
    float _2935 = _2647 * _2923;
    float _2937 = fma(_2657, _2927, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2939 = fma(_2921, _2921, _2929);
    float _2941 = _2883 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2943 = fma(_2933, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2935);
    int _2945 = _1324 * _2587;
    int _2947 = _2945 + _1771;
    float _2949 = fma(_2941, _1979, -0.5);
    float _2951 = _2911 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2953 = rsqrt(_2939);
    float _2955 = fma(_2641, _2909, _2943);
    float _2957 = fma(_2951, _2259, -0.5);
    float _2959 = _2333 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2961 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2963 = fma(_2661, _2891, _2955);
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2967 = -_2961;
    float _2969 = fma(_2959, 2.0, _2967);
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2973 = fma(_2669, _2861, _2963);
    float _2975 = fma(_2349, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2965);
    float _2977 = -_144;
    float _2979 = fma(_2977, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2969);
    float _2981 = fma(_2365, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2971);
    float _2983 = _2921 * _2953;
    float _2985 = _2895 * _2953;
    float _2987 = fma(_2513, _2957, _2979);
    int _2989 = _1959 >> 31;
    float _2991 = fma(_2663, _2859, _2973);
    float _2993 = _2917 * _2953;
    float _2995 = -_2983;
    float _2997 = _2559 * _2995;
    float _2999 = _2599 * _2985;
    int _3001 = _2989 & 3;
    float _3003 = fma(_2665, _2825, _2991);
    float _3005 = -_2993;
    float _3007 = -_2997;
    float _3009 = fma(_2599, _3005, _3007);
    float _3011 = -_2983;
    float _3013 = -_2999;
    float _3015 = fma(_2563, _3011, _3013);
    int _3017 = _2107 >> 31;
    float _3019 = -_2993;
    float _3021 = _2563 * _3019;
    int _3023 = _1959 + _3001;
    float _3025 = _3009 * _3009;
    int _3027 = _3017 & 3;
    float _3029 = -_3021;
    float _3031 = fma(_2559, _2985, _3029);
    int _3033 = _3023 >> 2;
    float _3035 = fma(_3015, _3015, _3025);
    int _3037 = _2107 + _3027;
    float _3039 = fma(_2937, _2799, _3003);
    int _3041 = _3033 << 4;
    int _3043 = _3041 + 368;
    float _3045 = fma(_3031, _3031, _3035);
    float _3047 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2473);
    uint _3049 = uint(int(uint(_3043) >> uint(2)));
    uint _3051 = uint(int(uint(int(_3049)) >> uint(2)));
    int _3053 = int(_3049) & 3;
    float _3055 = (*spvDescriptorSet0.vp_c9)._m0[int(_3051)][_3053];
    int _3057 = int(_3049) + 1;
    uint _3059 = uint(int(uint(_3057) >> uint(2)));
    int _3061 = _3057 & 3;
    float _3063 = (*spvDescriptorSet0.vp_c9)._m0[int(_3059)][_3061];
    int _3065 = _3037 >> 2;
    float _3067 = rsqrt(_3045);
    float _3069 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3071 = fma(_2755, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3039);
    int _3073 = _3065 << 4;
    int _3075 = _3073 + 512;
    float _3077 = -_3069;
    float _3079 = fma(_2353, 2.0, _3077);
    int _3081 = _3043 + 8;
    uint _3083 = uint(int(uint(_3081) >> uint(2)));
    uint _3085 = uint(int(uint(int(_3083)) >> uint(2)));
    int _3087 = int(_3083) & 3;
    float _3089 = (*spvDescriptorSet0.vp_c9)._m0[int(_3085)][_3087];
    int _3091 = int(_3083) + 1;
    uint _3093 = uint(int(uint(_3091) >> uint(2)));
    int _3095 = _3091 & 3;
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[int(_3093)][_3095];
    float _3099 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3101 = abs(_2197);
    float _3103 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _3105 = _2129 != 3;
    float _3107 = fma(_2527, -2.0, _3099);
    out.m_77.x = _3071;
    float _3109 = fma(_2521, -2.0, _3103);
    uint _3111 = uint(int(uint(_3075) >> uint(2)));
    uint _3113 = uint(int(uint(int(_3111)) >> uint(2)));
    int _3115 = int(_3111) & 3;
    float _3117 = (*spvDescriptorSet0.vp_c9)._m0[int(_3113)][_3115];
    int _3119 = int(_3111) + 1;
    uint _3121 = uint(int(uint(_3119) >> uint(2)));
    int _3123 = _3119 & 3;
    float _3125 = (*spvDescriptorSet0.vp_c9)._m0[int(_3121)][_3123];
    float _3127 = _3015 * _3067;
    float _3129 = _3031 * _3067;
    float _3131 = _3009 * _3067;
    float _3133 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3109);
    float _3135 = _2599 * _3127;
    float _3137 = _2563 * _3129;
    int _3139 = _3075 + 8;
    uint _3141 = uint(int(uint(_3139) >> uint(2)));
    uint _3143 = uint(int(uint(int(_3141)) >> uint(2)));
    int _3145 = int(_3141) & 3;
    float _3147 = (*spvDescriptorSet0.vp_c9)._m0[int(_3143)][_3145];
    int _3149 = int(_3141) + 1;
    uint _3151 = uint(int(uint(_3149) >> uint(2)));
    int _3153 = _3149 & 3;
    float _3155 = (*spvDescriptorSet0.vp_c9)._m0[int(_3151)][_3153];
    float _3157 = _2559 * _3131;
    float _3159 = -_3135;
    float _3161 = fma(_2559, _3129, _3159);
    float _3163 = -_3137;
    float _3165 = fma(_2599, _3131, _3163);
    int _3167 = abs(_2189);
    float _3169 = -_3157;
    float _3171 = fma(_2563, _3127, _3169);
    float _3173 = _3161 * _3161;
    float _3175 = -_3133;
    float _3177 = fma(_3047, _2949, _3175);
    int _3179 = ~_3167;
    int _3181 = _3179 + 1;
    int _3183 = _3181 + 1;
    float _3185 = fma(_3165, _3165, _3173);
    float _3187 = fma(_3171, _3171, _3185);
    float _3189 = rsqrt(_3187);
    int _3191 = _2545 * as_type<int>(_3063);
    float _3193 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3195 = int(_3193);
    int _3197 = ~_2549;
    int _3199 = _3197 + 1;
    int _3201 = _3199 + 1;
    int _3203 = _3201 * as_type<int>(_3055);
    int _3205 = _3203 + _3191;
    int _3207 = abs(_2099);
    float _3209 = _3171 * _3189;
    float _3211 = _3165 * _3189;
    int _3213 = ~_3207;
    int _3215 = _3213 + 1;
    int _3217 = _3215 + 1;
    int _3219 = _3183 * as_type<int>(_3125);
    int _3221 = ~_2565;
    int _3223 = _3221 + 1;
    int _3225 = _3223 + 1;
    float _3227 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3229 = int(_3227);
    int _3231 = abs(_2627);
    int _3233 = _3217 * as_type<int>(_3089);
    int _3235 = _3233 + _3205;
    bool _3237 = !_2385;
    int _3239 = _3237 ? 0 : 1;
    int _3241 = _3225 * as_type<int>(_3117);
    int _3243 = _3241 + _3219;
    int _3245 = ~_3231;
    int _3247 = _3245 + 1;
    int _3249 = _3247 + 1;
    float _3251 = _3161 * _3189;
    bool _3253 = !_2377;
    int _3255 = _3253 ? 0 : 1;
    float _3257 = _3209 * _2289;
    int _3259 = abs(_3239);
    float _3261 = _2559 * _3209;
    int _3263 = _3249 * as_type<int>(_3097);
    int _3265 = _3263 + _3235;
    float _3267 = float(uint(_3195));
    float _3269 = _2599 * _3251;
    int _3271 = abs(_3255);
    float _3273 = -_3261;
    float _3275 = fma(_2599, _3211, _3273);
    bool _3277 = !_3105;
    int _3279 = _3277 ? 0 : (-1);
    float _3281 = 1.0 / _3267;
    int _3283 = ~_3101;
    int _3285 = _3283 + 1;
    int _3287 = _3285 + 1;
    float _3289 = -_3269;
    float _3291 = fma(_2563, _3209, _3289);
    float _3293 = _3275 * _3275;
    int _3295 = ~_3195;
    int _3297 = _3295 + 1;
    float _3299 = _2403 * _3251;
    int _3301 = _3287 * as_type<int>(_3147);
    int _3303 = _3301 + _3243;
    float _3305 = float(uint(_3229));
    float _3307 = fma(_3291, _3291, _3293);
    int _3309 = abs(_3279);
    float _3311 = _2563 * _3211;
    float _3313 = 1.0 / _3305;
    int _3315 = ~_3229;
    int _3317 = _3315 + 1;
    float _3319 = _2403 * _3209;
    float _3321 = -_3311;
    float _3323 = fma(_2559, _3251, _3321);
    int _3325 = ~_3271;
    int _3327 = _3325 + 1;
    int _3329 = _3327 + 1;
    int _3331 = ~_3309;
    int _3333 = _3331 + 1;
    int _3335 = _3333 + 1;
    float _3337 = fma(_3323, _3323, _3307);
    int _3339 = abs(_3195);
    int _3341 = _3265 * _3329;
    int _3343 = ~_3259;
    int _3345 = _3343 + 1;
    int _3347 = _3345 + 1;
    int _3349 = _3335 * as_type<int>(_3155);
    int _3351 = _3349 + _3303;
    bool _3353 = !_1673;
    int _3355 = _3353 ? _2311 : (-1);
    float _3357 = rsqrt(_3337);
    int _3359 = _3351 * _3347;
    bool _3361 = !_1683;
    int _3363 = _3361 ? _2947 : (-1);
    int _3365 = _3355 * _3271;
    int _3367 = _3365 + _3341;
    int _3369 = abs(_3229);
    float _3371 = _2441 * _3209;
    int _3373 = as_type<int>(_3281) + (-2);
    int _3375 = _3363 * _3259;
    int _3377 = _3375 + _3359;
    float _3379 = float(uint(_3369));
    float _3381 = _2441 * _3211;
    float _3383 = float(uint(_3339));
    float _3385 = _3209 * _2399;
    float _3387 = 1.0 / _3379;
    int _3389 = as_type<int>(_3313) + (-2);
    float _3391 = _3323 * _3357;
    float _3393 = float(uint(_3367));
    float _3395 = _3291 * _3357;
    int _3397 = abs(_3367);
    float _3399 = fma(_2547, _3391, _3371);
    float _3401 = 1.0 / _3383;
    float _3403 = as_type<float>(_3373) * _3393;
    float _3405 = float(uint(_3377));
    float _3407 = fma(_2599, _2419, _3399);
    float _3409 = fma(_2547, _3395, _3381);
    int _3411 = ~_3369;
    int _3413 = _3411 + 1;
    float _3415 = as_type<float>(_3389) * _3405;
    float _3417 = trunc(_3403);
    float _3419 = precise::max(_3417, 0.0);
    uint _3421 = uint(_3419);
    int _3423 = as_type<int>(_3387) + (-2);
    float _3425 = fma(_2559, _2419, _3409);
    float _3427 = _2089 + _3407;
    float _3429 = fma(_3391, _2287, _3257);
    float _3431 = _2053 + _3425;
    float _3433 = float(uint(_3397));
    float _3435 = trunc(_3415);
    float _3437 = precise::max(_3435, 0.0);
    uint _3439 = uint(_3437);
    int _3441 = as_type<int>(_3401) + (-2);
    float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3445 = _3427 + _3443;
    int _3447 = abs(_3377);
    float _3449 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3451 = _3431 + _3449;
    float _3453 = as_type<float>(_3441) * _3433;
    float _3455 = _3445 * _3445;
    int _3457 = _3297 * int(_3421);
    int _3459 = _3457 + _3367;
    float _3461 = _3177 + 0.5;
    float _3463 = fma(_3451, _3451, _3455);
    float _3465 = trunc(_3453);
    float _3467 = precise::max(_3465, 0.0);
    uint _3469 = uint(_3467);
    float _3471 = float(uint(_3459));
    float _3473 = _2987 + 0.5;
    int _3475 = ~_3339;
    int _3477 = _3475 + 1;
    int _3479 = _3317 * int(_3439);
    int _3481 = _3479 + _3377;
    float _3483 = float(uint(_3447));
    float _3485 = as_type<float>(_3373) * _3471;
    out.m_79.x = _3473;
    out.m_79.y = _3461;
    float _3487 = sqrt(_3463);
    float _3489 = float(uint(_3481));
    float _3491 = as_type<float>(_3423) * _3483;
    float _3493 = _3251 * _2289;
    float _3495 = as_type<float>(_3389) * _3489;
    float _3497 = _3211 * _2289;
    float _3499 = trunc(_3491);
    float _3501 = precise::max(_3499, 0.0);
    uint _3503 = uint(_3501);
    int _3505 = _3477 * int(_3469);
    int _3507 = _3505 + _3397;
    float _3509 = _2403 * _3211;
    float _3511 = _3251 * _2399;
    float _3513 = _2441 * _3251;
    float _3515 = fma(_3395, _2287, _3497);
    float _3517 = float(uint(_3507));
    float _3519 = _3275 * _3357;
    float _3521 = trunc(_3485);
    float _3523 = precise::max(_3521, 0.0);
    uint _3525 = uint(_3523);
    float _3527 = _3211 * _2399;
    bool _3529 = _3487 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3531 = as_type<float>(_3441) * _3517;
    float _3533 = fma(_2547, _3519, _3513);
    int _3535 = ~_3195;
    int _3537 = _3535 + 1;
    float _3539 = fma(_3519, _2287, _3493);
    float _3541 = fma(_2401, _3395, _3509);
    int _3543 = _3413 * int(_3503);
    int _3545 = _3543 + _3447;
    float _3547 = trunc(_3495);
    float _3549 = precise::max(_3547, 0.0);
    uint _3551 = uint(_3549);
    float _3553 = fma(_2563, _2419, _3533);
    int _3555 = ~_3229;
    int _3557 = _3555 + 1;
    float _3559 = fma(_2401, _3519, _3299);
    float _3561 = float(uint(_3545));
    float _3563 = fma(_2401, _3391, _3319);
    float _3565 = fma(_3519, _2435, _3511);
    int _3567 = int(_3421) + int(_3525);
    float _3569 = trunc(_3531);
    float _3571 = precise::max(_3569, 0.0);
    uint _3573 = uint(_3571);
    float _3575 = as_type<float>(_3423) * _3561;
    float _3577 = fma(_3391, _2435, _3385);
    float _3579 = fma(_2559, _2291, _3515);
    int _3581 = _3537 * _3567;
    int _3583 = _3581 + _3367;
    float _3585 = fma(_2563, _2291, _3539);
    float _3587 = fma(_3395, _2435, _3527);
    float _3589 = fma(_2599, _2291, _3429);
    float _3591 = trunc(_3575);
    float _3593 = precise::max(_3591, 0.0);
    uint _3595 = uint(_3593);
    int _3597 = int(_3439) + int(_3551);
    float _3599 = _2031 + _3553;
    bool _3601 = uint(_3583) >= uint(_3195);
    int _3603 = ~_3339;
    int _3605 = _3603 + 1;
    int _3607 = _3557 * _3597;
    int _3609 = _3607 + _3377;
    int _3611 = ~_3369;
    int _3613 = _3611 + 1;
    int _3615 = int(_3469) + int(_3573);
    float _3617 = as_type<float>(_3583);
    float _3619 = _3553;
    float _3621 = _3511;
    float _3623 = _3579;
    float _3625 = _3585;
    if (!_3529)
    {
        _3617 = _3431;
    }
    float _3627 = _3617;
    float _3629 = _3627;
    if (!_3529)
    {
        _3619 = _3427;
    }
    float _3631 = _3619;
    float _3633 = _3631;
    if (!_3529)
    {
        _3621 = _3599;
    }
    float _3635 = _3621;
    int _3637 = int(_3503) + int(_3595);
    bool _3639 = !_3529;
    float _3641 = _3635;
    if (!_3639)
    {
        float _3643 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3647 = _3487 + _3645;
        float _3649 = _3599 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3651 = rsqrt(_3463);
        float _3653 = _3647 * _3643;
        float _3655 = _3653 * 0.15915493667125701904296875;
        float _3657 = _3655 * 6.283185482025146484375;
        float _3659 = cos(_3657);
        float _3661 = _3655 * 6.283185482025146484375;
        float _3663 = sin(_3661);
        float _3665 = _3659 + (-1.0);
        float _3667 = fma(_3663, _3649, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3669 = _3665 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3671 = _3651 * _3667;
        float _3673 = fma(_3599, _3659, _3669);
        float _3675 = fma(_3451, _3671, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3677 = fma(_3445, _3671, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3629 = _3675;
        _3641 = _3673;
        _3633 = _3677;
    }
    float _3679 = _3629;
    float _3681 = _3641;
    float _3683 = _3633;
    bool _3685 = !_3601;
    int _3687 = _3685 ? 0 : (-1);
    float _3689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3691 = _3605 * _3615;
    int _3693 = _3691 + _3397;
    bool _3695 = uint(_3609) >= uint(_3229);
    int _3697 = _3613 * _3637;
    int _3699 = _3697 + _3447;
    int _3701 = ~_3567;
    int _3703 = _3701 + _3687;
    int _3705 = _3703 + 1;
    float _3707 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2457);
    bool _3709 = uint(_3693) >= uint(_3339);
    float _3711 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3107);
    bool _3713 = !_3695;
    int _3715 = _3713 ? 0 : (-1);
    int _3717 = _3195 * _3705;
    int _3719 = _3717 + _3367;
    bool _3721 = _3195 == 0;
    float _3723 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2459);
    bool _3725 = _3195 == 0;
    float _3727 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2981);
    int _3729 = _3367 ^ _3195;
    out.m_81.x = _2529;
    int _3731 = ~_3597;
    int _3733 = _3731 + _3715;
    int _3735 = _3733 + 1;
    float _3737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3739 = !_3721;
    int _3741 = _3739 ? _3719 : (-1);
    bool _3743 = uint(_3699) >= uint(_3369);
    int _3745 = _3229 * _3735;
    int _3747 = _3745 + _3377;
    int _3749 = _3377 ^ _3229;
    float _3751 = _3689 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3753 = _3229 == 0;
    float _3755 = fma(_2599, _2417, _3577);
    bool _3757 = _3229 == 0;
    float _3759 = -_144;
    float _3761 = fma(_3759, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2439);
    float _3763 = float(_3741);
    float _3765 = fma(_3751, _1835, -0.5);
    bool _3767 = !_3743;
    int _3769 = _3767 ? 0 : (-1);
    float _3771 = -_2249;
    float _3773 = _2053 + _3771;
    bool _3775 = !_3709;
    int _3777 = _3775 ? 0 : (-1);
    float _3779 = fma(_3751, _3763, _3761);
    uint _3781 = uint(int(uint(_3729) >> uint(31)));
    float _3783 = _3737 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3785 = ~_3769;
    int _3787 = _3637 + _3785;
    int _3789 = _3787 + 1;
    float _3791 = -_144;
    float _3793 = fma(_3791, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3079);
    bool _3795 = !_3753;
    int _3797 = _3795 ? _3747 : (-1);
    float _3799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _3801 = uint(int(uint(_3749) >> uint(31)));
    float _3803 = fma(_3783, _1913, -0.5);
    int _3805 = ~_3777;
    int _3807 = _3615 + _3805;
    int _3809 = _3807 + 1;
    float _3811 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1300);
    int _3813 = ~int(_3781);
    int _3815 = _3813 + 1;
    float _3817 = fma(_2559, _2417, _3587);
    float _3819 = float(_3797);
    float _3821 = fma(_3811, _3765, _3779);
    int _3823 = ~int(_3801);
    int _3825 = _3823 + 1;
    out.m_83.x = _3579;
    out.m_83.y = _3585;
    out.m_83.z = _3589;
    int _3827 = _3809 ^ _3815;
    float _3829 = fma(_3783, _3819, _3793);
    int _3831 = _3789 ^ _3825;
    float _3833 = -_2237;
    float _3835 = _2089 + _3833;
    int _3837 = ~_3815;
    int _3839 = _3837 + _3827;
    int _3841 = _3839 + 1;
    float _3843 = _3799 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3845 = ~_3825;
    int _3847 = _3845 + _3831;
    int _3849 = _3847 + 1;
    float _3851 = _2405 * _2559;
    float _3853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3855 = !_3725;
    int _3857 = _3855 ? _3841 : (-1);
    float _3859 = fma(_1901, _3843, -0.5);
    float _3861 = _2405 * _2563;
    float _3863 = _2405 * _2599;
    float _3865 = float(_3857);
    float _3867 = _3851 + _3541;
    bool _3869 = !_3757;
    int _3871 = _3869 ? _3849 : (-1);
    float _3873 = _3861 + _3559;
    float _3875 = -_2053;
    float _3877 = _3875 + _3679;
    float _3879 = -_3707;
    float _3881 = fma(_3843, _3865, _3879);
    float _3883 = -_2031;
    float _3885 = _3883 + _3681;
    float _3887 = _3863 + _3563;
    float _3889 = float(_3871);
    float _3891 = -_2089;
    float _3893 = _3891 + _3683;
    float _3895 = _3885 * _3885;
    float _3897 = _3853 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3899 = fma(_3723, _3859, _3881);
    float _3901 = fma(_2563, _2417, _3565);
    float _3903 = fma(_3877, _3877, _3895);
    float _3905 = fma(_1963, _3897, -0.5);
    float _3907 = -_3711;
    float _3909 = fma(_3897, _3889, _3907);
    float _3911 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2975);
    float _3913 = fma(_3893, _3893, _3903);
    float _3915 = _3821 + 0.5;
    float _3917 = _3899 + 0.5;
    float _3919 = fma(_3911, _3803, _3829);
    float _3921 = fma(_3727, _3905, _3909);
    float _3923 = sqrt(_3913);
    out.m_85.x = _3867;
    out.m_85.y = _3873;
    out.m_85.z = _3887;
    float _3925 = _3919 + 0.5;
    float _3927 = _3921 + 0.5;
    float _3929 = -_2249;
    float _3931 = _3929 + _3679;
    out.m_87.x = _3817;
    out.m_87.y = _3901;
    out.m_87.z = _3755;
    float _3933 = -_2235;
    float _3935 = _3933 + _3681;
    float _3937 = -_2235;
    float _3939 = _2031 + _3937;
    out.m_89.x = _3915;
    out.m_89.y = _3917;
    out.m_89.z = _3925;
    out.m_89.w = _3927;
    bool _3941 = _3923 > 0.0;
    float _3943 = -_2237;
    float _3945 = _3943 + _3683;
    float _3947 = _3873;
    float _3949 = _3867;
    float _3951 = _3885;
    if (!_3941)
    {
        _2427 = _3931;
    }
    float _3953 = _2427;
    float _3955 = _3953;
    float _3957 = _3953;
    if (!_3941)
    {
        _3623 = _3935;
    }
    float _3959 = _3623;
    float _3961 = _3959;
    float _3963 = _3959;
    if (!_3941)
    {
        _3625 = _3945;
    }
    float _3965 = _3625;
    bool _3967 = !_3941;
    float _3969 = _3965;
    float _3971 = _3965;
    if (!_3967)
    {
        bool _3973 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3975 = _3589;
        if (_3973)
        {
            float _3977 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3975 = _3977;
        }
        float _3979 = _3975;
        float _3981 = _3979;
        if (_3973)
        {
            float _3983 = _602 * _3979;
            _3947 = _3983;
        }
        float _3985 = _3947;
        float _3987 = _3985;
        if (_3973)
        {
            float _3989 = _604 * _3979;
            _3949 = _3989;
        }
        float _3991 = _3949;
        float _3993 = _3991;
        if (_3973)
        {
            float _3995 = _606 * _3979;
            _3981 = _3995;
        }
        float _3997 = _3981;
        float _3999 = _3997;
        if (!_3973)
        {
            bool _4001 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4003 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4005 = _4001 || _4003;
            bool _4007 = isnan(1.0);
            bool _4009 = _4005 || _4007;
            float _4011 = _144 + 1.0;
            if (!_4009)
            {
                float _4013 = _4011 * _4011;
                float _4015 = _4013 * 0.5;
                _166 = _4015;
            }
            float _4017 = _166;
            float _4019 = _4017;
            if (!_4009)
            {
                float _4021 = _4017 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4019 = _4021;
            }
            float _4023 = _4019;
            bool _4025 = !_4009;
            float _4027 = _4023;
            if (!_4025)
            {
                float _4029 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4031 = log2(_4029);
                float _4033 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4035 = _4033 + 1.0;
                float _4037 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4039 = _4031 * _4011;
                float _4041 = 1.0 / _4035;
                float _4043 = _4037 * 0.693147182464599609375;
                float _4045 = exp2(_4039);
                float _4047 = 1.0 / _4043;
                float _4049 = _4045 + (-1.0);
                float _4051 = -_4049;
                float _4053 = fma(_4051, _4047, _4011);
                float _4055 = _4053 * _4041;
                float _4057 = _4055 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4027 = _4057;
            }
            float _4059 = _4027;
            float _4061 = _4059 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _4063 = _4059 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4065 = _4059 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4067 = _4059;
            if (!_4009)
            {
                _4067 = _4011;
            }
            float _4069 = _4067;
            float _4071 = _4061 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _4073 = _4061 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _4075 = _4061 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _4077 = fma(_4063, (*spvDescriptorSet0.vp_c10)._m0[8].y, _4071);
            float _4079 = fma(_4063, (*spvDescriptorSet0.vp_c10)._m0[8].x, _4073);
            float _4081 = fma(_4065, (*spvDescriptorSet0.vp_c10)._m0[10].y, _4077);
            bool _4083 = !_4009;
            float _4085 = _4069;
            if (!_4083)
            {
                float _4087 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4089 = log2(_4087);
                float _4091 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4093 = _4091 + 1.0;
                float _4095 = 1.0 / _4093;
                float _4097 = _4089 * _4011;
                float _4099 = exp2(_4097);
                float _4101 = -_4099;
                float _4103 = _4101 + 1.0;
                float _4105 = _4103 * _4095;
                _4085 = _4105;
                _202 = _4095;
            }
            float _4107 = _4085;
            float _4109 = _202;
            float _4111 = fma(_4063, (*spvDescriptorSet0.vp_c10)._m0[8].z, _4075);
            float _4113 = fma(_4107, _314, _4081);
            float _4115 = fma(_4065, (*spvDescriptorSet0.vp_c10)._m0[10].x, _4079);
            float _4117 = fma(_4065, (*spvDescriptorSet0.vp_c10)._m0[10].z, _4111);
            float _4119 = -_540;
            float _4121 = _4119 + _4113;
            float _4123 = fma(_4107, _312, _4115);
            float _4125 = fma(_4107, _316, _4117);
            float _4127 = _4121 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4129 = _4121 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4131 = -_544;
            float _4133 = _4131 + _4123;
            float _4135 = _4121 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4137 = -_546;
            float _4139 = _4137 + _4125;
            float _4141 = fma(_4133, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4127);
            float _4143 = fma(_4133, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4129);
            float _4145 = fma(_4133, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4135);
            float _4147 = fma(_4139, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4141);
            float _4149 = fma(_4139, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4143);
            float _4151 = fma(_4139, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4145);
            _616 = _4149;
            _618 = _4147;
            _620 = _4151;
            _3987 = _4147;
            _3993 = _4149;
            _3999 = _4151;
            _3955 = _4117;
            _3961 = _4145;
            _3969 = _4115;
            _390 = _4143;
            _204 = _4109;
        }
        float _4153 = _616;
        float _4155 = _618;
        float _4157 = _620;
        float _4159 = _3987;
        float _4161 = _3993;
        float _4163 = _3999;
        float _4165 = _3955;
        float _4167 = _3961;
        float _4169 = _3969;
        float _4171 = _390;
        float _4173 = _204;
        float _4175 = _4153 * _4153;
        float _4177 = rsqrt(_3913);
        float _4179 = fma(_4155, _4155, _4175);
        float _4181 = fma(_4157, _4157, _4179);
        float _4183 = sqrt(_4181);
        float _4185 = _3877 * _4177;
        float _4187 = _3885 * _4177;
        float _4189 = _3893 * _4177;
        bool _4191 = _4183 > 0.0;
        float _4193 = _4165;
        float _4195 = _4167;
        float _4197 = _4169;
        _392 = _4171;
        _3951 = _4187;
        _622 = _4153;
        _206 = _4173;
        if (!_4191)
        {
            _4193 = _3931;
        }
        float _4199 = _4193;
        _3957 = _4199;
        if (!_4191)
        {
            _4195 = _3935;
        }
        float _4201 = _4195;
        _3963 = _4201;
        if (!_4191)
        {
            _4197 = _3945;
        }
        float _4203 = _4197;
        bool _4205 = !_4191;
        _3971 = _4203;
        if (!_4205)
        {
            float _4207 = rsqrt(_4181);
            float _4209 = _4207 * _4153;
            float _4211 = _4207 * _4155;
            float _4213 = _4207 * _4157;
            float _4215 = _4187 * _4209;
            float _4217 = fma(_4185, _4211, _4215);
            float _4219 = fma(_4189, _4213, _4217);
            float _4221 = _4219 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4223 = fma(_4159, _4221, _3931);
            float _4225 = fma(_4161, _4221, _3935);
            float _4227 = fma(_4163, _4221, _3945);
            _3957 = _4223;
            _3963 = _4225;
            _3971 = _4227;
            _392 = _4215;
        }
    }
    float _4229 = _3957;
    float _4231 = _3963;
    float _4233 = _3971;
    float _4235 = _392;
    float _4237 = _3951;
    float _4239 = _622;
    float _4241 = _206;
    float _4243 = _3939 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4245 = fma(_3773, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4243);
    float _4247 = _3939 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4249 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4251 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4253 = _4249 || _4251;
    bool _4255 = isnan(0.5);
    bool _4257 = _4253 || _4255;
    float _4259 = fma(_3835, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4245);
    float _4261 = fma(_3773, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4247);
    float _4263 = _4259 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4265 = fma(_3835, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4261);
    bool _4267 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4269 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4271 = _4267 || _4269;
    bool _4273 = isnan(0.5);
    bool _4275 = _4271 || _4273;
    float _4277 = 1.0 / _4263;
    float _4279 = _4265 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4281 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4283 = _4279;
    float _4285 = _4235;
    float _4287 = _4259;
    float _4289 = _4237;
    float _4291 = _4239;
    float _4293 = _4241;
    if (_4257)
    {
        _4281 = _4229;
    }
    float _4295 = _4281;
    float _4297 = _4279 + _4263;
    float _4299 = _4295;
    if (_4257)
    {
        _4283 = _4231;
    }
    float _4301 = _4283;
    float _4303 = _4301;
    if (_4257)
    {
        _4285 = _4233;
    }
    float _4305 = _4285;
    float _4307 = _4305;
    if (!_4257)
    {
        float _4309 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4311 = _3939 + _4309;
        float _4313 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4315 = _3773 + _4313;
        float _4317 = -_3773;
        float _4319 = _4317 + _4229;
        float _4321 = -_3939;
        float _4323 = _4321 + _4231;
        float _4325 = _4311 * _4311;
        float _4327 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4329 = _3835 + _4327;
        float _4331 = -_3835;
        float _4333 = _4331 + _4233;
        float _4335 = fma(_4315, _4315, _4325);
        float _4337 = fma(_4329, _4329, _4335);
        float _4339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4341 = sqrt(_4337);
        float _4343 = precise::min(_4341, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4345 = _4343 * _4339;
        float _4347 = fma(_4319, _4345, _3773);
        float _4349 = fma(_4323, _4345, _3939);
        float _4351 = fma(_4333, _4345, _3835);
        _4303 = _4349;
        _4299 = _4347;
        _4307 = _4351;
        _4287 = _4341;
    }
    float _4353 = _4303;
    float _4355 = _4299;
    float _4357 = _4307;
    float _4359 = _4287;
    float _4361 = _4359;
    if (_4275)
    {
        _4361 = 1.0;
    }
    float _4363 = _4361;
    float _4365 = _4297 * _4277;
    float _4367 = _4365 * 0.5;
    float _4369 = _4363;
    float _4371 = _4367;
    if (!_4275)
    {
        float _4373 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4375 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4377 = fma(_4367, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4375);
        float _4379 = _4373 * 0.15915493667125701904296875;
        float _4381 = _4379 * 6.283185482025146484375;
        float _4383 = cos(_4381);
        float _4385 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4387 = _4385 * 0.15915493667125701904296875;
        float _4389 = _4379 * 6.283185482025146484375;
        float _4391 = sin(_4389);
        float _4393 = 1.0 / _4383;
        float _4395 = _4387 * 6.283185482025146484375;
        float _4397 = cos(_4395);
        float _4399 = _4391 * _4393;
        float _4401 = 1.0 / _4377;
        float _4403 = _4397 * _4399;
        float _4405 = _4387 * 6.283185482025146484375;
        float _4407 = sin(_4405);
        float _4409 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4411 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4409;
        float _4413 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4415 = _4401 * _4413;
        float _4417 = 1.0 / _4403;
        float _4419 = 1.0 / _4411;
        float _4421 = _4407 * _4417;
        float _4423 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4425 = fma(_4421, _4415, _4423);
        float _4427 = _4425 * _4419;
        float _4429 = precise::clamp(_4427, 0.0, 1.0);
        _4369 = _4429;
    }
    float _4431 = _4369;
    float _4433 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4435 = _4353 + _4433;
    float _4437 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4439 = _4355 + _4437;
    float _4441 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4443 = _4357 + _4441;
    float _4445 = _4435 * _4435;
    float _4447 = fma(_4439, _4439, _4445);
    float _4449 = fma(_4443, _4443, _4447);
    float _4451 = rsqrt(_4449);
    float _4453 = sqrt(_4449);
    float _4455 = _4451 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4457 = _4439 * _4455;
    float _4459 = _4443 * _4455;
    float _4461 = _4457 * _4457;
    float _4463 = _4459 * _4459;
    float _4465 = _4461 + _4463;
    float _4467 = sqrt(_4465);
    bool _4469 = _4467 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4471 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4473 = _4467 + _4471;
    float _4475 = _4451;
    float _4477 = _4465;
    float _4479 = _4473;
    float _4481 = _4435;
    if (_4469)
    {
        float _4483 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4475 = _4483;
    }
    float _4485 = _4475;
    if (_4469)
    {
        float _4487 = rsqrt(_4465);
        _4477 = _4487;
    }
    float _4489 = _4477;
    if (_4469)
    {
        float _4491 = _4473 * _4485;
        _4479 = _4491;
    }
    float _4493 = _4479;
    if (_4469)
    {
        float _4495 = _4493 * 0.15915493667125701904296875;
        _4289 = _4495;
    }
    float _4497 = _4289;
    float _4499 = _4443;
    if (_4469)
    {
        float _4501 = _4497 * 6.283185482025146484375;
        float _4503 = sin(_4501);
        _4499 = _4503;
    }
    float _4505 = _4499;
    float _4507 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4509 = precise::max(0.0, _4507);
    float _4511 = _4485;
    float _4513 = _4509;
    if (_4469)
    {
        float _4515 = _4497 * 6.283185482025146484375;
        float _4517 = cos(_4515);
        _4511 = _4517;
    }
    float _4519 = _4511;
    float _4521 = -_4455;
    float _4523 = -_4509;
    float _4525 = fma(_4435, _4521, _4523);
    if (_4469)
    {
        float _4527 = _4525 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4481 = _4527;
    }
    float _4529 = _4481;
    float _4531 = _4505;
    float _4533 = _4529;
    if (_4469)
    {
        float _4535 = fma(_4505, _4529, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4371 = _4535;
    }
    float _4537 = _4371;
    float _4539 = _4537;
    if (!_4469)
    {
        _4531 = _4457;
    }
    float _4541 = _4531;
    float _4543 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4545 = fma(_4453, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4543);
    float _4547 = precise::clamp(_4545, 0.0, 1.0);
    float _4549 = _4541;
    if (!_4469)
    {
        _4533 = _4525;
    }
    float _4551 = _4533;
    float _4553 = _4551;
    float _4555 = _4519;
    if (_4469)
    {
        float _4557 = _4519 + (-1.0);
        _4513 = _4557;
    }
    float _4559 = _4513;
    float _4561 = _4559;
    if (_4469)
    {
        float _4563 = _4489 * _4537;
        _4291 = _4563;
    }
    float _4565 = _4291;
    if (!_4469)
    {
        _4539 = _4461;
    }
    float _4567 = _4539;
    float _4569 = _4353 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4571 = _4567;
    if (_4469)
    {
        float _4573 = _4559 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4293 = _4573;
    }
    float _4575 = _4293;
    if (_4469)
    {
        float _4577 = _4457 * _4565;
        _4549 = _4577;
    }
    float _4579 = _4549;
    if (!_4469)
    {
        _4561 = _4459;
    }
    float _4581 = _4561;
    float _4583 = _4581;
    if (_4469)
    {
        float _4585 = _4459 * _4565;
        _4583 = _4585;
    }
    float _4587 = _4583;
    if (_4469)
    {
        float _4589 = fma(_4525, _4519, _4575);
        _4553 = _4589;
    }
    float _4591 = _4553;
    if (_4469)
    {
        float _4593 = _4579 * _4579;
        _4571 = _4593;
    }
    float _4595 = _4571;
    if (!_4469)
    {
        _4555 = _4463;
    }
    float _4597 = _4555;
    float _4599 = _4597;
    if (_4469)
    {
        float _4601 = _4587 * _4587;
        _4599 = _4601;
    }
    float _4603 = _4599;
    float _4605 = -_4547;
    float _4607 = _4605 + 1.0;
    float _4609 = fma(_4591, _4591, _4595);
    float _4611 = _4353 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4613 = _4609 + _4603;
    float _4615 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4569);
    float _4617 = _4353 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4619 = abs(_4607);
    float _4621 = log2(_4619);
    float _4623 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4625 = fma(_4357, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4615);
    float _4627 = _4353 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4629 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4617);
    float _4631 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4611);
    float _4633 = _4625 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4635 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4627);
    float _4637 = rsqrt(_4613);
    float _4639 = fma(_4357, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4629);
    float _4641 = fma(_4357, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4631);
    float _4643 = fma(_4357, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4635);
    float _4645 = _4639 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4647 = _4641 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4649 = _4643 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4651 = _4621 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4653 = _4633 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4655 = -_4653;
    float _4657 = fma(_4655, _4623, 1.0);
    float _4659 = _4645 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4661 = exp2(_4651);
    float _4663 = _4637 * _4579;
    float _4665 = _4637 * _4591;
    float _4667 = fma(_4649, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4659);
    float _4669 = _4637 * _4587;
    float _4671 = _4663 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4673 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4667);
    float _4675 = log2(_4657);
    float _4677 = -_4671;
    float _4679 = fma(_4665, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4677);
    float _4681 = _4645 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4683 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4673);
    float _4685 = -_4669;
    float _4687 = fma(_4685, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4679);
    float _4689 = _4645 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4691 = fma(_4649, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4681);
    float _4693 = 1.0 / _4683;
    float _4695 = fma(_4687, -0.5, 0.5);
    float _4697 = fma(_4649, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4689);
    float _4699 = fma(_4687, 0.5, 0.5);
    float _4701 = _4665 + 1.0;
    float _4703 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4691);
    float _4705 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4697);
    float _4707 = fma(_4699, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4709 = sqrt(_4695);
    float _4711 = -_4665;
    float _4713 = fma(_4661, _4701, _4711);
    float _4715 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4705);
    float _4717 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4703);
    float _4719 = fma(_4699, _4707, -0.212114393711090087890625);
    float _4721 = _4675 * 0.693147182464599609375;
    float _4723 = fma(_4713, 0.5, 0.5);
    float _4725 = _4715 * _4693;
    float _4727 = _4717 * _4693;
    float _4729 = fma(_4699, _4719, 1.570728778839111328125);
    float _4731 = _4721 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4733 = fma(_4725, 0.5, 0.5);
    float _4735 = fma(_4727, -0.5, 0.5);
    float _4737 = _4709 * 0.636619746685028076171875;
    float3 _12191 = float3(_4733, _4735, _4731);
    float _4739 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12191, float3(0.0), isnan(_12191)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12191, float3(0.0), isnan(_12191)), level(0.0)).x;
    float3 _12202 = float3(_4733, _4735, _4731);
    float4 _4742 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12202, float3(0.0), isnan(_12202)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12202, float3(0.0), isnan(_12202)), level(0.0)).xyzw;
    float _4744 = _4742.x;
    float _4746 = _4742.y;
    float _4748 = _4742.z;
    float _4750 = _4742.w;
    float _4752 = -_4729;
    float _4754 = fma(_4737, _4752, 1.0);
    float2 _12224 = float2(_4754, _4723);
    float3 _4758 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12224, float2(0.0), isnan(_12224)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12224, float2(0.0), isnan(_12224)), level(0.0)).xyz;
    float _4760 = _4758.x;
    float _4762 = _4758.y;
    float _4764 = _4758.z;
    float _4766 = _4621 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4768 = _4645 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_91.x = _3773;
    out.m_91.y = _3939;
    out.m_91.z = _3835;
    bool _4770 = _4453 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4772 = isnan(_4453);
    bool _4774 = _4770 || _4772;
    bool _4776 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4778 = _4774 || _4776;
    float _4780 = fma(_4649, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4768);
    float _4782 = exp2(_4766);
    float _4784 = _4715 + _4683;
    out.m_93.x = _4355;
    out.m_93.y = _4353;
    out.m_93.z = _4357;
    float _4786 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4780);
    float _4788 = _4683 * 0.5;
    float _4790 = _4784 * 0.5;
    float _4792 = fma(_4647, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4786);
    float _4794 = fma(_4717, -0.5, _4788);
    float _4796 = _4792 + _4683;
    out.gl_Position.x = _4715;
    out.gl_Position.y = _4717;
    out.gl_Position.z = _4792;
    out.gl_Position.w = _4683;
    float _4798 = _4796 * 0.5;
    float _4800 = -_4782;
    float _4802 = _4800 + 1.0;
    float _4804 = _4802 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_95.x = _4790;
    out.m_95.y = _4794;
    out.m_95.z = _4798;
    out.m_95.w = _4683;
    float _4806 = -_4804;
    float _4808 = _4806 + 1.0;
    float _4810 = _4792;
    float _4812 = _4717;
    float _4814 = _4715;
    if (!_4778)
    {
        _4810 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4816 = _4810;
    float _4818 = _4816;
    float _4820 = _4816;
    if (!_4778)
    {
        _4812 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4822 = _4812;
    float _4824 = _4822;
    float _4826 = _4822;
    if (!_4778)
    {
        _4814 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4828 = _4814;
    float _4830 = _4804 * _4739;
    float _4832 = _4750 * _4808;
    float _4834 = _4431 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4836 = _4750 * _4830;
    float _4838 = _4764 * _4830;
    float _4840 = fma(_4760, _4836, _4744);
    float _4842 = fma(_4762, _4836, _4746);
    float _4844 = fma(_4750, _4838, _4748);
    out.m_97.x = _4840;
    out.m_97.y = _4842;
    out.m_97.z = _4844;
    out.m_97.w = _4832;
    bool _4846 = !_4778;
    float _4848 = _4828;
    float _4850 = _4828;
    if (!_4846)
    {
        bool _4852 = _4453 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4854 = isnan(_4453);
        bool _4856 = _4852 || _4854;
        bool _4858 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4860 = _4856 || _4858;
        if (!_4860)
        {
            float _4862 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4864 = _4453 + _4862;
            float _4866 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4868 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4866;
            float _4870 = 1.0 / _4868;
            float _4872 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4874 = _4872 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4876 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4878 = _4876 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4880 = _4864 * _4870;
            float _4882 = precise::clamp(_4880, 0.0, 1.0);
            float _4884 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4886 = _4884 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4888 = fma(_4882, _4878, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4890 = fma(_4882, _4886, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4892 = fma(_4882, _4874, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4826 = _4892;
            _4820 = _4890;
            _4850 = _4888;
            _4894 = true;
        }
        else
        {
            bool _4896 = _4453 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4898 = isnan(_4453);
            bool _4900 = _4896 || _4898;
            bool _4902 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4904 = _4900 || _4902;
            if (!_4904)
            {
                _4818 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4906 = _4818;
            _4820 = _4906;
            if (!_4904)
            {
                _4824 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4908 = _4824;
            _4826 = _4908;
            if (!_4904)
            {
                _4848 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4910 = _4848;
            bool _4912 = !_4904;
            _4850 = _4910;
            if (!_4912)
            {
                bool _4914 = _4453 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4916 = isnan(_4453);
                bool _4918 = _4914 || _4916;
                bool _4920 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4922 = _4918 || _4920;
                if (!_4922)
                {
                    float _4924 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4926 = _4453 + _4924;
                    float _4928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4930 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4928;
                    float _4932 = 1.0 / _4930;
                    float _4934 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4936 = _4934 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4938 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4940 = _4938 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4942 = _4926 * _4932;
                    float _4944 = precise::clamp(_4942, 0.0, 1.0);
                    float _4946 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4948 = _4946 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4950 = fma(_4944, _4940, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4952 = fma(_4944, _4948, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4954 = fma(_4944, _4936, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4826 = _4954;
                    _4820 = _4952;
                    _4850 = _4950;
                    _4894 = true;
                }
                else
                {
                    _4826 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4820 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4850 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4894 = false;
    float _4956 = _4826;
    float _4958 = _4820;
    float _4960 = _4850;
    float _4962 = _4834 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_99.x = 0.0;
    float _4964 = _4956 * 0.586610972881317138671875;
    bool _4966 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _4962;
    float _4968 = fma(_4958, 0.298911988735198974609375, _4964);
    bool _4970 = _4431 > 0.0;
    bool _4972 = isnan(_4431);
    bool _4974 = _4970 || _4972;
    bool _4976 = isnan(0.0);
    bool _4978 = _4974 || _4976;
    float _4980 = fma(_4960, 0.114477999508380889892578125, _4968);
    float _4982 = -_4980;
    float _4984 = _4982 + _4958;
    float _4986 = -_4980;
    float _4988 = _4986 + _4956;
    float _4990 = -_4980;
    float _4992 = _4990 + _4960;
    float _4994 = fma(_4984, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4980);
    float _4996 = fma(_4988, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4980);
    float _4998 = fma(_4992, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4980);
    bool _5000 = !_4966;
    if (!_5000)
    {
        float _5002 = -_4353;
        float _5004 = _5002 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5006 = -_4355;
        float _5008 = _5006 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5010 = -_4357;
        float _5012 = _5010 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5014 = _5004 * _5004;
        float _5016 = fma(_5008, _5008, _5014);
        float _5018 = fma(_5012, _5012, _5016);
        float _5020 = sqrt(_5018);
        float _5022 = rsqrt(_5018);
        float _5024 = -_5020;
        float _5026 = _5024 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5028 = _5026 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5030 = precise::clamp(_5028, 0.0, 1.0);
        float _5032 = _5008 * _5022;
        float _5034 = _5004 * _5022;
        float _5036 = abs(_5030);
        float _5038 = log2(_5036);
        float _5040 = _5012 * _5022;
        float _5042 = _5032 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5044 = _3901 * _5034;
        float _5046 = -_5034;
        float _5048 = -_5042;
        float _5050 = fma(_5046, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5048);
        float _5052 = fma(_3817, _5032, _5044);
        float _5054 = -_5040;
        float _5056 = fma(_5054, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5050);
        float _5058 = fma(_3755, _5040, _5052);
        float _5060 = precise::clamp(_5058, 0.0, 1.0);
        float _5062 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5064 = _5056 + _5062;
        float _5066 = _5038 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5068 = _5064 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5070 = precise::clamp(_5068, 0.0, 1.0);
        float _5072 = exp2(_5066);
        float _5074 = _5072 * _5070;
        float _5076 = _5060 * _5074;
        float _5078 = _5076 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5080 = _5076 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5082 = _5076 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _5078;
        out.m_99.y = _5080;
        out.m_99.z = _5082;
    }
    out.m_71.x = _4994;
    out.m_71.y = _4996;
    out.m_71.z = _4998;
    if (_4978)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _5084 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5084;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

