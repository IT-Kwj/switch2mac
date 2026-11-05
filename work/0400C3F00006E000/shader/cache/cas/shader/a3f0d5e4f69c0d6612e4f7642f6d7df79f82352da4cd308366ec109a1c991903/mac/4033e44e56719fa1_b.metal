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
    float4 m_53 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_67 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1246 = false;
    bool _970 = false;
    bool _828 = false;
    bool _552 = false;
    bool _426 = false;
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
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2596 = as_type<float>(_102);
        out.gl_Position.z = _2596;
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
        _96 = _122;
    }
    float _124 = _96;
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
        float _2665 = as_type<float>(_138);
        out.gl_Position.z = _2665;
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
    float _184 = 0.0;
    float _186 = _180;
    float _188 = 0.0;
    if (!_182)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _142 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _142);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _208;
        _186 = _218;
        _188 = _206;
    }
    float _220 = _184;
    float _222 = _186;
    float _224 = _188;
    bool _226 = !_152;
    float _228 = _220;
    float _230 = _224;
    if (!_226)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _142 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _228 = _244;
        _230 = _238;
        _168 = _250;
    }
    float _252 = _228;
    float _254 = _230;
    float _256 = _168;
    float _258 = _252;
    float _260 = _254;
    if (!_152)
    {
        float _262 = _120 * _120;
        float _264 = _262 * 0.5;
        _258 = _264;
    }
    float _266 = _258;
    float _268 = _266;
    if (!_152)
    {
        _260 = _120;
    }
    float _270 = _260;
    float _272 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _274 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _276 = _270;
    if (!_152)
    {
        float _278 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _278;
    }
    float _280 = _268;
    bool _282 = !_152;
    float _284 = _280;
    if (!_282)
    {
        float _286 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = log2(_286);
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _120 * _288;
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = 1.0 / _296;
        float _300 = _290 * 0.693147182464599609375;
        float _302 = exp2(_292);
        float _304 = 1.0 / _300;
        float _306 = _302 + (-1.0);
        float _308 = -_306;
        float _310 = fma(_308, _304, _120);
        float _312 = _310 * _298;
        float _314 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _284 = _314;
    }
    float _316 = _284;
    bool _318 = !_152;
    if (!_318)
    {
        float _320 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = log2(_320);
        float _324 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _326 = _324 + 1.0;
        float _328 = 1.0 / _326;
        float _330 = _120 * _322;
        float _332 = exp2(_330);
        float _334 = -_332;
        float _336 = _334 + 1.0;
        float _338 = _336 * _328;
        _276 = _338;
    }
    float _340 = _276;
    float _342 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _344 = fma(_256, _156, _274);
    float _346 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _348 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_340, _156, _342);
    float _352 = fma(_256, _154, _272);
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _356 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _358 = fma(_340, _154, _346);
    float _360 = fma(_344, _140, _162);
    float _362 = -_350;
    float _364 = _344 + _362;
    float _366 = fma(_256, _158, _348);
    float _368 = fma(_352, _140, _160);
    float _370 = fma(_340, _158, _356);
    float _372 = -_358;
    float _374 = _352 + _372;
    float _376 = _364 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = _364 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _380 = _364 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = -_370;
    float _384 = _366 + _382;
    float _386 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _388 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].x, _378);
    float _390 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _392 = fma(_366, _140, _164);
    float _394 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _396 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].z, _388);
    float _398 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].z, _390);
    bool _400 = !_354;
    float _402 = _396;
    float _404 = _394;
    float _406 = _398;
    float _424;
    if (!_400)
    {
        float _408 = in.m_51.x;
        float _410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _412 = _408 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _414 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _416 = _414 * _410;
        float _418 = floor(_416);
        float _420 = -_418;
        float _422 = _416 + _420;
        _424 = _422;
        _426 = true;
    }
    else
    {
        float _428 = float(_86);
        float _430 = 1.0 / _428;
        float _432 = _120 * _430;
        _424 = _432;
    }
    _426 = false;
    float _434 = _424;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _438 = _434 + _436;
    bool _440 = _434 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _442 = isnan(_434);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _452;
    float _456 = 1.0 / _454;
    bool _458 = _434 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _460 = isnan(_434);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -_450;
    float _472 = _470 + 1.0;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _478;
    bool _482 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _484;
    float _488 = _468 * _472;
    float _490 = -_468;
    float _492 = _490 + 1.0;
    float _494 = _438 * _456;
    float _496 = in.m_49.x;
    float _498 = in.m_49.y;
    float _500 = in.m_49.z;
    float _502 = fma(_476, _494, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _504 = fma(_486, _494, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _506 = fma(_480, _494, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _508 = _502 * _488;
    float _510 = _504 * _488;
    float _512 = _506 * _488;
    float _514 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].x, _508);
    float _516 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].y, _510);
    float _518 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].z, _512);
    float _520 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[144].x, _514);
    float _522 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[144].y, _516);
    float _524 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[144].z, _518);
    float _526 = _522 * _498;
    float _528 = _520 * _496;
    float _530 = _524 * _500;
    bool _532 = !_482;
    float _550;
    if (!_532)
    {
        float _534 = in.m_51.x;
        float _536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _538 = _534 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _542 = _540 * _536;
        float _544 = floor(_542);
        float _546 = -_544;
        float _548 = _542 + _546;
        _550 = _548;
        _552 = true;
    }
    else
    {
        float _554 = float(_86);
        float _556 = 1.0 / _554;
        float _558 = _120 * _556;
        _550 = _558;
    }
    _552 = false;
    float _560 = _550;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _564 = _560 + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _568 = _560 + _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _572 = _560 + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _590 = 1.0 / _580;
    bool _592 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _594 = isnan(_560);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = 1.0 / _584;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _606;
    bool _610 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _612 = 1.0 / _588;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _616 = _560 + _614;
    float _618 = 1.0 / _576;
    float _620 = _616 * _590;
    bool _622 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _624 = isnan(_560);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = _564 * _604;
    bool _636 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _638 = isnan(_560);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_632;
    float _650 = _648 + 1.0;
    float _652 = _568 * _612;
    bool _654 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _656 = isnan(_560);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = fma(_608, _634, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _668 = _646 * _650;
    float _670 = -_646;
    float _672 = _670 + 1.0;
    float _674 = -_664;
    float _676 = _674 + 1.0;
    float _678 = _572 * _618;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _684;
    float _688 = fma(_682, _634, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _690 = fma(_686, _634, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _692 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _694 = isnan(_560);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = _664 * _672;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _718 = _702 * _676;
    float _720 = -_702;
    float _722 = _720 + 1.0;
    float _724 = fma(_708, _652, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _726 = fma(_716, _652, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _728 = fma(_712, _652, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _730 = _602 * _722;
    float _732 = -_602;
    float _734 = _732 + 1.0;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _736;
    float _740 = _688 * _730;
    float _742 = _690 * _730;
    float _744 = _666 * _730;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _750;
    float _754 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].x, _740);
    float _756 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].y, _742);
    float _758 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].z, _744);
    float _760 = fma(_748, _678, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _762 = fma(_752, _678, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _764 = fma(_738, _678, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _766 = fma(_724, _718, _754);
    float _768 = fma(_728, _718, _758);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _778 = fma(_726, _718, _756);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _784 = fma(_760, _704, _766);
    float _786 = fma(_772, _620, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _788 = fma(_776, _620, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _790 = fma(_782, _620, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _792 = fma(_762, _704, _778);
    float _794 = fma(_764, _704, _768);
    float _796 = fma(_786, _668, _784);
    float _798 = fma(_788, _668, _792);
    float _800 = fma(_790, _668, _794);
    float _802 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[111].x, _796);
    float _804 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[111].y, _798);
    float _806 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[111].z, _800);
    bool _808 = !_610;
    float _826;
    if (!_808)
    {
        float _810 = in.m_51.x;
        float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _814 = _810 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _818 = _816 * _812;
        float _820 = floor(_818);
        float _822 = -_820;
        float _824 = _818 + _822;
        _826 = _824;
        _828 = true;
    }
    else
    {
        float _830 = float(_86);
        float _832 = 1.0 / _830;
        float _834 = _120 * _832;
        _826 = _834;
    }
    _828 = false;
    float _836 = _826;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _836 + _838;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _846 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _848 = isnan(_836);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _862 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _864 = isnan(_836);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _874;
    bool _878 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _880 = isnan(_836);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = 1.0 / _844;
    float _892 = -_856;
    float _894 = _892 + 1.0;
    bool _896 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _898 = _872 * _894;
    float _900 = -_872;
    float _902 = _900 + 1.0;
    float _904 = 1.0 / _860;
    float _906 = _876 * _890;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _912 = fma(_906, _840, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _914 = _806 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _916 = _910 * _904;
    float _918 = _912 * _898;
    float _920 = -_888;
    float _922 = _920 + 1.0;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _926 = _836 + _924;
    float _928 = _802 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _930 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[115].x, _918);
    float _932 = _856 * _922;
    float _934 = fma(_916, _926, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _936 = _804 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _938 = _928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = fma(_934, _932, _930);
    float _942 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[117].x, _940);
    float _944 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _946 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _942 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _938;
    out.m_53.y = _944;
    out.m_53.z = _946;
    out.m_53.w = _948;
    bool _950 = !_896;
    float _968;
    if (!_950)
    {
        float _952 = in.m_51.x;
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _956 = _952 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _960 = _958 * _954;
        float _962 = floor(_960);
        float _964 = -_962;
        float _966 = _960 + _964;
        _968 = _966;
        _970 = true;
    }
    else
    {
        float _972 = float(_86);
        float _974 = 1.0 / _972;
        float _976 = _120 * _974;
        _968 = _976;
    }
    _970 = false;
    float _978 = _968;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _982 = _978 + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _986 = _978 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _990 = _978 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _992;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1008 = 1.0 / _994;
    bool _1010 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1012 = isnan(_978);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = 1.0 / _998;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1026 = _978 + _1024;
    float _1028 = 1.0 / _1002;
    float _1030 = _990 * _1008;
    bool _1032 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1034 = isnan(_978);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    bool _1044 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1046 = 1.0 / _1006;
    float _1048 = _982 * _1022;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1050;
    float _1054 = fma(_1052, _1030, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1056 = _986 * _1028;
    bool _1058 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1060 = isnan(_978);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1066 = _1062 || _1064;
    float _1068 = float(_1066);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1074;
    float _1078 = -_1068;
    float _1080 = _1078 + 1.0;
    float _1082 = fma(_1072, _1030, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1084 = _1026 * _1046;
    bool _1086 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1088 = isnan(_978);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1094 = _1090 || _1092;
    float _1096 = float(_1094);
    float _1098 = fma(_1076, _1030, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1100 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1102 = isnan(_978);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = _1042 * _1080;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1118 = -_1096;
    float _1120 = _1118 + 1.0;
    float _1122 = -_1042;
    float _1124 = _1122 + 1.0;
    float _1126 = fma(_1116, _1048, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1128 = _1110 * _1120;
    float _1130 = -_1110;
    float _1132 = _1130 + 1.0;
    float _1134 = _1096 * _1124;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1144 = _1020 * _1132;
    float _1146 = fma(_1138, _1048, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1148 = fma(_1142, _1048, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1150 = _1082 * _1144;
    float _1152 = _1054 * _1144;
    float _1154 = -_1020;
    float _1156 = _1154 + 1.0;
    float _1158 = _1098 * _1144;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1168;
    float _1172 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1152);
    float _1174 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1150);
    float _1176 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1158);
    float _1178 = fma(_1162, _1056, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1180 = fma(_1166, _1056, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1182 = fma(_1170, _1056, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1184 = fma(_1146, _1128, _1172);
    float _1186 = fma(_1148, _1128, _1174);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1196 = fma(_1126, _1128, _1176);
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1202 = fma(_1178, _1134, _1184);
    float _1204 = fma(_1190, _1084, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1206 = fma(_1194, _1084, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1208 = fma(_1180, _1134, _1186);
    float _1210 = fma(_1200, _1084, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1212 = fma(_1182, _1134, _1196);
    float _1214 = fma(_1204, _1112, _1202);
    float _1216 = fma(_1206, _1112, _1208);
    float _1218 = fma(_1210, _1112, _1212);
    float _1220 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1214);
    float _1222 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1216);
    float _1224 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1218);
    bool _1226 = !_1044;
    float _1244;
    if (!_1226)
    {
        float _1228 = in.m_51.x;
        float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1232 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1234 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _1236 = _1234 * _1230;
        float _1238 = floor(_1236);
        float _1240 = -_1238;
        float _1242 = _1236 + _1240;
        _1244 = _1242;
        _1246 = true;
    }
    else
    {
        float _1248 = float(_86);
        float _1250 = 1.0 / _1248;
        float _1252 = _120 * _1250;
        _1244 = _1252;
    }
    _1246 = false;
    float _1254 = _1244;
    float _1256 = in.m_51.w;
    float _1258 = _360 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1260 = _360 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1262 = in.m_55.x;
    float _1264 = in.m_55.y;
    float _1266 = in.m_55.z;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1270 = _1268 != 0;
    float _1272 = _360 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1276 = _1274 != 0;
    float _1278 = in.m_57.y;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1282 = _1280 != 0;
    float _1284 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1272);
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1288 = _1286 != 0;
    float _1290 = in.m_51.x;
    float _1292 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1258);
    float _1294 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1260);
    float _1296 = in.m_51.y;
    float _1298 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1300 = in.m_57.x;
    float _1302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1304 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1292);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1308 = _1254 + _1306;
    bool _1310 = _1256 > 0.5;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1314 = _1212;
    float _1316 = _1302;
    bool _1318 = _1310;
    float _1320 = _1294;
    if (_1270)
    {
        float _1322 = in.m_51.z;
        _1314 = _1322;
    }
    float _1324 = _1314;
    float _1326 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1294);
    float _1328 = _1304 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1332 = _1330 != 0;
    float _1334 = _1298 * _1278;
    float _1336 = _1326 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1264);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1342 = _1340 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1262);
    float _1346 = -_1278;
    float _1348 = _1346 + 1.0;
    float _1350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1266);
    float _1352 = 1.0 / _1342;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1356 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1358 = _1278;
    float _1360 = _1334;
    if (_1282)
    {
        float _1362 = _1310 ? _1348 : _1278;
        _1358 = _1362;
    }
    float _1364 = _1358;
    float _1366 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1368 = _1296 > 0.5;
    float _1370 = -_1354;
    float _1372 = fma(_1356, 2.0, _1370);
    float _1374 = fma(_1366, -2.0, _1312);
    float _1376 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1378 = _1298 * _1338;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1380;
    float _1384 = -_1334;
    float _1386 = _1384 + 1.0;
    float _1388 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1284);
    float _1390 = _1338;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1332)
    {
        float _1394 = in.m_51.z;
        _1390 = _1394;
    }
    float _1396 = _1390;
    float _1398 = _1382 * _1352;
    float _1400 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1402 = _1400;
    if (_1288)
    {
        float _1404 = _1368 ? _1386 : _1334;
        _1360 = _1404;
    }
    float _1406 = _1360;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1410 = fma(_1398, _1308, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1412 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1414 = _1376 * _1350;
    if (!_1332)
    {
        _1392 = _1296;
    }
    float _1416 = _1392;
    float _1418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1420 = _1416;
    if (!_1270)
    {
        _1316 = _1300;
    }
    float _1422 = _1316;
    float _1424 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1408);
    bool _1426 = _1290 > 0.5;
    float _1428 = fma(_1400, _1364, -0.5);
    float _1430 = _1422;
    if (_1332)
    {
        _1420 = _1290;
    }
    float _1432 = _1420;
    float _1434 = _1412 * _1344;
    float _1436 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1438 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1440 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (!_1270)
    {
        _1402 = _1422;
    }
    float _1442 = _1402;
    float _1444 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1436);
    float _1446 = _1442;
    if (_1270)
    {
        _1430 = _1300;
    }
    float _1448 = _1430;
    float _1450 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1438);
    float _1452 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1440);
    if (_1270)
    {
        bool _1454 = _1324 > 0.5;
        _1318 = _1454;
    }
    bool _1456 = _1318;
    float _1458 = _1388 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1460 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1452);
    float _1462 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1444);
    float _1464 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1466 = _1396;
    if (!_1332)
    {
        _1320 = _1396;
    }
    float _1468 = _1320;
    float _1470 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1474 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1476 = fma(_1464, _1406, -0.5);
    float _1478 = _1458 + _1470;
    float _1480 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1472);
    float _1482 = _1468;
    int _1484 = as_type<int>(_1476);
    float _1486 = _1478;
    if (_1332)
    {
        _1482 = _1296;
    }
    float _1488 = _1482;
    float _1490 = _1328 + _1474;
    float _1492 = _1490;
    if (_1332)
    {
        _1466 = _1296;
    }
    float _1494 = _1466;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1498 = _1478 + _1496;
    float _1500 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1480);
    float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1504 = _1490 + _1502;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1508 = _1498 * _1498;
    bool _1510 = _1254 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1512 = isnan(_1254);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1374);
    bool _1524 = _1254 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1526 = isnan(_1254);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1532 = _1528 || _1530;
    float _1534 = float(_1532);
    float _1536 = fma(_1504, _1504, _1508);
    float _1538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1540 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1506);
    float _1542 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1544 = -_1522;
    float _1546 = fma(_1500, _1476, _1544);
    float _1548 = -_1534;
    float _1550 = _1548 + 1.0;
    if (_1270)
    {
        float _1552 = -_1448;
        float _1554 = _1552 + 1.0;
        _1484 = as_type<int>(_1554);
    }
    int _1556 = _1484;
    float _1558 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1450);
    float _1560 = sqrt(_1536);
    float _1562 = _1520 * _1550;
    float _1564 = _1412 * _1448;
    float _1566 = _1564;
    if (_1270)
    {
        float _1568 = _1456 ? as_type<float>(_1556) : _1448;
        _1446 = _1568;
    }
    float _1570 = _1446;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1574 = _1410 * _1562;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1578 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1582 = -_1564;
    float _1584 = _1582 + 1.0;
    float _1586 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1588 = _1558 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1590 = -_1572;
    float _1592 = fma(_1542, 2.0, _1590);
    float _1594 = -_1520;
    float _1596 = _1594 + 1.0;
    float _1598 = fma(_1578, -2.0, _1576);
    bool _1600 = _1560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1602 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1540);
    if (_1276)
    {
        float _1604 = _1426 ? _1584 : _1564;
        _1566 = _1604;
    }
    float _1606 = _1566;
    float _1608 = fma(_1586, _1570, -0.5);
    float _1610 = _1336 + _1588;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1614 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1574);
    float _1616 = -_120;
    float _1618 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1592);
    float _1620 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1622 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1612);
    float _1624 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1614);
    float _1626 = fma(_1602, _1608, _1618);
    float _1628 = fma(_1620, _1606, -0.5);
    float _1630 = _1620;
    if (!_1600)
    {
        _1630 = _1490;
    }
    float _1632 = _1630;
    float _1634 = _1632;
    if (!_1600)
    {
        _1492 = _1610;
    }
    float _1636 = _1492;
    bool _1638 = !_1600;
    float _1640 = _1636;
    if (!_1638)
    {
        float _1642 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1646 = _1560 + _1644;
        float _1648 = rsqrt(_1536);
        float _1650 = _1646 * _1642;
        float _1652 = _1610 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1654 = _1650 * 0.15915493667125701904296875;
        float _1656 = _1654 * 6.283185482025146484375;
        float _1658 = cos(_1656);
        float _1660 = _1654 * 6.283185482025146484375;
        float _1662 = sin(_1660);
        float _1664 = _1658 + (-1.0);
        float _1666 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1668 = fma(_1662, _1652, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1670 = fma(_1610, _1658, _1666);
        float _1672 = _1648 * _1668;
        float _1674 = fma(_1504, _1672, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1676 = fma(_1498, _1672, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1640 = _1670;
        _1634 = _1674;
        _1486 = _1676;
    }
    float _1678 = _1640;
    float _1680 = _1634;
    float _1682 = _1486;
    float _1684 = -_1336;
    float _1686 = _1684 + _1678;
    float _1688 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1622);
    float _1690 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1598);
    float _1692 = -_1328;
    float _1694 = _1692 + _1680;
    float _1696 = _1686 * _1686;
    float _1698 = -_1458;
    float _1700 = _1698 + _1682;
    float _1702 = -_1690;
    float _1704 = fma(_1688, _1428, _1702);
    float _1706 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1424);
    float _1708 = fma(_1694, _1694, _1696);
    float _1710 = -_120;
    float _1712 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1372);
    float _1714 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1716 = _1222 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1718 = fma(_1700, _1700, _1708);
    float _1720 = fma(_1706, _1628, _1712);
    float _1722 = _1224 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1724 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1726 = sqrt(_1718);
    float _1728 = _1716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1730 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1732 = _1546 + 0.5;
    float _1734 = _1624 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1736 = _1626 + 0.5;
    float _1738 = _1704 + 0.5;
    float _1740 = _1720 + 0.5;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    out.m_61.x = _1724;
    out.m_61.y = _1728;
    out.m_61.z = _1730;
    out.m_61.w = _1734;
    bool _1742 = _1726 > 0.0;
    out.m_63.x = _1740;
    out.m_63.y = _1732;
    out.m_63.z = _1736;
    out.m_63.w = _1738;
    bool _1744 = !_1742;
    float _1746 = 1.0;
    float _1748 = _1724;
    float _1750 = _1678;
    float _1752 = _1680;
    float _1754 = _1682;
    float _1756 = _1724;
    float _1758 = 1.0;
    float _1760 = 1.0;
    if (!_1744)
    {
        bool _1762 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1764 = 1.0;
        if (_1762)
        {
            float _1766 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1764 = _1766;
        }
        float _1768 = _1764;
        float _1770 = _1768;
        if (_1762)
        {
            float _1772 = _394 * _1768;
            _1746 = _1772;
        }
        float _1774 = _1746;
        float _1776 = _1774;
        float _1778 = _1774;
        if (_1762)
        {
            float _1780 = _396 * _1768;
            _1748 = _1780;
        }
        float _1782 = _1748;
        float _1784 = _1782;
        if (_1762)
        {
            float _1786 = _398 * _1768;
            _1770 = _1786;
        }
        float _1788 = _1770;
        float _1790 = _1788;
        if (!_1762)
        {
            float _1792 = _120 + 1.0;
            float _1794 = _1792;
            if (!_152)
            {
                float _1796 = _1792 * _1792;
                float _1798 = _1796 * 0.5;
                _1776 = _1798;
            }
            float _1800 = _1776;
            float _1802 = _1800;
            if (!_152)
            {
                float _1804 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1802 = _1804;
            }
            float _1806 = _1802;
            bool _1808 = !_152;
            float _1810 = _1806;
            if (!_1808)
            {
                float _1812 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1814 = log2(_1812);
                float _1816 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1818 = 1.0 + _1816;
                float _1820 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1822 = _1814 * _1792;
                float _1824 = exp2(_1822);
                float _1826 = _1820 * 0.693147182464599609375;
                float _1828 = 1.0 / _1826;
                float _1830 = 1.0 / _1818;
                float _1832 = _1824 + (-1.0);
                float _1834 = -_1832;
                float _1836 = fma(_1834, _1828, _1792);
                float _1838 = _1836 * _1830;
                float _1840 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1810 = _1840;
            }
            float _1842 = _1810;
            float _1844 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1846 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1848 = !_152;
            if (!_1848)
            {
                float _1850 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1852 = log2(_1850);
                float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1856 = 1.0 + _1854;
                float _1858 = 1.0 / _1856;
                float _1860 = _1852 * _1792;
                float _1862 = exp2(_1860);
                float _1864 = -_1862;
                float _1866 = _1864 + 1.0;
                float _1868 = _1866 * _1858;
                _1794 = _1868;
            }
            float _1870 = _1794;
            float _1872 = fma(_1870, _156, _1846);
            float _1874 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1876 = fma(_1870, _154, _1844);
            float _1878 = -_350;
            float _1880 = _1878 + _1872;
            float _1882 = fma(_1870, _158, _1874);
            float _1884 = -_358;
            float _1886 = _1884 + _1876;
            float _1888 = _1880 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1890 = _1880 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1892 = _1880 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1894 = -_370;
            float _1896 = _1894 + _1882;
            float _1898 = fma(_1886, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1888);
            float _1900 = fma(_1886, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1890);
            float _1902 = fma(_1886, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1892);
            float _1904 = fma(_1896, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1898);
            float _1906 = fma(_1896, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1900);
            float _1908 = fma(_1896, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1902);
            _402 = _1906;
            _404 = _1904;
            _406 = _1908;
            _1778 = _1904;
            _1784 = _1906;
            _1790 = _1908;
        }
        float _1910 = _402;
        float _1912 = _404;
        float _1914 = _406;
        float _1916 = _1778;
        float _1918 = _1784;
        float _1920 = _1790;
        float _1922 = _1910 * _1910;
        float _1924 = rsqrt(_1718);
        float _1926 = fma(_1912, _1912, _1922);
        float _1928 = fma(_1914, _1914, _1926);
        float _1930 = sqrt(_1928);
        float _1932 = _1694 * _1924;
        float _1934 = _1686 * _1924;
        float _1936 = _1700 * _1924;
        bool _1938 = _1930 > 0.0;
        bool _1940 = !_1938;
        _1756 = _1918;
        _1758 = _1916;
        _1760 = _1920;
        if (!_1940)
        {
            float _1942 = rsqrt(_1928);
            float _1944 = _1942 * _1910;
            float _1946 = _1942 * _1912;
            float _1948 = _1942 * _1914;
            float _1950 = _1934 * _1944;
            float _1952 = fma(_1932, _1946, _1950);
            float _1954 = fma(_1936, _1948, _1952);
            float _1956 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1958 = fma(_1916, _1956, _1680);
            float _1960 = fma(_1918, _1956, _1678);
            float _1962 = fma(_1920, _1956, _1682);
            _1750 = _1960;
            _1752 = _1958;
            _1754 = _1962;
        }
    }
    float _1964 = _1750;
    float _1966 = _1752;
    float _1968 = _1754;
    float _1970 = _1756;
    float _1972 = _1758;
    float _1974 = _1760;
    float _1976 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1978 = _1964 + _1976;
    float _1980 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1982 = _1966 + _1980;
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1986 = _1968 + _1984;
    float _1988 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1990 = _1978 * _1978;
    float _1992 = fma(_1982, _1982, _1990);
    float _1994 = fma(_1986, _1986, _1992);
    float _1996 = rsqrt(_1994);
    float _1998 = sqrt(_1994);
    float _2000 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2002 = _1982 * _2000;
    float _2004 = _1986 * _2000;
    float _2006 = _2002 * _2002;
    float _2008 = _2004 * _2004;
    float _2010 = _2006 + _2008;
    float _2012 = sqrt(_2010);
    bool _2014 = _2012 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2016 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2018 = _2012 + _2016;
    float _2020 = _1996;
    float _2022 = _1972;
    float _2024 = _2018;
    float _2026 = _1970;
    float _2028 = _1978;
    float _2030 = _1974;
    float _2032 = _2000;
    if (_2014)
    {
        float _2034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2020 = _2034;
    }
    float _2036 = _2020;
    if (_2014)
    {
        float _2038 = rsqrt(_2010);
        _2022 = _2038;
    }
    float _2040 = _2022;
    float _2042 = _2040;
    if (_2014)
    {
        float _2044 = _2018 * _2036;
        _2024 = _2044;
    }
    float _2046 = _2024;
    if (_2014)
    {
        float _2048 = _2046 * 0.15915493667125701904296875;
        _2026 = _2048;
    }
    float _2050 = _2026;
    float _2052 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2054 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2052);
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = _2036;
    if (_2014)
    {
        float _2060 = _2050 * 6.283185482025146484375;
        float _2062 = sin(_2060);
        _2058 = _2062;
    }
    float _2064 = _2058;
    float _2066 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2068 = precise::max(0.0, _2066);
    float _2070 = _1986;
    float _2072 = _2068;
    if (_2014)
    {
        float _2074 = _2050 * 6.283185482025146484375;
        float _2076 = cos(_2074);
        _2070 = _2076;
    }
    float _2078 = _2070;
    float _2080 = -_2000;
    float _2082 = -_2068;
    float _2084 = fma(_1978, _2080, _2082);
    if (!_2014)
    {
        _2028 = _2004;
    }
    float _2086 = _2028;
    float _2088 = _2086;
    if (_2014)
    {
        float _2090 = _2084 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2072 = _2090;
    }
    float _2092 = _2072;
    float _2094 = _2064;
    float _2096 = _2092;
    if (_2014)
    {
        float _2098 = fma(_2064, _2092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2030 = _2098;
    }
    float _2100 = _2030;
    float _2102 = _2100;
    if (!_2014)
    {
        _2094 = _2002;
    }
    float _2104 = _2094;
    float _2106 = _2104;
    float _2108 = _2078;
    if (_2014)
    {
        float _2110 = _2078 + (-1.0);
        _2096 = _2110;
    }
    float _2112 = _2096;
    float _2114 = _2112;
    if (_2014)
    {
        float _2116 = _2040 * _2100;
        _2102 = _2116;
    }
    float _2118 = _2102;
    if (!_2014)
    {
        _2042 = _2084;
    }
    float _2120 = _2042;
    float _2122 = _2120;
    if (_2014)
    {
        float _2124 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2032 = _2124;
    }
    float _2126 = _2032;
    if (_2014)
    {
        float _2128 = _2002 * _2118;
        _2106 = _2128;
    }
    float _2130 = _2106;
    if (!_2014)
    {
        _2114 = _2006;
    }
    float _2132 = _2114;
    float _2134 = _2132;
    if (_2014)
    {
        float _2136 = _2004 * _2118;
        _2088 = _2136;
    }
    float _2138 = _2088;
    if (_2014)
    {
        float _2140 = fma(_2084, _2078, _2126);
        _2122 = _2140;
    }
    float _2142 = _2122;
    float _2144 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_2014)
    {
        float _2146 = _2130 * _2130;
        _2134 = _2146;
    }
    float _2148 = _2134;
    if (!_2014)
    {
        _2108 = _2008;
    }
    float _2150 = _2108;
    float _2152 = _2150;
    if (_2014)
    {
        float _2154 = _2138 * _2138;
        _2152 = _2154;
    }
    float _2156 = _2152;
    float _2158 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2144);
    float _2160 = fma(_2142, _2142, _2148);
    float _2162 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2164 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2166 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2158);
    float _2168 = _2160 + _2156;
    float _2170 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2162);
    float _2172 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2164);
    float _2174 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2176 = -_2056;
    float _2178 = _2176 + 1.0;
    float _2180 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2170);
    float _2182 = rsqrt(_2168);
    float _2184 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2172);
    float _2186 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2174);
    float _2188 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2190 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2192 = _2166 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2194 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2196 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2186);
    float _2198 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2200 = abs(_2178);
    float _2202 = log2(_2200);
    float _2204 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2194);
    float _2206 = _2196 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2208 = -_2198;
    float _2210 = fma(_2208, _1988, 1.0);
    float _2212 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2204);
    float _2214 = _2182 * _2130;
    float _2216 = _2182 * _2142;
    float _2218 = _2182 * _2138;
    float _2220 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2212);
    float _2222 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2224 = log2(_2210);
    float _2226 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2228 = _2216 + 1.0;
    float _2230 = -_2222;
    float _2232 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2230);
    float _2234 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2236 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2226);
    float _2238 = -_2218;
    float _2240 = fma(_2238, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2232);
    float _2242 = 1.0 / _2220;
    float _2244 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2246 = fma(_2240, -0.5, 0.5);
    float _2248 = fma(_2240, 0.5, 0.5);
    float _2250 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2244);
    float _2252 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2236);
    float _2254 = exp2(_2234);
    float _2256 = fma(_2248, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2258 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2250);
    float _2260 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2252);
    float _2262 = _2224 * 0.693147182464599609375;
    float _2264 = fma(_2248, _2256, -0.212114393711090087890625);
    float _2266 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2258);
    float _2268 = sqrt(_2246);
    float _2270 = fma(_2248, _2264, 1.570728778839111328125);
    float _2272 = _2266 * _2242;
    float _2274 = _2260 * _2242;
    float _2276 = _2262 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2278 = fma(_2272, 0.5, 0.5);
    float _2280 = fma(_2274, -0.5, 0.5);
    float _2282 = -_2216;
    float _2284 = fma(_2254, _2228, _2282);
    float _2286 = fma(_2284, 0.5, 0.5);
    float _2288 = _2268 * 0.636619746685028076171875;
    float _2290 = -_2270;
    float _2292 = fma(_2288, _2290, 1.0);
    float3 _6158 = float3(_2278, _2280, _2276);
    float _2294 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6158, float3(0.0), isnan(_6158)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6158, float3(0.0), isnan(_6158)), level(0.0)).x;
    float3 _6169 = float3(_2278, _2280, _2276);
    float4 _2297 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6169, float3(0.0), isnan(_6169)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6169, float3(0.0), isnan(_6169)), level(0.0)).xyzw;
    float _2299 = _2297.x;
    float _2301 = _2297.y;
    float _2303 = _2297.z;
    float _2305 = _2297.w;
    float2 _6186 = float2(_2292, _2286);
    float3 _2309 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6186, float2(0.0), isnan(_6186)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6186, float2(0.0), isnan(_6186)), level(0.0)).xyz;
    float _2311 = _2309.x;
    float _2313 = _2309.y;
    float _2315 = _2309.z;
    float _2317 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2319 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2321 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2323 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2325 = isnan(0.5);
    bool _2327 = _2323 || _2325;
    bool _2329 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2331 = _2327 || _2329;
    float _2333 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2317);
    float _2335 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2319);
    float _2337 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2333);
    float _2339 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2335);
    float _2341 = _2337 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2343 = _2339 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2345 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2347 = 1.0 / _2341;
    float _2349 = _2343 + _2341;
    float _2351 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2345);
    float _2353 = _2192;
    float _2355 = _2206;
    if (_2331)
    {
        _2353 = 1.0;
    }
    float _2357 = _2353;
    float _2359 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2351);
    float _2361 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2359);
    float _2363 = _2357;
    if (_2331)
    {
        _2355 = 1.0;
    }
    float _2365 = _2355;
    float _2367 = _2349 * _2347;
    float _2369 = _2367 * 0.5;
    float _2371 = exp2(_2321);
    float _2373 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2375 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2373);
    float _2377 = 1.0 / _2375;
    float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2381 = _2377 * _2379;
    float _2383 = _2365;
    if (!_2331)
    {
        float _2385 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2387 = _2385 * 0.15915493667125701904296875;
        float _2389 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2391 = _2387 * 6.283185482025146484375;
        float _2393 = cos(_2391);
        float _2395 = _2389 * 0.15915493667125701904296875;
        float _2397 = _2387 * 6.283185482025146484375;
        float _2399 = sin(_2397);
        float _2401 = 1.0 / _2393;
        float _2403 = _2395 * 6.283185482025146484375;
        float _2405 = cos(_2403);
        float _2407 = _2399 * _2401;
        float _2409 = _2395 * 6.283185482025146484375;
        float _2411 = sin(_2409);
        float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2415 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2413;
        float _2417 = _2405 * _2407;
        float _2419 = 1.0 / _2415;
        float _2421 = 1.0 / _2417;
        float _2423 = _2411 * _2421;
        float _2425 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2427 = fma(_2381, _2423, _2425);
        float _2429 = _2427 * _2419;
        float _2431 = precise::clamp(_2429, 0.0, 1.0);
        _2383 = _2431;
    }
    float _2433 = _2383;
    if (!_2331)
    {
        float _2435 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2437 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2439 = _2435 * 0.15915493667125701904296875;
        float _2441 = _2437 * 0.15915493667125701904296875;
        float _2443 = _2439 * 6.283185482025146484375;
        float _2445 = cos(_2443);
        float _2447 = _2439 * 6.283185482025146484375;
        float _2449 = sin(_2447);
        float _2451 = 1.0 / _2445;
        float _2453 = _2441 * 6.283185482025146484375;
        float _2455 = cos(_2453);
        float _2457 = _2449 * _2451;
        float _2459 = _2441 * 6.283185482025146484375;
        float _2461 = sin(_2459);
        float _2463 = _2455 * _2457;
        float _2465 = 1.0 / _2463;
        float _2467 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2469 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2467;
        float _2471 = 1.0 / _2469;
        float _2473 = _2461 * _2465;
        float _2475 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2477 = fma(_2381, _2473, _2475);
        float _2479 = _2477 * _2471;
        float _2481 = precise::clamp(_2479, 0.0, 1.0);
        float _2483 = -_2481;
        float _2485 = _2483 + 1.0;
        _2363 = _2485;
    }
    float _2487 = _2363;
    float _2489 = -_2371;
    float _2491 = _2489 + 1.0;
    float _2493 = _2433 * _2487;
    bool _2495 = _2433 > 0.0;
    bool _2497 = isnan(_2433);
    bool _2499 = _2495 || _2497;
    bool _2501 = isnan(0.0);
    bool _2503 = _2499 || _2501;
    float _2505 = _2361 + _2220;
    float _2507 = _2491 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2509 = _2493 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2511 = _2487 <= 0.0;
    bool _2513 = !_2503;
    bool _2515 = _2511 || _2513;
    float _2517 = _2505 * 0.5;
    float _2519 = _2507 * _2294;
    float _2521 = -_2507;
    float _2523 = _2521 + 1.0;
    float _2525 = _2305 * _2519;
    float _2527 = _2315 * _2519;
    out.gl_Position.x = _2266;
    out.gl_Position.y = _2260;
    out.gl_Position.z = _2361;
    out.gl_Position.w = _2220;
    float _2529 = _2509 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2531 = fma(_2311, _2525, _2299);
    float _2533 = fma(_2313, _2525, _2301);
    float _2535 = _2305 * _2523;
    float _2537 = fma(_2305, _2527, _2303);
    out.m_65.z = _2517;
    out.m_65.w = _2220;
    out.m_45.x = _2529;
    out.m_67.x = _2531;
    out.m_67.y = _2533;
    out.m_67.z = _2537;
    out.m_67.w = _2535;
    if (!_2515)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2539 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2539;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1246 = false;
    bool _970 = false;
    bool _828 = false;
    bool _552 = false;
    bool _426 = false;
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
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2596 = as_type<float>(_102);
        out.gl_Position.z = _2596;
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
        _96 = _122;
    }
    float _124 = _96;
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
        float _2665 = as_type<float>(_138);
        out.gl_Position.z = _2665;
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
    float _184 = 0.0;
    float _186 = _180;
    float _188 = 0.0;
    if (!_182)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _142 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _142);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _208;
        _186 = _218;
        _188 = _206;
    }
    float _220 = _184;
    float _222 = _186;
    float _224 = _188;
    bool _226 = !_152;
    float _228 = _220;
    float _230 = _224;
    if (!_226)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _142 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _228 = _244;
        _230 = _238;
        _168 = _250;
    }
    float _252 = _228;
    float _254 = _230;
    float _256 = _168;
    float _258 = _252;
    float _260 = _254;
    if (!_152)
    {
        float _262 = _120 * _120;
        float _264 = _262 * 0.5;
        _258 = _264;
    }
    float _266 = _258;
    float _268 = _266;
    if (!_152)
    {
        _260 = _120;
    }
    float _270 = _260;
    float _272 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _274 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _276 = _270;
    if (!_152)
    {
        float _278 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _278;
    }
    float _280 = _268;
    bool _282 = !_152;
    float _284 = _280;
    if (!_282)
    {
        float _286 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = log2(_286);
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _120 * _288;
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = 1.0 / _296;
        float _300 = _290 * 0.693147182464599609375;
        float _302 = exp2(_292);
        float _304 = 1.0 / _300;
        float _306 = _302 + (-1.0);
        float _308 = -_306;
        float _310 = fma(_308, _304, _120);
        float _312 = _310 * _298;
        float _314 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _284 = _314;
    }
    float _316 = _284;
    bool _318 = !_152;
    if (!_318)
    {
        float _320 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = log2(_320);
        float _324 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _326 = _324 + 1.0;
        float _328 = 1.0 / _326;
        float _330 = _120 * _322;
        float _332 = exp2(_330);
        float _334 = -_332;
        float _336 = _334 + 1.0;
        float _338 = _336 * _328;
        _276 = _338;
    }
    float _340 = _276;
    float _342 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _344 = fma(_256, _156, _274);
    float _346 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _348 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_340, _156, _342);
    float _352 = fma(_256, _154, _272);
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _356 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _358 = fma(_340, _154, _346);
    float _360 = fma(_344, _140, _162);
    float _362 = -_350;
    float _364 = _344 + _362;
    float _366 = fma(_256, _158, _348);
    float _368 = fma(_352, _140, _160);
    float _370 = fma(_340, _158, _356);
    float _372 = -_358;
    float _374 = _352 + _372;
    float _376 = _364 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = _364 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _380 = _364 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = -_370;
    float _384 = _366 + _382;
    float _386 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _388 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].x, _378);
    float _390 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _392 = fma(_366, _140, _164);
    float _394 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _396 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].z, _388);
    float _398 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].z, _390);
    bool _400 = !_354;
    float _402 = _396;
    float _404 = _394;
    float _406 = _398;
    float _424;
    if (!_400)
    {
        float _408 = in.m_51.x;
        float _410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _412 = _408 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _414 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _416 = _414 * _410;
        float _418 = floor(_416);
        float _420 = -_418;
        float _422 = _416 + _420;
        _424 = _422;
        _426 = true;
    }
    else
    {
        float _428 = float(_86);
        float _430 = 1.0 / _428;
        float _432 = _120 * _430;
        _424 = _432;
    }
    _426 = false;
    float _434 = _424;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _438 = _434 + _436;
    bool _440 = _434 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _442 = isnan(_434);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _452;
    float _456 = 1.0 / _454;
    bool _458 = _434 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _460 = isnan(_434);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -_450;
    float _472 = _470 + 1.0;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _478;
    bool _482 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _484;
    float _488 = _468 * _472;
    float _490 = -_468;
    float _492 = _490 + 1.0;
    float _494 = _438 * _456;
    float _496 = in.m_49.x;
    float _498 = in.m_49.y;
    float _500 = in.m_49.z;
    float _502 = fma(_476, _494, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _504 = fma(_486, _494, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _506 = fma(_480, _494, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _508 = _502 * _488;
    float _510 = _504 * _488;
    float _512 = _506 * _488;
    float _514 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].x, _508);
    float _516 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].y, _510);
    float _518 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].z, _512);
    float _520 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[144].x, _514);
    float _522 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[144].y, _516);
    float _524 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[144].z, _518);
    float _526 = _522 * _498;
    float _528 = _520 * _496;
    float _530 = _524 * _500;
    bool _532 = !_482;
    float _550;
    if (!_532)
    {
        float _534 = in.m_51.x;
        float _536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _538 = _534 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _542 = _540 * _536;
        float _544 = floor(_542);
        float _546 = -_544;
        float _548 = _542 + _546;
        _550 = _548;
        _552 = true;
    }
    else
    {
        float _554 = float(_86);
        float _556 = 1.0 / _554;
        float _558 = _120 * _556;
        _550 = _558;
    }
    _552 = false;
    float _560 = _550;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _564 = _560 + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _568 = _560 + _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _572 = _560 + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _590 = 1.0 / _580;
    bool _592 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _594 = isnan(_560);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = 1.0 / _584;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _606;
    bool _610 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _612 = 1.0 / _588;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _616 = _560 + _614;
    float _618 = 1.0 / _576;
    float _620 = _616 * _590;
    bool _622 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _624 = isnan(_560);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = _564 * _604;
    bool _636 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _638 = isnan(_560);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_632;
    float _650 = _648 + 1.0;
    float _652 = _568 * _612;
    bool _654 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _656 = isnan(_560);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = fma(_608, _634, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _668 = _646 * _650;
    float _670 = -_646;
    float _672 = _670 + 1.0;
    float _674 = -_664;
    float _676 = _674 + 1.0;
    float _678 = _572 * _618;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _684;
    float _688 = fma(_682, _634, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _690 = fma(_686, _634, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _692 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _694 = isnan(_560);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = _664 * _672;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _718 = _702 * _676;
    float _720 = -_702;
    float _722 = _720 + 1.0;
    float _724 = fma(_708, _652, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _726 = fma(_716, _652, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _728 = fma(_712, _652, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _730 = _602 * _722;
    float _732 = -_602;
    float _734 = _732 + 1.0;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _736;
    float _740 = _688 * _730;
    float _742 = _690 * _730;
    float _744 = _666 * _730;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _750;
    float _754 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].x, _740);
    float _756 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].y, _742);
    float _758 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].z, _744);
    float _760 = fma(_748, _678, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _762 = fma(_752, _678, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _764 = fma(_738, _678, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _766 = fma(_724, _718, _754);
    float _768 = fma(_728, _718, _758);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _778 = fma(_726, _718, _756);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _784 = fma(_760, _704, _766);
    float _786 = fma(_772, _620, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _788 = fma(_776, _620, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _790 = fma(_782, _620, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _792 = fma(_762, _704, _778);
    float _794 = fma(_764, _704, _768);
    float _796 = fma(_786, _668, _784);
    float _798 = fma(_788, _668, _792);
    float _800 = fma(_790, _668, _794);
    float _802 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[111].x, _796);
    float _804 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[111].y, _798);
    float _806 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[111].z, _800);
    bool _808 = !_610;
    float _826;
    if (!_808)
    {
        float _810 = in.m_51.x;
        float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _814 = _810 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _818 = _816 * _812;
        float _820 = floor(_818);
        float _822 = -_820;
        float _824 = _818 + _822;
        _826 = _824;
        _828 = true;
    }
    else
    {
        float _830 = float(_86);
        float _832 = 1.0 / _830;
        float _834 = _120 * _832;
        _826 = _834;
    }
    _828 = false;
    float _836 = _826;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _836 + _838;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _846 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _848 = isnan(_836);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _862 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _864 = isnan(_836);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _874;
    bool _878 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _880 = isnan(_836);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = 1.0 / _844;
    float _892 = -_856;
    float _894 = _892 + 1.0;
    bool _896 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _898 = _872 * _894;
    float _900 = -_872;
    float _902 = _900 + 1.0;
    float _904 = 1.0 / _860;
    float _906 = _876 * _890;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _912 = fma(_906, _840, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _914 = _806 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _916 = _910 * _904;
    float _918 = _912 * _898;
    float _920 = -_888;
    float _922 = _920 + 1.0;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _926 = _836 + _924;
    float _928 = _802 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _930 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[115].x, _918);
    float _932 = _856 * _922;
    float _934 = fma(_916, _926, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _936 = _804 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _938 = _928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = fma(_934, _932, _930);
    float _942 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[117].x, _940);
    float _944 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _946 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _942 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _938;
    out.m_53.y = _944;
    out.m_53.z = _946;
    out.m_53.w = _948;
    bool _950 = !_896;
    float _968;
    if (!_950)
    {
        float _952 = in.m_51.x;
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _956 = _952 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _960 = _958 * _954;
        float _962 = floor(_960);
        float _964 = -_962;
        float _966 = _960 + _964;
        _968 = _966;
        _970 = true;
    }
    else
    {
        float _972 = float(_86);
        float _974 = 1.0 / _972;
        float _976 = _120 * _974;
        _968 = _976;
    }
    _970 = false;
    float _978 = _968;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _982 = _978 + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _986 = _978 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _990 = _978 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _992;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1008 = 1.0 / _994;
    bool _1010 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1012 = isnan(_978);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = 1.0 / _998;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1026 = _978 + _1024;
    float _1028 = 1.0 / _1002;
    float _1030 = _990 * _1008;
    bool _1032 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1034 = isnan(_978);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    bool _1044 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1046 = 1.0 / _1006;
    float _1048 = _982 * _1022;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1050;
    float _1054 = fma(_1052, _1030, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1056 = _986 * _1028;
    bool _1058 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1060 = isnan(_978);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1066 = _1062 || _1064;
    float _1068 = float(_1066);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1074;
    float _1078 = -_1068;
    float _1080 = _1078 + 1.0;
    float _1082 = fma(_1072, _1030, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1084 = _1026 * _1046;
    bool _1086 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1088 = isnan(_978);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1094 = _1090 || _1092;
    float _1096 = float(_1094);
    float _1098 = fma(_1076, _1030, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1100 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1102 = isnan(_978);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = _1042 * _1080;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1118 = -_1096;
    float _1120 = _1118 + 1.0;
    float _1122 = -_1042;
    float _1124 = _1122 + 1.0;
    float _1126 = fma(_1116, _1048, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1128 = _1110 * _1120;
    float _1130 = -_1110;
    float _1132 = _1130 + 1.0;
    float _1134 = _1096 * _1124;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1144 = _1020 * _1132;
    float _1146 = fma(_1138, _1048, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1148 = fma(_1142, _1048, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1150 = _1082 * _1144;
    float _1152 = _1054 * _1144;
    float _1154 = -_1020;
    float _1156 = _1154 + 1.0;
    float _1158 = _1098 * _1144;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1168;
    float _1172 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1152);
    float _1174 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1150);
    float _1176 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1158);
    float _1178 = fma(_1162, _1056, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1180 = fma(_1166, _1056, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1182 = fma(_1170, _1056, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1184 = fma(_1146, _1128, _1172);
    float _1186 = fma(_1148, _1128, _1174);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1196 = fma(_1126, _1128, _1176);
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1202 = fma(_1178, _1134, _1184);
    float _1204 = fma(_1190, _1084, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1206 = fma(_1194, _1084, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1208 = fma(_1180, _1134, _1186);
    float _1210 = fma(_1200, _1084, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1212 = fma(_1182, _1134, _1196);
    float _1214 = fma(_1204, _1112, _1202);
    float _1216 = fma(_1206, _1112, _1208);
    float _1218 = fma(_1210, _1112, _1212);
    float _1220 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1214);
    float _1222 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1216);
    float _1224 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1218);
    bool _1226 = !_1044;
    float _1244;
    if (!_1226)
    {
        float _1228 = in.m_51.x;
        float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1232 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1234 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _1236 = _1234 * _1230;
        float _1238 = floor(_1236);
        float _1240 = -_1238;
        float _1242 = _1236 + _1240;
        _1244 = _1242;
        _1246 = true;
    }
    else
    {
        float _1248 = float(_86);
        float _1250 = 1.0 / _1248;
        float _1252 = _120 * _1250;
        _1244 = _1252;
    }
    _1246 = false;
    float _1254 = _1244;
    float _1256 = in.m_51.w;
    float _1258 = _360 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1260 = _360 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1262 = in.m_55.x;
    float _1264 = in.m_55.y;
    float _1266 = in.m_55.z;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1270 = _1268 != 0;
    float _1272 = _360 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1276 = _1274 != 0;
    float _1278 = in.m_57.y;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1282 = _1280 != 0;
    float _1284 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1272);
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1288 = _1286 != 0;
    float _1290 = in.m_51.x;
    float _1292 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1258);
    float _1294 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1260);
    float _1296 = in.m_51.y;
    float _1298 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1300 = in.m_57.x;
    float _1302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1304 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1292);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1308 = _1254 + _1306;
    bool _1310 = _1256 > 0.5;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1314 = _1212;
    float _1316 = _1302;
    bool _1318 = _1310;
    float _1320 = _1294;
    if (_1270)
    {
        float _1322 = in.m_51.z;
        _1314 = _1322;
    }
    float _1324 = _1314;
    float _1326 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1294);
    float _1328 = _1304 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1332 = _1330 != 0;
    float _1334 = _1298 * _1278;
    float _1336 = _1326 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1264);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1342 = _1340 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1262);
    float _1346 = -_1278;
    float _1348 = _1346 + 1.0;
    float _1350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1266);
    float _1352 = 1.0 / _1342;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1356 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1358 = _1278;
    float _1360 = _1334;
    if (_1282)
    {
        float _1362 = _1310 ? _1348 : _1278;
        _1358 = _1362;
    }
    float _1364 = _1358;
    float _1366 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1368 = _1296 > 0.5;
    float _1370 = -_1354;
    float _1372 = fma(_1356, 2.0, _1370);
    float _1374 = fma(_1366, -2.0, _1312);
    float _1376 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1378 = _1298 * _1338;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1380;
    float _1384 = -_1334;
    float _1386 = _1384 + 1.0;
    float _1388 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1284);
    float _1390 = _1338;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1332)
    {
        float _1394 = in.m_51.z;
        _1390 = _1394;
    }
    float _1396 = _1390;
    float _1398 = _1382 * _1352;
    float _1400 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1402 = _1400;
    if (_1288)
    {
        float _1404 = _1368 ? _1386 : _1334;
        _1360 = _1404;
    }
    float _1406 = _1360;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1410 = fma(_1398, _1308, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1412 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1414 = _1376 * _1350;
    if (!_1332)
    {
        _1392 = _1296;
    }
    float _1416 = _1392;
    float _1418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1420 = _1416;
    if (!_1270)
    {
        _1316 = _1300;
    }
    float _1422 = _1316;
    float _1424 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1408);
    bool _1426 = _1290 > 0.5;
    float _1428 = fma(_1400, _1364, -0.5);
    float _1430 = _1422;
    if (_1332)
    {
        _1420 = _1290;
    }
    float _1432 = _1420;
    float _1434 = _1412 * _1344;
    float _1436 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1438 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1440 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (!_1270)
    {
        _1402 = _1422;
    }
    float _1442 = _1402;
    float _1444 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1436);
    float _1446 = _1442;
    if (_1270)
    {
        _1430 = _1300;
    }
    float _1448 = _1430;
    float _1450 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1438);
    float _1452 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1440);
    if (_1270)
    {
        bool _1454 = _1324 > 0.5;
        _1318 = _1454;
    }
    bool _1456 = _1318;
    float _1458 = _1388 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1460 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1452);
    float _1462 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1444);
    float _1464 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1466 = _1396;
    if (!_1332)
    {
        _1320 = _1396;
    }
    float _1468 = _1320;
    float _1470 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1474 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1476 = fma(_1464, _1406, -0.5);
    float _1478 = _1458 + _1470;
    float _1480 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1472);
    float _1482 = _1468;
    int _1484 = as_type<int>(_1476);
    float _1486 = _1478;
    if (_1332)
    {
        _1482 = _1296;
    }
    float _1488 = _1482;
    float _1490 = _1328 + _1474;
    float _1492 = _1490;
    if (_1332)
    {
        _1466 = _1296;
    }
    float _1494 = _1466;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1498 = _1478 + _1496;
    float _1500 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1480);
    float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1504 = _1490 + _1502;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1508 = _1498 * _1498;
    bool _1510 = _1254 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1512 = isnan(_1254);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1374);
    bool _1524 = _1254 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1526 = isnan(_1254);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1532 = _1528 || _1530;
    float _1534 = float(_1532);
    float _1536 = fma(_1504, _1504, _1508);
    float _1538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1540 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1506);
    float _1542 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1544 = -_1522;
    float _1546 = fma(_1500, _1476, _1544);
    float _1548 = -_1534;
    float _1550 = _1548 + 1.0;
    if (_1270)
    {
        float _1552 = -_1448;
        float _1554 = _1552 + 1.0;
        _1484 = as_type<int>(_1554);
    }
    int _1556 = _1484;
    float _1558 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1450);
    float _1560 = sqrt(_1536);
    float _1562 = _1520 * _1550;
    float _1564 = _1412 * _1448;
    float _1566 = _1564;
    if (_1270)
    {
        float _1568 = _1456 ? as_type<float>(_1556) : _1448;
        _1446 = _1568;
    }
    float _1570 = _1446;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1574 = _1410 * _1562;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1578 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1582 = -_1564;
    float _1584 = _1582 + 1.0;
    float _1586 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1588 = _1558 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1590 = -_1572;
    float _1592 = fma(_1542, 2.0, _1590);
    float _1594 = -_1520;
    float _1596 = _1594 + 1.0;
    float _1598 = fma(_1578, -2.0, _1576);
    bool _1600 = _1560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1602 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1540);
    if (_1276)
    {
        float _1604 = _1426 ? _1584 : _1564;
        _1566 = _1604;
    }
    float _1606 = _1566;
    float _1608 = fma(_1586, _1570, -0.5);
    float _1610 = _1336 + _1588;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1614 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1574);
    float _1616 = -_120;
    float _1618 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1592);
    float _1620 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1622 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1612);
    float _1624 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1614);
    float _1626 = fma(_1602, _1608, _1618);
    float _1628 = fma(_1620, _1606, -0.5);
    float _1630 = _1620;
    if (!_1600)
    {
        _1630 = _1490;
    }
    float _1632 = _1630;
    float _1634 = _1632;
    if (!_1600)
    {
        _1492 = _1610;
    }
    float _1636 = _1492;
    bool _1638 = !_1600;
    float _1640 = _1636;
    if (!_1638)
    {
        float _1642 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1646 = _1560 + _1644;
        float _1648 = rsqrt(_1536);
        float _1650 = _1646 * _1642;
        float _1652 = _1610 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1654 = _1650 * 0.15915493667125701904296875;
        float _1656 = _1654 * 6.283185482025146484375;
        float _1658 = cos(_1656);
        float _1660 = _1654 * 6.283185482025146484375;
        float _1662 = sin(_1660);
        float _1664 = _1658 + (-1.0);
        float _1666 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1668 = fma(_1662, _1652, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1670 = fma(_1610, _1658, _1666);
        float _1672 = _1648 * _1668;
        float _1674 = fma(_1504, _1672, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1676 = fma(_1498, _1672, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1640 = _1670;
        _1634 = _1674;
        _1486 = _1676;
    }
    float _1678 = _1640;
    float _1680 = _1634;
    float _1682 = _1486;
    float _1684 = -_1336;
    float _1686 = _1684 + _1678;
    float _1688 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1622);
    float _1690 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1598);
    float _1692 = -_1328;
    float _1694 = _1692 + _1680;
    float _1696 = _1686 * _1686;
    float _1698 = -_1458;
    float _1700 = _1698 + _1682;
    float _1702 = -_1690;
    float _1704 = fma(_1688, _1428, _1702);
    float _1706 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1424);
    float _1708 = fma(_1694, _1694, _1696);
    float _1710 = -_120;
    float _1712 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1372);
    float _1714 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1716 = _1222 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1718 = fma(_1700, _1700, _1708);
    float _1720 = fma(_1706, _1628, _1712);
    float _1722 = _1224 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1724 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1726 = sqrt(_1718);
    float _1728 = _1716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1730 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1732 = _1546 + 0.5;
    float _1734 = _1624 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1736 = _1626 + 0.5;
    float _1738 = _1704 + 0.5;
    float _1740 = _1720 + 0.5;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    out.m_61.x = _1724;
    out.m_61.y = _1728;
    out.m_61.z = _1730;
    out.m_61.w = _1734;
    bool _1742 = _1726 > 0.0;
    out.m_63.x = _1740;
    out.m_63.y = _1732;
    out.m_63.z = _1736;
    out.m_63.w = _1738;
    bool _1744 = !_1742;
    float _1746 = 1.0;
    float _1748 = _1724;
    float _1750 = _1678;
    float _1752 = _1680;
    float _1754 = _1682;
    float _1756 = _1724;
    float _1758 = 1.0;
    float _1760 = 1.0;
    if (!_1744)
    {
        bool _1762 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1764 = 1.0;
        if (_1762)
        {
            float _1766 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1764 = _1766;
        }
        float _1768 = _1764;
        float _1770 = _1768;
        if (_1762)
        {
            float _1772 = _394 * _1768;
            _1746 = _1772;
        }
        float _1774 = _1746;
        float _1776 = _1774;
        float _1778 = _1774;
        if (_1762)
        {
            float _1780 = _396 * _1768;
            _1748 = _1780;
        }
        float _1782 = _1748;
        float _1784 = _1782;
        if (_1762)
        {
            float _1786 = _398 * _1768;
            _1770 = _1786;
        }
        float _1788 = _1770;
        float _1790 = _1788;
        if (!_1762)
        {
            float _1792 = _120 + 1.0;
            float _1794 = _1792;
            if (!_152)
            {
                float _1796 = _1792 * _1792;
                float _1798 = _1796 * 0.5;
                _1776 = _1798;
            }
            float _1800 = _1776;
            float _1802 = _1800;
            if (!_152)
            {
                float _1804 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1802 = _1804;
            }
            float _1806 = _1802;
            bool _1808 = !_152;
            float _1810 = _1806;
            if (!_1808)
            {
                float _1812 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1814 = log2(_1812);
                float _1816 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1818 = 1.0 + _1816;
                float _1820 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1822 = _1814 * _1792;
                float _1824 = exp2(_1822);
                float _1826 = _1820 * 0.693147182464599609375;
                float _1828 = 1.0 / _1826;
                float _1830 = 1.0 / _1818;
                float _1832 = _1824 + (-1.0);
                float _1834 = -_1832;
                float _1836 = fma(_1834, _1828, _1792);
                float _1838 = _1836 * _1830;
                float _1840 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1810 = _1840;
            }
            float _1842 = _1810;
            float _1844 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1846 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1848 = !_152;
            if (!_1848)
            {
                float _1850 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1852 = log2(_1850);
                float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1856 = 1.0 + _1854;
                float _1858 = 1.0 / _1856;
                float _1860 = _1852 * _1792;
                float _1862 = exp2(_1860);
                float _1864 = -_1862;
                float _1866 = _1864 + 1.0;
                float _1868 = _1866 * _1858;
                _1794 = _1868;
            }
            float _1870 = _1794;
            float _1872 = fma(_1870, _156, _1846);
            float _1874 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1876 = fma(_1870, _154, _1844);
            float _1878 = -_350;
            float _1880 = _1878 + _1872;
            float _1882 = fma(_1870, _158, _1874);
            float _1884 = -_358;
            float _1886 = _1884 + _1876;
            float _1888 = _1880 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1890 = _1880 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1892 = _1880 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1894 = -_370;
            float _1896 = _1894 + _1882;
            float _1898 = fma(_1886, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1888);
            float _1900 = fma(_1886, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1890);
            float _1902 = fma(_1886, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1892);
            float _1904 = fma(_1896, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1898);
            float _1906 = fma(_1896, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1900);
            float _1908 = fma(_1896, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1902);
            _402 = _1906;
            _404 = _1904;
            _406 = _1908;
            _1778 = _1904;
            _1784 = _1906;
            _1790 = _1908;
        }
        float _1910 = _402;
        float _1912 = _404;
        float _1914 = _406;
        float _1916 = _1778;
        float _1918 = _1784;
        float _1920 = _1790;
        float _1922 = _1910 * _1910;
        float _1924 = rsqrt(_1718);
        float _1926 = fma(_1912, _1912, _1922);
        float _1928 = fma(_1914, _1914, _1926);
        float _1930 = sqrt(_1928);
        float _1932 = _1694 * _1924;
        float _1934 = _1686 * _1924;
        float _1936 = _1700 * _1924;
        bool _1938 = _1930 > 0.0;
        bool _1940 = !_1938;
        _1756 = _1918;
        _1758 = _1916;
        _1760 = _1920;
        if (!_1940)
        {
            float _1942 = rsqrt(_1928);
            float _1944 = _1942 * _1910;
            float _1946 = _1942 * _1912;
            float _1948 = _1942 * _1914;
            float _1950 = _1934 * _1944;
            float _1952 = fma(_1932, _1946, _1950);
            float _1954 = fma(_1936, _1948, _1952);
            float _1956 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1958 = fma(_1916, _1956, _1680);
            float _1960 = fma(_1918, _1956, _1678);
            float _1962 = fma(_1920, _1956, _1682);
            _1750 = _1960;
            _1752 = _1958;
            _1754 = _1962;
        }
    }
    float _1964 = _1750;
    float _1966 = _1752;
    float _1968 = _1754;
    float _1970 = _1756;
    float _1972 = _1758;
    float _1974 = _1760;
    float _1976 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1978 = _1964 + _1976;
    float _1980 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1982 = _1966 + _1980;
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1986 = _1968 + _1984;
    float _1988 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1990 = _1978 * _1978;
    float _1992 = fma(_1982, _1982, _1990);
    float _1994 = fma(_1986, _1986, _1992);
    float _1996 = rsqrt(_1994);
    float _1998 = sqrt(_1994);
    float _2000 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2002 = _1982 * _2000;
    float _2004 = _1986 * _2000;
    float _2006 = _2002 * _2002;
    float _2008 = _2004 * _2004;
    float _2010 = _2006 + _2008;
    float _2012 = sqrt(_2010);
    bool _2014 = _2012 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2016 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2018 = _2012 + _2016;
    float _2020 = _1996;
    float _2022 = _1972;
    float _2024 = _2018;
    float _2026 = _1970;
    float _2028 = _1978;
    float _2030 = _1974;
    float _2032 = _2000;
    if (_2014)
    {
        float _2034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2020 = _2034;
    }
    float _2036 = _2020;
    if (_2014)
    {
        float _2038 = rsqrt(_2010);
        _2022 = _2038;
    }
    float _2040 = _2022;
    float _2042 = _2040;
    if (_2014)
    {
        float _2044 = _2018 * _2036;
        _2024 = _2044;
    }
    float _2046 = _2024;
    if (_2014)
    {
        float _2048 = _2046 * 0.15915493667125701904296875;
        _2026 = _2048;
    }
    float _2050 = _2026;
    float _2052 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2054 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2052);
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = _2036;
    if (_2014)
    {
        float _2060 = _2050 * 6.283185482025146484375;
        float _2062 = sin(_2060);
        _2058 = _2062;
    }
    float _2064 = _2058;
    float _2066 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2068 = precise::max(0.0, _2066);
    float _2070 = _1986;
    float _2072 = _2068;
    if (_2014)
    {
        float _2074 = _2050 * 6.283185482025146484375;
        float _2076 = cos(_2074);
        _2070 = _2076;
    }
    float _2078 = _2070;
    float _2080 = -_2000;
    float _2082 = -_2068;
    float _2084 = fma(_1978, _2080, _2082);
    if (!_2014)
    {
        _2028 = _2004;
    }
    float _2086 = _2028;
    float _2088 = _2086;
    if (_2014)
    {
        float _2090 = _2084 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2072 = _2090;
    }
    float _2092 = _2072;
    float _2094 = _2064;
    float _2096 = _2092;
    if (_2014)
    {
        float _2098 = fma(_2064, _2092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2030 = _2098;
    }
    float _2100 = _2030;
    float _2102 = _2100;
    if (!_2014)
    {
        _2094 = _2002;
    }
    float _2104 = _2094;
    float _2106 = _2104;
    float _2108 = _2078;
    if (_2014)
    {
        float _2110 = _2078 + (-1.0);
        _2096 = _2110;
    }
    float _2112 = _2096;
    float _2114 = _2112;
    if (_2014)
    {
        float _2116 = _2040 * _2100;
        _2102 = _2116;
    }
    float _2118 = _2102;
    if (!_2014)
    {
        _2042 = _2084;
    }
    float _2120 = _2042;
    float _2122 = _2120;
    if (_2014)
    {
        float _2124 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2032 = _2124;
    }
    float _2126 = _2032;
    if (_2014)
    {
        float _2128 = _2002 * _2118;
        _2106 = _2128;
    }
    float _2130 = _2106;
    if (!_2014)
    {
        _2114 = _2006;
    }
    float _2132 = _2114;
    float _2134 = _2132;
    if (_2014)
    {
        float _2136 = _2004 * _2118;
        _2088 = _2136;
    }
    float _2138 = _2088;
    if (_2014)
    {
        float _2140 = fma(_2084, _2078, _2126);
        _2122 = _2140;
    }
    float _2142 = _2122;
    float _2144 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_2014)
    {
        float _2146 = _2130 * _2130;
        _2134 = _2146;
    }
    float _2148 = _2134;
    if (!_2014)
    {
        _2108 = _2008;
    }
    float _2150 = _2108;
    float _2152 = _2150;
    if (_2014)
    {
        float _2154 = _2138 * _2138;
        _2152 = _2154;
    }
    float _2156 = _2152;
    float _2158 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2144);
    float _2160 = fma(_2142, _2142, _2148);
    float _2162 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2164 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2166 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2158);
    float _2168 = _2160 + _2156;
    float _2170 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2162);
    float _2172 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2164);
    float _2174 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2176 = -_2056;
    float _2178 = _2176 + 1.0;
    float _2180 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2170);
    float _2182 = rsqrt(_2168);
    float _2184 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2172);
    float _2186 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2174);
    float _2188 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2190 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2192 = _2166 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2194 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2196 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2186);
    float _2198 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2200 = abs(_2178);
    float _2202 = log2(_2200);
    float _2204 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2194);
    float _2206 = _2196 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2208 = -_2198;
    float _2210 = fma(_2208, _1988, 1.0);
    float _2212 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2204);
    float _2214 = _2182 * _2130;
    float _2216 = _2182 * _2142;
    float _2218 = _2182 * _2138;
    float _2220 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2212);
    float _2222 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2224 = log2(_2210);
    float _2226 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2228 = _2216 + 1.0;
    float _2230 = -_2222;
    float _2232 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2230);
    float _2234 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2236 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2226);
    float _2238 = -_2218;
    float _2240 = fma(_2238, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2232);
    float _2242 = 1.0 / _2220;
    float _2244 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2246 = fma(_2240, -0.5, 0.5);
    float _2248 = fma(_2240, 0.5, 0.5);
    float _2250 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2244);
    float _2252 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2236);
    float _2254 = exp2(_2234);
    float _2256 = fma(_2248, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2258 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2250);
    float _2260 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2252);
    float _2262 = _2224 * 0.693147182464599609375;
    float _2264 = fma(_2248, _2256, -0.212114393711090087890625);
    float _2266 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2258);
    float _2268 = sqrt(_2246);
    float _2270 = fma(_2248, _2264, 1.570728778839111328125);
    float _2272 = _2266 * _2242;
    float _2274 = _2260 * _2242;
    float _2276 = _2262 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2278 = fma(_2272, 0.5, 0.5);
    float _2280 = fma(_2274, -0.5, 0.5);
    float _2282 = -_2216;
    float _2284 = fma(_2254, _2228, _2282);
    float _2286 = fma(_2284, 0.5, 0.5);
    float _2288 = _2268 * 0.636619746685028076171875;
    float _2290 = -_2270;
    float _2292 = fma(_2288, _2290, 1.0);
    float3 _6158 = float3(_2278, _2280, _2276);
    float _2294 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6158, float3(0.0), isnan(_6158)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6158, float3(0.0), isnan(_6158)), level(0.0)).x;
    float3 _6169 = float3(_2278, _2280, _2276);
    float4 _2297 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6169, float3(0.0), isnan(_6169)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6169, float3(0.0), isnan(_6169)), level(0.0)).xyzw;
    float _2299 = _2297.x;
    float _2301 = _2297.y;
    float _2303 = _2297.z;
    float _2305 = _2297.w;
    float2 _6186 = float2(_2292, _2286);
    float3 _2309 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6186, float2(0.0), isnan(_6186)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6186, float2(0.0), isnan(_6186)), level(0.0)).xyz;
    float _2311 = _2309.x;
    float _2313 = _2309.y;
    float _2315 = _2309.z;
    float _2317 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2319 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2321 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2323 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2325 = isnan(0.5);
    bool _2327 = _2323 || _2325;
    bool _2329 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2331 = _2327 || _2329;
    float _2333 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2317);
    float _2335 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2319);
    float _2337 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2333);
    float _2339 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2335);
    float _2341 = _2337 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2343 = _2339 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2345 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2347 = 1.0 / _2341;
    float _2349 = _2343 + _2341;
    float _2351 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2345);
    float _2353 = _2192;
    float _2355 = _2206;
    if (_2331)
    {
        _2353 = 1.0;
    }
    float _2357 = _2353;
    float _2359 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2351);
    float _2361 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2359);
    float _2363 = _2357;
    if (_2331)
    {
        _2355 = 1.0;
    }
    float _2365 = _2355;
    float _2367 = _2349 * _2347;
    float _2369 = _2367 * 0.5;
    float _2371 = exp2(_2321);
    float _2373 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2375 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2373);
    float _2377 = 1.0 / _2375;
    float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2381 = _2377 * _2379;
    float _2383 = _2365;
    if (!_2331)
    {
        float _2385 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2387 = _2385 * 0.15915493667125701904296875;
        float _2389 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2391 = _2387 * 6.283185482025146484375;
        float _2393 = cos(_2391);
        float _2395 = _2389 * 0.15915493667125701904296875;
        float _2397 = _2387 * 6.283185482025146484375;
        float _2399 = sin(_2397);
        float _2401 = 1.0 / _2393;
        float _2403 = _2395 * 6.283185482025146484375;
        float _2405 = cos(_2403);
        float _2407 = _2399 * _2401;
        float _2409 = _2395 * 6.283185482025146484375;
        float _2411 = sin(_2409);
        float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2415 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2413;
        float _2417 = _2405 * _2407;
        float _2419 = 1.0 / _2415;
        float _2421 = 1.0 / _2417;
        float _2423 = _2411 * _2421;
        float _2425 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2427 = fma(_2381, _2423, _2425);
        float _2429 = _2427 * _2419;
        float _2431 = precise::clamp(_2429, 0.0, 1.0);
        _2383 = _2431;
    }
    float _2433 = _2383;
    if (!_2331)
    {
        float _2435 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2437 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2439 = _2435 * 0.15915493667125701904296875;
        float _2441 = _2437 * 0.15915493667125701904296875;
        float _2443 = _2439 * 6.283185482025146484375;
        float _2445 = cos(_2443);
        float _2447 = _2439 * 6.283185482025146484375;
        float _2449 = sin(_2447);
        float _2451 = 1.0 / _2445;
        float _2453 = _2441 * 6.283185482025146484375;
        float _2455 = cos(_2453);
        float _2457 = _2449 * _2451;
        float _2459 = _2441 * 6.283185482025146484375;
        float _2461 = sin(_2459);
        float _2463 = _2455 * _2457;
        float _2465 = 1.0 / _2463;
        float _2467 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2469 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2467;
        float _2471 = 1.0 / _2469;
        float _2473 = _2461 * _2465;
        float _2475 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2477 = fma(_2381, _2473, _2475);
        float _2479 = _2477 * _2471;
        float _2481 = precise::clamp(_2479, 0.0, 1.0);
        float _2483 = -_2481;
        float _2485 = _2483 + 1.0;
        _2363 = _2485;
    }
    float _2487 = _2363;
    float _2489 = -_2371;
    float _2491 = _2489 + 1.0;
    float _2493 = _2433 * _2487;
    bool _2495 = _2433 > 0.0;
    bool _2497 = isnan(_2433);
    bool _2499 = _2495 || _2497;
    bool _2501 = isnan(0.0);
    bool _2503 = _2499 || _2501;
    float _2505 = _2361 + _2220;
    float _2507 = _2491 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2509 = _2493 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2511 = _2487 <= 0.0;
    bool _2513 = !_2503;
    bool _2515 = _2511 || _2513;
    float _2517 = _2505 * 0.5;
    float _2519 = _2507 * _2294;
    float _2521 = -_2507;
    float _2523 = _2521 + 1.0;
    float _2525 = _2305 * _2519;
    float _2527 = _2315 * _2519;
    out.gl_Position.x = _2266;
    out.gl_Position.y = _2260;
    out.gl_Position.z = _2361;
    out.gl_Position.w = _2220;
    float _2529 = _2509 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2531 = fma(_2311, _2525, _2299);
    float _2533 = fma(_2313, _2525, _2301);
    float _2535 = _2305 * _2523;
    float _2537 = fma(_2305, _2527, _2303);
    out.m_65.z = _2517;
    out.m_65.w = _2220;
    out.m_45.x = _2529;
    out.m_67.x = _2531;
    out.m_67.y = _2533;
    out.m_67.z = _2537;
    out.m_67.w = _2535;
    if (!_2515)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2539 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2539;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1246 = false;
    bool _970 = false;
    bool _828 = false;
    bool _552 = false;
    bool _426 = false;
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
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2596 = as_type<float>(_102);
        out.gl_Position.z = _2596;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _96 = _122;
    }
    float _124 = _96;
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
        float _2665 = as_type<float>(_138);
        out.gl_Position.z = _2665;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _184 = 0.0;
    float _186 = _180;
    float _188 = 0.0;
    if (!_182)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _142 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _142);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _208;
        _186 = _218;
        _188 = _206;
    }
    float _220 = _184;
    float _222 = _186;
    float _224 = _188;
    bool _226 = !_152;
    float _228 = _220;
    float _230 = _224;
    if (!_226)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _142 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _228 = _244;
        _230 = _238;
        _168 = _250;
    }
    float _252 = _228;
    float _254 = _230;
    float _256 = _168;
    float _258 = _252;
    float _260 = _254;
    if (!_152)
    {
        float _262 = _120 * _120;
        float _264 = _262 * 0.5;
        _258 = _264;
    }
    float _266 = _258;
    float _268 = _266;
    if (!_152)
    {
        _260 = _120;
    }
    float _270 = _260;
    float _272 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _274 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _276 = _270;
    if (!_152)
    {
        float _278 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _278;
    }
    float _280 = _268;
    bool _282 = !_152;
    float _284 = _280;
    if (!_282)
    {
        float _286 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = log2(_286);
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _120 * _288;
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = 1.0 / _296;
        float _300 = _290 * 0.693147182464599609375;
        float _302 = exp2(_292);
        float _304 = 1.0 / _300;
        float _306 = _302 + (-1.0);
        float _308 = -_306;
        float _310 = fma(_308, _304, _120);
        float _312 = _310 * _298;
        float _314 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _284 = _314;
    }
    float _316 = _284;
    bool _318 = !_152;
    if (!_318)
    {
        float _320 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = log2(_320);
        float _324 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _326 = _324 + 1.0;
        float _328 = 1.0 / _326;
        float _330 = _120 * _322;
        float _332 = exp2(_330);
        float _334 = -_332;
        float _336 = _334 + 1.0;
        float _338 = _336 * _328;
        _276 = _338;
    }
    float _340 = _276;
    float _342 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _344 = fma(_256, _156, _274);
    float _346 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _348 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _350 = fma(_340, _156, _342);
    float _352 = fma(_256, _154, _272);
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _356 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _358 = fma(_340, _154, _346);
    float _360 = fma(_344, _140, _162);
    float _362 = -_350;
    float _364 = _344 + _362;
    float _366 = fma(_256, _158, _348);
    float _368 = fma(_352, _140, _160);
    float _370 = fma(_340, _158, _356);
    float _372 = -_358;
    float _374 = _352 + _372;
    float _376 = _364 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _378 = _364 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _380 = _364 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = -_370;
    float _384 = _366 + _382;
    float _386 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].x, _376);
    float _388 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].x, _378);
    float _390 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _392 = fma(_366, _140, _164);
    float _394 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[4].z, _386);
    float _396 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[5].z, _388);
    float _398 = fma(_384, (*spvDescriptorSet0.vp_c10)._m0[6].z, _390);
    bool _400 = !_354;
    float _402 = _396;
    float _404 = _394;
    float _406 = _398;
    float _424;
    if (!_400)
    {
        float _408 = in.m_51.x;
        float _410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _412 = _408 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _414 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _416 = _414 * _410;
        float _418 = floor(_416);
        float _420 = -_418;
        float _422 = _416 + _420;
        _424 = _422;
        _426 = true;
    }
    else
    {
        float _428 = float(_86);
        float _430 = 1.0 / _428;
        float _432 = _120 * _430;
        _424 = _432;
    }
    _426 = false;
    float _434 = _424;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _438 = _434 + _436;
    bool _440 = _434 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _442 = isnan(_434);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _452;
    float _456 = 1.0 / _454;
    bool _458 = _434 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _460 = isnan(_434);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -_450;
    float _472 = _470 + 1.0;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _478;
    bool _482 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _484;
    float _488 = _468 * _472;
    float _490 = -_468;
    float _492 = _490 + 1.0;
    float _494 = _438 * _456;
    float _496 = in.m_49.x;
    float _498 = in.m_49.y;
    float _500 = in.m_49.z;
    float _502 = fma(_476, _494, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _504 = fma(_486, _494, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _506 = fma(_480, _494, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _508 = _502 * _488;
    float _510 = _504 * _488;
    float _512 = _506 * _488;
    float _514 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].x, _508);
    float _516 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].y, _510);
    float _518 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[143].z, _512);
    float _520 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[144].x, _514);
    float _522 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[144].y, _516);
    float _524 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[144].z, _518);
    float _526 = _522 * _498;
    float _528 = _520 * _496;
    float _530 = _524 * _500;
    bool _532 = !_482;
    float _550;
    if (!_532)
    {
        float _534 = in.m_51.x;
        float _536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _538 = _534 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _542 = _540 * _536;
        float _544 = floor(_542);
        float _546 = -_544;
        float _548 = _542 + _546;
        _550 = _548;
        _552 = true;
    }
    else
    {
        float _554 = float(_86);
        float _556 = 1.0 / _554;
        float _558 = _120 * _556;
        _550 = _558;
    }
    _552 = false;
    float _560 = _550;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _564 = _560 + _562;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _568 = _560 + _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _572 = _560 + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _590 = 1.0 / _580;
    bool _592 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _594 = isnan(_560);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = 1.0 / _584;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _606;
    bool _610 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _612 = 1.0 / _588;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _616 = _560 + _614;
    float _618 = 1.0 / _576;
    float _620 = _616 * _590;
    bool _622 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _624 = isnan(_560);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = _564 * _604;
    bool _636 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _638 = isnan(_560);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_632;
    float _650 = _648 + 1.0;
    float _652 = _568 * _612;
    bool _654 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _656 = isnan(_560);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = fma(_608, _634, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _668 = _646 * _650;
    float _670 = -_646;
    float _672 = _670 + 1.0;
    float _674 = -_664;
    float _676 = _674 + 1.0;
    float _678 = _572 * _618;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _684;
    float _688 = fma(_682, _634, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _690 = fma(_686, _634, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _692 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _694 = isnan(_560);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = _664 * _672;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _718 = _702 * _676;
    float _720 = -_702;
    float _722 = _720 + 1.0;
    float _724 = fma(_708, _652, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _726 = fma(_716, _652, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _728 = fma(_712, _652, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _730 = _602 * _722;
    float _732 = -_602;
    float _734 = _732 + 1.0;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _736;
    float _740 = _688 * _730;
    float _742 = _690 * _730;
    float _744 = _666 * _730;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _750;
    float _754 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].x, _740);
    float _756 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].y, _742);
    float _758 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[107].z, _744);
    float _760 = fma(_748, _678, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _762 = fma(_752, _678, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _764 = fma(_738, _678, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _766 = fma(_724, _718, _754);
    float _768 = fma(_728, _718, _758);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _776 = _774 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _778 = fma(_726, _718, _756);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _784 = fma(_760, _704, _766);
    float _786 = fma(_772, _620, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _788 = fma(_776, _620, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _790 = fma(_782, _620, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _792 = fma(_762, _704, _778);
    float _794 = fma(_764, _704, _768);
    float _796 = fma(_786, _668, _784);
    float _798 = fma(_788, _668, _792);
    float _800 = fma(_790, _668, _794);
    float _802 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[111].x, _796);
    float _804 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[111].y, _798);
    float _806 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[111].z, _800);
    bool _808 = !_610;
    float _826;
    if (!_808)
    {
        float _810 = in.m_51.x;
        float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _814 = _810 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _818 = _816 * _812;
        float _820 = floor(_818);
        float _822 = -_820;
        float _824 = _818 + _822;
        _826 = _824;
        _828 = true;
    }
    else
    {
        float _830 = float(_86);
        float _832 = 1.0 / _830;
        float _834 = _120 * _832;
        _826 = _834;
    }
    _828 = false;
    float _836 = _826;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _836 + _838;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _846 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _848 = isnan(_836);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _862 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _864 = isnan(_836);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _874;
    bool _878 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _880 = isnan(_836);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = 1.0 / _844;
    float _892 = -_856;
    float _894 = _892 + 1.0;
    bool _896 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _898 = _872 * _894;
    float _900 = -_872;
    float _902 = _900 + 1.0;
    float _904 = 1.0 / _860;
    float _906 = _876 * _890;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _912 = fma(_906, _840, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _914 = _806 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _916 = _910 * _904;
    float _918 = _912 * _898;
    float _920 = -_888;
    float _922 = _920 + 1.0;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _926 = _836 + _924;
    float _928 = _802 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _930 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[115].x, _918);
    float _932 = _856 * _922;
    float _934 = fma(_916, _926, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _936 = _804 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _938 = _928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = fma(_934, _932, _930);
    float _942 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[117].x, _940);
    float _944 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _946 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _942 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _938;
    out.m_53.y = _944;
    out.m_53.z = _946;
    out.m_53.w = _948;
    bool _950 = !_896;
    float _968;
    if (!_950)
    {
        float _952 = in.m_51.x;
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _956 = _952 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _960 = _958 * _954;
        float _962 = floor(_960);
        float _964 = -_962;
        float _966 = _960 + _964;
        _968 = _966;
        _970 = true;
    }
    else
    {
        float _972 = float(_86);
        float _974 = 1.0 / _972;
        float _976 = _120 * _974;
        _968 = _976;
    }
    _970 = false;
    float _978 = _968;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _982 = _978 + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _986 = _978 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _990 = _978 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _992;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1008 = 1.0 / _994;
    bool _1010 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1012 = isnan(_978);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = 1.0 / _998;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1026 = _978 + _1024;
    float _1028 = 1.0 / _1002;
    float _1030 = _990 * _1008;
    bool _1032 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1034 = isnan(_978);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    bool _1044 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1046 = 1.0 / _1006;
    float _1048 = _982 * _1022;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1050;
    float _1054 = fma(_1052, _1030, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1056 = _986 * _1028;
    bool _1058 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1060 = isnan(_978);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1066 = _1062 || _1064;
    float _1068 = float(_1066);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1072 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1074;
    float _1078 = -_1068;
    float _1080 = _1078 + 1.0;
    float _1082 = fma(_1072, _1030, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1084 = _1026 * _1046;
    bool _1086 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1088 = isnan(_978);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1094 = _1090 || _1092;
    float _1096 = float(_1094);
    float _1098 = fma(_1076, _1030, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1100 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1102 = isnan(_978);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = _1042 * _1080;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1118 = -_1096;
    float _1120 = _1118 + 1.0;
    float _1122 = -_1042;
    float _1124 = _1122 + 1.0;
    float _1126 = fma(_1116, _1048, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1128 = _1110 * _1120;
    float _1130 = -_1110;
    float _1132 = _1130 + 1.0;
    float _1134 = _1096 * _1124;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1144 = _1020 * _1132;
    float _1146 = fma(_1138, _1048, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1148 = fma(_1142, _1048, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1150 = _1082 * _1144;
    float _1152 = _1054 * _1144;
    float _1154 = -_1020;
    float _1156 = _1154 + 1.0;
    float _1158 = _1098 * _1144;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1168;
    float _1172 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1152);
    float _1174 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1150);
    float _1176 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1158);
    float _1178 = fma(_1162, _1056, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1180 = fma(_1166, _1056, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1182 = fma(_1170, _1056, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1184 = fma(_1146, _1128, _1172);
    float _1186 = fma(_1148, _1128, _1174);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1196 = fma(_1126, _1128, _1176);
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1202 = fma(_1178, _1134, _1184);
    float _1204 = fma(_1190, _1084, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1206 = fma(_1194, _1084, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1208 = fma(_1180, _1134, _1186);
    float _1210 = fma(_1200, _1084, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1212 = fma(_1182, _1134, _1196);
    float _1214 = fma(_1204, _1112, _1202);
    float _1216 = fma(_1206, _1112, _1208);
    float _1218 = fma(_1210, _1112, _1212);
    float _1220 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1214);
    float _1222 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1216);
    float _1224 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1218);
    bool _1226 = !_1044;
    float _1244;
    if (!_1226)
    {
        float _1228 = in.m_51.x;
        float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1232 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1234 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _1236 = _1234 * _1230;
        float _1238 = floor(_1236);
        float _1240 = -_1238;
        float _1242 = _1236 + _1240;
        _1244 = _1242;
        _1246 = true;
    }
    else
    {
        float _1248 = float(_86);
        float _1250 = 1.0 / _1248;
        float _1252 = _120 * _1250;
        _1244 = _1252;
    }
    _1246 = false;
    float _1254 = _1244;
    float _1256 = in.m_51.w;
    float _1258 = _360 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1260 = _360 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1262 = in.m_55.x;
    float _1264 = in.m_55.y;
    float _1266 = in.m_55.z;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1270 = _1268 != 0;
    float _1272 = _360 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1276 = _1274 != 0;
    float _1278 = in.m_57.y;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1282 = _1280 != 0;
    float _1284 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1272);
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1288 = _1286 != 0;
    float _1290 = in.m_51.x;
    float _1292 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1258);
    float _1294 = fma(_368, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1260);
    float _1296 = in.m_51.y;
    float _1298 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1300 = in.m_57.x;
    float _1302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1304 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1292);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1308 = _1254 + _1306;
    bool _1310 = _1256 > 0.5;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1314 = _1212;
    float _1316 = _1302;
    bool _1318 = _1310;
    float _1320 = _1294;
    if (_1270)
    {
        float _1322 = in.m_51.z;
        _1314 = _1322;
    }
    float _1324 = _1314;
    float _1326 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1294);
    float _1328 = _1304 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1332 = _1330 != 0;
    float _1334 = _1298 * _1278;
    float _1336 = _1326 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1264);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1342 = _1340 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1262);
    float _1346 = -_1278;
    float _1348 = _1346 + 1.0;
    float _1350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1266);
    float _1352 = 1.0 / _1342;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1356 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1358 = _1278;
    float _1360 = _1334;
    if (_1282)
    {
        float _1362 = _1310 ? _1348 : _1278;
        _1358 = _1362;
    }
    float _1364 = _1358;
    float _1366 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1368 = _1296 > 0.5;
    float _1370 = -_1354;
    float _1372 = fma(_1356, 2.0, _1370);
    float _1374 = fma(_1366, -2.0, _1312);
    float _1376 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1378 = _1298 * _1338;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1380;
    float _1384 = -_1334;
    float _1386 = _1384 + 1.0;
    float _1388 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1284);
    float _1390 = _1338;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1332)
    {
        float _1394 = in.m_51.z;
        _1390 = _1394;
    }
    float _1396 = _1390;
    float _1398 = _1382 * _1352;
    float _1400 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1402 = _1400;
    if (_1288)
    {
        float _1404 = _1368 ? _1386 : _1334;
        _1360 = _1404;
    }
    float _1406 = _1360;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1410 = fma(_1398, _1308, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1412 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1414 = _1376 * _1350;
    if (!_1332)
    {
        _1392 = _1296;
    }
    float _1416 = _1392;
    float _1418 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1420 = _1416;
    if (!_1270)
    {
        _1316 = _1300;
    }
    float _1422 = _1316;
    float _1424 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1408);
    bool _1426 = _1290 > 0.5;
    float _1428 = fma(_1400, _1364, -0.5);
    float _1430 = _1422;
    if (_1332)
    {
        _1420 = _1290;
    }
    float _1432 = _1420;
    float _1434 = _1412 * _1344;
    float _1436 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1438 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1440 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (!_1270)
    {
        _1402 = _1422;
    }
    float _1442 = _1402;
    float _1444 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1436);
    float _1446 = _1442;
    if (_1270)
    {
        _1430 = _1300;
    }
    float _1448 = _1430;
    float _1450 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1438);
    float _1452 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1440);
    if (_1270)
    {
        bool _1454 = _1324 > 0.5;
        _1318 = _1454;
    }
    bool _1456 = _1318;
    float _1458 = _1388 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1460 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1452);
    float _1462 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1444);
    float _1464 = _1418 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1466 = _1396;
    if (!_1332)
    {
        _1320 = _1396;
    }
    float _1468 = _1320;
    float _1470 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1474 = _1462 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1476 = fma(_1464, _1406, -0.5);
    float _1478 = _1458 + _1470;
    float _1480 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1472);
    float _1482 = _1468;
    int _1484 = as_type<int>(_1476);
    float _1486 = _1478;
    if (_1332)
    {
        _1482 = _1296;
    }
    float _1488 = _1482;
    float _1490 = _1328 + _1474;
    float _1492 = _1490;
    if (_1332)
    {
        _1466 = _1296;
    }
    float _1494 = _1466;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1498 = _1478 + _1496;
    float _1500 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1480);
    float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1504 = _1490 + _1502;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1508 = _1498 * _1498;
    bool _1510 = _1254 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1512 = isnan(_1254);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1374);
    bool _1524 = _1254 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1526 = isnan(_1254);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1532 = _1528 || _1530;
    float _1534 = float(_1532);
    float _1536 = fma(_1504, _1504, _1508);
    float _1538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1540 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1506);
    float _1542 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1544 = -_1522;
    float _1546 = fma(_1500, _1476, _1544);
    float _1548 = -_1534;
    float _1550 = _1548 + 1.0;
    if (_1270)
    {
        float _1552 = -_1448;
        float _1554 = _1552 + 1.0;
        _1484 = as_type<int>(_1554);
    }
    int _1556 = _1484;
    float _1558 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1450);
    float _1560 = sqrt(_1536);
    float _1562 = _1520 * _1550;
    float _1564 = _1412 * _1448;
    float _1566 = _1564;
    if (_1270)
    {
        float _1568 = _1456 ? as_type<float>(_1556) : _1448;
        _1446 = _1568;
    }
    float _1570 = _1446;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1574 = _1410 * _1562;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1578 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1582 = -_1564;
    float _1584 = _1582 + 1.0;
    float _1586 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1588 = _1558 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1590 = -_1572;
    float _1592 = fma(_1542, 2.0, _1590);
    float _1594 = -_1520;
    float _1596 = _1594 + 1.0;
    float _1598 = fma(_1578, -2.0, _1576);
    bool _1600 = _1560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1602 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1540);
    if (_1276)
    {
        float _1604 = _1426 ? _1584 : _1564;
        _1566 = _1604;
    }
    float _1606 = _1566;
    float _1608 = fma(_1586, _1570, -0.5);
    float _1610 = _1336 + _1588;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1614 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1574);
    float _1616 = -_120;
    float _1618 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1592);
    float _1620 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1622 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1612);
    float _1624 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1614);
    float _1626 = fma(_1602, _1608, _1618);
    float _1628 = fma(_1620, _1606, -0.5);
    float _1630 = _1620;
    if (!_1600)
    {
        _1630 = _1490;
    }
    float _1632 = _1630;
    float _1634 = _1632;
    if (!_1600)
    {
        _1492 = _1610;
    }
    float _1636 = _1492;
    bool _1638 = !_1600;
    float _1640 = _1636;
    if (!_1638)
    {
        float _1642 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1646 = _1560 + _1644;
        float _1648 = rsqrt(_1536);
        float _1650 = _1646 * _1642;
        float _1652 = _1610 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1654 = _1650 * 0.15915493667125701904296875;
        float _1656 = _1654 * 6.283185482025146484375;
        float _1658 = cos(_1656);
        float _1660 = _1654 * 6.283185482025146484375;
        float _1662 = sin(_1660);
        float _1664 = _1658 + (-1.0);
        float _1666 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1668 = fma(_1662, _1652, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1670 = fma(_1610, _1658, _1666);
        float _1672 = _1648 * _1668;
        float _1674 = fma(_1504, _1672, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1676 = fma(_1498, _1672, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1640 = _1670;
        _1634 = _1674;
        _1486 = _1676;
    }
    float _1678 = _1640;
    float _1680 = _1634;
    float _1682 = _1486;
    float _1684 = -_1336;
    float _1686 = _1684 + _1678;
    float _1688 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1622);
    float _1690 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1598);
    float _1692 = -_1328;
    float _1694 = _1692 + _1680;
    float _1696 = _1686 * _1686;
    float _1698 = -_1458;
    float _1700 = _1698 + _1682;
    float _1702 = -_1690;
    float _1704 = fma(_1688, _1428, _1702);
    float _1706 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1424);
    float _1708 = fma(_1694, _1694, _1696);
    float _1710 = -_120;
    float _1712 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1372);
    float _1714 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1716 = _1222 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1718 = fma(_1700, _1700, _1708);
    float _1720 = fma(_1706, _1628, _1712);
    float _1722 = _1224 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1724 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1726 = sqrt(_1718);
    float _1728 = _1716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1730 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1732 = _1546 + 0.5;
    float _1734 = _1624 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1736 = _1626 + 0.5;
    float _1738 = _1704 + 0.5;
    float _1740 = _1720 + 0.5;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    out.m_61.x = _1724;
    out.m_61.y = _1728;
    out.m_61.z = _1730;
    out.m_61.w = _1734;
    bool _1742 = _1726 > 0.0;
    out.m_63.x = _1740;
    out.m_63.y = _1732;
    out.m_63.z = _1736;
    out.m_63.w = _1738;
    bool _1744 = !_1742;
    float _1746 = 1.0;
    float _1748 = _1724;
    float _1750 = _1678;
    float _1752 = _1680;
    float _1754 = _1682;
    float _1756 = _1724;
    float _1758 = 1.0;
    float _1760 = 1.0;
    if (!_1744)
    {
        bool _1762 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1764 = 1.0;
        if (_1762)
        {
            float _1766 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1764 = _1766;
        }
        float _1768 = _1764;
        float _1770 = _1768;
        if (_1762)
        {
            float _1772 = _394 * _1768;
            _1746 = _1772;
        }
        float _1774 = _1746;
        float _1776 = _1774;
        float _1778 = _1774;
        if (_1762)
        {
            float _1780 = _396 * _1768;
            _1748 = _1780;
        }
        float _1782 = _1748;
        float _1784 = _1782;
        if (_1762)
        {
            float _1786 = _398 * _1768;
            _1770 = _1786;
        }
        float _1788 = _1770;
        float _1790 = _1788;
        if (!_1762)
        {
            float _1792 = _120 + 1.0;
            float _1794 = _1792;
            if (!_152)
            {
                float _1796 = _1792 * _1792;
                float _1798 = _1796 * 0.5;
                _1776 = _1798;
            }
            float _1800 = _1776;
            float _1802 = _1800;
            if (!_152)
            {
                float _1804 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1802 = _1804;
            }
            float _1806 = _1802;
            bool _1808 = !_152;
            float _1810 = _1806;
            if (!_1808)
            {
                float _1812 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1814 = log2(_1812);
                float _1816 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1818 = 1.0 + _1816;
                float _1820 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1822 = _1814 * _1792;
                float _1824 = exp2(_1822);
                float _1826 = _1820 * 0.693147182464599609375;
                float _1828 = 1.0 / _1826;
                float _1830 = 1.0 / _1818;
                float _1832 = _1824 + (-1.0);
                float _1834 = -_1832;
                float _1836 = fma(_1834, _1828, _1792);
                float _1838 = _1836 * _1830;
                float _1840 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1810 = _1840;
            }
            float _1842 = _1810;
            float _1844 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1846 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1848 = !_152;
            if (!_1848)
            {
                float _1850 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1852 = log2(_1850);
                float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1856 = 1.0 + _1854;
                float _1858 = 1.0 / _1856;
                float _1860 = _1852 * _1792;
                float _1862 = exp2(_1860);
                float _1864 = -_1862;
                float _1866 = _1864 + 1.0;
                float _1868 = _1866 * _1858;
                _1794 = _1868;
            }
            float _1870 = _1794;
            float _1872 = fma(_1870, _156, _1846);
            float _1874 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1876 = fma(_1870, _154, _1844);
            float _1878 = -_350;
            float _1880 = _1878 + _1872;
            float _1882 = fma(_1870, _158, _1874);
            float _1884 = -_358;
            float _1886 = _1884 + _1876;
            float _1888 = _1880 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1890 = _1880 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1892 = _1880 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1894 = -_370;
            float _1896 = _1894 + _1882;
            float _1898 = fma(_1886, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1888);
            float _1900 = fma(_1886, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1890);
            float _1902 = fma(_1886, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1892);
            float _1904 = fma(_1896, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1898);
            float _1906 = fma(_1896, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1900);
            float _1908 = fma(_1896, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1902);
            _402 = _1906;
            _404 = _1904;
            _406 = _1908;
            _1778 = _1904;
            _1784 = _1906;
            _1790 = _1908;
        }
        float _1910 = _402;
        float _1912 = _404;
        float _1914 = _406;
        float _1916 = _1778;
        float _1918 = _1784;
        float _1920 = _1790;
        float _1922 = _1910 * _1910;
        float _1924 = rsqrt(_1718);
        float _1926 = fma(_1912, _1912, _1922);
        float _1928 = fma(_1914, _1914, _1926);
        float _1930 = sqrt(_1928);
        float _1932 = _1694 * _1924;
        float _1934 = _1686 * _1924;
        float _1936 = _1700 * _1924;
        bool _1938 = _1930 > 0.0;
        bool _1940 = !_1938;
        _1756 = _1918;
        _1758 = _1916;
        _1760 = _1920;
        if (!_1940)
        {
            float _1942 = rsqrt(_1928);
            float _1944 = _1942 * _1910;
            float _1946 = _1942 * _1912;
            float _1948 = _1942 * _1914;
            float _1950 = _1934 * _1944;
            float _1952 = fma(_1932, _1946, _1950);
            float _1954 = fma(_1936, _1948, _1952);
            float _1956 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1958 = fma(_1916, _1956, _1680);
            float _1960 = fma(_1918, _1956, _1678);
            float _1962 = fma(_1920, _1956, _1682);
            _1750 = _1960;
            _1752 = _1958;
            _1754 = _1962;
        }
    }
    float _1964 = _1750;
    float _1966 = _1752;
    float _1968 = _1754;
    float _1970 = _1756;
    float _1972 = _1758;
    float _1974 = _1760;
    float _1976 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1978 = _1964 + _1976;
    float _1980 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1982 = _1966 + _1980;
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1986 = _1968 + _1984;
    float _1988 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1990 = _1978 * _1978;
    float _1992 = fma(_1982, _1982, _1990);
    float _1994 = fma(_1986, _1986, _1992);
    float _1996 = rsqrt(_1994);
    float _1998 = sqrt(_1994);
    float _2000 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2002 = _1982 * _2000;
    float _2004 = _1986 * _2000;
    float _2006 = _2002 * _2002;
    float _2008 = _2004 * _2004;
    float _2010 = _2006 + _2008;
    float _2012 = sqrt(_2010);
    bool _2014 = _2012 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2016 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2018 = _2012 + _2016;
    float _2020 = _1996;
    float _2022 = _1972;
    float _2024 = _2018;
    float _2026 = _1970;
    float _2028 = _1978;
    float _2030 = _1974;
    float _2032 = _2000;
    if (_2014)
    {
        float _2034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2020 = _2034;
    }
    float _2036 = _2020;
    if (_2014)
    {
        float _2038 = rsqrt(_2010);
        _2022 = _2038;
    }
    float _2040 = _2022;
    float _2042 = _2040;
    if (_2014)
    {
        float _2044 = _2018 * _2036;
        _2024 = _2044;
    }
    float _2046 = _2024;
    if (_2014)
    {
        float _2048 = _2046 * 0.15915493667125701904296875;
        _2026 = _2048;
    }
    float _2050 = _2026;
    float _2052 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2054 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2052);
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = _2036;
    if (_2014)
    {
        float _2060 = _2050 * 6.283185482025146484375;
        float _2062 = sin(_2060);
        _2058 = _2062;
    }
    float _2064 = _2058;
    float _2066 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2068 = precise::max(0.0, _2066);
    float _2070 = _1986;
    float _2072 = _2068;
    if (_2014)
    {
        float _2074 = _2050 * 6.283185482025146484375;
        float _2076 = cos(_2074);
        _2070 = _2076;
    }
    float _2078 = _2070;
    float _2080 = -_2000;
    float _2082 = -_2068;
    float _2084 = fma(_1978, _2080, _2082);
    if (!_2014)
    {
        _2028 = _2004;
    }
    float _2086 = _2028;
    float _2088 = _2086;
    if (_2014)
    {
        float _2090 = _2084 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2072 = _2090;
    }
    float _2092 = _2072;
    float _2094 = _2064;
    float _2096 = _2092;
    if (_2014)
    {
        float _2098 = fma(_2064, _2092, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2030 = _2098;
    }
    float _2100 = _2030;
    float _2102 = _2100;
    if (!_2014)
    {
        _2094 = _2002;
    }
    float _2104 = _2094;
    float _2106 = _2104;
    float _2108 = _2078;
    if (_2014)
    {
        float _2110 = _2078 + (-1.0);
        _2096 = _2110;
    }
    float _2112 = _2096;
    float _2114 = _2112;
    if (_2014)
    {
        float _2116 = _2040 * _2100;
        _2102 = _2116;
    }
    float _2118 = _2102;
    if (!_2014)
    {
        _2042 = _2084;
    }
    float _2120 = _2042;
    float _2122 = _2120;
    if (_2014)
    {
        float _2124 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2032 = _2124;
    }
    float _2126 = _2032;
    if (_2014)
    {
        float _2128 = _2002 * _2118;
        _2106 = _2128;
    }
    float _2130 = _2106;
    if (!_2014)
    {
        _2114 = _2006;
    }
    float _2132 = _2114;
    float _2134 = _2132;
    if (_2014)
    {
        float _2136 = _2004 * _2118;
        _2088 = _2136;
    }
    float _2138 = _2088;
    if (_2014)
    {
        float _2140 = fma(_2084, _2078, _2126);
        _2122 = _2140;
    }
    float _2142 = _2122;
    float _2144 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_2014)
    {
        float _2146 = _2130 * _2130;
        _2134 = _2146;
    }
    float _2148 = _2134;
    if (!_2014)
    {
        _2108 = _2008;
    }
    float _2150 = _2108;
    float _2152 = _2150;
    if (_2014)
    {
        float _2154 = _2138 * _2138;
        _2152 = _2154;
    }
    float _2156 = _2152;
    float _2158 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2144);
    float _2160 = fma(_2142, _2142, _2148);
    float _2162 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2164 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2166 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2158);
    float _2168 = _2160 + _2156;
    float _2170 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2162);
    float _2172 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2164);
    float _2174 = _1964 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2176 = -_2056;
    float _2178 = _2176 + 1.0;
    float _2180 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2170);
    float _2182 = rsqrt(_2168);
    float _2184 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2172);
    float _2186 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2174);
    float _2188 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2190 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2192 = _2166 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2194 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2196 = fma(_1968, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2186);
    float _2198 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2200 = abs(_2178);
    float _2202 = log2(_2200);
    float _2204 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2194);
    float _2206 = _2196 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2208 = -_2198;
    float _2210 = fma(_2208, _1988, 1.0);
    float _2212 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2204);
    float _2214 = _2182 * _2130;
    float _2216 = _2182 * _2142;
    float _2218 = _2182 * _2138;
    float _2220 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2212);
    float _2222 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2224 = log2(_2210);
    float _2226 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2228 = _2216 + 1.0;
    float _2230 = -_2222;
    float _2232 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2230);
    float _2234 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2236 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2226);
    float _2238 = -_2218;
    float _2240 = fma(_2238, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2232);
    float _2242 = 1.0 / _2220;
    float _2244 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2246 = fma(_2240, -0.5, 0.5);
    float _2248 = fma(_2240, 0.5, 0.5);
    float _2250 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2244);
    float _2252 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2236);
    float _2254 = exp2(_2234);
    float _2256 = fma(_2248, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2258 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2250);
    float _2260 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2252);
    float _2262 = _2224 * 0.693147182464599609375;
    float _2264 = fma(_2248, _2256, -0.212114393711090087890625);
    float _2266 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2258);
    float _2268 = sqrt(_2246);
    float _2270 = fma(_2248, _2264, 1.570728778839111328125);
    float _2272 = _2266 * _2242;
    float _2274 = _2260 * _2242;
    float _2276 = _2262 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2278 = fma(_2272, 0.5, 0.5);
    float _2280 = fma(_2274, -0.5, 0.5);
    float _2282 = -_2216;
    float _2284 = fma(_2254, _2228, _2282);
    float _2286 = fma(_2284, 0.5, 0.5);
    float _2288 = _2268 * 0.636619746685028076171875;
    float _2290 = -_2270;
    float _2292 = fma(_2288, _2290, 1.0);
    float3 _6158 = float3(_2278, _2280, _2276);
    float _2294 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6158, float3(0.0), isnan(_6158)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6158, float3(0.0), isnan(_6158)), level(0.0)).x;
    float3 _6169 = float3(_2278, _2280, _2276);
    float4 _2297 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6169, float3(0.0), isnan(_6169)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6169, float3(0.0), isnan(_6169)), level(0.0)).xyzw;
    float _2299 = _2297.x;
    float _2301 = _2297.y;
    float _2303 = _2297.z;
    float _2305 = _2297.w;
    float2 _6186 = float2(_2292, _2286);
    float3 _2309 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6186, float2(0.0), isnan(_6186)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6186, float2(0.0), isnan(_6186)), level(0.0)).xyz;
    float _2311 = _2309.x;
    float _2313 = _2309.y;
    float _2315 = _2309.z;
    float _2317 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2319 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2321 = _2202 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2323 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2325 = isnan(0.5);
    bool _2327 = _2323 || _2325;
    bool _2329 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2331 = _2327 || _2329;
    float _2333 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2317);
    float _2335 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2319);
    float _2337 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2333);
    float _2339 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2335);
    float _2341 = _2337 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2343 = _2339 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2345 = _2188 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2347 = 1.0 / _2341;
    float _2349 = _2343 + _2341;
    float _2351 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2345);
    float _2353 = _2192;
    float _2355 = _2206;
    if (_2331)
    {
        _2353 = 1.0;
    }
    float _2357 = _2353;
    float _2359 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2351);
    float _2361 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2359);
    float _2363 = _2357;
    if (_2331)
    {
        _2355 = 1.0;
    }
    float _2365 = _2355;
    float _2367 = _2349 * _2347;
    float _2369 = _2367 * 0.5;
    float _2371 = exp2(_2321);
    float _2373 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2375 = fma(_2369, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2373);
    float _2377 = 1.0 / _2375;
    float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2381 = _2377 * _2379;
    float _2383 = _2365;
    if (!_2331)
    {
        float _2385 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2387 = _2385 * 0.15915493667125701904296875;
        float _2389 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2391 = _2387 * 6.283185482025146484375;
        float _2393 = cos(_2391);
        float _2395 = _2389 * 0.15915493667125701904296875;
        float _2397 = _2387 * 6.283185482025146484375;
        float _2399 = sin(_2397);
        float _2401 = 1.0 / _2393;
        float _2403 = _2395 * 6.283185482025146484375;
        float _2405 = cos(_2403);
        float _2407 = _2399 * _2401;
        float _2409 = _2395 * 6.283185482025146484375;
        float _2411 = sin(_2409);
        float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2415 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2413;
        float _2417 = _2405 * _2407;
        float _2419 = 1.0 / _2415;
        float _2421 = 1.0 / _2417;
        float _2423 = _2411 * _2421;
        float _2425 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2427 = fma(_2381, _2423, _2425);
        float _2429 = _2427 * _2419;
        float _2431 = precise::clamp(_2429, 0.0, 1.0);
        _2383 = _2431;
    }
    float _2433 = _2383;
    if (!_2331)
    {
        float _2435 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2437 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2439 = _2435 * 0.15915493667125701904296875;
        float _2441 = _2437 * 0.15915493667125701904296875;
        float _2443 = _2439 * 6.283185482025146484375;
        float _2445 = cos(_2443);
        float _2447 = _2439 * 6.283185482025146484375;
        float _2449 = sin(_2447);
        float _2451 = 1.0 / _2445;
        float _2453 = _2441 * 6.283185482025146484375;
        float _2455 = cos(_2453);
        float _2457 = _2449 * _2451;
        float _2459 = _2441 * 6.283185482025146484375;
        float _2461 = sin(_2459);
        float _2463 = _2455 * _2457;
        float _2465 = 1.0 / _2463;
        float _2467 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2469 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2467;
        float _2471 = 1.0 / _2469;
        float _2473 = _2461 * _2465;
        float _2475 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2477 = fma(_2381, _2473, _2475);
        float _2479 = _2477 * _2471;
        float _2481 = precise::clamp(_2479, 0.0, 1.0);
        float _2483 = -_2481;
        float _2485 = _2483 + 1.0;
        _2363 = _2485;
    }
    float _2487 = _2363;
    float _2489 = -_2371;
    float _2491 = _2489 + 1.0;
    float _2493 = _2433 * _2487;
    bool _2495 = _2433 > 0.0;
    bool _2497 = isnan(_2433);
    bool _2499 = _2495 || _2497;
    bool _2501 = isnan(0.0);
    bool _2503 = _2499 || _2501;
    float _2505 = _2361 + _2220;
    float _2507 = _2491 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2509 = _2493 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2511 = _2487 <= 0.0;
    bool _2513 = !_2503;
    bool _2515 = _2511 || _2513;
    float _2517 = _2505 * 0.5;
    float _2519 = _2507 * _2294;
    float _2521 = -_2507;
    float _2523 = _2521 + 1.0;
    float _2525 = _2305 * _2519;
    float _2527 = _2315 * _2519;
    out.gl_Position.x = _2266;
    out.gl_Position.y = _2260;
    out.gl_Position.z = _2361;
    out.gl_Position.w = _2220;
    float _2529 = _2509 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2531 = fma(_2311, _2525, _2299);
    float _2533 = fma(_2313, _2525, _2301);
    float _2535 = _2305 * _2523;
    float _2537 = fma(_2305, _2527, _2303);
    out.m_65.z = _2517;
    out.m_65.w = _2220;
    out.m_45.x = _2529;
    out.m_67.x = _2531;
    out.m_67.y = _2533;
    out.m_67.z = _2537;
    out.m_67.w = _2535;
    if (!_2515)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2539 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2539;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

