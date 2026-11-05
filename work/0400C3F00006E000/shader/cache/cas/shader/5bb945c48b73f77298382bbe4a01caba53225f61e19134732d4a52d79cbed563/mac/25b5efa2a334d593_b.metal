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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
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
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_77 [[user(locn11)]];
    float4 m_83 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_65 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3252 = false;
    bool _1612 = false;
    bool _1300 = false;
    bool _1202 = false;
    bool _986 = false;
    bool _888 = false;
    bool _672 = false;
    bool _444 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4187 = as_type<float>(_116);
        out.gl_Position.z = _4187;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_49.w;
    float _122 = float(_102);
    float _124 = 1.0 / _122;
    float _126 = -_120;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_120);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = _128 * _124;
    bool _142 = _128 >= _122;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    out.m_51.x = _140;
    float _148 = _120;
    float _150 = 0.0;
    float _152 = 0.0;
    float _154 = _140;
    float _156 = _128;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _160 = _158 * 5.0;
        _118 = as_type<int>(_160);
    }
    int _162 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4260 = as_type<float>(_162);
        out.gl_Position.z = _4260;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_53.w;
    float _166 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    float _184 = in.m_44.x;
    float _186 = in.m_44.y;
    float _188 = in.m_44.z;
    float _190 = _166;
    if (!_176)
    {
        float _192 = _166 * _166;
        float _194 = _192 * 0.5;
        _150 = _194;
    }
    float _196 = _150;
    float _198 = _196;
    if (!_176)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_176;
    float _206 = _202;
    float _208 = 0.0;
    if (!_204)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _166 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _166);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _238;
        _208 = _222;
        _152 = _228;
    }
    float _240 = _206;
    float _242 = _208;
    float _244 = _152;
    bool _246 = !_176;
    float _248 = _244;
    float _250 = _242;
    float _252 = _240;
    if (!_246)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _166 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _190 = _272;
        _248 = _260;
    }
    float _274 = _190;
    float _276 = _248;
    float _278 = _276;
    if (!_176)
    {
        float _280 = _128 * _128;
        float _282 = _280 * 0.5;
        _250 = _282;
    }
    float _284 = _250;
    float _286 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _288 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _290 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_176)
    {
        _278 = _128;
    }
    float _292 = _278;
    float _294 = fma(_274, _178, _286);
    float _296 = fma(_274, _180, _288);
    float _298 = _292;
    if (!_176)
    {
        float _300 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _252 = _300;
    }
    float _302 = _252;
    bool _304 = !_176;
    float _306 = _302;
    if (!_304)
    {
        float _308 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = log2(_308);
        float _312 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _314 = _312 + 1.0;
        float _316 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = _128 * _310;
        float _320 = 1.0 / _314;
        float _322 = _316 * 0.693147182464599609375;
        float _324 = exp2(_318);
        float _326 = 1.0 / _322;
        float _328 = _324 + (-1.0);
        float _330 = -_328;
        float _332 = fma(_330, _326, _128);
        float _334 = _332 * _320;
        float _336 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _306 = _336;
    }
    float _338 = _306;
    bool _340 = !_176;
    if (!_340)
    {
        float _342 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _344 = log2(_342);
        float _346 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _348 = _346 + 1.0;
        float _350 = 1.0 / _348;
        float _352 = _128 * _344;
        float _354 = exp2(_352);
        float _356 = -_354;
        float _358 = _356 + 1.0;
        float _360 = _358 * _350;
        _298 = _360;
    }
    float _362 = _298;
    float _364 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _366 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _368 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _370 = fma(_274, _182, _290);
    float _372 = fma(_362, _180, _364);
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _376 = fma(_362, _178, _366);
    float _378 = fma(_362, _182, _368);
    float _380 = -_372;
    float _382 = _296 + _380;
    float _384 = fma(_296, _164, _186);
    float _386 = -_376;
    float _388 = _294 + _386;
    float _390 = fma(_294, _164, _184);
    float _392 = _382 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _394 = _382 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _396 = _382 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _398 = -_378;
    float _400 = _370 + _398;
    float _402 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _392);
    float _404 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _394);
    float _406 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _396);
    float _408 = fma(_370, _164, _188);
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].z, _402);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].z, _404);
    float _414 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].z, _406);
    bool _416 = !_374;
    float _418 = _410;
    float _420 = _412;
    float _422 = _410;
    float _424 = _414;
    float _442;
    if (!_416)
    {
        float _426 = in.m_55.x;
        float _428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _430 = _426 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _434 = _432 * _428;
        float _436 = floor(_434);
        float _438 = -_436;
        float _440 = _434 + _438;
        _442 = _440;
        _444 = true;
    }
    else
    {
        _442 = _140;
    }
    _444 = false;
    float _446 = _442;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _450 = _446 + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _454 = _446 + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _458 = _446 + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _460;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _472 = 1.0 / _462;
    float _474 = in.m_53.x;
    float _476 = in.m_53.y;
    float _478 = in.m_53.z;
    bool _480 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _482 = isnan(_446);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = 1.0 / _466;
    bool _494 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _496 = isnan(_446);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    bool _506 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _508 = 1.0 / _470;
    float _510 = _450 * _472;
    bool _512 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _514 = isnan(_446);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -_522;
    float _526 = _524 + 1.0;
    float _528 = _454 * _492;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _530;
    float _534 = _504 * _526;
    float _536 = -_504;
    float _538 = _536 + 1.0;
    float _540 = fma(_532, _528, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _546 = _458 * _508;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _552;
    float _556 = fma(_544, _546, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _558 = fma(_550, _528, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _560 = fma(_554, _528, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _562 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _564 = isnan(_446);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _582 = _490 * _538;
    float _584 = -_490;
    float _586 = _584 + 1.0;
    float _588 = fma(_576, _546, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _590 = fma(_580, _546, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _592 = _572 * _586;
    float _594 = -_572;
    float _596 = _594 + 1.0;
    float _598 = _540 * _592;
    float _600 = _558 * _592;
    float _602 = _560 * _592;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _604;
    float _608 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].x, _598);
    float _610 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].y, _600);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _616;
    float _620 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].z, _602);
    float _622 = fma(_606, _510, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _624 = fma(_614, _510, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _626 = fma(_618, _510, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _628 = fma(_588, _582, _608);
    float _630 = fma(_556, _582, _610);
    float _632 = fma(_590, _582, _620);
    float _634 = fma(_622, _534, _628);
    float _636 = fma(_624, _534, _630);
    float _638 = fma(_626, _534, _632);
    float _640 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[146].x, _634);
    float _642 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[146].y, _636);
    float _644 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[146].z, _638);
    float _646 = _640 * _474;
    float _648 = _642 * _476;
    float _650 = _644 * _478;
    bool _652 = !_506;
    float _670;
    if (!_652)
    {
        float _654 = in.m_55.x;
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _658 = _654 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _662 = _660 * _656;
        float _664 = floor(_662);
        float _666 = -_664;
        float _668 = _662 + _666;
        _670 = _668;
        _672 = true;
    }
    else
    {
        _670 = _140;
    }
    _672 = false;
    float _674 = _670;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _678 = _674 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _682 = _674 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _686 = _674 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _700 = 1.0 / _690;
    bool _702 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _704 = 1.0 / _694;
    bool _706 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _708 = isnan(_674);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -_716;
    float _720 = _718 + 1.0;
    float _722 = 1.0 / _698;
    bool _724 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _726 = isnan(_674);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = _678 * _700;
    bool _738 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _740 = isnan(_674);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = _682 * _704;
    float _752 = -_734;
    float _754 = _752 + 1.0;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _756;
    float _760 = -_748;
    float _762 = _760 + 1.0;
    float _764 = _748 * _754;
    bool _766 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _768 = isnan(_674);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = fma(_758, _750, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _780 = _686 * _722;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _792 = _790 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _794 = fma(_784, _750, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _796 = fma(_788, _750, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _798 = _716 * _762;
    float _800 = _776 * _720;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _806 = -_776;
    float _808 = _806 + 1.0;
    float _810 = _796 * _800;
    float _812 = _778 * _800;
    float _814 = _794 * _800;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _820 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[107].x, _812);
    float _822 = fma(_804, _780, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _824 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[107].y, _814);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _826;
    float _830 = fma(_818, _780, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _832 = fma(_792, _780, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _834 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[107].z, _810);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _836;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _840;
    float _844 = fma(_830, _798, _820);
    float _846 = fma(_828, _736, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _848 = fma(_838, _736, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _850 = fma(_842, _736, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _852 = fma(_822, _798, _824);
    float _854 = fma(_832, _798, _834);
    float _856 = fma(_846, _764, _844);
    float _858 = fma(_848, _764, _852);
    float _860 = fma(_850, _764, _854);
    float _862 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].x, _856);
    float _864 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].y, _858);
    float _866 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].z, _860);
    bool _868 = !_702;
    float _886;
    if (!_868)
    {
        float _870 = in.m_55.x;
        float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _874 = _870 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _876 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _878 = _876 * _872;
        float _880 = floor(_878);
        float _882 = -_880;
        float _884 = _878 + _882;
        _886 = _884;
        _888 = true;
    }
    else
    {
        _886 = _140;
    }
    _888 = false;
    float _890 = _886;
    float _892 = _862 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _894 = _864 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _896 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _898 = isnan(_890);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _912 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _914 = isnan(_890);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _930 = _890 + _928;
    float _932 = -_906;
    float _934 = _932 + 1.0;
    float _936 = _866 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _938 = 1.0 / _910;
    float _940 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = _922 * _934;
    float _944 = -_922;
    float _946 = _944 + 1.0;
    float _948 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _952 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _954 = _926 * _938;
    float _956 = fma(_954, _930, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _958 = _956 * _942;
    float _960 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[115].x, _958);
    float _962 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[116].x, _960);
    float _964 = _962 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _940;
    out.m_57.y = _948;
    out.m_57.z = _950;
    out.m_57.w = _964;
    bool _966 = !_952;
    float _984;
    if (!_966)
    {
        float _968 = in.m_55.x;
        float _970 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _972 = _968 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _974 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _976 = _974 * _970;
        float _978 = floor(_976);
        float _980 = -_978;
        float _982 = _976 + _980;
        _984 = _982;
        _986 = true;
    }
    else
    {
        _984 = _140;
    }
    _986 = false;
    float _988 = _984;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _992 = _988 + _990;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _996 = _988 + _994;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1000 = _988 + _998;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1014 = 1.0 / _1004;
    bool _1016 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1018 = 1.0 / _1008;
    bool _1020 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1022 = isnan(_988);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1028 = _1024 || _1026;
    float _1030 = float(_1028);
    float _1032 = -_1030;
    float _1034 = _1032 + 1.0;
    float _1036 = 1.0 / _1012;
    bool _1038 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1040 = isnan(_988);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1046 = _1042 || _1044;
    float _1048 = float(_1046);
    float _1050 = _992 * _1014;
    bool _1052 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1054 = isnan(_988);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = _996 * _1018;
    float _1066 = -_1048;
    float _1068 = _1066 + 1.0;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1070;
    float _1074 = -_1062;
    float _1076 = _1074 + 1.0;
    float _1078 = _1062 * _1068;
    bool _1080 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1082 = isnan(_988);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = fma(_1072, _1064, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1094 = _1000 * _1036;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1096;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1106 = _1104 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1108 = fma(_1098, _1064, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1110 = fma(_1102, _1064, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1112 = _1030 * _1076;
    float _1114 = _1090 * _1034;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1120 = -_1090;
    float _1122 = _1120 + 1.0;
    float _1124 = _1110 * _1114;
    float _1126 = _1092 * _1114;
    float _1128 = _1108 * _1114;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1134 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1126);
    float _1136 = fma(_1118, _1094, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1138 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1128);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1140;
    float _1144 = fma(_1132, _1094, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1146 = fma(_1106, _1094, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1148 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1124);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1150;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1154;
    float _1158 = fma(_1144, _1112, _1134);
    float _1160 = fma(_1142, _1050, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1162 = fma(_1152, _1050, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1164 = fma(_1156, _1050, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1166 = fma(_1136, _1112, _1138);
    float _1168 = fma(_1146, _1112, _1148);
    float _1170 = fma(_1160, _1078, _1158);
    float _1172 = fma(_1162, _1078, _1166);
    float _1174 = fma(_1164, _1078, _1168);
    float _1176 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1170);
    float _1178 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1172);
    float _1180 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1174);
    bool _1182 = !_1016;
    float _1200;
    if (!_1182)
    {
        float _1184 = in.m_55.x;
        float _1186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1188 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _1192 = _1190 * _1186;
        float _1194 = floor(_1192);
        float _1196 = -_1194;
        float _1198 = _1192 + _1196;
        _1200 = _1198;
        _1202 = true;
    }
    else
    {
        _1200 = _140;
    }
    _1202 = false;
    float _1204 = _1200;
    float _1206 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1208 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1210 = _1204 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1212 = isnan(_1204);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1224 = _1222 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1226 = _1204 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1228 = isnan(_1204);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1238;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1244 = _1204 + _1242;
    float _1246 = -_1220;
    float _1248 = _1246 + 1.0;
    float _1250 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1252 = 1.0 / _1224;
    float _1254 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1256 = _1236 * _1248;
    float _1258 = -_1236;
    float _1260 = _1258 + 1.0;
    float _1262 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1264 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1268 = _1240 * _1252;
    float _1270 = fma(_1268, _1244, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1272 = _1270 * _1256;
    float _1274 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1272);
    float _1276 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1274);
    float _1278 = _1276 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _1254;
    out.m_59.y = _1262;
    out.m_59.z = _1264;
    out.m_59.w = _1278;
    bool _1280 = !_1266;
    float _1298;
    if (!_1280)
    {
        float _1282 = in.m_55.x;
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1286 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[14].y, _128);
        float _1290 = _1288 * _1284;
        float _1292 = floor(_1290);
        float _1294 = -_1292;
        float _1296 = _1290 + _1294;
        _1298 = _1296;
        _1300 = true;
    }
    else
    {
        _1298 = _140;
    }
    _1300 = false;
    float _1302 = _1298;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1306 = _1302 + _1304;
    bool _1308 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1310 = isnan(_1302);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1324;
    bool _1328 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1330 = isnan(_1302);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    bool _1340 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1342 = isnan(_1302);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1348 = _1344 || _1346;
    float _1350 = float(_1348);
    float _1352 = 1.0 / _1322;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1356 = _1354 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1358 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1360 = isnan(_1302);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    float _1370 = -_1350;
    float _1372 = _1370 + 1.0;
    bool _1374 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1376 = isnan(_1302);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = 1.0 / _1356;
    float _1388 = -_1368;
    float _1390 = _1388 + 1.0;
    bool _1392 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1394 = _1326 * _1352;
    float _1396 = -_1318;
    float _1398 = _1396 + 1.0;
    float _1400 = -_1338;
    float _1402 = _1400 + 1.0;
    float _1404 = -_1384;
    float _1406 = _1404 + 1.0;
    float _1408 = fma(_1394, _1306, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1410 = _1338 * _1398;
    float _1412 = _1350 * _1402;
    float _1414 = _1368 * _1372;
    bool _1416 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1418 = isnan(_1302);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1424 = _1420 || _1422;
    float _1426 = float(_1424);
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1430 = _1428 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1436 = _1384 * _1390;
    bool _1438 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1440 = isnan(_1302);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1446 = _1442 || _1444;
    float _1448 = float(_1446);
    float _1450 = _1426 * _1406;
    float _1452 = 1.0 / _1434;
    float _1454 = -_1426;
    float _1456 = _1454 + 1.0;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1460 = _1458 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1462 = _1448 * _1456;
    float _1464 = -_1448;
    float _1466 = _1464 + 1.0;
    float _1468 = _1460 * _1386;
    float _1470 = 1.0 / _1430;
    float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1474 = _1472 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1476 = _1408 * _1462;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1480 = _1478 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1482;
    float _1486 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1476);
    float _1488 = 1.0 / _1474;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1492 = _1302 + _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1496 = _1494 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1498 = _1484 * _1452;
    float _1500 = fma(_1468, _1492, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1504 = _1302 + _1502;
    float _1506 = 1.0 / _1480;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1512 = fma(_1498, _1504, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1514 = fma(_1500, _1450, _1486);
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1518 = _1302 + _1516;
    float _1520 = _1510 * _1470;
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1522;
    float _1526 = 1.0 / _1496;
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1530 = _1528 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1532 = fma(_1520, _1518, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1534 = _1524 * _1488;
    float _1536 = fma(_1512, _1436, _1514);
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1540 = _1302 + _1538;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1544 = _1302 + _1542;
    bool _1546 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1548 = isnan(_1302);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    float _1558 = _1530 * _1506;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1560;
    float _1564 = fma(_1534, _1540, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1566 = fma(_1532, _1414, _1536);
    float _1568 = fma(_1558, _1544, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1570 = -_1556;
    float _1572 = _1570 + 1.0;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1576 = _1302 + _1574;
    float _1578 = fma(_1564, _1412, _1566);
    float _1580 = _1562 * _1526;
    float _1582 = _1318 * _1572;
    float _1584 = fma(_1568, _1410, _1578);
    float _1586 = fma(_1580, _1576, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1588 = fma(_1586, _1582, _1584);
    float _1590 = fma(_1556, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1588);
    out.m_61.x = _1590;
    bool _1592 = !_1392;
    float _1610;
    if (!_1592)
    {
        float _1594 = in.m_55.x;
        float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1598 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[14].z, _128);
        float _1602 = _1600 * _1596;
        float _1604 = floor(_1602);
        float _1606 = -_1604;
        float _1608 = _1602 + _1606;
        _1610 = _1608;
        _1612 = true;
    }
    else
    {
        _1610 = _140;
    }
    _1612 = false;
    float _1614 = _1610;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1618 = _1614 + _1616;
    bool _1620 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1622 = isnan(_1614);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1628 = _1624 || _1626;
    float _1630 = float(_1628);
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1634 = _1632 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1636;
    bool _1640 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1642 = isnan(_1614);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    bool _1652 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1654 = isnan(_1614);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1660 = _1656 || _1658;
    float _1662 = float(_1660);
    float _1664 = 1.0 / _1634;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1668 = _1666 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1670 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1672 = isnan(_1614);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1678 = _1674 || _1676;
    float _1680 = float(_1678);
    float _1682 = -_1662;
    float _1684 = _1682 + 1.0;
    bool _1686 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1688 = isnan(_1614);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1694 = _1690 || _1692;
    float _1696 = float(_1694);
    float _1698 = 1.0 / _1668;
    float _1700 = -_1680;
    float _1702 = _1700 + 1.0;
    bool _1704 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].w;
    float _1706 = _1638 * _1664;
    float _1708 = -_1630;
    float _1710 = _1708 + 1.0;
    float _1712 = -_1650;
    float _1714 = _1712 + 1.0;
    float _1716 = -_1696;
    float _1718 = _1716 + 1.0;
    float _1720 = fma(_1706, _1618, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1722 = _1650 * _1710;
    float _1724 = _1662 * _1714;
    float _1726 = _1680 * _1684;
    bool _1728 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1730 = isnan(_1614);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1736 = _1732 || _1734;
    float _1738 = float(_1736);
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1742 = _1740 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1744 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1746 = _1744 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1748 = _1696 * _1702;
    bool _1750 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1752 = isnan(_1614);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = _1738 * _1718;
    float _1764 = 1.0 / _1746;
    float _1766 = -_1738;
    float _1768 = _1766 + 1.0;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1774 = _1760 * _1768;
    float _1776 = -_1760;
    float _1778 = _1776 + 1.0;
    float _1780 = _1772 * _1698;
    float _1782 = 1.0 / _1742;
    float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1786 = _1784 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1788 = _1720 * _1774;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1794;
    float _1798 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1788);
    float _1800 = 1.0 / _1786;
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1804 = _1614 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1810 = _1796 * _1764;
    float _1812 = fma(_1780, _1804, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1816 = _1614 + _1814;
    float _1818 = 1.0 / _1792;
    float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1822 = _1820 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1824 = fma(_1810, _1816, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1826 = fma(_1812, _1762, _1798);
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1830 = _1614 + _1828;
    float _1832 = _1822 * _1782;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1834;
    float _1838 = 1.0 / _1808;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1842 = _1840 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1844 = fma(_1832, _1830, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1846 = _1836 * _1800;
    float _1848 = fma(_1824, _1748, _1826);
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1852 = _1614 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1856 = _1614 + _1854;
    bool _1858 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1860 = isnan(_1614);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    float _1870 = _1842 * _1818;
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1872;
    float _1876 = fma(_1846, _1852, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1878 = fma(_1844, _1726, _1848);
    float _1880 = fma(_1870, _1856, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1882 = -_1868;
    float _1884 = _1882 + 1.0;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1888 = _1614 + _1886;
    float _1890 = fma(_1876, _1724, _1878);
    float _1892 = _1874 * _1838;
    float _1894 = _1630 * _1884;
    float _1896 = fma(_1880, _1722, _1890);
    float _1898 = fma(_1892, _1888, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1900 = fma(_1898, _1894, _1896);
    float _1902 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1900);
    out.m_63.x = _1902;
    bool _1904 = !_1704;
    int _1906 = as_type<int>(_1890);
    float _1908 = _1878;
    int _1910 = as_type<int>(_1748);
    int _1912 = as_type<int>(_1902);
    int _1914 = as_type<int>(_1846);
    int _1916 = as_type<int>(_1892);
    float _1918 = _1838;
    if (!_1904)
    {
        float _1920 = in.m_55.x;
        float _1922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].w;
        float _1924 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[15].w;
        float _1926 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[14].w, _128);
        float _1928 = _1926 * _1922;
        float _1930 = floor(_1928);
        float _1932 = -_1930;
        float _1934 = _1928 + _1932;
        _154 = _1934;
    }
    float _1936 = _154;
    float _1938 = in.m_55.y;
    int _1940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1942 = _1940 != 0;
    float _1944 = in.m_65.x;
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1948 = _1946 != 0;
    int _1950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1952 = _1950 != 0;
    float _1954 = 0.0;
    int _1956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _1958 = _1944;
    if (_1942)
    {
        float _1960 = in.m_55.x;
        _1954 = _1960;
    }
    float _1962 = _1954;
    int _1964 = 0;
    if (_1942)
    {
        _1964 = 0;
    }
    int _1966 = _1964;
    float _1968 = 0.0;
    int _1970 = _1966;
    if (_1942)
    {
        float _1972 = in.m_55.z;
        _1968 = _1972;
    }
    float _1974 = _1968;
    float _1976 = _1898;
    if (_1948)
    {
        float _1978 = in.m_55.x;
        _1976 = _1978;
    }
    float _1980 = _1976;
    if (_1942)
    {
        _1906 = as_type<int>(_1938);
    }
    int _1982 = _1906;
    float _1984 = _1724;
    int _1986 = _1982;
    if (_1952)
    {
        float _1988 = in.m_55.z;
        _1984 = _1988;
    }
    float _1990 = _1984;
    float _1992 = _1962;
    if (_1942)
    {
        _1908 = _1962;
    }
    float _1994 = _1908;
    float _1996 = _1974;
    float _1998 = _1994;
    if (_1942)
    {
        _1910 = as_type<int>(_1974);
    }
    int _2000 = _1910;
    int _2002 = _2000;
    float _2004 = _1990;
    float _2006 = _1980;
    if (!_1942)
    {
        float _2008 = in.m_55.x;
        float _2010 = _1938 * 3.1415927410125732421875;
        float _2012 = in.m_55.z;
        float _2014 = _2010 * 0.15915493667125701904296875;
        float _2016 = _2014 * 6.283185482025146484375;
        float _2018 = sin(_2016);
        float _2020 = _2008 * 3.1415927410125732421875;
        float _2022 = _2020 * 0.15915493667125701904296875;
        float _2024 = _2012 * 3.1415927410125732421875;
        float _2026 = _2024 * 0.15915493667125701904296875;
        float _2028 = _2022 * 6.283185482025146484375;
        float _2030 = sin(_2028);
        float _2032 = _2026 * 6.283185482025146484375;
        float _2034 = sin(_2032);
        _1996 = _2012;
        _1992 = _2008;
        _1956 = as_type<int>(_2026);
        _1970 = 1;
        _1998 = _2030;
        _2002 = as_type<int>(_2034);
        _1986 = as_type<int>(_2018);
    }
    float _2036 = _1996;
    float _2038 = _1992;
    int _2040 = _1956;
    int _2042 = _1970;
    float _2044 = _1998;
    int _2046 = _2002;
    int _2048 = _1986;
    float _2050 = _2036 * 2.0;
    float _2052 = _2038 * 2.0;
    int _2054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2056 = _2054 != 0;
    int _2058 = _2040;
    if (_1948)
    {
        float _2060 = -_1944;
        float _2062 = _2060 + 1.0;
        _2058 = as_type<int>(_2062);
    }
    int _2064 = _2058;
    int _2066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2068 = _2066 != 0;
    float _2070 = in.m_65.y;
    float _2072 = floor(_2050);
    bool _2074 = false;
    if (_1948)
    {
        bool _2076 = _1980 > 0.5;
        _2074 = _2076;
    }
    bool _2078 = _2074;
    if (_1952)
    {
        float _2080 = -_1944;
        float _2082 = _2080 + 1.0;
        _1912 = as_type<int>(_2082);
    }
    int _2084 = _1912;
    float _2086 = 0.0;
    int _2088 = _2084;
    if (!_1948)
    {
        _2086 = _1944;
    }
    float _2090 = _2086;
    float _2092 = in.m_55.w;
    float _2094 = _2090;
    if (_1948)
    {
        float _2096 = _2078 ? as_type<float>(_2064) : _1944;
        _2094 = _2096;
    }
    float _2098 = _2094;
    float _2100 = _1938 * 2.0;
    bool _2102 = false;
    if (_1952)
    {
        bool _2104 = _1990 > 0.5;
        _2102 = _2104;
    }
    bool _2106 = _2102;
    float _2108 = floor(_2052);
    int _2110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2112 = _2110 != 0;
    if (_2056)
    {
        float _2114 = -_1944;
        float _2116 = _2114 + 1.0;
        _1914 = as_type<int>(_2116);
    }
    int _2118 = _1914;
    if (!_1952)
    {
        _2004 = _1944;
    }
    float _2120 = _2004;
    float _2122 = _2120;
    if (_2068)
    {
        float _2124 = -_1944;
        float _2126 = _2124 + 1.0;
        _1916 = as_type<int>(_2126);
    }
    int _2128 = _1916;
    bool _2130 = _1938 > 0.5;
    float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _2134 = _1936 + _2132;
    if (_1952)
    {
        float _2136 = _2106 ? as_type<float>(_2084) : _1944;
        _2122 = _2136;
    }
    float _2138 = _2122;
    float _2140 = floor(_2100);
    bool _2142 = _2072 > 0.0;
    float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2146 = _1936 + _2144;
    if (!_2056)
    {
        _2006 = _1944;
    }
    float _2148 = _2006;
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _2152 = _1936 + _2150;
    float _2154 = _2148;
    if (!_2068)
    {
        _1918 = _1944;
    }
    float _2156 = _1918;
    float _2158 = _2156;
    if (_2112)
    {
        float _2160 = -_1944;
        float _2162 = _2160 + 1.0;
        _2088 = as_type<int>(_2162);
    }
    int _2164 = _2088;
    if (_2056)
    {
        float _2166 = _2130 ? as_type<float>(_2118) : _1944;
        _2154 = _2166;
    }
    float _2168 = _2154;
    if (_2068)
    {
        float _2170 = _2130 ? as_type<float>(_2128) : _1944;
        _2158 = _2170;
    }
    float _2172 = _2158;
    float _2174 = -_2070;
    float _2176 = _2174 + 1.0;
    bool _2178 = _2072 >= 0.0;
    bool _2180 = isnan(_2072);
    bool _2182 = _2178 || _2180;
    bool _2184 = isnan(0.0);
    bool _2186 = _2182 || _2184;
    bool _2188 = _2108 > 0.0;
    int _2190 = _2186 ? 0 : 1;
    bool _2192 = _2108 >= 0.0;
    bool _2194 = isnan(_2108);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan(0.0);
    bool _2200 = _2196 || _2198;
    int _2202 = ~_2190;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    int _2208 = _2200 ? 0 : 1;
    int _2210 = _2206;
    if (!_2142)
    {
        int _2212 = ~_2190;
        int _2214 = _2212 + 1;
        _2210 = _2214;
    }
    int _2216 = _2210;
    if (_2112)
    {
        float _2218 = _2130 ? as_type<float>(_2164) : _1944;
        _1958 = _2218;
    }
    float _2220 = _1958;
    bool _2222 = _2036 > 0.5;
    bool _2224 = _2140 > 0.0;
    bool _2226 = _2140 >= 0.0;
    bool _2228 = isnan(_2140);
    bool _2230 = _2226 || _2228;
    bool _2232 = isnan(0.0);
    bool _2234 = _2230 || _2232;
    int _2236 = ~_2208;
    int _2238 = _2236 + 1;
    int _2240 = _2238 + 1;
    int _2242 = _2240;
    if (!_2188)
    {
        int _2244 = ~_2208;
        int _2246 = _2244 + 1;
        _2242 = _2246;
    }
    int _2248 = _2242;
    int _2250 = _2222 ? as_type<int>(_2176) : as_type<int>(_2070);
    int _2252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2254 = _2252 != 0;
    int _2256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2258 = _2256 != 0;
    int _2260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2262 = _2260 != 0;
    int _2264 = _2234 ? 0 : 1;
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _2268 = _2266 + (*spvDescriptorSet0.vp_c9)._m0[185].w;
    int _2270 = _2130 ? as_type<int>(_2176) : as_type<int>(_2070);
    float _2272 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _2274 = _2272 + (*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2276 = _2262 ? as_type<float>(_2250) : _2070;
    int _2278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2280 = _2278 != 0;
    int _2282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2284 = _2282 != 0;
    int _2286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2288 = _2286 != 0;
    float _2290 = 1.0 / _2268;
    float _2292 = in.m_67.x;
    float _2294 = in.m_67.y;
    float _2296 = in.m_67.z;
    int _2298 = ~_2264;
    int _2300 = _2298 + 1;
    int _2302 = _2300 + 1;
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _2306 = _2304 + (*spvDescriptorSet0.vp_c9)._m0[184].w;
    int _2308 = _2302;
    if (!_2224)
    {
        int _2310 = ~_2264;
        int _2312 = _2310 + 1;
        _2308 = _2312;
    }
    int _2314 = _2308;
    float _2316 = _384 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _2318 = !_2280;
    int _2320 = _2318 ? 0 : 1;
    float _2322 = 1.0 / _2274;
    bool _2324 = !_2284;
    int _2326 = _2324 ? 0 : 1;
    float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _2330 = _2328 + (*spvDescriptorSet0.vp_c9)._m0[186].w;
    int _2332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2334 = _2332 != 0;
    float _2336 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2316);
    int _2338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2340 = _2338 != 0;
    float _2342 = _384 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2344 = _2092 > 0.5;
    float _2346 = _384 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2348 = 1.0 / _2306;
    float _2350 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2342);
    float _2352 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2346);
    float _2354 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2336);
    float _2356 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2358 = _2356 + (*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2360 = -(*spvDescriptorSet0.vp_c9)._m0[184].x;
    float _2362 = _2360 + (*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _2364 = 1.0 / _2330;
    float _2366 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2350);
    float _2368 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2352);
    float _2370 = -(*spvDescriptorSet0.vp_c9)._m0[186].x;
    float _2372 = _2370 + (*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _2374 = _2362 * _2290;
    float _2376 = 1.0 / _2358;
    float _2378 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2296);
    float _2380 = _2372 * _2322;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2384 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2386 = -(*spvDescriptorSet0.vp_c9)._m0[183].x;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[184].x + _2386;
    float _2390 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2392 = log2(_2390);
    float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2396 = _2394 + (*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _2398 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _2400 = _2398 + (*spvDescriptorSet0.vp_c9)._m0[190].w;
    float _2402 = fma(_2384, -2.0, _2382);
    float _2404 = _2388 * _2348;
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _2408 = (*spvDescriptorSet0.vp_c9)._m0[186].x + _2406;
    float _2410 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, -0.20000000298023223876953125);
    float _2412 = 1.0 / _2396;
    float _2414 = _2408 * _2364;
    float _2416 = precise::min(_2410, 1.5);
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[188].x + _2420;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[188].x;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _2428 = 1.0 / _2400;
    float _2430 = fma(_2416, _2418, 1.0);
    float _2432 = _2422 * _2376;
    float _2434 = _128 * _2392;
    float _2436 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _2438 = _1936 + _2436;
    float _2440 = -(*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _2442 = (*spvDescriptorSet0.vp_c9)._m0[190].x + _2440;
    bool _2444 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _2446 = isnan(_1936);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan((*spvDescriptorSet0.vp_c9)._m0[189].w);
    bool _2452 = _2448 || _2450;
    float _2454 = float(_2452);
    float _2456 = fma(_2374, _2134, (*spvDescriptorSet0.vp_c9)._m0[184].x);
    float _2458 = fma(_2404, _2438, (*spvDescriptorSet0.vp_c9)._m0[183].x);
    bool _2460 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _2462 = isnan(_1936);
    bool _2464 = _2460 || _2462;
    bool _2466 = isnan((*spvDescriptorSet0.vp_c9)._m0[190].w);
    bool _2468 = _2464 || _2466;
    float _2470 = float(_2468);
    float _2472 = exp2(_2434);
    float _2474 = _2426 * _2412;
    float _2476 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _2478 = _1936 + _2476;
    bool _2480 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[187].w;
    bool _2482 = isnan(_1936);
    bool _2484 = _2480 || _2482;
    bool _2486 = isnan((*spvDescriptorSet0.vp_c9)._m0[187].w);
    bool _2488 = _2484 || _2486;
    float _2490 = float(_2488);
    float _2492 = -_2470;
    float _2494 = _2492 + 1.0;
    float _2496 = _2442 * _2428;
    bool _2498 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[188].w;
    bool _2500 = isnan(_1936);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan((*spvDescriptorSet0.vp_c9)._m0[188].w);
    bool _2506 = _2502 || _2504;
    float _2508 = float(_2506);
    float _2510 = fma(_2414, _2478, (*spvDescriptorSet0.vp_c9)._m0[185].x);
    float _2512 = _2454 * _2494;
    float _2514 = -_2454;
    float _2516 = _2514 + 1.0;
    bool _2518 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _2520 = isnan(_1936);
    bool _2522 = _2518 || _2520;
    bool _2524 = isnan((*spvDescriptorSet0.vp_c9)._m0[186].w);
    bool _2526 = _2522 || _2524;
    float _2528 = float(_2526);
    float _2530 = -_2508;
    float _2532 = _2530 + 1.0;
    float _2534 = -_2490;
    float _2536 = _2534 + 1.0;
    float _2538 = _2508 * _2516;
    bool _2540 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _2542 = isnan(_1936);
    bool _2544 = _2540 || _2542;
    bool _2546 = isnan((*spvDescriptorSet0.vp_c9)._m0[185].w);
    bool _2548 = _2544 || _2546;
    float _2550 = float(_2548);
    float _2552 = _2490 * _2532;
    float _2554 = -_2472;
    float _2556 = _2554 + 1.0;
    float _2558 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _2560 = _1936 + _2558;
    float _2562 = _2528 * _2536;
    float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2566 = 1.0 + _2564;
    bool _2568 = !_2288;
    int _2570 = _2568 ? 0 : 1;
    float _2572 = -_2528;
    float _2574 = _2572 + 1.0;
    bool _2576 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2578 = isnan(0.0);
    bool _2580 = _2576 || _2578;
    bool _2582 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2584 = _2580 || _2582;
    float _2586 = fma(_2380, _2560, (*spvDescriptorSet0.vp_c9)._m0[186].x);
    bool _2588 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _2590 = isnan(_1936);
    bool _2592 = _2588 || _2590;
    bool _2594 = isnan((*spvDescriptorSet0.vp_c9)._m0[184].w);
    bool _2596 = _2592 || _2594;
    float _2598 = float(_2596);
    float _2600 = -_2550;
    float _2602 = _2600 + 1.0;
    float _2604 = 1.0 / _2566;
    float _2606 = _2584 ? _2556 : 0.0;
    float _2608 = _2550 * _2574;
    bool _2610 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2612 = isnan(1.0);
    bool _2614 = _2610 || _2612;
    bool _2616 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2618 = _2614 || _2616;
    float _2620 = _2598 * _2602;
    bool _2622 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[183].w;
    bool _2624 = isnan(_1936);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c9)._m0[183].w);
    bool _2630 = _2626 || _2628;
    float _2632 = float(_2630);
    float _2634 = -_2598;
    float _2636 = _2634 + 1.0;
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2640 = _1936 + _2638;
    float _2642 = fma(_2474, _2146, (*spvDescriptorSet0.vp_c9)._m0[188].x);
    float _2644 = _648 * _2430;
    float _2646 = _2632 * _2636;
    float _2648 = -_2632;
    float _2650 = _2648 + 1.0;
    float _2652 = _646 * _2430;
    int _2654 = abs(_2320);
    float _2656 = _2458 * _2646;
    float _2658 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2292);
    float _2660 = _2606 * _2604;
    float _2662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2294);
    float _2664 = fma(_2650, (*spvDescriptorSet0.vp_c9)._m0[183].x, _2656);
    float _2666 = _650 * _2430;
    float _2668 = _2644 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2670 = _2652 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2672 = fma(_2432, _2640, (*spvDescriptorSet0.vp_c9)._m0[187].x);
    bool _2674 = !_2618;
    float _2676 = _2674 ? _128 : _2660;
    float _2678 = _1938 + _2036;
    float _2680 = float(_2216);
    float _2682 = _2668 * _2662;
    bool _2684 = _2042 != 1;
    float _2686 = _2670 * _2658;
    int _2688 = abs(_2326);
    float _2690 = in.m_69.x;
    float _2692 = in.m_69.y;
    float _2694 = in.m_69.z;
    int _2696 = abs(_2570);
    float _2698 = _2678 + (-1.0);
    float _2700 = float(_2654);
    float _2702 = _1938 + _2038;
    float _2704 = _2666 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2706 = float(_2248);
    float _2708 = _2700 * _2680;
    float _2710 = float(_2688);
    float _2712 = _2702 + (-1.0);
    float _2714 = _2708 * (-2.0);
    float _2716 = _2710 * _2706;
    float _2718 = float(_2314);
    float _2720 = fma(_2698, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2722 = float(_2696);
    float _2724 = _2038 + (-0.5);
    float _2726 = fma(_2712, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2730 = fma(_2456, _2620, _2664);
    float _2732 = _2722 * _2718;
    float _2734 = fma(_2726, _2714, _2726);
    float _2736 = fma(_2714, _2690, _2690);
    float _2738 = _2716 * (-2.0);
    float _2740 = _2704 * _2378;
    float _2742 = fma(_2724, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2736);
    float _2744 = fma(_2720, _2738, _2720);
    float _2746 = fma(_2738, _2692, _2692);
    float _2748 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2750 = _2038 + _2036;
    float _2752 = fma(_2676, _2734, _2742);
    float _2754 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2748);
    float _2756 = _1938 + (-0.5);
    float _2758 = _2750 + (-1.0);
    float _2760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2762 = _2036 + (-0.5);
    float _2764 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2746);
    float _2766 = fma(_2758, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2768 = _2732 * (-2.0);
    float _2770 = fma(_2676, _2744, _2764);
    float _2772 = fma(_2768, _2694, _2694);
    float _2774 = fma(_2766, _2768, _2766);
    float _2776 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2778 = fma(_2762, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2772);
    float _2780 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2782 = fma(_2038, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2776);
    float _2784 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2786 = fma(_2676, _2774, _2778);
    float _2788 = _2728 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2790 = -_2780;
    float _2792 = fma(_2784, 2.0, _2790);
    float _2794 = _2786 * 0.15915493667125701904296875;
    float _2796 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2798 = _2752 * 0.15915493667125701904296875;
    float _2800 = _2770 * 0.15915493667125701904296875;
    float _2802 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _2806 = _2044 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2808 = _2760 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2810 = fma(_2788, _2098, -0.5);
    float _2812 = -_2796;
    float _2814 = fma(_2806, 2.0, _2812);
    float _2816 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2818 = _2794 * 6.283185482025146484375;
    float _2820 = cos(_2818);
    float _2822 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2824 = fma(_2808, _2172, -0.5);
    bool _2826 = !_2684;
    float _2828 = _2826 ? as_type<float>(_2046) : as_type<float>(_2048);
    float _2830 = _2354 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2832 = _2254 ? as_type<float>(_2270) : _2070;
    float _2834 = _2368 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2836 = _2344 ? as_type<int>(_2176) : as_type<int>(_2070);
    float _2838 = _2798 * 6.283185482025146484375;
    float _2840 = sin(_2838);
    float _2842 = _2804 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2844 = fma(as_type<float>(_2048), (*spvDescriptorSet0.vp_c9)._m0[93].w, _2822);
    float _2846 = fma(_2510, _2608, _2730);
    float _2848 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2754);
    float _2850 = fma(_2842, _2220, -0.5);
    float _2852 = -_128;
    float _2854 = fma(_2852, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2814);
    float _2856 = fma(_2586, _2562, _2846);
    float _2858 = _2798 * 6.283185482025146484375;
    float _2860 = cos(_2858);
    float _2862 = _2820 * _2682;
    float _2864 = -_128;
    float _2866 = fma(_2864, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2792);
    float _2868 = _2366 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2870 = fma(_2672, _2552, _2856);
    float _2872 = fma(_2496, _2152, (*spvDescriptorSet0.vp_c9)._m0[189].x);
    float _2874 = _2800 * 6.283185482025146484375;
    float _2876 = sin(_2874);
    float _2878 = as_type<float>(_2048) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2880 = fma(_2878, -2.0, _2802);
    float _2882 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2816);
    bool _2884 = !_2684;
    float _2886 = _2884 ? as_type<float>(_2048) : _2044;
    float _2888 = _2800 * 6.283185482025146484375;
    float _2890 = cos(_2888);
    float _2892 = _2860 * _2862;
    float _2894 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2882);
    float _2896 = fma(_2894, _2824, _2854);
    float _2898 = _2794 * 6.283185482025146484375;
    float _2900 = sin(_2898);
    float _2902 = _2840 * _2876;
    float _2904 = _2860 * _2876;
    float _2906 = _2876 * _2820;
    float _2908 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2782);
    float _2910 = _2860 * _2890;
    float _2912 = _2890 * _2820;
    float _2914 = _2840 * _2890;
    float _2916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2918 = fma(_2908, _2810, _2866);
    float _2920 = fma(_2900, _2910, _2902);
    float _2922 = -_2682;
    float _2924 = _2900 * _2922;
    float _2926 = -_2914;
    float _2928 = fma(_2900, _2904, _2926);
    float _2930 = -_2904;
    float _2932 = fma(_2900, _2914, _2930);
    float _2934 = fma(_2920, _2686, _2892);
    float _2936 = _2840 * _2862;
    float _2938 = fma(_2912, _2686, _2924);
    float _2940 = fma(_2900, _2902, _2910);
    float _2942 = fma(_2928, _2740, _2934);
    float _2944 = fma(_2932, _2686, _2936);
    float _2946 = fma(_2906, _2740, _2938);
    float _2948 = _2916 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2950 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2952 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2954 = fma(_2940, _2740, _2944);
    float _2956 = _2258 ? as_type<float>(_2836) : _2070;
    float _2958 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2950);
    float _2960 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2952);
    float _2962 = fma(_2948, _2832, -0.5);
    float _2964 = _2334 ? as_type<float>(_2250) : _2070;
    float _2966 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2958);
    float _2968 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2960);
    float _2970 = _2340 ? as_type<float>(_2250) : _2070;
    float _2972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2974 = _2966 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2976 = _2968 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2978 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2402);
    float _2980 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2982 = _2830 + _2974;
    float _2984 = _2834 + _2976;
    float _2986 = -_2978;
    float _2988 = fma(_2848, _2962, _2986);
    float _2990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _2992 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2994 = _2982 + _2992;
    float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2998 = _2984 + _2996;
    float _3000 = _2994 * _2994;
    float _3002 = _2998 * _2998;
    float _3004 = _2972 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3006 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3008 = _3000 + _3002;
    float _3010 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2980);
    float _3012 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3014 = _2886 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3016 = sqrt(_3008);
    float _3018 = fma(_3004, _2964, -0.5);
    float _3020 = _2990 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _3022 = fma(_2886, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3006);
    float _3024 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3010);
    float _3026 = -_3012;
    float _3028 = fma(_3014, 2.0, _3026);
    float _3030 = fma(_3020, _2970, -0.5);
    float _3032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3034 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _3036 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3038 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _3040 = fma(_2828, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3034);
    float _3042 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2844);
    float _3044 = _2828 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    bool _3046 = _3016 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3050 = _2868 + _3036;
    float _3052 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2880);
    float _3054 = fma(_3044, -2.0, _3038);
    float _3056 = -_3052;
    float _3058 = fma(_3042, _3018, _3056);
    float _3060 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3062 = _2552;
    float _3064 = _3002;
    float _3066 = _3000;
    float _3068 = _2982;
    float _3070 = _2984;
    if (!_3046)
    {
        _3062 = _3002;
    }
    float _3072 = _3062;
    float _3074 = _3072;
    if (!_3046)
    {
        _3064 = _3050;
    }
    float _3076 = _3064;
    bool _3078 = !_3046;
    float _3080 = _3076;
    if (!_3078)
    {
        float _3082 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3084 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3086 = _3016 + _3084;
        float _3088 = rsqrt(_3008);
        float _3090 = _3086 * _3082;
        float _3092 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3094 = _3090 * 0.15915493667125701904296875;
        float _3096 = _3094 * 6.283185482025146484375;
        float _3098 = sin(_3096);
        float _3100 = _3094 * 6.283185482025146484375;
        float _3102 = cos(_3100);
        float _3104 = fma(_3098, _3092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3106 = _3088 * _3104;
        float _3108 = _3102 + (-1.0);
        float _3110 = fma(_2994, _3106, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3112 = fma(_2998, _3106, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3114 = _3108 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3118 = _3110 + _3116;
        float _3120 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3122 = _3112 + _3120;
        float _3124 = fma(_3050, _3102, _3114);
        float _3126 = _3118 * _3118;
        float _3128 = _3122 * _3122;
        _3080 = _3124;
        _3066 = _3126;
        _3074 = _3128;
        _3068 = _3110;
        _3070 = _3112;
    }
    float _3130 = _3080;
    float _3132 = _3066;
    float _3134 = _3074;
    float _3136 = _3068;
    float _3138 = _3070;
    float _3140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3142 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3144 = _3130 + _3142;
    float _3146 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3040);
    float _3148 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3054);
    float _3150 = _2276 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3152 = fma(_3144, _3144, _3132);
    float _3154 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3022);
    float _3156 = -_128;
    float _3158 = fma(_3156, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3028);
    float _3160 = fma(_2642, _2538, _2870);
    float _3162 = _3152 + _3134;
    float _3164 = -_3148;
    float _3166 = fma(_3146, _3030, _3164);
    float _3168 = fma(_3154, _2850, _3158);
    float _3170 = _2168 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3172 = _2138 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3174 = _2956 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3176 = fma(_2872, _2512, _3160);
    float _3178 = _3150 * _3140;
    float _3180 = _3172 * _3032;
    float _3182 = sqrt(_3162);
    float _3184 = _3174 * _3048;
    float _3186 = _3170 * _3060;
    float _3188 = _2896 + 0.5;
    float _3190 = _2918 + 0.5;
    float _3192 = _2988 + 0.5;
    float _3194 = _3058 + 0.5;
    float _3196 = _3168 + 0.5;
    float _3198 = _3166 + 0.5;
    float _3200 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[190].x, _3176);
    out.m_71.x = _3190;
    out.m_71.y = _3192;
    out.m_71.z = _3180;
    out.m_71.w = _3184;
    out.m_73.x = _3186;
    out.m_73.y = _3178;
    bool _3202 = _3182 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3204 = isnan(_3182);
    bool _3206 = _3202 || _3204;
    bool _3208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3210 = _3206 || _3208;
    out.m_75.x = _3188;
    out.m_75.y = _3194;
    out.m_77.x = _3196;
    out.m_77.y = _3198;
    out.m_79.x = _3200;
    float _3212 = _3162;
    float _3214 = _3192;
    float _3216 = _3190;
    if (!_3210)
    {
        _3212 = 1.0;
    }
    float _3218 = _3212;
    bool _3220 = !_3210;
    float _3222 = _3218;
    if (!_3220)
    {
        bool _3224 = _3182 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3226 = isnan(_3182);
        bool _3228 = _3224 || _3226;
        bool _3230 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3232 = _3228 || _3230;
        if (!_3232)
        {
            float _3234 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3236 = _3182 + _3234;
            float _3238 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3240 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3238;
            float _3242 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3244 = _3242 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3246 = 1.0 / _3240;
            float _3248 = _3236 * _3246;
            float _3250 = fma(_3248, _3244, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3222 = _3250;
            _3252 = true;
        }
        else
        {
            bool _3254 = _3182 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3256 = isnan(_3182);
            bool _3258 = _3254 || _3256;
            bool _3260 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3262 = _3258 || _3260;
            if (!_3262)
            {
                float _3264 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3266 = _3182 + _3264;
                float _3268 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3270 = _3268 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3272 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3274 = _3272 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3276 = 1.0 / _3270;
                float _3278 = _3266 * _3276;
                float _3280 = fma(_3278, _3274, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3222 = _3280;
                _3252 = true;
            }
            else
            {
                _3222 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3252 = false;
    float _3282 = _3222;
    float _3284 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3286 = _3130 + _3284;
    float _3288 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3290 = _3136 + _3288;
    float _3292 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3294 = _3138 + _3292;
    float _3296 = fma(_3286, _3282, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3298 = fma(_3290, _3282, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3300 = fma(_3294, _3282, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3302 = -_2868;
    float _3304 = _3302 + _3296;
    float _3306 = -_2830;
    float _3308 = _3306 + _3298;
    float _3310 = -_2834;
    float _3312 = _3310 + _3300;
    float _3314 = _3304 * _3304;
    float _3316 = fma(_3308, _3308, _3314);
    float _3318 = fma(_3312, _3312, _3316);
    float _3320 = sqrt(_3318);
    bool _3322 = _3320 > 0.0;
    bool _3324 = !_3322;
    float _3326 = _3320;
    float _3328 = _3298;
    float _3330 = _3296;
    float _3332 = _3300;
    float _3334 = _3318;
    if (!_3324)
    {
        bool _3336 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3338 = _3180;
        if (_3336)
        {
            float _3340 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3338 = _3340;
        }
        float _3342 = _3338;
        if (_3336)
        {
            float _3344 = _410 * _3342;
            _3214 = _3344;
        }
        float _3346 = _3214;
        float _3348 = _3346;
        if (_3336)
        {
            float _3350 = _412 * _3342;
            _3216 = _3350;
        }
        float _3352 = _3216;
        float _3354 = _3352;
        if (_3336)
        {
            float _3356 = _414 * _3342;
            _3326 = _3356;
        }
        float _3358 = _3326;
        float _3360 = _3358;
        if (!_3336)
        {
            float _3362 = _128 + 1.0;
            float _3364 = _3362;
            if (!_176)
            {
                float _3366 = _3362 * _3362;
                float _3368 = _3366 * 0.5;
                _418 = _3368;
            }
            float _3370 = _418;
            float _3372 = _3370;
            if (!_176)
            {
                float _3374 = _3370 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3372 = _3374;
            }
            float _3376 = _3372;
            bool _3378 = !_176;
            float _3380 = _3376;
            if (!_3378)
            {
                float _3382 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3384 = log2(_3382);
                float _3386 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3388 = _3386 + 1.0;
                float _3390 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3392 = _3384 * _3362;
                float _3394 = 1.0 / _3388;
                float _3396 = _3390 * 0.693147182464599609375;
                float _3398 = exp2(_3392);
                float _3400 = 1.0 / _3396;
                float _3402 = _3398 + (-1.0);
                float _3404 = -_3402;
                float _3406 = fma(_3404, _3400, _3362);
                float _3408 = _3406 * _3394;
                float _3410 = _3408 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3380 = _3410;
            }
            float _3412 = _3380;
            float _3414 = _3412 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3416 = _3412 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3418 = !_176;
            if (!_3418)
            {
                float _3420 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3422 = log2(_3420);
                float _3424 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3426 = _3424 + 1.0;
                float _3428 = 1.0 / _3426;
                float _3430 = _3422 * _3362;
                float _3432 = exp2(_3430);
                float _3434 = -_3432;
                float _3436 = _3434 + 1.0;
                float _3438 = _3436 * _3428;
                _3364 = _3438;
            }
            float _3440 = _3364;
            float _3442 = fma(_3440, _180, _3416);
            float _3444 = fma(_3440, _178, _3414);
            float _3446 = _3412 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3448 = -_372;
            float _3450 = _3448 + _3442;
            float _3452 = -_376;
            float _3454 = _3452 + _3444;
            float _3456 = fma(_3440, _182, _3446);
            float _3458 = _3450 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3460 = _3450 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3462 = _3450 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3464 = -_378;
            float _3466 = _3464 + _3456;
            float _3468 = fma(_3454, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3458);
            float _3470 = fma(_3454, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3460);
            float _3472 = fma(_3454, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3462);
            float _3474 = fma(_3466, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3468);
            float _3476 = fma(_3466, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3470);
            float _3478 = fma(_3466, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3472);
            _420 = _3476;
            _422 = _3474;
            _424 = _3478;
            _3348 = _3474;
            _3354 = _3476;
            _3360 = _3478;
        }
        float _3480 = _420;
        float _3482 = _422;
        float _3484 = _424;
        float _3486 = _3348;
        float _3488 = _3354;
        float _3490 = _3360;
        float _3492 = _3480 * _3480;
        float _3494 = rsqrt(_3318);
        float _3496 = fma(_3482, _3482, _3492);
        float _3498 = fma(_3484, _3484, _3496);
        float _3500 = sqrt(_3498);
        float _3502 = _3308 * _3494;
        float _3504 = _3304 * _3494;
        float _3506 = _3312 * _3494;
        bool _3508 = _3500 > 0.0;
        bool _3510 = !_3508;
        _156 = _3502;
        if (!_3510)
        {
            float _3512 = rsqrt(_3498);
            float _3514 = _3512 * _3480;
            float _3516 = _3512 * _3482;
            float _3518 = _3512 * _3484;
            float _3520 = _3504 * _3514;
            float _3522 = fma(_3502, _3516, _3520);
            float _3524 = fma(_3506, _3518, _3522);
            float _3526 = _3524 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3528 = fma(_3486, _3526, _3298);
            float _3530 = fma(_3488, _3526, _3296);
            float _3532 = fma(_3490, _3526, _3300);
            _3328 = _3528;
            _3330 = _3530;
            _3332 = _3532;
        }
    }
    float _3534 = _3328;
    float _3536 = _3330;
    float _3538 = _3332;
    float _3540 = _156;
    float _3542 = _2868 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3544 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3542);
    float _3546 = _2868 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3548 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3550 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3552 = _3548 || _3550;
    bool _3554 = isnan(0.5);
    bool _3556 = _3552 || _3554;
    float _3558 = fma(_2834, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3544);
    float _3560 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3546);
    float _3562 = _3558 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3564 = fma(_2834, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3560);
    bool _3566 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3568 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3570 = _3566 || _3568;
    bool _3572 = isnan(0.5);
    bool _3574 = _3570 || _3572;
    float _3576 = 1.0 / _3562;
    float _3578 = _3564 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3580 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3582 = _3540;
    float _3584 = _3578;
    float _3586 = _3534;
    if (_3556)
    {
        _3580 = _3534;
    }
    float _3588 = _3580;
    float _3590 = _3578 + _3562;
    float _3592 = _3588;
    if (_3556)
    {
        _3582 = _3536;
    }
    float _3594 = _3582;
    float _3596 = _3594;
    if (_3556)
    {
        _3584 = _3538;
    }
    float _3598 = _3584;
    float _3600 = _3598;
    float _3602 = _3576;
    if (!_3556)
    {
        float _3604 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3606 = _2868 + _3604;
        float _3608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3610 = _2830 + _3608;
        float _3612 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3614 = -_2830;
        float _3616 = _3614 + _3534;
        float _3618 = _3606 * _3606;
        float _3620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3622 = _2834 + _3620;
        float _3624 = -_2834;
        float _3626 = _3624 + _3538;
        float _3628 = fma(_3610, _3610, _3618);
        float _3630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3632 = fma(_3622, _3622, _3628);
        float _3634 = sqrt(_3632);
        float _3636 = _3612 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3638 = precise::min(_3634, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3640 = _3638 * _3630;
        float _3642 = -_2868;
        float _3644 = _3642 + _3536;
        float _3646 = _3636 * _3640;
        float _3648 = fma(_3616, _3646, _2830);
        float _3650 = fma(_3644, _3646, _2868);
        float _3652 = fma(_3626, _3646, _2834);
        _3586 = _3616;
        _3596 = _3650;
        _3592 = _3648;
        _3600 = _3652;
    }
    float _3654 = _3586;
    float _3656 = _3596;
    float _3658 = _3592;
    float _3660 = _3600;
    float _3662 = _3654;
    if (_3574)
    {
        _3662 = 1.0;
    }
    float _3664 = _3662;
    float _3666 = _3590 * _3576;
    float _3668 = _3666 * 0.5;
    float _3670 = _3664;
    float _3672 = _3668;
    if (!_3574)
    {
        float _3674 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3676 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3678 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3676);
        float _3680 = _3674 * 0.15915493667125701904296875;
        float _3682 = _3680 * 6.283185482025146484375;
        float _3684 = cos(_3682);
        float _3686 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3688 = _3686 * 0.15915493667125701904296875;
        float _3690 = _3680 * 6.283185482025146484375;
        float _3692 = sin(_3690);
        float _3694 = 1.0 / _3684;
        float _3696 = _3688 * 6.283185482025146484375;
        float _3698 = cos(_3696);
        float _3700 = _3692 * _3694;
        float _3702 = 1.0 / _3678;
        float _3704 = _3698 * _3700;
        float _3706 = _3688 * 6.283185482025146484375;
        float _3708 = sin(_3706);
        float _3710 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3712 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3710;
        float _3714 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3716 = _3702 * _3714;
        float _3718 = 1.0 / _3704;
        float _3720 = 1.0 / _3712;
        float _3722 = _3708 * _3718;
        float _3724 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3726 = fma(_3722, _3716, _3724);
        float _3728 = _3726 * _3720;
        float _3730 = precise::clamp(_3728, 0.0, 1.0);
        _3602 = _3716;
        _3670 = _3730;
    }
    float _3732 = _3602;
    float _3734 = _3670;
    float _3736 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3738 = _3656 + _3736;
    float _3740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3742 = _3658 + _3740;
    float _3744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3746 = _3660 + _3744;
    float _3748 = _3738 * _3738;
    float _3750 = fma(_3742, _3742, _3748);
    float _3752 = fma(_3746, _3746, _3750);
    float _3754 = rsqrt(_3752);
    float _3756 = sqrt(_3752);
    float _3758 = _3754 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3760 = _3742 * _3758;
    float _3762 = _3746 * _3758;
    float _3764 = _3760 * _3760;
    float _3766 = _3762 * _3762;
    float _3768 = _3764 + _3766;
    float _3770 = sqrt(_3768);
    bool _3772 = _3770 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3776 = _3770 + _3774;
    float _3778 = _3754;
    float _3780 = _3776;
    float _3782 = _3738;
    float _3784 = _3760;
    if (_3772)
    {
        float _3786 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3778 = _3786;
    }
    float _3788 = _3778;
    float _3790 = _3788;
    if (_3772)
    {
        float _3792 = _3776 * _3788;
        _3780 = _3792;
    }
    float _3794 = _3780;
    if (_3772)
    {
        float _3796 = rsqrt(_3768);
        _3790 = _3796;
    }
    float _3798 = _3790;
    float _3800 = _3798;
    if (_3772)
    {
        float _3802 = _3794 * 0.15915493667125701904296875;
        _3672 = _3802;
    }
    float _3804 = _3672;
    float _3806 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3808 = _3746;
    float _3810 = _3804;
    if (_3772)
    {
        float _3812 = _3804 * 6.283185482025146484375;
        float _3814 = sin(_3812);
        _3808 = _3814;
    }
    float _3816 = _3808;
    float _3818 = precise::max(0.0, _3806);
    float _3820 = _3732;
    float _3822 = _3818;
    if (_3772)
    {
        float _3824 = _3804 * 6.283185482025146484375;
        float _3826 = cos(_3824);
        _3820 = _3826;
    }
    float _3828 = _3820;
    float _3830 = -_3758;
    float _3832 = -_3818;
    float _3834 = fma(_3738, _3830, _3832);
    if (_3772)
    {
        float _3836 = _3834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3782 = _3836;
    }
    float _3838 = _3782;
    float _3840 = _3816;
    float _3842 = _3838;
    if (_3772)
    {
        float _3844 = fma(_3816, _3838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3840 = _3844;
    }
    float _3846 = _3840;
    float _3848 = _3846;
    if (!_3772)
    {
        _3842 = _3766;
    }
    float _3850 = _3842;
    float _3852 = _3850;
    if (_3772)
    {
        float _3854 = _3798 * _3846;
        _3334 = _3854;
    }
    float _3856 = _3334;
    if (!_3772)
    {
        _3800 = _3834;
    }
    float _3858 = _3800;
    float _3860 = _3858;
    if (_3772)
    {
        float _3862 = _3828 + (-1.0);
        _3822 = _3862;
    }
    float _3864 = _3822;
    float _3866 = _3864;
    if (_3772)
    {
        float _3868 = _3760 * _3856;
        _3784 = _3868;
    }
    float _3870 = _3784;
    if (!_3772)
    {
        _3848 = _3762;
    }
    float _3872 = _3848;
    float _3874 = _3872;
    if (_3772)
    {
        float _3876 = _3762 * _3856;
        _3874 = _3876;
    }
    float _3878 = _3874;
    if (_3772)
    {
        float _3880 = _3864 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3810 = _3880;
    }
    float _3882 = _3810;
    if (!_3772)
    {
        _3866 = _3764;
    }
    float _3884 = _3866;
    float _3886 = _3884;
    if (_3772)
    {
        float _3888 = _3870 * _3870;
        _3886 = _3888;
    }
    float _3890 = _3886;
    if (_3772)
    {
        float _3892 = _3878 * _3878;
        _3852 = _3892;
    }
    float _3894 = _3852;
    if (_3772)
    {
        float _3896 = fma(_3834, _3828, _3882);
        _3860 = _3896;
    }
    float _3898 = _3860;
    float _3900 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3902 = fma(_3898, _3898, _3890);
    float _3904 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3906 = fma(_3756, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3904);
    float _3908 = precise::clamp(_3906, 0.0, 1.0);
    float _3910 = _3902 + _3894;
    float _3912 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3914 = -_3908;
    float _3916 = _3914 + 1.0;
    float _3918 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3920 = rsqrt(_3910);
    float _3922 = fma(_3658, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3912);
    float _3924 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3926 = fma(_3658, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3900);
    float _3928 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3930 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3922);
    float _3932 = fma(_3658, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3924);
    float _3934 = fma(_3658, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3918);
    float _3936 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3926);
    float _3938 = _3930 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3940 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3932);
    float _3942 = abs(_3916);
    float _3944 = log2(_3942);
    float _3946 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3934);
    float _3948 = _3938 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3950 = _3940 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3952 = _3936 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3954 = _3920 * _3870;
    float _3956 = -_3948;
    float _3958 = fma(_3956, _3928, 1.0);
    float _3960 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3962 = _3946 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3964 = _3920 * _3898;
    float _3966 = _3954 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3968 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3960);
    float _3970 = _3920 * _3878;
    float _3972 = log2(_3958);
    float _3974 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3968);
    float _3976 = -_3966;
    float _3978 = fma(_3964, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3976);
    float _3980 = _3944 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3982 = fma(_3962, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3974);
    float _3984 = -_3970;
    float _3986 = fma(_3984, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3978);
    float _3988 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3990 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3992 = exp2(_3980);
    float _3994 = fma(_3986, -0.5, 0.5);
    float _3996 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3988);
    float _3998 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3990);
    float _4000 = fma(_3986, 0.5, 0.5);
    float _4002 = _3964 + 1.0;
    float _4004 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3996);
    float _4006 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3998);
    float _4008 = 1.0 / _3982;
    float _4010 = fma(_4000, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4012 = fma(_3962, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4004);
    float _4014 = fma(_3962, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4006);
    float _4016 = _3972 * 0.693147182464599609375;
    float _4018 = fma(_4000, _4010, -0.212114393711090087890625);
    float _4020 = sqrt(_3994);
    float _4022 = -_3964;
    float _4024 = fma(_3992, _4002, _4022);
    float _4026 = fma(_4000, _4018, 1.570728778839111328125);
    float _4028 = _4016 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4030 = _4012 * _4008;
    float _4032 = _4014 * _4008;
    float _4034 = fma(_4030, 0.5, 0.5);
    float _4036 = fma(_4032, -0.5, 0.5);
    float _4038 = fma(_4024, 0.5, 0.5);
    float _4040 = _4020 * 0.636619746685028076171875;
    float3 _10421 = float3(_4034, _4036, _4028);
    float _4042 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10421, float3(0.0), isnan(_10421)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10421, float3(0.0), isnan(_10421)), level(0.0)).x;
    float3 _10432 = float3(_4034, _4036, _4028);
    float4 _4045 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10432, float3(0.0), isnan(_10432)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10432, float3(0.0), isnan(_10432)), level(0.0)).xyzw;
    float _4047 = _4045.x;
    float _4049 = _4045.y;
    float _4051 = _4045.z;
    float _4053 = _4045.w;
    float _4055 = -_4026;
    float _4057 = fma(_4040, _4055, 1.0);
    float2 _10454 = float2(_4057, _4038);
    float3 _4061 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10454, float2(0.0), isnan(_10454)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10454, float2(0.0), isnan(_10454)), level(0.0)).xyz;
    float _4063 = _4061.x;
    float _4065 = _4061.y;
    float _4067 = _4061.z;
    float _4069 = _3944 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4071 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4073 = _3982 * 0.5;
    bool _4075 = _3734 > 0.0;
    bool _4077 = isnan(_3734);
    bool _4079 = _4075 || _4077;
    bool _4081 = isnan(0.0);
    bool _4083 = _4079 || _4081;
    float _4085 = _4012 + _3982;
    float _4087 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4071);
    float _4089 = exp2(_4069);
    float _4091 = _3734 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4093 = _4085 * 0.5;
    float _4095 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4087);
    float _4097 = fma(_4014, -0.5, _4073);
    float _4099 = _4091 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4101 = fma(_3962, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4095);
    out.m_47.x = _4099;
    float _4103 = _4101 + _3982;
    out.gl_Position.x = _4012;
    out.gl_Position.y = _4014;
    out.gl_Position.z = _4101;
    out.gl_Position.w = _3982;
    float _4105 = _4103 * 0.5;
    float _4107 = -_4089;
    float _4109 = _4107 + 1.0;
    float _4111 = _4109 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _4093;
    out.m_81.y = _4097;
    out.m_81.z = _4105;
    out.m_81.w = _3982;
    float _4113 = -_4111;
    float _4115 = _4113 + 1.0;
    float _4117 = _4111 * _4042;
    float _4119 = _4053 * _4115;
    float _4121 = _4053 * _4117;
    float _4123 = _4067 * _4117;
    float _4125 = fma(_4063, _4121, _4047);
    float _4127 = fma(_4065, _4121, _4049);
    float _4129 = fma(_4053, _4123, _4051);
    out.m_83.x = _4125;
    out.m_83.y = _4127;
    out.m_83.z = _4129;
    out.m_83.w = _4119;
    if (_4083)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _4131 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4131;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3252 = false;
    bool _1612 = false;
    bool _1300 = false;
    bool _1202 = false;
    bool _986 = false;
    bool _888 = false;
    bool _672 = false;
    bool _444 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4187 = as_type<float>(_116);
        out.gl_Position.z = _4187;
    }
    if (!_106)
    {
        return out;
    }
    float _120 = in.m_49.w;
    float _122 = float(_102);
    float _124 = 1.0 / _122;
    float _126 = -_120;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_120);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = _128 * _124;
    bool _142 = _128 >= _122;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    out.m_51.x = _140;
    float _148 = _120;
    float _150 = 0.0;
    float _152 = 0.0;
    float _154 = _140;
    float _156 = _128;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _160 = _158 * 5.0;
        _118 = as_type<int>(_160);
    }
    int _162 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4260 = as_type<float>(_162);
        out.gl_Position.z = _4260;
    }
    if (_146)
    {
        return out;
    }
    float _164 = in.m_53.w;
    float _166 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    float _184 = in.m_44.x;
    float _186 = in.m_44.y;
    float _188 = in.m_44.z;
    float _190 = _166;
    if (!_176)
    {
        float _192 = _166 * _166;
        float _194 = _192 * 0.5;
        _150 = _194;
    }
    float _196 = _150;
    float _198 = _196;
    if (!_176)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_176;
    float _206 = _202;
    float _208 = 0.0;
    if (!_204)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _166 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _166);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _238;
        _208 = _222;
        _152 = _228;
    }
    float _240 = _206;
    float _242 = _208;
    float _244 = _152;
    bool _246 = !_176;
    float _248 = _244;
    float _250 = _242;
    float _252 = _240;
    if (!_246)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _166 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _190 = _272;
        _248 = _260;
    }
    float _274 = _190;
    float _276 = _248;
    float _278 = _276;
    if (!_176)
    {
        float _280 = _128 * _128;
        float _282 = _280 * 0.5;
        _250 = _282;
    }
    float _284 = _250;
    float _286 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _288 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _290 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_176)
    {
        _278 = _128;
    }
    float _292 = _278;
    float _294 = fma(_274, _178, _286);
    float _296 = fma(_274, _180, _288);
    float _298 = _292;
    if (!_176)
    {
        float _300 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _252 = _300;
    }
    float _302 = _252;
    bool _304 = !_176;
    float _306 = _302;
    if (!_304)
    {
        float _308 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = log2(_308);
        float _312 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _314 = _312 + 1.0;
        float _316 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = _128 * _310;
        float _320 = 1.0 / _314;
        float _322 = _316 * 0.693147182464599609375;
        float _324 = exp2(_318);
        float _326 = 1.0 / _322;
        float _328 = _324 + (-1.0);
        float _330 = -_328;
        float _332 = fma(_330, _326, _128);
        float _334 = _332 * _320;
        float _336 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _306 = _336;
    }
    float _338 = _306;
    bool _340 = !_176;
    if (!_340)
    {
        float _342 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _344 = log2(_342);
        float _346 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _348 = _346 + 1.0;
        float _350 = 1.0 / _348;
        float _352 = _128 * _344;
        float _354 = exp2(_352);
        float _356 = -_354;
        float _358 = _356 + 1.0;
        float _360 = _358 * _350;
        _298 = _360;
    }
    float _362 = _298;
    float _364 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _366 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _368 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _370 = fma(_274, _182, _290);
    float _372 = fma(_362, _180, _364);
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _376 = fma(_362, _178, _366);
    float _378 = fma(_362, _182, _368);
    float _380 = -_372;
    float _382 = _296 + _380;
    float _384 = fma(_296, _164, _186);
    float _386 = -_376;
    float _388 = _294 + _386;
    float _390 = fma(_294, _164, _184);
    float _392 = _382 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _394 = _382 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _396 = _382 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _398 = -_378;
    float _400 = _370 + _398;
    float _402 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _392);
    float _404 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _394);
    float _406 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _396);
    float _408 = fma(_370, _164, _188);
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].z, _402);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].z, _404);
    float _414 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].z, _406);
    bool _416 = !_374;
    float _418 = _410;
    float _420 = _412;
    float _422 = _410;
    float _424 = _414;
    float _442;
    if (!_416)
    {
        float _426 = in.m_55.x;
        float _428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _430 = _426 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _434 = _432 * _428;
        float _436 = floor(_434);
        float _438 = -_436;
        float _440 = _434 + _438;
        _442 = _440;
        _444 = true;
    }
    else
    {
        _442 = _140;
    }
    _444 = false;
    float _446 = _442;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _450 = _446 + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _454 = _446 + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _458 = _446 + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _460;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _472 = 1.0 / _462;
    float _474 = in.m_53.x;
    float _476 = in.m_53.y;
    float _478 = in.m_53.z;
    bool _480 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _482 = isnan(_446);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = 1.0 / _466;
    bool _494 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _496 = isnan(_446);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    bool _506 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _508 = 1.0 / _470;
    float _510 = _450 * _472;
    bool _512 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _514 = isnan(_446);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -_522;
    float _526 = _524 + 1.0;
    float _528 = _454 * _492;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _530;
    float _534 = _504 * _526;
    float _536 = -_504;
    float _538 = _536 + 1.0;
    float _540 = fma(_532, _528, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _546 = _458 * _508;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _552;
    float _556 = fma(_544, _546, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _558 = fma(_550, _528, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _560 = fma(_554, _528, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _562 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _564 = isnan(_446);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _582 = _490 * _538;
    float _584 = -_490;
    float _586 = _584 + 1.0;
    float _588 = fma(_576, _546, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _590 = fma(_580, _546, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _592 = _572 * _586;
    float _594 = -_572;
    float _596 = _594 + 1.0;
    float _598 = _540 * _592;
    float _600 = _558 * _592;
    float _602 = _560 * _592;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _604;
    float _608 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].x, _598);
    float _610 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].y, _600);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _616;
    float _620 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].z, _602);
    float _622 = fma(_606, _510, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _624 = fma(_614, _510, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _626 = fma(_618, _510, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _628 = fma(_588, _582, _608);
    float _630 = fma(_556, _582, _610);
    float _632 = fma(_590, _582, _620);
    float _634 = fma(_622, _534, _628);
    float _636 = fma(_624, _534, _630);
    float _638 = fma(_626, _534, _632);
    float _640 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[146].x, _634);
    float _642 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[146].y, _636);
    float _644 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[146].z, _638);
    float _646 = _640 * _474;
    float _648 = _642 * _476;
    float _650 = _644 * _478;
    bool _652 = !_506;
    float _670;
    if (!_652)
    {
        float _654 = in.m_55.x;
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _658 = _654 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _662 = _660 * _656;
        float _664 = floor(_662);
        float _666 = -_664;
        float _668 = _662 + _666;
        _670 = _668;
        _672 = true;
    }
    else
    {
        _670 = _140;
    }
    _672 = false;
    float _674 = _670;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _678 = _674 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _682 = _674 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _686 = _674 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _700 = 1.0 / _690;
    bool _702 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _704 = 1.0 / _694;
    bool _706 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _708 = isnan(_674);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -_716;
    float _720 = _718 + 1.0;
    float _722 = 1.0 / _698;
    bool _724 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _726 = isnan(_674);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = _678 * _700;
    bool _738 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _740 = isnan(_674);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = _682 * _704;
    float _752 = -_734;
    float _754 = _752 + 1.0;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _756;
    float _760 = -_748;
    float _762 = _760 + 1.0;
    float _764 = _748 * _754;
    bool _766 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _768 = isnan(_674);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = fma(_758, _750, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _780 = _686 * _722;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _792 = _790 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _794 = fma(_784, _750, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _796 = fma(_788, _750, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _798 = _716 * _762;
    float _800 = _776 * _720;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _806 = -_776;
    float _808 = _806 + 1.0;
    float _810 = _796 * _800;
    float _812 = _778 * _800;
    float _814 = _794 * _800;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _820 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[107].x, _812);
    float _822 = fma(_804, _780, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _824 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[107].y, _814);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _826;
    float _830 = fma(_818, _780, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _832 = fma(_792, _780, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _834 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[107].z, _810);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _836;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _840;
    float _844 = fma(_830, _798, _820);
    float _846 = fma(_828, _736, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _848 = fma(_838, _736, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _850 = fma(_842, _736, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _852 = fma(_822, _798, _824);
    float _854 = fma(_832, _798, _834);
    float _856 = fma(_846, _764, _844);
    float _858 = fma(_848, _764, _852);
    float _860 = fma(_850, _764, _854);
    float _862 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].x, _856);
    float _864 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].y, _858);
    float _866 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].z, _860);
    bool _868 = !_702;
    float _886;
    if (!_868)
    {
        float _870 = in.m_55.x;
        float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _874 = _870 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _876 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _878 = _876 * _872;
        float _880 = floor(_878);
        float _882 = -_880;
        float _884 = _878 + _882;
        _886 = _884;
        _888 = true;
    }
    else
    {
        _886 = _140;
    }
    _888 = false;
    float _890 = _886;
    float _892 = _862 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _894 = _864 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _896 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _898 = isnan(_890);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _912 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _914 = isnan(_890);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _930 = _890 + _928;
    float _932 = -_906;
    float _934 = _932 + 1.0;
    float _936 = _866 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _938 = 1.0 / _910;
    float _940 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = _922 * _934;
    float _944 = -_922;
    float _946 = _944 + 1.0;
    float _948 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _952 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _954 = _926 * _938;
    float _956 = fma(_954, _930, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _958 = _956 * _942;
    float _960 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[115].x, _958);
    float _962 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[116].x, _960);
    float _964 = _962 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _940;
    out.m_57.y = _948;
    out.m_57.z = _950;
    out.m_57.w = _964;
    bool _966 = !_952;
    float _984;
    if (!_966)
    {
        float _968 = in.m_55.x;
        float _970 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _972 = _968 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _974 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _976 = _974 * _970;
        float _978 = floor(_976);
        float _980 = -_978;
        float _982 = _976 + _980;
        _984 = _982;
        _986 = true;
    }
    else
    {
        _984 = _140;
    }
    _986 = false;
    float _988 = _984;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _992 = _988 + _990;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _996 = _988 + _994;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1000 = _988 + _998;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1014 = 1.0 / _1004;
    bool _1016 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1018 = 1.0 / _1008;
    bool _1020 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1022 = isnan(_988);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1028 = _1024 || _1026;
    float _1030 = float(_1028);
    float _1032 = -_1030;
    float _1034 = _1032 + 1.0;
    float _1036 = 1.0 / _1012;
    bool _1038 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1040 = isnan(_988);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1046 = _1042 || _1044;
    float _1048 = float(_1046);
    float _1050 = _992 * _1014;
    bool _1052 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1054 = isnan(_988);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = _996 * _1018;
    float _1066 = -_1048;
    float _1068 = _1066 + 1.0;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1070;
    float _1074 = -_1062;
    float _1076 = _1074 + 1.0;
    float _1078 = _1062 * _1068;
    bool _1080 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1082 = isnan(_988);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = fma(_1072, _1064, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1094 = _1000 * _1036;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1096;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1106 = _1104 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1108 = fma(_1098, _1064, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1110 = fma(_1102, _1064, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1112 = _1030 * _1076;
    float _1114 = _1090 * _1034;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1120 = -_1090;
    float _1122 = _1120 + 1.0;
    float _1124 = _1110 * _1114;
    float _1126 = _1092 * _1114;
    float _1128 = _1108 * _1114;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1134 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1126);
    float _1136 = fma(_1118, _1094, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1138 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1128);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1140;
    float _1144 = fma(_1132, _1094, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1146 = fma(_1106, _1094, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1148 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1124);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1150;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1154;
    float _1158 = fma(_1144, _1112, _1134);
    float _1160 = fma(_1142, _1050, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1162 = fma(_1152, _1050, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1164 = fma(_1156, _1050, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1166 = fma(_1136, _1112, _1138);
    float _1168 = fma(_1146, _1112, _1148);
    float _1170 = fma(_1160, _1078, _1158);
    float _1172 = fma(_1162, _1078, _1166);
    float _1174 = fma(_1164, _1078, _1168);
    float _1176 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1170);
    float _1178 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1172);
    float _1180 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1174);
    bool _1182 = !_1016;
    float _1200;
    if (!_1182)
    {
        float _1184 = in.m_55.x;
        float _1186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1188 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _1192 = _1190 * _1186;
        float _1194 = floor(_1192);
        float _1196 = -_1194;
        float _1198 = _1192 + _1196;
        _1200 = _1198;
        _1202 = true;
    }
    else
    {
        _1200 = _140;
    }
    _1202 = false;
    float _1204 = _1200;
    float _1206 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1208 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1210 = _1204 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1212 = isnan(_1204);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1224 = _1222 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1226 = _1204 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1228 = isnan(_1204);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1238;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1244 = _1204 + _1242;
    float _1246 = -_1220;
    float _1248 = _1246 + 1.0;
    float _1250 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1252 = 1.0 / _1224;
    float _1254 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1256 = _1236 * _1248;
    float _1258 = -_1236;
    float _1260 = _1258 + 1.0;
    float _1262 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1264 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1268 = _1240 * _1252;
    float _1270 = fma(_1268, _1244, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1272 = _1270 * _1256;
    float _1274 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1272);
    float _1276 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1274);
    float _1278 = _1276 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _1254;
    out.m_59.y = _1262;
    out.m_59.z = _1264;
    out.m_59.w = _1278;
    bool _1280 = !_1266;
    float _1298;
    if (!_1280)
    {
        float _1282 = in.m_55.x;
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1286 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[14].y, _128);
        float _1290 = _1288 * _1284;
        float _1292 = floor(_1290);
        float _1294 = -_1292;
        float _1296 = _1290 + _1294;
        _1298 = _1296;
        _1300 = true;
    }
    else
    {
        _1298 = _140;
    }
    _1300 = false;
    float _1302 = _1298;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1306 = _1302 + _1304;
    bool _1308 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1310 = isnan(_1302);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1324;
    bool _1328 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1330 = isnan(_1302);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    bool _1340 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1342 = isnan(_1302);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1348 = _1344 || _1346;
    float _1350 = float(_1348);
    float _1352 = 1.0 / _1322;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1356 = _1354 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1358 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1360 = isnan(_1302);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    float _1370 = -_1350;
    float _1372 = _1370 + 1.0;
    bool _1374 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1376 = isnan(_1302);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = 1.0 / _1356;
    float _1388 = -_1368;
    float _1390 = _1388 + 1.0;
    bool _1392 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1394 = _1326 * _1352;
    float _1396 = -_1318;
    float _1398 = _1396 + 1.0;
    float _1400 = -_1338;
    float _1402 = _1400 + 1.0;
    float _1404 = -_1384;
    float _1406 = _1404 + 1.0;
    float _1408 = fma(_1394, _1306, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1410 = _1338 * _1398;
    float _1412 = _1350 * _1402;
    float _1414 = _1368 * _1372;
    bool _1416 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1418 = isnan(_1302);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1424 = _1420 || _1422;
    float _1426 = float(_1424);
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1430 = _1428 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1436 = _1384 * _1390;
    bool _1438 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1440 = isnan(_1302);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1446 = _1442 || _1444;
    float _1448 = float(_1446);
    float _1450 = _1426 * _1406;
    float _1452 = 1.0 / _1434;
    float _1454 = -_1426;
    float _1456 = _1454 + 1.0;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1460 = _1458 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1462 = _1448 * _1456;
    float _1464 = -_1448;
    float _1466 = _1464 + 1.0;
    float _1468 = _1460 * _1386;
    float _1470 = 1.0 / _1430;
    float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1474 = _1472 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1476 = _1408 * _1462;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1480 = _1478 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1482;
    float _1486 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1476);
    float _1488 = 1.0 / _1474;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1492 = _1302 + _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1496 = _1494 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1498 = _1484 * _1452;
    float _1500 = fma(_1468, _1492, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1504 = _1302 + _1502;
    float _1506 = 1.0 / _1480;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1512 = fma(_1498, _1504, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1514 = fma(_1500, _1450, _1486);
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1518 = _1302 + _1516;
    float _1520 = _1510 * _1470;
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1522;
    float _1526 = 1.0 / _1496;
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1530 = _1528 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1532 = fma(_1520, _1518, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1534 = _1524 * _1488;
    float _1536 = fma(_1512, _1436, _1514);
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1540 = _1302 + _1538;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1544 = _1302 + _1542;
    bool _1546 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1548 = isnan(_1302);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    float _1558 = _1530 * _1506;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1560;
    float _1564 = fma(_1534, _1540, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1566 = fma(_1532, _1414, _1536);
    float _1568 = fma(_1558, _1544, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1570 = -_1556;
    float _1572 = _1570 + 1.0;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1576 = _1302 + _1574;
    float _1578 = fma(_1564, _1412, _1566);
    float _1580 = _1562 * _1526;
    float _1582 = _1318 * _1572;
    float _1584 = fma(_1568, _1410, _1578);
    float _1586 = fma(_1580, _1576, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1588 = fma(_1586, _1582, _1584);
    float _1590 = fma(_1556, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1588);
    out.m_61.x = _1590;
    bool _1592 = !_1392;
    float _1610;
    if (!_1592)
    {
        float _1594 = in.m_55.x;
        float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1598 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[14].z, _128);
        float _1602 = _1600 * _1596;
        float _1604 = floor(_1602);
        float _1606 = -_1604;
        float _1608 = _1602 + _1606;
        _1610 = _1608;
        _1612 = true;
    }
    else
    {
        _1610 = _140;
    }
    _1612 = false;
    float _1614 = _1610;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1618 = _1614 + _1616;
    bool _1620 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1622 = isnan(_1614);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1628 = _1624 || _1626;
    float _1630 = float(_1628);
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1634 = _1632 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1636;
    bool _1640 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1642 = isnan(_1614);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    bool _1652 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1654 = isnan(_1614);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1660 = _1656 || _1658;
    float _1662 = float(_1660);
    float _1664 = 1.0 / _1634;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1668 = _1666 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1670 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1672 = isnan(_1614);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1678 = _1674 || _1676;
    float _1680 = float(_1678);
    float _1682 = -_1662;
    float _1684 = _1682 + 1.0;
    bool _1686 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1688 = isnan(_1614);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1694 = _1690 || _1692;
    float _1696 = float(_1694);
    float _1698 = 1.0 / _1668;
    float _1700 = -_1680;
    float _1702 = _1700 + 1.0;
    bool _1704 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].w;
    float _1706 = _1638 * _1664;
    float _1708 = -_1630;
    float _1710 = _1708 + 1.0;
    float _1712 = -_1650;
    float _1714 = _1712 + 1.0;
    float _1716 = -_1696;
    float _1718 = _1716 + 1.0;
    float _1720 = fma(_1706, _1618, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1722 = _1650 * _1710;
    float _1724 = _1662 * _1714;
    float _1726 = _1680 * _1684;
    bool _1728 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1730 = isnan(_1614);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1736 = _1732 || _1734;
    float _1738 = float(_1736);
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1742 = _1740 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1744 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1746 = _1744 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1748 = _1696 * _1702;
    bool _1750 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1752 = isnan(_1614);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = _1738 * _1718;
    float _1764 = 1.0 / _1746;
    float _1766 = -_1738;
    float _1768 = _1766 + 1.0;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1774 = _1760 * _1768;
    float _1776 = -_1760;
    float _1778 = _1776 + 1.0;
    float _1780 = _1772 * _1698;
    float _1782 = 1.0 / _1742;
    float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1786 = _1784 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1788 = _1720 * _1774;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1794;
    float _1798 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1788);
    float _1800 = 1.0 / _1786;
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1804 = _1614 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1810 = _1796 * _1764;
    float _1812 = fma(_1780, _1804, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1816 = _1614 + _1814;
    float _1818 = 1.0 / _1792;
    float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1822 = _1820 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1824 = fma(_1810, _1816, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1826 = fma(_1812, _1762, _1798);
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1830 = _1614 + _1828;
    float _1832 = _1822 * _1782;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1834;
    float _1838 = 1.0 / _1808;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1842 = _1840 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1844 = fma(_1832, _1830, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1846 = _1836 * _1800;
    float _1848 = fma(_1824, _1748, _1826);
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1852 = _1614 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1856 = _1614 + _1854;
    bool _1858 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1860 = isnan(_1614);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    float _1870 = _1842 * _1818;
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1872;
    float _1876 = fma(_1846, _1852, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1878 = fma(_1844, _1726, _1848);
    float _1880 = fma(_1870, _1856, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1882 = -_1868;
    float _1884 = _1882 + 1.0;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1888 = _1614 + _1886;
    float _1890 = fma(_1876, _1724, _1878);
    float _1892 = _1874 * _1838;
    float _1894 = _1630 * _1884;
    float _1896 = fma(_1880, _1722, _1890);
    float _1898 = fma(_1892, _1888, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1900 = fma(_1898, _1894, _1896);
    float _1902 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1900);
    out.m_63.x = _1902;
    bool _1904 = !_1704;
    int _1906 = as_type<int>(_1890);
    float _1908 = _1878;
    int _1910 = as_type<int>(_1748);
    int _1912 = as_type<int>(_1902);
    int _1914 = as_type<int>(_1846);
    int _1916 = as_type<int>(_1892);
    float _1918 = _1838;
    if (!_1904)
    {
        float _1920 = in.m_55.x;
        float _1922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].w;
        float _1924 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[15].w;
        float _1926 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[14].w, _128);
        float _1928 = _1926 * _1922;
        float _1930 = floor(_1928);
        float _1932 = -_1930;
        float _1934 = _1928 + _1932;
        _154 = _1934;
    }
    float _1936 = _154;
    float _1938 = in.m_55.y;
    int _1940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1942 = _1940 != 0;
    float _1944 = in.m_65.x;
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1948 = _1946 != 0;
    int _1950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1952 = _1950 != 0;
    float _1954 = 0.0;
    int _1956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _1958 = _1944;
    if (_1942)
    {
        float _1960 = in.m_55.x;
        _1954 = _1960;
    }
    float _1962 = _1954;
    int _1964 = 0;
    if (_1942)
    {
        _1964 = 0;
    }
    int _1966 = _1964;
    float _1968 = 0.0;
    int _1970 = _1966;
    if (_1942)
    {
        float _1972 = in.m_55.z;
        _1968 = _1972;
    }
    float _1974 = _1968;
    float _1976 = _1898;
    if (_1948)
    {
        float _1978 = in.m_55.x;
        _1976 = _1978;
    }
    float _1980 = _1976;
    if (_1942)
    {
        _1906 = as_type<int>(_1938);
    }
    int _1982 = _1906;
    float _1984 = _1724;
    int _1986 = _1982;
    if (_1952)
    {
        float _1988 = in.m_55.z;
        _1984 = _1988;
    }
    float _1990 = _1984;
    float _1992 = _1962;
    if (_1942)
    {
        _1908 = _1962;
    }
    float _1994 = _1908;
    float _1996 = _1974;
    float _1998 = _1994;
    if (_1942)
    {
        _1910 = as_type<int>(_1974);
    }
    int _2000 = _1910;
    int _2002 = _2000;
    float _2004 = _1990;
    float _2006 = _1980;
    if (!_1942)
    {
        float _2008 = in.m_55.x;
        float _2010 = _1938 * 3.1415927410125732421875;
        float _2012 = in.m_55.z;
        float _2014 = _2010 * 0.15915493667125701904296875;
        float _2016 = _2014 * 6.283185482025146484375;
        float _2018 = sin(_2016);
        float _2020 = _2008 * 3.1415927410125732421875;
        float _2022 = _2020 * 0.15915493667125701904296875;
        float _2024 = _2012 * 3.1415927410125732421875;
        float _2026 = _2024 * 0.15915493667125701904296875;
        float _2028 = _2022 * 6.283185482025146484375;
        float _2030 = sin(_2028);
        float _2032 = _2026 * 6.283185482025146484375;
        float _2034 = sin(_2032);
        _1996 = _2012;
        _1992 = _2008;
        _1956 = as_type<int>(_2026);
        _1970 = 1;
        _1998 = _2030;
        _2002 = as_type<int>(_2034);
        _1986 = as_type<int>(_2018);
    }
    float _2036 = _1996;
    float _2038 = _1992;
    int _2040 = _1956;
    int _2042 = _1970;
    float _2044 = _1998;
    int _2046 = _2002;
    int _2048 = _1986;
    float _2050 = _2036 * 2.0;
    float _2052 = _2038 * 2.0;
    int _2054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2056 = _2054 != 0;
    int _2058 = _2040;
    if (_1948)
    {
        float _2060 = -_1944;
        float _2062 = _2060 + 1.0;
        _2058 = as_type<int>(_2062);
    }
    int _2064 = _2058;
    int _2066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2068 = _2066 != 0;
    float _2070 = in.m_65.y;
    float _2072 = floor(_2050);
    bool _2074 = false;
    if (_1948)
    {
        bool _2076 = _1980 > 0.5;
        _2074 = _2076;
    }
    bool _2078 = _2074;
    if (_1952)
    {
        float _2080 = -_1944;
        float _2082 = _2080 + 1.0;
        _1912 = as_type<int>(_2082);
    }
    int _2084 = _1912;
    float _2086 = 0.0;
    int _2088 = _2084;
    if (!_1948)
    {
        _2086 = _1944;
    }
    float _2090 = _2086;
    float _2092 = in.m_55.w;
    float _2094 = _2090;
    if (_1948)
    {
        float _2096 = _2078 ? as_type<float>(_2064) : _1944;
        _2094 = _2096;
    }
    float _2098 = _2094;
    float _2100 = _1938 * 2.0;
    bool _2102 = false;
    if (_1952)
    {
        bool _2104 = _1990 > 0.5;
        _2102 = _2104;
    }
    bool _2106 = _2102;
    float _2108 = floor(_2052);
    int _2110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2112 = _2110 != 0;
    if (_2056)
    {
        float _2114 = -_1944;
        float _2116 = _2114 + 1.0;
        _1914 = as_type<int>(_2116);
    }
    int _2118 = _1914;
    if (!_1952)
    {
        _2004 = _1944;
    }
    float _2120 = _2004;
    float _2122 = _2120;
    if (_2068)
    {
        float _2124 = -_1944;
        float _2126 = _2124 + 1.0;
        _1916 = as_type<int>(_2126);
    }
    int _2128 = _1916;
    bool _2130 = _1938 > 0.5;
    float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _2134 = _1936 + _2132;
    if (_1952)
    {
        float _2136 = _2106 ? as_type<float>(_2084) : _1944;
        _2122 = _2136;
    }
    float _2138 = _2122;
    float _2140 = floor(_2100);
    bool _2142 = _2072 > 0.0;
    float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2146 = _1936 + _2144;
    if (!_2056)
    {
        _2006 = _1944;
    }
    float _2148 = _2006;
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _2152 = _1936 + _2150;
    float _2154 = _2148;
    if (!_2068)
    {
        _1918 = _1944;
    }
    float _2156 = _1918;
    float _2158 = _2156;
    if (_2112)
    {
        float _2160 = -_1944;
        float _2162 = _2160 + 1.0;
        _2088 = as_type<int>(_2162);
    }
    int _2164 = _2088;
    if (_2056)
    {
        float _2166 = _2130 ? as_type<float>(_2118) : _1944;
        _2154 = _2166;
    }
    float _2168 = _2154;
    if (_2068)
    {
        float _2170 = _2130 ? as_type<float>(_2128) : _1944;
        _2158 = _2170;
    }
    float _2172 = _2158;
    float _2174 = -_2070;
    float _2176 = _2174 + 1.0;
    bool _2178 = _2072 >= 0.0;
    bool _2180 = isnan(_2072);
    bool _2182 = _2178 || _2180;
    bool _2184 = isnan(0.0);
    bool _2186 = _2182 || _2184;
    bool _2188 = _2108 > 0.0;
    int _2190 = _2186 ? 0 : 1;
    bool _2192 = _2108 >= 0.0;
    bool _2194 = isnan(_2108);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan(0.0);
    bool _2200 = _2196 || _2198;
    int _2202 = ~_2190;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    int _2208 = _2200 ? 0 : 1;
    int _2210 = _2206;
    if (!_2142)
    {
        int _2212 = ~_2190;
        int _2214 = _2212 + 1;
        _2210 = _2214;
    }
    int _2216 = _2210;
    if (_2112)
    {
        float _2218 = _2130 ? as_type<float>(_2164) : _1944;
        _1958 = _2218;
    }
    float _2220 = _1958;
    bool _2222 = _2036 > 0.5;
    bool _2224 = _2140 > 0.0;
    bool _2226 = _2140 >= 0.0;
    bool _2228 = isnan(_2140);
    bool _2230 = _2226 || _2228;
    bool _2232 = isnan(0.0);
    bool _2234 = _2230 || _2232;
    int _2236 = ~_2208;
    int _2238 = _2236 + 1;
    int _2240 = _2238 + 1;
    int _2242 = _2240;
    if (!_2188)
    {
        int _2244 = ~_2208;
        int _2246 = _2244 + 1;
        _2242 = _2246;
    }
    int _2248 = _2242;
    int _2250 = _2222 ? as_type<int>(_2176) : as_type<int>(_2070);
    int _2252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2254 = _2252 != 0;
    int _2256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2258 = _2256 != 0;
    int _2260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2262 = _2260 != 0;
    int _2264 = _2234 ? 0 : 1;
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _2268 = _2266 + (*spvDescriptorSet0.vp_c9)._m0[185].w;
    int _2270 = _2130 ? as_type<int>(_2176) : as_type<int>(_2070);
    float _2272 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _2274 = _2272 + (*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2276 = _2262 ? as_type<float>(_2250) : _2070;
    int _2278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2280 = _2278 != 0;
    int _2282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2284 = _2282 != 0;
    int _2286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2288 = _2286 != 0;
    float _2290 = 1.0 / _2268;
    float _2292 = in.m_67.x;
    float _2294 = in.m_67.y;
    float _2296 = in.m_67.z;
    int _2298 = ~_2264;
    int _2300 = _2298 + 1;
    int _2302 = _2300 + 1;
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _2306 = _2304 + (*spvDescriptorSet0.vp_c9)._m0[184].w;
    int _2308 = _2302;
    if (!_2224)
    {
        int _2310 = ~_2264;
        int _2312 = _2310 + 1;
        _2308 = _2312;
    }
    int _2314 = _2308;
    float _2316 = _384 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _2318 = !_2280;
    int _2320 = _2318 ? 0 : 1;
    float _2322 = 1.0 / _2274;
    bool _2324 = !_2284;
    int _2326 = _2324 ? 0 : 1;
    float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _2330 = _2328 + (*spvDescriptorSet0.vp_c9)._m0[186].w;
    int _2332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2334 = _2332 != 0;
    float _2336 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2316);
    int _2338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2340 = _2338 != 0;
    float _2342 = _384 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2344 = _2092 > 0.5;
    float _2346 = _384 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2348 = 1.0 / _2306;
    float _2350 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2342);
    float _2352 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2346);
    float _2354 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2336);
    float _2356 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2358 = _2356 + (*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2360 = -(*spvDescriptorSet0.vp_c9)._m0[184].x;
    float _2362 = _2360 + (*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _2364 = 1.0 / _2330;
    float _2366 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2350);
    float _2368 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2352);
    float _2370 = -(*spvDescriptorSet0.vp_c9)._m0[186].x;
    float _2372 = _2370 + (*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _2374 = _2362 * _2290;
    float _2376 = 1.0 / _2358;
    float _2378 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2296);
    float _2380 = _2372 * _2322;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2384 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2386 = -(*spvDescriptorSet0.vp_c9)._m0[183].x;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[184].x + _2386;
    float _2390 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2392 = log2(_2390);
    float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2396 = _2394 + (*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _2398 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _2400 = _2398 + (*spvDescriptorSet0.vp_c9)._m0[190].w;
    float _2402 = fma(_2384, -2.0, _2382);
    float _2404 = _2388 * _2348;
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _2408 = (*spvDescriptorSet0.vp_c9)._m0[186].x + _2406;
    float _2410 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, -0.20000000298023223876953125);
    float _2412 = 1.0 / _2396;
    float _2414 = _2408 * _2364;
    float _2416 = precise::min(_2410, 1.5);
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[188].x + _2420;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[188].x;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _2428 = 1.0 / _2400;
    float _2430 = fma(_2416, _2418, 1.0);
    float _2432 = _2422 * _2376;
    float _2434 = _128 * _2392;
    float _2436 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _2438 = _1936 + _2436;
    float _2440 = -(*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _2442 = (*spvDescriptorSet0.vp_c9)._m0[190].x + _2440;
    bool _2444 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _2446 = isnan(_1936);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan((*spvDescriptorSet0.vp_c9)._m0[189].w);
    bool _2452 = _2448 || _2450;
    float _2454 = float(_2452);
    float _2456 = fma(_2374, _2134, (*spvDescriptorSet0.vp_c9)._m0[184].x);
    float _2458 = fma(_2404, _2438, (*spvDescriptorSet0.vp_c9)._m0[183].x);
    bool _2460 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _2462 = isnan(_1936);
    bool _2464 = _2460 || _2462;
    bool _2466 = isnan((*spvDescriptorSet0.vp_c9)._m0[190].w);
    bool _2468 = _2464 || _2466;
    float _2470 = float(_2468);
    float _2472 = exp2(_2434);
    float _2474 = _2426 * _2412;
    float _2476 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _2478 = _1936 + _2476;
    bool _2480 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[187].w;
    bool _2482 = isnan(_1936);
    bool _2484 = _2480 || _2482;
    bool _2486 = isnan((*spvDescriptorSet0.vp_c9)._m0[187].w);
    bool _2488 = _2484 || _2486;
    float _2490 = float(_2488);
    float _2492 = -_2470;
    float _2494 = _2492 + 1.0;
    float _2496 = _2442 * _2428;
    bool _2498 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[188].w;
    bool _2500 = isnan(_1936);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan((*spvDescriptorSet0.vp_c9)._m0[188].w);
    bool _2506 = _2502 || _2504;
    float _2508 = float(_2506);
    float _2510 = fma(_2414, _2478, (*spvDescriptorSet0.vp_c9)._m0[185].x);
    float _2512 = _2454 * _2494;
    float _2514 = -_2454;
    float _2516 = _2514 + 1.0;
    bool _2518 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _2520 = isnan(_1936);
    bool _2522 = _2518 || _2520;
    bool _2524 = isnan((*spvDescriptorSet0.vp_c9)._m0[186].w);
    bool _2526 = _2522 || _2524;
    float _2528 = float(_2526);
    float _2530 = -_2508;
    float _2532 = _2530 + 1.0;
    float _2534 = -_2490;
    float _2536 = _2534 + 1.0;
    float _2538 = _2508 * _2516;
    bool _2540 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _2542 = isnan(_1936);
    bool _2544 = _2540 || _2542;
    bool _2546 = isnan((*spvDescriptorSet0.vp_c9)._m0[185].w);
    bool _2548 = _2544 || _2546;
    float _2550 = float(_2548);
    float _2552 = _2490 * _2532;
    float _2554 = -_2472;
    float _2556 = _2554 + 1.0;
    float _2558 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _2560 = _1936 + _2558;
    float _2562 = _2528 * _2536;
    float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2566 = 1.0 + _2564;
    bool _2568 = !_2288;
    int _2570 = _2568 ? 0 : 1;
    float _2572 = -_2528;
    float _2574 = _2572 + 1.0;
    bool _2576 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2578 = isnan(0.0);
    bool _2580 = _2576 || _2578;
    bool _2582 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2584 = _2580 || _2582;
    float _2586 = fma(_2380, _2560, (*spvDescriptorSet0.vp_c9)._m0[186].x);
    bool _2588 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _2590 = isnan(_1936);
    bool _2592 = _2588 || _2590;
    bool _2594 = isnan((*spvDescriptorSet0.vp_c9)._m0[184].w);
    bool _2596 = _2592 || _2594;
    float _2598 = float(_2596);
    float _2600 = -_2550;
    float _2602 = _2600 + 1.0;
    float _2604 = 1.0 / _2566;
    float _2606 = _2584 ? _2556 : 0.0;
    float _2608 = _2550 * _2574;
    bool _2610 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2612 = isnan(1.0);
    bool _2614 = _2610 || _2612;
    bool _2616 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2618 = _2614 || _2616;
    float _2620 = _2598 * _2602;
    bool _2622 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[183].w;
    bool _2624 = isnan(_1936);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c9)._m0[183].w);
    bool _2630 = _2626 || _2628;
    float _2632 = float(_2630);
    float _2634 = -_2598;
    float _2636 = _2634 + 1.0;
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2640 = _1936 + _2638;
    float _2642 = fma(_2474, _2146, (*spvDescriptorSet0.vp_c9)._m0[188].x);
    float _2644 = _648 * _2430;
    float _2646 = _2632 * _2636;
    float _2648 = -_2632;
    float _2650 = _2648 + 1.0;
    float _2652 = _646 * _2430;
    int _2654 = abs(_2320);
    float _2656 = _2458 * _2646;
    float _2658 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2292);
    float _2660 = _2606 * _2604;
    float _2662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2294);
    float _2664 = fma(_2650, (*spvDescriptorSet0.vp_c9)._m0[183].x, _2656);
    float _2666 = _650 * _2430;
    float _2668 = _2644 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2670 = _2652 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2672 = fma(_2432, _2640, (*spvDescriptorSet0.vp_c9)._m0[187].x);
    bool _2674 = !_2618;
    float _2676 = _2674 ? _128 : _2660;
    float _2678 = _1938 + _2036;
    float _2680 = float(_2216);
    float _2682 = _2668 * _2662;
    bool _2684 = _2042 != 1;
    float _2686 = _2670 * _2658;
    int _2688 = abs(_2326);
    float _2690 = in.m_69.x;
    float _2692 = in.m_69.y;
    float _2694 = in.m_69.z;
    int _2696 = abs(_2570);
    float _2698 = _2678 + (-1.0);
    float _2700 = float(_2654);
    float _2702 = _1938 + _2038;
    float _2704 = _2666 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2706 = float(_2248);
    float _2708 = _2700 * _2680;
    float _2710 = float(_2688);
    float _2712 = _2702 + (-1.0);
    float _2714 = _2708 * (-2.0);
    float _2716 = _2710 * _2706;
    float _2718 = float(_2314);
    float _2720 = fma(_2698, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2722 = float(_2696);
    float _2724 = _2038 + (-0.5);
    float _2726 = fma(_2712, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2730 = fma(_2456, _2620, _2664);
    float _2732 = _2722 * _2718;
    float _2734 = fma(_2726, _2714, _2726);
    float _2736 = fma(_2714, _2690, _2690);
    float _2738 = _2716 * (-2.0);
    float _2740 = _2704 * _2378;
    float _2742 = fma(_2724, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2736);
    float _2744 = fma(_2720, _2738, _2720);
    float _2746 = fma(_2738, _2692, _2692);
    float _2748 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2750 = _2038 + _2036;
    float _2752 = fma(_2676, _2734, _2742);
    float _2754 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2748);
    float _2756 = _1938 + (-0.5);
    float _2758 = _2750 + (-1.0);
    float _2760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2762 = _2036 + (-0.5);
    float _2764 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2746);
    float _2766 = fma(_2758, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2768 = _2732 * (-2.0);
    float _2770 = fma(_2676, _2744, _2764);
    float _2772 = fma(_2768, _2694, _2694);
    float _2774 = fma(_2766, _2768, _2766);
    float _2776 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2778 = fma(_2762, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2772);
    float _2780 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2782 = fma(_2038, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2776);
    float _2784 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2786 = fma(_2676, _2774, _2778);
    float _2788 = _2728 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2790 = -_2780;
    float _2792 = fma(_2784, 2.0, _2790);
    float _2794 = _2786 * 0.15915493667125701904296875;
    float _2796 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2798 = _2752 * 0.15915493667125701904296875;
    float _2800 = _2770 * 0.15915493667125701904296875;
    float _2802 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _2806 = _2044 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2808 = _2760 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2810 = fma(_2788, _2098, -0.5);
    float _2812 = -_2796;
    float _2814 = fma(_2806, 2.0, _2812);
    float _2816 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2818 = _2794 * 6.283185482025146484375;
    float _2820 = cos(_2818);
    float _2822 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2824 = fma(_2808, _2172, -0.5);
    bool _2826 = !_2684;
    float _2828 = _2826 ? as_type<float>(_2046) : as_type<float>(_2048);
    float _2830 = _2354 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2832 = _2254 ? as_type<float>(_2270) : _2070;
    float _2834 = _2368 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2836 = _2344 ? as_type<int>(_2176) : as_type<int>(_2070);
    float _2838 = _2798 * 6.283185482025146484375;
    float _2840 = sin(_2838);
    float _2842 = _2804 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2844 = fma(as_type<float>(_2048), (*spvDescriptorSet0.vp_c9)._m0[93].w, _2822);
    float _2846 = fma(_2510, _2608, _2730);
    float _2848 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2754);
    float _2850 = fma(_2842, _2220, -0.5);
    float _2852 = -_128;
    float _2854 = fma(_2852, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2814);
    float _2856 = fma(_2586, _2562, _2846);
    float _2858 = _2798 * 6.283185482025146484375;
    float _2860 = cos(_2858);
    float _2862 = _2820 * _2682;
    float _2864 = -_128;
    float _2866 = fma(_2864, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2792);
    float _2868 = _2366 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2870 = fma(_2672, _2552, _2856);
    float _2872 = fma(_2496, _2152, (*spvDescriptorSet0.vp_c9)._m0[189].x);
    float _2874 = _2800 * 6.283185482025146484375;
    float _2876 = sin(_2874);
    float _2878 = as_type<float>(_2048) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2880 = fma(_2878, -2.0, _2802);
    float _2882 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2816);
    bool _2884 = !_2684;
    float _2886 = _2884 ? as_type<float>(_2048) : _2044;
    float _2888 = _2800 * 6.283185482025146484375;
    float _2890 = cos(_2888);
    float _2892 = _2860 * _2862;
    float _2894 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2882);
    float _2896 = fma(_2894, _2824, _2854);
    float _2898 = _2794 * 6.283185482025146484375;
    float _2900 = sin(_2898);
    float _2902 = _2840 * _2876;
    float _2904 = _2860 * _2876;
    float _2906 = _2876 * _2820;
    float _2908 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2782);
    float _2910 = _2860 * _2890;
    float _2912 = _2890 * _2820;
    float _2914 = _2840 * _2890;
    float _2916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2918 = fma(_2908, _2810, _2866);
    float _2920 = fma(_2900, _2910, _2902);
    float _2922 = -_2682;
    float _2924 = _2900 * _2922;
    float _2926 = -_2914;
    float _2928 = fma(_2900, _2904, _2926);
    float _2930 = -_2904;
    float _2932 = fma(_2900, _2914, _2930);
    float _2934 = fma(_2920, _2686, _2892);
    float _2936 = _2840 * _2862;
    float _2938 = fma(_2912, _2686, _2924);
    float _2940 = fma(_2900, _2902, _2910);
    float _2942 = fma(_2928, _2740, _2934);
    float _2944 = fma(_2932, _2686, _2936);
    float _2946 = fma(_2906, _2740, _2938);
    float _2948 = _2916 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2950 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2952 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2954 = fma(_2940, _2740, _2944);
    float _2956 = _2258 ? as_type<float>(_2836) : _2070;
    float _2958 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2950);
    float _2960 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2952);
    float _2962 = fma(_2948, _2832, -0.5);
    float _2964 = _2334 ? as_type<float>(_2250) : _2070;
    float _2966 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2958);
    float _2968 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2960);
    float _2970 = _2340 ? as_type<float>(_2250) : _2070;
    float _2972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2974 = _2966 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2976 = _2968 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2978 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2402);
    float _2980 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2982 = _2830 + _2974;
    float _2984 = _2834 + _2976;
    float _2986 = -_2978;
    float _2988 = fma(_2848, _2962, _2986);
    float _2990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _2992 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2994 = _2982 + _2992;
    float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2998 = _2984 + _2996;
    float _3000 = _2994 * _2994;
    float _3002 = _2998 * _2998;
    float _3004 = _2972 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3006 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3008 = _3000 + _3002;
    float _3010 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2980);
    float _3012 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3014 = _2886 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3016 = sqrt(_3008);
    float _3018 = fma(_3004, _2964, -0.5);
    float _3020 = _2990 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _3022 = fma(_2886, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3006);
    float _3024 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3010);
    float _3026 = -_3012;
    float _3028 = fma(_3014, 2.0, _3026);
    float _3030 = fma(_3020, _2970, -0.5);
    float _3032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3034 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _3036 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3038 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _3040 = fma(_2828, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3034);
    float _3042 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2844);
    float _3044 = _2828 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    bool _3046 = _3016 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3050 = _2868 + _3036;
    float _3052 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2880);
    float _3054 = fma(_3044, -2.0, _3038);
    float _3056 = -_3052;
    float _3058 = fma(_3042, _3018, _3056);
    float _3060 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3062 = _2552;
    float _3064 = _3002;
    float _3066 = _3000;
    float _3068 = _2982;
    float _3070 = _2984;
    if (!_3046)
    {
        _3062 = _3002;
    }
    float _3072 = _3062;
    float _3074 = _3072;
    if (!_3046)
    {
        _3064 = _3050;
    }
    float _3076 = _3064;
    bool _3078 = !_3046;
    float _3080 = _3076;
    if (!_3078)
    {
        float _3082 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3084 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3086 = _3016 + _3084;
        float _3088 = rsqrt(_3008);
        float _3090 = _3086 * _3082;
        float _3092 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3094 = _3090 * 0.15915493667125701904296875;
        float _3096 = _3094 * 6.283185482025146484375;
        float _3098 = sin(_3096);
        float _3100 = _3094 * 6.283185482025146484375;
        float _3102 = cos(_3100);
        float _3104 = fma(_3098, _3092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3106 = _3088 * _3104;
        float _3108 = _3102 + (-1.0);
        float _3110 = fma(_2994, _3106, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3112 = fma(_2998, _3106, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3114 = _3108 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3118 = _3110 + _3116;
        float _3120 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3122 = _3112 + _3120;
        float _3124 = fma(_3050, _3102, _3114);
        float _3126 = _3118 * _3118;
        float _3128 = _3122 * _3122;
        _3080 = _3124;
        _3066 = _3126;
        _3074 = _3128;
        _3068 = _3110;
        _3070 = _3112;
    }
    float _3130 = _3080;
    float _3132 = _3066;
    float _3134 = _3074;
    float _3136 = _3068;
    float _3138 = _3070;
    float _3140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3142 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3144 = _3130 + _3142;
    float _3146 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3040);
    float _3148 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3054);
    float _3150 = _2276 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3152 = fma(_3144, _3144, _3132);
    float _3154 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3022);
    float _3156 = -_128;
    float _3158 = fma(_3156, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3028);
    float _3160 = fma(_2642, _2538, _2870);
    float _3162 = _3152 + _3134;
    float _3164 = -_3148;
    float _3166 = fma(_3146, _3030, _3164);
    float _3168 = fma(_3154, _2850, _3158);
    float _3170 = _2168 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3172 = _2138 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3174 = _2956 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3176 = fma(_2872, _2512, _3160);
    float _3178 = _3150 * _3140;
    float _3180 = _3172 * _3032;
    float _3182 = sqrt(_3162);
    float _3184 = _3174 * _3048;
    float _3186 = _3170 * _3060;
    float _3188 = _2896 + 0.5;
    float _3190 = _2918 + 0.5;
    float _3192 = _2988 + 0.5;
    float _3194 = _3058 + 0.5;
    float _3196 = _3168 + 0.5;
    float _3198 = _3166 + 0.5;
    float _3200 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[190].x, _3176);
    out.m_71.x = _3190;
    out.m_71.y = _3192;
    out.m_71.z = _3180;
    out.m_71.w = _3184;
    out.m_73.x = _3186;
    out.m_73.y = _3178;
    bool _3202 = _3182 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3204 = isnan(_3182);
    bool _3206 = _3202 || _3204;
    bool _3208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3210 = _3206 || _3208;
    out.m_75.x = _3188;
    out.m_75.y = _3194;
    out.m_77.x = _3196;
    out.m_77.y = _3198;
    out.m_79.x = _3200;
    float _3212 = _3162;
    float _3214 = _3192;
    float _3216 = _3190;
    if (!_3210)
    {
        _3212 = 1.0;
    }
    float _3218 = _3212;
    bool _3220 = !_3210;
    float _3222 = _3218;
    if (!_3220)
    {
        bool _3224 = _3182 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3226 = isnan(_3182);
        bool _3228 = _3224 || _3226;
        bool _3230 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3232 = _3228 || _3230;
        if (!_3232)
        {
            float _3234 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3236 = _3182 + _3234;
            float _3238 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3240 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3238;
            float _3242 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3244 = _3242 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3246 = 1.0 / _3240;
            float _3248 = _3236 * _3246;
            float _3250 = fma(_3248, _3244, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3222 = _3250;
            _3252 = true;
        }
        else
        {
            bool _3254 = _3182 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3256 = isnan(_3182);
            bool _3258 = _3254 || _3256;
            bool _3260 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3262 = _3258 || _3260;
            if (!_3262)
            {
                float _3264 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3266 = _3182 + _3264;
                float _3268 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3270 = _3268 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3272 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3274 = _3272 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3276 = 1.0 / _3270;
                float _3278 = _3266 * _3276;
                float _3280 = fma(_3278, _3274, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3222 = _3280;
                _3252 = true;
            }
            else
            {
                _3222 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3252 = false;
    float _3282 = _3222;
    float _3284 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3286 = _3130 + _3284;
    float _3288 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3290 = _3136 + _3288;
    float _3292 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3294 = _3138 + _3292;
    float _3296 = fma(_3286, _3282, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3298 = fma(_3290, _3282, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3300 = fma(_3294, _3282, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3302 = -_2868;
    float _3304 = _3302 + _3296;
    float _3306 = -_2830;
    float _3308 = _3306 + _3298;
    float _3310 = -_2834;
    float _3312 = _3310 + _3300;
    float _3314 = _3304 * _3304;
    float _3316 = fma(_3308, _3308, _3314);
    float _3318 = fma(_3312, _3312, _3316);
    float _3320 = sqrt(_3318);
    bool _3322 = _3320 > 0.0;
    bool _3324 = !_3322;
    float _3326 = _3320;
    float _3328 = _3298;
    float _3330 = _3296;
    float _3332 = _3300;
    float _3334 = _3318;
    if (!_3324)
    {
        bool _3336 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3338 = _3180;
        if (_3336)
        {
            float _3340 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3338 = _3340;
        }
        float _3342 = _3338;
        if (_3336)
        {
            float _3344 = _410 * _3342;
            _3214 = _3344;
        }
        float _3346 = _3214;
        float _3348 = _3346;
        if (_3336)
        {
            float _3350 = _412 * _3342;
            _3216 = _3350;
        }
        float _3352 = _3216;
        float _3354 = _3352;
        if (_3336)
        {
            float _3356 = _414 * _3342;
            _3326 = _3356;
        }
        float _3358 = _3326;
        float _3360 = _3358;
        if (!_3336)
        {
            float _3362 = _128 + 1.0;
            float _3364 = _3362;
            if (!_176)
            {
                float _3366 = _3362 * _3362;
                float _3368 = _3366 * 0.5;
                _418 = _3368;
            }
            float _3370 = _418;
            float _3372 = _3370;
            if (!_176)
            {
                float _3374 = _3370 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3372 = _3374;
            }
            float _3376 = _3372;
            bool _3378 = !_176;
            float _3380 = _3376;
            if (!_3378)
            {
                float _3382 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3384 = log2(_3382);
                float _3386 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3388 = _3386 + 1.0;
                float _3390 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3392 = _3384 * _3362;
                float _3394 = 1.0 / _3388;
                float _3396 = _3390 * 0.693147182464599609375;
                float _3398 = exp2(_3392);
                float _3400 = 1.0 / _3396;
                float _3402 = _3398 + (-1.0);
                float _3404 = -_3402;
                float _3406 = fma(_3404, _3400, _3362);
                float _3408 = _3406 * _3394;
                float _3410 = _3408 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3380 = _3410;
            }
            float _3412 = _3380;
            float _3414 = _3412 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3416 = _3412 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3418 = !_176;
            if (!_3418)
            {
                float _3420 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3422 = log2(_3420);
                float _3424 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3426 = _3424 + 1.0;
                float _3428 = 1.0 / _3426;
                float _3430 = _3422 * _3362;
                float _3432 = exp2(_3430);
                float _3434 = -_3432;
                float _3436 = _3434 + 1.0;
                float _3438 = _3436 * _3428;
                _3364 = _3438;
            }
            float _3440 = _3364;
            float _3442 = fma(_3440, _180, _3416);
            float _3444 = fma(_3440, _178, _3414);
            float _3446 = _3412 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3448 = -_372;
            float _3450 = _3448 + _3442;
            float _3452 = -_376;
            float _3454 = _3452 + _3444;
            float _3456 = fma(_3440, _182, _3446);
            float _3458 = _3450 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3460 = _3450 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3462 = _3450 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3464 = -_378;
            float _3466 = _3464 + _3456;
            float _3468 = fma(_3454, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3458);
            float _3470 = fma(_3454, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3460);
            float _3472 = fma(_3454, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3462);
            float _3474 = fma(_3466, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3468);
            float _3476 = fma(_3466, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3470);
            float _3478 = fma(_3466, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3472);
            _420 = _3476;
            _422 = _3474;
            _424 = _3478;
            _3348 = _3474;
            _3354 = _3476;
            _3360 = _3478;
        }
        float _3480 = _420;
        float _3482 = _422;
        float _3484 = _424;
        float _3486 = _3348;
        float _3488 = _3354;
        float _3490 = _3360;
        float _3492 = _3480 * _3480;
        float _3494 = rsqrt(_3318);
        float _3496 = fma(_3482, _3482, _3492);
        float _3498 = fma(_3484, _3484, _3496);
        float _3500 = sqrt(_3498);
        float _3502 = _3308 * _3494;
        float _3504 = _3304 * _3494;
        float _3506 = _3312 * _3494;
        bool _3508 = _3500 > 0.0;
        bool _3510 = !_3508;
        _156 = _3502;
        if (!_3510)
        {
            float _3512 = rsqrt(_3498);
            float _3514 = _3512 * _3480;
            float _3516 = _3512 * _3482;
            float _3518 = _3512 * _3484;
            float _3520 = _3504 * _3514;
            float _3522 = fma(_3502, _3516, _3520);
            float _3524 = fma(_3506, _3518, _3522);
            float _3526 = _3524 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3528 = fma(_3486, _3526, _3298);
            float _3530 = fma(_3488, _3526, _3296);
            float _3532 = fma(_3490, _3526, _3300);
            _3328 = _3528;
            _3330 = _3530;
            _3332 = _3532;
        }
    }
    float _3534 = _3328;
    float _3536 = _3330;
    float _3538 = _3332;
    float _3540 = _156;
    float _3542 = _2868 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3544 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3542);
    float _3546 = _2868 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3548 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3550 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3552 = _3548 || _3550;
    bool _3554 = isnan(0.5);
    bool _3556 = _3552 || _3554;
    float _3558 = fma(_2834, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3544);
    float _3560 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3546);
    float _3562 = _3558 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3564 = fma(_2834, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3560);
    bool _3566 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3568 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3570 = _3566 || _3568;
    bool _3572 = isnan(0.5);
    bool _3574 = _3570 || _3572;
    float _3576 = 1.0 / _3562;
    float _3578 = _3564 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3580 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3582 = _3540;
    float _3584 = _3578;
    float _3586 = _3534;
    if (_3556)
    {
        _3580 = _3534;
    }
    float _3588 = _3580;
    float _3590 = _3578 + _3562;
    float _3592 = _3588;
    if (_3556)
    {
        _3582 = _3536;
    }
    float _3594 = _3582;
    float _3596 = _3594;
    if (_3556)
    {
        _3584 = _3538;
    }
    float _3598 = _3584;
    float _3600 = _3598;
    float _3602 = _3576;
    if (!_3556)
    {
        float _3604 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3606 = _2868 + _3604;
        float _3608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3610 = _2830 + _3608;
        float _3612 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3614 = -_2830;
        float _3616 = _3614 + _3534;
        float _3618 = _3606 * _3606;
        float _3620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3622 = _2834 + _3620;
        float _3624 = -_2834;
        float _3626 = _3624 + _3538;
        float _3628 = fma(_3610, _3610, _3618);
        float _3630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3632 = fma(_3622, _3622, _3628);
        float _3634 = sqrt(_3632);
        float _3636 = _3612 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3638 = precise::min(_3634, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3640 = _3638 * _3630;
        float _3642 = -_2868;
        float _3644 = _3642 + _3536;
        float _3646 = _3636 * _3640;
        float _3648 = fma(_3616, _3646, _2830);
        float _3650 = fma(_3644, _3646, _2868);
        float _3652 = fma(_3626, _3646, _2834);
        _3586 = _3616;
        _3596 = _3650;
        _3592 = _3648;
        _3600 = _3652;
    }
    float _3654 = _3586;
    float _3656 = _3596;
    float _3658 = _3592;
    float _3660 = _3600;
    float _3662 = _3654;
    if (_3574)
    {
        _3662 = 1.0;
    }
    float _3664 = _3662;
    float _3666 = _3590 * _3576;
    float _3668 = _3666 * 0.5;
    float _3670 = _3664;
    float _3672 = _3668;
    if (!_3574)
    {
        float _3674 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3676 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3678 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3676);
        float _3680 = _3674 * 0.15915493667125701904296875;
        float _3682 = _3680 * 6.283185482025146484375;
        float _3684 = cos(_3682);
        float _3686 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3688 = _3686 * 0.15915493667125701904296875;
        float _3690 = _3680 * 6.283185482025146484375;
        float _3692 = sin(_3690);
        float _3694 = 1.0 / _3684;
        float _3696 = _3688 * 6.283185482025146484375;
        float _3698 = cos(_3696);
        float _3700 = _3692 * _3694;
        float _3702 = 1.0 / _3678;
        float _3704 = _3698 * _3700;
        float _3706 = _3688 * 6.283185482025146484375;
        float _3708 = sin(_3706);
        float _3710 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3712 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3710;
        float _3714 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3716 = _3702 * _3714;
        float _3718 = 1.0 / _3704;
        float _3720 = 1.0 / _3712;
        float _3722 = _3708 * _3718;
        float _3724 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3726 = fma(_3722, _3716, _3724);
        float _3728 = _3726 * _3720;
        float _3730 = precise::clamp(_3728, 0.0, 1.0);
        _3602 = _3716;
        _3670 = _3730;
    }
    float _3732 = _3602;
    float _3734 = _3670;
    float _3736 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3738 = _3656 + _3736;
    float _3740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3742 = _3658 + _3740;
    float _3744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3746 = _3660 + _3744;
    float _3748 = _3738 * _3738;
    float _3750 = fma(_3742, _3742, _3748);
    float _3752 = fma(_3746, _3746, _3750);
    float _3754 = rsqrt(_3752);
    float _3756 = sqrt(_3752);
    float _3758 = _3754 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3760 = _3742 * _3758;
    float _3762 = _3746 * _3758;
    float _3764 = _3760 * _3760;
    float _3766 = _3762 * _3762;
    float _3768 = _3764 + _3766;
    float _3770 = sqrt(_3768);
    bool _3772 = _3770 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3776 = _3770 + _3774;
    float _3778 = _3754;
    float _3780 = _3776;
    float _3782 = _3738;
    float _3784 = _3760;
    if (_3772)
    {
        float _3786 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3778 = _3786;
    }
    float _3788 = _3778;
    float _3790 = _3788;
    if (_3772)
    {
        float _3792 = _3776 * _3788;
        _3780 = _3792;
    }
    float _3794 = _3780;
    if (_3772)
    {
        float _3796 = rsqrt(_3768);
        _3790 = _3796;
    }
    float _3798 = _3790;
    float _3800 = _3798;
    if (_3772)
    {
        float _3802 = _3794 * 0.15915493667125701904296875;
        _3672 = _3802;
    }
    float _3804 = _3672;
    float _3806 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3808 = _3746;
    float _3810 = _3804;
    if (_3772)
    {
        float _3812 = _3804 * 6.283185482025146484375;
        float _3814 = sin(_3812);
        _3808 = _3814;
    }
    float _3816 = _3808;
    float _3818 = precise::max(0.0, _3806);
    float _3820 = _3732;
    float _3822 = _3818;
    if (_3772)
    {
        float _3824 = _3804 * 6.283185482025146484375;
        float _3826 = cos(_3824);
        _3820 = _3826;
    }
    float _3828 = _3820;
    float _3830 = -_3758;
    float _3832 = -_3818;
    float _3834 = fma(_3738, _3830, _3832);
    if (_3772)
    {
        float _3836 = _3834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3782 = _3836;
    }
    float _3838 = _3782;
    float _3840 = _3816;
    float _3842 = _3838;
    if (_3772)
    {
        float _3844 = fma(_3816, _3838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3840 = _3844;
    }
    float _3846 = _3840;
    float _3848 = _3846;
    if (!_3772)
    {
        _3842 = _3766;
    }
    float _3850 = _3842;
    float _3852 = _3850;
    if (_3772)
    {
        float _3854 = _3798 * _3846;
        _3334 = _3854;
    }
    float _3856 = _3334;
    if (!_3772)
    {
        _3800 = _3834;
    }
    float _3858 = _3800;
    float _3860 = _3858;
    if (_3772)
    {
        float _3862 = _3828 + (-1.0);
        _3822 = _3862;
    }
    float _3864 = _3822;
    float _3866 = _3864;
    if (_3772)
    {
        float _3868 = _3760 * _3856;
        _3784 = _3868;
    }
    float _3870 = _3784;
    if (!_3772)
    {
        _3848 = _3762;
    }
    float _3872 = _3848;
    float _3874 = _3872;
    if (_3772)
    {
        float _3876 = _3762 * _3856;
        _3874 = _3876;
    }
    float _3878 = _3874;
    if (_3772)
    {
        float _3880 = _3864 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3810 = _3880;
    }
    float _3882 = _3810;
    if (!_3772)
    {
        _3866 = _3764;
    }
    float _3884 = _3866;
    float _3886 = _3884;
    if (_3772)
    {
        float _3888 = _3870 * _3870;
        _3886 = _3888;
    }
    float _3890 = _3886;
    if (_3772)
    {
        float _3892 = _3878 * _3878;
        _3852 = _3892;
    }
    float _3894 = _3852;
    if (_3772)
    {
        float _3896 = fma(_3834, _3828, _3882);
        _3860 = _3896;
    }
    float _3898 = _3860;
    float _3900 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3902 = fma(_3898, _3898, _3890);
    float _3904 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3906 = fma(_3756, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3904);
    float _3908 = precise::clamp(_3906, 0.0, 1.0);
    float _3910 = _3902 + _3894;
    float _3912 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3914 = -_3908;
    float _3916 = _3914 + 1.0;
    float _3918 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3920 = rsqrt(_3910);
    float _3922 = fma(_3658, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3912);
    float _3924 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3926 = fma(_3658, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3900);
    float _3928 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3930 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3922);
    float _3932 = fma(_3658, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3924);
    float _3934 = fma(_3658, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3918);
    float _3936 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3926);
    float _3938 = _3930 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3940 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3932);
    float _3942 = abs(_3916);
    float _3944 = log2(_3942);
    float _3946 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3934);
    float _3948 = _3938 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3950 = _3940 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3952 = _3936 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3954 = _3920 * _3870;
    float _3956 = -_3948;
    float _3958 = fma(_3956, _3928, 1.0);
    float _3960 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3962 = _3946 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3964 = _3920 * _3898;
    float _3966 = _3954 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3968 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3960);
    float _3970 = _3920 * _3878;
    float _3972 = log2(_3958);
    float _3974 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3968);
    float _3976 = -_3966;
    float _3978 = fma(_3964, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3976);
    float _3980 = _3944 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3982 = fma(_3962, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3974);
    float _3984 = -_3970;
    float _3986 = fma(_3984, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3978);
    float _3988 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3990 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3992 = exp2(_3980);
    float _3994 = fma(_3986, -0.5, 0.5);
    float _3996 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3988);
    float _3998 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3990);
    float _4000 = fma(_3986, 0.5, 0.5);
    float _4002 = _3964 + 1.0;
    float _4004 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3996);
    float _4006 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3998);
    float _4008 = 1.0 / _3982;
    float _4010 = fma(_4000, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4012 = fma(_3962, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4004);
    float _4014 = fma(_3962, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4006);
    float _4016 = _3972 * 0.693147182464599609375;
    float _4018 = fma(_4000, _4010, -0.212114393711090087890625);
    float _4020 = sqrt(_3994);
    float _4022 = -_3964;
    float _4024 = fma(_3992, _4002, _4022);
    float _4026 = fma(_4000, _4018, 1.570728778839111328125);
    float _4028 = _4016 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4030 = _4012 * _4008;
    float _4032 = _4014 * _4008;
    float _4034 = fma(_4030, 0.5, 0.5);
    float _4036 = fma(_4032, -0.5, 0.5);
    float _4038 = fma(_4024, 0.5, 0.5);
    float _4040 = _4020 * 0.636619746685028076171875;
    float3 _10421 = float3(_4034, _4036, _4028);
    float _4042 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10421, float3(0.0), isnan(_10421)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10421, float3(0.0), isnan(_10421)), level(0.0)).x;
    float3 _10432 = float3(_4034, _4036, _4028);
    float4 _4045 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10432, float3(0.0), isnan(_10432)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10432, float3(0.0), isnan(_10432)), level(0.0)).xyzw;
    float _4047 = _4045.x;
    float _4049 = _4045.y;
    float _4051 = _4045.z;
    float _4053 = _4045.w;
    float _4055 = -_4026;
    float _4057 = fma(_4040, _4055, 1.0);
    float2 _10454 = float2(_4057, _4038);
    float3 _4061 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10454, float2(0.0), isnan(_10454)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10454, float2(0.0), isnan(_10454)), level(0.0)).xyz;
    float _4063 = _4061.x;
    float _4065 = _4061.y;
    float _4067 = _4061.z;
    float _4069 = _3944 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4071 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4073 = _3982 * 0.5;
    bool _4075 = _3734 > 0.0;
    bool _4077 = isnan(_3734);
    bool _4079 = _4075 || _4077;
    bool _4081 = isnan(0.0);
    bool _4083 = _4079 || _4081;
    float _4085 = _4012 + _3982;
    float _4087 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4071);
    float _4089 = exp2(_4069);
    float _4091 = _3734 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4093 = _4085 * 0.5;
    float _4095 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4087);
    float _4097 = fma(_4014, -0.5, _4073);
    float _4099 = _4091 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4101 = fma(_3962, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4095);
    out.m_47.x = _4099;
    float _4103 = _4101 + _3982;
    out.gl_Position.x = _4012;
    out.gl_Position.y = _4014;
    out.gl_Position.z = _4101;
    out.gl_Position.w = _3982;
    float _4105 = _4103 * 0.5;
    float _4107 = -_4089;
    float _4109 = _4107 + 1.0;
    float _4111 = _4109 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _4093;
    out.m_81.y = _4097;
    out.m_81.z = _4105;
    out.m_81.w = _3982;
    float _4113 = -_4111;
    float _4115 = _4113 + 1.0;
    float _4117 = _4111 * _4042;
    float _4119 = _4053 * _4115;
    float _4121 = _4053 * _4117;
    float _4123 = _4067 * _4117;
    float _4125 = fma(_4063, _4121, _4047);
    float _4127 = fma(_4065, _4121, _4049);
    float _4129 = fma(_4053, _4123, _4051);
    out.m_83.x = _4125;
    out.m_83.y = _4127;
    out.m_83.z = _4129;
    out.m_83.w = _4119;
    if (_4083)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _4131 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4131;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3252 = false;
    bool _1612 = false;
    bool _1300 = false;
    bool _1202 = false;
    bool _986 = false;
    bool _888 = false;
    bool _672 = false;
    bool _444 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4187 = as_type<float>(_116);
        out.gl_Position.z = _4187;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_49.w;
    float _122 = float(_102);
    float _124 = 1.0 / _122;
    float _126 = -_120;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_120);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = _128 * _124;
    bool _142 = _128 >= _122;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    out.m_51.x = _140;
    float _148 = _120;
    float _150 = 0.0;
    float _152 = 0.0;
    float _154 = _140;
    float _156 = _128;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _160 = _158 * 5.0;
        _118 = as_type<int>(_160);
    }
    int _162 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4260 = as_type<float>(_162);
        out.gl_Position.z = _4260;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_53.w;
    float _166 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    float _184 = in.m_44.x;
    float _186 = in.m_44.y;
    float _188 = in.m_44.z;
    float _190 = _166;
    if (!_176)
    {
        float _192 = _166 * _166;
        float _194 = _192 * 0.5;
        _150 = _194;
    }
    float _196 = _150;
    float _198 = _196;
    if (!_176)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_176;
    float _206 = _202;
    float _208 = 0.0;
    if (!_204)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _166 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _166);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _238;
        _208 = _222;
        _152 = _228;
    }
    float _240 = _206;
    float _242 = _208;
    float _244 = _152;
    bool _246 = !_176;
    float _248 = _244;
    float _250 = _242;
    float _252 = _240;
    if (!_246)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _166 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _190 = _272;
        _248 = _260;
    }
    float _274 = _190;
    float _276 = _248;
    float _278 = _276;
    if (!_176)
    {
        float _280 = _128 * _128;
        float _282 = _280 * 0.5;
        _250 = _282;
    }
    float _284 = _250;
    float _286 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _288 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _290 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_176)
    {
        _278 = _128;
    }
    float _292 = _278;
    float _294 = fma(_274, _178, _286);
    float _296 = fma(_274, _180, _288);
    float _298 = _292;
    if (!_176)
    {
        float _300 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _252 = _300;
    }
    float _302 = _252;
    bool _304 = !_176;
    float _306 = _302;
    if (!_304)
    {
        float _308 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = log2(_308);
        float _312 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _314 = _312 + 1.0;
        float _316 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = _128 * _310;
        float _320 = 1.0 / _314;
        float _322 = _316 * 0.693147182464599609375;
        float _324 = exp2(_318);
        float _326 = 1.0 / _322;
        float _328 = _324 + (-1.0);
        float _330 = -_328;
        float _332 = fma(_330, _326, _128);
        float _334 = _332 * _320;
        float _336 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _306 = _336;
    }
    float _338 = _306;
    bool _340 = !_176;
    if (!_340)
    {
        float _342 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _344 = log2(_342);
        float _346 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _348 = _346 + 1.0;
        float _350 = 1.0 / _348;
        float _352 = _128 * _344;
        float _354 = exp2(_352);
        float _356 = -_354;
        float _358 = _356 + 1.0;
        float _360 = _358 * _350;
        _298 = _360;
    }
    float _362 = _298;
    float _364 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _366 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _368 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _370 = fma(_274, _182, _290);
    float _372 = fma(_362, _180, _364);
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _376 = fma(_362, _178, _366);
    float _378 = fma(_362, _182, _368);
    float _380 = -_372;
    float _382 = _296 + _380;
    float _384 = fma(_296, _164, _186);
    float _386 = -_376;
    float _388 = _294 + _386;
    float _390 = fma(_294, _164, _184);
    float _392 = _382 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _394 = _382 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _396 = _382 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _398 = -_378;
    float _400 = _370 + _398;
    float _402 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _392);
    float _404 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _394);
    float _406 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _396);
    float _408 = fma(_370, _164, _188);
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[4].z, _402);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[5].z, _404);
    float _414 = fma(_400, (*spvDescriptorSet0.vp_c10)._m0[6].z, _406);
    bool _416 = !_374;
    float _418 = _410;
    float _420 = _412;
    float _422 = _410;
    float _424 = _414;
    float _442;
    if (!_416)
    {
        float _426 = in.m_55.x;
        float _428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _430 = _426 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _434 = _432 * _428;
        float _436 = floor(_434);
        float _438 = -_436;
        float _440 = _434 + _438;
        _442 = _440;
        _444 = true;
    }
    else
    {
        _442 = _140;
    }
    _444 = false;
    float _446 = _442;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _450 = _446 + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _454 = _446 + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _458 = _446 + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _460;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _472 = 1.0 / _462;
    float _474 = in.m_53.x;
    float _476 = in.m_53.y;
    float _478 = in.m_53.z;
    bool _480 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _482 = isnan(_446);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = 1.0 / _466;
    bool _494 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _496 = isnan(_446);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    bool _506 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _508 = 1.0 / _470;
    float _510 = _450 * _472;
    bool _512 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _514 = isnan(_446);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -_522;
    float _526 = _524 + 1.0;
    float _528 = _454 * _492;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _530;
    float _534 = _504 * _526;
    float _536 = -_504;
    float _538 = _536 + 1.0;
    float _540 = fma(_532, _528, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _546 = _458 * _508;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _552;
    float _556 = fma(_544, _546, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _558 = fma(_550, _528, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _560 = fma(_554, _528, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _562 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _564 = isnan(_446);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _582 = _490 * _538;
    float _584 = -_490;
    float _586 = _584 + 1.0;
    float _588 = fma(_576, _546, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _590 = fma(_580, _546, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _592 = _572 * _586;
    float _594 = -_572;
    float _596 = _594 + 1.0;
    float _598 = _540 * _592;
    float _600 = _558 * _592;
    float _602 = _560 * _592;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _604;
    float _608 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].x, _598);
    float _610 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].y, _600);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _616;
    float _620 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[143].z, _602);
    float _622 = fma(_606, _510, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _624 = fma(_614, _510, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _626 = fma(_618, _510, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _628 = fma(_588, _582, _608);
    float _630 = fma(_556, _582, _610);
    float _632 = fma(_590, _582, _620);
    float _634 = fma(_622, _534, _628);
    float _636 = fma(_624, _534, _630);
    float _638 = fma(_626, _534, _632);
    float _640 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[146].x, _634);
    float _642 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[146].y, _636);
    float _644 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[146].z, _638);
    float _646 = _640 * _474;
    float _648 = _642 * _476;
    float _650 = _644 * _478;
    bool _652 = !_506;
    float _670;
    if (!_652)
    {
        float _654 = in.m_55.x;
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _658 = _654 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _662 = _660 * _656;
        float _664 = floor(_662);
        float _666 = -_664;
        float _668 = _662 + _666;
        _670 = _668;
        _672 = true;
    }
    else
    {
        _670 = _140;
    }
    _672 = false;
    float _674 = _670;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _678 = _674 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _682 = _674 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _686 = _674 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _700 = 1.0 / _690;
    bool _702 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _704 = 1.0 / _694;
    bool _706 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _708 = isnan(_674);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -_716;
    float _720 = _718 + 1.0;
    float _722 = 1.0 / _698;
    bool _724 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _726 = isnan(_674);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = _678 * _700;
    bool _738 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _740 = isnan(_674);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = _682 * _704;
    float _752 = -_734;
    float _754 = _752 + 1.0;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _756;
    float _760 = -_748;
    float _762 = _760 + 1.0;
    float _764 = _748 * _754;
    bool _766 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _768 = isnan(_674);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = fma(_758, _750, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _780 = _686 * _722;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _782;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _786;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _792 = _790 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _794 = fma(_784, _750, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _796 = fma(_788, _750, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _798 = _716 * _762;
    float _800 = _776 * _720;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _806 = -_776;
    float _808 = _806 + 1.0;
    float _810 = _796 * _800;
    float _812 = _778 * _800;
    float _814 = _794 * _800;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _820 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[107].x, _812);
    float _822 = fma(_804, _780, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _824 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[107].y, _814);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _826;
    float _830 = fma(_818, _780, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _832 = fma(_792, _780, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _834 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[107].z, _810);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _836;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _840;
    float _844 = fma(_830, _798, _820);
    float _846 = fma(_828, _736, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _848 = fma(_838, _736, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _850 = fma(_842, _736, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _852 = fma(_822, _798, _824);
    float _854 = fma(_832, _798, _834);
    float _856 = fma(_846, _764, _844);
    float _858 = fma(_848, _764, _852);
    float _860 = fma(_850, _764, _854);
    float _862 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].x, _856);
    float _864 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].y, _858);
    float _866 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[110].z, _860);
    bool _868 = !_702;
    float _886;
    if (!_868)
    {
        float _870 = in.m_55.x;
        float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _874 = _870 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _876 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _878 = _876 * _872;
        float _880 = floor(_878);
        float _882 = -_880;
        float _884 = _878 + _882;
        _886 = _884;
        _888 = true;
    }
    else
    {
        _886 = _140;
    }
    _888 = false;
    float _890 = _886;
    float _892 = _862 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _894 = _864 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _896 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _898 = isnan(_890);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _912 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _914 = isnan(_890);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _930 = _890 + _928;
    float _932 = -_906;
    float _934 = _932 + 1.0;
    float _936 = _866 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _938 = 1.0 / _910;
    float _940 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = _922 * _934;
    float _944 = -_922;
    float _946 = _944 + 1.0;
    float _948 = _894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _952 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _954 = _926 * _938;
    float _956 = fma(_954, _930, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _958 = _956 * _942;
    float _960 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[115].x, _958);
    float _962 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[116].x, _960);
    float _964 = _962 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _940;
    out.m_57.y = _948;
    out.m_57.z = _950;
    out.m_57.w = _964;
    bool _966 = !_952;
    float _984;
    if (!_966)
    {
        float _968 = in.m_55.x;
        float _970 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _972 = _968 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _974 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _976 = _974 * _970;
        float _978 = floor(_976);
        float _980 = -_978;
        float _982 = _976 + _980;
        _984 = _982;
        _986 = true;
    }
    else
    {
        _984 = _140;
    }
    _986 = false;
    float _988 = _984;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _992 = _988 + _990;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _996 = _988 + _994;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1000 = _988 + _998;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1014 = 1.0 / _1004;
    bool _1016 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1018 = 1.0 / _1008;
    bool _1020 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1022 = isnan(_988);
    bool _1024 = _1020 || _1022;
    bool _1026 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1028 = _1024 || _1026;
    float _1030 = float(_1028);
    float _1032 = -_1030;
    float _1034 = _1032 + 1.0;
    float _1036 = 1.0 / _1012;
    bool _1038 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1040 = isnan(_988);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1046 = _1042 || _1044;
    float _1048 = float(_1046);
    float _1050 = _992 * _1014;
    bool _1052 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1054 = isnan(_988);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = _996 * _1018;
    float _1066 = -_1048;
    float _1068 = _1066 + 1.0;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1070;
    float _1074 = -_1062;
    float _1076 = _1074 + 1.0;
    float _1078 = _1062 * _1068;
    bool _1080 = _988 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1082 = isnan(_988);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = fma(_1072, _1064, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1094 = _1000 * _1036;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1096;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1106 = _1104 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1108 = fma(_1098, _1064, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1110 = fma(_1102, _1064, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1112 = _1030 * _1076;
    float _1114 = _1090 * _1034;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1120 = -_1090;
    float _1122 = _1120 + 1.0;
    float _1124 = _1110 * _1114;
    float _1126 = _1092 * _1114;
    float _1128 = _1108 * _1114;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1134 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1126);
    float _1136 = fma(_1118, _1094, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1138 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1128);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1140;
    float _1144 = fma(_1132, _1094, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1146 = fma(_1106, _1094, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1148 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1124);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1150;
    float _1154 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1154;
    float _1158 = fma(_1144, _1112, _1134);
    float _1160 = fma(_1142, _1050, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1162 = fma(_1152, _1050, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1164 = fma(_1156, _1050, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1166 = fma(_1136, _1112, _1138);
    float _1168 = fma(_1146, _1112, _1148);
    float _1170 = fma(_1160, _1078, _1158);
    float _1172 = fma(_1162, _1078, _1166);
    float _1174 = fma(_1164, _1078, _1168);
    float _1176 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1170);
    float _1178 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1172);
    float _1180 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1174);
    bool _1182 = !_1016;
    float _1200;
    if (!_1182)
    {
        float _1184 = in.m_55.x;
        float _1186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1188 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _1192 = _1190 * _1186;
        float _1194 = floor(_1192);
        float _1196 = -_1194;
        float _1198 = _1192 + _1196;
        _1200 = _1198;
        _1202 = true;
    }
    else
    {
        _1200 = _140;
    }
    _1202 = false;
    float _1204 = _1200;
    float _1206 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1208 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1210 = _1204 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1212 = isnan(_1204);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1224 = _1222 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1226 = _1204 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1228 = isnan(_1204);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1238;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1244 = _1204 + _1242;
    float _1246 = -_1220;
    float _1248 = _1246 + 1.0;
    float _1250 = _1180 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1252 = 1.0 / _1224;
    float _1254 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1256 = _1236 * _1248;
    float _1258 = -_1236;
    float _1260 = _1258 + 1.0;
    float _1262 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1264 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1268 = _1240 * _1252;
    float _1270 = fma(_1268, _1244, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1272 = _1270 * _1256;
    float _1274 = fma(_1260, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1272);
    float _1276 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1274);
    float _1278 = _1276 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _1254;
    out.m_59.y = _1262;
    out.m_59.z = _1264;
    out.m_59.w = _1278;
    bool _1280 = !_1266;
    float _1298;
    if (!_1280)
    {
        float _1282 = in.m_55.x;
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1286 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[14].y, _128);
        float _1290 = _1288 * _1284;
        float _1292 = floor(_1290);
        float _1294 = -_1292;
        float _1296 = _1290 + _1294;
        _1298 = _1296;
        _1300 = true;
    }
    else
    {
        _1298 = _140;
    }
    _1300 = false;
    float _1302 = _1298;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1306 = _1302 + _1304;
    bool _1308 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1310 = isnan(_1302);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1322 = _1320 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1324;
    bool _1328 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1330 = isnan(_1302);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    bool _1340 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1342 = isnan(_1302);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1348 = _1344 || _1346;
    float _1350 = float(_1348);
    float _1352 = 1.0 / _1322;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1356 = _1354 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1358 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1360 = isnan(_1302);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    float _1370 = -_1350;
    float _1372 = _1370 + 1.0;
    bool _1374 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1376 = isnan(_1302);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = 1.0 / _1356;
    float _1388 = -_1368;
    float _1390 = _1388 + 1.0;
    bool _1392 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1394 = _1326 * _1352;
    float _1396 = -_1318;
    float _1398 = _1396 + 1.0;
    float _1400 = -_1338;
    float _1402 = _1400 + 1.0;
    float _1404 = -_1384;
    float _1406 = _1404 + 1.0;
    float _1408 = fma(_1394, _1306, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1410 = _1338 * _1398;
    float _1412 = _1350 * _1402;
    float _1414 = _1368 * _1372;
    bool _1416 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1418 = isnan(_1302);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1424 = _1420 || _1422;
    float _1426 = float(_1424);
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1430 = _1428 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1434 = _1432 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1436 = _1384 * _1390;
    bool _1438 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1440 = isnan(_1302);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1446 = _1442 || _1444;
    float _1448 = float(_1446);
    float _1450 = _1426 * _1406;
    float _1452 = 1.0 / _1434;
    float _1454 = -_1426;
    float _1456 = _1454 + 1.0;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1460 = _1458 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1462 = _1448 * _1456;
    float _1464 = -_1448;
    float _1466 = _1464 + 1.0;
    float _1468 = _1460 * _1386;
    float _1470 = 1.0 / _1430;
    float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1474 = _1472 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1476 = _1408 * _1462;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1480 = _1478 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1482;
    float _1486 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1476);
    float _1488 = 1.0 / _1474;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1492 = _1302 + _1490;
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1496 = _1494 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1498 = _1484 * _1452;
    float _1500 = fma(_1468, _1492, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1504 = _1302 + _1502;
    float _1506 = 1.0 / _1480;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1512 = fma(_1498, _1504, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1514 = fma(_1500, _1450, _1486);
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1518 = _1302 + _1516;
    float _1520 = _1510 * _1470;
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1522;
    float _1526 = 1.0 / _1496;
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1530 = _1528 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1532 = fma(_1520, _1518, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1534 = _1524 * _1488;
    float _1536 = fma(_1512, _1436, _1514);
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1540 = _1302 + _1538;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1544 = _1302 + _1542;
    bool _1546 = _1302 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1548 = isnan(_1302);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    float _1558 = _1530 * _1506;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1560;
    float _1564 = fma(_1534, _1540, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1566 = fma(_1532, _1414, _1536);
    float _1568 = fma(_1558, _1544, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1570 = -_1556;
    float _1572 = _1570 + 1.0;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1576 = _1302 + _1574;
    float _1578 = fma(_1564, _1412, _1566);
    float _1580 = _1562 * _1526;
    float _1582 = _1318 * _1572;
    float _1584 = fma(_1568, _1410, _1578);
    float _1586 = fma(_1580, _1576, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1588 = fma(_1586, _1582, _1584);
    float _1590 = fma(_1556, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1588);
    out.m_61.x = _1590;
    bool _1592 = !_1392;
    float _1610;
    if (!_1592)
    {
        float _1594 = in.m_55.x;
        float _1596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1598 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[14].z, _128);
        float _1602 = _1600 * _1596;
        float _1604 = floor(_1602);
        float _1606 = -_1604;
        float _1608 = _1602 + _1606;
        _1610 = _1608;
        _1612 = true;
    }
    else
    {
        _1610 = _140;
    }
    _1612 = false;
    float _1614 = _1610;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1618 = _1614 + _1616;
    bool _1620 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1622 = isnan(_1614);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1628 = _1624 || _1626;
    float _1630 = float(_1628);
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1634 = _1632 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1636 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1636;
    bool _1640 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1642 = isnan(_1614);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    bool _1652 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1654 = isnan(_1614);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1660 = _1656 || _1658;
    float _1662 = float(_1660);
    float _1664 = 1.0 / _1634;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1668 = _1666 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1670 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1672 = isnan(_1614);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1678 = _1674 || _1676;
    float _1680 = float(_1678);
    float _1682 = -_1662;
    float _1684 = _1682 + 1.0;
    bool _1686 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1688 = isnan(_1614);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1694 = _1690 || _1692;
    float _1696 = float(_1694);
    float _1698 = 1.0 / _1668;
    float _1700 = -_1680;
    float _1702 = _1700 + 1.0;
    bool _1704 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].w;
    float _1706 = _1638 * _1664;
    float _1708 = -_1630;
    float _1710 = _1708 + 1.0;
    float _1712 = -_1650;
    float _1714 = _1712 + 1.0;
    float _1716 = -_1696;
    float _1718 = _1716 + 1.0;
    float _1720 = fma(_1706, _1618, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1722 = _1650 * _1710;
    float _1724 = _1662 * _1714;
    float _1726 = _1680 * _1684;
    bool _1728 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1730 = isnan(_1614);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1736 = _1732 || _1734;
    float _1738 = float(_1736);
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1742 = _1740 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1744 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1746 = _1744 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1748 = _1696 * _1702;
    bool _1750 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1752 = isnan(_1614);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = _1738 * _1718;
    float _1764 = 1.0 / _1746;
    float _1766 = -_1738;
    float _1768 = _1766 + 1.0;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1774 = _1760 * _1768;
    float _1776 = -_1760;
    float _1778 = _1776 + 1.0;
    float _1780 = _1772 * _1698;
    float _1782 = 1.0 / _1742;
    float _1784 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1786 = _1784 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1788 = _1720 * _1774;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1794;
    float _1798 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1788);
    float _1800 = 1.0 / _1786;
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1804 = _1614 + _1802;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1808 = _1806 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1810 = _1796 * _1764;
    float _1812 = fma(_1780, _1804, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1816 = _1614 + _1814;
    float _1818 = 1.0 / _1792;
    float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1822 = _1820 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1824 = fma(_1810, _1816, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1826 = fma(_1812, _1762, _1798);
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1830 = _1614 + _1828;
    float _1832 = _1822 * _1782;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1834;
    float _1838 = 1.0 / _1808;
    float _1840 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1842 = _1840 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1844 = fma(_1832, _1830, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1846 = _1836 * _1800;
    float _1848 = fma(_1824, _1748, _1826);
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1852 = _1614 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1856 = _1614 + _1854;
    bool _1858 = _1614 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1860 = isnan(_1614);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    float _1870 = _1842 * _1818;
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1872;
    float _1876 = fma(_1846, _1852, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1878 = fma(_1844, _1726, _1848);
    float _1880 = fma(_1870, _1856, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1882 = -_1868;
    float _1884 = _1882 + 1.0;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1888 = _1614 + _1886;
    float _1890 = fma(_1876, _1724, _1878);
    float _1892 = _1874 * _1838;
    float _1894 = _1630 * _1884;
    float _1896 = fma(_1880, _1722, _1890);
    float _1898 = fma(_1892, _1888, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1900 = fma(_1898, _1894, _1896);
    float _1902 = fma(_1868, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1900);
    out.m_63.x = _1902;
    bool _1904 = !_1704;
    int _1906 = as_type<int>(_1890);
    float _1908 = _1878;
    int _1910 = as_type<int>(_1748);
    int _1912 = as_type<int>(_1902);
    int _1914 = as_type<int>(_1846);
    int _1916 = as_type<int>(_1892);
    float _1918 = _1838;
    if (!_1904)
    {
        float _1920 = in.m_55.x;
        float _1922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].w;
        float _1924 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[15].w;
        float _1926 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[14].w, _128);
        float _1928 = _1926 * _1922;
        float _1930 = floor(_1928);
        float _1932 = -_1930;
        float _1934 = _1928 + _1932;
        _154 = _1934;
    }
    float _1936 = _154;
    float _1938 = in.m_55.y;
    int _1940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1942 = _1940 != 0;
    float _1944 = in.m_65.x;
    int _1946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1948 = _1946 != 0;
    int _1950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1952 = _1950 != 0;
    float _1954 = 0.0;
    int _1956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _1958 = _1944;
    if (_1942)
    {
        float _1960 = in.m_55.x;
        _1954 = _1960;
    }
    float _1962 = _1954;
    int _1964 = 0;
    if (_1942)
    {
        _1964 = 0;
    }
    int _1966 = _1964;
    float _1968 = 0.0;
    int _1970 = _1966;
    if (_1942)
    {
        float _1972 = in.m_55.z;
        _1968 = _1972;
    }
    float _1974 = _1968;
    float _1976 = _1898;
    if (_1948)
    {
        float _1978 = in.m_55.x;
        _1976 = _1978;
    }
    float _1980 = _1976;
    if (_1942)
    {
        _1906 = as_type<int>(_1938);
    }
    int _1982 = _1906;
    float _1984 = _1724;
    int _1986 = _1982;
    if (_1952)
    {
        float _1988 = in.m_55.z;
        _1984 = _1988;
    }
    float _1990 = _1984;
    float _1992 = _1962;
    if (_1942)
    {
        _1908 = _1962;
    }
    float _1994 = _1908;
    float _1996 = _1974;
    float _1998 = _1994;
    if (_1942)
    {
        _1910 = as_type<int>(_1974);
    }
    int _2000 = _1910;
    int _2002 = _2000;
    float _2004 = _1990;
    float _2006 = _1980;
    if (!_1942)
    {
        float _2008 = in.m_55.x;
        float _2010 = _1938 * 3.1415927410125732421875;
        float _2012 = in.m_55.z;
        float _2014 = _2010 * 0.15915493667125701904296875;
        float _2016 = _2014 * 6.283185482025146484375;
        float _2018 = sin(_2016);
        float _2020 = _2008 * 3.1415927410125732421875;
        float _2022 = _2020 * 0.15915493667125701904296875;
        float _2024 = _2012 * 3.1415927410125732421875;
        float _2026 = _2024 * 0.15915493667125701904296875;
        float _2028 = _2022 * 6.283185482025146484375;
        float _2030 = sin(_2028);
        float _2032 = _2026 * 6.283185482025146484375;
        float _2034 = sin(_2032);
        _1996 = _2012;
        _1992 = _2008;
        _1956 = as_type<int>(_2026);
        _1970 = 1;
        _1998 = _2030;
        _2002 = as_type<int>(_2034);
        _1986 = as_type<int>(_2018);
    }
    float _2036 = _1996;
    float _2038 = _1992;
    int _2040 = _1956;
    int _2042 = _1970;
    float _2044 = _1998;
    int _2046 = _2002;
    int _2048 = _1986;
    float _2050 = _2036 * 2.0;
    float _2052 = _2038 * 2.0;
    int _2054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2056 = _2054 != 0;
    int _2058 = _2040;
    if (_1948)
    {
        float _2060 = -_1944;
        float _2062 = _2060 + 1.0;
        _2058 = as_type<int>(_2062);
    }
    int _2064 = _2058;
    int _2066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2068 = _2066 != 0;
    float _2070 = in.m_65.y;
    float _2072 = floor(_2050);
    bool _2074 = false;
    if (_1948)
    {
        bool _2076 = _1980 > 0.5;
        _2074 = _2076;
    }
    bool _2078 = _2074;
    if (_1952)
    {
        float _2080 = -_1944;
        float _2082 = _2080 + 1.0;
        _1912 = as_type<int>(_2082);
    }
    int _2084 = _1912;
    float _2086 = 0.0;
    int _2088 = _2084;
    if (!_1948)
    {
        _2086 = _1944;
    }
    float _2090 = _2086;
    float _2092 = in.m_55.w;
    float _2094 = _2090;
    if (_1948)
    {
        float _2096 = _2078 ? as_type<float>(_2064) : _1944;
        _2094 = _2096;
    }
    float _2098 = _2094;
    float _2100 = _1938 * 2.0;
    bool _2102 = false;
    if (_1952)
    {
        bool _2104 = _1990 > 0.5;
        _2102 = _2104;
    }
    bool _2106 = _2102;
    float _2108 = floor(_2052);
    int _2110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2112 = _2110 != 0;
    if (_2056)
    {
        float _2114 = -_1944;
        float _2116 = _2114 + 1.0;
        _1914 = as_type<int>(_2116);
    }
    int _2118 = _1914;
    if (!_1952)
    {
        _2004 = _1944;
    }
    float _2120 = _2004;
    float _2122 = _2120;
    if (_2068)
    {
        float _2124 = -_1944;
        float _2126 = _2124 + 1.0;
        _1916 = as_type<int>(_2126);
    }
    int _2128 = _1916;
    bool _2130 = _1938 > 0.5;
    float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _2134 = _1936 + _2132;
    if (_1952)
    {
        float _2136 = _2106 ? as_type<float>(_2084) : _1944;
        _2122 = _2136;
    }
    float _2138 = _2122;
    float _2140 = floor(_2100);
    bool _2142 = _2072 > 0.0;
    float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2146 = _1936 + _2144;
    if (!_2056)
    {
        _2006 = _1944;
    }
    float _2148 = _2006;
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _2152 = _1936 + _2150;
    float _2154 = _2148;
    if (!_2068)
    {
        _1918 = _1944;
    }
    float _2156 = _1918;
    float _2158 = _2156;
    if (_2112)
    {
        float _2160 = -_1944;
        float _2162 = _2160 + 1.0;
        _2088 = as_type<int>(_2162);
    }
    int _2164 = _2088;
    if (_2056)
    {
        float _2166 = _2130 ? as_type<float>(_2118) : _1944;
        _2154 = _2166;
    }
    float _2168 = _2154;
    if (_2068)
    {
        float _2170 = _2130 ? as_type<float>(_2128) : _1944;
        _2158 = _2170;
    }
    float _2172 = _2158;
    float _2174 = -_2070;
    float _2176 = _2174 + 1.0;
    bool _2178 = _2072 >= 0.0;
    bool _2180 = isnan(_2072);
    bool _2182 = _2178 || _2180;
    bool _2184 = isnan(0.0);
    bool _2186 = _2182 || _2184;
    bool _2188 = _2108 > 0.0;
    int _2190 = _2186 ? 0 : 1;
    bool _2192 = _2108 >= 0.0;
    bool _2194 = isnan(_2108);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan(0.0);
    bool _2200 = _2196 || _2198;
    int _2202 = ~_2190;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    int _2208 = _2200 ? 0 : 1;
    int _2210 = _2206;
    if (!_2142)
    {
        int _2212 = ~_2190;
        int _2214 = _2212 + 1;
        _2210 = _2214;
    }
    int _2216 = _2210;
    if (_2112)
    {
        float _2218 = _2130 ? as_type<float>(_2164) : _1944;
        _1958 = _2218;
    }
    float _2220 = _1958;
    bool _2222 = _2036 > 0.5;
    bool _2224 = _2140 > 0.0;
    bool _2226 = _2140 >= 0.0;
    bool _2228 = isnan(_2140);
    bool _2230 = _2226 || _2228;
    bool _2232 = isnan(0.0);
    bool _2234 = _2230 || _2232;
    int _2236 = ~_2208;
    int _2238 = _2236 + 1;
    int _2240 = _2238 + 1;
    int _2242 = _2240;
    if (!_2188)
    {
        int _2244 = ~_2208;
        int _2246 = _2244 + 1;
        _2242 = _2246;
    }
    int _2248 = _2242;
    int _2250 = _2222 ? as_type<int>(_2176) : as_type<int>(_2070);
    int _2252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2254 = _2252 != 0;
    int _2256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2258 = _2256 != 0;
    int _2260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2262 = _2260 != 0;
    int _2264 = _2234 ? 0 : 1;
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _2268 = _2266 + (*spvDescriptorSet0.vp_c9)._m0[185].w;
    int _2270 = _2130 ? as_type<int>(_2176) : as_type<int>(_2070);
    float _2272 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _2274 = _2272 + (*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2276 = _2262 ? as_type<float>(_2250) : _2070;
    int _2278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2280 = _2278 != 0;
    int _2282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2284 = _2282 != 0;
    int _2286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2288 = _2286 != 0;
    float _2290 = 1.0 / _2268;
    float _2292 = in.m_67.x;
    float _2294 = in.m_67.y;
    float _2296 = in.m_67.z;
    int _2298 = ~_2264;
    int _2300 = _2298 + 1;
    int _2302 = _2300 + 1;
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _2306 = _2304 + (*spvDescriptorSet0.vp_c9)._m0[184].w;
    int _2308 = _2302;
    if (!_2224)
    {
        int _2310 = ~_2264;
        int _2312 = _2310 + 1;
        _2308 = _2312;
    }
    int _2314 = _2308;
    float _2316 = _384 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _2318 = !_2280;
    int _2320 = _2318 ? 0 : 1;
    float _2322 = 1.0 / _2274;
    bool _2324 = !_2284;
    int _2326 = _2324 ? 0 : 1;
    float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _2330 = _2328 + (*spvDescriptorSet0.vp_c9)._m0[186].w;
    int _2332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2334 = _2332 != 0;
    float _2336 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2316);
    int _2338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2340 = _2338 != 0;
    float _2342 = _384 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2344 = _2092 > 0.5;
    float _2346 = _384 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2348 = 1.0 / _2306;
    float _2350 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2342);
    float _2352 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2346);
    float _2354 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2336);
    float _2356 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2358 = _2356 + (*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2360 = -(*spvDescriptorSet0.vp_c9)._m0[184].x;
    float _2362 = _2360 + (*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _2364 = 1.0 / _2330;
    float _2366 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2350);
    float _2368 = fma(_408, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2352);
    float _2370 = -(*spvDescriptorSet0.vp_c9)._m0[186].x;
    float _2372 = _2370 + (*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _2374 = _2362 * _2290;
    float _2376 = 1.0 / _2358;
    float _2378 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2296);
    float _2380 = _2372 * _2322;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2384 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2386 = -(*spvDescriptorSet0.vp_c9)._m0[183].x;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[184].x + _2386;
    float _2390 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2392 = log2(_2390);
    float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2396 = _2394 + (*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _2398 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _2400 = _2398 + (*spvDescriptorSet0.vp_c9)._m0[190].w;
    float _2402 = fma(_2384, -2.0, _2382);
    float _2404 = _2388 * _2348;
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _2408 = (*spvDescriptorSet0.vp_c9)._m0[186].x + _2406;
    float _2410 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, -0.20000000298023223876953125);
    float _2412 = 1.0 / _2396;
    float _2414 = _2408 * _2364;
    float _2416 = precise::min(_2410, 1.5);
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _2422 = (*spvDescriptorSet0.vp_c9)._m0[188].x + _2420;
    float _2424 = -(*spvDescriptorSet0.vp_c9)._m0[188].x;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _2428 = 1.0 / _2400;
    float _2430 = fma(_2416, _2418, 1.0);
    float _2432 = _2422 * _2376;
    float _2434 = _128 * _2392;
    float _2436 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _2438 = _1936 + _2436;
    float _2440 = -(*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _2442 = (*spvDescriptorSet0.vp_c9)._m0[190].x + _2440;
    bool _2444 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _2446 = isnan(_1936);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan((*spvDescriptorSet0.vp_c9)._m0[189].w);
    bool _2452 = _2448 || _2450;
    float _2454 = float(_2452);
    float _2456 = fma(_2374, _2134, (*spvDescriptorSet0.vp_c9)._m0[184].x);
    float _2458 = fma(_2404, _2438, (*spvDescriptorSet0.vp_c9)._m0[183].x);
    bool _2460 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _2462 = isnan(_1936);
    bool _2464 = _2460 || _2462;
    bool _2466 = isnan((*spvDescriptorSet0.vp_c9)._m0[190].w);
    bool _2468 = _2464 || _2466;
    float _2470 = float(_2468);
    float _2472 = exp2(_2434);
    float _2474 = _2426 * _2412;
    float _2476 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _2478 = _1936 + _2476;
    bool _2480 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[187].w;
    bool _2482 = isnan(_1936);
    bool _2484 = _2480 || _2482;
    bool _2486 = isnan((*spvDescriptorSet0.vp_c9)._m0[187].w);
    bool _2488 = _2484 || _2486;
    float _2490 = float(_2488);
    float _2492 = -_2470;
    float _2494 = _2492 + 1.0;
    float _2496 = _2442 * _2428;
    bool _2498 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[188].w;
    bool _2500 = isnan(_1936);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan((*spvDescriptorSet0.vp_c9)._m0[188].w);
    bool _2506 = _2502 || _2504;
    float _2508 = float(_2506);
    float _2510 = fma(_2414, _2478, (*spvDescriptorSet0.vp_c9)._m0[185].x);
    float _2512 = _2454 * _2494;
    float _2514 = -_2454;
    float _2516 = _2514 + 1.0;
    bool _2518 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _2520 = isnan(_1936);
    bool _2522 = _2518 || _2520;
    bool _2524 = isnan((*spvDescriptorSet0.vp_c9)._m0[186].w);
    bool _2526 = _2522 || _2524;
    float _2528 = float(_2526);
    float _2530 = -_2508;
    float _2532 = _2530 + 1.0;
    float _2534 = -_2490;
    float _2536 = _2534 + 1.0;
    float _2538 = _2508 * _2516;
    bool _2540 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _2542 = isnan(_1936);
    bool _2544 = _2540 || _2542;
    bool _2546 = isnan((*spvDescriptorSet0.vp_c9)._m0[185].w);
    bool _2548 = _2544 || _2546;
    float _2550 = float(_2548);
    float _2552 = _2490 * _2532;
    float _2554 = -_2472;
    float _2556 = _2554 + 1.0;
    float _2558 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _2560 = _1936 + _2558;
    float _2562 = _2528 * _2536;
    float _2564 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2566 = 1.0 + _2564;
    bool _2568 = !_2288;
    int _2570 = _2568 ? 0 : 1;
    float _2572 = -_2528;
    float _2574 = _2572 + 1.0;
    bool _2576 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2578 = isnan(0.0);
    bool _2580 = _2576 || _2578;
    bool _2582 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2584 = _2580 || _2582;
    float _2586 = fma(_2380, _2560, (*spvDescriptorSet0.vp_c9)._m0[186].x);
    bool _2588 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _2590 = isnan(_1936);
    bool _2592 = _2588 || _2590;
    bool _2594 = isnan((*spvDescriptorSet0.vp_c9)._m0[184].w);
    bool _2596 = _2592 || _2594;
    float _2598 = float(_2596);
    float _2600 = -_2550;
    float _2602 = _2600 + 1.0;
    float _2604 = 1.0 / _2566;
    float _2606 = _2584 ? _2556 : 0.0;
    float _2608 = _2550 * _2574;
    bool _2610 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2612 = isnan(1.0);
    bool _2614 = _2610 || _2612;
    bool _2616 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2618 = _2614 || _2616;
    float _2620 = _2598 * _2602;
    bool _2622 = _1936 >= (*spvDescriptorSet0.vp_c9)._m0[183].w;
    bool _2624 = isnan(_1936);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c9)._m0[183].w);
    bool _2630 = _2626 || _2628;
    float _2632 = float(_2630);
    float _2634 = -_2598;
    float _2636 = _2634 + 1.0;
    float _2638 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2640 = _1936 + _2638;
    float _2642 = fma(_2474, _2146, (*spvDescriptorSet0.vp_c9)._m0[188].x);
    float _2644 = _648 * _2430;
    float _2646 = _2632 * _2636;
    float _2648 = -_2632;
    float _2650 = _2648 + 1.0;
    float _2652 = _646 * _2430;
    int _2654 = abs(_2320);
    float _2656 = _2458 * _2646;
    float _2658 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2292);
    float _2660 = _2606 * _2604;
    float _2662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2294);
    float _2664 = fma(_2650, (*spvDescriptorSet0.vp_c9)._m0[183].x, _2656);
    float _2666 = _650 * _2430;
    float _2668 = _2644 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2670 = _2652 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2672 = fma(_2432, _2640, (*spvDescriptorSet0.vp_c9)._m0[187].x);
    bool _2674 = !_2618;
    float _2676 = _2674 ? _128 : _2660;
    float _2678 = _1938 + _2036;
    float _2680 = float(_2216);
    float _2682 = _2668 * _2662;
    bool _2684 = _2042 != 1;
    float _2686 = _2670 * _2658;
    int _2688 = abs(_2326);
    float _2690 = in.m_69.x;
    float _2692 = in.m_69.y;
    float _2694 = in.m_69.z;
    int _2696 = abs(_2570);
    float _2698 = _2678 + (-1.0);
    float _2700 = float(_2654);
    float _2702 = _1938 + _2038;
    float _2704 = _2666 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2706 = float(_2248);
    float _2708 = _2700 * _2680;
    float _2710 = float(_2688);
    float _2712 = _2702 + (-1.0);
    float _2714 = _2708 * (-2.0);
    float _2716 = _2710 * _2706;
    float _2718 = float(_2314);
    float _2720 = fma(_2698, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2722 = float(_2696);
    float _2724 = _2038 + (-0.5);
    float _2726 = fma(_2712, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2730 = fma(_2456, _2620, _2664);
    float _2732 = _2722 * _2718;
    float _2734 = fma(_2726, _2714, _2726);
    float _2736 = fma(_2714, _2690, _2690);
    float _2738 = _2716 * (-2.0);
    float _2740 = _2704 * _2378;
    float _2742 = fma(_2724, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2736);
    float _2744 = fma(_2720, _2738, _2720);
    float _2746 = fma(_2738, _2692, _2692);
    float _2748 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2750 = _2038 + _2036;
    float _2752 = fma(_2676, _2734, _2742);
    float _2754 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2748);
    float _2756 = _1938 + (-0.5);
    float _2758 = _2750 + (-1.0);
    float _2760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2762 = _2036 + (-0.5);
    float _2764 = fma(_2756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2746);
    float _2766 = fma(_2758, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2768 = _2732 * (-2.0);
    float _2770 = fma(_2676, _2744, _2764);
    float _2772 = fma(_2768, _2694, _2694);
    float _2774 = fma(_2766, _2768, _2766);
    float _2776 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2778 = fma(_2762, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2772);
    float _2780 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2782 = fma(_2038, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2776);
    float _2784 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2786 = fma(_2676, _2774, _2778);
    float _2788 = _2728 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2790 = -_2780;
    float _2792 = fma(_2784, 2.0, _2790);
    float _2794 = _2786 * 0.15915493667125701904296875;
    float _2796 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2798 = _2752 * 0.15915493667125701904296875;
    float _2800 = _2770 * 0.15915493667125701904296875;
    float _2802 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _2806 = _2044 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2808 = _2760 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2810 = fma(_2788, _2098, -0.5);
    float _2812 = -_2796;
    float _2814 = fma(_2806, 2.0, _2812);
    float _2816 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2818 = _2794 * 6.283185482025146484375;
    float _2820 = cos(_2818);
    float _2822 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2824 = fma(_2808, _2172, -0.5);
    bool _2826 = !_2684;
    float _2828 = _2826 ? as_type<float>(_2046) : as_type<float>(_2048);
    float _2830 = _2354 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2832 = _2254 ? as_type<float>(_2270) : _2070;
    float _2834 = _2368 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2836 = _2344 ? as_type<int>(_2176) : as_type<int>(_2070);
    float _2838 = _2798 * 6.283185482025146484375;
    float _2840 = sin(_2838);
    float _2842 = _2804 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2844 = fma(as_type<float>(_2048), (*spvDescriptorSet0.vp_c9)._m0[93].w, _2822);
    float _2846 = fma(_2510, _2608, _2730);
    float _2848 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2754);
    float _2850 = fma(_2842, _2220, -0.5);
    float _2852 = -_128;
    float _2854 = fma(_2852, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2814);
    float _2856 = fma(_2586, _2562, _2846);
    float _2858 = _2798 * 6.283185482025146484375;
    float _2860 = cos(_2858);
    float _2862 = _2820 * _2682;
    float _2864 = -_128;
    float _2866 = fma(_2864, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2792);
    float _2868 = _2366 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2870 = fma(_2672, _2552, _2856);
    float _2872 = fma(_2496, _2152, (*spvDescriptorSet0.vp_c9)._m0[189].x);
    float _2874 = _2800 * 6.283185482025146484375;
    float _2876 = sin(_2874);
    float _2878 = as_type<float>(_2048) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2880 = fma(_2878, -2.0, _2802);
    float _2882 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2816);
    bool _2884 = !_2684;
    float _2886 = _2884 ? as_type<float>(_2048) : _2044;
    float _2888 = _2800 * 6.283185482025146484375;
    float _2890 = cos(_2888);
    float _2892 = _2860 * _2862;
    float _2894 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2882);
    float _2896 = fma(_2894, _2824, _2854);
    float _2898 = _2794 * 6.283185482025146484375;
    float _2900 = sin(_2898);
    float _2902 = _2840 * _2876;
    float _2904 = _2860 * _2876;
    float _2906 = _2876 * _2820;
    float _2908 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2782);
    float _2910 = _2860 * _2890;
    float _2912 = _2890 * _2820;
    float _2914 = _2840 * _2890;
    float _2916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2918 = fma(_2908, _2810, _2866);
    float _2920 = fma(_2900, _2910, _2902);
    float _2922 = -_2682;
    float _2924 = _2900 * _2922;
    float _2926 = -_2914;
    float _2928 = fma(_2900, _2904, _2926);
    float _2930 = -_2904;
    float _2932 = fma(_2900, _2914, _2930);
    float _2934 = fma(_2920, _2686, _2892);
    float _2936 = _2840 * _2862;
    float _2938 = fma(_2912, _2686, _2924);
    float _2940 = fma(_2900, _2902, _2910);
    float _2942 = fma(_2928, _2740, _2934);
    float _2944 = fma(_2932, _2686, _2936);
    float _2946 = fma(_2906, _2740, _2938);
    float _2948 = _2916 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2950 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2952 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2954 = fma(_2940, _2740, _2944);
    float _2956 = _2258 ? as_type<float>(_2836) : _2070;
    float _2958 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2950);
    float _2960 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2952);
    float _2962 = fma(_2948, _2832, -0.5);
    float _2964 = _2334 ? as_type<float>(_2250) : _2070;
    float _2966 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2958);
    float _2968 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2960);
    float _2970 = _2340 ? as_type<float>(_2250) : _2070;
    float _2972 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2974 = _2966 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2976 = _2968 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2978 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2402);
    float _2980 = _2942 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2982 = _2830 + _2974;
    float _2984 = _2834 + _2976;
    float _2986 = -_2978;
    float _2988 = fma(_2848, _2962, _2986);
    float _2990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _2992 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2994 = _2982 + _2992;
    float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2998 = _2984 + _2996;
    float _3000 = _2994 * _2994;
    float _3002 = _2998 * _2998;
    float _3004 = _2972 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3006 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3008 = _3000 + _3002;
    float _3010 = fma(_2946, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2980);
    float _3012 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3014 = _2886 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3016 = sqrt(_3008);
    float _3018 = fma(_3004, _2964, -0.5);
    float _3020 = _2990 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _3022 = fma(_2886, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3006);
    float _3024 = fma(_2954, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3010);
    float _3026 = -_3012;
    float _3028 = fma(_3014, 2.0, _3026);
    float _3030 = fma(_3020, _2970, -0.5);
    float _3032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3034 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _3036 = _3024 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3038 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _3040 = fma(_2828, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3034);
    float _3042 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2844);
    float _3044 = _2828 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    bool _3046 = _3016 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3050 = _2868 + _3036;
    float _3052 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2880);
    float _3054 = fma(_3044, -2.0, _3038);
    float _3056 = -_3052;
    float _3058 = fma(_3042, _3018, _3056);
    float _3060 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3062 = _2552;
    float _3064 = _3002;
    float _3066 = _3000;
    float _3068 = _2982;
    float _3070 = _2984;
    if (!_3046)
    {
        _3062 = _3002;
    }
    float _3072 = _3062;
    float _3074 = _3072;
    if (!_3046)
    {
        _3064 = _3050;
    }
    float _3076 = _3064;
    bool _3078 = !_3046;
    float _3080 = _3076;
    if (!_3078)
    {
        float _3082 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3084 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3086 = _3016 + _3084;
        float _3088 = rsqrt(_3008);
        float _3090 = _3086 * _3082;
        float _3092 = _3050 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3094 = _3090 * 0.15915493667125701904296875;
        float _3096 = _3094 * 6.283185482025146484375;
        float _3098 = sin(_3096);
        float _3100 = _3094 * 6.283185482025146484375;
        float _3102 = cos(_3100);
        float _3104 = fma(_3098, _3092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3106 = _3088 * _3104;
        float _3108 = _3102 + (-1.0);
        float _3110 = fma(_2994, _3106, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3112 = fma(_2998, _3106, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3114 = _3108 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3118 = _3110 + _3116;
        float _3120 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3122 = _3112 + _3120;
        float _3124 = fma(_3050, _3102, _3114);
        float _3126 = _3118 * _3118;
        float _3128 = _3122 * _3122;
        _3080 = _3124;
        _3066 = _3126;
        _3074 = _3128;
        _3068 = _3110;
        _3070 = _3112;
    }
    float _3130 = _3080;
    float _3132 = _3066;
    float _3134 = _3074;
    float _3136 = _3068;
    float _3138 = _3070;
    float _3140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3142 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3144 = _3130 + _3142;
    float _3146 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3040);
    float _3148 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3054);
    float _3150 = _2276 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3152 = fma(_3144, _3144, _3132);
    float _3154 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3022);
    float _3156 = -_128;
    float _3158 = fma(_3156, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3028);
    float _3160 = fma(_2642, _2538, _2870);
    float _3162 = _3152 + _3134;
    float _3164 = -_3148;
    float _3166 = fma(_3146, _3030, _3164);
    float _3168 = fma(_3154, _2850, _3158);
    float _3170 = _2168 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3172 = _2138 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3174 = _2956 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3176 = fma(_2872, _2512, _3160);
    float _3178 = _3150 * _3140;
    float _3180 = _3172 * _3032;
    float _3182 = sqrt(_3162);
    float _3184 = _3174 * _3048;
    float _3186 = _3170 * _3060;
    float _3188 = _2896 + 0.5;
    float _3190 = _2918 + 0.5;
    float _3192 = _2988 + 0.5;
    float _3194 = _3058 + 0.5;
    float _3196 = _3168 + 0.5;
    float _3198 = _3166 + 0.5;
    float _3200 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[190].x, _3176);
    out.m_71.x = _3190;
    out.m_71.y = _3192;
    out.m_71.z = _3180;
    out.m_71.w = _3184;
    out.m_73.x = _3186;
    out.m_73.y = _3178;
    bool _3202 = _3182 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3204 = isnan(_3182);
    bool _3206 = _3202 || _3204;
    bool _3208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3210 = _3206 || _3208;
    out.m_75.x = _3188;
    out.m_75.y = _3194;
    out.m_77.x = _3196;
    out.m_77.y = _3198;
    out.m_79.x = _3200;
    float _3212 = _3162;
    float _3214 = _3192;
    float _3216 = _3190;
    if (!_3210)
    {
        _3212 = 1.0;
    }
    float _3218 = _3212;
    bool _3220 = !_3210;
    float _3222 = _3218;
    if (!_3220)
    {
        bool _3224 = _3182 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3226 = isnan(_3182);
        bool _3228 = _3224 || _3226;
        bool _3230 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3232 = _3228 || _3230;
        if (!_3232)
        {
            float _3234 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3236 = _3182 + _3234;
            float _3238 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3240 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3238;
            float _3242 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3244 = _3242 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3246 = 1.0 / _3240;
            float _3248 = _3236 * _3246;
            float _3250 = fma(_3248, _3244, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3222 = _3250;
            _3252 = true;
        }
        else
        {
            bool _3254 = _3182 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3256 = isnan(_3182);
            bool _3258 = _3254 || _3256;
            bool _3260 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3262 = _3258 || _3260;
            if (!_3262)
            {
                float _3264 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3266 = _3182 + _3264;
                float _3268 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3270 = _3268 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3272 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3274 = _3272 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3276 = 1.0 / _3270;
                float _3278 = _3266 * _3276;
                float _3280 = fma(_3278, _3274, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3222 = _3280;
                _3252 = true;
            }
            else
            {
                _3222 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3252 = false;
    float _3282 = _3222;
    float _3284 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3286 = _3130 + _3284;
    float _3288 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3290 = _3136 + _3288;
    float _3292 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3294 = _3138 + _3292;
    float _3296 = fma(_3286, _3282, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3298 = fma(_3290, _3282, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3300 = fma(_3294, _3282, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3302 = -_2868;
    float _3304 = _3302 + _3296;
    float _3306 = -_2830;
    float _3308 = _3306 + _3298;
    float _3310 = -_2834;
    float _3312 = _3310 + _3300;
    float _3314 = _3304 * _3304;
    float _3316 = fma(_3308, _3308, _3314);
    float _3318 = fma(_3312, _3312, _3316);
    float _3320 = sqrt(_3318);
    bool _3322 = _3320 > 0.0;
    bool _3324 = !_3322;
    float _3326 = _3320;
    float _3328 = _3298;
    float _3330 = _3296;
    float _3332 = _3300;
    float _3334 = _3318;
    if (!_3324)
    {
        bool _3336 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3338 = _3180;
        if (_3336)
        {
            float _3340 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3338 = _3340;
        }
        float _3342 = _3338;
        if (_3336)
        {
            float _3344 = _410 * _3342;
            _3214 = _3344;
        }
        float _3346 = _3214;
        float _3348 = _3346;
        if (_3336)
        {
            float _3350 = _412 * _3342;
            _3216 = _3350;
        }
        float _3352 = _3216;
        float _3354 = _3352;
        if (_3336)
        {
            float _3356 = _414 * _3342;
            _3326 = _3356;
        }
        float _3358 = _3326;
        float _3360 = _3358;
        if (!_3336)
        {
            float _3362 = _128 + 1.0;
            float _3364 = _3362;
            if (!_176)
            {
                float _3366 = _3362 * _3362;
                float _3368 = _3366 * 0.5;
                _418 = _3368;
            }
            float _3370 = _418;
            float _3372 = _3370;
            if (!_176)
            {
                float _3374 = _3370 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3372 = _3374;
            }
            float _3376 = _3372;
            bool _3378 = !_176;
            float _3380 = _3376;
            if (!_3378)
            {
                float _3382 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3384 = log2(_3382);
                float _3386 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3388 = _3386 + 1.0;
                float _3390 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3392 = _3384 * _3362;
                float _3394 = 1.0 / _3388;
                float _3396 = _3390 * 0.693147182464599609375;
                float _3398 = exp2(_3392);
                float _3400 = 1.0 / _3396;
                float _3402 = _3398 + (-1.0);
                float _3404 = -_3402;
                float _3406 = fma(_3404, _3400, _3362);
                float _3408 = _3406 * _3394;
                float _3410 = _3408 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3380 = _3410;
            }
            float _3412 = _3380;
            float _3414 = _3412 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3416 = _3412 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3418 = !_176;
            if (!_3418)
            {
                float _3420 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3422 = log2(_3420);
                float _3424 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3426 = _3424 + 1.0;
                float _3428 = 1.0 / _3426;
                float _3430 = _3422 * _3362;
                float _3432 = exp2(_3430);
                float _3434 = -_3432;
                float _3436 = _3434 + 1.0;
                float _3438 = _3436 * _3428;
                _3364 = _3438;
            }
            float _3440 = _3364;
            float _3442 = fma(_3440, _180, _3416);
            float _3444 = fma(_3440, _178, _3414);
            float _3446 = _3412 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3448 = -_372;
            float _3450 = _3448 + _3442;
            float _3452 = -_376;
            float _3454 = _3452 + _3444;
            float _3456 = fma(_3440, _182, _3446);
            float _3458 = _3450 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3460 = _3450 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3462 = _3450 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3464 = -_378;
            float _3466 = _3464 + _3456;
            float _3468 = fma(_3454, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3458);
            float _3470 = fma(_3454, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3460);
            float _3472 = fma(_3454, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3462);
            float _3474 = fma(_3466, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3468);
            float _3476 = fma(_3466, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3470);
            float _3478 = fma(_3466, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3472);
            _420 = _3476;
            _422 = _3474;
            _424 = _3478;
            _3348 = _3474;
            _3354 = _3476;
            _3360 = _3478;
        }
        float _3480 = _420;
        float _3482 = _422;
        float _3484 = _424;
        float _3486 = _3348;
        float _3488 = _3354;
        float _3490 = _3360;
        float _3492 = _3480 * _3480;
        float _3494 = rsqrt(_3318);
        float _3496 = fma(_3482, _3482, _3492);
        float _3498 = fma(_3484, _3484, _3496);
        float _3500 = sqrt(_3498);
        float _3502 = _3308 * _3494;
        float _3504 = _3304 * _3494;
        float _3506 = _3312 * _3494;
        bool _3508 = _3500 > 0.0;
        bool _3510 = !_3508;
        _156 = _3502;
        if (!_3510)
        {
            float _3512 = rsqrt(_3498);
            float _3514 = _3512 * _3480;
            float _3516 = _3512 * _3482;
            float _3518 = _3512 * _3484;
            float _3520 = _3504 * _3514;
            float _3522 = fma(_3502, _3516, _3520);
            float _3524 = fma(_3506, _3518, _3522);
            float _3526 = _3524 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3528 = fma(_3486, _3526, _3298);
            float _3530 = fma(_3488, _3526, _3296);
            float _3532 = fma(_3490, _3526, _3300);
            _3328 = _3528;
            _3330 = _3530;
            _3332 = _3532;
        }
    }
    float _3534 = _3328;
    float _3536 = _3330;
    float _3538 = _3332;
    float _3540 = _156;
    float _3542 = _2868 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3544 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3542);
    float _3546 = _2868 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3548 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3550 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3552 = _3548 || _3550;
    bool _3554 = isnan(0.5);
    bool _3556 = _3552 || _3554;
    float _3558 = fma(_2834, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3544);
    float _3560 = fma(_2830, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3546);
    float _3562 = _3558 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3564 = fma(_2834, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3560);
    bool _3566 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3568 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3570 = _3566 || _3568;
    bool _3572 = isnan(0.5);
    bool _3574 = _3570 || _3572;
    float _3576 = 1.0 / _3562;
    float _3578 = _3564 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3580 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3582 = _3540;
    float _3584 = _3578;
    float _3586 = _3534;
    if (_3556)
    {
        _3580 = _3534;
    }
    float _3588 = _3580;
    float _3590 = _3578 + _3562;
    float _3592 = _3588;
    if (_3556)
    {
        _3582 = _3536;
    }
    float _3594 = _3582;
    float _3596 = _3594;
    if (_3556)
    {
        _3584 = _3538;
    }
    float _3598 = _3584;
    float _3600 = _3598;
    float _3602 = _3576;
    if (!_3556)
    {
        float _3604 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3606 = _2868 + _3604;
        float _3608 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3610 = _2830 + _3608;
        float _3612 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3614 = -_2830;
        float _3616 = _3614 + _3534;
        float _3618 = _3606 * _3606;
        float _3620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3622 = _2834 + _3620;
        float _3624 = -_2834;
        float _3626 = _3624 + _3538;
        float _3628 = fma(_3610, _3610, _3618);
        float _3630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3632 = fma(_3622, _3622, _3628);
        float _3634 = sqrt(_3632);
        float _3636 = _3612 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3638 = precise::min(_3634, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3640 = _3638 * _3630;
        float _3642 = -_2868;
        float _3644 = _3642 + _3536;
        float _3646 = _3636 * _3640;
        float _3648 = fma(_3616, _3646, _2830);
        float _3650 = fma(_3644, _3646, _2868);
        float _3652 = fma(_3626, _3646, _2834);
        _3586 = _3616;
        _3596 = _3650;
        _3592 = _3648;
        _3600 = _3652;
    }
    float _3654 = _3586;
    float _3656 = _3596;
    float _3658 = _3592;
    float _3660 = _3600;
    float _3662 = _3654;
    if (_3574)
    {
        _3662 = 1.0;
    }
    float _3664 = _3662;
    float _3666 = _3590 * _3576;
    float _3668 = _3666 * 0.5;
    float _3670 = _3664;
    float _3672 = _3668;
    if (!_3574)
    {
        float _3674 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3676 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3678 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3676);
        float _3680 = _3674 * 0.15915493667125701904296875;
        float _3682 = _3680 * 6.283185482025146484375;
        float _3684 = cos(_3682);
        float _3686 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3688 = _3686 * 0.15915493667125701904296875;
        float _3690 = _3680 * 6.283185482025146484375;
        float _3692 = sin(_3690);
        float _3694 = 1.0 / _3684;
        float _3696 = _3688 * 6.283185482025146484375;
        float _3698 = cos(_3696);
        float _3700 = _3692 * _3694;
        float _3702 = 1.0 / _3678;
        float _3704 = _3698 * _3700;
        float _3706 = _3688 * 6.283185482025146484375;
        float _3708 = sin(_3706);
        float _3710 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3712 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3710;
        float _3714 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3716 = _3702 * _3714;
        float _3718 = 1.0 / _3704;
        float _3720 = 1.0 / _3712;
        float _3722 = _3708 * _3718;
        float _3724 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3726 = fma(_3722, _3716, _3724);
        float _3728 = _3726 * _3720;
        float _3730 = precise::clamp(_3728, 0.0, 1.0);
        _3602 = _3716;
        _3670 = _3730;
    }
    float _3732 = _3602;
    float _3734 = _3670;
    float _3736 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3738 = _3656 + _3736;
    float _3740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3742 = _3658 + _3740;
    float _3744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3746 = _3660 + _3744;
    float _3748 = _3738 * _3738;
    float _3750 = fma(_3742, _3742, _3748);
    float _3752 = fma(_3746, _3746, _3750);
    float _3754 = rsqrt(_3752);
    float _3756 = sqrt(_3752);
    float _3758 = _3754 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3760 = _3742 * _3758;
    float _3762 = _3746 * _3758;
    float _3764 = _3760 * _3760;
    float _3766 = _3762 * _3762;
    float _3768 = _3764 + _3766;
    float _3770 = sqrt(_3768);
    bool _3772 = _3770 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3776 = _3770 + _3774;
    float _3778 = _3754;
    float _3780 = _3776;
    float _3782 = _3738;
    float _3784 = _3760;
    if (_3772)
    {
        float _3786 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3778 = _3786;
    }
    float _3788 = _3778;
    float _3790 = _3788;
    if (_3772)
    {
        float _3792 = _3776 * _3788;
        _3780 = _3792;
    }
    float _3794 = _3780;
    if (_3772)
    {
        float _3796 = rsqrt(_3768);
        _3790 = _3796;
    }
    float _3798 = _3790;
    float _3800 = _3798;
    if (_3772)
    {
        float _3802 = _3794 * 0.15915493667125701904296875;
        _3672 = _3802;
    }
    float _3804 = _3672;
    float _3806 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3808 = _3746;
    float _3810 = _3804;
    if (_3772)
    {
        float _3812 = _3804 * 6.283185482025146484375;
        float _3814 = sin(_3812);
        _3808 = _3814;
    }
    float _3816 = _3808;
    float _3818 = precise::max(0.0, _3806);
    float _3820 = _3732;
    float _3822 = _3818;
    if (_3772)
    {
        float _3824 = _3804 * 6.283185482025146484375;
        float _3826 = cos(_3824);
        _3820 = _3826;
    }
    float _3828 = _3820;
    float _3830 = -_3758;
    float _3832 = -_3818;
    float _3834 = fma(_3738, _3830, _3832);
    if (_3772)
    {
        float _3836 = _3834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3782 = _3836;
    }
    float _3838 = _3782;
    float _3840 = _3816;
    float _3842 = _3838;
    if (_3772)
    {
        float _3844 = fma(_3816, _3838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3840 = _3844;
    }
    float _3846 = _3840;
    float _3848 = _3846;
    if (!_3772)
    {
        _3842 = _3766;
    }
    float _3850 = _3842;
    float _3852 = _3850;
    if (_3772)
    {
        float _3854 = _3798 * _3846;
        _3334 = _3854;
    }
    float _3856 = _3334;
    if (!_3772)
    {
        _3800 = _3834;
    }
    float _3858 = _3800;
    float _3860 = _3858;
    if (_3772)
    {
        float _3862 = _3828 + (-1.0);
        _3822 = _3862;
    }
    float _3864 = _3822;
    float _3866 = _3864;
    if (_3772)
    {
        float _3868 = _3760 * _3856;
        _3784 = _3868;
    }
    float _3870 = _3784;
    if (!_3772)
    {
        _3848 = _3762;
    }
    float _3872 = _3848;
    float _3874 = _3872;
    if (_3772)
    {
        float _3876 = _3762 * _3856;
        _3874 = _3876;
    }
    float _3878 = _3874;
    if (_3772)
    {
        float _3880 = _3864 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3810 = _3880;
    }
    float _3882 = _3810;
    if (!_3772)
    {
        _3866 = _3764;
    }
    float _3884 = _3866;
    float _3886 = _3884;
    if (_3772)
    {
        float _3888 = _3870 * _3870;
        _3886 = _3888;
    }
    float _3890 = _3886;
    if (_3772)
    {
        float _3892 = _3878 * _3878;
        _3852 = _3892;
    }
    float _3894 = _3852;
    if (_3772)
    {
        float _3896 = fma(_3834, _3828, _3882);
        _3860 = _3896;
    }
    float _3898 = _3860;
    float _3900 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3902 = fma(_3898, _3898, _3890);
    float _3904 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3906 = fma(_3756, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3904);
    float _3908 = precise::clamp(_3906, 0.0, 1.0);
    float _3910 = _3902 + _3894;
    float _3912 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3914 = -_3908;
    float _3916 = _3914 + 1.0;
    float _3918 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3920 = rsqrt(_3910);
    float _3922 = fma(_3658, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3912);
    float _3924 = _3656 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3926 = fma(_3658, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3900);
    float _3928 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3930 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3922);
    float _3932 = fma(_3658, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3924);
    float _3934 = fma(_3658, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3918);
    float _3936 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3926);
    float _3938 = _3930 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3940 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3932);
    float _3942 = abs(_3916);
    float _3944 = log2(_3942);
    float _3946 = fma(_3660, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3934);
    float _3948 = _3938 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3950 = _3940 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3952 = _3936 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3954 = _3920 * _3870;
    float _3956 = -_3948;
    float _3958 = fma(_3956, _3928, 1.0);
    float _3960 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3962 = _3946 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3964 = _3920 * _3898;
    float _3966 = _3954 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3968 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3960);
    float _3970 = _3920 * _3878;
    float _3972 = log2(_3958);
    float _3974 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3968);
    float _3976 = -_3966;
    float _3978 = fma(_3964, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3976);
    float _3980 = _3944 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3982 = fma(_3962, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3974);
    float _3984 = -_3970;
    float _3986 = fma(_3984, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3978);
    float _3988 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3990 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3992 = exp2(_3980);
    float _3994 = fma(_3986, -0.5, 0.5);
    float _3996 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3988);
    float _3998 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3990);
    float _4000 = fma(_3986, 0.5, 0.5);
    float _4002 = _3964 + 1.0;
    float _4004 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3996);
    float _4006 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3998);
    float _4008 = 1.0 / _3982;
    float _4010 = fma(_4000, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4012 = fma(_3962, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4004);
    float _4014 = fma(_3962, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4006);
    float _4016 = _3972 * 0.693147182464599609375;
    float _4018 = fma(_4000, _4010, -0.212114393711090087890625);
    float _4020 = sqrt(_3994);
    float _4022 = -_3964;
    float _4024 = fma(_3992, _4002, _4022);
    float _4026 = fma(_4000, _4018, 1.570728778839111328125);
    float _4028 = _4016 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4030 = _4012 * _4008;
    float _4032 = _4014 * _4008;
    float _4034 = fma(_4030, 0.5, 0.5);
    float _4036 = fma(_4032, -0.5, 0.5);
    float _4038 = fma(_4024, 0.5, 0.5);
    float _4040 = _4020 * 0.636619746685028076171875;
    float3 _10421 = float3(_4034, _4036, _4028);
    float _4042 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10421, float3(0.0), isnan(_10421)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10421, float3(0.0), isnan(_10421)), level(0.0)).x;
    float3 _10432 = float3(_4034, _4036, _4028);
    float4 _4045 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10432, float3(0.0), isnan(_10432)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10432, float3(0.0), isnan(_10432)), level(0.0)).xyzw;
    float _4047 = _4045.x;
    float _4049 = _4045.y;
    float _4051 = _4045.z;
    float _4053 = _4045.w;
    float _4055 = -_4026;
    float _4057 = fma(_4040, _4055, 1.0);
    float2 _10454 = float2(_4057, _4038);
    float3 _4061 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10454, float2(0.0), isnan(_10454)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10454, float2(0.0), isnan(_10454)), level(0.0)).xyz;
    float _4063 = _4061.x;
    float _4065 = _4061.y;
    float _4067 = _4061.z;
    float _4069 = _3944 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4071 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4073 = _3982 * 0.5;
    bool _4075 = _3734 > 0.0;
    bool _4077 = isnan(_3734);
    bool _4079 = _4075 || _4077;
    bool _4081 = isnan(0.0);
    bool _4083 = _4079 || _4081;
    float _4085 = _4012 + _3982;
    float _4087 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4071);
    float _4089 = exp2(_4069);
    float _4091 = _3734 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4093 = _4085 * 0.5;
    float _4095 = fma(_3938, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4087);
    float _4097 = fma(_4014, -0.5, _4073);
    float _4099 = _4091 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4101 = fma(_3962, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4095);
    out.m_47.x = _4099;
    float _4103 = _4101 + _3982;
    out.gl_Position.x = _4012;
    out.gl_Position.y = _4014;
    out.gl_Position.z = _4101;
    out.gl_Position.w = _3982;
    float _4105 = _4103 * 0.5;
    float _4107 = -_4089;
    float _4109 = _4107 + 1.0;
    float _4111 = _4109 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _4093;
    out.m_81.y = _4097;
    out.m_81.z = _4105;
    out.m_81.w = _3982;
    float _4113 = -_4111;
    float _4115 = _4113 + 1.0;
    float _4117 = _4111 * _4042;
    float _4119 = _4053 * _4115;
    float _4121 = _4053 * _4117;
    float _4123 = _4067 * _4117;
    float _4125 = fma(_4063, _4121, _4047);
    float _4127 = fma(_4065, _4121, _4049);
    float _4129 = fma(_4053, _4123, _4051);
    out.m_83.x = _4125;
    out.m_83.y = _4127;
    out.m_83.z = _4129;
    out.m_83.w = _4119;
    if (_4083)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _4131 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4131;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

