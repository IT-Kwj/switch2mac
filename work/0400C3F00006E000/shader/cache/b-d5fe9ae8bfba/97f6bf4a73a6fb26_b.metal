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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
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
    float4 m_67 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 m_75 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_71 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_51 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _742 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_96);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1861 = as_type<float>(_116);
        out.gl_Position.z = _1861;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _120 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_91);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = float(_96);
    bool _132 = _100 >= _130;
    bool _134 = !_128;
    bool _136 = _132 || _134;
    if (_136)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _108;
    if (_136)
    {
        out.m_49.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _118 = as_type<int>(_140);
    }
    int _142 = _118;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1916 = as_type<float>(_142);
        out.gl_Position.z = _1916;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_51.x;
    float _146 = 1.0 / _130;
    float _148 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_51.y;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_53.w;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _148;
    if (!_160)
    {
        float _180 = _148 * _148;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_160)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    out.m_55.x = _144;
    out.m_55.y = _150;
    bool _192 = !_160;
    float _194 = _190;
    float _196 = _150;
    float _198 = _144;
    if (!_192)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _148 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _148);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _228;
    }
    float _230 = _194;
    bool _232 = !_160;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _148 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _178 = _252;
    }
    float _254 = _178;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _164, _258);
    float _266 = fma(_254, _166, _260);
    float _268 = fma(_254, _168, _262);
    float _270 = _100 * _146;
    float _272 = fma(_264, _162, _170);
    float _274 = fma(_266, _162, _172);
    float _276 = fma(_268, _162, _174);
    bool _278 = !_256;
    float _296;
    if (!_278)
    {
        float _280 = in.m_57.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        _296 = _270;
    }
    _298 = false;
    float _300 = _296;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _304 = _300 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = _300 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = 1.0 / _312;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _336 = 1.0 / _316;
    bool _338 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_300);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = 1.0 / _324;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = _300 + _356;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = -_348;
    float _370 = _368 + 1.0;
    float _372 = _358 * _326;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _376 = _300 + _374;
    float _378 = 1.0 / _320;
    bool _380 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _382 = isnan(_300);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = _376 * _336;
    bool _394 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _396 = isnan(_300);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = 1.0 / _330;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _410 = _300 + _408;
    float _412 = _304 * _350;
    bool _414 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _416 = isnan(_300);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _434 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _436 = 1.0 / _354;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _440 = _300 + _438;
    float _442 = _308 * _378;
    float _444 = -_404;
    float _446 = _444 + 1.0;
    float _448 = fma(_428, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _450 = fma(_432, _392, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = 1.0 / _334;
    float _454 = _410 * _406;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _462 = _300 + _460;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _468 = fma(_458, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _470 = _440 * _436;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _472;
    float _476 = _424 * _446;
    float _478 = -_424;
    float _480 = _478 + 1.0;
    bool _482 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _484 = isnan(_300);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = fma(_474, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _496 = -_390;
    float _498 = _496 + 1.0;
    float _500 = _390 * _480;
    float _502 = _462 * _452;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _508 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _510 = isnan(_300);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = _492 * _498;
    float _522 = -_492;
    float _524 = _522 + 1.0;
    float _526 = fma(_466, _392, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _528 = fma(_506, _392, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _530 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _532 = isnan(_300);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = _518 * _524;
    float _544 = -_518;
    float _546 = _544 + 1.0;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _548;
    float _552 = -_540;
    float _554 = _552 + 1.0;
    float _556 = _540 * _546;
    float _558 = fma(_550, _442, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _560 = fma(_362, _442, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _562 = fma(_366, _442, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _564 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _566 = isnan(_300);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = _348 * _554;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _590 = _574 * _370;
    float _592 = -_574;
    float _594 = _592 + 1.0;
    float _596 = fma(_580, _412, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _598 = fma(_584, _412, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _600 = _468 * _590;
    float _602 = _494 * _590;
    float _604 = fma(_588, _412, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _606 = _448 * _590;
    float _608 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].x, _600);
    float _610 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].y, _602);
    float _612 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].z, _606);
    float _614 = fma(_526, _576, _608);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _624;
    float _628 = fma(_528, _576, _610);
    float _630 = fma(_450, _576, _612);
    float _632 = fma(_618, _454, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _634 = fma(_622, _454, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _636 = fma(_626, _454, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _638 = fma(_558, _556, _614);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _644 = fma(_560, _556, _628);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _654 = fma(_562, _556, _630);
    float _656 = fma(_642, _502, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _658 = fma(_648, _502, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _660 = fma(_652, _502, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _662 = fma(_596, _542, _638);
    float _664 = fma(_598, _542, _644);
    float _666 = fma(_604, _542, _654);
    float _668 = in.m_53.x;
    float _670 = in.m_53.y;
    float _672 = in.m_53.z;
    float _674 = fma(_632, _520, _662);
    float _676 = fma(_634, _520, _664);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _682;
    float _686 = fma(_636, _520, _666);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _688;
    float _692 = fma(_680, _470, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _694 = fma(_684, _470, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _696 = fma(_656, _500, _674);
    float _698 = fma(_658, _500, _676);
    float _700 = fma(_690, _470, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _702 = fma(_660, _500, _686);
    float _704 = fma(_692, _476, _696);
    float _706 = fma(_694, _476, _698);
    float _708 = fma(_700, _476, _702);
    float _710 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[150].x, _704);
    float _712 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[150].y, _706);
    float _714 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[150].z, _708);
    float _716 = _710 * _668;
    float _718 = _712 * _670;
    float _720 = _714 * _672;
    bool _722 = !_434;
    float _740;
    if (!_722)
    {
        float _724 = in.m_57.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        _740 = _270;
    }
    _742 = false;
    float _744 = _740;
    float _746 = in.m_57.z;
    float _748 = in.m_57.w;
    float _750 = -_150;
    float _752 = _750 + 1.0;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _756 = _754 != 0;
    float _758 = in.m_59.w;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _762 = _760 != 0;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _770 = _768 != 0;
    float _772 = in.m_57.x;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _776 = _774 != 0;
    float _778 = 1.0 / _766;
    float _780 = in.m_57.y;
    float _782 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _784 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _786 = _708;
    if (_756)
    {
        float _788 = in.m_57.z;
        _786 = _788;
    }
    float _790 = _786;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _798 = _796 != 0;
    float _800 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _802 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _782);
    float _804 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _784);
    float _806 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _800);
    bool _808 = _746 > 0.5;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _810;
    bool _814 = _748 > 0.5;
    float _816 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _804);
    float _818 = 1.0 / _794;
    int _820 = _808 ? as_type<int>(_752) : as_type<int>(_150);
    float _822 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _806);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _828 = _812 * _778;
    out.m_61.w = _758;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _832 = _744 + _830;
    float _834 = _812;
    bool _836 = _808;
    float _838 = _758;
    if (!_756)
    {
        _834 = _144;
    }
    float _840 = _834;
    float _842 = _816 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _844 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _802);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _848 = _744 + _846;
    float _850 = _822 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _852 = _840;
    float _854 = _842;
    if (_756)
    {
        bool _856 = _790 > 0.5;
        _836 = _856;
    }
    bool _858 = _836;
    float _860 = _844 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _864 = fma(_828, _848, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _866 = _826 * _818;
    int _868 = as_type<int>(_818);
    float _870 = _866;
    float _872 = _864;
    if (_756)
    {
        float _874 = -_144;
        float _876 = _874 + 1.0;
        _868 = as_type<int>(_876);
    }
    int _878 = _868;
    float _880 = _770 ? as_type<float>(_820) : _150;
    if (_776)
    {
        float _882 = _814 ? _752 : _150;
        _196 = _882;
    }
    float _884 = _196;
    float _886 = fma(_866, _832, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _888 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _890 = isnan(_744);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_798)
    {
        _838 = _772;
    }
    float _902 = _838;
    bool _904 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _906 = isnan(_744);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = _902;
    if (_756)
    {
        float _918 = _858 ? as_type<float>(_878) : _144;
        _852 = _918;
    }
    float _920 = _852;
    float _922 = -_898;
    float _924 = _922 + 1.0;
    float _926 = _862 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _928 = _780 > 0.5;
    bool _930 = _928 && _762;
    if (_798)
    {
        _870 = _902;
    }
    float _932 = _870;
    float _934 = fma(_880, _926, -0.5);
    float _936 = _920 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _938 = _932;
    if (!_798)
    {
        _916 = _772;
    }
    float _940 = _916;
    bool _942 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _944 = isnan(_744);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = -_914;
    float _956 = _954 + 1.0;
    float _958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _960 = _956;
    if (!_798)
    {
        _938 = _746;
    }
    float _962 = _938;
    float _964 = _914 * _924;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _968 = _952 * _956;
    float _970 = -_952;
    float _972 = _970 + 1.0;
    float _974 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[88].w, _966);
    float _976 = _864 * _968;
    if (!_762)
    {
        _872 = _144;
    }
    float _978 = _872;
    float _980 = _978;
    if (_930)
    {
        float _982 = -_144;
        float _984 = _982 + 1.0;
        _198 = _984;
    }
    float _986 = _198;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _990 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[115].x, _976);
    if (_798)
    {
        _960 = _780;
    }
    float _992 = _960;
    float _994 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].w, _974);
    float _996 = _992;
    if (!_798)
    {
        _996 = _940;
    }
    float _998 = _996;
    float _1000 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[88].z, _988);
    if (_762)
    {
        _980 = _986;
    }
    float _1002 = _980;
    float _1004 = _962 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1006 = _958 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1008 = fma(_886, _964, _990);
    float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1012 = _842 + _1010;
    float _1014 = fma(_1006, _1002, -0.5);
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1018 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1020 = _860 + _1018;
    float _1022 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1026 = _998 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1028 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1000);
    float _1030 = -_1016;
    float _1032 = fma(_1004, 2.0, _1030);
    float _1034 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1022);
    float _1036 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1038 = _850 + _1036;
    float _1040 = fma(_1026, -2.0, _1024);
    float _1042 = -_100;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1032);
    float _1046 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1008);
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1034);
    float _1050 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1040);
    float _1052 = _1012 * _1012;
    float _1054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1056 = fma(_1028, _1014, _1044);
    bool _1058 = _1048 >= 0.0;
    float _1060 = fma(_1020, _1020, _1052);
    float _1062 = -_1050;
    float _1064 = fma(_994, _934, _1062);
    float _1066 = _936 * _900;
    float _1068 = fma(_1038, _1038, _1060);
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1072 = _884 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1074 = rsqrt(_1068);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_1058)
    {
        _1080 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1082 = _1080;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1090 = _1072 * _1054;
    float _1092 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1096 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1098 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1100 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1102 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1104 = _1056 + 0.5;
    float _1106 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1108 = as_type<int>(_1082);
    int _1110 = as_type<int>(_1102);
    if (_1058)
    {
        float _1112 = _1082 * 5.0;
        _1108 = as_type<int>(_1112);
    }
    int _1114 = _1108;
    float _1116 = _1064 + 0.5;
    out.m_63.x = _1098;
    out.m_63.y = _1100;
    out.m_63.z = _1102;
    float _1118 = _1012 * _1074;
    float _1120 = _1020 * _1074;
    out.m_65.z = _1066;
    out.m_65.w = _1090;
    out.m_67.x = _1092;
    out.m_67.y = _1094;
    out.m_67.z = _1096;
    out.m_67.w = _1106;
    if (_1058)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3572 = as_type<float>(_1114);
        out.gl_Position.z = _3572;
    }
    out.m_69.x = _1104;
    out.m_69.y = _1116;
    if (_1058)
    {
        out.m_49.x = 0.0;
    }
    if (_1058)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1122 = -_1118;
    float _1124 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[18].w, _842);
    float _1126 = _1038 * _1074;
    float _1128 = -_1120;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _860);
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1134 = _1124 + _1132;
    float _1136 = -_1126;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1142 = _1130 + _1140;
    float _1144 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1148 = _1138 + _1146;
    float _1150 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1144);
    float _1152 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1150);
    bool _1154 = _1152 >= 0.0;
    float _1156 = _1142;
    if (_1154)
    {
        _1156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1158 = _1156;
    if (_1154)
    {
        out.m_49.x = 0.0;
    }
    if (_1154)
    {
        float _1160 = _1158 * 5.0;
        _1110 = as_type<int>(_1160);
    }
    int _1162 = _1110;
    if (_1154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3669 = as_type<float>(_1162);
        out.gl_Position.z = _3669;
    }
    if (_1154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1164 = -_842;
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1168 = -_860;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1172 = -_850;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1176 = -_1118;
    float _1178 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1012);
    float _1180 = _1166 * _1166;
    float _1182 = -_1120;
    float _1184 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1020);
    float _1186 = -_1126;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1038);
    float _1190 = _1178 * _1178;
    float _1192 = fma(_1170, _1170, _1180);
    float _1194 = fma(_1184, _1184, _1190);
    float _1196 = fma(_1174, _1174, _1192);
    float _1198 = fma(_1188, _1188, _1194);
    float _1200 = rsqrt(_1196);
    float _1202 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1204 = sqrt(_1198);
    float _1206 = _1170 * _1200;
    float _1208 = _1174 * _1200;
    float _1210 = _1166 * _1200;
    float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1214 = _1206 * _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1218 = _1208 * _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1222 = _1210 * _1220;
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1226 = -_1214;
    float _1228 = fma(_1208, _1224, _1226);
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1232 = -_1218;
    float _1234 = fma(_1210, _1230, _1232);
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1238 = -_1222;
    float _1240 = fma(_1206, _1236, _1238);
    float _1242 = in.m_71.x;
    float _1244 = in.m_71.y;
    float _1246 = in.m_71.z;
    float _1248 = _1228 * _1228;
    float _1250 = _1074 * _1204;
    float _1252 = fma(_1234, _1234, _1248);
    float _1254 = _1250 * _1202;
    float _1256 = fma(_1240, _1240, _1252);
    float _1258 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1260 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1262 = _1250 * _1258;
    float _1264 = rsqrt(_1256);
    float _1266 = _1250 * _1260;
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1244);
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1242);
    float _1272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1246);
    float _1274 = _1262 * _1268;
    float _1276 = _1254 * _1270;
    float _1278 = _1234 * _1264;
    float _1280 = _1228 * _1264;
    float _1282 = _1240 * _1264;
    float _1284 = _1210 * _1278;
    float _1286 = _1208 * _1280;
    float _1288 = -_1284;
    float _1290 = fma(_1206, _1280, _1288);
    float _1292 = -_1286;
    float _1294 = fma(_1210, _1282, _1292);
    float _1296 = _1266 * _1272;
    float _1298 = _1274 * _1290;
    float _1300 = _1274 * _1294;
    float _1302 = fma(_1276, _1282, _1298);
    float _1304 = fma(_1276, _1278, _1300);
    float _1306 = fma(_1296, _1208, _1302);
    float _1308 = fma(_1296, _1206, _1304);
    float _1310 = _1206 * _1282;
    float _1312 = _850 + _1306;
    float _1314 = _860 + _1308;
    float _1316 = -_1310;
    float _1318 = fma(_1208, _1278, _1316);
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1322 = _1312 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1326 = _1314 + _1324;
    float _1328 = _1274 * _1318;
    float _1330 = _1322 * _1322;
    float _1332 = fma(_1276, _1280, _1328);
    float _1334 = fma(_1326, _1326, _1330);
    float _1336 = fma(_1296, _1210, _1332);
    float _1338 = sqrt(_1334);
    float _1340 = _842 + _1336;
    bool _1342 = _1338 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1344 = _1336;
    float _1346 = _1328;
    float _1348 = _1318;
    float _1350 = _1322;
    float _1352 = _1314;
    if (!_1342)
    {
        _1344 = _1314;
    }
    float _1354 = _1344;
    float _1356 = _1354;
    if (!_1342)
    {
        _1346 = _1312;
    }
    float _1358 = _1346;
    float _1360 = _1358;
    if (!_1342)
    {
        _854 = _1340;
    }
    float _1362 = _854;
    bool _1364 = !_1342;
    float _1366 = _1362;
    if (!_1364)
    {
        float _1368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1372 = _1338 + _1370;
        float _1374 = rsqrt(_1334);
        float _1376 = _1372 * _1368;
        float _1378 = _1340 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1380 = _1376 * 0.15915493667125701904296875;
        float _1382 = _1380 * 6.283185482025146484375;
        float _1384 = sin(_1382);
        float _1386 = _1380 * 6.283185482025146484375;
        float _1388 = cos(_1386);
        float _1390 = fma(_1384, _1378, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1392 = _1374 * _1390;
        float _1394 = _1388 + (-1.0);
        float _1396 = fma(_1326, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1398 = fma(_1322, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1400 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = fma(_1340, _1388, _1400);
        _1366 = _1402;
        _1356 = _1396;
        _1360 = _1398;
        _1348 = _1374;
    }
    float _1404 = _1366;
    float _1406 = _1356;
    float _1408 = _1360;
    float _1410 = _1348;
    float _1412 = -_1118;
    float _1414 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1404);
    float _1416 = -_1120;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1406);
    float _1420 = -_1126;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1424 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1426 = _1414 + _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1430 = _1418 + _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1434 = _1422 + _1432;
    float _1436 = _1426 * _1426;
    float _1438 = fma(_1430, _1430, _1436);
    float _1440 = fma(_1434, _1434, _1438);
    float _1442 = rsqrt(_1440);
    float _1444 = _1442 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1446 = _1430 * _1444;
    float _1448 = _1434 * _1444;
    float _1450 = _1446 * _1446;
    float _1452 = _1448 * _1448;
    float _1454 = _1450 + _1452;
    float _1456 = sqrt(_1454);
    bool _1458 = _1456 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1462 = _1456 + _1460;
    float _1464 = _1434;
    float _1466 = _1454;
    float _1468 = _1462;
    float _1470 = _1446;
    if (_1458)
    {
        float _1472 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1464 = _1472;
    }
    float _1474 = _1464;
    if (_1458)
    {
        float _1476 = rsqrt(_1454);
        _1466 = _1476;
    }
    float _1478 = _1466;
    float _1480 = _1478;
    if (_1458)
    {
        float _1482 = _1462 * _1474;
        _1468 = _1482;
    }
    float _1484 = _1468;
    if (_1458)
    {
        float _1486 = _1484 * 0.15915493667125701904296875;
        _1350 = _1486;
    }
    float _1488 = _1350;
    float _1490 = _1410;
    if (_1458)
    {
        float _1492 = _1488 * 6.283185482025146484375;
        float _1494 = sin(_1492);
        _1490 = _1494;
    }
    float _1496 = _1490;
    float _1498 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1500 = precise::max(0.0, _1498);
    float _1502 = _1442;
    float _1504 = _1500;
    float _1506 = _1498;
    if (_1458)
    {
        float _1508 = _1488 * 6.283185482025146484375;
        float _1510 = cos(_1508);
        _1502 = _1510;
    }
    float _1512 = _1502;
    float _1514 = -_1444;
    float _1516 = -_1500;
    float _1518 = fma(_1426, _1514, _1516);
    float _1520 = _1518;
    if (_1458)
    {
        float _1522 = _1518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1522;
    }
    float _1524 = _1504;
    float _1526 = sqrt(_1440);
    float _1528 = _1496;
    float _1530 = _1524;
    if (_1458)
    {
        float _1532 = fma(_1496, _1524, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1528 = _1532;
    }
    float _1534 = _1528;
    float _1536 = _1534;
    if (!_1458)
    {
        _1530 = _1448;
    }
    float _1538 = _1530;
    float _1540 = _1538;
    if (_1458)
    {
        float _1542 = _1512 + (-1.0);
        _1506 = _1542;
    }
    float _1544 = _1506;
    float _1546 = _1544;
    if (_1458)
    {
        float _1548 = _1478 * _1534;
        _1536 = _1548;
    }
    float _1550 = _1536;
    if (!_1458)
    {
        _1480 = _1450;
    }
    float _1552 = _1480;
    float _1554 = _1552;
    if (_1458)
    {
        float _1556 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1352 = _1556;
    }
    float _1558 = _1352;
    if (_1458)
    {
        float _1560 = _1446 * _1550;
        _1470 = _1560;
    }
    float _1562 = _1470;
    if (_1458)
    {
        float _1564 = _1448 * _1550;
        _1540 = _1564;
    }
    float _1566 = _1540;
    if (!_1458)
    {
        _1546 = _1452;
    }
    float _1568 = _1546;
    float _1570 = _1568;
    if (_1458)
    {
        float _1572 = fma(_1518, _1512, _1558);
        _1520 = _1572;
    }
    float _1574 = _1520;
    if (_1458)
    {
        float _1576 = _1562 * _1562;
        _1554 = _1576;
    }
    float _1578 = _1554;
    if (_1458)
    {
        float _1580 = _1566 * _1566;
        _1570 = _1580;
    }
    float _1582 = _1570;
    float _1584 = fma(_1574, _1574, _1578);
    float _1586 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1588 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1586);
    float _1590 = precise::clamp(_1588, 0.0, 1.0);
    float _1592 = _1584 + _1582;
    float _1594 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1596 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1598 = -_1590;
    float _1600 = _1598 + 1.0;
    float _1602 = rsqrt(_1592);
    float _1604 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1594);
    float _1606 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1608 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1610 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1612 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1604);
    float _1614 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1606);
    float _1616 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1608);
    float _1618 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1610);
    float _1620 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1622 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1614);
    float _1624 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1616);
    float _1626 = abs(_1600);
    float _1628 = log2(_1626);
    float _1630 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1632 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1634 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1618);
    float _1636 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1638 = _1602 * _1562;
    float _1640 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1642 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1644 = -_1630;
    float _1646 = fma(_1644, _1596, 1.0);
    float _1648 = _1602 * _1574;
    float _1650 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1640);
    float _1652 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1654 = _1602 * _1566;
    float _1656 = log2(_1646);
    float _1658 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1650);
    float _1660 = -_1652;
    float _1662 = fma(_1648, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1660);
    float _1664 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1666 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1668 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1658);
    float _1670 = -_1654;
    float _1672 = fma(_1670, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1662);
    float _1674 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1676 = exp2(_1664);
    float _1678 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1666);
    float _1680 = fma(_1672, -0.5, 0.5);
    float _1682 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1674);
    float _1684 = fma(_1672, 0.5, 0.5);
    float _1686 = _1648 + 1.0;
    float _1688 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1678);
    float _1690 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1682);
    float _1692 = 1.0 / _1668;
    float _1694 = fma(_1684, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1696 = _1656 * 0.693147182464599609375;
    float _1698 = fma(_1684, _1694, -0.212114393711090087890625);
    float _1700 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1688);
    float _1702 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1704 = sqrt(_1680);
    float _1706 = -_1648;
    float _1708 = fma(_1676, _1686, _1706);
    float _1710 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1690);
    float _1712 = fma(_1684, _1698, 1.570728778839111328125);
    float _1714 = fma(_1708, 0.5, 0.5);
    float _1716 = _1710 * _1692;
    float _1718 = _1700 * _1692;
    float _1720 = fma(_1716, 0.5, 0.5);
    float _1722 = fma(_1718, -0.5, 0.5);
    float _1724 = _1704 * 0.636619746685028076171875;
    float3 _4585 = float3(_1720, _1722, _1702);
    float _1726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4585, float3(0.0), isnan(_4585)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4585, float3(0.0), isnan(_4585)), level(0.0)).x;
    float3 _4596 = float3(_1720, _1722, _1702);
    float4 _1729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4596, float3(0.0), isnan(_4596)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4596, float3(0.0), isnan(_4596)), level(0.0)).xyzw;
    float _1731 = _1729.x;
    float _1733 = _1729.y;
    float _1735 = _1729.z;
    float _1737 = _1729.w;
    float _1739 = -_1712;
    float _1741 = fma(_1724, _1739, 1.0);
    float2 _4618 = float2(_1741, _1714);
    float3 _1745 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4618, float2(0.0), isnan(_4618)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4618, float2(0.0), isnan(_4618)), level(0.0)).xyz;
    float _1747 = _1745.x;
    float _1749 = _1745.y;
    float _1751 = _1745.z;
    float _1753 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1755 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1757 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1755);
    float _1759 = exp2(_1753);
    float _1761 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1757);
    float _1763 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1761);
    float _1765 = _1763 + _1668;
    out.gl_Position.x = _1710;
    out.gl_Position.y = _1700;
    out.gl_Position.z = _1763;
    out.gl_Position.w = _1668;
    float _1767 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1769 = _1765 * 0.5;
    float _1771 = -_1759;
    float _1773 = _1771 + 1.0;
    out.m_49.x = _1767;
    float _1775 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _1769;
    out.m_73.w = _1668;
    float _1777 = _1775 * _1726;
    float _1779 = -_1775;
    float _1781 = _1779 + 1.0;
    float _1783 = _1737 * _1777;
    float _1785 = _1737 * _1781;
    float _1787 = _1751 * _1777;
    float _1789 = fma(_1747, _1783, _1731);
    float _1791 = fma(_1749, _1783, _1733);
    float _1793 = fma(_1737, _1787, _1735);
    out.m_75.x = _1789;
    out.m_75.y = _1791;
    out.m_75.z = _1793;
    out.m_75.w = _1785;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _742 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_96);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1861 = as_type<float>(_116);
        out.gl_Position.z = _1861;
    }
    if (!_104)
    {
        return out;
    }
    bool _120 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_91);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = float(_96);
    bool _132 = _100 >= _130;
    bool _134 = !_128;
    bool _136 = _132 || _134;
    if (_136)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _108;
    if (_136)
    {
        out.m_49.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _118 = as_type<int>(_140);
    }
    int _142 = _118;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1916 = as_type<float>(_142);
        out.gl_Position.z = _1916;
    }
    if (_136)
    {
        return out;
    }
    float _144 = in.m_51.x;
    float _146 = 1.0 / _130;
    float _148 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_51.y;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_53.w;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _148;
    if (!_160)
    {
        float _180 = _148 * _148;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_160)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    out.m_55.x = _144;
    out.m_55.y = _150;
    bool _192 = !_160;
    float _194 = _190;
    float _196 = _150;
    float _198 = _144;
    if (!_192)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _148 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _148);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _228;
    }
    float _230 = _194;
    bool _232 = !_160;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _148 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _178 = _252;
    }
    float _254 = _178;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _164, _258);
    float _266 = fma(_254, _166, _260);
    float _268 = fma(_254, _168, _262);
    float _270 = _100 * _146;
    float _272 = fma(_264, _162, _170);
    float _274 = fma(_266, _162, _172);
    float _276 = fma(_268, _162, _174);
    bool _278 = !_256;
    float _296;
    if (!_278)
    {
        float _280 = in.m_57.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        _296 = _270;
    }
    _298 = false;
    float _300 = _296;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _304 = _300 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = _300 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = 1.0 / _312;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _336 = 1.0 / _316;
    bool _338 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_300);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = 1.0 / _324;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = _300 + _356;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = -_348;
    float _370 = _368 + 1.0;
    float _372 = _358 * _326;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _376 = _300 + _374;
    float _378 = 1.0 / _320;
    bool _380 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _382 = isnan(_300);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = _376 * _336;
    bool _394 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _396 = isnan(_300);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = 1.0 / _330;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _410 = _300 + _408;
    float _412 = _304 * _350;
    bool _414 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _416 = isnan(_300);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _434 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _436 = 1.0 / _354;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _440 = _300 + _438;
    float _442 = _308 * _378;
    float _444 = -_404;
    float _446 = _444 + 1.0;
    float _448 = fma(_428, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _450 = fma(_432, _392, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = 1.0 / _334;
    float _454 = _410 * _406;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _462 = _300 + _460;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _468 = fma(_458, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _470 = _440 * _436;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _472;
    float _476 = _424 * _446;
    float _478 = -_424;
    float _480 = _478 + 1.0;
    bool _482 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _484 = isnan(_300);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = fma(_474, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _496 = -_390;
    float _498 = _496 + 1.0;
    float _500 = _390 * _480;
    float _502 = _462 * _452;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _508 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _510 = isnan(_300);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = _492 * _498;
    float _522 = -_492;
    float _524 = _522 + 1.0;
    float _526 = fma(_466, _392, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _528 = fma(_506, _392, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _530 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _532 = isnan(_300);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = _518 * _524;
    float _544 = -_518;
    float _546 = _544 + 1.0;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _548;
    float _552 = -_540;
    float _554 = _552 + 1.0;
    float _556 = _540 * _546;
    float _558 = fma(_550, _442, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _560 = fma(_362, _442, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _562 = fma(_366, _442, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _564 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _566 = isnan(_300);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = _348 * _554;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _590 = _574 * _370;
    float _592 = -_574;
    float _594 = _592 + 1.0;
    float _596 = fma(_580, _412, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _598 = fma(_584, _412, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _600 = _468 * _590;
    float _602 = _494 * _590;
    float _604 = fma(_588, _412, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _606 = _448 * _590;
    float _608 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].x, _600);
    float _610 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].y, _602);
    float _612 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].z, _606);
    float _614 = fma(_526, _576, _608);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _624;
    float _628 = fma(_528, _576, _610);
    float _630 = fma(_450, _576, _612);
    float _632 = fma(_618, _454, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _634 = fma(_622, _454, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _636 = fma(_626, _454, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _638 = fma(_558, _556, _614);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _644 = fma(_560, _556, _628);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _654 = fma(_562, _556, _630);
    float _656 = fma(_642, _502, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _658 = fma(_648, _502, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _660 = fma(_652, _502, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _662 = fma(_596, _542, _638);
    float _664 = fma(_598, _542, _644);
    float _666 = fma(_604, _542, _654);
    float _668 = in.m_53.x;
    float _670 = in.m_53.y;
    float _672 = in.m_53.z;
    float _674 = fma(_632, _520, _662);
    float _676 = fma(_634, _520, _664);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _682;
    float _686 = fma(_636, _520, _666);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _688;
    float _692 = fma(_680, _470, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _694 = fma(_684, _470, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _696 = fma(_656, _500, _674);
    float _698 = fma(_658, _500, _676);
    float _700 = fma(_690, _470, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _702 = fma(_660, _500, _686);
    float _704 = fma(_692, _476, _696);
    float _706 = fma(_694, _476, _698);
    float _708 = fma(_700, _476, _702);
    float _710 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[150].x, _704);
    float _712 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[150].y, _706);
    float _714 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[150].z, _708);
    float _716 = _710 * _668;
    float _718 = _712 * _670;
    float _720 = _714 * _672;
    bool _722 = !_434;
    float _740;
    if (!_722)
    {
        float _724 = in.m_57.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        _740 = _270;
    }
    _742 = false;
    float _744 = _740;
    float _746 = in.m_57.z;
    float _748 = in.m_57.w;
    float _750 = -_150;
    float _752 = _750 + 1.0;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _756 = _754 != 0;
    float _758 = in.m_59.w;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _762 = _760 != 0;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _770 = _768 != 0;
    float _772 = in.m_57.x;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _776 = _774 != 0;
    float _778 = 1.0 / _766;
    float _780 = in.m_57.y;
    float _782 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _784 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _786 = _708;
    if (_756)
    {
        float _788 = in.m_57.z;
        _786 = _788;
    }
    float _790 = _786;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _798 = _796 != 0;
    float _800 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _802 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _782);
    float _804 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _784);
    float _806 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _800);
    bool _808 = _746 > 0.5;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _810;
    bool _814 = _748 > 0.5;
    float _816 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _804);
    float _818 = 1.0 / _794;
    int _820 = _808 ? as_type<int>(_752) : as_type<int>(_150);
    float _822 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _806);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _828 = _812 * _778;
    out.m_61.w = _758;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _832 = _744 + _830;
    float _834 = _812;
    bool _836 = _808;
    float _838 = _758;
    if (!_756)
    {
        _834 = _144;
    }
    float _840 = _834;
    float _842 = _816 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _844 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _802);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _848 = _744 + _846;
    float _850 = _822 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _852 = _840;
    float _854 = _842;
    if (_756)
    {
        bool _856 = _790 > 0.5;
        _836 = _856;
    }
    bool _858 = _836;
    float _860 = _844 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _864 = fma(_828, _848, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _866 = _826 * _818;
    int _868 = as_type<int>(_818);
    float _870 = _866;
    float _872 = _864;
    if (_756)
    {
        float _874 = -_144;
        float _876 = _874 + 1.0;
        _868 = as_type<int>(_876);
    }
    int _878 = _868;
    float _880 = _770 ? as_type<float>(_820) : _150;
    if (_776)
    {
        float _882 = _814 ? _752 : _150;
        _196 = _882;
    }
    float _884 = _196;
    float _886 = fma(_866, _832, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _888 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _890 = isnan(_744);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_798)
    {
        _838 = _772;
    }
    float _902 = _838;
    bool _904 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _906 = isnan(_744);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = _902;
    if (_756)
    {
        float _918 = _858 ? as_type<float>(_878) : _144;
        _852 = _918;
    }
    float _920 = _852;
    float _922 = -_898;
    float _924 = _922 + 1.0;
    float _926 = _862 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _928 = _780 > 0.5;
    bool _930 = _928 && _762;
    if (_798)
    {
        _870 = _902;
    }
    float _932 = _870;
    float _934 = fma(_880, _926, -0.5);
    float _936 = _920 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _938 = _932;
    if (!_798)
    {
        _916 = _772;
    }
    float _940 = _916;
    bool _942 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _944 = isnan(_744);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = -_914;
    float _956 = _954 + 1.0;
    float _958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _960 = _956;
    if (!_798)
    {
        _938 = _746;
    }
    float _962 = _938;
    float _964 = _914 * _924;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _968 = _952 * _956;
    float _970 = -_952;
    float _972 = _970 + 1.0;
    float _974 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[88].w, _966);
    float _976 = _864 * _968;
    if (!_762)
    {
        _872 = _144;
    }
    float _978 = _872;
    float _980 = _978;
    if (_930)
    {
        float _982 = -_144;
        float _984 = _982 + 1.0;
        _198 = _984;
    }
    float _986 = _198;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _990 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[115].x, _976);
    if (_798)
    {
        _960 = _780;
    }
    float _992 = _960;
    float _994 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].w, _974);
    float _996 = _992;
    if (!_798)
    {
        _996 = _940;
    }
    float _998 = _996;
    float _1000 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[88].z, _988);
    if (_762)
    {
        _980 = _986;
    }
    float _1002 = _980;
    float _1004 = _962 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1006 = _958 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1008 = fma(_886, _964, _990);
    float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1012 = _842 + _1010;
    float _1014 = fma(_1006, _1002, -0.5);
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1018 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1020 = _860 + _1018;
    float _1022 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1026 = _998 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1028 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1000);
    float _1030 = -_1016;
    float _1032 = fma(_1004, 2.0, _1030);
    float _1034 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1022);
    float _1036 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1038 = _850 + _1036;
    float _1040 = fma(_1026, -2.0, _1024);
    float _1042 = -_100;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1032);
    float _1046 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1008);
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1034);
    float _1050 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1040);
    float _1052 = _1012 * _1012;
    float _1054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1056 = fma(_1028, _1014, _1044);
    bool _1058 = _1048 >= 0.0;
    float _1060 = fma(_1020, _1020, _1052);
    float _1062 = -_1050;
    float _1064 = fma(_994, _934, _1062);
    float _1066 = _936 * _900;
    float _1068 = fma(_1038, _1038, _1060);
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1072 = _884 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1074 = rsqrt(_1068);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_1058)
    {
        _1080 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1082 = _1080;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1090 = _1072 * _1054;
    float _1092 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1096 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1098 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1100 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1102 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1104 = _1056 + 0.5;
    float _1106 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1108 = as_type<int>(_1082);
    int _1110 = as_type<int>(_1102);
    if (_1058)
    {
        float _1112 = _1082 * 5.0;
        _1108 = as_type<int>(_1112);
    }
    int _1114 = _1108;
    float _1116 = _1064 + 0.5;
    out.m_63.x = _1098;
    out.m_63.y = _1100;
    out.m_63.z = _1102;
    float _1118 = _1012 * _1074;
    float _1120 = _1020 * _1074;
    out.m_65.z = _1066;
    out.m_65.w = _1090;
    out.m_67.x = _1092;
    out.m_67.y = _1094;
    out.m_67.z = _1096;
    out.m_67.w = _1106;
    if (_1058)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3572 = as_type<float>(_1114);
        out.gl_Position.z = _3572;
    }
    out.m_69.x = _1104;
    out.m_69.y = _1116;
    if (_1058)
    {
        out.m_49.x = 0.0;
    }
    if (_1058)
    {
        return out;
    }
    float _1122 = -_1118;
    float _1124 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[18].w, _842);
    float _1126 = _1038 * _1074;
    float _1128 = -_1120;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _860);
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1134 = _1124 + _1132;
    float _1136 = -_1126;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1142 = _1130 + _1140;
    float _1144 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1148 = _1138 + _1146;
    float _1150 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1144);
    float _1152 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1150);
    bool _1154 = _1152 >= 0.0;
    float _1156 = _1142;
    if (_1154)
    {
        _1156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1158 = _1156;
    if (_1154)
    {
        out.m_49.x = 0.0;
    }
    if (_1154)
    {
        float _1160 = _1158 * 5.0;
        _1110 = as_type<int>(_1160);
    }
    int _1162 = _1110;
    if (_1154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3669 = as_type<float>(_1162);
        out.gl_Position.z = _3669;
    }
    if (_1154)
    {
        return out;
    }
    float _1164 = -_842;
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1168 = -_860;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1172 = -_850;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1176 = -_1118;
    float _1178 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1012);
    float _1180 = _1166 * _1166;
    float _1182 = -_1120;
    float _1184 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1020);
    float _1186 = -_1126;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1038);
    float _1190 = _1178 * _1178;
    float _1192 = fma(_1170, _1170, _1180);
    float _1194 = fma(_1184, _1184, _1190);
    float _1196 = fma(_1174, _1174, _1192);
    float _1198 = fma(_1188, _1188, _1194);
    float _1200 = rsqrt(_1196);
    float _1202 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1204 = sqrt(_1198);
    float _1206 = _1170 * _1200;
    float _1208 = _1174 * _1200;
    float _1210 = _1166 * _1200;
    float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1214 = _1206 * _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1218 = _1208 * _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1222 = _1210 * _1220;
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1226 = -_1214;
    float _1228 = fma(_1208, _1224, _1226);
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1232 = -_1218;
    float _1234 = fma(_1210, _1230, _1232);
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1238 = -_1222;
    float _1240 = fma(_1206, _1236, _1238);
    float _1242 = in.m_71.x;
    float _1244 = in.m_71.y;
    float _1246 = in.m_71.z;
    float _1248 = _1228 * _1228;
    float _1250 = _1074 * _1204;
    float _1252 = fma(_1234, _1234, _1248);
    float _1254 = _1250 * _1202;
    float _1256 = fma(_1240, _1240, _1252);
    float _1258 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1260 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1262 = _1250 * _1258;
    float _1264 = rsqrt(_1256);
    float _1266 = _1250 * _1260;
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1244);
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1242);
    float _1272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1246);
    float _1274 = _1262 * _1268;
    float _1276 = _1254 * _1270;
    float _1278 = _1234 * _1264;
    float _1280 = _1228 * _1264;
    float _1282 = _1240 * _1264;
    float _1284 = _1210 * _1278;
    float _1286 = _1208 * _1280;
    float _1288 = -_1284;
    float _1290 = fma(_1206, _1280, _1288);
    float _1292 = -_1286;
    float _1294 = fma(_1210, _1282, _1292);
    float _1296 = _1266 * _1272;
    float _1298 = _1274 * _1290;
    float _1300 = _1274 * _1294;
    float _1302 = fma(_1276, _1282, _1298);
    float _1304 = fma(_1276, _1278, _1300);
    float _1306 = fma(_1296, _1208, _1302);
    float _1308 = fma(_1296, _1206, _1304);
    float _1310 = _1206 * _1282;
    float _1312 = _850 + _1306;
    float _1314 = _860 + _1308;
    float _1316 = -_1310;
    float _1318 = fma(_1208, _1278, _1316);
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1322 = _1312 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1326 = _1314 + _1324;
    float _1328 = _1274 * _1318;
    float _1330 = _1322 * _1322;
    float _1332 = fma(_1276, _1280, _1328);
    float _1334 = fma(_1326, _1326, _1330);
    float _1336 = fma(_1296, _1210, _1332);
    float _1338 = sqrt(_1334);
    float _1340 = _842 + _1336;
    bool _1342 = _1338 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1344 = _1336;
    float _1346 = _1328;
    float _1348 = _1318;
    float _1350 = _1322;
    float _1352 = _1314;
    if (!_1342)
    {
        _1344 = _1314;
    }
    float _1354 = _1344;
    float _1356 = _1354;
    if (!_1342)
    {
        _1346 = _1312;
    }
    float _1358 = _1346;
    float _1360 = _1358;
    if (!_1342)
    {
        _854 = _1340;
    }
    float _1362 = _854;
    bool _1364 = !_1342;
    float _1366 = _1362;
    if (!_1364)
    {
        float _1368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1372 = _1338 + _1370;
        float _1374 = rsqrt(_1334);
        float _1376 = _1372 * _1368;
        float _1378 = _1340 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1380 = _1376 * 0.15915493667125701904296875;
        float _1382 = _1380 * 6.283185482025146484375;
        float _1384 = sin(_1382);
        float _1386 = _1380 * 6.283185482025146484375;
        float _1388 = cos(_1386);
        float _1390 = fma(_1384, _1378, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1392 = _1374 * _1390;
        float _1394 = _1388 + (-1.0);
        float _1396 = fma(_1326, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1398 = fma(_1322, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1400 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = fma(_1340, _1388, _1400);
        _1366 = _1402;
        _1356 = _1396;
        _1360 = _1398;
        _1348 = _1374;
    }
    float _1404 = _1366;
    float _1406 = _1356;
    float _1408 = _1360;
    float _1410 = _1348;
    float _1412 = -_1118;
    float _1414 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1404);
    float _1416 = -_1120;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1406);
    float _1420 = -_1126;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1424 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1426 = _1414 + _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1430 = _1418 + _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1434 = _1422 + _1432;
    float _1436 = _1426 * _1426;
    float _1438 = fma(_1430, _1430, _1436);
    float _1440 = fma(_1434, _1434, _1438);
    float _1442 = rsqrt(_1440);
    float _1444 = _1442 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1446 = _1430 * _1444;
    float _1448 = _1434 * _1444;
    float _1450 = _1446 * _1446;
    float _1452 = _1448 * _1448;
    float _1454 = _1450 + _1452;
    float _1456 = sqrt(_1454);
    bool _1458 = _1456 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1462 = _1456 + _1460;
    float _1464 = _1434;
    float _1466 = _1454;
    float _1468 = _1462;
    float _1470 = _1446;
    if (_1458)
    {
        float _1472 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1464 = _1472;
    }
    float _1474 = _1464;
    if (_1458)
    {
        float _1476 = rsqrt(_1454);
        _1466 = _1476;
    }
    float _1478 = _1466;
    float _1480 = _1478;
    if (_1458)
    {
        float _1482 = _1462 * _1474;
        _1468 = _1482;
    }
    float _1484 = _1468;
    if (_1458)
    {
        float _1486 = _1484 * 0.15915493667125701904296875;
        _1350 = _1486;
    }
    float _1488 = _1350;
    float _1490 = _1410;
    if (_1458)
    {
        float _1492 = _1488 * 6.283185482025146484375;
        float _1494 = sin(_1492);
        _1490 = _1494;
    }
    float _1496 = _1490;
    float _1498 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1500 = precise::max(0.0, _1498);
    float _1502 = _1442;
    float _1504 = _1500;
    float _1506 = _1498;
    if (_1458)
    {
        float _1508 = _1488 * 6.283185482025146484375;
        float _1510 = cos(_1508);
        _1502 = _1510;
    }
    float _1512 = _1502;
    float _1514 = -_1444;
    float _1516 = -_1500;
    float _1518 = fma(_1426, _1514, _1516);
    float _1520 = _1518;
    if (_1458)
    {
        float _1522 = _1518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1522;
    }
    float _1524 = _1504;
    float _1526 = sqrt(_1440);
    float _1528 = _1496;
    float _1530 = _1524;
    if (_1458)
    {
        float _1532 = fma(_1496, _1524, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1528 = _1532;
    }
    float _1534 = _1528;
    float _1536 = _1534;
    if (!_1458)
    {
        _1530 = _1448;
    }
    float _1538 = _1530;
    float _1540 = _1538;
    if (_1458)
    {
        float _1542 = _1512 + (-1.0);
        _1506 = _1542;
    }
    float _1544 = _1506;
    float _1546 = _1544;
    if (_1458)
    {
        float _1548 = _1478 * _1534;
        _1536 = _1548;
    }
    float _1550 = _1536;
    if (!_1458)
    {
        _1480 = _1450;
    }
    float _1552 = _1480;
    float _1554 = _1552;
    if (_1458)
    {
        float _1556 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1352 = _1556;
    }
    float _1558 = _1352;
    if (_1458)
    {
        float _1560 = _1446 * _1550;
        _1470 = _1560;
    }
    float _1562 = _1470;
    if (_1458)
    {
        float _1564 = _1448 * _1550;
        _1540 = _1564;
    }
    float _1566 = _1540;
    if (!_1458)
    {
        _1546 = _1452;
    }
    float _1568 = _1546;
    float _1570 = _1568;
    if (_1458)
    {
        float _1572 = fma(_1518, _1512, _1558);
        _1520 = _1572;
    }
    float _1574 = _1520;
    if (_1458)
    {
        float _1576 = _1562 * _1562;
        _1554 = _1576;
    }
    float _1578 = _1554;
    if (_1458)
    {
        float _1580 = _1566 * _1566;
        _1570 = _1580;
    }
    float _1582 = _1570;
    float _1584 = fma(_1574, _1574, _1578);
    float _1586 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1588 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1586);
    float _1590 = precise::clamp(_1588, 0.0, 1.0);
    float _1592 = _1584 + _1582;
    float _1594 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1596 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1598 = -_1590;
    float _1600 = _1598 + 1.0;
    float _1602 = rsqrt(_1592);
    float _1604 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1594);
    float _1606 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1608 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1610 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1612 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1604);
    float _1614 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1606);
    float _1616 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1608);
    float _1618 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1610);
    float _1620 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1622 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1614);
    float _1624 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1616);
    float _1626 = abs(_1600);
    float _1628 = log2(_1626);
    float _1630 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1632 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1634 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1618);
    float _1636 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1638 = _1602 * _1562;
    float _1640 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1642 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1644 = -_1630;
    float _1646 = fma(_1644, _1596, 1.0);
    float _1648 = _1602 * _1574;
    float _1650 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1640);
    float _1652 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1654 = _1602 * _1566;
    float _1656 = log2(_1646);
    float _1658 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1650);
    float _1660 = -_1652;
    float _1662 = fma(_1648, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1660);
    float _1664 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1666 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1668 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1658);
    float _1670 = -_1654;
    float _1672 = fma(_1670, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1662);
    float _1674 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1676 = exp2(_1664);
    float _1678 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1666);
    float _1680 = fma(_1672, -0.5, 0.5);
    float _1682 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1674);
    float _1684 = fma(_1672, 0.5, 0.5);
    float _1686 = _1648 + 1.0;
    float _1688 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1678);
    float _1690 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1682);
    float _1692 = 1.0 / _1668;
    float _1694 = fma(_1684, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1696 = _1656 * 0.693147182464599609375;
    float _1698 = fma(_1684, _1694, -0.212114393711090087890625);
    float _1700 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1688);
    float _1702 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1704 = sqrt(_1680);
    float _1706 = -_1648;
    float _1708 = fma(_1676, _1686, _1706);
    float _1710 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1690);
    float _1712 = fma(_1684, _1698, 1.570728778839111328125);
    float _1714 = fma(_1708, 0.5, 0.5);
    float _1716 = _1710 * _1692;
    float _1718 = _1700 * _1692;
    float _1720 = fma(_1716, 0.5, 0.5);
    float _1722 = fma(_1718, -0.5, 0.5);
    float _1724 = _1704 * 0.636619746685028076171875;
    float3 _4585 = float3(_1720, _1722, _1702);
    float _1726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4585, float3(0.0), isnan(_4585)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4585, float3(0.0), isnan(_4585)), level(0.0)).x;
    float3 _4596 = float3(_1720, _1722, _1702);
    float4 _1729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4596, float3(0.0), isnan(_4596)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4596, float3(0.0), isnan(_4596)), level(0.0)).xyzw;
    float _1731 = _1729.x;
    float _1733 = _1729.y;
    float _1735 = _1729.z;
    float _1737 = _1729.w;
    float _1739 = -_1712;
    float _1741 = fma(_1724, _1739, 1.0);
    float2 _4618 = float2(_1741, _1714);
    float3 _1745 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4618, float2(0.0), isnan(_4618)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4618, float2(0.0), isnan(_4618)), level(0.0)).xyz;
    float _1747 = _1745.x;
    float _1749 = _1745.y;
    float _1751 = _1745.z;
    float _1753 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1755 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1757 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1755);
    float _1759 = exp2(_1753);
    float _1761 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1757);
    float _1763 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1761);
    float _1765 = _1763 + _1668;
    out.gl_Position.x = _1710;
    out.gl_Position.y = _1700;
    out.gl_Position.z = _1763;
    out.gl_Position.w = _1668;
    float _1767 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1769 = _1765 * 0.5;
    float _1771 = -_1759;
    float _1773 = _1771 + 1.0;
    out.m_49.x = _1767;
    float _1775 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _1769;
    out.m_73.w = _1668;
    float _1777 = _1775 * _1726;
    float _1779 = -_1775;
    float _1781 = _1779 + 1.0;
    float _1783 = _1737 * _1777;
    float _1785 = _1737 * _1781;
    float _1787 = _1751 * _1777;
    float _1789 = fma(_1747, _1783, _1731);
    float _1791 = fma(_1749, _1783, _1733);
    float _1793 = fma(_1737, _1787, _1735);
    out.m_75.x = _1789;
    out.m_75.y = _1791;
    out.m_75.z = _1793;
    out.m_75.w = _1785;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _742 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_96);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1861 = as_type<float>(_116);
        out.gl_Position.z = _1861;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _120 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_91);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = float(_96);
    bool _132 = _100 >= _130;
    bool _134 = !_128;
    bool _136 = _132 || _134;
    if (_136)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _108;
    if (_136)
    {
        out.m_49.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _118 = as_type<int>(_140);
    }
    int _142 = _118;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1916 = as_type<float>(_142);
        out.gl_Position.z = _1916;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_51.x;
    float _146 = 1.0 / _130;
    float _148 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = in.m_51.y;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_53.w;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _148;
    if (!_160)
    {
        float _180 = _148 * _148;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_160)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    out.m_55.x = _144;
    out.m_55.y = _150;
    bool _192 = !_160;
    float _194 = _190;
    float _196 = _150;
    float _198 = _144;
    if (!_192)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _148 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _148);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _228;
    }
    float _230 = _194;
    bool _232 = !_160;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _148 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _178 = _252;
    }
    float _254 = _178;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _164, _258);
    float _266 = fma(_254, _166, _260);
    float _268 = fma(_254, _168, _262);
    float _270 = _100 * _146;
    float _272 = fma(_264, _162, _170);
    float _274 = fma(_266, _162, _172);
    float _276 = fma(_268, _162, _174);
    bool _278 = !_256;
    float _296;
    if (!_278)
    {
        float _280 = in.m_57.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        _296 = _270;
    }
    _298 = false;
    float _300 = _296;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _304 = _300 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = _300 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = 1.0 / _312;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _336 = 1.0 / _316;
    bool _338 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_300);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = 1.0 / _324;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _358 = _300 + _356;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = -_348;
    float _370 = _368 + 1.0;
    float _372 = _358 * _326;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _376 = _300 + _374;
    float _378 = 1.0 / _320;
    bool _380 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _382 = isnan(_300);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = _376 * _336;
    bool _394 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _396 = isnan(_300);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = 1.0 / _330;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _410 = _300 + _408;
    float _412 = _304 * _350;
    bool _414 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _416 = isnan(_300);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _434 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _436 = 1.0 / _354;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _440 = _300 + _438;
    float _442 = _308 * _378;
    float _444 = -_404;
    float _446 = _444 + 1.0;
    float _448 = fma(_428, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _450 = fma(_432, _392, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = 1.0 / _334;
    float _454 = _410 * _406;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _462 = _300 + _460;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _468 = fma(_458, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _470 = _440 * _436;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _472;
    float _476 = _424 * _446;
    float _478 = -_424;
    float _480 = _478 + 1.0;
    bool _482 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _484 = isnan(_300);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = fma(_474, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _496 = -_390;
    float _498 = _496 + 1.0;
    float _500 = _390 * _480;
    float _502 = _462 * _452;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _508 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _510 = isnan(_300);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = _492 * _498;
    float _522 = -_492;
    float _524 = _522 + 1.0;
    float _526 = fma(_466, _392, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _528 = fma(_506, _392, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _530 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _532 = isnan(_300);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = _518 * _524;
    float _544 = -_518;
    float _546 = _544 + 1.0;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _548;
    float _552 = -_540;
    float _554 = _552 + 1.0;
    float _556 = _540 * _546;
    float _558 = fma(_550, _442, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _560 = fma(_362, _442, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _562 = fma(_366, _442, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _564 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _566 = isnan(_300);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = _348 * _554;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _590 = _574 * _370;
    float _592 = -_574;
    float _594 = _592 + 1.0;
    float _596 = fma(_580, _412, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _598 = fma(_584, _412, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _600 = _468 * _590;
    float _602 = _494 * _590;
    float _604 = fma(_588, _412, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _606 = _448 * _590;
    float _608 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].x, _600);
    float _610 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].y, _602);
    float _612 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[143].z, _606);
    float _614 = fma(_526, _576, _608);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _624;
    float _628 = fma(_528, _576, _610);
    float _630 = fma(_450, _576, _612);
    float _632 = fma(_618, _454, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _634 = fma(_622, _454, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _636 = fma(_626, _454, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _638 = fma(_558, _556, _614);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _644 = fma(_560, _556, _628);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _654 = fma(_562, _556, _630);
    float _656 = fma(_642, _502, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _658 = fma(_648, _502, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _660 = fma(_652, _502, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _662 = fma(_596, _542, _638);
    float _664 = fma(_598, _542, _644);
    float _666 = fma(_604, _542, _654);
    float _668 = in.m_53.x;
    float _670 = in.m_53.y;
    float _672 = in.m_53.z;
    float _674 = fma(_632, _520, _662);
    float _676 = fma(_634, _520, _664);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _682;
    float _686 = fma(_636, _520, _666);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _688;
    float _692 = fma(_680, _470, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _694 = fma(_684, _470, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _696 = fma(_656, _500, _674);
    float _698 = fma(_658, _500, _676);
    float _700 = fma(_690, _470, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _702 = fma(_660, _500, _686);
    float _704 = fma(_692, _476, _696);
    float _706 = fma(_694, _476, _698);
    float _708 = fma(_700, _476, _702);
    float _710 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[150].x, _704);
    float _712 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[150].y, _706);
    float _714 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[150].z, _708);
    float _716 = _710 * _668;
    float _718 = _712 * _670;
    float _720 = _714 * _672;
    bool _722 = !_434;
    float _740;
    if (!_722)
    {
        float _724 = in.m_57.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        _740 = _270;
    }
    _742 = false;
    float _744 = _740;
    float _746 = in.m_57.z;
    float _748 = in.m_57.w;
    float _750 = -_150;
    float _752 = _750 + 1.0;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _756 = _754 != 0;
    float _758 = in.m_59.w;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _762 = _760 != 0;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _770 = _768 != 0;
    float _772 = in.m_57.x;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _776 = _774 != 0;
    float _778 = 1.0 / _766;
    float _780 = in.m_57.y;
    float _782 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _784 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _786 = _708;
    if (_756)
    {
        float _788 = in.m_57.z;
        _786 = _788;
    }
    float _790 = _786;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _798 = _796 != 0;
    float _800 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _802 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _782);
    float _804 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _784);
    float _806 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _800);
    bool _808 = _746 > 0.5;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _810;
    bool _814 = _748 > 0.5;
    float _816 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _804);
    float _818 = 1.0 / _794;
    int _820 = _808 ? as_type<int>(_752) : as_type<int>(_150);
    float _822 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _806);
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _828 = _812 * _778;
    out.m_61.w = _758;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _832 = _744 + _830;
    float _834 = _812;
    bool _836 = _808;
    float _838 = _758;
    if (!_756)
    {
        _834 = _144;
    }
    float _840 = _834;
    float _842 = _816 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _844 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _802);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _848 = _744 + _846;
    float _850 = _822 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _852 = _840;
    float _854 = _842;
    if (_756)
    {
        bool _856 = _790 > 0.5;
        _836 = _856;
    }
    bool _858 = _836;
    float _860 = _844 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _864 = fma(_828, _848, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _866 = _826 * _818;
    int _868 = as_type<int>(_818);
    float _870 = _866;
    float _872 = _864;
    if (_756)
    {
        float _874 = -_144;
        float _876 = _874 + 1.0;
        _868 = as_type<int>(_876);
    }
    int _878 = _868;
    float _880 = _770 ? as_type<float>(_820) : _150;
    if (_776)
    {
        float _882 = _814 ? _752 : _150;
        _196 = _882;
    }
    float _884 = _196;
    float _886 = fma(_866, _832, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _888 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _890 = isnan(_744);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_798)
    {
        _838 = _772;
    }
    float _902 = _838;
    bool _904 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _906 = isnan(_744);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = _902;
    if (_756)
    {
        float _918 = _858 ? as_type<float>(_878) : _144;
        _852 = _918;
    }
    float _920 = _852;
    float _922 = -_898;
    float _924 = _922 + 1.0;
    float _926 = _862 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _928 = _780 > 0.5;
    bool _930 = _928 && _762;
    if (_798)
    {
        _870 = _902;
    }
    float _932 = _870;
    float _934 = fma(_880, _926, -0.5);
    float _936 = _920 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _938 = _932;
    if (!_798)
    {
        _916 = _772;
    }
    float _940 = _916;
    bool _942 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _944 = isnan(_744);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = -_914;
    float _956 = _954 + 1.0;
    float _958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _960 = _956;
    if (!_798)
    {
        _938 = _746;
    }
    float _962 = _938;
    float _964 = _914 * _924;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _968 = _952 * _956;
    float _970 = -_952;
    float _972 = _970 + 1.0;
    float _974 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[88].w, _966);
    float _976 = _864 * _968;
    if (!_762)
    {
        _872 = _144;
    }
    float _978 = _872;
    float _980 = _978;
    if (_930)
    {
        float _982 = -_144;
        float _984 = _982 + 1.0;
        _198 = _984;
    }
    float _986 = _198;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _990 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[115].x, _976);
    if (_798)
    {
        _960 = _780;
    }
    float _992 = _960;
    float _994 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].w, _974);
    float _996 = _992;
    if (!_798)
    {
        _996 = _940;
    }
    float _998 = _996;
    float _1000 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[88].z, _988);
    if (_762)
    {
        _980 = _986;
    }
    float _1002 = _980;
    float _1004 = _962 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1006 = _958 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1008 = fma(_886, _964, _990);
    float _1010 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1012 = _842 + _1010;
    float _1014 = fma(_1006, _1002, -0.5);
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1018 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1020 = _860 + _1018;
    float _1022 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1026 = _998 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1028 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1000);
    float _1030 = -_1016;
    float _1032 = fma(_1004, 2.0, _1030);
    float _1034 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1022);
    float _1036 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1038 = _850 + _1036;
    float _1040 = fma(_1026, -2.0, _1024);
    float _1042 = -_100;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1032);
    float _1046 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1008);
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1034);
    float _1050 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1040);
    float _1052 = _1012 * _1012;
    float _1054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1056 = fma(_1028, _1014, _1044);
    bool _1058 = _1048 >= 0.0;
    float _1060 = fma(_1020, _1020, _1052);
    float _1062 = -_1050;
    float _1064 = fma(_994, _934, _1062);
    float _1066 = _936 * _900;
    float _1068 = fma(_1038, _1038, _1060);
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1072 = _884 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1074 = rsqrt(_1068);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_1058)
    {
        _1080 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1082 = _1080;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1090 = _1072 * _1054;
    float _1092 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1094 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1096 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1098 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1100 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1102 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1104 = _1056 + 0.5;
    float _1106 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1108 = as_type<int>(_1082);
    int _1110 = as_type<int>(_1102);
    if (_1058)
    {
        float _1112 = _1082 * 5.0;
        _1108 = as_type<int>(_1112);
    }
    int _1114 = _1108;
    float _1116 = _1064 + 0.5;
    out.m_63.x = _1098;
    out.m_63.y = _1100;
    out.m_63.z = _1102;
    float _1118 = _1012 * _1074;
    float _1120 = _1020 * _1074;
    out.m_65.z = _1066;
    out.m_65.w = _1090;
    out.m_67.x = _1092;
    out.m_67.y = _1094;
    out.m_67.z = _1096;
    out.m_67.w = _1106;
    if (_1058)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3572 = as_type<float>(_1114);
        out.gl_Position.z = _3572;
    }
    out.m_69.x = _1104;
    out.m_69.y = _1116;
    if (_1058)
    {
        out.m_49.x = 0.0;
    }
    if (_1058)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1122 = -_1118;
    float _1124 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[18].w, _842);
    float _1126 = _1038 * _1074;
    float _1128 = -_1120;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _860);
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1134 = _1124 + _1132;
    float _1136 = -_1126;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1142 = _1130 + _1140;
    float _1144 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1148 = _1138 + _1146;
    float _1150 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1144);
    float _1152 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1150);
    bool _1154 = _1152 >= 0.0;
    float _1156 = _1142;
    if (_1154)
    {
        _1156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1158 = _1156;
    if (_1154)
    {
        out.m_49.x = 0.0;
    }
    if (_1154)
    {
        float _1160 = _1158 * 5.0;
        _1110 = as_type<int>(_1160);
    }
    int _1162 = _1110;
    if (_1154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3669 = as_type<float>(_1162);
        out.gl_Position.z = _3669;
    }
    if (_1154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1164 = -_842;
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1168 = -_860;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1172 = -_850;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1176 = -_1118;
    float _1178 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1012);
    float _1180 = _1166 * _1166;
    float _1182 = -_1120;
    float _1184 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1020);
    float _1186 = -_1126;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1038);
    float _1190 = _1178 * _1178;
    float _1192 = fma(_1170, _1170, _1180);
    float _1194 = fma(_1184, _1184, _1190);
    float _1196 = fma(_1174, _1174, _1192);
    float _1198 = fma(_1188, _1188, _1194);
    float _1200 = rsqrt(_1196);
    float _1202 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1204 = sqrt(_1198);
    float _1206 = _1170 * _1200;
    float _1208 = _1174 * _1200;
    float _1210 = _1166 * _1200;
    float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1214 = _1206 * _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1218 = _1208 * _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1222 = _1210 * _1220;
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1226 = -_1214;
    float _1228 = fma(_1208, _1224, _1226);
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1232 = -_1218;
    float _1234 = fma(_1210, _1230, _1232);
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1238 = -_1222;
    float _1240 = fma(_1206, _1236, _1238);
    float _1242 = in.m_71.x;
    float _1244 = in.m_71.y;
    float _1246 = in.m_71.z;
    float _1248 = _1228 * _1228;
    float _1250 = _1074 * _1204;
    float _1252 = fma(_1234, _1234, _1248);
    float _1254 = _1250 * _1202;
    float _1256 = fma(_1240, _1240, _1252);
    float _1258 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1260 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1262 = _1250 * _1258;
    float _1264 = rsqrt(_1256);
    float _1266 = _1250 * _1260;
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1244);
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1242);
    float _1272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1246);
    float _1274 = _1262 * _1268;
    float _1276 = _1254 * _1270;
    float _1278 = _1234 * _1264;
    float _1280 = _1228 * _1264;
    float _1282 = _1240 * _1264;
    float _1284 = _1210 * _1278;
    float _1286 = _1208 * _1280;
    float _1288 = -_1284;
    float _1290 = fma(_1206, _1280, _1288);
    float _1292 = -_1286;
    float _1294 = fma(_1210, _1282, _1292);
    float _1296 = _1266 * _1272;
    float _1298 = _1274 * _1290;
    float _1300 = _1274 * _1294;
    float _1302 = fma(_1276, _1282, _1298);
    float _1304 = fma(_1276, _1278, _1300);
    float _1306 = fma(_1296, _1208, _1302);
    float _1308 = fma(_1296, _1206, _1304);
    float _1310 = _1206 * _1282;
    float _1312 = _850 + _1306;
    float _1314 = _860 + _1308;
    float _1316 = -_1310;
    float _1318 = fma(_1208, _1278, _1316);
    float _1320 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1322 = _1312 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1326 = _1314 + _1324;
    float _1328 = _1274 * _1318;
    float _1330 = _1322 * _1322;
    float _1332 = fma(_1276, _1280, _1328);
    float _1334 = fma(_1326, _1326, _1330);
    float _1336 = fma(_1296, _1210, _1332);
    float _1338 = sqrt(_1334);
    float _1340 = _842 + _1336;
    bool _1342 = _1338 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1344 = _1336;
    float _1346 = _1328;
    float _1348 = _1318;
    float _1350 = _1322;
    float _1352 = _1314;
    if (!_1342)
    {
        _1344 = _1314;
    }
    float _1354 = _1344;
    float _1356 = _1354;
    if (!_1342)
    {
        _1346 = _1312;
    }
    float _1358 = _1346;
    float _1360 = _1358;
    if (!_1342)
    {
        _854 = _1340;
    }
    float _1362 = _854;
    bool _1364 = !_1342;
    float _1366 = _1362;
    if (!_1364)
    {
        float _1368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1372 = _1338 + _1370;
        float _1374 = rsqrt(_1334);
        float _1376 = _1372 * _1368;
        float _1378 = _1340 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1380 = _1376 * 0.15915493667125701904296875;
        float _1382 = _1380 * 6.283185482025146484375;
        float _1384 = sin(_1382);
        float _1386 = _1380 * 6.283185482025146484375;
        float _1388 = cos(_1386);
        float _1390 = fma(_1384, _1378, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1392 = _1374 * _1390;
        float _1394 = _1388 + (-1.0);
        float _1396 = fma(_1326, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1398 = fma(_1322, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1400 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = fma(_1340, _1388, _1400);
        _1366 = _1402;
        _1356 = _1396;
        _1360 = _1398;
        _1348 = _1374;
    }
    float _1404 = _1366;
    float _1406 = _1356;
    float _1408 = _1360;
    float _1410 = _1348;
    float _1412 = -_1118;
    float _1414 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1404);
    float _1416 = -_1120;
    float _1418 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1406);
    float _1420 = -_1126;
    float _1422 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1424 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1426 = _1414 + _1424;
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1430 = _1418 + _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1434 = _1422 + _1432;
    float _1436 = _1426 * _1426;
    float _1438 = fma(_1430, _1430, _1436);
    float _1440 = fma(_1434, _1434, _1438);
    float _1442 = rsqrt(_1440);
    float _1444 = _1442 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1446 = _1430 * _1444;
    float _1448 = _1434 * _1444;
    float _1450 = _1446 * _1446;
    float _1452 = _1448 * _1448;
    float _1454 = _1450 + _1452;
    float _1456 = sqrt(_1454);
    bool _1458 = _1456 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1462 = _1456 + _1460;
    float _1464 = _1434;
    float _1466 = _1454;
    float _1468 = _1462;
    float _1470 = _1446;
    if (_1458)
    {
        float _1472 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1464 = _1472;
    }
    float _1474 = _1464;
    if (_1458)
    {
        float _1476 = rsqrt(_1454);
        _1466 = _1476;
    }
    float _1478 = _1466;
    float _1480 = _1478;
    if (_1458)
    {
        float _1482 = _1462 * _1474;
        _1468 = _1482;
    }
    float _1484 = _1468;
    if (_1458)
    {
        float _1486 = _1484 * 0.15915493667125701904296875;
        _1350 = _1486;
    }
    float _1488 = _1350;
    float _1490 = _1410;
    if (_1458)
    {
        float _1492 = _1488 * 6.283185482025146484375;
        float _1494 = sin(_1492);
        _1490 = _1494;
    }
    float _1496 = _1490;
    float _1498 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1500 = precise::max(0.0, _1498);
    float _1502 = _1442;
    float _1504 = _1500;
    float _1506 = _1498;
    if (_1458)
    {
        float _1508 = _1488 * 6.283185482025146484375;
        float _1510 = cos(_1508);
        _1502 = _1510;
    }
    float _1512 = _1502;
    float _1514 = -_1444;
    float _1516 = -_1500;
    float _1518 = fma(_1426, _1514, _1516);
    float _1520 = _1518;
    if (_1458)
    {
        float _1522 = _1518 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1522;
    }
    float _1524 = _1504;
    float _1526 = sqrt(_1440);
    float _1528 = _1496;
    float _1530 = _1524;
    if (_1458)
    {
        float _1532 = fma(_1496, _1524, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1528 = _1532;
    }
    float _1534 = _1528;
    float _1536 = _1534;
    if (!_1458)
    {
        _1530 = _1448;
    }
    float _1538 = _1530;
    float _1540 = _1538;
    if (_1458)
    {
        float _1542 = _1512 + (-1.0);
        _1506 = _1542;
    }
    float _1544 = _1506;
    float _1546 = _1544;
    if (_1458)
    {
        float _1548 = _1478 * _1534;
        _1536 = _1548;
    }
    float _1550 = _1536;
    if (!_1458)
    {
        _1480 = _1450;
    }
    float _1552 = _1480;
    float _1554 = _1552;
    if (_1458)
    {
        float _1556 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1352 = _1556;
    }
    float _1558 = _1352;
    if (_1458)
    {
        float _1560 = _1446 * _1550;
        _1470 = _1560;
    }
    float _1562 = _1470;
    if (_1458)
    {
        float _1564 = _1448 * _1550;
        _1540 = _1564;
    }
    float _1566 = _1540;
    if (!_1458)
    {
        _1546 = _1452;
    }
    float _1568 = _1546;
    float _1570 = _1568;
    if (_1458)
    {
        float _1572 = fma(_1518, _1512, _1558);
        _1520 = _1572;
    }
    float _1574 = _1520;
    if (_1458)
    {
        float _1576 = _1562 * _1562;
        _1554 = _1576;
    }
    float _1578 = _1554;
    if (_1458)
    {
        float _1580 = _1566 * _1566;
        _1570 = _1580;
    }
    float _1582 = _1570;
    float _1584 = fma(_1574, _1574, _1578);
    float _1586 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1588 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1586);
    float _1590 = precise::clamp(_1588, 0.0, 1.0);
    float _1592 = _1584 + _1582;
    float _1594 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1596 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1598 = -_1590;
    float _1600 = _1598 + 1.0;
    float _1602 = rsqrt(_1592);
    float _1604 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1594);
    float _1606 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1608 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1610 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1612 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1604);
    float _1614 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1606);
    float _1616 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1608);
    float _1618 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1610);
    float _1620 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1622 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1614);
    float _1624 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1616);
    float _1626 = abs(_1600);
    float _1628 = log2(_1626);
    float _1630 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1632 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1634 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1618);
    float _1636 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1638 = _1602 * _1562;
    float _1640 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1642 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1644 = -_1630;
    float _1646 = fma(_1644, _1596, 1.0);
    float _1648 = _1602 * _1574;
    float _1650 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1640);
    float _1652 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1654 = _1602 * _1566;
    float _1656 = log2(_1646);
    float _1658 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1650);
    float _1660 = -_1652;
    float _1662 = fma(_1648, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1660);
    float _1664 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1666 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1668 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1658);
    float _1670 = -_1654;
    float _1672 = fma(_1670, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1662);
    float _1674 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1676 = exp2(_1664);
    float _1678 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1666);
    float _1680 = fma(_1672, -0.5, 0.5);
    float _1682 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1674);
    float _1684 = fma(_1672, 0.5, 0.5);
    float _1686 = _1648 + 1.0;
    float _1688 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1678);
    float _1690 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1682);
    float _1692 = 1.0 / _1668;
    float _1694 = fma(_1684, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1696 = _1656 * 0.693147182464599609375;
    float _1698 = fma(_1684, _1694, -0.212114393711090087890625);
    float _1700 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1688);
    float _1702 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1704 = sqrt(_1680);
    float _1706 = -_1648;
    float _1708 = fma(_1676, _1686, _1706);
    float _1710 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1690);
    float _1712 = fma(_1684, _1698, 1.570728778839111328125);
    float _1714 = fma(_1708, 0.5, 0.5);
    float _1716 = _1710 * _1692;
    float _1718 = _1700 * _1692;
    float _1720 = fma(_1716, 0.5, 0.5);
    float _1722 = fma(_1718, -0.5, 0.5);
    float _1724 = _1704 * 0.636619746685028076171875;
    float3 _4585 = float3(_1720, _1722, _1702);
    float _1726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4585, float3(0.0), isnan(_4585)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4585, float3(0.0), isnan(_4585)), level(0.0)).x;
    float3 _4596 = float3(_1720, _1722, _1702);
    float4 _1729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4596, float3(0.0), isnan(_4596)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4596, float3(0.0), isnan(_4596)), level(0.0)).xyzw;
    float _1731 = _1729.x;
    float _1733 = _1729.y;
    float _1735 = _1729.z;
    float _1737 = _1729.w;
    float _1739 = -_1712;
    float _1741 = fma(_1724, _1739, 1.0);
    float2 _4618 = float2(_1741, _1714);
    float3 _1745 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4618, float2(0.0), isnan(_4618)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4618, float2(0.0), isnan(_4618)), level(0.0)).xyz;
    float _1747 = _1745.x;
    float _1749 = _1745.y;
    float _1751 = _1745.z;
    float _1753 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1755 = _1632 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1757 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1755);
    float _1759 = exp2(_1753);
    float _1761 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1757);
    float _1763 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1761);
    float _1765 = _1763 + _1668;
    out.gl_Position.x = _1710;
    out.gl_Position.y = _1700;
    out.gl_Position.z = _1763;
    out.gl_Position.w = _1668;
    float _1767 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1769 = _1765 * 0.5;
    float _1771 = -_1759;
    float _1773 = _1771 + 1.0;
    out.m_49.x = _1767;
    float _1775 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _1769;
    out.m_73.w = _1668;
    float _1777 = _1775 * _1726;
    float _1779 = -_1775;
    float _1781 = _1779 + 1.0;
    float _1783 = _1737 * _1777;
    float _1785 = _1737 * _1781;
    float _1787 = _1751 * _1777;
    float _1789 = fma(_1747, _1783, _1731);
    float _1791 = fma(_1749, _1783, _1733);
    float _1793 = fma(_1737, _1787, _1735);
    out.m_75.x = _1789;
    out.m_75.y = _1791;
    out.m_75.z = _1793;
    out.m_75.w = _1785;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

