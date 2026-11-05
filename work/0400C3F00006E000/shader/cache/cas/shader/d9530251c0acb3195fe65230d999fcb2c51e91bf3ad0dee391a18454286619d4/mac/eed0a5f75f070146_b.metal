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
    float4 m_65 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_75 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_53 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2194 = false;
    bool _744 = false;
    bool _564 = false;
    bool _386 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2866 = as_type<float>(_110);
        out.gl_Position.z = _2866;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2935 = as_type<float>(_148);
        out.gl_Position.z = _2935;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_51.x;
    float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _154 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _156 = in.m_53.y;
    float _158 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = _154 * _152;
    float _172 = 0.0;
    if (!_168)
    {
        float _174 = _158 * _158;
        float _176 = _174 * 0.5;
        _172 = _176;
    }
    float _178 = _172;
    float _180 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[20].x, _170);
    float _182 = _178;
    if (!_168)
    {
        float _184 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    float _188 = in.m_49.x;
    float _190 = in.m_49.y;
    float _192 = in.m_49.z;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = floor(_180);
    float _198 = _194 * 0.15915493667125701904296875;
    int _200 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _202 = _200 != 0;
    float _204 = _198 * 6.283185482025146484375;
    float _206 = cos(_204);
    float _208 = 1.4012984643248170709237295832899e-45;
    float _210 = _186;
    if (!_168)
    {
        _208 = _158;
    }
    float _212 = _208;
    float _214 = -_196;
    float _216 = _180 + _214;
    bool _218 = !_168;
    float _220 = _212;
    float _222 = _156;
    if (!_218)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _158 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _158);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _252;
    }
    float _254 = _210;
    bool _256 = !_168;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _158 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _220 = _276;
    }
    float _278 = _220;
    float _280 = in.m_55.w;
    float _282 = in.m_44.x;
    float _284 = in.m_44.y;
    float _286 = in.m_44.z;
    bool _288 = _216 < 0.5;
    float _290 = float(_288);
    float _292 = -_216;
    float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _298 = _296 != 0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _302 = _300 != 0;
    float _304 = fma(_206, 0.5, 0.5);
    float _306 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _308 = -_290;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    out.m_57.y = _156;
    bool _312 = !_298;
    int _314 = _312 ? 0 : 1;
    float _316 = -_304;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _320 = fma(_278, _188, _306);
    bool _322 = !_302;
    int _324 = _322 ? 0 : 1;
    float _326 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _328 = !_202;
    int _330 = _328 ? 0 : 1;
    float _332 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _334 = abs(_314);
    float _336 = fma(_278, _190, _326);
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _340 = fma(_278, _192, _332);
    int _342 = abs(_324);
    int _344 = abs(_330);
    float _346 = float(_334);
    float _348 = fma(_320, _280, _282);
    float _350 = float(_344);
    float _352 = fma(_336, _280, _284);
    float _354 = float(_342);
    float _356 = abs(_294);
    float _358 = _346 * _356;
    float _360 = fma(_340, _280, _286);
    float _362 = fma(_350, _318, _358);
    float _364 = abs(_310);
    float _366 = fma(_354, _364, _362);
    bool _368 = !_338;
    float _384;
    if (!_368)
    {
        float _370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _372 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _374 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _376 = _374 * _370;
        float _378 = floor(_376);
        float _380 = -_378;
        float _382 = _376 + _380;
        _384 = _382;
        _386 = true;
    }
    else
    {
        float _388 = float(_94);
        float _390 = 1.0 / _388;
        float _392 = _128 * _390;
        _384 = _392;
    }
    _386 = false;
    float _394 = _384;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _398 = _394 + _396;
    bool _400 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _402 = isnan(_394);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _414 = _394 + _412;
    bool _416 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _418 = isnan(_394);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _436 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _438 = isnan(_394);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = -_410;
    float _450 = _448 + 1.0;
    float _452 = 1.0 / _434;
    float _454 = _446 * _450;
    float _456 = -_446;
    float _458 = _456 + 1.0;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _460;
    bool _464 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _466 = 1.0 / _430;
    float _468 = _426 * _458;
    float _470 = -_426;
    float _472 = _470 + 1.0;
    float _474 = _414 * _452;
    float _476 = _398 * _466;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _482;
    float _486 = fma(_462, _476, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _488 = fma(_480, _476, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _490 = fma(_484, _476, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _492 = in.m_55.x;
    float _494 = in.m_55.y;
    float _496 = in.m_55.z;
    float _498 = _486 * _468;
    float _500 = _488 * _468;
    float _502 = _490 * _468;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _516 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].x, _498);
    float _518 = fma(_506, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _520 = fma(_510, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _522 = fma(_514, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _524 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].y, _500);
    float _526 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].z, _502);
    float _528 = fma(_518, _454, _516);
    float _530 = fma(_520, _454, _524);
    float _532 = fma(_522, _454, _526);
    float _534 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[145].x, _528);
    float _536 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[145].y, _530);
    float _538 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[145].z, _532);
    float _540 = _534 * _492;
    float _542 = _536 * _494;
    float _544 = _538 * _496;
    bool _546 = !_464;
    float _562;
    if (!_546)
    {
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _550 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        float _566 = float(_94);
        float _568 = 1.0 / _566;
        float _570 = _128 * _568;
        _562 = _570;
    }
    _564 = false;
    float _572 = _562;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _576 = _572 + _574;
    bool _578 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _580 = isnan(_572);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _592 = _572 + _590;
    bool _594 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _596 = isnan(_572);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _614 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _616 = isnan(_572);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = -_588;
    float _628 = _626 + 1.0;
    float _630 = 1.0 / _612;
    float _632 = _624 * _628;
    float _634 = -_624;
    float _636 = _634 + 1.0;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _638;
    bool _642 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _644 = 1.0 / _608;
    float _646 = _604 * _636;
    float _648 = -_604;
    float _650 = _648 + 1.0;
    float _652 = _592 * _630;
    float _654 = _576 * _644;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _660;
    float _664 = fma(_640, _654, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _666 = fma(_658, _654, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _668 = fma(_662, _654, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _670 = _664 * _646;
    float _672 = _666 * _646;
    float _674 = _668 * _646;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _688 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].x, _670);
    float _690 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].y, _672);
    float _692 = fma(_678, _652, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _694 = fma(_682, _652, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _696 = fma(_686, _652, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _698 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].z, _674);
    float _700 = fma(_692, _632, _688);
    float _702 = fma(_694, _632, _690);
    float _704 = fma(_696, _632, _698);
    float _706 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[109].x, _700);
    float _708 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[109].y, _702);
    float _710 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[109].z, _704);
    float _712 = _706 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _714 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _718 = _710 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _720 = _712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _722 = _714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = _718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _726 = !_642;
    float _742;
    if (!_726)
    {
        float _728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _730 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _734 = _732 * _728;
        float _736 = floor(_734);
        float _738 = -_736;
        float _740 = _734 + _738;
        _742 = _740;
        _744 = true;
    }
    else
    {
        float _746 = float(_94);
        float _748 = 1.0 / _746;
        float _750 = _128 * _748;
        _742 = _750;
    }
    _744 = false;
    float _752 = _742;
    float _754 = in.m_51.y;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _758 = _756 != 0;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _766 = _764 != 0;
    float _768 = _150 * 2.0;
    float _770 = in.m_51.z;
    float _772 = in.m_51.w;
    float _774 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _776 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = floor(_768);
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _784 = _782 != 0;
    float _786 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _788 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _790 = -_780;
    float _792 = fma(_774, 2.0, _790);
    float _794 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].x, _786);
    float _796 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _798 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].x, _788);
    float _800 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _794);
    float _802 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _796);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _806 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _798);
    float _808 = _754 * 2.0;
    float _810 = _150 + _754;
    float _812 = _754 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _814 = _778 > 0.0;
    float _816 = _770 * 2.0;
    float _818 = _810 + (-1.0);
    float _820 = floor(_808);
    float _822 = _754 + _770;
    float _824 = fma(_812, -2.0, _804);
    bool _826 = _778 >= 0.0;
    bool _828 = isnan(_778);
    bool _830 = _826 || _828;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    float _836 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _838 = _822 + (-1.0);
    float _840 = floor(_816);
    int _842 = _834 ? 0 : 1;
    float _844 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _846 = (*spvDescriptorSet0.vp_c7)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _848 = (*spvDescriptorSet0.vp_c7)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _850 = _150 + _770;
    float _852 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[0].x, _846);
    bool _854 = _820 > 0.0;
    float _856 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[1].x, _848);
    bool _858 = _820 >= 0.0;
    bool _860 = isnan(_820);
    bool _862 = _858 || _860;
    bool _864 = isnan(0.0);
    bool _866 = _862 || _864;
    float _868 = _850 + (-1.0);
    int _870 = ~_842;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _878 = _874;
    float _880 = _868;
    float _882 = _852;
    if (!_814)
    {
        int _884 = ~_842;
        int _886 = _884 + 1;
        _878 = _886;
    }
    int _888 = _878;
    float _890 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _892 = _802 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _894 = _866 ? 0 : 1;
    float _896 = _800 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _898 = _840 > 0.0;
    float _900 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c8)._m0[0].z, _852);
    bool _902 = _840 >= 0.0;
    bool _904 = isnan(_840);
    bool _906 = _902 || _904;
    bool _908 = isnan(0.0);
    bool _910 = _906 || _908;
    float _912 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _856);
    float _914 = (*spvDescriptorSet0.vp_c7)._m0[2].z;
    bool _916 = _910;
    if (_784)
    {
        _914 = _150;
    }
    float _918 = _914;
    float _920 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _922 = _892 + _920;
    float _924 = _918;
    if (!_784)
    {
        _880 = _754;
    }
    float _926 = _880;
    float _928 = _912 * _912;
    float _930 = _926;
    if (!_784)
    {
        _924 = _770;
    }
    float _932 = _924;
    float _934 = _806 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _936 = fma(_900, _900, _928);
    if (_784)
    {
        _930 = _150;
    }
    float _938 = _930;
    float _940 = _932 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _944 = _938 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_784)
    {
        _882 = _770;
    }
    float _948 = _882;
    float _950 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[83].z, _876);
    float _952 = _948;
    if (_784)
    {
        _952 = _754;
    }
    float _954 = _952;
    float _956 = -_942;
    float _958 = fma(_944, 2.0, _956);
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _964 = !_762;
    int _966 = _964 ? 0 : 1;
    float _968 = rsqrt(_936);
    float _970 = -_960;
    float _972 = fma(_940, 2.0, _970);
    float _974 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[83].w, _962);
    int _976 = abs(_966);
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _980 = _896 + _978;
    float _982 = in.m_59.x;
    float _984 = in.m_59.y;
    float _986 = in.m_59.z;
    int _988 = ~_894;
    int _990 = _988 + 1;
    int _992 = _990 + 1;
    float _994 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _824);
    int _996 = _992;
    if (!_854)
    {
        int _998 = ~_894;
        int _1000 = _998 + 1;
        _996 = _1000;
    }
    int _1002 = _996;
    float _1004 = -_128;
    float _1006 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[81].x, _958);
    bool _1008 = !_758;
    int _1010 = _1008 ? 0 : 1;
    float _1012 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _974);
    float _1014 = float(_976);
    float _1016 = _366 * _544;
    float _1018 = float(_888);
    float _1020 = _366 * _540;
    int _1022 = abs(_1010);
    float _1024 = _900 * _968;
    float _1026 = _1024;
    if (!_784)
    {
        _946 = _770;
    }
    float _1028 = _946;
    float _1030 = _1014 * _1018;
    float _1032 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1034 = log2(_1032);
    float _1036 = _1028;
    if (_784)
    {
        _1036 = _754;
    }
    float _1038 = _1036;
    float _1040 = _1030 * (-2.0);
    int _1042 = _910 ? 0 : 1;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1046 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1048 = ~_1042;
    int _1050 = _1048 + 1;
    int _1052 = _1050 + 1;
    float _1054 = fma(_1040, _984, _984);
    float _1056 = in.m_61.x;
    float _1058 = in.m_61.y;
    float _1060 = fma(_1046, -2.0, _1044);
    float _1062 = _1046;
    int _1064 = _1052;
    if (_784)
    {
        _1062 = _754;
    }
    float _1066 = _1062;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1070 = _1066;
    if (!_784)
    {
        _1070 = _150;
    }
    float _1072 = _1070;
    float _1074 = fma(_844, _1040, _844);
    if (!_898)
    {
        int _1076 = ~_1042;
        int _1078 = _1076 + 1;
        _1064 = _1078;
    }
    int _1080 = _1064;
    float _1082 = _1034 * _128;
    float _1084 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1086 = float(_1022);
    float _1088 = _912 * _968;
    float _1090 = float(_1080);
    float _1092 = exp2(_1082);
    float _1094 = fma(_1084, -2.0, _1068);
    bool _1096 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1098 = isnan(1.0);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1104 = _1100 || _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1108 = 1.0 + _1106;
    float _1110 = _1086 * _1090;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1114 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1094);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1118 = 1.0 / _1108;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1122 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1112);
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1126 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1116);
    float _1128 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1120);
    float _1130 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1124);
    float _1132 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1122);
    float _1134 = -_1092;
    float _1136 = _1134 + 1.0;
    float _1138 = _922 * _922;
    bool _1140 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1148 = _1144 || _1146;
    float _1150 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0599999986588954925537109375, _1058);
    float _1152 = -_128;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[76].x, _792);
    float _1156 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1130);
    float _1158 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1128);
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1162 = _934 + _1160;
    float _1164 = fma(_980, _980, _1138);
    float _1166 = _1148 ? _1136 : 0.0;
    float _1168 = _1150 * 5.0;
    float _1170 = -_128;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[86].x, _972);
    float _1174 = fma(_1162, _1162, _1164);
    float _1176 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1126);
    float _1178 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _950);
    float _1180 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1060);
    float _1182 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.07999999821186065673828125, _1056);
    bool _1184 = !_766;
    int _1186 = _1184 ? 0 : 1;
    float _1188 = _1088;
    if (_1104)
    {
        float _1190 = _1166 * _1118;
        _132 = _1190;
    }
    float _1192 = _132;
    float _1194 = _1168 * 0.15915493667125701904296875;
    float _1196 = _754 + (-0.5);
    float _1198 = _1182 * 4.0;
    int _1200 = abs(_1186);
    float _1202 = rsqrt(_1174);
    float _1204 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1054);
    float _1206 = abs(_1024);
    float _1208 = abs(_1088);
    float _1210 = precise::max(_1206, _1208);
    float _1212 = _770 + (-0.5);
    float _1214 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1216 = _1210 >= 16.0;
    float _1218 = _1110 * (-2.0);
    float _1220 = _150 + (-0.5);
    float _1222 = _1198 * 0.15915493667125701904296875;
    float _1224 = float(_1200);
    float _1226 = fma(_1218, _982, _982);
    float _1228 = float(_1002);
    float _1230 = fma(_1074, _1192, _1204);
    float _1232 = fma(_836, _1218, _836);
    float _1234 = in.m_63.x;
    float _1236 = _922 * _1202;
    float _1238 = _1224 * _1228;
    float _1240 = _980 * _1202;
    float _1242 = _1162 * _1202;
    float _1244 = _1236 * _1236;
    float _1246 = _1194 * 6.283185482025146484375;
    float _1248 = sin(_1246);
    float _1250 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1226);
    float _1252 = _1238 * (-2.0);
    int _1254 = as_type<int>(_1214);
    if (_1216)
    {
        float _1256 = _1024 * 0.0625;
        _1026 = _1256;
    }
    float _1258 = _1026;
    if (_1216)
    {
        float _1260 = _1088 * 0.0625;
        _1188 = _1260;
    }
    float _1262 = _1188;
    float _1264 = fma(_1232, _1192, _1250);
    float _1266 = fma(_1252, _986, _986);
    float _1268 = in.m_61.z;
    float _1270 = _1222 * 6.283185482025146484375;
    float _1272 = sin(_1270);
    float _1274 = fma(_1240, _1240, _1244);
    float _1276 = abs(_1258);
    bool _1278 = _1276 != 0.0;
    bool _1280 = isnan(_1276);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan(0.0);
    bool _1286 = _1282 || _1284;
    float _1288 = fma(_890, _1252, _890);
    float _1290 = fma(_1242, _1242, _1274);
    float _1292 = abs(_1262);
    bool _1294 = _1292 == 0.0;
    bool _1296 = !_1286;
    bool _1298 = _1294 && _1296;
    float _1300 = _1230 * 0.15915493667125701904296875;
    float _1302 = precise::max(_1234, -0.20000000298023223876953125);
    float _1304 = rsqrt(_1290);
    float _1306 = precise::max(_1234, -0.5);
    float _1308 = _1264 * 0.15915493667125701904296875;
    float _1310 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1266);
    float _1312 = precise::min(_1302, 1.0);
    float _1314 = _1272 * 0.180000007152557373046875;
    float _1316 = precise::min(_1306, 1.0);
    float _1318 = fma(_1288, _1192, _1310);
    float _1320 = _1248 * 0.23000000417232513427734375;
    float _1322 = fma(_1312, 0.833333313465118408203125, 0.16666667163372039794921875);
    float _1324 = abs(_1262);
    bool _1326 = _1324 == 0.0;
    float _1328 = _1318 * 0.15915493667125701904296875;
    float _1330 = fma(_1316, 0.666666686534881591796875, 0.3333333432674407958984375);
    float _1332 = fma(_1320, _1322, _1056);
    float _1334 = _1300 * 6.283185482025146484375;
    float _1336 = sin(_1334);
    float _1338 = _366 * _542;
    float _1340 = fma(_1314, _1330, _1058);
    float _1342 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1332);
    int _1346 = as_type<int>(_1330);
    if (_1298)
    {
        bool _1348 = as_type<int>(_1262) >= 0;
        _916 = _1348;
    }
    bool _1350 = _916;
    float _1352 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1268);
    float _1356 = _1300 * 6.283185482025146484375;
    float _1358 = cos(_1356);
    float _1360 = _1214 * _1344;
    int _1362 = _1350 ? (-1) : 0;
    if (_1298)
    {
        int _1364 = _1350 ? 0 : 1078530011;
        _1254 = _1364;
    }
    int _1366 = _1254;
    float _1368 = _1240 * _1304;
    float _1370 = _1236 * _1304;
    float _1372 = _1342 * _1354;
    float _1374 = _1242 * _1304;
    int _1376 = _1366;
    if (_1298)
    {
        int _1378 = int(0x80000000) & as_type<int>(_1258);
        int _1380 = _1366 | _1378;
        _1376 = _1380;
    }
    int _1382 = _1376;
    float _1384 = _1328 * 6.283185482025146484375;
    float _1386 = sin(_1384);
    float _1388 = _1328 * 6.283185482025146484375;
    float _1390 = cos(_1388);
    float _1392 = _1308 * 6.283185482025146484375;
    float _1394 = sin(_1392);
    float _1396 = _1308 * 6.283185482025146484375;
    float _1398 = cos(_1396);
    float _1400 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1340);
    float _1402 = _1352 * _1400;
    bool _1404 = !_1286;
    bool _1406 = _1404 && _1326;
    int _1408 = _1382;
    float _1410 = as_type<float>(_1382);
    if (!_1406)
    {
        float _1412 = abs(_1258);
        bool _1414 = _1412 != as_type<float>(0x7f800000u /* inf */);
        bool _1416 = isnan(_1412);
        bool _1418 = _1414 || _1416;
        bool _1420 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1422 = _1418 || _1420;
        float _1424 = abs(_1262);
        bool _1426 = _1424 == as_type<float>(0x7f800000u /* inf */);
        float _1428 = abs(_1262);
        bool _1430 = _1428 == as_type<float>(0x7f800000u /* inf */);
        bool _1432 = !_1422;
        bool _1434 = _1430 && _1432;
        if (_1434)
        {
            bool _1436 = as_type<int>(_1262) >= 0;
            _1362 = _1436 ? (-1) : 0;
        }
        int _1438 = _1362;
        if (_1434)
        {
            _1408 = 1075235812;
        }
        int _1440 = _1408;
        int _1442 = _1440;
        if (_1434)
        {
            int _1444 = ~_1438;
            int _1446 = (_1444 != 0) ? _1440 : 1061752795;
            _1442 = _1446;
        }
        int _1448 = _1442;
        float _1450 = as_type<float>(_1448);
        if (_1434)
        {
            int _1452 = int(0x80000000) & as_type<int>(_1258);
            int _1454 = _1448 | _1452;
            _1450 = as_type<float>(_1454);
        }
        float _1456 = _1450;
        bool _1458 = !_1422;
        bool _1460 = _1458 && _1426;
        _1410 = _1456;
        if (!_1460)
        {
            float _1462 = abs(_1258);
            float _1464 = abs(_1262);
            float _1466 = precise::max(_1462, _1464);
            float _1468 = abs(_1258);
            float _1470 = abs(_1262);
            float _1472 = precise::min(_1468, _1470);
            float _1474 = 1.0 / _1466;
            float _1476 = abs(_1258);
            float _1478 = abs(_1262);
            bool _1480 = _1476 > _1478;
            bool _1482 = as_type<int>(_1262) >= 0;
            float _1484 = _1472 * _1474;
            float _1486 = _1484 * _1484;
            float _1488 = _1486 + 11.33538818359375;
            float _1490 = fma(_1486, _1488, 28.84246826171875);
            float _1492 = fma(_1486, _1490, 19.6966705322265625);
            float _1494 = fma(_1486, -0.82336294651031494140625, -5.674867153167724609375);
            float _1496 = fma(_1486, _1494, -6.565555095672607421875);
            float _1498 = 1.0 / _1492;
            float _1500 = _1486 * _1496;
            float _1502 = abs(_1258);
            float _1504 = abs(_1262);
            float _1506 = _1502 + _1504;
            int _1508 = as_type<int>(_1258) & int(0x80000000);
            float _1510 = _1484 * _1500;
            bool _1512 = _1506 > as_type<float>(0x7f800000u /* inf */);
            bool _1514 = isnan(_1506);
            bool _1516 = _1512 || _1514;
            bool _1518 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1520 = _1516 || _1518;
            float _1522 = fma(_1510, _1498, _1484);
            float _1524 = _1522;
            _1410 = _1506;
            if (_1480)
            {
                float _1526 = -_1522;
                float _1528 = _1526 + 1.57079637050628662109375;
                _1524 = _1528;
            }
            float _1530 = _1524;
            int _1532 = as_type<int>(_1530);
            if (!_1482)
            {
                float _1534 = -_1530;
                float _1536 = _1534 + 3.1415927410125732421875;
                _1532 = as_type<int>(_1536);
            }
            int _1538 = _1532;
            if (!_1520)
            {
                int _1540 = _1508 | _1538;
                _1410 = as_type<float>(_1540);
            }
        }
    }
    float _1542 = _1410;
    float _1544 = _1398 * _1336;
    float _1546 = _1394 * _1336;
    float _1548 = _1336 * _1390;
    float _1550 = _1358 * _1390;
    float _1552 = _1390 * _1402;
    float _1554 = _1398 * _1358;
    float _1556 = _1542 * 0.15915493667125701904296875;
    float _1558 = _1394 * _1358;
    float _1560 = _1398 * _1552;
    float _1562 = fma(_1386, _1554, _1546);
    float _1564 = _1556 * 6.283185482025146484375;
    float _1566 = cos(_1564);
    float _1568 = -_1544;
    float _1570 = fma(_1386, _1558, _1568);
    float _1572 = -_1402;
    float _1574 = _1386 * _1572;
    float _1576 = -_1558;
    float _1578 = fma(_1386, _1544, _1576);
    float _1580 = fma(_1562, _1360, _1560);
    float _1582 = _1394 * _1552;
    float _1584 = fma(_1550, _1360, _1574);
    float _1586 = fma(_1386, _1546, _1554);
    float _1588 = _1556 * 6.283185482025146484375;
    float _1590 = sin(_1588);
    float _1592 = fma(_1578, _1372, _1580);
    float _1594 = fma(_1570, _1360, _1582);
    float _1596 = fma(_1548, _1372, _1584);
    bool _1598 = _754 > 0.5;
    float _1600 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1602 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1604 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1606 = fma(_1586, _1372, _1594);
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1600);
    float _1610 = -_1566;
    float _1612 = _1610 + 1.0;
    float _1614 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1602);
    float _1616 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1604);
    float _1618 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1608);
    float _1620 = _1368 * _1612;
    float _1622 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1614);
    float _1624 = _1374 * _1590;
    float _1626 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1616);
    float _1628 = _1370 * _1612;
    float _1630 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1632 = fma(_1370, _1620, _1624);
    float _1634 = _1370 * _1590;
    float _1636 = -_1624;
    float _1638 = fma(_1370, _1620, _1636);
    float _1640 = fma(_1370, _1628, _1566);
    float _1642 = _1368 * _1590;
    float _1644 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1646 = fma(_1368, _1620, _1566);
    float _1648 = _1630 * _1640;
    float _1650 = fma(_1374, _1628, _1642);
    float _1652 = -_1642;
    float _1654 = fma(_1374, _1628, _1652);
    float _1656 = _1630 * _1638;
    float _1658 = fma(_1644, _1632, _1648);
    float _1660 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1662 = -_1634;
    float _1664 = fma(_1374, _1620, _1662);
    float _1666 = fma(_1374, _1620, _1634);
    float _1668 = _1374 * _1374;
    float _1670 = _1630 * _1650;
    float _1672 = fma(_1644, _1646, _1656);
    float _1674 = fma(_1660, _1654, _1658);
    float _1676 = fma(_1612, _1668, _1566);
    float _1678 = fma(_1644, _1664, _1670);
    float _1680 = fma(_1660, _1666, _1672);
    float _1682 = _1674 * _1674;
    float _1684 = fma(_1660, _1676, _1678);
    float _1686 = fma(_1680, _1680, _1682);
    int _1688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1690 = _1688 != 0;
    float _1692 = fma(_1684, _1684, _1686);
    float _1694 = -_156;
    float _1696 = _1694 + 1.0;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1700 = _1698 != 0;
    float _1702 = in.m_53.x;
    float _1704 = rsqrt(_1692);
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1708 = _1706 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1710 = _1598 ? as_type<int>(_1696) : as_type<int>(_156);
    float _1712 = _1556;
    float _1714 = _1674;
    if (_1690)
    {
        float _1716 = in.m_51.z;
        _1712 = _1716;
    }
    float _1718 = _1712;
    float _1720 = _1700 ? as_type<float>(_1710) : _156;
    float _1722 = 1.0 / _1708;
    float _1724 = precise::max(-0.10999999940395355224609375, (*spvDescriptorSet0.vp_c7)._m0[2].y);
    bool _1726 = _770 > 0.5;
    int _1728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1730 = _1728 != 0;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1734 = _1732 != 0;
    float _1736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1740 = _1738 != 0;
    int _1742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1744 = _1742 != 0;
    float _1746 = _1674 * _1704;
    float _1748 = precise::min(_1724, 0.10999999940395355224609375);
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1752 = _1750 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1754 = precise::max((*spvDescriptorSet0.vp_c7)._m0[2].x, -0.10999999940395355224609375);
    float _1756 = (*spvDescriptorSet0.vp_c7)._m0[2].x * 40.0;
    int _1758 = _1726 ? as_type<int>(_1696) : as_type<int>(_156);
    float _1760 = _1748 * _1746;
    bool _1762 = _772 > 0.5;
    float _1764 = _1680 * _1704;
    float _1766 = precise::min(_1754, 0.10999999940395355224609375);
    float _1768 = _1684 * _1704;
    float _1770 = precise::max(-0.10999999940395355224609375, (*spvDescriptorSet0.vp_c7)._m0[2].z);
    float _1772 = 1.0 / _1752;
    float _1774 = fma(_1766, _1764, _1760);
    float _1776 = precise::min(_1770, 0.10999999940395355224609375);
    bool _1778 = _1744;
    bool _1780 = _1740;
    int _1782 = as_type<int>(_1736);
    if (_1734)
    {
        float _1784 = -_1702;
        float _1786 = _1784 + 1.0;
        _1346 = as_type<int>(_1786);
    }
    int _1788 = _1346;
    float _1790 = _1740 ? as_type<float>(_1758) : _156;
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1792;
    if (_1744)
    {
        float _1796 = _1762 ? _1696 : _156;
        _222 = _1796;
    }
    float _1798 = _222;
    float _1800 = fma(_1776, _1768, _1774);
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1804 = _752 + _1802;
    float _1806 = _1794 * _1722;
    float _1808 = _1798;
    if (_1690)
    {
        bool _1810 = _1718 > 0.5;
        _1778 = _1810;
    }
    bool _1812 = _1778;
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1816 = _1814 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    if (_1730)
    {
        bool _1818 = _150 > 0.5;
        _1780 = _1818;
    }
    bool _1820 = _1780;
    float _1822 = fma(_1806, _1804, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1824 = precise::max(_1800, -1.0);
    float _1826 = _1816 * _1772;
    float _1828 = _896 + _1680;
    float _1830 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1832 = precise::min(0.0, _1824);
    float _1834 = _934 + _1684;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1838 = _752 + _1836;
    bool _1840 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1842 = isnan(_752);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1848 = _1844 || _1846;
    float _1850 = float(_1848);
    float _1852 = _1832 * 40.0;
    float _1854 = fma(_1756, _1832, _1828);
    float _1856 = fma(_1826, _1838, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1858 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1860 = isnan(_752);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    float _1870 = fma(_1852, (*spvDescriptorSet0.vp_c7)._m0[2].z, _1834);
    float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1874 = _1854 + _1872;
    float _1876 = -_1850;
    float _1878 = _1876 + 1.0;
    float _1880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1884 = _1870 + _1882;
    float _1886 = _1874 * _1874;
    float _1888 = _1868 * _1878;
    float _1890 = -_1868;
    float _1892 = _1890 + 1.0;
    float _1894 = _1884 * _1884;
    float _1896 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1898 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1900 = isnan(_752);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1906 = _1902 || _1904;
    float _1908 = float(_1906);
    float _1910 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1912 = _1886 + _1894;
    float _1914 = fma(_1896, _1720, -0.5);
    float _1916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1918 = fma(_1790, _1910, -0.5);
    float _1920 = _1908 * _1892;
    float _1922 = -_994;
    float _1924 = fma(_1132, _1914, _1922);
    float _1926 = -_1908;
    float _1928 = _1926 + 1.0;
    float _1930 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1932 = _1822 * _1920;
    int _1934 = as_type<int>(_1920);
    float _1936 = _1878;
    float _1938 = _1914;
    float _1940 = _1852;
    float _1942 = _1886;
    float _1944 = _1894;
    if (_1730)
    {
        float _1946 = -_1702;
        float _1948 = _1946 + 1.0;
        _1934 = as_type<int>(_1948);
    }
    int _1950 = _1934;
    float _1952 = sqrt(_1912);
    float _1954 = fma(_1930, _1798, -0.5);
    if (!_1734)
    {
        _1808 = _1702;
    }
    float _1956 = _1808;
    float _1958 = _1956;
    if (_1690)
    {
        float _1960 = -_1702;
        float _1962 = _1960 + 1.0;
        _1782 = as_type<int>(_1962);
    }
    int _1964 = _1782;
    if (_1734)
    {
        float _1966 = _1598 ? as_type<float>(_1788) : _1702;
        _1958 = _1966;
    }
    float _1968 = _1958;
    float _1970 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1932);
    if (!_1730)
    {
        _1936 = _1702;
    }
    float _1972 = _1936;
    float _1974 = -_1180;
    float _1976 = fma(_1012, _1954, _1974);
    float _1978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1980 = _1972;
    if (!_1690)
    {
        _1938 = _1702;
    }
    float _1982 = _1938;
    float _1984 = fma(_1856, _1888, _1970);
    float _1986 = _1982;
    if (_1730)
    {
        float _1988 = _1820 ? as_type<float>(_1950) : _1702;
        _1980 = _1988;
    }
    float _1990 = _1980;
    float _1992 = _892 + _1674;
    if (_1690)
    {
        float _1994 = _1812 ? as_type<float>(_1964) : _1702;
        _1986 = _1994;
    }
    float _1996 = _1986;
    float _1998 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2000 = fma(_1850, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1984);
    float _2002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2004 = _1952 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2006 = fma(_1852, (*spvDescriptorSet0.vp_c7)._m0[2].y, _1992);
    float _2008 = fma(_1998, _1990, -0.5);
    float _2010 = fma(_1176, _2008, _1154);
    float _2012 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2014 = fma(_2012, _1968, -0.5);
    float _2016 = _2014;
    if (!_2004)
    {
        _1714 = _1886;
    }
    float _2018 = _1714;
    float _2020 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2022 = fma(_1158, _2014, _1172);
    float _2024 = _2018;
    if (!_2004)
    {
        _2016 = _1854;
    }
    float _2026 = _2016;
    float _2028 = fma(_2020, _1996, -0.5);
    float _2030 = _2026;
    if (!_2004)
    {
        _1940 = _1870;
    }
    float _2032 = _1940;
    float _2034 = _2032;
    if (!_2004)
    {
        _1942 = _2006;
    }
    float _2036 = _1942;
    float _2038 = fma(_1178, _2028, _1006);
    bool _2040 = !_2004;
    float _2042 = _2036;
    if (!_2040)
    {
        float _2044 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2048 = _1952 + _2046;
        float _2050 = _2006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2052 = rsqrt(_1912);
        float _2054 = _2048 * _2044;
        float _2056 = _2054 * 0.15915493667125701904296875;
        float _2058 = _2056 * 6.283185482025146484375;
        float _2060 = sin(_2058);
        float _2062 = _2056 * 6.283185482025146484375;
        float _2064 = cos(_2062);
        float _2066 = fma(_2060, _2050, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2068 = _2052 * _2066;
        float _2070 = _2064 + (-1.0);
        float _2072 = fma(_1874, _2068, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2074 = fma(_1884, _2068, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2076 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2080 = _2072 + _2078;
        float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2084 = _2074 + _2082;
        float _2086 = fma(_2006, _2064, _2076);
        float _2088 = _2080 * _2080;
        float _2090 = _2084 * _2084;
        _2042 = _2086;
        _2024 = _2088;
        _1944 = _2090;
        _2030 = _2072;
        _2034 = _2074;
    }
    float _2092 = _2042;
    float _2094 = _2024;
    float _2096 = _1944;
    float _2098 = _2030;
    float _2100 = _2034;
    float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2104 = _2092 + _2102;
    float _2106 = -_1114;
    float _2108 = fma(_1156, _1918, _2106);
    float _2110 = fma(_2104, _2104, _2094);
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2114 = _2038 + 0.5;
    float _2116 = _2110 + _2096;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2122 = _2000 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2124 = sqrt(_2116);
    float _2126 = _2112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2128 = _2118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2130 = _2120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2132 = _1924 + 0.5;
    float _2134 = _2022 + 0.5;
    float _2136 = _2010 + 0.5;
    float _2138 = _1976 + 0.5;
    float _2140 = _2108 + 0.5;
    out.m_65.x = _720;
    out.m_65.y = _722;
    out.m_65.z = _724;
    out.m_65.w = _716;
    out.m_67.x = _2126;
    out.m_67.y = _2128;
    out.m_67.z = _2130;
    out.m_67.w = _2122;
    bool _2142 = _2124 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2144 = isnan(_2124);
    bool _2146 = _2142 || _2144;
    bool _2148 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2150 = _2146 || _2148;
    out.m_69.x = _2136;
    out.m_69.y = _2132;
    out.m_69.z = _2114;
    out.m_69.w = _2138;
    out.m_71.x = _2134;
    out.m_71.y = _2140;
    float _2152 = _2116;
    float _2154 = _2136;
    float _2156 = _2132;
    float _2158 = _2134;
    if (!_2150)
    {
        _2152 = 1.0;
    }
    float _2160 = _2152;
    bool _2162 = !_2150;
    float _2164 = _2160;
    if (!_2162)
    {
        bool _2166 = _2124 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2168 = isnan(_2124);
        bool _2170 = _2166 || _2168;
        bool _2172 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2174 = _2170 || _2172;
        if (!_2174)
        {
            float _2176 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2178 = _2124 + _2176;
            float _2180 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2182 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2180;
            float _2184 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2186 = _2184 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2188 = 1.0 / _2182;
            float _2190 = _2178 * _2188;
            float _2192 = fma(_2190, _2186, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2164 = _2192;
            _2194 = true;
        }
        else
        {
            bool _2196 = _2124 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2198 = isnan(_2124);
            bool _2200 = _2196 || _2198;
            bool _2202 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2204 = _2200 || _2202;
            if (!_2204)
            {
                float _2206 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2208 = _2124 + _2206;
                float _2210 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2212 = _2210 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2214 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2216 = _2214 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2218 = 1.0 / _2212;
                float _2220 = _2208 * _2218;
                float _2222 = fma(_2220, _2216, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2164 = _2222;
                _2194 = true;
            }
            else
            {
                _2164 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2194 = false;
    float _2224 = _2164;
    float _2226 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2228 = _2092 + _2226;
    float _2230 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2232 = _2098 + _2230;
    float _2234 = fma(_2228, _2224, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2236 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2238 = _2100 + _2236;
    float _2240 = fma(_2232, _2224, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2244 = _2234 + _2242;
    float _2246 = fma(_2238, _2224, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2248 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2250 = _2240 + _2248;
    float _2252 = _2244 * _2244;
    float _2254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2256 = _2246 + _2254;
    float _2258 = fma(_2250, _2250, _2252);
    float _2260 = fma(_2256, _2256, _2258);
    float _2262 = rsqrt(_2260);
    float _2264 = _2262 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2266 = _2250 * _2264;
    float _2268 = _2256 * _2264;
    float _2270 = _2266 * _2266;
    float _2272 = _2268 * _2268;
    float _2274 = _2270 + _2272;
    float _2276 = sqrt(_2274);
    bool _2278 = _2276 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2282 = _2276 + _2280;
    float _2284 = _2256;
    float _2286 = _2282;
    float _2288 = _2244;
    if (_2278)
    {
        float _2290 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2284 = _2290;
    }
    float _2292 = _2284;
    if (_2278)
    {
        float _2294 = rsqrt(_2274);
        _2154 = _2294;
    }
    float _2296 = _2154;
    float _2298 = _2296;
    if (_2278)
    {
        float _2300 = _2282 * _2292;
        _2286 = _2300;
    }
    float _2302 = _2286;
    if (_2278)
    {
        float _2304 = _2302 * 0.15915493667125701904296875;
        _2156 = _2304;
    }
    float _2306 = _2156;
    float _2308 = _2262;
    if (_2278)
    {
        float _2310 = _2306 * 6.283185482025146484375;
        float _2312 = sin(_2310);
        _2308 = _2312;
    }
    float _2314 = _2308;
    float _2316 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2318 = precise::max(0.0, _2316);
    float _2320 = _2252;
    float _2322 = _2318;
    float _2324 = _2316;
    if (_2278)
    {
        float _2326 = _2306 * 6.283185482025146484375;
        float _2328 = cos(_2326);
        _2320 = _2328;
    }
    float _2330 = _2320;
    float _2332 = -_2264;
    float _2334 = -_2318;
    float _2336 = fma(_2244, _2332, _2334);
    if (!_2278)
    {
        _2288 = _2268;
    }
    float _2338 = _2288;
    float _2340 = _2338;
    if (_2278)
    {
        float _2342 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2322 = _2342;
    }
    float _2344 = _2322;
    float _2346 = sqrt(_2260);
    float _2348 = _2344;
    float _2350 = _2314;
    if (_2278)
    {
        float _2352 = fma(_2314, _2344, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2348 = _2352;
    }
    float _2354 = _2348;
    float _2356 = _2354;
    if (!_2278)
    {
        _2350 = _2266;
    }
    float _2358 = _2350;
    float _2360 = _2358;
    float _2362 = _2330;
    if (_2278)
    {
        float _2364 = _2330 + (-1.0);
        _2324 = _2364;
    }
    float _2366 = _2324;
    float _2368 = _2366;
    if (_2278)
    {
        float _2370 = _2296 * _2354;
        _2158 = _2370;
    }
    float _2372 = _2158;
    if (!_2278)
    {
        _2356 = _2336;
    }
    float _2374 = _2356;
    float _2376 = _2374;
    if (_2278)
    {
        float _2378 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2298 = _2378;
    }
    float _2380 = _2298;
    if (_2278)
    {
        float _2382 = _2266 * _2372;
        _2360 = _2382;
    }
    float _2384 = _2360;
    if (!_2278)
    {
        _2368 = _2270;
    }
    float _2386 = _2368;
    float _2388 = _2386;
    if (_2278)
    {
        float _2390 = _2268 * _2372;
        _2340 = _2390;
    }
    float _2392 = _2340;
    if (_2278)
    {
        float _2394 = fma(_2336, _2330, _2380);
        _2376 = _2394;
    }
    float _2396 = _2376;
    if (_2278)
    {
        float _2398 = _2384 * _2384;
        _2388 = _2398;
    }
    float _2400 = _2388;
    if (!_2278)
    {
        _2362 = _2272;
    }
    float _2402 = _2362;
    float _2404 = _2402;
    if (_2278)
    {
        float _2406 = _2392 * _2392;
        _2404 = _2406;
    }
    float _2408 = _2404;
    float _2410 = fma(_2396, _2396, _2400);
    float _2412 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2414 = _2410 + _2408;
    float _2416 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2420 = fma(_2346, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2418);
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    float _2424 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2426 = rsqrt(_2414);
    float _2428 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2416);
    float _2430 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2432 = -_2422;
    float _2434 = _2432 + 1.0;
    float _2436 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2438 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2428);
    float _2440 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2430);
    float _2442 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2436);
    float _2444 = abs(_2434);
    float _2446 = log2(_2444);
    float _2448 = _2438 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2450 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2440);
    float _2452 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2412);
    float _2454 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2442);
    float _2456 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2458 = _2450 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2460 = _2426 * _2384;
    float _2462 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2452);
    float _2464 = -_2456;
    float _2466 = fma(_2464, _2424, 1.0);
    float _2468 = _2426 * _2396;
    float _2470 = _2460 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2472 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2474 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2476 = _2462 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2478 = _2426 * _2392;
    float _2480 = -_2470;
    float _2482 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2480);
    float _2484 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2474);
    float _2486 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2488 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2490 = -_2478;
    float _2492 = fma(_2490, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2482);
    float _2494 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2484);
    float _2496 = exp2(_2486);
    float _2498 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2500 = fma(_2492, -0.5, 0.5);
    float _2502 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2494);
    float _2504 = fma(_2492, 0.5, 0.5);
    float _2506 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2488);
    float _2508 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2498);
    float _2510 = _2468 + 1.0;
    float _2512 = log2(_2466);
    float _2514 = fma(_2504, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2516 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2506);
    float _2518 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2508);
    float _2520 = fma(_2504, _2514, -0.212114393711090087890625);
    float _2522 = 1.0 / _2502;
    float _2524 = -_2468;
    float _2526 = fma(_2496, _2510, _2524);
    float _2528 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2516);
    float _2530 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2518);
    float _2532 = fma(_2504, _2520, 1.570728778839111328125);
    float _2534 = sqrt(_2500);
    float _2536 = _2512 * 0.693147182464599609375;
    float _2538 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2540 = _2528 * _2522;
    float _2542 = _2530 * _2522;
    float _2544 = fma(_2540, 0.5, 0.5);
    float _2546 = fma(_2542, -0.5, 0.5);
    float _2548 = fma(_2526, 0.5, 0.5);
    float _2550 = _2534 * 0.636619746685028076171875;
    float _2552 = -_2532;
    float _2554 = fma(_2550, _2552, 1.0);
    float3 _6802 = float3(_2544, _2546, _2538);
    float _2556 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6802, float3(0.0), isnan(_6802)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6802, float3(0.0), isnan(_6802)), level(0.0)).x;
    float3 _6813 = float3(_2544, _2546, _2538);
    float4 _2559 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6813, float3(0.0), isnan(_6813)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6813, float3(0.0), isnan(_6813)), level(0.0)).xyzw;
    float _2561 = _2559.x;
    float _2563 = _2559.y;
    float _2565 = _2559.z;
    float _2567 = _2559.w;
    float2 _6830 = float2(_2554, _2548);
    float3 _2571 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6830, float2(0.0), isnan(_6830)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6830, float2(0.0), isnan(_6830)), level(0.0)).xyz;
    float _2573 = _2571.x;
    float _2575 = _2571.y;
    float _2577 = _2571.z;
    float _2579 = _892 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2581 = _892 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2583 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2585 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2579);
    float _2587 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2581);
    float _2589 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2585);
    float _2591 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2587);
    float _2593 = exp2(_2583);
    float _2595 = _2589 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2597 = _2591 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2599 = _2597 + _2595;
    bool _2601 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2603 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan(0.5);
    bool _2609 = _2605 || _2607;
    float _2611 = 1.0 / _2595;
    float _2613 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2615 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2613);
    float _2617 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2615);
    float _2619 = _2458;
    float _2621 = _2476;
    if (_2609)
    {
        _2619 = 1.0;
    }
    float _2623 = _2619;
    float _2625 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2617);
    float _2627 = _2623;
    if (_2609)
    {
        _2621 = 1.0;
    }
    float _2629 = _2621;
    float _2631 = _2599 * _2611;
    float _2633 = _2631 * 0.5;
    float _2635 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2637 = fma(_2633, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2635);
    float _2639 = 1.0 / _2637;
    float _2641 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2643 = _2639 * _2641;
    float _2645 = _2629;
    if (!_2609)
    {
        float _2647 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2649 = _2647 * 0.15915493667125701904296875;
        float _2651 = _2649 * 6.283185482025146484375;
        float _2653 = cos(_2651);
        float _2655 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2657 = _2655 * 0.15915493667125701904296875;
        float _2659 = _2649 * 6.283185482025146484375;
        float _2661 = sin(_2659);
        float _2663 = 1.0 / _2653;
        float _2665 = _2657 * 6.283185482025146484375;
        float _2667 = cos(_2665);
        float _2669 = _2661 * _2663;
        float _2671 = _2657 * 6.283185482025146484375;
        float _2673 = sin(_2671);
        float _2675 = _2667 * _2669;
        float _2677 = 1.0 / _2675;
        float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2681 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2679;
        float _2683 = 1.0 / _2681;
        float _2685 = _2673 * _2677;
        float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2689 = fma(_2643, _2685, _2687);
        float _2691 = _2689 * _2683;
        float _2693 = precise::clamp(_2691, 0.0, 1.0);
        _2645 = _2693;
    }
    float _2695 = _2645;
    if (!_2609)
    {
        float _2697 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2699 = _2697 * 0.15915493667125701904296875;
        float _2701 = _2699 * 6.283185482025146484375;
        float _2703 = cos(_2701);
        float _2705 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2707 = _2705 * 0.15915493667125701904296875;
        float _2709 = _2699 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        float _2713 = 1.0 / _2703;
        float _2715 = _2707 * 6.283185482025146484375;
        float _2717 = cos(_2715);
        float _2719 = _2711 * _2713;
        float _2721 = _2707 * 6.283185482025146484375;
        float _2723 = sin(_2721);
        float _2725 = _2717 * _2719;
        float _2727 = 1.0 / _2725;
        float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2731 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2729;
        float _2733 = 1.0 / _2731;
        float _2735 = _2723 * _2727;
        float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2739 = fma(_2643, _2735, _2737);
        float _2741 = _2739 * _2733;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = -_2743;
        float _2747 = _2745 + 1.0;
        _2627 = _2747;
    }
    float _2749 = _2627;
    float _2751 = _2695 * _2749;
    float _2753 = _2502 * 0.5;
    float _2755 = -_2593;
    float _2757 = _2755 + 1.0;
    bool _2759 = _2695 > 0.0;
    bool _2761 = isnan(_2695);
    bool _2763 = _2759 || _2761;
    bool _2765 = isnan(0.0);
    bool _2767 = _2763 || _2765;
    float _2769 = _2751 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2771 = fma(_2530, -0.5, _2753);
    float _2773 = _2625 + _2502;
    bool _2775 = _2749 <= 0.0;
    bool _2777 = !_2767;
    bool _2779 = _2775 || _2777;
    float _2781 = _2769 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2783 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2785 = _2528 + _2502;
    out.gl_Position.x = _2528;
    out.gl_Position.y = _2530;
    out.gl_Position.z = _2625;
    out.gl_Position.w = _2502;
    float _2787 = _2783 * _2556;
    float _2789 = -_2783;
    float _2791 = _2789 + 1.0;
    float _2793 = _2773 * 0.5;
    float _2795 = _2785 * 0.5;
    float _2797 = _2567 * _2787;
    float _2799 = _2577 * _2787;
    float _2801 = _2567 * _2791;
    out.m_47.x = _2781;
    float _2803 = fma(_2573, _2797, _2561);
    float _2805 = fma(_2575, _2797, _2563);
    float _2807 = fma(_2567, _2799, _2565);
    out.m_73.x = _2795;
    out.m_73.y = _2771;
    out.m_73.z = _2793;
    out.m_73.w = _2502;
    out.m_75.x = _2803;
    out.m_75.y = _2805;
    out.m_75.z = _2807;
    out.m_75.w = _2801;
    if (!_2779)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2809 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2809;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2194 = false;
    bool _744 = false;
    bool _564 = false;
    bool _386 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2866 = as_type<float>(_110);
        out.gl_Position.z = _2866;
    }
    if (!_98)
    {
        return out;
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2935 = as_type<float>(_148);
        out.gl_Position.z = _2935;
    }
    if (_142)
    {
        return out;
    }
    float _150 = in.m_51.x;
    float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _154 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _156 = in.m_53.y;
    float _158 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = _154 * _152;
    float _172 = 0.0;
    if (!_168)
    {
        float _174 = _158 * _158;
        float _176 = _174 * 0.5;
        _172 = _176;
    }
    float _178 = _172;
    float _180 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[20].x, _170);
    float _182 = _178;
    if (!_168)
    {
        float _184 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    float _188 = in.m_49.x;
    float _190 = in.m_49.y;
    float _192 = in.m_49.z;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = floor(_180);
    float _198 = _194 * 0.15915493667125701904296875;
    int _200 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _202 = _200 != 0;
    float _204 = _198 * 6.283185482025146484375;
    float _206 = cos(_204);
    float _208 = 1.4012984643248170709237295832899e-45;
    float _210 = _186;
    if (!_168)
    {
        _208 = _158;
    }
    float _212 = _208;
    float _214 = -_196;
    float _216 = _180 + _214;
    bool _218 = !_168;
    float _220 = _212;
    float _222 = _156;
    if (!_218)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _158 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _158);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _252;
    }
    float _254 = _210;
    bool _256 = !_168;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _158 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _220 = _276;
    }
    float _278 = _220;
    float _280 = in.m_55.w;
    float _282 = in.m_44.x;
    float _284 = in.m_44.y;
    float _286 = in.m_44.z;
    bool _288 = _216 < 0.5;
    float _290 = float(_288);
    float _292 = -_216;
    float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _298 = _296 != 0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _302 = _300 != 0;
    float _304 = fma(_206, 0.5, 0.5);
    float _306 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _308 = -_290;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    out.m_57.y = _156;
    bool _312 = !_298;
    int _314 = _312 ? 0 : 1;
    float _316 = -_304;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _320 = fma(_278, _188, _306);
    bool _322 = !_302;
    int _324 = _322 ? 0 : 1;
    float _326 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _328 = !_202;
    int _330 = _328 ? 0 : 1;
    float _332 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _334 = abs(_314);
    float _336 = fma(_278, _190, _326);
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _340 = fma(_278, _192, _332);
    int _342 = abs(_324);
    int _344 = abs(_330);
    float _346 = float(_334);
    float _348 = fma(_320, _280, _282);
    float _350 = float(_344);
    float _352 = fma(_336, _280, _284);
    float _354 = float(_342);
    float _356 = abs(_294);
    float _358 = _346 * _356;
    float _360 = fma(_340, _280, _286);
    float _362 = fma(_350, _318, _358);
    float _364 = abs(_310);
    float _366 = fma(_354, _364, _362);
    bool _368 = !_338;
    float _384;
    if (!_368)
    {
        float _370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _372 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _374 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _376 = _374 * _370;
        float _378 = floor(_376);
        float _380 = -_378;
        float _382 = _376 + _380;
        _384 = _382;
        _386 = true;
    }
    else
    {
        float _388 = float(_94);
        float _390 = 1.0 / _388;
        float _392 = _128 * _390;
        _384 = _392;
    }
    _386 = false;
    float _394 = _384;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _398 = _394 + _396;
    bool _400 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _402 = isnan(_394);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _414 = _394 + _412;
    bool _416 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _418 = isnan(_394);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _436 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _438 = isnan(_394);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = -_410;
    float _450 = _448 + 1.0;
    float _452 = 1.0 / _434;
    float _454 = _446 * _450;
    float _456 = -_446;
    float _458 = _456 + 1.0;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _460;
    bool _464 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _466 = 1.0 / _430;
    float _468 = _426 * _458;
    float _470 = -_426;
    float _472 = _470 + 1.0;
    float _474 = _414 * _452;
    float _476 = _398 * _466;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _482;
    float _486 = fma(_462, _476, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _488 = fma(_480, _476, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _490 = fma(_484, _476, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _492 = in.m_55.x;
    float _494 = in.m_55.y;
    float _496 = in.m_55.z;
    float _498 = _486 * _468;
    float _500 = _488 * _468;
    float _502 = _490 * _468;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _516 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].x, _498);
    float _518 = fma(_506, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _520 = fma(_510, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _522 = fma(_514, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _524 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].y, _500);
    float _526 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].z, _502);
    float _528 = fma(_518, _454, _516);
    float _530 = fma(_520, _454, _524);
    float _532 = fma(_522, _454, _526);
    float _534 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[145].x, _528);
    float _536 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[145].y, _530);
    float _538 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[145].z, _532);
    float _540 = _534 * _492;
    float _542 = _536 * _494;
    float _544 = _538 * _496;
    bool _546 = !_464;
    float _562;
    if (!_546)
    {
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _550 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        float _566 = float(_94);
        float _568 = 1.0 / _566;
        float _570 = _128 * _568;
        _562 = _570;
    }
    _564 = false;
    float _572 = _562;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _576 = _572 + _574;
    bool _578 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _580 = isnan(_572);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _592 = _572 + _590;
    bool _594 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _596 = isnan(_572);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _614 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _616 = isnan(_572);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = -_588;
    float _628 = _626 + 1.0;
    float _630 = 1.0 / _612;
    float _632 = _624 * _628;
    float _634 = -_624;
    float _636 = _634 + 1.0;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _638;
    bool _642 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _644 = 1.0 / _608;
    float _646 = _604 * _636;
    float _648 = -_604;
    float _650 = _648 + 1.0;
    float _652 = _592 * _630;
    float _654 = _576 * _644;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _660;
    float _664 = fma(_640, _654, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _666 = fma(_658, _654, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _668 = fma(_662, _654, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _670 = _664 * _646;
    float _672 = _666 * _646;
    float _674 = _668 * _646;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _688 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].x, _670);
    float _690 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].y, _672);
    float _692 = fma(_678, _652, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _694 = fma(_682, _652, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _696 = fma(_686, _652, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _698 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].z, _674);
    float _700 = fma(_692, _632, _688);
    float _702 = fma(_694, _632, _690);
    float _704 = fma(_696, _632, _698);
    float _706 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[109].x, _700);
    float _708 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[109].y, _702);
    float _710 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[109].z, _704);
    float _712 = _706 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _714 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _718 = _710 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _720 = _712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _722 = _714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = _718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _726 = !_642;
    float _742;
    if (!_726)
    {
        float _728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _730 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _734 = _732 * _728;
        float _736 = floor(_734);
        float _738 = -_736;
        float _740 = _734 + _738;
        _742 = _740;
        _744 = true;
    }
    else
    {
        float _746 = float(_94);
        float _748 = 1.0 / _746;
        float _750 = _128 * _748;
        _742 = _750;
    }
    _744 = false;
    float _752 = _742;
    float _754 = in.m_51.y;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _758 = _756 != 0;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _766 = _764 != 0;
    float _768 = _150 * 2.0;
    float _770 = in.m_51.z;
    float _772 = in.m_51.w;
    float _774 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _776 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = floor(_768);
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _784 = _782 != 0;
    float _786 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _788 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _790 = -_780;
    float _792 = fma(_774, 2.0, _790);
    float _794 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].x, _786);
    float _796 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _798 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].x, _788);
    float _800 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _794);
    float _802 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _796);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _806 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _798);
    float _808 = _754 * 2.0;
    float _810 = _150 + _754;
    float _812 = _754 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _814 = _778 > 0.0;
    float _816 = _770 * 2.0;
    float _818 = _810 + (-1.0);
    float _820 = floor(_808);
    float _822 = _754 + _770;
    float _824 = fma(_812, -2.0, _804);
    bool _826 = _778 >= 0.0;
    bool _828 = isnan(_778);
    bool _830 = _826 || _828;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    float _836 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _838 = _822 + (-1.0);
    float _840 = floor(_816);
    int _842 = _834 ? 0 : 1;
    float _844 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _846 = (*spvDescriptorSet0.vp_c7)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _848 = (*spvDescriptorSet0.vp_c7)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _850 = _150 + _770;
    float _852 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[0].x, _846);
    bool _854 = _820 > 0.0;
    float _856 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[1].x, _848);
    bool _858 = _820 >= 0.0;
    bool _860 = isnan(_820);
    bool _862 = _858 || _860;
    bool _864 = isnan(0.0);
    bool _866 = _862 || _864;
    float _868 = _850 + (-1.0);
    int _870 = ~_842;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _878 = _874;
    float _880 = _868;
    float _882 = _852;
    if (!_814)
    {
        int _884 = ~_842;
        int _886 = _884 + 1;
        _878 = _886;
    }
    int _888 = _878;
    float _890 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _892 = _802 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _894 = _866 ? 0 : 1;
    float _896 = _800 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _898 = _840 > 0.0;
    float _900 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c8)._m0[0].z, _852);
    bool _902 = _840 >= 0.0;
    bool _904 = isnan(_840);
    bool _906 = _902 || _904;
    bool _908 = isnan(0.0);
    bool _910 = _906 || _908;
    float _912 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _856);
    float _914 = (*spvDescriptorSet0.vp_c7)._m0[2].z;
    bool _916 = _910;
    if (_784)
    {
        _914 = _150;
    }
    float _918 = _914;
    float _920 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _922 = _892 + _920;
    float _924 = _918;
    if (!_784)
    {
        _880 = _754;
    }
    float _926 = _880;
    float _928 = _912 * _912;
    float _930 = _926;
    if (!_784)
    {
        _924 = _770;
    }
    float _932 = _924;
    float _934 = _806 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _936 = fma(_900, _900, _928);
    if (_784)
    {
        _930 = _150;
    }
    float _938 = _930;
    float _940 = _932 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _944 = _938 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_784)
    {
        _882 = _770;
    }
    float _948 = _882;
    float _950 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[83].z, _876);
    float _952 = _948;
    if (_784)
    {
        _952 = _754;
    }
    float _954 = _952;
    float _956 = -_942;
    float _958 = fma(_944, 2.0, _956);
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _964 = !_762;
    int _966 = _964 ? 0 : 1;
    float _968 = rsqrt(_936);
    float _970 = -_960;
    float _972 = fma(_940, 2.0, _970);
    float _974 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[83].w, _962);
    int _976 = abs(_966);
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _980 = _896 + _978;
    float _982 = in.m_59.x;
    float _984 = in.m_59.y;
    float _986 = in.m_59.z;
    int _988 = ~_894;
    int _990 = _988 + 1;
    int _992 = _990 + 1;
    float _994 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _824);
    int _996 = _992;
    if (!_854)
    {
        int _998 = ~_894;
        int _1000 = _998 + 1;
        _996 = _1000;
    }
    int _1002 = _996;
    float _1004 = -_128;
    float _1006 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[81].x, _958);
    bool _1008 = !_758;
    int _1010 = _1008 ? 0 : 1;
    float _1012 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _974);
    float _1014 = float(_976);
    float _1016 = _366 * _544;
    float _1018 = float(_888);
    float _1020 = _366 * _540;
    int _1022 = abs(_1010);
    float _1024 = _900 * _968;
    float _1026 = _1024;
    if (!_784)
    {
        _946 = _770;
    }
    float _1028 = _946;
    float _1030 = _1014 * _1018;
    float _1032 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1034 = log2(_1032);
    float _1036 = _1028;
    if (_784)
    {
        _1036 = _754;
    }
    float _1038 = _1036;
    float _1040 = _1030 * (-2.0);
    int _1042 = _910 ? 0 : 1;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1046 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1048 = ~_1042;
    int _1050 = _1048 + 1;
    int _1052 = _1050 + 1;
    float _1054 = fma(_1040, _984, _984);
    float _1056 = in.m_61.x;
    float _1058 = in.m_61.y;
    float _1060 = fma(_1046, -2.0, _1044);
    float _1062 = _1046;
    int _1064 = _1052;
    if (_784)
    {
        _1062 = _754;
    }
    float _1066 = _1062;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1070 = _1066;
    if (!_784)
    {
        _1070 = _150;
    }
    float _1072 = _1070;
    float _1074 = fma(_844, _1040, _844);
    if (!_898)
    {
        int _1076 = ~_1042;
        int _1078 = _1076 + 1;
        _1064 = _1078;
    }
    int _1080 = _1064;
    float _1082 = _1034 * _128;
    float _1084 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1086 = float(_1022);
    float _1088 = _912 * _968;
    float _1090 = float(_1080);
    float _1092 = exp2(_1082);
    float _1094 = fma(_1084, -2.0, _1068);
    bool _1096 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1098 = isnan(1.0);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1104 = _1100 || _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1108 = 1.0 + _1106;
    float _1110 = _1086 * _1090;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1114 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1094);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1118 = 1.0 / _1108;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1122 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1112);
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1126 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1116);
    float _1128 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1120);
    float _1130 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1124);
    float _1132 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1122);
    float _1134 = -_1092;
    float _1136 = _1134 + 1.0;
    float _1138 = _922 * _922;
    bool _1140 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1148 = _1144 || _1146;
    float _1150 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0599999986588954925537109375, _1058);
    float _1152 = -_128;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[76].x, _792);
    float _1156 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1130);
    float _1158 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1128);
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1162 = _934 + _1160;
    float _1164 = fma(_980, _980, _1138);
    float _1166 = _1148 ? _1136 : 0.0;
    float _1168 = _1150 * 5.0;
    float _1170 = -_128;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[86].x, _972);
    float _1174 = fma(_1162, _1162, _1164);
    float _1176 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1126);
    float _1178 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _950);
    float _1180 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1060);
    float _1182 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.07999999821186065673828125, _1056);
    bool _1184 = !_766;
    int _1186 = _1184 ? 0 : 1;
    float _1188 = _1088;
    if (_1104)
    {
        float _1190 = _1166 * _1118;
        _132 = _1190;
    }
    float _1192 = _132;
    float _1194 = _1168 * 0.15915493667125701904296875;
    float _1196 = _754 + (-0.5);
    float _1198 = _1182 * 4.0;
    int _1200 = abs(_1186);
    float _1202 = rsqrt(_1174);
    float _1204 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1054);
    float _1206 = abs(_1024);
    float _1208 = abs(_1088);
    float _1210 = precise::max(_1206, _1208);
    float _1212 = _770 + (-0.5);
    float _1214 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1216 = _1210 >= 16.0;
    float _1218 = _1110 * (-2.0);
    float _1220 = _150 + (-0.5);
    float _1222 = _1198 * 0.15915493667125701904296875;
    float _1224 = float(_1200);
    float _1226 = fma(_1218, _982, _982);
    float _1228 = float(_1002);
    float _1230 = fma(_1074, _1192, _1204);
    float _1232 = fma(_836, _1218, _836);
    float _1234 = in.m_63.x;
    float _1236 = _922 * _1202;
    float _1238 = _1224 * _1228;
    float _1240 = _980 * _1202;
    float _1242 = _1162 * _1202;
    float _1244 = _1236 * _1236;
    float _1246 = _1194 * 6.283185482025146484375;
    float _1248 = sin(_1246);
    float _1250 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1226);
    float _1252 = _1238 * (-2.0);
    int _1254 = as_type<int>(_1214);
    if (_1216)
    {
        float _1256 = _1024 * 0.0625;
        _1026 = _1256;
    }
    float _1258 = _1026;
    if (_1216)
    {
        float _1260 = _1088 * 0.0625;
        _1188 = _1260;
    }
    float _1262 = _1188;
    float _1264 = fma(_1232, _1192, _1250);
    float _1266 = fma(_1252, _986, _986);
    float _1268 = in.m_61.z;
    float _1270 = _1222 * 6.283185482025146484375;
    float _1272 = sin(_1270);
    float _1274 = fma(_1240, _1240, _1244);
    float _1276 = abs(_1258);
    bool _1278 = _1276 != 0.0;
    bool _1280 = isnan(_1276);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan(0.0);
    bool _1286 = _1282 || _1284;
    float _1288 = fma(_890, _1252, _890);
    float _1290 = fma(_1242, _1242, _1274);
    float _1292 = abs(_1262);
    bool _1294 = _1292 == 0.0;
    bool _1296 = !_1286;
    bool _1298 = _1294 && _1296;
    float _1300 = _1230 * 0.15915493667125701904296875;
    float _1302 = precise::max(_1234, -0.20000000298023223876953125);
    float _1304 = rsqrt(_1290);
    float _1306 = precise::max(_1234, -0.5);
    float _1308 = _1264 * 0.15915493667125701904296875;
    float _1310 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1266);
    float _1312 = precise::min(_1302, 1.0);
    float _1314 = _1272 * 0.180000007152557373046875;
    float _1316 = precise::min(_1306, 1.0);
    float _1318 = fma(_1288, _1192, _1310);
    float _1320 = _1248 * 0.23000000417232513427734375;
    float _1322 = fma(_1312, 0.833333313465118408203125, 0.16666667163372039794921875);
    float _1324 = abs(_1262);
    bool _1326 = _1324 == 0.0;
    float _1328 = _1318 * 0.15915493667125701904296875;
    float _1330 = fma(_1316, 0.666666686534881591796875, 0.3333333432674407958984375);
    float _1332 = fma(_1320, _1322, _1056);
    float _1334 = _1300 * 6.283185482025146484375;
    float _1336 = sin(_1334);
    float _1338 = _366 * _542;
    float _1340 = fma(_1314, _1330, _1058);
    float _1342 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1332);
    int _1346 = as_type<int>(_1330);
    if (_1298)
    {
        bool _1348 = as_type<int>(_1262) >= 0;
        _916 = _1348;
    }
    bool _1350 = _916;
    float _1352 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1268);
    float _1356 = _1300 * 6.283185482025146484375;
    float _1358 = cos(_1356);
    float _1360 = _1214 * _1344;
    int _1362 = _1350 ? (-1) : 0;
    if (_1298)
    {
        int _1364 = _1350 ? 0 : 1078530011;
        _1254 = _1364;
    }
    int _1366 = _1254;
    float _1368 = _1240 * _1304;
    float _1370 = _1236 * _1304;
    float _1372 = _1342 * _1354;
    float _1374 = _1242 * _1304;
    int _1376 = _1366;
    if (_1298)
    {
        int _1378 = int(0x80000000) & as_type<int>(_1258);
        int _1380 = _1366 | _1378;
        _1376 = _1380;
    }
    int _1382 = _1376;
    float _1384 = _1328 * 6.283185482025146484375;
    float _1386 = sin(_1384);
    float _1388 = _1328 * 6.283185482025146484375;
    float _1390 = cos(_1388);
    float _1392 = _1308 * 6.283185482025146484375;
    float _1394 = sin(_1392);
    float _1396 = _1308 * 6.283185482025146484375;
    float _1398 = cos(_1396);
    float _1400 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1340);
    float _1402 = _1352 * _1400;
    bool _1404 = !_1286;
    bool _1406 = _1404 && _1326;
    int _1408 = _1382;
    float _1410 = as_type<float>(_1382);
    if (!_1406)
    {
        float _1412 = abs(_1258);
        bool _1414 = _1412 != as_type<float>(0x7f800000u /* inf */);
        bool _1416 = isnan(_1412);
        bool _1418 = _1414 || _1416;
        bool _1420 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1422 = _1418 || _1420;
        float _1424 = abs(_1262);
        bool _1426 = _1424 == as_type<float>(0x7f800000u /* inf */);
        float _1428 = abs(_1262);
        bool _1430 = _1428 == as_type<float>(0x7f800000u /* inf */);
        bool _1432 = !_1422;
        bool _1434 = _1430 && _1432;
        if (_1434)
        {
            bool _1436 = as_type<int>(_1262) >= 0;
            _1362 = _1436 ? (-1) : 0;
        }
        int _1438 = _1362;
        if (_1434)
        {
            _1408 = 1075235812;
        }
        int _1440 = _1408;
        int _1442 = _1440;
        if (_1434)
        {
            int _1444 = ~_1438;
            int _1446 = (_1444 != 0) ? _1440 : 1061752795;
            _1442 = _1446;
        }
        int _1448 = _1442;
        float _1450 = as_type<float>(_1448);
        if (_1434)
        {
            int _1452 = int(0x80000000) & as_type<int>(_1258);
            int _1454 = _1448 | _1452;
            _1450 = as_type<float>(_1454);
        }
        float _1456 = _1450;
        bool _1458 = !_1422;
        bool _1460 = _1458 && _1426;
        _1410 = _1456;
        if (!_1460)
        {
            float _1462 = abs(_1258);
            float _1464 = abs(_1262);
            float _1466 = precise::max(_1462, _1464);
            float _1468 = abs(_1258);
            float _1470 = abs(_1262);
            float _1472 = precise::min(_1468, _1470);
            float _1474 = 1.0 / _1466;
            float _1476 = abs(_1258);
            float _1478 = abs(_1262);
            bool _1480 = _1476 > _1478;
            bool _1482 = as_type<int>(_1262) >= 0;
            float _1484 = _1472 * _1474;
            float _1486 = _1484 * _1484;
            float _1488 = _1486 + 11.33538818359375;
            float _1490 = fma(_1486, _1488, 28.84246826171875);
            float _1492 = fma(_1486, _1490, 19.6966705322265625);
            float _1494 = fma(_1486, -0.82336294651031494140625, -5.674867153167724609375);
            float _1496 = fma(_1486, _1494, -6.565555095672607421875);
            float _1498 = 1.0 / _1492;
            float _1500 = _1486 * _1496;
            float _1502 = abs(_1258);
            float _1504 = abs(_1262);
            float _1506 = _1502 + _1504;
            int _1508 = as_type<int>(_1258) & int(0x80000000);
            float _1510 = _1484 * _1500;
            bool _1512 = _1506 > as_type<float>(0x7f800000u /* inf */);
            bool _1514 = isnan(_1506);
            bool _1516 = _1512 || _1514;
            bool _1518 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1520 = _1516 || _1518;
            float _1522 = fma(_1510, _1498, _1484);
            float _1524 = _1522;
            _1410 = _1506;
            if (_1480)
            {
                float _1526 = -_1522;
                float _1528 = _1526 + 1.57079637050628662109375;
                _1524 = _1528;
            }
            float _1530 = _1524;
            int _1532 = as_type<int>(_1530);
            if (!_1482)
            {
                float _1534 = -_1530;
                float _1536 = _1534 + 3.1415927410125732421875;
                _1532 = as_type<int>(_1536);
            }
            int _1538 = _1532;
            if (!_1520)
            {
                int _1540 = _1508 | _1538;
                _1410 = as_type<float>(_1540);
            }
        }
    }
    float _1542 = _1410;
    float _1544 = _1398 * _1336;
    float _1546 = _1394 * _1336;
    float _1548 = _1336 * _1390;
    float _1550 = _1358 * _1390;
    float _1552 = _1390 * _1402;
    float _1554 = _1398 * _1358;
    float _1556 = _1542 * 0.15915493667125701904296875;
    float _1558 = _1394 * _1358;
    float _1560 = _1398 * _1552;
    float _1562 = fma(_1386, _1554, _1546);
    float _1564 = _1556 * 6.283185482025146484375;
    float _1566 = cos(_1564);
    float _1568 = -_1544;
    float _1570 = fma(_1386, _1558, _1568);
    float _1572 = -_1402;
    float _1574 = _1386 * _1572;
    float _1576 = -_1558;
    float _1578 = fma(_1386, _1544, _1576);
    float _1580 = fma(_1562, _1360, _1560);
    float _1582 = _1394 * _1552;
    float _1584 = fma(_1550, _1360, _1574);
    float _1586 = fma(_1386, _1546, _1554);
    float _1588 = _1556 * 6.283185482025146484375;
    float _1590 = sin(_1588);
    float _1592 = fma(_1578, _1372, _1580);
    float _1594 = fma(_1570, _1360, _1582);
    float _1596 = fma(_1548, _1372, _1584);
    bool _1598 = _754 > 0.5;
    float _1600 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1602 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1604 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1606 = fma(_1586, _1372, _1594);
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1600);
    float _1610 = -_1566;
    float _1612 = _1610 + 1.0;
    float _1614 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1602);
    float _1616 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1604);
    float _1618 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1608);
    float _1620 = _1368 * _1612;
    float _1622 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1614);
    float _1624 = _1374 * _1590;
    float _1626 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1616);
    float _1628 = _1370 * _1612;
    float _1630 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1632 = fma(_1370, _1620, _1624);
    float _1634 = _1370 * _1590;
    float _1636 = -_1624;
    float _1638 = fma(_1370, _1620, _1636);
    float _1640 = fma(_1370, _1628, _1566);
    float _1642 = _1368 * _1590;
    float _1644 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1646 = fma(_1368, _1620, _1566);
    float _1648 = _1630 * _1640;
    float _1650 = fma(_1374, _1628, _1642);
    float _1652 = -_1642;
    float _1654 = fma(_1374, _1628, _1652);
    float _1656 = _1630 * _1638;
    float _1658 = fma(_1644, _1632, _1648);
    float _1660 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1662 = -_1634;
    float _1664 = fma(_1374, _1620, _1662);
    float _1666 = fma(_1374, _1620, _1634);
    float _1668 = _1374 * _1374;
    float _1670 = _1630 * _1650;
    float _1672 = fma(_1644, _1646, _1656);
    float _1674 = fma(_1660, _1654, _1658);
    float _1676 = fma(_1612, _1668, _1566);
    float _1678 = fma(_1644, _1664, _1670);
    float _1680 = fma(_1660, _1666, _1672);
    float _1682 = _1674 * _1674;
    float _1684 = fma(_1660, _1676, _1678);
    float _1686 = fma(_1680, _1680, _1682);
    int _1688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1690 = _1688 != 0;
    float _1692 = fma(_1684, _1684, _1686);
    float _1694 = -_156;
    float _1696 = _1694 + 1.0;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1700 = _1698 != 0;
    float _1702 = in.m_53.x;
    float _1704 = rsqrt(_1692);
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1708 = _1706 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1710 = _1598 ? as_type<int>(_1696) : as_type<int>(_156);
    float _1712 = _1556;
    float _1714 = _1674;
    if (_1690)
    {
        float _1716 = in.m_51.z;
        _1712 = _1716;
    }
    float _1718 = _1712;
    float _1720 = _1700 ? as_type<float>(_1710) : _156;
    float _1722 = 1.0 / _1708;
    float _1724 = precise::max(-0.10999999940395355224609375, (*spvDescriptorSet0.vp_c7)._m0[2].y);
    bool _1726 = _770 > 0.5;
    int _1728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1730 = _1728 != 0;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1734 = _1732 != 0;
    float _1736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1740 = _1738 != 0;
    int _1742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1744 = _1742 != 0;
    float _1746 = _1674 * _1704;
    float _1748 = precise::min(_1724, 0.10999999940395355224609375);
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1752 = _1750 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1754 = precise::max((*spvDescriptorSet0.vp_c7)._m0[2].x, -0.10999999940395355224609375);
    float _1756 = (*spvDescriptorSet0.vp_c7)._m0[2].x * 40.0;
    int _1758 = _1726 ? as_type<int>(_1696) : as_type<int>(_156);
    float _1760 = _1748 * _1746;
    bool _1762 = _772 > 0.5;
    float _1764 = _1680 * _1704;
    float _1766 = precise::min(_1754, 0.10999999940395355224609375);
    float _1768 = _1684 * _1704;
    float _1770 = precise::max(-0.10999999940395355224609375, (*spvDescriptorSet0.vp_c7)._m0[2].z);
    float _1772 = 1.0 / _1752;
    float _1774 = fma(_1766, _1764, _1760);
    float _1776 = precise::min(_1770, 0.10999999940395355224609375);
    bool _1778 = _1744;
    bool _1780 = _1740;
    int _1782 = as_type<int>(_1736);
    if (_1734)
    {
        float _1784 = -_1702;
        float _1786 = _1784 + 1.0;
        _1346 = as_type<int>(_1786);
    }
    int _1788 = _1346;
    float _1790 = _1740 ? as_type<float>(_1758) : _156;
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1792;
    if (_1744)
    {
        float _1796 = _1762 ? _1696 : _156;
        _222 = _1796;
    }
    float _1798 = _222;
    float _1800 = fma(_1776, _1768, _1774);
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1804 = _752 + _1802;
    float _1806 = _1794 * _1722;
    float _1808 = _1798;
    if (_1690)
    {
        bool _1810 = _1718 > 0.5;
        _1778 = _1810;
    }
    bool _1812 = _1778;
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1816 = _1814 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    if (_1730)
    {
        bool _1818 = _150 > 0.5;
        _1780 = _1818;
    }
    bool _1820 = _1780;
    float _1822 = fma(_1806, _1804, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1824 = precise::max(_1800, -1.0);
    float _1826 = _1816 * _1772;
    float _1828 = _896 + _1680;
    float _1830 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1832 = precise::min(0.0, _1824);
    float _1834 = _934 + _1684;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1838 = _752 + _1836;
    bool _1840 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1842 = isnan(_752);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1848 = _1844 || _1846;
    float _1850 = float(_1848);
    float _1852 = _1832 * 40.0;
    float _1854 = fma(_1756, _1832, _1828);
    float _1856 = fma(_1826, _1838, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1858 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1860 = isnan(_752);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    float _1870 = fma(_1852, (*spvDescriptorSet0.vp_c7)._m0[2].z, _1834);
    float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1874 = _1854 + _1872;
    float _1876 = -_1850;
    float _1878 = _1876 + 1.0;
    float _1880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1884 = _1870 + _1882;
    float _1886 = _1874 * _1874;
    float _1888 = _1868 * _1878;
    float _1890 = -_1868;
    float _1892 = _1890 + 1.0;
    float _1894 = _1884 * _1884;
    float _1896 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1898 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1900 = isnan(_752);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1906 = _1902 || _1904;
    float _1908 = float(_1906);
    float _1910 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1912 = _1886 + _1894;
    float _1914 = fma(_1896, _1720, -0.5);
    float _1916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1918 = fma(_1790, _1910, -0.5);
    float _1920 = _1908 * _1892;
    float _1922 = -_994;
    float _1924 = fma(_1132, _1914, _1922);
    float _1926 = -_1908;
    float _1928 = _1926 + 1.0;
    float _1930 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1932 = _1822 * _1920;
    int _1934 = as_type<int>(_1920);
    float _1936 = _1878;
    float _1938 = _1914;
    float _1940 = _1852;
    float _1942 = _1886;
    float _1944 = _1894;
    if (_1730)
    {
        float _1946 = -_1702;
        float _1948 = _1946 + 1.0;
        _1934 = as_type<int>(_1948);
    }
    int _1950 = _1934;
    float _1952 = sqrt(_1912);
    float _1954 = fma(_1930, _1798, -0.5);
    if (!_1734)
    {
        _1808 = _1702;
    }
    float _1956 = _1808;
    float _1958 = _1956;
    if (_1690)
    {
        float _1960 = -_1702;
        float _1962 = _1960 + 1.0;
        _1782 = as_type<int>(_1962);
    }
    int _1964 = _1782;
    if (_1734)
    {
        float _1966 = _1598 ? as_type<float>(_1788) : _1702;
        _1958 = _1966;
    }
    float _1968 = _1958;
    float _1970 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1932);
    if (!_1730)
    {
        _1936 = _1702;
    }
    float _1972 = _1936;
    float _1974 = -_1180;
    float _1976 = fma(_1012, _1954, _1974);
    float _1978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1980 = _1972;
    if (!_1690)
    {
        _1938 = _1702;
    }
    float _1982 = _1938;
    float _1984 = fma(_1856, _1888, _1970);
    float _1986 = _1982;
    if (_1730)
    {
        float _1988 = _1820 ? as_type<float>(_1950) : _1702;
        _1980 = _1988;
    }
    float _1990 = _1980;
    float _1992 = _892 + _1674;
    if (_1690)
    {
        float _1994 = _1812 ? as_type<float>(_1964) : _1702;
        _1986 = _1994;
    }
    float _1996 = _1986;
    float _1998 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2000 = fma(_1850, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1984);
    float _2002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2004 = _1952 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2006 = fma(_1852, (*spvDescriptorSet0.vp_c7)._m0[2].y, _1992);
    float _2008 = fma(_1998, _1990, -0.5);
    float _2010 = fma(_1176, _2008, _1154);
    float _2012 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2014 = fma(_2012, _1968, -0.5);
    float _2016 = _2014;
    if (!_2004)
    {
        _1714 = _1886;
    }
    float _2018 = _1714;
    float _2020 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2022 = fma(_1158, _2014, _1172);
    float _2024 = _2018;
    if (!_2004)
    {
        _2016 = _1854;
    }
    float _2026 = _2016;
    float _2028 = fma(_2020, _1996, -0.5);
    float _2030 = _2026;
    if (!_2004)
    {
        _1940 = _1870;
    }
    float _2032 = _1940;
    float _2034 = _2032;
    if (!_2004)
    {
        _1942 = _2006;
    }
    float _2036 = _1942;
    float _2038 = fma(_1178, _2028, _1006);
    bool _2040 = !_2004;
    float _2042 = _2036;
    if (!_2040)
    {
        float _2044 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2048 = _1952 + _2046;
        float _2050 = _2006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2052 = rsqrt(_1912);
        float _2054 = _2048 * _2044;
        float _2056 = _2054 * 0.15915493667125701904296875;
        float _2058 = _2056 * 6.283185482025146484375;
        float _2060 = sin(_2058);
        float _2062 = _2056 * 6.283185482025146484375;
        float _2064 = cos(_2062);
        float _2066 = fma(_2060, _2050, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2068 = _2052 * _2066;
        float _2070 = _2064 + (-1.0);
        float _2072 = fma(_1874, _2068, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2074 = fma(_1884, _2068, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2076 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2080 = _2072 + _2078;
        float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2084 = _2074 + _2082;
        float _2086 = fma(_2006, _2064, _2076);
        float _2088 = _2080 * _2080;
        float _2090 = _2084 * _2084;
        _2042 = _2086;
        _2024 = _2088;
        _1944 = _2090;
        _2030 = _2072;
        _2034 = _2074;
    }
    float _2092 = _2042;
    float _2094 = _2024;
    float _2096 = _1944;
    float _2098 = _2030;
    float _2100 = _2034;
    float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2104 = _2092 + _2102;
    float _2106 = -_1114;
    float _2108 = fma(_1156, _1918, _2106);
    float _2110 = fma(_2104, _2104, _2094);
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2114 = _2038 + 0.5;
    float _2116 = _2110 + _2096;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2122 = _2000 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2124 = sqrt(_2116);
    float _2126 = _2112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2128 = _2118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2130 = _2120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2132 = _1924 + 0.5;
    float _2134 = _2022 + 0.5;
    float _2136 = _2010 + 0.5;
    float _2138 = _1976 + 0.5;
    float _2140 = _2108 + 0.5;
    out.m_65.x = _720;
    out.m_65.y = _722;
    out.m_65.z = _724;
    out.m_65.w = _716;
    out.m_67.x = _2126;
    out.m_67.y = _2128;
    out.m_67.z = _2130;
    out.m_67.w = _2122;
    bool _2142 = _2124 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2144 = isnan(_2124);
    bool _2146 = _2142 || _2144;
    bool _2148 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2150 = _2146 || _2148;
    out.m_69.x = _2136;
    out.m_69.y = _2132;
    out.m_69.z = _2114;
    out.m_69.w = _2138;
    out.m_71.x = _2134;
    out.m_71.y = _2140;
    float _2152 = _2116;
    float _2154 = _2136;
    float _2156 = _2132;
    float _2158 = _2134;
    if (!_2150)
    {
        _2152 = 1.0;
    }
    float _2160 = _2152;
    bool _2162 = !_2150;
    float _2164 = _2160;
    if (!_2162)
    {
        bool _2166 = _2124 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2168 = isnan(_2124);
        bool _2170 = _2166 || _2168;
        bool _2172 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2174 = _2170 || _2172;
        if (!_2174)
        {
            float _2176 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2178 = _2124 + _2176;
            float _2180 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2182 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2180;
            float _2184 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2186 = _2184 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2188 = 1.0 / _2182;
            float _2190 = _2178 * _2188;
            float _2192 = fma(_2190, _2186, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2164 = _2192;
            _2194 = true;
        }
        else
        {
            bool _2196 = _2124 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2198 = isnan(_2124);
            bool _2200 = _2196 || _2198;
            bool _2202 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2204 = _2200 || _2202;
            if (!_2204)
            {
                float _2206 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2208 = _2124 + _2206;
                float _2210 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2212 = _2210 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2214 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2216 = _2214 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2218 = 1.0 / _2212;
                float _2220 = _2208 * _2218;
                float _2222 = fma(_2220, _2216, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2164 = _2222;
                _2194 = true;
            }
            else
            {
                _2164 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2194 = false;
    float _2224 = _2164;
    float _2226 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2228 = _2092 + _2226;
    float _2230 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2232 = _2098 + _2230;
    float _2234 = fma(_2228, _2224, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2236 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2238 = _2100 + _2236;
    float _2240 = fma(_2232, _2224, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2244 = _2234 + _2242;
    float _2246 = fma(_2238, _2224, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2248 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2250 = _2240 + _2248;
    float _2252 = _2244 * _2244;
    float _2254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2256 = _2246 + _2254;
    float _2258 = fma(_2250, _2250, _2252);
    float _2260 = fma(_2256, _2256, _2258);
    float _2262 = rsqrt(_2260);
    float _2264 = _2262 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2266 = _2250 * _2264;
    float _2268 = _2256 * _2264;
    float _2270 = _2266 * _2266;
    float _2272 = _2268 * _2268;
    float _2274 = _2270 + _2272;
    float _2276 = sqrt(_2274);
    bool _2278 = _2276 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2282 = _2276 + _2280;
    float _2284 = _2256;
    float _2286 = _2282;
    float _2288 = _2244;
    if (_2278)
    {
        float _2290 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2284 = _2290;
    }
    float _2292 = _2284;
    if (_2278)
    {
        float _2294 = rsqrt(_2274);
        _2154 = _2294;
    }
    float _2296 = _2154;
    float _2298 = _2296;
    if (_2278)
    {
        float _2300 = _2282 * _2292;
        _2286 = _2300;
    }
    float _2302 = _2286;
    if (_2278)
    {
        float _2304 = _2302 * 0.15915493667125701904296875;
        _2156 = _2304;
    }
    float _2306 = _2156;
    float _2308 = _2262;
    if (_2278)
    {
        float _2310 = _2306 * 6.283185482025146484375;
        float _2312 = sin(_2310);
        _2308 = _2312;
    }
    float _2314 = _2308;
    float _2316 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2318 = precise::max(0.0, _2316);
    float _2320 = _2252;
    float _2322 = _2318;
    float _2324 = _2316;
    if (_2278)
    {
        float _2326 = _2306 * 6.283185482025146484375;
        float _2328 = cos(_2326);
        _2320 = _2328;
    }
    float _2330 = _2320;
    float _2332 = -_2264;
    float _2334 = -_2318;
    float _2336 = fma(_2244, _2332, _2334);
    if (!_2278)
    {
        _2288 = _2268;
    }
    float _2338 = _2288;
    float _2340 = _2338;
    if (_2278)
    {
        float _2342 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2322 = _2342;
    }
    float _2344 = _2322;
    float _2346 = sqrt(_2260);
    float _2348 = _2344;
    float _2350 = _2314;
    if (_2278)
    {
        float _2352 = fma(_2314, _2344, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2348 = _2352;
    }
    float _2354 = _2348;
    float _2356 = _2354;
    if (!_2278)
    {
        _2350 = _2266;
    }
    float _2358 = _2350;
    float _2360 = _2358;
    float _2362 = _2330;
    if (_2278)
    {
        float _2364 = _2330 + (-1.0);
        _2324 = _2364;
    }
    float _2366 = _2324;
    float _2368 = _2366;
    if (_2278)
    {
        float _2370 = _2296 * _2354;
        _2158 = _2370;
    }
    float _2372 = _2158;
    if (!_2278)
    {
        _2356 = _2336;
    }
    float _2374 = _2356;
    float _2376 = _2374;
    if (_2278)
    {
        float _2378 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2298 = _2378;
    }
    float _2380 = _2298;
    if (_2278)
    {
        float _2382 = _2266 * _2372;
        _2360 = _2382;
    }
    float _2384 = _2360;
    if (!_2278)
    {
        _2368 = _2270;
    }
    float _2386 = _2368;
    float _2388 = _2386;
    if (_2278)
    {
        float _2390 = _2268 * _2372;
        _2340 = _2390;
    }
    float _2392 = _2340;
    if (_2278)
    {
        float _2394 = fma(_2336, _2330, _2380);
        _2376 = _2394;
    }
    float _2396 = _2376;
    if (_2278)
    {
        float _2398 = _2384 * _2384;
        _2388 = _2398;
    }
    float _2400 = _2388;
    if (!_2278)
    {
        _2362 = _2272;
    }
    float _2402 = _2362;
    float _2404 = _2402;
    if (_2278)
    {
        float _2406 = _2392 * _2392;
        _2404 = _2406;
    }
    float _2408 = _2404;
    float _2410 = fma(_2396, _2396, _2400);
    float _2412 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2414 = _2410 + _2408;
    float _2416 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2420 = fma(_2346, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2418);
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    float _2424 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2426 = rsqrt(_2414);
    float _2428 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2416);
    float _2430 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2432 = -_2422;
    float _2434 = _2432 + 1.0;
    float _2436 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2438 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2428);
    float _2440 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2430);
    float _2442 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2436);
    float _2444 = abs(_2434);
    float _2446 = log2(_2444);
    float _2448 = _2438 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2450 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2440);
    float _2452 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2412);
    float _2454 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2442);
    float _2456 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2458 = _2450 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2460 = _2426 * _2384;
    float _2462 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2452);
    float _2464 = -_2456;
    float _2466 = fma(_2464, _2424, 1.0);
    float _2468 = _2426 * _2396;
    float _2470 = _2460 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2472 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2474 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2476 = _2462 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2478 = _2426 * _2392;
    float _2480 = -_2470;
    float _2482 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2480);
    float _2484 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2474);
    float _2486 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2488 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2490 = -_2478;
    float _2492 = fma(_2490, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2482);
    float _2494 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2484);
    float _2496 = exp2(_2486);
    float _2498 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2500 = fma(_2492, -0.5, 0.5);
    float _2502 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2494);
    float _2504 = fma(_2492, 0.5, 0.5);
    float _2506 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2488);
    float _2508 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2498);
    float _2510 = _2468 + 1.0;
    float _2512 = log2(_2466);
    float _2514 = fma(_2504, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2516 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2506);
    float _2518 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2508);
    float _2520 = fma(_2504, _2514, -0.212114393711090087890625);
    float _2522 = 1.0 / _2502;
    float _2524 = -_2468;
    float _2526 = fma(_2496, _2510, _2524);
    float _2528 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2516);
    float _2530 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2518);
    float _2532 = fma(_2504, _2520, 1.570728778839111328125);
    float _2534 = sqrt(_2500);
    float _2536 = _2512 * 0.693147182464599609375;
    float _2538 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2540 = _2528 * _2522;
    float _2542 = _2530 * _2522;
    float _2544 = fma(_2540, 0.5, 0.5);
    float _2546 = fma(_2542, -0.5, 0.5);
    float _2548 = fma(_2526, 0.5, 0.5);
    float _2550 = _2534 * 0.636619746685028076171875;
    float _2552 = -_2532;
    float _2554 = fma(_2550, _2552, 1.0);
    float3 _6802 = float3(_2544, _2546, _2538);
    float _2556 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6802, float3(0.0), isnan(_6802)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6802, float3(0.0), isnan(_6802)), level(0.0)).x;
    float3 _6813 = float3(_2544, _2546, _2538);
    float4 _2559 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6813, float3(0.0), isnan(_6813)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6813, float3(0.0), isnan(_6813)), level(0.0)).xyzw;
    float _2561 = _2559.x;
    float _2563 = _2559.y;
    float _2565 = _2559.z;
    float _2567 = _2559.w;
    float2 _6830 = float2(_2554, _2548);
    float3 _2571 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6830, float2(0.0), isnan(_6830)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6830, float2(0.0), isnan(_6830)), level(0.0)).xyz;
    float _2573 = _2571.x;
    float _2575 = _2571.y;
    float _2577 = _2571.z;
    float _2579 = _892 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2581 = _892 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2583 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2585 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2579);
    float _2587 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2581);
    float _2589 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2585);
    float _2591 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2587);
    float _2593 = exp2(_2583);
    float _2595 = _2589 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2597 = _2591 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2599 = _2597 + _2595;
    bool _2601 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2603 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan(0.5);
    bool _2609 = _2605 || _2607;
    float _2611 = 1.0 / _2595;
    float _2613 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2615 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2613);
    float _2617 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2615);
    float _2619 = _2458;
    float _2621 = _2476;
    if (_2609)
    {
        _2619 = 1.0;
    }
    float _2623 = _2619;
    float _2625 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2617);
    float _2627 = _2623;
    if (_2609)
    {
        _2621 = 1.0;
    }
    float _2629 = _2621;
    float _2631 = _2599 * _2611;
    float _2633 = _2631 * 0.5;
    float _2635 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2637 = fma(_2633, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2635);
    float _2639 = 1.0 / _2637;
    float _2641 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2643 = _2639 * _2641;
    float _2645 = _2629;
    if (!_2609)
    {
        float _2647 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2649 = _2647 * 0.15915493667125701904296875;
        float _2651 = _2649 * 6.283185482025146484375;
        float _2653 = cos(_2651);
        float _2655 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2657 = _2655 * 0.15915493667125701904296875;
        float _2659 = _2649 * 6.283185482025146484375;
        float _2661 = sin(_2659);
        float _2663 = 1.0 / _2653;
        float _2665 = _2657 * 6.283185482025146484375;
        float _2667 = cos(_2665);
        float _2669 = _2661 * _2663;
        float _2671 = _2657 * 6.283185482025146484375;
        float _2673 = sin(_2671);
        float _2675 = _2667 * _2669;
        float _2677 = 1.0 / _2675;
        float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2681 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2679;
        float _2683 = 1.0 / _2681;
        float _2685 = _2673 * _2677;
        float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2689 = fma(_2643, _2685, _2687);
        float _2691 = _2689 * _2683;
        float _2693 = precise::clamp(_2691, 0.0, 1.0);
        _2645 = _2693;
    }
    float _2695 = _2645;
    if (!_2609)
    {
        float _2697 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2699 = _2697 * 0.15915493667125701904296875;
        float _2701 = _2699 * 6.283185482025146484375;
        float _2703 = cos(_2701);
        float _2705 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2707 = _2705 * 0.15915493667125701904296875;
        float _2709 = _2699 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        float _2713 = 1.0 / _2703;
        float _2715 = _2707 * 6.283185482025146484375;
        float _2717 = cos(_2715);
        float _2719 = _2711 * _2713;
        float _2721 = _2707 * 6.283185482025146484375;
        float _2723 = sin(_2721);
        float _2725 = _2717 * _2719;
        float _2727 = 1.0 / _2725;
        float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2731 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2729;
        float _2733 = 1.0 / _2731;
        float _2735 = _2723 * _2727;
        float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2739 = fma(_2643, _2735, _2737);
        float _2741 = _2739 * _2733;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = -_2743;
        float _2747 = _2745 + 1.0;
        _2627 = _2747;
    }
    float _2749 = _2627;
    float _2751 = _2695 * _2749;
    float _2753 = _2502 * 0.5;
    float _2755 = -_2593;
    float _2757 = _2755 + 1.0;
    bool _2759 = _2695 > 0.0;
    bool _2761 = isnan(_2695);
    bool _2763 = _2759 || _2761;
    bool _2765 = isnan(0.0);
    bool _2767 = _2763 || _2765;
    float _2769 = _2751 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2771 = fma(_2530, -0.5, _2753);
    float _2773 = _2625 + _2502;
    bool _2775 = _2749 <= 0.0;
    bool _2777 = !_2767;
    bool _2779 = _2775 || _2777;
    float _2781 = _2769 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2783 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2785 = _2528 + _2502;
    out.gl_Position.x = _2528;
    out.gl_Position.y = _2530;
    out.gl_Position.z = _2625;
    out.gl_Position.w = _2502;
    float _2787 = _2783 * _2556;
    float _2789 = -_2783;
    float _2791 = _2789 + 1.0;
    float _2793 = _2773 * 0.5;
    float _2795 = _2785 * 0.5;
    float _2797 = _2567 * _2787;
    float _2799 = _2577 * _2787;
    float _2801 = _2567 * _2791;
    out.m_47.x = _2781;
    float _2803 = fma(_2573, _2797, _2561);
    float _2805 = fma(_2575, _2797, _2563);
    float _2807 = fma(_2567, _2799, _2565);
    out.m_73.x = _2795;
    out.m_73.y = _2771;
    out.m_73.z = _2793;
    out.m_73.w = _2502;
    out.m_75.x = _2803;
    out.m_75.y = _2805;
    out.m_75.z = _2807;
    out.m_75.w = _2801;
    if (!_2779)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2809 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2809;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2194 = false;
    bool _744 = false;
    bool _564 = false;
    bool _386 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2866 = as_type<float>(_110);
        out.gl_Position.z = _2866;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    float _132 = _128;
    if (_124)
    {
        float _134 = float(_94);
        _130 = _134;
    }
    float _136 = _130;
    bool _138 = _128 >= _136;
    bool _140 = !_124;
    bool _142 = _138 || _140;
    if (_142)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _104;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2935 = as_type<float>(_148);
        out.gl_Position.z = _2935;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_51.x;
    float _152 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _154 = _128 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _156 = in.m_53.y;
    float _158 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = _154 * _152;
    float _172 = 0.0;
    if (!_168)
    {
        float _174 = _158 * _158;
        float _176 = _174 * 0.5;
        _172 = _176;
    }
    float _178 = _172;
    float _180 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[20].x, _170);
    float _182 = _178;
    if (!_168)
    {
        float _184 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    float _188 = in.m_49.x;
    float _190 = in.m_49.y;
    float _192 = in.m_49.z;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = floor(_180);
    float _198 = _194 * 0.15915493667125701904296875;
    int _200 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _202 = _200 != 0;
    float _204 = _198 * 6.283185482025146484375;
    float _206 = cos(_204);
    float _208 = 1.4012984643248170709237295832899e-45;
    float _210 = _186;
    if (!_168)
    {
        _208 = _158;
    }
    float _212 = _208;
    float _214 = -_196;
    float _216 = _180 + _214;
    bool _218 = !_168;
    float _220 = _212;
    float _222 = _156;
    if (!_218)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _158 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _158);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _252;
    }
    float _254 = _210;
    bool _256 = !_168;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _158 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _220 = _276;
    }
    float _278 = _220;
    float _280 = in.m_55.w;
    float _282 = in.m_44.x;
    float _284 = in.m_44.y;
    float _286 = in.m_44.z;
    bool _288 = _216 < 0.5;
    float _290 = float(_288);
    float _292 = -_216;
    float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _298 = _296 != 0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _302 = _300 != 0;
    float _304 = fma(_206, 0.5, 0.5);
    float _306 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _308 = -_290;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    out.m_57.y = _156;
    bool _312 = !_298;
    int _314 = _312 ? 0 : 1;
    float _316 = -_304;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _320 = fma(_278, _188, _306);
    bool _322 = !_302;
    int _324 = _322 ? 0 : 1;
    float _326 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _328 = !_202;
    int _330 = _328 ? 0 : 1;
    float _332 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _334 = abs(_314);
    float _336 = fma(_278, _190, _326);
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _340 = fma(_278, _192, _332);
    int _342 = abs(_324);
    int _344 = abs(_330);
    float _346 = float(_334);
    float _348 = fma(_320, _280, _282);
    float _350 = float(_344);
    float _352 = fma(_336, _280, _284);
    float _354 = float(_342);
    float _356 = abs(_294);
    float _358 = _346 * _356;
    float _360 = fma(_340, _280, _286);
    float _362 = fma(_350, _318, _358);
    float _364 = abs(_310);
    float _366 = fma(_354, _364, _362);
    bool _368 = !_338;
    float _384;
    if (!_368)
    {
        float _370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _372 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _374 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _376 = _374 * _370;
        float _378 = floor(_376);
        float _380 = -_378;
        float _382 = _376 + _380;
        _384 = _382;
        _386 = true;
    }
    else
    {
        float _388 = float(_94);
        float _390 = 1.0 / _388;
        float _392 = _128 * _390;
        _384 = _392;
    }
    _386 = false;
    float _394 = _384;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _398 = _394 + _396;
    bool _400 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _402 = isnan(_394);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _414 = _394 + _412;
    bool _416 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _418 = isnan(_394);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _436 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _438 = isnan(_394);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = -_410;
    float _450 = _448 + 1.0;
    float _452 = 1.0 / _434;
    float _454 = _446 * _450;
    float _456 = -_446;
    float _458 = _456 + 1.0;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _460;
    bool _464 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _466 = 1.0 / _430;
    float _468 = _426 * _458;
    float _470 = -_426;
    float _472 = _470 + 1.0;
    float _474 = _414 * _452;
    float _476 = _398 * _466;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _482;
    float _486 = fma(_462, _476, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _488 = fma(_480, _476, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _490 = fma(_484, _476, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _492 = in.m_55.x;
    float _494 = in.m_55.y;
    float _496 = in.m_55.z;
    float _498 = _486 * _468;
    float _500 = _488 * _468;
    float _502 = _490 * _468;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _516 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].x, _498);
    float _518 = fma(_506, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _520 = fma(_510, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _522 = fma(_514, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _524 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].y, _500);
    float _526 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[143].z, _502);
    float _528 = fma(_518, _454, _516);
    float _530 = fma(_520, _454, _524);
    float _532 = fma(_522, _454, _526);
    float _534 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[145].x, _528);
    float _536 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[145].y, _530);
    float _538 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[145].z, _532);
    float _540 = _534 * _492;
    float _542 = _536 * _494;
    float _544 = _538 * _496;
    bool _546 = !_464;
    float _562;
    if (!_546)
    {
        float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _550 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _554 = _552 * _548;
        float _556 = floor(_554);
        float _558 = -_556;
        float _560 = _554 + _558;
        _562 = _560;
        _564 = true;
    }
    else
    {
        float _566 = float(_94);
        float _568 = 1.0 / _566;
        float _570 = _128 * _568;
        _562 = _570;
    }
    _564 = false;
    float _572 = _562;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _576 = _572 + _574;
    bool _578 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _580 = isnan(_572);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _592 = _572 + _590;
    bool _594 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _596 = isnan(_572);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _614 = _572 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _616 = isnan(_572);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = -_588;
    float _628 = _626 + 1.0;
    float _630 = 1.0 / _612;
    float _632 = _624 * _628;
    float _634 = -_624;
    float _636 = _634 + 1.0;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _638;
    bool _642 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _644 = 1.0 / _608;
    float _646 = _604 * _636;
    float _648 = -_604;
    float _650 = _648 + 1.0;
    float _652 = _592 * _630;
    float _654 = _576 * _644;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _660;
    float _664 = fma(_640, _654, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _666 = fma(_658, _654, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _668 = fma(_662, _654, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _670 = _664 * _646;
    float _672 = _666 * _646;
    float _674 = _668 * _646;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _686 = _684 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _688 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].x, _670);
    float _690 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].y, _672);
    float _692 = fma(_678, _652, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _694 = fma(_682, _652, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _696 = fma(_686, _652, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _698 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[107].z, _674);
    float _700 = fma(_692, _632, _688);
    float _702 = fma(_694, _632, _690);
    float _704 = fma(_696, _632, _698);
    float _706 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[109].x, _700);
    float _708 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[109].y, _702);
    float _710 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[109].z, _704);
    float _712 = _706 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _714 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _718 = _710 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _720 = _712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _722 = _714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _724 = _718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _726 = !_642;
    float _742;
    if (!_726)
    {
        float _728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _730 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _734 = _732 * _728;
        float _736 = floor(_734);
        float _738 = -_736;
        float _740 = _734 + _738;
        _742 = _740;
        _744 = true;
    }
    else
    {
        float _746 = float(_94);
        float _748 = 1.0 / _746;
        float _750 = _128 * _748;
        _742 = _750;
    }
    _744 = false;
    float _752 = _742;
    float _754 = in.m_51.y;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _758 = _756 != 0;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _766 = _764 != 0;
    float _768 = _150 * 2.0;
    float _770 = in.m_51.z;
    float _772 = in.m_51.w;
    float _774 = _150 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _776 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = floor(_768);
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _784 = _782 != 0;
    float _786 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _788 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _790 = -_780;
    float _792 = fma(_774, 2.0, _790);
    float _794 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].x, _786);
    float _796 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _798 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].x, _788);
    float _800 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _794);
    float _802 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _796);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _806 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _798);
    float _808 = _754 * 2.0;
    float _810 = _150 + _754;
    float _812 = _754 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _814 = _778 > 0.0;
    float _816 = _770 * 2.0;
    float _818 = _810 + (-1.0);
    float _820 = floor(_808);
    float _822 = _754 + _770;
    float _824 = fma(_812, -2.0, _804);
    bool _826 = _778 >= 0.0;
    bool _828 = isnan(_778);
    bool _830 = _826 || _828;
    bool _832 = isnan(0.0);
    bool _834 = _830 || _832;
    float _836 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _838 = _822 + (-1.0);
    float _840 = floor(_816);
    int _842 = _834 ? 0 : 1;
    float _844 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _846 = (*spvDescriptorSet0.vp_c7)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _848 = (*spvDescriptorSet0.vp_c7)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _850 = _150 + _770;
    float _852 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[0].x, _846);
    bool _854 = _820 > 0.0;
    float _856 = fma((*spvDescriptorSet0.vp_c7)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[1].x, _848);
    bool _858 = _820 >= 0.0;
    bool _860 = isnan(_820);
    bool _862 = _858 || _860;
    bool _864 = isnan(0.0);
    bool _866 = _862 || _864;
    float _868 = _850 + (-1.0);
    int _870 = ~_842;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _878 = _874;
    float _880 = _868;
    float _882 = _852;
    if (!_814)
    {
        int _884 = ~_842;
        int _886 = _884 + 1;
        _878 = _886;
    }
    int _888 = _878;
    float _890 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _892 = _802 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _894 = _866 ? 0 : 1;
    float _896 = _800 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _898 = _840 > 0.0;
    float _900 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c8)._m0[0].z, _852);
    bool _902 = _840 >= 0.0;
    bool _904 = isnan(_840);
    bool _906 = _902 || _904;
    bool _908 = isnan(0.0);
    bool _910 = _906 || _908;
    float _912 = fma((*spvDescriptorSet0.vp_c7)._m0[2].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _856);
    float _914 = (*spvDescriptorSet0.vp_c7)._m0[2].z;
    bool _916 = _910;
    if (_784)
    {
        _914 = _150;
    }
    float _918 = _914;
    float _920 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _922 = _892 + _920;
    float _924 = _918;
    if (!_784)
    {
        _880 = _754;
    }
    float _926 = _880;
    float _928 = _912 * _912;
    float _930 = _926;
    if (!_784)
    {
        _924 = _770;
    }
    float _932 = _924;
    float _934 = _806 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _936 = fma(_900, _900, _928);
    if (_784)
    {
        _930 = _150;
    }
    float _938 = _930;
    float _940 = _932 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _944 = _938 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_784)
    {
        _882 = _770;
    }
    float _948 = _882;
    float _950 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[83].z, _876);
    float _952 = _948;
    if (_784)
    {
        _952 = _754;
    }
    float _954 = _952;
    float _956 = -_942;
    float _958 = fma(_944, 2.0, _956);
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _964 = !_762;
    int _966 = _964 ? 0 : 1;
    float _968 = rsqrt(_936);
    float _970 = -_960;
    float _972 = fma(_940, 2.0, _970);
    float _974 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[83].w, _962);
    int _976 = abs(_966);
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _980 = _896 + _978;
    float _982 = in.m_59.x;
    float _984 = in.m_59.y;
    float _986 = in.m_59.z;
    int _988 = ~_894;
    int _990 = _988 + 1;
    int _992 = _990 + 1;
    float _994 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _824);
    int _996 = _992;
    if (!_854)
    {
        int _998 = ~_894;
        int _1000 = _998 + 1;
        _996 = _1000;
    }
    int _1002 = _996;
    float _1004 = -_128;
    float _1006 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[81].x, _958);
    bool _1008 = !_758;
    int _1010 = _1008 ? 0 : 1;
    float _1012 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _974);
    float _1014 = float(_976);
    float _1016 = _366 * _544;
    float _1018 = float(_888);
    float _1020 = _366 * _540;
    int _1022 = abs(_1010);
    float _1024 = _900 * _968;
    float _1026 = _1024;
    if (!_784)
    {
        _946 = _770;
    }
    float _1028 = _946;
    float _1030 = _1014 * _1018;
    float _1032 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1034 = log2(_1032);
    float _1036 = _1028;
    if (_784)
    {
        _1036 = _754;
    }
    float _1038 = _1036;
    float _1040 = _1030 * (-2.0);
    int _1042 = _910 ? 0 : 1;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1046 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1048 = ~_1042;
    int _1050 = _1048 + 1;
    int _1052 = _1050 + 1;
    float _1054 = fma(_1040, _984, _984);
    float _1056 = in.m_61.x;
    float _1058 = in.m_61.y;
    float _1060 = fma(_1046, -2.0, _1044);
    float _1062 = _1046;
    int _1064 = _1052;
    if (_784)
    {
        _1062 = _754;
    }
    float _1066 = _1062;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1070 = _1066;
    if (!_784)
    {
        _1070 = _150;
    }
    float _1072 = _1070;
    float _1074 = fma(_844, _1040, _844);
    if (!_898)
    {
        int _1076 = ~_1042;
        int _1078 = _1076 + 1;
        _1064 = _1078;
    }
    int _1080 = _1064;
    float _1082 = _1034 * _128;
    float _1084 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1086 = float(_1022);
    float _1088 = _912 * _968;
    float _1090 = float(_1080);
    float _1092 = exp2(_1082);
    float _1094 = fma(_1084, -2.0, _1068);
    bool _1096 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1098 = isnan(1.0);
    bool _1100 = _1096 || _1098;
    bool _1102 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1104 = _1100 || _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1108 = 1.0 + _1106;
    float _1110 = _1086 * _1090;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1114 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1094);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1118 = 1.0 / _1108;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1122 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1112);
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1126 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1116);
    float _1128 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1120);
    float _1130 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1124);
    float _1132 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1122);
    float _1134 = -_1092;
    float _1136 = _1134 + 1.0;
    float _1138 = _922 * _922;
    bool _1140 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1148 = _1144 || _1146;
    float _1150 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.0599999986588954925537109375, _1058);
    float _1152 = -_128;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[76].x, _792);
    float _1156 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1130);
    float _1158 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1128);
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1162 = _934 + _1160;
    float _1164 = fma(_980, _980, _1138);
    float _1166 = _1148 ? _1136 : 0.0;
    float _1168 = _1150 * 5.0;
    float _1170 = -_128;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[86].x, _972);
    float _1174 = fma(_1162, _1162, _1164);
    float _1176 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1126);
    float _1178 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _950);
    float _1180 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1060);
    float _1182 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.07999999821186065673828125, _1056);
    bool _1184 = !_766;
    int _1186 = _1184 ? 0 : 1;
    float _1188 = _1088;
    if (_1104)
    {
        float _1190 = _1166 * _1118;
        _132 = _1190;
    }
    float _1192 = _132;
    float _1194 = _1168 * 0.15915493667125701904296875;
    float _1196 = _754 + (-0.5);
    float _1198 = _1182 * 4.0;
    int _1200 = abs(_1186);
    float _1202 = rsqrt(_1174);
    float _1204 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1054);
    float _1206 = abs(_1024);
    float _1208 = abs(_1088);
    float _1210 = precise::max(_1206, _1208);
    float _1212 = _770 + (-0.5);
    float _1214 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1216 = _1210 >= 16.0;
    float _1218 = _1110 * (-2.0);
    float _1220 = _150 + (-0.5);
    float _1222 = _1198 * 0.15915493667125701904296875;
    float _1224 = float(_1200);
    float _1226 = fma(_1218, _982, _982);
    float _1228 = float(_1002);
    float _1230 = fma(_1074, _1192, _1204);
    float _1232 = fma(_836, _1218, _836);
    float _1234 = in.m_63.x;
    float _1236 = _922 * _1202;
    float _1238 = _1224 * _1228;
    float _1240 = _980 * _1202;
    float _1242 = _1162 * _1202;
    float _1244 = _1236 * _1236;
    float _1246 = _1194 * 6.283185482025146484375;
    float _1248 = sin(_1246);
    float _1250 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1226);
    float _1252 = _1238 * (-2.0);
    int _1254 = as_type<int>(_1214);
    if (_1216)
    {
        float _1256 = _1024 * 0.0625;
        _1026 = _1256;
    }
    float _1258 = _1026;
    if (_1216)
    {
        float _1260 = _1088 * 0.0625;
        _1188 = _1260;
    }
    float _1262 = _1188;
    float _1264 = fma(_1232, _1192, _1250);
    float _1266 = fma(_1252, _986, _986);
    float _1268 = in.m_61.z;
    float _1270 = _1222 * 6.283185482025146484375;
    float _1272 = sin(_1270);
    float _1274 = fma(_1240, _1240, _1244);
    float _1276 = abs(_1258);
    bool _1278 = _1276 != 0.0;
    bool _1280 = isnan(_1276);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan(0.0);
    bool _1286 = _1282 || _1284;
    float _1288 = fma(_890, _1252, _890);
    float _1290 = fma(_1242, _1242, _1274);
    float _1292 = abs(_1262);
    bool _1294 = _1292 == 0.0;
    bool _1296 = !_1286;
    bool _1298 = _1294 && _1296;
    float _1300 = _1230 * 0.15915493667125701904296875;
    float _1302 = precise::max(_1234, -0.20000000298023223876953125);
    float _1304 = rsqrt(_1290);
    float _1306 = precise::max(_1234, -0.5);
    float _1308 = _1264 * 0.15915493667125701904296875;
    float _1310 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1266);
    float _1312 = precise::min(_1302, 1.0);
    float _1314 = _1272 * 0.180000007152557373046875;
    float _1316 = precise::min(_1306, 1.0);
    float _1318 = fma(_1288, _1192, _1310);
    float _1320 = _1248 * 0.23000000417232513427734375;
    float _1322 = fma(_1312, 0.833333313465118408203125, 0.16666667163372039794921875);
    float _1324 = abs(_1262);
    bool _1326 = _1324 == 0.0;
    float _1328 = _1318 * 0.15915493667125701904296875;
    float _1330 = fma(_1316, 0.666666686534881591796875, 0.3333333432674407958984375);
    float _1332 = fma(_1320, _1322, _1056);
    float _1334 = _1300 * 6.283185482025146484375;
    float _1336 = sin(_1334);
    float _1338 = _366 * _542;
    float _1340 = fma(_1314, _1330, _1058);
    float _1342 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1344 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1332);
    int _1346 = as_type<int>(_1330);
    if (_1298)
    {
        bool _1348 = as_type<int>(_1262) >= 0;
        _916 = _1348;
    }
    bool _1350 = _916;
    float _1352 = _1338 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1268);
    float _1356 = _1300 * 6.283185482025146484375;
    float _1358 = cos(_1356);
    float _1360 = _1214 * _1344;
    int _1362 = _1350 ? (-1) : 0;
    if (_1298)
    {
        int _1364 = _1350 ? 0 : 1078530011;
        _1254 = _1364;
    }
    int _1366 = _1254;
    float _1368 = _1240 * _1304;
    float _1370 = _1236 * _1304;
    float _1372 = _1342 * _1354;
    float _1374 = _1242 * _1304;
    int _1376 = _1366;
    if (_1298)
    {
        int _1378 = int(0x80000000) & as_type<int>(_1258);
        int _1380 = _1366 | _1378;
        _1376 = _1380;
    }
    int _1382 = _1376;
    float _1384 = _1328 * 6.283185482025146484375;
    float _1386 = sin(_1384);
    float _1388 = _1328 * 6.283185482025146484375;
    float _1390 = cos(_1388);
    float _1392 = _1308 * 6.283185482025146484375;
    float _1394 = sin(_1392);
    float _1396 = _1308 * 6.283185482025146484375;
    float _1398 = cos(_1396);
    float _1400 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1340);
    float _1402 = _1352 * _1400;
    bool _1404 = !_1286;
    bool _1406 = _1404 && _1326;
    int _1408 = _1382;
    float _1410 = as_type<float>(_1382);
    if (!_1406)
    {
        float _1412 = abs(_1258);
        bool _1414 = _1412 != as_type<float>(0x7f800000u /* inf */);
        bool _1416 = isnan(_1412);
        bool _1418 = _1414 || _1416;
        bool _1420 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1422 = _1418 || _1420;
        float _1424 = abs(_1262);
        bool _1426 = _1424 == as_type<float>(0x7f800000u /* inf */);
        float _1428 = abs(_1262);
        bool _1430 = _1428 == as_type<float>(0x7f800000u /* inf */);
        bool _1432 = !_1422;
        bool _1434 = _1430 && _1432;
        if (_1434)
        {
            bool _1436 = as_type<int>(_1262) >= 0;
            _1362 = _1436 ? (-1) : 0;
        }
        int _1438 = _1362;
        if (_1434)
        {
            _1408 = 1075235812;
        }
        int _1440 = _1408;
        int _1442 = _1440;
        if (_1434)
        {
            int _1444 = ~_1438;
            int _1446 = (_1444 != 0) ? _1440 : 1061752795;
            _1442 = _1446;
        }
        int _1448 = _1442;
        float _1450 = as_type<float>(_1448);
        if (_1434)
        {
            int _1452 = int(0x80000000) & as_type<int>(_1258);
            int _1454 = _1448 | _1452;
            _1450 = as_type<float>(_1454);
        }
        float _1456 = _1450;
        bool _1458 = !_1422;
        bool _1460 = _1458 && _1426;
        _1410 = _1456;
        if (!_1460)
        {
            float _1462 = abs(_1258);
            float _1464 = abs(_1262);
            float _1466 = precise::max(_1462, _1464);
            float _1468 = abs(_1258);
            float _1470 = abs(_1262);
            float _1472 = precise::min(_1468, _1470);
            float _1474 = 1.0 / _1466;
            float _1476 = abs(_1258);
            float _1478 = abs(_1262);
            bool _1480 = _1476 > _1478;
            bool _1482 = as_type<int>(_1262) >= 0;
            float _1484 = _1472 * _1474;
            float _1486 = _1484 * _1484;
            float _1488 = _1486 + 11.33538818359375;
            float _1490 = fma(_1486, _1488, 28.84246826171875);
            float _1492 = fma(_1486, _1490, 19.6966705322265625);
            float _1494 = fma(_1486, -0.82336294651031494140625, -5.674867153167724609375);
            float _1496 = fma(_1486, _1494, -6.565555095672607421875);
            float _1498 = 1.0 / _1492;
            float _1500 = _1486 * _1496;
            float _1502 = abs(_1258);
            float _1504 = abs(_1262);
            float _1506 = _1502 + _1504;
            int _1508 = as_type<int>(_1258) & int(0x80000000);
            float _1510 = _1484 * _1500;
            bool _1512 = _1506 > as_type<float>(0x7f800000u /* inf */);
            bool _1514 = isnan(_1506);
            bool _1516 = _1512 || _1514;
            bool _1518 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1520 = _1516 || _1518;
            float _1522 = fma(_1510, _1498, _1484);
            float _1524 = _1522;
            _1410 = _1506;
            if (_1480)
            {
                float _1526 = -_1522;
                float _1528 = _1526 + 1.57079637050628662109375;
                _1524 = _1528;
            }
            float _1530 = _1524;
            int _1532 = as_type<int>(_1530);
            if (!_1482)
            {
                float _1534 = -_1530;
                float _1536 = _1534 + 3.1415927410125732421875;
                _1532 = as_type<int>(_1536);
            }
            int _1538 = _1532;
            if (!_1520)
            {
                int _1540 = _1508 | _1538;
                _1410 = as_type<float>(_1540);
            }
        }
    }
    float _1542 = _1410;
    float _1544 = _1398 * _1336;
    float _1546 = _1394 * _1336;
    float _1548 = _1336 * _1390;
    float _1550 = _1358 * _1390;
    float _1552 = _1390 * _1402;
    float _1554 = _1398 * _1358;
    float _1556 = _1542 * 0.15915493667125701904296875;
    float _1558 = _1394 * _1358;
    float _1560 = _1398 * _1552;
    float _1562 = fma(_1386, _1554, _1546);
    float _1564 = _1556 * 6.283185482025146484375;
    float _1566 = cos(_1564);
    float _1568 = -_1544;
    float _1570 = fma(_1386, _1558, _1568);
    float _1572 = -_1402;
    float _1574 = _1386 * _1572;
    float _1576 = -_1558;
    float _1578 = fma(_1386, _1544, _1576);
    float _1580 = fma(_1562, _1360, _1560);
    float _1582 = _1394 * _1552;
    float _1584 = fma(_1550, _1360, _1574);
    float _1586 = fma(_1386, _1546, _1554);
    float _1588 = _1556 * 6.283185482025146484375;
    float _1590 = sin(_1588);
    float _1592 = fma(_1578, _1372, _1580);
    float _1594 = fma(_1570, _1360, _1582);
    float _1596 = fma(_1548, _1372, _1584);
    bool _1598 = _754 > 0.5;
    float _1600 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1602 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1604 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1606 = fma(_1586, _1372, _1594);
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1600);
    float _1610 = -_1566;
    float _1612 = _1610 + 1.0;
    float _1614 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1602);
    float _1616 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1604);
    float _1618 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1608);
    float _1620 = _1368 * _1612;
    float _1622 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1614);
    float _1624 = _1374 * _1590;
    float _1626 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1616);
    float _1628 = _1370 * _1612;
    float _1630 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1632 = fma(_1370, _1620, _1624);
    float _1634 = _1370 * _1590;
    float _1636 = -_1624;
    float _1638 = fma(_1370, _1620, _1636);
    float _1640 = fma(_1370, _1628, _1566);
    float _1642 = _1368 * _1590;
    float _1644 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1646 = fma(_1368, _1620, _1566);
    float _1648 = _1630 * _1640;
    float _1650 = fma(_1374, _1628, _1642);
    float _1652 = -_1642;
    float _1654 = fma(_1374, _1628, _1652);
    float _1656 = _1630 * _1638;
    float _1658 = fma(_1644, _1632, _1648);
    float _1660 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1662 = -_1634;
    float _1664 = fma(_1374, _1620, _1662);
    float _1666 = fma(_1374, _1620, _1634);
    float _1668 = _1374 * _1374;
    float _1670 = _1630 * _1650;
    float _1672 = fma(_1644, _1646, _1656);
    float _1674 = fma(_1660, _1654, _1658);
    float _1676 = fma(_1612, _1668, _1566);
    float _1678 = fma(_1644, _1664, _1670);
    float _1680 = fma(_1660, _1666, _1672);
    float _1682 = _1674 * _1674;
    float _1684 = fma(_1660, _1676, _1678);
    float _1686 = fma(_1680, _1680, _1682);
    int _1688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1690 = _1688 != 0;
    float _1692 = fma(_1684, _1684, _1686);
    float _1694 = -_156;
    float _1696 = _1694 + 1.0;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1700 = _1698 != 0;
    float _1702 = in.m_53.x;
    float _1704 = rsqrt(_1692);
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1708 = _1706 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1710 = _1598 ? as_type<int>(_1696) : as_type<int>(_156);
    float _1712 = _1556;
    float _1714 = _1674;
    if (_1690)
    {
        float _1716 = in.m_51.z;
        _1712 = _1716;
    }
    float _1718 = _1712;
    float _1720 = _1700 ? as_type<float>(_1710) : _156;
    float _1722 = 1.0 / _1708;
    float _1724 = precise::max(-0.10999999940395355224609375, (*spvDescriptorSet0.vp_c7)._m0[2].y);
    bool _1726 = _770 > 0.5;
    int _1728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1730 = _1728 != 0;
    int _1732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1734 = _1732 != 0;
    float _1736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1740 = _1738 != 0;
    int _1742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1744 = _1742 != 0;
    float _1746 = _1674 * _1704;
    float _1748 = precise::min(_1724, 0.10999999940395355224609375);
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1752 = _1750 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1754 = precise::max((*spvDescriptorSet0.vp_c7)._m0[2].x, -0.10999999940395355224609375);
    float _1756 = (*spvDescriptorSet0.vp_c7)._m0[2].x * 40.0;
    int _1758 = _1726 ? as_type<int>(_1696) : as_type<int>(_156);
    float _1760 = _1748 * _1746;
    bool _1762 = _772 > 0.5;
    float _1764 = _1680 * _1704;
    float _1766 = precise::min(_1754, 0.10999999940395355224609375);
    float _1768 = _1684 * _1704;
    float _1770 = precise::max(-0.10999999940395355224609375, (*spvDescriptorSet0.vp_c7)._m0[2].z);
    float _1772 = 1.0 / _1752;
    float _1774 = fma(_1766, _1764, _1760);
    float _1776 = precise::min(_1770, 0.10999999940395355224609375);
    bool _1778 = _1744;
    bool _1780 = _1740;
    int _1782 = as_type<int>(_1736);
    if (_1734)
    {
        float _1784 = -_1702;
        float _1786 = _1784 + 1.0;
        _1346 = as_type<int>(_1786);
    }
    int _1788 = _1346;
    float _1790 = _1740 ? as_type<float>(_1758) : _156;
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1792;
    if (_1744)
    {
        float _1796 = _1762 ? _1696 : _156;
        _222 = _1796;
    }
    float _1798 = _222;
    float _1800 = fma(_1776, _1768, _1774);
    float _1802 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1804 = _752 + _1802;
    float _1806 = _1794 * _1722;
    float _1808 = _1798;
    if (_1690)
    {
        bool _1810 = _1718 > 0.5;
        _1778 = _1810;
    }
    bool _1812 = _1778;
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1816 = _1814 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    if (_1730)
    {
        bool _1818 = _150 > 0.5;
        _1780 = _1818;
    }
    bool _1820 = _1780;
    float _1822 = fma(_1806, _1804, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1824 = precise::max(_1800, -1.0);
    float _1826 = _1816 * _1772;
    float _1828 = _896 + _1680;
    float _1830 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1832 = precise::min(0.0, _1824);
    float _1834 = _934 + _1684;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1838 = _752 + _1836;
    bool _1840 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1842 = isnan(_752);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1848 = _1844 || _1846;
    float _1850 = float(_1848);
    float _1852 = _1832 * 40.0;
    float _1854 = fma(_1756, _1832, _1828);
    float _1856 = fma(_1826, _1838, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1858 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1860 = isnan(_752);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1866 = _1862 || _1864;
    float _1868 = float(_1866);
    float _1870 = fma(_1852, (*spvDescriptorSet0.vp_c7)._m0[2].z, _1834);
    float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1874 = _1854 + _1872;
    float _1876 = -_1850;
    float _1878 = _1876 + 1.0;
    float _1880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1884 = _1870 + _1882;
    float _1886 = _1874 * _1874;
    float _1888 = _1868 * _1878;
    float _1890 = -_1868;
    float _1892 = _1890 + 1.0;
    float _1894 = _1884 * _1884;
    float _1896 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1898 = _752 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1900 = isnan(_752);
    bool _1902 = _1898 || _1900;
    bool _1904 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1906 = _1902 || _1904;
    float _1908 = float(_1906);
    float _1910 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1912 = _1886 + _1894;
    float _1914 = fma(_1896, _1720, -0.5);
    float _1916 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1918 = fma(_1790, _1910, -0.5);
    float _1920 = _1908 * _1892;
    float _1922 = -_994;
    float _1924 = fma(_1132, _1914, _1922);
    float _1926 = -_1908;
    float _1928 = _1926 + 1.0;
    float _1930 = _1880 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1932 = _1822 * _1920;
    int _1934 = as_type<int>(_1920);
    float _1936 = _1878;
    float _1938 = _1914;
    float _1940 = _1852;
    float _1942 = _1886;
    float _1944 = _1894;
    if (_1730)
    {
        float _1946 = -_1702;
        float _1948 = _1946 + 1.0;
        _1934 = as_type<int>(_1948);
    }
    int _1950 = _1934;
    float _1952 = sqrt(_1912);
    float _1954 = fma(_1930, _1798, -0.5);
    if (!_1734)
    {
        _1808 = _1702;
    }
    float _1956 = _1808;
    float _1958 = _1956;
    if (_1690)
    {
        float _1960 = -_1702;
        float _1962 = _1960 + 1.0;
        _1782 = as_type<int>(_1962);
    }
    int _1964 = _1782;
    if (_1734)
    {
        float _1966 = _1598 ? as_type<float>(_1788) : _1702;
        _1958 = _1966;
    }
    float _1968 = _1958;
    float _1970 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1932);
    if (!_1730)
    {
        _1936 = _1702;
    }
    float _1972 = _1936;
    float _1974 = -_1180;
    float _1976 = fma(_1012, _1954, _1974);
    float _1978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1980 = _1972;
    if (!_1690)
    {
        _1938 = _1702;
    }
    float _1982 = _1938;
    float _1984 = fma(_1856, _1888, _1970);
    float _1986 = _1982;
    if (_1730)
    {
        float _1988 = _1820 ? as_type<float>(_1950) : _1702;
        _1980 = _1988;
    }
    float _1990 = _1980;
    float _1992 = _892 + _1674;
    if (_1690)
    {
        float _1994 = _1812 ? as_type<float>(_1964) : _1702;
        _1986 = _1994;
    }
    float _1996 = _1986;
    float _1998 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2000 = fma(_1850, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1984);
    float _2002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2004 = _1952 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2006 = fma(_1852, (*spvDescriptorSet0.vp_c7)._m0[2].y, _1992);
    float _2008 = fma(_1998, _1990, -0.5);
    float _2010 = fma(_1176, _2008, _1154);
    float _2012 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2014 = fma(_2012, _1968, -0.5);
    float _2016 = _2014;
    if (!_2004)
    {
        _1714 = _1886;
    }
    float _2018 = _1714;
    float _2020 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2022 = fma(_1158, _2014, _1172);
    float _2024 = _2018;
    if (!_2004)
    {
        _2016 = _1854;
    }
    float _2026 = _2016;
    float _2028 = fma(_2020, _1996, -0.5);
    float _2030 = _2026;
    if (!_2004)
    {
        _1940 = _1870;
    }
    float _2032 = _1940;
    float _2034 = _2032;
    if (!_2004)
    {
        _1942 = _2006;
    }
    float _2036 = _1942;
    float _2038 = fma(_1178, _2028, _1006);
    bool _2040 = !_2004;
    float _2042 = _2036;
    if (!_2040)
    {
        float _2044 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2046 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2048 = _1952 + _2046;
        float _2050 = _2006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2052 = rsqrt(_1912);
        float _2054 = _2048 * _2044;
        float _2056 = _2054 * 0.15915493667125701904296875;
        float _2058 = _2056 * 6.283185482025146484375;
        float _2060 = sin(_2058);
        float _2062 = _2056 * 6.283185482025146484375;
        float _2064 = cos(_2062);
        float _2066 = fma(_2060, _2050, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2068 = _2052 * _2066;
        float _2070 = _2064 + (-1.0);
        float _2072 = fma(_1874, _2068, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2074 = fma(_1884, _2068, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2076 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2080 = _2072 + _2078;
        float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2084 = _2074 + _2082;
        float _2086 = fma(_2006, _2064, _2076);
        float _2088 = _2080 * _2080;
        float _2090 = _2084 * _2084;
        _2042 = _2086;
        _2024 = _2088;
        _1944 = _2090;
        _2030 = _2072;
        _2034 = _2074;
    }
    float _2092 = _2042;
    float _2094 = _2024;
    float _2096 = _1944;
    float _2098 = _2030;
    float _2100 = _2034;
    float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2104 = _2092 + _2102;
    float _2106 = -_1114;
    float _2108 = fma(_1156, _1918, _2106);
    float _2110 = fma(_2104, _2104, _2094);
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2114 = _2038 + 0.5;
    float _2116 = _2110 + _2096;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2120 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2122 = _2000 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2124 = sqrt(_2116);
    float _2126 = _2112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2128 = _2118 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2130 = _2120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2132 = _1924 + 0.5;
    float _2134 = _2022 + 0.5;
    float _2136 = _2010 + 0.5;
    float _2138 = _1976 + 0.5;
    float _2140 = _2108 + 0.5;
    out.m_65.x = _720;
    out.m_65.y = _722;
    out.m_65.z = _724;
    out.m_65.w = _716;
    out.m_67.x = _2126;
    out.m_67.y = _2128;
    out.m_67.z = _2130;
    out.m_67.w = _2122;
    bool _2142 = _2124 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2144 = isnan(_2124);
    bool _2146 = _2142 || _2144;
    bool _2148 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2150 = _2146 || _2148;
    out.m_69.x = _2136;
    out.m_69.y = _2132;
    out.m_69.z = _2114;
    out.m_69.w = _2138;
    out.m_71.x = _2134;
    out.m_71.y = _2140;
    float _2152 = _2116;
    float _2154 = _2136;
    float _2156 = _2132;
    float _2158 = _2134;
    if (!_2150)
    {
        _2152 = 1.0;
    }
    float _2160 = _2152;
    bool _2162 = !_2150;
    float _2164 = _2160;
    if (!_2162)
    {
        bool _2166 = _2124 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2168 = isnan(_2124);
        bool _2170 = _2166 || _2168;
        bool _2172 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2174 = _2170 || _2172;
        if (!_2174)
        {
            float _2176 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2178 = _2124 + _2176;
            float _2180 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2182 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2180;
            float _2184 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2186 = _2184 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2188 = 1.0 / _2182;
            float _2190 = _2178 * _2188;
            float _2192 = fma(_2190, _2186, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2164 = _2192;
            _2194 = true;
        }
        else
        {
            bool _2196 = _2124 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2198 = isnan(_2124);
            bool _2200 = _2196 || _2198;
            bool _2202 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2204 = _2200 || _2202;
            if (!_2204)
            {
                float _2206 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2208 = _2124 + _2206;
                float _2210 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2212 = _2210 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2214 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2216 = _2214 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2218 = 1.0 / _2212;
                float _2220 = _2208 * _2218;
                float _2222 = fma(_2220, _2216, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2164 = _2222;
                _2194 = true;
            }
            else
            {
                _2164 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2194 = false;
    float _2224 = _2164;
    float _2226 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2228 = _2092 + _2226;
    float _2230 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2232 = _2098 + _2230;
    float _2234 = fma(_2228, _2224, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2236 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2238 = _2100 + _2236;
    float _2240 = fma(_2232, _2224, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2242 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2244 = _2234 + _2242;
    float _2246 = fma(_2238, _2224, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2248 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2250 = _2240 + _2248;
    float _2252 = _2244 * _2244;
    float _2254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2256 = _2246 + _2254;
    float _2258 = fma(_2250, _2250, _2252);
    float _2260 = fma(_2256, _2256, _2258);
    float _2262 = rsqrt(_2260);
    float _2264 = _2262 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2266 = _2250 * _2264;
    float _2268 = _2256 * _2264;
    float _2270 = _2266 * _2266;
    float _2272 = _2268 * _2268;
    float _2274 = _2270 + _2272;
    float _2276 = sqrt(_2274);
    bool _2278 = _2276 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2280 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2282 = _2276 + _2280;
    float _2284 = _2256;
    float _2286 = _2282;
    float _2288 = _2244;
    if (_2278)
    {
        float _2290 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2284 = _2290;
    }
    float _2292 = _2284;
    if (_2278)
    {
        float _2294 = rsqrt(_2274);
        _2154 = _2294;
    }
    float _2296 = _2154;
    float _2298 = _2296;
    if (_2278)
    {
        float _2300 = _2282 * _2292;
        _2286 = _2300;
    }
    float _2302 = _2286;
    if (_2278)
    {
        float _2304 = _2302 * 0.15915493667125701904296875;
        _2156 = _2304;
    }
    float _2306 = _2156;
    float _2308 = _2262;
    if (_2278)
    {
        float _2310 = _2306 * 6.283185482025146484375;
        float _2312 = sin(_2310);
        _2308 = _2312;
    }
    float _2314 = _2308;
    float _2316 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2318 = precise::max(0.0, _2316);
    float _2320 = _2252;
    float _2322 = _2318;
    float _2324 = _2316;
    if (_2278)
    {
        float _2326 = _2306 * 6.283185482025146484375;
        float _2328 = cos(_2326);
        _2320 = _2328;
    }
    float _2330 = _2320;
    float _2332 = -_2264;
    float _2334 = -_2318;
    float _2336 = fma(_2244, _2332, _2334);
    if (!_2278)
    {
        _2288 = _2268;
    }
    float _2338 = _2288;
    float _2340 = _2338;
    if (_2278)
    {
        float _2342 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2322 = _2342;
    }
    float _2344 = _2322;
    float _2346 = sqrt(_2260);
    float _2348 = _2344;
    float _2350 = _2314;
    if (_2278)
    {
        float _2352 = fma(_2314, _2344, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2348 = _2352;
    }
    float _2354 = _2348;
    float _2356 = _2354;
    if (!_2278)
    {
        _2350 = _2266;
    }
    float _2358 = _2350;
    float _2360 = _2358;
    float _2362 = _2330;
    if (_2278)
    {
        float _2364 = _2330 + (-1.0);
        _2324 = _2364;
    }
    float _2366 = _2324;
    float _2368 = _2366;
    if (_2278)
    {
        float _2370 = _2296 * _2354;
        _2158 = _2370;
    }
    float _2372 = _2158;
    if (!_2278)
    {
        _2356 = _2336;
    }
    float _2374 = _2356;
    float _2376 = _2374;
    if (_2278)
    {
        float _2378 = _2366 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2298 = _2378;
    }
    float _2380 = _2298;
    if (_2278)
    {
        float _2382 = _2266 * _2372;
        _2360 = _2382;
    }
    float _2384 = _2360;
    if (!_2278)
    {
        _2368 = _2270;
    }
    float _2386 = _2368;
    float _2388 = _2386;
    if (_2278)
    {
        float _2390 = _2268 * _2372;
        _2340 = _2390;
    }
    float _2392 = _2340;
    if (_2278)
    {
        float _2394 = fma(_2336, _2330, _2380);
        _2376 = _2394;
    }
    float _2396 = _2376;
    if (_2278)
    {
        float _2398 = _2384 * _2384;
        _2388 = _2398;
    }
    float _2400 = _2388;
    if (!_2278)
    {
        _2362 = _2272;
    }
    float _2402 = _2362;
    float _2404 = _2402;
    if (_2278)
    {
        float _2406 = _2392 * _2392;
        _2404 = _2406;
    }
    float _2408 = _2404;
    float _2410 = fma(_2396, _2396, _2400);
    float _2412 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2414 = _2410 + _2408;
    float _2416 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2420 = fma(_2346, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2418);
    float _2422 = precise::clamp(_2420, 0.0, 1.0);
    float _2424 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2426 = rsqrt(_2414);
    float _2428 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2416);
    float _2430 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2432 = -_2422;
    float _2434 = _2432 + 1.0;
    float _2436 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2438 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2428);
    float _2440 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2430);
    float _2442 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2436);
    float _2444 = abs(_2434);
    float _2446 = log2(_2444);
    float _2448 = _2438 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2450 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2440);
    float _2452 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2412);
    float _2454 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2442);
    float _2456 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2458 = _2450 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2460 = _2426 * _2384;
    float _2462 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2452);
    float _2464 = -_2456;
    float _2466 = fma(_2464, _2424, 1.0);
    float _2468 = _2426 * _2396;
    float _2470 = _2460 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2472 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2474 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2476 = _2462 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2478 = _2426 * _2392;
    float _2480 = -_2470;
    float _2482 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2480);
    float _2484 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2474);
    float _2486 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2488 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2490 = -_2478;
    float _2492 = fma(_2490, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2482);
    float _2494 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2484);
    float _2496 = exp2(_2486);
    float _2498 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2500 = fma(_2492, -0.5, 0.5);
    float _2502 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2494);
    float _2504 = fma(_2492, 0.5, 0.5);
    float _2506 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2488);
    float _2508 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2498);
    float _2510 = _2468 + 1.0;
    float _2512 = log2(_2466);
    float _2514 = fma(_2504, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2516 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2506);
    float _2518 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2508);
    float _2520 = fma(_2504, _2514, -0.212114393711090087890625);
    float _2522 = 1.0 / _2502;
    float _2524 = -_2468;
    float _2526 = fma(_2496, _2510, _2524);
    float _2528 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2516);
    float _2530 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2518);
    float _2532 = fma(_2504, _2520, 1.570728778839111328125);
    float _2534 = sqrt(_2500);
    float _2536 = _2512 * 0.693147182464599609375;
    float _2538 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2540 = _2528 * _2522;
    float _2542 = _2530 * _2522;
    float _2544 = fma(_2540, 0.5, 0.5);
    float _2546 = fma(_2542, -0.5, 0.5);
    float _2548 = fma(_2526, 0.5, 0.5);
    float _2550 = _2534 * 0.636619746685028076171875;
    float _2552 = -_2532;
    float _2554 = fma(_2550, _2552, 1.0);
    float3 _6802 = float3(_2544, _2546, _2538);
    float _2556 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6802, float3(0.0), isnan(_6802)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6802, float3(0.0), isnan(_6802)), level(0.0)).x;
    float3 _6813 = float3(_2544, _2546, _2538);
    float4 _2559 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6813, float3(0.0), isnan(_6813)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6813, float3(0.0), isnan(_6813)), level(0.0)).xyzw;
    float _2561 = _2559.x;
    float _2563 = _2559.y;
    float _2565 = _2559.z;
    float _2567 = _2559.w;
    float2 _6830 = float2(_2554, _2548);
    float3 _2571 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6830, float2(0.0), isnan(_6830)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6830, float2(0.0), isnan(_6830)), level(0.0)).xyz;
    float _2573 = _2571.x;
    float _2575 = _2571.y;
    float _2577 = _2571.z;
    float _2579 = _892 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2581 = _892 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2583 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2585 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2579);
    float _2587 = fma(_896, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2581);
    float _2589 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2585);
    float _2591 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2587);
    float _2593 = exp2(_2583);
    float _2595 = _2589 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2597 = _2591 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2599 = _2597 + _2595;
    bool _2601 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2603 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan(0.5);
    bool _2609 = _2605 || _2607;
    float _2611 = 1.0 / _2595;
    float _2613 = _2458 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2615 = fma(_2472, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2613);
    float _2617 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2615);
    float _2619 = _2458;
    float _2621 = _2476;
    if (_2609)
    {
        _2619 = 1.0;
    }
    float _2623 = _2619;
    float _2625 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2617);
    float _2627 = _2623;
    if (_2609)
    {
        _2621 = 1.0;
    }
    float _2629 = _2621;
    float _2631 = _2599 * _2611;
    float _2633 = _2631 * 0.5;
    float _2635 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2637 = fma(_2633, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2635);
    float _2639 = 1.0 / _2637;
    float _2641 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2643 = _2639 * _2641;
    float _2645 = _2629;
    if (!_2609)
    {
        float _2647 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2649 = _2647 * 0.15915493667125701904296875;
        float _2651 = _2649 * 6.283185482025146484375;
        float _2653 = cos(_2651);
        float _2655 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2657 = _2655 * 0.15915493667125701904296875;
        float _2659 = _2649 * 6.283185482025146484375;
        float _2661 = sin(_2659);
        float _2663 = 1.0 / _2653;
        float _2665 = _2657 * 6.283185482025146484375;
        float _2667 = cos(_2665);
        float _2669 = _2661 * _2663;
        float _2671 = _2657 * 6.283185482025146484375;
        float _2673 = sin(_2671);
        float _2675 = _2667 * _2669;
        float _2677 = 1.0 / _2675;
        float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2681 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2679;
        float _2683 = 1.0 / _2681;
        float _2685 = _2673 * _2677;
        float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2689 = fma(_2643, _2685, _2687);
        float _2691 = _2689 * _2683;
        float _2693 = precise::clamp(_2691, 0.0, 1.0);
        _2645 = _2693;
    }
    float _2695 = _2645;
    if (!_2609)
    {
        float _2697 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2699 = _2697 * 0.15915493667125701904296875;
        float _2701 = _2699 * 6.283185482025146484375;
        float _2703 = cos(_2701);
        float _2705 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2707 = _2705 * 0.15915493667125701904296875;
        float _2709 = _2699 * 6.283185482025146484375;
        float _2711 = sin(_2709);
        float _2713 = 1.0 / _2703;
        float _2715 = _2707 * 6.283185482025146484375;
        float _2717 = cos(_2715);
        float _2719 = _2711 * _2713;
        float _2721 = _2707 * 6.283185482025146484375;
        float _2723 = sin(_2721);
        float _2725 = _2717 * _2719;
        float _2727 = 1.0 / _2725;
        float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2731 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2729;
        float _2733 = 1.0 / _2731;
        float _2735 = _2723 * _2727;
        float _2737 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2739 = fma(_2643, _2735, _2737);
        float _2741 = _2739 * _2733;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = -_2743;
        float _2747 = _2745 + 1.0;
        _2627 = _2747;
    }
    float _2749 = _2627;
    float _2751 = _2695 * _2749;
    float _2753 = _2502 * 0.5;
    float _2755 = -_2593;
    float _2757 = _2755 + 1.0;
    bool _2759 = _2695 > 0.0;
    bool _2761 = isnan(_2695);
    bool _2763 = _2759 || _2761;
    bool _2765 = isnan(0.0);
    bool _2767 = _2763 || _2765;
    float _2769 = _2751 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2771 = fma(_2530, -0.5, _2753);
    float _2773 = _2625 + _2502;
    bool _2775 = _2749 <= 0.0;
    bool _2777 = !_2767;
    bool _2779 = _2775 || _2777;
    float _2781 = _2769 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2783 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2785 = _2528 + _2502;
    out.gl_Position.x = _2528;
    out.gl_Position.y = _2530;
    out.gl_Position.z = _2625;
    out.gl_Position.w = _2502;
    float _2787 = _2783 * _2556;
    float _2789 = -_2783;
    float _2791 = _2789 + 1.0;
    float _2793 = _2773 * 0.5;
    float _2795 = _2785 * 0.5;
    float _2797 = _2567 * _2787;
    float _2799 = _2577 * _2787;
    float _2801 = _2567 * _2791;
    out.m_47.x = _2781;
    float _2803 = fma(_2573, _2797, _2561);
    float _2805 = fma(_2575, _2797, _2563);
    float _2807 = fma(_2567, _2799, _2565);
    out.m_73.x = _2795;
    out.m_73.y = _2771;
    out.m_73.z = _2793;
    out.m_73.w = _2502;
    out.m_75.x = _2803;
    out.m_75.y = _2805;
    out.m_75.z = _2807;
    out.m_75.w = _2801;
    if (!_2779)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2809 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2809;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

