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
    bool _1268 = false;
    bool _992 = false;
    bool _850 = false;
    bool _574 = false;
    bool _448 = false;
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
        float _2638 = as_type<float>(_102);
        out.gl_Position.z = _2638;
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
    float _122 = _120;
    if (_116)
    {
        float _124 = float(_86);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _120 >= _126;
    bool _130 = !_116;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _104 = as_type<int>(_138);
    }
    int _140 = _104;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2708 = as_type<float>(_140);
        out.gl_Position.z = _2708;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.w;
    float _144 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _222 = !_154;
    float _224 = _220;
    float _226 = _218;
    if (!_222)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _144 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _170 = _246;
    }
    float _248 = _170;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _254 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _256 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_154)
    {
        float _258 = _120 * _120;
        float _260 = _258 * 0.5;
        _224 = _260;
    }
    float _262 = _224;
    float _264 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[8].x, _252);
    float _266 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[8].y, _254);
    float _268 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[8].z, _256);
    float _270 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_154)
    {
        float _272 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _226 = _272;
    }
    float _274 = _226;
    bool _276 = !_154;
    float _278 = _274;
    if (!_276)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _120 * _282;
        float _292 = exp2(_290);
        float _294 = _288 * 0.693147182464599609375;
        float _296 = 1.0 / _294;
        float _298 = 1.0 / _286;
        float _300 = _292 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _296, _120);
        float _306 = _304 * _298;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _278 = _308;
    }
    float _310 = _278;
    float _312 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _314 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[10].x, _264);
    float _316 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[10].y, _266);
    float _318 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = _312 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _322 = _312 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _324 = _312 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _326 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[10].z, _268);
    float _328 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[8].x, _320);
    float _330 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[8].y, _322);
    float _332 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[8].z, _324);
    float _334 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _336 = fma(_248, _156, _314);
    float _338 = fma(_248, _158, _316);
    float _340 = fma(_248, _160, _326);
    float _342 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].x, _328);
    float _344 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].y, _330);
    float _346 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].z, _332);
    float _348 = _334;
    if (!_154)
    {
        _348 = _120;
    }
    float _350 = _348;
    bool _352 = !_154;
    float _354 = _350;
    if (!_352)
    {
        float _356 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = log2(_356);
        float _360 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _362 = _360 + 1.0;
        float _364 = 1.0 / _362;
        float _366 = _120 * _358;
        float _368 = exp2(_366);
        float _370 = -_368;
        float _372 = _370 + 1.0;
        float _374 = _372 * _364;
        _354 = _374;
    }
    float _376 = _354;
    float _378 = fma(_376, _158, _344);
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _382 = fma(_376, _156, _342);
    float _384 = fma(_338, _142, _164);
    float _386 = -_378;
    float _388 = _338 + _386;
    float _390 = fma(_376, _160, _346);
    float _392 = fma(_336, _142, _162);
    float _394 = -_382;
    float _396 = _336 + _394;
    float _398 = _388 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _400 = _388 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _402 = _388 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _404 = -_390;
    float _406 = _340 + _404;
    float _408 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _398);
    float _410 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _400);
    float _412 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _402);
    float _414 = fma(_340, _142, _166);
    float _416 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[4].z, _408);
    float _418 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[5].z, _410);
    float _420 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[6].z, _412);
    bool _422 = !_380;
    float _424 = _418;
    float _426 = _416;
    float _428 = _420;
    float _446;
    if (!_422)
    {
        float _430 = in.m_51.x;
        float _432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _434 = _430 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _436 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _438 = _436 * _432;
        float _440 = floor(_438);
        float _442 = -_440;
        float _444 = _438 + _442;
        _446 = _444;
        _448 = true;
    }
    else
    {
        float _450 = float(_86);
        float _452 = 1.0 / _450;
        float _454 = _120 * _452;
        _446 = _454;
    }
    _448 = false;
    float _456 = _446;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _460 = _456 + _458;
    bool _462 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _464 = isnan(_456);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _474;
    float _478 = 1.0 / _476;
    bool _480 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _482 = isnan(_456);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -_472;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _500;
    bool _504 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _506;
    float _510 = _490 * _494;
    float _512 = -_490;
    float _514 = _512 + 1.0;
    float _516 = _460 * _478;
    float _518 = in.m_49.x;
    float _520 = in.m_49.y;
    float _522 = in.m_49.z;
    float _524 = fma(_498, _516, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _526 = fma(_508, _516, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _528 = fma(_502, _516, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _530 = _524 * _510;
    float _532 = _526 * _510;
    float _534 = _528 * _510;
    float _536 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[143].x, _530);
    float _538 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[143].y, _532);
    float _540 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[143].z, _534);
    float _542 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[144].x, _536);
    float _544 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[144].y, _538);
    float _546 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[144].z, _540);
    float _548 = _544 * _520;
    float _550 = _542 * _518;
    float _552 = _546 * _522;
    bool _554 = !_504;
    float _572;
    if (!_554)
    {
        float _556 = in.m_51.x;
        float _558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _560 = _556 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _562 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _564 = _562 * _558;
        float _566 = floor(_564);
        float _568 = -_566;
        float _570 = _564 + _568;
        _572 = _570;
        _574 = true;
    }
    else
    {
        float _576 = float(_86);
        float _578 = 1.0 / _576;
        float _580 = _120 * _578;
        _572 = _580;
    }
    _574 = false;
    float _582 = _572;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _586 = _582 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _590 = _582 + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _594 = _582 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _612 = 1.0 / _602;
    bool _614 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _616 = isnan(_582);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = 1.0 / _606;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _628;
    bool _632 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _634 = 1.0 / _610;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _638 = _582 + _636;
    float _640 = 1.0 / _598;
    float _642 = _638 * _612;
    bool _644 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _646 = isnan(_582);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = _586 * _626;
    bool _658 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _660 = isnan(_582);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -_654;
    float _672 = _670 + 1.0;
    float _674 = _590 * _634;
    bool _676 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _678 = isnan(_582);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = fma(_630, _656, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _690 = _668 * _672;
    float _692 = -_668;
    float _694 = _692 + 1.0;
    float _696 = -_686;
    float _698 = _696 + 1.0;
    float _700 = _594 * _640;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _702;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _706;
    float _710 = fma(_704, _656, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _712 = fma(_708, _656, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _714 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _716 = isnan(_582);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = _686 * _694;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _740 = _724 * _698;
    float _742 = -_724;
    float _744 = _742 + 1.0;
    float _746 = fma(_730, _674, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _748 = fma(_738, _674, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _750 = fma(_734, _674, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _752 = _624 * _744;
    float _754 = -_624;
    float _756 = _754 + 1.0;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _758;
    float _762 = _710 * _752;
    float _764 = _712 * _752;
    float _766 = _688 * _752;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _772;
    float _776 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].x, _762);
    float _778 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].y, _764);
    float _780 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].z, _766);
    float _782 = fma(_770, _700, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _784 = fma(_774, _700, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _786 = fma(_760, _700, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _788 = fma(_746, _740, _776);
    float _790 = fma(_750, _740, _780);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _800 = fma(_748, _740, _778);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _806 = fma(_782, _726, _788);
    float _808 = fma(_794, _642, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _810 = fma(_798, _642, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _812 = fma(_804, _642, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _814 = fma(_784, _726, _800);
    float _816 = fma(_786, _726, _790);
    float _818 = fma(_808, _690, _806);
    float _820 = fma(_810, _690, _814);
    float _822 = fma(_812, _690, _816);
    float _824 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[111].x, _818);
    float _826 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[111].y, _820);
    float _828 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[111].z, _822);
    bool _830 = !_632;
    float _848;
    if (!_830)
    {
        float _832 = in.m_51.x;
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _836 = _832 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _840 = _838 * _834;
        float _842 = floor(_840);
        float _844 = -_842;
        float _846 = _840 + _844;
        _848 = _846;
        _850 = true;
    }
    else
    {
        float _852 = float(_86);
        float _854 = 1.0 / _852;
        float _856 = _120 * _854;
        _848 = _856;
    }
    _850 = false;
    float _858 = _848;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _862 = _858 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _868 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _870 = isnan(_858);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _884 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _886 = isnan(_858);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _896;
    bool _900 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _902 = isnan(_858);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = 1.0 / _866;
    float _914 = -_878;
    float _916 = _914 + 1.0;
    bool _918 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _920 = _894 * _916;
    float _922 = -_894;
    float _924 = _922 + 1.0;
    float _926 = 1.0 / _882;
    float _928 = _898 * _912;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _934 = fma(_928, _862, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _936 = _828 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _938 = _932 * _926;
    float _940 = _934 * _920;
    float _942 = -_910;
    float _944 = _942 + 1.0;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _948 = _858 + _946;
    float _950 = _824 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _952 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[115].x, _940);
    float _954 = _878 * _944;
    float _956 = fma(_938, _948, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _958 = _826 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _960 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = fma(_956, _954, _952);
    float _964 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[117].x, _962);
    float _966 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _964 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _960;
    out.m_53.y = _966;
    out.m_53.z = _968;
    out.m_53.w = _970;
    bool _972 = !_918;
    float _990;
    if (!_972)
    {
        float _974 = in.m_51.x;
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _978 = _974 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _980 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _982 = _980 * _976;
        float _984 = floor(_982);
        float _986 = -_984;
        float _988 = _982 + _986;
        _990 = _988;
        _992 = true;
    }
    else
    {
        float _994 = float(_86);
        float _996 = 1.0 / _994;
        float _998 = _120 * _996;
        _990 = _998;
    }
    _992 = false;
    float _1000 = _990;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1004 = _1000 + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1008 = _1000 + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1012 = _1000 + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1030 = 1.0 / _1016;
    bool _1032 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1034 = isnan(_1000);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = 1.0 / _1020;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1048 = _1000 + _1046;
    float _1050 = 1.0 / _1024;
    float _1052 = _1012 * _1030;
    bool _1054 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1056 = isnan(_1000);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    bool _1066 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1068 = 1.0 / _1028;
    float _1070 = _1004 * _1044;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1072;
    float _1076 = fma(_1074, _1052, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1078 = _1008 * _1050;
    bool _1080 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1082 = isnan(_1000);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1096;
    float _1100 = -_1090;
    float _1102 = _1100 + 1.0;
    float _1104 = fma(_1094, _1052, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1106 = _1048 * _1068;
    bool _1108 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1110 = isnan(_1000);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = fma(_1098, _1052, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1122 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1124 = isnan(_1000);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = _1064 * _1102;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1140 = -_1118;
    float _1142 = _1140 + 1.0;
    float _1144 = -_1064;
    float _1146 = _1144 + 1.0;
    float _1148 = fma(_1138, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1150 = _1132 * _1142;
    float _1152 = -_1132;
    float _1154 = _1152 + 1.0;
    float _1156 = _1118 * _1146;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1160 = _1158 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1166 = _1042 * _1154;
    float _1168 = fma(_1160, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1170 = fma(_1164, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1172 = _1104 * _1166;
    float _1174 = _1076 * _1166;
    float _1176 = -_1042;
    float _1178 = _1176 + 1.0;
    float _1180 = _1120 * _1166;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1190;
    float _1194 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1174);
    float _1196 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1172);
    float _1198 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1180);
    float _1200 = fma(_1184, _1078, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1202 = fma(_1188, _1078, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1204 = fma(_1192, _1078, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1206 = fma(_1168, _1150, _1194);
    float _1208 = fma(_1170, _1150, _1196);
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1212 = _1210 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1218 = fma(_1148, _1150, _1198);
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1224 = fma(_1200, _1156, _1206);
    float _1226 = fma(_1212, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1228 = fma(_1216, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1230 = fma(_1202, _1156, _1208);
    float _1232 = fma(_1222, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1234 = fma(_1204, _1156, _1218);
    float _1236 = fma(_1226, _1134, _1224);
    float _1238 = fma(_1228, _1134, _1230);
    float _1240 = fma(_1232, _1134, _1234);
    float _1242 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1236);
    float _1244 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1238);
    float _1246 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1240);
    bool _1248 = !_1066;
    float _1266;
    if (!_1248)
    {
        float _1250 = in.m_51.x;
        float _1252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1254 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1256 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _1258 = _1256 * _1252;
        float _1260 = floor(_1258);
        float _1262 = -_1260;
        float _1264 = _1258 + _1262;
        _1266 = _1264;
        _1268 = true;
    }
    else
    {
        float _1270 = float(_86);
        float _1272 = 1.0 / _1270;
        float _1274 = _120 * _1272;
        _1266 = _1274;
    }
    _1268 = false;
    float _1276 = _1266;
    float _1278 = in.m_51.w;
    float _1280 = _384 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1282 = _384 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1284 = in.m_55.x;
    float _1286 = in.m_55.y;
    float _1288 = in.m_55.z;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1292 = _1290 != 0;
    float _1294 = _384 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1298 = _1296 != 0;
    float _1300 = in.m_57.y;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1304 = _1302 != 0;
    float _1306 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1294);
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1310 = _1308 != 0;
    float _1312 = in.m_51.x;
    float _1314 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1280);
    float _1316 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1282);
    float _1318 = in.m_51.y;
    float _1320 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1322 = in.m_57.x;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1326 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1314);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1330 = _1276 + _1328;
    bool _1332 = _1278 > 0.5;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1336 = _1234;
    float _1338 = _1324;
    bool _1340 = _1332;
    float _1342 = _1316;
    if (_1292)
    {
        float _1344 = in.m_51.z;
        _1336 = _1344;
    }
    float _1346 = _1336;
    float _1348 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1316);
    float _1350 = _1326 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1354 = _1352 != 0;
    float _1356 = _1320 * _1300;
    float _1358 = _1348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1286);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1366 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1284);
    float _1368 = -_1300;
    float _1370 = _1368 + 1.0;
    float _1372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1288);
    float _1374 = 1.0 / _1364;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1378 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1380 = _1300;
    float _1382 = _1356;
    if (_1304)
    {
        float _1384 = _1332 ? _1370 : _1300;
        _1380 = _1384;
    }
    float _1386 = _1380;
    float _1388 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1390 = _1318 > 0.5;
    float _1392 = -_1376;
    float _1394 = fma(_1378, 2.0, _1392);
    float _1396 = fma(_1388, -2.0, _1334);
    float _1398 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1400 = _1320 * _1360;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1402;
    float _1406 = -_1356;
    float _1408 = _1406 + 1.0;
    float _1410 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1306);
    float _1412 = _1360;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1354)
    {
        float _1416 = in.m_51.z;
        _1412 = _1416;
    }
    float _1418 = _1412;
    float _1420 = _1404 * _1374;
    float _1422 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1424 = _1422;
    if (_1310)
    {
        float _1426 = _1390 ? _1408 : _1356;
        _1382 = _1426;
    }
    float _1428 = _1382;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1432 = fma(_1420, _1330, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1434 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1436 = _1398 * _1372;
    if (!_1354)
    {
        _1414 = _1318;
    }
    float _1438 = _1414;
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1442 = _1438;
    if (!_1292)
    {
        _1338 = _1322;
    }
    float _1444 = _1338;
    float _1446 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1430);
    bool _1448 = _1312 > 0.5;
    float _1450 = fma(_1422, _1386, -0.5);
    float _1452 = _1444;
    if (_1354)
    {
        _1442 = _1312;
    }
    float _1454 = _1442;
    float _1456 = _1434 * _1366;
    float _1458 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1460 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1462 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (!_1292)
    {
        _1424 = _1444;
    }
    float _1464 = _1424;
    float _1466 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1458);
    float _1468 = _1464;
    if (_1292)
    {
        _1452 = _1322;
    }
    float _1470 = _1452;
    float _1472 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1460);
    float _1474 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1462);
    if (_1292)
    {
        bool _1476 = _1346 > 0.5;
        _1340 = _1476;
    }
    bool _1478 = _1340;
    float _1480 = _1410 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1482 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1474);
    float _1484 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1466);
    float _1486 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1488 = _1418;
    if (!_1354)
    {
        _1342 = _1418;
    }
    float _1490 = _1342;
    float _1492 = _1482 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1496 = _1484 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1498 = fma(_1486, _1428, -0.5);
    float _1500 = _1480 + _1492;
    float _1502 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1494);
    float _1504 = _1490;
    int _1506 = as_type<int>(_1498);
    float _1508 = _1500;
    if (_1354)
    {
        _1504 = _1318;
    }
    float _1510 = _1504;
    float _1512 = _1350 + _1496;
    float _1514 = _1512;
    if (_1354)
    {
        _1488 = _1318;
    }
    float _1516 = _1488;
    float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1520 = _1500 + _1518;
    float _1522 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1502);
    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1526 = _1512 + _1524;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1530 = _1520 * _1520;
    bool _1532 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1534 = isnan(_1276);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1396);
    bool _1546 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1548 = isnan(_1276);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    float _1558 = fma(_1526, _1526, _1530);
    float _1560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1562 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1528);
    float _1564 = _1454 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1566 = -_1544;
    float _1568 = fma(_1522, _1498, _1566);
    float _1570 = -_1556;
    float _1572 = _1570 + 1.0;
    if (_1292)
    {
        float _1574 = -_1470;
        float _1576 = _1574 + 1.0;
        _1506 = as_type<int>(_1576);
    }
    int _1578 = _1506;
    float _1580 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1472);
    float _1582 = sqrt(_1558);
    float _1584 = _1542 * _1572;
    float _1586 = _1434 * _1470;
    float _1588 = _1586;
    if (_1292)
    {
        float _1590 = _1478 ? as_type<float>(_1578) : _1470;
        _1468 = _1590;
    }
    float _1592 = _1468;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1596 = _1432 * _1584;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1600 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1604 = -_1586;
    float _1606 = _1604 + 1.0;
    float _1608 = _1560 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1610 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1612 = -_1594;
    float _1614 = fma(_1564, 2.0, _1612);
    float _1616 = -_1542;
    float _1618 = _1616 + 1.0;
    float _1620 = fma(_1600, -2.0, _1598);
    bool _1622 = _1582 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1624 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1562);
    if (_1298)
    {
        float _1626 = _1448 ? _1606 : _1586;
        _1588 = _1626;
    }
    float _1628 = _1588;
    float _1630 = fma(_1608, _1592, -0.5);
    float _1632 = _1358 + _1610;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1636 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1596);
    float _1638 = -_120;
    float _1640 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1614);
    float _1642 = _1602 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1644 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1634);
    float _1646 = fma(_1556, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1636);
    float _1648 = fma(_1624, _1630, _1640);
    float _1650 = fma(_1642, _1628, -0.5);
    float _1652 = _1642;
    if (!_1622)
    {
        _1652 = _1512;
    }
    float _1654 = _1652;
    float _1656 = _1654;
    if (!_1622)
    {
        _1514 = _1632;
    }
    float _1658 = _1514;
    bool _1660 = !_1622;
    float _1662 = _1658;
    if (!_1660)
    {
        float _1664 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1668 = _1582 + _1666;
        float _1670 = rsqrt(_1558);
        float _1672 = _1668 * _1664;
        float _1674 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1676 = _1672 * 0.15915493667125701904296875;
        float _1678 = _1676 * 6.283185482025146484375;
        float _1680 = cos(_1678);
        float _1682 = _1676 * 6.283185482025146484375;
        float _1684 = sin(_1682);
        float _1686 = _1680 + (-1.0);
        float _1688 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1690 = fma(_1684, _1674, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1692 = fma(_1632, _1680, _1688);
        float _1694 = _1670 * _1690;
        float _1696 = fma(_1526, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1698 = fma(_1520, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1662 = _1692;
        _1656 = _1696;
        _1508 = _1698;
    }
    float _1700 = _1662;
    float _1702 = _1656;
    float _1704 = _1508;
    float _1706 = -_1358;
    float _1708 = _1706 + _1700;
    float _1710 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1644);
    float _1712 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1620);
    float _1714 = -_1350;
    float _1716 = _1714 + _1702;
    float _1718 = _1708 * _1708;
    float _1720 = -_1480;
    float _1722 = _1720 + _1704;
    float _1724 = -_1712;
    float _1726 = fma(_1710, _1450, _1724);
    float _1728 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1446);
    float _1730 = fma(_1716, _1716, _1718);
    float _1732 = -_120;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1394);
    float _1736 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1738 = _1244 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1740 = fma(_1722, _1722, _1730);
    float _1742 = fma(_1728, _1650, _1734);
    float _1744 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1746 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1748 = sqrt(_1740);
    float _1750 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1754 = _1568 + 0.5;
    float _1756 = _1646 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1758 = _1648 + 0.5;
    float _1760 = _1726 + 0.5;
    float _1762 = _1742 + 0.5;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    out.m_61.x = _1746;
    out.m_61.y = _1750;
    out.m_61.z = _1752;
    out.m_61.w = _1756;
    bool _1764 = _1748 > 0.0;
    out.m_63.x = _1762;
    out.m_63.y = _1754;
    out.m_63.z = _1758;
    out.m_63.w = _1760;
    bool _1766 = !_1764;
    float _1768 = 1.0;
    float _1770 = _1746;
    float _1772 = _1700;
    float _1774 = _1702;
    float _1776 = _1704;
    float _1778 = _1746;
    float _1780 = 1.0;
    float _1782 = 1.0;
    if (!_1766)
    {
        bool _1784 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1786 = 1.0;
        if (_1784)
        {
            float _1788 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1786 = _1788;
        }
        float _1790 = _1786;
        float _1792 = _1790;
        if (_1784)
        {
            float _1794 = _416 * _1790;
            _1768 = _1794;
        }
        float _1796 = _1768;
        float _1798 = _1796;
        if (_1784)
        {
            float _1800 = _418 * _1790;
            _1770 = _1800;
        }
        float _1802 = _1770;
        float _1804 = _1802;
        if (_1784)
        {
            float _1806 = _420 * _1790;
            _1792 = _1806;
        }
        float _1808 = _1792;
        float _1810 = _1808;
        if (!_1784)
        {
            float _1812 = _120 + 1.0;
            if (!_154)
            {
                float _1814 = _1812 * _1812;
                float _1816 = _1814 * 0.5;
                _122 = _1816;
            }
            float _1818 = _122;
            float _1820 = _1818;
            if (!_154)
            {
                float _1822 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1820 = _1822;
            }
            float _1824 = _1820;
            bool _1826 = !_154;
            float _1828 = _1824;
            if (!_1826)
            {
                float _1830 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1832 = log2(_1830);
                float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1836 = 1.0 + _1834;
                float _1838 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1840 = _1832 * _1812;
                float _1842 = exp2(_1840);
                float _1844 = _1838 * 0.693147182464599609375;
                float _1846 = 1.0 / _1844;
                float _1848 = 1.0 / _1836;
                float _1850 = _1842 + (-1.0);
                float _1852 = -_1850;
                float _1854 = fma(_1852, _1846, _1812);
                float _1856 = _1854 * _1848;
                float _1858 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1828 = _1858;
            }
            float _1860 = _1828;
            float _1862 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1864 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1866 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1868 = _1862 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1870 = _1862 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1872 = fma(_1864, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1868);
            float _1874 = _1862 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1876 = fma(_1864, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1870);
            float _1878 = _1870;
            if (!_154)
            {
                _1878 = _1812;
            }
            float _1880 = _1878;
            float _1882 = fma(_1866, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1872);
            bool _1884 = !_154;
            float _1886 = _1880;
            if (!_1884)
            {
                float _1888 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1890 = log2(_1888);
                float _1892 = _1890 * _1812;
                float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1896 = 1.0 + _1894;
                float _1898 = exp2(_1892);
                float _1900 = 1.0 / _1896;
                float _1902 = -_1898;
                float _1904 = _1902 + 1.0;
                float _1906 = _1904 * _1900;
                _1886 = _1906;
            }
            float _1908 = _1886;
            float _1910 = fma(_1864, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1874);
            float _1912 = fma(_1866, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1876);
            float _1914 = fma(_1908, _158, _1882);
            float _1916 = fma(_1866, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1910);
            float _1918 = fma(_1908, _156, _1912);
            float _1920 = -_378;
            float _1922 = _1920 + _1914;
            float _1924 = fma(_1908, _160, _1916);
            float _1926 = -_382;
            float _1928 = _1926 + _1918;
            float _1930 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1932 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1934 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1936 = -_390;
            float _1938 = _1936 + _1924;
            float _1940 = fma(_1928, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1930);
            float _1942 = fma(_1928, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1932);
            float _1944 = fma(_1928, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1934);
            float _1946 = fma(_1938, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1940);
            float _1948 = fma(_1938, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1942);
            float _1950 = fma(_1938, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1944);
            _424 = _1948;
            _426 = _1946;
            _428 = _1950;
            _1798 = _1946;
            _1804 = _1948;
            _1810 = _1950;
        }
        float _1952 = _424;
        float _1954 = _426;
        float _1956 = _428;
        float _1958 = _1798;
        float _1960 = _1804;
        float _1962 = _1810;
        float _1964 = _1952 * _1952;
        float _1966 = rsqrt(_1740);
        float _1968 = fma(_1954, _1954, _1964);
        float _1970 = fma(_1956, _1956, _1968);
        float _1972 = sqrt(_1970);
        float _1974 = _1716 * _1966;
        float _1976 = _1708 * _1966;
        float _1978 = _1722 * _1966;
        bool _1980 = _1972 > 0.0;
        bool _1982 = !_1980;
        _1778 = _1960;
        _1780 = _1958;
        _1782 = _1962;
        if (!_1982)
        {
            float _1984 = rsqrt(_1970);
            float _1986 = _1984 * _1952;
            float _1988 = _1984 * _1954;
            float _1990 = _1984 * _1956;
            float _1992 = _1976 * _1986;
            float _1994 = fma(_1974, _1988, _1992);
            float _1996 = fma(_1978, _1990, _1994);
            float _1998 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2000 = fma(_1958, _1998, _1702);
            float _2002 = fma(_1960, _1998, _1700);
            float _2004 = fma(_1962, _1998, _1704);
            _1772 = _2002;
            _1774 = _2000;
            _1776 = _2004;
        }
    }
    float _2006 = _1772;
    float _2008 = _1774;
    float _2010 = _1776;
    float _2012 = _1778;
    float _2014 = _1780;
    float _2016 = _1782;
    float _2018 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2020 = _2006 + _2018;
    float _2022 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2024 = _2008 + _2022;
    float _2026 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2028 = _2010 + _2026;
    float _2030 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2032 = _2020 * _2020;
    float _2034 = fma(_2024, _2024, _2032);
    float _2036 = fma(_2028, _2028, _2034);
    float _2038 = rsqrt(_2036);
    float _2040 = sqrt(_2036);
    float _2042 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2044 = _2024 * _2042;
    float _2046 = _2028 * _2042;
    float _2048 = _2044 * _2044;
    float _2050 = _2046 * _2046;
    float _2052 = _2048 + _2050;
    float _2054 = sqrt(_2052);
    bool _2056 = _2054 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2060 = _2054 + _2058;
    float _2062 = _2038;
    float _2064 = _2014;
    float _2066 = _2060;
    float _2068 = _2012;
    float _2070 = _2020;
    float _2072 = _2016;
    float _2074 = _2042;
    if (_2056)
    {
        float _2076 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2062 = _2076;
    }
    float _2078 = _2062;
    if (_2056)
    {
        float _2080 = rsqrt(_2052);
        _2064 = _2080;
    }
    float _2082 = _2064;
    float _2084 = _2082;
    if (_2056)
    {
        float _2086 = _2060 * _2078;
        _2066 = _2086;
    }
    float _2088 = _2066;
    if (_2056)
    {
        float _2090 = _2088 * 0.15915493667125701904296875;
        _2068 = _2090;
    }
    float _2092 = _2068;
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2096 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2094);
    float _2098 = precise::clamp(_2096, 0.0, 1.0);
    float _2100 = _2078;
    if (_2056)
    {
        float _2102 = _2092 * 6.283185482025146484375;
        float _2104 = sin(_2102);
        _2100 = _2104;
    }
    float _2106 = _2100;
    float _2108 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2110 = precise::max(0.0, _2108);
    float _2112 = _2028;
    float _2114 = _2110;
    if (_2056)
    {
        float _2116 = _2092 * 6.283185482025146484375;
        float _2118 = cos(_2116);
        _2112 = _2118;
    }
    float _2120 = _2112;
    float _2122 = -_2042;
    float _2124 = -_2110;
    float _2126 = fma(_2020, _2122, _2124);
    if (!_2056)
    {
        _2070 = _2046;
    }
    float _2128 = _2070;
    float _2130 = _2128;
    if (_2056)
    {
        float _2132 = _2126 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2114 = _2132;
    }
    float _2134 = _2114;
    float _2136 = _2106;
    float _2138 = _2134;
    if (_2056)
    {
        float _2140 = fma(_2106, _2134, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2072 = _2140;
    }
    float _2142 = _2072;
    float _2144 = _2142;
    if (!_2056)
    {
        _2136 = _2044;
    }
    float _2146 = _2136;
    float _2148 = _2146;
    float _2150 = _2120;
    if (_2056)
    {
        float _2152 = _2120 + (-1.0);
        _2138 = _2152;
    }
    float _2154 = _2138;
    float _2156 = _2154;
    if (_2056)
    {
        float _2158 = _2082 * _2142;
        _2144 = _2158;
    }
    float _2160 = _2144;
    if (!_2056)
    {
        _2084 = _2126;
    }
    float _2162 = _2084;
    float _2164 = _2162;
    if (_2056)
    {
        float _2166 = _2154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2074 = _2166;
    }
    float _2168 = _2074;
    if (_2056)
    {
        float _2170 = _2044 * _2160;
        _2148 = _2170;
    }
    float _2172 = _2148;
    if (!_2056)
    {
        _2156 = _2048;
    }
    float _2174 = _2156;
    float _2176 = _2174;
    if (_2056)
    {
        float _2178 = _2046 * _2160;
        _2130 = _2178;
    }
    float _2180 = _2130;
    if (_2056)
    {
        float _2182 = fma(_2126, _2120, _2168);
        _2164 = _2182;
    }
    float _2184 = _2164;
    float _2186 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_2056)
    {
        float _2188 = _2172 * _2172;
        _2176 = _2188;
    }
    float _2190 = _2176;
    if (!_2056)
    {
        _2150 = _2050;
    }
    float _2192 = _2150;
    float _2194 = _2192;
    if (_2056)
    {
        float _2196 = _2180 * _2180;
        _2194 = _2196;
    }
    float _2198 = _2194;
    float _2200 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2186);
    float _2202 = fma(_2184, _2184, _2190);
    float _2204 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2206 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2208 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2200);
    float _2210 = _2202 + _2198;
    float _2212 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2204);
    float _2214 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2206);
    float _2216 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2218 = -_2098;
    float _2220 = _2218 + 1.0;
    float _2222 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2212);
    float _2224 = rsqrt(_2210);
    float _2226 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2214);
    float _2228 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2216);
    float _2230 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2232 = _2226 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2234 = _2208 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2236 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2238 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2228);
    float _2240 = _2232 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2242 = abs(_2220);
    float _2244 = log2(_2242);
    float _2246 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2236);
    float _2248 = _2238 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2250 = -_2240;
    float _2252 = fma(_2250, _2030, 1.0);
    float _2254 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2246);
    float _2256 = _2224 * _2172;
    float _2258 = _2224 * _2184;
    float _2260 = _2224 * _2180;
    float _2262 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2254);
    float _2264 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2266 = log2(_2252);
    float _2268 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2270 = _2258 + 1.0;
    float _2272 = -_2264;
    float _2274 = fma(_2258, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2272);
    float _2276 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2278 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2268);
    float _2280 = -_2260;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2274);
    float _2284 = 1.0 / _2262;
    float _2286 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2288 = fma(_2282, -0.5, 0.5);
    float _2290 = fma(_2282, 0.5, 0.5);
    float _2292 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2286);
    float _2294 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2278);
    float _2296 = exp2(_2276);
    float _2298 = fma(_2290, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2300 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2292);
    float _2302 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2294);
    float _2304 = _2266 * 0.693147182464599609375;
    float _2306 = fma(_2290, _2298, -0.212114393711090087890625);
    float _2308 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2300);
    float _2310 = sqrt(_2288);
    float _2312 = fma(_2290, _2306, 1.570728778839111328125);
    float _2314 = _2308 * _2284;
    float _2316 = _2302 * _2284;
    float _2318 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2320 = fma(_2314, 0.5, 0.5);
    float _2322 = fma(_2316, -0.5, 0.5);
    float _2324 = -_2258;
    float _2326 = fma(_2296, _2270, _2324);
    float _2328 = fma(_2326, 0.5, 0.5);
    float _2330 = _2310 * 0.636619746685028076171875;
    float _2332 = -_2312;
    float _2334 = fma(_2330, _2332, 1.0);
    float3 _6325 = float3(_2320, _2322, _2318);
    float _2336 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6325, float3(0.0), isnan(_6325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6325, float3(0.0), isnan(_6325)), level(0.0)).x;
    float3 _6336 = float3(_2320, _2322, _2318);
    float4 _2339 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6336, float3(0.0), isnan(_6336)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6336, float3(0.0), isnan(_6336)), level(0.0)).xyzw;
    float _2341 = _2339.x;
    float _2343 = _2339.y;
    float _2345 = _2339.z;
    float _2347 = _2339.w;
    float2 _6353 = float2(_2334, _2328);
    float3 _2351 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6353, float2(0.0), isnan(_6353)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6353, float2(0.0), isnan(_6353)), level(0.0)).xyz;
    float _2353 = _2351.x;
    float _2355 = _2351.y;
    float _2357 = _2351.z;
    float _2359 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2361 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2363 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2365 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2367 = isnan(0.5);
    bool _2369 = _2365 || _2367;
    bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2373 = _2369 || _2371;
    float _2375 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2359);
    float _2377 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2361);
    float _2379 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2375);
    float _2381 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2377);
    float _2383 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2385 = _2381 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2387 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2389 = 1.0 / _2383;
    float _2391 = _2385 + _2383;
    float _2393 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2387);
    float _2395 = _2234;
    float _2397 = _2248;
    if (_2373)
    {
        _2395 = 1.0;
    }
    float _2399 = _2395;
    float _2401 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2393);
    float _2403 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2401);
    float _2405 = _2399;
    if (_2373)
    {
        _2397 = 1.0;
    }
    float _2407 = _2397;
    float _2409 = _2391 * _2389;
    float _2411 = _2409 * 0.5;
    float _2413 = exp2(_2363);
    float _2415 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2417 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2415);
    float _2419 = 1.0 / _2417;
    float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2423 = _2419 * _2421;
    float _2425 = _2407;
    if (!_2373)
    {
        float _2427 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2429 = _2427 * 0.15915493667125701904296875;
        float _2431 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2433 = _2429 * 6.283185482025146484375;
        float _2435 = cos(_2433);
        float _2437 = _2431 * 0.15915493667125701904296875;
        float _2439 = _2429 * 6.283185482025146484375;
        float _2441 = sin(_2439);
        float _2443 = 1.0 / _2435;
        float _2445 = _2437 * 6.283185482025146484375;
        float _2447 = cos(_2445);
        float _2449 = _2441 * _2443;
        float _2451 = _2437 * 6.283185482025146484375;
        float _2453 = sin(_2451);
        float _2455 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2457 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2455;
        float _2459 = _2447 * _2449;
        float _2461 = 1.0 / _2457;
        float _2463 = 1.0 / _2459;
        float _2465 = _2453 * _2463;
        float _2467 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2469 = fma(_2423, _2465, _2467);
        float _2471 = _2469 * _2461;
        float _2473 = precise::clamp(_2471, 0.0, 1.0);
        _2425 = _2473;
    }
    float _2475 = _2425;
    if (!_2373)
    {
        float _2477 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2479 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2481 = _2477 * 0.15915493667125701904296875;
        float _2483 = _2479 * 0.15915493667125701904296875;
        float _2485 = _2481 * 6.283185482025146484375;
        float _2487 = cos(_2485);
        float _2489 = _2481 * 6.283185482025146484375;
        float _2491 = sin(_2489);
        float _2493 = 1.0 / _2487;
        float _2495 = _2483 * 6.283185482025146484375;
        float _2497 = cos(_2495);
        float _2499 = _2491 * _2493;
        float _2501 = _2483 * 6.283185482025146484375;
        float _2503 = sin(_2501);
        float _2505 = _2497 * _2499;
        float _2507 = 1.0 / _2505;
        float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2511 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2509;
        float _2513 = 1.0 / _2511;
        float _2515 = _2503 * _2507;
        float _2517 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2519 = fma(_2423, _2515, _2517);
        float _2521 = _2519 * _2513;
        float _2523 = precise::clamp(_2521, 0.0, 1.0);
        float _2525 = -_2523;
        float _2527 = _2525 + 1.0;
        _2405 = _2527;
    }
    float _2529 = _2405;
    float _2531 = -_2413;
    float _2533 = _2531 + 1.0;
    float _2535 = _2475 * _2529;
    bool _2537 = _2475 > 0.0;
    bool _2539 = isnan(_2475);
    bool _2541 = _2537 || _2539;
    bool _2543 = isnan(0.0);
    bool _2545 = _2541 || _2543;
    float _2547 = _2403 + _2262;
    float _2549 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2551 = _2535 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2553 = _2529 <= 0.0;
    bool _2555 = !_2545;
    bool _2557 = _2553 || _2555;
    float _2559 = _2547 * 0.5;
    float _2561 = _2549 * _2336;
    float _2563 = -_2549;
    float _2565 = _2563 + 1.0;
    float _2567 = _2347 * _2561;
    float _2569 = _2357 * _2561;
    out.gl_Position.x = _2308;
    out.gl_Position.y = _2302;
    out.gl_Position.z = _2403;
    out.gl_Position.w = _2262;
    float _2571 = _2551 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2573 = fma(_2353, _2567, _2341);
    float _2575 = fma(_2355, _2567, _2343);
    float _2577 = _2347 * _2565;
    float _2579 = fma(_2347, _2569, _2345);
    out.m_65.z = _2559;
    out.m_65.w = _2262;
    out.m_45.x = _2571;
    out.m_67.x = _2573;
    out.m_67.y = _2575;
    out.m_67.z = _2579;
    out.m_67.w = _2577;
    if (!_2557)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2581 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2581;
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
    bool _1268 = false;
    bool _992 = false;
    bool _850 = false;
    bool _574 = false;
    bool _448 = false;
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
        float _2638 = as_type<float>(_102);
        out.gl_Position.z = _2638;
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
    float _122 = _120;
    if (_116)
    {
        float _124 = float(_86);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _120 >= _126;
    bool _130 = !_116;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _104 = as_type<int>(_138);
    }
    int _140 = _104;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2708 = as_type<float>(_140);
        out.gl_Position.z = _2708;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_49.w;
    float _144 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _222 = !_154;
    float _224 = _220;
    float _226 = _218;
    if (!_222)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _144 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _170 = _246;
    }
    float _248 = _170;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _254 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _256 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_154)
    {
        float _258 = _120 * _120;
        float _260 = _258 * 0.5;
        _224 = _260;
    }
    float _262 = _224;
    float _264 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[8].x, _252);
    float _266 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[8].y, _254);
    float _268 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[8].z, _256);
    float _270 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_154)
    {
        float _272 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _226 = _272;
    }
    float _274 = _226;
    bool _276 = !_154;
    float _278 = _274;
    if (!_276)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _120 * _282;
        float _292 = exp2(_290);
        float _294 = _288 * 0.693147182464599609375;
        float _296 = 1.0 / _294;
        float _298 = 1.0 / _286;
        float _300 = _292 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _296, _120);
        float _306 = _304 * _298;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _278 = _308;
    }
    float _310 = _278;
    float _312 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _314 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[10].x, _264);
    float _316 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[10].y, _266);
    float _318 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = _312 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _322 = _312 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _324 = _312 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _326 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[10].z, _268);
    float _328 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[8].x, _320);
    float _330 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[8].y, _322);
    float _332 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[8].z, _324);
    float _334 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _336 = fma(_248, _156, _314);
    float _338 = fma(_248, _158, _316);
    float _340 = fma(_248, _160, _326);
    float _342 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].x, _328);
    float _344 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].y, _330);
    float _346 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].z, _332);
    float _348 = _334;
    if (!_154)
    {
        _348 = _120;
    }
    float _350 = _348;
    bool _352 = !_154;
    float _354 = _350;
    if (!_352)
    {
        float _356 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = log2(_356);
        float _360 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _362 = _360 + 1.0;
        float _364 = 1.0 / _362;
        float _366 = _120 * _358;
        float _368 = exp2(_366);
        float _370 = -_368;
        float _372 = _370 + 1.0;
        float _374 = _372 * _364;
        _354 = _374;
    }
    float _376 = _354;
    float _378 = fma(_376, _158, _344);
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _382 = fma(_376, _156, _342);
    float _384 = fma(_338, _142, _164);
    float _386 = -_378;
    float _388 = _338 + _386;
    float _390 = fma(_376, _160, _346);
    float _392 = fma(_336, _142, _162);
    float _394 = -_382;
    float _396 = _336 + _394;
    float _398 = _388 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _400 = _388 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _402 = _388 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _404 = -_390;
    float _406 = _340 + _404;
    float _408 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _398);
    float _410 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _400);
    float _412 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _402);
    float _414 = fma(_340, _142, _166);
    float _416 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[4].z, _408);
    float _418 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[5].z, _410);
    float _420 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[6].z, _412);
    bool _422 = !_380;
    float _424 = _418;
    float _426 = _416;
    float _428 = _420;
    float _446;
    if (!_422)
    {
        float _430 = in.m_51.x;
        float _432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _434 = _430 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _436 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _438 = _436 * _432;
        float _440 = floor(_438);
        float _442 = -_440;
        float _444 = _438 + _442;
        _446 = _444;
        _448 = true;
    }
    else
    {
        float _450 = float(_86);
        float _452 = 1.0 / _450;
        float _454 = _120 * _452;
        _446 = _454;
    }
    _448 = false;
    float _456 = _446;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _460 = _456 + _458;
    bool _462 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _464 = isnan(_456);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _474;
    float _478 = 1.0 / _476;
    bool _480 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _482 = isnan(_456);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -_472;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _500;
    bool _504 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _506;
    float _510 = _490 * _494;
    float _512 = -_490;
    float _514 = _512 + 1.0;
    float _516 = _460 * _478;
    float _518 = in.m_49.x;
    float _520 = in.m_49.y;
    float _522 = in.m_49.z;
    float _524 = fma(_498, _516, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _526 = fma(_508, _516, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _528 = fma(_502, _516, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _530 = _524 * _510;
    float _532 = _526 * _510;
    float _534 = _528 * _510;
    float _536 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[143].x, _530);
    float _538 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[143].y, _532);
    float _540 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[143].z, _534);
    float _542 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[144].x, _536);
    float _544 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[144].y, _538);
    float _546 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[144].z, _540);
    float _548 = _544 * _520;
    float _550 = _542 * _518;
    float _552 = _546 * _522;
    bool _554 = !_504;
    float _572;
    if (!_554)
    {
        float _556 = in.m_51.x;
        float _558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _560 = _556 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _562 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _564 = _562 * _558;
        float _566 = floor(_564);
        float _568 = -_566;
        float _570 = _564 + _568;
        _572 = _570;
        _574 = true;
    }
    else
    {
        float _576 = float(_86);
        float _578 = 1.0 / _576;
        float _580 = _120 * _578;
        _572 = _580;
    }
    _574 = false;
    float _582 = _572;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _586 = _582 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _590 = _582 + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _594 = _582 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _612 = 1.0 / _602;
    bool _614 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _616 = isnan(_582);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = 1.0 / _606;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _628;
    bool _632 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _634 = 1.0 / _610;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _638 = _582 + _636;
    float _640 = 1.0 / _598;
    float _642 = _638 * _612;
    bool _644 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _646 = isnan(_582);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = _586 * _626;
    bool _658 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _660 = isnan(_582);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -_654;
    float _672 = _670 + 1.0;
    float _674 = _590 * _634;
    bool _676 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _678 = isnan(_582);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = fma(_630, _656, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _690 = _668 * _672;
    float _692 = -_668;
    float _694 = _692 + 1.0;
    float _696 = -_686;
    float _698 = _696 + 1.0;
    float _700 = _594 * _640;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _702;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _706;
    float _710 = fma(_704, _656, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _712 = fma(_708, _656, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _714 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _716 = isnan(_582);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = _686 * _694;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _740 = _724 * _698;
    float _742 = -_724;
    float _744 = _742 + 1.0;
    float _746 = fma(_730, _674, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _748 = fma(_738, _674, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _750 = fma(_734, _674, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _752 = _624 * _744;
    float _754 = -_624;
    float _756 = _754 + 1.0;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _758;
    float _762 = _710 * _752;
    float _764 = _712 * _752;
    float _766 = _688 * _752;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _772;
    float _776 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].x, _762);
    float _778 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].y, _764);
    float _780 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].z, _766);
    float _782 = fma(_770, _700, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _784 = fma(_774, _700, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _786 = fma(_760, _700, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _788 = fma(_746, _740, _776);
    float _790 = fma(_750, _740, _780);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _800 = fma(_748, _740, _778);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _806 = fma(_782, _726, _788);
    float _808 = fma(_794, _642, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _810 = fma(_798, _642, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _812 = fma(_804, _642, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _814 = fma(_784, _726, _800);
    float _816 = fma(_786, _726, _790);
    float _818 = fma(_808, _690, _806);
    float _820 = fma(_810, _690, _814);
    float _822 = fma(_812, _690, _816);
    float _824 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[111].x, _818);
    float _826 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[111].y, _820);
    float _828 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[111].z, _822);
    bool _830 = !_632;
    float _848;
    if (!_830)
    {
        float _832 = in.m_51.x;
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _836 = _832 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _840 = _838 * _834;
        float _842 = floor(_840);
        float _844 = -_842;
        float _846 = _840 + _844;
        _848 = _846;
        _850 = true;
    }
    else
    {
        float _852 = float(_86);
        float _854 = 1.0 / _852;
        float _856 = _120 * _854;
        _848 = _856;
    }
    _850 = false;
    float _858 = _848;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _862 = _858 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _868 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _870 = isnan(_858);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _884 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _886 = isnan(_858);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _896;
    bool _900 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _902 = isnan(_858);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = 1.0 / _866;
    float _914 = -_878;
    float _916 = _914 + 1.0;
    bool _918 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _920 = _894 * _916;
    float _922 = -_894;
    float _924 = _922 + 1.0;
    float _926 = 1.0 / _882;
    float _928 = _898 * _912;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _934 = fma(_928, _862, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _936 = _828 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _938 = _932 * _926;
    float _940 = _934 * _920;
    float _942 = -_910;
    float _944 = _942 + 1.0;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _948 = _858 + _946;
    float _950 = _824 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _952 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[115].x, _940);
    float _954 = _878 * _944;
    float _956 = fma(_938, _948, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _958 = _826 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _960 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = fma(_956, _954, _952);
    float _964 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[117].x, _962);
    float _966 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _964 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _960;
    out.m_53.y = _966;
    out.m_53.z = _968;
    out.m_53.w = _970;
    bool _972 = !_918;
    float _990;
    if (!_972)
    {
        float _974 = in.m_51.x;
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _978 = _974 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _980 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _982 = _980 * _976;
        float _984 = floor(_982);
        float _986 = -_984;
        float _988 = _982 + _986;
        _990 = _988;
        _992 = true;
    }
    else
    {
        float _994 = float(_86);
        float _996 = 1.0 / _994;
        float _998 = _120 * _996;
        _990 = _998;
    }
    _992 = false;
    float _1000 = _990;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1004 = _1000 + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1008 = _1000 + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1012 = _1000 + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1030 = 1.0 / _1016;
    bool _1032 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1034 = isnan(_1000);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = 1.0 / _1020;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1048 = _1000 + _1046;
    float _1050 = 1.0 / _1024;
    float _1052 = _1012 * _1030;
    bool _1054 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1056 = isnan(_1000);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    bool _1066 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1068 = 1.0 / _1028;
    float _1070 = _1004 * _1044;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1072;
    float _1076 = fma(_1074, _1052, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1078 = _1008 * _1050;
    bool _1080 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1082 = isnan(_1000);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1096;
    float _1100 = -_1090;
    float _1102 = _1100 + 1.0;
    float _1104 = fma(_1094, _1052, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1106 = _1048 * _1068;
    bool _1108 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1110 = isnan(_1000);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = fma(_1098, _1052, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1122 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1124 = isnan(_1000);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = _1064 * _1102;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1140 = -_1118;
    float _1142 = _1140 + 1.0;
    float _1144 = -_1064;
    float _1146 = _1144 + 1.0;
    float _1148 = fma(_1138, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1150 = _1132 * _1142;
    float _1152 = -_1132;
    float _1154 = _1152 + 1.0;
    float _1156 = _1118 * _1146;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1160 = _1158 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1166 = _1042 * _1154;
    float _1168 = fma(_1160, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1170 = fma(_1164, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1172 = _1104 * _1166;
    float _1174 = _1076 * _1166;
    float _1176 = -_1042;
    float _1178 = _1176 + 1.0;
    float _1180 = _1120 * _1166;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1190;
    float _1194 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1174);
    float _1196 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1172);
    float _1198 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1180);
    float _1200 = fma(_1184, _1078, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1202 = fma(_1188, _1078, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1204 = fma(_1192, _1078, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1206 = fma(_1168, _1150, _1194);
    float _1208 = fma(_1170, _1150, _1196);
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1212 = _1210 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1218 = fma(_1148, _1150, _1198);
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1224 = fma(_1200, _1156, _1206);
    float _1226 = fma(_1212, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1228 = fma(_1216, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1230 = fma(_1202, _1156, _1208);
    float _1232 = fma(_1222, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1234 = fma(_1204, _1156, _1218);
    float _1236 = fma(_1226, _1134, _1224);
    float _1238 = fma(_1228, _1134, _1230);
    float _1240 = fma(_1232, _1134, _1234);
    float _1242 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1236);
    float _1244 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1238);
    float _1246 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1240);
    bool _1248 = !_1066;
    float _1266;
    if (!_1248)
    {
        float _1250 = in.m_51.x;
        float _1252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1254 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1256 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _1258 = _1256 * _1252;
        float _1260 = floor(_1258);
        float _1262 = -_1260;
        float _1264 = _1258 + _1262;
        _1266 = _1264;
        _1268 = true;
    }
    else
    {
        float _1270 = float(_86);
        float _1272 = 1.0 / _1270;
        float _1274 = _120 * _1272;
        _1266 = _1274;
    }
    _1268 = false;
    float _1276 = _1266;
    float _1278 = in.m_51.w;
    float _1280 = _384 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1282 = _384 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1284 = in.m_55.x;
    float _1286 = in.m_55.y;
    float _1288 = in.m_55.z;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1292 = _1290 != 0;
    float _1294 = _384 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1298 = _1296 != 0;
    float _1300 = in.m_57.y;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1304 = _1302 != 0;
    float _1306 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1294);
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1310 = _1308 != 0;
    float _1312 = in.m_51.x;
    float _1314 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1280);
    float _1316 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1282);
    float _1318 = in.m_51.y;
    float _1320 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1322 = in.m_57.x;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1326 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1314);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1330 = _1276 + _1328;
    bool _1332 = _1278 > 0.5;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1336 = _1234;
    float _1338 = _1324;
    bool _1340 = _1332;
    float _1342 = _1316;
    if (_1292)
    {
        float _1344 = in.m_51.z;
        _1336 = _1344;
    }
    float _1346 = _1336;
    float _1348 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1316);
    float _1350 = _1326 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1354 = _1352 != 0;
    float _1356 = _1320 * _1300;
    float _1358 = _1348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1286);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1366 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1284);
    float _1368 = -_1300;
    float _1370 = _1368 + 1.0;
    float _1372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1288);
    float _1374 = 1.0 / _1364;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1378 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1380 = _1300;
    float _1382 = _1356;
    if (_1304)
    {
        float _1384 = _1332 ? _1370 : _1300;
        _1380 = _1384;
    }
    float _1386 = _1380;
    float _1388 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1390 = _1318 > 0.5;
    float _1392 = -_1376;
    float _1394 = fma(_1378, 2.0, _1392);
    float _1396 = fma(_1388, -2.0, _1334);
    float _1398 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1400 = _1320 * _1360;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1402;
    float _1406 = -_1356;
    float _1408 = _1406 + 1.0;
    float _1410 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1306);
    float _1412 = _1360;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1354)
    {
        float _1416 = in.m_51.z;
        _1412 = _1416;
    }
    float _1418 = _1412;
    float _1420 = _1404 * _1374;
    float _1422 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1424 = _1422;
    if (_1310)
    {
        float _1426 = _1390 ? _1408 : _1356;
        _1382 = _1426;
    }
    float _1428 = _1382;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1432 = fma(_1420, _1330, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1434 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1436 = _1398 * _1372;
    if (!_1354)
    {
        _1414 = _1318;
    }
    float _1438 = _1414;
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1442 = _1438;
    if (!_1292)
    {
        _1338 = _1322;
    }
    float _1444 = _1338;
    float _1446 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1430);
    bool _1448 = _1312 > 0.5;
    float _1450 = fma(_1422, _1386, -0.5);
    float _1452 = _1444;
    if (_1354)
    {
        _1442 = _1312;
    }
    float _1454 = _1442;
    float _1456 = _1434 * _1366;
    float _1458 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1460 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1462 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (!_1292)
    {
        _1424 = _1444;
    }
    float _1464 = _1424;
    float _1466 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1458);
    float _1468 = _1464;
    if (_1292)
    {
        _1452 = _1322;
    }
    float _1470 = _1452;
    float _1472 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1460);
    float _1474 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1462);
    if (_1292)
    {
        bool _1476 = _1346 > 0.5;
        _1340 = _1476;
    }
    bool _1478 = _1340;
    float _1480 = _1410 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1482 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1474);
    float _1484 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1466);
    float _1486 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1488 = _1418;
    if (!_1354)
    {
        _1342 = _1418;
    }
    float _1490 = _1342;
    float _1492 = _1482 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1496 = _1484 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1498 = fma(_1486, _1428, -0.5);
    float _1500 = _1480 + _1492;
    float _1502 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1494);
    float _1504 = _1490;
    int _1506 = as_type<int>(_1498);
    float _1508 = _1500;
    if (_1354)
    {
        _1504 = _1318;
    }
    float _1510 = _1504;
    float _1512 = _1350 + _1496;
    float _1514 = _1512;
    if (_1354)
    {
        _1488 = _1318;
    }
    float _1516 = _1488;
    float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1520 = _1500 + _1518;
    float _1522 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1502);
    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1526 = _1512 + _1524;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1530 = _1520 * _1520;
    bool _1532 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1534 = isnan(_1276);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1396);
    bool _1546 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1548 = isnan(_1276);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    float _1558 = fma(_1526, _1526, _1530);
    float _1560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1562 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1528);
    float _1564 = _1454 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1566 = -_1544;
    float _1568 = fma(_1522, _1498, _1566);
    float _1570 = -_1556;
    float _1572 = _1570 + 1.0;
    if (_1292)
    {
        float _1574 = -_1470;
        float _1576 = _1574 + 1.0;
        _1506 = as_type<int>(_1576);
    }
    int _1578 = _1506;
    float _1580 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1472);
    float _1582 = sqrt(_1558);
    float _1584 = _1542 * _1572;
    float _1586 = _1434 * _1470;
    float _1588 = _1586;
    if (_1292)
    {
        float _1590 = _1478 ? as_type<float>(_1578) : _1470;
        _1468 = _1590;
    }
    float _1592 = _1468;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1596 = _1432 * _1584;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1600 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1604 = -_1586;
    float _1606 = _1604 + 1.0;
    float _1608 = _1560 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1610 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1612 = -_1594;
    float _1614 = fma(_1564, 2.0, _1612);
    float _1616 = -_1542;
    float _1618 = _1616 + 1.0;
    float _1620 = fma(_1600, -2.0, _1598);
    bool _1622 = _1582 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1624 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1562);
    if (_1298)
    {
        float _1626 = _1448 ? _1606 : _1586;
        _1588 = _1626;
    }
    float _1628 = _1588;
    float _1630 = fma(_1608, _1592, -0.5);
    float _1632 = _1358 + _1610;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1636 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1596);
    float _1638 = -_120;
    float _1640 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1614);
    float _1642 = _1602 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1644 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1634);
    float _1646 = fma(_1556, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1636);
    float _1648 = fma(_1624, _1630, _1640);
    float _1650 = fma(_1642, _1628, -0.5);
    float _1652 = _1642;
    if (!_1622)
    {
        _1652 = _1512;
    }
    float _1654 = _1652;
    float _1656 = _1654;
    if (!_1622)
    {
        _1514 = _1632;
    }
    float _1658 = _1514;
    bool _1660 = !_1622;
    float _1662 = _1658;
    if (!_1660)
    {
        float _1664 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1668 = _1582 + _1666;
        float _1670 = rsqrt(_1558);
        float _1672 = _1668 * _1664;
        float _1674 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1676 = _1672 * 0.15915493667125701904296875;
        float _1678 = _1676 * 6.283185482025146484375;
        float _1680 = cos(_1678);
        float _1682 = _1676 * 6.283185482025146484375;
        float _1684 = sin(_1682);
        float _1686 = _1680 + (-1.0);
        float _1688 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1690 = fma(_1684, _1674, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1692 = fma(_1632, _1680, _1688);
        float _1694 = _1670 * _1690;
        float _1696 = fma(_1526, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1698 = fma(_1520, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1662 = _1692;
        _1656 = _1696;
        _1508 = _1698;
    }
    float _1700 = _1662;
    float _1702 = _1656;
    float _1704 = _1508;
    float _1706 = -_1358;
    float _1708 = _1706 + _1700;
    float _1710 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1644);
    float _1712 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1620);
    float _1714 = -_1350;
    float _1716 = _1714 + _1702;
    float _1718 = _1708 * _1708;
    float _1720 = -_1480;
    float _1722 = _1720 + _1704;
    float _1724 = -_1712;
    float _1726 = fma(_1710, _1450, _1724);
    float _1728 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1446);
    float _1730 = fma(_1716, _1716, _1718);
    float _1732 = -_120;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1394);
    float _1736 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1738 = _1244 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1740 = fma(_1722, _1722, _1730);
    float _1742 = fma(_1728, _1650, _1734);
    float _1744 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1746 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1748 = sqrt(_1740);
    float _1750 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1754 = _1568 + 0.5;
    float _1756 = _1646 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1758 = _1648 + 0.5;
    float _1760 = _1726 + 0.5;
    float _1762 = _1742 + 0.5;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    out.m_61.x = _1746;
    out.m_61.y = _1750;
    out.m_61.z = _1752;
    out.m_61.w = _1756;
    bool _1764 = _1748 > 0.0;
    out.m_63.x = _1762;
    out.m_63.y = _1754;
    out.m_63.z = _1758;
    out.m_63.w = _1760;
    bool _1766 = !_1764;
    float _1768 = 1.0;
    float _1770 = _1746;
    float _1772 = _1700;
    float _1774 = _1702;
    float _1776 = _1704;
    float _1778 = _1746;
    float _1780 = 1.0;
    float _1782 = 1.0;
    if (!_1766)
    {
        bool _1784 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1786 = 1.0;
        if (_1784)
        {
            float _1788 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1786 = _1788;
        }
        float _1790 = _1786;
        float _1792 = _1790;
        if (_1784)
        {
            float _1794 = _416 * _1790;
            _1768 = _1794;
        }
        float _1796 = _1768;
        float _1798 = _1796;
        if (_1784)
        {
            float _1800 = _418 * _1790;
            _1770 = _1800;
        }
        float _1802 = _1770;
        float _1804 = _1802;
        if (_1784)
        {
            float _1806 = _420 * _1790;
            _1792 = _1806;
        }
        float _1808 = _1792;
        float _1810 = _1808;
        if (!_1784)
        {
            float _1812 = _120 + 1.0;
            if (!_154)
            {
                float _1814 = _1812 * _1812;
                float _1816 = _1814 * 0.5;
                _122 = _1816;
            }
            float _1818 = _122;
            float _1820 = _1818;
            if (!_154)
            {
                float _1822 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1820 = _1822;
            }
            float _1824 = _1820;
            bool _1826 = !_154;
            float _1828 = _1824;
            if (!_1826)
            {
                float _1830 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1832 = log2(_1830);
                float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1836 = 1.0 + _1834;
                float _1838 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1840 = _1832 * _1812;
                float _1842 = exp2(_1840);
                float _1844 = _1838 * 0.693147182464599609375;
                float _1846 = 1.0 / _1844;
                float _1848 = 1.0 / _1836;
                float _1850 = _1842 + (-1.0);
                float _1852 = -_1850;
                float _1854 = fma(_1852, _1846, _1812);
                float _1856 = _1854 * _1848;
                float _1858 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1828 = _1858;
            }
            float _1860 = _1828;
            float _1862 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1864 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1866 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1868 = _1862 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1870 = _1862 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1872 = fma(_1864, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1868);
            float _1874 = _1862 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1876 = fma(_1864, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1870);
            float _1878 = _1870;
            if (!_154)
            {
                _1878 = _1812;
            }
            float _1880 = _1878;
            float _1882 = fma(_1866, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1872);
            bool _1884 = !_154;
            float _1886 = _1880;
            if (!_1884)
            {
                float _1888 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1890 = log2(_1888);
                float _1892 = _1890 * _1812;
                float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1896 = 1.0 + _1894;
                float _1898 = exp2(_1892);
                float _1900 = 1.0 / _1896;
                float _1902 = -_1898;
                float _1904 = _1902 + 1.0;
                float _1906 = _1904 * _1900;
                _1886 = _1906;
            }
            float _1908 = _1886;
            float _1910 = fma(_1864, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1874);
            float _1912 = fma(_1866, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1876);
            float _1914 = fma(_1908, _158, _1882);
            float _1916 = fma(_1866, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1910);
            float _1918 = fma(_1908, _156, _1912);
            float _1920 = -_378;
            float _1922 = _1920 + _1914;
            float _1924 = fma(_1908, _160, _1916);
            float _1926 = -_382;
            float _1928 = _1926 + _1918;
            float _1930 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1932 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1934 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1936 = -_390;
            float _1938 = _1936 + _1924;
            float _1940 = fma(_1928, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1930);
            float _1942 = fma(_1928, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1932);
            float _1944 = fma(_1928, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1934);
            float _1946 = fma(_1938, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1940);
            float _1948 = fma(_1938, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1942);
            float _1950 = fma(_1938, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1944);
            _424 = _1948;
            _426 = _1946;
            _428 = _1950;
            _1798 = _1946;
            _1804 = _1948;
            _1810 = _1950;
        }
        float _1952 = _424;
        float _1954 = _426;
        float _1956 = _428;
        float _1958 = _1798;
        float _1960 = _1804;
        float _1962 = _1810;
        float _1964 = _1952 * _1952;
        float _1966 = rsqrt(_1740);
        float _1968 = fma(_1954, _1954, _1964);
        float _1970 = fma(_1956, _1956, _1968);
        float _1972 = sqrt(_1970);
        float _1974 = _1716 * _1966;
        float _1976 = _1708 * _1966;
        float _1978 = _1722 * _1966;
        bool _1980 = _1972 > 0.0;
        bool _1982 = !_1980;
        _1778 = _1960;
        _1780 = _1958;
        _1782 = _1962;
        if (!_1982)
        {
            float _1984 = rsqrt(_1970);
            float _1986 = _1984 * _1952;
            float _1988 = _1984 * _1954;
            float _1990 = _1984 * _1956;
            float _1992 = _1976 * _1986;
            float _1994 = fma(_1974, _1988, _1992);
            float _1996 = fma(_1978, _1990, _1994);
            float _1998 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2000 = fma(_1958, _1998, _1702);
            float _2002 = fma(_1960, _1998, _1700);
            float _2004 = fma(_1962, _1998, _1704);
            _1772 = _2002;
            _1774 = _2000;
            _1776 = _2004;
        }
    }
    float _2006 = _1772;
    float _2008 = _1774;
    float _2010 = _1776;
    float _2012 = _1778;
    float _2014 = _1780;
    float _2016 = _1782;
    float _2018 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2020 = _2006 + _2018;
    float _2022 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2024 = _2008 + _2022;
    float _2026 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2028 = _2010 + _2026;
    float _2030 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2032 = _2020 * _2020;
    float _2034 = fma(_2024, _2024, _2032);
    float _2036 = fma(_2028, _2028, _2034);
    float _2038 = rsqrt(_2036);
    float _2040 = sqrt(_2036);
    float _2042 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2044 = _2024 * _2042;
    float _2046 = _2028 * _2042;
    float _2048 = _2044 * _2044;
    float _2050 = _2046 * _2046;
    float _2052 = _2048 + _2050;
    float _2054 = sqrt(_2052);
    bool _2056 = _2054 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2060 = _2054 + _2058;
    float _2062 = _2038;
    float _2064 = _2014;
    float _2066 = _2060;
    float _2068 = _2012;
    float _2070 = _2020;
    float _2072 = _2016;
    float _2074 = _2042;
    if (_2056)
    {
        float _2076 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2062 = _2076;
    }
    float _2078 = _2062;
    if (_2056)
    {
        float _2080 = rsqrt(_2052);
        _2064 = _2080;
    }
    float _2082 = _2064;
    float _2084 = _2082;
    if (_2056)
    {
        float _2086 = _2060 * _2078;
        _2066 = _2086;
    }
    float _2088 = _2066;
    if (_2056)
    {
        float _2090 = _2088 * 0.15915493667125701904296875;
        _2068 = _2090;
    }
    float _2092 = _2068;
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2096 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2094);
    float _2098 = precise::clamp(_2096, 0.0, 1.0);
    float _2100 = _2078;
    if (_2056)
    {
        float _2102 = _2092 * 6.283185482025146484375;
        float _2104 = sin(_2102);
        _2100 = _2104;
    }
    float _2106 = _2100;
    float _2108 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2110 = precise::max(0.0, _2108);
    float _2112 = _2028;
    float _2114 = _2110;
    if (_2056)
    {
        float _2116 = _2092 * 6.283185482025146484375;
        float _2118 = cos(_2116);
        _2112 = _2118;
    }
    float _2120 = _2112;
    float _2122 = -_2042;
    float _2124 = -_2110;
    float _2126 = fma(_2020, _2122, _2124);
    if (!_2056)
    {
        _2070 = _2046;
    }
    float _2128 = _2070;
    float _2130 = _2128;
    if (_2056)
    {
        float _2132 = _2126 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2114 = _2132;
    }
    float _2134 = _2114;
    float _2136 = _2106;
    float _2138 = _2134;
    if (_2056)
    {
        float _2140 = fma(_2106, _2134, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2072 = _2140;
    }
    float _2142 = _2072;
    float _2144 = _2142;
    if (!_2056)
    {
        _2136 = _2044;
    }
    float _2146 = _2136;
    float _2148 = _2146;
    float _2150 = _2120;
    if (_2056)
    {
        float _2152 = _2120 + (-1.0);
        _2138 = _2152;
    }
    float _2154 = _2138;
    float _2156 = _2154;
    if (_2056)
    {
        float _2158 = _2082 * _2142;
        _2144 = _2158;
    }
    float _2160 = _2144;
    if (!_2056)
    {
        _2084 = _2126;
    }
    float _2162 = _2084;
    float _2164 = _2162;
    if (_2056)
    {
        float _2166 = _2154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2074 = _2166;
    }
    float _2168 = _2074;
    if (_2056)
    {
        float _2170 = _2044 * _2160;
        _2148 = _2170;
    }
    float _2172 = _2148;
    if (!_2056)
    {
        _2156 = _2048;
    }
    float _2174 = _2156;
    float _2176 = _2174;
    if (_2056)
    {
        float _2178 = _2046 * _2160;
        _2130 = _2178;
    }
    float _2180 = _2130;
    if (_2056)
    {
        float _2182 = fma(_2126, _2120, _2168);
        _2164 = _2182;
    }
    float _2184 = _2164;
    float _2186 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_2056)
    {
        float _2188 = _2172 * _2172;
        _2176 = _2188;
    }
    float _2190 = _2176;
    if (!_2056)
    {
        _2150 = _2050;
    }
    float _2192 = _2150;
    float _2194 = _2192;
    if (_2056)
    {
        float _2196 = _2180 * _2180;
        _2194 = _2196;
    }
    float _2198 = _2194;
    float _2200 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2186);
    float _2202 = fma(_2184, _2184, _2190);
    float _2204 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2206 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2208 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2200);
    float _2210 = _2202 + _2198;
    float _2212 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2204);
    float _2214 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2206);
    float _2216 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2218 = -_2098;
    float _2220 = _2218 + 1.0;
    float _2222 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2212);
    float _2224 = rsqrt(_2210);
    float _2226 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2214);
    float _2228 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2216);
    float _2230 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2232 = _2226 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2234 = _2208 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2236 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2238 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2228);
    float _2240 = _2232 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2242 = abs(_2220);
    float _2244 = log2(_2242);
    float _2246 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2236);
    float _2248 = _2238 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2250 = -_2240;
    float _2252 = fma(_2250, _2030, 1.0);
    float _2254 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2246);
    float _2256 = _2224 * _2172;
    float _2258 = _2224 * _2184;
    float _2260 = _2224 * _2180;
    float _2262 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2254);
    float _2264 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2266 = log2(_2252);
    float _2268 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2270 = _2258 + 1.0;
    float _2272 = -_2264;
    float _2274 = fma(_2258, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2272);
    float _2276 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2278 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2268);
    float _2280 = -_2260;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2274);
    float _2284 = 1.0 / _2262;
    float _2286 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2288 = fma(_2282, -0.5, 0.5);
    float _2290 = fma(_2282, 0.5, 0.5);
    float _2292 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2286);
    float _2294 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2278);
    float _2296 = exp2(_2276);
    float _2298 = fma(_2290, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2300 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2292);
    float _2302 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2294);
    float _2304 = _2266 * 0.693147182464599609375;
    float _2306 = fma(_2290, _2298, -0.212114393711090087890625);
    float _2308 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2300);
    float _2310 = sqrt(_2288);
    float _2312 = fma(_2290, _2306, 1.570728778839111328125);
    float _2314 = _2308 * _2284;
    float _2316 = _2302 * _2284;
    float _2318 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2320 = fma(_2314, 0.5, 0.5);
    float _2322 = fma(_2316, -0.5, 0.5);
    float _2324 = -_2258;
    float _2326 = fma(_2296, _2270, _2324);
    float _2328 = fma(_2326, 0.5, 0.5);
    float _2330 = _2310 * 0.636619746685028076171875;
    float _2332 = -_2312;
    float _2334 = fma(_2330, _2332, 1.0);
    float3 _6325 = float3(_2320, _2322, _2318);
    float _2336 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6325, float3(0.0), isnan(_6325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6325, float3(0.0), isnan(_6325)), level(0.0)).x;
    float3 _6336 = float3(_2320, _2322, _2318);
    float4 _2339 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6336, float3(0.0), isnan(_6336)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6336, float3(0.0), isnan(_6336)), level(0.0)).xyzw;
    float _2341 = _2339.x;
    float _2343 = _2339.y;
    float _2345 = _2339.z;
    float _2347 = _2339.w;
    float2 _6353 = float2(_2334, _2328);
    float3 _2351 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6353, float2(0.0), isnan(_6353)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6353, float2(0.0), isnan(_6353)), level(0.0)).xyz;
    float _2353 = _2351.x;
    float _2355 = _2351.y;
    float _2357 = _2351.z;
    float _2359 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2361 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2363 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2365 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2367 = isnan(0.5);
    bool _2369 = _2365 || _2367;
    bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2373 = _2369 || _2371;
    float _2375 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2359);
    float _2377 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2361);
    float _2379 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2375);
    float _2381 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2377);
    float _2383 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2385 = _2381 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2387 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2389 = 1.0 / _2383;
    float _2391 = _2385 + _2383;
    float _2393 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2387);
    float _2395 = _2234;
    float _2397 = _2248;
    if (_2373)
    {
        _2395 = 1.0;
    }
    float _2399 = _2395;
    float _2401 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2393);
    float _2403 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2401);
    float _2405 = _2399;
    if (_2373)
    {
        _2397 = 1.0;
    }
    float _2407 = _2397;
    float _2409 = _2391 * _2389;
    float _2411 = _2409 * 0.5;
    float _2413 = exp2(_2363);
    float _2415 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2417 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2415);
    float _2419 = 1.0 / _2417;
    float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2423 = _2419 * _2421;
    float _2425 = _2407;
    if (!_2373)
    {
        float _2427 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2429 = _2427 * 0.15915493667125701904296875;
        float _2431 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2433 = _2429 * 6.283185482025146484375;
        float _2435 = cos(_2433);
        float _2437 = _2431 * 0.15915493667125701904296875;
        float _2439 = _2429 * 6.283185482025146484375;
        float _2441 = sin(_2439);
        float _2443 = 1.0 / _2435;
        float _2445 = _2437 * 6.283185482025146484375;
        float _2447 = cos(_2445);
        float _2449 = _2441 * _2443;
        float _2451 = _2437 * 6.283185482025146484375;
        float _2453 = sin(_2451);
        float _2455 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2457 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2455;
        float _2459 = _2447 * _2449;
        float _2461 = 1.0 / _2457;
        float _2463 = 1.0 / _2459;
        float _2465 = _2453 * _2463;
        float _2467 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2469 = fma(_2423, _2465, _2467);
        float _2471 = _2469 * _2461;
        float _2473 = precise::clamp(_2471, 0.0, 1.0);
        _2425 = _2473;
    }
    float _2475 = _2425;
    if (!_2373)
    {
        float _2477 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2479 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2481 = _2477 * 0.15915493667125701904296875;
        float _2483 = _2479 * 0.15915493667125701904296875;
        float _2485 = _2481 * 6.283185482025146484375;
        float _2487 = cos(_2485);
        float _2489 = _2481 * 6.283185482025146484375;
        float _2491 = sin(_2489);
        float _2493 = 1.0 / _2487;
        float _2495 = _2483 * 6.283185482025146484375;
        float _2497 = cos(_2495);
        float _2499 = _2491 * _2493;
        float _2501 = _2483 * 6.283185482025146484375;
        float _2503 = sin(_2501);
        float _2505 = _2497 * _2499;
        float _2507 = 1.0 / _2505;
        float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2511 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2509;
        float _2513 = 1.0 / _2511;
        float _2515 = _2503 * _2507;
        float _2517 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2519 = fma(_2423, _2515, _2517);
        float _2521 = _2519 * _2513;
        float _2523 = precise::clamp(_2521, 0.0, 1.0);
        float _2525 = -_2523;
        float _2527 = _2525 + 1.0;
        _2405 = _2527;
    }
    float _2529 = _2405;
    float _2531 = -_2413;
    float _2533 = _2531 + 1.0;
    float _2535 = _2475 * _2529;
    bool _2537 = _2475 > 0.0;
    bool _2539 = isnan(_2475);
    bool _2541 = _2537 || _2539;
    bool _2543 = isnan(0.0);
    bool _2545 = _2541 || _2543;
    float _2547 = _2403 + _2262;
    float _2549 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2551 = _2535 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2553 = _2529 <= 0.0;
    bool _2555 = !_2545;
    bool _2557 = _2553 || _2555;
    float _2559 = _2547 * 0.5;
    float _2561 = _2549 * _2336;
    float _2563 = -_2549;
    float _2565 = _2563 + 1.0;
    float _2567 = _2347 * _2561;
    float _2569 = _2357 * _2561;
    out.gl_Position.x = _2308;
    out.gl_Position.y = _2302;
    out.gl_Position.z = _2403;
    out.gl_Position.w = _2262;
    float _2571 = _2551 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2573 = fma(_2353, _2567, _2341);
    float _2575 = fma(_2355, _2567, _2343);
    float _2577 = _2347 * _2565;
    float _2579 = fma(_2347, _2569, _2345);
    out.m_65.z = _2559;
    out.m_65.w = _2262;
    out.m_45.x = _2571;
    out.m_67.x = _2573;
    out.m_67.y = _2575;
    out.m_67.z = _2579;
    out.m_67.w = _2577;
    if (!_2557)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2581 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2581;
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
    bool _1268 = false;
    bool _992 = false;
    bool _850 = false;
    bool _574 = false;
    bool _448 = false;
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
        float _2638 = as_type<float>(_102);
        out.gl_Position.z = _2638;
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
    float _122 = _120;
    if (_116)
    {
        float _124 = float(_86);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _120 >= _126;
    bool _130 = !_116;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _104 = as_type<int>(_138);
    }
    int _140 = _104;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2708 = as_type<float>(_140);
        out.gl_Position.z = _2708;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.w;
    float _144 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_47.x;
    float _158 = in.m_47.y;
    float _160 = in.m_47.z;
    float _162 = in.m_42.x;
    float _164 = in.m_42.y;
    float _166 = in.m_42.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _222 = !_154;
    float _224 = _220;
    float _226 = _218;
    if (!_222)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _144 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _170 = _246;
    }
    float _248 = _170;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _254 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _256 = _220 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_154)
    {
        float _258 = _120 * _120;
        float _260 = _258 * 0.5;
        _224 = _260;
    }
    float _262 = _224;
    float _264 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[8].x, _252);
    float _266 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[8].y, _254);
    float _268 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[8].z, _256);
    float _270 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_154)
    {
        float _272 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _226 = _272;
    }
    float _274 = _226;
    bool _276 = !_154;
    float _278 = _274;
    if (!_276)
    {
        float _280 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = log2(_280);
        float _284 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _286 = _284 + 1.0;
        float _288 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = _120 * _282;
        float _292 = exp2(_290);
        float _294 = _288 * 0.693147182464599609375;
        float _296 = 1.0 / _294;
        float _298 = 1.0 / _286;
        float _300 = _292 + (-1.0);
        float _302 = -_300;
        float _304 = fma(_302, _296, _120);
        float _306 = _304 * _298;
        float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _278 = _308;
    }
    float _310 = _278;
    float _312 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _314 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[10].x, _264);
    float _316 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[10].y, _266);
    float _318 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = _312 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _322 = _312 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _324 = _312 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _326 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[10].z, _268);
    float _328 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[8].x, _320);
    float _330 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[8].y, _322);
    float _332 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[8].z, _324);
    float _334 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _336 = fma(_248, _156, _314);
    float _338 = fma(_248, _158, _316);
    float _340 = fma(_248, _160, _326);
    float _342 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].x, _328);
    float _344 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].y, _330);
    float _346 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[10].z, _332);
    float _348 = _334;
    if (!_154)
    {
        _348 = _120;
    }
    float _350 = _348;
    bool _352 = !_154;
    float _354 = _350;
    if (!_352)
    {
        float _356 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = log2(_356);
        float _360 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _362 = _360 + 1.0;
        float _364 = 1.0 / _362;
        float _366 = _120 * _358;
        float _368 = exp2(_366);
        float _370 = -_368;
        float _372 = _370 + 1.0;
        float _374 = _372 * _364;
        _354 = _374;
    }
    float _376 = _354;
    float _378 = fma(_376, _158, _344);
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _382 = fma(_376, _156, _342);
    float _384 = fma(_338, _142, _164);
    float _386 = -_378;
    float _388 = _338 + _386;
    float _390 = fma(_376, _160, _346);
    float _392 = fma(_336, _142, _162);
    float _394 = -_382;
    float _396 = _336 + _394;
    float _398 = _388 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _400 = _388 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _402 = _388 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _404 = -_390;
    float _406 = _340 + _404;
    float _408 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[4].x, _398);
    float _410 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[5].x, _400);
    float _412 = fma(_396, (*spvDescriptorSet0.vp_c10)._m0[6].x, _402);
    float _414 = fma(_340, _142, _166);
    float _416 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[4].z, _408);
    float _418 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[5].z, _410);
    float _420 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[6].z, _412);
    bool _422 = !_380;
    float _424 = _418;
    float _426 = _416;
    float _428 = _420;
    float _446;
    if (!_422)
    {
        float _430 = in.m_51.x;
        float _432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _434 = _430 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _436 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _438 = _436 * _432;
        float _440 = floor(_438);
        float _442 = -_440;
        float _444 = _438 + _442;
        _446 = _444;
        _448 = true;
    }
    else
    {
        float _450 = float(_86);
        float _452 = 1.0 / _450;
        float _454 = _120 * _452;
        _446 = _454;
    }
    _448 = false;
    float _456 = _446;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _460 = _456 + _458;
    bool _462 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _464 = isnan(_456);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _474;
    float _478 = 1.0 / _476;
    bool _480 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _482 = isnan(_456);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -_472;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _500;
    bool _504 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _506;
    float _510 = _490 * _494;
    float _512 = -_490;
    float _514 = _512 + 1.0;
    float _516 = _460 * _478;
    float _518 = in.m_49.x;
    float _520 = in.m_49.y;
    float _522 = in.m_49.z;
    float _524 = fma(_498, _516, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _526 = fma(_508, _516, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _528 = fma(_502, _516, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _530 = _524 * _510;
    float _532 = _526 * _510;
    float _534 = _528 * _510;
    float _536 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[143].x, _530);
    float _538 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[143].y, _532);
    float _540 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[143].z, _534);
    float _542 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[144].x, _536);
    float _544 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[144].y, _538);
    float _546 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[144].z, _540);
    float _548 = _544 * _520;
    float _550 = _542 * _518;
    float _552 = _546 * _522;
    bool _554 = !_504;
    float _572;
    if (!_554)
    {
        float _556 = in.m_51.x;
        float _558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _560 = _556 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _562 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _564 = _562 * _558;
        float _566 = floor(_564);
        float _568 = -_566;
        float _570 = _564 + _568;
        _572 = _570;
        _574 = true;
    }
    else
    {
        float _576 = float(_86);
        float _578 = 1.0 / _576;
        float _580 = _120 * _578;
        _572 = _580;
    }
    _574 = false;
    float _582 = _572;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _586 = _582 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _590 = _582 + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _594 = _582 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _612 = 1.0 / _602;
    bool _614 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _616 = isnan(_582);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = 1.0 / _606;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _628;
    bool _632 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _634 = 1.0 / _610;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _638 = _582 + _636;
    float _640 = 1.0 / _598;
    float _642 = _638 * _612;
    bool _644 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _646 = isnan(_582);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = _586 * _626;
    bool _658 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _660 = isnan(_582);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -_654;
    float _672 = _670 + 1.0;
    float _674 = _590 * _634;
    bool _676 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _678 = isnan(_582);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = fma(_630, _656, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _690 = _668 * _672;
    float _692 = -_668;
    float _694 = _692 + 1.0;
    float _696 = -_686;
    float _698 = _696 + 1.0;
    float _700 = _594 * _640;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _702;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _706;
    float _710 = fma(_704, _656, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _712 = fma(_708, _656, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _714 = _582 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _716 = isnan(_582);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = _686 * _694;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _740 = _724 * _698;
    float _742 = -_724;
    float _744 = _742 + 1.0;
    float _746 = fma(_730, _674, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _748 = fma(_738, _674, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _750 = fma(_734, _674, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _752 = _624 * _744;
    float _754 = -_624;
    float _756 = _754 + 1.0;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _758;
    float _762 = _710 * _752;
    float _764 = _712 * _752;
    float _766 = _688 * _752;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _772;
    float _776 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].x, _762);
    float _778 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].y, _764);
    float _780 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[107].z, _766);
    float _782 = fma(_770, _700, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _784 = fma(_774, _700, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _786 = fma(_760, _700, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _788 = fma(_746, _740, _776);
    float _790 = fma(_750, _740, _780);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _800 = fma(_748, _740, _778);
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _806 = fma(_782, _726, _788);
    float _808 = fma(_794, _642, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _810 = fma(_798, _642, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _812 = fma(_804, _642, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _814 = fma(_784, _726, _800);
    float _816 = fma(_786, _726, _790);
    float _818 = fma(_808, _690, _806);
    float _820 = fma(_810, _690, _814);
    float _822 = fma(_812, _690, _816);
    float _824 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[111].x, _818);
    float _826 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[111].y, _820);
    float _828 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[111].z, _822);
    bool _830 = !_632;
    float _848;
    if (!_830)
    {
        float _832 = in.m_51.x;
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _836 = _832 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _840 = _838 * _834;
        float _842 = floor(_840);
        float _844 = -_842;
        float _846 = _840 + _844;
        _848 = _846;
        _850 = true;
    }
    else
    {
        float _852 = float(_86);
        float _854 = 1.0 / _852;
        float _856 = _120 * _854;
        _848 = _856;
    }
    _850 = false;
    float _858 = _848;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _862 = _858 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _868 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _870 = isnan(_858);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _884 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _886 = isnan(_858);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _896;
    bool _900 = _858 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _902 = isnan(_858);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = 1.0 / _866;
    float _914 = -_878;
    float _916 = _914 + 1.0;
    bool _918 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _920 = _894 * _916;
    float _922 = -_894;
    float _924 = _922 + 1.0;
    float _926 = 1.0 / _882;
    float _928 = _898 * _912;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _934 = fma(_928, _862, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _936 = _828 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _938 = _932 * _926;
    float _940 = _934 * _920;
    float _942 = -_910;
    float _944 = _942 + 1.0;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _948 = _858 + _946;
    float _950 = _824 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _952 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[115].x, _940);
    float _954 = _878 * _944;
    float _956 = fma(_938, _948, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _958 = _826 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _960 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = fma(_956, _954, _952);
    float _964 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[117].x, _962);
    float _966 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _964 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _960;
    out.m_53.y = _966;
    out.m_53.z = _968;
    out.m_53.w = _970;
    bool _972 = !_918;
    float _990;
    if (!_972)
    {
        float _974 = in.m_51.x;
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _978 = _974 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _980 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _982 = _980 * _976;
        float _984 = floor(_982);
        float _986 = -_984;
        float _988 = _982 + _986;
        _990 = _988;
        _992 = true;
    }
    else
    {
        float _994 = float(_86);
        float _996 = 1.0 / _994;
        float _998 = _120 * _996;
        _990 = _998;
    }
    _992 = false;
    float _1000 = _990;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1004 = _1000 + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1008 = _1000 + _1006;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1012 = _1000 + _1010;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1030 = 1.0 / _1016;
    bool _1032 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1034 = isnan(_1000);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = 1.0 / _1020;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1048 = _1000 + _1046;
    float _1050 = 1.0 / _1024;
    float _1052 = _1012 * _1030;
    bool _1054 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1056 = isnan(_1000);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    bool _1066 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1068 = 1.0 / _1028;
    float _1070 = _1004 * _1044;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1072;
    float _1076 = fma(_1074, _1052, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1078 = _1008 * _1050;
    bool _1080 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1082 = isnan(_1000);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1096;
    float _1100 = -_1090;
    float _1102 = _1100 + 1.0;
    float _1104 = fma(_1094, _1052, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1106 = _1048 * _1068;
    bool _1108 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1110 = isnan(_1000);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = fma(_1098, _1052, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1122 = _1000 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1124 = isnan(_1000);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = _1064 * _1102;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1140 = -_1118;
    float _1142 = _1140 + 1.0;
    float _1144 = -_1064;
    float _1146 = _1144 + 1.0;
    float _1148 = fma(_1138, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1150 = _1132 * _1142;
    float _1152 = -_1132;
    float _1154 = _1152 + 1.0;
    float _1156 = _1118 * _1146;
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1160 = _1158 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1166 = _1042 * _1154;
    float _1168 = fma(_1160, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1170 = fma(_1164, _1070, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1172 = _1104 * _1166;
    float _1174 = _1076 * _1166;
    float _1176 = -_1042;
    float _1178 = _1176 + 1.0;
    float _1180 = _1120 * _1166;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1190;
    float _1194 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1174);
    float _1196 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1172);
    float _1198 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1180);
    float _1200 = fma(_1184, _1078, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1202 = fma(_1188, _1078, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1204 = fma(_1192, _1078, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1206 = fma(_1168, _1150, _1194);
    float _1208 = fma(_1170, _1150, _1196);
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1212 = _1210 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1218 = fma(_1148, _1150, _1198);
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1224 = fma(_1200, _1156, _1206);
    float _1226 = fma(_1212, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1228 = fma(_1216, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1230 = fma(_1202, _1156, _1208);
    float _1232 = fma(_1222, _1106, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1234 = fma(_1204, _1156, _1218);
    float _1236 = fma(_1226, _1134, _1224);
    float _1238 = fma(_1228, _1134, _1230);
    float _1240 = fma(_1232, _1134, _1234);
    float _1242 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1236);
    float _1244 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1238);
    float _1246 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1240);
    bool _1248 = !_1066;
    float _1266;
    if (!_1248)
    {
        float _1250 = in.m_51.x;
        float _1252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1254 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1256 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _1258 = _1256 * _1252;
        float _1260 = floor(_1258);
        float _1262 = -_1260;
        float _1264 = _1258 + _1262;
        _1266 = _1264;
        _1268 = true;
    }
    else
    {
        float _1270 = float(_86);
        float _1272 = 1.0 / _1270;
        float _1274 = _120 * _1272;
        _1266 = _1274;
    }
    _1268 = false;
    float _1276 = _1266;
    float _1278 = in.m_51.w;
    float _1280 = _384 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1282 = _384 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1284 = in.m_55.x;
    float _1286 = in.m_55.y;
    float _1288 = in.m_55.z;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1292 = _1290 != 0;
    float _1294 = _384 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1298 = _1296 != 0;
    float _1300 = in.m_57.y;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1304 = _1302 != 0;
    float _1306 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1294);
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1310 = _1308 != 0;
    float _1312 = in.m_51.x;
    float _1314 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1280);
    float _1316 = fma(_392, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1282);
    float _1318 = in.m_51.y;
    float _1320 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1322 = in.m_57.x;
    float _1324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1326 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1314);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1330 = _1276 + _1328;
    bool _1332 = _1278 > 0.5;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1336 = _1234;
    float _1338 = _1324;
    bool _1340 = _1332;
    float _1342 = _1316;
    if (_1292)
    {
        float _1344 = in.m_51.z;
        _1336 = _1344;
    }
    float _1346 = _1336;
    float _1348 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1316);
    float _1350 = _1326 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1354 = _1352 != 0;
    float _1356 = _1320 * _1300;
    float _1358 = _1348 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1286);
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1366 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1284);
    float _1368 = -_1300;
    float _1370 = _1368 + 1.0;
    float _1372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1288);
    float _1374 = 1.0 / _1364;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1378 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1380 = _1300;
    float _1382 = _1356;
    if (_1304)
    {
        float _1384 = _1332 ? _1370 : _1300;
        _1380 = _1384;
    }
    float _1386 = _1380;
    float _1388 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1390 = _1318 > 0.5;
    float _1392 = -_1376;
    float _1394 = fma(_1378, 2.0, _1392);
    float _1396 = fma(_1388, -2.0, _1334);
    float _1398 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1400 = _1320 * _1360;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1402;
    float _1406 = -_1356;
    float _1408 = _1406 + 1.0;
    float _1410 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1306);
    float _1412 = _1360;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1354)
    {
        float _1416 = in.m_51.z;
        _1412 = _1416;
    }
    float _1418 = _1412;
    float _1420 = _1404 * _1374;
    float _1422 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1424 = _1422;
    if (_1310)
    {
        float _1426 = _1390 ? _1408 : _1356;
        _1382 = _1426;
    }
    float _1428 = _1382;
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1432 = fma(_1420, _1330, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1434 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1436 = _1398 * _1372;
    if (!_1354)
    {
        _1414 = _1318;
    }
    float _1438 = _1414;
    float _1440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1442 = _1438;
    if (!_1292)
    {
        _1338 = _1322;
    }
    float _1444 = _1338;
    float _1446 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1430);
    bool _1448 = _1312 > 0.5;
    float _1450 = fma(_1422, _1386, -0.5);
    float _1452 = _1444;
    if (_1354)
    {
        _1442 = _1312;
    }
    float _1454 = _1442;
    float _1456 = _1434 * _1366;
    float _1458 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1460 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1462 = _1400 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (!_1292)
    {
        _1424 = _1444;
    }
    float _1464 = _1424;
    float _1466 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1458);
    float _1468 = _1464;
    if (_1292)
    {
        _1452 = _1322;
    }
    float _1470 = _1452;
    float _1472 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1460);
    float _1474 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1462);
    if (_1292)
    {
        bool _1476 = _1346 > 0.5;
        _1340 = _1476;
    }
    bool _1478 = _1340;
    float _1480 = _1410 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1482 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1474);
    float _1484 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1466);
    float _1486 = _1440 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1488 = _1418;
    if (!_1354)
    {
        _1342 = _1418;
    }
    float _1490 = _1342;
    float _1492 = _1482 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1496 = _1484 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1498 = fma(_1486, _1428, -0.5);
    float _1500 = _1480 + _1492;
    float _1502 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1494);
    float _1504 = _1490;
    int _1506 = as_type<int>(_1498);
    float _1508 = _1500;
    if (_1354)
    {
        _1504 = _1318;
    }
    float _1510 = _1504;
    float _1512 = _1350 + _1496;
    float _1514 = _1512;
    if (_1354)
    {
        _1488 = _1318;
    }
    float _1516 = _1488;
    float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1520 = _1500 + _1518;
    float _1522 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1502);
    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1526 = _1512 + _1524;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1530 = _1520 * _1520;
    bool _1532 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1534 = isnan(_1276);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1396);
    bool _1546 = _1276 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1548 = isnan(_1276);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    float _1558 = fma(_1526, _1526, _1530);
    float _1560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1562 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1528);
    float _1564 = _1454 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1566 = -_1544;
    float _1568 = fma(_1522, _1498, _1566);
    float _1570 = -_1556;
    float _1572 = _1570 + 1.0;
    if (_1292)
    {
        float _1574 = -_1470;
        float _1576 = _1574 + 1.0;
        _1506 = as_type<int>(_1576);
    }
    int _1578 = _1506;
    float _1580 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1472);
    float _1582 = sqrt(_1558);
    float _1584 = _1542 * _1572;
    float _1586 = _1434 * _1470;
    float _1588 = _1586;
    if (_1292)
    {
        float _1590 = _1478 ? as_type<float>(_1578) : _1470;
        _1468 = _1590;
    }
    float _1592 = _1468;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1596 = _1432 * _1584;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1600 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1604 = -_1586;
    float _1606 = _1604 + 1.0;
    float _1608 = _1560 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1610 = _1580 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1612 = -_1594;
    float _1614 = fma(_1564, 2.0, _1612);
    float _1616 = -_1542;
    float _1618 = _1616 + 1.0;
    float _1620 = fma(_1600, -2.0, _1598);
    bool _1622 = _1582 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1624 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1562);
    if (_1298)
    {
        float _1626 = _1448 ? _1606 : _1586;
        _1588 = _1626;
    }
    float _1628 = _1588;
    float _1630 = fma(_1608, _1592, -0.5);
    float _1632 = _1358 + _1610;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1636 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1596);
    float _1638 = -_120;
    float _1640 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1614);
    float _1642 = _1602 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1644 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1634);
    float _1646 = fma(_1556, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1636);
    float _1648 = fma(_1624, _1630, _1640);
    float _1650 = fma(_1642, _1628, -0.5);
    float _1652 = _1642;
    if (!_1622)
    {
        _1652 = _1512;
    }
    float _1654 = _1652;
    float _1656 = _1654;
    if (!_1622)
    {
        _1514 = _1632;
    }
    float _1658 = _1514;
    bool _1660 = !_1622;
    float _1662 = _1658;
    if (!_1660)
    {
        float _1664 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1666 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1668 = _1582 + _1666;
        float _1670 = rsqrt(_1558);
        float _1672 = _1668 * _1664;
        float _1674 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1676 = _1672 * 0.15915493667125701904296875;
        float _1678 = _1676 * 6.283185482025146484375;
        float _1680 = cos(_1678);
        float _1682 = _1676 * 6.283185482025146484375;
        float _1684 = sin(_1682);
        float _1686 = _1680 + (-1.0);
        float _1688 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1690 = fma(_1684, _1674, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1692 = fma(_1632, _1680, _1688);
        float _1694 = _1670 * _1690;
        float _1696 = fma(_1526, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1698 = fma(_1520, _1694, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1662 = _1692;
        _1656 = _1696;
        _1508 = _1698;
    }
    float _1700 = _1662;
    float _1702 = _1656;
    float _1704 = _1508;
    float _1706 = -_1358;
    float _1708 = _1706 + _1700;
    float _1710 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1644);
    float _1712 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1620);
    float _1714 = -_1350;
    float _1716 = _1714 + _1702;
    float _1718 = _1708 * _1708;
    float _1720 = -_1480;
    float _1722 = _1720 + _1704;
    float _1724 = -_1712;
    float _1726 = fma(_1710, _1450, _1724);
    float _1728 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1446);
    float _1730 = fma(_1716, _1716, _1718);
    float _1732 = -_120;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1394);
    float _1736 = _1242 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1738 = _1244 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1740 = fma(_1722, _1722, _1730);
    float _1742 = fma(_1728, _1650, _1734);
    float _1744 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1746 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1748 = sqrt(_1740);
    float _1750 = _1738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1754 = _1568 + 0.5;
    float _1756 = _1646 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1758 = _1648 + 0.5;
    float _1760 = _1726 + 0.5;
    float _1762 = _1742 + 0.5;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    out.m_61.x = _1746;
    out.m_61.y = _1750;
    out.m_61.z = _1752;
    out.m_61.w = _1756;
    bool _1764 = _1748 > 0.0;
    out.m_63.x = _1762;
    out.m_63.y = _1754;
    out.m_63.z = _1758;
    out.m_63.w = _1760;
    bool _1766 = !_1764;
    float _1768 = 1.0;
    float _1770 = _1746;
    float _1772 = _1700;
    float _1774 = _1702;
    float _1776 = _1704;
    float _1778 = _1746;
    float _1780 = 1.0;
    float _1782 = 1.0;
    if (!_1766)
    {
        bool _1784 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1786 = 1.0;
        if (_1784)
        {
            float _1788 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1786 = _1788;
        }
        float _1790 = _1786;
        float _1792 = _1790;
        if (_1784)
        {
            float _1794 = _416 * _1790;
            _1768 = _1794;
        }
        float _1796 = _1768;
        float _1798 = _1796;
        if (_1784)
        {
            float _1800 = _418 * _1790;
            _1770 = _1800;
        }
        float _1802 = _1770;
        float _1804 = _1802;
        if (_1784)
        {
            float _1806 = _420 * _1790;
            _1792 = _1806;
        }
        float _1808 = _1792;
        float _1810 = _1808;
        if (!_1784)
        {
            float _1812 = _120 + 1.0;
            if (!_154)
            {
                float _1814 = _1812 * _1812;
                float _1816 = _1814 * 0.5;
                _122 = _1816;
            }
            float _1818 = _122;
            float _1820 = _1818;
            if (!_154)
            {
                float _1822 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1820 = _1822;
            }
            float _1824 = _1820;
            bool _1826 = !_154;
            float _1828 = _1824;
            if (!_1826)
            {
                float _1830 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1832 = log2(_1830);
                float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1836 = 1.0 + _1834;
                float _1838 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1840 = _1832 * _1812;
                float _1842 = exp2(_1840);
                float _1844 = _1838 * 0.693147182464599609375;
                float _1846 = 1.0 / _1844;
                float _1848 = 1.0 / _1836;
                float _1850 = _1842 + (-1.0);
                float _1852 = -_1850;
                float _1854 = fma(_1852, _1846, _1812);
                float _1856 = _1854 * _1848;
                float _1858 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1828 = _1858;
            }
            float _1860 = _1828;
            float _1862 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1864 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1866 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1868 = _1862 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1870 = _1862 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1872 = fma(_1864, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1868);
            float _1874 = _1862 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1876 = fma(_1864, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1870);
            float _1878 = _1870;
            if (!_154)
            {
                _1878 = _1812;
            }
            float _1880 = _1878;
            float _1882 = fma(_1866, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1872);
            bool _1884 = !_154;
            float _1886 = _1880;
            if (!_1884)
            {
                float _1888 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1890 = log2(_1888);
                float _1892 = _1890 * _1812;
                float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1896 = 1.0 + _1894;
                float _1898 = exp2(_1892);
                float _1900 = 1.0 / _1896;
                float _1902 = -_1898;
                float _1904 = _1902 + 1.0;
                float _1906 = _1904 * _1900;
                _1886 = _1906;
            }
            float _1908 = _1886;
            float _1910 = fma(_1864, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1874);
            float _1912 = fma(_1866, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1876);
            float _1914 = fma(_1908, _158, _1882);
            float _1916 = fma(_1866, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1910);
            float _1918 = fma(_1908, _156, _1912);
            float _1920 = -_378;
            float _1922 = _1920 + _1914;
            float _1924 = fma(_1908, _160, _1916);
            float _1926 = -_382;
            float _1928 = _1926 + _1918;
            float _1930 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1932 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1934 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1936 = -_390;
            float _1938 = _1936 + _1924;
            float _1940 = fma(_1928, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1930);
            float _1942 = fma(_1928, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1932);
            float _1944 = fma(_1928, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1934);
            float _1946 = fma(_1938, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1940);
            float _1948 = fma(_1938, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1942);
            float _1950 = fma(_1938, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1944);
            _424 = _1948;
            _426 = _1946;
            _428 = _1950;
            _1798 = _1946;
            _1804 = _1948;
            _1810 = _1950;
        }
        float _1952 = _424;
        float _1954 = _426;
        float _1956 = _428;
        float _1958 = _1798;
        float _1960 = _1804;
        float _1962 = _1810;
        float _1964 = _1952 * _1952;
        float _1966 = rsqrt(_1740);
        float _1968 = fma(_1954, _1954, _1964);
        float _1970 = fma(_1956, _1956, _1968);
        float _1972 = sqrt(_1970);
        float _1974 = _1716 * _1966;
        float _1976 = _1708 * _1966;
        float _1978 = _1722 * _1966;
        bool _1980 = _1972 > 0.0;
        bool _1982 = !_1980;
        _1778 = _1960;
        _1780 = _1958;
        _1782 = _1962;
        if (!_1982)
        {
            float _1984 = rsqrt(_1970);
            float _1986 = _1984 * _1952;
            float _1988 = _1984 * _1954;
            float _1990 = _1984 * _1956;
            float _1992 = _1976 * _1986;
            float _1994 = fma(_1974, _1988, _1992);
            float _1996 = fma(_1978, _1990, _1994);
            float _1998 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2000 = fma(_1958, _1998, _1702);
            float _2002 = fma(_1960, _1998, _1700);
            float _2004 = fma(_1962, _1998, _1704);
            _1772 = _2002;
            _1774 = _2000;
            _1776 = _2004;
        }
    }
    float _2006 = _1772;
    float _2008 = _1774;
    float _2010 = _1776;
    float _2012 = _1778;
    float _2014 = _1780;
    float _2016 = _1782;
    float _2018 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2020 = _2006 + _2018;
    float _2022 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2024 = _2008 + _2022;
    float _2026 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2028 = _2010 + _2026;
    float _2030 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2032 = _2020 * _2020;
    float _2034 = fma(_2024, _2024, _2032);
    float _2036 = fma(_2028, _2028, _2034);
    float _2038 = rsqrt(_2036);
    float _2040 = sqrt(_2036);
    float _2042 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2044 = _2024 * _2042;
    float _2046 = _2028 * _2042;
    float _2048 = _2044 * _2044;
    float _2050 = _2046 * _2046;
    float _2052 = _2048 + _2050;
    float _2054 = sqrt(_2052);
    bool _2056 = _2054 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2060 = _2054 + _2058;
    float _2062 = _2038;
    float _2064 = _2014;
    float _2066 = _2060;
    float _2068 = _2012;
    float _2070 = _2020;
    float _2072 = _2016;
    float _2074 = _2042;
    if (_2056)
    {
        float _2076 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2062 = _2076;
    }
    float _2078 = _2062;
    if (_2056)
    {
        float _2080 = rsqrt(_2052);
        _2064 = _2080;
    }
    float _2082 = _2064;
    float _2084 = _2082;
    if (_2056)
    {
        float _2086 = _2060 * _2078;
        _2066 = _2086;
    }
    float _2088 = _2066;
    if (_2056)
    {
        float _2090 = _2088 * 0.15915493667125701904296875;
        _2068 = _2090;
    }
    float _2092 = _2068;
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2096 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2094);
    float _2098 = precise::clamp(_2096, 0.0, 1.0);
    float _2100 = _2078;
    if (_2056)
    {
        float _2102 = _2092 * 6.283185482025146484375;
        float _2104 = sin(_2102);
        _2100 = _2104;
    }
    float _2106 = _2100;
    float _2108 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2110 = precise::max(0.0, _2108);
    float _2112 = _2028;
    float _2114 = _2110;
    if (_2056)
    {
        float _2116 = _2092 * 6.283185482025146484375;
        float _2118 = cos(_2116);
        _2112 = _2118;
    }
    float _2120 = _2112;
    float _2122 = -_2042;
    float _2124 = -_2110;
    float _2126 = fma(_2020, _2122, _2124);
    if (!_2056)
    {
        _2070 = _2046;
    }
    float _2128 = _2070;
    float _2130 = _2128;
    if (_2056)
    {
        float _2132 = _2126 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2114 = _2132;
    }
    float _2134 = _2114;
    float _2136 = _2106;
    float _2138 = _2134;
    if (_2056)
    {
        float _2140 = fma(_2106, _2134, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2072 = _2140;
    }
    float _2142 = _2072;
    float _2144 = _2142;
    if (!_2056)
    {
        _2136 = _2044;
    }
    float _2146 = _2136;
    float _2148 = _2146;
    float _2150 = _2120;
    if (_2056)
    {
        float _2152 = _2120 + (-1.0);
        _2138 = _2152;
    }
    float _2154 = _2138;
    float _2156 = _2154;
    if (_2056)
    {
        float _2158 = _2082 * _2142;
        _2144 = _2158;
    }
    float _2160 = _2144;
    if (!_2056)
    {
        _2084 = _2126;
    }
    float _2162 = _2084;
    float _2164 = _2162;
    if (_2056)
    {
        float _2166 = _2154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2074 = _2166;
    }
    float _2168 = _2074;
    if (_2056)
    {
        float _2170 = _2044 * _2160;
        _2148 = _2170;
    }
    float _2172 = _2148;
    if (!_2056)
    {
        _2156 = _2048;
    }
    float _2174 = _2156;
    float _2176 = _2174;
    if (_2056)
    {
        float _2178 = _2046 * _2160;
        _2130 = _2178;
    }
    float _2180 = _2130;
    if (_2056)
    {
        float _2182 = fma(_2126, _2120, _2168);
        _2164 = _2182;
    }
    float _2184 = _2164;
    float _2186 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_2056)
    {
        float _2188 = _2172 * _2172;
        _2176 = _2188;
    }
    float _2190 = _2176;
    if (!_2056)
    {
        _2150 = _2050;
    }
    float _2192 = _2150;
    float _2194 = _2192;
    if (_2056)
    {
        float _2196 = _2180 * _2180;
        _2194 = _2196;
    }
    float _2198 = _2194;
    float _2200 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2186);
    float _2202 = fma(_2184, _2184, _2190);
    float _2204 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2206 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2208 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2200);
    float _2210 = _2202 + _2198;
    float _2212 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2204);
    float _2214 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2206);
    float _2216 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2218 = -_2098;
    float _2220 = _2218 + 1.0;
    float _2222 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2212);
    float _2224 = rsqrt(_2210);
    float _2226 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2214);
    float _2228 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2216);
    float _2230 = _2222 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2232 = _2226 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2234 = _2208 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2236 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2238 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2228);
    float _2240 = _2232 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2242 = abs(_2220);
    float _2244 = log2(_2242);
    float _2246 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2236);
    float _2248 = _2238 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2250 = -_2240;
    float _2252 = fma(_2250, _2030, 1.0);
    float _2254 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2246);
    float _2256 = _2224 * _2172;
    float _2258 = _2224 * _2184;
    float _2260 = _2224 * _2180;
    float _2262 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2254);
    float _2264 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2266 = log2(_2252);
    float _2268 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2270 = _2258 + 1.0;
    float _2272 = -_2264;
    float _2274 = fma(_2258, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2272);
    float _2276 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2278 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2268);
    float _2280 = -_2260;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2274);
    float _2284 = 1.0 / _2262;
    float _2286 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2288 = fma(_2282, -0.5, 0.5);
    float _2290 = fma(_2282, 0.5, 0.5);
    float _2292 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2286);
    float _2294 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2278);
    float _2296 = exp2(_2276);
    float _2298 = fma(_2290, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2300 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2292);
    float _2302 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2294);
    float _2304 = _2266 * 0.693147182464599609375;
    float _2306 = fma(_2290, _2298, -0.212114393711090087890625);
    float _2308 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2300);
    float _2310 = sqrt(_2288);
    float _2312 = fma(_2290, _2306, 1.570728778839111328125);
    float _2314 = _2308 * _2284;
    float _2316 = _2302 * _2284;
    float _2318 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2320 = fma(_2314, 0.5, 0.5);
    float _2322 = fma(_2316, -0.5, 0.5);
    float _2324 = -_2258;
    float _2326 = fma(_2296, _2270, _2324);
    float _2328 = fma(_2326, 0.5, 0.5);
    float _2330 = _2310 * 0.636619746685028076171875;
    float _2332 = -_2312;
    float _2334 = fma(_2330, _2332, 1.0);
    float3 _6325 = float3(_2320, _2322, _2318);
    float _2336 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6325, float3(0.0), isnan(_6325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6325, float3(0.0), isnan(_6325)), level(0.0)).x;
    float3 _6336 = float3(_2320, _2322, _2318);
    float4 _2339 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6336, float3(0.0), isnan(_6336)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6336, float3(0.0), isnan(_6336)), level(0.0)).xyzw;
    float _2341 = _2339.x;
    float _2343 = _2339.y;
    float _2345 = _2339.z;
    float _2347 = _2339.w;
    float2 _6353 = float2(_2334, _2328);
    float3 _2351 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6353, float2(0.0), isnan(_6353)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6353, float2(0.0), isnan(_6353)), level(0.0)).xyz;
    float _2353 = _2351.x;
    float _2355 = _2351.y;
    float _2357 = _2351.z;
    float _2359 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2361 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2363 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2365 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2367 = isnan(0.5);
    bool _2369 = _2365 || _2367;
    bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2373 = _2369 || _2371;
    float _2375 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2359);
    float _2377 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2361);
    float _2379 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2375);
    float _2381 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2377);
    float _2383 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2385 = _2381 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2387 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2389 = 1.0 / _2383;
    float _2391 = _2385 + _2383;
    float _2393 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2387);
    float _2395 = _2234;
    float _2397 = _2248;
    if (_2373)
    {
        _2395 = 1.0;
    }
    float _2399 = _2395;
    float _2401 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2393);
    float _2403 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2401);
    float _2405 = _2399;
    if (_2373)
    {
        _2397 = 1.0;
    }
    float _2407 = _2397;
    float _2409 = _2391 * _2389;
    float _2411 = _2409 * 0.5;
    float _2413 = exp2(_2363);
    float _2415 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2417 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2415);
    float _2419 = 1.0 / _2417;
    float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2423 = _2419 * _2421;
    float _2425 = _2407;
    if (!_2373)
    {
        float _2427 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2429 = _2427 * 0.15915493667125701904296875;
        float _2431 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2433 = _2429 * 6.283185482025146484375;
        float _2435 = cos(_2433);
        float _2437 = _2431 * 0.15915493667125701904296875;
        float _2439 = _2429 * 6.283185482025146484375;
        float _2441 = sin(_2439);
        float _2443 = 1.0 / _2435;
        float _2445 = _2437 * 6.283185482025146484375;
        float _2447 = cos(_2445);
        float _2449 = _2441 * _2443;
        float _2451 = _2437 * 6.283185482025146484375;
        float _2453 = sin(_2451);
        float _2455 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2457 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2455;
        float _2459 = _2447 * _2449;
        float _2461 = 1.0 / _2457;
        float _2463 = 1.0 / _2459;
        float _2465 = _2453 * _2463;
        float _2467 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2469 = fma(_2423, _2465, _2467);
        float _2471 = _2469 * _2461;
        float _2473 = precise::clamp(_2471, 0.0, 1.0);
        _2425 = _2473;
    }
    float _2475 = _2425;
    if (!_2373)
    {
        float _2477 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2479 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2481 = _2477 * 0.15915493667125701904296875;
        float _2483 = _2479 * 0.15915493667125701904296875;
        float _2485 = _2481 * 6.283185482025146484375;
        float _2487 = cos(_2485);
        float _2489 = _2481 * 6.283185482025146484375;
        float _2491 = sin(_2489);
        float _2493 = 1.0 / _2487;
        float _2495 = _2483 * 6.283185482025146484375;
        float _2497 = cos(_2495);
        float _2499 = _2491 * _2493;
        float _2501 = _2483 * 6.283185482025146484375;
        float _2503 = sin(_2501);
        float _2505 = _2497 * _2499;
        float _2507 = 1.0 / _2505;
        float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2511 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2509;
        float _2513 = 1.0 / _2511;
        float _2515 = _2503 * _2507;
        float _2517 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2519 = fma(_2423, _2515, _2517);
        float _2521 = _2519 * _2513;
        float _2523 = precise::clamp(_2521, 0.0, 1.0);
        float _2525 = -_2523;
        float _2527 = _2525 + 1.0;
        _2405 = _2527;
    }
    float _2529 = _2405;
    float _2531 = -_2413;
    float _2533 = _2531 + 1.0;
    float _2535 = _2475 * _2529;
    bool _2537 = _2475 > 0.0;
    bool _2539 = isnan(_2475);
    bool _2541 = _2537 || _2539;
    bool _2543 = isnan(0.0);
    bool _2545 = _2541 || _2543;
    float _2547 = _2403 + _2262;
    float _2549 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2551 = _2535 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2553 = _2529 <= 0.0;
    bool _2555 = !_2545;
    bool _2557 = _2553 || _2555;
    float _2559 = _2547 * 0.5;
    float _2561 = _2549 * _2336;
    float _2563 = -_2549;
    float _2565 = _2563 + 1.0;
    float _2567 = _2347 * _2561;
    float _2569 = _2357 * _2561;
    out.gl_Position.x = _2308;
    out.gl_Position.y = _2302;
    out.gl_Position.z = _2403;
    out.gl_Position.w = _2262;
    float _2571 = _2551 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2573 = fma(_2353, _2567, _2341);
    float _2575 = fma(_2355, _2567, _2343);
    float _2577 = _2347 * _2565;
    float _2579 = fma(_2347, _2569, _2345);
    out.m_65.z = _2559;
    out.m_65.w = _2262;
    out.m_45.x = _2571;
    out.m_67.x = _2573;
    out.m_67.y = _2575;
    out.m_67.z = _2579;
    out.m_67.w = _2577;
    if (!_2557)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2581 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2581;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

