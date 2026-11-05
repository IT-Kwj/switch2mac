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
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_65 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1622 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_44.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_47.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2410 = as_type<float>(_100);
        out.gl_Position.z = _2410;
    }
    if (!_88)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _104 = in.m_49.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = _118;
    if (_114)
    {
        float _122 = float(_84);
        _94 = _122;
    }
    float _124 = _94;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_47.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _102 = as_type<int>(_136);
    }
    int _138 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2480 = as_type<float>(_138);
        out.gl_Position.z = _2480;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_51.w;
    float _142 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_49.x;
    float _156 = in.m_49.y;
    float _158 = in.m_49.z;
    float _160 = in.m_44.x;
    float _162 = in.m_44.y;
    float _164 = in.m_44.z;
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
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _264 = _260;
    float _282;
    if (!_262)
    {
        float _266 = in.m_53.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_84);
        float _288 = 1.0 / _286;
        float _290 = _118 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _296 = log2(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _318 = 1.0 / _300;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _326 = _324 != 0;
    float _328 = _296 * _118;
    float _330 = 1.0 / _308;
    float _332 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _334 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _336 = precise::max(_332, _334);
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _340 = _338 != 0;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _344 = _342 != 0;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _348 = _346 != 0;
    bool _350 = _336 >= 16.0;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _354 = _292 + _352;
    float _356 = 1.0 / _304;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _360 = _292 + _358;
    float _362 = _354 * _318;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _366 = _292 + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = 1.0 / _316;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _376 = _292 + _374;
    float _378 = _360 * _330;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = 1.0 / _322;
    float _398 = _376 * _356;
    float _400 = fma(_386, _378, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _402 = fma(_390, _378, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _404 = fma(_382, _398, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _406 = fma(_370, _398, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _408;
    float _412 = 1.0 / _312;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _416 = _292 + _414;
    float _418 = _366 * _372;
    bool _420 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _422 = isnan(_292);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _438 = _292 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = _416 * _396;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _454 = -_430;
    float _456 = _454 + 1.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _462 = fma(_448, _398, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _464 = fma(_452, _378, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _466 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _468 = isnan(_292);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = in.m_53.x;
    float _480 = in.m_53.y;
    float _482 = in.m_53.z;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _488 = fma(_394, _362, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _490 = fma(_410, _362, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _492 = fma(_434, _362, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _494 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _496 = isnan(_292);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = _476 * _456;
    float _508 = -_476;
    float _510 = _508 + 1.0;
    float _512 = _438 * _412;
    float _514 = fma(_442, _444, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _516 = fma(_460, _444, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = fma(_486, _444, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _520;
    bool _524 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _526 = isnan(_292);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = _504 * _510;
    float _538 = -_504;
    float _540 = _538 + 1.0;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _542;
    float _546 = fma(_522, _512, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _548;
    bool _552 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _554 = isnan(_292);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -_534;
    float _566 = _564 + 1.0;
    float _568 = fma(_544, _512, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _570 = fma(_550, _512, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _572 = _534 * _540;
    bool _574 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _576 = isnan(_292);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = _562 * _566;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _592 = -_562;
    float _594 = _592 + 1.0;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    bool _600 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _602 = isnan(_292);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = fma(_590, _418, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _614 = _584 * _594;
    float _616 = fma(_598, _418, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _618 = -_584;
    float _620 = _618 + 1.0;
    float _622 = _598;
    float _624 = _584;
    float _626 = _620;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _630 = _480;
    float _632 = _488;
    int _634 = as_type<int>(_572);
    if (!_326)
    {
        _622 = _478;
    }
    float _636 = _622;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _642 = _636;
    float _644 = _640;
    if (!_326)
    {
        _624 = _480;
    }
    float _646 = _624;
    float _648 = _610 * _620;
    float _650 = _646;
    if (!_326)
    {
        _626 = _636;
    }
    float _652 = _626;
    float _654 = -_610;
    float _656 = _654 + 1.0;
    float _658 = _652;
    if (!_326)
    {
        _628 = _646;
    }
    float _660 = _628;
    float _662 = _490 * _648;
    float _664 = _660;
    if (_326)
    {
        _642 = _478;
    }
    float _666 = _642;
    float _668 = _488 * _648;
    float _670 = _492 * _648;
    if (_326)
    {
        _650 = _480;
    }
    float _672 = _650;
    float _674 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].x, _668);
    if (!_326)
    {
        _630 = _660;
    }
    float _676 = _630;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _680 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].y, _662);
    float _682 = _676;
    if (_326)
    {
        _664 = _666;
    }
    float _684 = _664;
    float _686 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].z, _670);
    if (_326)
    {
        _658 = _482;
    }
    float _688 = _658;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _692 = fma(_640, _418, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _694 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[83].z, _678);
    float _696 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[84].z, _690);
    float _698 = fma(_514, _614, _674);
    if (!_326)
    {
        _644 = _482;
    }
    float _700 = _644;
    float _702 = exp2(_328);
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _706 = _482 * 2.0;
    float _708 = _672 * 2.0;
    float _710 = fma(_518, _614, _686);
    float _712 = _700;
    if (_326)
    {
        _682 = _666;
    }
    float _714 = _682;
    float _716 = floor(_706);
    if (!_326)
    {
        _632 = _700;
    }
    float _718 = _632;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _722 = _718;
    if (_326)
    {
        _712 = _672;
    }
    float _724 = _712;
    float _726 = _714 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _728 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _730 = isnan(1.0);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _736 = _732 || _734;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _740 = 1.0 + _738;
    float _742 = fma(_516, _614, _680);
    float _744 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[83].w, _720);
    if (_326)
    {
        _722 = _672;
    }
    float _746 = _722;
    float _748 = floor(_708);
    float _750 = _666 * 2.0;
    float _752 = _672 + _482;
    float _754 = -_704;
    float _756 = fma(_726, 2.0, _754);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _760 = _746 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _762 = _666 + _482;
    float _764 = 1.0 / _740;
    float _766 = _752 + (-1.0);
    float _768 = fma(_760, -2.0, _758);
    float _770 = _762 + (-1.0);
    float _772 = -_702;
    float _774 = _772 + 1.0;
    float _776 = _666 + _672;
    bool _778 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _780 = isnan(0.0);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _786 = _782 || _784;
    float _788 = floor(_750);
    float _790 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _792 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _794 = _716 >= 0.0;
    bool _796 = isnan(_716);
    bool _798 = _794 || _796;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    float _804 = _776 + (-1.0);
    float _806 = _786 ? _774 : 0.0;
    float _808 = -_118;
    float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[81].x, _756);
    float _812 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _768);
    bool _814 = _716 > 0.0;
    float _816 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _818 = _802 ? 0 : 1;
    float _820 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[84].x, _696);
    bool _822 = _748 > 0.0;
    float _824 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _694);
    float _826 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _744);
    bool _828 = _822;
    float _830 = _810;
    if (_736)
    {
        float _832 = _806 * _764;
        _120 = _832;
    }
    float _834 = _120;
    bool _836 = !_348;
    int _838 = _836 ? 0 : 1;
    float _840 = fma(_462, _586, _742);
    bool _842 = _748 >= 0.0;
    bool _844 = isnan(_748);
    bool _846 = _842 || _844;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    float _852 = fma(_404, _586, _698);
    bool _854 = !_340;
    int _856 = _854 ? 0 : 1;
    float _858 = fma(_406, _586, _710);
    bool _860 = _788 > 0.0;
    float _862 = fma(_400, _572, _852);
    bool _864 = _788 >= 0.0;
    bool _866 = isnan(_788);
    bool _868 = _864 || _866;
    bool _870 = isnan(0.0);
    bool _872 = _868 || _870;
    float _874 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    int _876 = _850 ? 0 : 1;
    float _878 = _482 + (-0.5);
    int _880 = abs(_838);
    float _882 = fma(_464, _572, _840);
    int _884 = ~_876;
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    float _890 = _666 + (-0.5);
    int _892 = _888;
    int _894 = as_type<int>(_890);
    float _896 = _834;
    if (!_822)
    {
        int _898 = ~_876;
        int _900 = _898 + 1;
        _892 = _900;
    }
    int _902 = _892;
    float _904 = _672 + (-0.5);
    float _906 = float(_880);
    float _908 = float(_902);
    int _910 = ~_818;
    int _912 = _910 + 1;
    int _914 = _912 + 1;
    int _916 = _914;
    if (!_814)
    {
        int _918 = ~_818;
        int _920 = _918 + 1;
        _916 = _920;
    }
    int _922 = _916;
    float _924 = _906 * _908;
    int _926 = abs(_856);
    float _928 = _924 * (-2.0);
    int _930 = _872 ? 0 : 1;
    float _932 = float(_926);
    float _934 = fma(_792, _928, _792);
    float _936 = float(_922);
    float _938 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    int _940 = ~_930;
    int _942 = _940 + 1;
    int _944 = _942 + 1;
    float _946 = _878 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    int _948 = _944;
    if (!_860)
    {
        int _950 = ~_930;
        int _952 = _950 + 1;
        _948 = _952;
    }
    int _954 = _948;
    float _956 = _932 * _936;
    float _958 = _350 ? _874 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _960 = fma(_934, _834, _946);
    bool _962 = !_344;
    int _964 = _962 ? 0 : 1;
    float _966 = in.m_51.x;
    float _968 = in.m_51.y;
    float _970 = in.m_51.z;
    float _972 = _350 ? _938 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _974 = _960 * 0.15915493667125701904296875;
    float _976 = abs(_958);
    bool _978 = _976 != 0.0;
    bool _980 = isnan(_976);
    bool _982 = _978 || _980;
    bool _984 = isnan(0.0);
    bool _986 = _982 || _984;
    float _988 = _956 * (-2.0);
    int _990 = abs(_964);
    float _992 = _974 * 6.283185482025146484375;
    float _994 = sin(_992);
    float _996 = abs(_972);
    bool _998 = _996 == 0.0;
    bool _1000 = !_986;
    bool _1002 = _998 && _1000;
    float _1004 = in.m_55.x;
    float _1006 = in.m_55.y;
    float _1008 = in.m_55.z;
    float _1010 = float(_990);
    float _1012 = fma(_816, _988, _816);
    float _1014 = float(_954);
    float _1016 = _890 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1018 = abs(_972);
    bool _1020 = _1018 == 0.0;
    float _1022 = _974 * 6.283185482025146484375;
    float _1024 = cos(_1022);
    float _1026 = _1010 * _1014;
    float _1028 = fma(_1012, _834, _1016);
    float _1030 = _1026 * (-2.0);
    if (_1002)
    {
        bool _1032 = as_type<int>(_972) >= 0;
        _828 = _1032;
    }
    bool _1034 = _828;
    float _1036 = fma(_790, _1030, _790);
    float _1038 = _904 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _1040 = _1034 ? (-1) : 0;
    if (_1002)
    {
        int _1042 = _1034 ? 0 : 1078530011;
        _894 = _1042;
    }
    int _1044 = _894;
    float _1046 = fma(_402, _572, _858);
    float _1048 = _1028 * 0.15915493667125701904296875;
    float _1050 = fma(_1036, _834, _1038);
    if (_1002)
    {
        int _1052 = int(0x80000000) & as_type<int>(_958);
        int _1054 = _1044 | _1052;
        _896 = as_type<float>(_1054);
    }
    float _1056 = _896;
    bool _1058 = !_986;
    bool _1060 = _1058 && _1020;
    float _1062 = _1056;
    float _1064 = _1056;
    if (!_1060)
    {
        float _1066 = abs(_958);
        bool _1068 = _1066 != as_type<float>(0x7f800000u /* inf */);
        bool _1070 = isnan(_1066);
        bool _1072 = _1068 || _1070;
        bool _1074 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1076 = _1072 || _1074;
        float _1078 = abs(_972);
        bool _1080 = _1078 == as_type<float>(0x7f800000u /* inf */);
        float _1082 = abs(_972);
        bool _1084 = _1082 == as_type<float>(0x7f800000u /* inf */);
        bool _1086 = !_1076;
        bool _1088 = _1084 && _1086;
        if (_1088)
        {
            bool _1090 = as_type<int>(_972) >= 0;
            _1040 = _1090 ? (-1) : 0;
        }
        int _1092 = _1040;
        if (_1088)
        {
            _634 = 1075235812;
        }
        int _1094 = _634;
        int _1096 = _1094;
        if (_1088)
        {
            int _1098 = ~_1092;
            int _1100 = (_1098 != 0) ? _1094 : 1061752795;
            _1096 = _1100;
        }
        int _1102 = _1096;
        if (_1088)
        {
            int _1104 = int(0x80000000) & as_type<int>(_958);
            int _1106 = _1102 | _1104;
            _1062 = as_type<float>(_1106);
        }
        float _1108 = _1062;
        bool _1110 = !_1076;
        bool _1112 = _1110 && _1080;
        _1064 = _1108;
        if (!_1112)
        {
            float _1114 = abs(_958);
            float _1116 = abs(_972);
            float _1118 = precise::max(_1114, _1116);
            float _1120 = abs(_958);
            float _1122 = abs(_972);
            float _1124 = precise::min(_1120, _1122);
            float _1126 = 1.0 / _1118;
            float _1128 = abs(_958);
            float _1130 = abs(_972);
            bool _1132 = _1128 > _1130;
            bool _1134 = as_type<int>(_972) >= 0;
            float _1136 = _1124 * _1126;
            float _1138 = abs(_958);
            float _1140 = abs(_972);
            float _1142 = _1138 + _1140;
            int _1144 = as_type<int>(_958) & int(0x80000000);
            float _1146 = _1136 * _1136;
            bool _1148 = _1142 > as_type<float>(0x7f800000u /* inf */);
            bool _1150 = isnan(_1142);
            bool _1152 = _1148 || _1150;
            bool _1154 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1156 = _1152 || _1154;
            float _1158 = _1146 + 11.33538818359375;
            float _1160 = fma(_1146, _1158, 28.84246826171875);
            float _1162 = fma(_1146, _1160, 19.6966705322265625);
            float _1164 = fma(_1146, -0.82336294651031494140625, -5.674867153167724609375);
            float _1166 = fma(_1146, _1164, -6.565555095672607421875);
            float _1168 = 1.0 / _1162;
            float _1170 = _1146 * _1166;
            float _1172 = _1136 * _1170;
            float _1174 = fma(_1172, _1168, _1136);
            float _1176 = _1174;
            _1064 = _1142;
            if (_1132)
            {
                float _1178 = -_1174;
                float _1180 = _1178 + 1.57079637050628662109375;
                _1176 = _1180;
            }
            float _1182 = _1176;
            int _1184 = as_type<int>(_1182);
            if (!_1134)
            {
                float _1186 = -_1182;
                float _1188 = _1186 + 3.1415927410125732421875;
                _1184 = as_type<int>(_1188);
            }
            int _1190 = _1184;
            if (!_1156)
            {
                int _1192 = _1144 | _1190;
                _1064 = as_type<float>(_1192);
            }
        }
    }
    float _1194 = _1064;
    float _1196 = fma(_546, _536, _862);
    float _1198 = _1050 + _1194;
    float _1200 = fma(_568, _536, _882);
    float _1202 = fma(_570, _536, _1046);
    float _1204 = fma(_612, _506, _1196);
    float _1206 = _1198 * 0.15915493667125701904296875;
    float _1208 = fma(_616, _506, _1200);
    float _1210 = fma(_692, _506, _1202);
    float _1212 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1204);
    float _1214 = _1048 * 6.283185482025146484375;
    float _1216 = sin(_1214);
    float _1218 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[149].z, _1210);
    float _1220 = _1212 * _966;
    float _1222 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[149].y, _1208);
    float _1224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1004);
    float _1226 = _1218 * _970;
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1230 = _1222 * _968;
    float _1232 = _1206 * 6.283185482025146484375;
    float _1234 = sin(_1232);
    float _1236 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1238 = _1224 * _1228;
    float _1240 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1242 = _1226 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1006);
    float _1246 = _1230 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1248 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1240);
    float _1250 = _1206 * 6.283185482025146484375;
    float _1252 = cos(_1250);
    float _1254 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1236);
    float _1256 = _1244 * _1246;
    float _1258 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1248);
    float _1260 = _1216 * _1024;
    float _1262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1008);
    float _1264 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1254);
    float _1266 = _1048 * 6.283185482025146484375;
    float _1268 = cos(_1266);
    float _1270 = _1216 * _1234;
    float _1272 = _1262 * _1242;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1276 = _1274 != 0;
    float _1278 = _1234 * _1024;
    float _1280 = _1264 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1282 = _1258 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1284 = in.m_57.x;
    float _1286 = _1216 * _1252;
    float _1288 = _1252 * _1024;
    float _1290 = -_1256;
    float _1292 = _994 * _1290;
    float _1294 = _1260 * _1256;
    float _1296 = in.m_53.w;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1300 = _1298 != 0;
    float _1302 = fma(_1288, _1238, _1292);
    float _1304 = _820 * (-0.15915493667125701904296875);
    float _1306 = _1268 * _1234;
    float _1308 = _1268 * _1252;
    float _1310 = fma(_1278, _1272, _1302);
    float _1312 = _1014;
    float _1314 = _1308;
    if (_1276)
    {
        float _1316 = in.m_53.z;
        _1312 = _1316;
    }
    float _1318 = _1312;
    float _1320 = -_1306;
    float _1322 = fma(_994, _1286, _1320);
    float _1324 = fma(_994, _1270, _1308);
    float _1326 = _1280 + _1310;
    float _1328 = _1268 * _1024;
    float _1330 = fma(_1322, _1238, _1294);
    float _1332 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1336 = _1326 + _1334;
    float _1338 = in.m_57.y;
    float _1340 = fma(_1324, _1272, _1330);
    float _1342 = fma(_994, _1308, _1270);
    float _1344 = _1336 * _1336;
    float _1346 = _1328 * _1256;
    float _1348 = _1282 + _1340;
    float _1350 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1332);
    float _1352 = -_1286;
    float _1354 = fma(_994, _1306, _1352);
    float _1356 = fma(_1342, _1238, _1346);
    float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1360 = _1348 + _1358;
    float _1362 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1350);
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1366 = fma(_1354, _1272, _1356);
    float _1368 = _1360 * _1360;
    float _1370 = _1332;
    float _1372 = _1326;
    float _1374 = _1344;
    if (_1276)
    {
        _1314 = _1284;
    }
    float _1376 = _1314;
    float _1378 = _1362 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1380 = _1318 > 0.5;
    bool _1382 = _1380 && _1276;
    float _1384 = _1344 + _1368;
    bool _1386 = _1296 > 0.5;
    float _1388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1390 = _1378 + _1366;
    float _1392 = _1376;
    if (!_1276)
    {
        _1370 = _1284;
    }
    float _1394 = _1370;
    float _1396 = -_1338;
    float _1398 = _1396 + 1.0;
    float _1400 = sqrt(_1384);
    float _1402 = _1338;
    float _1404 = _1394;
    float _1406 = _1398;
    if (_1382)
    {
        float _1408 = -_1376;
        float _1410 = _1408 + 1.0;
        _1392 = _1410;
    }
    float _1412 = _1392;
    float _1414 = _1412;
    if (_1300)
    {
        float _1416 = _1386 ? _1398 : _1338;
        _1402 = _1416;
    }
    float _1418 = _1402;
    if (_1276)
    {
        _1404 = _1412;
    }
    float _1420 = _1404;
    float _1422 = _1304 * 6.283185482025146484375;
    float _1424 = sin(_1422);
    float _1426 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1428 = _1400 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1430 = _1304 * 6.283185482025146484375;
    float _1432 = cos(_1430);
    if (!_1428)
    {
        _264 = _1326;
    }
    float _1434 = _264;
    float _1436 = _1434;
    if (!_1428)
    {
        _1414 = _1368;
    }
    float _1438 = _1414;
    float _1440 = _1438;
    if (!_1428)
    {
        _1406 = _1348;
    }
    float _1442 = _1406;
    float _1444 = _1442;
    if (!_1428)
    {
        _1372 = _1390;
    }
    float _1446 = _1372;
    bool _1448 = !_1428;
    float _1450 = _1446;
    if (!_1448)
    {
        float _1452 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1456 = _1400 + _1454;
        float _1458 = rsqrt(_1384);
        float _1460 = _1456 * _1452;
        float _1462 = _1390 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1464 = _1460 * 0.15915493667125701904296875;
        float _1466 = _1464 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = _1464 * 6.283185482025146484375;
        float _1472 = cos(_1470);
        float _1474 = fma(_1468, _1462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1476 = _1458 * _1474;
        float _1478 = fma(_1336, _1476, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1480 = _1472 + (-1.0);
        float _1482 = fma(_1360, _1476, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1486 = _1478 + _1484;
        float _1488 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1492 = _1482 + _1490;
        float _1494 = _1486 * _1486;
        float _1496 = fma(_1390, _1472, _1488);
        float _1498 = _1492 * _1492;
        _1450 = _1496;
        _1374 = _1494;
        _1440 = _1498;
        _1444 = _1482;
        _1436 = _1478;
    }
    float _1500 = _1450;
    float _1502 = _1374;
    float _1504 = _1440;
    float _1506 = _1444;
    float _1508 = _1436;
    float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1512 = _1500 + _1510;
    float _1514 = fma(_1426, _1418, -0.5);
    float _1516 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1518 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1520 = fma(_1512, _1512, _1502);
    float _1522 = _1424 * _1514;
    float _1524 = fma(_1516, _1420, -0.5);
    float _1526 = _1432 * _1514;
    float _1528 = _1520 + _1504;
    float _1530 = -_1522;
    float _1532 = fma(_1432, _1524, _1530);
    float _1534 = fma(_1424, _1524, _1526);
    float _1536 = sqrt(_1528);
    float _1538 = fma(_824, _1532, _810);
    float _1540 = -_812;
    float _1542 = fma(_826, _1534, _1540);
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1546 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1548 = _1538 + 0.5;
    float _1550 = _1542 + 0.5;
    out.m_59.w = _1544;
    float _1552 = -_1546;
    float _1554 = _994 * _1552;
    float _1556 = _1328 * _1546;
    float _1558 = _1260 * _1546;
    out.m_61.z = _1548;
    out.m_61.w = _1550;
    float _1560 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1562 = fma(_1288, _1518, _1554);
    float _1564 = fma(_1342, _1518, _1556);
    bool _1566 = _1536 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1568 = isnan(_1536);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1574 = _1570 || _1572;
    float _1576 = fma(_1322, _1518, _1558);
    float _1578 = fma(_1278, _1560, _1562);
    float _1580 = fma(_1354, _1560, _1564);
    float _1582 = fma(_1324, _1560, _1576);
    float _1584 = _1518;
    float _1586 = _1562;
    if (!_1574)
    {
        _1584 = 1.0;
    }
    float _1588 = _1584;
    bool _1590 = !_1574;
    float _1592 = _1588;
    if (!_1590)
    {
        bool _1594 = _1536 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1596 = isnan(_1536);
        bool _1598 = _1594 || _1596;
        bool _1600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1602 = _1598 || _1600;
        if (!_1602)
        {
            float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1606 = _1536 + _1604;
            float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1610 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1608;
            float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1614 = _1612 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1616 = 1.0 / _1610;
            float _1618 = _1606 * _1616;
            float _1620 = fma(_1618, _1614, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1592 = _1620;
            _1622 = true;
        }
        else
        {
            bool _1624 = _1536 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1626 = isnan(_1536);
            bool _1628 = _1624 || _1626;
            bool _1630 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1632 = _1628 || _1630;
            if (!_1632)
            {
                float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1636 = _1536 + _1634;
                float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1640 = _1638 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1644 = _1642 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1646 = 1.0 / _1640;
                float _1648 = _1636 * _1646;
                float _1650 = fma(_1648, _1644, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1592 = _1650;
                _1622 = true;
            }
            else
            {
                _1592 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1622 = false;
    float _1652 = _1592;
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1656 = _1500 + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1660 = _1506 + _1658;
    bool _1662 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan(0.5);
    bool _1670 = _1666 || _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1674 = _1508 + _1672;
    float _1676 = fma(_1656, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1678 = fma(_1660, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1680 = fma(_1674, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1682 = _1674;
    float _1684 = _1656;
    float _1686 = _1652;
    float _1688 = _1680;
    if (_1670)
    {
        _1682 = _1680;
    }
    float _1690 = _1682;
    float _1692 = _1690;
    if (_1670)
    {
        _1684 = _1676;
    }
    float _1694 = _1684;
    float _1696 = _1694;
    if (_1670)
    {
        _1686 = _1678;
    }
    float _1698 = _1686;
    float _1700 = _1698;
    if (!_1670)
    {
        float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1704 = _1378 + _1702;
        float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1708 = _1280 + _1706;
        float _1710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1712 = -_1280;
        float _1714 = _1712 + _1680;
        float _1716 = _1704 * _1704;
        float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1720 = _1282 + _1718;
        float _1722 = -_1378;
        float _1724 = _1722 + _1676;
        float _1726 = -_1282;
        float _1728 = _1726 + _1678;
        float _1730 = fma(_1708, _1708, _1716);
        float _1732 = fma(_1720, _1720, _1730);
        float _1734 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1736 = sqrt(_1732);
        float _1738 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1740 = _1736 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1742 = isnan(_1736);
        bool _1744 = _1740 || _1742;
        bool _1746 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1748 = _1744 || _1746;
        float _1750 = precise::min(_1736, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1752 = _1750 * _1710;
        float _1754 = _1738 * _1752;
        float _1756 = _1288;
        float _1758 = _1750;
        float _1760 = _1736;
        float _1762 = _1738;
        _1688 = _1714;
        if (_1748)
        {
            float _1764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1756 = _1764;
        }
        float _1766 = _1756;
        if (_1748)
        {
            float _1768 = precise::max(_1736, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1758 = _1768;
        }
        float _1770 = _1758;
        float _1772 = fma(_1724, _1754, _1378);
        float _1774 = _1766;
        if (_1748)
        {
            float _1776 = _1770 * _1766;
            _1760 = _1776;
        }
        float _1778 = _1760;
        float _1780 = fma(_1714, _1754, _1280);
        float _1782 = fma(_1728, _1754, _1282);
        float _1784 = _1780;
        float _1786 = _1778;
        if (_1748)
        {
            float _1788 = _1738 * _1778;
            _1774 = _1788;
        }
        float _1790 = _1774;
        if (!_1748)
        {
            _1762 = _1780;
        }
        float _1792 = _1762;
        float _1794 = _1792;
        if (!_1748)
        {
            _1784 = _1772;
        }
        float _1796 = _1784;
        float _1798 = _1796;
        if (_1748)
        {
            float _1800 = fma(_1714, _1790, _1280);
            _1794 = _1800;
        }
        float _1802 = _1794;
        _1692 = _1802;
        if (!_1748)
        {
            _1786 = _1782;
        }
        float _1804 = _1786;
        _1700 = _1804;
        if (_1748)
        {
            float _1806 = fma(_1724, _1790, _1378);
            _1798 = _1806;
        }
        float _1808 = _1798;
        _1696 = _1808;
        if (_1748)
        {
            float _1810 = fma(_1728, _1790, _1282);
            _1700 = _1810;
        }
    }
    float _1812 = _1696;
    float _1814 = _1692;
    float _1816 = _1700;
    float _1818 = _1688;
    float _1820 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1822 = _1812 + _1820;
    float _1824 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1826 = _1814 + _1824;
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1830 = _1816 + _1828;
    float _1832 = _1822 * _1822;
    float _1834 = fma(_1826, _1826, _1832);
    float _1836 = fma(_1830, _1830, _1834);
    float _1838 = rsqrt(_1836);
    float _1840 = sqrt(_1836);
    float _1842 = _1826 * _1838;
    float _1844 = _1830 * _1838;
    float _1846 = _1822 * _1838;
    float _1848 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1850 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1852 = _1848 * _1848;
    float _1854 = _1850 * _1850;
    float _1856 = _1852 + _1854;
    float _1858 = sqrt(_1856);
    bool _1860 = _1858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1864 = _1858 + _1862;
    float _1866 = _1576;
    float _1868 = _1856;
    float _1870 = _1864;
    float _1872 = _1838;
    if (_1860)
    {
        float _1874 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1866 = _1874;
    }
    float _1876 = _1866;
    if (_1860)
    {
        float _1878 = rsqrt(_1856);
        _1868 = _1878;
    }
    float _1880 = _1868;
    float _1882 = _1880;
    if (_1860)
    {
        float _1884 = _1864 * _1876;
        _1870 = _1884;
    }
    float _1886 = _1870;
    if (_1860)
    {
        float _1888 = _1886 * 0.15915493667125701904296875;
        _1586 = _1888;
    }
    float _1890 = _1586;
    float _1892 = _1876;
    float _1894 = _1890;
    if (_1860)
    {
        float _1896 = _1890 * 6.283185482025146484375;
        float _1898 = sin(_1896);
        _1892 = _1898;
    }
    float _1900 = _1892;
    float _1902 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1904 = precise::max(0.0, _1902);
    float _1906 = _1818;
    float _1908 = _1904;
    if (_1860)
    {
        float _1910 = _1890 * 6.283185482025146484375;
        float _1912 = cos(_1910);
        _1906 = _1912;
    }
    float _1914 = _1906;
    float _1916 = -_1846;
    float _1918 = -_1904;
    float _1920 = fma(_1916, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1918);
    if (_1860)
    {
        float _1922 = _1920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1872 = _1922;
    }
    float _1924 = _1872;
    float _1926 = _1900;
    float _1928 = _1924;
    if (_1860)
    {
        float _1930 = fma(_1900, _1924, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1908 = _1930;
    }
    float _1932 = _1908;
    float _1934 = _1932;
    if (!_1860)
    {
        _1926 = _1848;
    }
    float _1936 = _1926;
    float _1938 = _1936;
    float _1940 = _1914;
    if (_1860)
    {
        float _1942 = _1914 + (-1.0);
        _1928 = _1942;
    }
    float _1944 = _1928;
    float _1946 = _1944;
    if (_1860)
    {
        float _1948 = _1880 * _1932;
        _830 = _1948;
    }
    float _1950 = _830;
    if (!_1860)
    {
        _1934 = _1920;
    }
    float _1952 = _1934;
    float _1954 = _1952;
    if (_1860)
    {
        float _1956 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1894 = _1956;
    }
    float _1958 = _1894;
    if (_1860)
    {
        float _1960 = _1848 * _1950;
        _1938 = _1960;
    }
    float _1962 = _1938;
    if (!_1860)
    {
        _1946 = _1850;
    }
    float _1964 = _1946;
    float _1966 = _1964;
    if (_1860)
    {
        float _1968 = _1850 * _1950;
        _1966 = _1968;
    }
    float _1970 = _1966;
    if (!_1860)
    {
        _1882 = _1852;
    }
    float _1972 = _1882;
    float _1974 = _1972;
    if (_1860)
    {
        float _1976 = fma(_1920, _1914, _1958);
        _1954 = _1976;
    }
    float _1978 = _1954;
    if (_1860)
    {
        float _1980 = _1962 * _1962;
        _1974 = _1980;
    }
    float _1982 = _1974;
    if (!_1860)
    {
        _1940 = _1854;
    }
    float _1984 = _1940;
    float _1986 = _1984;
    if (_1860)
    {
        float _1988 = _1970 * _1970;
        _1986 = _1988;
    }
    float _1990 = _1986;
    float _1992 = fma(_1978, _1978, _1982);
    float _1994 = _1992 + _1990;
    float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1998 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1996);
    float _2000 = precise::clamp(_1998, 0.0, 1.0);
    float _2002 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2004 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2006 = rsqrt(_1994);
    float _2008 = -_2000;
    float _2010 = _2008 + 1.0;
    float _2012 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2002);
    float _2014 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2016 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2004);
    float _2018 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2020 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2012);
    float _2022 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2014);
    float _2024 = abs(_2010);
    float _2026 = log2(_2024);
    float _2028 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2016);
    float _2030 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2018);
    float _2032 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2022);
    float _2034 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2036 = _2028 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2038 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2030);
    float _2040 = _2032 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2042 = _2006 * _1962;
    float _2044 = _2006 * _1978;
    float _2046 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2048 = _2006 * _1970;
    float _2050 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2052 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2054 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2046);
    float _2056 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2058 = -_2050;
    float _2060 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2058);
    float _2062 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2064 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2066 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2054);
    float _2068 = -_2048;
    float _2070 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2060);
    float _2072 = -_2056;
    float _2074 = fma(_2072, _2052, 1.0);
    float _2076 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2078 = exp2(_2062);
    float _2080 = fma(_2070, -0.5, 0.5);
    float _2082 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2066);
    float _2084 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2086 = fma(_2070, 0.5, 0.5);
    float _2088 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2076);
    float _2090 = _2044 + 1.0;
    float _2092 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2084);
    float _2094 = log2(_2074);
    float _2096 = fma(_2086, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2098 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2088);
    float _2100 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2092);
    float _2102 = fma(_2086, _2096, -0.212114393711090087890625);
    float _2104 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2098);
    float _2106 = 1.0 / _2082;
    float _2108 = -_2044;
    float _2110 = fma(_2078, _2090, _2108);
    float _2112 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2100);
    float _2114 = fma(_2086, _2102, 1.570728778839111328125);
    float _2116 = sqrt(_2080);
    float _2118 = _2094 * 0.693147182464599609375;
    float _2120 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2122 = fma(_2110, 0.5, 0.5);
    float _2124 = _2104 * _2106;
    float _2126 = _2112 * _2106;
    float _2128 = fma(_2124, 0.5, 0.5);
    float _2130 = fma(_2126, -0.5, 0.5);
    float _2132 = _2116 * 0.636619746685028076171875;
    float _2134 = -_2114;
    float _2136 = fma(_2132, _2134, 1.0);
    float3 _5637 = float3(_2128, _2130, _2120);
    float _2138 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5637, float3(0.0), isnan(_5637)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5637, float3(0.0), isnan(_5637)), level(0.0)).x;
    float3 _5648 = float3(_2128, _2130, _2120);
    float4 _2141 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5648, float3(0.0), isnan(_5648)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5648, float3(0.0), isnan(_5648)), level(0.0)).xyzw;
    float _2143 = _2141.x;
    float _2145 = _2141.y;
    float _2147 = _2141.z;
    float _2149 = _2141.w;
    float2 _5665 = float2(_2136, _2122);
    float3 _2153 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5665, float2(0.0), isnan(_5665)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5665, float2(0.0), isnan(_5665)), level(0.0)).xyz;
    float _2155 = _2153.x;
    float _2157 = _2153.y;
    float _2159 = _2153.z;
    float _2161 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2163 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2165 = _1580 * _1846;
    float _2167 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2161);
    float _2169 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2169;
    float _2173 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2163);
    float _2175 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2167);
    float _2177 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2179 = fma(_1578, _1842, _2165);
    bool _2181 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2183 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2185 = _2181 || _2183;
    bool _2187 = isnan(0.5);
    bool _2189 = _2185 || _2187;
    float _2191 = 1.0 / _2171;
    float _2193 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2195 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2173);
    float _2197 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2199 = fma(_1582, _1844, _2179);
    float _2201 = _2195 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2203 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2197);
    float _2205 = 1.0 / _2193;
    float _2207 = abs(_2199);
    float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2211 = _2207 + _2209;
    float _2213 = _2201 + _2193;
    float _2215 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2203);
    float _2217 = _2199;
    if (_2189)
    {
        _2217 = 1.0;
    }
    float _2219 = _2217;
    float _2221 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2215);
    float _2223 = exp2(_2177);
    float _2225 = _2211 * _2191;
    float _2227 = precise::clamp(_2225, 0.0, 1.0);
    float _2229 = fma(_2227, -2.0, 3.0);
    float _2231 = _2227 * _2227;
    float _2233 = _2213 * _2205;
    float _2235 = _2233 * 0.5;
    float _2237 = _2219;
    if (!_2189)
    {
        float _2239 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2241 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2243 = fma(_2235, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2241);
        float _2245 = _2239 * 0.15915493667125701904296875;
        float _2247 = _2245 * 6.283185482025146484375;
        float _2249 = cos(_2247);
        float _2251 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2253 = _2251 * 0.15915493667125701904296875;
        float _2255 = _2245 * 6.283185482025146484375;
        float _2257 = sin(_2255);
        float _2259 = 1.0 / _2249;
        float _2261 = _2253 * 6.283185482025146484375;
        float _2263 = cos(_2261);
        float _2265 = _2257 * _2259;
        float _2267 = 1.0 / _2243;
        float _2269 = _2263 * _2265;
        float _2271 = _2253 * 6.283185482025146484375;
        float _2273 = sin(_2271);
        float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2277 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2275;
        float _2279 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2281 = _2267 * _2279;
        float _2283 = 1.0 / _2269;
        float _2285 = 1.0 / _2277;
        float _2287 = _2273 * _2283;
        float _2289 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2291 = fma(_2287, _2281, _2289);
        float _2293 = _2291 * _2285;
        float _2295 = precise::clamp(_2293, 0.0, 1.0);
        _2237 = _2295;
    }
    float _2297 = _2237;
    float _2299 = _2231 * _2229;
    float _2301 = _2082 * 0.5;
    float _2303 = -_2223;
    float _2305 = _2303 + 1.0;
    bool _2307 = _2297 > 0.0;
    bool _2309 = isnan(_2297);
    bool _2311 = _2307 || _2309;
    bool _2313 = isnan(0.0);
    bool _2315 = _2311 || _2313;
    float _2317 = _2299 * _2297;
    float _2319 = fma(_2112, -0.5, _2301);
    float _2321 = _2221 + _2082;
    float _2323 = _2104 + _2082;
    float _2325 = _2317 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2327 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2104;
    out.gl_Position.y = _2112;
    out.gl_Position.z = _2221;
    out.gl_Position.w = _2082;
    float _2329 = _2321 * 0.5;
    float _2331 = _2327 * _2138;
    float _2333 = -_2327;
    float _2335 = _2333 + 1.0;
    float _2337 = _2323 * 0.5;
    float _2339 = _2325 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2341 = _2149 * _2331;
    float _2343 = _2159 * _2331;
    float _2345 = _2149 * _2335;
    out.m_63.x = _2337;
    out.m_63.y = _2319;
    out.m_63.z = _2329;
    out.m_63.w = _2082;
    float _2347 = fma(_2155, _2341, _2143);
    float _2349 = fma(_2157, _2341, _2145);
    float _2351 = fma(_2149, _2343, _2147);
    out.m_47.x = _2339;
    out.m_65.x = _2347;
    out.m_65.y = _2349;
    out.m_65.z = _2351;
    out.m_65.w = _2345;
    if (_2315)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2353 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2353;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1622 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_44.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_47.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2410 = as_type<float>(_100);
        out.gl_Position.z = _2410;
    }
    if (!_88)
    {
        return out;
    }
    float _104 = in.m_49.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = _118;
    if (_114)
    {
        float _122 = float(_84);
        _94 = _122;
    }
    float _124 = _94;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_47.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _102 = as_type<int>(_136);
    }
    int _138 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2480 = as_type<float>(_138);
        out.gl_Position.z = _2480;
    }
    if (_130)
    {
        return out;
    }
    float _140 = in.m_51.w;
    float _142 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_49.x;
    float _156 = in.m_49.y;
    float _158 = in.m_49.z;
    float _160 = in.m_44.x;
    float _162 = in.m_44.y;
    float _164 = in.m_44.z;
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
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _264 = _260;
    float _282;
    if (!_262)
    {
        float _266 = in.m_53.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_84);
        float _288 = 1.0 / _286;
        float _290 = _118 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _296 = log2(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _318 = 1.0 / _300;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _326 = _324 != 0;
    float _328 = _296 * _118;
    float _330 = 1.0 / _308;
    float _332 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _334 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _336 = precise::max(_332, _334);
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _340 = _338 != 0;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _344 = _342 != 0;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _348 = _346 != 0;
    bool _350 = _336 >= 16.0;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _354 = _292 + _352;
    float _356 = 1.0 / _304;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _360 = _292 + _358;
    float _362 = _354 * _318;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _366 = _292 + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = 1.0 / _316;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _376 = _292 + _374;
    float _378 = _360 * _330;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = 1.0 / _322;
    float _398 = _376 * _356;
    float _400 = fma(_386, _378, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _402 = fma(_390, _378, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _404 = fma(_382, _398, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _406 = fma(_370, _398, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _408;
    float _412 = 1.0 / _312;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _416 = _292 + _414;
    float _418 = _366 * _372;
    bool _420 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _422 = isnan(_292);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _438 = _292 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = _416 * _396;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _454 = -_430;
    float _456 = _454 + 1.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _462 = fma(_448, _398, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _464 = fma(_452, _378, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _466 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _468 = isnan(_292);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = in.m_53.x;
    float _480 = in.m_53.y;
    float _482 = in.m_53.z;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _488 = fma(_394, _362, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _490 = fma(_410, _362, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _492 = fma(_434, _362, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _494 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _496 = isnan(_292);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = _476 * _456;
    float _508 = -_476;
    float _510 = _508 + 1.0;
    float _512 = _438 * _412;
    float _514 = fma(_442, _444, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _516 = fma(_460, _444, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = fma(_486, _444, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _520;
    bool _524 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _526 = isnan(_292);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = _504 * _510;
    float _538 = -_504;
    float _540 = _538 + 1.0;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _542;
    float _546 = fma(_522, _512, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _548;
    bool _552 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _554 = isnan(_292);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -_534;
    float _566 = _564 + 1.0;
    float _568 = fma(_544, _512, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _570 = fma(_550, _512, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _572 = _534 * _540;
    bool _574 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _576 = isnan(_292);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = _562 * _566;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _592 = -_562;
    float _594 = _592 + 1.0;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    bool _600 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _602 = isnan(_292);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = fma(_590, _418, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _614 = _584 * _594;
    float _616 = fma(_598, _418, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _618 = -_584;
    float _620 = _618 + 1.0;
    float _622 = _598;
    float _624 = _584;
    float _626 = _620;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _630 = _480;
    float _632 = _488;
    int _634 = as_type<int>(_572);
    if (!_326)
    {
        _622 = _478;
    }
    float _636 = _622;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _642 = _636;
    float _644 = _640;
    if (!_326)
    {
        _624 = _480;
    }
    float _646 = _624;
    float _648 = _610 * _620;
    float _650 = _646;
    if (!_326)
    {
        _626 = _636;
    }
    float _652 = _626;
    float _654 = -_610;
    float _656 = _654 + 1.0;
    float _658 = _652;
    if (!_326)
    {
        _628 = _646;
    }
    float _660 = _628;
    float _662 = _490 * _648;
    float _664 = _660;
    if (_326)
    {
        _642 = _478;
    }
    float _666 = _642;
    float _668 = _488 * _648;
    float _670 = _492 * _648;
    if (_326)
    {
        _650 = _480;
    }
    float _672 = _650;
    float _674 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].x, _668);
    if (!_326)
    {
        _630 = _660;
    }
    float _676 = _630;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _680 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].y, _662);
    float _682 = _676;
    if (_326)
    {
        _664 = _666;
    }
    float _684 = _664;
    float _686 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].z, _670);
    if (_326)
    {
        _658 = _482;
    }
    float _688 = _658;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _692 = fma(_640, _418, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _694 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[83].z, _678);
    float _696 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[84].z, _690);
    float _698 = fma(_514, _614, _674);
    if (!_326)
    {
        _644 = _482;
    }
    float _700 = _644;
    float _702 = exp2(_328);
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _706 = _482 * 2.0;
    float _708 = _672 * 2.0;
    float _710 = fma(_518, _614, _686);
    float _712 = _700;
    if (_326)
    {
        _682 = _666;
    }
    float _714 = _682;
    float _716 = floor(_706);
    if (!_326)
    {
        _632 = _700;
    }
    float _718 = _632;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _722 = _718;
    if (_326)
    {
        _712 = _672;
    }
    float _724 = _712;
    float _726 = _714 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _728 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _730 = isnan(1.0);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _736 = _732 || _734;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _740 = 1.0 + _738;
    float _742 = fma(_516, _614, _680);
    float _744 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[83].w, _720);
    if (_326)
    {
        _722 = _672;
    }
    float _746 = _722;
    float _748 = floor(_708);
    float _750 = _666 * 2.0;
    float _752 = _672 + _482;
    float _754 = -_704;
    float _756 = fma(_726, 2.0, _754);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _760 = _746 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _762 = _666 + _482;
    float _764 = 1.0 / _740;
    float _766 = _752 + (-1.0);
    float _768 = fma(_760, -2.0, _758);
    float _770 = _762 + (-1.0);
    float _772 = -_702;
    float _774 = _772 + 1.0;
    float _776 = _666 + _672;
    bool _778 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _780 = isnan(0.0);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _786 = _782 || _784;
    float _788 = floor(_750);
    float _790 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _792 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _794 = _716 >= 0.0;
    bool _796 = isnan(_716);
    bool _798 = _794 || _796;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    float _804 = _776 + (-1.0);
    float _806 = _786 ? _774 : 0.0;
    float _808 = -_118;
    float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[81].x, _756);
    float _812 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _768);
    bool _814 = _716 > 0.0;
    float _816 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _818 = _802 ? 0 : 1;
    float _820 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[84].x, _696);
    bool _822 = _748 > 0.0;
    float _824 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _694);
    float _826 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _744);
    bool _828 = _822;
    float _830 = _810;
    if (_736)
    {
        float _832 = _806 * _764;
        _120 = _832;
    }
    float _834 = _120;
    bool _836 = !_348;
    int _838 = _836 ? 0 : 1;
    float _840 = fma(_462, _586, _742);
    bool _842 = _748 >= 0.0;
    bool _844 = isnan(_748);
    bool _846 = _842 || _844;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    float _852 = fma(_404, _586, _698);
    bool _854 = !_340;
    int _856 = _854 ? 0 : 1;
    float _858 = fma(_406, _586, _710);
    bool _860 = _788 > 0.0;
    float _862 = fma(_400, _572, _852);
    bool _864 = _788 >= 0.0;
    bool _866 = isnan(_788);
    bool _868 = _864 || _866;
    bool _870 = isnan(0.0);
    bool _872 = _868 || _870;
    float _874 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    int _876 = _850 ? 0 : 1;
    float _878 = _482 + (-0.5);
    int _880 = abs(_838);
    float _882 = fma(_464, _572, _840);
    int _884 = ~_876;
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    float _890 = _666 + (-0.5);
    int _892 = _888;
    int _894 = as_type<int>(_890);
    float _896 = _834;
    if (!_822)
    {
        int _898 = ~_876;
        int _900 = _898 + 1;
        _892 = _900;
    }
    int _902 = _892;
    float _904 = _672 + (-0.5);
    float _906 = float(_880);
    float _908 = float(_902);
    int _910 = ~_818;
    int _912 = _910 + 1;
    int _914 = _912 + 1;
    int _916 = _914;
    if (!_814)
    {
        int _918 = ~_818;
        int _920 = _918 + 1;
        _916 = _920;
    }
    int _922 = _916;
    float _924 = _906 * _908;
    int _926 = abs(_856);
    float _928 = _924 * (-2.0);
    int _930 = _872 ? 0 : 1;
    float _932 = float(_926);
    float _934 = fma(_792, _928, _792);
    float _936 = float(_922);
    float _938 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    int _940 = ~_930;
    int _942 = _940 + 1;
    int _944 = _942 + 1;
    float _946 = _878 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    int _948 = _944;
    if (!_860)
    {
        int _950 = ~_930;
        int _952 = _950 + 1;
        _948 = _952;
    }
    int _954 = _948;
    float _956 = _932 * _936;
    float _958 = _350 ? _874 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _960 = fma(_934, _834, _946);
    bool _962 = !_344;
    int _964 = _962 ? 0 : 1;
    float _966 = in.m_51.x;
    float _968 = in.m_51.y;
    float _970 = in.m_51.z;
    float _972 = _350 ? _938 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _974 = _960 * 0.15915493667125701904296875;
    float _976 = abs(_958);
    bool _978 = _976 != 0.0;
    bool _980 = isnan(_976);
    bool _982 = _978 || _980;
    bool _984 = isnan(0.0);
    bool _986 = _982 || _984;
    float _988 = _956 * (-2.0);
    int _990 = abs(_964);
    float _992 = _974 * 6.283185482025146484375;
    float _994 = sin(_992);
    float _996 = abs(_972);
    bool _998 = _996 == 0.0;
    bool _1000 = !_986;
    bool _1002 = _998 && _1000;
    float _1004 = in.m_55.x;
    float _1006 = in.m_55.y;
    float _1008 = in.m_55.z;
    float _1010 = float(_990);
    float _1012 = fma(_816, _988, _816);
    float _1014 = float(_954);
    float _1016 = _890 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1018 = abs(_972);
    bool _1020 = _1018 == 0.0;
    float _1022 = _974 * 6.283185482025146484375;
    float _1024 = cos(_1022);
    float _1026 = _1010 * _1014;
    float _1028 = fma(_1012, _834, _1016);
    float _1030 = _1026 * (-2.0);
    if (_1002)
    {
        bool _1032 = as_type<int>(_972) >= 0;
        _828 = _1032;
    }
    bool _1034 = _828;
    float _1036 = fma(_790, _1030, _790);
    float _1038 = _904 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _1040 = _1034 ? (-1) : 0;
    if (_1002)
    {
        int _1042 = _1034 ? 0 : 1078530011;
        _894 = _1042;
    }
    int _1044 = _894;
    float _1046 = fma(_402, _572, _858);
    float _1048 = _1028 * 0.15915493667125701904296875;
    float _1050 = fma(_1036, _834, _1038);
    if (_1002)
    {
        int _1052 = int(0x80000000) & as_type<int>(_958);
        int _1054 = _1044 | _1052;
        _896 = as_type<float>(_1054);
    }
    float _1056 = _896;
    bool _1058 = !_986;
    bool _1060 = _1058 && _1020;
    float _1062 = _1056;
    float _1064 = _1056;
    if (!_1060)
    {
        float _1066 = abs(_958);
        bool _1068 = _1066 != as_type<float>(0x7f800000u /* inf */);
        bool _1070 = isnan(_1066);
        bool _1072 = _1068 || _1070;
        bool _1074 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1076 = _1072 || _1074;
        float _1078 = abs(_972);
        bool _1080 = _1078 == as_type<float>(0x7f800000u /* inf */);
        float _1082 = abs(_972);
        bool _1084 = _1082 == as_type<float>(0x7f800000u /* inf */);
        bool _1086 = !_1076;
        bool _1088 = _1084 && _1086;
        if (_1088)
        {
            bool _1090 = as_type<int>(_972) >= 0;
            _1040 = _1090 ? (-1) : 0;
        }
        int _1092 = _1040;
        if (_1088)
        {
            _634 = 1075235812;
        }
        int _1094 = _634;
        int _1096 = _1094;
        if (_1088)
        {
            int _1098 = ~_1092;
            int _1100 = (_1098 != 0) ? _1094 : 1061752795;
            _1096 = _1100;
        }
        int _1102 = _1096;
        if (_1088)
        {
            int _1104 = int(0x80000000) & as_type<int>(_958);
            int _1106 = _1102 | _1104;
            _1062 = as_type<float>(_1106);
        }
        float _1108 = _1062;
        bool _1110 = !_1076;
        bool _1112 = _1110 && _1080;
        _1064 = _1108;
        if (!_1112)
        {
            float _1114 = abs(_958);
            float _1116 = abs(_972);
            float _1118 = precise::max(_1114, _1116);
            float _1120 = abs(_958);
            float _1122 = abs(_972);
            float _1124 = precise::min(_1120, _1122);
            float _1126 = 1.0 / _1118;
            float _1128 = abs(_958);
            float _1130 = abs(_972);
            bool _1132 = _1128 > _1130;
            bool _1134 = as_type<int>(_972) >= 0;
            float _1136 = _1124 * _1126;
            float _1138 = abs(_958);
            float _1140 = abs(_972);
            float _1142 = _1138 + _1140;
            int _1144 = as_type<int>(_958) & int(0x80000000);
            float _1146 = _1136 * _1136;
            bool _1148 = _1142 > as_type<float>(0x7f800000u /* inf */);
            bool _1150 = isnan(_1142);
            bool _1152 = _1148 || _1150;
            bool _1154 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1156 = _1152 || _1154;
            float _1158 = _1146 + 11.33538818359375;
            float _1160 = fma(_1146, _1158, 28.84246826171875);
            float _1162 = fma(_1146, _1160, 19.6966705322265625);
            float _1164 = fma(_1146, -0.82336294651031494140625, -5.674867153167724609375);
            float _1166 = fma(_1146, _1164, -6.565555095672607421875);
            float _1168 = 1.0 / _1162;
            float _1170 = _1146 * _1166;
            float _1172 = _1136 * _1170;
            float _1174 = fma(_1172, _1168, _1136);
            float _1176 = _1174;
            _1064 = _1142;
            if (_1132)
            {
                float _1178 = -_1174;
                float _1180 = _1178 + 1.57079637050628662109375;
                _1176 = _1180;
            }
            float _1182 = _1176;
            int _1184 = as_type<int>(_1182);
            if (!_1134)
            {
                float _1186 = -_1182;
                float _1188 = _1186 + 3.1415927410125732421875;
                _1184 = as_type<int>(_1188);
            }
            int _1190 = _1184;
            if (!_1156)
            {
                int _1192 = _1144 | _1190;
                _1064 = as_type<float>(_1192);
            }
        }
    }
    float _1194 = _1064;
    float _1196 = fma(_546, _536, _862);
    float _1198 = _1050 + _1194;
    float _1200 = fma(_568, _536, _882);
    float _1202 = fma(_570, _536, _1046);
    float _1204 = fma(_612, _506, _1196);
    float _1206 = _1198 * 0.15915493667125701904296875;
    float _1208 = fma(_616, _506, _1200);
    float _1210 = fma(_692, _506, _1202);
    float _1212 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1204);
    float _1214 = _1048 * 6.283185482025146484375;
    float _1216 = sin(_1214);
    float _1218 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[149].z, _1210);
    float _1220 = _1212 * _966;
    float _1222 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[149].y, _1208);
    float _1224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1004);
    float _1226 = _1218 * _970;
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1230 = _1222 * _968;
    float _1232 = _1206 * 6.283185482025146484375;
    float _1234 = sin(_1232);
    float _1236 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1238 = _1224 * _1228;
    float _1240 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1242 = _1226 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1006);
    float _1246 = _1230 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1248 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1240);
    float _1250 = _1206 * 6.283185482025146484375;
    float _1252 = cos(_1250);
    float _1254 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1236);
    float _1256 = _1244 * _1246;
    float _1258 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1248);
    float _1260 = _1216 * _1024;
    float _1262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1008);
    float _1264 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1254);
    float _1266 = _1048 * 6.283185482025146484375;
    float _1268 = cos(_1266);
    float _1270 = _1216 * _1234;
    float _1272 = _1262 * _1242;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1276 = _1274 != 0;
    float _1278 = _1234 * _1024;
    float _1280 = _1264 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1282 = _1258 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1284 = in.m_57.x;
    float _1286 = _1216 * _1252;
    float _1288 = _1252 * _1024;
    float _1290 = -_1256;
    float _1292 = _994 * _1290;
    float _1294 = _1260 * _1256;
    float _1296 = in.m_53.w;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1300 = _1298 != 0;
    float _1302 = fma(_1288, _1238, _1292);
    float _1304 = _820 * (-0.15915493667125701904296875);
    float _1306 = _1268 * _1234;
    float _1308 = _1268 * _1252;
    float _1310 = fma(_1278, _1272, _1302);
    float _1312 = _1014;
    float _1314 = _1308;
    if (_1276)
    {
        float _1316 = in.m_53.z;
        _1312 = _1316;
    }
    float _1318 = _1312;
    float _1320 = -_1306;
    float _1322 = fma(_994, _1286, _1320);
    float _1324 = fma(_994, _1270, _1308);
    float _1326 = _1280 + _1310;
    float _1328 = _1268 * _1024;
    float _1330 = fma(_1322, _1238, _1294);
    float _1332 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1336 = _1326 + _1334;
    float _1338 = in.m_57.y;
    float _1340 = fma(_1324, _1272, _1330);
    float _1342 = fma(_994, _1308, _1270);
    float _1344 = _1336 * _1336;
    float _1346 = _1328 * _1256;
    float _1348 = _1282 + _1340;
    float _1350 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1332);
    float _1352 = -_1286;
    float _1354 = fma(_994, _1306, _1352);
    float _1356 = fma(_1342, _1238, _1346);
    float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1360 = _1348 + _1358;
    float _1362 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1350);
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1366 = fma(_1354, _1272, _1356);
    float _1368 = _1360 * _1360;
    float _1370 = _1332;
    float _1372 = _1326;
    float _1374 = _1344;
    if (_1276)
    {
        _1314 = _1284;
    }
    float _1376 = _1314;
    float _1378 = _1362 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1380 = _1318 > 0.5;
    bool _1382 = _1380 && _1276;
    float _1384 = _1344 + _1368;
    bool _1386 = _1296 > 0.5;
    float _1388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1390 = _1378 + _1366;
    float _1392 = _1376;
    if (!_1276)
    {
        _1370 = _1284;
    }
    float _1394 = _1370;
    float _1396 = -_1338;
    float _1398 = _1396 + 1.0;
    float _1400 = sqrt(_1384);
    float _1402 = _1338;
    float _1404 = _1394;
    float _1406 = _1398;
    if (_1382)
    {
        float _1408 = -_1376;
        float _1410 = _1408 + 1.0;
        _1392 = _1410;
    }
    float _1412 = _1392;
    float _1414 = _1412;
    if (_1300)
    {
        float _1416 = _1386 ? _1398 : _1338;
        _1402 = _1416;
    }
    float _1418 = _1402;
    if (_1276)
    {
        _1404 = _1412;
    }
    float _1420 = _1404;
    float _1422 = _1304 * 6.283185482025146484375;
    float _1424 = sin(_1422);
    float _1426 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1428 = _1400 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1430 = _1304 * 6.283185482025146484375;
    float _1432 = cos(_1430);
    if (!_1428)
    {
        _264 = _1326;
    }
    float _1434 = _264;
    float _1436 = _1434;
    if (!_1428)
    {
        _1414 = _1368;
    }
    float _1438 = _1414;
    float _1440 = _1438;
    if (!_1428)
    {
        _1406 = _1348;
    }
    float _1442 = _1406;
    float _1444 = _1442;
    if (!_1428)
    {
        _1372 = _1390;
    }
    float _1446 = _1372;
    bool _1448 = !_1428;
    float _1450 = _1446;
    if (!_1448)
    {
        float _1452 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1456 = _1400 + _1454;
        float _1458 = rsqrt(_1384);
        float _1460 = _1456 * _1452;
        float _1462 = _1390 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1464 = _1460 * 0.15915493667125701904296875;
        float _1466 = _1464 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = _1464 * 6.283185482025146484375;
        float _1472 = cos(_1470);
        float _1474 = fma(_1468, _1462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1476 = _1458 * _1474;
        float _1478 = fma(_1336, _1476, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1480 = _1472 + (-1.0);
        float _1482 = fma(_1360, _1476, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1486 = _1478 + _1484;
        float _1488 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1492 = _1482 + _1490;
        float _1494 = _1486 * _1486;
        float _1496 = fma(_1390, _1472, _1488);
        float _1498 = _1492 * _1492;
        _1450 = _1496;
        _1374 = _1494;
        _1440 = _1498;
        _1444 = _1482;
        _1436 = _1478;
    }
    float _1500 = _1450;
    float _1502 = _1374;
    float _1504 = _1440;
    float _1506 = _1444;
    float _1508 = _1436;
    float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1512 = _1500 + _1510;
    float _1514 = fma(_1426, _1418, -0.5);
    float _1516 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1518 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1520 = fma(_1512, _1512, _1502);
    float _1522 = _1424 * _1514;
    float _1524 = fma(_1516, _1420, -0.5);
    float _1526 = _1432 * _1514;
    float _1528 = _1520 + _1504;
    float _1530 = -_1522;
    float _1532 = fma(_1432, _1524, _1530);
    float _1534 = fma(_1424, _1524, _1526);
    float _1536 = sqrt(_1528);
    float _1538 = fma(_824, _1532, _810);
    float _1540 = -_812;
    float _1542 = fma(_826, _1534, _1540);
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1546 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1548 = _1538 + 0.5;
    float _1550 = _1542 + 0.5;
    out.m_59.w = _1544;
    float _1552 = -_1546;
    float _1554 = _994 * _1552;
    float _1556 = _1328 * _1546;
    float _1558 = _1260 * _1546;
    out.m_61.z = _1548;
    out.m_61.w = _1550;
    float _1560 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1562 = fma(_1288, _1518, _1554);
    float _1564 = fma(_1342, _1518, _1556);
    bool _1566 = _1536 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1568 = isnan(_1536);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1574 = _1570 || _1572;
    float _1576 = fma(_1322, _1518, _1558);
    float _1578 = fma(_1278, _1560, _1562);
    float _1580 = fma(_1354, _1560, _1564);
    float _1582 = fma(_1324, _1560, _1576);
    float _1584 = _1518;
    float _1586 = _1562;
    if (!_1574)
    {
        _1584 = 1.0;
    }
    float _1588 = _1584;
    bool _1590 = !_1574;
    float _1592 = _1588;
    if (!_1590)
    {
        bool _1594 = _1536 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1596 = isnan(_1536);
        bool _1598 = _1594 || _1596;
        bool _1600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1602 = _1598 || _1600;
        if (!_1602)
        {
            float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1606 = _1536 + _1604;
            float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1610 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1608;
            float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1614 = _1612 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1616 = 1.0 / _1610;
            float _1618 = _1606 * _1616;
            float _1620 = fma(_1618, _1614, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1592 = _1620;
            _1622 = true;
        }
        else
        {
            bool _1624 = _1536 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1626 = isnan(_1536);
            bool _1628 = _1624 || _1626;
            bool _1630 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1632 = _1628 || _1630;
            if (!_1632)
            {
                float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1636 = _1536 + _1634;
                float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1640 = _1638 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1644 = _1642 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1646 = 1.0 / _1640;
                float _1648 = _1636 * _1646;
                float _1650 = fma(_1648, _1644, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1592 = _1650;
                _1622 = true;
            }
            else
            {
                _1592 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1622 = false;
    float _1652 = _1592;
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1656 = _1500 + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1660 = _1506 + _1658;
    bool _1662 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan(0.5);
    bool _1670 = _1666 || _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1674 = _1508 + _1672;
    float _1676 = fma(_1656, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1678 = fma(_1660, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1680 = fma(_1674, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1682 = _1674;
    float _1684 = _1656;
    float _1686 = _1652;
    float _1688 = _1680;
    if (_1670)
    {
        _1682 = _1680;
    }
    float _1690 = _1682;
    float _1692 = _1690;
    if (_1670)
    {
        _1684 = _1676;
    }
    float _1694 = _1684;
    float _1696 = _1694;
    if (_1670)
    {
        _1686 = _1678;
    }
    float _1698 = _1686;
    float _1700 = _1698;
    if (!_1670)
    {
        float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1704 = _1378 + _1702;
        float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1708 = _1280 + _1706;
        float _1710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1712 = -_1280;
        float _1714 = _1712 + _1680;
        float _1716 = _1704 * _1704;
        float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1720 = _1282 + _1718;
        float _1722 = -_1378;
        float _1724 = _1722 + _1676;
        float _1726 = -_1282;
        float _1728 = _1726 + _1678;
        float _1730 = fma(_1708, _1708, _1716);
        float _1732 = fma(_1720, _1720, _1730);
        float _1734 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1736 = sqrt(_1732);
        float _1738 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1740 = _1736 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1742 = isnan(_1736);
        bool _1744 = _1740 || _1742;
        bool _1746 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1748 = _1744 || _1746;
        float _1750 = precise::min(_1736, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1752 = _1750 * _1710;
        float _1754 = _1738 * _1752;
        float _1756 = _1288;
        float _1758 = _1750;
        float _1760 = _1736;
        float _1762 = _1738;
        _1688 = _1714;
        if (_1748)
        {
            float _1764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1756 = _1764;
        }
        float _1766 = _1756;
        if (_1748)
        {
            float _1768 = precise::max(_1736, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1758 = _1768;
        }
        float _1770 = _1758;
        float _1772 = fma(_1724, _1754, _1378);
        float _1774 = _1766;
        if (_1748)
        {
            float _1776 = _1770 * _1766;
            _1760 = _1776;
        }
        float _1778 = _1760;
        float _1780 = fma(_1714, _1754, _1280);
        float _1782 = fma(_1728, _1754, _1282);
        float _1784 = _1780;
        float _1786 = _1778;
        if (_1748)
        {
            float _1788 = _1738 * _1778;
            _1774 = _1788;
        }
        float _1790 = _1774;
        if (!_1748)
        {
            _1762 = _1780;
        }
        float _1792 = _1762;
        float _1794 = _1792;
        if (!_1748)
        {
            _1784 = _1772;
        }
        float _1796 = _1784;
        float _1798 = _1796;
        if (_1748)
        {
            float _1800 = fma(_1714, _1790, _1280);
            _1794 = _1800;
        }
        float _1802 = _1794;
        _1692 = _1802;
        if (!_1748)
        {
            _1786 = _1782;
        }
        float _1804 = _1786;
        _1700 = _1804;
        if (_1748)
        {
            float _1806 = fma(_1724, _1790, _1378);
            _1798 = _1806;
        }
        float _1808 = _1798;
        _1696 = _1808;
        if (_1748)
        {
            float _1810 = fma(_1728, _1790, _1282);
            _1700 = _1810;
        }
    }
    float _1812 = _1696;
    float _1814 = _1692;
    float _1816 = _1700;
    float _1818 = _1688;
    float _1820 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1822 = _1812 + _1820;
    float _1824 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1826 = _1814 + _1824;
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1830 = _1816 + _1828;
    float _1832 = _1822 * _1822;
    float _1834 = fma(_1826, _1826, _1832);
    float _1836 = fma(_1830, _1830, _1834);
    float _1838 = rsqrt(_1836);
    float _1840 = sqrt(_1836);
    float _1842 = _1826 * _1838;
    float _1844 = _1830 * _1838;
    float _1846 = _1822 * _1838;
    float _1848 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1850 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1852 = _1848 * _1848;
    float _1854 = _1850 * _1850;
    float _1856 = _1852 + _1854;
    float _1858 = sqrt(_1856);
    bool _1860 = _1858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1864 = _1858 + _1862;
    float _1866 = _1576;
    float _1868 = _1856;
    float _1870 = _1864;
    float _1872 = _1838;
    if (_1860)
    {
        float _1874 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1866 = _1874;
    }
    float _1876 = _1866;
    if (_1860)
    {
        float _1878 = rsqrt(_1856);
        _1868 = _1878;
    }
    float _1880 = _1868;
    float _1882 = _1880;
    if (_1860)
    {
        float _1884 = _1864 * _1876;
        _1870 = _1884;
    }
    float _1886 = _1870;
    if (_1860)
    {
        float _1888 = _1886 * 0.15915493667125701904296875;
        _1586 = _1888;
    }
    float _1890 = _1586;
    float _1892 = _1876;
    float _1894 = _1890;
    if (_1860)
    {
        float _1896 = _1890 * 6.283185482025146484375;
        float _1898 = sin(_1896);
        _1892 = _1898;
    }
    float _1900 = _1892;
    float _1902 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1904 = precise::max(0.0, _1902);
    float _1906 = _1818;
    float _1908 = _1904;
    if (_1860)
    {
        float _1910 = _1890 * 6.283185482025146484375;
        float _1912 = cos(_1910);
        _1906 = _1912;
    }
    float _1914 = _1906;
    float _1916 = -_1846;
    float _1918 = -_1904;
    float _1920 = fma(_1916, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1918);
    if (_1860)
    {
        float _1922 = _1920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1872 = _1922;
    }
    float _1924 = _1872;
    float _1926 = _1900;
    float _1928 = _1924;
    if (_1860)
    {
        float _1930 = fma(_1900, _1924, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1908 = _1930;
    }
    float _1932 = _1908;
    float _1934 = _1932;
    if (!_1860)
    {
        _1926 = _1848;
    }
    float _1936 = _1926;
    float _1938 = _1936;
    float _1940 = _1914;
    if (_1860)
    {
        float _1942 = _1914 + (-1.0);
        _1928 = _1942;
    }
    float _1944 = _1928;
    float _1946 = _1944;
    if (_1860)
    {
        float _1948 = _1880 * _1932;
        _830 = _1948;
    }
    float _1950 = _830;
    if (!_1860)
    {
        _1934 = _1920;
    }
    float _1952 = _1934;
    float _1954 = _1952;
    if (_1860)
    {
        float _1956 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1894 = _1956;
    }
    float _1958 = _1894;
    if (_1860)
    {
        float _1960 = _1848 * _1950;
        _1938 = _1960;
    }
    float _1962 = _1938;
    if (!_1860)
    {
        _1946 = _1850;
    }
    float _1964 = _1946;
    float _1966 = _1964;
    if (_1860)
    {
        float _1968 = _1850 * _1950;
        _1966 = _1968;
    }
    float _1970 = _1966;
    if (!_1860)
    {
        _1882 = _1852;
    }
    float _1972 = _1882;
    float _1974 = _1972;
    if (_1860)
    {
        float _1976 = fma(_1920, _1914, _1958);
        _1954 = _1976;
    }
    float _1978 = _1954;
    if (_1860)
    {
        float _1980 = _1962 * _1962;
        _1974 = _1980;
    }
    float _1982 = _1974;
    if (!_1860)
    {
        _1940 = _1854;
    }
    float _1984 = _1940;
    float _1986 = _1984;
    if (_1860)
    {
        float _1988 = _1970 * _1970;
        _1986 = _1988;
    }
    float _1990 = _1986;
    float _1992 = fma(_1978, _1978, _1982);
    float _1994 = _1992 + _1990;
    float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1998 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1996);
    float _2000 = precise::clamp(_1998, 0.0, 1.0);
    float _2002 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2004 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2006 = rsqrt(_1994);
    float _2008 = -_2000;
    float _2010 = _2008 + 1.0;
    float _2012 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2002);
    float _2014 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2016 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2004);
    float _2018 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2020 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2012);
    float _2022 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2014);
    float _2024 = abs(_2010);
    float _2026 = log2(_2024);
    float _2028 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2016);
    float _2030 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2018);
    float _2032 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2022);
    float _2034 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2036 = _2028 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2038 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2030);
    float _2040 = _2032 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2042 = _2006 * _1962;
    float _2044 = _2006 * _1978;
    float _2046 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2048 = _2006 * _1970;
    float _2050 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2052 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2054 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2046);
    float _2056 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2058 = -_2050;
    float _2060 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2058);
    float _2062 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2064 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2066 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2054);
    float _2068 = -_2048;
    float _2070 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2060);
    float _2072 = -_2056;
    float _2074 = fma(_2072, _2052, 1.0);
    float _2076 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2078 = exp2(_2062);
    float _2080 = fma(_2070, -0.5, 0.5);
    float _2082 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2066);
    float _2084 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2086 = fma(_2070, 0.5, 0.5);
    float _2088 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2076);
    float _2090 = _2044 + 1.0;
    float _2092 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2084);
    float _2094 = log2(_2074);
    float _2096 = fma(_2086, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2098 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2088);
    float _2100 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2092);
    float _2102 = fma(_2086, _2096, -0.212114393711090087890625);
    float _2104 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2098);
    float _2106 = 1.0 / _2082;
    float _2108 = -_2044;
    float _2110 = fma(_2078, _2090, _2108);
    float _2112 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2100);
    float _2114 = fma(_2086, _2102, 1.570728778839111328125);
    float _2116 = sqrt(_2080);
    float _2118 = _2094 * 0.693147182464599609375;
    float _2120 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2122 = fma(_2110, 0.5, 0.5);
    float _2124 = _2104 * _2106;
    float _2126 = _2112 * _2106;
    float _2128 = fma(_2124, 0.5, 0.5);
    float _2130 = fma(_2126, -0.5, 0.5);
    float _2132 = _2116 * 0.636619746685028076171875;
    float _2134 = -_2114;
    float _2136 = fma(_2132, _2134, 1.0);
    float3 _5637 = float3(_2128, _2130, _2120);
    float _2138 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5637, float3(0.0), isnan(_5637)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5637, float3(0.0), isnan(_5637)), level(0.0)).x;
    float3 _5648 = float3(_2128, _2130, _2120);
    float4 _2141 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5648, float3(0.0), isnan(_5648)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5648, float3(0.0), isnan(_5648)), level(0.0)).xyzw;
    float _2143 = _2141.x;
    float _2145 = _2141.y;
    float _2147 = _2141.z;
    float _2149 = _2141.w;
    float2 _5665 = float2(_2136, _2122);
    float3 _2153 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5665, float2(0.0), isnan(_5665)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5665, float2(0.0), isnan(_5665)), level(0.0)).xyz;
    float _2155 = _2153.x;
    float _2157 = _2153.y;
    float _2159 = _2153.z;
    float _2161 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2163 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2165 = _1580 * _1846;
    float _2167 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2161);
    float _2169 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2169;
    float _2173 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2163);
    float _2175 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2167);
    float _2177 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2179 = fma(_1578, _1842, _2165);
    bool _2181 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2183 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2185 = _2181 || _2183;
    bool _2187 = isnan(0.5);
    bool _2189 = _2185 || _2187;
    float _2191 = 1.0 / _2171;
    float _2193 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2195 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2173);
    float _2197 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2199 = fma(_1582, _1844, _2179);
    float _2201 = _2195 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2203 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2197);
    float _2205 = 1.0 / _2193;
    float _2207 = abs(_2199);
    float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2211 = _2207 + _2209;
    float _2213 = _2201 + _2193;
    float _2215 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2203);
    float _2217 = _2199;
    if (_2189)
    {
        _2217 = 1.0;
    }
    float _2219 = _2217;
    float _2221 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2215);
    float _2223 = exp2(_2177);
    float _2225 = _2211 * _2191;
    float _2227 = precise::clamp(_2225, 0.0, 1.0);
    float _2229 = fma(_2227, -2.0, 3.0);
    float _2231 = _2227 * _2227;
    float _2233 = _2213 * _2205;
    float _2235 = _2233 * 0.5;
    float _2237 = _2219;
    if (!_2189)
    {
        float _2239 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2241 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2243 = fma(_2235, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2241);
        float _2245 = _2239 * 0.15915493667125701904296875;
        float _2247 = _2245 * 6.283185482025146484375;
        float _2249 = cos(_2247);
        float _2251 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2253 = _2251 * 0.15915493667125701904296875;
        float _2255 = _2245 * 6.283185482025146484375;
        float _2257 = sin(_2255);
        float _2259 = 1.0 / _2249;
        float _2261 = _2253 * 6.283185482025146484375;
        float _2263 = cos(_2261);
        float _2265 = _2257 * _2259;
        float _2267 = 1.0 / _2243;
        float _2269 = _2263 * _2265;
        float _2271 = _2253 * 6.283185482025146484375;
        float _2273 = sin(_2271);
        float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2277 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2275;
        float _2279 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2281 = _2267 * _2279;
        float _2283 = 1.0 / _2269;
        float _2285 = 1.0 / _2277;
        float _2287 = _2273 * _2283;
        float _2289 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2291 = fma(_2287, _2281, _2289);
        float _2293 = _2291 * _2285;
        float _2295 = precise::clamp(_2293, 0.0, 1.0);
        _2237 = _2295;
    }
    float _2297 = _2237;
    float _2299 = _2231 * _2229;
    float _2301 = _2082 * 0.5;
    float _2303 = -_2223;
    float _2305 = _2303 + 1.0;
    bool _2307 = _2297 > 0.0;
    bool _2309 = isnan(_2297);
    bool _2311 = _2307 || _2309;
    bool _2313 = isnan(0.0);
    bool _2315 = _2311 || _2313;
    float _2317 = _2299 * _2297;
    float _2319 = fma(_2112, -0.5, _2301);
    float _2321 = _2221 + _2082;
    float _2323 = _2104 + _2082;
    float _2325 = _2317 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2327 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2104;
    out.gl_Position.y = _2112;
    out.gl_Position.z = _2221;
    out.gl_Position.w = _2082;
    float _2329 = _2321 * 0.5;
    float _2331 = _2327 * _2138;
    float _2333 = -_2327;
    float _2335 = _2333 + 1.0;
    float _2337 = _2323 * 0.5;
    float _2339 = _2325 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2341 = _2149 * _2331;
    float _2343 = _2159 * _2331;
    float _2345 = _2149 * _2335;
    out.m_63.x = _2337;
    out.m_63.y = _2319;
    out.m_63.z = _2329;
    out.m_63.w = _2082;
    float _2347 = fma(_2155, _2341, _2143);
    float _2349 = fma(_2157, _2341, _2145);
    float _2351 = fma(_2149, _2343, _2147);
    out.m_47.x = _2339;
    out.m_65.x = _2347;
    out.m_65.y = _2349;
    out.m_65.z = _2351;
    out.m_65.w = _2345;
    if (_2315)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2353 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2353;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1622 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_44.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_47.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2410 = as_type<float>(_100);
        out.gl_Position.z = _2410;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _104 = in.m_49.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = _118;
    if (_114)
    {
        float _122 = float(_84);
        _94 = _122;
    }
    float _124 = _94;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_47.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _102 = as_type<int>(_136);
    }
    int _138 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2480 = as_type<float>(_138);
        out.gl_Position.z = _2480;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_51.w;
    float _142 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_49.x;
    float _156 = in.m_49.y;
    float _158 = in.m_49.z;
    float _160 = in.m_44.x;
    float _162 = in.m_44.y;
    float _164 = in.m_44.z;
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
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _264 = _260;
    float _282;
    if (!_262)
    {
        float _266 = in.m_53.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_84);
        float _288 = 1.0 / _286;
        float _290 = _118 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _296 = log2(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _318 = 1.0 / _300;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _326 = _324 != 0;
    float _328 = _296 * _118;
    float _330 = 1.0 / _308;
    float _332 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _334 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _336 = precise::max(_332, _334);
    int _338 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _340 = _338 != 0;
    int _342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _344 = _342 != 0;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _348 = _346 != 0;
    bool _350 = _336 >= 16.0;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _354 = _292 + _352;
    float _356 = 1.0 / _304;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _360 = _292 + _358;
    float _362 = _354 * _318;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _366 = _292 + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = 1.0 / _316;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _376 = _292 + _374;
    float _378 = _360 * _330;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = 1.0 / _322;
    float _398 = _376 * _356;
    float _400 = fma(_386, _378, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _402 = fma(_390, _378, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _404 = fma(_382, _398, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _406 = fma(_370, _398, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _408;
    float _412 = 1.0 / _312;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _416 = _292 + _414;
    float _418 = _366 * _372;
    bool _420 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _422 = isnan(_292);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _438 = _292 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = _416 * _396;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _454 = -_430;
    float _456 = _454 + 1.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _462 = fma(_448, _398, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _464 = fma(_452, _378, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _466 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _468 = isnan(_292);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = in.m_53.x;
    float _480 = in.m_53.y;
    float _482 = in.m_53.z;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _488 = fma(_394, _362, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _490 = fma(_410, _362, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _492 = fma(_434, _362, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _494 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _496 = isnan(_292);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = _476 * _456;
    float _508 = -_476;
    float _510 = _508 + 1.0;
    float _512 = _438 * _412;
    float _514 = fma(_442, _444, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _516 = fma(_460, _444, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = fma(_486, _444, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _520;
    bool _524 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _526 = isnan(_292);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = _504 * _510;
    float _538 = -_504;
    float _540 = _538 + 1.0;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _542;
    float _546 = fma(_522, _512, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _548;
    bool _552 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _554 = isnan(_292);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -_534;
    float _566 = _564 + 1.0;
    float _568 = fma(_544, _512, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _570 = fma(_550, _512, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _572 = _534 * _540;
    bool _574 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _576 = isnan(_292);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = _562 * _566;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _592 = -_562;
    float _594 = _592 + 1.0;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    bool _600 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _602 = isnan(_292);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = fma(_590, _418, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _614 = _584 * _594;
    float _616 = fma(_598, _418, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _618 = -_584;
    float _620 = _618 + 1.0;
    float _622 = _598;
    float _624 = _584;
    float _626 = _620;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _630 = _480;
    float _632 = _488;
    int _634 = as_type<int>(_572);
    if (!_326)
    {
        _622 = _478;
    }
    float _636 = _622;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _642 = _636;
    float _644 = _640;
    if (!_326)
    {
        _624 = _480;
    }
    float _646 = _624;
    float _648 = _610 * _620;
    float _650 = _646;
    if (!_326)
    {
        _626 = _636;
    }
    float _652 = _626;
    float _654 = -_610;
    float _656 = _654 + 1.0;
    float _658 = _652;
    if (!_326)
    {
        _628 = _646;
    }
    float _660 = _628;
    float _662 = _490 * _648;
    float _664 = _660;
    if (_326)
    {
        _642 = _478;
    }
    float _666 = _642;
    float _668 = _488 * _648;
    float _670 = _492 * _648;
    if (_326)
    {
        _650 = _480;
    }
    float _672 = _650;
    float _674 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].x, _668);
    if (!_326)
    {
        _630 = _660;
    }
    float _676 = _630;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _680 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].y, _662);
    float _682 = _676;
    if (_326)
    {
        _664 = _666;
    }
    float _684 = _664;
    float _686 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].z, _670);
    if (_326)
    {
        _658 = _482;
    }
    float _688 = _658;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _692 = fma(_640, _418, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _694 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[83].z, _678);
    float _696 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[84].z, _690);
    float _698 = fma(_514, _614, _674);
    if (!_326)
    {
        _644 = _482;
    }
    float _700 = _644;
    float _702 = exp2(_328);
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _706 = _482 * 2.0;
    float _708 = _672 * 2.0;
    float _710 = fma(_518, _614, _686);
    float _712 = _700;
    if (_326)
    {
        _682 = _666;
    }
    float _714 = _682;
    float _716 = floor(_706);
    if (!_326)
    {
        _632 = _700;
    }
    float _718 = _632;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _722 = _718;
    if (_326)
    {
        _712 = _672;
    }
    float _724 = _712;
    float _726 = _714 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _728 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _730 = isnan(1.0);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _736 = _732 || _734;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _740 = 1.0 + _738;
    float _742 = fma(_516, _614, _680);
    float _744 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[83].w, _720);
    if (_326)
    {
        _722 = _672;
    }
    float _746 = _722;
    float _748 = floor(_708);
    float _750 = _666 * 2.0;
    float _752 = _672 + _482;
    float _754 = -_704;
    float _756 = fma(_726, 2.0, _754);
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _760 = _746 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _762 = _666 + _482;
    float _764 = 1.0 / _740;
    float _766 = _752 + (-1.0);
    float _768 = fma(_760, -2.0, _758);
    float _770 = _762 + (-1.0);
    float _772 = -_702;
    float _774 = _772 + 1.0;
    float _776 = _666 + _672;
    bool _778 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _780 = isnan(0.0);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _786 = _782 || _784;
    float _788 = floor(_750);
    float _790 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _792 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _794 = _716 >= 0.0;
    bool _796 = isnan(_716);
    bool _798 = _794 || _796;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    float _804 = _776 + (-1.0);
    float _806 = _786 ? _774 : 0.0;
    float _808 = -_118;
    float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[81].x, _756);
    float _812 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _768);
    bool _814 = _716 > 0.0;
    float _816 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _818 = _802 ? 0 : 1;
    float _820 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[84].x, _696);
    bool _822 = _748 > 0.0;
    float _824 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _694);
    float _826 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _744);
    bool _828 = _822;
    float _830 = _810;
    if (_736)
    {
        float _832 = _806 * _764;
        _120 = _832;
    }
    float _834 = _120;
    bool _836 = !_348;
    int _838 = _836 ? 0 : 1;
    float _840 = fma(_462, _586, _742);
    bool _842 = _748 >= 0.0;
    bool _844 = isnan(_748);
    bool _846 = _842 || _844;
    bool _848 = isnan(0.0);
    bool _850 = _846 || _848;
    float _852 = fma(_404, _586, _698);
    bool _854 = !_340;
    int _856 = _854 ? 0 : 1;
    float _858 = fma(_406, _586, _710);
    bool _860 = _788 > 0.0;
    float _862 = fma(_400, _572, _852);
    bool _864 = _788 >= 0.0;
    bool _866 = isnan(_788);
    bool _868 = _864 || _866;
    bool _870 = isnan(0.0);
    bool _872 = _868 || _870;
    float _874 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    int _876 = _850 ? 0 : 1;
    float _878 = _482 + (-0.5);
    int _880 = abs(_838);
    float _882 = fma(_464, _572, _840);
    int _884 = ~_876;
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    float _890 = _666 + (-0.5);
    int _892 = _888;
    int _894 = as_type<int>(_890);
    float _896 = _834;
    if (!_822)
    {
        int _898 = ~_876;
        int _900 = _898 + 1;
        _892 = _900;
    }
    int _902 = _892;
    float _904 = _672 + (-0.5);
    float _906 = float(_880);
    float _908 = float(_902);
    int _910 = ~_818;
    int _912 = _910 + 1;
    int _914 = _912 + 1;
    int _916 = _914;
    if (!_814)
    {
        int _918 = ~_818;
        int _920 = _918 + 1;
        _916 = _920;
    }
    int _922 = _916;
    float _924 = _906 * _908;
    int _926 = abs(_856);
    float _928 = _924 * (-2.0);
    int _930 = _872 ? 0 : 1;
    float _932 = float(_926);
    float _934 = fma(_792, _928, _792);
    float _936 = float(_922);
    float _938 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    int _940 = ~_930;
    int _942 = _940 + 1;
    int _944 = _942 + 1;
    float _946 = _878 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    int _948 = _944;
    if (!_860)
    {
        int _950 = ~_930;
        int _952 = _950 + 1;
        _948 = _952;
    }
    int _954 = _948;
    float _956 = _932 * _936;
    float _958 = _350 ? _874 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _960 = fma(_934, _834, _946);
    bool _962 = !_344;
    int _964 = _962 ? 0 : 1;
    float _966 = in.m_51.x;
    float _968 = in.m_51.y;
    float _970 = in.m_51.z;
    float _972 = _350 ? _938 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _974 = _960 * 0.15915493667125701904296875;
    float _976 = abs(_958);
    bool _978 = _976 != 0.0;
    bool _980 = isnan(_976);
    bool _982 = _978 || _980;
    bool _984 = isnan(0.0);
    bool _986 = _982 || _984;
    float _988 = _956 * (-2.0);
    int _990 = abs(_964);
    float _992 = _974 * 6.283185482025146484375;
    float _994 = sin(_992);
    float _996 = abs(_972);
    bool _998 = _996 == 0.0;
    bool _1000 = !_986;
    bool _1002 = _998 && _1000;
    float _1004 = in.m_55.x;
    float _1006 = in.m_55.y;
    float _1008 = in.m_55.z;
    float _1010 = float(_990);
    float _1012 = fma(_816, _988, _816);
    float _1014 = float(_954);
    float _1016 = _890 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1018 = abs(_972);
    bool _1020 = _1018 == 0.0;
    float _1022 = _974 * 6.283185482025146484375;
    float _1024 = cos(_1022);
    float _1026 = _1010 * _1014;
    float _1028 = fma(_1012, _834, _1016);
    float _1030 = _1026 * (-2.0);
    if (_1002)
    {
        bool _1032 = as_type<int>(_972) >= 0;
        _828 = _1032;
    }
    bool _1034 = _828;
    float _1036 = fma(_790, _1030, _790);
    float _1038 = _904 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _1040 = _1034 ? (-1) : 0;
    if (_1002)
    {
        int _1042 = _1034 ? 0 : 1078530011;
        _894 = _1042;
    }
    int _1044 = _894;
    float _1046 = fma(_402, _572, _858);
    float _1048 = _1028 * 0.15915493667125701904296875;
    float _1050 = fma(_1036, _834, _1038);
    if (_1002)
    {
        int _1052 = int(0x80000000) & as_type<int>(_958);
        int _1054 = _1044 | _1052;
        _896 = as_type<float>(_1054);
    }
    float _1056 = _896;
    bool _1058 = !_986;
    bool _1060 = _1058 && _1020;
    float _1062 = _1056;
    float _1064 = _1056;
    if (!_1060)
    {
        float _1066 = abs(_958);
        bool _1068 = _1066 != as_type<float>(0x7f800000u /* inf */);
        bool _1070 = isnan(_1066);
        bool _1072 = _1068 || _1070;
        bool _1074 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1076 = _1072 || _1074;
        float _1078 = abs(_972);
        bool _1080 = _1078 == as_type<float>(0x7f800000u /* inf */);
        float _1082 = abs(_972);
        bool _1084 = _1082 == as_type<float>(0x7f800000u /* inf */);
        bool _1086 = !_1076;
        bool _1088 = _1084 && _1086;
        if (_1088)
        {
            bool _1090 = as_type<int>(_972) >= 0;
            _1040 = _1090 ? (-1) : 0;
        }
        int _1092 = _1040;
        if (_1088)
        {
            _634 = 1075235812;
        }
        int _1094 = _634;
        int _1096 = _1094;
        if (_1088)
        {
            int _1098 = ~_1092;
            int _1100 = (_1098 != 0) ? _1094 : 1061752795;
            _1096 = _1100;
        }
        int _1102 = _1096;
        if (_1088)
        {
            int _1104 = int(0x80000000) & as_type<int>(_958);
            int _1106 = _1102 | _1104;
            _1062 = as_type<float>(_1106);
        }
        float _1108 = _1062;
        bool _1110 = !_1076;
        bool _1112 = _1110 && _1080;
        _1064 = _1108;
        if (!_1112)
        {
            float _1114 = abs(_958);
            float _1116 = abs(_972);
            float _1118 = precise::max(_1114, _1116);
            float _1120 = abs(_958);
            float _1122 = abs(_972);
            float _1124 = precise::min(_1120, _1122);
            float _1126 = 1.0 / _1118;
            float _1128 = abs(_958);
            float _1130 = abs(_972);
            bool _1132 = _1128 > _1130;
            bool _1134 = as_type<int>(_972) >= 0;
            float _1136 = _1124 * _1126;
            float _1138 = abs(_958);
            float _1140 = abs(_972);
            float _1142 = _1138 + _1140;
            int _1144 = as_type<int>(_958) & int(0x80000000);
            float _1146 = _1136 * _1136;
            bool _1148 = _1142 > as_type<float>(0x7f800000u /* inf */);
            bool _1150 = isnan(_1142);
            bool _1152 = _1148 || _1150;
            bool _1154 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1156 = _1152 || _1154;
            float _1158 = _1146 + 11.33538818359375;
            float _1160 = fma(_1146, _1158, 28.84246826171875);
            float _1162 = fma(_1146, _1160, 19.6966705322265625);
            float _1164 = fma(_1146, -0.82336294651031494140625, -5.674867153167724609375);
            float _1166 = fma(_1146, _1164, -6.565555095672607421875);
            float _1168 = 1.0 / _1162;
            float _1170 = _1146 * _1166;
            float _1172 = _1136 * _1170;
            float _1174 = fma(_1172, _1168, _1136);
            float _1176 = _1174;
            _1064 = _1142;
            if (_1132)
            {
                float _1178 = -_1174;
                float _1180 = _1178 + 1.57079637050628662109375;
                _1176 = _1180;
            }
            float _1182 = _1176;
            int _1184 = as_type<int>(_1182);
            if (!_1134)
            {
                float _1186 = -_1182;
                float _1188 = _1186 + 3.1415927410125732421875;
                _1184 = as_type<int>(_1188);
            }
            int _1190 = _1184;
            if (!_1156)
            {
                int _1192 = _1144 | _1190;
                _1064 = as_type<float>(_1192);
            }
        }
    }
    float _1194 = _1064;
    float _1196 = fma(_546, _536, _862);
    float _1198 = _1050 + _1194;
    float _1200 = fma(_568, _536, _882);
    float _1202 = fma(_570, _536, _1046);
    float _1204 = fma(_612, _506, _1196);
    float _1206 = _1198 * 0.15915493667125701904296875;
    float _1208 = fma(_616, _506, _1200);
    float _1210 = fma(_692, _506, _1202);
    float _1212 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[149].x, _1204);
    float _1214 = _1048 * 6.283185482025146484375;
    float _1216 = sin(_1214);
    float _1218 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[149].z, _1210);
    float _1220 = _1212 * _966;
    float _1222 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[149].y, _1208);
    float _1224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1004);
    float _1226 = _1218 * _970;
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1230 = _1222 * _968;
    float _1232 = _1206 * 6.283185482025146484375;
    float _1234 = sin(_1232);
    float _1236 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1238 = _1224 * _1228;
    float _1240 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1242 = _1226 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1006);
    float _1246 = _1230 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1248 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1240);
    float _1250 = _1206 * 6.283185482025146484375;
    float _1252 = cos(_1250);
    float _1254 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1236);
    float _1256 = _1244 * _1246;
    float _1258 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1248);
    float _1260 = _1216 * _1024;
    float _1262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1008);
    float _1264 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1254);
    float _1266 = _1048 * 6.283185482025146484375;
    float _1268 = cos(_1266);
    float _1270 = _1216 * _1234;
    float _1272 = _1262 * _1242;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1276 = _1274 != 0;
    float _1278 = _1234 * _1024;
    float _1280 = _1264 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1282 = _1258 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1284 = in.m_57.x;
    float _1286 = _1216 * _1252;
    float _1288 = _1252 * _1024;
    float _1290 = -_1256;
    float _1292 = _994 * _1290;
    float _1294 = _1260 * _1256;
    float _1296 = in.m_53.w;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1300 = _1298 != 0;
    float _1302 = fma(_1288, _1238, _1292);
    float _1304 = _820 * (-0.15915493667125701904296875);
    float _1306 = _1268 * _1234;
    float _1308 = _1268 * _1252;
    float _1310 = fma(_1278, _1272, _1302);
    float _1312 = _1014;
    float _1314 = _1308;
    if (_1276)
    {
        float _1316 = in.m_53.z;
        _1312 = _1316;
    }
    float _1318 = _1312;
    float _1320 = -_1306;
    float _1322 = fma(_994, _1286, _1320);
    float _1324 = fma(_994, _1270, _1308);
    float _1326 = _1280 + _1310;
    float _1328 = _1268 * _1024;
    float _1330 = fma(_1322, _1238, _1294);
    float _1332 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1334 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1336 = _1326 + _1334;
    float _1338 = in.m_57.y;
    float _1340 = fma(_1324, _1272, _1330);
    float _1342 = fma(_994, _1308, _1270);
    float _1344 = _1336 * _1336;
    float _1346 = _1328 * _1256;
    float _1348 = _1282 + _1340;
    float _1350 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1332);
    float _1352 = -_1286;
    float _1354 = fma(_994, _1306, _1352);
    float _1356 = fma(_1342, _1238, _1346);
    float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1360 = _1348 + _1358;
    float _1362 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1350);
    float _1364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1366 = fma(_1354, _1272, _1356);
    float _1368 = _1360 * _1360;
    float _1370 = _1332;
    float _1372 = _1326;
    float _1374 = _1344;
    if (_1276)
    {
        _1314 = _1284;
    }
    float _1376 = _1314;
    float _1378 = _1362 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1380 = _1318 > 0.5;
    bool _1382 = _1380 && _1276;
    float _1384 = _1344 + _1368;
    bool _1386 = _1296 > 0.5;
    float _1388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1390 = _1378 + _1366;
    float _1392 = _1376;
    if (!_1276)
    {
        _1370 = _1284;
    }
    float _1394 = _1370;
    float _1396 = -_1338;
    float _1398 = _1396 + 1.0;
    float _1400 = sqrt(_1384);
    float _1402 = _1338;
    float _1404 = _1394;
    float _1406 = _1398;
    if (_1382)
    {
        float _1408 = -_1376;
        float _1410 = _1408 + 1.0;
        _1392 = _1410;
    }
    float _1412 = _1392;
    float _1414 = _1412;
    if (_1300)
    {
        float _1416 = _1386 ? _1398 : _1338;
        _1402 = _1416;
    }
    float _1418 = _1402;
    if (_1276)
    {
        _1404 = _1412;
    }
    float _1420 = _1404;
    float _1422 = _1304 * 6.283185482025146484375;
    float _1424 = sin(_1422);
    float _1426 = _1388 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1428 = _1400 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1430 = _1304 * 6.283185482025146484375;
    float _1432 = cos(_1430);
    if (!_1428)
    {
        _264 = _1326;
    }
    float _1434 = _264;
    float _1436 = _1434;
    if (!_1428)
    {
        _1414 = _1368;
    }
    float _1438 = _1414;
    float _1440 = _1438;
    if (!_1428)
    {
        _1406 = _1348;
    }
    float _1442 = _1406;
    float _1444 = _1442;
    if (!_1428)
    {
        _1372 = _1390;
    }
    float _1446 = _1372;
    bool _1448 = !_1428;
    float _1450 = _1446;
    if (!_1448)
    {
        float _1452 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1456 = _1400 + _1454;
        float _1458 = rsqrt(_1384);
        float _1460 = _1456 * _1452;
        float _1462 = _1390 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1464 = _1460 * 0.15915493667125701904296875;
        float _1466 = _1464 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = _1464 * 6.283185482025146484375;
        float _1472 = cos(_1470);
        float _1474 = fma(_1468, _1462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1476 = _1458 * _1474;
        float _1478 = fma(_1336, _1476, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1480 = _1472 + (-1.0);
        float _1482 = fma(_1360, _1476, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1486 = _1478 + _1484;
        float _1488 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1492 = _1482 + _1490;
        float _1494 = _1486 * _1486;
        float _1496 = fma(_1390, _1472, _1488);
        float _1498 = _1492 * _1492;
        _1450 = _1496;
        _1374 = _1494;
        _1440 = _1498;
        _1444 = _1482;
        _1436 = _1478;
    }
    float _1500 = _1450;
    float _1502 = _1374;
    float _1504 = _1440;
    float _1506 = _1444;
    float _1508 = _1436;
    float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1512 = _1500 + _1510;
    float _1514 = fma(_1426, _1418, -0.5);
    float _1516 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1518 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1520 = fma(_1512, _1512, _1502);
    float _1522 = _1424 * _1514;
    float _1524 = fma(_1516, _1420, -0.5);
    float _1526 = _1432 * _1514;
    float _1528 = _1520 + _1504;
    float _1530 = -_1522;
    float _1532 = fma(_1432, _1524, _1530);
    float _1534 = fma(_1424, _1524, _1526);
    float _1536 = sqrt(_1528);
    float _1538 = fma(_824, _1532, _810);
    float _1540 = -_812;
    float _1542 = fma(_826, _1534, _1540);
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1546 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1548 = _1538 + 0.5;
    float _1550 = _1542 + 0.5;
    out.m_59.w = _1544;
    float _1552 = -_1546;
    float _1554 = _994 * _1552;
    float _1556 = _1328 * _1546;
    float _1558 = _1260 * _1546;
    out.m_61.z = _1548;
    out.m_61.w = _1550;
    float _1560 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1562 = fma(_1288, _1518, _1554);
    float _1564 = fma(_1342, _1518, _1556);
    bool _1566 = _1536 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1568 = isnan(_1536);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1574 = _1570 || _1572;
    float _1576 = fma(_1322, _1518, _1558);
    float _1578 = fma(_1278, _1560, _1562);
    float _1580 = fma(_1354, _1560, _1564);
    float _1582 = fma(_1324, _1560, _1576);
    float _1584 = _1518;
    float _1586 = _1562;
    if (!_1574)
    {
        _1584 = 1.0;
    }
    float _1588 = _1584;
    bool _1590 = !_1574;
    float _1592 = _1588;
    if (!_1590)
    {
        bool _1594 = _1536 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1596 = isnan(_1536);
        bool _1598 = _1594 || _1596;
        bool _1600 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1602 = _1598 || _1600;
        if (!_1602)
        {
            float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1606 = _1536 + _1604;
            float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1610 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1608;
            float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1614 = _1612 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1616 = 1.0 / _1610;
            float _1618 = _1606 * _1616;
            float _1620 = fma(_1618, _1614, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1592 = _1620;
            _1622 = true;
        }
        else
        {
            bool _1624 = _1536 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1626 = isnan(_1536);
            bool _1628 = _1624 || _1626;
            bool _1630 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1632 = _1628 || _1630;
            if (!_1632)
            {
                float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1636 = _1536 + _1634;
                float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1640 = _1638 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1644 = _1642 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1646 = 1.0 / _1640;
                float _1648 = _1636 * _1646;
                float _1650 = fma(_1648, _1644, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1592 = _1650;
                _1622 = true;
            }
            else
            {
                _1592 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1622 = false;
    float _1652 = _1592;
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1656 = _1500 + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1660 = _1506 + _1658;
    bool _1662 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan(0.5);
    bool _1670 = _1666 || _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1674 = _1508 + _1672;
    float _1676 = fma(_1656, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1678 = fma(_1660, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1680 = fma(_1674, _1652, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1682 = _1674;
    float _1684 = _1656;
    float _1686 = _1652;
    float _1688 = _1680;
    if (_1670)
    {
        _1682 = _1680;
    }
    float _1690 = _1682;
    float _1692 = _1690;
    if (_1670)
    {
        _1684 = _1676;
    }
    float _1694 = _1684;
    float _1696 = _1694;
    if (_1670)
    {
        _1686 = _1678;
    }
    float _1698 = _1686;
    float _1700 = _1698;
    if (!_1670)
    {
        float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1704 = _1378 + _1702;
        float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1708 = _1280 + _1706;
        float _1710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1712 = -_1280;
        float _1714 = _1712 + _1680;
        float _1716 = _1704 * _1704;
        float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1720 = _1282 + _1718;
        float _1722 = -_1378;
        float _1724 = _1722 + _1676;
        float _1726 = -_1282;
        float _1728 = _1726 + _1678;
        float _1730 = fma(_1708, _1708, _1716);
        float _1732 = fma(_1720, _1720, _1730);
        float _1734 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1736 = sqrt(_1732);
        float _1738 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1740 = _1736 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1742 = isnan(_1736);
        bool _1744 = _1740 || _1742;
        bool _1746 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1748 = _1744 || _1746;
        float _1750 = precise::min(_1736, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1752 = _1750 * _1710;
        float _1754 = _1738 * _1752;
        float _1756 = _1288;
        float _1758 = _1750;
        float _1760 = _1736;
        float _1762 = _1738;
        _1688 = _1714;
        if (_1748)
        {
            float _1764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1756 = _1764;
        }
        float _1766 = _1756;
        if (_1748)
        {
            float _1768 = precise::max(_1736, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1758 = _1768;
        }
        float _1770 = _1758;
        float _1772 = fma(_1724, _1754, _1378);
        float _1774 = _1766;
        if (_1748)
        {
            float _1776 = _1770 * _1766;
            _1760 = _1776;
        }
        float _1778 = _1760;
        float _1780 = fma(_1714, _1754, _1280);
        float _1782 = fma(_1728, _1754, _1282);
        float _1784 = _1780;
        float _1786 = _1778;
        if (_1748)
        {
            float _1788 = _1738 * _1778;
            _1774 = _1788;
        }
        float _1790 = _1774;
        if (!_1748)
        {
            _1762 = _1780;
        }
        float _1792 = _1762;
        float _1794 = _1792;
        if (!_1748)
        {
            _1784 = _1772;
        }
        float _1796 = _1784;
        float _1798 = _1796;
        if (_1748)
        {
            float _1800 = fma(_1714, _1790, _1280);
            _1794 = _1800;
        }
        float _1802 = _1794;
        _1692 = _1802;
        if (!_1748)
        {
            _1786 = _1782;
        }
        float _1804 = _1786;
        _1700 = _1804;
        if (_1748)
        {
            float _1806 = fma(_1724, _1790, _1378);
            _1798 = _1806;
        }
        float _1808 = _1798;
        _1696 = _1808;
        if (_1748)
        {
            float _1810 = fma(_1728, _1790, _1282);
            _1700 = _1810;
        }
    }
    float _1812 = _1696;
    float _1814 = _1692;
    float _1816 = _1700;
    float _1818 = _1688;
    float _1820 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1822 = _1812 + _1820;
    float _1824 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1826 = _1814 + _1824;
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1830 = _1816 + _1828;
    float _1832 = _1822 * _1822;
    float _1834 = fma(_1826, _1826, _1832);
    float _1836 = fma(_1830, _1830, _1834);
    float _1838 = rsqrt(_1836);
    float _1840 = sqrt(_1836);
    float _1842 = _1826 * _1838;
    float _1844 = _1830 * _1838;
    float _1846 = _1822 * _1838;
    float _1848 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1850 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1852 = _1848 * _1848;
    float _1854 = _1850 * _1850;
    float _1856 = _1852 + _1854;
    float _1858 = sqrt(_1856);
    bool _1860 = _1858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1864 = _1858 + _1862;
    float _1866 = _1576;
    float _1868 = _1856;
    float _1870 = _1864;
    float _1872 = _1838;
    if (_1860)
    {
        float _1874 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1866 = _1874;
    }
    float _1876 = _1866;
    if (_1860)
    {
        float _1878 = rsqrt(_1856);
        _1868 = _1878;
    }
    float _1880 = _1868;
    float _1882 = _1880;
    if (_1860)
    {
        float _1884 = _1864 * _1876;
        _1870 = _1884;
    }
    float _1886 = _1870;
    if (_1860)
    {
        float _1888 = _1886 * 0.15915493667125701904296875;
        _1586 = _1888;
    }
    float _1890 = _1586;
    float _1892 = _1876;
    float _1894 = _1890;
    if (_1860)
    {
        float _1896 = _1890 * 6.283185482025146484375;
        float _1898 = sin(_1896);
        _1892 = _1898;
    }
    float _1900 = _1892;
    float _1902 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1904 = precise::max(0.0, _1902);
    float _1906 = _1818;
    float _1908 = _1904;
    if (_1860)
    {
        float _1910 = _1890 * 6.283185482025146484375;
        float _1912 = cos(_1910);
        _1906 = _1912;
    }
    float _1914 = _1906;
    float _1916 = -_1846;
    float _1918 = -_1904;
    float _1920 = fma(_1916, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1918);
    if (_1860)
    {
        float _1922 = _1920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1872 = _1922;
    }
    float _1924 = _1872;
    float _1926 = _1900;
    float _1928 = _1924;
    if (_1860)
    {
        float _1930 = fma(_1900, _1924, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1908 = _1930;
    }
    float _1932 = _1908;
    float _1934 = _1932;
    if (!_1860)
    {
        _1926 = _1848;
    }
    float _1936 = _1926;
    float _1938 = _1936;
    float _1940 = _1914;
    if (_1860)
    {
        float _1942 = _1914 + (-1.0);
        _1928 = _1942;
    }
    float _1944 = _1928;
    float _1946 = _1944;
    if (_1860)
    {
        float _1948 = _1880 * _1932;
        _830 = _1948;
    }
    float _1950 = _830;
    if (!_1860)
    {
        _1934 = _1920;
    }
    float _1952 = _1934;
    float _1954 = _1952;
    if (_1860)
    {
        float _1956 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1894 = _1956;
    }
    float _1958 = _1894;
    if (_1860)
    {
        float _1960 = _1848 * _1950;
        _1938 = _1960;
    }
    float _1962 = _1938;
    if (!_1860)
    {
        _1946 = _1850;
    }
    float _1964 = _1946;
    float _1966 = _1964;
    if (_1860)
    {
        float _1968 = _1850 * _1950;
        _1966 = _1968;
    }
    float _1970 = _1966;
    if (!_1860)
    {
        _1882 = _1852;
    }
    float _1972 = _1882;
    float _1974 = _1972;
    if (_1860)
    {
        float _1976 = fma(_1920, _1914, _1958);
        _1954 = _1976;
    }
    float _1978 = _1954;
    if (_1860)
    {
        float _1980 = _1962 * _1962;
        _1974 = _1980;
    }
    float _1982 = _1974;
    if (!_1860)
    {
        _1940 = _1854;
    }
    float _1984 = _1940;
    float _1986 = _1984;
    if (_1860)
    {
        float _1988 = _1970 * _1970;
        _1986 = _1988;
    }
    float _1990 = _1986;
    float _1992 = fma(_1978, _1978, _1982);
    float _1994 = _1992 + _1990;
    float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1998 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1996);
    float _2000 = precise::clamp(_1998, 0.0, 1.0);
    float _2002 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2004 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2006 = rsqrt(_1994);
    float _2008 = -_2000;
    float _2010 = _2008 + 1.0;
    float _2012 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2002);
    float _2014 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2016 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2004);
    float _2018 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2020 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2012);
    float _2022 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2014);
    float _2024 = abs(_2010);
    float _2026 = log2(_2024);
    float _2028 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2016);
    float _2030 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2018);
    float _2032 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2022);
    float _2034 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2036 = _2028 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2038 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2030);
    float _2040 = _2032 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2042 = _2006 * _1962;
    float _2044 = _2006 * _1978;
    float _2046 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2048 = _2006 * _1970;
    float _2050 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2052 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2054 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2046);
    float _2056 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2058 = -_2050;
    float _2060 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2058);
    float _2062 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2064 = _2038 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2066 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2054);
    float _2068 = -_2048;
    float _2070 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2060);
    float _2072 = -_2056;
    float _2074 = fma(_2072, _2052, 1.0);
    float _2076 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2078 = exp2(_2062);
    float _2080 = fma(_2070, -0.5, 0.5);
    float _2082 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2066);
    float _2084 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2086 = fma(_2070, 0.5, 0.5);
    float _2088 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2076);
    float _2090 = _2044 + 1.0;
    float _2092 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2084);
    float _2094 = log2(_2074);
    float _2096 = fma(_2086, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2098 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2088);
    float _2100 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2092);
    float _2102 = fma(_2086, _2096, -0.212114393711090087890625);
    float _2104 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2098);
    float _2106 = 1.0 / _2082;
    float _2108 = -_2044;
    float _2110 = fma(_2078, _2090, _2108);
    float _2112 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2100);
    float _2114 = fma(_2086, _2102, 1.570728778839111328125);
    float _2116 = sqrt(_2080);
    float _2118 = _2094 * 0.693147182464599609375;
    float _2120 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2122 = fma(_2110, 0.5, 0.5);
    float _2124 = _2104 * _2106;
    float _2126 = _2112 * _2106;
    float _2128 = fma(_2124, 0.5, 0.5);
    float _2130 = fma(_2126, -0.5, 0.5);
    float _2132 = _2116 * 0.636619746685028076171875;
    float _2134 = -_2114;
    float _2136 = fma(_2132, _2134, 1.0);
    float3 _5637 = float3(_2128, _2130, _2120);
    float _2138 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5637, float3(0.0), isnan(_5637)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5637, float3(0.0), isnan(_5637)), level(0.0)).x;
    float3 _5648 = float3(_2128, _2130, _2120);
    float4 _2141 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5648, float3(0.0), isnan(_5648)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5648, float3(0.0), isnan(_5648)), level(0.0)).xyzw;
    float _2143 = _2141.x;
    float _2145 = _2141.y;
    float _2147 = _2141.z;
    float _2149 = _2141.w;
    float2 _5665 = float2(_2136, _2122);
    float3 _2153 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5665, float2(0.0), isnan(_5665)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5665, float2(0.0), isnan(_5665)), level(0.0)).xyz;
    float _2155 = _2153.x;
    float _2157 = _2153.y;
    float _2159 = _2153.z;
    float _2161 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2163 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2165 = _1580 * _1846;
    float _2167 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2161);
    float _2169 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2169;
    float _2173 = fma(_1280, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2163);
    float _2175 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2167);
    float _2177 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2179 = fma(_1578, _1842, _2165);
    bool _2181 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2183 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2185 = _2181 || _2183;
    bool _2187 = isnan(0.5);
    bool _2189 = _2185 || _2187;
    float _2191 = 1.0 / _2171;
    float _2193 = _2175 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2195 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2173);
    float _2197 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2199 = fma(_1582, _1844, _2179);
    float _2201 = _2195 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2203 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2197);
    float _2205 = 1.0 / _2193;
    float _2207 = abs(_2199);
    float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2211 = _2207 + _2209;
    float _2213 = _2201 + _2193;
    float _2215 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2203);
    float _2217 = _2199;
    if (_2189)
    {
        _2217 = 1.0;
    }
    float _2219 = _2217;
    float _2221 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2215);
    float _2223 = exp2(_2177);
    float _2225 = _2211 * _2191;
    float _2227 = precise::clamp(_2225, 0.0, 1.0);
    float _2229 = fma(_2227, -2.0, 3.0);
    float _2231 = _2227 * _2227;
    float _2233 = _2213 * _2205;
    float _2235 = _2233 * 0.5;
    float _2237 = _2219;
    if (!_2189)
    {
        float _2239 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2241 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2243 = fma(_2235, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2241);
        float _2245 = _2239 * 0.15915493667125701904296875;
        float _2247 = _2245 * 6.283185482025146484375;
        float _2249 = cos(_2247);
        float _2251 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2253 = _2251 * 0.15915493667125701904296875;
        float _2255 = _2245 * 6.283185482025146484375;
        float _2257 = sin(_2255);
        float _2259 = 1.0 / _2249;
        float _2261 = _2253 * 6.283185482025146484375;
        float _2263 = cos(_2261);
        float _2265 = _2257 * _2259;
        float _2267 = 1.0 / _2243;
        float _2269 = _2263 * _2265;
        float _2271 = _2253 * 6.283185482025146484375;
        float _2273 = sin(_2271);
        float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2277 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2275;
        float _2279 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2281 = _2267 * _2279;
        float _2283 = 1.0 / _2269;
        float _2285 = 1.0 / _2277;
        float _2287 = _2273 * _2283;
        float _2289 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2291 = fma(_2287, _2281, _2289);
        float _2293 = _2291 * _2285;
        float _2295 = precise::clamp(_2293, 0.0, 1.0);
        _2237 = _2295;
    }
    float _2297 = _2237;
    float _2299 = _2231 * _2229;
    float _2301 = _2082 * 0.5;
    float _2303 = -_2223;
    float _2305 = _2303 + 1.0;
    bool _2307 = _2297 > 0.0;
    bool _2309 = isnan(_2297);
    bool _2311 = _2307 || _2309;
    bool _2313 = isnan(0.0);
    bool _2315 = _2311 || _2313;
    float _2317 = _2299 * _2297;
    float _2319 = fma(_2112, -0.5, _2301);
    float _2321 = _2221 + _2082;
    float _2323 = _2104 + _2082;
    float _2325 = _2317 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2327 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2104;
    out.gl_Position.y = _2112;
    out.gl_Position.z = _2221;
    out.gl_Position.w = _2082;
    float _2329 = _2321 * 0.5;
    float _2331 = _2327 * _2138;
    float _2333 = -_2327;
    float _2335 = _2333 + 1.0;
    float _2337 = _2323 * 0.5;
    float _2339 = _2325 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2341 = _2149 * _2331;
    float _2343 = _2159 * _2331;
    float _2345 = _2149 * _2335;
    out.m_63.x = _2337;
    out.m_63.y = _2319;
    out.m_63.z = _2329;
    out.m_63.w = _2082;
    float _2347 = fma(_2155, _2341, _2143);
    float _2349 = fma(_2157, _2341, _2145);
    float _2351 = fma(_2149, _2343, _2147);
    out.m_47.x = _2339;
    out.m_65.x = _2347;
    out.m_65.y = _2349;
    out.m_65.z = _2351;
    out.m_65.w = _2345;
    if (_2315)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2353 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2353;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

