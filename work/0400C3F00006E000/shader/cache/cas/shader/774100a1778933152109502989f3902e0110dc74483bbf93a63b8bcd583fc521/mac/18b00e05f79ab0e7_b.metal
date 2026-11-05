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
    texture2d<float> vp_t_tcb_1C [[id(8)]];
    sampler vp_t_tcb_1CSmplr [[id(9)]];
    sampler vp_t_tcb_32Smplr_w [[id(10)]];
    sampler vp_t_tcb_1CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_75 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 m_85 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
    float4 m_53 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1772 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_42.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    float _122 = _120;
    if (!_114)
    {
        out.m_45.x = 0.0;
    }
    int _124 = 0;
    if (!_114)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2005 = as_type<float>(_128);
        out.gl_Position.z = _2005;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_47.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_110);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    if (_158)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _118;
    if (_158)
    {
        out.m_45.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _130 = as_type<int>(_162);
    }
    int _164 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2074 = as_type<float>(_164);
        out.gl_Position.z = _2074;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_49.z;
    float _168 = _146 * 0.37000000476837158203125;
    float _170 = _146 * 0.430000007152557373046875;
    float _172 = in.m_51.x;
    float _174 = in.m_51.y;
    float _176 = in.m_51.z;
    float _178 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _180 = log2(_178);
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _184 = in.m_49.y;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _188 = _186 != 0;
    float _190 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _192 = in.m_53.x;
    float _194 = in.m_53.y;
    float _196 = in.m_49.x;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _202 = _166 * 2.0;
    float _204 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _206 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _208 = floor(_202);
    float _210 = _184 * 2.0;
    float _212 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _216 = fma(_192, 6.283185482025146484375, _168);
    float _218 = _184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _220 = floor(_210);
    float _222 = fma(_194, 6.283185482025146484375, _170);
    float _224 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _226 = fma(_218, -2.0, _182);
    float _228 = _196 + _166;
    float _230 = _196 * 2.0;
    float _232 = -_198;
    float _234 = fma(_224, 2.0, _232);
    float _236 = _184 + _166;
    float _238 = _228 + (-1.0);
    bool _240 = _208 > 0.0;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _244 = floor(_230);
    float _246 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _248 = _208 >= 0.0;
    bool _250 = isnan(_208);
    bool _252 = _248 || _250;
    bool _254 = isnan(0.0);
    bool _256 = _252 || _254;
    float _258 = _236 + (-1.0);
    float _260 = _238;
    float _262 = _208;
    float _264 = _190;
    if (_188)
    {
        _260 = _196;
    }
    float _266 = _260;
    float _268 = _184 + _196;
    float _270 = _266;
    if (!_188)
    {
        _262 = _184;
    }
    float _272 = _262;
    float _274 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _276 = _272;
    if (!_188)
    {
        _270 = _166;
    }
    float _278 = _270;
    float _280 = _268 + (-1.0);
    if (_188)
    {
        _276 = _196;
    }
    float _282 = _276;
    float _284 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _286 = _220 > 0.0;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _290 = _220 >= 0.0;
    bool _292 = isnan(_220);
    bool _294 = _290 || _292;
    bool _296 = isnan(0.0);
    bool _298 = _294 || _296;
    float _300 = _278 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _302 = _282 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _304 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _284);
    bool _306 = _244 > 0.0;
    float _308 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[83].z, _200);
    float _310 = -_288;
    float _312 = fma(_302, 2.0, _310);
    float _314 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _316 = _256 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _318 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _304);
    bool _320 = _244 >= 0.0;
    bool _322 = isnan(_244);
    bool _324 = _320 || _322;
    bool _326 = isnan(0.0);
    bool _328 = _324 || _326;
    float _330 = _304;
    float _332 = _316;
    if (!_188)
    {
        _330 = _166;
    }
    float _334 = _330;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _338 = ~as_type<int>(_316);
    int _340 = _338 + 1;
    int _342 = _340 + 1;
    float _344 = _334;
    int _346 = _342;
    if (_188)
    {
        _344 = _184;
    }
    float _348 = _344;
    if (!_240)
    {
        int _350 = ~as_type<int>(_316);
        int _352 = _350 + 1;
        _346 = _352;
    }
    int _354 = _346;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _358 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _362 = _358 || _360;
    bool _364 = isnan(1.0);
    bool _366 = _362 || _364;
    float _368 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[83].w, _336);
    float _370 = _298 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _372 = -_356;
    float _374 = fma(_300, 2.0, _372);
    float _376 = _370;
    if (_188)
    {
        _332 = _184;
    }
    float _378 = _332;
    int _380 = ~as_type<int>(_370);
    int _382 = _380 + 1;
    int _384 = _382 + 1;
    int _386 = _384;
    float _388 = _378;
    if (!_286)
    {
        int _390 = ~as_type<int>(_370);
        int _392 = _390 + 1;
        _386 = _392;
    }
    int _394 = _386;
    if (!_188)
    {
        _376 = _166;
    }
    float _396 = _376;
    int _398 = _328 ? 0 : 1;
    float _400 = 0.0;
    float _402 = _396;
    if (!_366)
    {
        float _404 = _190 * _190;
        float _406 = _404 * 0.5;
        _400 = _406;
    }
    float _408 = _400;
    float _410 = _408;
    if (_188)
    {
        _402 = _184;
    }
    float _412 = _402;
    if (!_188)
    {
        _388 = _196;
    }
    float _414 = _388;
    if (!_366)
    {
        float _416 = _408 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _410 = _416;
    }
    float _418 = _410;
    int _420 = ~_398;
    int _422 = _420 + 1;
    int _424 = _422 + 1;
    float _426 = _412 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _428 = _424;
    float _430 = _418;
    if (!_306)
    {
        int _432 = ~_398;
        int _434 = _432 + 1;
        _428 = _434;
    }
    int _436 = _428;
    float _438 = _414 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _440 = !_366;
    if (!_440)
    {
        float _442 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _444 = log2(_442);
        float _446 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _448 = _446 + 1.0;
        float _450 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _452 = _190 * _444;
        float _454 = 1.0 / _448;
        float _456 = _450 * 0.693147182464599609375;
        float _458 = exp2(_452);
        float _460 = 1.0 / _456;
        float _462 = _458 + (-1.0);
        float _464 = -_462;
        float _466 = fma(_464, _460, _190);
        float _468 = _466 * _454;
        float _470 = _468 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _430 = _470;
    }
    float _472 = _430;
    bool _474 = !_366;
    if (!_474)
    {
        float _476 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _478 = log2(_476);
        float _480 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _482 = _480 + 1.0;
        float _484 = 1.0 / _482;
        float _486 = _190 * _478;
        float _488 = exp2(_486);
        float _490 = -_488;
        float _492 = _490 + 1.0;
        float _494 = _492 * _484;
        _264 = _494;
    }
    float _496 = _264;
    float _498 = fma(_438, -2.0, _242);
    float _500 = _180 * _146;
    float _502 = _216 * 0.15915493667125701904296875;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _506 = _504 != 0;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _514 = _512 != 0;
    float _516 = fma(_426, -2.0, _214);
    float _518 = _222 * 0.15915493667125701904296875;
    float _520 = exp2(_500);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _524 = 1.0 + _522;
    float _526 = in.m_55.x;
    float _528 = in.m_55.y;
    float _530 = in.m_55.z;
    bool _532 = !_506;
    int _534 = _532 ? 0 : 1;
    float _536 = -_146;
    float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[76].x, _234);
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _542 = 1.0 / _524;
    float _544 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _226);
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(1.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _560 = abs(_534);
    float _562 = -_520;
    float _564 = _562 + 1.0;
    bool _566 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _568 = isnan(0.0);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _574 = _570 || _572;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _578 = -_146;
    float _580 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[86].x, _374);
    float _582 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _540);
    float _584 = _574 ? _564 : 0.0;
    float _586 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].z, _546);
    float _588 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[88].z, _558);
    float _590 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[88].w, _576);
    float _592 = -_146;
    float _594 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[81].x, _312);
    float _596 = float(_354);
    float _598 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _582);
    float _600 = float(_560);
    float _602 = _518 * 6.283185482025146484375;
    float _604 = sin(_602);
    float _606 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _586);
    float _608 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _588);
    float _610 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _590);
    float _612 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _308);
    float _614 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _368);
    float _616 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _516);
    float _618 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _498);
    int _620 = as_type<int>(_544);
    if (_556)
    {
        float _622 = _584 * _542;
        _148 = _622;
    }
    float _624 = _148;
    bool _626 = !_510;
    int _628 = _626 ? 0 : 1;
    float _630 = _600 * _596;
    float _632 = _502 * 6.283185482025146484375;
    float _634 = sin(_632);
    bool _636 = !_514;
    int _638 = _636 ? 0 : 1;
    float _640 = _318 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _642 = abs(_628);
    float _644 = _630 * (-2.0);
    int _646 = abs(_638);
    float _648 = _196 + (-0.5);
    float _650 = float(_436);
    float _652 = fma(_644, _526, _526);
    float _654 = float(_642);
    float _656 = _604 * 0.0040000001899898052215576171875;
    float _658 = float(_394);
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[196].x, _652);
    float _662 = float(_646);
    float _664 = _654 * _650;
    float _666 = fma(_314, _644, _314);
    float _668 = fma(_634, 0.0030000000260770320892333984375, _656);
    float _670 = precise::max(_640, -400.0);
    float _672 = _662 * _658;
    float _674 = fma(_666, _624, _660);
    float _676 = _664 * (-2.0);
    float _678 = in.m_57.x;
    float _680 = in.m_57.y;
    float _682 = in.m_57.z;
    float _684 = _672 * (-2.0);
    float _686 = _674 * 0.15915493667125701904296875;
    float _688 = fma(_274, _676, _274);
    float _690 = in.m_59.x;
    float _692 = in.m_59.y;
    float _694 = in.m_59.z;
    float _696 = fma(_676, _528, _528);
    float _698 = _184 + (-0.5);
    float _700 = fma(_684, _530, _530);
    float _702 = in.m_47.x;
    float _704 = in.m_47.y;
    float _706 = in.m_47.z;
    float _708 = _166 + (-0.5);
    float _710 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[196].y, _696);
    float _712 = fma(_246, _684, _246);
    float _714 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].z, _700);
    float _716 = fma(_688, _624, _710);
    float _718 = precise::min(_670, -50.0);
    float _720 = in.m_51.w;
    float _722 = _716 * 0.15915493667125701904296875;
    float _724 = fma(_712, _624, _714);
    float _726 = in.m_42.x;
    float _728 = in.m_42.y;
    float _730 = in.m_42.z;
    float _732 = _206 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = _686 * 6.283185482025146484375;
    float _736 = sin(_734);
    float _738 = _472 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _740 = fma(_718, 0.00285714282654225826263427734375, 1.142857074737548828125);
    float _742 = _204 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = fma(_668, _680, _692);
    float _746 = _686 * 6.283185482025146484375;
    float _748 = cos(_746);
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _744);
    float _752 = fma(_496, _702, _738);
    float _754 = _472 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _756 = _472 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _758 = _750 * _732;
    float _760 = _724 * 0.15915493667125701904296875;
    float _762 = fma(_740, -0.5, 1.0);
    float _764 = _668 * 0.20000000298023223876953125;
    float _766 = _722 * 6.283185482025146484375;
    float _768 = sin(_766);
    float _770 = fma(_496, _704, _754);
    float _772 = fma(_496, _706, _756);
    float _774 = _678 * _764;
    float _776 = _682 * _764;
    float _778 = fma(_770, _720, _728);
    float _780 = fma(_752, _720, _726);
    float _782 = fma(_762, _690, _774);
    float _784 = _722 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = fma(_762, _694, _776);
    float _790 = _212 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _782);
    float _794 = fma(_772, _720, _730);
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _788);
    float _798 = _792 * _742;
    float _800 = _760 * 6.283185482025146484375;
    float _802 = cos(_800);
    float _804 = _748 * _768;
    float _806 = _736 * _768;
    float _808 = _796 * _790;
    float _810 = _778 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _812 = _760 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _736 * _786;
    float _818 = _748 * _786;
    float _820 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[6].x, _810);
    float _822 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[6].z, _820);
    float _824 = _748 * _802;
    float _826 = _786 * _802;
    float _828 = _736 * _802;
    float _830 = _768 * _802;
    float _832 = _828 * _758;
    float _834 = -_804;
    float _836 = fma(_814, _816, _834);
    float _838 = -_816;
    float _840 = fma(_814, _804, _838);
    float _842 = fma(_814, _818, _806);
    float _844 = _824 * _758;
    float _846 = fma(_814, _806, _818);
    float _848 = -_758;
    float _850 = _814 * _848;
    float _852 = fma(_836, _798, _832);
    float _854 = fma(_842, _798, _844);
    float _856 = _778 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _858 = fma(_826, _798, _850);
    float _860 = fma(_846, _808, _852);
    float _862 = fma(_840, _808, _854);
    float _864 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[4].x, _856);
    float _866 = fma(_830, _808, _858);
    float _868 = _822 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _870 = _862 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _872 = _862 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _874 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[4].z, _864);
    float _876 = _778 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _878 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[10].x, _870);
    float _880 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[8].x, _872);
    float _882 = _874 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _884 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[5].x, _876);
    float _886 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[10].z, _878);
    float _888 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[8].z, _880);
    float _890 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[5].z, _884);
    float _892 = _868 + _886;
    float _894 = _882 + _888;
    float _896 = _890 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _898 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _900 = _892 + _898;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _904 = _894 + _902;
    float _906 = _900 * _900;
    float _908 = fma(_904, _904, _906);
    float _910 = _862 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _912 = sqrt(_908);
    float _914 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[9].x, _910);
    float _916 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[9].z, _914);
    float _918 = _896 + _916;
    bool _920 = _912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _922 = _896;
    float _924 = _794;
    float _926 = _890;
    float _928 = _680;
    float _930 = _678;
    float _932 = _682;
    if (!_920)
    {
        _922 = _894;
    }
    float _934 = _922;
    float _936 = _934;
    if (!_920)
    {
        _924 = _892;
    }
    float _938 = _924;
    float _940 = _938;
    if (!_920)
    {
        _926 = _918;
    }
    float _942 = _926;
    bool _944 = !_920;
    float _946 = _942;
    if (!_944)
    {
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _952 = _912 + _950;
        float _954 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = rsqrt(_908);
        float _958 = _952 * _948;
        float _960 = _958 * 0.15915493667125701904296875;
        float _962 = _960 * 6.283185482025146484375;
        float _964 = cos(_962);
        float _966 = _960 * 6.283185482025146484375;
        float _968 = sin(_966);
        float _970 = _964 + (-1.0);
        float _972 = _970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = fma(_968, _954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _976 = fma(_918, _964, _972);
        float _978 = _956 * _974;
        float _980 = fma(_904, _978, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _982 = fma(_900, _978, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _946 = _976;
        _936 = _980;
        _940 = _982;
    }
    float _984 = _946;
    float _986 = _936;
    float _988 = _940;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _992 = _984 + _990;
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _996 = _986 + _994;
    float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1000 = _988 + _998;
    float _1002 = _992 * _992;
    float _1004 = fma(_996, _996, _1002);
    float _1006 = fma(_1000, _1000, _1004);
    float _1008 = rsqrt(_1006);
    float _1010 = sqrt(_1006);
    float _1012 = _1008 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1014 = _996 * _1012;
    float _1016 = _1000 * _1012;
    float _1018 = _1014 * _1014;
    float _1020 = _1016 * _1016;
    float _1022 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1024 = _1018 + _1020;
    float _1026 = precise::max(0.0, _1022);
    float _1028 = sqrt(_1024);
    float _1030 = -_1012;
    float _1032 = -_1026;
    float _1034 = fma(_992, _1030, _1032);
    bool _1036 = _1028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1038 = _1000;
    float _1040 = _992;
    float _1042 = _1026;
    float _1044 = _1018;
    float _1046 = _1020;
    if (!_1036)
    {
        _1038 = _1014;
    }
    float _1048 = _1038;
    float _1050 = _1048;
    if (!_1036)
    {
        _1040 = _1034;
    }
    float _1052 = _1040;
    float _1054 = _1052;
    if (!_1036)
    {
        _1042 = _1016;
    }
    float _1056 = _1042;
    bool _1058 = !_1036;
    float _1060 = _1056;
    if (!_1058)
    {
        float _1062 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1066 = _1028 + _1064;
        float _1068 = _1034 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1070 = rsqrt(_1024);
        float _1072 = _1066 * _1062;
        float _1074 = _1072 * 0.15915493667125701904296875;
        float _1076 = _1074 * 6.283185482025146484375;
        float _1078 = sin(_1076);
        float _1080 = _1074 * 6.283185482025146484375;
        float _1082 = cos(_1080);
        float _1084 = fma(_1078, _1068, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1086 = _1070 * _1084;
        float _1088 = _1082 + (-1.0);
        float _1090 = _1014 * _1086;
        float _1092 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = _1016 * _1086;
        float _1096 = fma(_1034, _1082, _1092);
        float _1098 = _1090 * _1090;
        float _1100 = _1094 * _1094;
        _1054 = _1096;
        _1044 = _1098;
        _1046 = _1100;
        _1050 = _1090;
        _1060 = _1094;
    }
    float _1102 = _1054;
    float _1104 = _1044;
    float _1106 = _1046;
    float _1108 = _1050;
    float _1110 = _1060;
    float _1112 = fma(_1102, _1102, _1104);
    float _1114 = _984 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1116 = _1112 + _1106;
    float _1118 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1114);
    float _1120 = _984 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1124 = fma(_1010, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1122);
    float _1126 = precise::clamp(_1124, 0.0, 1.0);
    float _1128 = rsqrt(_1116);
    float _1130 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1118);
    float _1132 = _984 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1134 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1120);
    float _1136 = -_1126;
    float _1138 = _1136 + 1.0;
    float _1140 = _984 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1142 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1132);
    float _1144 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1134);
    float _1146 = abs(_1138);
    float _1148 = log2(_1146);
    float _1150 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1140);
    float _1152 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1142);
    float _1154 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1156 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1158 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1160 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1150);
    float _1162 = _1128 * _1108;
    float _1164 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1166 = _1128 * _1102;
    float _1168 = _1128 * _1110;
    float _1170 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1172 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1164);
    float _1174 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1176 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1178 = -_1170;
    float _1180 = fma(_1166, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1178);
    float _1182 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1184 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1172);
    float _1186 = -_1176;
    float _1188 = fma(_1174, _1186, 1.0);
    float _1190 = -_1168;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1180);
    float _1194 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1196 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1184);
    float _1198 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1200 = fma(_1192, -0.5, 0.5);
    float _1202 = log2(_1188);
    float _1204 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1206 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1198);
    float _1208 = _1166 + 1.0;
    float _1210 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1212 = 1.0 / _1196;
    float _1214 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1210);
    float _1216 = exp2(_1194);
    float _1218 = _1202 * 0.693147182464599609375;
    float _1220 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1222 = sqrt(_1200);
    float _1224 = fma(_1192, 0.5, 0.5);
    float _1226 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1204);
    float _1228 = fma(_1224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1230 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1226);
    float _1232 = _1214 * _1212;
    float _1234 = -_1166;
    float _1236 = fma(_1216, _1208, _1234);
    float _1238 = fma(_1224, _1228, -0.212114393711090087890625);
    float _1240 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1230);
    float _1242 = fma(_1232, 0.5, 0.5);
    float _1244 = fma(_1224, _1238, 1.570728778839111328125);
    float _1246 = _1240 * _1212;
    float _1248 = _1222 * 0.636619746685028076171875;
    float _1250 = fma(_1246, -0.5, 0.5);
    float _1252 = fma(_1236, 0.5, 0.5);
    float _1254 = -_1244;
    float _1256 = fma(_1248, _1254, 1.0);
    float3 _3821 = float3(_1242, _1250, _1220);
    float _1258 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3821, float3(0.0), isnan(_3821)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3821, float3(0.0), isnan(_3821)), level(0.0)).x;
    float2 _3832 = float2(_1256, _1252);
    float3 _1262 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3832, float2(0.0), isnan(_3832)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3832, float2(0.0), isnan(_3832)), level(0.0)).xyz;
    float _1264 = _1262.x;
    float _1266 = _1262.y;
    float _1268 = _1262.z;
    float _1270 = in.m_61.y;
    bool _1272 = _184 > 0.5;
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1276 = in.m_49.w;
    bool _1278 = _166 > 0.5;
    float _1280 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1284 = _1282 != 0;
    float _1286 = in.m_63.x;
    float _1288 = in.m_63.y;
    float _1290 = in.m_63.z;
    float _1292 = in.m_63.w;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1296 = _1294 != 0;
    float _1298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1302 = _1300 != 0;
    float _1304 = in.m_61.x;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1308 = _1306 != 0;
    out.m_65.w = _1196;
    float _1310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_67.x = _986;
    out.m_67.y = _984;
    out.m_67.z = _988;
    float _1314 = -_1270;
    float _1316 = _1314 + 1.0;
    float _1318 = exp2(_1280);
    bool _1320 = _1276 > 0.5;
    int _1322 = _1272 ? as_type<int>(_1316) : as_type<int>(_1270);
    float _1324 = _678 * _1290;
    int _1326 = _1320 ? as_type<int>(_1316) : as_type<int>(_1270);
    float _1328 = _682 * _1288;
    float _1330 = _1284 ? as_type<float>(_1322) : _1270;
    float _1332 = _680 * _1286;
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1336 = _1334 != 0;
    float _1338 = -_1328;
    float _1340 = fma(_680, _1290, _1338);
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1344 = _1342 != 0;
    float _1346 = -_1324;
    float _1348 = fma(_682, _1286, _1346);
    float _1350 = -_1332;
    float _1352 = fma(_678, _1288, _1350);
    float _1354 = -_1318;
    float _1356 = _1354 + 1.0;
    int _1358 = _1344 ? _1326 : as_type<int>(_1270);
    float _1360 = _1348 * _1292;
    bool _1362 = _1344;
    float _1364 = _1348;
    float _1366 = _1270;
    float _1368 = _1352;
    int _1370 = as_type<int>(_1310);
    int _1372 = _1358;
    if (_1296)
    {
        bool _1374 = _196 > 0.5;
        _1362 = _1374;
    }
    bool _1376 = _1362;
    float _1378 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1296)
    {
        _1364 = _1304;
    }
    float _1380 = _1364;
    float _1382 = _1340 * _1292;
    float _1384 = _1352 * _1292;
    float _1386 = _1380;
    if (_1336)
    {
        float _1388 = _1278 ? _1316 : _1270;
        _1366 = _1388;
    }
    float _1390 = _1366;
    float _1392 = fma(_1378, _1330, -0.5);
    if (!_1296)
    {
        _1368 = _1380;
    }
    float _1394 = _1368;
    float _1396 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1398 = _1394;
    if (_1296)
    {
        _1386 = _1304;
    }
    float _1400 = _1386;
    float _1402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1404 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1406 = -_544;
    float _1408 = fma(_598, _1392, _1406);
    float _1410 = fma(as_type<float>(_1358), _1396, -0.5);
    float _1412 = _1404;
    float _1414 = _1400;
    if (_1296)
    {
        float _1416 = -_1400;
        float _1418 = _1416 + 1.0;
        _1370 = as_type<int>(_1418);
    }
    int _1420 = _1370;
    if (_1302)
    {
        float _1422 = -_1400;
        float _1424 = _1422 + 1.0;
        _620 = as_type<int>(_1424);
    }
    int _1426 = _620;
    if (_1308)
    {
        float _1428 = -_1400;
        float _1430 = _1428 + 1.0;
        _1372 = as_type<int>(_1430);
    }
    int _1432 = _1372;
    float _1434 = fma(_1404, _1390, -0.5);
    if (!_1302)
    {
        _1412 = _1400;
    }
    float _1436 = _1412;
    float _1438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1440 = _1436;
    if (_1296)
    {
        float _1442 = _1376 ? as_type<float>(_1420) : _1400;
        _1398 = _1442;
    }
    float _1444 = _1398;
    float _1446 = -_616;
    float _1448 = fma(_614, _1410, _1446);
    if (_1302)
    {
        float _1450 = _1278 ? as_type<float>(_1426) : _1400;
        _1440 = _1450;
    }
    float _1452 = _1440;
    float _1454 = _1408 + 0.5;
    if (_1308)
    {
        float _1456 = _1272 ? as_type<float>(_1432) : _1400;
        _1414 = _1456;
    }
    float _1458 = _1414;
    float _1460 = -_618;
    float _1462 = fma(_610, _1434, _1460);
    bool _1464 = _744 != 0.0;
    bool _1466 = isnan(_744);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan(0.0);
    bool _1472 = _1468 || _1470;
    float _1474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1476 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1478 = _1448 + 0.5;
    bool _1480 = _782 == 0.0;
    bool _1482 = !_1472;
    bool _1484 = _1480 && _1482;
    float _1486 = fma(_1476, _1444, -0.5);
    float _1488 = in.m_53.z;
    bool _1490 = _788 == 0.0;
    bool _1492 = _1490 && _1484;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1498 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1500 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = -_1288;
    float _1504 = _814 * _1502;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1508 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1510 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1512 = -_1360;
    float _1514 = _814 * _1512;
    float _1516 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1492)
    {
        float _1518 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[17].y, _680);
        _928 = _1518;
    }
    float _1520 = _928;
    if (!_1492)
    {
        float _1522 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[17].y, _678);
        _930 = _1522;
    }
    float _1524 = _930;
    out.m_69.x = _1500;
    out.m_69.y = _1510;
    out.m_69.z = _1516;
    float _1526 = fma(_826, _1286, _1504);
    if (!_1492)
    {
        float _1528 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _682);
        _932 = _1528;
    }
    float _1530 = _932;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1536 = fma(_1498, _1452, -0.5);
    float _1538 = fma(_606, _1486, _538);
    float _1540 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1542 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1544 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.z = _1488;
    float _1546 = fma(_612, _1536, _594);
    float _1548 = -_1520;
    float _1550 = _814 * _1548;
    float _1552 = _824 * _1520;
    float _1554 = _828 * _1520;
    float _1556 = _824 * _1360;
    float _1558 = fma(_826, _1524, _1550);
    float _1560 = fma(_826, _1382, _1514);
    float _1562 = fma(_842, _1524, _1552);
    float _1564 = _824 * _1288;
    float _1566 = fma(_836, _1524, _1554);
    float _1568 = fma(_830, _1530, _1558);
    float _1570 = fma(_840, _1530, _1562);
    float _1572 = fma(_842, _1286, _1564);
    float _1574 = _828 * _1288;
    float _1576 = fma(_830, _1290, _1526);
    float _1578 = _1570 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1580 = _1570 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1582 = fma(_840, _1290, _1572);
    out.m_73.x = _1540;
    out.m_73.y = _1542;
    out.m_73.z = _1544;
    float _1584 = fma(_842, _1382, _1556);
    float _1586 = fma(_846, _1530, _1566);
    float _1588 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1578);
    float _1590 = fma(_836, _1286, _1574);
    float _1592 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1594 = fma(_840, _1384, _1584);
    float _1596 = _1546 + 0.5;
    float _1598 = fma(_846, _1290, _1590);
    float _1600 = _1570 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1602 = _828 * _1360;
    float _1604 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1606 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1580);
    float _1608 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1610 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1612 = fma(_1576, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1592);
    float _1614 = fma(_830, _1384, _1560);
    float _1616 = fma(_1576, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1608);
    float _1618 = fma(_1576, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1610);
    float _1620 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1622 = fma(_836, _1382, _1602);
    float _1624 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1604);
    float _1626 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1600);
    float _1628 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1630 = fma(_1614, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1620);
    float _1632 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1634 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1612);
    float _1636 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1616);
    float _1638 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1618);
    float _1640 = fma(_846, _1384, _1622);
    float _1642 = fma(_1508, _1458, -0.5);
    float _1644 = fma(_1614, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1628);
    float _1646 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1648 = fma(_1614, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1632);
    float _1650 = _1196 * 0.5;
    float _1652 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1630);
    out.m_75.x = _1634;
    out.m_75.y = _1636;
    out.m_75.z = _1638;
    float _1654 = fma(_608, _1642, _580);
    float _1656 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1624);
    float _1658 = _1214 + _1196;
    float _1660 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1644);
    float _1662 = fma(_1240, -0.5, _1650);
    float _1664 = _1538 + 0.5;
    float _1666 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1588);
    float _1668 = _1654 + 0.5;
    float _1670 = _1462 + 0.5;
    float _1672 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1648);
    float _1674 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1656);
    float _1676 = _1658 * 0.5;
    float _1678 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1606);
    float _1680 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1626);
    float _1682 = -_1646;
    float _1684 = _1682 + 1.0;
    out.m_77.x = _1664;
    out.m_77.y = _1454;
    out.m_77.z = _1596;
    out.m_77.w = _1478;
    bool _1686 = _1010 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1688 = isnan(_1010);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1694 = _1690 || _1692;
    out.m_79.x = _1668;
    out.m_79.y = _1670;
    out.m_81.x = _1652;
    out.m_81.y = _1660;
    out.m_81.z = _1672;
    out.gl_Position.x = _1214;
    out.gl_Position.y = _1240;
    out.gl_Position.z = _1674;
    out.gl_Position.w = _1196;
    float _1696 = _1638;
    float _1698 = _1634;
    if (!_1694)
    {
        _1696 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1700 = _1696;
    out.m_65.x = _1676;
    float _1702 = _1700;
    float _1704 = _1700;
    if (!_1694)
    {
        _1698 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1706 = _1698;
    out.m_65.y = _1662;
    out.m_83.x = _1666;
    out.m_83.y = _1678;
    out.m_83.z = _1680;
    float _1708 = _1646 * _1258;
    float _1710 = _1264 * _1708;
    float _1712 = _1266 * _1708;
    float _1714 = _1268 * _1708;
    float _1716 = _1708;
    float _1718 = _1706;
    float _1720 = _1706;
    if (!_1694)
    {
        _1716 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1722 = _1716;
    out.m_85.x = _1710;
    out.m_85.y = _1712;
    out.m_85.z = _1714;
    out.m_85.w = _1684;
    bool _1724 = !_1694;
    float _1726 = _1722;
    float _1728 = _1722;
    if (!_1724)
    {
        bool _1730 = _1010 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1732 = isnan(_1010);
        bool _1734 = _1730 || _1732;
        bool _1736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1738 = _1734 || _1736;
        if (!_1738)
        {
            float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1742 = _1010 + _1740;
            float _1744 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1746 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1744;
            float _1748 = 1.0 / _1746;
            float _1750 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1752 = _1750 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1754 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1756 = _1754 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1758 = _1742 * _1748;
            float _1760 = precise::clamp(_1758, 0.0, 1.0);
            float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1764 = _1762 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1766 = fma(_1760, _1756, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1768 = fma(_1760, _1764, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1770 = fma(_1760, _1752, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1728 = _1770;
            _1704 = _1768;
            _1720 = _1766;
            _1772 = true;
        }
        else
        {
            bool _1774 = _1010 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1776 = isnan(_1010);
            bool _1778 = _1774 || _1776;
            bool _1780 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1782 = _1778 || _1780;
            if (!_1782)
            {
                _1702 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1784 = _1702;
            _1704 = _1784;
            if (!_1782)
            {
                _1726 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1786 = _1726;
            _1728 = _1786;
            if (!_1782)
            {
                _1718 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1788 = _1718;
            bool _1790 = !_1782;
            _1720 = _1788;
            if (!_1790)
            {
                bool _1792 = _1010 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1794 = isnan(_1010);
                bool _1796 = _1792 || _1794;
                bool _1798 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1800 = _1796 || _1798;
                if (!_1800)
                {
                    float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1804 = _1010 + _1802;
                    float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1808 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1806;
                    float _1810 = 1.0 / _1808;
                    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1814 = _1812 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1818 = _1816 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1820 = _1804 * _1810;
                    float _1822 = precise::clamp(_1820, 0.0, 1.0);
                    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1828 = fma(_1822, _1818, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1830 = fma(_1822, _1826, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1832 = fma(_1822, _1814, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1728 = _1832;
                    _1704 = _1830;
                    _1720 = _1828;
                    _1772 = true;
                }
                else
                {
                    _1728 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1704 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1720 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1772 = false;
    float _1834 = _1728;
    float _1836 = _1704;
    float _1838 = _1720;
    float _1840 = _1834 * 0.586610972881317138671875;
    bool _1842 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_45.x = 1.0;
    float _1844 = fma(_1836, 0.298911988735198974609375, _1840);
    out.m_87.x = 0.0;
    float _1846 = fma(_1838, 0.114477999508380889892578125, _1844);
    out.m_89.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1848 = -_1846;
    float _1850 = _1848 + _1836;
    float _1852 = -_1846;
    float _1854 = _1852 + _1834;
    float _1856 = -_1846;
    float _1858 = _1856 + _1838;
    float _1860 = fma(_1850, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1846);
    float _1862 = fma(_1854, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1846);
    float _1864 = fma(_1858, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1846);
    out.m_91.x = _1860;
    out.m_91.y = _1862;
    out.m_91.z = _1864;
    if (!_1842)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1866 = -_984;
    float _1868 = _1866 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1870 = -_986;
    float _1872 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1874 = -_988;
    float _1876 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1878 = _1868 * _1868;
    float _1880 = fma(_1872, _1872, _1878);
    float _1882 = fma(_1876, _1876, _1880);
    float _1884 = sqrt(_1882);
    float _1886 = rsqrt(_1882);
    float _1888 = -_1884;
    float _1890 = _1888 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1892 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1894 = precise::clamp(_1892, 0.0, 1.0);
    float _1896 = _1872 * _1886;
    float _1898 = _1868 * _1886;
    float _1900 = abs(_1894);
    float _1902 = log2(_1900);
    float _1904 = _1876 * _1886;
    float _1906 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1908 = _1678 * _1898;
    float _1910 = -_1898;
    float _1912 = -_1906;
    float _1914 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1912);
    float _1916 = fma(_1666, _1896, _1908);
    float _1918 = -_1904;
    float _1920 = fma(_1918, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1914);
    float _1922 = fma(_1680, _1904, _1916);
    float _1924 = precise::clamp(_1922, 0.0, 1.0);
    float _1926 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1928 = _1920 + _1926;
    float _1930 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1932 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = exp2(_1930);
    float _1938 = _1936 * _1934;
    float _1940 = _1924 * _1938;
    float _1942 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1944 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1946 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _1942;
    out.m_87.y = _1944;
    out.m_87.z = _1946;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1772 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_42.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    float _122 = _120;
    if (!_114)
    {
        out.m_45.x = 0.0;
    }
    int _124 = 0;
    if (!_114)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2005 = as_type<float>(_128);
        out.gl_Position.z = _2005;
    }
    if (!_114)
    {
        return out;
    }
    float _132 = in.m_47.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_110);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    if (_158)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _118;
    if (_158)
    {
        out.m_45.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _130 = as_type<int>(_162);
    }
    int _164 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2074 = as_type<float>(_164);
        out.gl_Position.z = _2074;
    }
    if (_158)
    {
        return out;
    }
    float _166 = in.m_49.z;
    float _168 = _146 * 0.37000000476837158203125;
    float _170 = _146 * 0.430000007152557373046875;
    float _172 = in.m_51.x;
    float _174 = in.m_51.y;
    float _176 = in.m_51.z;
    float _178 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _180 = log2(_178);
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _184 = in.m_49.y;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _188 = _186 != 0;
    float _190 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _192 = in.m_53.x;
    float _194 = in.m_53.y;
    float _196 = in.m_49.x;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _202 = _166 * 2.0;
    float _204 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _206 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _208 = floor(_202);
    float _210 = _184 * 2.0;
    float _212 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _216 = fma(_192, 6.283185482025146484375, _168);
    float _218 = _184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _220 = floor(_210);
    float _222 = fma(_194, 6.283185482025146484375, _170);
    float _224 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _226 = fma(_218, -2.0, _182);
    float _228 = _196 + _166;
    float _230 = _196 * 2.0;
    float _232 = -_198;
    float _234 = fma(_224, 2.0, _232);
    float _236 = _184 + _166;
    float _238 = _228 + (-1.0);
    bool _240 = _208 > 0.0;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _244 = floor(_230);
    float _246 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _248 = _208 >= 0.0;
    bool _250 = isnan(_208);
    bool _252 = _248 || _250;
    bool _254 = isnan(0.0);
    bool _256 = _252 || _254;
    float _258 = _236 + (-1.0);
    float _260 = _238;
    float _262 = _208;
    float _264 = _190;
    if (_188)
    {
        _260 = _196;
    }
    float _266 = _260;
    float _268 = _184 + _196;
    float _270 = _266;
    if (!_188)
    {
        _262 = _184;
    }
    float _272 = _262;
    float _274 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _276 = _272;
    if (!_188)
    {
        _270 = _166;
    }
    float _278 = _270;
    float _280 = _268 + (-1.0);
    if (_188)
    {
        _276 = _196;
    }
    float _282 = _276;
    float _284 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _286 = _220 > 0.0;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _290 = _220 >= 0.0;
    bool _292 = isnan(_220);
    bool _294 = _290 || _292;
    bool _296 = isnan(0.0);
    bool _298 = _294 || _296;
    float _300 = _278 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _302 = _282 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _304 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _284);
    bool _306 = _244 > 0.0;
    float _308 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[83].z, _200);
    float _310 = -_288;
    float _312 = fma(_302, 2.0, _310);
    float _314 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _316 = _256 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _318 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _304);
    bool _320 = _244 >= 0.0;
    bool _322 = isnan(_244);
    bool _324 = _320 || _322;
    bool _326 = isnan(0.0);
    bool _328 = _324 || _326;
    float _330 = _304;
    float _332 = _316;
    if (!_188)
    {
        _330 = _166;
    }
    float _334 = _330;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _338 = ~as_type<int>(_316);
    int _340 = _338 + 1;
    int _342 = _340 + 1;
    float _344 = _334;
    int _346 = _342;
    if (_188)
    {
        _344 = _184;
    }
    float _348 = _344;
    if (!_240)
    {
        int _350 = ~as_type<int>(_316);
        int _352 = _350 + 1;
        _346 = _352;
    }
    int _354 = _346;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _358 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _362 = _358 || _360;
    bool _364 = isnan(1.0);
    bool _366 = _362 || _364;
    float _368 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[83].w, _336);
    float _370 = _298 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _372 = -_356;
    float _374 = fma(_300, 2.0, _372);
    float _376 = _370;
    if (_188)
    {
        _332 = _184;
    }
    float _378 = _332;
    int _380 = ~as_type<int>(_370);
    int _382 = _380 + 1;
    int _384 = _382 + 1;
    int _386 = _384;
    float _388 = _378;
    if (!_286)
    {
        int _390 = ~as_type<int>(_370);
        int _392 = _390 + 1;
        _386 = _392;
    }
    int _394 = _386;
    if (!_188)
    {
        _376 = _166;
    }
    float _396 = _376;
    int _398 = _328 ? 0 : 1;
    float _400 = 0.0;
    float _402 = _396;
    if (!_366)
    {
        float _404 = _190 * _190;
        float _406 = _404 * 0.5;
        _400 = _406;
    }
    float _408 = _400;
    float _410 = _408;
    if (_188)
    {
        _402 = _184;
    }
    float _412 = _402;
    if (!_188)
    {
        _388 = _196;
    }
    float _414 = _388;
    if (!_366)
    {
        float _416 = _408 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _410 = _416;
    }
    float _418 = _410;
    int _420 = ~_398;
    int _422 = _420 + 1;
    int _424 = _422 + 1;
    float _426 = _412 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _428 = _424;
    float _430 = _418;
    if (!_306)
    {
        int _432 = ~_398;
        int _434 = _432 + 1;
        _428 = _434;
    }
    int _436 = _428;
    float _438 = _414 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _440 = !_366;
    if (!_440)
    {
        float _442 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _444 = log2(_442);
        float _446 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _448 = _446 + 1.0;
        float _450 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _452 = _190 * _444;
        float _454 = 1.0 / _448;
        float _456 = _450 * 0.693147182464599609375;
        float _458 = exp2(_452);
        float _460 = 1.0 / _456;
        float _462 = _458 + (-1.0);
        float _464 = -_462;
        float _466 = fma(_464, _460, _190);
        float _468 = _466 * _454;
        float _470 = _468 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _430 = _470;
    }
    float _472 = _430;
    bool _474 = !_366;
    if (!_474)
    {
        float _476 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _478 = log2(_476);
        float _480 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _482 = _480 + 1.0;
        float _484 = 1.0 / _482;
        float _486 = _190 * _478;
        float _488 = exp2(_486);
        float _490 = -_488;
        float _492 = _490 + 1.0;
        float _494 = _492 * _484;
        _264 = _494;
    }
    float _496 = _264;
    float _498 = fma(_438, -2.0, _242);
    float _500 = _180 * _146;
    float _502 = _216 * 0.15915493667125701904296875;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _506 = _504 != 0;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _514 = _512 != 0;
    float _516 = fma(_426, -2.0, _214);
    float _518 = _222 * 0.15915493667125701904296875;
    float _520 = exp2(_500);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _524 = 1.0 + _522;
    float _526 = in.m_55.x;
    float _528 = in.m_55.y;
    float _530 = in.m_55.z;
    bool _532 = !_506;
    int _534 = _532 ? 0 : 1;
    float _536 = -_146;
    float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[76].x, _234);
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _542 = 1.0 / _524;
    float _544 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _226);
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(1.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _560 = abs(_534);
    float _562 = -_520;
    float _564 = _562 + 1.0;
    bool _566 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _568 = isnan(0.0);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _574 = _570 || _572;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _578 = -_146;
    float _580 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[86].x, _374);
    float _582 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _540);
    float _584 = _574 ? _564 : 0.0;
    float _586 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].z, _546);
    float _588 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[88].z, _558);
    float _590 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[88].w, _576);
    float _592 = -_146;
    float _594 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[81].x, _312);
    float _596 = float(_354);
    float _598 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _582);
    float _600 = float(_560);
    float _602 = _518 * 6.283185482025146484375;
    float _604 = sin(_602);
    float _606 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _586);
    float _608 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _588);
    float _610 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _590);
    float _612 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _308);
    float _614 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _368);
    float _616 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _516);
    float _618 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _498);
    int _620 = as_type<int>(_544);
    if (_556)
    {
        float _622 = _584 * _542;
        _148 = _622;
    }
    float _624 = _148;
    bool _626 = !_510;
    int _628 = _626 ? 0 : 1;
    float _630 = _600 * _596;
    float _632 = _502 * 6.283185482025146484375;
    float _634 = sin(_632);
    bool _636 = !_514;
    int _638 = _636 ? 0 : 1;
    float _640 = _318 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _642 = abs(_628);
    float _644 = _630 * (-2.0);
    int _646 = abs(_638);
    float _648 = _196 + (-0.5);
    float _650 = float(_436);
    float _652 = fma(_644, _526, _526);
    float _654 = float(_642);
    float _656 = _604 * 0.0040000001899898052215576171875;
    float _658 = float(_394);
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[196].x, _652);
    float _662 = float(_646);
    float _664 = _654 * _650;
    float _666 = fma(_314, _644, _314);
    float _668 = fma(_634, 0.0030000000260770320892333984375, _656);
    float _670 = precise::max(_640, -400.0);
    float _672 = _662 * _658;
    float _674 = fma(_666, _624, _660);
    float _676 = _664 * (-2.0);
    float _678 = in.m_57.x;
    float _680 = in.m_57.y;
    float _682 = in.m_57.z;
    float _684 = _672 * (-2.0);
    float _686 = _674 * 0.15915493667125701904296875;
    float _688 = fma(_274, _676, _274);
    float _690 = in.m_59.x;
    float _692 = in.m_59.y;
    float _694 = in.m_59.z;
    float _696 = fma(_676, _528, _528);
    float _698 = _184 + (-0.5);
    float _700 = fma(_684, _530, _530);
    float _702 = in.m_47.x;
    float _704 = in.m_47.y;
    float _706 = in.m_47.z;
    float _708 = _166 + (-0.5);
    float _710 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[196].y, _696);
    float _712 = fma(_246, _684, _246);
    float _714 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].z, _700);
    float _716 = fma(_688, _624, _710);
    float _718 = precise::min(_670, -50.0);
    float _720 = in.m_51.w;
    float _722 = _716 * 0.15915493667125701904296875;
    float _724 = fma(_712, _624, _714);
    float _726 = in.m_42.x;
    float _728 = in.m_42.y;
    float _730 = in.m_42.z;
    float _732 = _206 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = _686 * 6.283185482025146484375;
    float _736 = sin(_734);
    float _738 = _472 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _740 = fma(_718, 0.00285714282654225826263427734375, 1.142857074737548828125);
    float _742 = _204 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = fma(_668, _680, _692);
    float _746 = _686 * 6.283185482025146484375;
    float _748 = cos(_746);
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _744);
    float _752 = fma(_496, _702, _738);
    float _754 = _472 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _756 = _472 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _758 = _750 * _732;
    float _760 = _724 * 0.15915493667125701904296875;
    float _762 = fma(_740, -0.5, 1.0);
    float _764 = _668 * 0.20000000298023223876953125;
    float _766 = _722 * 6.283185482025146484375;
    float _768 = sin(_766);
    float _770 = fma(_496, _704, _754);
    float _772 = fma(_496, _706, _756);
    float _774 = _678 * _764;
    float _776 = _682 * _764;
    float _778 = fma(_770, _720, _728);
    float _780 = fma(_752, _720, _726);
    float _782 = fma(_762, _690, _774);
    float _784 = _722 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = fma(_762, _694, _776);
    float _790 = _212 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _782);
    float _794 = fma(_772, _720, _730);
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _788);
    float _798 = _792 * _742;
    float _800 = _760 * 6.283185482025146484375;
    float _802 = cos(_800);
    float _804 = _748 * _768;
    float _806 = _736 * _768;
    float _808 = _796 * _790;
    float _810 = _778 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _812 = _760 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _736 * _786;
    float _818 = _748 * _786;
    float _820 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[6].x, _810);
    float _822 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[6].z, _820);
    float _824 = _748 * _802;
    float _826 = _786 * _802;
    float _828 = _736 * _802;
    float _830 = _768 * _802;
    float _832 = _828 * _758;
    float _834 = -_804;
    float _836 = fma(_814, _816, _834);
    float _838 = -_816;
    float _840 = fma(_814, _804, _838);
    float _842 = fma(_814, _818, _806);
    float _844 = _824 * _758;
    float _846 = fma(_814, _806, _818);
    float _848 = -_758;
    float _850 = _814 * _848;
    float _852 = fma(_836, _798, _832);
    float _854 = fma(_842, _798, _844);
    float _856 = _778 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _858 = fma(_826, _798, _850);
    float _860 = fma(_846, _808, _852);
    float _862 = fma(_840, _808, _854);
    float _864 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[4].x, _856);
    float _866 = fma(_830, _808, _858);
    float _868 = _822 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _870 = _862 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _872 = _862 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _874 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[4].z, _864);
    float _876 = _778 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _878 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[10].x, _870);
    float _880 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[8].x, _872);
    float _882 = _874 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _884 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[5].x, _876);
    float _886 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[10].z, _878);
    float _888 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[8].z, _880);
    float _890 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[5].z, _884);
    float _892 = _868 + _886;
    float _894 = _882 + _888;
    float _896 = _890 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _898 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _900 = _892 + _898;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _904 = _894 + _902;
    float _906 = _900 * _900;
    float _908 = fma(_904, _904, _906);
    float _910 = _862 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _912 = sqrt(_908);
    float _914 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[9].x, _910);
    float _916 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[9].z, _914);
    float _918 = _896 + _916;
    bool _920 = _912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _922 = _896;
    float _924 = _794;
    float _926 = _890;
    float _928 = _680;
    float _930 = _678;
    float _932 = _682;
    if (!_920)
    {
        _922 = _894;
    }
    float _934 = _922;
    float _936 = _934;
    if (!_920)
    {
        _924 = _892;
    }
    float _938 = _924;
    float _940 = _938;
    if (!_920)
    {
        _926 = _918;
    }
    float _942 = _926;
    bool _944 = !_920;
    float _946 = _942;
    if (!_944)
    {
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _952 = _912 + _950;
        float _954 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = rsqrt(_908);
        float _958 = _952 * _948;
        float _960 = _958 * 0.15915493667125701904296875;
        float _962 = _960 * 6.283185482025146484375;
        float _964 = cos(_962);
        float _966 = _960 * 6.283185482025146484375;
        float _968 = sin(_966);
        float _970 = _964 + (-1.0);
        float _972 = _970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = fma(_968, _954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _976 = fma(_918, _964, _972);
        float _978 = _956 * _974;
        float _980 = fma(_904, _978, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _982 = fma(_900, _978, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _946 = _976;
        _936 = _980;
        _940 = _982;
    }
    float _984 = _946;
    float _986 = _936;
    float _988 = _940;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _992 = _984 + _990;
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _996 = _986 + _994;
    float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1000 = _988 + _998;
    float _1002 = _992 * _992;
    float _1004 = fma(_996, _996, _1002);
    float _1006 = fma(_1000, _1000, _1004);
    float _1008 = rsqrt(_1006);
    float _1010 = sqrt(_1006);
    float _1012 = _1008 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1014 = _996 * _1012;
    float _1016 = _1000 * _1012;
    float _1018 = _1014 * _1014;
    float _1020 = _1016 * _1016;
    float _1022 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1024 = _1018 + _1020;
    float _1026 = precise::max(0.0, _1022);
    float _1028 = sqrt(_1024);
    float _1030 = -_1012;
    float _1032 = -_1026;
    float _1034 = fma(_992, _1030, _1032);
    bool _1036 = _1028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1038 = _1000;
    float _1040 = _992;
    float _1042 = _1026;
    float _1044 = _1018;
    float _1046 = _1020;
    if (!_1036)
    {
        _1038 = _1014;
    }
    float _1048 = _1038;
    float _1050 = _1048;
    if (!_1036)
    {
        _1040 = _1034;
    }
    float _1052 = _1040;
    float _1054 = _1052;
    if (!_1036)
    {
        _1042 = _1016;
    }
    float _1056 = _1042;
    bool _1058 = !_1036;
    float _1060 = _1056;
    if (!_1058)
    {
        float _1062 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1066 = _1028 + _1064;
        float _1068 = _1034 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1070 = rsqrt(_1024);
        float _1072 = _1066 * _1062;
        float _1074 = _1072 * 0.15915493667125701904296875;
        float _1076 = _1074 * 6.283185482025146484375;
        float _1078 = sin(_1076);
        float _1080 = _1074 * 6.283185482025146484375;
        float _1082 = cos(_1080);
        float _1084 = fma(_1078, _1068, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1086 = _1070 * _1084;
        float _1088 = _1082 + (-1.0);
        float _1090 = _1014 * _1086;
        float _1092 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = _1016 * _1086;
        float _1096 = fma(_1034, _1082, _1092);
        float _1098 = _1090 * _1090;
        float _1100 = _1094 * _1094;
        _1054 = _1096;
        _1044 = _1098;
        _1046 = _1100;
        _1050 = _1090;
        _1060 = _1094;
    }
    float _1102 = _1054;
    float _1104 = _1044;
    float _1106 = _1046;
    float _1108 = _1050;
    float _1110 = _1060;
    float _1112 = fma(_1102, _1102, _1104);
    float _1114 = _984 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1116 = _1112 + _1106;
    float _1118 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1114);
    float _1120 = _984 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1124 = fma(_1010, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1122);
    float _1126 = precise::clamp(_1124, 0.0, 1.0);
    float _1128 = rsqrt(_1116);
    float _1130 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1118);
    float _1132 = _984 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1134 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1120);
    float _1136 = -_1126;
    float _1138 = _1136 + 1.0;
    float _1140 = _984 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1142 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1132);
    float _1144 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1134);
    float _1146 = abs(_1138);
    float _1148 = log2(_1146);
    float _1150 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1140);
    float _1152 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1142);
    float _1154 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1156 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1158 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1160 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1150);
    float _1162 = _1128 * _1108;
    float _1164 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1166 = _1128 * _1102;
    float _1168 = _1128 * _1110;
    float _1170 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1172 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1164);
    float _1174 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1176 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1178 = -_1170;
    float _1180 = fma(_1166, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1178);
    float _1182 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1184 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1172);
    float _1186 = -_1176;
    float _1188 = fma(_1174, _1186, 1.0);
    float _1190 = -_1168;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1180);
    float _1194 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1196 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1184);
    float _1198 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1200 = fma(_1192, -0.5, 0.5);
    float _1202 = log2(_1188);
    float _1204 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1206 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1198);
    float _1208 = _1166 + 1.0;
    float _1210 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1212 = 1.0 / _1196;
    float _1214 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1210);
    float _1216 = exp2(_1194);
    float _1218 = _1202 * 0.693147182464599609375;
    float _1220 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1222 = sqrt(_1200);
    float _1224 = fma(_1192, 0.5, 0.5);
    float _1226 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1204);
    float _1228 = fma(_1224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1230 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1226);
    float _1232 = _1214 * _1212;
    float _1234 = -_1166;
    float _1236 = fma(_1216, _1208, _1234);
    float _1238 = fma(_1224, _1228, -0.212114393711090087890625);
    float _1240 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1230);
    float _1242 = fma(_1232, 0.5, 0.5);
    float _1244 = fma(_1224, _1238, 1.570728778839111328125);
    float _1246 = _1240 * _1212;
    float _1248 = _1222 * 0.636619746685028076171875;
    float _1250 = fma(_1246, -0.5, 0.5);
    float _1252 = fma(_1236, 0.5, 0.5);
    float _1254 = -_1244;
    float _1256 = fma(_1248, _1254, 1.0);
    float3 _3821 = float3(_1242, _1250, _1220);
    float _1258 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3821, float3(0.0), isnan(_3821)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3821, float3(0.0), isnan(_3821)), level(0.0)).x;
    float2 _3832 = float2(_1256, _1252);
    float3 _1262 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3832, float2(0.0), isnan(_3832)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3832, float2(0.0), isnan(_3832)), level(0.0)).xyz;
    float _1264 = _1262.x;
    float _1266 = _1262.y;
    float _1268 = _1262.z;
    float _1270 = in.m_61.y;
    bool _1272 = _184 > 0.5;
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1276 = in.m_49.w;
    bool _1278 = _166 > 0.5;
    float _1280 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1284 = _1282 != 0;
    float _1286 = in.m_63.x;
    float _1288 = in.m_63.y;
    float _1290 = in.m_63.z;
    float _1292 = in.m_63.w;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1296 = _1294 != 0;
    float _1298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1302 = _1300 != 0;
    float _1304 = in.m_61.x;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1308 = _1306 != 0;
    out.m_65.w = _1196;
    float _1310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_67.x = _986;
    out.m_67.y = _984;
    out.m_67.z = _988;
    float _1314 = -_1270;
    float _1316 = _1314 + 1.0;
    float _1318 = exp2(_1280);
    bool _1320 = _1276 > 0.5;
    int _1322 = _1272 ? as_type<int>(_1316) : as_type<int>(_1270);
    float _1324 = _678 * _1290;
    int _1326 = _1320 ? as_type<int>(_1316) : as_type<int>(_1270);
    float _1328 = _682 * _1288;
    float _1330 = _1284 ? as_type<float>(_1322) : _1270;
    float _1332 = _680 * _1286;
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1336 = _1334 != 0;
    float _1338 = -_1328;
    float _1340 = fma(_680, _1290, _1338);
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1344 = _1342 != 0;
    float _1346 = -_1324;
    float _1348 = fma(_682, _1286, _1346);
    float _1350 = -_1332;
    float _1352 = fma(_678, _1288, _1350);
    float _1354 = -_1318;
    float _1356 = _1354 + 1.0;
    int _1358 = _1344 ? _1326 : as_type<int>(_1270);
    float _1360 = _1348 * _1292;
    bool _1362 = _1344;
    float _1364 = _1348;
    float _1366 = _1270;
    float _1368 = _1352;
    int _1370 = as_type<int>(_1310);
    int _1372 = _1358;
    if (_1296)
    {
        bool _1374 = _196 > 0.5;
        _1362 = _1374;
    }
    bool _1376 = _1362;
    float _1378 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1296)
    {
        _1364 = _1304;
    }
    float _1380 = _1364;
    float _1382 = _1340 * _1292;
    float _1384 = _1352 * _1292;
    float _1386 = _1380;
    if (_1336)
    {
        float _1388 = _1278 ? _1316 : _1270;
        _1366 = _1388;
    }
    float _1390 = _1366;
    float _1392 = fma(_1378, _1330, -0.5);
    if (!_1296)
    {
        _1368 = _1380;
    }
    float _1394 = _1368;
    float _1396 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1398 = _1394;
    if (_1296)
    {
        _1386 = _1304;
    }
    float _1400 = _1386;
    float _1402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1404 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1406 = -_544;
    float _1408 = fma(_598, _1392, _1406);
    float _1410 = fma(as_type<float>(_1358), _1396, -0.5);
    float _1412 = _1404;
    float _1414 = _1400;
    if (_1296)
    {
        float _1416 = -_1400;
        float _1418 = _1416 + 1.0;
        _1370 = as_type<int>(_1418);
    }
    int _1420 = _1370;
    if (_1302)
    {
        float _1422 = -_1400;
        float _1424 = _1422 + 1.0;
        _620 = as_type<int>(_1424);
    }
    int _1426 = _620;
    if (_1308)
    {
        float _1428 = -_1400;
        float _1430 = _1428 + 1.0;
        _1372 = as_type<int>(_1430);
    }
    int _1432 = _1372;
    float _1434 = fma(_1404, _1390, -0.5);
    if (!_1302)
    {
        _1412 = _1400;
    }
    float _1436 = _1412;
    float _1438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1440 = _1436;
    if (_1296)
    {
        float _1442 = _1376 ? as_type<float>(_1420) : _1400;
        _1398 = _1442;
    }
    float _1444 = _1398;
    float _1446 = -_616;
    float _1448 = fma(_614, _1410, _1446);
    if (_1302)
    {
        float _1450 = _1278 ? as_type<float>(_1426) : _1400;
        _1440 = _1450;
    }
    float _1452 = _1440;
    float _1454 = _1408 + 0.5;
    if (_1308)
    {
        float _1456 = _1272 ? as_type<float>(_1432) : _1400;
        _1414 = _1456;
    }
    float _1458 = _1414;
    float _1460 = -_618;
    float _1462 = fma(_610, _1434, _1460);
    bool _1464 = _744 != 0.0;
    bool _1466 = isnan(_744);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan(0.0);
    bool _1472 = _1468 || _1470;
    float _1474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1476 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1478 = _1448 + 0.5;
    bool _1480 = _782 == 0.0;
    bool _1482 = !_1472;
    bool _1484 = _1480 && _1482;
    float _1486 = fma(_1476, _1444, -0.5);
    float _1488 = in.m_53.z;
    bool _1490 = _788 == 0.0;
    bool _1492 = _1490 && _1484;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1498 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1500 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = -_1288;
    float _1504 = _814 * _1502;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1508 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1510 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1512 = -_1360;
    float _1514 = _814 * _1512;
    float _1516 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1492)
    {
        float _1518 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[17].y, _680);
        _928 = _1518;
    }
    float _1520 = _928;
    if (!_1492)
    {
        float _1522 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[17].y, _678);
        _930 = _1522;
    }
    float _1524 = _930;
    out.m_69.x = _1500;
    out.m_69.y = _1510;
    out.m_69.z = _1516;
    float _1526 = fma(_826, _1286, _1504);
    if (!_1492)
    {
        float _1528 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _682);
        _932 = _1528;
    }
    float _1530 = _932;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1536 = fma(_1498, _1452, -0.5);
    float _1538 = fma(_606, _1486, _538);
    float _1540 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1542 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1544 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.z = _1488;
    float _1546 = fma(_612, _1536, _594);
    float _1548 = -_1520;
    float _1550 = _814 * _1548;
    float _1552 = _824 * _1520;
    float _1554 = _828 * _1520;
    float _1556 = _824 * _1360;
    float _1558 = fma(_826, _1524, _1550);
    float _1560 = fma(_826, _1382, _1514);
    float _1562 = fma(_842, _1524, _1552);
    float _1564 = _824 * _1288;
    float _1566 = fma(_836, _1524, _1554);
    float _1568 = fma(_830, _1530, _1558);
    float _1570 = fma(_840, _1530, _1562);
    float _1572 = fma(_842, _1286, _1564);
    float _1574 = _828 * _1288;
    float _1576 = fma(_830, _1290, _1526);
    float _1578 = _1570 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1580 = _1570 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1582 = fma(_840, _1290, _1572);
    out.m_73.x = _1540;
    out.m_73.y = _1542;
    out.m_73.z = _1544;
    float _1584 = fma(_842, _1382, _1556);
    float _1586 = fma(_846, _1530, _1566);
    float _1588 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1578);
    float _1590 = fma(_836, _1286, _1574);
    float _1592 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1594 = fma(_840, _1384, _1584);
    float _1596 = _1546 + 0.5;
    float _1598 = fma(_846, _1290, _1590);
    float _1600 = _1570 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1602 = _828 * _1360;
    float _1604 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1606 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1580);
    float _1608 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1610 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1612 = fma(_1576, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1592);
    float _1614 = fma(_830, _1384, _1560);
    float _1616 = fma(_1576, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1608);
    float _1618 = fma(_1576, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1610);
    float _1620 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1622 = fma(_836, _1382, _1602);
    float _1624 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1604);
    float _1626 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1600);
    float _1628 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1630 = fma(_1614, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1620);
    float _1632 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1634 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1612);
    float _1636 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1616);
    float _1638 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1618);
    float _1640 = fma(_846, _1384, _1622);
    float _1642 = fma(_1508, _1458, -0.5);
    float _1644 = fma(_1614, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1628);
    float _1646 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1648 = fma(_1614, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1632);
    float _1650 = _1196 * 0.5;
    float _1652 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1630);
    out.m_75.x = _1634;
    out.m_75.y = _1636;
    out.m_75.z = _1638;
    float _1654 = fma(_608, _1642, _580);
    float _1656 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1624);
    float _1658 = _1214 + _1196;
    float _1660 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1644);
    float _1662 = fma(_1240, -0.5, _1650);
    float _1664 = _1538 + 0.5;
    float _1666 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1588);
    float _1668 = _1654 + 0.5;
    float _1670 = _1462 + 0.5;
    float _1672 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1648);
    float _1674 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1656);
    float _1676 = _1658 * 0.5;
    float _1678 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1606);
    float _1680 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1626);
    float _1682 = -_1646;
    float _1684 = _1682 + 1.0;
    out.m_77.x = _1664;
    out.m_77.y = _1454;
    out.m_77.z = _1596;
    out.m_77.w = _1478;
    bool _1686 = _1010 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1688 = isnan(_1010);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1694 = _1690 || _1692;
    out.m_79.x = _1668;
    out.m_79.y = _1670;
    out.m_81.x = _1652;
    out.m_81.y = _1660;
    out.m_81.z = _1672;
    out.gl_Position.x = _1214;
    out.gl_Position.y = _1240;
    out.gl_Position.z = _1674;
    out.gl_Position.w = _1196;
    float _1696 = _1638;
    float _1698 = _1634;
    if (!_1694)
    {
        _1696 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1700 = _1696;
    out.m_65.x = _1676;
    float _1702 = _1700;
    float _1704 = _1700;
    if (!_1694)
    {
        _1698 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1706 = _1698;
    out.m_65.y = _1662;
    out.m_83.x = _1666;
    out.m_83.y = _1678;
    out.m_83.z = _1680;
    float _1708 = _1646 * _1258;
    float _1710 = _1264 * _1708;
    float _1712 = _1266 * _1708;
    float _1714 = _1268 * _1708;
    float _1716 = _1708;
    float _1718 = _1706;
    float _1720 = _1706;
    if (!_1694)
    {
        _1716 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1722 = _1716;
    out.m_85.x = _1710;
    out.m_85.y = _1712;
    out.m_85.z = _1714;
    out.m_85.w = _1684;
    bool _1724 = !_1694;
    float _1726 = _1722;
    float _1728 = _1722;
    if (!_1724)
    {
        bool _1730 = _1010 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1732 = isnan(_1010);
        bool _1734 = _1730 || _1732;
        bool _1736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1738 = _1734 || _1736;
        if (!_1738)
        {
            float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1742 = _1010 + _1740;
            float _1744 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1746 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1744;
            float _1748 = 1.0 / _1746;
            float _1750 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1752 = _1750 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1754 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1756 = _1754 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1758 = _1742 * _1748;
            float _1760 = precise::clamp(_1758, 0.0, 1.0);
            float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1764 = _1762 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1766 = fma(_1760, _1756, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1768 = fma(_1760, _1764, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1770 = fma(_1760, _1752, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1728 = _1770;
            _1704 = _1768;
            _1720 = _1766;
            _1772 = true;
        }
        else
        {
            bool _1774 = _1010 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1776 = isnan(_1010);
            bool _1778 = _1774 || _1776;
            bool _1780 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1782 = _1778 || _1780;
            if (!_1782)
            {
                _1702 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1784 = _1702;
            _1704 = _1784;
            if (!_1782)
            {
                _1726 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1786 = _1726;
            _1728 = _1786;
            if (!_1782)
            {
                _1718 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1788 = _1718;
            bool _1790 = !_1782;
            _1720 = _1788;
            if (!_1790)
            {
                bool _1792 = _1010 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1794 = isnan(_1010);
                bool _1796 = _1792 || _1794;
                bool _1798 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1800 = _1796 || _1798;
                if (!_1800)
                {
                    float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1804 = _1010 + _1802;
                    float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1808 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1806;
                    float _1810 = 1.0 / _1808;
                    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1814 = _1812 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1818 = _1816 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1820 = _1804 * _1810;
                    float _1822 = precise::clamp(_1820, 0.0, 1.0);
                    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1828 = fma(_1822, _1818, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1830 = fma(_1822, _1826, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1832 = fma(_1822, _1814, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1728 = _1832;
                    _1704 = _1830;
                    _1720 = _1828;
                    _1772 = true;
                }
                else
                {
                    _1728 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1704 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1720 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1772 = false;
    float _1834 = _1728;
    float _1836 = _1704;
    float _1838 = _1720;
    float _1840 = _1834 * 0.586610972881317138671875;
    bool _1842 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_45.x = 1.0;
    float _1844 = fma(_1836, 0.298911988735198974609375, _1840);
    out.m_87.x = 0.0;
    float _1846 = fma(_1838, 0.114477999508380889892578125, _1844);
    out.m_89.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1848 = -_1846;
    float _1850 = _1848 + _1836;
    float _1852 = -_1846;
    float _1854 = _1852 + _1834;
    float _1856 = -_1846;
    float _1858 = _1856 + _1838;
    float _1860 = fma(_1850, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1846);
    float _1862 = fma(_1854, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1846);
    float _1864 = fma(_1858, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1846);
    out.m_91.x = _1860;
    out.m_91.y = _1862;
    out.m_91.z = _1864;
    if (!_1842)
    {
        return out;
    }
    float _1866 = -_984;
    float _1868 = _1866 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1870 = -_986;
    float _1872 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1874 = -_988;
    float _1876 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1878 = _1868 * _1868;
    float _1880 = fma(_1872, _1872, _1878);
    float _1882 = fma(_1876, _1876, _1880);
    float _1884 = sqrt(_1882);
    float _1886 = rsqrt(_1882);
    float _1888 = -_1884;
    float _1890 = _1888 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1892 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1894 = precise::clamp(_1892, 0.0, 1.0);
    float _1896 = _1872 * _1886;
    float _1898 = _1868 * _1886;
    float _1900 = abs(_1894);
    float _1902 = log2(_1900);
    float _1904 = _1876 * _1886;
    float _1906 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1908 = _1678 * _1898;
    float _1910 = -_1898;
    float _1912 = -_1906;
    float _1914 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1912);
    float _1916 = fma(_1666, _1896, _1908);
    float _1918 = -_1904;
    float _1920 = fma(_1918, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1914);
    float _1922 = fma(_1680, _1904, _1916);
    float _1924 = precise::clamp(_1922, 0.0, 1.0);
    float _1926 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1928 = _1920 + _1926;
    float _1930 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1932 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = exp2(_1930);
    float _1938 = _1936 * _1934;
    float _1940 = _1924 * _1938;
    float _1942 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1944 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1946 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _1942;
    out.m_87.y = _1944;
    out.m_87.z = _1946;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1772 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_42.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    float _122 = _120;
    if (!_114)
    {
        out.m_45.x = 0.0;
    }
    int _124 = 0;
    if (!_114)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2005 = as_type<float>(_128);
        out.gl_Position.z = _2005;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_47.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_110);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    if (_158)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _118;
    if (_158)
    {
        out.m_45.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _130 = as_type<int>(_162);
    }
    int _164 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2074 = as_type<float>(_164);
        out.gl_Position.z = _2074;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_49.z;
    float _168 = _146 * 0.37000000476837158203125;
    float _170 = _146 * 0.430000007152557373046875;
    float _172 = in.m_51.x;
    float _174 = in.m_51.y;
    float _176 = in.m_51.z;
    float _178 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _180 = log2(_178);
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _184 = in.m_49.y;
    int _186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _188 = _186 != 0;
    float _190 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _192 = in.m_53.x;
    float _194 = in.m_53.y;
    float _196 = in.m_49.x;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _202 = _166 * 2.0;
    float _204 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _206 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _208 = floor(_202);
    float _210 = _184 * 2.0;
    float _212 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _216 = fma(_192, 6.283185482025146484375, _168);
    float _218 = _184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _220 = floor(_210);
    float _222 = fma(_194, 6.283185482025146484375, _170);
    float _224 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _226 = fma(_218, -2.0, _182);
    float _228 = _196 + _166;
    float _230 = _196 * 2.0;
    float _232 = -_198;
    float _234 = fma(_224, 2.0, _232);
    float _236 = _184 + _166;
    float _238 = _228 + (-1.0);
    bool _240 = _208 > 0.0;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _244 = floor(_230);
    float _246 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _248 = _208 >= 0.0;
    bool _250 = isnan(_208);
    bool _252 = _248 || _250;
    bool _254 = isnan(0.0);
    bool _256 = _252 || _254;
    float _258 = _236 + (-1.0);
    float _260 = _238;
    float _262 = _208;
    float _264 = _190;
    if (_188)
    {
        _260 = _196;
    }
    float _266 = _260;
    float _268 = _184 + _196;
    float _270 = _266;
    if (!_188)
    {
        _262 = _184;
    }
    float _272 = _262;
    float _274 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _276 = _272;
    if (!_188)
    {
        _270 = _166;
    }
    float _278 = _270;
    float _280 = _268 + (-1.0);
    if (_188)
    {
        _276 = _196;
    }
    float _282 = _276;
    float _284 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _286 = _220 > 0.0;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _290 = _220 >= 0.0;
    bool _292 = isnan(_220);
    bool _294 = _290 || _292;
    bool _296 = isnan(0.0);
    bool _298 = _294 || _296;
    float _300 = _278 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _302 = _282 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _304 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _284);
    bool _306 = _244 > 0.0;
    float _308 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[83].z, _200);
    float _310 = -_288;
    float _312 = fma(_302, 2.0, _310);
    float _314 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _316 = _256 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _318 = fma((*spvDescriptorSet0.vp_c8)._m0[2].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _304);
    bool _320 = _244 >= 0.0;
    bool _322 = isnan(_244);
    bool _324 = _320 || _322;
    bool _326 = isnan(0.0);
    bool _328 = _324 || _326;
    float _330 = _304;
    float _332 = _316;
    if (!_188)
    {
        _330 = _166;
    }
    float _334 = _330;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _338 = ~as_type<int>(_316);
    int _340 = _338 + 1;
    int _342 = _340 + 1;
    float _344 = _334;
    int _346 = _342;
    if (_188)
    {
        _344 = _184;
    }
    float _348 = _344;
    if (!_240)
    {
        int _350 = ~as_type<int>(_316);
        int _352 = _350 + 1;
        _346 = _352;
    }
    int _354 = _346;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _358 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _362 = _358 || _360;
    bool _364 = isnan(1.0);
    bool _366 = _362 || _364;
    float _368 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[83].w, _336);
    float _370 = _298 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _372 = -_356;
    float _374 = fma(_300, 2.0, _372);
    float _376 = _370;
    if (_188)
    {
        _332 = _184;
    }
    float _378 = _332;
    int _380 = ~as_type<int>(_370);
    int _382 = _380 + 1;
    int _384 = _382 + 1;
    int _386 = _384;
    float _388 = _378;
    if (!_286)
    {
        int _390 = ~as_type<int>(_370);
        int _392 = _390 + 1;
        _386 = _392;
    }
    int _394 = _386;
    if (!_188)
    {
        _376 = _166;
    }
    float _396 = _376;
    int _398 = _328 ? 0 : 1;
    float _400 = 0.0;
    float _402 = _396;
    if (!_366)
    {
        float _404 = _190 * _190;
        float _406 = _404 * 0.5;
        _400 = _406;
    }
    float _408 = _400;
    float _410 = _408;
    if (_188)
    {
        _402 = _184;
    }
    float _412 = _402;
    if (!_188)
    {
        _388 = _196;
    }
    float _414 = _388;
    if (!_366)
    {
        float _416 = _408 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _410 = _416;
    }
    float _418 = _410;
    int _420 = ~_398;
    int _422 = _420 + 1;
    int _424 = _422 + 1;
    float _426 = _412 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _428 = _424;
    float _430 = _418;
    if (!_306)
    {
        int _432 = ~_398;
        int _434 = _432 + 1;
        _428 = _434;
    }
    int _436 = _428;
    float _438 = _414 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _440 = !_366;
    if (!_440)
    {
        float _442 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _444 = log2(_442);
        float _446 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _448 = _446 + 1.0;
        float _450 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _452 = _190 * _444;
        float _454 = 1.0 / _448;
        float _456 = _450 * 0.693147182464599609375;
        float _458 = exp2(_452);
        float _460 = 1.0 / _456;
        float _462 = _458 + (-1.0);
        float _464 = -_462;
        float _466 = fma(_464, _460, _190);
        float _468 = _466 * _454;
        float _470 = _468 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _430 = _470;
    }
    float _472 = _430;
    bool _474 = !_366;
    if (!_474)
    {
        float _476 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _478 = log2(_476);
        float _480 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _482 = _480 + 1.0;
        float _484 = 1.0 / _482;
        float _486 = _190 * _478;
        float _488 = exp2(_486);
        float _490 = -_488;
        float _492 = _490 + 1.0;
        float _494 = _492 * _484;
        _264 = _494;
    }
    float _496 = _264;
    float _498 = fma(_438, -2.0, _242);
    float _500 = _180 * _146;
    float _502 = _216 * 0.15915493667125701904296875;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _506 = _504 != 0;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _514 = _512 != 0;
    float _516 = fma(_426, -2.0, _214);
    float _518 = _222 * 0.15915493667125701904296875;
    float _520 = exp2(_500);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _524 = 1.0 + _522;
    float _526 = in.m_55.x;
    float _528 = in.m_55.y;
    float _530 = in.m_55.z;
    bool _532 = !_506;
    int _534 = _532 ? 0 : 1;
    float _536 = -_146;
    float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[76].x, _234);
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _542 = 1.0 / _524;
    float _544 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _226);
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(1.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _560 = abs(_534);
    float _562 = -_520;
    float _564 = _562 + 1.0;
    bool _566 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _568 = isnan(0.0);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _574 = _570 || _572;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _578 = -_146;
    float _580 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[86].x, _374);
    float _582 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _540);
    float _584 = _574 ? _564 : 0.0;
    float _586 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].z, _546);
    float _588 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[88].z, _558);
    float _590 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[88].w, _576);
    float _592 = -_146;
    float _594 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[81].x, _312);
    float _596 = float(_354);
    float _598 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _582);
    float _600 = float(_560);
    float _602 = _518 * 6.283185482025146484375;
    float _604 = sin(_602);
    float _606 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _586);
    float _608 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _588);
    float _610 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _590);
    float _612 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].z, _308);
    float _614 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[82].w, _368);
    float _616 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[81].y, _516);
    float _618 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _498);
    int _620 = as_type<int>(_544);
    if (_556)
    {
        float _622 = _584 * _542;
        _148 = _622;
    }
    float _624 = _148;
    bool _626 = !_510;
    int _628 = _626 ? 0 : 1;
    float _630 = _600 * _596;
    float _632 = _502 * 6.283185482025146484375;
    float _634 = sin(_632);
    bool _636 = !_514;
    int _638 = _636 ? 0 : 1;
    float _640 = _318 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _642 = abs(_628);
    float _644 = _630 * (-2.0);
    int _646 = abs(_638);
    float _648 = _196 + (-0.5);
    float _650 = float(_436);
    float _652 = fma(_644, _526, _526);
    float _654 = float(_642);
    float _656 = _604 * 0.0040000001899898052215576171875;
    float _658 = float(_394);
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[196].x, _652);
    float _662 = float(_646);
    float _664 = _654 * _650;
    float _666 = fma(_314, _644, _314);
    float _668 = fma(_634, 0.0030000000260770320892333984375, _656);
    float _670 = precise::max(_640, -400.0);
    float _672 = _662 * _658;
    float _674 = fma(_666, _624, _660);
    float _676 = _664 * (-2.0);
    float _678 = in.m_57.x;
    float _680 = in.m_57.y;
    float _682 = in.m_57.z;
    float _684 = _672 * (-2.0);
    float _686 = _674 * 0.15915493667125701904296875;
    float _688 = fma(_274, _676, _274);
    float _690 = in.m_59.x;
    float _692 = in.m_59.y;
    float _694 = in.m_59.z;
    float _696 = fma(_676, _528, _528);
    float _698 = _184 + (-0.5);
    float _700 = fma(_684, _530, _530);
    float _702 = in.m_47.x;
    float _704 = in.m_47.y;
    float _706 = in.m_47.z;
    float _708 = _166 + (-0.5);
    float _710 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[196].y, _696);
    float _712 = fma(_246, _684, _246);
    float _714 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].z, _700);
    float _716 = fma(_688, _624, _710);
    float _718 = precise::min(_670, -50.0);
    float _720 = in.m_51.w;
    float _722 = _716 * 0.15915493667125701904296875;
    float _724 = fma(_712, _624, _714);
    float _726 = in.m_42.x;
    float _728 = in.m_42.y;
    float _730 = in.m_42.z;
    float _732 = _206 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = _686 * 6.283185482025146484375;
    float _736 = sin(_734);
    float _738 = _472 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _740 = fma(_718, 0.00285714282654225826263427734375, 1.142857074737548828125);
    float _742 = _204 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = fma(_668, _680, _692);
    float _746 = _686 * 6.283185482025146484375;
    float _748 = cos(_746);
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _744);
    float _752 = fma(_496, _702, _738);
    float _754 = _472 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _756 = _472 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _758 = _750 * _732;
    float _760 = _724 * 0.15915493667125701904296875;
    float _762 = fma(_740, -0.5, 1.0);
    float _764 = _668 * 0.20000000298023223876953125;
    float _766 = _722 * 6.283185482025146484375;
    float _768 = sin(_766);
    float _770 = fma(_496, _704, _754);
    float _772 = fma(_496, _706, _756);
    float _774 = _678 * _764;
    float _776 = _682 * _764;
    float _778 = fma(_770, _720, _728);
    float _780 = fma(_752, _720, _726);
    float _782 = fma(_762, _690, _774);
    float _784 = _722 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = fma(_762, _694, _776);
    float _790 = _212 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _782);
    float _794 = fma(_772, _720, _730);
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _788);
    float _798 = _792 * _742;
    float _800 = _760 * 6.283185482025146484375;
    float _802 = cos(_800);
    float _804 = _748 * _768;
    float _806 = _736 * _768;
    float _808 = _796 * _790;
    float _810 = _778 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _812 = _760 * 6.283185482025146484375;
    float _814 = sin(_812);
    float _816 = _736 * _786;
    float _818 = _748 * _786;
    float _820 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[6].x, _810);
    float _822 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[6].z, _820);
    float _824 = _748 * _802;
    float _826 = _786 * _802;
    float _828 = _736 * _802;
    float _830 = _768 * _802;
    float _832 = _828 * _758;
    float _834 = -_804;
    float _836 = fma(_814, _816, _834);
    float _838 = -_816;
    float _840 = fma(_814, _804, _838);
    float _842 = fma(_814, _818, _806);
    float _844 = _824 * _758;
    float _846 = fma(_814, _806, _818);
    float _848 = -_758;
    float _850 = _814 * _848;
    float _852 = fma(_836, _798, _832);
    float _854 = fma(_842, _798, _844);
    float _856 = _778 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _858 = fma(_826, _798, _850);
    float _860 = fma(_846, _808, _852);
    float _862 = fma(_840, _808, _854);
    float _864 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[4].x, _856);
    float _866 = fma(_830, _808, _858);
    float _868 = _822 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _870 = _862 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _872 = _862 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _874 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[4].z, _864);
    float _876 = _778 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _878 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[10].x, _870);
    float _880 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[8].x, _872);
    float _882 = _874 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _884 = fma(_780, (*spvDescriptorSet0.vp_c10)._m0[5].x, _876);
    float _886 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[10].z, _878);
    float _888 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[8].z, _880);
    float _890 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[5].z, _884);
    float _892 = _868 + _886;
    float _894 = _882 + _888;
    float _896 = _890 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _898 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _900 = _892 + _898;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _904 = _894 + _902;
    float _906 = _900 * _900;
    float _908 = fma(_904, _904, _906);
    float _910 = _862 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _912 = sqrt(_908);
    float _914 = fma(_866, (*spvDescriptorSet0.vp_c10)._m0[9].x, _910);
    float _916 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[9].z, _914);
    float _918 = _896 + _916;
    bool _920 = _912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _922 = _896;
    float _924 = _794;
    float _926 = _890;
    float _928 = _680;
    float _930 = _678;
    float _932 = _682;
    if (!_920)
    {
        _922 = _894;
    }
    float _934 = _922;
    float _936 = _934;
    if (!_920)
    {
        _924 = _892;
    }
    float _938 = _924;
    float _940 = _938;
    if (!_920)
    {
        _926 = _918;
    }
    float _942 = _926;
    bool _944 = !_920;
    float _946 = _942;
    if (!_944)
    {
        float _948 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _952 = _912 + _950;
        float _954 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = rsqrt(_908);
        float _958 = _952 * _948;
        float _960 = _958 * 0.15915493667125701904296875;
        float _962 = _960 * 6.283185482025146484375;
        float _964 = cos(_962);
        float _966 = _960 * 6.283185482025146484375;
        float _968 = sin(_966);
        float _970 = _964 + (-1.0);
        float _972 = _970 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = fma(_968, _954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _976 = fma(_918, _964, _972);
        float _978 = _956 * _974;
        float _980 = fma(_904, _978, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _982 = fma(_900, _978, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _946 = _976;
        _936 = _980;
        _940 = _982;
    }
    float _984 = _946;
    float _986 = _936;
    float _988 = _940;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _992 = _984 + _990;
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _996 = _986 + _994;
    float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1000 = _988 + _998;
    float _1002 = _992 * _992;
    float _1004 = fma(_996, _996, _1002);
    float _1006 = fma(_1000, _1000, _1004);
    float _1008 = rsqrt(_1006);
    float _1010 = sqrt(_1006);
    float _1012 = _1008 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1014 = _996 * _1012;
    float _1016 = _1000 * _1012;
    float _1018 = _1014 * _1014;
    float _1020 = _1016 * _1016;
    float _1022 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1024 = _1018 + _1020;
    float _1026 = precise::max(0.0, _1022);
    float _1028 = sqrt(_1024);
    float _1030 = -_1012;
    float _1032 = -_1026;
    float _1034 = fma(_992, _1030, _1032);
    bool _1036 = _1028 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1038 = _1000;
    float _1040 = _992;
    float _1042 = _1026;
    float _1044 = _1018;
    float _1046 = _1020;
    if (!_1036)
    {
        _1038 = _1014;
    }
    float _1048 = _1038;
    float _1050 = _1048;
    if (!_1036)
    {
        _1040 = _1034;
    }
    float _1052 = _1040;
    float _1054 = _1052;
    if (!_1036)
    {
        _1042 = _1016;
    }
    float _1056 = _1042;
    bool _1058 = !_1036;
    float _1060 = _1056;
    if (!_1058)
    {
        float _1062 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1064 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1066 = _1028 + _1064;
        float _1068 = _1034 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1070 = rsqrt(_1024);
        float _1072 = _1066 * _1062;
        float _1074 = _1072 * 0.15915493667125701904296875;
        float _1076 = _1074 * 6.283185482025146484375;
        float _1078 = sin(_1076);
        float _1080 = _1074 * 6.283185482025146484375;
        float _1082 = cos(_1080);
        float _1084 = fma(_1078, _1068, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1086 = _1070 * _1084;
        float _1088 = _1082 + (-1.0);
        float _1090 = _1014 * _1086;
        float _1092 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1094 = _1016 * _1086;
        float _1096 = fma(_1034, _1082, _1092);
        float _1098 = _1090 * _1090;
        float _1100 = _1094 * _1094;
        _1054 = _1096;
        _1044 = _1098;
        _1046 = _1100;
        _1050 = _1090;
        _1060 = _1094;
    }
    float _1102 = _1054;
    float _1104 = _1044;
    float _1106 = _1046;
    float _1108 = _1050;
    float _1110 = _1060;
    float _1112 = fma(_1102, _1102, _1104);
    float _1114 = _984 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1116 = _1112 + _1106;
    float _1118 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1114);
    float _1120 = _984 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1124 = fma(_1010, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1122);
    float _1126 = precise::clamp(_1124, 0.0, 1.0);
    float _1128 = rsqrt(_1116);
    float _1130 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1118);
    float _1132 = _984 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1134 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1120);
    float _1136 = -_1126;
    float _1138 = _1136 + 1.0;
    float _1140 = _984 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1142 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1132);
    float _1144 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1134);
    float _1146 = abs(_1138);
    float _1148 = log2(_1146);
    float _1150 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1140);
    float _1152 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1142);
    float _1154 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1156 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1158 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1160 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1150);
    float _1162 = _1128 * _1108;
    float _1164 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1166 = _1128 * _1102;
    float _1168 = _1128 * _1110;
    float _1170 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1172 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1164);
    float _1174 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1176 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1178 = -_1170;
    float _1180 = fma(_1166, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1178);
    float _1182 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1184 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1172);
    float _1186 = -_1176;
    float _1188 = fma(_1174, _1186, 1.0);
    float _1190 = -_1168;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1180);
    float _1194 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1196 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1184);
    float _1198 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1200 = fma(_1192, -0.5, 0.5);
    float _1202 = log2(_1188);
    float _1204 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1206 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1198);
    float _1208 = _1166 + 1.0;
    float _1210 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1212 = 1.0 / _1196;
    float _1214 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1210);
    float _1216 = exp2(_1194);
    float _1218 = _1202 * 0.693147182464599609375;
    float _1220 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1222 = sqrt(_1200);
    float _1224 = fma(_1192, 0.5, 0.5);
    float _1226 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1204);
    float _1228 = fma(_1224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1230 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1226);
    float _1232 = _1214 * _1212;
    float _1234 = -_1166;
    float _1236 = fma(_1216, _1208, _1234);
    float _1238 = fma(_1224, _1228, -0.212114393711090087890625);
    float _1240 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1230);
    float _1242 = fma(_1232, 0.5, 0.5);
    float _1244 = fma(_1224, _1238, 1.570728778839111328125);
    float _1246 = _1240 * _1212;
    float _1248 = _1222 * 0.636619746685028076171875;
    float _1250 = fma(_1246, -0.5, 0.5);
    float _1252 = fma(_1236, 0.5, 0.5);
    float _1254 = -_1244;
    float _1256 = fma(_1248, _1254, 1.0);
    float3 _3821 = float3(_1242, _1250, _1220);
    float _1258 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3821, float3(0.0), isnan(_3821)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3821, float3(0.0), isnan(_3821)), level(0.0)).x;
    float2 _3832 = float2(_1256, _1252);
    float3 _1262 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3832, float2(0.0), isnan(_3832)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3832, float2(0.0), isnan(_3832)), level(0.0)).xyz;
    float _1264 = _1262.x;
    float _1266 = _1262.y;
    float _1268 = _1262.z;
    float _1270 = in.m_61.y;
    bool _1272 = _184 > 0.5;
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1276 = in.m_49.w;
    bool _1278 = _166 > 0.5;
    float _1280 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1284 = _1282 != 0;
    float _1286 = in.m_63.x;
    float _1288 = in.m_63.y;
    float _1290 = in.m_63.z;
    float _1292 = in.m_63.w;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1296 = _1294 != 0;
    float _1298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1302 = _1300 != 0;
    float _1304 = in.m_61.x;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1308 = _1306 != 0;
    out.m_65.w = _1196;
    float _1310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_67.x = _986;
    out.m_67.y = _984;
    out.m_67.z = _988;
    float _1314 = -_1270;
    float _1316 = _1314 + 1.0;
    float _1318 = exp2(_1280);
    bool _1320 = _1276 > 0.5;
    int _1322 = _1272 ? as_type<int>(_1316) : as_type<int>(_1270);
    float _1324 = _678 * _1290;
    int _1326 = _1320 ? as_type<int>(_1316) : as_type<int>(_1270);
    float _1328 = _682 * _1288;
    float _1330 = _1284 ? as_type<float>(_1322) : _1270;
    float _1332 = _680 * _1286;
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1336 = _1334 != 0;
    float _1338 = -_1328;
    float _1340 = fma(_680, _1290, _1338);
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1344 = _1342 != 0;
    float _1346 = -_1324;
    float _1348 = fma(_682, _1286, _1346);
    float _1350 = -_1332;
    float _1352 = fma(_678, _1288, _1350);
    float _1354 = -_1318;
    float _1356 = _1354 + 1.0;
    int _1358 = _1344 ? _1326 : as_type<int>(_1270);
    float _1360 = _1348 * _1292;
    bool _1362 = _1344;
    float _1364 = _1348;
    float _1366 = _1270;
    float _1368 = _1352;
    int _1370 = as_type<int>(_1310);
    int _1372 = _1358;
    if (_1296)
    {
        bool _1374 = _196 > 0.5;
        _1362 = _1374;
    }
    bool _1376 = _1362;
    float _1378 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1296)
    {
        _1364 = _1304;
    }
    float _1380 = _1364;
    float _1382 = _1340 * _1292;
    float _1384 = _1352 * _1292;
    float _1386 = _1380;
    if (_1336)
    {
        float _1388 = _1278 ? _1316 : _1270;
        _1366 = _1388;
    }
    float _1390 = _1366;
    float _1392 = fma(_1378, _1330, -0.5);
    if (!_1296)
    {
        _1368 = _1380;
    }
    float _1394 = _1368;
    float _1396 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1398 = _1394;
    if (_1296)
    {
        _1386 = _1304;
    }
    float _1400 = _1386;
    float _1402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1404 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1406 = -_544;
    float _1408 = fma(_598, _1392, _1406);
    float _1410 = fma(as_type<float>(_1358), _1396, -0.5);
    float _1412 = _1404;
    float _1414 = _1400;
    if (_1296)
    {
        float _1416 = -_1400;
        float _1418 = _1416 + 1.0;
        _1370 = as_type<int>(_1418);
    }
    int _1420 = _1370;
    if (_1302)
    {
        float _1422 = -_1400;
        float _1424 = _1422 + 1.0;
        _620 = as_type<int>(_1424);
    }
    int _1426 = _620;
    if (_1308)
    {
        float _1428 = -_1400;
        float _1430 = _1428 + 1.0;
        _1372 = as_type<int>(_1430);
    }
    int _1432 = _1372;
    float _1434 = fma(_1404, _1390, -0.5);
    if (!_1302)
    {
        _1412 = _1400;
    }
    float _1436 = _1412;
    float _1438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1440 = _1436;
    if (_1296)
    {
        float _1442 = _1376 ? as_type<float>(_1420) : _1400;
        _1398 = _1442;
    }
    float _1444 = _1398;
    float _1446 = -_616;
    float _1448 = fma(_614, _1410, _1446);
    if (_1302)
    {
        float _1450 = _1278 ? as_type<float>(_1426) : _1400;
        _1440 = _1450;
    }
    float _1452 = _1440;
    float _1454 = _1408 + 0.5;
    if (_1308)
    {
        float _1456 = _1272 ? as_type<float>(_1432) : _1400;
        _1414 = _1456;
    }
    float _1458 = _1414;
    float _1460 = -_618;
    float _1462 = fma(_610, _1434, _1460);
    bool _1464 = _744 != 0.0;
    bool _1466 = isnan(_744);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan(0.0);
    bool _1472 = _1468 || _1470;
    float _1474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1476 = _1402 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1478 = _1448 + 0.5;
    bool _1480 = _782 == 0.0;
    bool _1482 = !_1472;
    bool _1484 = _1480 && _1482;
    float _1486 = fma(_1476, _1444, -0.5);
    float _1488 = in.m_53.z;
    bool _1490 = _788 == 0.0;
    bool _1492 = _1490 && _1484;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1498 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1500 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = -_1288;
    float _1504 = _814 * _1502;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1508 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1510 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1512 = -_1360;
    float _1514 = _814 * _1512;
    float _1516 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1492)
    {
        float _1518 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[17].y, _680);
        _928 = _1518;
    }
    float _1520 = _928;
    if (!_1492)
    {
        float _1522 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[17].y, _678);
        _930 = _1522;
    }
    float _1524 = _930;
    out.m_69.x = _1500;
    out.m_69.y = _1510;
    out.m_69.z = _1516;
    float _1526 = fma(_826, _1286, _1504);
    if (!_1492)
    {
        float _1528 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _682);
        _932 = _1528;
    }
    float _1530 = _932;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1536 = fma(_1498, _1452, -0.5);
    float _1538 = fma(_606, _1486, _538);
    float _1540 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1542 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1544 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.z = _1488;
    float _1546 = fma(_612, _1536, _594);
    float _1548 = -_1520;
    float _1550 = _814 * _1548;
    float _1552 = _824 * _1520;
    float _1554 = _828 * _1520;
    float _1556 = _824 * _1360;
    float _1558 = fma(_826, _1524, _1550);
    float _1560 = fma(_826, _1382, _1514);
    float _1562 = fma(_842, _1524, _1552);
    float _1564 = _824 * _1288;
    float _1566 = fma(_836, _1524, _1554);
    float _1568 = fma(_830, _1530, _1558);
    float _1570 = fma(_840, _1530, _1562);
    float _1572 = fma(_842, _1286, _1564);
    float _1574 = _828 * _1288;
    float _1576 = fma(_830, _1290, _1526);
    float _1578 = _1570 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1580 = _1570 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1582 = fma(_840, _1290, _1572);
    out.m_73.x = _1540;
    out.m_73.y = _1542;
    out.m_73.z = _1544;
    float _1584 = fma(_842, _1382, _1556);
    float _1586 = fma(_846, _1530, _1566);
    float _1588 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1578);
    float _1590 = fma(_836, _1286, _1574);
    float _1592 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1594 = fma(_840, _1384, _1584);
    float _1596 = _1546 + 0.5;
    float _1598 = fma(_846, _1290, _1590);
    float _1600 = _1570 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1602 = _828 * _1360;
    float _1604 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1606 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1580);
    float _1608 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1610 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1612 = fma(_1576, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1592);
    float _1614 = fma(_830, _1384, _1560);
    float _1616 = fma(_1576, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1608);
    float _1618 = fma(_1576, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1610);
    float _1620 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1622 = fma(_836, _1382, _1602);
    float _1624 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1604);
    float _1626 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1600);
    float _1628 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1630 = fma(_1614, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1620);
    float _1632 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1634 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1612);
    float _1636 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1616);
    float _1638 = fma(_1598, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1618);
    float _1640 = fma(_846, _1384, _1622);
    float _1642 = fma(_1508, _1458, -0.5);
    float _1644 = fma(_1614, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1628);
    float _1646 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1648 = fma(_1614, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1632);
    float _1650 = _1196 * 0.5;
    float _1652 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1630);
    out.m_75.x = _1634;
    out.m_75.y = _1636;
    out.m_75.z = _1638;
    float _1654 = fma(_608, _1642, _580);
    float _1656 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1624);
    float _1658 = _1214 + _1196;
    float _1660 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1644);
    float _1662 = fma(_1240, -0.5, _1650);
    float _1664 = _1538 + 0.5;
    float _1666 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1588);
    float _1668 = _1654 + 0.5;
    float _1670 = _1462 + 0.5;
    float _1672 = fma(_1640, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1648);
    float _1674 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1656);
    float _1676 = _1658 * 0.5;
    float _1678 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1606);
    float _1680 = fma(_1586, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1626);
    float _1682 = -_1646;
    float _1684 = _1682 + 1.0;
    out.m_77.x = _1664;
    out.m_77.y = _1454;
    out.m_77.z = _1596;
    out.m_77.w = _1478;
    bool _1686 = _1010 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1688 = isnan(_1010);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1694 = _1690 || _1692;
    out.m_79.x = _1668;
    out.m_79.y = _1670;
    out.m_81.x = _1652;
    out.m_81.y = _1660;
    out.m_81.z = _1672;
    out.gl_Position.x = _1214;
    out.gl_Position.y = _1240;
    out.gl_Position.z = _1674;
    out.gl_Position.w = _1196;
    float _1696 = _1638;
    float _1698 = _1634;
    if (!_1694)
    {
        _1696 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1700 = _1696;
    out.m_65.x = _1676;
    float _1702 = _1700;
    float _1704 = _1700;
    if (!_1694)
    {
        _1698 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1706 = _1698;
    out.m_65.y = _1662;
    out.m_83.x = _1666;
    out.m_83.y = _1678;
    out.m_83.z = _1680;
    float _1708 = _1646 * _1258;
    float _1710 = _1264 * _1708;
    float _1712 = _1266 * _1708;
    float _1714 = _1268 * _1708;
    float _1716 = _1708;
    float _1718 = _1706;
    float _1720 = _1706;
    if (!_1694)
    {
        _1716 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1722 = _1716;
    out.m_85.x = _1710;
    out.m_85.y = _1712;
    out.m_85.z = _1714;
    out.m_85.w = _1684;
    bool _1724 = !_1694;
    float _1726 = _1722;
    float _1728 = _1722;
    if (!_1724)
    {
        bool _1730 = _1010 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1732 = isnan(_1010);
        bool _1734 = _1730 || _1732;
        bool _1736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1738 = _1734 || _1736;
        if (!_1738)
        {
            float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1742 = _1010 + _1740;
            float _1744 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1746 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1744;
            float _1748 = 1.0 / _1746;
            float _1750 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1752 = _1750 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1754 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1756 = _1754 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1758 = _1742 * _1748;
            float _1760 = precise::clamp(_1758, 0.0, 1.0);
            float _1762 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1764 = _1762 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1766 = fma(_1760, _1756, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1768 = fma(_1760, _1764, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1770 = fma(_1760, _1752, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1728 = _1770;
            _1704 = _1768;
            _1720 = _1766;
            _1772 = true;
        }
        else
        {
            bool _1774 = _1010 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1776 = isnan(_1010);
            bool _1778 = _1774 || _1776;
            bool _1780 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1782 = _1778 || _1780;
            if (!_1782)
            {
                _1702 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1784 = _1702;
            _1704 = _1784;
            if (!_1782)
            {
                _1726 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1786 = _1726;
            _1728 = _1786;
            if (!_1782)
            {
                _1718 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1788 = _1718;
            bool _1790 = !_1782;
            _1720 = _1788;
            if (!_1790)
            {
                bool _1792 = _1010 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1794 = isnan(_1010);
                bool _1796 = _1792 || _1794;
                bool _1798 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1800 = _1796 || _1798;
                if (!_1800)
                {
                    float _1802 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1804 = _1010 + _1802;
                    float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1808 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1806;
                    float _1810 = 1.0 / _1808;
                    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1814 = _1812 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1818 = _1816 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1820 = _1804 * _1810;
                    float _1822 = precise::clamp(_1820, 0.0, 1.0);
                    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1826 = _1824 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1828 = fma(_1822, _1818, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1830 = fma(_1822, _1826, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1832 = fma(_1822, _1814, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1728 = _1832;
                    _1704 = _1830;
                    _1720 = _1828;
                    _1772 = true;
                }
                else
                {
                    _1728 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1704 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1720 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1772 = false;
    float _1834 = _1728;
    float _1836 = _1704;
    float _1838 = _1720;
    float _1840 = _1834 * 0.586610972881317138671875;
    bool _1842 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_45.x = 1.0;
    float _1844 = fma(_1836, 0.298911988735198974609375, _1840);
    out.m_87.x = 0.0;
    float _1846 = fma(_1838, 0.114477999508380889892578125, _1844);
    out.m_89.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1848 = -_1846;
    float _1850 = _1848 + _1836;
    float _1852 = -_1846;
    float _1854 = _1852 + _1834;
    float _1856 = -_1846;
    float _1858 = _1856 + _1838;
    float _1860 = fma(_1850, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1846);
    float _1862 = fma(_1854, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1846);
    float _1864 = fma(_1858, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1846);
    out.m_91.x = _1860;
    out.m_91.y = _1862;
    out.m_91.z = _1864;
    if (!_1842)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1866 = -_984;
    float _1868 = _1866 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1870 = -_986;
    float _1872 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1874 = -_988;
    float _1876 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1878 = _1868 * _1868;
    float _1880 = fma(_1872, _1872, _1878);
    float _1882 = fma(_1876, _1876, _1880);
    float _1884 = sqrt(_1882);
    float _1886 = rsqrt(_1882);
    float _1888 = -_1884;
    float _1890 = _1888 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1892 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1894 = precise::clamp(_1892, 0.0, 1.0);
    float _1896 = _1872 * _1886;
    float _1898 = _1868 * _1886;
    float _1900 = abs(_1894);
    float _1902 = log2(_1900);
    float _1904 = _1876 * _1886;
    float _1906 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1908 = _1678 * _1898;
    float _1910 = -_1898;
    float _1912 = -_1906;
    float _1914 = fma(_1910, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1912);
    float _1916 = fma(_1666, _1896, _1908);
    float _1918 = -_1904;
    float _1920 = fma(_1918, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1914);
    float _1922 = fma(_1680, _1904, _1916);
    float _1924 = precise::clamp(_1922, 0.0, 1.0);
    float _1926 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1928 = _1920 + _1926;
    float _1930 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1932 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = exp2(_1930);
    float _1938 = _1936 * _1934;
    float _1940 = _1924 * _1938;
    float _1942 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1944 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1946 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _1942;
    out.m_87.y = _1944;
    out.m_87.z = _1946;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

