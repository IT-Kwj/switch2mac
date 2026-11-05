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
    bool _1306 = false;
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
        float _2538 = as_type<float>(_114);
        out.gl_Position.z = _2538;
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
        float _2614 = as_type<float>(_154);
        out.gl_Position.z = _2614;
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
    bool _988 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
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
        float _1072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1074 = _120 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
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
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1100 = _1096 + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1114 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1116 = isnan(_1096);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1122 = _1118 || _1120;
    float _1124 = float(_1122);
    float _1126 = 1.0 / _1104;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1130 = _1128 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1132 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1134 = isnan(_1096);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    bool _1144 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1146 = 1.0 / _1112;
    float _1148 = _1108 * _1126;
    bool _1150 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1152 = isnan(_1096);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    float _1162 = 1.0 / _1130;
    float _1164 = -_1124;
    float _1166 = _1164 + 1.0;
    float _1168 = fma(_1148, _1100, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1174 = -_1160;
    float _1176 = _1174 + 1.0;
    bool _1178 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1180 = isnan(_1096);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = _1160 * _1166;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1196 = 1.0 / _1172;
    float _1198 = _1142 * _1176;
    float _1200 = -_1188;
    float _1202 = _1200 + 1.0;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1204;
    float _1208 = _1194 * _1146;
    float _1210 = _1168 * _1198;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1214 = _1096 + _1212;
    float _1216 = -_1142;
    float _1218 = _1216 + 1.0;
    float _1220 = _1124 * _1202;
    float _1222 = _1206 * _1162;
    bool _1224 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1226 = isnan(_1096);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1232 = _1228 || _1230;
    float _1234 = float(_1232);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1242 = _1096 + _1240;
    float _1244 = fma(_1208, _1214, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1246 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1210);
    float _1248 = -_1234;
    float _1250 = _1248 + 1.0;
    float _1252 = _1238 * _1196;
    float _1254 = fma(_1222, _1242, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1258 = _1096 + _1256;
    float _1260 = fma(_1244, _1190, _1246);
    float _1262 = _1188 * _1250;
    float _1264 = fma(_1252, _1258, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1266 = fma(_1254, _1220, _1260);
    float _1268 = fma(_1264, _1262, _1266);
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1276 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1268);
    float _1278 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1282 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1284 = _1276 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_57.x = _1278;
    out.m_57.y = _1280;
    out.m_57.z = _1282;
    out.m_57.w = _1284;
    bool _1286 = !_1144;
    float _1288 = _1196;
    float _1304;
    if (!_1286)
    {
        float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1292 = _120 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1294 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[14].x, _136);
        float _1296 = _1294 * _1290;
        float _1298 = floor(_1296);
        float _1300 = -_1298;
        float _1302 = _1296 + _1300;
        _1304 = _1302;
        _1306 = true;
    }
    else
    {
        float _1308 = float(_98);
        float _1310 = 1.0 / _1308;
        float _1312 = _136 * _1310;
        _1304 = _1312;
    }
    _1306 = false;
    float _1314 = _1304;
    float _1316 = in.m_59.x;
    float _1318 = in.m_59.y;
    float _1320 = in.m_59.z;
    float _1322 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1324 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1326 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1328 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1330 = isnan(0.5);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1336 = _1332 || _1334;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1316);
    float _1340 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1318);
    float _1342 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1320);
    float _1344 = _1338 * _1322;
    float _1346 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1348 = _1340 * _1324;
    float _1350 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1352 = _1342 * _1326;
    float _1354 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1346);
    float _1356 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1358 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1350);
    float _1360 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1362 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1354);
    float _1364 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1356);
    float _1366 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1368 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1358);
    float _1370 = _1362 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1372 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1360);
    float _1374 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1364);
    float _1376 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1366);
    float _1378 = _1368 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1380 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1372);
    float _1382 = _1370 + _1374;
    float _1384 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1376);
    float _1386 = _1378 + _1380;
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1390 = _1382 + _1388;
    float _1392 = _1384 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1394 = _1380;
    float _1396 = _1344;
    float _1398 = _1352;
    float _1400 = _1348;
    if (_1336)
    {
        _1394 = 1.0;
    }
    float _1402 = _1394;
    float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1406 = _1386 + _1404;
    float _1408 = _1390 * _1390;
    float _1410 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1412 = fma(_1406, _1406, _1408);
    float _1414 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1410);
    float _1416 = sqrt(_1412);
    float _1418 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1414);
    float _1420 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1422 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1424 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1420);
    float _1426 = 1.0 / _1422;
    float _1428 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1424);
    float _1430 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1432 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1434 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1430);
    bool _1436 = _1416 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1438 = _1432 + _1422;
    float _1440 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1434);
    float _1442 = _1392 + _1440;
    float _1444 = _1438 * _1426;
    float _1446 = _1444 * 0.5;
    float _1448 = _1440;
    float _1450 = _1442;
    float _1452 = _1402;
    float _1454 = _1426;
    if (!_1436)
    {
        _1396 = _1386;
    }
    float _1456 = _1396;
    float _1458 = _1456;
    if (!_1436)
    {
        _1398 = _1382;
    }
    float _1460 = _1398;
    float _1462 = _1460;
    if (!_1436)
    {
        _1448 = _1442;
    }
    float _1464 = _1448;
    bool _1466 = !_1436;
    float _1468 = _1464;
    if (!_1466)
    {
        float _1470 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1474 = _1416 + _1472;
        float _1476 = _1442 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1478 = rsqrt(_1412);
        float _1480 = _1474 * _1470;
        float _1482 = _1480 * 0.15915493667125701904296875;
        float _1484 = _1482 * 6.283185482025146484375;
        float _1486 = cos(_1484);
        float _1488 = _1482 * 6.283185482025146484375;
        float _1490 = sin(_1488);
        float _1492 = _1486 + (-1.0);
        float _1494 = _1492 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1496 = fma(_1490, _1476, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1498 = fma(_1442, _1486, _1494);
        float _1500 = _1478 * _1496;
        float _1502 = fma(_1406, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1504 = fma(_1390, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1468 = _1498;
        _1458 = _1502;
        _1462 = _1504;
    }
    float _1506 = _1468;
    float _1508 = _1458;
    float _1510 = _1462;
    if (!_1336)
    {
        float _1512 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1514 = _1512 * 0.15915493667125701904296875;
        float _1516 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1520 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1518);
        float _1522 = _1514 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        float _1526 = _1516 * 0.15915493667125701904296875;
        float _1528 = _1514 * 6.283185482025146484375;
        float _1530 = sin(_1528);
        float _1532 = 1.0 / _1524;
        float _1534 = _1526 * 6.283185482025146484375;
        float _1536 = cos(_1534);
        float _1538 = _1530 * _1532;
        float _1540 = _1526 * 6.283185482025146484375;
        float _1542 = sin(_1540);
        float _1544 = _1536 * _1538;
        float _1546 = 1.0 / _1520;
        float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1550 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1548;
        float _1552 = 1.0 / _1544;
        float _1554 = 1.0 / _1550;
        float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1558 = _1546 * _1556;
        float _1560 = _1542 * _1552;
        float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1564 = fma(_1560, _1558, _1562);
        float _1566 = _1564 * _1554;
        float _1568 = precise::clamp(_1566, 0.0, 1.0);
        float _1570 = -_1568;
        float _1572 = _1570 + 1.0;
        _1450 = _1526;
        _1400 = _1546;
        _1452 = _1572;
    }
    float _1574 = _1450;
    float _1576 = _1400;
    float _1578 = _1452;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1582 = _1506 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1586 = _1508 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1590 = _1510 + _1588;
    float _1592 = _1582 * _1582;
    float _1594 = fma(_1586, _1586, _1592);
    float _1596 = fma(_1590, _1590, _1594);
    float _1598 = rsqrt(_1596);
    float _1600 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1586 * _1600;
    float _1604 = _1590 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 + _1608;
    float _1612 = sqrt(_1610);
    bool _1614 = _1612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1612 + _1616;
    float _1620 = _1574;
    float _1622 = _1618;
    float _1624 = _1582;
    float _1626 = _1602;
    if (_1614)
    {
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1628;
    }
    float _1630 = _1620;
    float _1632 = _1630;
    if (_1614)
    {
        float _1634 = _1618 * _1630;
        _1622 = _1634;
    }
    float _1636 = _1622;
    if (_1614)
    {
        float _1638 = rsqrt(_1610);
        _1632 = _1638;
    }
    float _1640 = _1632;
    float _1642 = _1640;
    if (_1614)
    {
        float _1644 = _1636 * 0.15915493667125701904296875;
        _1454 = _1644;
    }
    float _1646 = _1454;
    float _1648 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1650 = _1590;
    if (_1614)
    {
        float _1652 = _1646 * 6.283185482025146484375;
        float _1654 = sin(_1652);
        _1650 = _1654;
    }
    float _1656 = _1650;
    float _1658 = precise::max(0.0, _1648);
    float _1660 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1662 = _1576;
    float _1664 = _1658;
    if (_1614)
    {
        float _1666 = _1646 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        _1662 = _1668;
    }
    float _1670 = _1662;
    float _1672 = -_1600;
    float _1674 = -_1658;
    float _1676 = fma(_1582, _1672, _1674);
    if (_1614)
    {
        float _1678 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1624 = _1678;
    }
    float _1680 = _1624;
    float _1682 = sqrt(_1596);
    float _1684 = _1656;
    float _1686 = _1680;
    if (_1614)
    {
        float _1688 = fma(_1656, _1680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = _1690;
    if (!_1614)
    {
        _1686 = _1676;
    }
    float _1694 = _1686;
    float _1696 = _1694;
    if (_1614)
    {
        float _1698 = _1640 * _1690;
        _1288 = _1698;
    }
    float _1700 = _1288;
    if (!_1614)
    {
        _1692 = _1606;
    }
    float _1702 = _1692;
    float _1704 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1706 = _1702;
    float _1708 = _1670;
    if (_1614)
    {
        float _1710 = _1670 + (-1.0);
        _1664 = _1710;
    }
    float _1712 = _1664;
    float _1714 = _1712;
    if (_1614)
    {
        float _1716 = _1602 * _1700;
        _1626 = _1716;
    }
    float _1718 = _1626;
    float _1720 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1704);
    if (_1614)
    {
        float _1722 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1722;
    }
    float _1724 = _1642;
    if (!_1614)
    {
        _1714 = _1604;
    }
    float _1726 = _1714;
    float _1728 = _1726;
    if (_1614)
    {
        float _1730 = _1604 * _1700;
        _1728 = _1730;
    }
    float _1732 = _1728;
    if (_1614)
    {
        float _1734 = _1718 * _1718;
        _1706 = _1734;
    }
    float _1736 = _1706;
    if (_1614)
    {
        float _1738 = fma(_1676, _1670, _1724);
        _1696 = _1738;
    }
    float _1740 = _1696;
    if (!_1614)
    {
        _1708 = _1608;
    }
    float _1742 = _1708;
    float _1744 = _1742;
    if (_1614)
    {
        float _1746 = _1732 * _1732;
        _1744 = _1746;
    }
    float _1748 = _1744;
    float _1750 = fma(_1740, _1740, _1736);
    float _1752 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1720);
    float _1754 = _1750 + _1748;
    float _1756 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1760 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1758);
    float _1762 = precise::clamp(_1760, 0.0, 1.0);
    float _1764 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1766 = rsqrt(_1754);
    float _1768 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1756);
    float _1770 = -_1762;
    float _1772 = _1770 + 1.0;
    float _1774 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1764);
    float _1776 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1768);
    float _1778 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1780 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1774);
    float _1782 = abs(_1772);
    float _1784 = log2(_1782);
    float _1786 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1788 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1778);
    float _1790 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1792 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1794 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1788);
    float _1796 = _1766 * _1718;
    float _1798 = -_1792;
    float _1800 = fma(_1798, _1660, 1.0);
    float _1802 = _1794 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1804 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1806 = _1766 * _1740;
    float _1808 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1810 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1812 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1804);
    float _1814 = _1766 * _1732;
    float _1816 = -_1808;
    float _1818 = fma(_1806, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1816);
    float _1820 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1822 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1812);
    float _1824 = log2(_1800);
    float _1826 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1828 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1822);
    float _1830 = -_1814;
    float _1832 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1818);
    float _1834 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1836 = exp2(_1820);
    float _1838 = fma(_1832, -0.5, 0.5);
    float _1840 = fma(_1832, 0.5, 0.5);
    float _1842 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1834);
    float _1844 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1826);
    float _1846 = _1806 + 1.0;
    float _1848 = fma(_1840, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1850 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1842);
    float _1852 = 1.0 / _1828;
    float _1854 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1844);
    float _1856 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1850);
    float _1858 = sqrt(_1838);
    float _1860 = -_1806;
    float _1862 = fma(_1836, _1846, _1860);
    float _1864 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1854);
    float _1866 = fma(_1840, _1848, -0.212114393711090087890625);
    float _1868 = _1824 * 0.693147182464599609375;
    float _1870 = fma(_1840, _1866, 1.570728778839111328125);
    float _1872 = _1856 * _1852;
    float _1874 = _1864 * _1852;
    float _1876 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1878 = fma(_1872, 0.5, 0.5);
    float _1880 = fma(_1874, -0.5, 0.5);
    float _1882 = fma(_1862, 0.5, 0.5);
    float _1884 = _1858 * 0.636619746685028076171875;
    float _1886 = -_1870;
    float _1888 = fma(_1884, _1886, 1.0);
    float3 _5447 = float3(_1878, _1880, _1876);
    float _1890 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5447, float3(0.0), isnan(_5447)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5447, float3(0.0), isnan(_5447)), level(0.0)).x;
    float3 _5458 = float3(_1878, _1880, _1876);
    float4 _1893 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5458, float3(0.0), isnan(_5458)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5458, float3(0.0), isnan(_5458)), level(0.0)).xyzw;
    float _1895 = _1893.x;
    float _1897 = _1893.y;
    float _1899 = _1893.z;
    float _1901 = _1893.w;
    float2 _5475 = float2(_1888, _1882);
    float3 _1905 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5475, float2(0.0), isnan(_5475)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5475, float2(0.0), isnan(_5475)), level(0.0)).xyz;
    float _1907 = _1905.x;
    float _1909 = _1905.y;
    float _1911 = _1905.z;
    float _1913 = in.m_61.w;
    float _1915 = _120 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1917;
    float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1923 = _1921 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1927 = _1925 != 0;
    float _1929 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1931 = _1314 + _1929;
    float _1933 = 1.0 / _1919;
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1935;
    bool _1939 = _120 > 0.5;
    bool _1941 = _1939 && _1927;
    float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1945 = _1943 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1947 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1949 = _1314 + _1947;
    float _1951 = 1.0 / _1923;
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1955 = _122 > 0.5;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1959 = _1314 + _1957;
    int _1961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1963 = _1961 != 0;
    float _1965 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1967 = -_1953;
    float _1969 = fma(_1915, 2.0, _1967);
    float _1971 = 1.0 / _1937;
    float _1973 = in.m_63.y;
    float _1975 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1965);
    float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1979 = _1977 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1981 = _1931 * _1933;
    out.m_65.w = _1913;
    float _1983 = _122 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1985 = 1.0 / _1945;
    float _1987 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1987;
    float _1991 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1995 = _1314 + _1993;
    float _1997 = in.m_63.x;
    float _1999 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2001 = _1995 * _1951;
    float _2003 = 1.0 / _1979;
    float _2005 = fma(_1983, -2.0, _1991);
    float _2007 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1999);
    float _2009 = _1959 * _1971;
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2013 = _1314 + _2011;
    float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _2015;
    float _2019 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2007);
    float _2021 = 1.0 / _1989;
    float _2023 = -_1973;
    float _2025 = _2023 + 1.0;
    float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2029 = _1314 + _2027;
    float _2031 = -_136;
    float _2033 = fma(_2031, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1969);
    float _2035 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2005);
    float _2037 = _2029 * _1985;
    int _2039 = _1955 ? as_type<int>(_2025) : as_type<int>(_1973);
    float _2041 = _1949 * _2003;
    float _2043 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2045 = _1314 + _2043;
    out.m_67.w = _1973;
    float _2047 = _1963 ? as_type<float>(_2039) : _1973;
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _2049;
    float _2053 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2053;
    float _2057 = _2013 * _2021;
    float _2059 = 1.0 / _2051;
    bool _2061 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2063 = isnan(_1314);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = fma(_2055, _1981, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2075 = fma(_2017, _1981, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2079 = _2077 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2081 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _2081;
    float _2085 = 0.0;
    float _2087 = _1997;
    if (_1927)
    {
        _2085 = _1997;
    }
    float _2089 = _2085;
    float _2091 = fma(_2079, _2001, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2093 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1975);
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _2097 = _2095 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2099;
    float _2103 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _2103;
    float _2107 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2109 = _2107 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2111 = fma(_2097, _2001, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _2115 = _2113 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    bool _2117 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2119 = isnan(_1314);
    bool _2121 = _2117 || _2119;
    bool _2123 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2125 = _2121 || _2123;
    float _2127 = float(_2125);
    float _2129 = _2045 * _2059;
    float _2131 = fma(_2109, _2037, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2133 = fma(_2101, _2009, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2135 = fma(_2115, _2037, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    bool _2137 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2139 = isnan(_1314);
    bool _2141 = _2137 || _2139;
    bool _2143 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2145 = _2141 || _2143;
    float _2147 = float(_2145);
    float _2149 = -_2127;
    float _2151 = _2149 + 1.0;
    float _2153 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2155 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2153;
    float _2157 = fma(_2105, _2009, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    bool _2159 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2161 = isnan(_1314);
    bool _2163 = _2159 || _2161;
    bool _2165 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2167 = _2163 || _2165;
    float _2169 = float(_2167);
    float _2171 = _2147 * _2151;
    float _2173 = fma(_2155, _2057, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2175 = -_2147;
    float _2177 = _2175 + 1.0;
    float _2179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2181 = -_2169;
    float _2183 = _2181 + 1.0;
    float _2185 = fma(_2083, _2057, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _2187 = _2169 * _2177;
    float _2189 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2191 = _2189 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2193 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2195 = isnan(_1314);
    bool _2197 = _2193 || _2195;
    bool _2199 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2201 = _2197 || _2199;
    float _2203 = float(_2201);
    float _2205 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2207 = _2205 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2209 = _2071 * _2183;
    float _2211 = _2089;
    if (_1941)
    {
        float _2213 = -_2089;
        float _2215 = _2213 + 1.0;
        _2211 = _2215;
    }
    float _2217 = _2211;
    float _2219 = -_2071;
    float _2221 = _2219 + 1.0;
    float _2223 = fma(_2191, _2041, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2225 = fma(_2207, _2041, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _2227 = _1318 != 0.0;
    bool _2229 = isnan(_1318);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan(0.0);
    bool _2235 = _2231 || _2233;
    float _2237 = _2203 * _2221;
    if (_1927)
    {
        _2087 = _2217;
    }
    float _2239 = _2087;
    float _2241 = -_2203;
    float _2243 = _2241 + 1.0;
    float _2245 = _2179 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2247 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2249 = isnan(_1314);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2255 = _2251 || _2253;
    float _2257 = float(_2255);
    float _2259 = in.m_69.x;
    float _2261 = in.m_69.y;
    float _2263 = in.m_69.z;
    bool _2265 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2267 = isnan(_1314);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2273 = _2269 || _2271;
    float _2275 = float(_2273);
    float _2277 = fma(_2047, _2245, -0.5);
    bool _2279 = _1316 == 0.0;
    bool _2281 = !_2235;
    bool _2283 = _2279 && _2281;
    float _2285 = -_2257;
    float _2287 = _2285 + 1.0;
    float _2289 = _2257 * _2243;
    bool _2291 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2293 = isnan(_1314);
    bool _2295 = _2291 || _2293;
    bool _2297 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2299 = _2295 || _2297;
    float _2301 = float(_2299);
    float _2303 = -_2035;
    float _2305 = fma(_2019, _2277, _2303);
    float _2307 = _2275 * _2287;
    float _2309 = -_2275;
    float _2311 = _2309 + 1.0;
    bool _2313 = _1320 == 0.0;
    bool _2315 = _2313 && _2283;
    float _2317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2319 = _2301 * _2311;
    float _2321 = -_2301;
    float _2323 = _2321 + 1.0;
    out.m_71.x = _1508;
    out.m_71.y = _1506;
    out.m_71.z = _1510;
    float _2325 = _2073 * _2319;
    float _2327 = _2075 * _2319;
    float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2329;
    float _2333 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2335 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2333;
    float _2337 = fma(_2323, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2325);
    float _2339 = fma(_2323, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2327);
    float _2341 = fma(_2331, _2129, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2343 = _2261;
    float _2345 = _2259;
    float _2347 = _2263;
    if (!_2315)
    {
        float _2349 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2261);
        _2343 = _2349;
    }
    float _2351 = _2343;
    float _2353 = fma(_2091, _2307, _2337);
    float _2355 = fma(_2111, _2307, _2339);
    if (!_2315)
    {
        float _2357 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2259);
        _2345 = _2357;
    }
    float _2359 = _2345;
    float _2361 = _2351 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2363 = fma(_2133, _2289, _2353);
    float _2365 = _2351 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2367 = _2351 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (!_2315)
    {
        float _2369 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2263);
        _2347 = _2369;
    }
    float _2371 = _2347;
    float _2373 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2361);
    float _2375 = fma(_2131, _2237, _2363);
    float _2377 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2365);
    float _2379 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2367);
    float _2381 = fma(_2371, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2373);
    float _2383 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2385 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2387 = fma(_2157, _2289, _2355);
    float _2389 = fma(_2173, _2209, _2375);
    float _2391 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2383);
    float _2393 = _2317 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2395 = exp2(_2385);
    float _2397 = fma(_2135, _2237, _2387);
    float _2399 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2391);
    float _2401 = fma(_2335, _2129, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2403 = fma(_2223, _2187, _2389);
    float _2405 = fma(_2185, _2209, _2397);
    float _2407 = fma(_2393, _2239, -0.5);
    float _2409 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2399);
    bool _2411 = _1578 > 0.0;
    bool _2413 = isnan(_1578);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan(0.0);
    bool _2419 = _2415 || _2417;
    float _2421 = fma(_2225, _2187, _2405);
    float _2423 = _1828 * 0.5;
    float _2425 = fma(_2371, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2377);
    float _2427 = fma(_2341, _2171, _2403);
    float _2429 = fma(_2401, _2171, _2421);
    float _2431 = fma(_1864, -0.5, _2423);
    float _2433 = fma(_2093, _2407, _2033);
    float _2435 = -_2395;
    float _2437 = _2435 + 1.0;
    float _2439 = _1578 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2441 = _2409 + _1828;
    float _2443 = _1856 + _1828;
    float _2445 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2447 = fma(_2127, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2427);
    float _2449 = fma(_2127, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2429);
    float _2451 = fma(_2371, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2379);
    float _2453 = -_2445;
    float _2455 = _2453 + 1.0;
    float _2457 = _2305 + 0.5;
    float _2459 = _2433 + 0.5;
    float _2461 = _2441 * 0.5;
    float _2463 = _2443 * 0.5;
    float _2465 = _2439 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.y = _2457;
    out.m_73.x = _2381;
    out.m_73.y = _2425;
    out.m_73.z = _2451;
    out.m_67.x = _2459;
    out.m_75.x = _2447;
    out.m_75.y = _2449;
    out.gl_Position.x = _1856;
    out.gl_Position.y = _1864;
    out.gl_Position.z = _2409;
    out.gl_Position.w = _1828;
    out.m_77.x = _2463;
    out.m_77.y = _2431;
    out.m_77.z = _2461;
    out.m_77.w = _1828;
    out.m_45.x = _2465;
    float _2467 = _2445 * _1890;
    float _2469 = _1901 * _2455;
    float _2471 = _1901 * _2467;
    float _2473 = _1911 * _2467;
    float _2475 = fma(_1907, _2471, _1895);
    float _2477 = fma(_1909, _2471, _1897);
    float _2479 = fma(_1901, _2473, _1899);
    out.m_79.x = _2475;
    out.m_79.y = _2477;
    out.m_79.z = _2479;
    out.m_79.w = _2469;
    if (_2419)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2481 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2481;
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
    bool _1306 = false;
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
        float _2538 = as_type<float>(_114);
        out.gl_Position.z = _2538;
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
        float _2614 = as_type<float>(_154);
        out.gl_Position.z = _2614;
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
    bool _988 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
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
        float _1072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1074 = _120 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
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
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1100 = _1096 + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1114 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1116 = isnan(_1096);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1122 = _1118 || _1120;
    float _1124 = float(_1122);
    float _1126 = 1.0 / _1104;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1130 = _1128 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1132 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1134 = isnan(_1096);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    bool _1144 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1146 = 1.0 / _1112;
    float _1148 = _1108 * _1126;
    bool _1150 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1152 = isnan(_1096);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    float _1162 = 1.0 / _1130;
    float _1164 = -_1124;
    float _1166 = _1164 + 1.0;
    float _1168 = fma(_1148, _1100, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1174 = -_1160;
    float _1176 = _1174 + 1.0;
    bool _1178 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1180 = isnan(_1096);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = _1160 * _1166;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1196 = 1.0 / _1172;
    float _1198 = _1142 * _1176;
    float _1200 = -_1188;
    float _1202 = _1200 + 1.0;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1204;
    float _1208 = _1194 * _1146;
    float _1210 = _1168 * _1198;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1214 = _1096 + _1212;
    float _1216 = -_1142;
    float _1218 = _1216 + 1.0;
    float _1220 = _1124 * _1202;
    float _1222 = _1206 * _1162;
    bool _1224 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1226 = isnan(_1096);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1232 = _1228 || _1230;
    float _1234 = float(_1232);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1242 = _1096 + _1240;
    float _1244 = fma(_1208, _1214, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1246 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1210);
    float _1248 = -_1234;
    float _1250 = _1248 + 1.0;
    float _1252 = _1238 * _1196;
    float _1254 = fma(_1222, _1242, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1258 = _1096 + _1256;
    float _1260 = fma(_1244, _1190, _1246);
    float _1262 = _1188 * _1250;
    float _1264 = fma(_1252, _1258, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1266 = fma(_1254, _1220, _1260);
    float _1268 = fma(_1264, _1262, _1266);
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1276 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1268);
    float _1278 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1282 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1284 = _1276 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_57.x = _1278;
    out.m_57.y = _1280;
    out.m_57.z = _1282;
    out.m_57.w = _1284;
    bool _1286 = !_1144;
    float _1288 = _1196;
    float _1304;
    if (!_1286)
    {
        float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1292 = _120 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1294 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[14].x, _136);
        float _1296 = _1294 * _1290;
        float _1298 = floor(_1296);
        float _1300 = -_1298;
        float _1302 = _1296 + _1300;
        _1304 = _1302;
        _1306 = true;
    }
    else
    {
        float _1308 = float(_98);
        float _1310 = 1.0 / _1308;
        float _1312 = _136 * _1310;
        _1304 = _1312;
    }
    _1306 = false;
    float _1314 = _1304;
    float _1316 = in.m_59.x;
    float _1318 = in.m_59.y;
    float _1320 = in.m_59.z;
    float _1322 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1324 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1326 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1328 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1330 = isnan(0.5);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1336 = _1332 || _1334;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1316);
    float _1340 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1318);
    float _1342 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1320);
    float _1344 = _1338 * _1322;
    float _1346 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1348 = _1340 * _1324;
    float _1350 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1352 = _1342 * _1326;
    float _1354 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1346);
    float _1356 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1358 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1350);
    float _1360 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1362 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1354);
    float _1364 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1356);
    float _1366 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1368 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1358);
    float _1370 = _1362 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1372 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1360);
    float _1374 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1364);
    float _1376 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1366);
    float _1378 = _1368 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1380 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1372);
    float _1382 = _1370 + _1374;
    float _1384 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1376);
    float _1386 = _1378 + _1380;
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1390 = _1382 + _1388;
    float _1392 = _1384 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1394 = _1380;
    float _1396 = _1344;
    float _1398 = _1352;
    float _1400 = _1348;
    if (_1336)
    {
        _1394 = 1.0;
    }
    float _1402 = _1394;
    float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1406 = _1386 + _1404;
    float _1408 = _1390 * _1390;
    float _1410 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1412 = fma(_1406, _1406, _1408);
    float _1414 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1410);
    float _1416 = sqrt(_1412);
    float _1418 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1414);
    float _1420 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1422 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1424 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1420);
    float _1426 = 1.0 / _1422;
    float _1428 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1424);
    float _1430 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1432 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1434 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1430);
    bool _1436 = _1416 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1438 = _1432 + _1422;
    float _1440 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1434);
    float _1442 = _1392 + _1440;
    float _1444 = _1438 * _1426;
    float _1446 = _1444 * 0.5;
    float _1448 = _1440;
    float _1450 = _1442;
    float _1452 = _1402;
    float _1454 = _1426;
    if (!_1436)
    {
        _1396 = _1386;
    }
    float _1456 = _1396;
    float _1458 = _1456;
    if (!_1436)
    {
        _1398 = _1382;
    }
    float _1460 = _1398;
    float _1462 = _1460;
    if (!_1436)
    {
        _1448 = _1442;
    }
    float _1464 = _1448;
    bool _1466 = !_1436;
    float _1468 = _1464;
    if (!_1466)
    {
        float _1470 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1474 = _1416 + _1472;
        float _1476 = _1442 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1478 = rsqrt(_1412);
        float _1480 = _1474 * _1470;
        float _1482 = _1480 * 0.15915493667125701904296875;
        float _1484 = _1482 * 6.283185482025146484375;
        float _1486 = cos(_1484);
        float _1488 = _1482 * 6.283185482025146484375;
        float _1490 = sin(_1488);
        float _1492 = _1486 + (-1.0);
        float _1494 = _1492 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1496 = fma(_1490, _1476, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1498 = fma(_1442, _1486, _1494);
        float _1500 = _1478 * _1496;
        float _1502 = fma(_1406, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1504 = fma(_1390, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1468 = _1498;
        _1458 = _1502;
        _1462 = _1504;
    }
    float _1506 = _1468;
    float _1508 = _1458;
    float _1510 = _1462;
    if (!_1336)
    {
        float _1512 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1514 = _1512 * 0.15915493667125701904296875;
        float _1516 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1520 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1518);
        float _1522 = _1514 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        float _1526 = _1516 * 0.15915493667125701904296875;
        float _1528 = _1514 * 6.283185482025146484375;
        float _1530 = sin(_1528);
        float _1532 = 1.0 / _1524;
        float _1534 = _1526 * 6.283185482025146484375;
        float _1536 = cos(_1534);
        float _1538 = _1530 * _1532;
        float _1540 = _1526 * 6.283185482025146484375;
        float _1542 = sin(_1540);
        float _1544 = _1536 * _1538;
        float _1546 = 1.0 / _1520;
        float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1550 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1548;
        float _1552 = 1.0 / _1544;
        float _1554 = 1.0 / _1550;
        float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1558 = _1546 * _1556;
        float _1560 = _1542 * _1552;
        float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1564 = fma(_1560, _1558, _1562);
        float _1566 = _1564 * _1554;
        float _1568 = precise::clamp(_1566, 0.0, 1.0);
        float _1570 = -_1568;
        float _1572 = _1570 + 1.0;
        _1450 = _1526;
        _1400 = _1546;
        _1452 = _1572;
    }
    float _1574 = _1450;
    float _1576 = _1400;
    float _1578 = _1452;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1582 = _1506 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1586 = _1508 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1590 = _1510 + _1588;
    float _1592 = _1582 * _1582;
    float _1594 = fma(_1586, _1586, _1592);
    float _1596 = fma(_1590, _1590, _1594);
    float _1598 = rsqrt(_1596);
    float _1600 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1586 * _1600;
    float _1604 = _1590 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 + _1608;
    float _1612 = sqrt(_1610);
    bool _1614 = _1612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1612 + _1616;
    float _1620 = _1574;
    float _1622 = _1618;
    float _1624 = _1582;
    float _1626 = _1602;
    if (_1614)
    {
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1628;
    }
    float _1630 = _1620;
    float _1632 = _1630;
    if (_1614)
    {
        float _1634 = _1618 * _1630;
        _1622 = _1634;
    }
    float _1636 = _1622;
    if (_1614)
    {
        float _1638 = rsqrt(_1610);
        _1632 = _1638;
    }
    float _1640 = _1632;
    float _1642 = _1640;
    if (_1614)
    {
        float _1644 = _1636 * 0.15915493667125701904296875;
        _1454 = _1644;
    }
    float _1646 = _1454;
    float _1648 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1650 = _1590;
    if (_1614)
    {
        float _1652 = _1646 * 6.283185482025146484375;
        float _1654 = sin(_1652);
        _1650 = _1654;
    }
    float _1656 = _1650;
    float _1658 = precise::max(0.0, _1648);
    float _1660 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1662 = _1576;
    float _1664 = _1658;
    if (_1614)
    {
        float _1666 = _1646 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        _1662 = _1668;
    }
    float _1670 = _1662;
    float _1672 = -_1600;
    float _1674 = -_1658;
    float _1676 = fma(_1582, _1672, _1674);
    if (_1614)
    {
        float _1678 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1624 = _1678;
    }
    float _1680 = _1624;
    float _1682 = sqrt(_1596);
    float _1684 = _1656;
    float _1686 = _1680;
    if (_1614)
    {
        float _1688 = fma(_1656, _1680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = _1690;
    if (!_1614)
    {
        _1686 = _1676;
    }
    float _1694 = _1686;
    float _1696 = _1694;
    if (_1614)
    {
        float _1698 = _1640 * _1690;
        _1288 = _1698;
    }
    float _1700 = _1288;
    if (!_1614)
    {
        _1692 = _1606;
    }
    float _1702 = _1692;
    float _1704 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1706 = _1702;
    float _1708 = _1670;
    if (_1614)
    {
        float _1710 = _1670 + (-1.0);
        _1664 = _1710;
    }
    float _1712 = _1664;
    float _1714 = _1712;
    if (_1614)
    {
        float _1716 = _1602 * _1700;
        _1626 = _1716;
    }
    float _1718 = _1626;
    float _1720 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1704);
    if (_1614)
    {
        float _1722 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1722;
    }
    float _1724 = _1642;
    if (!_1614)
    {
        _1714 = _1604;
    }
    float _1726 = _1714;
    float _1728 = _1726;
    if (_1614)
    {
        float _1730 = _1604 * _1700;
        _1728 = _1730;
    }
    float _1732 = _1728;
    if (_1614)
    {
        float _1734 = _1718 * _1718;
        _1706 = _1734;
    }
    float _1736 = _1706;
    if (_1614)
    {
        float _1738 = fma(_1676, _1670, _1724);
        _1696 = _1738;
    }
    float _1740 = _1696;
    if (!_1614)
    {
        _1708 = _1608;
    }
    float _1742 = _1708;
    float _1744 = _1742;
    if (_1614)
    {
        float _1746 = _1732 * _1732;
        _1744 = _1746;
    }
    float _1748 = _1744;
    float _1750 = fma(_1740, _1740, _1736);
    float _1752 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1720);
    float _1754 = _1750 + _1748;
    float _1756 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1760 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1758);
    float _1762 = precise::clamp(_1760, 0.0, 1.0);
    float _1764 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1766 = rsqrt(_1754);
    float _1768 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1756);
    float _1770 = -_1762;
    float _1772 = _1770 + 1.0;
    float _1774 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1764);
    float _1776 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1768);
    float _1778 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1780 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1774);
    float _1782 = abs(_1772);
    float _1784 = log2(_1782);
    float _1786 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1788 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1778);
    float _1790 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1792 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1794 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1788);
    float _1796 = _1766 * _1718;
    float _1798 = -_1792;
    float _1800 = fma(_1798, _1660, 1.0);
    float _1802 = _1794 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1804 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1806 = _1766 * _1740;
    float _1808 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1810 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1812 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1804);
    float _1814 = _1766 * _1732;
    float _1816 = -_1808;
    float _1818 = fma(_1806, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1816);
    float _1820 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1822 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1812);
    float _1824 = log2(_1800);
    float _1826 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1828 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1822);
    float _1830 = -_1814;
    float _1832 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1818);
    float _1834 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1836 = exp2(_1820);
    float _1838 = fma(_1832, -0.5, 0.5);
    float _1840 = fma(_1832, 0.5, 0.5);
    float _1842 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1834);
    float _1844 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1826);
    float _1846 = _1806 + 1.0;
    float _1848 = fma(_1840, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1850 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1842);
    float _1852 = 1.0 / _1828;
    float _1854 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1844);
    float _1856 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1850);
    float _1858 = sqrt(_1838);
    float _1860 = -_1806;
    float _1862 = fma(_1836, _1846, _1860);
    float _1864 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1854);
    float _1866 = fma(_1840, _1848, -0.212114393711090087890625);
    float _1868 = _1824 * 0.693147182464599609375;
    float _1870 = fma(_1840, _1866, 1.570728778839111328125);
    float _1872 = _1856 * _1852;
    float _1874 = _1864 * _1852;
    float _1876 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1878 = fma(_1872, 0.5, 0.5);
    float _1880 = fma(_1874, -0.5, 0.5);
    float _1882 = fma(_1862, 0.5, 0.5);
    float _1884 = _1858 * 0.636619746685028076171875;
    float _1886 = -_1870;
    float _1888 = fma(_1884, _1886, 1.0);
    float3 _5447 = float3(_1878, _1880, _1876);
    float _1890 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5447, float3(0.0), isnan(_5447)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5447, float3(0.0), isnan(_5447)), level(0.0)).x;
    float3 _5458 = float3(_1878, _1880, _1876);
    float4 _1893 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5458, float3(0.0), isnan(_5458)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5458, float3(0.0), isnan(_5458)), level(0.0)).xyzw;
    float _1895 = _1893.x;
    float _1897 = _1893.y;
    float _1899 = _1893.z;
    float _1901 = _1893.w;
    float2 _5475 = float2(_1888, _1882);
    float3 _1905 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5475, float2(0.0), isnan(_5475)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5475, float2(0.0), isnan(_5475)), level(0.0)).xyz;
    float _1907 = _1905.x;
    float _1909 = _1905.y;
    float _1911 = _1905.z;
    float _1913 = in.m_61.w;
    float _1915 = _120 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1917;
    float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1923 = _1921 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1927 = _1925 != 0;
    float _1929 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1931 = _1314 + _1929;
    float _1933 = 1.0 / _1919;
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1935;
    bool _1939 = _120 > 0.5;
    bool _1941 = _1939 && _1927;
    float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1945 = _1943 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1947 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1949 = _1314 + _1947;
    float _1951 = 1.0 / _1923;
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1955 = _122 > 0.5;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1959 = _1314 + _1957;
    int _1961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1963 = _1961 != 0;
    float _1965 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1967 = -_1953;
    float _1969 = fma(_1915, 2.0, _1967);
    float _1971 = 1.0 / _1937;
    float _1973 = in.m_63.y;
    float _1975 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1965);
    float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1979 = _1977 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1981 = _1931 * _1933;
    out.m_65.w = _1913;
    float _1983 = _122 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1985 = 1.0 / _1945;
    float _1987 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1987;
    float _1991 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1995 = _1314 + _1993;
    float _1997 = in.m_63.x;
    float _1999 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2001 = _1995 * _1951;
    float _2003 = 1.0 / _1979;
    float _2005 = fma(_1983, -2.0, _1991);
    float _2007 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1999);
    float _2009 = _1959 * _1971;
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2013 = _1314 + _2011;
    float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _2015;
    float _2019 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2007);
    float _2021 = 1.0 / _1989;
    float _2023 = -_1973;
    float _2025 = _2023 + 1.0;
    float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2029 = _1314 + _2027;
    float _2031 = -_136;
    float _2033 = fma(_2031, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1969);
    float _2035 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2005);
    float _2037 = _2029 * _1985;
    int _2039 = _1955 ? as_type<int>(_2025) : as_type<int>(_1973);
    float _2041 = _1949 * _2003;
    float _2043 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2045 = _1314 + _2043;
    out.m_67.w = _1973;
    float _2047 = _1963 ? as_type<float>(_2039) : _1973;
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _2049;
    float _2053 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2053;
    float _2057 = _2013 * _2021;
    float _2059 = 1.0 / _2051;
    bool _2061 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2063 = isnan(_1314);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = fma(_2055, _1981, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2075 = fma(_2017, _1981, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2079 = _2077 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2081 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _2081;
    float _2085 = 0.0;
    float _2087 = _1997;
    if (_1927)
    {
        _2085 = _1997;
    }
    float _2089 = _2085;
    float _2091 = fma(_2079, _2001, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2093 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1975);
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _2097 = _2095 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2099;
    float _2103 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _2103;
    float _2107 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2109 = _2107 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2111 = fma(_2097, _2001, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _2115 = _2113 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    bool _2117 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2119 = isnan(_1314);
    bool _2121 = _2117 || _2119;
    bool _2123 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2125 = _2121 || _2123;
    float _2127 = float(_2125);
    float _2129 = _2045 * _2059;
    float _2131 = fma(_2109, _2037, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2133 = fma(_2101, _2009, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2135 = fma(_2115, _2037, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    bool _2137 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2139 = isnan(_1314);
    bool _2141 = _2137 || _2139;
    bool _2143 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2145 = _2141 || _2143;
    float _2147 = float(_2145);
    float _2149 = -_2127;
    float _2151 = _2149 + 1.0;
    float _2153 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2155 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2153;
    float _2157 = fma(_2105, _2009, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    bool _2159 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2161 = isnan(_1314);
    bool _2163 = _2159 || _2161;
    bool _2165 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2167 = _2163 || _2165;
    float _2169 = float(_2167);
    float _2171 = _2147 * _2151;
    float _2173 = fma(_2155, _2057, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2175 = -_2147;
    float _2177 = _2175 + 1.0;
    float _2179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2181 = -_2169;
    float _2183 = _2181 + 1.0;
    float _2185 = fma(_2083, _2057, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _2187 = _2169 * _2177;
    float _2189 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2191 = _2189 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2193 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2195 = isnan(_1314);
    bool _2197 = _2193 || _2195;
    bool _2199 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2201 = _2197 || _2199;
    float _2203 = float(_2201);
    float _2205 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2207 = _2205 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2209 = _2071 * _2183;
    float _2211 = _2089;
    if (_1941)
    {
        float _2213 = -_2089;
        float _2215 = _2213 + 1.0;
        _2211 = _2215;
    }
    float _2217 = _2211;
    float _2219 = -_2071;
    float _2221 = _2219 + 1.0;
    float _2223 = fma(_2191, _2041, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2225 = fma(_2207, _2041, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _2227 = _1318 != 0.0;
    bool _2229 = isnan(_1318);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan(0.0);
    bool _2235 = _2231 || _2233;
    float _2237 = _2203 * _2221;
    if (_1927)
    {
        _2087 = _2217;
    }
    float _2239 = _2087;
    float _2241 = -_2203;
    float _2243 = _2241 + 1.0;
    float _2245 = _2179 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2247 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2249 = isnan(_1314);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2255 = _2251 || _2253;
    float _2257 = float(_2255);
    float _2259 = in.m_69.x;
    float _2261 = in.m_69.y;
    float _2263 = in.m_69.z;
    bool _2265 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2267 = isnan(_1314);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2273 = _2269 || _2271;
    float _2275 = float(_2273);
    float _2277 = fma(_2047, _2245, -0.5);
    bool _2279 = _1316 == 0.0;
    bool _2281 = !_2235;
    bool _2283 = _2279 && _2281;
    float _2285 = -_2257;
    float _2287 = _2285 + 1.0;
    float _2289 = _2257 * _2243;
    bool _2291 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2293 = isnan(_1314);
    bool _2295 = _2291 || _2293;
    bool _2297 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2299 = _2295 || _2297;
    float _2301 = float(_2299);
    float _2303 = -_2035;
    float _2305 = fma(_2019, _2277, _2303);
    float _2307 = _2275 * _2287;
    float _2309 = -_2275;
    float _2311 = _2309 + 1.0;
    bool _2313 = _1320 == 0.0;
    bool _2315 = _2313 && _2283;
    float _2317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2319 = _2301 * _2311;
    float _2321 = -_2301;
    float _2323 = _2321 + 1.0;
    out.m_71.x = _1508;
    out.m_71.y = _1506;
    out.m_71.z = _1510;
    float _2325 = _2073 * _2319;
    float _2327 = _2075 * _2319;
    float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2329;
    float _2333 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2335 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2333;
    float _2337 = fma(_2323, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2325);
    float _2339 = fma(_2323, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2327);
    float _2341 = fma(_2331, _2129, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2343 = _2261;
    float _2345 = _2259;
    float _2347 = _2263;
    if (!_2315)
    {
        float _2349 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2261);
        _2343 = _2349;
    }
    float _2351 = _2343;
    float _2353 = fma(_2091, _2307, _2337);
    float _2355 = fma(_2111, _2307, _2339);
    if (!_2315)
    {
        float _2357 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2259);
        _2345 = _2357;
    }
    float _2359 = _2345;
    float _2361 = _2351 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2363 = fma(_2133, _2289, _2353);
    float _2365 = _2351 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2367 = _2351 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (!_2315)
    {
        float _2369 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2263);
        _2347 = _2369;
    }
    float _2371 = _2347;
    float _2373 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2361);
    float _2375 = fma(_2131, _2237, _2363);
    float _2377 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2365);
    float _2379 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2367);
    float _2381 = fma(_2371, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2373);
    float _2383 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2385 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2387 = fma(_2157, _2289, _2355);
    float _2389 = fma(_2173, _2209, _2375);
    float _2391 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2383);
    float _2393 = _2317 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2395 = exp2(_2385);
    float _2397 = fma(_2135, _2237, _2387);
    float _2399 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2391);
    float _2401 = fma(_2335, _2129, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2403 = fma(_2223, _2187, _2389);
    float _2405 = fma(_2185, _2209, _2397);
    float _2407 = fma(_2393, _2239, -0.5);
    float _2409 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2399);
    bool _2411 = _1578 > 0.0;
    bool _2413 = isnan(_1578);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan(0.0);
    bool _2419 = _2415 || _2417;
    float _2421 = fma(_2225, _2187, _2405);
    float _2423 = _1828 * 0.5;
    float _2425 = fma(_2371, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2377);
    float _2427 = fma(_2341, _2171, _2403);
    float _2429 = fma(_2401, _2171, _2421);
    float _2431 = fma(_1864, -0.5, _2423);
    float _2433 = fma(_2093, _2407, _2033);
    float _2435 = -_2395;
    float _2437 = _2435 + 1.0;
    float _2439 = _1578 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2441 = _2409 + _1828;
    float _2443 = _1856 + _1828;
    float _2445 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2447 = fma(_2127, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2427);
    float _2449 = fma(_2127, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2429);
    float _2451 = fma(_2371, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2379);
    float _2453 = -_2445;
    float _2455 = _2453 + 1.0;
    float _2457 = _2305 + 0.5;
    float _2459 = _2433 + 0.5;
    float _2461 = _2441 * 0.5;
    float _2463 = _2443 * 0.5;
    float _2465 = _2439 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.y = _2457;
    out.m_73.x = _2381;
    out.m_73.y = _2425;
    out.m_73.z = _2451;
    out.m_67.x = _2459;
    out.m_75.x = _2447;
    out.m_75.y = _2449;
    out.gl_Position.x = _1856;
    out.gl_Position.y = _1864;
    out.gl_Position.z = _2409;
    out.gl_Position.w = _1828;
    out.m_77.x = _2463;
    out.m_77.y = _2431;
    out.m_77.z = _2461;
    out.m_77.w = _1828;
    out.m_45.x = _2465;
    float _2467 = _2445 * _1890;
    float _2469 = _1901 * _2455;
    float _2471 = _1901 * _2467;
    float _2473 = _1911 * _2467;
    float _2475 = fma(_1907, _2471, _1895);
    float _2477 = fma(_1909, _2471, _1897);
    float _2479 = fma(_1901, _2473, _1899);
    out.m_79.x = _2475;
    out.m_79.y = _2477;
    out.m_79.z = _2479;
    out.m_79.w = _2469;
    if (_2419)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2481 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2481;
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
    bool _1306 = false;
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
        float _2538 = as_type<float>(_114);
        out.gl_Position.z = _2538;
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
        float _2614 = as_type<float>(_154);
        out.gl_Position.z = _2614;
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
    bool _988 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
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
        float _1072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1074 = _120 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[11].w, _136);
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
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1100 = _1096 + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1114 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1116 = isnan(_1096);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1122 = _1118 || _1120;
    float _1124 = float(_1122);
    float _1126 = 1.0 / _1104;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1130 = _1128 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1132 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1134 = isnan(_1096);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    bool _1144 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1146 = 1.0 / _1112;
    float _1148 = _1108 * _1126;
    bool _1150 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1152 = isnan(_1096);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    float _1162 = 1.0 / _1130;
    float _1164 = -_1124;
    float _1166 = _1164 + 1.0;
    float _1168 = fma(_1148, _1100, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1174 = -_1160;
    float _1176 = _1174 + 1.0;
    bool _1178 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1180 = isnan(_1096);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = _1160 * _1166;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1196 = 1.0 / _1172;
    float _1198 = _1142 * _1176;
    float _1200 = -_1188;
    float _1202 = _1200 + 1.0;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1204;
    float _1208 = _1194 * _1146;
    float _1210 = _1168 * _1198;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1214 = _1096 + _1212;
    float _1216 = -_1142;
    float _1218 = _1216 + 1.0;
    float _1220 = _1124 * _1202;
    float _1222 = _1206 * _1162;
    bool _1224 = _1096 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1226 = isnan(_1096);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1232 = _1228 || _1230;
    float _1234 = float(_1232);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1242 = _1096 + _1240;
    float _1244 = fma(_1208, _1214, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1246 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1210);
    float _1248 = -_1234;
    float _1250 = _1248 + 1.0;
    float _1252 = _1238 * _1196;
    float _1254 = fma(_1222, _1242, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1258 = _1096 + _1256;
    float _1260 = fma(_1244, _1190, _1246);
    float _1262 = _1188 * _1250;
    float _1264 = fma(_1252, _1258, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1266 = fma(_1254, _1220, _1260);
    float _1268 = fma(_1264, _1262, _1266);
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1276 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1268);
    float _1278 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1282 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1284 = _1276 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_57.x = _1278;
    out.m_57.y = _1280;
    out.m_57.z = _1282;
    out.m_57.w = _1284;
    bool _1286 = !_1144;
    float _1288 = _1196;
    float _1304;
    if (!_1286)
    {
        float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1292 = _120 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1294 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[14].x, _136);
        float _1296 = _1294 * _1290;
        float _1298 = floor(_1296);
        float _1300 = -_1298;
        float _1302 = _1296 + _1300;
        _1304 = _1302;
        _1306 = true;
    }
    else
    {
        float _1308 = float(_98);
        float _1310 = 1.0 / _1308;
        float _1312 = _136 * _1310;
        _1304 = _1312;
    }
    _1306 = false;
    float _1314 = _1304;
    float _1316 = in.m_59.x;
    float _1318 = in.m_59.y;
    float _1320 = in.m_59.z;
    float _1322 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1324 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1326 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1328 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1330 = isnan(0.5);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1336 = _1332 || _1334;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1316);
    float _1340 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1318);
    float _1342 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1320);
    float _1344 = _1338 * _1322;
    float _1346 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1348 = _1340 * _1324;
    float _1350 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1352 = _1342 * _1326;
    float _1354 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1346);
    float _1356 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1358 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1350);
    float _1360 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1362 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1354);
    float _1364 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1356);
    float _1366 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1368 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1358);
    float _1370 = _1362 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1372 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1360);
    float _1374 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1364);
    float _1376 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1366);
    float _1378 = _1368 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1380 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1372);
    float _1382 = _1370 + _1374;
    float _1384 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1376);
    float _1386 = _1378 + _1380;
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1390 = _1382 + _1388;
    float _1392 = _1384 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1394 = _1380;
    float _1396 = _1344;
    float _1398 = _1352;
    float _1400 = _1348;
    if (_1336)
    {
        _1394 = 1.0;
    }
    float _1402 = _1394;
    float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1406 = _1386 + _1404;
    float _1408 = _1390 * _1390;
    float _1410 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1412 = fma(_1406, _1406, _1408);
    float _1414 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1410);
    float _1416 = sqrt(_1412);
    float _1418 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1414);
    float _1420 = _1392 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1422 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1424 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1420);
    float _1426 = 1.0 / _1422;
    float _1428 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1424);
    float _1430 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1432 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1434 = fma(_1344, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1430);
    bool _1436 = _1416 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1438 = _1432 + _1422;
    float _1440 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1434);
    float _1442 = _1392 + _1440;
    float _1444 = _1438 * _1426;
    float _1446 = _1444 * 0.5;
    float _1448 = _1440;
    float _1450 = _1442;
    float _1452 = _1402;
    float _1454 = _1426;
    if (!_1436)
    {
        _1396 = _1386;
    }
    float _1456 = _1396;
    float _1458 = _1456;
    if (!_1436)
    {
        _1398 = _1382;
    }
    float _1460 = _1398;
    float _1462 = _1460;
    if (!_1436)
    {
        _1448 = _1442;
    }
    float _1464 = _1448;
    bool _1466 = !_1436;
    float _1468 = _1464;
    if (!_1466)
    {
        float _1470 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1474 = _1416 + _1472;
        float _1476 = _1442 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1478 = rsqrt(_1412);
        float _1480 = _1474 * _1470;
        float _1482 = _1480 * 0.15915493667125701904296875;
        float _1484 = _1482 * 6.283185482025146484375;
        float _1486 = cos(_1484);
        float _1488 = _1482 * 6.283185482025146484375;
        float _1490 = sin(_1488);
        float _1492 = _1486 + (-1.0);
        float _1494 = _1492 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1496 = fma(_1490, _1476, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1498 = fma(_1442, _1486, _1494);
        float _1500 = _1478 * _1496;
        float _1502 = fma(_1406, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1504 = fma(_1390, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1468 = _1498;
        _1458 = _1502;
        _1462 = _1504;
    }
    float _1506 = _1468;
    float _1508 = _1458;
    float _1510 = _1462;
    if (!_1336)
    {
        float _1512 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1514 = _1512 * 0.15915493667125701904296875;
        float _1516 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1520 = fma(_1446, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1518);
        float _1522 = _1514 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        float _1526 = _1516 * 0.15915493667125701904296875;
        float _1528 = _1514 * 6.283185482025146484375;
        float _1530 = sin(_1528);
        float _1532 = 1.0 / _1524;
        float _1534 = _1526 * 6.283185482025146484375;
        float _1536 = cos(_1534);
        float _1538 = _1530 * _1532;
        float _1540 = _1526 * 6.283185482025146484375;
        float _1542 = sin(_1540);
        float _1544 = _1536 * _1538;
        float _1546 = 1.0 / _1520;
        float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1550 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1548;
        float _1552 = 1.0 / _1544;
        float _1554 = 1.0 / _1550;
        float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1558 = _1546 * _1556;
        float _1560 = _1542 * _1552;
        float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1564 = fma(_1560, _1558, _1562);
        float _1566 = _1564 * _1554;
        float _1568 = precise::clamp(_1566, 0.0, 1.0);
        float _1570 = -_1568;
        float _1572 = _1570 + 1.0;
        _1450 = _1526;
        _1400 = _1546;
        _1452 = _1572;
    }
    float _1574 = _1450;
    float _1576 = _1400;
    float _1578 = _1452;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1582 = _1506 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1586 = _1508 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1590 = _1510 + _1588;
    float _1592 = _1582 * _1582;
    float _1594 = fma(_1586, _1586, _1592);
    float _1596 = fma(_1590, _1590, _1594);
    float _1598 = rsqrt(_1596);
    float _1600 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1586 * _1600;
    float _1604 = _1590 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 + _1608;
    float _1612 = sqrt(_1610);
    bool _1614 = _1612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1612 + _1616;
    float _1620 = _1574;
    float _1622 = _1618;
    float _1624 = _1582;
    float _1626 = _1602;
    if (_1614)
    {
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1628;
    }
    float _1630 = _1620;
    float _1632 = _1630;
    if (_1614)
    {
        float _1634 = _1618 * _1630;
        _1622 = _1634;
    }
    float _1636 = _1622;
    if (_1614)
    {
        float _1638 = rsqrt(_1610);
        _1632 = _1638;
    }
    float _1640 = _1632;
    float _1642 = _1640;
    if (_1614)
    {
        float _1644 = _1636 * 0.15915493667125701904296875;
        _1454 = _1644;
    }
    float _1646 = _1454;
    float _1648 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1650 = _1590;
    if (_1614)
    {
        float _1652 = _1646 * 6.283185482025146484375;
        float _1654 = sin(_1652);
        _1650 = _1654;
    }
    float _1656 = _1650;
    float _1658 = precise::max(0.0, _1648);
    float _1660 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1662 = _1576;
    float _1664 = _1658;
    if (_1614)
    {
        float _1666 = _1646 * 6.283185482025146484375;
        float _1668 = cos(_1666);
        _1662 = _1668;
    }
    float _1670 = _1662;
    float _1672 = -_1600;
    float _1674 = -_1658;
    float _1676 = fma(_1582, _1672, _1674);
    if (_1614)
    {
        float _1678 = _1676 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1624 = _1678;
    }
    float _1680 = _1624;
    float _1682 = sqrt(_1596);
    float _1684 = _1656;
    float _1686 = _1680;
    if (_1614)
    {
        float _1688 = fma(_1656, _1680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = _1690;
    if (!_1614)
    {
        _1686 = _1676;
    }
    float _1694 = _1686;
    float _1696 = _1694;
    if (_1614)
    {
        float _1698 = _1640 * _1690;
        _1288 = _1698;
    }
    float _1700 = _1288;
    if (!_1614)
    {
        _1692 = _1606;
    }
    float _1702 = _1692;
    float _1704 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1706 = _1702;
    float _1708 = _1670;
    if (_1614)
    {
        float _1710 = _1670 + (-1.0);
        _1664 = _1710;
    }
    float _1712 = _1664;
    float _1714 = _1712;
    if (_1614)
    {
        float _1716 = _1602 * _1700;
        _1626 = _1716;
    }
    float _1718 = _1626;
    float _1720 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1704);
    if (_1614)
    {
        float _1722 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1722;
    }
    float _1724 = _1642;
    if (!_1614)
    {
        _1714 = _1604;
    }
    float _1726 = _1714;
    float _1728 = _1726;
    if (_1614)
    {
        float _1730 = _1604 * _1700;
        _1728 = _1730;
    }
    float _1732 = _1728;
    if (_1614)
    {
        float _1734 = _1718 * _1718;
        _1706 = _1734;
    }
    float _1736 = _1706;
    if (_1614)
    {
        float _1738 = fma(_1676, _1670, _1724);
        _1696 = _1738;
    }
    float _1740 = _1696;
    if (!_1614)
    {
        _1708 = _1608;
    }
    float _1742 = _1708;
    float _1744 = _1742;
    if (_1614)
    {
        float _1746 = _1732 * _1732;
        _1744 = _1746;
    }
    float _1748 = _1744;
    float _1750 = fma(_1740, _1740, _1736);
    float _1752 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1720);
    float _1754 = _1750 + _1748;
    float _1756 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1760 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1758);
    float _1762 = precise::clamp(_1760, 0.0, 1.0);
    float _1764 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1766 = rsqrt(_1754);
    float _1768 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1756);
    float _1770 = -_1762;
    float _1772 = _1770 + 1.0;
    float _1774 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1764);
    float _1776 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1768);
    float _1778 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1780 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1774);
    float _1782 = abs(_1772);
    float _1784 = log2(_1782);
    float _1786 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1788 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1778);
    float _1790 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1792 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1794 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1788);
    float _1796 = _1766 * _1718;
    float _1798 = -_1792;
    float _1800 = fma(_1798, _1660, 1.0);
    float _1802 = _1794 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1804 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1806 = _1766 * _1740;
    float _1808 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1810 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1812 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1804);
    float _1814 = _1766 * _1732;
    float _1816 = -_1808;
    float _1818 = fma(_1806, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1816);
    float _1820 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1822 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1812);
    float _1824 = log2(_1800);
    float _1826 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1828 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1822);
    float _1830 = -_1814;
    float _1832 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1818);
    float _1834 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1836 = exp2(_1820);
    float _1838 = fma(_1832, -0.5, 0.5);
    float _1840 = fma(_1832, 0.5, 0.5);
    float _1842 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1834);
    float _1844 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1826);
    float _1846 = _1806 + 1.0;
    float _1848 = fma(_1840, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1850 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1842);
    float _1852 = 1.0 / _1828;
    float _1854 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1844);
    float _1856 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1850);
    float _1858 = sqrt(_1838);
    float _1860 = -_1806;
    float _1862 = fma(_1836, _1846, _1860);
    float _1864 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1854);
    float _1866 = fma(_1840, _1848, -0.212114393711090087890625);
    float _1868 = _1824 * 0.693147182464599609375;
    float _1870 = fma(_1840, _1866, 1.570728778839111328125);
    float _1872 = _1856 * _1852;
    float _1874 = _1864 * _1852;
    float _1876 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1878 = fma(_1872, 0.5, 0.5);
    float _1880 = fma(_1874, -0.5, 0.5);
    float _1882 = fma(_1862, 0.5, 0.5);
    float _1884 = _1858 * 0.636619746685028076171875;
    float _1886 = -_1870;
    float _1888 = fma(_1884, _1886, 1.0);
    float3 _5447 = float3(_1878, _1880, _1876);
    float _1890 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5447, float3(0.0), isnan(_5447)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5447, float3(0.0), isnan(_5447)), level(0.0)).x;
    float3 _5458 = float3(_1878, _1880, _1876);
    float4 _1893 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5458, float3(0.0), isnan(_5458)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5458, float3(0.0), isnan(_5458)), level(0.0)).xyzw;
    float _1895 = _1893.x;
    float _1897 = _1893.y;
    float _1899 = _1893.z;
    float _1901 = _1893.w;
    float2 _5475 = float2(_1888, _1882);
    float3 _1905 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5475, float2(0.0), isnan(_5475)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5475, float2(0.0), isnan(_5475)), level(0.0)).xyz;
    float _1907 = _1905.x;
    float _1909 = _1905.y;
    float _1911 = _1905.z;
    float _1913 = in.m_61.w;
    float _1915 = _120 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1917;
    float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1923 = _1921 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1927 = _1925 != 0;
    float _1929 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1931 = _1314 + _1929;
    float _1933 = 1.0 / _1919;
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1937 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1935;
    bool _1939 = _120 > 0.5;
    bool _1941 = _1939 && _1927;
    float _1943 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1945 = _1943 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1947 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1949 = _1314 + _1947;
    float _1951 = 1.0 / _1923;
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1955 = _122 > 0.5;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1959 = _1314 + _1957;
    int _1961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1963 = _1961 != 0;
    float _1965 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1967 = -_1953;
    float _1969 = fma(_1915, 2.0, _1967);
    float _1971 = 1.0 / _1937;
    float _1973 = in.m_63.y;
    float _1975 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1965);
    float _1977 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1979 = _1977 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1981 = _1931 * _1933;
    out.m_65.w = _1913;
    float _1983 = _122 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1985 = 1.0 / _1945;
    float _1987 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1987;
    float _1991 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1995 = _1314 + _1993;
    float _1997 = in.m_63.x;
    float _1999 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2001 = _1995 * _1951;
    float _2003 = 1.0 / _1979;
    float _2005 = fma(_1983, -2.0, _1991);
    float _2007 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1999);
    float _2009 = _1959 * _1971;
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2013 = _1314 + _2011;
    float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _2015;
    float _2019 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2007);
    float _2021 = 1.0 / _1989;
    float _2023 = -_1973;
    float _2025 = _2023 + 1.0;
    float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2029 = _1314 + _2027;
    float _2031 = -_136;
    float _2033 = fma(_2031, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1969);
    float _2035 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2005);
    float _2037 = _2029 * _1985;
    int _2039 = _1955 ? as_type<int>(_2025) : as_type<int>(_1973);
    float _2041 = _1949 * _2003;
    float _2043 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2045 = _1314 + _2043;
    out.m_67.w = _1973;
    float _2047 = _1963 ? as_type<float>(_2039) : _1973;
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _2049;
    float _2053 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2053;
    float _2057 = _2013 * _2021;
    float _2059 = 1.0 / _2051;
    bool _2061 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2063 = isnan(_1314);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = fma(_2055, _1981, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2075 = fma(_2017, _1981, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2079 = _2077 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2081 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _2081;
    float _2085 = 0.0;
    float _2087 = _1997;
    if (_1927)
    {
        _2085 = _1997;
    }
    float _2089 = _2085;
    float _2091 = fma(_2079, _2001, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2093 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1975);
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _2097 = _2095 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2099;
    float _2103 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _2103;
    float _2107 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2109 = _2107 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2111 = fma(_2097, _2001, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _2115 = _2113 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    bool _2117 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2119 = isnan(_1314);
    bool _2121 = _2117 || _2119;
    bool _2123 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2125 = _2121 || _2123;
    float _2127 = float(_2125);
    float _2129 = _2045 * _2059;
    float _2131 = fma(_2109, _2037, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2133 = fma(_2101, _2009, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2135 = fma(_2115, _2037, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    bool _2137 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2139 = isnan(_1314);
    bool _2141 = _2137 || _2139;
    bool _2143 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2145 = _2141 || _2143;
    float _2147 = float(_2145);
    float _2149 = -_2127;
    float _2151 = _2149 + 1.0;
    float _2153 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2155 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2153;
    float _2157 = fma(_2105, _2009, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    bool _2159 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2161 = isnan(_1314);
    bool _2163 = _2159 || _2161;
    bool _2165 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2167 = _2163 || _2165;
    float _2169 = float(_2167);
    float _2171 = _2147 * _2151;
    float _2173 = fma(_2155, _2057, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2175 = -_2147;
    float _2177 = _2175 + 1.0;
    float _2179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2181 = -_2169;
    float _2183 = _2181 + 1.0;
    float _2185 = fma(_2083, _2057, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _2187 = _2169 * _2177;
    float _2189 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2191 = _2189 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2193 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2195 = isnan(_1314);
    bool _2197 = _2193 || _2195;
    bool _2199 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2201 = _2197 || _2199;
    float _2203 = float(_2201);
    float _2205 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _2207 = _2205 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2209 = _2071 * _2183;
    float _2211 = _2089;
    if (_1941)
    {
        float _2213 = -_2089;
        float _2215 = _2213 + 1.0;
        _2211 = _2215;
    }
    float _2217 = _2211;
    float _2219 = -_2071;
    float _2221 = _2219 + 1.0;
    float _2223 = fma(_2191, _2041, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2225 = fma(_2207, _2041, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _2227 = _1318 != 0.0;
    bool _2229 = isnan(_1318);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan(0.0);
    bool _2235 = _2231 || _2233;
    float _2237 = _2203 * _2221;
    if (_1927)
    {
        _2087 = _2217;
    }
    float _2239 = _2087;
    float _2241 = -_2203;
    float _2243 = _2241 + 1.0;
    float _2245 = _2179 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2247 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2249 = isnan(_1314);
    bool _2251 = _2247 || _2249;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2255 = _2251 || _2253;
    float _2257 = float(_2255);
    float _2259 = in.m_69.x;
    float _2261 = in.m_69.y;
    float _2263 = in.m_69.z;
    bool _2265 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2267 = isnan(_1314);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2273 = _2269 || _2271;
    float _2275 = float(_2273);
    float _2277 = fma(_2047, _2245, -0.5);
    bool _2279 = _1316 == 0.0;
    bool _2281 = !_2235;
    bool _2283 = _2279 && _2281;
    float _2285 = -_2257;
    float _2287 = _2285 + 1.0;
    float _2289 = _2257 * _2243;
    bool _2291 = _1314 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2293 = isnan(_1314);
    bool _2295 = _2291 || _2293;
    bool _2297 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2299 = _2295 || _2297;
    float _2301 = float(_2299);
    float _2303 = -_2035;
    float _2305 = fma(_2019, _2277, _2303);
    float _2307 = _2275 * _2287;
    float _2309 = -_2275;
    float _2311 = _2309 + 1.0;
    bool _2313 = _1320 == 0.0;
    bool _2315 = _2313 && _2283;
    float _2317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2319 = _2301 * _2311;
    float _2321 = -_2301;
    float _2323 = _2321 + 1.0;
    out.m_71.x = _1508;
    out.m_71.y = _1506;
    out.m_71.z = _1510;
    float _2325 = _2073 * _2319;
    float _2327 = _2075 * _2319;
    float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2329;
    float _2333 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _2335 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _2333;
    float _2337 = fma(_2323, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2325);
    float _2339 = fma(_2323, (*spvDescriptorSet0.vp_c9)._m0[159].y, _2327);
    float _2341 = fma(_2331, _2129, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2343 = _2261;
    float _2345 = _2259;
    float _2347 = _2263;
    if (!_2315)
    {
        float _2349 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2261);
        _2343 = _2349;
    }
    float _2351 = _2343;
    float _2353 = fma(_2091, _2307, _2337);
    float _2355 = fma(_2111, _2307, _2339);
    if (!_2315)
    {
        float _2357 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2259);
        _2345 = _2357;
    }
    float _2359 = _2345;
    float _2361 = _2351 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2363 = fma(_2133, _2289, _2353);
    float _2365 = _2351 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2367 = _2351 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (!_2315)
    {
        float _2369 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2263);
        _2347 = _2369;
    }
    float _2371 = _2347;
    float _2373 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2361);
    float _2375 = fma(_2131, _2237, _2363);
    float _2377 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2365);
    float _2379 = fma(_2359, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2367);
    float _2381 = fma(_2371, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2373);
    float _2383 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2385 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2387 = fma(_2157, _2289, _2355);
    float _2389 = fma(_2173, _2209, _2375);
    float _2391 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2383);
    float _2393 = _2317 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2395 = exp2(_2385);
    float _2397 = fma(_2135, _2237, _2387);
    float _2399 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2391);
    float _2401 = fma(_2335, _2129, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _2403 = fma(_2223, _2187, _2389);
    float _2405 = fma(_2185, _2209, _2397);
    float _2407 = fma(_2393, _2239, -0.5);
    float _2409 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2399);
    bool _2411 = _1578 > 0.0;
    bool _2413 = isnan(_1578);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan(0.0);
    bool _2419 = _2415 || _2417;
    float _2421 = fma(_2225, _2187, _2405);
    float _2423 = _1828 * 0.5;
    float _2425 = fma(_2371, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2377);
    float _2427 = fma(_2341, _2171, _2403);
    float _2429 = fma(_2401, _2171, _2421);
    float _2431 = fma(_1864, -0.5, _2423);
    float _2433 = fma(_2093, _2407, _2033);
    float _2435 = -_2395;
    float _2437 = _2435 + 1.0;
    float _2439 = _1578 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2441 = _2409 + _1828;
    float _2443 = _1856 + _1828;
    float _2445 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2447 = fma(_2127, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2427);
    float _2449 = fma(_2127, (*spvDescriptorSet0.vp_c9)._m0[166].y, _2429);
    float _2451 = fma(_2371, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2379);
    float _2453 = -_2445;
    float _2455 = _2453 + 1.0;
    float _2457 = _2305 + 0.5;
    float _2459 = _2433 + 0.5;
    float _2461 = _2441 * 0.5;
    float _2463 = _2443 * 0.5;
    float _2465 = _2439 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.y = _2457;
    out.m_73.x = _2381;
    out.m_73.y = _2425;
    out.m_73.z = _2451;
    out.m_67.x = _2459;
    out.m_75.x = _2447;
    out.m_75.y = _2449;
    out.gl_Position.x = _1856;
    out.gl_Position.y = _1864;
    out.gl_Position.z = _2409;
    out.gl_Position.w = _1828;
    out.m_77.x = _2463;
    out.m_77.y = _2431;
    out.m_77.z = _2461;
    out.m_77.w = _1828;
    out.m_45.x = _2465;
    float _2467 = _2445 * _1890;
    float _2469 = _1901 * _2455;
    float _2471 = _1901 * _2467;
    float _2473 = _1911 * _2467;
    float _2475 = fma(_1907, _2471, _1895);
    float _2477 = fma(_1909, _2471, _1897);
    float _2479 = fma(_1901, _2473, _1899);
    out.m_79.x = _2475;
    out.m_79.y = _2477;
    out.m_79.z = _2479;
    out.m_79.w = _2469;
    if (_2419)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2481 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2481;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

