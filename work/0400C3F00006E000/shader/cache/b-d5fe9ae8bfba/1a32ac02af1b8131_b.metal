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
    float4 m_67 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = in.m_46.w;
    float _97 = trunc(_93);
    int _100 = int(_97);
    float _102 = -_95;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _104;
    bool _108 = _100 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_100);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_51.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1857 = as_type<float>(_120);
        out.gl_Position.z = _1857;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _124 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_95);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = float(_100);
    bool _136 = _104 >= _134;
    bool _138 = !_132;
    bool _140 = _136 || _138;
    if (_140)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _112;
    if (_140)
    {
        out.m_51.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _122 = as_type<int>(_144);
    }
    int _146 = _122;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1912 = as_type<float>(_146);
        out.gl_Position.z = _1912;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_53.w;
    float _150 = 1.0 / _134;
    float _152 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_46.x;
    float _166 = in.m_46.y;
    float _168 = in.m_46.z;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = 0.0;
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _152 * _198;
        float _208 = exp2(_206);
        float _210 = _204 * 0.693147182464599609375;
        float _212 = 1.0 / _210;
        float _214 = 1.0 / _202;
        float _216 = _208 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _212, _152);
        float _222 = _220 * _214;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _152 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = _104 * _150;
    float _262 = fma(_250, _164, _254);
    float _264 = fma(_250, _166, _256);
    float _266 = fma(_250, _168, _258);
    float _268 = fma(_262, _148, _170);
    float _270 = fma(_264, _148, _172);
    float _272 = fma(_266, _148, _174);
    bool _274 = !_252;
    float _276 = _260;
    if (!_274)
    {
        float _278 = in.m_55.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _104);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _276 = _292;
    }
    float _294 = _276;
    float _296 = in.m_55.x;
    float _298 = in.m_55.y;
    float _300 = in.m_55.z;
    float _302 = in.m_55.w;
    float _304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _322 = 1.0 / _308;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _332 = 1.0 / _316;
    bool _334 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _336 = isnan(_294);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _348 = _346 != 0;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _352 = _350 != 0;
    float _354 = 1.0 / _312;
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _358 = _356 != 0;
    int _360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _362 = _360 != 0;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = _294 + _364;
    bool _368 = _302 > 0.5;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _372 = _294 + _370;
    float _374 = 1.0 / _320;
    float _376 = _366 * _322;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _294 + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _384 = _294 + _382;
    float _386 = _372 * _332;
    bool _388 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _390 = isnan(_294);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    bool _400 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _402 = isnan(_294);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = 1.0 / _326;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _416 = _294 + _414;
    float _418 = _380 * _354;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _422 = _294 + _420;
    float _424 = -_398;
    float _426 = _424 + 1.0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _430 = _428 != 0;
    float _432 = -_410;
    float _434 = _432 + 1.0;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _436;
    float _440 = 1.0 / _330;
    float _442 = _384 * _374;
    bool _444 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _446 = isnan(_294);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = _410 * _426;
    float _458 = fma(_438, _376, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _460 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _462 = isnan(_294);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = -_454;
    float _474 = _472 + 1.0;
    float _476 = _416 * _412;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _478;
    float _482 = _344 * _474;
    float _484 = fma(_480, _376, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _486 = _454 * _434;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _492 = _422 * _440;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _494;
    float _498 = -_344;
    float _500 = _498 + 1.0;
    bool _502 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _504 = isnan(_294);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _518 = fma(_496, _376, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _520 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _522 = isnan(_294);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _536 = -_512;
    float _538 = _536 + 1.0;
    float _540 = fma(_516, _418, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _542 = _530 * _500;
    float _544 = -_530;
    float _546 = _544 + 1.0;
    float _548 = _470 * _538;
    float _550 = fma(_490, _418, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _552 = fma(_534, _418, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _554 = _512 * _546;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _556;
    float _560 = _458 * _548;
    float _562 = _484 * _548;
    float _564 = -_470;
    float _566 = _564 + 1.0;
    float _568 = _518 * _548;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _570;
    float _574 = fma(_558, _386, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _592 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].x, _560);
    float _594 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].y, _562);
    float _596 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].z, _568);
    float _598 = fma(_582, _386, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _600 = fma(_572, _386, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _602 = fma(_586, _442, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _604 = fma(_590, _442, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _606 = fma(_578, _442, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _608 = fma(_540, _554, _592);
    float _610 = fma(_550, _554, _594);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _620;
    float _624 = fma(_552, _554, _596);
    float _626 = fma(_614, _476, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _628 = fma(_618, _476, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _630 = fma(_622, _476, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _632 = fma(_598, _542, _608);
    float _634 = fma(_574, _542, _610);
    float _636 = fma(_600, _542, _624);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _650 = fma(_602, _482, _632);
    float _652 = fma(_640, _492, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _654 = fma(_644, _492, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _656 = fma(_648, _492, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _658 = fma(_604, _482, _634);
    float _660 = fma(_606, _482, _636);
    float _662 = fma(_626, _486, _650);
    float _664 = in.m_57.x;
    float _666 = in.m_57.y;
    float _668 = in.m_57.z;
    float _670 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _672 = fma(_630, _486, _660);
    float _674 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _676 = fma(_652, _456, _662);
    float _678 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _680 = fma(_656, _456, _672);
    float _682 = fma(_628, _486, _658);
    float _684 = in.m_53.x;
    float _686 = in.m_53.y;
    float _688 = in.m_53.z;
    float _690 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _670);
    float _692 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _674);
    float _694 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _678);
    float _696 = fma(_654, _456, _682);
    float _698 = in.m_59.y;
    float _700 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _690);
    float _702 = in.m_61.x;
    float _704 = in.m_61.y;
    float _706 = in.m_61.z;
    float _708 = _672;
    float _710 = _674;
    float _712 = _682;
    float _714 = _698;
    bool _716 = _358;
    if (!_430)
    {
        _708 = _300;
    }
    float _718 = _708;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _722 = _718;
    if (!_430)
    {
        _710 = _300;
    }
    float _724 = _710;
    float _726 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[149].y, _696);
    float _728 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[79].z, _720);
    bool _730 = _666 != 0.0;
    bool _732 = isnan(_666);
    bool _734 = _730 || _732;
    bool _736 = isnan(0.0);
    bool _738 = _734 || _736;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _742 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[149].z, _680);
    float _744 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[149].x, _676);
    bool _746 = _664 == 0.0;
    bool _748 = !_738;
    bool _750 = _746 && _748;
    float _752 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[78].w, _740);
    float _754 = _724;
    if (!_430)
    {
        _712 = _298;
    }
    float _756 = _712;
    float _758 = _298 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _760 = _668 == 0.0;
    bool _762 = _760 && _750;
    float _764 = _742 * _688;
    float _766 = _756;
    bool _768 = _762;
    float _770 = _758;
    if (_430)
    {
        _766 = _296;
    }
    float _772 = _766;
    float _774 = _744 * _684;
    if (_430)
    {
        _722 = _298;
    }
    float _776 = _722;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_430)
    {
        _754 = _298;
    }
    float _780 = _754;
    float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _784 = _298 > 0.5;
    float _786 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[78].z, _778);
    float _788 = _296 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _790 = _704;
    float _792 = _702;
    float _794 = _706;
    if (!_762)
    {
        float _796 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _704);
        _790 = _796;
    }
    float _798 = _790;
    float _800 = -_698;
    float _802 = _800 + 1.0;
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _666);
    float _806 = _798;
    if (!_762)
    {
        float _808 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[17].y, _702);
        _792 = _808;
    }
    float _810 = _792;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _664);
    float _816 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _692);
    float _818 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _694);
    float _820 = -_812;
    float _822 = fma(_788, 2.0, _820);
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _826 = _368 ? as_type<int>(_802) : as_type<int>(_698);
    float _828 = _726 * _686;
    if (!_762)
    {
        float _830 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _706);
        _794 = _830;
    }
    float _832 = _794;
    float _834 = _358 ? as_type<float>(_826) : _698;
    float _836 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _668);
    if (_362)
    {
        float _838 = _784 ? _802 : _698;
        _714 = _838;
    }
    float _840 = _714;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _844 = _782 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _846 = _676;
    if (_352)
    {
        float _848 = in.m_55.z;
        _846 = _848;
    }
    float _850 = _846;
    float _852 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _854 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[83].w, _842);
    float _856 = fma(_844, _840, -0.5);
    float _858 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _860 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _862 = _824 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _864 = _858 * _836;
    float _866 = in.m_59.x;
    float _868 = _852 * _814;
    float _870 = fma(_834, _862, -0.5);
    float _872 = _864 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[148].x;
    if (_348)
    {
        float _876 = in.m_55.x;
        _874 = _876;
    }
    float _878 = _874;
    float _880 = _864 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _882 = _860 * _804;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _886 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[8].x, _872);
    float _888 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].x, _880);
    float _890 = _700 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _892 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[83].z, _884);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _896 = _772 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _898 = _818 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _900 = -_882;
    float _902 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[8].z, _886);
    float _904 = -_882;
    float _906 = fma(_904, (*spvDescriptorSet0.vp_c10)._m0[10].z, _888);
    float _908 = -_894;
    float _910 = fma(_896, 2.0, _908);
    float _912 = _890 + _902;
    float _914 = _898 + _906;
    float _916 = _776 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _918 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _920 = _912 + _918;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _924 = _914 + _922;
    int _926 = as_type<int>(_888);
    float _928 = _912;
    float _930 = _914;
    if (_352)
    {
        bool _932 = _850 > 0.5;
        _716 = _932;
    }
    bool _934 = _716;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _938 = _920 * _920;
    float _940 = _924 * _924;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _944 = _938;
    float _946 = _940;
    if (_348)
    {
        float _948 = -_866;
        float _950 = _948 + 1.0;
        _926 = as_type<int>(_950);
    }
    int _952 = _926;
    float _954 = _878;
    if (_348)
    {
        bool _956 = _878 > 0.5;
        _768 = _956;
    }
    bool _958 = _768;
    float _960 = fma(_916, -2.0, _936);
    float _962 = _938 + _940;
    float _964 = fma(_758, -2.0, _942);
    if (!_348)
    {
        _770 = _866;
    }
    float _966 = _770;
    int _968 = 0;
    float _970 = _966;
    if (_352)
    {
        float _972 = -_866;
        float _974 = _972 + 1.0;
        _968 = as_type<int>(_974);
    }
    int _976 = _968;
    if (_348)
    {
        float _978 = _958 ? as_type<float>(_952) : _866;
        _970 = _978;
    }
    float _980 = _970;
    float _982 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[79].x, _728);
    float _984 = sqrt(_962);
    if (!_352)
    {
        _954 = _866;
    }
    float _986 = _954;
    float _988 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[82].w, _854);
    float _990 = _986;
    if (_352)
    {
        float _992 = _934 ? as_type<float>(_976) : _866;
        _990 = _992;
    }
    float _994 = _990;
    float _996 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[76].y, _964);
    float _998 = _864 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1000 = _982 * (-0.15915493667125701904296875);
    float _1002 = _832 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1006 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[9].x, _998);
    float _1008 = -_104;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[76].x, _822);
    float _1012 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[82].z, _892);
    float _1014 = -_104;
    float _1016 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[81].x, _910);
    float _1018 = _832 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1020 = _832 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1022 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1002);
    bool _1024 = _984 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = -_882;
    float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1006);
    float _1030 = _1000 * 6.283185482025146484375;
    float _1032 = sin(_1030);
    float _1034 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[77].z, _786);
    float _1036 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[77].w, _752);
    float _1038 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[81].y, _960);
    float _1040 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1018);
    float _1042 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1020);
    float _1044 = _304 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1046 = _816 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1048 = _1000 * 6.283185482025146484375;
    float _1050 = cos(_1048);
    float _1052 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1054 = fma(_1044, _994, -0.5);
    float _1056 = _1046 + _1028;
    float _1058 = -_1038;
    float _1060 = fma(_988, _870, _1058);
    float _1062 = fma(_1052, _980, -0.5);
    float _1064 = _1028;
    if (!_1024)
    {
        _1064 = _1056;
    }
    float _1066 = _1064;
    bool _1068 = !_1024;
    float _1070 = _1066;
    float _1072 = _1050;
    if (!_1068)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1078 = _984 + _1076;
        float _1080 = rsqrt(_962);
        float _1082 = _1078 * _1074;
        float _1084 = _1056 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = _1082 * 0.15915493667125701904296875;
        float _1088 = _1086 * 6.283185482025146484375;
        float _1090 = sin(_1088);
        float _1092 = _1086 * 6.283185482025146484375;
        float _1094 = cos(_1092);
        float _1096 = fma(_1090, _1084, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1098 = _1080 * _1096;
        float _1100 = _1094 + (-1.0);
        float _1102 = fma(_920, _1098, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1104 = fma(_924, _1098, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1106 = _1100 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1110 = _1102 + _1108;
        float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1114 = _1104 + _1112;
        float _1116 = fma(_1056, _1094, _1106);
        float _1118 = _1110 * _1110;
        float _1120 = _1114 * _1114;
        _1070 = _1116;
        _944 = _1118;
        _946 = _1120;
        _928 = _1102;
        _930 = _1104;
    }
    float _1122 = _1070;
    float _1124 = _944;
    float _1126 = _946;
    float _1128 = _928;
    float _1130 = _930;
    float _1132 = _1050 * _856;
    float _1134 = -_798;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1040);
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1140 = _1122 + _1138;
    float _1142 = _1032 * _856;
    float _1144 = fma(_1032, _1062, _1132);
    float _1146 = fma(_1012, _1054, _1016);
    float _1148 = fma(_1140, _1140, _1124);
    float _1150 = -_1142;
    float _1152 = fma(_1050, _1062, _1150);
    float _1154 = -_996;
    float _1156 = fma(_1036, _1144, _1154);
    float _1158 = -_798;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1042);
    float _1162 = in.m_63.w;
    float _1164 = _1148 + _1126;
    float _1166 = fma(_1034, _1152, _1010);
    float _1168 = -_798;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1022);
    float _1172 = _1060 + 0.5;
    float _1174 = sqrt(_1164);
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1192 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1194 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1196 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1198 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = _1146 + 0.5;
    float _1202 = _1166 + 0.5;
    float _1204 = _1156 + 0.5;
    out.m_65.w = _1162;
    bool _1206 = _1174 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1208 = isnan(_1174);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1214 = _1210 || _1212;
    out.m_67.x = _1186;
    out.m_67.y = _1190;
    out.m_67.z = _1192;
    out.m_69.x = _1194;
    out.m_69.y = _1196;
    out.m_69.z = _1198;
    out.m_71.x = _1170;
    out.m_71.y = _1136;
    out.m_71.z = _1160;
    float _1216 = _1196;
    if (!_1214)
    {
        _806 = 1.0;
    }
    float _1218 = _806;
    out.m_73.x = _1202;
    out.m_73.y = _1204;
    out.m_73.z = _1200;
    out.m_73.w = _1172;
    bool _1220 = !_1214;
    float _1222 = _1218;
    if (!_1220)
    {
        bool _1224 = _1174 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1226 = isnan(_1174);
        bool _1228 = _1224 || _1226;
        bool _1230 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1232 = _1228 || _1230;
        if (!_1232)
        {
            float _1234 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1236 = _1174 + _1234;
            float _1238 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1240 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1238;
            float _1242 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1244 = _1242 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1246 = 1.0 / _1240;
            float _1248 = _1236 * _1246;
            float _1250 = fma(_1248, _1244, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1222 = _1250;
            _1252 = true;
        }
        else
        {
            bool _1254 = _1174 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1256 = isnan(_1174);
            bool _1258 = _1254 || _1256;
            bool _1260 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1262 = _1258 || _1260;
            if (!_1262)
            {
                float _1264 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1266 = _1174 + _1264;
                float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1270 = _1268 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1272 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1274 = _1272 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1276 = 1.0 / _1270;
                float _1278 = _1266 * _1276;
                float _1280 = fma(_1278, _1274, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1222 = _1280;
                _1252 = true;
            }
            else
            {
                _1222 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1252 = false;
    float _1282 = _1222;
    float _1284 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1286 = _1122 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1290 = _1128 + _1288;
    float _1292 = fma(_1286, _1282, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1296 = _1130 + _1294;
    float _1298 = fma(_1290, _1282, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1302 = _1292 + _1300;
    float _1304 = fma(_1296, _1282, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1308 = _1298 + _1306;
    float _1310 = _1302 * _1302;
    float _1312 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1314 = _1304 + _1312;
    float _1316 = fma(_1308, _1308, _1310);
    float _1318 = fma(_1314, _1314, _1316);
    float _1320 = rsqrt(_1318);
    float _1322 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1324 = _1308 * _1322;
    float _1326 = _1314 * _1322;
    float _1328 = _1324 * _1324;
    float _1330 = _1326 * _1326;
    float _1332 = _1328 + _1330;
    float _1334 = sqrt(_1332);
    bool _1336 = _1334 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1340 = _1334 + _1338;
    float _1342 = _1314;
    float _1344 = _1320;
    float _1346 = _1340;
    float _1348 = _1302;
    float _1350 = _1324;
    if (_1336)
    {
        float _1352 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1342 = _1352;
    }
    float _1354 = _1342;
    if (_1336)
    {
        float _1356 = rsqrt(_1332);
        _1344 = _1356;
    }
    float _1358 = _1344;
    float _1360 = _1358;
    if (_1336)
    {
        float _1362 = _1340 * _1354;
        _1346 = _1362;
    }
    float _1364 = _1346;
    if (_1336)
    {
        float _1366 = _1364 * 0.15915493667125701904296875;
        _1216 = _1366;
    }
    float _1368 = _1216;
    float _1370 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1372 = _1354;
    if (_1336)
    {
        float _1374 = _1368 * 6.283185482025146484375;
        float _1376 = sin(_1374);
        _1372 = _1376;
    }
    float _1378 = _1372;
    float _1380 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1382 = precise::max(0.0, _1380);
    float _1384 = _1194;
    float _1386 = _1382;
    if (_1336)
    {
        float _1388 = _1368 * 6.283185482025146484375;
        float _1390 = cos(_1388);
        _1384 = _1390;
    }
    float _1392 = _1384;
    float _1394 = -_1322;
    float _1396 = -_1382;
    float _1398 = fma(_1302, _1394, _1396);
    if (!_1336)
    {
        _1348 = _1328;
    }
    float _1400 = _1348;
    float _1402 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1404 = _1400;
    if (_1336)
    {
        float _1406 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1386 = _1406;
    }
    float _1408 = _1386;
    float _1410 = sqrt(_1318);
    float _1412 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1402);
    float _1414 = _1378;
    float _1416 = _1408;
    if (_1336)
    {
        float _1418 = fma(_1378, _1408, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1414 = _1418;
    }
    float _1420 = _1414;
    float _1422 = _1420;
    if (_1336)
    {
        float _1424 = _1392 + (-1.0);
        _1416 = _1424;
    }
    float _1426 = _1416;
    float _1428 = _1426;
    if (_1336)
    {
        float _1430 = _1358 * _1420;
        _1072 = _1430;
    }
    float _1432 = _1072;
    if (!_1336)
    {
        _1360 = _1398;
    }
    float _1434 = _1360;
    float _1436 = _1434;
    if (_1336)
    {
        float _1438 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1428 = _1438;
    }
    float _1440 = _1428;
    float _1442 = _1440;
    if (_1336)
    {
        float _1444 = _1324 * _1432;
        _1350 = _1444;
    }
    float _1446 = _1350;
    if (!_1336)
    {
        _1422 = _1326;
    }
    float _1448 = _1422;
    float _1450 = _1448;
    if (_1336)
    {
        float _1452 = _1326 * _1432;
        _1450 = _1452;
    }
    float _1454 = _1450;
    if (_1336)
    {
        float _1456 = fma(_1398, _1392, _1440);
        _1436 = _1456;
    }
    float _1458 = _1436;
    if (_1336)
    {
        float _1460 = _1446 * _1446;
        _1404 = _1460;
    }
    float _1462 = _1404;
    if (!_1336)
    {
        _1442 = _1330;
    }
    float _1464 = _1442;
    float _1466 = _1464;
    if (_1336)
    {
        float _1468 = _1454 * _1454;
        _1466 = _1468;
    }
    float _1470 = _1466;
    float _1472 = fma(_1458, _1458, _1462);
    float _1474 = _1472 + _1470;
    float _1476 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1480 = fma(_1410, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1478);
    float _1482 = precise::clamp(_1480, 0.0, 1.0);
    float _1484 = rsqrt(_1474);
    float _1486 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1476);
    float _1488 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1490 = -_1482;
    float _1492 = _1490 + 1.0;
    float _1494 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1486);
    float _1496 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1498 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1488);
    float _1500 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1502 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1496);
    float _1504 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1498);
    float _1506 = abs(_1492);
    float _1508 = log2(_1506);
    float _1510 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1512 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1502);
    float _1514 = _1504 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1516 = _1484 * _1446;
    float _1518 = -_1510;
    float _1520 = fma(_1518, _1370, 1.0);
    float _1522 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1412);
    float _1524 = _1484 * _1458;
    float _1526 = _1516 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1528 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1530 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1532 = _1484 * _1454;
    float _1534 = -_1526;
    float _1536 = fma(_1524, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1534);
    float _1538 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1540 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1530);
    float _1542 = log2(_1520);
    float _1544 = -_1532;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1536);
    float _1548 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1550 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1540);
    float _1552 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1554 = fma(_1546, -0.5, 0.5);
    float _1556 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1558 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1550);
    float _1560 = exp2(_1548);
    float _1562 = fma(_1546, 0.5, 0.5);
    float _1564 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1552);
    float _1566 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1556);
    float _1568 = _1524 + 1.0;
    float _1570 = fma(_1562, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1572 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1564);
    float _1574 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1566);
    float _1576 = 1.0 / _1558;
    float _1578 = fma(_1562, _1570, -0.212114393711090087890625);
    float _1580 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1572);
    float _1582 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1574);
    float _1584 = _1542 * 0.693147182464599609375;
    float _1586 = fma(_1562, _1578, 1.570728778839111328125);
    float _1588 = sqrt(_1554);
    float _1590 = -_1524;
    float _1592 = fma(_1560, _1568, _1590);
    float _1594 = _1580 * _1576;
    float _1596 = _1582 * _1576;
    float _1598 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1600 = fma(_1592, 0.5, 0.5);
    float _1602 = fma(_1594, 0.5, 0.5);
    float _1604 = fma(_1596, -0.5, 0.5);
    float _1606 = _1588 * 0.636619746685028076171875;
    float _1608 = -_1586;
    float _1610 = fma(_1606, _1608, 1.0);
    float3 _4396 = float3(_1602, _1604, _1598);
    float _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4396, float3(0.0), isnan(_4396)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4396, float3(0.0), isnan(_4396)), level(0.0)).x;
    float3 _4407 = float3(_1602, _1604, _1598);
    float4 _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4407, float3(0.0), isnan(_4407)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4407, float3(0.0), isnan(_4407)), level(0.0)).xyzw;
    float _1617 = _1615.x;
    float _1619 = _1615.y;
    float _1621 = _1615.z;
    float _1623 = _1615.w;
    float2 _4424 = float2(_1610, _1600);
    float3 _1627 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4424, float2(0.0), isnan(_4424)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4424, float2(0.0), isnan(_4424)), level(0.0)).xyz;
    float _1629 = _1627.x;
    float _1631 = _1627.y;
    float _1633 = _1627.z;
    float _1635 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1637 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1639 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1641 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1635);
    float _1643 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1637);
    float _1645 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1647 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1641);
    float _1649 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1643);
    float _1651 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1645);
    float _1653 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1655 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1657 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1651);
    float _1659 = 1.0 / _1653;
    bool _1661 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan(0.5);
    bool _1669 = _1665 || _1667;
    float _1671 = _1655 + _1653;
    float _1673 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1657);
    float _1675 = exp2(_1639);
    float _1677 = _1645;
    if (_1669)
    {
        _1677 = 1.0;
    }
    float _1679 = _1677;
    float _1681 = _1671 * _1659;
    float _1683 = _1681 * 0.5;
    float _1685 = _1679;
    if (!_1669)
    {
        float _1687 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1691 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1689);
        float _1693 = _1687 * 0.15915493667125701904296875;
        float _1695 = _1693 * 6.283185482025146484375;
        float _1697 = cos(_1695);
        float _1699 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1701 = _1699 * 0.15915493667125701904296875;
        float _1703 = _1693 * 6.283185482025146484375;
        float _1705 = sin(_1703);
        float _1707 = 1.0 / _1697;
        float _1709 = _1701 * 6.283185482025146484375;
        float _1711 = cos(_1709);
        float _1713 = _1705 * _1707;
        float _1715 = 1.0 / _1691;
        float _1717 = _1711 * _1713;
        float _1719 = _1701 * 6.283185482025146484375;
        float _1721 = sin(_1719);
        float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1725 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1723;
        float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1729 = _1715 * _1727;
        float _1731 = 1.0 / _1717;
        float _1733 = 1.0 / _1725;
        float _1735 = _1721 * _1731;
        float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1739 = fma(_1735, _1729, _1737);
        float _1741 = _1739 * _1733;
        float _1743 = precise::clamp(_1741, 0.0, 1.0);
        _1685 = _1743;
    }
    float _1745 = _1685;
    float _1747 = -_1675;
    float _1749 = _1747 + 1.0;
    float _1751 = _1745 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1753 = _1745 > 0.0;
    bool _1755 = isnan(_1745);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan(0.0);
    bool _1761 = _1757 || _1759;
    float _1763 = _1673 + _1558;
    float _1765 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1767 = _1751 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _1298;
    out.m_75.y = _1292;
    out.m_75.z = _1304;
    float _1769 = _1765 * _1612;
    float _1771 = -_1765;
    float _1773 = _1771 + 1.0;
    float _1775 = _1763 * 0.5;
    float _1777 = _1623 * _1769;
    float _1779 = _1633 * _1769;
    float _1781 = _1623 * _1773;
    out.gl_Position.x = _1580;
    out.gl_Position.y = _1582;
    out.gl_Position.z = _1673;
    out.gl_Position.w = _1558;
    float _1783 = fma(_1629, _1777, _1617);
    float _1785 = fma(_1631, _1777, _1619);
    float _1787 = fma(_1623, _1779, _1621);
    out.m_77.z = _1775;
    out.m_77.w = _1558;
    out.m_51.x = _1767;
    out.m_79.x = _1783;
    out.m_79.y = _1785;
    out.m_79.z = _1787;
    out.m_79.w = _1781;
    if (_1761)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _1789 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1789;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = in.m_46.w;
    float _97 = trunc(_93);
    int _100 = int(_97);
    float _102 = -_95;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _104;
    bool _108 = _100 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_100);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_51.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1857 = as_type<float>(_120);
        out.gl_Position.z = _1857;
    }
    if (!_108)
    {
        return out;
    }
    bool _124 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_95);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = float(_100);
    bool _136 = _104 >= _134;
    bool _138 = !_132;
    bool _140 = _136 || _138;
    if (_140)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _112;
    if (_140)
    {
        out.m_51.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _122 = as_type<int>(_144);
    }
    int _146 = _122;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1912 = as_type<float>(_146);
        out.gl_Position.z = _1912;
    }
    if (_140)
    {
        return out;
    }
    float _148 = in.m_53.w;
    float _150 = 1.0 / _134;
    float _152 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_46.x;
    float _166 = in.m_46.y;
    float _168 = in.m_46.z;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = 0.0;
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _152 * _198;
        float _208 = exp2(_206);
        float _210 = _204 * 0.693147182464599609375;
        float _212 = 1.0 / _210;
        float _214 = 1.0 / _202;
        float _216 = _208 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _212, _152);
        float _222 = _220 * _214;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _152 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = _104 * _150;
    float _262 = fma(_250, _164, _254);
    float _264 = fma(_250, _166, _256);
    float _266 = fma(_250, _168, _258);
    float _268 = fma(_262, _148, _170);
    float _270 = fma(_264, _148, _172);
    float _272 = fma(_266, _148, _174);
    bool _274 = !_252;
    float _276 = _260;
    if (!_274)
    {
        float _278 = in.m_55.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _104);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _276 = _292;
    }
    float _294 = _276;
    float _296 = in.m_55.x;
    float _298 = in.m_55.y;
    float _300 = in.m_55.z;
    float _302 = in.m_55.w;
    float _304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _322 = 1.0 / _308;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _332 = 1.0 / _316;
    bool _334 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _336 = isnan(_294);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _348 = _346 != 0;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _352 = _350 != 0;
    float _354 = 1.0 / _312;
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _358 = _356 != 0;
    int _360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _362 = _360 != 0;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = _294 + _364;
    bool _368 = _302 > 0.5;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _372 = _294 + _370;
    float _374 = 1.0 / _320;
    float _376 = _366 * _322;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _294 + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _384 = _294 + _382;
    float _386 = _372 * _332;
    bool _388 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _390 = isnan(_294);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    bool _400 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _402 = isnan(_294);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = 1.0 / _326;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _416 = _294 + _414;
    float _418 = _380 * _354;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _422 = _294 + _420;
    float _424 = -_398;
    float _426 = _424 + 1.0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _430 = _428 != 0;
    float _432 = -_410;
    float _434 = _432 + 1.0;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _436;
    float _440 = 1.0 / _330;
    float _442 = _384 * _374;
    bool _444 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _446 = isnan(_294);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = _410 * _426;
    float _458 = fma(_438, _376, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _460 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _462 = isnan(_294);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = -_454;
    float _474 = _472 + 1.0;
    float _476 = _416 * _412;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _478;
    float _482 = _344 * _474;
    float _484 = fma(_480, _376, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _486 = _454 * _434;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _492 = _422 * _440;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _494;
    float _498 = -_344;
    float _500 = _498 + 1.0;
    bool _502 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _504 = isnan(_294);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _518 = fma(_496, _376, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _520 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _522 = isnan(_294);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _536 = -_512;
    float _538 = _536 + 1.0;
    float _540 = fma(_516, _418, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _542 = _530 * _500;
    float _544 = -_530;
    float _546 = _544 + 1.0;
    float _548 = _470 * _538;
    float _550 = fma(_490, _418, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _552 = fma(_534, _418, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _554 = _512 * _546;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _556;
    float _560 = _458 * _548;
    float _562 = _484 * _548;
    float _564 = -_470;
    float _566 = _564 + 1.0;
    float _568 = _518 * _548;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _570;
    float _574 = fma(_558, _386, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _592 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].x, _560);
    float _594 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].y, _562);
    float _596 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].z, _568);
    float _598 = fma(_582, _386, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _600 = fma(_572, _386, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _602 = fma(_586, _442, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _604 = fma(_590, _442, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _606 = fma(_578, _442, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _608 = fma(_540, _554, _592);
    float _610 = fma(_550, _554, _594);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _620;
    float _624 = fma(_552, _554, _596);
    float _626 = fma(_614, _476, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _628 = fma(_618, _476, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _630 = fma(_622, _476, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _632 = fma(_598, _542, _608);
    float _634 = fma(_574, _542, _610);
    float _636 = fma(_600, _542, _624);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _650 = fma(_602, _482, _632);
    float _652 = fma(_640, _492, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _654 = fma(_644, _492, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _656 = fma(_648, _492, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _658 = fma(_604, _482, _634);
    float _660 = fma(_606, _482, _636);
    float _662 = fma(_626, _486, _650);
    float _664 = in.m_57.x;
    float _666 = in.m_57.y;
    float _668 = in.m_57.z;
    float _670 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _672 = fma(_630, _486, _660);
    float _674 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _676 = fma(_652, _456, _662);
    float _678 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _680 = fma(_656, _456, _672);
    float _682 = fma(_628, _486, _658);
    float _684 = in.m_53.x;
    float _686 = in.m_53.y;
    float _688 = in.m_53.z;
    float _690 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _670);
    float _692 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _674);
    float _694 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _678);
    float _696 = fma(_654, _456, _682);
    float _698 = in.m_59.y;
    float _700 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _690);
    float _702 = in.m_61.x;
    float _704 = in.m_61.y;
    float _706 = in.m_61.z;
    float _708 = _672;
    float _710 = _674;
    float _712 = _682;
    float _714 = _698;
    bool _716 = _358;
    if (!_430)
    {
        _708 = _300;
    }
    float _718 = _708;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _722 = _718;
    if (!_430)
    {
        _710 = _300;
    }
    float _724 = _710;
    float _726 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[149].y, _696);
    float _728 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[79].z, _720);
    bool _730 = _666 != 0.0;
    bool _732 = isnan(_666);
    bool _734 = _730 || _732;
    bool _736 = isnan(0.0);
    bool _738 = _734 || _736;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _742 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[149].z, _680);
    float _744 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[149].x, _676);
    bool _746 = _664 == 0.0;
    bool _748 = !_738;
    bool _750 = _746 && _748;
    float _752 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[78].w, _740);
    float _754 = _724;
    if (!_430)
    {
        _712 = _298;
    }
    float _756 = _712;
    float _758 = _298 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _760 = _668 == 0.0;
    bool _762 = _760 && _750;
    float _764 = _742 * _688;
    float _766 = _756;
    bool _768 = _762;
    float _770 = _758;
    if (_430)
    {
        _766 = _296;
    }
    float _772 = _766;
    float _774 = _744 * _684;
    if (_430)
    {
        _722 = _298;
    }
    float _776 = _722;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_430)
    {
        _754 = _298;
    }
    float _780 = _754;
    float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _784 = _298 > 0.5;
    float _786 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[78].z, _778);
    float _788 = _296 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _790 = _704;
    float _792 = _702;
    float _794 = _706;
    if (!_762)
    {
        float _796 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _704);
        _790 = _796;
    }
    float _798 = _790;
    float _800 = -_698;
    float _802 = _800 + 1.0;
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _666);
    float _806 = _798;
    if (!_762)
    {
        float _808 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[17].y, _702);
        _792 = _808;
    }
    float _810 = _792;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _664);
    float _816 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _692);
    float _818 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _694);
    float _820 = -_812;
    float _822 = fma(_788, 2.0, _820);
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _826 = _368 ? as_type<int>(_802) : as_type<int>(_698);
    float _828 = _726 * _686;
    if (!_762)
    {
        float _830 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _706);
        _794 = _830;
    }
    float _832 = _794;
    float _834 = _358 ? as_type<float>(_826) : _698;
    float _836 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _668);
    if (_362)
    {
        float _838 = _784 ? _802 : _698;
        _714 = _838;
    }
    float _840 = _714;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _844 = _782 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _846 = _676;
    if (_352)
    {
        float _848 = in.m_55.z;
        _846 = _848;
    }
    float _850 = _846;
    float _852 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _854 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[83].w, _842);
    float _856 = fma(_844, _840, -0.5);
    float _858 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _860 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _862 = _824 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _864 = _858 * _836;
    float _866 = in.m_59.x;
    float _868 = _852 * _814;
    float _870 = fma(_834, _862, -0.5);
    float _872 = _864 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[148].x;
    if (_348)
    {
        float _876 = in.m_55.x;
        _874 = _876;
    }
    float _878 = _874;
    float _880 = _864 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _882 = _860 * _804;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _886 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[8].x, _872);
    float _888 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].x, _880);
    float _890 = _700 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _892 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[83].z, _884);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _896 = _772 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _898 = _818 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _900 = -_882;
    float _902 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[8].z, _886);
    float _904 = -_882;
    float _906 = fma(_904, (*spvDescriptorSet0.vp_c10)._m0[10].z, _888);
    float _908 = -_894;
    float _910 = fma(_896, 2.0, _908);
    float _912 = _890 + _902;
    float _914 = _898 + _906;
    float _916 = _776 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _918 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _920 = _912 + _918;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _924 = _914 + _922;
    int _926 = as_type<int>(_888);
    float _928 = _912;
    float _930 = _914;
    if (_352)
    {
        bool _932 = _850 > 0.5;
        _716 = _932;
    }
    bool _934 = _716;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _938 = _920 * _920;
    float _940 = _924 * _924;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _944 = _938;
    float _946 = _940;
    if (_348)
    {
        float _948 = -_866;
        float _950 = _948 + 1.0;
        _926 = as_type<int>(_950);
    }
    int _952 = _926;
    float _954 = _878;
    if (_348)
    {
        bool _956 = _878 > 0.5;
        _768 = _956;
    }
    bool _958 = _768;
    float _960 = fma(_916, -2.0, _936);
    float _962 = _938 + _940;
    float _964 = fma(_758, -2.0, _942);
    if (!_348)
    {
        _770 = _866;
    }
    float _966 = _770;
    int _968 = 0;
    float _970 = _966;
    if (_352)
    {
        float _972 = -_866;
        float _974 = _972 + 1.0;
        _968 = as_type<int>(_974);
    }
    int _976 = _968;
    if (_348)
    {
        float _978 = _958 ? as_type<float>(_952) : _866;
        _970 = _978;
    }
    float _980 = _970;
    float _982 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[79].x, _728);
    float _984 = sqrt(_962);
    if (!_352)
    {
        _954 = _866;
    }
    float _986 = _954;
    float _988 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[82].w, _854);
    float _990 = _986;
    if (_352)
    {
        float _992 = _934 ? as_type<float>(_976) : _866;
        _990 = _992;
    }
    float _994 = _990;
    float _996 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[76].y, _964);
    float _998 = _864 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1000 = _982 * (-0.15915493667125701904296875);
    float _1002 = _832 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1006 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[9].x, _998);
    float _1008 = -_104;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[76].x, _822);
    float _1012 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[82].z, _892);
    float _1014 = -_104;
    float _1016 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[81].x, _910);
    float _1018 = _832 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1020 = _832 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1022 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1002);
    bool _1024 = _984 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = -_882;
    float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1006);
    float _1030 = _1000 * 6.283185482025146484375;
    float _1032 = sin(_1030);
    float _1034 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[77].z, _786);
    float _1036 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[77].w, _752);
    float _1038 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[81].y, _960);
    float _1040 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1018);
    float _1042 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1020);
    float _1044 = _304 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1046 = _816 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1048 = _1000 * 6.283185482025146484375;
    float _1050 = cos(_1048);
    float _1052 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1054 = fma(_1044, _994, -0.5);
    float _1056 = _1046 + _1028;
    float _1058 = -_1038;
    float _1060 = fma(_988, _870, _1058);
    float _1062 = fma(_1052, _980, -0.5);
    float _1064 = _1028;
    if (!_1024)
    {
        _1064 = _1056;
    }
    float _1066 = _1064;
    bool _1068 = !_1024;
    float _1070 = _1066;
    float _1072 = _1050;
    if (!_1068)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1078 = _984 + _1076;
        float _1080 = rsqrt(_962);
        float _1082 = _1078 * _1074;
        float _1084 = _1056 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = _1082 * 0.15915493667125701904296875;
        float _1088 = _1086 * 6.283185482025146484375;
        float _1090 = sin(_1088);
        float _1092 = _1086 * 6.283185482025146484375;
        float _1094 = cos(_1092);
        float _1096 = fma(_1090, _1084, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1098 = _1080 * _1096;
        float _1100 = _1094 + (-1.0);
        float _1102 = fma(_920, _1098, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1104 = fma(_924, _1098, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1106 = _1100 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1110 = _1102 + _1108;
        float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1114 = _1104 + _1112;
        float _1116 = fma(_1056, _1094, _1106);
        float _1118 = _1110 * _1110;
        float _1120 = _1114 * _1114;
        _1070 = _1116;
        _944 = _1118;
        _946 = _1120;
        _928 = _1102;
        _930 = _1104;
    }
    float _1122 = _1070;
    float _1124 = _944;
    float _1126 = _946;
    float _1128 = _928;
    float _1130 = _930;
    float _1132 = _1050 * _856;
    float _1134 = -_798;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1040);
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1140 = _1122 + _1138;
    float _1142 = _1032 * _856;
    float _1144 = fma(_1032, _1062, _1132);
    float _1146 = fma(_1012, _1054, _1016);
    float _1148 = fma(_1140, _1140, _1124);
    float _1150 = -_1142;
    float _1152 = fma(_1050, _1062, _1150);
    float _1154 = -_996;
    float _1156 = fma(_1036, _1144, _1154);
    float _1158 = -_798;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1042);
    float _1162 = in.m_63.w;
    float _1164 = _1148 + _1126;
    float _1166 = fma(_1034, _1152, _1010);
    float _1168 = -_798;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1022);
    float _1172 = _1060 + 0.5;
    float _1174 = sqrt(_1164);
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1192 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1194 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1196 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1198 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = _1146 + 0.5;
    float _1202 = _1166 + 0.5;
    float _1204 = _1156 + 0.5;
    out.m_65.w = _1162;
    bool _1206 = _1174 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1208 = isnan(_1174);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1214 = _1210 || _1212;
    out.m_67.x = _1186;
    out.m_67.y = _1190;
    out.m_67.z = _1192;
    out.m_69.x = _1194;
    out.m_69.y = _1196;
    out.m_69.z = _1198;
    out.m_71.x = _1170;
    out.m_71.y = _1136;
    out.m_71.z = _1160;
    float _1216 = _1196;
    if (!_1214)
    {
        _806 = 1.0;
    }
    float _1218 = _806;
    out.m_73.x = _1202;
    out.m_73.y = _1204;
    out.m_73.z = _1200;
    out.m_73.w = _1172;
    bool _1220 = !_1214;
    float _1222 = _1218;
    if (!_1220)
    {
        bool _1224 = _1174 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1226 = isnan(_1174);
        bool _1228 = _1224 || _1226;
        bool _1230 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1232 = _1228 || _1230;
        if (!_1232)
        {
            float _1234 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1236 = _1174 + _1234;
            float _1238 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1240 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1238;
            float _1242 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1244 = _1242 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1246 = 1.0 / _1240;
            float _1248 = _1236 * _1246;
            float _1250 = fma(_1248, _1244, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1222 = _1250;
            _1252 = true;
        }
        else
        {
            bool _1254 = _1174 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1256 = isnan(_1174);
            bool _1258 = _1254 || _1256;
            bool _1260 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1262 = _1258 || _1260;
            if (!_1262)
            {
                float _1264 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1266 = _1174 + _1264;
                float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1270 = _1268 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1272 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1274 = _1272 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1276 = 1.0 / _1270;
                float _1278 = _1266 * _1276;
                float _1280 = fma(_1278, _1274, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1222 = _1280;
                _1252 = true;
            }
            else
            {
                _1222 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1252 = false;
    float _1282 = _1222;
    float _1284 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1286 = _1122 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1290 = _1128 + _1288;
    float _1292 = fma(_1286, _1282, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1296 = _1130 + _1294;
    float _1298 = fma(_1290, _1282, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1302 = _1292 + _1300;
    float _1304 = fma(_1296, _1282, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1308 = _1298 + _1306;
    float _1310 = _1302 * _1302;
    float _1312 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1314 = _1304 + _1312;
    float _1316 = fma(_1308, _1308, _1310);
    float _1318 = fma(_1314, _1314, _1316);
    float _1320 = rsqrt(_1318);
    float _1322 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1324 = _1308 * _1322;
    float _1326 = _1314 * _1322;
    float _1328 = _1324 * _1324;
    float _1330 = _1326 * _1326;
    float _1332 = _1328 + _1330;
    float _1334 = sqrt(_1332);
    bool _1336 = _1334 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1340 = _1334 + _1338;
    float _1342 = _1314;
    float _1344 = _1320;
    float _1346 = _1340;
    float _1348 = _1302;
    float _1350 = _1324;
    if (_1336)
    {
        float _1352 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1342 = _1352;
    }
    float _1354 = _1342;
    if (_1336)
    {
        float _1356 = rsqrt(_1332);
        _1344 = _1356;
    }
    float _1358 = _1344;
    float _1360 = _1358;
    if (_1336)
    {
        float _1362 = _1340 * _1354;
        _1346 = _1362;
    }
    float _1364 = _1346;
    if (_1336)
    {
        float _1366 = _1364 * 0.15915493667125701904296875;
        _1216 = _1366;
    }
    float _1368 = _1216;
    float _1370 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1372 = _1354;
    if (_1336)
    {
        float _1374 = _1368 * 6.283185482025146484375;
        float _1376 = sin(_1374);
        _1372 = _1376;
    }
    float _1378 = _1372;
    float _1380 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1382 = precise::max(0.0, _1380);
    float _1384 = _1194;
    float _1386 = _1382;
    if (_1336)
    {
        float _1388 = _1368 * 6.283185482025146484375;
        float _1390 = cos(_1388);
        _1384 = _1390;
    }
    float _1392 = _1384;
    float _1394 = -_1322;
    float _1396 = -_1382;
    float _1398 = fma(_1302, _1394, _1396);
    if (!_1336)
    {
        _1348 = _1328;
    }
    float _1400 = _1348;
    float _1402 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1404 = _1400;
    if (_1336)
    {
        float _1406 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1386 = _1406;
    }
    float _1408 = _1386;
    float _1410 = sqrt(_1318);
    float _1412 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1402);
    float _1414 = _1378;
    float _1416 = _1408;
    if (_1336)
    {
        float _1418 = fma(_1378, _1408, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1414 = _1418;
    }
    float _1420 = _1414;
    float _1422 = _1420;
    if (_1336)
    {
        float _1424 = _1392 + (-1.0);
        _1416 = _1424;
    }
    float _1426 = _1416;
    float _1428 = _1426;
    if (_1336)
    {
        float _1430 = _1358 * _1420;
        _1072 = _1430;
    }
    float _1432 = _1072;
    if (!_1336)
    {
        _1360 = _1398;
    }
    float _1434 = _1360;
    float _1436 = _1434;
    if (_1336)
    {
        float _1438 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1428 = _1438;
    }
    float _1440 = _1428;
    float _1442 = _1440;
    if (_1336)
    {
        float _1444 = _1324 * _1432;
        _1350 = _1444;
    }
    float _1446 = _1350;
    if (!_1336)
    {
        _1422 = _1326;
    }
    float _1448 = _1422;
    float _1450 = _1448;
    if (_1336)
    {
        float _1452 = _1326 * _1432;
        _1450 = _1452;
    }
    float _1454 = _1450;
    if (_1336)
    {
        float _1456 = fma(_1398, _1392, _1440);
        _1436 = _1456;
    }
    float _1458 = _1436;
    if (_1336)
    {
        float _1460 = _1446 * _1446;
        _1404 = _1460;
    }
    float _1462 = _1404;
    if (!_1336)
    {
        _1442 = _1330;
    }
    float _1464 = _1442;
    float _1466 = _1464;
    if (_1336)
    {
        float _1468 = _1454 * _1454;
        _1466 = _1468;
    }
    float _1470 = _1466;
    float _1472 = fma(_1458, _1458, _1462);
    float _1474 = _1472 + _1470;
    float _1476 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1480 = fma(_1410, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1478);
    float _1482 = precise::clamp(_1480, 0.0, 1.0);
    float _1484 = rsqrt(_1474);
    float _1486 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1476);
    float _1488 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1490 = -_1482;
    float _1492 = _1490 + 1.0;
    float _1494 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1486);
    float _1496 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1498 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1488);
    float _1500 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1502 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1496);
    float _1504 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1498);
    float _1506 = abs(_1492);
    float _1508 = log2(_1506);
    float _1510 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1512 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1502);
    float _1514 = _1504 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1516 = _1484 * _1446;
    float _1518 = -_1510;
    float _1520 = fma(_1518, _1370, 1.0);
    float _1522 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1412);
    float _1524 = _1484 * _1458;
    float _1526 = _1516 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1528 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1530 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1532 = _1484 * _1454;
    float _1534 = -_1526;
    float _1536 = fma(_1524, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1534);
    float _1538 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1540 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1530);
    float _1542 = log2(_1520);
    float _1544 = -_1532;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1536);
    float _1548 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1550 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1540);
    float _1552 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1554 = fma(_1546, -0.5, 0.5);
    float _1556 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1558 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1550);
    float _1560 = exp2(_1548);
    float _1562 = fma(_1546, 0.5, 0.5);
    float _1564 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1552);
    float _1566 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1556);
    float _1568 = _1524 + 1.0;
    float _1570 = fma(_1562, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1572 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1564);
    float _1574 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1566);
    float _1576 = 1.0 / _1558;
    float _1578 = fma(_1562, _1570, -0.212114393711090087890625);
    float _1580 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1572);
    float _1582 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1574);
    float _1584 = _1542 * 0.693147182464599609375;
    float _1586 = fma(_1562, _1578, 1.570728778839111328125);
    float _1588 = sqrt(_1554);
    float _1590 = -_1524;
    float _1592 = fma(_1560, _1568, _1590);
    float _1594 = _1580 * _1576;
    float _1596 = _1582 * _1576;
    float _1598 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1600 = fma(_1592, 0.5, 0.5);
    float _1602 = fma(_1594, 0.5, 0.5);
    float _1604 = fma(_1596, -0.5, 0.5);
    float _1606 = _1588 * 0.636619746685028076171875;
    float _1608 = -_1586;
    float _1610 = fma(_1606, _1608, 1.0);
    float3 _4396 = float3(_1602, _1604, _1598);
    float _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4396, float3(0.0), isnan(_4396)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4396, float3(0.0), isnan(_4396)), level(0.0)).x;
    float3 _4407 = float3(_1602, _1604, _1598);
    float4 _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4407, float3(0.0), isnan(_4407)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4407, float3(0.0), isnan(_4407)), level(0.0)).xyzw;
    float _1617 = _1615.x;
    float _1619 = _1615.y;
    float _1621 = _1615.z;
    float _1623 = _1615.w;
    float2 _4424 = float2(_1610, _1600);
    float3 _1627 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4424, float2(0.0), isnan(_4424)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4424, float2(0.0), isnan(_4424)), level(0.0)).xyz;
    float _1629 = _1627.x;
    float _1631 = _1627.y;
    float _1633 = _1627.z;
    float _1635 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1637 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1639 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1641 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1635);
    float _1643 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1637);
    float _1645 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1647 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1641);
    float _1649 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1643);
    float _1651 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1645);
    float _1653 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1655 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1657 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1651);
    float _1659 = 1.0 / _1653;
    bool _1661 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan(0.5);
    bool _1669 = _1665 || _1667;
    float _1671 = _1655 + _1653;
    float _1673 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1657);
    float _1675 = exp2(_1639);
    float _1677 = _1645;
    if (_1669)
    {
        _1677 = 1.0;
    }
    float _1679 = _1677;
    float _1681 = _1671 * _1659;
    float _1683 = _1681 * 0.5;
    float _1685 = _1679;
    if (!_1669)
    {
        float _1687 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1691 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1689);
        float _1693 = _1687 * 0.15915493667125701904296875;
        float _1695 = _1693 * 6.283185482025146484375;
        float _1697 = cos(_1695);
        float _1699 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1701 = _1699 * 0.15915493667125701904296875;
        float _1703 = _1693 * 6.283185482025146484375;
        float _1705 = sin(_1703);
        float _1707 = 1.0 / _1697;
        float _1709 = _1701 * 6.283185482025146484375;
        float _1711 = cos(_1709);
        float _1713 = _1705 * _1707;
        float _1715 = 1.0 / _1691;
        float _1717 = _1711 * _1713;
        float _1719 = _1701 * 6.283185482025146484375;
        float _1721 = sin(_1719);
        float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1725 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1723;
        float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1729 = _1715 * _1727;
        float _1731 = 1.0 / _1717;
        float _1733 = 1.0 / _1725;
        float _1735 = _1721 * _1731;
        float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1739 = fma(_1735, _1729, _1737);
        float _1741 = _1739 * _1733;
        float _1743 = precise::clamp(_1741, 0.0, 1.0);
        _1685 = _1743;
    }
    float _1745 = _1685;
    float _1747 = -_1675;
    float _1749 = _1747 + 1.0;
    float _1751 = _1745 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1753 = _1745 > 0.0;
    bool _1755 = isnan(_1745);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan(0.0);
    bool _1761 = _1757 || _1759;
    float _1763 = _1673 + _1558;
    float _1765 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1767 = _1751 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _1298;
    out.m_75.y = _1292;
    out.m_75.z = _1304;
    float _1769 = _1765 * _1612;
    float _1771 = -_1765;
    float _1773 = _1771 + 1.0;
    float _1775 = _1763 * 0.5;
    float _1777 = _1623 * _1769;
    float _1779 = _1633 * _1769;
    float _1781 = _1623 * _1773;
    out.gl_Position.x = _1580;
    out.gl_Position.y = _1582;
    out.gl_Position.z = _1673;
    out.gl_Position.w = _1558;
    float _1783 = fma(_1629, _1777, _1617);
    float _1785 = fma(_1631, _1777, _1619);
    float _1787 = fma(_1623, _1779, _1621);
    out.m_77.z = _1775;
    out.m_77.w = _1558;
    out.m_51.x = _1767;
    out.m_79.x = _1783;
    out.m_79.y = _1785;
    out.m_79.z = _1787;
    out.m_79.w = _1781;
    if (_1761)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _1789 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1789;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = in.m_46.w;
    float _97 = trunc(_93);
    int _100 = int(_97);
    float _102 = -_95;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _104;
    bool _108 = _100 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_100);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_51.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1857 = as_type<float>(_120);
        out.gl_Position.z = _1857;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _124 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_95);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = float(_100);
    bool _136 = _104 >= _134;
    bool _138 = !_132;
    bool _140 = _136 || _138;
    if (_140)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _112;
    if (_140)
    {
        out.m_51.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _122 = as_type<int>(_144);
    }
    int _146 = _122;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1912 = as_type<float>(_146);
        out.gl_Position.z = _1912;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_53.w;
    float _150 = 1.0 / _134;
    float _152 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_46.x;
    float _166 = in.m_46.y;
    float _168 = in.m_46.z;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = 0.0;
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _152 * _198;
        float _208 = exp2(_206);
        float _210 = _204 * 0.693147182464599609375;
        float _212 = 1.0 / _210;
        float _214 = 1.0 / _202;
        float _216 = _208 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _212, _152);
        float _222 = _220 * _214;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _152 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = _104 * _150;
    float _262 = fma(_250, _164, _254);
    float _264 = fma(_250, _166, _256);
    float _266 = fma(_250, _168, _258);
    float _268 = fma(_262, _148, _170);
    float _270 = fma(_264, _148, _172);
    float _272 = fma(_266, _148, _174);
    bool _274 = !_252;
    float _276 = _260;
    if (!_274)
    {
        float _278 = in.m_55.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _104);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _276 = _292;
    }
    float _294 = _276;
    float _296 = in.m_55.x;
    float _298 = in.m_55.y;
    float _300 = in.m_55.z;
    float _302 = in.m_55.w;
    float _304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _322 = 1.0 / _308;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _332 = 1.0 / _316;
    bool _334 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _336 = isnan(_294);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _348 = _346 != 0;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _352 = _350 != 0;
    float _354 = 1.0 / _312;
    int _356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _358 = _356 != 0;
    int _360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _362 = _360 != 0;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = _294 + _364;
    bool _368 = _302 > 0.5;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _372 = _294 + _370;
    float _374 = 1.0 / _320;
    float _376 = _366 * _322;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _294 + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _384 = _294 + _382;
    float _386 = _372 * _332;
    bool _388 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _390 = isnan(_294);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    bool _400 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _402 = isnan(_294);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = 1.0 / _326;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _416 = _294 + _414;
    float _418 = _380 * _354;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _422 = _294 + _420;
    float _424 = -_398;
    float _426 = _424 + 1.0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _430 = _428 != 0;
    float _432 = -_410;
    float _434 = _432 + 1.0;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _436;
    float _440 = 1.0 / _330;
    float _442 = _384 * _374;
    bool _444 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _446 = isnan(_294);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = _410 * _426;
    float _458 = fma(_438, _376, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _460 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _462 = isnan(_294);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = -_454;
    float _474 = _472 + 1.0;
    float _476 = _416 * _412;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _478;
    float _482 = _344 * _474;
    float _484 = fma(_480, _376, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _486 = _454 * _434;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _492 = _422 * _440;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _494;
    float _498 = -_344;
    float _500 = _498 + 1.0;
    bool _502 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _504 = isnan(_294);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _518 = fma(_496, _376, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _520 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _522 = isnan(_294);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _536 = -_512;
    float _538 = _536 + 1.0;
    float _540 = fma(_516, _418, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _542 = _530 * _500;
    float _544 = -_530;
    float _546 = _544 + 1.0;
    float _548 = _470 * _538;
    float _550 = fma(_490, _418, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _552 = fma(_534, _418, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _554 = _512 * _546;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _556;
    float _560 = _458 * _548;
    float _562 = _484 * _548;
    float _564 = -_470;
    float _566 = _564 + 1.0;
    float _568 = _518 * _548;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _570;
    float _574 = fma(_558, _386, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _592 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].x, _560);
    float _594 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].y, _562);
    float _596 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].z, _568);
    float _598 = fma(_582, _386, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _600 = fma(_572, _386, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _602 = fma(_586, _442, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _604 = fma(_590, _442, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _606 = fma(_578, _442, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _608 = fma(_540, _554, _592);
    float _610 = fma(_550, _554, _594);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _612;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _620;
    float _624 = fma(_552, _554, _596);
    float _626 = fma(_614, _476, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _628 = fma(_618, _476, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _630 = fma(_622, _476, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _632 = fma(_598, _542, _608);
    float _634 = fma(_574, _542, _610);
    float _636 = fma(_600, _542, _624);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _650 = fma(_602, _482, _632);
    float _652 = fma(_640, _492, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _654 = fma(_644, _492, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _656 = fma(_648, _492, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _658 = fma(_604, _482, _634);
    float _660 = fma(_606, _482, _636);
    float _662 = fma(_626, _486, _650);
    float _664 = in.m_57.x;
    float _666 = in.m_57.y;
    float _668 = in.m_57.z;
    float _670 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _672 = fma(_630, _486, _660);
    float _674 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _676 = fma(_652, _456, _662);
    float _678 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _680 = fma(_656, _456, _672);
    float _682 = fma(_628, _486, _658);
    float _684 = in.m_53.x;
    float _686 = in.m_53.y;
    float _688 = in.m_53.z;
    float _690 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _670);
    float _692 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _674);
    float _694 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _678);
    float _696 = fma(_654, _456, _682);
    float _698 = in.m_59.y;
    float _700 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _690);
    float _702 = in.m_61.x;
    float _704 = in.m_61.y;
    float _706 = in.m_61.z;
    float _708 = _672;
    float _710 = _674;
    float _712 = _682;
    float _714 = _698;
    bool _716 = _358;
    if (!_430)
    {
        _708 = _300;
    }
    float _718 = _708;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _722 = _718;
    if (!_430)
    {
        _710 = _300;
    }
    float _724 = _710;
    float _726 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[149].y, _696);
    float _728 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[79].z, _720);
    bool _730 = _666 != 0.0;
    bool _732 = isnan(_666);
    bool _734 = _730 || _732;
    bool _736 = isnan(0.0);
    bool _738 = _734 || _736;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _742 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[149].z, _680);
    float _744 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[149].x, _676);
    bool _746 = _664 == 0.0;
    bool _748 = !_738;
    bool _750 = _746 && _748;
    float _752 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[78].w, _740);
    float _754 = _724;
    if (!_430)
    {
        _712 = _298;
    }
    float _756 = _712;
    float _758 = _298 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _760 = _668 == 0.0;
    bool _762 = _760 && _750;
    float _764 = _742 * _688;
    float _766 = _756;
    bool _768 = _762;
    float _770 = _758;
    if (_430)
    {
        _766 = _296;
    }
    float _772 = _766;
    float _774 = _744 * _684;
    if (_430)
    {
        _722 = _298;
    }
    float _776 = _722;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_430)
    {
        _754 = _298;
    }
    float _780 = _754;
    float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _784 = _298 > 0.5;
    float _786 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[78].z, _778);
    float _788 = _296 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _790 = _704;
    float _792 = _702;
    float _794 = _706;
    if (!_762)
    {
        float _796 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _704);
        _790 = _796;
    }
    float _798 = _790;
    float _800 = -_698;
    float _802 = _800 + 1.0;
    float _804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _666);
    float _806 = _798;
    if (!_762)
    {
        float _808 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[17].y, _702);
        _792 = _808;
    }
    float _810 = _792;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _664);
    float _816 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _692);
    float _818 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _694);
    float _820 = -_812;
    float _822 = fma(_788, 2.0, _820);
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _826 = _368 ? as_type<int>(_802) : as_type<int>(_698);
    float _828 = _726 * _686;
    if (!_762)
    {
        float _830 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _706);
        _794 = _830;
    }
    float _832 = _794;
    float _834 = _358 ? as_type<float>(_826) : _698;
    float _836 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _668);
    if (_362)
    {
        float _838 = _784 ? _802 : _698;
        _714 = _838;
    }
    float _840 = _714;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _844 = _782 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _846 = _676;
    if (_352)
    {
        float _848 = in.m_55.z;
        _846 = _848;
    }
    float _850 = _846;
    float _852 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _854 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[83].w, _842);
    float _856 = fma(_844, _840, -0.5);
    float _858 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _860 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _862 = _824 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _864 = _858 * _836;
    float _866 = in.m_59.x;
    float _868 = _852 * _814;
    float _870 = fma(_834, _862, -0.5);
    float _872 = _864 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[148].x;
    if (_348)
    {
        float _876 = in.m_55.x;
        _874 = _876;
    }
    float _878 = _874;
    float _880 = _864 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _882 = _860 * _804;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _886 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[8].x, _872);
    float _888 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[10].x, _880);
    float _890 = _700 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _892 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[83].z, _884);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _896 = _772 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _898 = _818 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _900 = -_882;
    float _902 = fma(_900, (*spvDescriptorSet0.vp_c10)._m0[8].z, _886);
    float _904 = -_882;
    float _906 = fma(_904, (*spvDescriptorSet0.vp_c10)._m0[10].z, _888);
    float _908 = -_894;
    float _910 = fma(_896, 2.0, _908);
    float _912 = _890 + _902;
    float _914 = _898 + _906;
    float _916 = _776 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _918 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _920 = _912 + _918;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _924 = _914 + _922;
    int _926 = as_type<int>(_888);
    float _928 = _912;
    float _930 = _914;
    if (_352)
    {
        bool _932 = _850 > 0.5;
        _716 = _932;
    }
    bool _934 = _716;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _938 = _920 * _920;
    float _940 = _924 * _924;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _944 = _938;
    float _946 = _940;
    if (_348)
    {
        float _948 = -_866;
        float _950 = _948 + 1.0;
        _926 = as_type<int>(_950);
    }
    int _952 = _926;
    float _954 = _878;
    if (_348)
    {
        bool _956 = _878 > 0.5;
        _768 = _956;
    }
    bool _958 = _768;
    float _960 = fma(_916, -2.0, _936);
    float _962 = _938 + _940;
    float _964 = fma(_758, -2.0, _942);
    if (!_348)
    {
        _770 = _866;
    }
    float _966 = _770;
    int _968 = 0;
    float _970 = _966;
    if (_352)
    {
        float _972 = -_866;
        float _974 = _972 + 1.0;
        _968 = as_type<int>(_974);
    }
    int _976 = _968;
    if (_348)
    {
        float _978 = _958 ? as_type<float>(_952) : _866;
        _970 = _978;
    }
    float _980 = _970;
    float _982 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[79].x, _728);
    float _984 = sqrt(_962);
    if (!_352)
    {
        _954 = _866;
    }
    float _986 = _954;
    float _988 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[82].w, _854);
    float _990 = _986;
    if (_352)
    {
        float _992 = _934 ? as_type<float>(_976) : _866;
        _990 = _992;
    }
    float _994 = _990;
    float _996 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[76].y, _964);
    float _998 = _864 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1000 = _982 * (-0.15915493667125701904296875);
    float _1002 = _832 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1006 = fma(_868, (*spvDescriptorSet0.vp_c10)._m0[9].x, _998);
    float _1008 = -_104;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[76].x, _822);
    float _1012 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[82].z, _892);
    float _1014 = -_104;
    float _1016 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[81].x, _910);
    float _1018 = _832 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1020 = _832 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1022 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1002);
    bool _1024 = _984 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = -_882;
    float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1006);
    float _1030 = _1000 * 6.283185482025146484375;
    float _1032 = sin(_1030);
    float _1034 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[77].z, _786);
    float _1036 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[77].w, _752);
    float _1038 = fma(_104, (*spvDescriptorSet0.vp_c9)._m0[81].y, _960);
    float _1040 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1018);
    float _1042 = fma(_810, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1020);
    float _1044 = _304 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1046 = _816 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1048 = _1000 * 6.283185482025146484375;
    float _1050 = cos(_1048);
    float _1052 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1054 = fma(_1044, _994, -0.5);
    float _1056 = _1046 + _1028;
    float _1058 = -_1038;
    float _1060 = fma(_988, _870, _1058);
    float _1062 = fma(_1052, _980, -0.5);
    float _1064 = _1028;
    if (!_1024)
    {
        _1064 = _1056;
    }
    float _1066 = _1064;
    bool _1068 = !_1024;
    float _1070 = _1066;
    float _1072 = _1050;
    if (!_1068)
    {
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1076 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1078 = _984 + _1076;
        float _1080 = rsqrt(_962);
        float _1082 = _1078 * _1074;
        float _1084 = _1056 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1086 = _1082 * 0.15915493667125701904296875;
        float _1088 = _1086 * 6.283185482025146484375;
        float _1090 = sin(_1088);
        float _1092 = _1086 * 6.283185482025146484375;
        float _1094 = cos(_1092);
        float _1096 = fma(_1090, _1084, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1098 = _1080 * _1096;
        float _1100 = _1094 + (-1.0);
        float _1102 = fma(_920, _1098, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1104 = fma(_924, _1098, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1106 = _1100 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1110 = _1102 + _1108;
        float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1114 = _1104 + _1112;
        float _1116 = fma(_1056, _1094, _1106);
        float _1118 = _1110 * _1110;
        float _1120 = _1114 * _1114;
        _1070 = _1116;
        _944 = _1118;
        _946 = _1120;
        _928 = _1102;
        _930 = _1104;
    }
    float _1122 = _1070;
    float _1124 = _944;
    float _1126 = _946;
    float _1128 = _928;
    float _1130 = _930;
    float _1132 = _1050 * _856;
    float _1134 = -_798;
    float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1040);
    float _1138 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1140 = _1122 + _1138;
    float _1142 = _1032 * _856;
    float _1144 = fma(_1032, _1062, _1132);
    float _1146 = fma(_1012, _1054, _1016);
    float _1148 = fma(_1140, _1140, _1124);
    float _1150 = -_1142;
    float _1152 = fma(_1050, _1062, _1150);
    float _1154 = -_996;
    float _1156 = fma(_1036, _1144, _1154);
    float _1158 = -_798;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1042);
    float _1162 = in.m_63.w;
    float _1164 = _1148 + _1126;
    float _1166 = fma(_1034, _1152, _1010);
    float _1168 = -_798;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1022);
    float _1172 = _1060 + 0.5;
    float _1174 = sqrt(_1164);
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1186 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1192 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1194 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1196 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1198 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1200 = _1146 + 0.5;
    float _1202 = _1166 + 0.5;
    float _1204 = _1156 + 0.5;
    out.m_65.w = _1162;
    bool _1206 = _1174 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1208 = isnan(_1174);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1214 = _1210 || _1212;
    out.m_67.x = _1186;
    out.m_67.y = _1190;
    out.m_67.z = _1192;
    out.m_69.x = _1194;
    out.m_69.y = _1196;
    out.m_69.z = _1198;
    out.m_71.x = _1170;
    out.m_71.y = _1136;
    out.m_71.z = _1160;
    float _1216 = _1196;
    if (!_1214)
    {
        _806 = 1.0;
    }
    float _1218 = _806;
    out.m_73.x = _1202;
    out.m_73.y = _1204;
    out.m_73.z = _1200;
    out.m_73.w = _1172;
    bool _1220 = !_1214;
    float _1222 = _1218;
    if (!_1220)
    {
        bool _1224 = _1174 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1226 = isnan(_1174);
        bool _1228 = _1224 || _1226;
        bool _1230 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1232 = _1228 || _1230;
        if (!_1232)
        {
            float _1234 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1236 = _1174 + _1234;
            float _1238 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1240 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1238;
            float _1242 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1244 = _1242 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1246 = 1.0 / _1240;
            float _1248 = _1236 * _1246;
            float _1250 = fma(_1248, _1244, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1222 = _1250;
            _1252 = true;
        }
        else
        {
            bool _1254 = _1174 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1256 = isnan(_1174);
            bool _1258 = _1254 || _1256;
            bool _1260 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1262 = _1258 || _1260;
            if (!_1262)
            {
                float _1264 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1266 = _1174 + _1264;
                float _1268 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1270 = _1268 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1272 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1274 = _1272 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1276 = 1.0 / _1270;
                float _1278 = _1266 * _1276;
                float _1280 = fma(_1278, _1274, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1222 = _1280;
                _1252 = true;
            }
            else
            {
                _1222 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1252 = false;
    float _1282 = _1222;
    float _1284 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1286 = _1122 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1290 = _1128 + _1288;
    float _1292 = fma(_1286, _1282, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1296 = _1130 + _1294;
    float _1298 = fma(_1290, _1282, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1302 = _1292 + _1300;
    float _1304 = fma(_1296, _1282, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1308 = _1298 + _1306;
    float _1310 = _1302 * _1302;
    float _1312 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1314 = _1304 + _1312;
    float _1316 = fma(_1308, _1308, _1310);
    float _1318 = fma(_1314, _1314, _1316);
    float _1320 = rsqrt(_1318);
    float _1322 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1324 = _1308 * _1322;
    float _1326 = _1314 * _1322;
    float _1328 = _1324 * _1324;
    float _1330 = _1326 * _1326;
    float _1332 = _1328 + _1330;
    float _1334 = sqrt(_1332);
    bool _1336 = _1334 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1338 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1340 = _1334 + _1338;
    float _1342 = _1314;
    float _1344 = _1320;
    float _1346 = _1340;
    float _1348 = _1302;
    float _1350 = _1324;
    if (_1336)
    {
        float _1352 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1342 = _1352;
    }
    float _1354 = _1342;
    if (_1336)
    {
        float _1356 = rsqrt(_1332);
        _1344 = _1356;
    }
    float _1358 = _1344;
    float _1360 = _1358;
    if (_1336)
    {
        float _1362 = _1340 * _1354;
        _1346 = _1362;
    }
    float _1364 = _1346;
    if (_1336)
    {
        float _1366 = _1364 * 0.15915493667125701904296875;
        _1216 = _1366;
    }
    float _1368 = _1216;
    float _1370 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1372 = _1354;
    if (_1336)
    {
        float _1374 = _1368 * 6.283185482025146484375;
        float _1376 = sin(_1374);
        _1372 = _1376;
    }
    float _1378 = _1372;
    float _1380 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1382 = precise::max(0.0, _1380);
    float _1384 = _1194;
    float _1386 = _1382;
    if (_1336)
    {
        float _1388 = _1368 * 6.283185482025146484375;
        float _1390 = cos(_1388);
        _1384 = _1390;
    }
    float _1392 = _1384;
    float _1394 = -_1322;
    float _1396 = -_1382;
    float _1398 = fma(_1302, _1394, _1396);
    if (!_1336)
    {
        _1348 = _1328;
    }
    float _1400 = _1348;
    float _1402 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1404 = _1400;
    if (_1336)
    {
        float _1406 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1386 = _1406;
    }
    float _1408 = _1386;
    float _1410 = sqrt(_1318);
    float _1412 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1402);
    float _1414 = _1378;
    float _1416 = _1408;
    if (_1336)
    {
        float _1418 = fma(_1378, _1408, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1414 = _1418;
    }
    float _1420 = _1414;
    float _1422 = _1420;
    if (_1336)
    {
        float _1424 = _1392 + (-1.0);
        _1416 = _1424;
    }
    float _1426 = _1416;
    float _1428 = _1426;
    if (_1336)
    {
        float _1430 = _1358 * _1420;
        _1072 = _1430;
    }
    float _1432 = _1072;
    if (!_1336)
    {
        _1360 = _1398;
    }
    float _1434 = _1360;
    float _1436 = _1434;
    if (_1336)
    {
        float _1438 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1428 = _1438;
    }
    float _1440 = _1428;
    float _1442 = _1440;
    if (_1336)
    {
        float _1444 = _1324 * _1432;
        _1350 = _1444;
    }
    float _1446 = _1350;
    if (!_1336)
    {
        _1422 = _1326;
    }
    float _1448 = _1422;
    float _1450 = _1448;
    if (_1336)
    {
        float _1452 = _1326 * _1432;
        _1450 = _1452;
    }
    float _1454 = _1450;
    if (_1336)
    {
        float _1456 = fma(_1398, _1392, _1440);
        _1436 = _1456;
    }
    float _1458 = _1436;
    if (_1336)
    {
        float _1460 = _1446 * _1446;
        _1404 = _1460;
    }
    float _1462 = _1404;
    if (!_1336)
    {
        _1442 = _1330;
    }
    float _1464 = _1442;
    float _1466 = _1464;
    if (_1336)
    {
        float _1468 = _1454 * _1454;
        _1466 = _1468;
    }
    float _1470 = _1466;
    float _1472 = fma(_1458, _1458, _1462);
    float _1474 = _1472 + _1470;
    float _1476 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1480 = fma(_1410, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1478);
    float _1482 = precise::clamp(_1480, 0.0, 1.0);
    float _1484 = rsqrt(_1474);
    float _1486 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1476);
    float _1488 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1490 = -_1482;
    float _1492 = _1490 + 1.0;
    float _1494 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1486);
    float _1496 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1498 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1488);
    float _1500 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1502 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1496);
    float _1504 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1498);
    float _1506 = abs(_1492);
    float _1508 = log2(_1506);
    float _1510 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1512 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1502);
    float _1514 = _1504 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1516 = _1484 * _1446;
    float _1518 = -_1510;
    float _1520 = fma(_1518, _1370, 1.0);
    float _1522 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1412);
    float _1524 = _1484 * _1458;
    float _1526 = _1516 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1528 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1530 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1532 = _1484 * _1454;
    float _1534 = -_1526;
    float _1536 = fma(_1524, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1534);
    float _1538 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1540 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1530);
    float _1542 = log2(_1520);
    float _1544 = -_1532;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1536);
    float _1548 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1550 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1540);
    float _1552 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1554 = fma(_1546, -0.5, 0.5);
    float _1556 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1558 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1550);
    float _1560 = exp2(_1548);
    float _1562 = fma(_1546, 0.5, 0.5);
    float _1564 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1552);
    float _1566 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1556);
    float _1568 = _1524 + 1.0;
    float _1570 = fma(_1562, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1572 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1564);
    float _1574 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1566);
    float _1576 = 1.0 / _1558;
    float _1578 = fma(_1562, _1570, -0.212114393711090087890625);
    float _1580 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1572);
    float _1582 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1574);
    float _1584 = _1542 * 0.693147182464599609375;
    float _1586 = fma(_1562, _1578, 1.570728778839111328125);
    float _1588 = sqrt(_1554);
    float _1590 = -_1524;
    float _1592 = fma(_1560, _1568, _1590);
    float _1594 = _1580 * _1576;
    float _1596 = _1582 * _1576;
    float _1598 = _1584 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1600 = fma(_1592, 0.5, 0.5);
    float _1602 = fma(_1594, 0.5, 0.5);
    float _1604 = fma(_1596, -0.5, 0.5);
    float _1606 = _1588 * 0.636619746685028076171875;
    float _1608 = -_1586;
    float _1610 = fma(_1606, _1608, 1.0);
    float3 _4396 = float3(_1602, _1604, _1598);
    float _1612 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4396, float3(0.0), isnan(_4396)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4396, float3(0.0), isnan(_4396)), level(0.0)).x;
    float3 _4407 = float3(_1602, _1604, _1598);
    float4 _1615 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4407, float3(0.0), isnan(_4407)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4407, float3(0.0), isnan(_4407)), level(0.0)).xyzw;
    float _1617 = _1615.x;
    float _1619 = _1615.y;
    float _1621 = _1615.z;
    float _1623 = _1615.w;
    float2 _4424 = float2(_1610, _1600);
    float3 _1627 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4424, float2(0.0), isnan(_4424)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4424, float2(0.0), isnan(_4424)), level(0.0)).xyz;
    float _1629 = _1627.x;
    float _1631 = _1627.y;
    float _1633 = _1627.z;
    float _1635 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1637 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1639 = _1508 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1641 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1635);
    float _1643 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1637);
    float _1645 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1647 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1641);
    float _1649 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1643);
    float _1651 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1645);
    float _1653 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1655 = _1649 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1657 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1651);
    float _1659 = 1.0 / _1653;
    bool _1661 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan(0.5);
    bool _1669 = _1665 || _1667;
    float _1671 = _1655 + _1653;
    float _1673 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1657);
    float _1675 = exp2(_1639);
    float _1677 = _1645;
    if (_1669)
    {
        _1677 = 1.0;
    }
    float _1679 = _1677;
    float _1681 = _1671 * _1659;
    float _1683 = _1681 * 0.5;
    float _1685 = _1679;
    if (!_1669)
    {
        float _1687 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1691 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1689);
        float _1693 = _1687 * 0.15915493667125701904296875;
        float _1695 = _1693 * 6.283185482025146484375;
        float _1697 = cos(_1695);
        float _1699 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1701 = _1699 * 0.15915493667125701904296875;
        float _1703 = _1693 * 6.283185482025146484375;
        float _1705 = sin(_1703);
        float _1707 = 1.0 / _1697;
        float _1709 = _1701 * 6.283185482025146484375;
        float _1711 = cos(_1709);
        float _1713 = _1705 * _1707;
        float _1715 = 1.0 / _1691;
        float _1717 = _1711 * _1713;
        float _1719 = _1701 * 6.283185482025146484375;
        float _1721 = sin(_1719);
        float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1725 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1723;
        float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1729 = _1715 * _1727;
        float _1731 = 1.0 / _1717;
        float _1733 = 1.0 / _1725;
        float _1735 = _1721 * _1731;
        float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1739 = fma(_1735, _1729, _1737);
        float _1741 = _1739 * _1733;
        float _1743 = precise::clamp(_1741, 0.0, 1.0);
        _1685 = _1743;
    }
    float _1745 = _1685;
    float _1747 = -_1675;
    float _1749 = _1747 + 1.0;
    float _1751 = _1745 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1753 = _1745 > 0.0;
    bool _1755 = isnan(_1745);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan(0.0);
    bool _1761 = _1757 || _1759;
    float _1763 = _1673 + _1558;
    float _1765 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1767 = _1751 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _1298;
    out.m_75.y = _1292;
    out.m_75.z = _1304;
    float _1769 = _1765 * _1612;
    float _1771 = -_1765;
    float _1773 = _1771 + 1.0;
    float _1775 = _1763 * 0.5;
    float _1777 = _1623 * _1769;
    float _1779 = _1633 * _1769;
    float _1781 = _1623 * _1773;
    out.gl_Position.x = _1580;
    out.gl_Position.y = _1582;
    out.gl_Position.z = _1673;
    out.gl_Position.w = _1558;
    float _1783 = fma(_1629, _1777, _1617);
    float _1785 = fma(_1631, _1777, _1619);
    float _1787 = fma(_1623, _1779, _1621);
    out.m_77.z = _1775;
    out.m_77.w = _1558;
    out.m_51.x = _1767;
    out.m_79.x = _1783;
    out.m_79.y = _1785;
    out.m_79.z = _1787;
    out.m_79.w = _1781;
    if (_1761)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _1789 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1789;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

