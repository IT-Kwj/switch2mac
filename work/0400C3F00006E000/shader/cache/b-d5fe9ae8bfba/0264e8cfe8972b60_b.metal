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
    float4 m_63 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_67 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1664 = false;
    bool _1098 = false;
    bool _716 = false;
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2152 = as_type<float>(_106);
        out.gl_Position.z = _2152;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_49.w;
    float _112 = in.m_51.x;
    bool _114 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_110);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_110;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _112;
    float _128 = 0.0;
    float _130 = _112;
    if (_122)
    {
        float _132 = float(_90);
        _128 = _132;
    }
    float _134 = _128;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    if (_140)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _100;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _108 = as_type<int>(_144);
    }
    int _146 = _108;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2225 = as_type<float>(_146);
        out.gl_Position.z = _2225;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    int _162 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _164 = _162 != 0;
    float _166 = _150 * _148;
    float _168 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _168 * 6.283185482025146484375;
    float _178 = floor(_168);
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _184 = 0.0;
    float _186 = _182;
    if (!_160)
    {
        float _188 = _182 * _182;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = cos(_194);
    float _198 = _192;
    if (!_160)
    {
        float _200 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    float _204 = -_178;
    float _206 = _168 + _204;
    bool _208 = !_160;
    float _210 = _202;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _182 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _182);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_160;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _182 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _186 = _264;
    }
    float _266 = _186;
    float _268 = in.m_55.w;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _276 = _274 != 0;
    float _278 = -_206;
    float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _282 = _206 < 0.5;
    float _284 = float(_282);
    float _286 = fma(_196, 0.5, 0.5);
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    bool _294 = !_272;
    int _296 = _294 ? 0 : 1;
    float _298 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _300 = -_284;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _304 = !_164;
    int _306 = _304 ? 0 : 1;
    float _308 = -_286;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _312 = abs(_296);
    float _314 = fma(_266, _170, _298);
    int _316 = abs(_306);
    float _318 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_276;
    int _322 = _320 ? 0 : 1;
    float _324 = fma(_266, _172, _318);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _328 = abs(_322);
    float _330 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _332 = float(_312);
    float _334 = float(_316);
    float _336 = fma(_266, _174, _330);
    float _338 = abs(_280);
    float _340 = _332 * _338;
    float _342 = fma(_314, _268, _288);
    float _344 = fma(_336, _268, _292);
    float _346 = float(_328);
    float _348 = fma(_334, _310, _340);
    float _350 = fma(_324, _268, _290);
    float _352 = abs(_302);
    float _354 = fma(_346, _352, _348);
    bool _356 = !_326;
    bool _358 = false;
    float _374;
    if (!_356)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _362 = _112 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_90);
        float _380 = 1.0 / _378;
        float _382 = _126 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _402 = 1.0 / _388;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _404;
    float _408 = 1.0 / _392;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _412 = _384 + _410;
    bool _414 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _416 = isnan(_384);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = 1.0 / _400;
    float _428 = _412 * _402;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _432 = _384 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _436 = _384 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _440 = _384 + _438;
    bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _444 = 1.0 / _406;
    float _446 = _432 * _408;
    bool _448 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _450 = isnan(_384);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -_458;
    float _462 = _460 + 1.0;
    float _464 = 1.0 / _396;
    float _466 = _436 * _426;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _468;
    float _472 = fma(_470, _428, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _476 = _384 + _474;
    float _478 = _476 * _444;
    bool _480 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _482 = isnan(_384);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _492;
    float _496 = _440 * _464;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _498;
    float _502 = -_490;
    float _504 = _502 + 1.0;
    float _506 = fma(_494, _428, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _508 = fma(_500, _428, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _510 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _512 = isnan(_384);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = _458 * _504;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _532 = _424 * _462;
    float _534 = -_424;
    float _536 = _534 + 1.0;
    bool _538 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _540 = isnan(_384);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = fma(_526, _446, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _552 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _554 = isnan(_384);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = _520 * _536;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _570 = -_520;
    float _572 = _570 + 1.0;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _574;
    float _578 = -_562;
    float _580 = _578 + 1.0;
    float _582 = fma(_530, _446, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _584 = _562 * _572;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _590;
    float _594 = _548 * _580;
    float _596 = fma(_568, _446, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _598 = fma(_588, _496, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _600 = fma(_576, _496, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _602 = fma(_592, _496, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _604 = _508 * _594;
    float _606 = _472 * _594;
    float _608 = -_548;
    float _610 = _608 + 1.0;
    float _612 = _506 * _594;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _626 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[143].x, _604);
    float _628 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[143].y, _606);
    float _630 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[143].z, _612);
    float _632 = fma(_616, _466, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _634 = fma(_620, _466, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _636 = fma(_624, _466, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _638 = fma(_550, _584, _626);
    float _640 = fma(_582, _584, _628);
    float _642 = in.m_55.x;
    float _644 = in.m_55.y;
    float _646 = in.m_55.z;
    float _648 = fma(_596, _584, _630);
    float _650 = fma(_598, _564, _638);
    float _652 = fma(_600, _564, _640);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _654;
    float _658 = fma(_602, _564, _648);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _660;
    float _664 = fma(_632, _532, _650);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _666;
    float _670 = fma(_656, _478, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _672 = fma(_662, _478, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _674 = fma(_634, _532, _652);
    float _676 = fma(_668, _478, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _678 = fma(_636, _532, _658);
    float _680 = fma(_670, _522, _664);
    float _682 = fma(_672, _522, _674);
    float _684 = fma(_676, _522, _678);
    float _686 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[148].x, _680);
    float _688 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[148].y, _682);
    float _690 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[148].z, _684);
    float _692 = _686 * _642;
    float _694 = _688 * _644;
    float _696 = _690 * _646;
    bool _698 = !_442;
    float _714;
    if (!_698)
    {
        float _700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _702 = _112 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _706 = _704 * _700;
        float _708 = floor(_706);
        float _710 = -_708;
        float _712 = _706 + _710;
        _714 = _712;
        _716 = true;
    }
    else
    {
        float _718 = float(_90);
        float _720 = 1.0 / _718;
        float _722 = _126 * _720;
        _714 = _722;
    }
    _716 = false;
    float _724 = _714;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _728 = _724 + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _746 = 1.0 / _732;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _748;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _756 = 1.0 / _740;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _760 = _724 + _758;
    bool _762 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _764 = isnan(_724);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    bool _774 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _776 = isnan(_724);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    bool _786 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _788 = isnan(_724);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = 1.0 / _750;
    float _800 = _760 * _746;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _804 = _724 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _808 = _724 + _806;
    bool _810 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _812 = isnan(_724);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = 1.0 / _736;
    float _824 = _804 * _756;
    bool _826 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _828 = isnan(_724);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _840 = _724 + _838;
    float _842 = 1.0 / _744;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _846 = _724 + _844;
    float _848 = _728 * _798;
    float _850 = -_836;
    float _852 = _850 + 1.0;
    bool _854 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _856 = 1.0 / _754;
    float _858 = _846 * _822;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _860;
    float _864 = _772 * _852;
    float _866 = fma(_862, _800, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _868 = _840 * _842;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _874;
    float _878 = fma(_876, _800, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _880 = -_784;
    float _882 = _880 + 1.0;
    float _884 = _808 * _856;
    float _886 = -_772;
    float _888 = _886 + 1.0;
    float _890 = fma(_872, _800, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _892 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _894 = isnan(_724);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = _784 * _888;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _914 = -_902;
    float _916 = _914 + 1.0;
    float _918 = _902 * _882;
    bool _920 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _922 = isnan(_724);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _936 = _796 * _916;
    float _938 = -_796;
    float _940 = _938 + 1.0;
    float _942 = fma(_912, _858, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _944 = -_930;
    float _946 = _944 + 1.0;
    float _948 = fma(_908, _858, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _950 = _930 * _940;
    float _952 = fma(_934, _858, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _954;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _958;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _962;
    float _966 = _820 * _946;
    float _968 = fma(_956, _848, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _970 = fma(_960, _848, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _972 = fma(_964, _848, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _974 = _890 * _966;
    float _976 = _878 * _966;
    float _978 = -_820;
    float _980 = _978 + 1.0;
    float _982 = _866 * _966;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _996 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[107].x, _974);
    float _998 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[107].y, _976);
    float _1000 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[107].z, _982);
    float _1002 = fma(_986, _884, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1004 = fma(_990, _884, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1006 = fma(_994, _884, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1008 = fma(_942, _950, _996);
    float _1010 = fma(_948, _950, _998);
    float _1012 = fma(_952, _950, _1000);
    float _1014 = fma(_968, _936, _1008);
    float _1016 = fma(_970, _936, _1010);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _1018;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _1022;
    float _1026 = fma(_972, _936, _1012);
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _1028;
    float _1032 = fma(_1020, _824, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _1034 = fma(_1024, _824, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _1036 = fma(_1002, _918, _1014);
    float _1038 = fma(_1030, _824, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _1040 = fma(_1004, _918, _1016);
    float _1042 = fma(_1006, _918, _1026);
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1056 = fma(_1032, _904, _1036);
    float _1058 = fma(_1046, _868, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _1060 = fma(_1050, _868, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _1062 = fma(_1054, _868, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _1064 = fma(_1034, _904, _1040);
    float _1066 = fma(_1038, _904, _1042);
    float _1068 = fma(_1058, _864, _1056);
    float _1070 = fma(_1060, _864, _1064);
    float _1072 = fma(_1062, _864, _1066);
    float _1074 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[113].x, _1068);
    float _1076 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[113].y, _1070);
    float _1078 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[113].z, _1072);
    bool _1080 = !_854;
    float _1096;
    if (!_1080)
    {
        float _1082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1084 = _112 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1086 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _1088 = _1086 * _1082;
        float _1090 = floor(_1088);
        float _1092 = -_1090;
        float _1094 = _1088 + _1092;
        _1096 = _1094;
        _1098 = true;
    }
    else
    {
        float _1100 = float(_90);
        float _1102 = 1.0 / _1100;
        float _1104 = _126 * _1102;
        _1096 = _1104;
    }
    _1098 = false;
    float _1106 = _1096;
    float _1108 = in.m_51.w;
    float _1110 = _354 * _692;
    float _1112 = _354 * _694;
    float _1114 = in.m_57.x;
    float _1116 = in.m_57.y;
    float _1118 = in.m_57.z;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1122 = _1120 != 0;
    float _1124 = _354 * _696;
    float _1126 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1128 = in.m_51.y;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1132 = _1130 != 0;
    float _1134 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1138 = _1136 != 0;
    float _1140 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1144 = _1142 != 0;
    float _1146 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1126);
    float _1148 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1140);
    float _1150 = _1034;
    if (_1122)
    {
        float _1152 = in.m_51.z;
        _1150 = _1152;
    }
    float _1154 = _1150;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1160 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1162 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1134);
    float _1164 = _112 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1166 = _1108 > 0.5;
    float _1168 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1170 = 1.0 / _1158;
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1118);
    float _1174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1114);
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1178 = _1176 != 0;
    float _1180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1116);
    float _1182 = in.m_59.y;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1188 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1190 = _1160 * _1174;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1192;
    float _1196 = in.m_59.x;
    float _1198 = fma(_1188, -2.0, _1186);
    float _1200 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1162);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1204 = _1160;
    bool _1206 = _1166;
    if (_1122)
    {
        bool _1208 = _1154 > 0.5;
        _358 = _1208;
    }
    bool _1210 = _358;
    float _1212 = _1168 * _1180;
    float _1214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1216 = _1194 * _1170;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1220 = _1106 + _1218;
    float _1222 = -_1184;
    float _1224 = fma(_1164, 2.0, _1222);
    float _1226 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1148);
    float _1228 = _1164;
    if (!_1178)
    {
        float _1230 = in.m_51.z;
        _1228 = _1230;
    }
    float _1232 = _1228;
    float _1234 = fma(_1216, _1220, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1236 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1146);
    float _1238 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1240 = _1236 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1242 = -_1182;
    float _1244 = _1242 + 1.0;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1248 = _1238 * _1172;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1252 = _1182;
    float _1254 = _1238;
    if (!_1178)
    {
        _1202 = _1128;
    }
    float _1256 = _1202;
    float _1258 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1246);
    int _1260 = _1166 ? as_type<int>(_1244) : as_type<int>(_1182);
    float _1262 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1250);
    float _1264 = _1256;
    if (!_1132)
    {
        _1204 = _1196;
    }
    float _1266 = _1204;
    float _1268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1270 = _1138 ? as_type<float>(_1260) : _1182;
    float _1272 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1274 = _1128 > 0.5;
    float _1276 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1262);
    bool _1278 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1280 = isnan(_1106);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1272);
    float _1292 = _1266;
    if (_1144)
    {
        float _1294 = _1274 ? _1244 : _1182;
        _1252 = _1294;
    }
    float _1296 = _1252;
    float _1298 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1132)
    {
        bool _1300 = _112 > 0.5;
        _1206 = _1300;
    }
    bool _1302 = _1206;
    float _1304 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1290);
    if (_1178)
    {
        _1264 = _112;
    }
    float _1306 = _1264;
    float _1308 = fma(_1270, _1298, -0.5);
    float _1310 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_1132)
    {
        _130 = _1266;
    }
    float _1312 = _130;
    float _1314 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1316 = _1232;
    float _1318 = _1312;
    if (!_1178)
    {
        _1254 = _1232;
    }
    float _1320 = _1254;
    float _1322 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1310);
    bool _1324 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1326 = isnan(_1106);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1332 = _1328 || _1330;
    float _1334 = float(_1332);
    float _1336 = -_1288;
    float _1338 = _1336 + 1.0;
    float _1340 = _1320;
    if (_1132)
    {
        _1292 = _1196;
    }
    float _1342 = _1292;
    float _1344 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1322);
    float _1346 = _1342;
    if (_1178)
    {
        _1340 = _1128;
    }
    float _1348 = _1340;
    float _1350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1178)
    {
        _1316 = _1128;
    }
    float _1352 = _1316;
    float _1354 = _1226 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1356 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1358 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1360 = _1334 * _1338;
    float _1362 = _1354 + _1314;
    float _1364 = _1240 + _1356;
    float _1366 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1358);
    float _1368 = _1234 * _1360;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1372 = _1362 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1376 = _1364 + _1374;
    float _1378 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1380 = _1372 * _1372;
    float _1382 = _1376 * _1376;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1386 = _1382 + _1380;
    float _1388 = fma(_1378, _1296, -0.5);
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1392 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1384);
    float _1394 = sqrt(_1386);
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1398 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1390);
    float _1400 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1402 = as_type<int>(_1384);
    float _1404 = _1382;
    float _1406 = _1380;
    float _1408 = _1364;
    float _1410 = _1362;
    if (_1132)
    {
        float _1412 = -_1342;
        float _1414 = _1412 + 1.0;
        _1402 = as_type<int>(_1414);
    }
    int _1416 = _1402;
    float _1418 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1366);
    float _1420 = -_1396;
    float _1422 = fma(_1400, 2.0, _1420);
    float _1424 = _1200 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1430 = _1416;
    float _1432 = _1424;
    if (_1132)
    {
        float _1434 = _1302 ? as_type<float>(_1416) : _1342;
        _1318 = _1434;
    }
    float _1436 = _1318;
    float _1438 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1198);
    if (_1122)
    {
        float _1440 = -_1342;
        float _1442 = _1440 + 1.0;
        _1430 = as_type<int>(_1442);
    }
    int _1444 = _1430;
    float _1446 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1448 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1450 = _1394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1452 = -_1334;
    float _1454 = _1452 + 1.0;
    float _1456 = -_1438;
    float _1458 = fma(_1276, _1388, _1456);
    float _1460 = fma(_1446, -2.0, _1428);
    if (_1122)
    {
        float _1462 = _1210 ? as_type<float>(_1444) : _1342;
        _1346 = _1462;
    }
    float _1464 = _1346;
    float _1466 = _1424 + _1448;
    float _1468 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1368);
    float _1470 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1472 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1474 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1468);
    float _1476 = fma(_1470, _1436, -0.5);
    float _1478 = fma(_1472, _1464, -0.5);
    float _1480 = _1474;
    if (!_1450)
    {
        _1432 = _1466;
    }
    float _1482 = _1432;
    bool _1484 = !_1450;
    float _1486 = _1482;
    if (!_1484)
    {
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1492 = _1394 + _1490;
        float _1494 = rsqrt(_1386);
        float _1496 = _1492 * _1488;
        float _1498 = _1466 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1500 = _1496 * 0.15915493667125701904296875;
        float _1502 = _1500 * 6.283185482025146484375;
        float _1504 = sin(_1502);
        float _1506 = _1500 * 6.283185482025146484375;
        float _1508 = cos(_1506);
        float _1510 = fma(_1504, _1498, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1512 = _1494 * _1510;
        float _1514 = fma(_1376, _1512, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1516 = _1508 + (-1.0);
        float _1518 = fma(_1372, _1512, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1522 = _1514 + _1520;
        float _1524 = _1516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1528 = _1518 + _1526;
        float _1530 = _1522 * _1522;
        float _1532 = fma(_1466, _1508, _1524);
        float _1534 = _1528 * _1528;
        _1486 = _1532;
        _1404 = _1530;
        _1406 = _1534;
        _1408 = _1514;
        _1410 = _1518;
    }
    float _1536 = _1486;
    float _1538 = _1404;
    float _1540 = _1406;
    float _1542 = _1408;
    float _1544 = _1410;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1548 = _1536 + _1546;
    float _1550 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1258);
    float _1552 = -_126;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1224);
    float _1556 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1398);
    float _1558 = fma(_1548, _1548, _1538);
    float _1560 = -_126;
    float _1562 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1422);
    float _1564 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1392);
    float _1566 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1460);
    float _1568 = _1558 + _1540;
    float _1570 = fma(_1550, _1476, _1554);
    float _1572 = fma(_1556, _1478, _1562);
    float _1574 = -_1566;
    float _1576 = fma(_1564, _1308, _1574);
    float _1578 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1580 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1582 = sqrt(_1568);
    float _1584 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1594 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1596 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1600 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1602 = _1588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1604 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1606 = _1458 + 0.5;
    float _1608 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1610 = _1570 + 0.5;
    float _1612 = _1572 + 0.5;
    float _1614 = _1576 + 0.5;
    out.m_61.x = _1600;
    out.m_61.y = _1602;
    out.m_61.z = _1604;
    out.m_61.w = _1598;
    bool _1616 = _1582 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1618 = isnan(_1582);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1624 = _1620 || _1622;
    out.m_63.x = _1592;
    out.m_63.y = _1594;
    out.m_63.z = _1596;
    out.m_63.w = _1608;
    out.m_65.x = _1610;
    out.m_65.y = _1606;
    out.m_65.z = _1612;
    out.m_65.w = _1614;
    float _1626 = _1576;
    float _1628 = _1572;
    if (!_1624)
    {
        _1626 = 1.0;
    }
    float _1630 = _1626;
    bool _1632 = !_1624;
    float _1634 = _1630;
    if (!_1632)
    {
        bool _1636 = _1582 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1638 = isnan(_1582);
        bool _1640 = _1636 || _1638;
        bool _1642 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1644 = _1640 || _1642;
        if (!_1644)
        {
            float _1646 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1648 = _1582 + _1646;
            float _1650 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1652 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1650;
            float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1656 = _1654 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1658 = 1.0 / _1652;
            float _1660 = _1648 * _1658;
            float _1662 = fma(_1660, _1656, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1634 = _1662;
            _1664 = true;
        }
        else
        {
            bool _1666 = _1582 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1668 = isnan(_1582);
            bool _1670 = _1666 || _1668;
            bool _1672 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1674 = _1670 || _1672;
            if (!_1674)
            {
                float _1676 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1678 = _1582 + _1676;
                float _1680 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1682 = _1680 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1684 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1686 = _1684 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1688 = 1.0 / _1682;
                float _1690 = _1678 * _1688;
                float _1692 = fma(_1690, _1686, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1634 = _1692;
                _1664 = true;
            }
            else
            {
                _1634 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1664 = false;
    float _1694 = _1634;
    float _1696 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1698 = _1536 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1702 = _1542 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1706 = _1544 + _1704;
    float _1708 = fma(_1698, _1694, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1710 = fma(_1702, _1694, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1712 = fma(_1706, _1694, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1716 = _1708 + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1720 = _1710 + _1718;
    float _1722 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1724 = _1712 + _1722;
    float _1726 = _1716 * _1716;
    float _1728 = fma(_1720, _1720, _1726);
    float _1730 = fma(_1724, _1724, _1728);
    float _1732 = rsqrt(_1730);
    float _1734 = sqrt(_1730);
    float _1736 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1738 = _1720 * _1736;
    float _1740 = _1724 * _1736;
    float _1742 = _1738 * _1738;
    float _1744 = _1740 * _1740;
    float _1746 = _1742 + _1744;
    float _1748 = sqrt(_1746);
    bool _1750 = _1748 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1754 = _1748 + _1752;
    float _1756 = _1724;
    float _1758 = _1754;
    float _1760 = _1716;
    float _1762 = _1736;
    if (_1750)
    {
        float _1764 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1756 = _1764;
    }
    float _1766 = _1756;
    if (_1750)
    {
        float _1768 = rsqrt(_1746);
        _1628 = _1768;
    }
    float _1770 = _1628;
    float _1772 = _1770;
    if (_1750)
    {
        float _1774 = _1754 * _1766;
        _1758 = _1774;
    }
    float _1776 = _1758;
    if (_1750)
    {
        float _1778 = _1776 * 0.15915493667125701904296875;
        _1480 = _1778;
    }
    float _1780 = _1480;
    float _1782 = _1732;
    if (_1750)
    {
        float _1784 = _1780 * 6.283185482025146484375;
        float _1786 = sin(_1784);
        _1782 = _1786;
    }
    float _1788 = _1782;
    float _1790 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1792 = precise::max(0.0, _1790);
    float _1794 = _1728;
    float _1796 = _1790;
    if (_1750)
    {
        float _1798 = _1780 * 6.283185482025146484375;
        float _1800 = cos(_1798);
        _1794 = _1800;
    }
    float _1802 = _1794;
    float _1804 = -_1736;
    float _1806 = -_1792;
    float _1808 = fma(_1716, _1804, _1806);
    float _1810 = _1808;
    if (_1750)
    {
        float _1812 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1796 = _1812;
    }
    float _1814 = _1796;
    float _1816 = _1788;
    float _1818 = _1814;
    if (_1750)
    {
        float _1820 = fma(_1788, _1814, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1760 = _1820;
    }
    float _1822 = _1760;
    float _1824 = _1822;
    if (!_1750)
    {
        _1816 = _1738;
    }
    float _1826 = _1816;
    float _1828 = _1826;
    float _1830 = _1802;
    if (_1750)
    {
        float _1832 = _1802 + (-1.0);
        _1818 = _1832;
    }
    float _1834 = _1818;
    float _1836 = _1834;
    if (_1750)
    {
        float _1838 = _1770 * _1822;
        _1762 = _1838;
    }
    float _1840 = _1762;
    if (!_1750)
    {
        _1824 = _1742;
    }
    float _1842 = _1824;
    float _1844 = _1842;
    if (_1750)
    {
        float _1846 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1772 = _1846;
    }
    float _1848 = _1772;
    if (_1750)
    {
        float _1850 = _1738 * _1840;
        _1828 = _1850;
    }
    float _1852 = _1828;
    if (!_1750)
    {
        _1836 = _1740;
    }
    float _1854 = _1836;
    float _1856 = _1854;
    if (_1750)
    {
        float _1858 = _1740 * _1840;
        _1856 = _1858;
    }
    float _1860 = _1856;
    if (_1750)
    {
        float _1862 = fma(_1808, _1802, _1848);
        _1810 = _1862;
    }
    float _1864 = _1810;
    if (_1750)
    {
        float _1866 = _1852 * _1852;
        _1844 = _1866;
    }
    float _1868 = _1844;
    if (!_1750)
    {
        _1830 = _1744;
    }
    float _1870 = _1830;
    float _1872 = _1870;
    if (_1750)
    {
        float _1874 = _1860 * _1860;
        _1872 = _1874;
    }
    float _1876 = _1872;
    float _1878 = fma(_1864, _1864, _1868);
    float _1880 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1882 = _1878 + _1876;
    float _1884 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1888 = fma(_1734, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1886);
    float _1890 = precise::clamp(_1888, 0.0, 1.0);
    float _1892 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1894 = rsqrt(_1882);
    float _1896 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1884);
    float _1898 = -_1890;
    float _1900 = _1898 + 1.0;
    float _1902 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1892);
    float _1904 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1880);
    float _1906 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1896);
    float _1908 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1910 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1902);
    float _1912 = abs(_1900);
    float _1914 = log2(_1912);
    float _1916 = _1906 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1918 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1908);
    float _1920 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1922 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1904);
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1926 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1918);
    float _1928 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1930 = _1894 * _1852;
    float _1932 = -_1924;
    float _1934 = fma(_1932, _1920, 1.0);
    float _1936 = _1926 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1938 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1940 = _1894 * _1864;
    float _1942 = _1894 * _1860;
    float _1944 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1946 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1938);
    float _1948 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1950 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1952 = log2(_1934);
    float _1954 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1946);
    float _1956 = -_1948;
    float _1958 = fma(_1940, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1956);
    float _1960 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1962 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1954);
    float _1964 = -_1942;
    float _1966 = fma(_1964, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1958);
    float _1968 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1970 = exp2(_1950);
    float _1972 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1960);
    float _1974 = fma(_1966, -0.5, 0.5);
    float _1976 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1968);
    float _1978 = fma(_1966, 0.5, 0.5);
    float _1980 = _1940 + 1.0;
    float _1982 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1972);
    float _1984 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1976);
    float _1986 = 1.0 / _1962;
    float _1988 = fma(_1978, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1990 = _1952 * 0.693147182464599609375;
    float _1992 = fma(_1978, _1988, -0.212114393711090087890625);
    float _1994 = _1990 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1996 = sqrt(_1974);
    float _1998 = -_1940;
    float _2000 = fma(_1970, _1980, _1998);
    float _2002 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1984);
    float _2004 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1982);
    float _2006 = fma(_1978, _1992, 1.570728778839111328125);
    float _2008 = fma(_2000, 0.5, 0.5);
    float _2010 = _2002 * _1986;
    float _2012 = _2004 * _1986;
    float _2014 = fma(_2010, 0.5, 0.5);
    float _2016 = fma(_2012, -0.5, 0.5);
    float _2018 = _1996 * 0.636619746685028076171875;
    float3 _5349 = float3(_2014, _2016, _1994);
    float _2020 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5349, float3(0.0), isnan(_5349)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5349, float3(0.0), isnan(_5349)), level(0.0)).x;
    float3 _5360 = float3(_2014, _2016, _1994);
    float4 _2023 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5360, float3(0.0), isnan(_5360)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5360, float3(0.0), isnan(_5360)), level(0.0)).xyzw;
    float _2025 = _2023.x;
    float _2027 = _2023.y;
    float _2029 = _2023.z;
    float _2031 = _2023.w;
    float _2033 = -_2006;
    float _2035 = fma(_2018, _2033, 1.0);
    float2 _5382 = float2(_2035, _2008);
    float3 _2039 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5382, float2(0.0), isnan(_5382)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5382, float2(0.0), isnan(_5382)), level(0.0)).xyz;
    float _2041 = _2039.x;
    float _2043 = _2039.y;
    float _2045 = _2039.z;
    float _2047 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2049 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2051 = _2002 + _1962;
    float _2053 = _1962 * 0.5;
    float _2055 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2047);
    out.m_67.x = _1710;
    out.m_67.y = _1708;
    out.m_67.z = _1712;
    float _2057 = exp2(_2049);
    float _2059 = _2051 * 0.5;
    float _2061 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2055);
    float _2063 = fma(_2004, -0.5, _2053);
    float _2065 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2061);
    float _2067 = _2065 + _1962;
    out.gl_Position.x = _2002;
    out.gl_Position.y = _2004;
    out.gl_Position.z = _2065;
    out.gl_Position.w = _1962;
    float _2069 = _2067 * 0.5;
    float _2071 = -_2057;
    float _2073 = _2071 + 1.0;
    float _2075 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2077 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2059;
    out.m_69.y = _2063;
    out.m_69.z = _2069;
    out.m_69.w = _1962;
    float _2079 = -_2075;
    float _2081 = _2079 + 1.0;
    out.m_47.x = _2077;
    float _2083 = _2075 * _2020;
    float _2085 = _2031 * _2083;
    float _2087 = _2045 * _2083;
    float _2089 = fma(_2041, _2085, _2025);
    float _2091 = fma(_2043, _2085, _2027);
    float _2093 = _2031 * _2081;
    float _2095 = fma(_2031, _2087, _2029);
    out.m_71.x = _2089;
    out.m_71.y = _2091;
    out.m_71.z = _2095;
    out.m_71.w = _2093;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1664 = false;
    bool _1098 = false;
    bool _716 = false;
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2152 = as_type<float>(_106);
        out.gl_Position.z = _2152;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_49.w;
    float _112 = in.m_51.x;
    bool _114 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_110);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_110;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _112;
    float _128 = 0.0;
    float _130 = _112;
    if (_122)
    {
        float _132 = float(_90);
        _128 = _132;
    }
    float _134 = _128;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    if (_140)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _100;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _108 = as_type<int>(_144);
    }
    int _146 = _108;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2225 = as_type<float>(_146);
        out.gl_Position.z = _2225;
    }
    if (_140)
    {
        return out;
    }
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    int _162 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _164 = _162 != 0;
    float _166 = _150 * _148;
    float _168 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _168 * 6.283185482025146484375;
    float _178 = floor(_168);
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _184 = 0.0;
    float _186 = _182;
    if (!_160)
    {
        float _188 = _182 * _182;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = cos(_194);
    float _198 = _192;
    if (!_160)
    {
        float _200 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    float _204 = -_178;
    float _206 = _168 + _204;
    bool _208 = !_160;
    float _210 = _202;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _182 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _182);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_160;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _182 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _186 = _264;
    }
    float _266 = _186;
    float _268 = in.m_55.w;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _276 = _274 != 0;
    float _278 = -_206;
    float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _282 = _206 < 0.5;
    float _284 = float(_282);
    float _286 = fma(_196, 0.5, 0.5);
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    bool _294 = !_272;
    int _296 = _294 ? 0 : 1;
    float _298 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _300 = -_284;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _304 = !_164;
    int _306 = _304 ? 0 : 1;
    float _308 = -_286;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _312 = abs(_296);
    float _314 = fma(_266, _170, _298);
    int _316 = abs(_306);
    float _318 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_276;
    int _322 = _320 ? 0 : 1;
    float _324 = fma(_266, _172, _318);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _328 = abs(_322);
    float _330 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _332 = float(_312);
    float _334 = float(_316);
    float _336 = fma(_266, _174, _330);
    float _338 = abs(_280);
    float _340 = _332 * _338;
    float _342 = fma(_314, _268, _288);
    float _344 = fma(_336, _268, _292);
    float _346 = float(_328);
    float _348 = fma(_334, _310, _340);
    float _350 = fma(_324, _268, _290);
    float _352 = abs(_302);
    float _354 = fma(_346, _352, _348);
    bool _356 = !_326;
    bool _358 = false;
    float _374;
    if (!_356)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _362 = _112 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_90);
        float _380 = 1.0 / _378;
        float _382 = _126 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _402 = 1.0 / _388;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _404;
    float _408 = 1.0 / _392;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _412 = _384 + _410;
    bool _414 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _416 = isnan(_384);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = 1.0 / _400;
    float _428 = _412 * _402;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _432 = _384 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _436 = _384 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _440 = _384 + _438;
    bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _444 = 1.0 / _406;
    float _446 = _432 * _408;
    bool _448 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _450 = isnan(_384);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -_458;
    float _462 = _460 + 1.0;
    float _464 = 1.0 / _396;
    float _466 = _436 * _426;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _468;
    float _472 = fma(_470, _428, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _476 = _384 + _474;
    float _478 = _476 * _444;
    bool _480 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _482 = isnan(_384);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _492;
    float _496 = _440 * _464;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _498;
    float _502 = -_490;
    float _504 = _502 + 1.0;
    float _506 = fma(_494, _428, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _508 = fma(_500, _428, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _510 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _512 = isnan(_384);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = _458 * _504;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _532 = _424 * _462;
    float _534 = -_424;
    float _536 = _534 + 1.0;
    bool _538 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _540 = isnan(_384);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = fma(_526, _446, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _552 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _554 = isnan(_384);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = _520 * _536;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _570 = -_520;
    float _572 = _570 + 1.0;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _574;
    float _578 = -_562;
    float _580 = _578 + 1.0;
    float _582 = fma(_530, _446, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _584 = _562 * _572;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _590;
    float _594 = _548 * _580;
    float _596 = fma(_568, _446, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _598 = fma(_588, _496, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _600 = fma(_576, _496, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _602 = fma(_592, _496, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _604 = _508 * _594;
    float _606 = _472 * _594;
    float _608 = -_548;
    float _610 = _608 + 1.0;
    float _612 = _506 * _594;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _626 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[143].x, _604);
    float _628 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[143].y, _606);
    float _630 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[143].z, _612);
    float _632 = fma(_616, _466, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _634 = fma(_620, _466, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _636 = fma(_624, _466, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _638 = fma(_550, _584, _626);
    float _640 = fma(_582, _584, _628);
    float _642 = in.m_55.x;
    float _644 = in.m_55.y;
    float _646 = in.m_55.z;
    float _648 = fma(_596, _584, _630);
    float _650 = fma(_598, _564, _638);
    float _652 = fma(_600, _564, _640);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _654;
    float _658 = fma(_602, _564, _648);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _660;
    float _664 = fma(_632, _532, _650);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _666;
    float _670 = fma(_656, _478, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _672 = fma(_662, _478, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _674 = fma(_634, _532, _652);
    float _676 = fma(_668, _478, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _678 = fma(_636, _532, _658);
    float _680 = fma(_670, _522, _664);
    float _682 = fma(_672, _522, _674);
    float _684 = fma(_676, _522, _678);
    float _686 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[148].x, _680);
    float _688 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[148].y, _682);
    float _690 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[148].z, _684);
    float _692 = _686 * _642;
    float _694 = _688 * _644;
    float _696 = _690 * _646;
    bool _698 = !_442;
    float _714;
    if (!_698)
    {
        float _700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _702 = _112 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _706 = _704 * _700;
        float _708 = floor(_706);
        float _710 = -_708;
        float _712 = _706 + _710;
        _714 = _712;
        _716 = true;
    }
    else
    {
        float _718 = float(_90);
        float _720 = 1.0 / _718;
        float _722 = _126 * _720;
        _714 = _722;
    }
    _716 = false;
    float _724 = _714;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _728 = _724 + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _746 = 1.0 / _732;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _748;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _756 = 1.0 / _740;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _760 = _724 + _758;
    bool _762 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _764 = isnan(_724);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    bool _774 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _776 = isnan(_724);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    bool _786 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _788 = isnan(_724);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = 1.0 / _750;
    float _800 = _760 * _746;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _804 = _724 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _808 = _724 + _806;
    bool _810 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _812 = isnan(_724);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = 1.0 / _736;
    float _824 = _804 * _756;
    bool _826 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _828 = isnan(_724);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _840 = _724 + _838;
    float _842 = 1.0 / _744;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _846 = _724 + _844;
    float _848 = _728 * _798;
    float _850 = -_836;
    float _852 = _850 + 1.0;
    bool _854 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _856 = 1.0 / _754;
    float _858 = _846 * _822;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _860;
    float _864 = _772 * _852;
    float _866 = fma(_862, _800, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _868 = _840 * _842;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _874;
    float _878 = fma(_876, _800, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _880 = -_784;
    float _882 = _880 + 1.0;
    float _884 = _808 * _856;
    float _886 = -_772;
    float _888 = _886 + 1.0;
    float _890 = fma(_872, _800, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _892 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _894 = isnan(_724);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = _784 * _888;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _914 = -_902;
    float _916 = _914 + 1.0;
    float _918 = _902 * _882;
    bool _920 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _922 = isnan(_724);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _936 = _796 * _916;
    float _938 = -_796;
    float _940 = _938 + 1.0;
    float _942 = fma(_912, _858, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _944 = -_930;
    float _946 = _944 + 1.0;
    float _948 = fma(_908, _858, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _950 = _930 * _940;
    float _952 = fma(_934, _858, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _954;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _958;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _962;
    float _966 = _820 * _946;
    float _968 = fma(_956, _848, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _970 = fma(_960, _848, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _972 = fma(_964, _848, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _974 = _890 * _966;
    float _976 = _878 * _966;
    float _978 = -_820;
    float _980 = _978 + 1.0;
    float _982 = _866 * _966;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _996 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[107].x, _974);
    float _998 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[107].y, _976);
    float _1000 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[107].z, _982);
    float _1002 = fma(_986, _884, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1004 = fma(_990, _884, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1006 = fma(_994, _884, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1008 = fma(_942, _950, _996);
    float _1010 = fma(_948, _950, _998);
    float _1012 = fma(_952, _950, _1000);
    float _1014 = fma(_968, _936, _1008);
    float _1016 = fma(_970, _936, _1010);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _1018;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _1022;
    float _1026 = fma(_972, _936, _1012);
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _1028;
    float _1032 = fma(_1020, _824, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _1034 = fma(_1024, _824, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _1036 = fma(_1002, _918, _1014);
    float _1038 = fma(_1030, _824, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _1040 = fma(_1004, _918, _1016);
    float _1042 = fma(_1006, _918, _1026);
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1056 = fma(_1032, _904, _1036);
    float _1058 = fma(_1046, _868, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _1060 = fma(_1050, _868, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _1062 = fma(_1054, _868, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _1064 = fma(_1034, _904, _1040);
    float _1066 = fma(_1038, _904, _1042);
    float _1068 = fma(_1058, _864, _1056);
    float _1070 = fma(_1060, _864, _1064);
    float _1072 = fma(_1062, _864, _1066);
    float _1074 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[113].x, _1068);
    float _1076 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[113].y, _1070);
    float _1078 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[113].z, _1072);
    bool _1080 = !_854;
    float _1096;
    if (!_1080)
    {
        float _1082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1084 = _112 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1086 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _1088 = _1086 * _1082;
        float _1090 = floor(_1088);
        float _1092 = -_1090;
        float _1094 = _1088 + _1092;
        _1096 = _1094;
        _1098 = true;
    }
    else
    {
        float _1100 = float(_90);
        float _1102 = 1.0 / _1100;
        float _1104 = _126 * _1102;
        _1096 = _1104;
    }
    _1098 = false;
    float _1106 = _1096;
    float _1108 = in.m_51.w;
    float _1110 = _354 * _692;
    float _1112 = _354 * _694;
    float _1114 = in.m_57.x;
    float _1116 = in.m_57.y;
    float _1118 = in.m_57.z;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1122 = _1120 != 0;
    float _1124 = _354 * _696;
    float _1126 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1128 = in.m_51.y;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1132 = _1130 != 0;
    float _1134 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1138 = _1136 != 0;
    float _1140 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1144 = _1142 != 0;
    float _1146 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1126);
    float _1148 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1140);
    float _1150 = _1034;
    if (_1122)
    {
        float _1152 = in.m_51.z;
        _1150 = _1152;
    }
    float _1154 = _1150;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1160 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1162 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1134);
    float _1164 = _112 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1166 = _1108 > 0.5;
    float _1168 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1170 = 1.0 / _1158;
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1118);
    float _1174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1114);
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1178 = _1176 != 0;
    float _1180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1116);
    float _1182 = in.m_59.y;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1188 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1190 = _1160 * _1174;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1192;
    float _1196 = in.m_59.x;
    float _1198 = fma(_1188, -2.0, _1186);
    float _1200 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1162);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1204 = _1160;
    bool _1206 = _1166;
    if (_1122)
    {
        bool _1208 = _1154 > 0.5;
        _358 = _1208;
    }
    bool _1210 = _358;
    float _1212 = _1168 * _1180;
    float _1214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1216 = _1194 * _1170;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1220 = _1106 + _1218;
    float _1222 = -_1184;
    float _1224 = fma(_1164, 2.0, _1222);
    float _1226 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1148);
    float _1228 = _1164;
    if (!_1178)
    {
        float _1230 = in.m_51.z;
        _1228 = _1230;
    }
    float _1232 = _1228;
    float _1234 = fma(_1216, _1220, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1236 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1146);
    float _1238 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1240 = _1236 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1242 = -_1182;
    float _1244 = _1242 + 1.0;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1248 = _1238 * _1172;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1252 = _1182;
    float _1254 = _1238;
    if (!_1178)
    {
        _1202 = _1128;
    }
    float _1256 = _1202;
    float _1258 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1246);
    int _1260 = _1166 ? as_type<int>(_1244) : as_type<int>(_1182);
    float _1262 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1250);
    float _1264 = _1256;
    if (!_1132)
    {
        _1204 = _1196;
    }
    float _1266 = _1204;
    float _1268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1270 = _1138 ? as_type<float>(_1260) : _1182;
    float _1272 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1274 = _1128 > 0.5;
    float _1276 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1262);
    bool _1278 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1280 = isnan(_1106);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1272);
    float _1292 = _1266;
    if (_1144)
    {
        float _1294 = _1274 ? _1244 : _1182;
        _1252 = _1294;
    }
    float _1296 = _1252;
    float _1298 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1132)
    {
        bool _1300 = _112 > 0.5;
        _1206 = _1300;
    }
    bool _1302 = _1206;
    float _1304 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1290);
    if (_1178)
    {
        _1264 = _112;
    }
    float _1306 = _1264;
    float _1308 = fma(_1270, _1298, -0.5);
    float _1310 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_1132)
    {
        _130 = _1266;
    }
    float _1312 = _130;
    float _1314 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1316 = _1232;
    float _1318 = _1312;
    if (!_1178)
    {
        _1254 = _1232;
    }
    float _1320 = _1254;
    float _1322 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1310);
    bool _1324 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1326 = isnan(_1106);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1332 = _1328 || _1330;
    float _1334 = float(_1332);
    float _1336 = -_1288;
    float _1338 = _1336 + 1.0;
    float _1340 = _1320;
    if (_1132)
    {
        _1292 = _1196;
    }
    float _1342 = _1292;
    float _1344 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1322);
    float _1346 = _1342;
    if (_1178)
    {
        _1340 = _1128;
    }
    float _1348 = _1340;
    float _1350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1178)
    {
        _1316 = _1128;
    }
    float _1352 = _1316;
    float _1354 = _1226 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1356 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1358 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1360 = _1334 * _1338;
    float _1362 = _1354 + _1314;
    float _1364 = _1240 + _1356;
    float _1366 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1358);
    float _1368 = _1234 * _1360;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1372 = _1362 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1376 = _1364 + _1374;
    float _1378 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1380 = _1372 * _1372;
    float _1382 = _1376 * _1376;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1386 = _1382 + _1380;
    float _1388 = fma(_1378, _1296, -0.5);
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1392 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1384);
    float _1394 = sqrt(_1386);
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1398 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1390);
    float _1400 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1402 = as_type<int>(_1384);
    float _1404 = _1382;
    float _1406 = _1380;
    float _1408 = _1364;
    float _1410 = _1362;
    if (_1132)
    {
        float _1412 = -_1342;
        float _1414 = _1412 + 1.0;
        _1402 = as_type<int>(_1414);
    }
    int _1416 = _1402;
    float _1418 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1366);
    float _1420 = -_1396;
    float _1422 = fma(_1400, 2.0, _1420);
    float _1424 = _1200 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1430 = _1416;
    float _1432 = _1424;
    if (_1132)
    {
        float _1434 = _1302 ? as_type<float>(_1416) : _1342;
        _1318 = _1434;
    }
    float _1436 = _1318;
    float _1438 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1198);
    if (_1122)
    {
        float _1440 = -_1342;
        float _1442 = _1440 + 1.0;
        _1430 = as_type<int>(_1442);
    }
    int _1444 = _1430;
    float _1446 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1448 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1450 = _1394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1452 = -_1334;
    float _1454 = _1452 + 1.0;
    float _1456 = -_1438;
    float _1458 = fma(_1276, _1388, _1456);
    float _1460 = fma(_1446, -2.0, _1428);
    if (_1122)
    {
        float _1462 = _1210 ? as_type<float>(_1444) : _1342;
        _1346 = _1462;
    }
    float _1464 = _1346;
    float _1466 = _1424 + _1448;
    float _1468 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1368);
    float _1470 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1472 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1474 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1468);
    float _1476 = fma(_1470, _1436, -0.5);
    float _1478 = fma(_1472, _1464, -0.5);
    float _1480 = _1474;
    if (!_1450)
    {
        _1432 = _1466;
    }
    float _1482 = _1432;
    bool _1484 = !_1450;
    float _1486 = _1482;
    if (!_1484)
    {
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1492 = _1394 + _1490;
        float _1494 = rsqrt(_1386);
        float _1496 = _1492 * _1488;
        float _1498 = _1466 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1500 = _1496 * 0.15915493667125701904296875;
        float _1502 = _1500 * 6.283185482025146484375;
        float _1504 = sin(_1502);
        float _1506 = _1500 * 6.283185482025146484375;
        float _1508 = cos(_1506);
        float _1510 = fma(_1504, _1498, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1512 = _1494 * _1510;
        float _1514 = fma(_1376, _1512, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1516 = _1508 + (-1.0);
        float _1518 = fma(_1372, _1512, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1522 = _1514 + _1520;
        float _1524 = _1516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1528 = _1518 + _1526;
        float _1530 = _1522 * _1522;
        float _1532 = fma(_1466, _1508, _1524);
        float _1534 = _1528 * _1528;
        _1486 = _1532;
        _1404 = _1530;
        _1406 = _1534;
        _1408 = _1514;
        _1410 = _1518;
    }
    float _1536 = _1486;
    float _1538 = _1404;
    float _1540 = _1406;
    float _1542 = _1408;
    float _1544 = _1410;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1548 = _1536 + _1546;
    float _1550 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1258);
    float _1552 = -_126;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1224);
    float _1556 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1398);
    float _1558 = fma(_1548, _1548, _1538);
    float _1560 = -_126;
    float _1562 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1422);
    float _1564 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1392);
    float _1566 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1460);
    float _1568 = _1558 + _1540;
    float _1570 = fma(_1550, _1476, _1554);
    float _1572 = fma(_1556, _1478, _1562);
    float _1574 = -_1566;
    float _1576 = fma(_1564, _1308, _1574);
    float _1578 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1580 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1582 = sqrt(_1568);
    float _1584 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1594 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1596 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1600 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1602 = _1588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1604 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1606 = _1458 + 0.5;
    float _1608 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1610 = _1570 + 0.5;
    float _1612 = _1572 + 0.5;
    float _1614 = _1576 + 0.5;
    out.m_61.x = _1600;
    out.m_61.y = _1602;
    out.m_61.z = _1604;
    out.m_61.w = _1598;
    bool _1616 = _1582 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1618 = isnan(_1582);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1624 = _1620 || _1622;
    out.m_63.x = _1592;
    out.m_63.y = _1594;
    out.m_63.z = _1596;
    out.m_63.w = _1608;
    out.m_65.x = _1610;
    out.m_65.y = _1606;
    out.m_65.z = _1612;
    out.m_65.w = _1614;
    float _1626 = _1576;
    float _1628 = _1572;
    if (!_1624)
    {
        _1626 = 1.0;
    }
    float _1630 = _1626;
    bool _1632 = !_1624;
    float _1634 = _1630;
    if (!_1632)
    {
        bool _1636 = _1582 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1638 = isnan(_1582);
        bool _1640 = _1636 || _1638;
        bool _1642 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1644 = _1640 || _1642;
        if (!_1644)
        {
            float _1646 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1648 = _1582 + _1646;
            float _1650 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1652 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1650;
            float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1656 = _1654 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1658 = 1.0 / _1652;
            float _1660 = _1648 * _1658;
            float _1662 = fma(_1660, _1656, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1634 = _1662;
            _1664 = true;
        }
        else
        {
            bool _1666 = _1582 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1668 = isnan(_1582);
            bool _1670 = _1666 || _1668;
            bool _1672 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1674 = _1670 || _1672;
            if (!_1674)
            {
                float _1676 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1678 = _1582 + _1676;
                float _1680 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1682 = _1680 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1684 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1686 = _1684 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1688 = 1.0 / _1682;
                float _1690 = _1678 * _1688;
                float _1692 = fma(_1690, _1686, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1634 = _1692;
                _1664 = true;
            }
            else
            {
                _1634 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1664 = false;
    float _1694 = _1634;
    float _1696 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1698 = _1536 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1702 = _1542 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1706 = _1544 + _1704;
    float _1708 = fma(_1698, _1694, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1710 = fma(_1702, _1694, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1712 = fma(_1706, _1694, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1716 = _1708 + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1720 = _1710 + _1718;
    float _1722 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1724 = _1712 + _1722;
    float _1726 = _1716 * _1716;
    float _1728 = fma(_1720, _1720, _1726);
    float _1730 = fma(_1724, _1724, _1728);
    float _1732 = rsqrt(_1730);
    float _1734 = sqrt(_1730);
    float _1736 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1738 = _1720 * _1736;
    float _1740 = _1724 * _1736;
    float _1742 = _1738 * _1738;
    float _1744 = _1740 * _1740;
    float _1746 = _1742 + _1744;
    float _1748 = sqrt(_1746);
    bool _1750 = _1748 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1754 = _1748 + _1752;
    float _1756 = _1724;
    float _1758 = _1754;
    float _1760 = _1716;
    float _1762 = _1736;
    if (_1750)
    {
        float _1764 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1756 = _1764;
    }
    float _1766 = _1756;
    if (_1750)
    {
        float _1768 = rsqrt(_1746);
        _1628 = _1768;
    }
    float _1770 = _1628;
    float _1772 = _1770;
    if (_1750)
    {
        float _1774 = _1754 * _1766;
        _1758 = _1774;
    }
    float _1776 = _1758;
    if (_1750)
    {
        float _1778 = _1776 * 0.15915493667125701904296875;
        _1480 = _1778;
    }
    float _1780 = _1480;
    float _1782 = _1732;
    if (_1750)
    {
        float _1784 = _1780 * 6.283185482025146484375;
        float _1786 = sin(_1784);
        _1782 = _1786;
    }
    float _1788 = _1782;
    float _1790 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1792 = precise::max(0.0, _1790);
    float _1794 = _1728;
    float _1796 = _1790;
    if (_1750)
    {
        float _1798 = _1780 * 6.283185482025146484375;
        float _1800 = cos(_1798);
        _1794 = _1800;
    }
    float _1802 = _1794;
    float _1804 = -_1736;
    float _1806 = -_1792;
    float _1808 = fma(_1716, _1804, _1806);
    float _1810 = _1808;
    if (_1750)
    {
        float _1812 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1796 = _1812;
    }
    float _1814 = _1796;
    float _1816 = _1788;
    float _1818 = _1814;
    if (_1750)
    {
        float _1820 = fma(_1788, _1814, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1760 = _1820;
    }
    float _1822 = _1760;
    float _1824 = _1822;
    if (!_1750)
    {
        _1816 = _1738;
    }
    float _1826 = _1816;
    float _1828 = _1826;
    float _1830 = _1802;
    if (_1750)
    {
        float _1832 = _1802 + (-1.0);
        _1818 = _1832;
    }
    float _1834 = _1818;
    float _1836 = _1834;
    if (_1750)
    {
        float _1838 = _1770 * _1822;
        _1762 = _1838;
    }
    float _1840 = _1762;
    if (!_1750)
    {
        _1824 = _1742;
    }
    float _1842 = _1824;
    float _1844 = _1842;
    if (_1750)
    {
        float _1846 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1772 = _1846;
    }
    float _1848 = _1772;
    if (_1750)
    {
        float _1850 = _1738 * _1840;
        _1828 = _1850;
    }
    float _1852 = _1828;
    if (!_1750)
    {
        _1836 = _1740;
    }
    float _1854 = _1836;
    float _1856 = _1854;
    if (_1750)
    {
        float _1858 = _1740 * _1840;
        _1856 = _1858;
    }
    float _1860 = _1856;
    if (_1750)
    {
        float _1862 = fma(_1808, _1802, _1848);
        _1810 = _1862;
    }
    float _1864 = _1810;
    if (_1750)
    {
        float _1866 = _1852 * _1852;
        _1844 = _1866;
    }
    float _1868 = _1844;
    if (!_1750)
    {
        _1830 = _1744;
    }
    float _1870 = _1830;
    float _1872 = _1870;
    if (_1750)
    {
        float _1874 = _1860 * _1860;
        _1872 = _1874;
    }
    float _1876 = _1872;
    float _1878 = fma(_1864, _1864, _1868);
    float _1880 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1882 = _1878 + _1876;
    float _1884 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1888 = fma(_1734, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1886);
    float _1890 = precise::clamp(_1888, 0.0, 1.0);
    float _1892 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1894 = rsqrt(_1882);
    float _1896 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1884);
    float _1898 = -_1890;
    float _1900 = _1898 + 1.0;
    float _1902 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1892);
    float _1904 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1880);
    float _1906 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1896);
    float _1908 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1910 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1902);
    float _1912 = abs(_1900);
    float _1914 = log2(_1912);
    float _1916 = _1906 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1918 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1908);
    float _1920 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1922 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1904);
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1926 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1918);
    float _1928 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1930 = _1894 * _1852;
    float _1932 = -_1924;
    float _1934 = fma(_1932, _1920, 1.0);
    float _1936 = _1926 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1938 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1940 = _1894 * _1864;
    float _1942 = _1894 * _1860;
    float _1944 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1946 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1938);
    float _1948 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1950 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1952 = log2(_1934);
    float _1954 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1946);
    float _1956 = -_1948;
    float _1958 = fma(_1940, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1956);
    float _1960 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1962 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1954);
    float _1964 = -_1942;
    float _1966 = fma(_1964, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1958);
    float _1968 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1970 = exp2(_1950);
    float _1972 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1960);
    float _1974 = fma(_1966, -0.5, 0.5);
    float _1976 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1968);
    float _1978 = fma(_1966, 0.5, 0.5);
    float _1980 = _1940 + 1.0;
    float _1982 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1972);
    float _1984 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1976);
    float _1986 = 1.0 / _1962;
    float _1988 = fma(_1978, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1990 = _1952 * 0.693147182464599609375;
    float _1992 = fma(_1978, _1988, -0.212114393711090087890625);
    float _1994 = _1990 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1996 = sqrt(_1974);
    float _1998 = -_1940;
    float _2000 = fma(_1970, _1980, _1998);
    float _2002 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1984);
    float _2004 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1982);
    float _2006 = fma(_1978, _1992, 1.570728778839111328125);
    float _2008 = fma(_2000, 0.5, 0.5);
    float _2010 = _2002 * _1986;
    float _2012 = _2004 * _1986;
    float _2014 = fma(_2010, 0.5, 0.5);
    float _2016 = fma(_2012, -0.5, 0.5);
    float _2018 = _1996 * 0.636619746685028076171875;
    float3 _5349 = float3(_2014, _2016, _1994);
    float _2020 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5349, float3(0.0), isnan(_5349)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5349, float3(0.0), isnan(_5349)), level(0.0)).x;
    float3 _5360 = float3(_2014, _2016, _1994);
    float4 _2023 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5360, float3(0.0), isnan(_5360)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5360, float3(0.0), isnan(_5360)), level(0.0)).xyzw;
    float _2025 = _2023.x;
    float _2027 = _2023.y;
    float _2029 = _2023.z;
    float _2031 = _2023.w;
    float _2033 = -_2006;
    float _2035 = fma(_2018, _2033, 1.0);
    float2 _5382 = float2(_2035, _2008);
    float3 _2039 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5382, float2(0.0), isnan(_5382)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5382, float2(0.0), isnan(_5382)), level(0.0)).xyz;
    float _2041 = _2039.x;
    float _2043 = _2039.y;
    float _2045 = _2039.z;
    float _2047 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2049 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2051 = _2002 + _1962;
    float _2053 = _1962 * 0.5;
    float _2055 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2047);
    out.m_67.x = _1710;
    out.m_67.y = _1708;
    out.m_67.z = _1712;
    float _2057 = exp2(_2049);
    float _2059 = _2051 * 0.5;
    float _2061 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2055);
    float _2063 = fma(_2004, -0.5, _2053);
    float _2065 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2061);
    float _2067 = _2065 + _1962;
    out.gl_Position.x = _2002;
    out.gl_Position.y = _2004;
    out.gl_Position.z = _2065;
    out.gl_Position.w = _1962;
    float _2069 = _2067 * 0.5;
    float _2071 = -_2057;
    float _2073 = _2071 + 1.0;
    float _2075 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2077 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2059;
    out.m_69.y = _2063;
    out.m_69.z = _2069;
    out.m_69.w = _1962;
    float _2079 = -_2075;
    float _2081 = _2079 + 1.0;
    out.m_47.x = _2077;
    float _2083 = _2075 * _2020;
    float _2085 = _2031 * _2083;
    float _2087 = _2045 * _2083;
    float _2089 = fma(_2041, _2085, _2025);
    float _2091 = fma(_2043, _2085, _2027);
    float _2093 = _2031 * _2081;
    float _2095 = fma(_2031, _2087, _2029);
    out.m_71.x = _2089;
    out.m_71.y = _2091;
    out.m_71.z = _2095;
    out.m_71.w = _2093;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1664 = false;
    bool _1098 = false;
    bool _716 = false;
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2152 = as_type<float>(_106);
        out.gl_Position.z = _2152;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_49.w;
    float _112 = in.m_51.x;
    bool _114 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_110);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_110;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _112;
    float _128 = 0.0;
    float _130 = _112;
    if (_122)
    {
        float _132 = float(_90);
        _128 = _132;
    }
    float _134 = _128;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    if (_140)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _100;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _108 = as_type<int>(_144);
    }
    int _146 = _108;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2225 = as_type<float>(_146);
        out.gl_Position.z = _2225;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    int _162 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _164 = _162 != 0;
    float _166 = _150 * _148;
    float _168 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _168 * 6.283185482025146484375;
    float _178 = floor(_168);
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _184 = 0.0;
    float _186 = _182;
    if (!_160)
    {
        float _188 = _182 * _182;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = cos(_194);
    float _198 = _192;
    if (!_160)
    {
        float _200 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    float _204 = -_178;
    float _206 = _168 + _204;
    bool _208 = !_160;
    float _210 = _202;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _182 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _182);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_160;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _182 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _186 = _264;
    }
    float _266 = _186;
    float _268 = in.m_55.w;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _276 = _274 != 0;
    float _278 = -_206;
    float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _282 = _206 < 0.5;
    float _284 = float(_282);
    float _286 = fma(_196, 0.5, 0.5);
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    bool _294 = !_272;
    int _296 = _294 ? 0 : 1;
    float _298 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _300 = -_284;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _304 = !_164;
    int _306 = _304 ? 0 : 1;
    float _308 = -_286;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _312 = abs(_296);
    float _314 = fma(_266, _170, _298);
    int _316 = abs(_306);
    float _318 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_276;
    int _322 = _320 ? 0 : 1;
    float _324 = fma(_266, _172, _318);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _328 = abs(_322);
    float _330 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _332 = float(_312);
    float _334 = float(_316);
    float _336 = fma(_266, _174, _330);
    float _338 = abs(_280);
    float _340 = _332 * _338;
    float _342 = fma(_314, _268, _288);
    float _344 = fma(_336, _268, _292);
    float _346 = float(_328);
    float _348 = fma(_334, _310, _340);
    float _350 = fma(_324, _268, _290);
    float _352 = abs(_302);
    float _354 = fma(_346, _352, _348);
    bool _356 = !_326;
    bool _358 = false;
    float _374;
    if (!_356)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _362 = _112 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_90);
        float _380 = 1.0 / _378;
        float _382 = _126 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _402 = 1.0 / _388;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _404;
    float _408 = 1.0 / _392;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _412 = _384 + _410;
    bool _414 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _416 = isnan(_384);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = 1.0 / _400;
    float _428 = _412 * _402;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _432 = _384 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _436 = _384 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _440 = _384 + _438;
    bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _444 = 1.0 / _406;
    float _446 = _432 * _408;
    bool _448 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _450 = isnan(_384);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = -_458;
    float _462 = _460 + 1.0;
    float _464 = 1.0 / _396;
    float _466 = _436 * _426;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _468;
    float _472 = fma(_470, _428, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _476 = _384 + _474;
    float _478 = _476 * _444;
    bool _480 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _482 = isnan(_384);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _492;
    float _496 = _440 * _464;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _498;
    float _502 = -_490;
    float _504 = _502 + 1.0;
    float _506 = fma(_494, _428, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _508 = fma(_500, _428, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _510 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _512 = isnan(_384);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = _458 * _504;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _532 = _424 * _462;
    float _534 = -_424;
    float _536 = _534 + 1.0;
    bool _538 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _540 = isnan(_384);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = fma(_526, _446, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _552 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _554 = isnan(_384);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = _520 * _536;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _570 = -_520;
    float _572 = _570 + 1.0;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _574;
    float _578 = -_562;
    float _580 = _578 + 1.0;
    float _582 = fma(_530, _446, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _584 = _562 * _572;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _590;
    float _594 = _548 * _580;
    float _596 = fma(_568, _446, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _598 = fma(_588, _496, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _600 = fma(_576, _496, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _602 = fma(_592, _496, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _604 = _508 * _594;
    float _606 = _472 * _594;
    float _608 = -_548;
    float _610 = _608 + 1.0;
    float _612 = _506 * _594;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _626 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[143].x, _604);
    float _628 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[143].y, _606);
    float _630 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[143].z, _612);
    float _632 = fma(_616, _466, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _634 = fma(_620, _466, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _636 = fma(_624, _466, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _638 = fma(_550, _584, _626);
    float _640 = fma(_582, _584, _628);
    float _642 = in.m_55.x;
    float _644 = in.m_55.y;
    float _646 = in.m_55.z;
    float _648 = fma(_596, _584, _630);
    float _650 = fma(_598, _564, _638);
    float _652 = fma(_600, _564, _640);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _654;
    float _658 = fma(_602, _564, _648);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _660;
    float _664 = fma(_632, _532, _650);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _666;
    float _670 = fma(_656, _478, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _672 = fma(_662, _478, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _674 = fma(_634, _532, _652);
    float _676 = fma(_668, _478, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _678 = fma(_636, _532, _658);
    float _680 = fma(_670, _522, _664);
    float _682 = fma(_672, _522, _674);
    float _684 = fma(_676, _522, _678);
    float _686 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[148].x, _680);
    float _688 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[148].y, _682);
    float _690 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[148].z, _684);
    float _692 = _686 * _642;
    float _694 = _688 * _644;
    float _696 = _690 * _646;
    bool _698 = !_442;
    float _714;
    if (!_698)
    {
        float _700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _702 = _112 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _706 = _704 * _700;
        float _708 = floor(_706);
        float _710 = -_708;
        float _712 = _706 + _710;
        _714 = _712;
        _716 = true;
    }
    else
    {
        float _718 = float(_90);
        float _720 = 1.0 / _718;
        float _722 = _126 * _720;
        _714 = _722;
    }
    _716 = false;
    float _724 = _714;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _728 = _724 + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _746 = 1.0 / _732;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _748;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _756 = 1.0 / _740;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _760 = _724 + _758;
    bool _762 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _764 = isnan(_724);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    bool _774 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _776 = isnan(_724);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    bool _786 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _788 = isnan(_724);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = 1.0 / _750;
    float _800 = _760 * _746;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _804 = _724 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _808 = _724 + _806;
    bool _810 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _812 = isnan(_724);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = 1.0 / _736;
    float _824 = _804 * _756;
    bool _826 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _828 = isnan(_724);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _840 = _724 + _838;
    float _842 = 1.0 / _744;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _846 = _724 + _844;
    float _848 = _728 * _798;
    float _850 = -_836;
    float _852 = _850 + 1.0;
    bool _854 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _856 = 1.0 / _754;
    float _858 = _846 * _822;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _860;
    float _864 = _772 * _852;
    float _866 = fma(_862, _800, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _868 = _840 * _842;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _874;
    float _878 = fma(_876, _800, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _880 = -_784;
    float _882 = _880 + 1.0;
    float _884 = _808 * _856;
    float _886 = -_772;
    float _888 = _886 + 1.0;
    float _890 = fma(_872, _800, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _892 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _894 = isnan(_724);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = _784 * _888;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _914 = -_902;
    float _916 = _914 + 1.0;
    float _918 = _902 * _882;
    bool _920 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _922 = isnan(_724);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _936 = _796 * _916;
    float _938 = -_796;
    float _940 = _938 + 1.0;
    float _942 = fma(_912, _858, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _944 = -_930;
    float _946 = _944 + 1.0;
    float _948 = fma(_908, _858, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _950 = _930 * _940;
    float _952 = fma(_934, _858, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _954;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _958;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _962;
    float _966 = _820 * _946;
    float _968 = fma(_956, _848, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _970 = fma(_960, _848, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _972 = fma(_964, _848, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _974 = _890 * _966;
    float _976 = _878 * _966;
    float _978 = -_820;
    float _980 = _978 + 1.0;
    float _982 = _866 * _966;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _996 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[107].x, _974);
    float _998 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[107].y, _976);
    float _1000 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[107].z, _982);
    float _1002 = fma(_986, _884, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1004 = fma(_990, _884, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1006 = fma(_994, _884, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1008 = fma(_942, _950, _996);
    float _1010 = fma(_948, _950, _998);
    float _1012 = fma(_952, _950, _1000);
    float _1014 = fma(_968, _936, _1008);
    float _1016 = fma(_970, _936, _1010);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _1018;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _1022;
    float _1026 = fma(_972, _936, _1012);
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _1028;
    float _1032 = fma(_1020, _824, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _1034 = fma(_1024, _824, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _1036 = fma(_1002, _918, _1014);
    float _1038 = fma(_1030, _824, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _1040 = fma(_1004, _918, _1016);
    float _1042 = fma(_1006, _918, _1026);
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1056 = fma(_1032, _904, _1036);
    float _1058 = fma(_1046, _868, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _1060 = fma(_1050, _868, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _1062 = fma(_1054, _868, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _1064 = fma(_1034, _904, _1040);
    float _1066 = fma(_1038, _904, _1042);
    float _1068 = fma(_1058, _864, _1056);
    float _1070 = fma(_1060, _864, _1064);
    float _1072 = fma(_1062, _864, _1066);
    float _1074 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[113].x, _1068);
    float _1076 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[113].y, _1070);
    float _1078 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[113].z, _1072);
    bool _1080 = !_854;
    float _1096;
    if (!_1080)
    {
        float _1082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1084 = _112 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1086 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _1088 = _1086 * _1082;
        float _1090 = floor(_1088);
        float _1092 = -_1090;
        float _1094 = _1088 + _1092;
        _1096 = _1094;
        _1098 = true;
    }
    else
    {
        float _1100 = float(_90);
        float _1102 = 1.0 / _1100;
        float _1104 = _126 * _1102;
        _1096 = _1104;
    }
    _1098 = false;
    float _1106 = _1096;
    float _1108 = in.m_51.w;
    float _1110 = _354 * _692;
    float _1112 = _354 * _694;
    float _1114 = in.m_57.x;
    float _1116 = in.m_57.y;
    float _1118 = in.m_57.z;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1122 = _1120 != 0;
    float _1124 = _354 * _696;
    float _1126 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1128 = in.m_51.y;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1132 = _1130 != 0;
    float _1134 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1138 = _1136 != 0;
    float _1140 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1144 = _1142 != 0;
    float _1146 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1126);
    float _1148 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1140);
    float _1150 = _1034;
    if (_1122)
    {
        float _1152 = in.m_51.z;
        _1150 = _1152;
    }
    float _1154 = _1150;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1160 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1162 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1134);
    float _1164 = _112 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1166 = _1108 > 0.5;
    float _1168 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1170 = 1.0 / _1158;
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1118);
    float _1174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1114);
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1178 = _1176 != 0;
    float _1180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1116);
    float _1182 = in.m_59.y;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1188 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1190 = _1160 * _1174;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1192;
    float _1196 = in.m_59.x;
    float _1198 = fma(_1188, -2.0, _1186);
    float _1200 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1162);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1204 = _1160;
    bool _1206 = _1166;
    if (_1122)
    {
        bool _1208 = _1154 > 0.5;
        _358 = _1208;
    }
    bool _1210 = _358;
    float _1212 = _1168 * _1180;
    float _1214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1216 = _1194 * _1170;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1220 = _1106 + _1218;
    float _1222 = -_1184;
    float _1224 = fma(_1164, 2.0, _1222);
    float _1226 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1148);
    float _1228 = _1164;
    if (!_1178)
    {
        float _1230 = in.m_51.z;
        _1228 = _1230;
    }
    float _1232 = _1228;
    float _1234 = fma(_1216, _1220, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1236 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1146);
    float _1238 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1240 = _1236 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1242 = -_1182;
    float _1244 = _1242 + 1.0;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1248 = _1238 * _1172;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1252 = _1182;
    float _1254 = _1238;
    if (!_1178)
    {
        _1202 = _1128;
    }
    float _1256 = _1202;
    float _1258 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1246);
    int _1260 = _1166 ? as_type<int>(_1244) : as_type<int>(_1182);
    float _1262 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1250);
    float _1264 = _1256;
    if (!_1132)
    {
        _1204 = _1196;
    }
    float _1266 = _1204;
    float _1268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1270 = _1138 ? as_type<float>(_1260) : _1182;
    float _1272 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1274 = _1128 > 0.5;
    float _1276 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1262);
    bool _1278 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1280 = isnan(_1106);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1272);
    float _1292 = _1266;
    if (_1144)
    {
        float _1294 = _1274 ? _1244 : _1182;
        _1252 = _1294;
    }
    float _1296 = _1252;
    float _1298 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1132)
    {
        bool _1300 = _112 > 0.5;
        _1206 = _1300;
    }
    bool _1302 = _1206;
    float _1304 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1290);
    if (_1178)
    {
        _1264 = _112;
    }
    float _1306 = _1264;
    float _1308 = fma(_1270, _1298, -0.5);
    float _1310 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_1132)
    {
        _130 = _1266;
    }
    float _1312 = _130;
    float _1314 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1316 = _1232;
    float _1318 = _1312;
    if (!_1178)
    {
        _1254 = _1232;
    }
    float _1320 = _1254;
    float _1322 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1310);
    bool _1324 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1326 = isnan(_1106);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1332 = _1328 || _1330;
    float _1334 = float(_1332);
    float _1336 = -_1288;
    float _1338 = _1336 + 1.0;
    float _1340 = _1320;
    if (_1132)
    {
        _1292 = _1196;
    }
    float _1342 = _1292;
    float _1344 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1322);
    float _1346 = _1342;
    if (_1178)
    {
        _1340 = _1128;
    }
    float _1348 = _1340;
    float _1350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1178)
    {
        _1316 = _1128;
    }
    float _1352 = _1316;
    float _1354 = _1226 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1356 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1358 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1360 = _1334 * _1338;
    float _1362 = _1354 + _1314;
    float _1364 = _1240 + _1356;
    float _1366 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1358);
    float _1368 = _1234 * _1360;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1372 = _1362 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1376 = _1364 + _1374;
    float _1378 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1380 = _1372 * _1372;
    float _1382 = _1376 * _1376;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1386 = _1382 + _1380;
    float _1388 = fma(_1378, _1296, -0.5);
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1392 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1384);
    float _1394 = sqrt(_1386);
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1398 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1390);
    float _1400 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1402 = as_type<int>(_1384);
    float _1404 = _1382;
    float _1406 = _1380;
    float _1408 = _1364;
    float _1410 = _1362;
    if (_1132)
    {
        float _1412 = -_1342;
        float _1414 = _1412 + 1.0;
        _1402 = as_type<int>(_1414);
    }
    int _1416 = _1402;
    float _1418 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1366);
    float _1420 = -_1396;
    float _1422 = fma(_1400, 2.0, _1420);
    float _1424 = _1200 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1430 = _1416;
    float _1432 = _1424;
    if (_1132)
    {
        float _1434 = _1302 ? as_type<float>(_1416) : _1342;
        _1318 = _1434;
    }
    float _1436 = _1318;
    float _1438 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1198);
    if (_1122)
    {
        float _1440 = -_1342;
        float _1442 = _1440 + 1.0;
        _1430 = as_type<int>(_1442);
    }
    int _1444 = _1430;
    float _1446 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1448 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1450 = _1394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1452 = -_1334;
    float _1454 = _1452 + 1.0;
    float _1456 = -_1438;
    float _1458 = fma(_1276, _1388, _1456);
    float _1460 = fma(_1446, -2.0, _1428);
    if (_1122)
    {
        float _1462 = _1210 ? as_type<float>(_1444) : _1342;
        _1346 = _1462;
    }
    float _1464 = _1346;
    float _1466 = _1424 + _1448;
    float _1468 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1368);
    float _1470 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1472 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1474 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1468);
    float _1476 = fma(_1470, _1436, -0.5);
    float _1478 = fma(_1472, _1464, -0.5);
    float _1480 = _1474;
    if (!_1450)
    {
        _1432 = _1466;
    }
    float _1482 = _1432;
    bool _1484 = !_1450;
    float _1486 = _1482;
    if (!_1484)
    {
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1492 = _1394 + _1490;
        float _1494 = rsqrt(_1386);
        float _1496 = _1492 * _1488;
        float _1498 = _1466 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1500 = _1496 * 0.15915493667125701904296875;
        float _1502 = _1500 * 6.283185482025146484375;
        float _1504 = sin(_1502);
        float _1506 = _1500 * 6.283185482025146484375;
        float _1508 = cos(_1506);
        float _1510 = fma(_1504, _1498, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1512 = _1494 * _1510;
        float _1514 = fma(_1376, _1512, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1516 = _1508 + (-1.0);
        float _1518 = fma(_1372, _1512, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1522 = _1514 + _1520;
        float _1524 = _1516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1528 = _1518 + _1526;
        float _1530 = _1522 * _1522;
        float _1532 = fma(_1466, _1508, _1524);
        float _1534 = _1528 * _1528;
        _1486 = _1532;
        _1404 = _1530;
        _1406 = _1534;
        _1408 = _1514;
        _1410 = _1518;
    }
    float _1536 = _1486;
    float _1538 = _1404;
    float _1540 = _1406;
    float _1542 = _1408;
    float _1544 = _1410;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1548 = _1536 + _1546;
    float _1550 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1258);
    float _1552 = -_126;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1224);
    float _1556 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1398);
    float _1558 = fma(_1548, _1548, _1538);
    float _1560 = -_126;
    float _1562 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1422);
    float _1564 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1392);
    float _1566 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1460);
    float _1568 = _1558 + _1540;
    float _1570 = fma(_1550, _1476, _1554);
    float _1572 = fma(_1556, _1478, _1562);
    float _1574 = -_1566;
    float _1576 = fma(_1564, _1308, _1574);
    float _1578 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1580 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1582 = sqrt(_1568);
    float _1584 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1594 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1596 = _1580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1600 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1602 = _1588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1604 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1606 = _1458 + 0.5;
    float _1608 = _1474 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1610 = _1570 + 0.5;
    float _1612 = _1572 + 0.5;
    float _1614 = _1576 + 0.5;
    out.m_61.x = _1600;
    out.m_61.y = _1602;
    out.m_61.z = _1604;
    out.m_61.w = _1598;
    bool _1616 = _1582 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1618 = isnan(_1582);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1624 = _1620 || _1622;
    out.m_63.x = _1592;
    out.m_63.y = _1594;
    out.m_63.z = _1596;
    out.m_63.w = _1608;
    out.m_65.x = _1610;
    out.m_65.y = _1606;
    out.m_65.z = _1612;
    out.m_65.w = _1614;
    float _1626 = _1576;
    float _1628 = _1572;
    if (!_1624)
    {
        _1626 = 1.0;
    }
    float _1630 = _1626;
    bool _1632 = !_1624;
    float _1634 = _1630;
    if (!_1632)
    {
        bool _1636 = _1582 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1638 = isnan(_1582);
        bool _1640 = _1636 || _1638;
        bool _1642 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1644 = _1640 || _1642;
        if (!_1644)
        {
            float _1646 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1648 = _1582 + _1646;
            float _1650 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1652 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1650;
            float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1656 = _1654 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1658 = 1.0 / _1652;
            float _1660 = _1648 * _1658;
            float _1662 = fma(_1660, _1656, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1634 = _1662;
            _1664 = true;
        }
        else
        {
            bool _1666 = _1582 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1668 = isnan(_1582);
            bool _1670 = _1666 || _1668;
            bool _1672 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1674 = _1670 || _1672;
            if (!_1674)
            {
                float _1676 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1678 = _1582 + _1676;
                float _1680 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1682 = _1680 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1684 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1686 = _1684 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1688 = 1.0 / _1682;
                float _1690 = _1678 * _1688;
                float _1692 = fma(_1690, _1686, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1634 = _1692;
                _1664 = true;
            }
            else
            {
                _1634 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1664 = false;
    float _1694 = _1634;
    float _1696 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1698 = _1536 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1702 = _1542 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1706 = _1544 + _1704;
    float _1708 = fma(_1698, _1694, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1710 = fma(_1702, _1694, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1712 = fma(_1706, _1694, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1716 = _1708 + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1720 = _1710 + _1718;
    float _1722 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1724 = _1712 + _1722;
    float _1726 = _1716 * _1716;
    float _1728 = fma(_1720, _1720, _1726);
    float _1730 = fma(_1724, _1724, _1728);
    float _1732 = rsqrt(_1730);
    float _1734 = sqrt(_1730);
    float _1736 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1738 = _1720 * _1736;
    float _1740 = _1724 * _1736;
    float _1742 = _1738 * _1738;
    float _1744 = _1740 * _1740;
    float _1746 = _1742 + _1744;
    float _1748 = sqrt(_1746);
    bool _1750 = _1748 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1754 = _1748 + _1752;
    float _1756 = _1724;
    float _1758 = _1754;
    float _1760 = _1716;
    float _1762 = _1736;
    if (_1750)
    {
        float _1764 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1756 = _1764;
    }
    float _1766 = _1756;
    if (_1750)
    {
        float _1768 = rsqrt(_1746);
        _1628 = _1768;
    }
    float _1770 = _1628;
    float _1772 = _1770;
    if (_1750)
    {
        float _1774 = _1754 * _1766;
        _1758 = _1774;
    }
    float _1776 = _1758;
    if (_1750)
    {
        float _1778 = _1776 * 0.15915493667125701904296875;
        _1480 = _1778;
    }
    float _1780 = _1480;
    float _1782 = _1732;
    if (_1750)
    {
        float _1784 = _1780 * 6.283185482025146484375;
        float _1786 = sin(_1784);
        _1782 = _1786;
    }
    float _1788 = _1782;
    float _1790 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1792 = precise::max(0.0, _1790);
    float _1794 = _1728;
    float _1796 = _1790;
    if (_1750)
    {
        float _1798 = _1780 * 6.283185482025146484375;
        float _1800 = cos(_1798);
        _1794 = _1800;
    }
    float _1802 = _1794;
    float _1804 = -_1736;
    float _1806 = -_1792;
    float _1808 = fma(_1716, _1804, _1806);
    float _1810 = _1808;
    if (_1750)
    {
        float _1812 = _1808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1796 = _1812;
    }
    float _1814 = _1796;
    float _1816 = _1788;
    float _1818 = _1814;
    if (_1750)
    {
        float _1820 = fma(_1788, _1814, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1760 = _1820;
    }
    float _1822 = _1760;
    float _1824 = _1822;
    if (!_1750)
    {
        _1816 = _1738;
    }
    float _1826 = _1816;
    float _1828 = _1826;
    float _1830 = _1802;
    if (_1750)
    {
        float _1832 = _1802 + (-1.0);
        _1818 = _1832;
    }
    float _1834 = _1818;
    float _1836 = _1834;
    if (_1750)
    {
        float _1838 = _1770 * _1822;
        _1762 = _1838;
    }
    float _1840 = _1762;
    if (!_1750)
    {
        _1824 = _1742;
    }
    float _1842 = _1824;
    float _1844 = _1842;
    if (_1750)
    {
        float _1846 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1772 = _1846;
    }
    float _1848 = _1772;
    if (_1750)
    {
        float _1850 = _1738 * _1840;
        _1828 = _1850;
    }
    float _1852 = _1828;
    if (!_1750)
    {
        _1836 = _1740;
    }
    float _1854 = _1836;
    float _1856 = _1854;
    if (_1750)
    {
        float _1858 = _1740 * _1840;
        _1856 = _1858;
    }
    float _1860 = _1856;
    if (_1750)
    {
        float _1862 = fma(_1808, _1802, _1848);
        _1810 = _1862;
    }
    float _1864 = _1810;
    if (_1750)
    {
        float _1866 = _1852 * _1852;
        _1844 = _1866;
    }
    float _1868 = _1844;
    if (!_1750)
    {
        _1830 = _1744;
    }
    float _1870 = _1830;
    float _1872 = _1870;
    if (_1750)
    {
        float _1874 = _1860 * _1860;
        _1872 = _1874;
    }
    float _1876 = _1872;
    float _1878 = fma(_1864, _1864, _1868);
    float _1880 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1882 = _1878 + _1876;
    float _1884 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1888 = fma(_1734, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1886);
    float _1890 = precise::clamp(_1888, 0.0, 1.0);
    float _1892 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1894 = rsqrt(_1882);
    float _1896 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1884);
    float _1898 = -_1890;
    float _1900 = _1898 + 1.0;
    float _1902 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1892);
    float _1904 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1880);
    float _1906 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1896);
    float _1908 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1910 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1902);
    float _1912 = abs(_1900);
    float _1914 = log2(_1912);
    float _1916 = _1906 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1918 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1908);
    float _1920 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1922 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1904);
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1926 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1918);
    float _1928 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1930 = _1894 * _1852;
    float _1932 = -_1924;
    float _1934 = fma(_1932, _1920, 1.0);
    float _1936 = _1926 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1938 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1940 = _1894 * _1864;
    float _1942 = _1894 * _1860;
    float _1944 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1946 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1938);
    float _1948 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1950 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1952 = log2(_1934);
    float _1954 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1946);
    float _1956 = -_1948;
    float _1958 = fma(_1940, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1956);
    float _1960 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1962 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1954);
    float _1964 = -_1942;
    float _1966 = fma(_1964, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1958);
    float _1968 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1970 = exp2(_1950);
    float _1972 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1960);
    float _1974 = fma(_1966, -0.5, 0.5);
    float _1976 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1968);
    float _1978 = fma(_1966, 0.5, 0.5);
    float _1980 = _1940 + 1.0;
    float _1982 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1972);
    float _1984 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1976);
    float _1986 = 1.0 / _1962;
    float _1988 = fma(_1978, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1990 = _1952 * 0.693147182464599609375;
    float _1992 = fma(_1978, _1988, -0.212114393711090087890625);
    float _1994 = _1990 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1996 = sqrt(_1974);
    float _1998 = -_1940;
    float _2000 = fma(_1970, _1980, _1998);
    float _2002 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1984);
    float _2004 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1982);
    float _2006 = fma(_1978, _1992, 1.570728778839111328125);
    float _2008 = fma(_2000, 0.5, 0.5);
    float _2010 = _2002 * _1986;
    float _2012 = _2004 * _1986;
    float _2014 = fma(_2010, 0.5, 0.5);
    float _2016 = fma(_2012, -0.5, 0.5);
    float _2018 = _1996 * 0.636619746685028076171875;
    float3 _5349 = float3(_2014, _2016, _1994);
    float _2020 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5349, float3(0.0), isnan(_5349)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5349, float3(0.0), isnan(_5349)), level(0.0)).x;
    float3 _5360 = float3(_2014, _2016, _1994);
    float4 _2023 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5360, float3(0.0), isnan(_5360)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5360, float3(0.0), isnan(_5360)), level(0.0)).xyzw;
    float _2025 = _2023.x;
    float _2027 = _2023.y;
    float _2029 = _2023.z;
    float _2031 = _2023.w;
    float _2033 = -_2006;
    float _2035 = fma(_2018, _2033, 1.0);
    float2 _5382 = float2(_2035, _2008);
    float3 _2039 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5382, float2(0.0), isnan(_5382)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5382, float2(0.0), isnan(_5382)), level(0.0)).xyz;
    float _2041 = _2039.x;
    float _2043 = _2039.y;
    float _2045 = _2039.z;
    float _2047 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2049 = _1914 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2051 = _2002 + _1962;
    float _2053 = _1962 * 0.5;
    float _2055 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2047);
    out.m_67.x = _1710;
    out.m_67.y = _1708;
    out.m_67.z = _1712;
    float _2057 = exp2(_2049);
    float _2059 = _2051 * 0.5;
    float _2061 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2055);
    float _2063 = fma(_2004, -0.5, _2053);
    float _2065 = fma(_1944, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2061);
    float _2067 = _2065 + _1962;
    out.gl_Position.x = _2002;
    out.gl_Position.y = _2004;
    out.gl_Position.z = _2065;
    out.gl_Position.w = _1962;
    float _2069 = _2067 * 0.5;
    float _2071 = -_2057;
    float _2073 = _2071 + 1.0;
    float _2075 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2077 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2059;
    out.m_69.y = _2063;
    out.m_69.z = _2069;
    out.m_69.w = _1962;
    float _2079 = -_2075;
    float _2081 = _2079 + 1.0;
    out.m_47.x = _2077;
    float _2083 = _2075 * _2020;
    float _2085 = _2031 * _2083;
    float _2087 = _2045 * _2083;
    float _2089 = fma(_2041, _2085, _2025);
    float _2091 = fma(_2043, _2085, _2027);
    float _2093 = _2031 * _2081;
    float _2095 = fma(_2031, _2087, _2029);
    out.m_71.x = _2089;
    out.m_71.y = _2091;
    out.m_71.z = _2095;
    out.m_71.w = _2093;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

