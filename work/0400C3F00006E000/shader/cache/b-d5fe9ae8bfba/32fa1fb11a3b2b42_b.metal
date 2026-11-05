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
    float4 m_55 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1526 = false;
    bool _1308 = false;
    bool _1088 = false;
    bool _910 = false;
    bool _624 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2754 = as_type<float>(_114);
        out.gl_Position.z = _2754;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_47.w;
    float _120 = in.m_49.x;
    float _122 = in.m_49.y;
    bool _124 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_118);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_118;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.x = _120;
    out.m_51.y = _122;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_98);
        _138 = _140;
    }
    float _142 = _138;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    if (_148)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _108;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _116 = as_type<int>(_152);
    }
    int _154 = _116;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2830 = as_type<float>(_154);
        out.gl_Position.z = _2830;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = in.m_53.w;
    float _158 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _156, _176);
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    bool _278 = !_258;
    float _294;
    if (!_278)
    {
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _120 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_98);
        float _300 = 1.0 / _298;
        float _302 = _136 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _304 + _306;
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
    float _332 = 1.0 / _320;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _304 + _334;
    bool _338 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _340 = isnan(_304);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    bool _350 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _352 = isnan(_304);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -_348;
    float _364 = _362 + 1.0;
    float _366 = 1.0 / _316;
    float _368 = _336 * _326;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _372 = _304 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _380 = fma(_376, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _382 = 1.0 / _324;
    float _384 = _372 * _332;
    bool _386 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _388 = isnan(_304);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _400 = _304 + _398;
    bool _402 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _404 = isnan(_304);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = 1.0 / _330;
    float _416 = _308 * _366;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _420 = _304 + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _422;
    float _426 = -_412;
    float _428 = _426 + 1.0;
    float _430 = fma(_424, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _432 = _400 * _382;
    float _434 = -_396;
    float _436 = _434 + 1.0;
    float _438 = _412 * _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _440;
    float _444 = _420 * _414;
    bool _446 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _448 = isnan(_304);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = fma(_442, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _460 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _462 = isnan(_304);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = _456 * _428;
    float _474 = -_456;
    float _476 = _474 + 1.0;
    float _478 = _470 * _364;
    float _480 = -_470;
    float _482 = _480 + 1.0;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _488 = _348 * _476;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _498 = _360 * _482;
    float _500 = fma(_486, _416, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _502 = fma(_492, _416, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _504 = fma(_496, _416, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _506 = _458 * _498;
    float _508 = -_360;
    float _510 = _508 + 1.0;
    float _512 = _380 * _498;
    float _514 = _430 * _498;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _520;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _524;
    float _528 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].x, _506);
    float _530 = fma(_518, _384, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _532 = fma(_522, _384, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _534 = fma(_526, _384, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _540 = fma(_502, _478, _528);
    float _542 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].y, _512);
    float _544 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].z, _514);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _550 = fma(_538, _432, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _552 = fma(_532, _488, _540);
    float _554 = fma(_504, _478, _542);
    float _556 = fma(_548, _432, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _558 = fma(_500, _478, _544);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _564 = fma(_530, _488, _554);
    float _566 = fma(_534, _488, _558);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _572;
    float _576 = fma(_562, _432, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _578;
    float _582 = fma(_550, _472, _552);
    float _584 = fma(_570, _444, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _586 = fma(_574, _444, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _588 = fma(_580, _444, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _590 = fma(_556, _472, _564);
    float _592 = fma(_576, _472, _566);
    float _594 = fma(_584, _438, _582);
    float _596 = fma(_586, _438, _590);
    float _598 = fma(_588, _438, _592);
    float _600 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[148].x, _594);
    float _602 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[148].y, _596);
    float _604 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[148].z, _598);
    bool _606 = !_378;
    float _622;
    if (!_606)
    {
        float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _610 = _120 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[11].x, _136);
        float _614 = _612 * _608;
        float _616 = floor(_614);
        float _618 = -_616;
        float _620 = _614 + _618;
        _622 = _620;
        _624 = true;
    }
    else
    {
        float _626 = float(_98);
        float _628 = 1.0 / _626;
        float _630 = _136 * _628;
        _622 = _630;
    }
    _624 = false;
    float _632 = _622;
    float _634 = in.m_53.x;
    float _636 = in.m_53.y;
    float _638 = in.m_53.z;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _642 = _632 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _646 = _632 + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _664 = 1.0 / _650;
    bool _666 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _668 = isnan(_632);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = 1.0 / _654;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _682 = _632 + _680;
    float _684 = 1.0 / _658;
    float _686 = _602 * _636;
    float _688 = _682 * _664;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _692 = _632 + _690;
    bool _694 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _696 = isnan(_632);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = _604 * _638;
    bool _708 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _710 = isnan(_632);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = _600 * _634;
    float _722 = 1.0 / _662;
    float _724 = _692 * _678;
    float _726 = -_704;
    float _728 = _726 + 1.0;
    bool _730 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _732 = _718 * _728;
    float _734 = -_718;
    float _736 = _734 + 1.0;
    float _738 = _642 * _684;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _752 = fma(_742, _688, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _754 = fma(_746, _688, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _756 = fma(_750, _724, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _758 = _646 * _722;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _760;
    bool _764 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _766 = isnan(_632);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = fma(_762, _688, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _778 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _780 = isnan(_632);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = -_774;
    float _792 = _790 + 1.0;
    float _794 = _774 * _736;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _804 = _788 * _792;
    float _806 = -_788;
    float _808 = _806 + 1.0;
    float _810 = fma(_798, _724, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _812 = fma(_802, _724, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _814 = _676 * _808;
    float _816 = -_676;
    float _818 = _816 + 1.0;
    float _820 = _752 * _814;
    float _822 = _754 * _814;
    float _824 = _776 * _814;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _830;
    float _834 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[107].x, _820);
    float _836 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[107].y, _822);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _838;
    float _842 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[107].z, _824);
    float _844 = fma(_828, _738, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _846 = fma(_832, _738, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _848 = fma(_810, _804, _836);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _858 = fma(_840, _738, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _860 = fma(_812, _804, _834);
    float _862 = fma(_756, _804, _842);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _868 = fma(_852, _758, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _870 = fma(_856, _758, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _872 = fma(_844, _794, _860);
    float _874 = fma(_866, _758, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _876 = fma(_858, _794, _848);
    float _878 = fma(_846, _794, _862);
    float _880 = fma(_868, _732, _872);
    float _882 = fma(_870, _732, _876);
    float _884 = fma(_874, _732, _878);
    float _886 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[111].x, _880);
    float _888 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[111].y, _882);
    float _890 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[111].z, _884);
    bool _892 = !_730;
    float _908;
    if (!_892)
    {
        float _894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _896 = _120 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _898 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _900 = _898 * _894;
        float _902 = floor(_900);
        float _904 = -_902;
        float _906 = _900 + _904;
        _908 = _906;
        _910 = true;
    }
    else
    {
        float _912 = float(_98);
        float _914 = 1.0 / _912;
        float _916 = _136 * _914;
        _908 = _916;
    }
    _910 = false;
    float _918 = _908;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _922 = _918 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _928 = _918 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _930 = isnan(_918);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _948 = _918 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _950 = isnan(_918);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = 1.0 / _926;
    float _962 = -_938;
    float _964 = _962 + 1.0;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _966;
    bool _970 = _918 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _972 = isnan(_918);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = _958 * _964;
    float _984 = -_958;
    float _986 = _984 + 1.0;
    bool _988 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _990 = 1.0 / _942;
    float _992 = _980 * _986;
    float _994 = -_980;
    float _996 = _994 + 1.0;
    float _998 = 1.0 / _946;
    float _1000 = _968 * _960;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1006 = fma(_1000, _922, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1008 = _1004 * _990;
    bool _1010 = _918 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1012 = isnan(_918);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1028 = _918 + _1026;
    float _1030 = _1006 * _992;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1034 = _918 + _1032;
    float _1036 = -_1020;
    float _1038 = _1036 + 1.0;
    float _1040 = fma(_1008, _1028, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1042 = _1024 * _998;
    float _1044 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1030);
    float _1046 = _938 * _1038;
    float _1048 = _886 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1050 = fma(_1042, _1034, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1052 = fma(_1040, _982, _1044);
    float _1054 = _890 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = fma(_1050, _1046, _1052);
    float _1060 = _888 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1062 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1064 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1058);
    float _1066 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1068 = _1064 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _1056;
    out.m_55.y = _1066;
    out.m_55.z = _1062;
    out.m_55.w = _1068;
    bool _1070 = !_988;
    float _1086;
    if (!_1070)
    {
        float _1072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1074 = _120 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[11].z, _136);
        float _1078 = _1076 * _1072;
        float _1080 = floor(_1078);
        float _1082 = -_1080;
        float _1084 = _1078 + _1082;
        _1086 = _1084;
        _1088 = true;
    }
    else
    {
        float _1090 = float(_98);
        float _1092 = 1.0 / _1090;
        float _1094 = _136 * _1092;
        _1086 = _1094;
    }
    _1088 = false;
    float _1096 = _1086;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1100 = _1096 + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1104 = _1096 + _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1108 = _1096 + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1118;
    float _1122 = 1.0 / _1112;
    bool _1124 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1126 = 1.0 / _1120;
    float _1128 = 1.0 / _1116;
    float _1130 = _1100 * _1122;
    bool _1132 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1134 = isnan(_1096);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1144;
    float _1148 = -_1142;
    float _1150 = _1148 + 1.0;
    float _1152 = _1104 * _1126;
    bool _1154 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1156 = isnan(_1096);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = fma(_1146, _1130, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1168 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1170 = isnan(_1096);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1176 = _1172 || _1174;
    float _1178 = float(_1176);
    float _1180 = _1164 * _1150;
    bool _1182 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1184 = isnan(_1096);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = _1108 * _1128;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1200;
    float _1204 = -_1178;
    float _1206 = _1204 + 1.0;
    float _1208 = -_1164;
    float _1210 = _1208 + 1.0;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1216 = fma(_1198, _1130, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1218 = fma(_1202, _1130, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1220 = _1192 * _1206;
    float _1222 = _1178 * _1210;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1230 = _1228 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1232 = _1218 * _1220;
    float _1234 = _1166 * _1220;
    float _1236 = _1216 * _1220;
    float _1238 = -_1192;
    float _1240 = _1238 + 1.0;
    float _1242 = fma(_1214, _1194, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1244 = fma(_1226, _1194, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1246 = fma(_1230, _1194, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1248 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1234);
    float _1250 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1236);
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1256;
    float _1260 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1232);
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1262;
    float _1266 = fma(_1242, _1222, _1248);
    float _1268 = fma(_1254, _1152, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1270 = fma(_1258, _1152, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1272 = fma(_1244, _1222, _1250);
    float _1274 = fma(_1264, _1152, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1276 = fma(_1246, _1222, _1260);
    float _1278 = fma(_1268, _1180, _1266);
    float _1280 = fma(_1270, _1180, _1272);
    float _1282 = fma(_1274, _1180, _1276);
    float _1284 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1278);
    float _1286 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1280);
    float _1288 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1282);
    bool _1290 = !_1124;
    float _1306;
    if (!_1290)
    {
        float _1292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1294 = _120 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1296 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _1298 = _1296 * _1292;
        float _1300 = floor(_1298);
        float _1302 = -_1300;
        float _1304 = _1298 + _1302;
        _1306 = _1304;
        _1308 = true;
    }
    else
    {
        float _1310 = float(_98);
        float _1312 = 1.0 / _1310;
        float _1314 = _136 * _1312;
        _1306 = _1314;
    }
    _1308 = false;
    float _1316 = _1306;
    float _1318 = _1284 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1320 = _1286 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1324 = _1322 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1328 = _1326 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1330 = 1.0 / _1324;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1336;
    bool _1340 = _1316 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1342 = isnan(_1316);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1348 = _1344 || _1346;
    float _1350 = float(_1348);
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1356 = _1316 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1358 = isnan(_1316);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1370 = 1.0 / _1328;
    bool _1372 = _1316 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1374 = isnan(_1316);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    float _1384 = -_1366;
    float _1386 = _1384 + 1.0;
    bool _1388 = _1316 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1390 = isnan(_1316);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1396 = _1392 || _1394;
    float _1398 = float(_1396);
    bool _1400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1402 = _1350 * _1386;
    float _1404 = 1.0 / _1334;
    float _1406 = _1338 * _1330;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1410 = _1316 + _1408;
    float _1412 = fma(_1406, _1410, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1414 = -_1350;
    float _1416 = _1414 + 1.0;
    float _1418 = 1.0 / _1354;
    float _1420 = -_1382;
    float _1422 = _1420 + 1.0;
    float _1424 = _1382 * _1416;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1434 = _1398 * _1422;
    float _1436 = -_1398;
    float _1438 = _1436 + 1.0;
    float _1440 = _1428 * _1370;
    float _1442 = _1432 * _1404;
    float _1444 = _1412 * _1434;
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1448 = _1316 + _1446;
    bool _1450 = _1316 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1452 = isnan(_1316);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1458 = _1454 || _1456;
    float _1460 = float(_1458);
    float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1464 = _1462 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1468 = _1316 + _1466;
    float _1470 = fma(_1442, _1448, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1472 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1444);
    float _1474 = _1464 * _1418;
    float _1476 = fma(_1440, _1468, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1478 = -_1460;
    float _1480 = _1478 + 1.0;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1484 = _1316 + _1482;
    float _1486 = fma(_1470, _1424, _1472);
    float _1488 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1490 = _1366 * _1480;
    float _1492 = fma(_1474, _1484, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1494 = fma(_1476, _1402, _1486);
    float _1496 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1498 = fma(_1492, _1490, _1494);
    float _1500 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1498);
    float _1504 = _1502 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_57.x = _1488;
    out.m_57.y = _1500;
    out.m_57.z = _1496;
    out.m_57.w = _1504;
    bool _1506 = !_1400;
    float _1508 = _1404;
    float _1524;
    if (!_1506)
    {
        float _1510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1512 = _120 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1514 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[14].x, _136);
        float _1516 = _1514 * _1510;
        float _1518 = floor(_1516);
        float _1520 = -_1518;
        float _1522 = _1516 + _1520;
        _1524 = _1522;
        _1526 = true;
    }
    else
    {
        float _1528 = float(_98);
        float _1530 = 1.0 / _1528;
        float _1532 = _136 * _1530;
        _1524 = _1532;
    }
    _1526 = false;
    float _1534 = _1524;
    float _1536 = in.m_59.x;
    float _1538 = in.m_59.y;
    float _1540 = in.m_59.z;
    float _1542 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1544 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1546 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1548 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1550 = isnan(0.5);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1556 = _1552 || _1554;
    float _1558 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1536);
    float _1560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1538);
    float _1562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1540);
    float _1564 = _1558 * _1542;
    float _1566 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1568 = _1560 * _1544;
    float _1570 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1572 = _1562 * _1546;
    float _1574 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1566);
    float _1576 = _1568 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1578 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1570);
    float _1580 = _1568 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1582 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1574);
    float _1584 = fma(_1564, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1576);
    float _1586 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1588 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1578);
    float _1590 = _1582 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1592 = fma(_1564, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1580);
    float _1594 = fma(_1572, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1584);
    float _1596 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1586);
    float _1598 = _1588 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1600 = fma(_1572, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1592);
    float _1602 = _1590 + _1594;
    float _1604 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1596);
    float _1606 = _1598 + _1600;
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1610 = _1602 + _1608;
    float _1612 = _1604 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1614 = _1600;
    float _1616 = _1564;
    float _1618 = _1572;
    float _1620 = _1568;
    if (_1556)
    {
        _1614 = 1.0;
    }
    float _1622 = _1614;
    float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1626 = _1606 + _1624;
    float _1628 = _1610 * _1610;
    float _1630 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1632 = fma(_1626, _1626, _1628);
    float _1634 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1630);
    float _1636 = sqrt(_1632);
    float _1638 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1634);
    float _1640 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1642 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1644 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1640);
    float _1646 = 1.0 / _1642;
    float _1648 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1644);
    float _1650 = _1568 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1652 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1654 = fma(_1564, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1650);
    bool _1656 = _1636 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1658 = _1652 + _1642;
    float _1660 = fma(_1572, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1654);
    float _1662 = _1612 + _1660;
    float _1664 = _1658 * _1646;
    float _1666 = _1664 * 0.5;
    float _1668 = _1660;
    float _1670 = _1662;
    float _1672 = _1622;
    float _1674 = _1646;
    if (!_1656)
    {
        _1616 = _1606;
    }
    float _1676 = _1616;
    float _1678 = _1676;
    if (!_1656)
    {
        _1618 = _1602;
    }
    float _1680 = _1618;
    float _1682 = _1680;
    if (!_1656)
    {
        _1668 = _1662;
    }
    float _1684 = _1668;
    bool _1686 = !_1656;
    float _1688 = _1684;
    if (!_1686)
    {
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1694 = _1636 + _1692;
        float _1696 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = rsqrt(_1632);
        float _1700 = _1694 * _1690;
        float _1702 = _1700 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        float _1708 = _1702 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        float _1712 = _1706 + (-1.0);
        float _1714 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = fma(_1710, _1696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1718 = fma(_1662, _1706, _1714);
        float _1720 = _1698 * _1716;
        float _1722 = fma(_1626, _1720, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1724 = fma(_1610, _1720, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1688 = _1718;
        _1678 = _1722;
        _1682 = _1724;
    }
    float _1726 = _1688;
    float _1728 = _1678;
    float _1730 = _1682;
    if (!_1556)
    {
        float _1732 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1734 = _1732 * 0.15915493667125701904296875;
        float _1736 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1740 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1738);
        float _1742 = _1734 * 6.283185482025146484375;
        float _1744 = cos(_1742);
        float _1746 = _1736 * 0.15915493667125701904296875;
        float _1748 = _1734 * 6.283185482025146484375;
        float _1750 = sin(_1748);
        float _1752 = 1.0 / _1744;
        float _1754 = _1746 * 6.283185482025146484375;
        float _1756 = cos(_1754);
        float _1758 = _1750 * _1752;
        float _1760 = _1746 * 6.283185482025146484375;
        float _1762 = sin(_1760);
        float _1764 = _1756 * _1758;
        float _1766 = 1.0 / _1740;
        float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1770 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1768;
        float _1772 = 1.0 / _1764;
        float _1774 = 1.0 / _1770;
        float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1778 = _1766 * _1776;
        float _1780 = _1762 * _1772;
        float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1784 = fma(_1780, _1778, _1782);
        float _1786 = _1784 * _1774;
        float _1788 = precise::clamp(_1786, 0.0, 1.0);
        _1670 = _1746;
        _1620 = _1766;
        _1672 = _1788;
    }
    float _1790 = _1670;
    float _1792 = _1620;
    float _1794 = _1672;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1798 = _1726 + _1796;
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1802 = _1728 + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1806 = _1730 + _1804;
    float _1808 = _1798 * _1798;
    float _1810 = fma(_1802, _1802, _1808);
    float _1812 = fma(_1806, _1806, _1810);
    float _1814 = rsqrt(_1812);
    float _1816 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1818 = _1802 * _1816;
    float _1820 = _1806 * _1816;
    float _1822 = _1818 * _1818;
    float _1824 = _1820 * _1820;
    float _1826 = _1822 + _1824;
    float _1828 = sqrt(_1826);
    bool _1830 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1834 = _1828 + _1832;
    float _1836 = _1790;
    float _1838 = _1834;
    float _1840 = _1798;
    float _1842 = _1818;
    if (_1830)
    {
        float _1844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1836 = _1844;
    }
    float _1846 = _1836;
    float _1848 = _1846;
    if (_1830)
    {
        float _1850 = _1834 * _1846;
        _1838 = _1850;
    }
    float _1852 = _1838;
    if (_1830)
    {
        float _1854 = rsqrt(_1826);
        _1848 = _1854;
    }
    float _1856 = _1848;
    float _1858 = _1856;
    if (_1830)
    {
        float _1860 = _1852 * 0.15915493667125701904296875;
        _1674 = _1860;
    }
    float _1862 = _1674;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1866 = _1806;
    if (_1830)
    {
        float _1868 = _1862 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        _1866 = _1870;
    }
    float _1872 = _1866;
    float _1874 = precise::max(0.0, _1864);
    float _1876 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1878 = _1792;
    float _1880 = _1874;
    if (_1830)
    {
        float _1882 = _1862 * 6.283185482025146484375;
        float _1884 = cos(_1882);
        _1878 = _1884;
    }
    float _1886 = _1878;
    float _1888 = -_1816;
    float _1890 = -_1874;
    float _1892 = fma(_1798, _1888, _1890);
    if (_1830)
    {
        float _1894 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1894;
    }
    float _1896 = _1840;
    float _1898 = sqrt(_1812);
    float _1900 = _1872;
    float _1902 = _1896;
    if (_1830)
    {
        float _1904 = fma(_1872, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1900 = _1904;
    }
    float _1906 = _1900;
    float _1908 = _1906;
    if (!_1830)
    {
        _1902 = _1892;
    }
    float _1910 = _1902;
    float _1912 = _1910;
    if (_1830)
    {
        float _1914 = _1856 * _1906;
        _1508 = _1914;
    }
    float _1916 = _1508;
    if (!_1830)
    {
        _1908 = _1822;
    }
    float _1918 = _1908;
    float _1920 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1922 = _1918;
    float _1924 = _1886;
    if (_1830)
    {
        float _1926 = _1886 + (-1.0);
        _1880 = _1926;
    }
    float _1928 = _1880;
    float _1930 = _1928;
    if (_1830)
    {
        float _1932 = _1818 * _1916;
        _1842 = _1932;
    }
    float _1934 = _1842;
    float _1936 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1920);
    if (_1830)
    {
        float _1938 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1858 = _1938;
    }
    float _1940 = _1858;
    if (!_1830)
    {
        _1930 = _1820;
    }
    float _1942 = _1930;
    float _1944 = _1942;
    if (_1830)
    {
        float _1946 = _1820 * _1916;
        _1944 = _1946;
    }
    float _1948 = _1944;
    if (_1830)
    {
        float _1950 = _1934 * _1934;
        _1922 = _1950;
    }
    float _1952 = _1922;
    if (_1830)
    {
        float _1954 = fma(_1892, _1886, _1940);
        _1912 = _1954;
    }
    float _1956 = _1912;
    if (!_1830)
    {
        _1924 = _1824;
    }
    float _1958 = _1924;
    float _1960 = _1958;
    if (_1830)
    {
        float _1962 = _1948 * _1948;
        _1960 = _1962;
    }
    float _1964 = _1960;
    float _1966 = fma(_1956, _1956, _1952);
    float _1968 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1936);
    float _1970 = _1966 + _1964;
    float _1972 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1976 = fma(_1898, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1974);
    float _1978 = precise::clamp(_1976, 0.0, 1.0);
    float _1980 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1982 = rsqrt(_1970);
    float _1984 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1972);
    float _1986 = -_1978;
    float _1988 = _1986 + 1.0;
    float _1990 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1980);
    float _1992 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1984);
    float _1994 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1996 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1990);
    float _1998 = abs(_1988);
    float _2000 = log2(_1998);
    float _2002 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2004 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1994);
    float _2006 = _1996 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2008 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2010 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2004);
    float _2012 = _1982 * _1934;
    float _2014 = -_2008;
    float _2016 = fma(_2014, _1876, 1.0);
    float _2018 = _2010 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2020 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2022 = _1982 * _1956;
    float _2024 = _2012 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2026 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2028 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2020);
    float _2030 = _1982 * _1948;
    float _2032 = -_2024;
    float _2034 = fma(_2022, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2032);
    float _2036 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2038 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2028);
    float _2040 = log2(_2016);
    float _2042 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2044 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2038);
    float _2046 = -_2030;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2034);
    float _2050 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2052 = exp2(_2036);
    float _2054 = fma(_2048, -0.5, 0.5);
    float _2056 = fma(_2048, 0.5, 0.5);
    float _2058 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2050);
    float _2060 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2042);
    float _2062 = _2022 + 1.0;
    float _2064 = fma(_2056, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2066 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2058);
    float _2068 = 1.0 / _2044;
    float _2070 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2060);
    float _2072 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2066);
    float _2074 = sqrt(_2054);
    float _2076 = -_2022;
    float _2078 = fma(_2052, _2062, _2076);
    float _2080 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2070);
    float _2082 = fma(_2056, _2064, -0.212114393711090087890625);
    float _2084 = _2040 * 0.693147182464599609375;
    float _2086 = fma(_2056, _2082, 1.570728778839111328125);
    float _2088 = _2072 * _2068;
    float _2090 = _2080 * _2068;
    float _2092 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2094 = fma(_2088, 0.5, 0.5);
    float _2096 = fma(_2090, -0.5, 0.5);
    float _2098 = fma(_2078, 0.5, 0.5);
    float _2100 = _2074 * 0.636619746685028076171875;
    float _2102 = -_2086;
    float _2104 = fma(_2100, _2102, 1.0);
    float3 _6019 = float3(_2094, _2096, _2092);
    float _2106 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6019, float3(0.0), isnan(_6019)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6019, float3(0.0), isnan(_6019)), level(0.0)).x;
    float3 _6030 = float3(_2094, _2096, _2092);
    float4 _2109 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6030, float3(0.0), isnan(_6030)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6030, float3(0.0), isnan(_6030)), level(0.0)).xyzw;
    float _2111 = _2109.x;
    float _2113 = _2109.y;
    float _2115 = _2109.z;
    float _2117 = _2109.w;
    float2 _6047 = float2(_2104, _2098);
    float3 _2121 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6047, float2(0.0), isnan(_6047)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6047, float2(0.0), isnan(_6047)), level(0.0)).xyz;
    float _2123 = _2121.x;
    float _2125 = _2121.y;
    float _2127 = _2121.z;
    float _2129 = in.m_61.w;
    float _2131 = _120 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2133 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _2133;
    float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2139 = _2137 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2143 = _2141 != 0;
    float _2145 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2147 = _1534 + _2145;
    float _2149 = 1.0 / _2135;
    float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2153 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _2151;
    bool _2155 = _120 > 0.5;
    bool _2157 = _2155 && _2143;
    float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2161 = _2159 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2163 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2165 = _1534 + _2163;
    float _2167 = 1.0 / _2139;
    float _2169 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2171 = _122 > 0.5;
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2175 = _1534 + _2173;
    int _2177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2179 = _2177 != 0;
    float _2181 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2183 = -_2169;
    float _2185 = fma(_2131, 2.0, _2183);
    float _2187 = 1.0 / _2153;
    float _2189 = in.m_63.y;
    float _2191 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2181);
    float _2193 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2195 = _2193 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2197 = _2147 * _2149;
    out.m_65.w = _2129;
    float _2199 = _122 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2201 = 1.0 / _2161;
    float _2203 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2205 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _2203;
    float _2207 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2211 = _1534 + _2209;
    float _2213 = in.m_63.x;
    float _2215 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2217 = _2211 * _2167;
    float _2219 = 1.0 / _2195;
    float _2221 = fma(_2199, -2.0, _2207);
    float _2223 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2215);
    float _2225 = _2175 * _2187;
    float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2229 = _1534 + _2227;
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _2231;
    float _2235 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2223);
    float _2237 = 1.0 / _2205;
    float _2239 = -_2189;
    float _2241 = _2239 + 1.0;
    float _2243 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2245 = _1534 + _2243;
    float _2247 = -_136;
    float _2249 = fma(_2247, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2185);
    float _2251 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2221);
    float _2253 = _2245 * _2201;
    int _2255 = _2171 ? as_type<int>(_2241) : as_type<int>(_2189);
    float _2257 = _2165 * _2219;
    float _2259 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2261 = _1534 + _2259;
    out.m_67.w = _2189;
    float _2263 = _2179 ? as_type<float>(_2255) : _2189;
    float _2265 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _2265;
    float _2269 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2271 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2269;
    float _2273 = _2229 * _2237;
    float _2275 = 1.0 / _2267;
    bool _2277 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2279 = isnan(_1534);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2285 = _2281 || _2283;
    float _2287 = float(_2285);
    float _2289 = fma(_2271, _2197, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2291 = fma(_2233, _2197, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _2293 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2295 = _2293 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2297 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _2297;
    float _2301 = 0.0;
    float _2303 = _2213;
    if (_2143)
    {
        _2301 = _2213;
    }
    float _2305 = _2301;
    float _2307 = fma(_2295, _2217, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2309 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2191);
    float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _2313 = _2311 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2315 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2315;
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2321 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _2319;
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2325 = _2323 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2327 = fma(_2313, _2217, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _2331 = _2329 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    bool _2333 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2335 = isnan(_1534);
    bool _2337 = _2333 || _2335;
    bool _2339 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2341 = _2337 || _2339;
    float _2343 = float(_2341);
    float _2345 = _2261 * _2275;
    float _2347 = fma(_2325, _2253, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2349 = fma(_2317, _2225, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2351 = fma(_2331, _2253, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    bool _2353 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2355 = isnan(_1534);
    bool _2357 = _2353 || _2355;
    bool _2359 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2361 = _2357 || _2359;
    float _2363 = float(_2361);
    float _2365 = -_2343;
    float _2367 = _2365 + 1.0;
    float _2369 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2369;
    float _2373 = fma(_2321, _2225, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    bool _2375 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2377 = isnan(_1534);
    bool _2379 = _2375 || _2377;
    bool _2381 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2383 = _2379 || _2381;
    float _2385 = float(_2383);
    float _2387 = _2363 * _2367;
    float _2389 = fma(_2371, _2273, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2391 = -_2363;
    float _2393 = _2391 + 1.0;
    float _2395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2397 = -_2385;
    float _2399 = _2397 + 1.0;
    float _2401 = fma(_2299, _2273, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _2403 = _2385 * _2393;
    float _2405 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2407 = _2405 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2409 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2411 = isnan(_1534);
    bool _2413 = _2409 || _2411;
    bool _2415 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2417 = _2413 || _2415;
    float _2419 = float(_2417);
    float _2421 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2423 = _2421 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2425 = _2287 * _2399;
    float _2427 = _2305;
    if (_2157)
    {
        float _2429 = -_2305;
        float _2431 = _2429 + 1.0;
        _2427 = _2431;
    }
    float _2433 = _2427;
    float _2435 = -_2287;
    float _2437 = _2435 + 1.0;
    float _2439 = fma(_2407, _2257, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2441 = fma(_2423, _2257, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _2443 = _1538 != 0.0;
    bool _2445 = isnan(_1538);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan(0.0);
    bool _2451 = _2447 || _2449;
    float _2453 = _2419 * _2437;
    if (_2143)
    {
        _2303 = _2433;
    }
    float _2455 = _2303;
    float _2457 = -_2419;
    float _2459 = _2457 + 1.0;
    float _2461 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2463 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2465 = isnan(_1534);
    bool _2467 = _2463 || _2465;
    bool _2469 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2471 = _2467 || _2469;
    float _2473 = float(_2471);
    float _2475 = in.m_69.x;
    float _2477 = in.m_69.y;
    float _2479 = in.m_69.z;
    bool _2481 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2483 = isnan(_1534);
    bool _2485 = _2481 || _2483;
    bool _2487 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2489 = _2485 || _2487;
    float _2491 = float(_2489);
    float _2493 = fma(_2263, _2461, -0.5);
    bool _2495 = _1536 == 0.0;
    bool _2497 = !_2451;
    bool _2499 = _2495 && _2497;
    float _2501 = -_2473;
    float _2503 = _2501 + 1.0;
    float _2505 = _2473 * _2459;
    bool _2507 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2509 = isnan(_1534);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2515 = _2511 || _2513;
    float _2517 = float(_2515);
    float _2519 = -_2251;
    float _2521 = fma(_2235, _2493, _2519);
    float _2523 = _2491 * _2503;
    float _2525 = -_2491;
    float _2527 = _2525 + 1.0;
    bool _2529 = _1540 == 0.0;
    bool _2531 = _2529 && _2499;
    float _2533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2535 = _2517 * _2527;
    float _2537 = -_2517;
    float _2539 = _2537 + 1.0;
    out.m_71.x = _1728;
    out.m_71.y = _1726;
    out.m_71.z = _1730;
    float _2541 = _2289 * _2535;
    float _2543 = _2291 * _2535;
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2547 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2545;
    float _2549 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2551 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2549;
    float _2553 = fma(_2539, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2541);
    float _2555 = fma(_2539, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2543);
    float _2557 = fma(_2547, _2345, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2559 = _2477;
    float _2561 = _2475;
    float _2563 = _2479;
    if (!_2531)
    {
        float _2565 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2477);
        _2559 = _2565;
    }
    float _2567 = _2559;
    float _2569 = fma(_2307, _2523, _2553);
    float _2571 = fma(_2327, _2523, _2555);
    if (!_2531)
    {
        float _2573 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2475);
        _2561 = _2573;
    }
    float _2575 = _2561;
    float _2577 = _2567 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2579 = fma(_2349, _2505, _2569);
    float _2581 = _2567 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2583 = _2567 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (!_2531)
    {
        float _2585 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2479);
        _2563 = _2585;
    }
    float _2587 = _2563;
    float _2589 = fma(_2575, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2577);
    float _2591 = fma(_2347, _2453, _2579);
    float _2593 = fma(_2575, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2581);
    float _2595 = fma(_2575, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2583);
    float _2597 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2589);
    float _2599 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2601 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2603 = fma(_2373, _2505, _2571);
    float _2605 = fma(_2389, _2425, _2591);
    float _2607 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2599);
    float _2609 = _2533 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2611 = exp2(_2601);
    float _2613 = fma(_2351, _2453, _2603);
    float _2615 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2607);
    float _2617 = fma(_2551, _2345, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2619 = fma(_2439, _2403, _2605);
    float _2621 = fma(_2401, _2425, _2613);
    float _2623 = fma(_2609, _2455, -0.5);
    float _2625 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2615);
    bool _2627 = _1794 > 0.0;
    bool _2629 = isnan(_1794);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan(0.0);
    bool _2635 = _2631 || _2633;
    float _2637 = fma(_2441, _2403, _2621);
    float _2639 = _2044 * 0.5;
    float _2641 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2593);
    float _2643 = fma(_2557, _2387, _2619);
    float _2645 = fma(_2617, _2387, _2637);
    float _2647 = fma(_2080, -0.5, _2639);
    float _2649 = fma(_2309, _2623, _2249);
    float _2651 = -_2611;
    float _2653 = _2651 + 1.0;
    float _2655 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2657 = _2625 + _2044;
    float _2659 = _2072 + _2044;
    float _2661 = _2653 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2663 = fma(_2343, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2643);
    float _2665 = fma(_2343, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2645);
    float _2667 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2595);
    float _2669 = -_2661;
    float _2671 = _2669 + 1.0;
    float _2673 = _2521 + 0.5;
    float _2675 = _2649 + 0.5;
    float _2677 = _2657 * 0.5;
    float _2679 = _2659 * 0.5;
    float _2681 = _2655 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.y = _2673;
    out.m_73.x = _2597;
    out.m_73.y = _2641;
    out.m_73.z = _2667;
    out.m_67.x = _2675;
    out.m_75.x = _2663;
    out.m_75.y = _2665;
    out.gl_Position.x = _2072;
    out.gl_Position.y = _2080;
    out.gl_Position.z = _2625;
    out.gl_Position.w = _2044;
    out.m_77.x = _2679;
    out.m_77.y = _2647;
    out.m_77.z = _2677;
    out.m_77.w = _2044;
    out.m_45.x = _2681;
    float _2683 = _2661 * _2106;
    float _2685 = _2117 * _2671;
    float _2687 = _2117 * _2683;
    float _2689 = _2127 * _2683;
    float _2691 = fma(_2123, _2687, _2111);
    float _2693 = fma(_2125, _2687, _2113);
    float _2695 = fma(_2117, _2689, _2115);
    out.m_79.x = _2691;
    out.m_79.y = _2693;
    out.m_79.z = _2695;
    out.m_79.w = _2685;
    if (_2635)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2697 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2697;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1526 = false;
    bool _1308 = false;
    bool _1088 = false;
    bool _910 = false;
    bool _624 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2754 = as_type<float>(_114);
        out.gl_Position.z = _2754;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_47.w;
    float _120 = in.m_49.x;
    float _122 = in.m_49.y;
    bool _124 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_118);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_118;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.x = _120;
    out.m_51.y = _122;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_98);
        _138 = _140;
    }
    float _142 = _138;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    if (_148)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _108;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _116 = as_type<int>(_152);
    }
    int _154 = _116;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2830 = as_type<float>(_154);
        out.gl_Position.z = _2830;
    }
    if (_148)
    {
        return out;
    }
    float _156 = in.m_53.w;
    float _158 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _156, _176);
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    bool _278 = !_258;
    float _294;
    if (!_278)
    {
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _120 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_98);
        float _300 = 1.0 / _298;
        float _302 = _136 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _304 + _306;
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
    float _332 = 1.0 / _320;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _304 + _334;
    bool _338 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _340 = isnan(_304);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    bool _350 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _352 = isnan(_304);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -_348;
    float _364 = _362 + 1.0;
    float _366 = 1.0 / _316;
    float _368 = _336 * _326;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _372 = _304 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _380 = fma(_376, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _382 = 1.0 / _324;
    float _384 = _372 * _332;
    bool _386 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _388 = isnan(_304);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _400 = _304 + _398;
    bool _402 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _404 = isnan(_304);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = 1.0 / _330;
    float _416 = _308 * _366;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _420 = _304 + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _422;
    float _426 = -_412;
    float _428 = _426 + 1.0;
    float _430 = fma(_424, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _432 = _400 * _382;
    float _434 = -_396;
    float _436 = _434 + 1.0;
    float _438 = _412 * _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _440;
    float _444 = _420 * _414;
    bool _446 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _448 = isnan(_304);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = fma(_442, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _460 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _462 = isnan(_304);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = _456 * _428;
    float _474 = -_456;
    float _476 = _474 + 1.0;
    float _478 = _470 * _364;
    float _480 = -_470;
    float _482 = _480 + 1.0;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _488 = _348 * _476;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _498 = _360 * _482;
    float _500 = fma(_486, _416, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _502 = fma(_492, _416, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _504 = fma(_496, _416, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _506 = _458 * _498;
    float _508 = -_360;
    float _510 = _508 + 1.0;
    float _512 = _380 * _498;
    float _514 = _430 * _498;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _520;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _524;
    float _528 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].x, _506);
    float _530 = fma(_518, _384, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _532 = fma(_522, _384, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _534 = fma(_526, _384, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _540 = fma(_502, _478, _528);
    float _542 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].y, _512);
    float _544 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].z, _514);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _550 = fma(_538, _432, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _552 = fma(_532, _488, _540);
    float _554 = fma(_504, _478, _542);
    float _556 = fma(_548, _432, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _558 = fma(_500, _478, _544);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _564 = fma(_530, _488, _554);
    float _566 = fma(_534, _488, _558);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _572;
    float _576 = fma(_562, _432, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _578;
    float _582 = fma(_550, _472, _552);
    float _584 = fma(_570, _444, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _586 = fma(_574, _444, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _588 = fma(_580, _444, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _590 = fma(_556, _472, _564);
    float _592 = fma(_576, _472, _566);
    float _594 = fma(_584, _438, _582);
    float _596 = fma(_586, _438, _590);
    float _598 = fma(_588, _438, _592);
    float _600 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[148].x, _594);
    float _602 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[148].y, _596);
    float _604 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[148].z, _598);
    bool _606 = !_378;
    float _622;
    if (!_606)
    {
        float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _610 = _120 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[11].x, _136);
        float _614 = _612 * _608;
        float _616 = floor(_614);
        float _618 = -_616;
        float _620 = _614 + _618;
        _622 = _620;
        _624 = true;
    }
    else
    {
        float _626 = float(_98);
        float _628 = 1.0 / _626;
        float _630 = _136 * _628;
        _622 = _630;
    }
    _624 = false;
    float _632 = _622;
    float _634 = in.m_53.x;
    float _636 = in.m_53.y;
    float _638 = in.m_53.z;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _642 = _632 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _646 = _632 + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _664 = 1.0 / _650;
    bool _666 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _668 = isnan(_632);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = 1.0 / _654;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _682 = _632 + _680;
    float _684 = 1.0 / _658;
    float _686 = _602 * _636;
    float _688 = _682 * _664;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _692 = _632 + _690;
    bool _694 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _696 = isnan(_632);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = _604 * _638;
    bool _708 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _710 = isnan(_632);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = _600 * _634;
    float _722 = 1.0 / _662;
    float _724 = _692 * _678;
    float _726 = -_704;
    float _728 = _726 + 1.0;
    bool _730 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _732 = _718 * _728;
    float _734 = -_718;
    float _736 = _734 + 1.0;
    float _738 = _642 * _684;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _752 = fma(_742, _688, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _754 = fma(_746, _688, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _756 = fma(_750, _724, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _758 = _646 * _722;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _760;
    bool _764 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _766 = isnan(_632);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = fma(_762, _688, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _778 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _780 = isnan(_632);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = -_774;
    float _792 = _790 + 1.0;
    float _794 = _774 * _736;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _804 = _788 * _792;
    float _806 = -_788;
    float _808 = _806 + 1.0;
    float _810 = fma(_798, _724, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _812 = fma(_802, _724, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _814 = _676 * _808;
    float _816 = -_676;
    float _818 = _816 + 1.0;
    float _820 = _752 * _814;
    float _822 = _754 * _814;
    float _824 = _776 * _814;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _830;
    float _834 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[107].x, _820);
    float _836 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[107].y, _822);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _838;
    float _842 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[107].z, _824);
    float _844 = fma(_828, _738, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _846 = fma(_832, _738, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _848 = fma(_810, _804, _836);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _858 = fma(_840, _738, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _860 = fma(_812, _804, _834);
    float _862 = fma(_756, _804, _842);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _868 = fma(_852, _758, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _870 = fma(_856, _758, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _872 = fma(_844, _794, _860);
    float _874 = fma(_866, _758, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _876 = fma(_858, _794, _848);
    float _878 = fma(_846, _794, _862);
    float _880 = fma(_868, _732, _872);
    float _882 = fma(_870, _732, _876);
    float _884 = fma(_874, _732, _878);
    float _886 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[111].x, _880);
    float _888 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[111].y, _882);
    float _890 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[111].z, _884);
    bool _892 = !_730;
    float _908;
    if (!_892)
    {
        float _894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _896 = _120 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _898 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _900 = _898 * _894;
        float _902 = floor(_900);
        float _904 = -_902;
        float _906 = _900 + _904;
        _908 = _906;
        _910 = true;
    }
    else
    {
        float _912 = float(_98);
        float _914 = 1.0 / _912;
        float _916 = _136 * _914;
        _908 = _916;
    }
    _910 = false;
    float _918 = _908;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _922 = _918 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _928 = _918 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _930 = isnan(_918);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _948 = _918 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _950 = isnan(_918);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = 1.0 / _926;
    float _962 = -_938;
    float _964 = _962 + 1.0;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _966;
    bool _970 = _918 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _972 = isnan(_918);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = _958 * _964;
    float _984 = -_958;
    float _986 = _984 + 1.0;
    bool _988 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _990 = 1.0 / _942;
    float _992 = _980 * _986;
    float _994 = -_980;
    float _996 = _994 + 1.0;
    float _998 = 1.0 / _946;
    float _1000 = _968 * _960;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1006 = fma(_1000, _922, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1008 = _1004 * _990;
    bool _1010 = _918 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1012 = isnan(_918);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1028 = _918 + _1026;
    float _1030 = _1006 * _992;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1034 = _918 + _1032;
    float _1036 = -_1020;
    float _1038 = _1036 + 1.0;
    float _1040 = fma(_1008, _1028, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1042 = _1024 * _998;
    float _1044 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1030);
    float _1046 = _938 * _1038;
    float _1048 = _886 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1050 = fma(_1042, _1034, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1052 = fma(_1040, _982, _1044);
    float _1054 = _890 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = fma(_1050, _1046, _1052);
    float _1060 = _888 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1062 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1064 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1058);
    float _1066 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1068 = _1064 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _1056;
    out.m_55.y = _1066;
    out.m_55.z = _1062;
    out.m_55.w = _1068;
    bool _1070 = !_988;
    float _1086;
    if (!_1070)
    {
        float _1072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1074 = _120 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[11].z, _136);
        float _1078 = _1076 * _1072;
        float _1080 = floor(_1078);
        float _1082 = -_1080;
        float _1084 = _1078 + _1082;
        _1086 = _1084;
        _1088 = true;
    }
    else
    {
        float _1090 = float(_98);
        float _1092 = 1.0 / _1090;
        float _1094 = _136 * _1092;
        _1086 = _1094;
    }
    _1088 = false;
    float _1096 = _1086;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1100 = _1096 + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1104 = _1096 + _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1108 = _1096 + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1118;
    float _1122 = 1.0 / _1112;
    bool _1124 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1126 = 1.0 / _1120;
    float _1128 = 1.0 / _1116;
    float _1130 = _1100 * _1122;
    bool _1132 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1134 = isnan(_1096);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1144;
    float _1148 = -_1142;
    float _1150 = _1148 + 1.0;
    float _1152 = _1104 * _1126;
    bool _1154 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1156 = isnan(_1096);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = fma(_1146, _1130, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1168 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1170 = isnan(_1096);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1176 = _1172 || _1174;
    float _1178 = float(_1176);
    float _1180 = _1164 * _1150;
    bool _1182 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1184 = isnan(_1096);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = _1108 * _1128;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1200;
    float _1204 = -_1178;
    float _1206 = _1204 + 1.0;
    float _1208 = -_1164;
    float _1210 = _1208 + 1.0;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1216 = fma(_1198, _1130, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1218 = fma(_1202, _1130, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1220 = _1192 * _1206;
    float _1222 = _1178 * _1210;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1230 = _1228 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1232 = _1218 * _1220;
    float _1234 = _1166 * _1220;
    float _1236 = _1216 * _1220;
    float _1238 = -_1192;
    float _1240 = _1238 + 1.0;
    float _1242 = fma(_1214, _1194, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1244 = fma(_1226, _1194, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1246 = fma(_1230, _1194, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1248 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1234);
    float _1250 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1236);
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1256;
    float _1260 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1232);
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1262;
    float _1266 = fma(_1242, _1222, _1248);
    float _1268 = fma(_1254, _1152, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1270 = fma(_1258, _1152, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1272 = fma(_1244, _1222, _1250);
    float _1274 = fma(_1264, _1152, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1276 = fma(_1246, _1222, _1260);
    float _1278 = fma(_1268, _1180, _1266);
    float _1280 = fma(_1270, _1180, _1272);
    float _1282 = fma(_1274, _1180, _1276);
    float _1284 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1278);
    float _1286 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1280);
    float _1288 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1282);
    bool _1290 = !_1124;
    float _1306;
    if (!_1290)
    {
        float _1292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1294 = _120 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1296 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _1298 = _1296 * _1292;
        float _1300 = floor(_1298);
        float _1302 = -_1300;
        float _1304 = _1298 + _1302;
        _1306 = _1304;
        _1308 = true;
    }
    else
    {
        float _1310 = float(_98);
        float _1312 = 1.0 / _1310;
        float _1314 = _136 * _1312;
        _1306 = _1314;
    }
    _1308 = false;
    float _1316 = _1306;
    float _1318 = _1284 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1320 = _1286 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1324 = _1322 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1328 = _1326 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1330 = 1.0 / _1324;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1336;
    bool _1340 = _1316 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1342 = isnan(_1316);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1348 = _1344 || _1346;
    float _1350 = float(_1348);
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1356 = _1316 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1358 = isnan(_1316);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1370 = 1.0 / _1328;
    bool _1372 = _1316 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1374 = isnan(_1316);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    float _1384 = -_1366;
    float _1386 = _1384 + 1.0;
    bool _1388 = _1316 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1390 = isnan(_1316);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1396 = _1392 || _1394;
    float _1398 = float(_1396);
    bool _1400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1402 = _1350 * _1386;
    float _1404 = 1.0 / _1334;
    float _1406 = _1338 * _1330;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1410 = _1316 + _1408;
    float _1412 = fma(_1406, _1410, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1414 = -_1350;
    float _1416 = _1414 + 1.0;
    float _1418 = 1.0 / _1354;
    float _1420 = -_1382;
    float _1422 = _1420 + 1.0;
    float _1424 = _1382 * _1416;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1434 = _1398 * _1422;
    float _1436 = -_1398;
    float _1438 = _1436 + 1.0;
    float _1440 = _1428 * _1370;
    float _1442 = _1432 * _1404;
    float _1444 = _1412 * _1434;
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1448 = _1316 + _1446;
    bool _1450 = _1316 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1452 = isnan(_1316);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1458 = _1454 || _1456;
    float _1460 = float(_1458);
    float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1464 = _1462 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1468 = _1316 + _1466;
    float _1470 = fma(_1442, _1448, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1472 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1444);
    float _1474 = _1464 * _1418;
    float _1476 = fma(_1440, _1468, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1478 = -_1460;
    float _1480 = _1478 + 1.0;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1484 = _1316 + _1482;
    float _1486 = fma(_1470, _1424, _1472);
    float _1488 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1490 = _1366 * _1480;
    float _1492 = fma(_1474, _1484, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1494 = fma(_1476, _1402, _1486);
    float _1496 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1498 = fma(_1492, _1490, _1494);
    float _1500 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1498);
    float _1504 = _1502 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_57.x = _1488;
    out.m_57.y = _1500;
    out.m_57.z = _1496;
    out.m_57.w = _1504;
    bool _1506 = !_1400;
    float _1508 = _1404;
    float _1524;
    if (!_1506)
    {
        float _1510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1512 = _120 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1514 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[14].x, _136);
        float _1516 = _1514 * _1510;
        float _1518 = floor(_1516);
        float _1520 = -_1518;
        float _1522 = _1516 + _1520;
        _1524 = _1522;
        _1526 = true;
    }
    else
    {
        float _1528 = float(_98);
        float _1530 = 1.0 / _1528;
        float _1532 = _136 * _1530;
        _1524 = _1532;
    }
    _1526 = false;
    float _1534 = _1524;
    float _1536 = in.m_59.x;
    float _1538 = in.m_59.y;
    float _1540 = in.m_59.z;
    float _1542 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1544 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1546 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1548 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1550 = isnan(0.5);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1556 = _1552 || _1554;
    float _1558 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1536);
    float _1560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1538);
    float _1562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1540);
    float _1564 = _1558 * _1542;
    float _1566 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1568 = _1560 * _1544;
    float _1570 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1572 = _1562 * _1546;
    float _1574 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1566);
    float _1576 = _1568 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1578 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1570);
    float _1580 = _1568 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1582 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1574);
    float _1584 = fma(_1564, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1576);
    float _1586 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1588 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1578);
    float _1590 = _1582 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1592 = fma(_1564, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1580);
    float _1594 = fma(_1572, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1584);
    float _1596 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1586);
    float _1598 = _1588 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1600 = fma(_1572, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1592);
    float _1602 = _1590 + _1594;
    float _1604 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1596);
    float _1606 = _1598 + _1600;
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1610 = _1602 + _1608;
    float _1612 = _1604 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1614 = _1600;
    float _1616 = _1564;
    float _1618 = _1572;
    float _1620 = _1568;
    if (_1556)
    {
        _1614 = 1.0;
    }
    float _1622 = _1614;
    float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1626 = _1606 + _1624;
    float _1628 = _1610 * _1610;
    float _1630 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1632 = fma(_1626, _1626, _1628);
    float _1634 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1630);
    float _1636 = sqrt(_1632);
    float _1638 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1634);
    float _1640 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1642 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1644 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1640);
    float _1646 = 1.0 / _1642;
    float _1648 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1644);
    float _1650 = _1568 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1652 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1654 = fma(_1564, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1650);
    bool _1656 = _1636 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1658 = _1652 + _1642;
    float _1660 = fma(_1572, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1654);
    float _1662 = _1612 + _1660;
    float _1664 = _1658 * _1646;
    float _1666 = _1664 * 0.5;
    float _1668 = _1660;
    float _1670 = _1662;
    float _1672 = _1622;
    float _1674 = _1646;
    if (!_1656)
    {
        _1616 = _1606;
    }
    float _1676 = _1616;
    float _1678 = _1676;
    if (!_1656)
    {
        _1618 = _1602;
    }
    float _1680 = _1618;
    float _1682 = _1680;
    if (!_1656)
    {
        _1668 = _1662;
    }
    float _1684 = _1668;
    bool _1686 = !_1656;
    float _1688 = _1684;
    if (!_1686)
    {
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1694 = _1636 + _1692;
        float _1696 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = rsqrt(_1632);
        float _1700 = _1694 * _1690;
        float _1702 = _1700 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        float _1708 = _1702 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        float _1712 = _1706 + (-1.0);
        float _1714 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = fma(_1710, _1696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1718 = fma(_1662, _1706, _1714);
        float _1720 = _1698 * _1716;
        float _1722 = fma(_1626, _1720, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1724 = fma(_1610, _1720, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1688 = _1718;
        _1678 = _1722;
        _1682 = _1724;
    }
    float _1726 = _1688;
    float _1728 = _1678;
    float _1730 = _1682;
    if (!_1556)
    {
        float _1732 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1734 = _1732 * 0.15915493667125701904296875;
        float _1736 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1740 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1738);
        float _1742 = _1734 * 6.283185482025146484375;
        float _1744 = cos(_1742);
        float _1746 = _1736 * 0.15915493667125701904296875;
        float _1748 = _1734 * 6.283185482025146484375;
        float _1750 = sin(_1748);
        float _1752 = 1.0 / _1744;
        float _1754 = _1746 * 6.283185482025146484375;
        float _1756 = cos(_1754);
        float _1758 = _1750 * _1752;
        float _1760 = _1746 * 6.283185482025146484375;
        float _1762 = sin(_1760);
        float _1764 = _1756 * _1758;
        float _1766 = 1.0 / _1740;
        float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1770 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1768;
        float _1772 = 1.0 / _1764;
        float _1774 = 1.0 / _1770;
        float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1778 = _1766 * _1776;
        float _1780 = _1762 * _1772;
        float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1784 = fma(_1780, _1778, _1782);
        float _1786 = _1784 * _1774;
        float _1788 = precise::clamp(_1786, 0.0, 1.0);
        _1670 = _1746;
        _1620 = _1766;
        _1672 = _1788;
    }
    float _1790 = _1670;
    float _1792 = _1620;
    float _1794 = _1672;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1798 = _1726 + _1796;
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1802 = _1728 + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1806 = _1730 + _1804;
    float _1808 = _1798 * _1798;
    float _1810 = fma(_1802, _1802, _1808);
    float _1812 = fma(_1806, _1806, _1810);
    float _1814 = rsqrt(_1812);
    float _1816 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1818 = _1802 * _1816;
    float _1820 = _1806 * _1816;
    float _1822 = _1818 * _1818;
    float _1824 = _1820 * _1820;
    float _1826 = _1822 + _1824;
    float _1828 = sqrt(_1826);
    bool _1830 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1834 = _1828 + _1832;
    float _1836 = _1790;
    float _1838 = _1834;
    float _1840 = _1798;
    float _1842 = _1818;
    if (_1830)
    {
        float _1844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1836 = _1844;
    }
    float _1846 = _1836;
    float _1848 = _1846;
    if (_1830)
    {
        float _1850 = _1834 * _1846;
        _1838 = _1850;
    }
    float _1852 = _1838;
    if (_1830)
    {
        float _1854 = rsqrt(_1826);
        _1848 = _1854;
    }
    float _1856 = _1848;
    float _1858 = _1856;
    if (_1830)
    {
        float _1860 = _1852 * 0.15915493667125701904296875;
        _1674 = _1860;
    }
    float _1862 = _1674;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1866 = _1806;
    if (_1830)
    {
        float _1868 = _1862 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        _1866 = _1870;
    }
    float _1872 = _1866;
    float _1874 = precise::max(0.0, _1864);
    float _1876 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1878 = _1792;
    float _1880 = _1874;
    if (_1830)
    {
        float _1882 = _1862 * 6.283185482025146484375;
        float _1884 = cos(_1882);
        _1878 = _1884;
    }
    float _1886 = _1878;
    float _1888 = -_1816;
    float _1890 = -_1874;
    float _1892 = fma(_1798, _1888, _1890);
    if (_1830)
    {
        float _1894 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1894;
    }
    float _1896 = _1840;
    float _1898 = sqrt(_1812);
    float _1900 = _1872;
    float _1902 = _1896;
    if (_1830)
    {
        float _1904 = fma(_1872, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1900 = _1904;
    }
    float _1906 = _1900;
    float _1908 = _1906;
    if (!_1830)
    {
        _1902 = _1892;
    }
    float _1910 = _1902;
    float _1912 = _1910;
    if (_1830)
    {
        float _1914 = _1856 * _1906;
        _1508 = _1914;
    }
    float _1916 = _1508;
    if (!_1830)
    {
        _1908 = _1822;
    }
    float _1918 = _1908;
    float _1920 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1922 = _1918;
    float _1924 = _1886;
    if (_1830)
    {
        float _1926 = _1886 + (-1.0);
        _1880 = _1926;
    }
    float _1928 = _1880;
    float _1930 = _1928;
    if (_1830)
    {
        float _1932 = _1818 * _1916;
        _1842 = _1932;
    }
    float _1934 = _1842;
    float _1936 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1920);
    if (_1830)
    {
        float _1938 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1858 = _1938;
    }
    float _1940 = _1858;
    if (!_1830)
    {
        _1930 = _1820;
    }
    float _1942 = _1930;
    float _1944 = _1942;
    if (_1830)
    {
        float _1946 = _1820 * _1916;
        _1944 = _1946;
    }
    float _1948 = _1944;
    if (_1830)
    {
        float _1950 = _1934 * _1934;
        _1922 = _1950;
    }
    float _1952 = _1922;
    if (_1830)
    {
        float _1954 = fma(_1892, _1886, _1940);
        _1912 = _1954;
    }
    float _1956 = _1912;
    if (!_1830)
    {
        _1924 = _1824;
    }
    float _1958 = _1924;
    float _1960 = _1958;
    if (_1830)
    {
        float _1962 = _1948 * _1948;
        _1960 = _1962;
    }
    float _1964 = _1960;
    float _1966 = fma(_1956, _1956, _1952);
    float _1968 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1936);
    float _1970 = _1966 + _1964;
    float _1972 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1976 = fma(_1898, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1974);
    float _1978 = precise::clamp(_1976, 0.0, 1.0);
    float _1980 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1982 = rsqrt(_1970);
    float _1984 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1972);
    float _1986 = -_1978;
    float _1988 = _1986 + 1.0;
    float _1990 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1980);
    float _1992 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1984);
    float _1994 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1996 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1990);
    float _1998 = abs(_1988);
    float _2000 = log2(_1998);
    float _2002 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2004 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1994);
    float _2006 = _1996 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2008 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2010 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2004);
    float _2012 = _1982 * _1934;
    float _2014 = -_2008;
    float _2016 = fma(_2014, _1876, 1.0);
    float _2018 = _2010 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2020 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2022 = _1982 * _1956;
    float _2024 = _2012 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2026 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2028 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2020);
    float _2030 = _1982 * _1948;
    float _2032 = -_2024;
    float _2034 = fma(_2022, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2032);
    float _2036 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2038 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2028);
    float _2040 = log2(_2016);
    float _2042 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2044 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2038);
    float _2046 = -_2030;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2034);
    float _2050 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2052 = exp2(_2036);
    float _2054 = fma(_2048, -0.5, 0.5);
    float _2056 = fma(_2048, 0.5, 0.5);
    float _2058 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2050);
    float _2060 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2042);
    float _2062 = _2022 + 1.0;
    float _2064 = fma(_2056, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2066 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2058);
    float _2068 = 1.0 / _2044;
    float _2070 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2060);
    float _2072 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2066);
    float _2074 = sqrt(_2054);
    float _2076 = -_2022;
    float _2078 = fma(_2052, _2062, _2076);
    float _2080 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2070);
    float _2082 = fma(_2056, _2064, -0.212114393711090087890625);
    float _2084 = _2040 * 0.693147182464599609375;
    float _2086 = fma(_2056, _2082, 1.570728778839111328125);
    float _2088 = _2072 * _2068;
    float _2090 = _2080 * _2068;
    float _2092 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2094 = fma(_2088, 0.5, 0.5);
    float _2096 = fma(_2090, -0.5, 0.5);
    float _2098 = fma(_2078, 0.5, 0.5);
    float _2100 = _2074 * 0.636619746685028076171875;
    float _2102 = -_2086;
    float _2104 = fma(_2100, _2102, 1.0);
    float3 _6019 = float3(_2094, _2096, _2092);
    float _2106 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6019, float3(0.0), isnan(_6019)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6019, float3(0.0), isnan(_6019)), level(0.0)).x;
    float3 _6030 = float3(_2094, _2096, _2092);
    float4 _2109 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6030, float3(0.0), isnan(_6030)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6030, float3(0.0), isnan(_6030)), level(0.0)).xyzw;
    float _2111 = _2109.x;
    float _2113 = _2109.y;
    float _2115 = _2109.z;
    float _2117 = _2109.w;
    float2 _6047 = float2(_2104, _2098);
    float3 _2121 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6047, float2(0.0), isnan(_6047)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6047, float2(0.0), isnan(_6047)), level(0.0)).xyz;
    float _2123 = _2121.x;
    float _2125 = _2121.y;
    float _2127 = _2121.z;
    float _2129 = in.m_61.w;
    float _2131 = _120 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2133 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _2133;
    float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2139 = _2137 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2143 = _2141 != 0;
    float _2145 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2147 = _1534 + _2145;
    float _2149 = 1.0 / _2135;
    float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2153 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _2151;
    bool _2155 = _120 > 0.5;
    bool _2157 = _2155 && _2143;
    float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2161 = _2159 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2163 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2165 = _1534 + _2163;
    float _2167 = 1.0 / _2139;
    float _2169 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2171 = _122 > 0.5;
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2175 = _1534 + _2173;
    int _2177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2179 = _2177 != 0;
    float _2181 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2183 = -_2169;
    float _2185 = fma(_2131, 2.0, _2183);
    float _2187 = 1.0 / _2153;
    float _2189 = in.m_63.y;
    float _2191 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2181);
    float _2193 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2195 = _2193 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2197 = _2147 * _2149;
    out.m_65.w = _2129;
    float _2199 = _122 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2201 = 1.0 / _2161;
    float _2203 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2205 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _2203;
    float _2207 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2211 = _1534 + _2209;
    float _2213 = in.m_63.x;
    float _2215 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2217 = _2211 * _2167;
    float _2219 = 1.0 / _2195;
    float _2221 = fma(_2199, -2.0, _2207);
    float _2223 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2215);
    float _2225 = _2175 * _2187;
    float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2229 = _1534 + _2227;
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _2231;
    float _2235 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2223);
    float _2237 = 1.0 / _2205;
    float _2239 = -_2189;
    float _2241 = _2239 + 1.0;
    float _2243 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2245 = _1534 + _2243;
    float _2247 = -_136;
    float _2249 = fma(_2247, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2185);
    float _2251 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2221);
    float _2253 = _2245 * _2201;
    int _2255 = _2171 ? as_type<int>(_2241) : as_type<int>(_2189);
    float _2257 = _2165 * _2219;
    float _2259 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2261 = _1534 + _2259;
    out.m_67.w = _2189;
    float _2263 = _2179 ? as_type<float>(_2255) : _2189;
    float _2265 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _2265;
    float _2269 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2271 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2269;
    float _2273 = _2229 * _2237;
    float _2275 = 1.0 / _2267;
    bool _2277 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2279 = isnan(_1534);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2285 = _2281 || _2283;
    float _2287 = float(_2285);
    float _2289 = fma(_2271, _2197, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2291 = fma(_2233, _2197, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _2293 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2295 = _2293 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2297 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _2297;
    float _2301 = 0.0;
    float _2303 = _2213;
    if (_2143)
    {
        _2301 = _2213;
    }
    float _2305 = _2301;
    float _2307 = fma(_2295, _2217, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2309 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2191);
    float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _2313 = _2311 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2315 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2315;
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2321 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _2319;
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2325 = _2323 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2327 = fma(_2313, _2217, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _2331 = _2329 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    bool _2333 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2335 = isnan(_1534);
    bool _2337 = _2333 || _2335;
    bool _2339 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2341 = _2337 || _2339;
    float _2343 = float(_2341);
    float _2345 = _2261 * _2275;
    float _2347 = fma(_2325, _2253, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2349 = fma(_2317, _2225, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2351 = fma(_2331, _2253, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    bool _2353 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2355 = isnan(_1534);
    bool _2357 = _2353 || _2355;
    bool _2359 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2361 = _2357 || _2359;
    float _2363 = float(_2361);
    float _2365 = -_2343;
    float _2367 = _2365 + 1.0;
    float _2369 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2369;
    float _2373 = fma(_2321, _2225, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    bool _2375 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2377 = isnan(_1534);
    bool _2379 = _2375 || _2377;
    bool _2381 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2383 = _2379 || _2381;
    float _2385 = float(_2383);
    float _2387 = _2363 * _2367;
    float _2389 = fma(_2371, _2273, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2391 = -_2363;
    float _2393 = _2391 + 1.0;
    float _2395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2397 = -_2385;
    float _2399 = _2397 + 1.0;
    float _2401 = fma(_2299, _2273, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _2403 = _2385 * _2393;
    float _2405 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2407 = _2405 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2409 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2411 = isnan(_1534);
    bool _2413 = _2409 || _2411;
    bool _2415 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2417 = _2413 || _2415;
    float _2419 = float(_2417);
    float _2421 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2423 = _2421 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2425 = _2287 * _2399;
    float _2427 = _2305;
    if (_2157)
    {
        float _2429 = -_2305;
        float _2431 = _2429 + 1.0;
        _2427 = _2431;
    }
    float _2433 = _2427;
    float _2435 = -_2287;
    float _2437 = _2435 + 1.0;
    float _2439 = fma(_2407, _2257, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2441 = fma(_2423, _2257, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _2443 = _1538 != 0.0;
    bool _2445 = isnan(_1538);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan(0.0);
    bool _2451 = _2447 || _2449;
    float _2453 = _2419 * _2437;
    if (_2143)
    {
        _2303 = _2433;
    }
    float _2455 = _2303;
    float _2457 = -_2419;
    float _2459 = _2457 + 1.0;
    float _2461 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2463 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2465 = isnan(_1534);
    bool _2467 = _2463 || _2465;
    bool _2469 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2471 = _2467 || _2469;
    float _2473 = float(_2471);
    float _2475 = in.m_69.x;
    float _2477 = in.m_69.y;
    float _2479 = in.m_69.z;
    bool _2481 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2483 = isnan(_1534);
    bool _2485 = _2481 || _2483;
    bool _2487 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2489 = _2485 || _2487;
    float _2491 = float(_2489);
    float _2493 = fma(_2263, _2461, -0.5);
    bool _2495 = _1536 == 0.0;
    bool _2497 = !_2451;
    bool _2499 = _2495 && _2497;
    float _2501 = -_2473;
    float _2503 = _2501 + 1.0;
    float _2505 = _2473 * _2459;
    bool _2507 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2509 = isnan(_1534);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2515 = _2511 || _2513;
    float _2517 = float(_2515);
    float _2519 = -_2251;
    float _2521 = fma(_2235, _2493, _2519);
    float _2523 = _2491 * _2503;
    float _2525 = -_2491;
    float _2527 = _2525 + 1.0;
    bool _2529 = _1540 == 0.0;
    bool _2531 = _2529 && _2499;
    float _2533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2535 = _2517 * _2527;
    float _2537 = -_2517;
    float _2539 = _2537 + 1.0;
    out.m_71.x = _1728;
    out.m_71.y = _1726;
    out.m_71.z = _1730;
    float _2541 = _2289 * _2535;
    float _2543 = _2291 * _2535;
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2547 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2545;
    float _2549 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2551 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2549;
    float _2553 = fma(_2539, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2541);
    float _2555 = fma(_2539, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2543);
    float _2557 = fma(_2547, _2345, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2559 = _2477;
    float _2561 = _2475;
    float _2563 = _2479;
    if (!_2531)
    {
        float _2565 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2477);
        _2559 = _2565;
    }
    float _2567 = _2559;
    float _2569 = fma(_2307, _2523, _2553);
    float _2571 = fma(_2327, _2523, _2555);
    if (!_2531)
    {
        float _2573 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2475);
        _2561 = _2573;
    }
    float _2575 = _2561;
    float _2577 = _2567 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2579 = fma(_2349, _2505, _2569);
    float _2581 = _2567 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2583 = _2567 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (!_2531)
    {
        float _2585 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2479);
        _2563 = _2585;
    }
    float _2587 = _2563;
    float _2589 = fma(_2575, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2577);
    float _2591 = fma(_2347, _2453, _2579);
    float _2593 = fma(_2575, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2581);
    float _2595 = fma(_2575, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2583);
    float _2597 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2589);
    float _2599 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2601 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2603 = fma(_2373, _2505, _2571);
    float _2605 = fma(_2389, _2425, _2591);
    float _2607 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2599);
    float _2609 = _2533 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2611 = exp2(_2601);
    float _2613 = fma(_2351, _2453, _2603);
    float _2615 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2607);
    float _2617 = fma(_2551, _2345, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2619 = fma(_2439, _2403, _2605);
    float _2621 = fma(_2401, _2425, _2613);
    float _2623 = fma(_2609, _2455, -0.5);
    float _2625 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2615);
    bool _2627 = _1794 > 0.0;
    bool _2629 = isnan(_1794);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan(0.0);
    bool _2635 = _2631 || _2633;
    float _2637 = fma(_2441, _2403, _2621);
    float _2639 = _2044 * 0.5;
    float _2641 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2593);
    float _2643 = fma(_2557, _2387, _2619);
    float _2645 = fma(_2617, _2387, _2637);
    float _2647 = fma(_2080, -0.5, _2639);
    float _2649 = fma(_2309, _2623, _2249);
    float _2651 = -_2611;
    float _2653 = _2651 + 1.0;
    float _2655 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2657 = _2625 + _2044;
    float _2659 = _2072 + _2044;
    float _2661 = _2653 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2663 = fma(_2343, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2643);
    float _2665 = fma(_2343, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2645);
    float _2667 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2595);
    float _2669 = -_2661;
    float _2671 = _2669 + 1.0;
    float _2673 = _2521 + 0.5;
    float _2675 = _2649 + 0.5;
    float _2677 = _2657 * 0.5;
    float _2679 = _2659 * 0.5;
    float _2681 = _2655 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.y = _2673;
    out.m_73.x = _2597;
    out.m_73.y = _2641;
    out.m_73.z = _2667;
    out.m_67.x = _2675;
    out.m_75.x = _2663;
    out.m_75.y = _2665;
    out.gl_Position.x = _2072;
    out.gl_Position.y = _2080;
    out.gl_Position.z = _2625;
    out.gl_Position.w = _2044;
    out.m_77.x = _2679;
    out.m_77.y = _2647;
    out.m_77.z = _2677;
    out.m_77.w = _2044;
    out.m_45.x = _2681;
    float _2683 = _2661 * _2106;
    float _2685 = _2117 * _2671;
    float _2687 = _2117 * _2683;
    float _2689 = _2127 * _2683;
    float _2691 = fma(_2123, _2687, _2111);
    float _2693 = fma(_2125, _2687, _2113);
    float _2695 = fma(_2117, _2689, _2115);
    out.m_79.x = _2691;
    out.m_79.y = _2693;
    out.m_79.z = _2695;
    out.m_79.w = _2685;
    if (_2635)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2697 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2697;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1526 = false;
    bool _1308 = false;
    bool _1088 = false;
    bool _910 = false;
    bool _624 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2754 = as_type<float>(_114);
        out.gl_Position.z = _2754;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_47.w;
    float _120 = in.m_49.x;
    float _122 = in.m_49.y;
    bool _124 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_118);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_118;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.x = _120;
    out.m_51.y = _122;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_98);
        _138 = _140;
    }
    float _142 = _138;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    if (_148)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _108;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _116 = as_type<int>(_152);
    }
    int _154 = _116;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2830 = as_type<float>(_154);
        out.gl_Position.z = _2830;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = in.m_53.w;
    float _158 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _156, _176);
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    bool _278 = !_258;
    float _294;
    if (!_278)
    {
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _282 = _120 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_98);
        float _300 = 1.0 / _298;
        float _302 = _136 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _308 = _304 + _306;
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
    float _332 = 1.0 / _320;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _336 = _304 + _334;
    bool _338 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _340 = isnan(_304);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    bool _350 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _352 = isnan(_304);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -_348;
    float _364 = _362 + 1.0;
    float _366 = 1.0 / _316;
    float _368 = _336 * _326;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _372 = _304 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _380 = fma(_376, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _382 = 1.0 / _324;
    float _384 = _372 * _332;
    bool _386 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _388 = isnan(_304);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _400 = _304 + _398;
    bool _402 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _404 = isnan(_304);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = 1.0 / _330;
    float _416 = _308 * _366;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _420 = _304 + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _422;
    float _426 = -_412;
    float _428 = _426 + 1.0;
    float _430 = fma(_424, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _432 = _400 * _382;
    float _434 = -_396;
    float _436 = _434 + 1.0;
    float _438 = _412 * _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _440;
    float _444 = _420 * _414;
    bool _446 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _448 = isnan(_304);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = fma(_442, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _460 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _462 = isnan(_304);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = _456 * _428;
    float _474 = -_456;
    float _476 = _474 + 1.0;
    float _478 = _470 * _364;
    float _480 = -_470;
    float _482 = _480 + 1.0;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _488 = _348 * _476;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _498 = _360 * _482;
    float _500 = fma(_486, _416, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _502 = fma(_492, _416, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _504 = fma(_496, _416, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _506 = _458 * _498;
    float _508 = -_360;
    float _510 = _508 + 1.0;
    float _512 = _380 * _498;
    float _514 = _430 * _498;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _520;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _524;
    float _528 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].x, _506);
    float _530 = fma(_518, _384, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _532 = fma(_522, _384, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _534 = fma(_526, _384, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _540 = fma(_502, _478, _528);
    float _542 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].y, _512);
    float _544 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[143].z, _514);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _550 = fma(_538, _432, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _552 = fma(_532, _488, _540);
    float _554 = fma(_504, _478, _542);
    float _556 = fma(_548, _432, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _558 = fma(_500, _478, _544);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _564 = fma(_530, _488, _554);
    float _566 = fma(_534, _488, _558);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _568;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _572;
    float _576 = fma(_562, _432, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _578;
    float _582 = fma(_550, _472, _552);
    float _584 = fma(_570, _444, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _586 = fma(_574, _444, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _588 = fma(_580, _444, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _590 = fma(_556, _472, _564);
    float _592 = fma(_576, _472, _566);
    float _594 = fma(_584, _438, _582);
    float _596 = fma(_586, _438, _590);
    float _598 = fma(_588, _438, _592);
    float _600 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[148].x, _594);
    float _602 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[148].y, _596);
    float _604 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[148].z, _598);
    bool _606 = !_378;
    float _622;
    if (!_606)
    {
        float _608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _610 = _120 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[11].x, _136);
        float _614 = _612 * _608;
        float _616 = floor(_614);
        float _618 = -_616;
        float _620 = _614 + _618;
        _622 = _620;
        _624 = true;
    }
    else
    {
        float _626 = float(_98);
        float _628 = 1.0 / _626;
        float _630 = _136 * _628;
        _622 = _630;
    }
    _624 = false;
    float _632 = _622;
    float _634 = in.m_53.x;
    float _636 = in.m_53.y;
    float _638 = in.m_53.z;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _642 = _632 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _646 = _632 + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _664 = 1.0 / _650;
    bool _666 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _668 = isnan(_632);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = 1.0 / _654;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _682 = _632 + _680;
    float _684 = 1.0 / _658;
    float _686 = _602 * _636;
    float _688 = _682 * _664;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _692 = _632 + _690;
    bool _694 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _696 = isnan(_632);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = _604 * _638;
    bool _708 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _710 = isnan(_632);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = _600 * _634;
    float _722 = 1.0 / _662;
    float _724 = _692 * _678;
    float _726 = -_704;
    float _728 = _726 + 1.0;
    bool _730 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _732 = _718 * _728;
    float _734 = -_718;
    float _736 = _734 + 1.0;
    float _738 = _642 * _684;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _752 = fma(_742, _688, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _754 = fma(_746, _688, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _756 = fma(_750, _724, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _758 = _646 * _722;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _760;
    bool _764 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _766 = isnan(_632);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = fma(_762, _688, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _778 = _632 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _780 = isnan(_632);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = -_774;
    float _792 = _790 + 1.0;
    float _794 = _774 * _736;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _804 = _788 * _792;
    float _806 = -_788;
    float _808 = _806 + 1.0;
    float _810 = fma(_798, _724, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _812 = fma(_802, _724, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _814 = _676 * _808;
    float _816 = -_676;
    float _818 = _816 + 1.0;
    float _820 = _752 * _814;
    float _822 = _754 * _814;
    float _824 = _776 * _814;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _826;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _830;
    float _834 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[107].x, _820);
    float _836 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[107].y, _822);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _838;
    float _842 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[107].z, _824);
    float _844 = fma(_828, _738, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _846 = fma(_832, _738, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _848 = fma(_810, _804, _836);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _858 = fma(_840, _738, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _860 = fma(_812, _804, _834);
    float _862 = fma(_756, _804, _842);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _868 = fma(_852, _758, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _870 = fma(_856, _758, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _872 = fma(_844, _794, _860);
    float _874 = fma(_866, _758, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _876 = fma(_858, _794, _848);
    float _878 = fma(_846, _794, _862);
    float _880 = fma(_868, _732, _872);
    float _882 = fma(_870, _732, _876);
    float _884 = fma(_874, _732, _878);
    float _886 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[111].x, _880);
    float _888 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[111].y, _882);
    float _890 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[111].z, _884);
    bool _892 = !_730;
    float _908;
    if (!_892)
    {
        float _894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _896 = _120 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _898 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _900 = _898 * _894;
        float _902 = floor(_900);
        float _904 = -_902;
        float _906 = _900 + _904;
        _908 = _906;
        _910 = true;
    }
    else
    {
        float _912 = float(_98);
        float _914 = 1.0 / _912;
        float _916 = _136 * _914;
        _908 = _916;
    }
    _910 = false;
    float _918 = _908;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _922 = _918 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _928 = _918 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _930 = isnan(_918);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _948 = _918 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _950 = isnan(_918);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = 1.0 / _926;
    float _962 = -_938;
    float _964 = _962 + 1.0;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _966;
    bool _970 = _918 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _972 = isnan(_918);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = _958 * _964;
    float _984 = -_958;
    float _986 = _984 + 1.0;
    bool _988 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _990 = 1.0 / _942;
    float _992 = _980 * _986;
    float _994 = -_980;
    float _996 = _994 + 1.0;
    float _998 = 1.0 / _946;
    float _1000 = _968 * _960;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1006 = fma(_1000, _922, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1008 = _1004 * _990;
    bool _1010 = _918 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1012 = isnan(_918);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1022;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1028 = _918 + _1026;
    float _1030 = _1006 * _992;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1034 = _918 + _1032;
    float _1036 = -_1020;
    float _1038 = _1036 + 1.0;
    float _1040 = fma(_1008, _1028, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1042 = _1024 * _998;
    float _1044 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1030);
    float _1046 = _938 * _1038;
    float _1048 = _886 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1050 = fma(_1042, _1034, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1052 = fma(_1040, _982, _1044);
    float _1054 = _890 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = fma(_1050, _1046, _1052);
    float _1060 = _888 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1062 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1064 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1058);
    float _1066 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1068 = _1064 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _1056;
    out.m_55.y = _1066;
    out.m_55.z = _1062;
    out.m_55.w = _1068;
    bool _1070 = !_988;
    float _1086;
    if (!_1070)
    {
        float _1072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1074 = _120 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[11].z, _136);
        float _1078 = _1076 * _1072;
        float _1080 = floor(_1078);
        float _1082 = -_1080;
        float _1084 = _1078 + _1082;
        _1086 = _1084;
        _1088 = true;
    }
    else
    {
        float _1090 = float(_98);
        float _1092 = 1.0 / _1090;
        float _1094 = _136 * _1092;
        _1086 = _1094;
    }
    _1088 = false;
    float _1096 = _1086;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1100 = _1096 + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1104 = _1096 + _1102;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1108 = _1096 + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1118;
    float _1122 = 1.0 / _1112;
    bool _1124 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1126 = 1.0 / _1120;
    float _1128 = 1.0 / _1116;
    float _1130 = _1100 * _1122;
    bool _1132 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1134 = isnan(_1096);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1144;
    float _1148 = -_1142;
    float _1150 = _1148 + 1.0;
    float _1152 = _1104 * _1126;
    bool _1154 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1156 = isnan(_1096);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = fma(_1146, _1130, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1168 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1170 = isnan(_1096);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1176 = _1172 || _1174;
    float _1178 = float(_1176);
    float _1180 = _1164 * _1150;
    bool _1182 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1184 = isnan(_1096);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = _1108 * _1128;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1200;
    float _1204 = -_1178;
    float _1206 = _1204 + 1.0;
    float _1208 = -_1164;
    float _1210 = _1208 + 1.0;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1216 = fma(_1198, _1130, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1218 = fma(_1202, _1130, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1220 = _1192 * _1206;
    float _1222 = _1178 * _1210;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1230 = _1228 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1232 = _1218 * _1220;
    float _1234 = _1166 * _1220;
    float _1236 = _1216 * _1220;
    float _1238 = -_1192;
    float _1240 = _1238 + 1.0;
    float _1242 = fma(_1214, _1194, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1244 = fma(_1226, _1194, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1246 = fma(_1230, _1194, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1248 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1234);
    float _1250 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1236);
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1256;
    float _1260 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1232);
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1262;
    float _1266 = fma(_1242, _1222, _1248);
    float _1268 = fma(_1254, _1152, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1270 = fma(_1258, _1152, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1272 = fma(_1244, _1222, _1250);
    float _1274 = fma(_1264, _1152, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1276 = fma(_1246, _1222, _1260);
    float _1278 = fma(_1268, _1180, _1266);
    float _1280 = fma(_1270, _1180, _1272);
    float _1282 = fma(_1274, _1180, _1276);
    float _1284 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1278);
    float _1286 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1280);
    float _1288 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1282);
    bool _1290 = !_1124;
    float _1306;
    if (!_1290)
    {
        float _1292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1294 = _120 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1296 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
        float _1298 = _1296 * _1292;
        float _1300 = floor(_1298);
        float _1302 = -_1300;
        float _1304 = _1298 + _1302;
        _1306 = _1304;
        _1308 = true;
    }
    else
    {
        float _1310 = float(_98);
        float _1312 = 1.0 / _1310;
        float _1314 = _136 * _1312;
        _1306 = _1314;
    }
    _1308 = false;
    float _1316 = _1306;
    float _1318 = _1284 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1320 = _1286 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1324 = _1322 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1328 = _1326 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1330 = 1.0 / _1324;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1336;
    bool _1340 = _1316 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1342 = isnan(_1316);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1348 = _1344 || _1346;
    float _1350 = float(_1348);
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1356 = _1316 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1358 = isnan(_1316);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    float _1368 = _1288 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1370 = 1.0 / _1328;
    bool _1372 = _1316 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1374 = isnan(_1316);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    float _1384 = -_1366;
    float _1386 = _1384 + 1.0;
    bool _1388 = _1316 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1390 = isnan(_1316);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1396 = _1392 || _1394;
    float _1398 = float(_1396);
    bool _1400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1402 = _1350 * _1386;
    float _1404 = 1.0 / _1334;
    float _1406 = _1338 * _1330;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1410 = _1316 + _1408;
    float _1412 = fma(_1406, _1410, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1414 = -_1350;
    float _1416 = _1414 + 1.0;
    float _1418 = 1.0 / _1354;
    float _1420 = -_1382;
    float _1422 = _1420 + 1.0;
    float _1424 = _1382 * _1416;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1434 = _1398 * _1422;
    float _1436 = -_1398;
    float _1438 = _1436 + 1.0;
    float _1440 = _1428 * _1370;
    float _1442 = _1432 * _1404;
    float _1444 = _1412 * _1434;
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1448 = _1316 + _1446;
    bool _1450 = _1316 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1452 = isnan(_1316);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1458 = _1454 || _1456;
    float _1460 = float(_1458);
    float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1464 = _1462 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1468 = _1316 + _1466;
    float _1470 = fma(_1442, _1448, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1472 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1444);
    float _1474 = _1464 * _1418;
    float _1476 = fma(_1440, _1468, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1478 = -_1460;
    float _1480 = _1478 + 1.0;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1484 = _1316 + _1482;
    float _1486 = fma(_1470, _1424, _1472);
    float _1488 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1490 = _1366 * _1480;
    float _1492 = fma(_1474, _1484, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1494 = fma(_1476, _1402, _1486);
    float _1496 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1498 = fma(_1492, _1490, _1494);
    float _1500 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1498);
    float _1504 = _1502 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_57.x = _1488;
    out.m_57.y = _1500;
    out.m_57.z = _1496;
    out.m_57.w = _1504;
    bool _1506 = !_1400;
    float _1508 = _1404;
    float _1524;
    if (!_1506)
    {
        float _1510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1512 = _120 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1514 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[14].x, _136);
        float _1516 = _1514 * _1510;
        float _1518 = floor(_1516);
        float _1520 = -_1518;
        float _1522 = _1516 + _1520;
        _1524 = _1522;
        _1526 = true;
    }
    else
    {
        float _1528 = float(_98);
        float _1530 = 1.0 / _1528;
        float _1532 = _136 * _1530;
        _1524 = _1532;
    }
    _1526 = false;
    float _1534 = _1524;
    float _1536 = in.m_59.x;
    float _1538 = in.m_59.y;
    float _1540 = in.m_59.z;
    float _1542 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1544 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1546 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1548 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1550 = isnan(0.5);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1556 = _1552 || _1554;
    float _1558 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1536);
    float _1560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1538);
    float _1562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1540);
    float _1564 = _1558 * _1542;
    float _1566 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1568 = _1560 * _1544;
    float _1570 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1572 = _1562 * _1546;
    float _1574 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1566);
    float _1576 = _1568 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1578 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1570);
    float _1580 = _1568 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1582 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1574);
    float _1584 = fma(_1564, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1576);
    float _1586 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1588 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1578);
    float _1590 = _1582 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1592 = fma(_1564, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1580);
    float _1594 = fma(_1572, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1584);
    float _1596 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1586);
    float _1598 = _1588 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1600 = fma(_1572, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1592);
    float _1602 = _1590 + _1594;
    float _1604 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1596);
    float _1606 = _1598 + _1600;
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1610 = _1602 + _1608;
    float _1612 = _1604 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1614 = _1600;
    float _1616 = _1564;
    float _1618 = _1572;
    float _1620 = _1568;
    if (_1556)
    {
        _1614 = 1.0;
    }
    float _1622 = _1614;
    float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1626 = _1606 + _1624;
    float _1628 = _1610 * _1610;
    float _1630 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1632 = fma(_1626, _1626, _1628);
    float _1634 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1630);
    float _1636 = sqrt(_1632);
    float _1638 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1634);
    float _1640 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1642 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1644 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1640);
    float _1646 = 1.0 / _1642;
    float _1648 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1644);
    float _1650 = _1568 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1652 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1654 = fma(_1564, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1650);
    bool _1656 = _1636 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1658 = _1652 + _1642;
    float _1660 = fma(_1572, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1654);
    float _1662 = _1612 + _1660;
    float _1664 = _1658 * _1646;
    float _1666 = _1664 * 0.5;
    float _1668 = _1660;
    float _1670 = _1662;
    float _1672 = _1622;
    float _1674 = _1646;
    if (!_1656)
    {
        _1616 = _1606;
    }
    float _1676 = _1616;
    float _1678 = _1676;
    if (!_1656)
    {
        _1618 = _1602;
    }
    float _1680 = _1618;
    float _1682 = _1680;
    if (!_1656)
    {
        _1668 = _1662;
    }
    float _1684 = _1668;
    bool _1686 = !_1656;
    float _1688 = _1684;
    if (!_1686)
    {
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1694 = _1636 + _1692;
        float _1696 = _1662 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1698 = rsqrt(_1632);
        float _1700 = _1694 * _1690;
        float _1702 = _1700 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = cos(_1704);
        float _1708 = _1702 * 6.283185482025146484375;
        float _1710 = sin(_1708);
        float _1712 = _1706 + (-1.0);
        float _1714 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = fma(_1710, _1696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1718 = fma(_1662, _1706, _1714);
        float _1720 = _1698 * _1716;
        float _1722 = fma(_1626, _1720, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1724 = fma(_1610, _1720, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1688 = _1718;
        _1678 = _1722;
        _1682 = _1724;
    }
    float _1726 = _1688;
    float _1728 = _1678;
    float _1730 = _1682;
    if (!_1556)
    {
        float _1732 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1734 = _1732 * 0.15915493667125701904296875;
        float _1736 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1740 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1738);
        float _1742 = _1734 * 6.283185482025146484375;
        float _1744 = cos(_1742);
        float _1746 = _1736 * 0.15915493667125701904296875;
        float _1748 = _1734 * 6.283185482025146484375;
        float _1750 = sin(_1748);
        float _1752 = 1.0 / _1744;
        float _1754 = _1746 * 6.283185482025146484375;
        float _1756 = cos(_1754);
        float _1758 = _1750 * _1752;
        float _1760 = _1746 * 6.283185482025146484375;
        float _1762 = sin(_1760);
        float _1764 = _1756 * _1758;
        float _1766 = 1.0 / _1740;
        float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1770 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1768;
        float _1772 = 1.0 / _1764;
        float _1774 = 1.0 / _1770;
        float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1778 = _1766 * _1776;
        float _1780 = _1762 * _1772;
        float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1784 = fma(_1780, _1778, _1782);
        float _1786 = _1784 * _1774;
        float _1788 = precise::clamp(_1786, 0.0, 1.0);
        _1670 = _1746;
        _1620 = _1766;
        _1672 = _1788;
    }
    float _1790 = _1670;
    float _1792 = _1620;
    float _1794 = _1672;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1798 = _1726 + _1796;
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1802 = _1728 + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1806 = _1730 + _1804;
    float _1808 = _1798 * _1798;
    float _1810 = fma(_1802, _1802, _1808);
    float _1812 = fma(_1806, _1806, _1810);
    float _1814 = rsqrt(_1812);
    float _1816 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1818 = _1802 * _1816;
    float _1820 = _1806 * _1816;
    float _1822 = _1818 * _1818;
    float _1824 = _1820 * _1820;
    float _1826 = _1822 + _1824;
    float _1828 = sqrt(_1826);
    bool _1830 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1834 = _1828 + _1832;
    float _1836 = _1790;
    float _1838 = _1834;
    float _1840 = _1798;
    float _1842 = _1818;
    if (_1830)
    {
        float _1844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1836 = _1844;
    }
    float _1846 = _1836;
    float _1848 = _1846;
    if (_1830)
    {
        float _1850 = _1834 * _1846;
        _1838 = _1850;
    }
    float _1852 = _1838;
    if (_1830)
    {
        float _1854 = rsqrt(_1826);
        _1848 = _1854;
    }
    float _1856 = _1848;
    float _1858 = _1856;
    if (_1830)
    {
        float _1860 = _1852 * 0.15915493667125701904296875;
        _1674 = _1860;
    }
    float _1862 = _1674;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1866 = _1806;
    if (_1830)
    {
        float _1868 = _1862 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        _1866 = _1870;
    }
    float _1872 = _1866;
    float _1874 = precise::max(0.0, _1864);
    float _1876 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1878 = _1792;
    float _1880 = _1874;
    if (_1830)
    {
        float _1882 = _1862 * 6.283185482025146484375;
        float _1884 = cos(_1882);
        _1878 = _1884;
    }
    float _1886 = _1878;
    float _1888 = -_1816;
    float _1890 = -_1874;
    float _1892 = fma(_1798, _1888, _1890);
    if (_1830)
    {
        float _1894 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1840 = _1894;
    }
    float _1896 = _1840;
    float _1898 = sqrt(_1812);
    float _1900 = _1872;
    float _1902 = _1896;
    if (_1830)
    {
        float _1904 = fma(_1872, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1900 = _1904;
    }
    float _1906 = _1900;
    float _1908 = _1906;
    if (!_1830)
    {
        _1902 = _1892;
    }
    float _1910 = _1902;
    float _1912 = _1910;
    if (_1830)
    {
        float _1914 = _1856 * _1906;
        _1508 = _1914;
    }
    float _1916 = _1508;
    if (!_1830)
    {
        _1908 = _1822;
    }
    float _1918 = _1908;
    float _1920 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1922 = _1918;
    float _1924 = _1886;
    if (_1830)
    {
        float _1926 = _1886 + (-1.0);
        _1880 = _1926;
    }
    float _1928 = _1880;
    float _1930 = _1928;
    if (_1830)
    {
        float _1932 = _1818 * _1916;
        _1842 = _1932;
    }
    float _1934 = _1842;
    float _1936 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1920);
    if (_1830)
    {
        float _1938 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1858 = _1938;
    }
    float _1940 = _1858;
    if (!_1830)
    {
        _1930 = _1820;
    }
    float _1942 = _1930;
    float _1944 = _1942;
    if (_1830)
    {
        float _1946 = _1820 * _1916;
        _1944 = _1946;
    }
    float _1948 = _1944;
    if (_1830)
    {
        float _1950 = _1934 * _1934;
        _1922 = _1950;
    }
    float _1952 = _1922;
    if (_1830)
    {
        float _1954 = fma(_1892, _1886, _1940);
        _1912 = _1954;
    }
    float _1956 = _1912;
    if (!_1830)
    {
        _1924 = _1824;
    }
    float _1958 = _1924;
    float _1960 = _1958;
    if (_1830)
    {
        float _1962 = _1948 * _1948;
        _1960 = _1962;
    }
    float _1964 = _1960;
    float _1966 = fma(_1956, _1956, _1952);
    float _1968 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1936);
    float _1970 = _1966 + _1964;
    float _1972 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1974 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1976 = fma(_1898, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1974);
    float _1978 = precise::clamp(_1976, 0.0, 1.0);
    float _1980 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1982 = rsqrt(_1970);
    float _1984 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1972);
    float _1986 = -_1978;
    float _1988 = _1986 + 1.0;
    float _1990 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1980);
    float _1992 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1984);
    float _1994 = _1726 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1996 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1990);
    float _1998 = abs(_1988);
    float _2000 = log2(_1998);
    float _2002 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2004 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1994);
    float _2006 = _1996 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2008 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2010 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2004);
    float _2012 = _1982 * _1934;
    float _2014 = -_2008;
    float _2016 = fma(_2014, _1876, 1.0);
    float _2018 = _2010 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2020 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2022 = _1982 * _1956;
    float _2024 = _2012 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2026 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2028 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2020);
    float _2030 = _1982 * _1948;
    float _2032 = -_2024;
    float _2034 = fma(_2022, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2032);
    float _2036 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2038 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2028);
    float _2040 = log2(_2016);
    float _2042 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2044 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2038);
    float _2046 = -_2030;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2034);
    float _2050 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2052 = exp2(_2036);
    float _2054 = fma(_2048, -0.5, 0.5);
    float _2056 = fma(_2048, 0.5, 0.5);
    float _2058 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2050);
    float _2060 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2042);
    float _2062 = _2022 + 1.0;
    float _2064 = fma(_2056, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2066 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2058);
    float _2068 = 1.0 / _2044;
    float _2070 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2060);
    float _2072 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2066);
    float _2074 = sqrt(_2054);
    float _2076 = -_2022;
    float _2078 = fma(_2052, _2062, _2076);
    float _2080 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2070);
    float _2082 = fma(_2056, _2064, -0.212114393711090087890625);
    float _2084 = _2040 * 0.693147182464599609375;
    float _2086 = fma(_2056, _2082, 1.570728778839111328125);
    float _2088 = _2072 * _2068;
    float _2090 = _2080 * _2068;
    float _2092 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2094 = fma(_2088, 0.5, 0.5);
    float _2096 = fma(_2090, -0.5, 0.5);
    float _2098 = fma(_2078, 0.5, 0.5);
    float _2100 = _2074 * 0.636619746685028076171875;
    float _2102 = -_2086;
    float _2104 = fma(_2100, _2102, 1.0);
    float3 _6019 = float3(_2094, _2096, _2092);
    float _2106 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6019, float3(0.0), isnan(_6019)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6019, float3(0.0), isnan(_6019)), level(0.0)).x;
    float3 _6030 = float3(_2094, _2096, _2092);
    float4 _2109 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6030, float3(0.0), isnan(_6030)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6030, float3(0.0), isnan(_6030)), level(0.0)).xyzw;
    float _2111 = _2109.x;
    float _2113 = _2109.y;
    float _2115 = _2109.z;
    float _2117 = _2109.w;
    float2 _6047 = float2(_2104, _2098);
    float3 _2121 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6047, float2(0.0), isnan(_6047)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6047, float2(0.0), isnan(_6047)), level(0.0)).xyz;
    float _2123 = _2121.x;
    float _2125 = _2121.y;
    float _2127 = _2121.z;
    float _2129 = in.m_61.w;
    float _2131 = _120 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2133 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _2133;
    float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2139 = _2137 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2143 = _2141 != 0;
    float _2145 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2147 = _1534 + _2145;
    float _2149 = 1.0 / _2135;
    float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2153 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _2151;
    bool _2155 = _120 > 0.5;
    bool _2157 = _2155 && _2143;
    float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2161 = _2159 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2163 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2165 = _1534 + _2163;
    float _2167 = 1.0 / _2139;
    float _2169 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2171 = _122 > 0.5;
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2175 = _1534 + _2173;
    int _2177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2179 = _2177 != 0;
    float _2181 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2183 = -_2169;
    float _2185 = fma(_2131, 2.0, _2183);
    float _2187 = 1.0 / _2153;
    float _2189 = in.m_63.y;
    float _2191 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2181);
    float _2193 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2195 = _2193 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2197 = _2147 * _2149;
    out.m_65.w = _2129;
    float _2199 = _122 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2201 = 1.0 / _2161;
    float _2203 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2205 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _2203;
    float _2207 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2211 = _1534 + _2209;
    float _2213 = in.m_63.x;
    float _2215 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2217 = _2211 * _2167;
    float _2219 = 1.0 / _2195;
    float _2221 = fma(_2199, -2.0, _2207);
    float _2223 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2215);
    float _2225 = _2175 * _2187;
    float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2229 = _1534 + _2227;
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _2231;
    float _2235 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2223);
    float _2237 = 1.0 / _2205;
    float _2239 = -_2189;
    float _2241 = _2239 + 1.0;
    float _2243 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2245 = _1534 + _2243;
    float _2247 = -_136;
    float _2249 = fma(_2247, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2185);
    float _2251 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2221);
    float _2253 = _2245 * _2201;
    int _2255 = _2171 ? as_type<int>(_2241) : as_type<int>(_2189);
    float _2257 = _2165 * _2219;
    float _2259 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2261 = _1534 + _2259;
    out.m_67.w = _2189;
    float _2263 = _2179 ? as_type<float>(_2255) : _2189;
    float _2265 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2267 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _2265;
    float _2269 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2271 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2269;
    float _2273 = _2229 * _2237;
    float _2275 = 1.0 / _2267;
    bool _2277 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2279 = isnan(_1534);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2285 = _2281 || _2283;
    float _2287 = float(_2285);
    float _2289 = fma(_2271, _2197, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2291 = fma(_2233, _2197, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _2293 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2295 = _2293 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2297 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _2297;
    float _2301 = 0.0;
    float _2303 = _2213;
    if (_2143)
    {
        _2301 = _2213;
    }
    float _2305 = _2301;
    float _2307 = fma(_2295, _2217, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2309 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2191);
    float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _2313 = _2311 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2315 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2315;
    float _2319 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2321 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _2319;
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2325 = _2323 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2327 = fma(_2313, _2217, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _2331 = _2329 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    bool _2333 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2335 = isnan(_1534);
    bool _2337 = _2333 || _2335;
    bool _2339 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2341 = _2337 || _2339;
    float _2343 = float(_2341);
    float _2345 = _2261 * _2275;
    float _2347 = fma(_2325, _2253, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2349 = fma(_2317, _2225, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2351 = fma(_2331, _2253, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    bool _2353 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2355 = isnan(_1534);
    bool _2357 = _2353 || _2355;
    bool _2359 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2361 = _2357 || _2359;
    float _2363 = float(_2361);
    float _2365 = -_2343;
    float _2367 = _2365 + 1.0;
    float _2369 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2369;
    float _2373 = fma(_2321, _2225, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    bool _2375 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2377 = isnan(_1534);
    bool _2379 = _2375 || _2377;
    bool _2381 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2383 = _2379 || _2381;
    float _2385 = float(_2383);
    float _2387 = _2363 * _2367;
    float _2389 = fma(_2371, _2273, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2391 = -_2363;
    float _2393 = _2391 + 1.0;
    float _2395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2397 = -_2385;
    float _2399 = _2397 + 1.0;
    float _2401 = fma(_2299, _2273, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _2403 = _2385 * _2393;
    float _2405 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2407 = _2405 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2409 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2411 = isnan(_1534);
    bool _2413 = _2409 || _2411;
    bool _2415 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2417 = _2413 || _2415;
    float _2419 = float(_2417);
    float _2421 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2423 = _2421 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2425 = _2287 * _2399;
    float _2427 = _2305;
    if (_2157)
    {
        float _2429 = -_2305;
        float _2431 = _2429 + 1.0;
        _2427 = _2431;
    }
    float _2433 = _2427;
    float _2435 = -_2287;
    float _2437 = _2435 + 1.0;
    float _2439 = fma(_2407, _2257, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2441 = fma(_2423, _2257, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _2443 = _1538 != 0.0;
    bool _2445 = isnan(_1538);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan(0.0);
    bool _2451 = _2447 || _2449;
    float _2453 = _2419 * _2437;
    if (_2143)
    {
        _2303 = _2433;
    }
    float _2455 = _2303;
    float _2457 = -_2419;
    float _2459 = _2457 + 1.0;
    float _2461 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2463 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2465 = isnan(_1534);
    bool _2467 = _2463 || _2465;
    bool _2469 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2471 = _2467 || _2469;
    float _2473 = float(_2471);
    float _2475 = in.m_69.x;
    float _2477 = in.m_69.y;
    float _2479 = in.m_69.z;
    bool _2481 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2483 = isnan(_1534);
    bool _2485 = _2481 || _2483;
    bool _2487 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2489 = _2485 || _2487;
    float _2491 = float(_2489);
    float _2493 = fma(_2263, _2461, -0.5);
    bool _2495 = _1536 == 0.0;
    bool _2497 = !_2451;
    bool _2499 = _2495 && _2497;
    float _2501 = -_2473;
    float _2503 = _2501 + 1.0;
    float _2505 = _2473 * _2459;
    bool _2507 = _1534 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2509 = isnan(_1534);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2515 = _2511 || _2513;
    float _2517 = float(_2515);
    float _2519 = -_2251;
    float _2521 = fma(_2235, _2493, _2519);
    float _2523 = _2491 * _2503;
    float _2525 = -_2491;
    float _2527 = _2525 + 1.0;
    bool _2529 = _1540 == 0.0;
    bool _2531 = _2529 && _2499;
    float _2533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2535 = _2517 * _2527;
    float _2537 = -_2517;
    float _2539 = _2537 + 1.0;
    out.m_71.x = _1728;
    out.m_71.y = _1726;
    out.m_71.z = _1730;
    float _2541 = _2289 * _2535;
    float _2543 = _2291 * _2535;
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2547 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2545;
    float _2549 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2551 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2549;
    float _2553 = fma(_2539, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2541);
    float _2555 = fma(_2539, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2543);
    float _2557 = fma(_2547, _2345, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2559 = _2477;
    float _2561 = _2475;
    float _2563 = _2479;
    if (!_2531)
    {
        float _2565 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2477);
        _2559 = _2565;
    }
    float _2567 = _2559;
    float _2569 = fma(_2307, _2523, _2553);
    float _2571 = fma(_2327, _2523, _2555);
    if (!_2531)
    {
        float _2573 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2475);
        _2561 = _2573;
    }
    float _2575 = _2561;
    float _2577 = _2567 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2579 = fma(_2349, _2505, _2569);
    float _2581 = _2567 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2583 = _2567 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (!_2531)
    {
        float _2585 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2479);
        _2563 = _2585;
    }
    float _2587 = _2563;
    float _2589 = fma(_2575, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2577);
    float _2591 = fma(_2347, _2453, _2579);
    float _2593 = fma(_2575, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2581);
    float _2595 = fma(_2575, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2583);
    float _2597 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2589);
    float _2599 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2601 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2603 = fma(_2373, _2505, _2571);
    float _2605 = fma(_2389, _2425, _2591);
    float _2607 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2599);
    float _2609 = _2533 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2611 = exp2(_2601);
    float _2613 = fma(_2351, _2453, _2603);
    float _2615 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2607);
    float _2617 = fma(_2551, _2345, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2619 = fma(_2439, _2403, _2605);
    float _2621 = fma(_2401, _2425, _2613);
    float _2623 = fma(_2609, _2455, -0.5);
    float _2625 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2615);
    bool _2627 = _1794 > 0.0;
    bool _2629 = isnan(_1794);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan(0.0);
    bool _2635 = _2631 || _2633;
    float _2637 = fma(_2441, _2403, _2621);
    float _2639 = _2044 * 0.5;
    float _2641 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2593);
    float _2643 = fma(_2557, _2387, _2619);
    float _2645 = fma(_2617, _2387, _2637);
    float _2647 = fma(_2080, -0.5, _2639);
    float _2649 = fma(_2309, _2623, _2249);
    float _2651 = -_2611;
    float _2653 = _2651 + 1.0;
    float _2655 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2657 = _2625 + _2044;
    float _2659 = _2072 + _2044;
    float _2661 = _2653 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2663 = fma(_2343, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2643);
    float _2665 = fma(_2343, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2645);
    float _2667 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2595);
    float _2669 = -_2661;
    float _2671 = _2669 + 1.0;
    float _2673 = _2521 + 0.5;
    float _2675 = _2649 + 0.5;
    float _2677 = _2657 * 0.5;
    float _2679 = _2659 * 0.5;
    float _2681 = _2655 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.y = _2673;
    out.m_73.x = _2597;
    out.m_73.y = _2641;
    out.m_73.z = _2667;
    out.m_67.x = _2675;
    out.m_75.x = _2663;
    out.m_75.y = _2665;
    out.gl_Position.x = _2072;
    out.gl_Position.y = _2080;
    out.gl_Position.z = _2625;
    out.gl_Position.w = _2044;
    out.m_77.x = _2679;
    out.m_77.y = _2647;
    out.m_77.z = _2677;
    out.m_77.w = _2044;
    out.m_45.x = _2681;
    float _2683 = _2661 * _2106;
    float _2685 = _2117 * _2671;
    float _2687 = _2117 * _2683;
    float _2689 = _2127 * _2683;
    float _2691 = fma(_2123, _2687, _2111);
    float _2693 = fma(_2125, _2687, _2113);
    float _2695 = fma(_2117, _2689, _2115);
    out.m_79.x = _2691;
    out.m_79.y = _2693;
    out.m_79.z = _2695;
    out.m_79.w = _2685;
    if (_2635)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2697 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2697;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

