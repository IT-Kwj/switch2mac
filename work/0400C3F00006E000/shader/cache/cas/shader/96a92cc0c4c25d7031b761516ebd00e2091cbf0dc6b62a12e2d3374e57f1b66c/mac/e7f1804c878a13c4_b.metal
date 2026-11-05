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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_55 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2025 = false;
    bool _472 = false;
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2501 = as_type<float>(_108);
        out.gl_Position.z = _2501;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2571 = as_type<float>(_146);
        out.gl_Position.z = _2571;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_51.w;
    float _150 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_49.x;
    float _164 = in.m_49.y;
    float _166 = in.m_49.z;
    float _168 = in.m_44.x;
    float _170 = in.m_44.y;
    float _172 = in.m_44.z;
    float _174 = 0.0;
    float _176 = _150;
    if (!_160)
    {
        float _178 = _150 * _150;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = _182;
    if (!_160)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_160;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _150 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _150);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_160;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _150 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _176 = _246;
    }
    float _248 = _176;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _162, _252);
    float _260 = fma(_248, _164, _254);
    float _262 = fma(_248, _166, _256);
    float _264 = fma(_258, _148, _168);
    float _266 = fma(_260, _148, _170);
    float _268 = fma(_262, _148, _172);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_53.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_92);
        float _294 = 1.0 / _292;
        float _296 = _126 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _302 = _298 + _300;
    bool _304 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _306 = isnan(_298);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _318 = _298 + _316;
    bool _320 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _322 = isnan(_298);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _340 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _342 = isnan(_298);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = 1.0 / _334;
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _356 = 1.0 / _338;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _358;
    float _362 = _302 * _352;
    float _364 = -_314;
    float _366 = _364 + 1.0;
    float _368 = -_350;
    float _370 = _368 + 1.0;
    float _372 = fma(_360, _362, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _374 = _350 * _366;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _380;
    float _384 = _330 * _370;
    float _386 = _318 * _356;
    float _388 = fma(_378, _362, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _390 = fma(_382, _362, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _392 = _372 * _384;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _398 = _388 * _384;
    float _400 = _390 * _384;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _410 = -_330;
    float _412 = _410 + 1.0;
    float _414 = fma(_396, _386, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _416 = fma(_404, _386, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _418 = fma(_408, _386, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _420 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].x, _398);
    float _422 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].y, _392);
    float _424 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].z, _400);
    float _426 = fma(_416, _374, _420);
    float _428 = fma(_414, _374, _422);
    float _430 = fma(_418, _374, _424);
    float _432 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].x, _426);
    float _434 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].y, _428);
    float _436 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].z, _430);
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _440 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _442 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _444 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _446 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _446;
    out.m_55.y = _448;
    out.m_55.z = _450;
    out.m_55.w = _438;
    bool _452 = !_354;
    float _470;
    if (!_452)
    {
        float _454 = in.m_53.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_92);
        float _476 = 1.0 / _474;
        float _478 = _126 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _484 = int(_482);
    float _486 = in.m_57.x;
    float _488 = in.m_57.y;
    float _490 = in.m_57.z;
    float _492 = _266 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _496 = _494 != 0;
    float _498 = in.m_51.x;
    float _500 = in.m_51.y;
    float _502 = in.m_51.z;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _506 = _504 != 0;
    float _508 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _510 = int(_508);
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _514 = _512 != 0;
    float _516 = in.m_59.y;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _520 = _518 != 0;
    float _522 = _266 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _526 = _524 != 0;
    float _528 = _266 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _530 = float(_92);
    float _532 = _266 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _534 = float(_484);
    float _536 = in.m_53.x;
    float _538 = in.m_53.y;
    float _540 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[14].x, _492);
    float _542 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[14].w, _532);
    float _544 = 1.0 / _534;
    float _546 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[14].y, _522);
    float _548 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[14].z, _528);
    float _550 = float(uint(_510));
    float _552 = 0.0;
    if (_496)
    {
        float _554 = in.m_53.x;
        _552 = _554;
    }
    float _556 = _552;
    float _558 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _486);
    float _560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _490);
    float _562 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _564 = log2(_562);
    float _566 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _488);
    float _568 = _502 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _570 = -_516;
    float _572 = _570 + 1.0;
    float _574 = _500 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _576 = _544 * _126;
    float _578 = 1.0 / _550;
    float _580 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _584 = _538 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _586 = _538 > 0.5;
    float _588 = _538 * 2.0;
    float _590 = trunc(_576);
    int _592 = int(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _598;
    float _602 = _516;
    if (_506)
    {
        float _604 = _586 ? _572 : _516;
        _602 = _604;
    }
    float _606 = _602;
    float _608 = _536 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _612 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _580);
    float _614 = _564 * _126;
    float _616 = -_582;
    float _618 = fma(_608, 2.0, _616);
    int _620 = as_type<int>(_578) + (-2);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _626 = 1.0 / _600;
    float _628 = fma(_584, -2.0, _610);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _632 = _480 + _630;
    float _634 = float(uint(_592));
    float _636 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _638 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _640 = as_type<float>(_620) * _634;
    float _642 = 1.0 / _624;
    float _644 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _636);
    float _646 = _536 * 2.0;
    float _648 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _638);
    int _650 = ~_510;
    int _652 = _650 + 1;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _656 = _480 + _654;
    bool _658 = _556 > 0.5;
    bool _660 = _658 && _496;
    float _662 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[16].x, _540);
    float _664 = trunc(_640);
    float _666 = precise::max(_664, 0.0);
    uint _669 = uint(_666);
    float _671 = _656 * _626;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _675 = _480 + _673;
    float _677 = float(_510);
    float _679 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[16].y, _546);
    bool _681 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _683 = isnan(0.0);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _689 = _685 || _687;
    float _691 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[16].z, _548);
    float _693 = exp2(_614);
    float _695 = _675 * _642;
    float _697 = _677 * _126;
    float _699 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[16].w, _542);
    float _701 = in.m_53.z;
    float _703 = -_126;
    float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[76].x, _618);
    float _707 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _628);
    float _709 = 1.0 / _530;
    int _711 = _652 * int(_669);
    int _713 = _711 + _592;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _717 = !_520;
    int _719 = _717 ? 0 : 1;
    float _721 = _498 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _723 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[78].w, _715);
    float _725 = float(uint(_713));
    float _727 = floor(_646);
    float _729 = -_693;
    float _731 = _729 + 1.0;
    float _733 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _612);
    float _735 = as_type<float>(_620) * _725;
    float _737 = _721 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _739 = _689 ? _731 : 0.0;
    float _741 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _743 = 1.0 / _596;
    float _745 = _697 * _709;
    float _747 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _749 = _701 * 2.0;
    float _751 = _737 * _558;
    float _753 = _741 * _566;
    float _755 = floor(_588);
    float _757 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _759 = _727 >= 0.0;
    bool _761 = isnan(_727);
    bool _763 = _759 || _761;
    bool _765 = isnan(0.0);
    bool _767 = _763 || _765;
    float _769 = _691 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    bool _771 = _727 > 0.0;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _775 = 1.0 + _773;
    int _777 = _767 ? 0 : 1;
    float _779 = _632 * _743;
    bool _781 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _783 = isnan(1.0);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _789 = _785 || _787;
    float _791 = 1.0 / _775;
    float _793 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _723);
    int _795 = ~_510;
    int _797 = _795 + 1;
    float _799 = _757 * _560;
    float _801 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _644);
    float _803 = -_707;
    float _805 = fma(_793, _747, _803);
    float _807 = trunc(_735);
    float _809 = precise::max(_807, 0.0);
    uint _811 = uint(_809);
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _819;
    float _823 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[78].z, _813);
    float _825 = fma(_817, _671, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _827 = floor(_749);
    float _829 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _823);
    int _831 = ~_777;
    int _833 = _831 + 1;
    int _835 = _833 + 1;
    int _837 = _835;
    if (_789)
    {
        float _839 = _739 * _791;
        _128 = _839;
    }
    float _841 = _128;
    if (!_771)
    {
        int _843 = ~_777;
        int _845 = _843 + 1;
        _837 = _845;
    }
    int _847 = _837;
    float _849 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _648);
    bool _851 = _755 > 0.0;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _857 = _755 >= 0.0;
    bool _859 = isnan(_755);
    bool _861 = _857 || _859;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    float _867 = sqrt(_801);
    float _869 = _699 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    int _871 = int(_669) + int(_811);
    int _873 = _865 ? 0 : 1;
    int _875 = _797 * _871;
    int _877 = _875 + _592;
    bool _879 = !_526;
    float _881 = _879 ? 7.345489978790283203125 : 1.0;
    float _883 = sqrt(_733);
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _887 = _885 != 0;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _891 = _889 != 0;
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _895 = _893 != 0;
    int _897 = ~_873;
    int _899 = _897 + 1;
    int _901 = _899 + 1;
    float _903 = _881 * _536;
    int _905 = _901;
    if (!_851)
    {
        int _907 = ~_873;
        int _909 = _907 + 1;
        _905 = _909;
    }
    int _911 = _905;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _917 = !_891;
    int _919 = _917 ? 0 : 1;
    float _921 = floor(_903);
    bool _923 = uint(_877) >= uint(_510);
    float _925 = _538 + _701;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _929 = _927 != 0;
    float _931 = _538 + _536;
    bool _933 = !_887;
    int _935 = _933 ? 0 : 1;
    float _937 = fma(_915, _695, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _939 = !_895;
    int _941 = _939 ? 0 : 1;
    float _943 = _931 + (-1.0);
    bool _945 = !_923;
    int _947 = _945 ? 0 : (-1);
    float _949 = sqrt(_849);
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _957 = _955 != 0;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _961 = _959 != 0;
    float _963 = _701 + _536;
    float _965 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _967 = _963 + (-1.0);
    float _969 = _925 + (-1.0);
    float _971 = -_921;
    float _973 = _903 + _971;
    int _975 = ~_871;
    int _977 = _975 + _947;
    int _979 = _977 + 1;
    float _981 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _983 = !_957;
    int _985 = _983 ? 0 : 1;
    float _987 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _989 = _827 >= 0.0;
    bool _991 = isnan(_827);
    bool _993 = _989 || _991;
    bool _995 = isnan(0.0);
    bool _997 = _993 || _995;
    float _999 = _973 * _677;
    int _1001 = _510 * _979;
    int _1003 = _1001 + _592;
    int _1005 = _997 ? 0 : 1;
    float _1007 = trunc(_745);
    int _1009 = int(_1007);
    bool _1011 = _827 > 0.0;
    float _1013 = _949 * _769;
    float _1015 = _538 + (-0.5);
    int _1017 = ~_1005;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    float _1023 = _536 + (-0.5);
    int _1025 = abs(_985);
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1027;
    int _1031 = abs(_919);
    float _1033 = float(_847);
    float _1035 = fma(_1029, _671, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1037 = fma(_821, _671, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1047;
    float _1051 = _662 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1053 = fma(_1041, _695, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1055 = float(_592);
    float _1057 = fma(_855, _695, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1059 = _679 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1061 = fma(_1045, _779, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    bool _1063 = _1055 >= _677;
    bool _1065 = isnan(_1055);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan(_677);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = _883 * _1051;
    int _1077 = abs(_719);
    float _1079 = _867 * _1059;
    float _1081 = trunc(_1073);
    int _1083 = int(_1081);
    int _1085 = _1021;
    if (!_1011)
    {
        int _1087 = ~_1005;
        int _1089 = _1087 + 1;
        _1085 = _1089;
    }
    int _1091 = _1085;
    float _1093 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1095 = _510 == 0;
    float _1097 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1099 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1101 = !_961;
    int _1103 = _1101 ? 0 : 1;
    float _1105 = trunc(_999);
    int _1107 = int(_1105);
    float _1109 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1093);
    bool _1111 = !_1095;
    int _1113 = _1111 ? _1003 : (-1);
    int _1115 = abs(_941);
    float _1117 = float(_911);
    int _1119 = ~_1083;
    int _1121 = _1119 + 1;
    int _1123 = _1121 + 1;
    float _1125 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1097);
    int _1127 = _510 + (-1);
    float _1129 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1099);
    bool _1131 = !_953;
    int _1133 = _1131 ? 0 : 1;
    int _1135 = _1113 * _1123;
    float _1137 = float(_1091);
    int _1139 = _1107 * _1077;
    int _1141 = _1139 + _592;
    int _1143 = _1083 * _1127;
    int _1145 = _1143 + _1135;
    float _1147 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1125);
    int _1149 = abs(_1103);
    float _1151 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1109);
    float _1153 = float(_1025);
    float _1155 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1129);
    int _1157 = abs(_935);
    float _1159 = _1153 * _1033;
    int _1161 = abs(_1133);
    int _1163 = _1145 * _1031;
    float _1165 = in.m_61.x;
    float _1167 = in.m_61.y;
    float _1169 = in.m_61.z;
    bool _1171 = !_929;
    int _1173 = _1171 ? 0 : 1;
    int _1175 = _1009 * _1157;
    int _1177 = _1175 + _1163;
    float _1179 = float(_1149);
    float _1181 = _1159 * (-2.0);
    float _1183 = float(_1161);
    float _1185 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1155);
    float _1187 = _1179 * _1117;
    int _1189 = abs(_1173);
    float _1191 = _1183 * _1137;
    float _1193 = fma(_987, _1181, _987);
    int _1195 = _1141 * _1115;
    int _1197 = _1195 + _1177;
    float _1199 = _1187 * (-2.0);
    float _1201 = float(uint(_1141));
    float _1203 = _1191 * (-2.0);
    int _1205 = _1107 * _1189;
    int _1207 = _1205 + _1197;
    float _1209 = fma(_981, _1199, _981);
    float _1211 = as_type<float>(_620) * _1201;
    float _1213 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1151);
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1215;
    float _1219 = in.m_59.x;
    float _1221 = fma(_1199, _1169, _1169);
    float _1223 = float(uint(_1207));
    float _1225 = fma(_1181, _1167, _1167);
    float _1227 = _701 + (-0.5);
    float _1229 = fma(_1217, _779, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1231 = trunc(_1211);
    float _1233 = precise::max(_1231, 0.0);
    uint _1235 = uint(_1233);
    float _1237 = as_type<float>(_620) * _1223;
    float _1239 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1225);
    float _1241 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1221);
    int _1243 = ~_510;
    int _1245 = _1243 + 1;
    float _1247 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1147);
    float _1249 = fma(_1193, _841, _1239);
    int _1251 = ~_510;
    int _1253 = _1251 + 1;
    float _1255 = trunc(_1237);
    float _1257 = precise::max(_1255, 0.0);
    uint _1259 = uint(_1257);
    bool _1261 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1263 = isnan(_480);
    bool _1265 = _1261 || _1263;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1269 = _1265 || _1267;
    float _1271 = float(_1269);
    float _1273 = _1249 * 0.15915493667125701904296875;
    float _1275 = _1247 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    bool _1277 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1279 = isnan(_480);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = fma(_1209, _841, _1241);
    bool _1291 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1293 = isnan(_480);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1299 = _1295 || _1297;
    float _1301 = float(_1299);
    int _1303 = _1245 * int(_1235);
    int _1305 = _1303 + _1141;
    bool _1307 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1309 = isnan(_480);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = -_1287;
    float _1321 = _1319 + 1.0;
    float _1323 = _1273 * 6.283185482025146484375;
    float _1325 = sin(_1323);
    float _1327 = -_1301;
    float _1329 = _1327 + 1.0;
    float _1331 = float(uint(_1305));
    float _1333 = _1301 * _1321;
    float _1335 = _1289 * 0.15915493667125701904296875;
    int _1337 = _1253 * int(_1259);
    int _1339 = _1337 + _1207;
    float _1341 = fma(_1049, _779, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1343 = as_type<float>(_620) * _1331;
    float _1345 = _1273 * 6.283185482025146484375;
    float _1347 = cos(_1345);
    float _1349 = _1317 * _1329;
    float _1351 = float(uint(_1339));
    float _1353 = -_1317;
    float _1355 = _1353 + 1.0;
    float _1357 = as_type<float>(_620) * _1351;
    float _1359 = _1271 * _1355;
    float _1361 = _1213 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1363 = -_1275;
    float _1365 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1367 = _1351;
    float _1369 = _1219;
    float _1371 = _1275;
    float _1373 = _1341;
    if (_496)
    {
        _1367 = _1219;
    }
    float _1375 = _1367;
    float _1377 = _825 * _1359;
    float _1379 = _1185 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1381 = -_1361;
    float _1383 = _1381 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1385 = _1365 * _1365;
    float _1387 = _1035 * _1359;
    float _1389 = -_1379;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1393 = trunc(_1357);
    float _1395 = precise::max(_1393, 0.0);
    uint _1397 = uint(_1395);
    float _1399 = fma(_1383, _1383, _1385);
    float _1401 = _1037 * _1359;
    float _1403 = _1375;
    if (_660)
    {
        float _1405 = -_1375;
        float _1407 = _1405 + 1.0;
        _1403 = _1407;
    }
    float _1409 = _1403;
    float _1411 = -_1271;
    float _1413 = _1411 + 1.0;
    float _1415 = fma(_1391, _1391, _1399);
    if (_496)
    {
        _1369 = _1409;
    }
    float _1417 = _1369;
    float _1419 = fma(_1203, _1165, _1165);
    float _1421 = fma(_965, _1203, _965);
    float _1423 = rsqrt(_1415);
    float _1425 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1387);
    float _1427 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1419);
    int _1429 = ~_510;
    int _1431 = _1429 + 1;
    float _1433 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1435 = int(_1259) + int(_1397);
    float _1437 = fma(_1421, _841, _1427);
    float _1439 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1377);
    float _1441 = trunc(_1343);
    float _1443 = precise::max(_1441, 0.0);
    uint _1445 = uint(_1443);
    float _1447 = fma(_829, _1433, _705);
    float _1449 = _1437 * 0.15915493667125701904296875;
    float _1451 = fma(_1053, _1349, _1425);
    int _1453 = _1431 * _1435;
    int _1455 = _1453 + _1207;
    float _1457 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1401);
    float _1459 = fma(_937, _1349, _1439);
    float _1461 = fma(_1061, _1333, _1451);
    float _1463 = _1383 * _1423;
    float _1465 = _1335 * 6.283185482025146484375;
    float _1467 = sin(_1465);
    bool _1469 = uint(_1455) >= uint(_510);
    float _1471 = _1391 * _1423;
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1475 = _1463 * _1473;
    float _1477 = _1365 * _1423;
    bool _1479 = !_1469;
    int _1481 = _1479 ? 0 : (-1);
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1485 = _1471 * _1483;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1489 = -_1475;
    float _1491 = fma(_1471, _1487, _1489);
    float _1493 = _1335 * 6.283185482025146484375;
    float _1495 = cos(_1493);
    int _1497 = int(_1235) + int(_1445);
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1501 = _1477 * _1499;
    float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1505 = -_1485;
    float _1507 = fma(_1477, _1503, _1505);
    float _1509 = _1491 * _1491;
    float _1511 = fma(_1057, _1349, _1457);
    int _1513 = ~_1435;
    int _1515 = _1513 + _1481;
    int _1517 = _1515 + 1;
    float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1521 = -_1501;
    float _1523 = fma(_1463, _1519, _1521);
    float _1525 = _1449 * 6.283185482025146484375;
    float _1527 = sin(_1525);
    float _1529 = fma(_1507, _1507, _1509);
    float _1531 = _1325 * _1467;
    int _1533 = _510 * _1517;
    int _1535 = _1533 + _1207;
    float _1537 = fma(_1229, _1333, _1459);
    float _1539 = fma(_1523, _1523, _1529);
    float _1541 = _1449 * 6.283185482025146484375;
    float _1543 = cos(_1541);
    float _1545 = _1347 * _1495;
    float _1547 = fma(_1527, _1531, _1545);
    float _1549 = fma(_1527, _1545, _1531);
    float _1551 = _1325 * _1495;
    float _1553 = _1347 * _1467;
    float _1555 = rsqrt(_1539);
    float _1557 = _1549 * _753;
    float _1559 = -_1553;
    float _1561 = fma(_1527, _1551, _1559);
    float _1563 = _1543 * _1495;
    float _1565 = -_1551;
    float _1567 = fma(_1527, _1553, _1565);
    bool _1569 = !_1095;
    int _1571 = _1569 ? _1535 : (-1);
    float _1573 = _1543 * _1467;
    float _1575 = _1563 * _753;
    float _1577 = _1561 * _753;
    int _1579 = _1571 >> 31;
    float _1581 = fma(_1567, _751, _1557);
    float _1583 = fma(_1573, _751, _1575);
    float _1585 = _1543 * _799;
    int _1587 = _1579 & 3;
    float _1589 = fma(_1547, _751, _1577);
    float _1591 = _1491 * _1555;
    float _1593 = -_1527;
    float _1595 = fma(_1593, _799, _1583);
    float _1597 = _1507 * _1555;
    int _1599 = _1571 + _1587;
    float _1601 = _1523 * _1555;
    float _1603 = _1471 * _1591;
    float _1605 = _1477 * _1597;
    int _1607 = _1599 >> 2;
    float _1609 = fma(_1325, _1585, _1589);
    float _1611 = -_1603;
    float _1613 = fma(_1477, _1601, _1611);
    float _1615 = -_1605;
    float _1617 = fma(_1463, _1591, _1615);
    int _1619 = _1607 << 4;
    int _1621 = _1619 + 368;
    float _1623 = fma(_1347, _1585, _1581);
    float _1625 = _1613 * _1595;
    float _1627 = _1617 * _1595;
    uint _1629 = uint(int(uint(_1621) >> uint(2)));
    uint _1631 = uint(int(uint(int(_1629)) >> uint(2)));
    int _1633 = int(_1629) & 3;
    float _1635 = (*spvDescriptorSet0.vp_c9)._m0[int(_1631)][_1633];
    int _1637 = int(_1629) + 1;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    int _1641 = _1637 & 3;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[int(_1639)][_1641];
    int _1645 = ~_510;
    int _1647 = _1645 + 1;
    float _1649 = fma(_1597, _1609, _1625);
    float _1651 = fma(_1601, _1609, _1627);
    int _1653 = _1571 & 3;
    bool _1655 = _1653 != 0;
    float _1657 = fma(_1463, _1623, _1649);
    float _1659 = fma(_1471, _1623, _1651);
    int _1661 = _1647 * _1497;
    int _1663 = _1661 + _1141;
    int _1665 = _1621 + 8;
    uint _1667 = uint(int(uint(_1665) >> uint(2)));
    uint _1669 = uint(int(uint(int(_1667)) >> uint(2)));
    int _1671 = int(_1667) & 3;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[int(_1669)][_1671];
    int _1675 = int(_1667) + 1;
    uint _1677 = uint(int(uint(_1675) >> uint(2)));
    int _1679 = _1675 & 3;
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[int(_1677)][_1679];
    float _1683 = _1361 + _1657;
    float _1685 = _1379 + _1659;
    int _1687 = _1571 & 3;
    bool _1689 = _1687 != 0;
    bool _1691 = uint(_1663) >= uint(_510);
    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1695 = _1683 + _1693;
    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1699 = _1685 + _1697;
    float _1701 = _1463 * _1601;
    bool _1703 = !_1691;
    int _1705 = _1703 ? 0 : (-1);
    float _1707 = _1695 * _1695;
    bool _1709 = uint(_1687) > 1u;
    float _1711 = _1699 * _1699;
    int _1713 = _1655 ? 0 : 1;
    float _1715 = -_1701;
    float _1717 = fma(_1471, _1597, _1715);
    int _1719 = ~_1497;
    int _1721 = _1719 + _1705;
    int _1723 = _1721 + 1;
    float _1725 = _1707 + _1711;
    int _1727 = ~_1713;
    int _1729 = _1727 + 1;
    int _1731 = _1729 + 1;
    float _1733 = _1717 * _1595;
    bool _1735 = _1687 != 3;
    float _1737 = sqrt(_1725);
    bool _1739 = uint(_1687) >= 2u;
    float _1741 = fma(_1591, _1609, _1733);
    bool _1743 = !_1689;
    int _1745 = _1743 ? 0 : 1;
    int _1747 = _1731;
    float _1749 = _1707;
    float _1751 = _1711;
    if (!_1709)
    {
        int _1753 = ~_1713;
        int _1755 = _1753 + 1;
        _1747 = _1755;
    }
    int _1757 = _1747;
    float _1759 = fma(_1477, _1623, _1741);
    int _1761 = _1739 ? 0 : 1;
    int _1763 = abs(_1757);
    float _1765 = _1275 + _1759;
    int _1767 = ~_1761;
    int _1769 = _1767 + 1;
    int _1771 = _1769 + 1;
    int _1773 = abs(_1745);
    int _1775 = ~_1763;
    int _1777 = _1775 + 1;
    int _1779 = _1777 + 1;
    bool _1781 = _1737 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1783 = _1771;
    if (_1735)
    {
        int _1785 = ~_1761;
        int _1787 = _1785 + 1;
        _1783 = _1787;
    }
    int _1789 = _1783;
    int _1791 = _1779 * as_type<int>(_1643);
    bool _1793 = _1687 != 3;
    int _1795 = ~_1773;
    int _1797 = _1795 + 1;
    int _1799 = _1797 + 1;
    int _1801 = abs(_1789);
    bool _1803 = !_514;
    int _1805 = _1803 ? 0 : 1;
    int _1807 = _1799 * as_type<int>(_1635);
    int _1809 = _1807 + _1791;
    bool _1811 = !_1793;
    float _1813 = _1811 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _1815 = ~_1801;
    int _1817 = _1815 + 1;
    int _1819 = _1817 + 1;
    int _1821 = abs(_1805);
    int _1823 = abs(as_type<int>(_1813));
    int _1825 = _1819 * as_type<int>(_1673);
    int _1827 = _1825 + _1809;
    float _1829 = _1673;
    float _1831 = _1813;
    if (!_1781)
    {
        _1371 = _1683;
    }
    float _1833 = _1371;
    float _1835 = _1833;
    if (!_1781)
    {
        _1829 = _1685;
    }
    float _1837 = _1829;
    int _1839 = ~_1823;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    float _1845 = _1837;
    if (!_1781)
    {
        _1831 = _1765;
    }
    float _1847 = _1831;
    bool _1849 = !_1781;
    float _1851 = _1847;
    if (!_1849)
    {
        float _1853 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1857 = _1737 + _1855;
        float _1859 = rsqrt(_1725);
        float _1861 = _1857 * _1853;
        float _1863 = _1765 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1865 = _1861 * 0.15915493667125701904296875;
        float _1867 = _1865 * 6.283185482025146484375;
        float _1869 = sin(_1867);
        float _1871 = _1865 * 6.283185482025146484375;
        float _1873 = cos(_1871);
        float _1875 = fma(_1869, _1863, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1877 = _1859 * _1875;
        float _1879 = fma(_1695, _1877, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1881 = _1873 + (-1.0);
        float _1883 = fma(_1699, _1877, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1885 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1887 = _1879 + _1885;
        float _1889 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1893 = _1883 + _1891;
        float _1895 = _1887 * _1887;
        float _1897 = fma(_1765, _1873, _1889);
        float _1899 = _1893 * _1893;
        _1851 = _1897;
        _1749 = _1895;
        _1751 = _1899;
        _1835 = _1879;
        _1845 = _1883;
    }
    float _1901 = _1851;
    float _1903 = _1749;
    float _1905 = _1751;
    float _1907 = _1835;
    float _1909 = _1845;
    float _1911 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1913 = _1901 + _1911;
    int _1915 = _510 * _1723;
    int _1917 = _1915 + _1141;
    int _1919 = ~_1821;
    int _1921 = _1919 + 1;
    int _1923 = _1921 + 1;
    int _1925 = _1843 * as_type<int>(_1681);
    int _1927 = _1925 + _1827;
    float _1929 = fma(_1913, _1913, _1903);
    float _1931 = fma(_1341, _1333, _1511);
    bool _1933 = !_1095;
    int _1935 = _1933 ? _1917 : (-1);
    int _1937 = _1927 * _1923;
    float _1939 = _1929 + _1905;
    float _1941 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1461);
    float _1943 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1537);
    float _1945 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1931);
    int _1947 = _1935 * _1821;
    int _1949 = _1947 + _1937;
    float _1951 = sqrt(_1939);
    float _1953 = _805 + 0.5;
    float _1955 = _1941 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1957 = _1943 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1959 = _1945 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1961 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1963 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1965 = _1447 + 0.5;
    float _1967 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1971 = float(_1949);
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    bool _1973 = _1951 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1975 = isnan(_1951);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1981 = _1977 || _1979;
    out.m_65.x = _1965;
    out.m_65.y = _1953;
    out.m_67.x = _1967;
    out.m_67.y = _1961;
    out.m_67.z = _1969;
    out.m_67.w = _1963;
    out.m_69.x = _1971;
    float _1983 = as_type<float>(_1949);
    float _1985 = _1967;
    float _1987 = _1969;
    float _1989 = _1963;
    if (!_1981)
    {
        _1983 = 1.0;
    }
    float _1991 = _1983;
    bool _1993 = !_1981;
    float _1995 = _1991;
    if (!_1993)
    {
        bool _1997 = _1951 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1999 = isnan(_1951);
        bool _2001 = _1997 || _1999;
        bool _2003 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2005 = _2001 || _2003;
        if (!_2005)
        {
            float _2007 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2009 = _1951 + _2007;
            float _2011 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2013 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2011;
            float _2015 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2017 = _2015 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2019 = 1.0 / _2013;
            float _2021 = _2009 * _2019;
            float _2023 = fma(_2021, _2017, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1995 = _2023;
            _2025 = true;
        }
        else
        {
            bool _2027 = _1951 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2029 = isnan(_1951);
            bool _2031 = _2027 || _2029;
            bool _2033 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2035 = _2031 || _2033;
            if (!_2035)
            {
                float _2037 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2039 = _1951 + _2037;
                float _2041 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2043 = _2041 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2045 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2047 = _2045 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2049 = 1.0 / _2043;
                float _2051 = _2039 * _2049;
                float _2053 = fma(_2051, _2047, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1995 = _2053;
                _2025 = true;
            }
            else
            {
                _1995 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2025 = false;
    float _2055 = _1995;
    float _2057 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2059 = _1901 + _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2063 = _1907 + _2061;
    float _2065 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2067 = _1909 + _2065;
    float _2069 = fma(_2059, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2071 = fma(_2063, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2073 = fma(_2067, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2075 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2077 = _2069 + _2075;
    float _2079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2081 = _2071 + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2085 = _2073 + _2083;
    float _2087 = _2077 * _2077;
    float _2089 = fma(_2081, _2081, _2087);
    float _2091 = fma(_2085, _2085, _2089);
    float _2093 = rsqrt(_2091);
    float _2095 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2097 = _2081 * _2095;
    float _2099 = _2085 * _2095;
    float _2101 = _2097 * _2097;
    float _2103 = _2099 * _2099;
    float _2105 = _2101 + _2103;
    float _2107 = sqrt(_2105);
    bool _2109 = _2107 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2113 = _2107 + _2111;
    float _2115 = _2085;
    float _2117 = _2113;
    float _2119 = _2097;
    if (_2109)
    {
        float _2121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2115 = _2121;
    }
    float _2123 = _2115;
    if (_2109)
    {
        float _2125 = rsqrt(_2105);
        _1985 = _2125;
    }
    float _2127 = _1985;
    float _2129 = _2127;
    if (_2109)
    {
        float _2131 = _2113 * _2123;
        _2117 = _2131;
    }
    float _2133 = _2117;
    if (_2109)
    {
        float _2135 = _2133 * 0.15915493667125701904296875;
        _1987 = _2135;
    }
    float _2137 = _1987;
    float _2139 = _2093;
    if (_2109)
    {
        float _2141 = _2137 * 6.283185482025146484375;
        float _2143 = sin(_2141);
        _2139 = _2143;
    }
    float _2145 = _2139;
    float _2147 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2149 = precise::max(0.0, _2147);
    float _2151 = _2089;
    float _2153 = _2149;
    float _2155 = _2147;
    if (_2109)
    {
        float _2157 = _2137 * 6.283185482025146484375;
        float _2159 = cos(_2157);
        _2151 = _2159;
    }
    float _2161 = _2151;
    float _2163 = -_2095;
    float _2165 = -_2149;
    float _2167 = fma(_2077, _2163, _2165);
    if (!_2109)
    {
        _2153 = _2099;
    }
    float _2169 = _2153;
    float _2171 = _2169;
    if (_2109)
    {
        float _2173 = _2167 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2155 = _2173;
    }
    float _2175 = _2155;
    float _2177 = sqrt(_2091);
    float _2179 = _2145;
    float _2181 = _2175;
    if (_2109)
    {
        float _2183 = fma(_2145, _2175, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2179 = _2183;
    }
    float _2185 = _2179;
    float _2187 = _2185;
    if (_2109)
    {
        float _2189 = _2161 + (-1.0);
        _2181 = _2189;
    }
    float _2191 = _2181;
    float _2193 = _2191;
    if (_2109)
    {
        float _2195 = _2127 * _2185;
        _1373 = _2195;
    }
    float _2197 = _1373;
    if (!_2109)
    {
        _2129 = _2167;
    }
    float _2199 = _2129;
    float _2201 = _2199;
    if (_2109)
    {
        float _2203 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1989 = _2203;
    }
    float _2205 = _1989;
    if (_2109)
    {
        float _2207 = _2097 * _2197;
        _2119 = _2207;
    }
    float _2209 = _2119;
    if (!_2109)
    {
        _2187 = _2101;
    }
    float _2211 = _2187;
    float _2213 = _2211;
    if (_2109)
    {
        float _2215 = _2099 * _2197;
        _2171 = _2215;
    }
    float _2217 = _2171;
    if (_2109)
    {
        float _2219 = fma(_2167, _2161, _2205);
        _2201 = _2219;
    }
    float _2221 = _2201;
    if (_2109)
    {
        float _2223 = _2209 * _2209;
        _2213 = _2223;
    }
    float _2225 = _2213;
    if (!_2109)
    {
        _2193 = _2103;
    }
    float _2227 = _2193;
    float _2229 = _2227;
    if (_2109)
    {
        float _2231 = _2217 * _2217;
        _2229 = _2231;
    }
    float _2233 = _2229;
    float _2235 = fma(_2221, _2221, _2225);
    float _2237 = _2235 + _2233;
    float _2239 = _2069 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2243 = fma(_2177, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2241);
    float _2245 = precise::clamp(_2243, 0.0, 1.0);
    float _2247 = _2069 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2249 = rsqrt(_2237);
    float _2251 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2239);
    float _2253 = -_2245;
    float _2255 = _2253 + 1.0;
    float _2257 = _2069 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2259 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2247);
    float _2261 = _2069 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2263 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2251);
    float _2265 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2257);
    float _2267 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2259);
    float _2269 = abs(_2255);
    float _2271 = log2(_2269);
    float _2273 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2261);
    float _2275 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2265);
    float _2277 = _2267 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2279 = _2263 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2281 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2273);
    float _2283 = _2275 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2285 = _2249 * _2209;
    float _2287 = _2277 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2289 = _2249 * _2221;
    float _2291 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2293 = _2285 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2295 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2287);
    float _2297 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2299 = _2249 * _2217;
    float _2301 = -_2293;
    float _2303 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2301);
    float _2305 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2307 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2295);
    float _2309 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2311 = -_2297;
    float _2313 = fma(_2311, _2291, 1.0);
    float _2315 = -_2299;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2303);
    float _2319 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2307);
    float _2321 = _2277 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2323 = _2277 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2325 = fma(_2317, -0.5, 0.5);
    float _2327 = exp2(_2309);
    float _2329 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2321);
    float _2331 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2323);
    float _2333 = fma(_2317, 0.5, 0.5);
    float _2335 = _2289 + 1.0;
    float _2337 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2329);
    float _2339 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2331);
    float _2341 = fma(_2333, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2343 = log2(_2313);
    float _2345 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2337);
    float _2347 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2339);
    float _2349 = fma(_2333, _2341, -0.212114393711090087890625);
    float _2351 = fma(_2333, _2349, 1.570728778839111328125);
    float _2353 = 1.0 / _2319;
    float _2355 = -_2289;
    float _2357 = fma(_2327, _2335, _2355);
    float _2359 = fma(_2357, 0.5, 0.5);
    float _2361 = sqrt(_2325);
    float _2363 = _2343 * 0.693147182464599609375;
    float _2365 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2367 = _2345 * _2353;
    float _2369 = _2347 * _2353;
    float _2371 = fma(_2367, 0.5, 0.5);
    float _2373 = fma(_2369, -0.5, 0.5);
    float _2375 = _2361 * 0.636619746685028076171875;
    float3 _6051 = float3(_2371, _2373, _2365);
    float _2377 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6051, float3(0.0), isnan(_6051)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6051, float3(0.0), isnan(_6051)), level(0.0)).x;
    float3 _6062 = float3(_2371, _2373, _2365);
    float4 _2380 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6062, float3(0.0), isnan(_6062)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6062, float3(0.0), isnan(_6062)), level(0.0)).xyzw;
    float _2382 = _2380.x;
    float _2384 = _2380.y;
    float _2386 = _2380.z;
    float _2388 = _2380.w;
    float _2390 = -_2351;
    float _2392 = fma(_2375, _2390, 1.0);
    float2 _6084 = float2(_2392, _2359);
    float3 _2396 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6084, float2(0.0), isnan(_6084)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6084, float2(0.0), isnan(_6084)), level(0.0)).xyz;
    float _2398 = _2396.x;
    float _2400 = _2396.y;
    float _2402 = _2396.z;
    float _2404 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2406 = _2277 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2408 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2406);
    float _2410 = exp2(_2404);
    float _2412 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2408);
    float _2414 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2412);
    float _2416 = _2414 + _2319;
    float _2418 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2345;
    out.gl_Position.y = _2347;
    out.gl_Position.z = _2414;
    out.gl_Position.w = _2319;
    float _2420 = _2416 * 0.5;
    float _2422 = -_2410;
    float _2424 = _2422 + 1.0;
    out.m_47.x = _2418;
    float _2426 = _2424 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _2420;
    out.m_71.w = _2319;
    float _2428 = _2426 * _2377;
    float _2430 = -_2426;
    float _2432 = _2430 + 1.0;
    float _2434 = _2388 * _2428;
    float _2436 = _2402 * _2428;
    float _2438 = fma(_2398, _2434, _2382);
    float _2440 = fma(_2400, _2434, _2384);
    float _2442 = _2388 * _2432;
    float _2444 = fma(_2388, _2436, _2386);
    out.m_73.x = _2438;
    out.m_73.y = _2440;
    out.m_73.z = _2444;
    out.m_73.w = _2442;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2025 = false;
    bool _472 = false;
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2501 = as_type<float>(_108);
        out.gl_Position.z = _2501;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2571 = as_type<float>(_146);
        out.gl_Position.z = _2571;
    }
    if (_138)
    {
        return out;
    }
    float _148 = in.m_51.w;
    float _150 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_49.x;
    float _164 = in.m_49.y;
    float _166 = in.m_49.z;
    float _168 = in.m_44.x;
    float _170 = in.m_44.y;
    float _172 = in.m_44.z;
    float _174 = 0.0;
    float _176 = _150;
    if (!_160)
    {
        float _178 = _150 * _150;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = _182;
    if (!_160)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_160;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _150 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _150);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_160;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _150 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _176 = _246;
    }
    float _248 = _176;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _162, _252);
    float _260 = fma(_248, _164, _254);
    float _262 = fma(_248, _166, _256);
    float _264 = fma(_258, _148, _168);
    float _266 = fma(_260, _148, _170);
    float _268 = fma(_262, _148, _172);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_53.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_92);
        float _294 = 1.0 / _292;
        float _296 = _126 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _302 = _298 + _300;
    bool _304 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _306 = isnan(_298);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _318 = _298 + _316;
    bool _320 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _322 = isnan(_298);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _340 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _342 = isnan(_298);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = 1.0 / _334;
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _356 = 1.0 / _338;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _358;
    float _362 = _302 * _352;
    float _364 = -_314;
    float _366 = _364 + 1.0;
    float _368 = -_350;
    float _370 = _368 + 1.0;
    float _372 = fma(_360, _362, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _374 = _350 * _366;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _380;
    float _384 = _330 * _370;
    float _386 = _318 * _356;
    float _388 = fma(_378, _362, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _390 = fma(_382, _362, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _392 = _372 * _384;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _398 = _388 * _384;
    float _400 = _390 * _384;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _410 = -_330;
    float _412 = _410 + 1.0;
    float _414 = fma(_396, _386, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _416 = fma(_404, _386, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _418 = fma(_408, _386, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _420 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].x, _398);
    float _422 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].y, _392);
    float _424 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].z, _400);
    float _426 = fma(_416, _374, _420);
    float _428 = fma(_414, _374, _422);
    float _430 = fma(_418, _374, _424);
    float _432 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].x, _426);
    float _434 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].y, _428);
    float _436 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].z, _430);
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _440 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _442 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _444 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _446 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _446;
    out.m_55.y = _448;
    out.m_55.z = _450;
    out.m_55.w = _438;
    bool _452 = !_354;
    float _470;
    if (!_452)
    {
        float _454 = in.m_53.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_92);
        float _476 = 1.0 / _474;
        float _478 = _126 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _484 = int(_482);
    float _486 = in.m_57.x;
    float _488 = in.m_57.y;
    float _490 = in.m_57.z;
    float _492 = _266 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _496 = _494 != 0;
    float _498 = in.m_51.x;
    float _500 = in.m_51.y;
    float _502 = in.m_51.z;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _506 = _504 != 0;
    float _508 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _510 = int(_508);
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _514 = _512 != 0;
    float _516 = in.m_59.y;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _520 = _518 != 0;
    float _522 = _266 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _526 = _524 != 0;
    float _528 = _266 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _530 = float(_92);
    float _532 = _266 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _534 = float(_484);
    float _536 = in.m_53.x;
    float _538 = in.m_53.y;
    float _540 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[14].x, _492);
    float _542 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[14].w, _532);
    float _544 = 1.0 / _534;
    float _546 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[14].y, _522);
    float _548 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[14].z, _528);
    float _550 = float(uint(_510));
    float _552 = 0.0;
    if (_496)
    {
        float _554 = in.m_53.x;
        _552 = _554;
    }
    float _556 = _552;
    float _558 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _486);
    float _560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _490);
    float _562 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _564 = log2(_562);
    float _566 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _488);
    float _568 = _502 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _570 = -_516;
    float _572 = _570 + 1.0;
    float _574 = _500 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _576 = _544 * _126;
    float _578 = 1.0 / _550;
    float _580 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _584 = _538 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _586 = _538 > 0.5;
    float _588 = _538 * 2.0;
    float _590 = trunc(_576);
    int _592 = int(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _598;
    float _602 = _516;
    if (_506)
    {
        float _604 = _586 ? _572 : _516;
        _602 = _604;
    }
    float _606 = _602;
    float _608 = _536 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _612 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _580);
    float _614 = _564 * _126;
    float _616 = -_582;
    float _618 = fma(_608, 2.0, _616);
    int _620 = as_type<int>(_578) + (-2);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _626 = 1.0 / _600;
    float _628 = fma(_584, -2.0, _610);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _632 = _480 + _630;
    float _634 = float(uint(_592));
    float _636 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _638 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _640 = as_type<float>(_620) * _634;
    float _642 = 1.0 / _624;
    float _644 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _636);
    float _646 = _536 * 2.0;
    float _648 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _638);
    int _650 = ~_510;
    int _652 = _650 + 1;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _656 = _480 + _654;
    bool _658 = _556 > 0.5;
    bool _660 = _658 && _496;
    float _662 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[16].x, _540);
    float _664 = trunc(_640);
    float _666 = precise::max(_664, 0.0);
    uint _669 = uint(_666);
    float _671 = _656 * _626;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _675 = _480 + _673;
    float _677 = float(_510);
    float _679 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[16].y, _546);
    bool _681 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _683 = isnan(0.0);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _689 = _685 || _687;
    float _691 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[16].z, _548);
    float _693 = exp2(_614);
    float _695 = _675 * _642;
    float _697 = _677 * _126;
    float _699 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[16].w, _542);
    float _701 = in.m_53.z;
    float _703 = -_126;
    float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[76].x, _618);
    float _707 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _628);
    float _709 = 1.0 / _530;
    int _711 = _652 * int(_669);
    int _713 = _711 + _592;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _717 = !_520;
    int _719 = _717 ? 0 : 1;
    float _721 = _498 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _723 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[78].w, _715);
    float _725 = float(uint(_713));
    float _727 = floor(_646);
    float _729 = -_693;
    float _731 = _729 + 1.0;
    float _733 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _612);
    float _735 = as_type<float>(_620) * _725;
    float _737 = _721 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _739 = _689 ? _731 : 0.0;
    float _741 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _743 = 1.0 / _596;
    float _745 = _697 * _709;
    float _747 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _749 = _701 * 2.0;
    float _751 = _737 * _558;
    float _753 = _741 * _566;
    float _755 = floor(_588);
    float _757 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _759 = _727 >= 0.0;
    bool _761 = isnan(_727);
    bool _763 = _759 || _761;
    bool _765 = isnan(0.0);
    bool _767 = _763 || _765;
    float _769 = _691 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    bool _771 = _727 > 0.0;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _775 = 1.0 + _773;
    int _777 = _767 ? 0 : 1;
    float _779 = _632 * _743;
    bool _781 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _783 = isnan(1.0);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _789 = _785 || _787;
    float _791 = 1.0 / _775;
    float _793 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _723);
    int _795 = ~_510;
    int _797 = _795 + 1;
    float _799 = _757 * _560;
    float _801 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _644);
    float _803 = -_707;
    float _805 = fma(_793, _747, _803);
    float _807 = trunc(_735);
    float _809 = precise::max(_807, 0.0);
    uint _811 = uint(_809);
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _819;
    float _823 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[78].z, _813);
    float _825 = fma(_817, _671, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _827 = floor(_749);
    float _829 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _823);
    int _831 = ~_777;
    int _833 = _831 + 1;
    int _835 = _833 + 1;
    int _837 = _835;
    if (_789)
    {
        float _839 = _739 * _791;
        _128 = _839;
    }
    float _841 = _128;
    if (!_771)
    {
        int _843 = ~_777;
        int _845 = _843 + 1;
        _837 = _845;
    }
    int _847 = _837;
    float _849 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _648);
    bool _851 = _755 > 0.0;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _857 = _755 >= 0.0;
    bool _859 = isnan(_755);
    bool _861 = _857 || _859;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    float _867 = sqrt(_801);
    float _869 = _699 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    int _871 = int(_669) + int(_811);
    int _873 = _865 ? 0 : 1;
    int _875 = _797 * _871;
    int _877 = _875 + _592;
    bool _879 = !_526;
    float _881 = _879 ? 7.345489978790283203125 : 1.0;
    float _883 = sqrt(_733);
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _887 = _885 != 0;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _891 = _889 != 0;
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _895 = _893 != 0;
    int _897 = ~_873;
    int _899 = _897 + 1;
    int _901 = _899 + 1;
    float _903 = _881 * _536;
    int _905 = _901;
    if (!_851)
    {
        int _907 = ~_873;
        int _909 = _907 + 1;
        _905 = _909;
    }
    int _911 = _905;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _917 = !_891;
    int _919 = _917 ? 0 : 1;
    float _921 = floor(_903);
    bool _923 = uint(_877) >= uint(_510);
    float _925 = _538 + _701;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _929 = _927 != 0;
    float _931 = _538 + _536;
    bool _933 = !_887;
    int _935 = _933 ? 0 : 1;
    float _937 = fma(_915, _695, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _939 = !_895;
    int _941 = _939 ? 0 : 1;
    float _943 = _931 + (-1.0);
    bool _945 = !_923;
    int _947 = _945 ? 0 : (-1);
    float _949 = sqrt(_849);
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _957 = _955 != 0;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _961 = _959 != 0;
    float _963 = _701 + _536;
    float _965 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _967 = _963 + (-1.0);
    float _969 = _925 + (-1.0);
    float _971 = -_921;
    float _973 = _903 + _971;
    int _975 = ~_871;
    int _977 = _975 + _947;
    int _979 = _977 + 1;
    float _981 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _983 = !_957;
    int _985 = _983 ? 0 : 1;
    float _987 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _989 = _827 >= 0.0;
    bool _991 = isnan(_827);
    bool _993 = _989 || _991;
    bool _995 = isnan(0.0);
    bool _997 = _993 || _995;
    float _999 = _973 * _677;
    int _1001 = _510 * _979;
    int _1003 = _1001 + _592;
    int _1005 = _997 ? 0 : 1;
    float _1007 = trunc(_745);
    int _1009 = int(_1007);
    bool _1011 = _827 > 0.0;
    float _1013 = _949 * _769;
    float _1015 = _538 + (-0.5);
    int _1017 = ~_1005;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    float _1023 = _536 + (-0.5);
    int _1025 = abs(_985);
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1027;
    int _1031 = abs(_919);
    float _1033 = float(_847);
    float _1035 = fma(_1029, _671, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1037 = fma(_821, _671, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1047;
    float _1051 = _662 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1053 = fma(_1041, _695, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1055 = float(_592);
    float _1057 = fma(_855, _695, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1059 = _679 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1061 = fma(_1045, _779, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    bool _1063 = _1055 >= _677;
    bool _1065 = isnan(_1055);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan(_677);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = _883 * _1051;
    int _1077 = abs(_719);
    float _1079 = _867 * _1059;
    float _1081 = trunc(_1073);
    int _1083 = int(_1081);
    int _1085 = _1021;
    if (!_1011)
    {
        int _1087 = ~_1005;
        int _1089 = _1087 + 1;
        _1085 = _1089;
    }
    int _1091 = _1085;
    float _1093 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1095 = _510 == 0;
    float _1097 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1099 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1101 = !_961;
    int _1103 = _1101 ? 0 : 1;
    float _1105 = trunc(_999);
    int _1107 = int(_1105);
    float _1109 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1093);
    bool _1111 = !_1095;
    int _1113 = _1111 ? _1003 : (-1);
    int _1115 = abs(_941);
    float _1117 = float(_911);
    int _1119 = ~_1083;
    int _1121 = _1119 + 1;
    int _1123 = _1121 + 1;
    float _1125 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1097);
    int _1127 = _510 + (-1);
    float _1129 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1099);
    bool _1131 = !_953;
    int _1133 = _1131 ? 0 : 1;
    int _1135 = _1113 * _1123;
    float _1137 = float(_1091);
    int _1139 = _1107 * _1077;
    int _1141 = _1139 + _592;
    int _1143 = _1083 * _1127;
    int _1145 = _1143 + _1135;
    float _1147 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1125);
    int _1149 = abs(_1103);
    float _1151 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1109);
    float _1153 = float(_1025);
    float _1155 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1129);
    int _1157 = abs(_935);
    float _1159 = _1153 * _1033;
    int _1161 = abs(_1133);
    int _1163 = _1145 * _1031;
    float _1165 = in.m_61.x;
    float _1167 = in.m_61.y;
    float _1169 = in.m_61.z;
    bool _1171 = !_929;
    int _1173 = _1171 ? 0 : 1;
    int _1175 = _1009 * _1157;
    int _1177 = _1175 + _1163;
    float _1179 = float(_1149);
    float _1181 = _1159 * (-2.0);
    float _1183 = float(_1161);
    float _1185 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1155);
    float _1187 = _1179 * _1117;
    int _1189 = abs(_1173);
    float _1191 = _1183 * _1137;
    float _1193 = fma(_987, _1181, _987);
    int _1195 = _1141 * _1115;
    int _1197 = _1195 + _1177;
    float _1199 = _1187 * (-2.0);
    float _1201 = float(uint(_1141));
    float _1203 = _1191 * (-2.0);
    int _1205 = _1107 * _1189;
    int _1207 = _1205 + _1197;
    float _1209 = fma(_981, _1199, _981);
    float _1211 = as_type<float>(_620) * _1201;
    float _1213 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1151);
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1215;
    float _1219 = in.m_59.x;
    float _1221 = fma(_1199, _1169, _1169);
    float _1223 = float(uint(_1207));
    float _1225 = fma(_1181, _1167, _1167);
    float _1227 = _701 + (-0.5);
    float _1229 = fma(_1217, _779, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1231 = trunc(_1211);
    float _1233 = precise::max(_1231, 0.0);
    uint _1235 = uint(_1233);
    float _1237 = as_type<float>(_620) * _1223;
    float _1239 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1225);
    float _1241 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1221);
    int _1243 = ~_510;
    int _1245 = _1243 + 1;
    float _1247 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1147);
    float _1249 = fma(_1193, _841, _1239);
    int _1251 = ~_510;
    int _1253 = _1251 + 1;
    float _1255 = trunc(_1237);
    float _1257 = precise::max(_1255, 0.0);
    uint _1259 = uint(_1257);
    bool _1261 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1263 = isnan(_480);
    bool _1265 = _1261 || _1263;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1269 = _1265 || _1267;
    float _1271 = float(_1269);
    float _1273 = _1249 * 0.15915493667125701904296875;
    float _1275 = _1247 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    bool _1277 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1279 = isnan(_480);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = fma(_1209, _841, _1241);
    bool _1291 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1293 = isnan(_480);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1299 = _1295 || _1297;
    float _1301 = float(_1299);
    int _1303 = _1245 * int(_1235);
    int _1305 = _1303 + _1141;
    bool _1307 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1309 = isnan(_480);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = -_1287;
    float _1321 = _1319 + 1.0;
    float _1323 = _1273 * 6.283185482025146484375;
    float _1325 = sin(_1323);
    float _1327 = -_1301;
    float _1329 = _1327 + 1.0;
    float _1331 = float(uint(_1305));
    float _1333 = _1301 * _1321;
    float _1335 = _1289 * 0.15915493667125701904296875;
    int _1337 = _1253 * int(_1259);
    int _1339 = _1337 + _1207;
    float _1341 = fma(_1049, _779, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1343 = as_type<float>(_620) * _1331;
    float _1345 = _1273 * 6.283185482025146484375;
    float _1347 = cos(_1345);
    float _1349 = _1317 * _1329;
    float _1351 = float(uint(_1339));
    float _1353 = -_1317;
    float _1355 = _1353 + 1.0;
    float _1357 = as_type<float>(_620) * _1351;
    float _1359 = _1271 * _1355;
    float _1361 = _1213 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1363 = -_1275;
    float _1365 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1367 = _1351;
    float _1369 = _1219;
    float _1371 = _1275;
    float _1373 = _1341;
    if (_496)
    {
        _1367 = _1219;
    }
    float _1375 = _1367;
    float _1377 = _825 * _1359;
    float _1379 = _1185 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1381 = -_1361;
    float _1383 = _1381 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1385 = _1365 * _1365;
    float _1387 = _1035 * _1359;
    float _1389 = -_1379;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1393 = trunc(_1357);
    float _1395 = precise::max(_1393, 0.0);
    uint _1397 = uint(_1395);
    float _1399 = fma(_1383, _1383, _1385);
    float _1401 = _1037 * _1359;
    float _1403 = _1375;
    if (_660)
    {
        float _1405 = -_1375;
        float _1407 = _1405 + 1.0;
        _1403 = _1407;
    }
    float _1409 = _1403;
    float _1411 = -_1271;
    float _1413 = _1411 + 1.0;
    float _1415 = fma(_1391, _1391, _1399);
    if (_496)
    {
        _1369 = _1409;
    }
    float _1417 = _1369;
    float _1419 = fma(_1203, _1165, _1165);
    float _1421 = fma(_965, _1203, _965);
    float _1423 = rsqrt(_1415);
    float _1425 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1387);
    float _1427 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1419);
    int _1429 = ~_510;
    int _1431 = _1429 + 1;
    float _1433 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1435 = int(_1259) + int(_1397);
    float _1437 = fma(_1421, _841, _1427);
    float _1439 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1377);
    float _1441 = trunc(_1343);
    float _1443 = precise::max(_1441, 0.0);
    uint _1445 = uint(_1443);
    float _1447 = fma(_829, _1433, _705);
    float _1449 = _1437 * 0.15915493667125701904296875;
    float _1451 = fma(_1053, _1349, _1425);
    int _1453 = _1431 * _1435;
    int _1455 = _1453 + _1207;
    float _1457 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1401);
    float _1459 = fma(_937, _1349, _1439);
    float _1461 = fma(_1061, _1333, _1451);
    float _1463 = _1383 * _1423;
    float _1465 = _1335 * 6.283185482025146484375;
    float _1467 = sin(_1465);
    bool _1469 = uint(_1455) >= uint(_510);
    float _1471 = _1391 * _1423;
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1475 = _1463 * _1473;
    float _1477 = _1365 * _1423;
    bool _1479 = !_1469;
    int _1481 = _1479 ? 0 : (-1);
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1485 = _1471 * _1483;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1489 = -_1475;
    float _1491 = fma(_1471, _1487, _1489);
    float _1493 = _1335 * 6.283185482025146484375;
    float _1495 = cos(_1493);
    int _1497 = int(_1235) + int(_1445);
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1501 = _1477 * _1499;
    float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1505 = -_1485;
    float _1507 = fma(_1477, _1503, _1505);
    float _1509 = _1491 * _1491;
    float _1511 = fma(_1057, _1349, _1457);
    int _1513 = ~_1435;
    int _1515 = _1513 + _1481;
    int _1517 = _1515 + 1;
    float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1521 = -_1501;
    float _1523 = fma(_1463, _1519, _1521);
    float _1525 = _1449 * 6.283185482025146484375;
    float _1527 = sin(_1525);
    float _1529 = fma(_1507, _1507, _1509);
    float _1531 = _1325 * _1467;
    int _1533 = _510 * _1517;
    int _1535 = _1533 + _1207;
    float _1537 = fma(_1229, _1333, _1459);
    float _1539 = fma(_1523, _1523, _1529);
    float _1541 = _1449 * 6.283185482025146484375;
    float _1543 = cos(_1541);
    float _1545 = _1347 * _1495;
    float _1547 = fma(_1527, _1531, _1545);
    float _1549 = fma(_1527, _1545, _1531);
    float _1551 = _1325 * _1495;
    float _1553 = _1347 * _1467;
    float _1555 = rsqrt(_1539);
    float _1557 = _1549 * _753;
    float _1559 = -_1553;
    float _1561 = fma(_1527, _1551, _1559);
    float _1563 = _1543 * _1495;
    float _1565 = -_1551;
    float _1567 = fma(_1527, _1553, _1565);
    bool _1569 = !_1095;
    int _1571 = _1569 ? _1535 : (-1);
    float _1573 = _1543 * _1467;
    float _1575 = _1563 * _753;
    float _1577 = _1561 * _753;
    int _1579 = _1571 >> 31;
    float _1581 = fma(_1567, _751, _1557);
    float _1583 = fma(_1573, _751, _1575);
    float _1585 = _1543 * _799;
    int _1587 = _1579 & 3;
    float _1589 = fma(_1547, _751, _1577);
    float _1591 = _1491 * _1555;
    float _1593 = -_1527;
    float _1595 = fma(_1593, _799, _1583);
    float _1597 = _1507 * _1555;
    int _1599 = _1571 + _1587;
    float _1601 = _1523 * _1555;
    float _1603 = _1471 * _1591;
    float _1605 = _1477 * _1597;
    int _1607 = _1599 >> 2;
    float _1609 = fma(_1325, _1585, _1589);
    float _1611 = -_1603;
    float _1613 = fma(_1477, _1601, _1611);
    float _1615 = -_1605;
    float _1617 = fma(_1463, _1591, _1615);
    int _1619 = _1607 << 4;
    int _1621 = _1619 + 368;
    float _1623 = fma(_1347, _1585, _1581);
    float _1625 = _1613 * _1595;
    float _1627 = _1617 * _1595;
    uint _1629 = uint(int(uint(_1621) >> uint(2)));
    uint _1631 = uint(int(uint(int(_1629)) >> uint(2)));
    int _1633 = int(_1629) & 3;
    float _1635 = (*spvDescriptorSet0.vp_c9)._m0[int(_1631)][_1633];
    int _1637 = int(_1629) + 1;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    int _1641 = _1637 & 3;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[int(_1639)][_1641];
    int _1645 = ~_510;
    int _1647 = _1645 + 1;
    float _1649 = fma(_1597, _1609, _1625);
    float _1651 = fma(_1601, _1609, _1627);
    int _1653 = _1571 & 3;
    bool _1655 = _1653 != 0;
    float _1657 = fma(_1463, _1623, _1649);
    float _1659 = fma(_1471, _1623, _1651);
    int _1661 = _1647 * _1497;
    int _1663 = _1661 + _1141;
    int _1665 = _1621 + 8;
    uint _1667 = uint(int(uint(_1665) >> uint(2)));
    uint _1669 = uint(int(uint(int(_1667)) >> uint(2)));
    int _1671 = int(_1667) & 3;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[int(_1669)][_1671];
    int _1675 = int(_1667) + 1;
    uint _1677 = uint(int(uint(_1675) >> uint(2)));
    int _1679 = _1675 & 3;
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[int(_1677)][_1679];
    float _1683 = _1361 + _1657;
    float _1685 = _1379 + _1659;
    int _1687 = _1571 & 3;
    bool _1689 = _1687 != 0;
    bool _1691 = uint(_1663) >= uint(_510);
    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1695 = _1683 + _1693;
    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1699 = _1685 + _1697;
    float _1701 = _1463 * _1601;
    bool _1703 = !_1691;
    int _1705 = _1703 ? 0 : (-1);
    float _1707 = _1695 * _1695;
    bool _1709 = uint(_1687) > 1u;
    float _1711 = _1699 * _1699;
    int _1713 = _1655 ? 0 : 1;
    float _1715 = -_1701;
    float _1717 = fma(_1471, _1597, _1715);
    int _1719 = ~_1497;
    int _1721 = _1719 + _1705;
    int _1723 = _1721 + 1;
    float _1725 = _1707 + _1711;
    int _1727 = ~_1713;
    int _1729 = _1727 + 1;
    int _1731 = _1729 + 1;
    float _1733 = _1717 * _1595;
    bool _1735 = _1687 != 3;
    float _1737 = sqrt(_1725);
    bool _1739 = uint(_1687) >= 2u;
    float _1741 = fma(_1591, _1609, _1733);
    bool _1743 = !_1689;
    int _1745 = _1743 ? 0 : 1;
    int _1747 = _1731;
    float _1749 = _1707;
    float _1751 = _1711;
    if (!_1709)
    {
        int _1753 = ~_1713;
        int _1755 = _1753 + 1;
        _1747 = _1755;
    }
    int _1757 = _1747;
    float _1759 = fma(_1477, _1623, _1741);
    int _1761 = _1739 ? 0 : 1;
    int _1763 = abs(_1757);
    float _1765 = _1275 + _1759;
    int _1767 = ~_1761;
    int _1769 = _1767 + 1;
    int _1771 = _1769 + 1;
    int _1773 = abs(_1745);
    int _1775 = ~_1763;
    int _1777 = _1775 + 1;
    int _1779 = _1777 + 1;
    bool _1781 = _1737 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1783 = _1771;
    if (_1735)
    {
        int _1785 = ~_1761;
        int _1787 = _1785 + 1;
        _1783 = _1787;
    }
    int _1789 = _1783;
    int _1791 = _1779 * as_type<int>(_1643);
    bool _1793 = _1687 != 3;
    int _1795 = ~_1773;
    int _1797 = _1795 + 1;
    int _1799 = _1797 + 1;
    int _1801 = abs(_1789);
    bool _1803 = !_514;
    int _1805 = _1803 ? 0 : 1;
    int _1807 = _1799 * as_type<int>(_1635);
    int _1809 = _1807 + _1791;
    bool _1811 = !_1793;
    float _1813 = _1811 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _1815 = ~_1801;
    int _1817 = _1815 + 1;
    int _1819 = _1817 + 1;
    int _1821 = abs(_1805);
    int _1823 = abs(as_type<int>(_1813));
    int _1825 = _1819 * as_type<int>(_1673);
    int _1827 = _1825 + _1809;
    float _1829 = _1673;
    float _1831 = _1813;
    if (!_1781)
    {
        _1371 = _1683;
    }
    float _1833 = _1371;
    float _1835 = _1833;
    if (!_1781)
    {
        _1829 = _1685;
    }
    float _1837 = _1829;
    int _1839 = ~_1823;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    float _1845 = _1837;
    if (!_1781)
    {
        _1831 = _1765;
    }
    float _1847 = _1831;
    bool _1849 = !_1781;
    float _1851 = _1847;
    if (!_1849)
    {
        float _1853 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1857 = _1737 + _1855;
        float _1859 = rsqrt(_1725);
        float _1861 = _1857 * _1853;
        float _1863 = _1765 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1865 = _1861 * 0.15915493667125701904296875;
        float _1867 = _1865 * 6.283185482025146484375;
        float _1869 = sin(_1867);
        float _1871 = _1865 * 6.283185482025146484375;
        float _1873 = cos(_1871);
        float _1875 = fma(_1869, _1863, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1877 = _1859 * _1875;
        float _1879 = fma(_1695, _1877, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1881 = _1873 + (-1.0);
        float _1883 = fma(_1699, _1877, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1885 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1887 = _1879 + _1885;
        float _1889 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1893 = _1883 + _1891;
        float _1895 = _1887 * _1887;
        float _1897 = fma(_1765, _1873, _1889);
        float _1899 = _1893 * _1893;
        _1851 = _1897;
        _1749 = _1895;
        _1751 = _1899;
        _1835 = _1879;
        _1845 = _1883;
    }
    float _1901 = _1851;
    float _1903 = _1749;
    float _1905 = _1751;
    float _1907 = _1835;
    float _1909 = _1845;
    float _1911 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1913 = _1901 + _1911;
    int _1915 = _510 * _1723;
    int _1917 = _1915 + _1141;
    int _1919 = ~_1821;
    int _1921 = _1919 + 1;
    int _1923 = _1921 + 1;
    int _1925 = _1843 * as_type<int>(_1681);
    int _1927 = _1925 + _1827;
    float _1929 = fma(_1913, _1913, _1903);
    float _1931 = fma(_1341, _1333, _1511);
    bool _1933 = !_1095;
    int _1935 = _1933 ? _1917 : (-1);
    int _1937 = _1927 * _1923;
    float _1939 = _1929 + _1905;
    float _1941 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1461);
    float _1943 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1537);
    float _1945 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1931);
    int _1947 = _1935 * _1821;
    int _1949 = _1947 + _1937;
    float _1951 = sqrt(_1939);
    float _1953 = _805 + 0.5;
    float _1955 = _1941 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1957 = _1943 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1959 = _1945 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1961 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1963 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1965 = _1447 + 0.5;
    float _1967 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1971 = float(_1949);
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    bool _1973 = _1951 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1975 = isnan(_1951);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1981 = _1977 || _1979;
    out.m_65.x = _1965;
    out.m_65.y = _1953;
    out.m_67.x = _1967;
    out.m_67.y = _1961;
    out.m_67.z = _1969;
    out.m_67.w = _1963;
    out.m_69.x = _1971;
    float _1983 = as_type<float>(_1949);
    float _1985 = _1967;
    float _1987 = _1969;
    float _1989 = _1963;
    if (!_1981)
    {
        _1983 = 1.0;
    }
    float _1991 = _1983;
    bool _1993 = !_1981;
    float _1995 = _1991;
    if (!_1993)
    {
        bool _1997 = _1951 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1999 = isnan(_1951);
        bool _2001 = _1997 || _1999;
        bool _2003 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2005 = _2001 || _2003;
        if (!_2005)
        {
            float _2007 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2009 = _1951 + _2007;
            float _2011 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2013 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2011;
            float _2015 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2017 = _2015 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2019 = 1.0 / _2013;
            float _2021 = _2009 * _2019;
            float _2023 = fma(_2021, _2017, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1995 = _2023;
            _2025 = true;
        }
        else
        {
            bool _2027 = _1951 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2029 = isnan(_1951);
            bool _2031 = _2027 || _2029;
            bool _2033 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2035 = _2031 || _2033;
            if (!_2035)
            {
                float _2037 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2039 = _1951 + _2037;
                float _2041 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2043 = _2041 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2045 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2047 = _2045 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2049 = 1.0 / _2043;
                float _2051 = _2039 * _2049;
                float _2053 = fma(_2051, _2047, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1995 = _2053;
                _2025 = true;
            }
            else
            {
                _1995 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2025 = false;
    float _2055 = _1995;
    float _2057 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2059 = _1901 + _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2063 = _1907 + _2061;
    float _2065 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2067 = _1909 + _2065;
    float _2069 = fma(_2059, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2071 = fma(_2063, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2073 = fma(_2067, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2075 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2077 = _2069 + _2075;
    float _2079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2081 = _2071 + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2085 = _2073 + _2083;
    float _2087 = _2077 * _2077;
    float _2089 = fma(_2081, _2081, _2087);
    float _2091 = fma(_2085, _2085, _2089);
    float _2093 = rsqrt(_2091);
    float _2095 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2097 = _2081 * _2095;
    float _2099 = _2085 * _2095;
    float _2101 = _2097 * _2097;
    float _2103 = _2099 * _2099;
    float _2105 = _2101 + _2103;
    float _2107 = sqrt(_2105);
    bool _2109 = _2107 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2113 = _2107 + _2111;
    float _2115 = _2085;
    float _2117 = _2113;
    float _2119 = _2097;
    if (_2109)
    {
        float _2121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2115 = _2121;
    }
    float _2123 = _2115;
    if (_2109)
    {
        float _2125 = rsqrt(_2105);
        _1985 = _2125;
    }
    float _2127 = _1985;
    float _2129 = _2127;
    if (_2109)
    {
        float _2131 = _2113 * _2123;
        _2117 = _2131;
    }
    float _2133 = _2117;
    if (_2109)
    {
        float _2135 = _2133 * 0.15915493667125701904296875;
        _1987 = _2135;
    }
    float _2137 = _1987;
    float _2139 = _2093;
    if (_2109)
    {
        float _2141 = _2137 * 6.283185482025146484375;
        float _2143 = sin(_2141);
        _2139 = _2143;
    }
    float _2145 = _2139;
    float _2147 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2149 = precise::max(0.0, _2147);
    float _2151 = _2089;
    float _2153 = _2149;
    float _2155 = _2147;
    if (_2109)
    {
        float _2157 = _2137 * 6.283185482025146484375;
        float _2159 = cos(_2157);
        _2151 = _2159;
    }
    float _2161 = _2151;
    float _2163 = -_2095;
    float _2165 = -_2149;
    float _2167 = fma(_2077, _2163, _2165);
    if (!_2109)
    {
        _2153 = _2099;
    }
    float _2169 = _2153;
    float _2171 = _2169;
    if (_2109)
    {
        float _2173 = _2167 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2155 = _2173;
    }
    float _2175 = _2155;
    float _2177 = sqrt(_2091);
    float _2179 = _2145;
    float _2181 = _2175;
    if (_2109)
    {
        float _2183 = fma(_2145, _2175, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2179 = _2183;
    }
    float _2185 = _2179;
    float _2187 = _2185;
    if (_2109)
    {
        float _2189 = _2161 + (-1.0);
        _2181 = _2189;
    }
    float _2191 = _2181;
    float _2193 = _2191;
    if (_2109)
    {
        float _2195 = _2127 * _2185;
        _1373 = _2195;
    }
    float _2197 = _1373;
    if (!_2109)
    {
        _2129 = _2167;
    }
    float _2199 = _2129;
    float _2201 = _2199;
    if (_2109)
    {
        float _2203 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1989 = _2203;
    }
    float _2205 = _1989;
    if (_2109)
    {
        float _2207 = _2097 * _2197;
        _2119 = _2207;
    }
    float _2209 = _2119;
    if (!_2109)
    {
        _2187 = _2101;
    }
    float _2211 = _2187;
    float _2213 = _2211;
    if (_2109)
    {
        float _2215 = _2099 * _2197;
        _2171 = _2215;
    }
    float _2217 = _2171;
    if (_2109)
    {
        float _2219 = fma(_2167, _2161, _2205);
        _2201 = _2219;
    }
    float _2221 = _2201;
    if (_2109)
    {
        float _2223 = _2209 * _2209;
        _2213 = _2223;
    }
    float _2225 = _2213;
    if (!_2109)
    {
        _2193 = _2103;
    }
    float _2227 = _2193;
    float _2229 = _2227;
    if (_2109)
    {
        float _2231 = _2217 * _2217;
        _2229 = _2231;
    }
    float _2233 = _2229;
    float _2235 = fma(_2221, _2221, _2225);
    float _2237 = _2235 + _2233;
    float _2239 = _2069 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2243 = fma(_2177, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2241);
    float _2245 = precise::clamp(_2243, 0.0, 1.0);
    float _2247 = _2069 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2249 = rsqrt(_2237);
    float _2251 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2239);
    float _2253 = -_2245;
    float _2255 = _2253 + 1.0;
    float _2257 = _2069 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2259 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2247);
    float _2261 = _2069 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2263 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2251);
    float _2265 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2257);
    float _2267 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2259);
    float _2269 = abs(_2255);
    float _2271 = log2(_2269);
    float _2273 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2261);
    float _2275 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2265);
    float _2277 = _2267 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2279 = _2263 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2281 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2273);
    float _2283 = _2275 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2285 = _2249 * _2209;
    float _2287 = _2277 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2289 = _2249 * _2221;
    float _2291 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2293 = _2285 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2295 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2287);
    float _2297 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2299 = _2249 * _2217;
    float _2301 = -_2293;
    float _2303 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2301);
    float _2305 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2307 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2295);
    float _2309 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2311 = -_2297;
    float _2313 = fma(_2311, _2291, 1.0);
    float _2315 = -_2299;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2303);
    float _2319 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2307);
    float _2321 = _2277 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2323 = _2277 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2325 = fma(_2317, -0.5, 0.5);
    float _2327 = exp2(_2309);
    float _2329 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2321);
    float _2331 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2323);
    float _2333 = fma(_2317, 0.5, 0.5);
    float _2335 = _2289 + 1.0;
    float _2337 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2329);
    float _2339 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2331);
    float _2341 = fma(_2333, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2343 = log2(_2313);
    float _2345 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2337);
    float _2347 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2339);
    float _2349 = fma(_2333, _2341, -0.212114393711090087890625);
    float _2351 = fma(_2333, _2349, 1.570728778839111328125);
    float _2353 = 1.0 / _2319;
    float _2355 = -_2289;
    float _2357 = fma(_2327, _2335, _2355);
    float _2359 = fma(_2357, 0.5, 0.5);
    float _2361 = sqrt(_2325);
    float _2363 = _2343 * 0.693147182464599609375;
    float _2365 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2367 = _2345 * _2353;
    float _2369 = _2347 * _2353;
    float _2371 = fma(_2367, 0.5, 0.5);
    float _2373 = fma(_2369, -0.5, 0.5);
    float _2375 = _2361 * 0.636619746685028076171875;
    float3 _6051 = float3(_2371, _2373, _2365);
    float _2377 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6051, float3(0.0), isnan(_6051)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6051, float3(0.0), isnan(_6051)), level(0.0)).x;
    float3 _6062 = float3(_2371, _2373, _2365);
    float4 _2380 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6062, float3(0.0), isnan(_6062)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6062, float3(0.0), isnan(_6062)), level(0.0)).xyzw;
    float _2382 = _2380.x;
    float _2384 = _2380.y;
    float _2386 = _2380.z;
    float _2388 = _2380.w;
    float _2390 = -_2351;
    float _2392 = fma(_2375, _2390, 1.0);
    float2 _6084 = float2(_2392, _2359);
    float3 _2396 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6084, float2(0.0), isnan(_6084)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6084, float2(0.0), isnan(_6084)), level(0.0)).xyz;
    float _2398 = _2396.x;
    float _2400 = _2396.y;
    float _2402 = _2396.z;
    float _2404 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2406 = _2277 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2408 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2406);
    float _2410 = exp2(_2404);
    float _2412 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2408);
    float _2414 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2412);
    float _2416 = _2414 + _2319;
    float _2418 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2345;
    out.gl_Position.y = _2347;
    out.gl_Position.z = _2414;
    out.gl_Position.w = _2319;
    float _2420 = _2416 * 0.5;
    float _2422 = -_2410;
    float _2424 = _2422 + 1.0;
    out.m_47.x = _2418;
    float _2426 = _2424 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _2420;
    out.m_71.w = _2319;
    float _2428 = _2426 * _2377;
    float _2430 = -_2426;
    float _2432 = _2430 + 1.0;
    float _2434 = _2388 * _2428;
    float _2436 = _2402 * _2428;
    float _2438 = fma(_2398, _2434, _2382);
    float _2440 = fma(_2400, _2434, _2384);
    float _2442 = _2388 * _2432;
    float _2444 = fma(_2388, _2436, _2386);
    out.m_73.x = _2438;
    out.m_73.y = _2440;
    out.m_73.z = _2444;
    out.m_73.w = _2442;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2025 = false;
    bool _472 = false;
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2501 = as_type<float>(_108);
        out.gl_Position.z = _2501;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2571 = as_type<float>(_146);
        out.gl_Position.z = _2571;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_51.w;
    float _150 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_49.x;
    float _164 = in.m_49.y;
    float _166 = in.m_49.z;
    float _168 = in.m_44.x;
    float _170 = in.m_44.y;
    float _172 = in.m_44.z;
    float _174 = 0.0;
    float _176 = _150;
    if (!_160)
    {
        float _178 = _150 * _150;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = _182;
    if (!_160)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_160;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _150 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _150);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_160;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _150 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _176 = _246;
    }
    float _248 = _176;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _162, _252);
    float _260 = fma(_248, _164, _254);
    float _262 = fma(_248, _166, _256);
    float _264 = fma(_258, _148, _168);
    float _266 = fma(_260, _148, _170);
    float _268 = fma(_262, _148, _172);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_53.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_92);
        float _294 = 1.0 / _292;
        float _296 = _126 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _302 = _298 + _300;
    bool _304 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _306 = isnan(_298);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _318 = _298 + _316;
    bool _320 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _322 = isnan(_298);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _340 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _342 = isnan(_298);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = 1.0 / _334;
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _356 = 1.0 / _338;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _358;
    float _362 = _302 * _352;
    float _364 = -_314;
    float _366 = _364 + 1.0;
    float _368 = -_350;
    float _370 = _368 + 1.0;
    float _372 = fma(_360, _362, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _374 = _350 * _366;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _380;
    float _384 = _330 * _370;
    float _386 = _318 * _356;
    float _388 = fma(_378, _362, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _390 = fma(_382, _362, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _392 = _372 * _384;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _398 = _388 * _384;
    float _400 = _390 * _384;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _410 = -_330;
    float _412 = _410 + 1.0;
    float _414 = fma(_396, _386, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _416 = fma(_404, _386, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _418 = fma(_408, _386, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _420 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].x, _398);
    float _422 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].y, _392);
    float _424 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].z, _400);
    float _426 = fma(_416, _374, _420);
    float _428 = fma(_414, _374, _422);
    float _430 = fma(_418, _374, _424);
    float _432 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].x, _426);
    float _434 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].y, _428);
    float _436 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].z, _430);
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _440 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _442 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _444 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _446 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _446;
    out.m_55.y = _448;
    out.m_55.z = _450;
    out.m_55.w = _438;
    bool _452 = !_354;
    float _470;
    if (!_452)
    {
        float _454 = in.m_53.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_92);
        float _476 = 1.0 / _474;
        float _478 = _126 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _484 = int(_482);
    float _486 = in.m_57.x;
    float _488 = in.m_57.y;
    float _490 = in.m_57.z;
    float _492 = _266 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _496 = _494 != 0;
    float _498 = in.m_51.x;
    float _500 = in.m_51.y;
    float _502 = in.m_51.z;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _506 = _504 != 0;
    float _508 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _510 = int(_508);
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _514 = _512 != 0;
    float _516 = in.m_59.y;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _520 = _518 != 0;
    float _522 = _266 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _526 = _524 != 0;
    float _528 = _266 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _530 = float(_92);
    float _532 = _266 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _534 = float(_484);
    float _536 = in.m_53.x;
    float _538 = in.m_53.y;
    float _540 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[14].x, _492);
    float _542 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[14].w, _532);
    float _544 = 1.0 / _534;
    float _546 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[14].y, _522);
    float _548 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[14].z, _528);
    float _550 = float(uint(_510));
    float _552 = 0.0;
    if (_496)
    {
        float _554 = in.m_53.x;
        _552 = _554;
    }
    float _556 = _552;
    float _558 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _486);
    float _560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _490);
    float _562 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _564 = log2(_562);
    float _566 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _488);
    float _568 = _502 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _570 = -_516;
    float _572 = _570 + 1.0;
    float _574 = _500 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _576 = _544 * _126;
    float _578 = 1.0 / _550;
    float _580 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _584 = _538 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _586 = _538 > 0.5;
    float _588 = _538 * 2.0;
    float _590 = trunc(_576);
    int _592 = int(_590);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _598;
    float _602 = _516;
    if (_506)
    {
        float _604 = _586 ? _572 : _516;
        _602 = _604;
    }
    float _606 = _602;
    float _608 = _536 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _612 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _580);
    float _614 = _564 * _126;
    float _616 = -_582;
    float _618 = fma(_608, 2.0, _616);
    int _620 = as_type<int>(_578) + (-2);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _626 = 1.0 / _600;
    float _628 = fma(_584, -2.0, _610);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _632 = _480 + _630;
    float _634 = float(uint(_592));
    float _636 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _638 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _640 = as_type<float>(_620) * _634;
    float _642 = 1.0 / _624;
    float _644 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _636);
    float _646 = _536 * 2.0;
    float _648 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _638);
    int _650 = ~_510;
    int _652 = _650 + 1;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _656 = _480 + _654;
    bool _658 = _556 > 0.5;
    bool _660 = _658 && _496;
    float _662 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[16].x, _540);
    float _664 = trunc(_640);
    float _666 = precise::max(_664, 0.0);
    uint _669 = uint(_666);
    float _671 = _656 * _626;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _675 = _480 + _673;
    float _677 = float(_510);
    float _679 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[16].y, _546);
    bool _681 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _683 = isnan(0.0);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _689 = _685 || _687;
    float _691 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[16].z, _548);
    float _693 = exp2(_614);
    float _695 = _675 * _642;
    float _697 = _677 * _126;
    float _699 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[16].w, _542);
    float _701 = in.m_53.z;
    float _703 = -_126;
    float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[76].x, _618);
    float _707 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _628);
    float _709 = 1.0 / _530;
    int _711 = _652 * int(_669);
    int _713 = _711 + _592;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _717 = !_520;
    int _719 = _717 ? 0 : 1;
    float _721 = _498 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _723 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[78].w, _715);
    float _725 = float(uint(_713));
    float _727 = floor(_646);
    float _729 = -_693;
    float _731 = _729 + 1.0;
    float _733 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _612);
    float _735 = as_type<float>(_620) * _725;
    float _737 = _721 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _739 = _689 ? _731 : 0.0;
    float _741 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _743 = 1.0 / _596;
    float _745 = _697 * _709;
    float _747 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _749 = _701 * 2.0;
    float _751 = _737 * _558;
    float _753 = _741 * _566;
    float _755 = floor(_588);
    float _757 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _759 = _727 >= 0.0;
    bool _761 = isnan(_727);
    bool _763 = _759 || _761;
    bool _765 = isnan(0.0);
    bool _767 = _763 || _765;
    float _769 = _691 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    bool _771 = _727 > 0.0;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _775 = 1.0 + _773;
    int _777 = _767 ? 0 : 1;
    float _779 = _632 * _743;
    bool _781 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _783 = isnan(1.0);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _789 = _785 || _787;
    float _791 = 1.0 / _775;
    float _793 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _723);
    int _795 = ~_510;
    int _797 = _795 + 1;
    float _799 = _757 * _560;
    float _801 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _644);
    float _803 = -_707;
    float _805 = fma(_793, _747, _803);
    float _807 = trunc(_735);
    float _809 = precise::max(_807, 0.0);
    uint _811 = uint(_809);
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _819;
    float _823 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[78].z, _813);
    float _825 = fma(_817, _671, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _827 = floor(_749);
    float _829 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _823);
    int _831 = ~_777;
    int _833 = _831 + 1;
    int _835 = _833 + 1;
    int _837 = _835;
    if (_789)
    {
        float _839 = _739 * _791;
        _128 = _839;
    }
    float _841 = _128;
    if (!_771)
    {
        int _843 = ~_777;
        int _845 = _843 + 1;
        _837 = _845;
    }
    int _847 = _837;
    float _849 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _648);
    bool _851 = _755 > 0.0;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _857 = _755 >= 0.0;
    bool _859 = isnan(_755);
    bool _861 = _857 || _859;
    bool _863 = isnan(0.0);
    bool _865 = _861 || _863;
    float _867 = sqrt(_801);
    float _869 = _699 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    int _871 = int(_669) + int(_811);
    int _873 = _865 ? 0 : 1;
    int _875 = _797 * _871;
    int _877 = _875 + _592;
    bool _879 = !_526;
    float _881 = _879 ? 7.345489978790283203125 : 1.0;
    float _883 = sqrt(_733);
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _887 = _885 != 0;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _891 = _889 != 0;
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _895 = _893 != 0;
    int _897 = ~_873;
    int _899 = _897 + 1;
    int _901 = _899 + 1;
    float _903 = _881 * _536;
    int _905 = _901;
    if (!_851)
    {
        int _907 = ~_873;
        int _909 = _907 + 1;
        _905 = _909;
    }
    int _911 = _905;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _917 = !_891;
    int _919 = _917 ? 0 : 1;
    float _921 = floor(_903);
    bool _923 = uint(_877) >= uint(_510);
    float _925 = _538 + _701;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _929 = _927 != 0;
    float _931 = _538 + _536;
    bool _933 = !_887;
    int _935 = _933 ? 0 : 1;
    float _937 = fma(_915, _695, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _939 = !_895;
    int _941 = _939 ? 0 : 1;
    float _943 = _931 + (-1.0);
    bool _945 = !_923;
    int _947 = _945 ? 0 : (-1);
    float _949 = sqrt(_849);
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _957 = _955 != 0;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _961 = _959 != 0;
    float _963 = _701 + _536;
    float _965 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _967 = _963 + (-1.0);
    float _969 = _925 + (-1.0);
    float _971 = -_921;
    float _973 = _903 + _971;
    int _975 = ~_871;
    int _977 = _975 + _947;
    int _979 = _977 + 1;
    float _981 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _983 = !_957;
    int _985 = _983 ? 0 : 1;
    float _987 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _989 = _827 >= 0.0;
    bool _991 = isnan(_827);
    bool _993 = _989 || _991;
    bool _995 = isnan(0.0);
    bool _997 = _993 || _995;
    float _999 = _973 * _677;
    int _1001 = _510 * _979;
    int _1003 = _1001 + _592;
    int _1005 = _997 ? 0 : 1;
    float _1007 = trunc(_745);
    int _1009 = int(_1007);
    bool _1011 = _827 > 0.0;
    float _1013 = _949 * _769;
    float _1015 = _538 + (-0.5);
    int _1017 = ~_1005;
    int _1019 = _1017 + 1;
    int _1021 = _1019 + 1;
    float _1023 = _536 + (-0.5);
    int _1025 = abs(_985);
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1027;
    int _1031 = abs(_919);
    float _1033 = float(_847);
    float _1035 = fma(_1029, _671, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1037 = fma(_821, _671, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1047;
    float _1051 = _662 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1053 = fma(_1041, _695, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1055 = float(_592);
    float _1057 = fma(_855, _695, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1059 = _679 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1061 = fma(_1045, _779, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    bool _1063 = _1055 >= _677;
    bool _1065 = isnan(_1055);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan(_677);
    bool _1071 = _1067 || _1069;
    float _1073 = float(_1071);
    float _1075 = _883 * _1051;
    int _1077 = abs(_719);
    float _1079 = _867 * _1059;
    float _1081 = trunc(_1073);
    int _1083 = int(_1081);
    int _1085 = _1021;
    if (!_1011)
    {
        int _1087 = ~_1005;
        int _1089 = _1087 + 1;
        _1085 = _1089;
    }
    int _1091 = _1085;
    float _1093 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1095 = _510 == 0;
    float _1097 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1099 = _1079 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1101 = !_961;
    int _1103 = _1101 ? 0 : 1;
    float _1105 = trunc(_999);
    int _1107 = int(_1105);
    float _1109 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1093);
    bool _1111 = !_1095;
    int _1113 = _1111 ? _1003 : (-1);
    int _1115 = abs(_941);
    float _1117 = float(_911);
    int _1119 = ~_1083;
    int _1121 = _1119 + 1;
    int _1123 = _1121 + 1;
    float _1125 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1097);
    int _1127 = _510 + (-1);
    float _1129 = fma(_1075, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1099);
    bool _1131 = !_953;
    int _1133 = _1131 ? 0 : 1;
    int _1135 = _1113 * _1123;
    float _1137 = float(_1091);
    int _1139 = _1107 * _1077;
    int _1141 = _1139 + _592;
    int _1143 = _1083 * _1127;
    int _1145 = _1143 + _1135;
    float _1147 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1125);
    int _1149 = abs(_1103);
    float _1151 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1109);
    float _1153 = float(_1025);
    float _1155 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1129);
    int _1157 = abs(_935);
    float _1159 = _1153 * _1033;
    int _1161 = abs(_1133);
    int _1163 = _1145 * _1031;
    float _1165 = in.m_61.x;
    float _1167 = in.m_61.y;
    float _1169 = in.m_61.z;
    bool _1171 = !_929;
    int _1173 = _1171 ? 0 : 1;
    int _1175 = _1009 * _1157;
    int _1177 = _1175 + _1163;
    float _1179 = float(_1149);
    float _1181 = _1159 * (-2.0);
    float _1183 = float(_1161);
    float _1185 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1155);
    float _1187 = _1179 * _1117;
    int _1189 = abs(_1173);
    float _1191 = _1183 * _1137;
    float _1193 = fma(_987, _1181, _987);
    int _1195 = _1141 * _1115;
    int _1197 = _1195 + _1177;
    float _1199 = _1187 * (-2.0);
    float _1201 = float(uint(_1141));
    float _1203 = _1191 * (-2.0);
    int _1205 = _1107 * _1189;
    int _1207 = _1205 + _1197;
    float _1209 = fma(_981, _1199, _981);
    float _1211 = as_type<float>(_620) * _1201;
    float _1213 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1151);
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1215;
    float _1219 = in.m_59.x;
    float _1221 = fma(_1199, _1169, _1169);
    float _1223 = float(uint(_1207));
    float _1225 = fma(_1181, _1167, _1167);
    float _1227 = _701 + (-0.5);
    float _1229 = fma(_1217, _779, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1231 = trunc(_1211);
    float _1233 = precise::max(_1231, 0.0);
    uint _1235 = uint(_1233);
    float _1237 = as_type<float>(_620) * _1223;
    float _1239 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1225);
    float _1241 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1221);
    int _1243 = ~_510;
    int _1245 = _1243 + 1;
    float _1247 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1147);
    float _1249 = fma(_1193, _841, _1239);
    int _1251 = ~_510;
    int _1253 = _1251 + 1;
    float _1255 = trunc(_1237);
    float _1257 = precise::max(_1255, 0.0);
    uint _1259 = uint(_1257);
    bool _1261 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1263 = isnan(_480);
    bool _1265 = _1261 || _1263;
    bool _1267 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1269 = _1265 || _1267;
    float _1271 = float(_1269);
    float _1273 = _1249 * 0.15915493667125701904296875;
    float _1275 = _1247 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    bool _1277 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1279 = isnan(_480);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = fma(_1209, _841, _1241);
    bool _1291 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1293 = isnan(_480);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1299 = _1295 || _1297;
    float _1301 = float(_1299);
    int _1303 = _1245 * int(_1235);
    int _1305 = _1303 + _1141;
    bool _1307 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1309 = isnan(_480);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = -_1287;
    float _1321 = _1319 + 1.0;
    float _1323 = _1273 * 6.283185482025146484375;
    float _1325 = sin(_1323);
    float _1327 = -_1301;
    float _1329 = _1327 + 1.0;
    float _1331 = float(uint(_1305));
    float _1333 = _1301 * _1321;
    float _1335 = _1289 * 0.15915493667125701904296875;
    int _1337 = _1253 * int(_1259);
    int _1339 = _1337 + _1207;
    float _1341 = fma(_1049, _779, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1343 = as_type<float>(_620) * _1331;
    float _1345 = _1273 * 6.283185482025146484375;
    float _1347 = cos(_1345);
    float _1349 = _1317 * _1329;
    float _1351 = float(uint(_1339));
    float _1353 = -_1317;
    float _1355 = _1353 + 1.0;
    float _1357 = as_type<float>(_620) * _1351;
    float _1359 = _1271 * _1355;
    float _1361 = _1213 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1363 = -_1275;
    float _1365 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1367 = _1351;
    float _1369 = _1219;
    float _1371 = _1275;
    float _1373 = _1341;
    if (_496)
    {
        _1367 = _1219;
    }
    float _1375 = _1367;
    float _1377 = _825 * _1359;
    float _1379 = _1185 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1381 = -_1361;
    float _1383 = _1381 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1385 = _1365 * _1365;
    float _1387 = _1035 * _1359;
    float _1389 = -_1379;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1393 = trunc(_1357);
    float _1395 = precise::max(_1393, 0.0);
    uint _1397 = uint(_1395);
    float _1399 = fma(_1383, _1383, _1385);
    float _1401 = _1037 * _1359;
    float _1403 = _1375;
    if (_660)
    {
        float _1405 = -_1375;
        float _1407 = _1405 + 1.0;
        _1403 = _1407;
    }
    float _1409 = _1403;
    float _1411 = -_1271;
    float _1413 = _1411 + 1.0;
    float _1415 = fma(_1391, _1391, _1399);
    if (_496)
    {
        _1369 = _1409;
    }
    float _1417 = _1369;
    float _1419 = fma(_1203, _1165, _1165);
    float _1421 = fma(_965, _1203, _965);
    float _1423 = rsqrt(_1415);
    float _1425 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1387);
    float _1427 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1419);
    int _1429 = ~_510;
    int _1431 = _1429 + 1;
    float _1433 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1435 = int(_1259) + int(_1397);
    float _1437 = fma(_1421, _841, _1427);
    float _1439 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1377);
    float _1441 = trunc(_1343);
    float _1443 = precise::max(_1441, 0.0);
    uint _1445 = uint(_1443);
    float _1447 = fma(_829, _1433, _705);
    float _1449 = _1437 * 0.15915493667125701904296875;
    float _1451 = fma(_1053, _1349, _1425);
    int _1453 = _1431 * _1435;
    int _1455 = _1453 + _1207;
    float _1457 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1401);
    float _1459 = fma(_937, _1349, _1439);
    float _1461 = fma(_1061, _1333, _1451);
    float _1463 = _1383 * _1423;
    float _1465 = _1335 * 6.283185482025146484375;
    float _1467 = sin(_1465);
    bool _1469 = uint(_1455) >= uint(_510);
    float _1471 = _1391 * _1423;
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1475 = _1463 * _1473;
    float _1477 = _1365 * _1423;
    bool _1479 = !_1469;
    int _1481 = _1479 ? 0 : (-1);
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1485 = _1471 * _1483;
    float _1487 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1489 = -_1475;
    float _1491 = fma(_1471, _1487, _1489);
    float _1493 = _1335 * 6.283185482025146484375;
    float _1495 = cos(_1493);
    int _1497 = int(_1235) + int(_1445);
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1501 = _1477 * _1499;
    float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1505 = -_1485;
    float _1507 = fma(_1477, _1503, _1505);
    float _1509 = _1491 * _1491;
    float _1511 = fma(_1057, _1349, _1457);
    int _1513 = ~_1435;
    int _1515 = _1513 + _1481;
    int _1517 = _1515 + 1;
    float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1521 = -_1501;
    float _1523 = fma(_1463, _1519, _1521);
    float _1525 = _1449 * 6.283185482025146484375;
    float _1527 = sin(_1525);
    float _1529 = fma(_1507, _1507, _1509);
    float _1531 = _1325 * _1467;
    int _1533 = _510 * _1517;
    int _1535 = _1533 + _1207;
    float _1537 = fma(_1229, _1333, _1459);
    float _1539 = fma(_1523, _1523, _1529);
    float _1541 = _1449 * 6.283185482025146484375;
    float _1543 = cos(_1541);
    float _1545 = _1347 * _1495;
    float _1547 = fma(_1527, _1531, _1545);
    float _1549 = fma(_1527, _1545, _1531);
    float _1551 = _1325 * _1495;
    float _1553 = _1347 * _1467;
    float _1555 = rsqrt(_1539);
    float _1557 = _1549 * _753;
    float _1559 = -_1553;
    float _1561 = fma(_1527, _1551, _1559);
    float _1563 = _1543 * _1495;
    float _1565 = -_1551;
    float _1567 = fma(_1527, _1553, _1565);
    bool _1569 = !_1095;
    int _1571 = _1569 ? _1535 : (-1);
    float _1573 = _1543 * _1467;
    float _1575 = _1563 * _753;
    float _1577 = _1561 * _753;
    int _1579 = _1571 >> 31;
    float _1581 = fma(_1567, _751, _1557);
    float _1583 = fma(_1573, _751, _1575);
    float _1585 = _1543 * _799;
    int _1587 = _1579 & 3;
    float _1589 = fma(_1547, _751, _1577);
    float _1591 = _1491 * _1555;
    float _1593 = -_1527;
    float _1595 = fma(_1593, _799, _1583);
    float _1597 = _1507 * _1555;
    int _1599 = _1571 + _1587;
    float _1601 = _1523 * _1555;
    float _1603 = _1471 * _1591;
    float _1605 = _1477 * _1597;
    int _1607 = _1599 >> 2;
    float _1609 = fma(_1325, _1585, _1589);
    float _1611 = -_1603;
    float _1613 = fma(_1477, _1601, _1611);
    float _1615 = -_1605;
    float _1617 = fma(_1463, _1591, _1615);
    int _1619 = _1607 << 4;
    int _1621 = _1619 + 368;
    float _1623 = fma(_1347, _1585, _1581);
    float _1625 = _1613 * _1595;
    float _1627 = _1617 * _1595;
    uint _1629 = uint(int(uint(_1621) >> uint(2)));
    uint _1631 = uint(int(uint(int(_1629)) >> uint(2)));
    int _1633 = int(_1629) & 3;
    float _1635 = (*spvDescriptorSet0.vp_c9)._m0[int(_1631)][_1633];
    int _1637 = int(_1629) + 1;
    uint _1639 = uint(int(uint(_1637) >> uint(2)));
    int _1641 = _1637 & 3;
    float _1643 = (*spvDescriptorSet0.vp_c9)._m0[int(_1639)][_1641];
    int _1645 = ~_510;
    int _1647 = _1645 + 1;
    float _1649 = fma(_1597, _1609, _1625);
    float _1651 = fma(_1601, _1609, _1627);
    int _1653 = _1571 & 3;
    bool _1655 = _1653 != 0;
    float _1657 = fma(_1463, _1623, _1649);
    float _1659 = fma(_1471, _1623, _1651);
    int _1661 = _1647 * _1497;
    int _1663 = _1661 + _1141;
    int _1665 = _1621 + 8;
    uint _1667 = uint(int(uint(_1665) >> uint(2)));
    uint _1669 = uint(int(uint(int(_1667)) >> uint(2)));
    int _1671 = int(_1667) & 3;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[int(_1669)][_1671];
    int _1675 = int(_1667) + 1;
    uint _1677 = uint(int(uint(_1675) >> uint(2)));
    int _1679 = _1675 & 3;
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[int(_1677)][_1679];
    float _1683 = _1361 + _1657;
    float _1685 = _1379 + _1659;
    int _1687 = _1571 & 3;
    bool _1689 = _1687 != 0;
    bool _1691 = uint(_1663) >= uint(_510);
    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1695 = _1683 + _1693;
    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1699 = _1685 + _1697;
    float _1701 = _1463 * _1601;
    bool _1703 = !_1691;
    int _1705 = _1703 ? 0 : (-1);
    float _1707 = _1695 * _1695;
    bool _1709 = uint(_1687) > 1u;
    float _1711 = _1699 * _1699;
    int _1713 = _1655 ? 0 : 1;
    float _1715 = -_1701;
    float _1717 = fma(_1471, _1597, _1715);
    int _1719 = ~_1497;
    int _1721 = _1719 + _1705;
    int _1723 = _1721 + 1;
    float _1725 = _1707 + _1711;
    int _1727 = ~_1713;
    int _1729 = _1727 + 1;
    int _1731 = _1729 + 1;
    float _1733 = _1717 * _1595;
    bool _1735 = _1687 != 3;
    float _1737 = sqrt(_1725);
    bool _1739 = uint(_1687) >= 2u;
    float _1741 = fma(_1591, _1609, _1733);
    bool _1743 = !_1689;
    int _1745 = _1743 ? 0 : 1;
    int _1747 = _1731;
    float _1749 = _1707;
    float _1751 = _1711;
    if (!_1709)
    {
        int _1753 = ~_1713;
        int _1755 = _1753 + 1;
        _1747 = _1755;
    }
    int _1757 = _1747;
    float _1759 = fma(_1477, _1623, _1741);
    int _1761 = _1739 ? 0 : 1;
    int _1763 = abs(_1757);
    float _1765 = _1275 + _1759;
    int _1767 = ~_1761;
    int _1769 = _1767 + 1;
    int _1771 = _1769 + 1;
    int _1773 = abs(_1745);
    int _1775 = ~_1763;
    int _1777 = _1775 + 1;
    int _1779 = _1777 + 1;
    bool _1781 = _1737 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1783 = _1771;
    if (_1735)
    {
        int _1785 = ~_1761;
        int _1787 = _1785 + 1;
        _1783 = _1787;
    }
    int _1789 = _1783;
    int _1791 = _1779 * as_type<int>(_1643);
    bool _1793 = _1687 != 3;
    int _1795 = ~_1773;
    int _1797 = _1795 + 1;
    int _1799 = _1797 + 1;
    int _1801 = abs(_1789);
    bool _1803 = !_514;
    int _1805 = _1803 ? 0 : 1;
    int _1807 = _1799 * as_type<int>(_1635);
    int _1809 = _1807 + _1791;
    bool _1811 = !_1793;
    float _1813 = _1811 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _1815 = ~_1801;
    int _1817 = _1815 + 1;
    int _1819 = _1817 + 1;
    int _1821 = abs(_1805);
    int _1823 = abs(as_type<int>(_1813));
    int _1825 = _1819 * as_type<int>(_1673);
    int _1827 = _1825 + _1809;
    float _1829 = _1673;
    float _1831 = _1813;
    if (!_1781)
    {
        _1371 = _1683;
    }
    float _1833 = _1371;
    float _1835 = _1833;
    if (!_1781)
    {
        _1829 = _1685;
    }
    float _1837 = _1829;
    int _1839 = ~_1823;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    float _1845 = _1837;
    if (!_1781)
    {
        _1831 = _1765;
    }
    float _1847 = _1831;
    bool _1849 = !_1781;
    float _1851 = _1847;
    if (!_1849)
    {
        float _1853 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1857 = _1737 + _1855;
        float _1859 = rsqrt(_1725);
        float _1861 = _1857 * _1853;
        float _1863 = _1765 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1865 = _1861 * 0.15915493667125701904296875;
        float _1867 = _1865 * 6.283185482025146484375;
        float _1869 = sin(_1867);
        float _1871 = _1865 * 6.283185482025146484375;
        float _1873 = cos(_1871);
        float _1875 = fma(_1869, _1863, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1877 = _1859 * _1875;
        float _1879 = fma(_1695, _1877, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1881 = _1873 + (-1.0);
        float _1883 = fma(_1699, _1877, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1885 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1887 = _1879 + _1885;
        float _1889 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1893 = _1883 + _1891;
        float _1895 = _1887 * _1887;
        float _1897 = fma(_1765, _1873, _1889);
        float _1899 = _1893 * _1893;
        _1851 = _1897;
        _1749 = _1895;
        _1751 = _1899;
        _1835 = _1879;
        _1845 = _1883;
    }
    float _1901 = _1851;
    float _1903 = _1749;
    float _1905 = _1751;
    float _1907 = _1835;
    float _1909 = _1845;
    float _1911 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1913 = _1901 + _1911;
    int _1915 = _510 * _1723;
    int _1917 = _1915 + _1141;
    int _1919 = ~_1821;
    int _1921 = _1919 + 1;
    int _1923 = _1921 + 1;
    int _1925 = _1843 * as_type<int>(_1681);
    int _1927 = _1925 + _1827;
    float _1929 = fma(_1913, _1913, _1903);
    float _1931 = fma(_1341, _1333, _1511);
    bool _1933 = !_1095;
    int _1935 = _1933 ? _1917 : (-1);
    int _1937 = _1927 * _1923;
    float _1939 = _1929 + _1905;
    float _1941 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1461);
    float _1943 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1537);
    float _1945 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1931);
    int _1947 = _1935 * _1821;
    int _1949 = _1947 + _1937;
    float _1951 = sqrt(_1939);
    float _1953 = _805 + 0.5;
    float _1955 = _1941 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1957 = _1943 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1959 = _1945 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1961 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1963 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1965 = _1447 + 0.5;
    float _1967 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1969 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1971 = float(_1949);
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    bool _1973 = _1951 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1975 = isnan(_1951);
    bool _1977 = _1973 || _1975;
    bool _1979 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1981 = _1977 || _1979;
    out.m_65.x = _1965;
    out.m_65.y = _1953;
    out.m_67.x = _1967;
    out.m_67.y = _1961;
    out.m_67.z = _1969;
    out.m_67.w = _1963;
    out.m_69.x = _1971;
    float _1983 = as_type<float>(_1949);
    float _1985 = _1967;
    float _1987 = _1969;
    float _1989 = _1963;
    if (!_1981)
    {
        _1983 = 1.0;
    }
    float _1991 = _1983;
    bool _1993 = !_1981;
    float _1995 = _1991;
    if (!_1993)
    {
        bool _1997 = _1951 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1999 = isnan(_1951);
        bool _2001 = _1997 || _1999;
        bool _2003 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2005 = _2001 || _2003;
        if (!_2005)
        {
            float _2007 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2009 = _1951 + _2007;
            float _2011 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2013 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2011;
            float _2015 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2017 = _2015 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2019 = 1.0 / _2013;
            float _2021 = _2009 * _2019;
            float _2023 = fma(_2021, _2017, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1995 = _2023;
            _2025 = true;
        }
        else
        {
            bool _2027 = _1951 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2029 = isnan(_1951);
            bool _2031 = _2027 || _2029;
            bool _2033 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2035 = _2031 || _2033;
            if (!_2035)
            {
                float _2037 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2039 = _1951 + _2037;
                float _2041 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2043 = _2041 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2045 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2047 = _2045 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2049 = 1.0 / _2043;
                float _2051 = _2039 * _2049;
                float _2053 = fma(_2051, _2047, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1995 = _2053;
                _2025 = true;
            }
            else
            {
                _1995 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2025 = false;
    float _2055 = _1995;
    float _2057 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2059 = _1901 + _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2063 = _1907 + _2061;
    float _2065 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2067 = _1909 + _2065;
    float _2069 = fma(_2059, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2071 = fma(_2063, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2073 = fma(_2067, _2055, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2075 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2077 = _2069 + _2075;
    float _2079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2081 = _2071 + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2085 = _2073 + _2083;
    float _2087 = _2077 * _2077;
    float _2089 = fma(_2081, _2081, _2087);
    float _2091 = fma(_2085, _2085, _2089);
    float _2093 = rsqrt(_2091);
    float _2095 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2097 = _2081 * _2095;
    float _2099 = _2085 * _2095;
    float _2101 = _2097 * _2097;
    float _2103 = _2099 * _2099;
    float _2105 = _2101 + _2103;
    float _2107 = sqrt(_2105);
    bool _2109 = _2107 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2113 = _2107 + _2111;
    float _2115 = _2085;
    float _2117 = _2113;
    float _2119 = _2097;
    if (_2109)
    {
        float _2121 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2115 = _2121;
    }
    float _2123 = _2115;
    if (_2109)
    {
        float _2125 = rsqrt(_2105);
        _1985 = _2125;
    }
    float _2127 = _1985;
    float _2129 = _2127;
    if (_2109)
    {
        float _2131 = _2113 * _2123;
        _2117 = _2131;
    }
    float _2133 = _2117;
    if (_2109)
    {
        float _2135 = _2133 * 0.15915493667125701904296875;
        _1987 = _2135;
    }
    float _2137 = _1987;
    float _2139 = _2093;
    if (_2109)
    {
        float _2141 = _2137 * 6.283185482025146484375;
        float _2143 = sin(_2141);
        _2139 = _2143;
    }
    float _2145 = _2139;
    float _2147 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2149 = precise::max(0.0, _2147);
    float _2151 = _2089;
    float _2153 = _2149;
    float _2155 = _2147;
    if (_2109)
    {
        float _2157 = _2137 * 6.283185482025146484375;
        float _2159 = cos(_2157);
        _2151 = _2159;
    }
    float _2161 = _2151;
    float _2163 = -_2095;
    float _2165 = -_2149;
    float _2167 = fma(_2077, _2163, _2165);
    if (!_2109)
    {
        _2153 = _2099;
    }
    float _2169 = _2153;
    float _2171 = _2169;
    if (_2109)
    {
        float _2173 = _2167 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2155 = _2173;
    }
    float _2175 = _2155;
    float _2177 = sqrt(_2091);
    float _2179 = _2145;
    float _2181 = _2175;
    if (_2109)
    {
        float _2183 = fma(_2145, _2175, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2179 = _2183;
    }
    float _2185 = _2179;
    float _2187 = _2185;
    if (_2109)
    {
        float _2189 = _2161 + (-1.0);
        _2181 = _2189;
    }
    float _2191 = _2181;
    float _2193 = _2191;
    if (_2109)
    {
        float _2195 = _2127 * _2185;
        _1373 = _2195;
    }
    float _2197 = _1373;
    if (!_2109)
    {
        _2129 = _2167;
    }
    float _2199 = _2129;
    float _2201 = _2199;
    if (_2109)
    {
        float _2203 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1989 = _2203;
    }
    float _2205 = _1989;
    if (_2109)
    {
        float _2207 = _2097 * _2197;
        _2119 = _2207;
    }
    float _2209 = _2119;
    if (!_2109)
    {
        _2187 = _2101;
    }
    float _2211 = _2187;
    float _2213 = _2211;
    if (_2109)
    {
        float _2215 = _2099 * _2197;
        _2171 = _2215;
    }
    float _2217 = _2171;
    if (_2109)
    {
        float _2219 = fma(_2167, _2161, _2205);
        _2201 = _2219;
    }
    float _2221 = _2201;
    if (_2109)
    {
        float _2223 = _2209 * _2209;
        _2213 = _2223;
    }
    float _2225 = _2213;
    if (!_2109)
    {
        _2193 = _2103;
    }
    float _2227 = _2193;
    float _2229 = _2227;
    if (_2109)
    {
        float _2231 = _2217 * _2217;
        _2229 = _2231;
    }
    float _2233 = _2229;
    float _2235 = fma(_2221, _2221, _2225);
    float _2237 = _2235 + _2233;
    float _2239 = _2069 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2243 = fma(_2177, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2241);
    float _2245 = precise::clamp(_2243, 0.0, 1.0);
    float _2247 = _2069 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2249 = rsqrt(_2237);
    float _2251 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2239);
    float _2253 = -_2245;
    float _2255 = _2253 + 1.0;
    float _2257 = _2069 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2259 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2247);
    float _2261 = _2069 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2263 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2251);
    float _2265 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2257);
    float _2267 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2259);
    float _2269 = abs(_2255);
    float _2271 = log2(_2269);
    float _2273 = fma(_2071, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2261);
    float _2275 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2265);
    float _2277 = _2267 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2279 = _2263 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2281 = fma(_2073, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2273);
    float _2283 = _2275 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2285 = _2249 * _2209;
    float _2287 = _2277 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2289 = _2249 * _2221;
    float _2291 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2293 = _2285 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2295 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2287);
    float _2297 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2299 = _2249 * _2217;
    float _2301 = -_2293;
    float _2303 = fma(_2289, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2301);
    float _2305 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2307 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2295);
    float _2309 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2311 = -_2297;
    float _2313 = fma(_2311, _2291, 1.0);
    float _2315 = -_2299;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2303);
    float _2319 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2307);
    float _2321 = _2277 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2323 = _2277 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2325 = fma(_2317, -0.5, 0.5);
    float _2327 = exp2(_2309);
    float _2329 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2321);
    float _2331 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2323);
    float _2333 = fma(_2317, 0.5, 0.5);
    float _2335 = _2289 + 1.0;
    float _2337 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2329);
    float _2339 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2331);
    float _2341 = fma(_2333, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2343 = log2(_2313);
    float _2345 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2337);
    float _2347 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2339);
    float _2349 = fma(_2333, _2341, -0.212114393711090087890625);
    float _2351 = fma(_2333, _2349, 1.570728778839111328125);
    float _2353 = 1.0 / _2319;
    float _2355 = -_2289;
    float _2357 = fma(_2327, _2335, _2355);
    float _2359 = fma(_2357, 0.5, 0.5);
    float _2361 = sqrt(_2325);
    float _2363 = _2343 * 0.693147182464599609375;
    float _2365 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2367 = _2345 * _2353;
    float _2369 = _2347 * _2353;
    float _2371 = fma(_2367, 0.5, 0.5);
    float _2373 = fma(_2369, -0.5, 0.5);
    float _2375 = _2361 * 0.636619746685028076171875;
    float3 _6051 = float3(_2371, _2373, _2365);
    float _2377 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6051, float3(0.0), isnan(_6051)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6051, float3(0.0), isnan(_6051)), level(0.0)).x;
    float3 _6062 = float3(_2371, _2373, _2365);
    float4 _2380 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6062, float3(0.0), isnan(_6062)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6062, float3(0.0), isnan(_6062)), level(0.0)).xyzw;
    float _2382 = _2380.x;
    float _2384 = _2380.y;
    float _2386 = _2380.z;
    float _2388 = _2380.w;
    float _2390 = -_2351;
    float _2392 = fma(_2375, _2390, 1.0);
    float2 _6084 = float2(_2392, _2359);
    float3 _2396 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6084, float2(0.0), isnan(_6084)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6084, float2(0.0), isnan(_6084)), level(0.0)).xyz;
    float _2398 = _2396.x;
    float _2400 = _2396.y;
    float _2402 = _2396.z;
    float _2404 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2406 = _2277 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2408 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2406);
    float _2410 = exp2(_2404);
    float _2412 = fma(_2279, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2408);
    float _2414 = fma(_2305, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2412);
    float _2416 = _2414 + _2319;
    float _2418 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2345;
    out.gl_Position.y = _2347;
    out.gl_Position.z = _2414;
    out.gl_Position.w = _2319;
    float _2420 = _2416 * 0.5;
    float _2422 = -_2410;
    float _2424 = _2422 + 1.0;
    out.m_47.x = _2418;
    float _2426 = _2424 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _2420;
    out.m_71.w = _2319;
    float _2428 = _2426 * _2377;
    float _2430 = -_2426;
    float _2432 = _2430 + 1.0;
    float _2434 = _2388 * _2428;
    float _2436 = _2402 * _2428;
    float _2438 = fma(_2398, _2434, _2382);
    float _2440 = fma(_2400, _2434, _2384);
    float _2442 = _2388 * _2432;
    float _2444 = fma(_2388, _2436, _2386);
    out.m_73.x = _2438;
    out.m_73.y = _2440;
    out.m_73.z = _2444;
    out.m_73.w = _2442;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

