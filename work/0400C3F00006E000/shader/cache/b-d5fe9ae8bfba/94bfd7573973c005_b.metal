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
    constant _16* vp_c16 [[id(4)]];
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
    float4 m_69 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1484 = false;
    bool _386 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2244 = as_type<float>(_114);
        out.gl_Position.z = _2244;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = 0.0;
    float _136 = _132;
    if (_128)
    {
        float _138 = float(_98);
        _134 = _138;
    }
    float _140 = _134;
    bool _142 = _132 >= _140;
    bool _144 = !_128;
    bool _146 = _142 || _144;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2313 = as_type<float>(_152);
        out.gl_Position.z = _2313;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_51.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _132 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = _158 * _156;
    float _174 = 0.0;
    if (!_170)
    {
        float _176 = _160 * _160;
        float _178 = _176 * 0.5;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _184 = _180;
    if (!_170)
    {
        float _186 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    float _190 = in.m_49.x;
    float _192 = in.m_49.y;
    float _194 = in.m_49.z;
    float _196 = _182 * 6.283185482025146484375;
    float _198 = floor(_182);
    float _200 = _196 * 0.15915493667125701904296875;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    float _206 = _200 * 6.283185482025146484375;
    float _208 = cos(_206);
    float _210 = 1.4012984643248170709237295832899e-45;
    float _212 = _188;
    if (!_170)
    {
        _210 = _160;
    }
    float _214 = _210;
    float _216 = -_198;
    float _218 = _182 + _216;
    bool _220 = !_170;
    float _222 = _214;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _160 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _160);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _252;
    }
    float _254 = _212;
    bool _256 = !_170;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _160 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _222 = _276;
    }
    float _278 = _222;
    float _280 = in.m_53.w;
    float _282 = in.m_44.x;
    float _284 = in.m_44.y;
    float _286 = in.m_44.z;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _290 = _288 != 0;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _294 = _292 != 0;
    float _296 = fma(_208, 0.5, 0.5);
    bool _298 = _218 < 0.5;
    float _300 = float(_298);
    float _302 = -_218;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _306 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _308 = !_290;
    int _310 = _308 ? 0 : 1;
    float _312 = -_300;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _316 = -_296;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _320 = abs(_310);
    float _322 = fma(_278, _190, _306);
    bool _324 = !_204;
    int _326 = _324 ? 0 : 1;
    float _328 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _330 = !_294;
    int _332 = _330 ? 0 : 1;
    float _334 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _338 = fma(_278, _192, _328);
    int _340 = abs(_326);
    float _342 = fma(_278, _194, _334);
    int _344 = abs(_332);
    float _346 = float(_320);
    float _348 = float(_340);
    float _350 = fma(_322, _280, _282);
    float _352 = abs(_304);
    float _354 = _346 * _352;
    float _356 = fma(_338, _280, _284);
    float _358 = fma(_342, _280, _286);
    float _360 = float(_344);
    float _362 = fma(_348, _318, _354);
    float _364 = abs(_314);
    float _366 = fma(_360, _364, _362);
    bool _368 = !_336;
    float _384;
    if (!_368)
    {
        float _370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _372 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _374 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _376 = _374 * _370;
        float _378 = floor(_376);
        float _380 = -_378;
        float _382 = _376 + _380;
        _384 = _382;
        _386 = true;
    }
    else
    {
        float _388 = float(_98);
        float _390 = 1.0 / _388;
        float _392 = _132 * _390;
        _384 = _392;
    }
    _386 = false;
    float _394 = _384;
    float _396 = in.m_55.y;
    float _398 = _154 * 2.0;
    float _400 = in.m_51.w;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _404 = _402 != 0;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _408 = _406 != 0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _412 = _410 != 0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _414;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _420 = _418 != 0;
    float _422 = in.m_51.y;
    float _424 = floor(_398);
    bool _426 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _428 = isnan(_394);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = _356 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _440 = _356 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    bool _442 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _444 = isnan(_394);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -_436;
    float _456 = _454 + 1.0;
    float _458 = _356 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _460 = 1.0 / _416;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _462;
    float _466 = _452 * _456;
    float _468 = _356 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _470 = -_452;
    float _472 = _470 + 1.0;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _476 = _474 != 0;
    float _478 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[14].x, _438);
    float _480 = -_396;
    float _482 = _480 + 1.0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _486 = _484 != 0;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _490 = _394 + _488;
    float _492 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[14].y, _440);
    bool _494 = _400 > 0.5;
    float _496 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[14].z, _458);
    float _498 = in.m_57.x;
    float _500 = in.m_57.y;
    float _502 = in.m_57.z;
    float _504 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[14].w, _468);
    int _506 = _494 ? as_type<int>(_482) : as_type<int>(_396);
    float _508 = _490 * _460;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _512 = _510 != 0;
    float _514 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[16].w, _504);
    float _516 = fma(_464, _508, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _518 = _512 ? as_type<float>(_506) : _396;
    float _520 = in.m_59.x;
    float _522 = in.m_59.y;
    float _524 = in.m_59.z;
    bool _526 = _422 > 0.5;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _528;
    float _532 = _516 * _466;
    float _534 = in.m_55.x;
    float _536 = _396;
    float _538 = _452;
    float _540 = _516;
    if (_420)
    {
        float _542 = _526 ? _482 : _396;
        _536 = _542;
    }
    float _544 = _536;
    float _546 = fma(_530, _508, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _548 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].y, _532);
    bool _550 = _424 >= 0.0;
    bool _552 = isnan(_424);
    bool _554 = _550 || _552;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    float _560 = _546 * _466;
    bool _562 = _424 > 0.0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _564;
    int _568 = _558 ? 0 : 1;
    float _570 = in.m_53.x;
    float _572 = in.m_53.y;
    float _574 = in.m_53.z;
    bool _576 = _500 != 0.0;
    bool _578 = isnan(_500);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = fma(_566, _508, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _588 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _590 = log2(_588);
    bool _592 = _498 == 0.0;
    bool _594 = !_584;
    bool _596 = _592 && _594;
    float _598 = _586 * _466;
    float _600 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[144].y, _548);
    float _602 = in.m_51.z;
    bool _604 = _502 == 0.0;
    bool _606 = _604 && _596;
    float _608 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].x, _598);
    float _610 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].z, _560);
    float _612 = _422 * 2.0;
    int _614 = ~_568;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    float _620 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[144].x, _608);
    float _622 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[144].z, _610);
    float _624 = floor(_612);
    int _626 = _618;
    float _628 = _608;
    if (!_562)
    {
        int _630 = ~_568;
        int _632 = _630 + 1;
        _626 = _632;
    }
    int _634 = _626;
    float _636 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[16].x, _478);
    float _638 = _514 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _640 = _520;
    if (_606)
    {
        _538 = _520;
    }
    float _642 = _538;
    float _644 = _600 * _572;
    float _646 = 0.0;
    float _648 = _642;
    if (_606)
    {
        _646 = _524;
    }
    float _650 = _646;
    float _652 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[16].z, _496);
    float _654 = _650;
    if (_606)
    {
        _540 = _642;
    }
    float _656 = _540;
    float _658 = _622 * _574;
    float _660 = _656;
    if (_606)
    {
        _628 = _650;
    }
    float _662 = _628;
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _500);
    float _666 = _662;
    if (!_606)
    {
        _648 = _520;
    }
    float _668 = _648;
    float _670 = _602 * 2.0;
    if (!_606)
    {
        _654 = _524;
    }
    float _672 = _654;
    float _674 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _498);
    if (_606)
    {
        _640 = _522;
    }
    float _676 = _640;
    float _678 = _676;
    if (!_606)
    {
        float _680 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _668);
        _660 = _680;
    }
    float _682 = _660;
    if (!_606)
    {
        float _684 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[17].y, _522);
        _678 = _684;
    }
    float _686 = _678;
    if (!_606)
    {
        float _688 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _672);
        _666 = _688;
    }
    float _690 = _666;
    bool _692 = _624 >= 0.0;
    bool _694 = isnan(_624);
    bool _696 = _692 || _694;
    bool _698 = isnan(0.0);
    bool _700 = _696 || _698;
    float _702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _502);
    float _704 = floor(_670);
    float _706 = _620 * _570;
    int _708 = _700 ? 0 : 1;
    float _710 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[16].y, _492);
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _714 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    bool _716 = _624 > 0.0;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _722 = _712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _726 = _718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _730 = _720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _732 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _724);
    float _734 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _714);
    float _736 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    int _738 = ~_708;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    out.m_61.x = _722;
    out.m_61.y = _726;
    out.m_61.z = _730;
    out.m_61.w = _728;
    float _744 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _736);
    int _746 = _742;
    if (!_716)
    {
        int _748 = ~_708;
        int _750 = _748 + 1;
        _746 = _750;
    }
    int _752 = _746;
    float _754 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _734);
    bool _756 = _704 >= 0.0;
    bool _758 = isnan(_704);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _732);
    float _768 = _710 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _770 = _764 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _772 = sqrt(_766);
    bool _774 = _704 > 0.0;
    float _776 = _154 + _602;
    float _778 = _154 + _422;
    float _780 = _776 + (-1.0);
    float _782 = _778 + (-1.0);
    float _784 = _704;
    float _786 = _770;
    int _788 = as_type<int>(_768);
    if (!_476)
    {
        _784 = _534;
    }
    float _790 = _784;
    float _792 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _744);
    float _794 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _798 = _590 * _132;
    float _800 = _422 + _602;
    float _802 = sqrt(_792);
    float _804 = _800 + (-1.0);
    int _806 = ~as_type<int>(_770);
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    float _812 = _422 + (-0.5);
    int _814 = _810;
    float _816 = _790;
    if (!_774)
    {
        int _818 = ~as_type<int>(_770);
        int _820 = _818 + 1;
        _814 = _820;
    }
    int _822 = _814;
    float _824 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _826 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _828 = isnan(1.0);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _834 = _830 || _832;
    float _836 = exp2(_798);
    bool _838 = !_408;
    int _840 = _838 ? 0 : 1;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _844 = 1.0 + _842;
    bool _846 = _834;
    if (!_476)
    {
        _786 = _790;
    }
    float _848 = _786;
    float _850 = _848;
    if (_476)
    {
        _816 = _534;
    }
    float _852 = _816;
    bool _854 = !_412;
    int _856 = _854 ? 0 : 1;
    float _858 = 1.0 / _844;
    float _860 = in.m_63.x;
    float _862 = in.m_63.y;
    float _864 = in.m_63.z;
    bool _866 = !_404;
    int _868 = _866 ? 0 : 1;
    int _870 = abs(_840);
    int _872 = abs(_856);
    int _874 = abs(_868);
    float _876 = -_836;
    float _878 = _876 + 1.0;
    bool _880 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _888 = _884 || _886;
    float _890 = float(_870);
    float _892 = float(_634);
    float _894 = _888 ? _878 : 0.0;
    float _896 = sqrt(_754);
    float _898 = float(_872);
    float _900 = _890 * _892;
    float _902 = float(_752);
    bool _904 = _888;
    if (_834)
    {
        float _906 = _894 * _858;
        _136 = _906;
    }
    float _908 = _136;
    float _910 = float(_874);
    float _912 = _900 * (-2.0);
    float _914 = float(_822);
    float _916 = _898 * _902;
    if (_476)
    {
        bool _918 = _154 > 0.5;
        _904 = _918;
    }
    bool _920 = _904;
    float _922 = fma(_912, _862, _862);
    float _924 = fma(_824, _912, _824);
    float _926 = _910 * _914;
    float _928 = _916 * (-2.0);
    float _930 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].y, _922);
    float _932 = _636 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _934 = _926 * (-2.0);
    float _936 = fma(_928, _864, _864);
    float _938 = _896 * _768;
    float _940 = _772 * _932;
    float _942 = fma(_934, _860, _860);
    float _944 = _652 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _946 = _154 + (-0.5);
    float _948 = fma(_796, _934, _796);
    float _950 = fma(_924, _908, _930);
    float _952 = _802 * _944;
    float _954 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[196].x, _942);
    float _956 = in.m_65.x;
    float _958 = in.m_65.y;
    float _960 = in.m_65.z;
    float _962 = in.m_65.w;
    int _964 = as_type<int>(_934);
    float _966 = _946;
    if (_476)
    {
        float _968 = -_852;
        float _970 = _968 + 1.0;
        _788 = as_type<int>(_970);
    }
    int _972 = _788;
    if (_486)
    {
        float _974 = -_852;
        float _976 = _974 + 1.0;
        _964 = as_type<int>(_976);
    }
    int _978 = _964;
    if (_486)
    {
        bool _980 = _602 > 0.5;
        _846 = _980;
    }
    bool _982 = _846;
    float _984 = fma(_948, _908, _954);
    float _986 = fma(_794, _928, _794);
    float _988 = _602 + (-0.5);
    float _990 = _950 * 0.15915493667125701904296875;
    if (!_486)
    {
        _966 = _852;
    }
    float _992 = _966;
    float _994 = _984 * 0.15915493667125701904296875;
    float _996 = _992;
    if (_476)
    {
        float _998 = _920 ? as_type<float>(_972) : _852;
        _850 = _998;
    }
    float _1000 = _850;
    float _1002 = _938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_486)
    {
        float _1004 = _982 ? as_type<float>(_978) : _852;
        _996 = _1004;
    }
    float _1006 = _996;
    float _1008 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].z, _936);
    float _1010 = _938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1012 = _990 * 6.283185482025146484375;
    float _1014 = sin(_1012);
    float _1016 = _938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1018 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1002);
    float _1020 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1010);
    float _1022 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1016);
    float _1024 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1018);
    float _1026 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1020);
    float _1028 = _990 * 6.283185482025146484375;
    float _1030 = cos(_1028);
    float _1032 = _960 * _668;
    float _1034 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1022);
    float _1036 = _994 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = fma(_986, _908, _1008);
    float _1042 = -_1032;
    float _1044 = fma(_956, _672, _1042);
    float _1046 = _958 * _672;
    float _1048 = _956 * _522;
    float _1050 = _1040 * 0.15915493667125701904296875;
    float _1052 = -_1046;
    float _1054 = fma(_960, _522, _1052);
    float _1056 = _994 * 6.283185482025146484375;
    float _1058 = cos(_1056);
    float _1060 = -_1048;
    float _1062 = fma(_958, _668, _1060);
    float _1064 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1026);
    float _1066 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1024);
    float _1068 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1034);
    float _1070 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1072 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1074 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1076 = _1050 * 6.283185482025146484375;
    float _1078 = cos(_1076);
    float _1080 = _664 * _1070;
    float _1082 = _702 * _1072;
    float _1084 = _1038 * _1014;
    float _1086 = _1054 * _962;
    float _1088 = _674 * _1074;
    float _1090 = _1038 * _1030;
    float _1092 = _1044 * _962;
    float _1094 = _1050 * 6.283185482025146484375;
    float _1096 = sin(_1094);
    float _1098 = _1058 * _1030;
    float _1100 = _1058 * _1014;
    float _1102 = _1062 * _962;
    float _1104 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1106 = _1058 * _1078;
    float _1108 = _1030 * _1078;
    float _1110 = _1038 * _1078;
    float _1112 = _1014 * _1078;
    float _1114 = _1106 * _1080;
    float _1116 = _1110 * _1080;
    float _1118 = fma(_1096, _1098, _1084);
    float _1120 = -_1080;
    float _1122 = _1096 * _1120;
    float _1124 = -_1100;
    float _1126 = fma(_1096, _1090, _1124);
    float _1128 = -_1090;
    float _1130 = fma(_1096, _1100, _1128);
    float _1132 = fma(_1118, _1088, _1114);
    float _1134 = fma(_1096, _1084, _1098);
    float _1136 = fma(_1108, _1088, _1122);
    float _1138 = fma(_1126, _1088, _1116);
    float _1140 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1142 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1144 = fma(_1130, _1082, _1132);
    float _1146 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1148 = -_1096;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1140);
    float _1152 = -_1096;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1142);
    float _1156 = fma(_1112, _1082, _1136);
    float _1158 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1160 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1162 = -_1096;
    float _1164 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1146);
    float _1166 = fma(_1134, _1082, _1138);
    float _1168 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1158);
    float _1170 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1160);
    float _1172 = _1064 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1174 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1168);
    float _1178 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1170);
    float _1180 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1182 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1150);
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1188 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1190 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1180);
    float _1192 = _1172 + _1184;
    float _1194 = _1104 + _1186;
    float _1196 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1188);
    float _1198 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1202 = _1192 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1206 = _1194 + _1204;
    float _1208 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1210 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1212 = _1202 * _1202;
    float _1214 = _1206 * _1206;
    float _1216 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1218 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1220 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1208);
    float _1222 = _1212 + _1214;
    float _1224 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1216);
    float _1226 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1218);
    float _1228 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1210);
    float _1230 = sqrt(_1222);
    float _1232 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1196);
    float _1234 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1226);
    float _1236 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1190);
    float _1238 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1198);
    float _1240 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1154);
    float _1242 = _1066 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1244 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1248 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1164);
    float _1250 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1228);
    float _1252 = _1242 + _1244;
    float _1254 = _1182 * _686;
    float _1256 = _1240 * _686;
    float _1258 = _1248 * _686;
    float _1260 = _1182 * _958;
    bool _1262 = _1230 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1266 = _1240 * _958;
    float _1268 = _1092 * _1182;
    float _1270 = _1092 * _1240;
    float _1272 = _1092 * _1248;
    float _1274 = _1248 * _958;
    float _1276 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1220);
    float _1278 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1224);
    float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1282 = fma(_1236, _682, _1254);
    float _1284 = fma(_1238, _682, _1256);
    float _1286 = fma(_1232, _682, _1258);
    float _1288 = _1248;
    float _1290 = _1212;
    float _1292 = _1214;
    float _1294 = _1194;
    float _1296 = _1192;
    float _1298 = _1102;
    if (!_1262)
    {
        _1288 = _1252;
    }
    float _1300 = _1288;
    bool _1302 = !_1262;
    float _1304 = _1300;
    if (!_1302)
    {
        float _1306 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1310 = _1230 + _1308;
        float _1312 = _1252 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1314 = rsqrt(_1222);
        float _1316 = _1310 * _1306;
        float _1318 = _1316 * 0.15915493667125701904296875;
        float _1320 = _1318 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        float _1324 = _1318 * 6.283185482025146484375;
        float _1326 = cos(_1324);
        float _1328 = fma(_1322, _1312, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1330 = _1314 * _1328;
        float _1332 = fma(_1202, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1334 = _1326 + (-1.0);
        float _1336 = fma(_1206, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1340 = _1332 + _1338;
        float _1342 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1346 = _1336 + _1344;
        float _1348 = _1340 * _1340;
        float _1350 = fma(_1252, _1326, _1342);
        float _1352 = _1346 * _1346;
        _1304 = _1350;
        _1290 = _1348;
        _1292 = _1352;
        _1294 = _1336;
        _1296 = _1332;
    }
    float _1354 = _1304;
    float _1356 = _1290;
    float _1358 = _1292;
    float _1360 = _1294;
    float _1362 = _1296;
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1368 = _1354 + _1366;
    float _1370 = _518 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1372 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1374 = fma(_1236, _956, _1260);
    float _1376 = fma(_1368, _1368, _1356);
    float _1378 = fma(_1086, _1236, _1268);
    float _1380 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1382 = fma(_1232, _956, _1274);
    float _1384 = fma(_1086, _1232, _1272);
    float _1386 = _1376 + _1358;
    float _1388 = _1372 * _1246;
    float _1390 = fma(_1086, _1238, _1270);
    float _1392 = _544 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1394 = fma(_1238, _956, _1266);
    float _1396 = _1380 * _1364;
    float _1398 = _1392 * _1264;
    float _1400 = sqrt(_1386);
    float _1402 = fma(_1276, _690, _1282);
    float _1404 = fma(_1276, _960, _1374);
    float _1406 = fma(_1102, _1276, _1378);
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1414 = fma(_1250, _690, _1284);
    float _1416 = fma(_1250, _960, _1394);
    float _1418 = fma(_1278, _690, _1286);
    float _1420 = fma(_1278, _960, _1382);
    float _1422 = _1370 * _1280;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1426 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = fma(_1102, _1250, _1390);
    float _1434 = fma(_1102, _1278, _1384);
    out.m_67.x = _1388;
    out.m_67.y = _1398;
    out.m_67.z = _1396;
    out.m_67.w = _1422;
    bool _1436 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1438 = isnan(_1400);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1444 = _1440 || _1442;
    out.m_69.x = _1426;
    out.m_69.y = _1428;
    out.m_69.z = _1430;
    out.m_69.w = _1424;
    out.m_71.x = _1402;
    out.m_71.y = _1414;
    out.m_71.z = _1418;
    out.m_73.x = _1404;
    out.m_73.y = _1416;
    out.m_73.z = _1420;
    float _1446 = _1388;
    float _1448 = _1396;
    if (!_1444)
    {
        _1298 = 1.0;
    }
    float _1450 = _1298;
    out.m_75.x = _1406;
    out.m_75.y = _1432;
    out.m_75.z = _1434;
    bool _1452 = !_1444;
    float _1454 = _1450;
    if (!_1452)
    {
        bool _1456 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1458 = isnan(_1400);
        bool _1460 = _1456 || _1458;
        bool _1462 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1464 = _1460 || _1462;
        if (!_1464)
        {
            float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1468 = _1400 + _1466;
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1472 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1470;
            float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1478 = 1.0 / _1472;
            float _1480 = _1468 * _1478;
            float _1482 = fma(_1480, _1476, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1454 = _1482;
            _1484 = true;
        }
        else
        {
            bool _1486 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1488 = isnan(_1400);
            bool _1490 = _1486 || _1488;
            bool _1492 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1494 = _1490 || _1492;
            if (!_1494)
            {
                float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1498 = _1400 + _1496;
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1502 = _1500 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1506 = _1504 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1508 = 1.0 / _1502;
                float _1510 = _1498 * _1508;
                float _1512 = fma(_1510, _1506, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1454 = _1512;
                _1484 = true;
            }
            else
            {
                _1454 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1484 = false;
    float _1514 = _1454;
    float _1516 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1520 = _1360 + _1518;
    float _1522 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1516);
    float _1524 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1526 = fma(_1520, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1528 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1522);
    bool _1530 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan(0.5);
    bool _1538 = _1534 || _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1542 = _1354 + _1540;
    bool _1544 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan(0.5);
    bool _1552 = _1548 || _1550;
    float _1554 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1556 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1524);
    float _1558 = fma(_1542, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1560 = 1.0 / _1554;
    float _1562 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1556);
    float _1564 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1566 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1568 = _1514;
    if (_1552)
    {
        _1566 = 1.0;
    }
    float _1570 = _1566;
    float _1572 = _1564 + _1554;
    float _1574 = _1572 * _1560;
    float _1576 = _1574 * 0.5;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1580 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1578);
    float _1582 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1584 = _1362 + _1582;
    float _1586 = 1.0 / _1580;
    float _1588 = fma(_1584, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1590 = _1584;
    float _1592 = _1560;
    float _1594 = _1588;
    float _1596 = _1570;
    if (_1538)
    {
        _1568 = _1558;
    }
    float _1598 = _1568;
    float _1600 = _1598;
    if (_1538)
    {
        _1590 = _1526;
    }
    float _1602 = _1590;
    float _1604 = _1602;
    if (_1538)
    {
        _1592 = _1588;
    }
    float _1606 = _1592;
    float _1608 = _1606;
    if (!_1538)
    {
        float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1612 = _1242 + _1610;
        float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1616 = _1172 + _1614;
        float _1618 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1620 = _1612 * _1612;
        float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1624 = _1104 + _1622;
        float _1626 = fma(_1616, _1616, _1620);
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1630 = fma(_1624, _1624, _1626);
        float _1632 = sqrt(_1630);
        float _1634 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1636 = precise::min(_1632, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1638 = _1636 * _1628;
        float _1640 = -_1172;
        float _1642 = _1640 + _1588;
        float _1644 = -_1104;
        float _1646 = _1644 + _1526;
        float _1648 = _1634 * _1638;
        float _1650 = -_1242;
        float _1652 = _1650 + _1558;
        float _1654 = fma(_1642, _1648, _1172);
        float _1656 = fma(_1652, _1648, _1242);
        float _1658 = fma(_1646, _1648, _1104);
        _1594 = _1648;
        _1600 = _1656;
        _1608 = _1654;
        _1604 = _1658;
    }
    float _1660 = _1594;
    float _1662 = _1600;
    float _1664 = _1608;
    float _1666 = _1604;
    float _1668 = _1660;
    if (_1552)
    {
        _1668 = 1.0;
    }
    float _1670 = _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1674 = _1586 * _1672;
    float _1676 = _1670;
    if (!_1552)
    {
        float _1678 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1680 = _1678 * 0.15915493667125701904296875;
        float _1682 = _1680 * 6.283185482025146484375;
        float _1684 = cos(_1682);
        float _1686 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1688 = _1686 * 0.15915493667125701904296875;
        float _1690 = _1680 * 6.283185482025146484375;
        float _1692 = sin(_1690);
        float _1694 = 1.0 / _1684;
        float _1696 = _1688 * 6.283185482025146484375;
        float _1698 = cos(_1696);
        float _1700 = _1692 * _1694;
        float _1702 = _1688 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1708 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1706;
        float _1710 = _1698 * _1700;
        float _1712 = 1.0 / _1708;
        float _1714 = 1.0 / _1710;
        float _1716 = _1704 * _1714;
        float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1720 = fma(_1674, _1716, _1718);
        float _1722 = _1720 * _1712;
        float _1724 = precise::clamp(_1722, 0.0, 1.0);
        _1446 = _1680;
        _1596 = _1724;
    }
    float _1726 = _1446;
    float _1728 = _1596;
    float _1730 = _1726;
    if (!_1552)
    {
        float _1732 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1734 = _1732 * 0.15915493667125701904296875;
        float _1736 = _1734 * 6.283185482025146484375;
        float _1738 = cos(_1736);
        float _1740 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1742 = _1740 * 0.15915493667125701904296875;
        float _1744 = _1734 * 6.283185482025146484375;
        float _1746 = sin(_1744);
        float _1748 = 1.0 / _1738;
        float _1750 = _1742 * 6.283185482025146484375;
        float _1752 = cos(_1750);
        float _1754 = _1746 * _1748;
        float _1756 = _1742 * 6.283185482025146484375;
        float _1758 = sin(_1756);
        float _1760 = _1752 * _1754;
        float _1762 = 1.0 / _1760;
        float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1766 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1764;
        float _1768 = 1.0 / _1766;
        float _1770 = _1758 * _1762;
        float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1774 = fma(_1674, _1770, _1772);
        float _1776 = _1774 * _1768;
        float _1778 = precise::clamp(_1776, 0.0, 1.0);
        float _1780 = -_1778;
        float _1782 = _1780 + 1.0;
        _1730 = _1760;
        _1676 = _1782;
    }
    float _1784 = _1730;
    float _1786 = _1676;
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1790 = _1662 + _1788;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1794 = _1664 + _1792;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1798 = _1666 + _1796;
    float _1800 = _1790 * _1790;
    float _1802 = fma(_1794, _1794, _1800);
    float _1804 = fma(_1798, _1798, _1802);
    float _1806 = rsqrt(_1804);
    float _1808 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1810 = _1794 * _1808;
    float _1812 = _1798 * _1808;
    float _1814 = _1810 * _1810;
    float _1816 = _1812 * _1812;
    float _1818 = _1814 + _1816;
    float _1820 = sqrt(_1818);
    bool _1822 = _1820 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1826 = _1820 + _1824;
    float _1828 = _1798;
    float _1830 = _1800;
    float _1832 = _1826;
    float _1834 = _1808;
    float _1836 = _1810;
    if (_1822)
    {
        float _1838 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1828 = _1838;
    }
    float _1840 = _1828;
    if (_1822)
    {
        float _1842 = rsqrt(_1818);
        _1830 = _1842;
    }
    float _1844 = _1830;
    float _1846 = _1844;
    if (_1822)
    {
        float _1848 = _1826 * _1840;
        _1832 = _1848;
    }
    float _1850 = _1832;
    if (_1822)
    {
        float _1852 = _1850 * 0.15915493667125701904296875;
        _1448 = _1852;
    }
    float _1854 = _1448;
    float _1856 = _1806;
    if (_1822)
    {
        float _1858 = _1854 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        _1856 = _1860;
    }
    float _1862 = _1856;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1866 = precise::max(0.0, _1864);
    float _1868 = _1784;
    float _1870 = _1866;
    float _1872 = _1864;
    if (_1822)
    {
        float _1874 = _1854 * 6.283185482025146484375;
        float _1876 = cos(_1874);
        _1868 = _1876;
    }
    float _1878 = _1868;
    float _1880 = -_1808;
    float _1882 = -_1866;
    float _1884 = fma(_1790, _1880, _1882);
    float _1886 = _1884;
    if (_1822)
    {
        float _1888 = _1884 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1888;
    }
    float _1890 = _1870;
    float _1892 = sqrt(_1804);
    float _1894 = _1862;
    float _1896 = _1890;
    if (_1822)
    {
        float _1898 = fma(_1862, _1890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1894 = _1898;
    }
    float _1900 = _1894;
    float _1902 = _1900;
    if (_1822)
    {
        float _1904 = _1878 + (-1.0);
        _1872 = _1904;
    }
    float _1906 = _1872;
    float _1908 = _1906;
    if (_1822)
    {
        float _1910 = _1844 * _1900;
        _1834 = _1910;
    }
    float _1912 = _1834;
    if (!_1822)
    {
        _1846 = _1884;
    }
    float _1914 = _1846;
    float _1916 = _1914;
    if (_1822)
    {
        float _1918 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1896 = _1918;
    }
    float _1920 = _1896;
    if (_1822)
    {
        float _1922 = _1810 * _1912;
        _1836 = _1922;
    }
    float _1924 = _1836;
    if (!_1822)
    {
        _1902 = _1812;
    }
    float _1926 = _1902;
    float _1928 = _1926;
    if (_1822)
    {
        float _1930 = _1812 * _1912;
        _1928 = _1930;
    }
    float _1932 = _1928;
    if (!_1822)
    {
        _1908 = _1814;
    }
    float _1934 = _1908;
    float _1936 = _1934;
    if (_1822)
    {
        float _1938 = fma(_1884, _1878, _1920);
        _1916 = _1938;
    }
    float _1940 = _1916;
    if (_1822)
    {
        float _1942 = _1924 * _1924;
        _1936 = _1942;
    }
    float _1944 = _1936;
    if (!_1822)
    {
        _1886 = _1816;
    }
    float _1946 = _1886;
    float _1948 = _1946;
    if (_1822)
    {
        float _1950 = _1932 * _1932;
        _1948 = _1950;
    }
    float _1952 = _1948;
    float _1954 = fma(_1940, _1940, _1944);
    float _1956 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1958 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1960 = _1954 + _1952;
    float _1962 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1956);
    float _1964 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1968 = fma(_1892, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1966);
    float _1970 = precise::clamp(_1968, 0.0, 1.0);
    float _1972 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1974 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1962);
    float _1976 = rsqrt(_1960);
    float _1978 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1964);
    float _1980 = -_1970;
    float _1982 = _1980 + 1.0;
    float _1984 = _1974 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1986 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1988 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1958);
    float _1990 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1978);
    float _1992 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1994 = abs(_1982);
    float _1996 = log2(_1994);
    float _1998 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1986);
    float _2000 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1988);
    float _2002 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2004 = -_1992;
    float _2006 = fma(_2004, _1972, 1.0);
    float _2008 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1998);
    float _2010 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2012 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2014 = _1976 * _1924;
    float _2016 = _1976 * _1940;
    float _2018 = _1976 * _1932;
    float _2020 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2012);
    float _2022 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2024 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2026 = log2(_2006);
    float _2028 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2020);
    float _2030 = -_2022;
    float _2032 = fma(_2016, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2030);
    float _2034 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2036 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2038 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2028);
    float _2040 = -_2018;
    float _2042 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2032);
    float _2044 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2046 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2036);
    float _2048 = exp2(_2034);
    float _2050 = fma(_2042, -0.5, 0.5);
    float _2052 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2044);
    float _2054 = fma(_2042, 0.5, 0.5);
    float _2056 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2046);
    float _2058 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2052);
    float _2060 = _2016 + 1.0;
    float _2062 = 1.0 / _2038;
    float _2064 = fma(_2054, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2066 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2058);
    float _2068 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2056);
    float _2070 = _2026 * 0.693147182464599609375;
    float _2072 = fma(_2054, _2064, -0.212114393711090087890625);
    float _2074 = sqrt(_2050);
    float _2076 = -_2016;
    float _2078 = fma(_2048, _2060, _2076);
    float _2080 = fma(_2054, _2072, 1.570728778839111328125);
    float _2082 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2084 = fma(_2078, 0.5, 0.5);
    float _2086 = _2066 * _2062;
    float _2088 = _2068 * _2062;
    float _2090 = fma(_2086, 0.5, 0.5);
    float _2092 = fma(_2088, -0.5, 0.5);
    float _2094 = _2074 * 0.636619746685028076171875;
    float3 _5454 = float3(_2090, _2092, _2082);
    float _2096 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5454, float3(0.0), isnan(_5454)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5454, float3(0.0), isnan(_5454)), level(0.0)).x;
    float3 _5465 = float3(_2090, _2092, _2082);
    float4 _2099 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5465, float3(0.0), isnan(_5465)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5465, float3(0.0), isnan(_5465)), level(0.0)).xyzw;
    float _2101 = _2099.x;
    float _2103 = _2099.y;
    float _2105 = _2099.z;
    float _2107 = _2099.w;
    float _2109 = -_2080;
    float _2111 = fma(_2094, _2109, 1.0);
    float2 _5487 = float2(_2111, _2084);
    float3 _2115 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5487, float2(0.0), isnan(_5487)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5487, float2(0.0), isnan(_5487)), level(0.0)).xyz;
    float _2117 = _2115.x;
    float _2119 = _2115.y;
    float _2121 = _2115.z;
    float _2123 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2125 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2127 = _1728 * _1786;
    bool _2129 = _1728 > 0.0;
    bool _2131 = isnan(_1728);
    bool _2133 = _2129 || _2131;
    bool _2135 = isnan(0.0);
    bool _2137 = _2133 || _2135;
    float _2139 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2125);
    float _2141 = exp2(_2123);
    float _2143 = _2127 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2145 = _1786 <= 0.0;
    bool _2147 = !_2137;
    bool _2149 = _2145 || _2147;
    float _2151 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2139);
    float _2153 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2151);
    float _2155 = _366 * _2143;
    float _2157 = _2153 + _2038;
    float _2159 = _2155 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2066;
    out.gl_Position.y = _2068;
    out.gl_Position.z = _2153;
    out.gl_Position.w = _2038;
    float _2161 = _2157 * 0.5;
    float _2163 = -_2141;
    float _2165 = _2163 + 1.0;
    out.m_47.x = _2159;
    float _2167 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _2161;
    out.m_77.w = _2038;
    float _2169 = _2167 * _2096;
    float _2171 = -_2167;
    float _2173 = _2171 + 1.0;
    float _2175 = _2107 * _2169;
    float _2177 = _2107 * _2173;
    float _2179 = _2121 * _2169;
    float _2181 = fma(_2117, _2175, _2101);
    float _2183 = fma(_2119, _2175, _2103);
    float _2185 = fma(_2107, _2179, _2105);
    out.m_79.x = _2181;
    out.m_79.y = _2183;
    out.m_79.z = _2185;
    out.m_79.w = _2177;
    if (!_2149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2187 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2187;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1484 = false;
    bool _386 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2244 = as_type<float>(_114);
        out.gl_Position.z = _2244;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = 0.0;
    float _136 = _132;
    if (_128)
    {
        float _138 = float(_98);
        _134 = _138;
    }
    float _140 = _134;
    bool _142 = _132 >= _140;
    bool _144 = !_128;
    bool _146 = _142 || _144;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2313 = as_type<float>(_152);
        out.gl_Position.z = _2313;
    }
    if (_146)
    {
        return out;
    }
    float _154 = in.m_51.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _132 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = _158 * _156;
    float _174 = 0.0;
    if (!_170)
    {
        float _176 = _160 * _160;
        float _178 = _176 * 0.5;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _184 = _180;
    if (!_170)
    {
        float _186 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    float _190 = in.m_49.x;
    float _192 = in.m_49.y;
    float _194 = in.m_49.z;
    float _196 = _182 * 6.283185482025146484375;
    float _198 = floor(_182);
    float _200 = _196 * 0.15915493667125701904296875;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    float _206 = _200 * 6.283185482025146484375;
    float _208 = cos(_206);
    float _210 = 1.4012984643248170709237295832899e-45;
    float _212 = _188;
    if (!_170)
    {
        _210 = _160;
    }
    float _214 = _210;
    float _216 = -_198;
    float _218 = _182 + _216;
    bool _220 = !_170;
    float _222 = _214;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _160 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _160);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _252;
    }
    float _254 = _212;
    bool _256 = !_170;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _160 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _222 = _276;
    }
    float _278 = _222;
    float _280 = in.m_53.w;
    float _282 = in.m_44.x;
    float _284 = in.m_44.y;
    float _286 = in.m_44.z;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _290 = _288 != 0;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _294 = _292 != 0;
    float _296 = fma(_208, 0.5, 0.5);
    bool _298 = _218 < 0.5;
    float _300 = float(_298);
    float _302 = -_218;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _306 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _308 = !_290;
    int _310 = _308 ? 0 : 1;
    float _312 = -_300;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _316 = -_296;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _320 = abs(_310);
    float _322 = fma(_278, _190, _306);
    bool _324 = !_204;
    int _326 = _324 ? 0 : 1;
    float _328 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _330 = !_294;
    int _332 = _330 ? 0 : 1;
    float _334 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _338 = fma(_278, _192, _328);
    int _340 = abs(_326);
    float _342 = fma(_278, _194, _334);
    int _344 = abs(_332);
    float _346 = float(_320);
    float _348 = float(_340);
    float _350 = fma(_322, _280, _282);
    float _352 = abs(_304);
    float _354 = _346 * _352;
    float _356 = fma(_338, _280, _284);
    float _358 = fma(_342, _280, _286);
    float _360 = float(_344);
    float _362 = fma(_348, _318, _354);
    float _364 = abs(_314);
    float _366 = fma(_360, _364, _362);
    bool _368 = !_336;
    float _384;
    if (!_368)
    {
        float _370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _372 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _374 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _376 = _374 * _370;
        float _378 = floor(_376);
        float _380 = -_378;
        float _382 = _376 + _380;
        _384 = _382;
        _386 = true;
    }
    else
    {
        float _388 = float(_98);
        float _390 = 1.0 / _388;
        float _392 = _132 * _390;
        _384 = _392;
    }
    _386 = false;
    float _394 = _384;
    float _396 = in.m_55.y;
    float _398 = _154 * 2.0;
    float _400 = in.m_51.w;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _404 = _402 != 0;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _408 = _406 != 0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _412 = _410 != 0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _414;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _420 = _418 != 0;
    float _422 = in.m_51.y;
    float _424 = floor(_398);
    bool _426 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _428 = isnan(_394);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = _356 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _440 = _356 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    bool _442 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _444 = isnan(_394);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -_436;
    float _456 = _454 + 1.0;
    float _458 = _356 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _460 = 1.0 / _416;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _462;
    float _466 = _452 * _456;
    float _468 = _356 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _470 = -_452;
    float _472 = _470 + 1.0;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _476 = _474 != 0;
    float _478 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[14].x, _438);
    float _480 = -_396;
    float _482 = _480 + 1.0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _486 = _484 != 0;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _490 = _394 + _488;
    float _492 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[14].y, _440);
    bool _494 = _400 > 0.5;
    float _496 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[14].z, _458);
    float _498 = in.m_57.x;
    float _500 = in.m_57.y;
    float _502 = in.m_57.z;
    float _504 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[14].w, _468);
    int _506 = _494 ? as_type<int>(_482) : as_type<int>(_396);
    float _508 = _490 * _460;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _512 = _510 != 0;
    float _514 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[16].w, _504);
    float _516 = fma(_464, _508, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _518 = _512 ? as_type<float>(_506) : _396;
    float _520 = in.m_59.x;
    float _522 = in.m_59.y;
    float _524 = in.m_59.z;
    bool _526 = _422 > 0.5;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _528;
    float _532 = _516 * _466;
    float _534 = in.m_55.x;
    float _536 = _396;
    float _538 = _452;
    float _540 = _516;
    if (_420)
    {
        float _542 = _526 ? _482 : _396;
        _536 = _542;
    }
    float _544 = _536;
    float _546 = fma(_530, _508, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _548 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].y, _532);
    bool _550 = _424 >= 0.0;
    bool _552 = isnan(_424);
    bool _554 = _550 || _552;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    float _560 = _546 * _466;
    bool _562 = _424 > 0.0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _564;
    int _568 = _558 ? 0 : 1;
    float _570 = in.m_53.x;
    float _572 = in.m_53.y;
    float _574 = in.m_53.z;
    bool _576 = _500 != 0.0;
    bool _578 = isnan(_500);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = fma(_566, _508, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _588 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _590 = log2(_588);
    bool _592 = _498 == 0.0;
    bool _594 = !_584;
    bool _596 = _592 && _594;
    float _598 = _586 * _466;
    float _600 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[144].y, _548);
    float _602 = in.m_51.z;
    bool _604 = _502 == 0.0;
    bool _606 = _604 && _596;
    float _608 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].x, _598);
    float _610 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].z, _560);
    float _612 = _422 * 2.0;
    int _614 = ~_568;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    float _620 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[144].x, _608);
    float _622 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[144].z, _610);
    float _624 = floor(_612);
    int _626 = _618;
    float _628 = _608;
    if (!_562)
    {
        int _630 = ~_568;
        int _632 = _630 + 1;
        _626 = _632;
    }
    int _634 = _626;
    float _636 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[16].x, _478);
    float _638 = _514 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _640 = _520;
    if (_606)
    {
        _538 = _520;
    }
    float _642 = _538;
    float _644 = _600 * _572;
    float _646 = 0.0;
    float _648 = _642;
    if (_606)
    {
        _646 = _524;
    }
    float _650 = _646;
    float _652 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[16].z, _496);
    float _654 = _650;
    if (_606)
    {
        _540 = _642;
    }
    float _656 = _540;
    float _658 = _622 * _574;
    float _660 = _656;
    if (_606)
    {
        _628 = _650;
    }
    float _662 = _628;
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _500);
    float _666 = _662;
    if (!_606)
    {
        _648 = _520;
    }
    float _668 = _648;
    float _670 = _602 * 2.0;
    if (!_606)
    {
        _654 = _524;
    }
    float _672 = _654;
    float _674 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _498);
    if (_606)
    {
        _640 = _522;
    }
    float _676 = _640;
    float _678 = _676;
    if (!_606)
    {
        float _680 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _668);
        _660 = _680;
    }
    float _682 = _660;
    if (!_606)
    {
        float _684 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[17].y, _522);
        _678 = _684;
    }
    float _686 = _678;
    if (!_606)
    {
        float _688 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _672);
        _666 = _688;
    }
    float _690 = _666;
    bool _692 = _624 >= 0.0;
    bool _694 = isnan(_624);
    bool _696 = _692 || _694;
    bool _698 = isnan(0.0);
    bool _700 = _696 || _698;
    float _702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _502);
    float _704 = floor(_670);
    float _706 = _620 * _570;
    int _708 = _700 ? 0 : 1;
    float _710 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[16].y, _492);
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _714 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    bool _716 = _624 > 0.0;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _722 = _712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _726 = _718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _730 = _720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _732 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _724);
    float _734 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _714);
    float _736 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    int _738 = ~_708;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    out.m_61.x = _722;
    out.m_61.y = _726;
    out.m_61.z = _730;
    out.m_61.w = _728;
    float _744 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _736);
    int _746 = _742;
    if (!_716)
    {
        int _748 = ~_708;
        int _750 = _748 + 1;
        _746 = _750;
    }
    int _752 = _746;
    float _754 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _734);
    bool _756 = _704 >= 0.0;
    bool _758 = isnan(_704);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _732);
    float _768 = _710 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _770 = _764 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _772 = sqrt(_766);
    bool _774 = _704 > 0.0;
    float _776 = _154 + _602;
    float _778 = _154 + _422;
    float _780 = _776 + (-1.0);
    float _782 = _778 + (-1.0);
    float _784 = _704;
    float _786 = _770;
    int _788 = as_type<int>(_768);
    if (!_476)
    {
        _784 = _534;
    }
    float _790 = _784;
    float _792 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _744);
    float _794 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _798 = _590 * _132;
    float _800 = _422 + _602;
    float _802 = sqrt(_792);
    float _804 = _800 + (-1.0);
    int _806 = ~as_type<int>(_770);
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    float _812 = _422 + (-0.5);
    int _814 = _810;
    float _816 = _790;
    if (!_774)
    {
        int _818 = ~as_type<int>(_770);
        int _820 = _818 + 1;
        _814 = _820;
    }
    int _822 = _814;
    float _824 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _826 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _828 = isnan(1.0);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _834 = _830 || _832;
    float _836 = exp2(_798);
    bool _838 = !_408;
    int _840 = _838 ? 0 : 1;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _844 = 1.0 + _842;
    bool _846 = _834;
    if (!_476)
    {
        _786 = _790;
    }
    float _848 = _786;
    float _850 = _848;
    if (_476)
    {
        _816 = _534;
    }
    float _852 = _816;
    bool _854 = !_412;
    int _856 = _854 ? 0 : 1;
    float _858 = 1.0 / _844;
    float _860 = in.m_63.x;
    float _862 = in.m_63.y;
    float _864 = in.m_63.z;
    bool _866 = !_404;
    int _868 = _866 ? 0 : 1;
    int _870 = abs(_840);
    int _872 = abs(_856);
    int _874 = abs(_868);
    float _876 = -_836;
    float _878 = _876 + 1.0;
    bool _880 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _888 = _884 || _886;
    float _890 = float(_870);
    float _892 = float(_634);
    float _894 = _888 ? _878 : 0.0;
    float _896 = sqrt(_754);
    float _898 = float(_872);
    float _900 = _890 * _892;
    float _902 = float(_752);
    bool _904 = _888;
    if (_834)
    {
        float _906 = _894 * _858;
        _136 = _906;
    }
    float _908 = _136;
    float _910 = float(_874);
    float _912 = _900 * (-2.0);
    float _914 = float(_822);
    float _916 = _898 * _902;
    if (_476)
    {
        bool _918 = _154 > 0.5;
        _904 = _918;
    }
    bool _920 = _904;
    float _922 = fma(_912, _862, _862);
    float _924 = fma(_824, _912, _824);
    float _926 = _910 * _914;
    float _928 = _916 * (-2.0);
    float _930 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].y, _922);
    float _932 = _636 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _934 = _926 * (-2.0);
    float _936 = fma(_928, _864, _864);
    float _938 = _896 * _768;
    float _940 = _772 * _932;
    float _942 = fma(_934, _860, _860);
    float _944 = _652 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _946 = _154 + (-0.5);
    float _948 = fma(_796, _934, _796);
    float _950 = fma(_924, _908, _930);
    float _952 = _802 * _944;
    float _954 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[196].x, _942);
    float _956 = in.m_65.x;
    float _958 = in.m_65.y;
    float _960 = in.m_65.z;
    float _962 = in.m_65.w;
    int _964 = as_type<int>(_934);
    float _966 = _946;
    if (_476)
    {
        float _968 = -_852;
        float _970 = _968 + 1.0;
        _788 = as_type<int>(_970);
    }
    int _972 = _788;
    if (_486)
    {
        float _974 = -_852;
        float _976 = _974 + 1.0;
        _964 = as_type<int>(_976);
    }
    int _978 = _964;
    if (_486)
    {
        bool _980 = _602 > 0.5;
        _846 = _980;
    }
    bool _982 = _846;
    float _984 = fma(_948, _908, _954);
    float _986 = fma(_794, _928, _794);
    float _988 = _602 + (-0.5);
    float _990 = _950 * 0.15915493667125701904296875;
    if (!_486)
    {
        _966 = _852;
    }
    float _992 = _966;
    float _994 = _984 * 0.15915493667125701904296875;
    float _996 = _992;
    if (_476)
    {
        float _998 = _920 ? as_type<float>(_972) : _852;
        _850 = _998;
    }
    float _1000 = _850;
    float _1002 = _938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_486)
    {
        float _1004 = _982 ? as_type<float>(_978) : _852;
        _996 = _1004;
    }
    float _1006 = _996;
    float _1008 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].z, _936);
    float _1010 = _938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1012 = _990 * 6.283185482025146484375;
    float _1014 = sin(_1012);
    float _1016 = _938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1018 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1002);
    float _1020 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1010);
    float _1022 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1016);
    float _1024 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1018);
    float _1026 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1020);
    float _1028 = _990 * 6.283185482025146484375;
    float _1030 = cos(_1028);
    float _1032 = _960 * _668;
    float _1034 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1022);
    float _1036 = _994 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = fma(_986, _908, _1008);
    float _1042 = -_1032;
    float _1044 = fma(_956, _672, _1042);
    float _1046 = _958 * _672;
    float _1048 = _956 * _522;
    float _1050 = _1040 * 0.15915493667125701904296875;
    float _1052 = -_1046;
    float _1054 = fma(_960, _522, _1052);
    float _1056 = _994 * 6.283185482025146484375;
    float _1058 = cos(_1056);
    float _1060 = -_1048;
    float _1062 = fma(_958, _668, _1060);
    float _1064 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1026);
    float _1066 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1024);
    float _1068 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1034);
    float _1070 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1072 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1074 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1076 = _1050 * 6.283185482025146484375;
    float _1078 = cos(_1076);
    float _1080 = _664 * _1070;
    float _1082 = _702 * _1072;
    float _1084 = _1038 * _1014;
    float _1086 = _1054 * _962;
    float _1088 = _674 * _1074;
    float _1090 = _1038 * _1030;
    float _1092 = _1044 * _962;
    float _1094 = _1050 * 6.283185482025146484375;
    float _1096 = sin(_1094);
    float _1098 = _1058 * _1030;
    float _1100 = _1058 * _1014;
    float _1102 = _1062 * _962;
    float _1104 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1106 = _1058 * _1078;
    float _1108 = _1030 * _1078;
    float _1110 = _1038 * _1078;
    float _1112 = _1014 * _1078;
    float _1114 = _1106 * _1080;
    float _1116 = _1110 * _1080;
    float _1118 = fma(_1096, _1098, _1084);
    float _1120 = -_1080;
    float _1122 = _1096 * _1120;
    float _1124 = -_1100;
    float _1126 = fma(_1096, _1090, _1124);
    float _1128 = -_1090;
    float _1130 = fma(_1096, _1100, _1128);
    float _1132 = fma(_1118, _1088, _1114);
    float _1134 = fma(_1096, _1084, _1098);
    float _1136 = fma(_1108, _1088, _1122);
    float _1138 = fma(_1126, _1088, _1116);
    float _1140 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1142 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1144 = fma(_1130, _1082, _1132);
    float _1146 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1148 = -_1096;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1140);
    float _1152 = -_1096;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1142);
    float _1156 = fma(_1112, _1082, _1136);
    float _1158 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1160 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1162 = -_1096;
    float _1164 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1146);
    float _1166 = fma(_1134, _1082, _1138);
    float _1168 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1158);
    float _1170 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1160);
    float _1172 = _1064 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1174 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1168);
    float _1178 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1170);
    float _1180 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1182 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1150);
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1188 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1190 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1180);
    float _1192 = _1172 + _1184;
    float _1194 = _1104 + _1186;
    float _1196 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1188);
    float _1198 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1202 = _1192 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1206 = _1194 + _1204;
    float _1208 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1210 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1212 = _1202 * _1202;
    float _1214 = _1206 * _1206;
    float _1216 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1218 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1220 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1208);
    float _1222 = _1212 + _1214;
    float _1224 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1216);
    float _1226 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1218);
    float _1228 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1210);
    float _1230 = sqrt(_1222);
    float _1232 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1196);
    float _1234 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1226);
    float _1236 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1190);
    float _1238 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1198);
    float _1240 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1154);
    float _1242 = _1066 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1244 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1248 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1164);
    float _1250 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1228);
    float _1252 = _1242 + _1244;
    float _1254 = _1182 * _686;
    float _1256 = _1240 * _686;
    float _1258 = _1248 * _686;
    float _1260 = _1182 * _958;
    bool _1262 = _1230 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1266 = _1240 * _958;
    float _1268 = _1092 * _1182;
    float _1270 = _1092 * _1240;
    float _1272 = _1092 * _1248;
    float _1274 = _1248 * _958;
    float _1276 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1220);
    float _1278 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1224);
    float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1282 = fma(_1236, _682, _1254);
    float _1284 = fma(_1238, _682, _1256);
    float _1286 = fma(_1232, _682, _1258);
    float _1288 = _1248;
    float _1290 = _1212;
    float _1292 = _1214;
    float _1294 = _1194;
    float _1296 = _1192;
    float _1298 = _1102;
    if (!_1262)
    {
        _1288 = _1252;
    }
    float _1300 = _1288;
    bool _1302 = !_1262;
    float _1304 = _1300;
    if (!_1302)
    {
        float _1306 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1310 = _1230 + _1308;
        float _1312 = _1252 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1314 = rsqrt(_1222);
        float _1316 = _1310 * _1306;
        float _1318 = _1316 * 0.15915493667125701904296875;
        float _1320 = _1318 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        float _1324 = _1318 * 6.283185482025146484375;
        float _1326 = cos(_1324);
        float _1328 = fma(_1322, _1312, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1330 = _1314 * _1328;
        float _1332 = fma(_1202, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1334 = _1326 + (-1.0);
        float _1336 = fma(_1206, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1340 = _1332 + _1338;
        float _1342 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1346 = _1336 + _1344;
        float _1348 = _1340 * _1340;
        float _1350 = fma(_1252, _1326, _1342);
        float _1352 = _1346 * _1346;
        _1304 = _1350;
        _1290 = _1348;
        _1292 = _1352;
        _1294 = _1336;
        _1296 = _1332;
    }
    float _1354 = _1304;
    float _1356 = _1290;
    float _1358 = _1292;
    float _1360 = _1294;
    float _1362 = _1296;
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1368 = _1354 + _1366;
    float _1370 = _518 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1372 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1374 = fma(_1236, _956, _1260);
    float _1376 = fma(_1368, _1368, _1356);
    float _1378 = fma(_1086, _1236, _1268);
    float _1380 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1382 = fma(_1232, _956, _1274);
    float _1384 = fma(_1086, _1232, _1272);
    float _1386 = _1376 + _1358;
    float _1388 = _1372 * _1246;
    float _1390 = fma(_1086, _1238, _1270);
    float _1392 = _544 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1394 = fma(_1238, _956, _1266);
    float _1396 = _1380 * _1364;
    float _1398 = _1392 * _1264;
    float _1400 = sqrt(_1386);
    float _1402 = fma(_1276, _690, _1282);
    float _1404 = fma(_1276, _960, _1374);
    float _1406 = fma(_1102, _1276, _1378);
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1414 = fma(_1250, _690, _1284);
    float _1416 = fma(_1250, _960, _1394);
    float _1418 = fma(_1278, _690, _1286);
    float _1420 = fma(_1278, _960, _1382);
    float _1422 = _1370 * _1280;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1426 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = fma(_1102, _1250, _1390);
    float _1434 = fma(_1102, _1278, _1384);
    out.m_67.x = _1388;
    out.m_67.y = _1398;
    out.m_67.z = _1396;
    out.m_67.w = _1422;
    bool _1436 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1438 = isnan(_1400);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1444 = _1440 || _1442;
    out.m_69.x = _1426;
    out.m_69.y = _1428;
    out.m_69.z = _1430;
    out.m_69.w = _1424;
    out.m_71.x = _1402;
    out.m_71.y = _1414;
    out.m_71.z = _1418;
    out.m_73.x = _1404;
    out.m_73.y = _1416;
    out.m_73.z = _1420;
    float _1446 = _1388;
    float _1448 = _1396;
    if (!_1444)
    {
        _1298 = 1.0;
    }
    float _1450 = _1298;
    out.m_75.x = _1406;
    out.m_75.y = _1432;
    out.m_75.z = _1434;
    bool _1452 = !_1444;
    float _1454 = _1450;
    if (!_1452)
    {
        bool _1456 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1458 = isnan(_1400);
        bool _1460 = _1456 || _1458;
        bool _1462 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1464 = _1460 || _1462;
        if (!_1464)
        {
            float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1468 = _1400 + _1466;
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1472 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1470;
            float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1478 = 1.0 / _1472;
            float _1480 = _1468 * _1478;
            float _1482 = fma(_1480, _1476, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1454 = _1482;
            _1484 = true;
        }
        else
        {
            bool _1486 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1488 = isnan(_1400);
            bool _1490 = _1486 || _1488;
            bool _1492 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1494 = _1490 || _1492;
            if (!_1494)
            {
                float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1498 = _1400 + _1496;
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1502 = _1500 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1506 = _1504 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1508 = 1.0 / _1502;
                float _1510 = _1498 * _1508;
                float _1512 = fma(_1510, _1506, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1454 = _1512;
                _1484 = true;
            }
            else
            {
                _1454 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1484 = false;
    float _1514 = _1454;
    float _1516 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1520 = _1360 + _1518;
    float _1522 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1516);
    float _1524 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1526 = fma(_1520, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1528 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1522);
    bool _1530 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan(0.5);
    bool _1538 = _1534 || _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1542 = _1354 + _1540;
    bool _1544 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan(0.5);
    bool _1552 = _1548 || _1550;
    float _1554 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1556 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1524);
    float _1558 = fma(_1542, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1560 = 1.0 / _1554;
    float _1562 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1556);
    float _1564 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1566 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1568 = _1514;
    if (_1552)
    {
        _1566 = 1.0;
    }
    float _1570 = _1566;
    float _1572 = _1564 + _1554;
    float _1574 = _1572 * _1560;
    float _1576 = _1574 * 0.5;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1580 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1578);
    float _1582 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1584 = _1362 + _1582;
    float _1586 = 1.0 / _1580;
    float _1588 = fma(_1584, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1590 = _1584;
    float _1592 = _1560;
    float _1594 = _1588;
    float _1596 = _1570;
    if (_1538)
    {
        _1568 = _1558;
    }
    float _1598 = _1568;
    float _1600 = _1598;
    if (_1538)
    {
        _1590 = _1526;
    }
    float _1602 = _1590;
    float _1604 = _1602;
    if (_1538)
    {
        _1592 = _1588;
    }
    float _1606 = _1592;
    float _1608 = _1606;
    if (!_1538)
    {
        float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1612 = _1242 + _1610;
        float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1616 = _1172 + _1614;
        float _1618 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1620 = _1612 * _1612;
        float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1624 = _1104 + _1622;
        float _1626 = fma(_1616, _1616, _1620);
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1630 = fma(_1624, _1624, _1626);
        float _1632 = sqrt(_1630);
        float _1634 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1636 = precise::min(_1632, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1638 = _1636 * _1628;
        float _1640 = -_1172;
        float _1642 = _1640 + _1588;
        float _1644 = -_1104;
        float _1646 = _1644 + _1526;
        float _1648 = _1634 * _1638;
        float _1650 = -_1242;
        float _1652 = _1650 + _1558;
        float _1654 = fma(_1642, _1648, _1172);
        float _1656 = fma(_1652, _1648, _1242);
        float _1658 = fma(_1646, _1648, _1104);
        _1594 = _1648;
        _1600 = _1656;
        _1608 = _1654;
        _1604 = _1658;
    }
    float _1660 = _1594;
    float _1662 = _1600;
    float _1664 = _1608;
    float _1666 = _1604;
    float _1668 = _1660;
    if (_1552)
    {
        _1668 = 1.0;
    }
    float _1670 = _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1674 = _1586 * _1672;
    float _1676 = _1670;
    if (!_1552)
    {
        float _1678 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1680 = _1678 * 0.15915493667125701904296875;
        float _1682 = _1680 * 6.283185482025146484375;
        float _1684 = cos(_1682);
        float _1686 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1688 = _1686 * 0.15915493667125701904296875;
        float _1690 = _1680 * 6.283185482025146484375;
        float _1692 = sin(_1690);
        float _1694 = 1.0 / _1684;
        float _1696 = _1688 * 6.283185482025146484375;
        float _1698 = cos(_1696);
        float _1700 = _1692 * _1694;
        float _1702 = _1688 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1708 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1706;
        float _1710 = _1698 * _1700;
        float _1712 = 1.0 / _1708;
        float _1714 = 1.0 / _1710;
        float _1716 = _1704 * _1714;
        float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1720 = fma(_1674, _1716, _1718);
        float _1722 = _1720 * _1712;
        float _1724 = precise::clamp(_1722, 0.0, 1.0);
        _1446 = _1680;
        _1596 = _1724;
    }
    float _1726 = _1446;
    float _1728 = _1596;
    float _1730 = _1726;
    if (!_1552)
    {
        float _1732 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1734 = _1732 * 0.15915493667125701904296875;
        float _1736 = _1734 * 6.283185482025146484375;
        float _1738 = cos(_1736);
        float _1740 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1742 = _1740 * 0.15915493667125701904296875;
        float _1744 = _1734 * 6.283185482025146484375;
        float _1746 = sin(_1744);
        float _1748 = 1.0 / _1738;
        float _1750 = _1742 * 6.283185482025146484375;
        float _1752 = cos(_1750);
        float _1754 = _1746 * _1748;
        float _1756 = _1742 * 6.283185482025146484375;
        float _1758 = sin(_1756);
        float _1760 = _1752 * _1754;
        float _1762 = 1.0 / _1760;
        float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1766 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1764;
        float _1768 = 1.0 / _1766;
        float _1770 = _1758 * _1762;
        float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1774 = fma(_1674, _1770, _1772);
        float _1776 = _1774 * _1768;
        float _1778 = precise::clamp(_1776, 0.0, 1.0);
        float _1780 = -_1778;
        float _1782 = _1780 + 1.0;
        _1730 = _1760;
        _1676 = _1782;
    }
    float _1784 = _1730;
    float _1786 = _1676;
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1790 = _1662 + _1788;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1794 = _1664 + _1792;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1798 = _1666 + _1796;
    float _1800 = _1790 * _1790;
    float _1802 = fma(_1794, _1794, _1800);
    float _1804 = fma(_1798, _1798, _1802);
    float _1806 = rsqrt(_1804);
    float _1808 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1810 = _1794 * _1808;
    float _1812 = _1798 * _1808;
    float _1814 = _1810 * _1810;
    float _1816 = _1812 * _1812;
    float _1818 = _1814 + _1816;
    float _1820 = sqrt(_1818);
    bool _1822 = _1820 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1826 = _1820 + _1824;
    float _1828 = _1798;
    float _1830 = _1800;
    float _1832 = _1826;
    float _1834 = _1808;
    float _1836 = _1810;
    if (_1822)
    {
        float _1838 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1828 = _1838;
    }
    float _1840 = _1828;
    if (_1822)
    {
        float _1842 = rsqrt(_1818);
        _1830 = _1842;
    }
    float _1844 = _1830;
    float _1846 = _1844;
    if (_1822)
    {
        float _1848 = _1826 * _1840;
        _1832 = _1848;
    }
    float _1850 = _1832;
    if (_1822)
    {
        float _1852 = _1850 * 0.15915493667125701904296875;
        _1448 = _1852;
    }
    float _1854 = _1448;
    float _1856 = _1806;
    if (_1822)
    {
        float _1858 = _1854 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        _1856 = _1860;
    }
    float _1862 = _1856;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1866 = precise::max(0.0, _1864);
    float _1868 = _1784;
    float _1870 = _1866;
    float _1872 = _1864;
    if (_1822)
    {
        float _1874 = _1854 * 6.283185482025146484375;
        float _1876 = cos(_1874);
        _1868 = _1876;
    }
    float _1878 = _1868;
    float _1880 = -_1808;
    float _1882 = -_1866;
    float _1884 = fma(_1790, _1880, _1882);
    float _1886 = _1884;
    if (_1822)
    {
        float _1888 = _1884 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1888;
    }
    float _1890 = _1870;
    float _1892 = sqrt(_1804);
    float _1894 = _1862;
    float _1896 = _1890;
    if (_1822)
    {
        float _1898 = fma(_1862, _1890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1894 = _1898;
    }
    float _1900 = _1894;
    float _1902 = _1900;
    if (_1822)
    {
        float _1904 = _1878 + (-1.0);
        _1872 = _1904;
    }
    float _1906 = _1872;
    float _1908 = _1906;
    if (_1822)
    {
        float _1910 = _1844 * _1900;
        _1834 = _1910;
    }
    float _1912 = _1834;
    if (!_1822)
    {
        _1846 = _1884;
    }
    float _1914 = _1846;
    float _1916 = _1914;
    if (_1822)
    {
        float _1918 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1896 = _1918;
    }
    float _1920 = _1896;
    if (_1822)
    {
        float _1922 = _1810 * _1912;
        _1836 = _1922;
    }
    float _1924 = _1836;
    if (!_1822)
    {
        _1902 = _1812;
    }
    float _1926 = _1902;
    float _1928 = _1926;
    if (_1822)
    {
        float _1930 = _1812 * _1912;
        _1928 = _1930;
    }
    float _1932 = _1928;
    if (!_1822)
    {
        _1908 = _1814;
    }
    float _1934 = _1908;
    float _1936 = _1934;
    if (_1822)
    {
        float _1938 = fma(_1884, _1878, _1920);
        _1916 = _1938;
    }
    float _1940 = _1916;
    if (_1822)
    {
        float _1942 = _1924 * _1924;
        _1936 = _1942;
    }
    float _1944 = _1936;
    if (!_1822)
    {
        _1886 = _1816;
    }
    float _1946 = _1886;
    float _1948 = _1946;
    if (_1822)
    {
        float _1950 = _1932 * _1932;
        _1948 = _1950;
    }
    float _1952 = _1948;
    float _1954 = fma(_1940, _1940, _1944);
    float _1956 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1958 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1960 = _1954 + _1952;
    float _1962 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1956);
    float _1964 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1968 = fma(_1892, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1966);
    float _1970 = precise::clamp(_1968, 0.0, 1.0);
    float _1972 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1974 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1962);
    float _1976 = rsqrt(_1960);
    float _1978 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1964);
    float _1980 = -_1970;
    float _1982 = _1980 + 1.0;
    float _1984 = _1974 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1986 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1988 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1958);
    float _1990 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1978);
    float _1992 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1994 = abs(_1982);
    float _1996 = log2(_1994);
    float _1998 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1986);
    float _2000 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1988);
    float _2002 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2004 = -_1992;
    float _2006 = fma(_2004, _1972, 1.0);
    float _2008 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1998);
    float _2010 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2012 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2014 = _1976 * _1924;
    float _2016 = _1976 * _1940;
    float _2018 = _1976 * _1932;
    float _2020 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2012);
    float _2022 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2024 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2026 = log2(_2006);
    float _2028 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2020);
    float _2030 = -_2022;
    float _2032 = fma(_2016, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2030);
    float _2034 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2036 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2038 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2028);
    float _2040 = -_2018;
    float _2042 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2032);
    float _2044 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2046 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2036);
    float _2048 = exp2(_2034);
    float _2050 = fma(_2042, -0.5, 0.5);
    float _2052 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2044);
    float _2054 = fma(_2042, 0.5, 0.5);
    float _2056 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2046);
    float _2058 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2052);
    float _2060 = _2016 + 1.0;
    float _2062 = 1.0 / _2038;
    float _2064 = fma(_2054, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2066 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2058);
    float _2068 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2056);
    float _2070 = _2026 * 0.693147182464599609375;
    float _2072 = fma(_2054, _2064, -0.212114393711090087890625);
    float _2074 = sqrt(_2050);
    float _2076 = -_2016;
    float _2078 = fma(_2048, _2060, _2076);
    float _2080 = fma(_2054, _2072, 1.570728778839111328125);
    float _2082 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2084 = fma(_2078, 0.5, 0.5);
    float _2086 = _2066 * _2062;
    float _2088 = _2068 * _2062;
    float _2090 = fma(_2086, 0.5, 0.5);
    float _2092 = fma(_2088, -0.5, 0.5);
    float _2094 = _2074 * 0.636619746685028076171875;
    float3 _5454 = float3(_2090, _2092, _2082);
    float _2096 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5454, float3(0.0), isnan(_5454)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5454, float3(0.0), isnan(_5454)), level(0.0)).x;
    float3 _5465 = float3(_2090, _2092, _2082);
    float4 _2099 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5465, float3(0.0), isnan(_5465)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5465, float3(0.0), isnan(_5465)), level(0.0)).xyzw;
    float _2101 = _2099.x;
    float _2103 = _2099.y;
    float _2105 = _2099.z;
    float _2107 = _2099.w;
    float _2109 = -_2080;
    float _2111 = fma(_2094, _2109, 1.0);
    float2 _5487 = float2(_2111, _2084);
    float3 _2115 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5487, float2(0.0), isnan(_5487)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5487, float2(0.0), isnan(_5487)), level(0.0)).xyz;
    float _2117 = _2115.x;
    float _2119 = _2115.y;
    float _2121 = _2115.z;
    float _2123 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2125 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2127 = _1728 * _1786;
    bool _2129 = _1728 > 0.0;
    bool _2131 = isnan(_1728);
    bool _2133 = _2129 || _2131;
    bool _2135 = isnan(0.0);
    bool _2137 = _2133 || _2135;
    float _2139 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2125);
    float _2141 = exp2(_2123);
    float _2143 = _2127 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2145 = _1786 <= 0.0;
    bool _2147 = !_2137;
    bool _2149 = _2145 || _2147;
    float _2151 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2139);
    float _2153 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2151);
    float _2155 = _366 * _2143;
    float _2157 = _2153 + _2038;
    float _2159 = _2155 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2066;
    out.gl_Position.y = _2068;
    out.gl_Position.z = _2153;
    out.gl_Position.w = _2038;
    float _2161 = _2157 * 0.5;
    float _2163 = -_2141;
    float _2165 = _2163 + 1.0;
    out.m_47.x = _2159;
    float _2167 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _2161;
    out.m_77.w = _2038;
    float _2169 = _2167 * _2096;
    float _2171 = -_2167;
    float _2173 = _2171 + 1.0;
    float _2175 = _2107 * _2169;
    float _2177 = _2107 * _2173;
    float _2179 = _2121 * _2169;
    float _2181 = fma(_2117, _2175, _2101);
    float _2183 = fma(_2119, _2175, _2103);
    float _2185 = fma(_2107, _2179, _2105);
    out.m_79.x = _2181;
    out.m_79.y = _2183;
    out.m_79.z = _2185;
    out.m_79.w = _2177;
    if (!_2149)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2187 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2187;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1484 = false;
    bool _386 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2244 = as_type<float>(_114);
        out.gl_Position.z = _2244;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = 0.0;
    float _136 = _132;
    if (_128)
    {
        float _138 = float(_98);
        _134 = _138;
    }
    float _140 = _134;
    bool _142 = _132 >= _140;
    bool _144 = !_128;
    bool _146 = _142 || _144;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2313 = as_type<float>(_152);
        out.gl_Position.z = _2313;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_51.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _132 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = _158 * _156;
    float _174 = 0.0;
    if (!_170)
    {
        float _176 = _160 * _160;
        float _178 = _176 * 0.5;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _184 = _180;
    if (!_170)
    {
        float _186 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    float _190 = in.m_49.x;
    float _192 = in.m_49.y;
    float _194 = in.m_49.z;
    float _196 = _182 * 6.283185482025146484375;
    float _198 = floor(_182);
    float _200 = _196 * 0.15915493667125701904296875;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    float _206 = _200 * 6.283185482025146484375;
    float _208 = cos(_206);
    float _210 = 1.4012984643248170709237295832899e-45;
    float _212 = _188;
    if (!_170)
    {
        _210 = _160;
    }
    float _214 = _210;
    float _216 = -_198;
    float _218 = _182 + _216;
    bool _220 = !_170;
    float _222 = _214;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _160 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _160);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _252;
    }
    float _254 = _212;
    bool _256 = !_170;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _160 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _222 = _276;
    }
    float _278 = _222;
    float _280 = in.m_53.w;
    float _282 = in.m_44.x;
    float _284 = in.m_44.y;
    float _286 = in.m_44.z;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _290 = _288 != 0;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _294 = _292 != 0;
    float _296 = fma(_208, 0.5, 0.5);
    bool _298 = _218 < 0.5;
    float _300 = float(_298);
    float _302 = -_218;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _306 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _308 = !_290;
    int _310 = _308 ? 0 : 1;
    float _312 = -_300;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _316 = -_296;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _320 = abs(_310);
    float _322 = fma(_278, _190, _306);
    bool _324 = !_204;
    int _326 = _324 ? 0 : 1;
    float _328 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _330 = !_294;
    int _332 = _330 ? 0 : 1;
    float _334 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _338 = fma(_278, _192, _328);
    int _340 = abs(_326);
    float _342 = fma(_278, _194, _334);
    int _344 = abs(_332);
    float _346 = float(_320);
    float _348 = float(_340);
    float _350 = fma(_322, _280, _282);
    float _352 = abs(_304);
    float _354 = _346 * _352;
    float _356 = fma(_338, _280, _284);
    float _358 = fma(_342, _280, _286);
    float _360 = float(_344);
    float _362 = fma(_348, _318, _354);
    float _364 = abs(_314);
    float _366 = fma(_360, _364, _362);
    bool _368 = !_336;
    float _384;
    if (!_368)
    {
        float _370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _372 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _374 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _376 = _374 * _370;
        float _378 = floor(_376);
        float _380 = -_378;
        float _382 = _376 + _380;
        _384 = _382;
        _386 = true;
    }
    else
    {
        float _388 = float(_98);
        float _390 = 1.0 / _388;
        float _392 = _132 * _390;
        _384 = _392;
    }
    _386 = false;
    float _394 = _384;
    float _396 = in.m_55.y;
    float _398 = _154 * 2.0;
    float _400 = in.m_51.w;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _404 = _402 != 0;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _408 = _406 != 0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _412 = _410 != 0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _414;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _420 = _418 != 0;
    float _422 = in.m_51.y;
    float _424 = floor(_398);
    bool _426 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _428 = isnan(_394);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = _356 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _440 = _356 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    bool _442 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _444 = isnan(_394);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -_436;
    float _456 = _454 + 1.0;
    float _458 = _356 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _460 = 1.0 / _416;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _462;
    float _466 = _452 * _456;
    float _468 = _356 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _470 = -_452;
    float _472 = _470 + 1.0;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _476 = _474 != 0;
    float _478 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[14].x, _438);
    float _480 = -_396;
    float _482 = _480 + 1.0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _486 = _484 != 0;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _490 = _394 + _488;
    float _492 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[14].y, _440);
    bool _494 = _400 > 0.5;
    float _496 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[14].z, _458);
    float _498 = in.m_57.x;
    float _500 = in.m_57.y;
    float _502 = in.m_57.z;
    float _504 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[14].w, _468);
    int _506 = _494 ? as_type<int>(_482) : as_type<int>(_396);
    float _508 = _490 * _460;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _512 = _510 != 0;
    float _514 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[16].w, _504);
    float _516 = fma(_464, _508, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _518 = _512 ? as_type<float>(_506) : _396;
    float _520 = in.m_59.x;
    float _522 = in.m_59.y;
    float _524 = in.m_59.z;
    bool _526 = _422 > 0.5;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _528;
    float _532 = _516 * _466;
    float _534 = in.m_55.x;
    float _536 = _396;
    float _538 = _452;
    float _540 = _516;
    if (_420)
    {
        float _542 = _526 ? _482 : _396;
        _536 = _542;
    }
    float _544 = _536;
    float _546 = fma(_530, _508, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _548 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].y, _532);
    bool _550 = _424 >= 0.0;
    bool _552 = isnan(_424);
    bool _554 = _550 || _552;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    float _560 = _546 * _466;
    bool _562 = _424 > 0.0;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _564;
    int _568 = _558 ? 0 : 1;
    float _570 = in.m_53.x;
    float _572 = in.m_53.y;
    float _574 = in.m_53.z;
    bool _576 = _500 != 0.0;
    bool _578 = isnan(_500);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = fma(_566, _508, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _588 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _590 = log2(_588);
    bool _592 = _498 == 0.0;
    bool _594 = !_584;
    bool _596 = _592 && _594;
    float _598 = _586 * _466;
    float _600 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[144].y, _548);
    float _602 = in.m_51.z;
    bool _604 = _502 == 0.0;
    bool _606 = _604 && _596;
    float _608 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].x, _598);
    float _610 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].z, _560);
    float _612 = _422 * 2.0;
    int _614 = ~_568;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    float _620 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[144].x, _608);
    float _622 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[144].z, _610);
    float _624 = floor(_612);
    int _626 = _618;
    float _628 = _608;
    if (!_562)
    {
        int _630 = ~_568;
        int _632 = _630 + 1;
        _626 = _632;
    }
    int _634 = _626;
    float _636 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[16].x, _478);
    float _638 = _514 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _640 = _520;
    if (_606)
    {
        _538 = _520;
    }
    float _642 = _538;
    float _644 = _600 * _572;
    float _646 = 0.0;
    float _648 = _642;
    if (_606)
    {
        _646 = _524;
    }
    float _650 = _646;
    float _652 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[16].z, _496);
    float _654 = _650;
    if (_606)
    {
        _540 = _642;
    }
    float _656 = _540;
    float _658 = _622 * _574;
    float _660 = _656;
    if (_606)
    {
        _628 = _650;
    }
    float _662 = _628;
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _500);
    float _666 = _662;
    if (!_606)
    {
        _648 = _520;
    }
    float _668 = _648;
    float _670 = _602 * 2.0;
    if (!_606)
    {
        _654 = _524;
    }
    float _672 = _654;
    float _674 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _498);
    if (_606)
    {
        _640 = _522;
    }
    float _676 = _640;
    float _678 = _676;
    if (!_606)
    {
        float _680 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _668);
        _660 = _680;
    }
    float _682 = _660;
    if (!_606)
    {
        float _684 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[17].y, _522);
        _678 = _684;
    }
    float _686 = _678;
    if (!_606)
    {
        float _688 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _672);
        _666 = _688;
    }
    float _690 = _666;
    bool _692 = _624 >= 0.0;
    bool _694 = isnan(_624);
    bool _696 = _692 || _694;
    bool _698 = isnan(0.0);
    bool _700 = _696 || _698;
    float _702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _502);
    float _704 = floor(_670);
    float _706 = _620 * _570;
    int _708 = _700 ? 0 : 1;
    float _710 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[16].y, _492);
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _714 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    bool _716 = _624 > 0.0;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _722 = _712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _726 = _718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _730 = _720 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _732 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _724);
    float _734 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _714);
    float _736 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    int _738 = ~_708;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    out.m_61.x = _722;
    out.m_61.y = _726;
    out.m_61.z = _730;
    out.m_61.w = _728;
    float _744 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _736);
    int _746 = _742;
    if (!_716)
    {
        int _748 = ~_708;
        int _750 = _748 + 1;
        _746 = _750;
    }
    int _752 = _746;
    float _754 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _734);
    bool _756 = _704 >= 0.0;
    bool _758 = isnan(_704);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _732);
    float _768 = _710 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _770 = _764 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _772 = sqrt(_766);
    bool _774 = _704 > 0.0;
    float _776 = _154 + _602;
    float _778 = _154 + _422;
    float _780 = _776 + (-1.0);
    float _782 = _778 + (-1.0);
    float _784 = _704;
    float _786 = _770;
    int _788 = as_type<int>(_768);
    if (!_476)
    {
        _784 = _534;
    }
    float _790 = _784;
    float _792 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _744);
    float _794 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _798 = _590 * _132;
    float _800 = _422 + _602;
    float _802 = sqrt(_792);
    float _804 = _800 + (-1.0);
    int _806 = ~as_type<int>(_770);
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    float _812 = _422 + (-0.5);
    int _814 = _810;
    float _816 = _790;
    if (!_774)
    {
        int _818 = ~as_type<int>(_770);
        int _820 = _818 + 1;
        _814 = _820;
    }
    int _822 = _814;
    float _824 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _826 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _828 = isnan(1.0);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _834 = _830 || _832;
    float _836 = exp2(_798);
    bool _838 = !_408;
    int _840 = _838 ? 0 : 1;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _844 = 1.0 + _842;
    bool _846 = _834;
    if (!_476)
    {
        _786 = _790;
    }
    float _848 = _786;
    float _850 = _848;
    if (_476)
    {
        _816 = _534;
    }
    float _852 = _816;
    bool _854 = !_412;
    int _856 = _854 ? 0 : 1;
    float _858 = 1.0 / _844;
    float _860 = in.m_63.x;
    float _862 = in.m_63.y;
    float _864 = in.m_63.z;
    bool _866 = !_404;
    int _868 = _866 ? 0 : 1;
    int _870 = abs(_840);
    int _872 = abs(_856);
    int _874 = abs(_868);
    float _876 = -_836;
    float _878 = _876 + 1.0;
    bool _880 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _888 = _884 || _886;
    float _890 = float(_870);
    float _892 = float(_634);
    float _894 = _888 ? _878 : 0.0;
    float _896 = sqrt(_754);
    float _898 = float(_872);
    float _900 = _890 * _892;
    float _902 = float(_752);
    bool _904 = _888;
    if (_834)
    {
        float _906 = _894 * _858;
        _136 = _906;
    }
    float _908 = _136;
    float _910 = float(_874);
    float _912 = _900 * (-2.0);
    float _914 = float(_822);
    float _916 = _898 * _902;
    if (_476)
    {
        bool _918 = _154 > 0.5;
        _904 = _918;
    }
    bool _920 = _904;
    float _922 = fma(_912, _862, _862);
    float _924 = fma(_824, _912, _824);
    float _926 = _910 * _914;
    float _928 = _916 * (-2.0);
    float _930 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].y, _922);
    float _932 = _636 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _934 = _926 * (-2.0);
    float _936 = fma(_928, _864, _864);
    float _938 = _896 * _768;
    float _940 = _772 * _932;
    float _942 = fma(_934, _860, _860);
    float _944 = _652 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _946 = _154 + (-0.5);
    float _948 = fma(_796, _934, _796);
    float _950 = fma(_924, _908, _930);
    float _952 = _802 * _944;
    float _954 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[196].x, _942);
    float _956 = in.m_65.x;
    float _958 = in.m_65.y;
    float _960 = in.m_65.z;
    float _962 = in.m_65.w;
    int _964 = as_type<int>(_934);
    float _966 = _946;
    if (_476)
    {
        float _968 = -_852;
        float _970 = _968 + 1.0;
        _788 = as_type<int>(_970);
    }
    int _972 = _788;
    if (_486)
    {
        float _974 = -_852;
        float _976 = _974 + 1.0;
        _964 = as_type<int>(_976);
    }
    int _978 = _964;
    if (_486)
    {
        bool _980 = _602 > 0.5;
        _846 = _980;
    }
    bool _982 = _846;
    float _984 = fma(_948, _908, _954);
    float _986 = fma(_794, _928, _794);
    float _988 = _602 + (-0.5);
    float _990 = _950 * 0.15915493667125701904296875;
    if (!_486)
    {
        _966 = _852;
    }
    float _992 = _966;
    float _994 = _984 * 0.15915493667125701904296875;
    float _996 = _992;
    if (_476)
    {
        float _998 = _920 ? as_type<float>(_972) : _852;
        _850 = _998;
    }
    float _1000 = _850;
    float _1002 = _938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_486)
    {
        float _1004 = _982 ? as_type<float>(_978) : _852;
        _996 = _1004;
    }
    float _1006 = _996;
    float _1008 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[196].z, _936);
    float _1010 = _938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1012 = _990 * 6.283185482025146484375;
    float _1014 = sin(_1012);
    float _1016 = _938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1018 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1002);
    float _1020 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1010);
    float _1022 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1016);
    float _1024 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1018);
    float _1026 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1020);
    float _1028 = _990 * 6.283185482025146484375;
    float _1030 = cos(_1028);
    float _1032 = _960 * _668;
    float _1034 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1022);
    float _1036 = _994 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = fma(_986, _908, _1008);
    float _1042 = -_1032;
    float _1044 = fma(_956, _672, _1042);
    float _1046 = _958 * _672;
    float _1048 = _956 * _522;
    float _1050 = _1040 * 0.15915493667125701904296875;
    float _1052 = -_1046;
    float _1054 = fma(_960, _522, _1052);
    float _1056 = _994 * 6.283185482025146484375;
    float _1058 = cos(_1056);
    float _1060 = -_1048;
    float _1062 = fma(_958, _668, _1060);
    float _1064 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1026);
    float _1066 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1024);
    float _1068 = fma(_638, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1034);
    float _1070 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1072 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1074 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1076 = _1050 * 6.283185482025146484375;
    float _1078 = cos(_1076);
    float _1080 = _664 * _1070;
    float _1082 = _702 * _1072;
    float _1084 = _1038 * _1014;
    float _1086 = _1054 * _962;
    float _1088 = _674 * _1074;
    float _1090 = _1038 * _1030;
    float _1092 = _1044 * _962;
    float _1094 = _1050 * 6.283185482025146484375;
    float _1096 = sin(_1094);
    float _1098 = _1058 * _1030;
    float _1100 = _1058 * _1014;
    float _1102 = _1062 * _962;
    float _1104 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1106 = _1058 * _1078;
    float _1108 = _1030 * _1078;
    float _1110 = _1038 * _1078;
    float _1112 = _1014 * _1078;
    float _1114 = _1106 * _1080;
    float _1116 = _1110 * _1080;
    float _1118 = fma(_1096, _1098, _1084);
    float _1120 = -_1080;
    float _1122 = _1096 * _1120;
    float _1124 = -_1100;
    float _1126 = fma(_1096, _1090, _1124);
    float _1128 = -_1090;
    float _1130 = fma(_1096, _1100, _1128);
    float _1132 = fma(_1118, _1088, _1114);
    float _1134 = fma(_1096, _1084, _1098);
    float _1136 = fma(_1108, _1088, _1122);
    float _1138 = fma(_1126, _1088, _1116);
    float _1140 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1142 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1144 = fma(_1130, _1082, _1132);
    float _1146 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1148 = -_1096;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1140);
    float _1152 = -_1096;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1142);
    float _1156 = fma(_1112, _1082, _1136);
    float _1158 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1160 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1162 = -_1096;
    float _1164 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1146);
    float _1166 = fma(_1134, _1082, _1138);
    float _1168 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1158);
    float _1170 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1160);
    float _1172 = _1064 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1174 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1168);
    float _1178 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1170);
    float _1180 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1182 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1150);
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1188 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1190 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1180);
    float _1192 = _1172 + _1184;
    float _1194 = _1104 + _1186;
    float _1196 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1188);
    float _1198 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1202 = _1192 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1206 = _1194 + _1204;
    float _1208 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1210 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1212 = _1202 * _1202;
    float _1214 = _1206 * _1206;
    float _1216 = _1130 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1218 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1220 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1208);
    float _1222 = _1212 + _1214;
    float _1224 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1216);
    float _1226 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1218);
    float _1228 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1210);
    float _1230 = sqrt(_1222);
    float _1232 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1196);
    float _1234 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1226);
    float _1236 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1190);
    float _1238 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1198);
    float _1240 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1154);
    float _1242 = _1066 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1244 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1248 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1164);
    float _1250 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1228);
    float _1252 = _1242 + _1244;
    float _1254 = _1182 * _686;
    float _1256 = _1240 * _686;
    float _1258 = _1248 * _686;
    float _1260 = _1182 * _958;
    bool _1262 = _1230 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1266 = _1240 * _958;
    float _1268 = _1092 * _1182;
    float _1270 = _1092 * _1240;
    float _1272 = _1092 * _1248;
    float _1274 = _1248 * _958;
    float _1276 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1220);
    float _1278 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1224);
    float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1282 = fma(_1236, _682, _1254);
    float _1284 = fma(_1238, _682, _1256);
    float _1286 = fma(_1232, _682, _1258);
    float _1288 = _1248;
    float _1290 = _1212;
    float _1292 = _1214;
    float _1294 = _1194;
    float _1296 = _1192;
    float _1298 = _1102;
    if (!_1262)
    {
        _1288 = _1252;
    }
    float _1300 = _1288;
    bool _1302 = !_1262;
    float _1304 = _1300;
    if (!_1302)
    {
        float _1306 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1310 = _1230 + _1308;
        float _1312 = _1252 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1314 = rsqrt(_1222);
        float _1316 = _1310 * _1306;
        float _1318 = _1316 * 0.15915493667125701904296875;
        float _1320 = _1318 * 6.283185482025146484375;
        float _1322 = sin(_1320);
        float _1324 = _1318 * 6.283185482025146484375;
        float _1326 = cos(_1324);
        float _1328 = fma(_1322, _1312, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1330 = _1314 * _1328;
        float _1332 = fma(_1202, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1334 = _1326 + (-1.0);
        float _1336 = fma(_1206, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1340 = _1332 + _1338;
        float _1342 = _1334 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1346 = _1336 + _1344;
        float _1348 = _1340 * _1340;
        float _1350 = fma(_1252, _1326, _1342);
        float _1352 = _1346 * _1346;
        _1304 = _1350;
        _1290 = _1348;
        _1292 = _1352;
        _1294 = _1336;
        _1296 = _1332;
    }
    float _1354 = _1304;
    float _1356 = _1290;
    float _1358 = _1292;
    float _1360 = _1294;
    float _1362 = _1296;
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1368 = _1354 + _1366;
    float _1370 = _518 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1372 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1374 = fma(_1236, _956, _1260);
    float _1376 = fma(_1368, _1368, _1356);
    float _1378 = fma(_1086, _1236, _1268);
    float _1380 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1382 = fma(_1232, _956, _1274);
    float _1384 = fma(_1086, _1232, _1272);
    float _1386 = _1376 + _1358;
    float _1388 = _1372 * _1246;
    float _1390 = fma(_1086, _1238, _1270);
    float _1392 = _544 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1394 = fma(_1238, _956, _1266);
    float _1396 = _1380 * _1364;
    float _1398 = _1392 * _1264;
    float _1400 = sqrt(_1386);
    float _1402 = fma(_1276, _690, _1282);
    float _1404 = fma(_1276, _960, _1374);
    float _1406 = fma(_1102, _1276, _1378);
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1414 = fma(_1250, _690, _1284);
    float _1416 = fma(_1250, _960, _1394);
    float _1418 = fma(_1278, _690, _1286);
    float _1420 = fma(_1278, _960, _1382);
    float _1422 = _1370 * _1280;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1426 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1432 = fma(_1102, _1250, _1390);
    float _1434 = fma(_1102, _1278, _1384);
    out.m_67.x = _1388;
    out.m_67.y = _1398;
    out.m_67.z = _1396;
    out.m_67.w = _1422;
    bool _1436 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1438 = isnan(_1400);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1444 = _1440 || _1442;
    out.m_69.x = _1426;
    out.m_69.y = _1428;
    out.m_69.z = _1430;
    out.m_69.w = _1424;
    out.m_71.x = _1402;
    out.m_71.y = _1414;
    out.m_71.z = _1418;
    out.m_73.x = _1404;
    out.m_73.y = _1416;
    out.m_73.z = _1420;
    float _1446 = _1388;
    float _1448 = _1396;
    if (!_1444)
    {
        _1298 = 1.0;
    }
    float _1450 = _1298;
    out.m_75.x = _1406;
    out.m_75.y = _1432;
    out.m_75.z = _1434;
    bool _1452 = !_1444;
    float _1454 = _1450;
    if (!_1452)
    {
        bool _1456 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1458 = isnan(_1400);
        bool _1460 = _1456 || _1458;
        bool _1462 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1464 = _1460 || _1462;
        if (!_1464)
        {
            float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1468 = _1400 + _1466;
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1472 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1470;
            float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1478 = 1.0 / _1472;
            float _1480 = _1468 * _1478;
            float _1482 = fma(_1480, _1476, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1454 = _1482;
            _1484 = true;
        }
        else
        {
            bool _1486 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1488 = isnan(_1400);
            bool _1490 = _1486 || _1488;
            bool _1492 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1494 = _1490 || _1492;
            if (!_1494)
            {
                float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1498 = _1400 + _1496;
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1502 = _1500 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1506 = _1504 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1508 = 1.0 / _1502;
                float _1510 = _1498 * _1508;
                float _1512 = fma(_1510, _1506, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1454 = _1512;
                _1484 = true;
            }
            else
            {
                _1454 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1484 = false;
    float _1514 = _1454;
    float _1516 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1520 = _1360 + _1518;
    float _1522 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1516);
    float _1524 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1526 = fma(_1520, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1528 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1522);
    bool _1530 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan(0.5);
    bool _1538 = _1534 || _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1542 = _1354 + _1540;
    bool _1544 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1548 = _1544 || _1546;
    bool _1550 = isnan(0.5);
    bool _1552 = _1548 || _1550;
    float _1554 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1556 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1524);
    float _1558 = fma(_1542, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1560 = 1.0 / _1554;
    float _1562 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1556);
    float _1564 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1566 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1568 = _1514;
    if (_1552)
    {
        _1566 = 1.0;
    }
    float _1570 = _1566;
    float _1572 = _1564 + _1554;
    float _1574 = _1572 * _1560;
    float _1576 = _1574 * 0.5;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1580 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1578);
    float _1582 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1584 = _1362 + _1582;
    float _1586 = 1.0 / _1580;
    float _1588 = fma(_1584, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1590 = _1584;
    float _1592 = _1560;
    float _1594 = _1588;
    float _1596 = _1570;
    if (_1538)
    {
        _1568 = _1558;
    }
    float _1598 = _1568;
    float _1600 = _1598;
    if (_1538)
    {
        _1590 = _1526;
    }
    float _1602 = _1590;
    float _1604 = _1602;
    if (_1538)
    {
        _1592 = _1588;
    }
    float _1606 = _1592;
    float _1608 = _1606;
    if (!_1538)
    {
        float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1612 = _1242 + _1610;
        float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1616 = _1172 + _1614;
        float _1618 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1620 = _1612 * _1612;
        float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1624 = _1104 + _1622;
        float _1626 = fma(_1616, _1616, _1620);
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1630 = fma(_1624, _1624, _1626);
        float _1632 = sqrt(_1630);
        float _1634 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1636 = precise::min(_1632, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1638 = _1636 * _1628;
        float _1640 = -_1172;
        float _1642 = _1640 + _1588;
        float _1644 = -_1104;
        float _1646 = _1644 + _1526;
        float _1648 = _1634 * _1638;
        float _1650 = -_1242;
        float _1652 = _1650 + _1558;
        float _1654 = fma(_1642, _1648, _1172);
        float _1656 = fma(_1652, _1648, _1242);
        float _1658 = fma(_1646, _1648, _1104);
        _1594 = _1648;
        _1600 = _1656;
        _1608 = _1654;
        _1604 = _1658;
    }
    float _1660 = _1594;
    float _1662 = _1600;
    float _1664 = _1608;
    float _1666 = _1604;
    float _1668 = _1660;
    if (_1552)
    {
        _1668 = 1.0;
    }
    float _1670 = _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1674 = _1586 * _1672;
    float _1676 = _1670;
    if (!_1552)
    {
        float _1678 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1680 = _1678 * 0.15915493667125701904296875;
        float _1682 = _1680 * 6.283185482025146484375;
        float _1684 = cos(_1682);
        float _1686 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1688 = _1686 * 0.15915493667125701904296875;
        float _1690 = _1680 * 6.283185482025146484375;
        float _1692 = sin(_1690);
        float _1694 = 1.0 / _1684;
        float _1696 = _1688 * 6.283185482025146484375;
        float _1698 = cos(_1696);
        float _1700 = _1692 * _1694;
        float _1702 = _1688 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1708 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1706;
        float _1710 = _1698 * _1700;
        float _1712 = 1.0 / _1708;
        float _1714 = 1.0 / _1710;
        float _1716 = _1704 * _1714;
        float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1720 = fma(_1674, _1716, _1718);
        float _1722 = _1720 * _1712;
        float _1724 = precise::clamp(_1722, 0.0, 1.0);
        _1446 = _1680;
        _1596 = _1724;
    }
    float _1726 = _1446;
    float _1728 = _1596;
    float _1730 = _1726;
    if (!_1552)
    {
        float _1732 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1734 = _1732 * 0.15915493667125701904296875;
        float _1736 = _1734 * 6.283185482025146484375;
        float _1738 = cos(_1736);
        float _1740 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1742 = _1740 * 0.15915493667125701904296875;
        float _1744 = _1734 * 6.283185482025146484375;
        float _1746 = sin(_1744);
        float _1748 = 1.0 / _1738;
        float _1750 = _1742 * 6.283185482025146484375;
        float _1752 = cos(_1750);
        float _1754 = _1746 * _1748;
        float _1756 = _1742 * 6.283185482025146484375;
        float _1758 = sin(_1756);
        float _1760 = _1752 * _1754;
        float _1762 = 1.0 / _1760;
        float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1766 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1764;
        float _1768 = 1.0 / _1766;
        float _1770 = _1758 * _1762;
        float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1774 = fma(_1674, _1770, _1772);
        float _1776 = _1774 * _1768;
        float _1778 = precise::clamp(_1776, 0.0, 1.0);
        float _1780 = -_1778;
        float _1782 = _1780 + 1.0;
        _1730 = _1760;
        _1676 = _1782;
    }
    float _1784 = _1730;
    float _1786 = _1676;
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1790 = _1662 + _1788;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1794 = _1664 + _1792;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1798 = _1666 + _1796;
    float _1800 = _1790 * _1790;
    float _1802 = fma(_1794, _1794, _1800);
    float _1804 = fma(_1798, _1798, _1802);
    float _1806 = rsqrt(_1804);
    float _1808 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1810 = _1794 * _1808;
    float _1812 = _1798 * _1808;
    float _1814 = _1810 * _1810;
    float _1816 = _1812 * _1812;
    float _1818 = _1814 + _1816;
    float _1820 = sqrt(_1818);
    bool _1822 = _1820 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1826 = _1820 + _1824;
    float _1828 = _1798;
    float _1830 = _1800;
    float _1832 = _1826;
    float _1834 = _1808;
    float _1836 = _1810;
    if (_1822)
    {
        float _1838 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1828 = _1838;
    }
    float _1840 = _1828;
    if (_1822)
    {
        float _1842 = rsqrt(_1818);
        _1830 = _1842;
    }
    float _1844 = _1830;
    float _1846 = _1844;
    if (_1822)
    {
        float _1848 = _1826 * _1840;
        _1832 = _1848;
    }
    float _1850 = _1832;
    if (_1822)
    {
        float _1852 = _1850 * 0.15915493667125701904296875;
        _1448 = _1852;
    }
    float _1854 = _1448;
    float _1856 = _1806;
    if (_1822)
    {
        float _1858 = _1854 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        _1856 = _1860;
    }
    float _1862 = _1856;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1866 = precise::max(0.0, _1864);
    float _1868 = _1784;
    float _1870 = _1866;
    float _1872 = _1864;
    if (_1822)
    {
        float _1874 = _1854 * 6.283185482025146484375;
        float _1876 = cos(_1874);
        _1868 = _1876;
    }
    float _1878 = _1868;
    float _1880 = -_1808;
    float _1882 = -_1866;
    float _1884 = fma(_1790, _1880, _1882);
    float _1886 = _1884;
    if (_1822)
    {
        float _1888 = _1884 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1888;
    }
    float _1890 = _1870;
    float _1892 = sqrt(_1804);
    float _1894 = _1862;
    float _1896 = _1890;
    if (_1822)
    {
        float _1898 = fma(_1862, _1890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1894 = _1898;
    }
    float _1900 = _1894;
    float _1902 = _1900;
    if (_1822)
    {
        float _1904 = _1878 + (-1.0);
        _1872 = _1904;
    }
    float _1906 = _1872;
    float _1908 = _1906;
    if (_1822)
    {
        float _1910 = _1844 * _1900;
        _1834 = _1910;
    }
    float _1912 = _1834;
    if (!_1822)
    {
        _1846 = _1884;
    }
    float _1914 = _1846;
    float _1916 = _1914;
    if (_1822)
    {
        float _1918 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1896 = _1918;
    }
    float _1920 = _1896;
    if (_1822)
    {
        float _1922 = _1810 * _1912;
        _1836 = _1922;
    }
    float _1924 = _1836;
    if (!_1822)
    {
        _1902 = _1812;
    }
    float _1926 = _1902;
    float _1928 = _1926;
    if (_1822)
    {
        float _1930 = _1812 * _1912;
        _1928 = _1930;
    }
    float _1932 = _1928;
    if (!_1822)
    {
        _1908 = _1814;
    }
    float _1934 = _1908;
    float _1936 = _1934;
    if (_1822)
    {
        float _1938 = fma(_1884, _1878, _1920);
        _1916 = _1938;
    }
    float _1940 = _1916;
    if (_1822)
    {
        float _1942 = _1924 * _1924;
        _1936 = _1942;
    }
    float _1944 = _1936;
    if (!_1822)
    {
        _1886 = _1816;
    }
    float _1946 = _1886;
    float _1948 = _1946;
    if (_1822)
    {
        float _1950 = _1932 * _1932;
        _1948 = _1950;
    }
    float _1952 = _1948;
    float _1954 = fma(_1940, _1940, _1944);
    float _1956 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1958 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1960 = _1954 + _1952;
    float _1962 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1956);
    float _1964 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1968 = fma(_1892, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1966);
    float _1970 = precise::clamp(_1968, 0.0, 1.0);
    float _1972 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1974 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1962);
    float _1976 = rsqrt(_1960);
    float _1978 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1964);
    float _1980 = -_1970;
    float _1982 = _1980 + 1.0;
    float _1984 = _1974 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1986 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1988 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1958);
    float _1990 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1978);
    float _1992 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1994 = abs(_1982);
    float _1996 = log2(_1994);
    float _1998 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1986);
    float _2000 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1988);
    float _2002 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2004 = -_1992;
    float _2006 = fma(_2004, _1972, 1.0);
    float _2008 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1998);
    float _2010 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2012 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2014 = _1976 * _1924;
    float _2016 = _1976 * _1940;
    float _2018 = _1976 * _1932;
    float _2020 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2012);
    float _2022 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2024 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2026 = log2(_2006);
    float _2028 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2020);
    float _2030 = -_2022;
    float _2032 = fma(_2016, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2030);
    float _2034 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2036 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2038 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2028);
    float _2040 = -_2018;
    float _2042 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2032);
    float _2044 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2046 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2036);
    float _2048 = exp2(_2034);
    float _2050 = fma(_2042, -0.5, 0.5);
    float _2052 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2044);
    float _2054 = fma(_2042, 0.5, 0.5);
    float _2056 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2046);
    float _2058 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2052);
    float _2060 = _2016 + 1.0;
    float _2062 = 1.0 / _2038;
    float _2064 = fma(_2054, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2066 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2058);
    float _2068 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2056);
    float _2070 = _2026 * 0.693147182464599609375;
    float _2072 = fma(_2054, _2064, -0.212114393711090087890625);
    float _2074 = sqrt(_2050);
    float _2076 = -_2016;
    float _2078 = fma(_2048, _2060, _2076);
    float _2080 = fma(_2054, _2072, 1.570728778839111328125);
    float _2082 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2084 = fma(_2078, 0.5, 0.5);
    float _2086 = _2066 * _2062;
    float _2088 = _2068 * _2062;
    float _2090 = fma(_2086, 0.5, 0.5);
    float _2092 = fma(_2088, -0.5, 0.5);
    float _2094 = _2074 * 0.636619746685028076171875;
    float3 _5454 = float3(_2090, _2092, _2082);
    float _2096 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5454, float3(0.0), isnan(_5454)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5454, float3(0.0), isnan(_5454)), level(0.0)).x;
    float3 _5465 = float3(_2090, _2092, _2082);
    float4 _2099 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5465, float3(0.0), isnan(_5465)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5465, float3(0.0), isnan(_5465)), level(0.0)).xyzw;
    float _2101 = _2099.x;
    float _2103 = _2099.y;
    float _2105 = _2099.z;
    float _2107 = _2099.w;
    float _2109 = -_2080;
    float _2111 = fma(_2094, _2109, 1.0);
    float2 _5487 = float2(_2111, _2084);
    float3 _2115 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5487, float2(0.0), isnan(_5487)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5487, float2(0.0), isnan(_5487)), level(0.0)).xyz;
    float _2117 = _2115.x;
    float _2119 = _2115.y;
    float _2121 = _2115.z;
    float _2123 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2125 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2127 = _1728 * _1786;
    bool _2129 = _1728 > 0.0;
    bool _2131 = isnan(_1728);
    bool _2133 = _2129 || _2131;
    bool _2135 = isnan(0.0);
    bool _2137 = _2133 || _2135;
    float _2139 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2125);
    float _2141 = exp2(_2123);
    float _2143 = _2127 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2145 = _1786 <= 0.0;
    bool _2147 = !_2137;
    bool _2149 = _2145 || _2147;
    float _2151 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2139);
    float _2153 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2151);
    float _2155 = _366 * _2143;
    float _2157 = _2153 + _2038;
    float _2159 = _2155 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2066;
    out.gl_Position.y = _2068;
    out.gl_Position.z = _2153;
    out.gl_Position.w = _2038;
    float _2161 = _2157 * 0.5;
    float _2163 = -_2141;
    float _2165 = _2163 + 1.0;
    out.m_47.x = _2159;
    float _2167 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _2161;
    out.m_77.w = _2038;
    float _2169 = _2167 * _2096;
    float _2171 = -_2167;
    float _2173 = _2171 + 1.0;
    float _2175 = _2107 * _2169;
    float _2177 = _2107 * _2173;
    float _2179 = _2121 * _2169;
    float _2181 = fma(_2117, _2175, _2101);
    float _2183 = fma(_2119, _2175, _2103);
    float _2185 = fma(_2107, _2179, _2105);
    out.m_79.x = _2181;
    out.m_79.y = _2183;
    out.m_79.z = _2185;
    out.m_79.w = _2177;
    if (!_2149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2187 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2187;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

