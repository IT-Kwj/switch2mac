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
    float4 m_67 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_69 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad5 [[user(locn5)]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _638 = false;
    bool _458 = false;
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1540 = as_type<float>(_106);
        out.gl_Position.z = _1540;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_47.w;
    float _112 = in.m_49.z;
    float _114 = in.m_49.w;
    bool _116 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_110);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_110;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.z = _112;
    out.m_51.w = _114;
    if (_124)
    {
        float _130 = float(_90);
        _100 = _130;
    }
    float _132 = _100;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _108 = as_type<int>(_144);
    }
    int _146 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1617 = as_type<float>(_146);
        out.gl_Position.z = _1617;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_53.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
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
        float _272 = in.m_49.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_90);
        float _294 = 1.0 / _292;
        float _296 = _128 * _294;
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
    float _352 = -_314;
    float _354 = _352 + 1.0;
    float _356 = 1.0 / _334;
    float _358 = _350 * _354;
    float _360 = -_350;
    float _362 = _360 + 1.0;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _364;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _370 = 1.0 / _338;
    float _372 = _330 * _362;
    float _374 = -_330;
    float _376 = _374 + 1.0;
    float _378 = _302 * _356;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _384;
    float _388 = fma(_366, _378, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _390 = fma(_382, _378, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _392 = fma(_386, _378, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _394 = _318 * _370;
    float _396 = _388 * _372;
    float _398 = _390 * _372;
    float _400 = _392 * _372;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _414 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[107].x, _396);
    float _416 = fma(_404, _394, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _418 = fma(_408, _394, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _420 = fma(_412, _394, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _422 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[107].y, _398);
    float _424 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[107].z, _400);
    float _426 = fma(_416, _358, _414);
    float _428 = fma(_418, _358, _422);
    float _430 = fma(_420, _358, _424);
    float _432 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].x, _426);
    float _434 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].y, _428);
    float _436 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].z, _430);
    bool _438 = !_368;
    float _456;
    if (!_438)
    {
        float _440 = in.m_49.x;
        float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _444 = _440 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _446 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _448 = _446 * _442;
        float _450 = floor(_448);
        float _452 = -_450;
        float _454 = _448 + _452;
        _456 = _454;
        _458 = true;
    }
    else
    {
        float _460 = float(_90);
        float _462 = 1.0 / _460;
        float _464 = _128 * _462;
        _456 = _464;
    }
    _458 = false;
    float _466 = _456;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _470 = _466 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _478 = isnan(_466);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _496 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _498 = isnan(_466);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = 1.0 / _474;
    float _510 = -_486;
    float _512 = _510 + 1.0;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _514;
    bool _518 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _520 = isnan(_466);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _506 * _512;
    float _532 = -_506;
    float _534 = _532 + 1.0;
    bool _536 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _538 = 1.0 / _490;
    float _540 = _528 * _534;
    float _542 = -_528;
    float _544 = _542 + 1.0;
    float _546 = 1.0 / _494;
    float _548 = _516 * _508;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _554 = fma(_548, _470, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _556 = _552 * _538;
    bool _558 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _560 = isnan(_466);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _576 = _466 + _574;
    float _578 = _554 * _540;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _582 = _466 + _580;
    float _584 = -_568;
    float _586 = _584 + 1.0;
    float _588 = fma(_556, _576, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _590 = _572 * _546;
    float _592 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[115].x, _578);
    float _594 = _486 * _586;
    float _596 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _598 = fma(_590, _582, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _600 = fma(_588, _530, _592);
    float _602 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = fma(_598, _594, _600);
    float _608 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[118].x, _606);
    float _614 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _604;
    out.m_55.y = _614;
    out.m_55.z = _610;
    out.m_55.w = _616;
    bool _618 = !_536;
    float _636;
    if (!_618)
    {
        float _620 = in.m_49.x;
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _624 = _620 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_90);
        float _642 = 1.0 / _640;
        float _644 = _128 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    float _648 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _650 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _652 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _654 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _648);
    float _656 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _650);
    float _658 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _652);
    float _660 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _654);
    float _662 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _656);
    float _664 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _658);
    float _666 = _660 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _668 = _662 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _670 = _664 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _674 = _666 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _678 = _668 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _682 = _670 + _680;
    float _684 = _674 * _674;
    float _686 = fma(_678, _678, _684);
    float _688 = fma(_682, _682, _686);
    float _690 = rsqrt(_688);
    float _692 = _674 * _690;
    float _694 = _678 * _690;
    float _696 = _682 * _690;
    float _698 = -_692;
    float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[18].w, _674);
    float _702 = -_694;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _706 = -_696;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _682);
    float _710 = _700 * _700;
    float _712 = in.m_53.x;
    float _714 = in.m_53.y;
    float _716 = in.m_53.z;
    float _718 = fma(_704, _704, _710);
    float _720 = in.m_57.x;
    float _722 = in.m_57.y;
    float _724 = in.m_57.z;
    float _726 = fma(_708, _708, _718);
    float _728 = sqrt(_726);
    float _730 = _714 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _732 = _712 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _734 = _690 * _728;
    float _736 = _716 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _738 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _722);
    float _742 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _746 = _738 * _734;
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _720);
    float _750 = _742 * _734;
    float _752 = _744 * _734;
    float _754 = _746 * _740;
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _724);
    float _758 = _750 * _748;
    float _760 = _754 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _762 = _752 * _756;
    float _764 = _754 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[10].x, _760);
    float _768 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[8].x, _764);
    float _770 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[10].z, _766);
    float _772 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[8].z, _768);
    float _774 = _670 + _770;
    float _776 = _668 + _772;
    float _778 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _780 = _774 + _778;
    float _782 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _784 = _776 + _782;
    float _786 = _780 * _780;
    float _788 = fma(_784, _784, _786);
    float _790 = _754 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _792 = sqrt(_788);
    float _794 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[9].x, _790);
    float _796 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[9].z, _794);
    float _798 = _666 + _796;
    bool _800 = _792 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _802 = _758;
    float _804 = _762;
    float _806 = _774;
    float _808 = _788;
    if (!_800)
    {
        _802 = _776;
    }
    float _810 = _802;
    float _812 = _810;
    if (!_800)
    {
        _804 = _798;
    }
    float _814 = _804;
    bool _816 = !_800;
    float _818 = _814;
    if (!_816)
    {
        float _820 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _822 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _824 = _792 + _822;
        float _826 = _798 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = rsqrt(_788);
        float _830 = _824 * _820;
        float _832 = _830 * 0.15915493667125701904296875;
        float _834 = _832 * 6.283185482025146484375;
        float _836 = sin(_834);
        float _838 = _832 * 6.283185482025146484375;
        float _840 = cos(_838);
        float _842 = fma(_836, _826, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _844 = _828 * _842;
        float _846 = _840 + (-1.0);
        float _848 = fma(_784, _844, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _850 = fma(_780, _844, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _852 = _846 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = fma(_798, _840, _852);
        _818 = _854;
        _812 = _848;
        _806 = _850;
    }
    float _856 = _818;
    float _858 = _812;
    float _860 = _806;
    float _862 = -_692;
    float _864 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[18].w, _856);
    float _866 = -_694;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _858);
    float _870 = -_696;
    float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[18].w, _860);
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _876 = _864 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _880 = _868 + _878;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _884 = _872 + _882;
    float _886 = _876 * _876;
    float _888 = fma(_880, _880, _886);
    float _890 = fma(_884, _884, _888);
    float _892 = rsqrt(_890);
    float _894 = _892 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _896 = _880 * _894;
    float _898 = _884 * _894;
    float _900 = _896 * _896;
    float _902 = _898 * _898;
    float _904 = _900 + _902;
    float _906 = sqrt(_904);
    bool _908 = _906 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _912 = _906 + _910;
    float _914 = _884;
    float _916 = _904;
    float _918 = _912;
    float _920 = _876;
    float _922 = _886;
    if (_908)
    {
        float _924 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _914 = _924;
    }
    float _926 = _914;
    if (_908)
    {
        float _928 = rsqrt(_904);
        _916 = _928;
    }
    float _930 = _916;
    float _932 = _930;
    if (_908)
    {
        float _934 = _912 * _926;
        _918 = _934;
    }
    float _936 = _918;
    if (_908)
    {
        float _938 = _936 * 0.15915493667125701904296875;
        _808 = _938;
    }
    float _940 = _808;
    float _942 = _926;
    if (_908)
    {
        float _944 = _940 * 6.283185482025146484375;
        float _946 = sin(_944);
        _942 = _946;
    }
    float _948 = _942;
    float _950 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _952 = precise::max(0.0, _950);
    float _954 = _780;
    float _956 = _952;
    if (_908)
    {
        float _958 = _940 * 6.283185482025146484375;
        float _960 = cos(_958);
        _954 = _960;
    }
    float _962 = _954;
    float _964 = -_894;
    float _966 = -_952;
    float _968 = fma(_876, _964, _966);
    if (!_908)
    {
        _920 = _896;
    }
    float _970 = _920;
    float _972 = _970;
    if (_908)
    {
        float _974 = _968 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _956 = _974;
    }
    float _976 = _956;
    float _978 = sqrt(_890);
    float _980 = _948;
    float _982 = _976;
    if (_908)
    {
        float _984 = fma(_948, _976, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _980 = _984;
    }
    float _986 = _980;
    float _988 = _986;
    float _990 = _962;
    if (_908)
    {
        float _992 = _962 + (-1.0);
        _982 = _992;
    }
    float _994 = _982;
    float _996 = 0.0;
    float _998 = _994;
    if (_908)
    {
        float _1000 = _930 * _986;
        _996 = _1000;
    }
    float _1002 = _996;
    if (!_908)
    {
        _988 = _968;
    }
    float _1004 = _988;
    float _1006 = _1004;
    if (_908)
    {
        float _1008 = _994 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _922 = _1008;
    }
    float _1010 = _922;
    if (_908)
    {
        float _1012 = _896 * _1002;
        _972 = _1012;
    }
    float _1014 = _972;
    if (!_908)
    {
        _998 = _898;
    }
    float _1016 = _998;
    float _1018 = _1016;
    if (_908)
    {
        float _1020 = _898 * _1002;
        _1018 = _1020;
    }
    float _1022 = _1018;
    if (!_908)
    {
        _932 = _900;
    }
    float _1024 = _932;
    float _1026 = _1024;
    if (_908)
    {
        float _1028 = fma(_968, _962, _1010);
        _1006 = _1028;
    }
    float _1030 = _1006;
    if (_908)
    {
        float _1032 = _1014 * _1014;
        _1026 = _1032;
    }
    float _1034 = _1026;
    if (!_908)
    {
        _990 = _902;
    }
    float _1036 = _990;
    float _1038 = _1036;
    if (_908)
    {
        float _1040 = _1022 * _1022;
        _1038 = _1040;
    }
    float _1042 = _1038;
    float _1044 = fma(_1030, _1030, _1034);
    float _1046 = _864 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1048 = _1044 + _1042;
    float _1050 = _864 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1054 = fma(_978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1052);
    float _1056 = precise::clamp(_1054, 0.0, 1.0);
    float _1058 = _864 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1060 = rsqrt(_1048);
    float _1062 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1050);
    float _1064 = -_1056;
    float _1066 = _1064 + 1.0;
    float _1068 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1058);
    float _1070 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1072 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1062);
    float _1074 = _864 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1076 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1068);
    float _1078 = abs(_1066);
    float _1080 = log2(_1078);
    float _1082 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1084 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1074);
    float _1086 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1088 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1046);
    float _1090 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1092 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1084);
    float _1094 = _1060 * _1030;
    float _1096 = -_1090;
    float _1098 = fma(_1096, _1070, 1.0);
    float _1100 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1102 = _1060 * _1014;
    float _1104 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1106 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1088);
    float _1108 = _1060 * _1022;
    float _1110 = _1102 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1112 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1104);
    float _1114 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1116 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1118 = -_1110;
    float _1120 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1118);
    float _1122 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1112);
    float _1124 = log2(_1098);
    float _1126 = -_1108;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1120);
    float _1130 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1122);
    float _1132 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1134 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1136 = fma(_1128, -0.5, 0.5);
    float _1138 = fma(_1128, 0.5, 0.5);
    float _1140 = exp2(_1116);
    float _1142 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1132);
    float _1144 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1134);
    float _1146 = _1094 + 1.0;
    float _1148 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1142);
    float _1150 = fma(_1138, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1152 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1144);
    float _1154 = 1.0 / _1130;
    float _1156 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1148);
    float _1158 = fma(_1138, _1150, -0.212114393711090087890625);
    float _1160 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1152);
    float _1162 = fma(_1138, _1158, 1.570728778839111328125);
    float _1164 = sqrt(_1136);
    float _1166 = -_1094;
    float _1168 = fma(_1140, _1146, _1166);
    float _1170 = _1124 * 0.693147182464599609375;
    float _1172 = fma(_1168, 0.5, 0.5);
    float _1174 = _1170 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1176 = _1156 * _1154;
    float _1178 = _1160 * _1154;
    float _1180 = fma(_1176, 0.5, 0.5);
    float _1182 = fma(_1178, -0.5, 0.5);
    float _1184 = _1164 * 0.636619746685028076171875;
    float3 _3321 = float3(_1180, _1182, _1174);
    float _1186 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3321, float3(0.0), isnan(_3321)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3321, float3(0.0), isnan(_3321)), level(0.0)).x;
    float3 _3332 = float3(_1180, _1182, _1174);
    float4 _1189 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3332, float3(0.0), isnan(_3332)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3332, float3(0.0), isnan(_3332)), level(0.0)).xyzw;
    float _1191 = _1189.x;
    float _1193 = _1189.y;
    float _1195 = _1189.z;
    float _1197 = _1189.w;
    float _1199 = -_1162;
    float _1201 = fma(_1184, _1199, 1.0);
    float2 _3354 = float2(_1201, _1172);
    float3 _1205 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3354, float2(0.0), isnan(_3354)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3354, float2(0.0), isnan(_3354)), level(0.0)).xyz;
    float _1207 = _1205.x;
    float _1209 = _1205.y;
    float _1211 = _1205.z;
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1215 = _646 + _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1219 = _646 + _1217;
    float _1221 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1231 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1233 = _722 != 0.0;
    bool _1235 = isnan(_722);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan(0.0);
    bool _1241 = _1237 || _1239;
    float _1243 = 1.0 / _1229;
    bool _1245 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1247 = isnan(_646);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    out.m_59.x = _868;
    out.m_59.y = _864;
    out.m_59.z = _872;
    float _1257 = 1.0 / _1225;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1259;
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1263;
    bool _1267 = _720 == 0.0;
    bool _1269 = !_1241;
    bool _1271 = _1267 && _1269;
    float _1273 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1231);
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1275;
    float _1279 = _1219 * _1243;
    bool _1281 = _724 == 0.0;
    bool _1283 = _1281 && _1271;
    float _1285 = exp2(_1221);
    float _1287 = _1215 * _1257;
    bool _1289 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1291 = isnan(_646);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = in.m_61.x;
    float _1303 = in.m_61.y;
    float _1305 = in.m_61.z;
    float _1307 = fma(_1277, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1309 = fma(_1261, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1311 = fma(_1265, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1313 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1315 = isnan(_646);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    float _1325 = -_1299;
    float _1327 = _1325 + 1.0;
    float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1331 = _1329 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1341 = _1255 * _1327;
    float _1343 = -_1255;
    float _1345 = _1343 + 1.0;
    float _1347 = fma(_1335, _1279, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1349 = fma(_1331, _1279, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1351 = fma(_1339, _1279, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1353 = _1323 * _1345;
    float _1355 = -_1323;
    float _1357 = _1355 + 1.0;
    float _1359 = -_1285;
    float _1361 = _1359 + 1.0;
    float _1363 = _1307 * _1353;
    float _1365 = _1311 * _1353;
    float _1367 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1363);
    float _1369 = _1303;
    float _1371 = _1301;
    float _1373 = _1305;
    if (!_1283)
    {
        float _1375 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1303);
        _1369 = _1375;
    }
    float _1377 = _1369;
    float _1379 = _1309 * _1353;
    if (!_1283)
    {
        float _1381 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1301);
        _1371 = _1381;
    }
    float _1383 = _1371;
    if (!_1283)
    {
        float _1385 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1305);
        _1373 = _1385;
    }
    float _1387 = _1373;
    float _1389 = -_694;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[18].w, _668);
    float _1393 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1379);
    float _1395 = -_696;
    float _1397 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[18].w, _670);
    float _1399 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1365);
    float _1401 = fma(_1349, _1341, _1367);
    float _1403 = fma(_1347, _1341, _1393);
    float _1405 = -_692;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _666);
    float _1409 = fma(_1351, _1341, _1399);
    float _1411 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1273);
    float _1413 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1401);
    float _1415 = _1156 + _1130;
    out.m_63.x = _1391;
    out.m_63.y = _1407;
    out.m_63.z = _1397;
    float _1417 = _1377 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1419 = _1377 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1421 = _1377 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1423 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1403);
    float _1425 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1409);
    float _1427 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1411);
    float _1429 = _1413 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1431 = _1415 * 0.5;
    float _1433 = fma(_1383, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1417);
    float _1435 = fma(_1383, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1419);
    float _1437 = _1130 * 0.5;
    float _1439 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1441 = fma(_1383, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1421);
    float _1443 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1445 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1447 = _1427 + _1130;
    float _1449 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1433);
    float _1451 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1435);
    float _1453 = fma(_1160, -0.5, _1437);
    float _1455 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1441);
    float _1457 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1459 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1461 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1463 = _1447 * 0.5;
    float _1465 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1449;
    out.m_65.y = _1451;
    out.m_65.z = _1455;
    out.m_67.x = _1457;
    out.m_67.y = _1459;
    out.m_67.z = _1461;
    out.gl_Position.x = _1156;
    out.gl_Position.y = _1160;
    out.gl_Position.z = _1427;
    out.gl_Position.w = _1130;
    out.m_69.x = _1431;
    out.m_69.y = _1453;
    out.m_69.z = _1463;
    out.m_69.w = _1130;
    out.m_45.x = _1465;
    float _1467 = _1439 * _1186;
    float _1469 = -_1439;
    float _1471 = _1469 + 1.0;
    float _1473 = _1197 * _1467;
    float _1475 = _1197 * _1471;
    float _1477 = _1211 * _1467;
    float _1479 = fma(_1207, _1473, _1191);
    float _1481 = fma(_1209, _1473, _1193);
    float _1483 = fma(_1197, _1477, _1195);
    out.m_71.x = _1479;
    out.m_71.y = _1481;
    out.m_71.z = _1483;
    out.m_71.w = _1475;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _638 = false;
    bool _458 = false;
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1540 = as_type<float>(_106);
        out.gl_Position.z = _1540;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_47.w;
    float _112 = in.m_49.z;
    float _114 = in.m_49.w;
    bool _116 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_110);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_110;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.z = _112;
    out.m_51.w = _114;
    if (_124)
    {
        float _130 = float(_90);
        _100 = _130;
    }
    float _132 = _100;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _108 = as_type<int>(_144);
    }
    int _146 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1617 = as_type<float>(_146);
        out.gl_Position.z = _1617;
    }
    if (_138)
    {
        return out;
    }
    float _148 = in.m_53.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
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
        float _272 = in.m_49.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_90);
        float _294 = 1.0 / _292;
        float _296 = _128 * _294;
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
    float _352 = -_314;
    float _354 = _352 + 1.0;
    float _356 = 1.0 / _334;
    float _358 = _350 * _354;
    float _360 = -_350;
    float _362 = _360 + 1.0;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _364;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _370 = 1.0 / _338;
    float _372 = _330 * _362;
    float _374 = -_330;
    float _376 = _374 + 1.0;
    float _378 = _302 * _356;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _384;
    float _388 = fma(_366, _378, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _390 = fma(_382, _378, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _392 = fma(_386, _378, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _394 = _318 * _370;
    float _396 = _388 * _372;
    float _398 = _390 * _372;
    float _400 = _392 * _372;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _414 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[107].x, _396);
    float _416 = fma(_404, _394, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _418 = fma(_408, _394, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _420 = fma(_412, _394, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _422 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[107].y, _398);
    float _424 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[107].z, _400);
    float _426 = fma(_416, _358, _414);
    float _428 = fma(_418, _358, _422);
    float _430 = fma(_420, _358, _424);
    float _432 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].x, _426);
    float _434 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].y, _428);
    float _436 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].z, _430);
    bool _438 = !_368;
    float _456;
    if (!_438)
    {
        float _440 = in.m_49.x;
        float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _444 = _440 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _446 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _448 = _446 * _442;
        float _450 = floor(_448);
        float _452 = -_450;
        float _454 = _448 + _452;
        _456 = _454;
        _458 = true;
    }
    else
    {
        float _460 = float(_90);
        float _462 = 1.0 / _460;
        float _464 = _128 * _462;
        _456 = _464;
    }
    _458 = false;
    float _466 = _456;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _470 = _466 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _478 = isnan(_466);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _496 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _498 = isnan(_466);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = 1.0 / _474;
    float _510 = -_486;
    float _512 = _510 + 1.0;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _514;
    bool _518 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _520 = isnan(_466);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _506 * _512;
    float _532 = -_506;
    float _534 = _532 + 1.0;
    bool _536 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _538 = 1.0 / _490;
    float _540 = _528 * _534;
    float _542 = -_528;
    float _544 = _542 + 1.0;
    float _546 = 1.0 / _494;
    float _548 = _516 * _508;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _554 = fma(_548, _470, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _556 = _552 * _538;
    bool _558 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _560 = isnan(_466);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _576 = _466 + _574;
    float _578 = _554 * _540;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _582 = _466 + _580;
    float _584 = -_568;
    float _586 = _584 + 1.0;
    float _588 = fma(_556, _576, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _590 = _572 * _546;
    float _592 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[115].x, _578);
    float _594 = _486 * _586;
    float _596 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _598 = fma(_590, _582, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _600 = fma(_588, _530, _592);
    float _602 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = fma(_598, _594, _600);
    float _608 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[118].x, _606);
    float _614 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _604;
    out.m_55.y = _614;
    out.m_55.z = _610;
    out.m_55.w = _616;
    bool _618 = !_536;
    float _636;
    if (!_618)
    {
        float _620 = in.m_49.x;
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _624 = _620 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_90);
        float _642 = 1.0 / _640;
        float _644 = _128 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    float _648 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _650 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _652 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _654 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _648);
    float _656 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _650);
    float _658 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _652);
    float _660 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _654);
    float _662 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _656);
    float _664 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _658);
    float _666 = _660 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _668 = _662 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _670 = _664 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _674 = _666 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _678 = _668 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _682 = _670 + _680;
    float _684 = _674 * _674;
    float _686 = fma(_678, _678, _684);
    float _688 = fma(_682, _682, _686);
    float _690 = rsqrt(_688);
    float _692 = _674 * _690;
    float _694 = _678 * _690;
    float _696 = _682 * _690;
    float _698 = -_692;
    float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[18].w, _674);
    float _702 = -_694;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _706 = -_696;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _682);
    float _710 = _700 * _700;
    float _712 = in.m_53.x;
    float _714 = in.m_53.y;
    float _716 = in.m_53.z;
    float _718 = fma(_704, _704, _710);
    float _720 = in.m_57.x;
    float _722 = in.m_57.y;
    float _724 = in.m_57.z;
    float _726 = fma(_708, _708, _718);
    float _728 = sqrt(_726);
    float _730 = _714 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _732 = _712 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _734 = _690 * _728;
    float _736 = _716 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _738 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _722);
    float _742 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _746 = _738 * _734;
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _720);
    float _750 = _742 * _734;
    float _752 = _744 * _734;
    float _754 = _746 * _740;
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _724);
    float _758 = _750 * _748;
    float _760 = _754 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _762 = _752 * _756;
    float _764 = _754 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[10].x, _760);
    float _768 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[8].x, _764);
    float _770 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[10].z, _766);
    float _772 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[8].z, _768);
    float _774 = _670 + _770;
    float _776 = _668 + _772;
    float _778 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _780 = _774 + _778;
    float _782 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _784 = _776 + _782;
    float _786 = _780 * _780;
    float _788 = fma(_784, _784, _786);
    float _790 = _754 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _792 = sqrt(_788);
    float _794 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[9].x, _790);
    float _796 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[9].z, _794);
    float _798 = _666 + _796;
    bool _800 = _792 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _802 = _758;
    float _804 = _762;
    float _806 = _774;
    float _808 = _788;
    if (!_800)
    {
        _802 = _776;
    }
    float _810 = _802;
    float _812 = _810;
    if (!_800)
    {
        _804 = _798;
    }
    float _814 = _804;
    bool _816 = !_800;
    float _818 = _814;
    if (!_816)
    {
        float _820 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _822 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _824 = _792 + _822;
        float _826 = _798 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = rsqrt(_788);
        float _830 = _824 * _820;
        float _832 = _830 * 0.15915493667125701904296875;
        float _834 = _832 * 6.283185482025146484375;
        float _836 = sin(_834);
        float _838 = _832 * 6.283185482025146484375;
        float _840 = cos(_838);
        float _842 = fma(_836, _826, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _844 = _828 * _842;
        float _846 = _840 + (-1.0);
        float _848 = fma(_784, _844, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _850 = fma(_780, _844, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _852 = _846 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = fma(_798, _840, _852);
        _818 = _854;
        _812 = _848;
        _806 = _850;
    }
    float _856 = _818;
    float _858 = _812;
    float _860 = _806;
    float _862 = -_692;
    float _864 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[18].w, _856);
    float _866 = -_694;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _858);
    float _870 = -_696;
    float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[18].w, _860);
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _876 = _864 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _880 = _868 + _878;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _884 = _872 + _882;
    float _886 = _876 * _876;
    float _888 = fma(_880, _880, _886);
    float _890 = fma(_884, _884, _888);
    float _892 = rsqrt(_890);
    float _894 = _892 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _896 = _880 * _894;
    float _898 = _884 * _894;
    float _900 = _896 * _896;
    float _902 = _898 * _898;
    float _904 = _900 + _902;
    float _906 = sqrt(_904);
    bool _908 = _906 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _912 = _906 + _910;
    float _914 = _884;
    float _916 = _904;
    float _918 = _912;
    float _920 = _876;
    float _922 = _886;
    if (_908)
    {
        float _924 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _914 = _924;
    }
    float _926 = _914;
    if (_908)
    {
        float _928 = rsqrt(_904);
        _916 = _928;
    }
    float _930 = _916;
    float _932 = _930;
    if (_908)
    {
        float _934 = _912 * _926;
        _918 = _934;
    }
    float _936 = _918;
    if (_908)
    {
        float _938 = _936 * 0.15915493667125701904296875;
        _808 = _938;
    }
    float _940 = _808;
    float _942 = _926;
    if (_908)
    {
        float _944 = _940 * 6.283185482025146484375;
        float _946 = sin(_944);
        _942 = _946;
    }
    float _948 = _942;
    float _950 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _952 = precise::max(0.0, _950);
    float _954 = _780;
    float _956 = _952;
    if (_908)
    {
        float _958 = _940 * 6.283185482025146484375;
        float _960 = cos(_958);
        _954 = _960;
    }
    float _962 = _954;
    float _964 = -_894;
    float _966 = -_952;
    float _968 = fma(_876, _964, _966);
    if (!_908)
    {
        _920 = _896;
    }
    float _970 = _920;
    float _972 = _970;
    if (_908)
    {
        float _974 = _968 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _956 = _974;
    }
    float _976 = _956;
    float _978 = sqrt(_890);
    float _980 = _948;
    float _982 = _976;
    if (_908)
    {
        float _984 = fma(_948, _976, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _980 = _984;
    }
    float _986 = _980;
    float _988 = _986;
    float _990 = _962;
    if (_908)
    {
        float _992 = _962 + (-1.0);
        _982 = _992;
    }
    float _994 = _982;
    float _996 = 0.0;
    float _998 = _994;
    if (_908)
    {
        float _1000 = _930 * _986;
        _996 = _1000;
    }
    float _1002 = _996;
    if (!_908)
    {
        _988 = _968;
    }
    float _1004 = _988;
    float _1006 = _1004;
    if (_908)
    {
        float _1008 = _994 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _922 = _1008;
    }
    float _1010 = _922;
    if (_908)
    {
        float _1012 = _896 * _1002;
        _972 = _1012;
    }
    float _1014 = _972;
    if (!_908)
    {
        _998 = _898;
    }
    float _1016 = _998;
    float _1018 = _1016;
    if (_908)
    {
        float _1020 = _898 * _1002;
        _1018 = _1020;
    }
    float _1022 = _1018;
    if (!_908)
    {
        _932 = _900;
    }
    float _1024 = _932;
    float _1026 = _1024;
    if (_908)
    {
        float _1028 = fma(_968, _962, _1010);
        _1006 = _1028;
    }
    float _1030 = _1006;
    if (_908)
    {
        float _1032 = _1014 * _1014;
        _1026 = _1032;
    }
    float _1034 = _1026;
    if (!_908)
    {
        _990 = _902;
    }
    float _1036 = _990;
    float _1038 = _1036;
    if (_908)
    {
        float _1040 = _1022 * _1022;
        _1038 = _1040;
    }
    float _1042 = _1038;
    float _1044 = fma(_1030, _1030, _1034);
    float _1046 = _864 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1048 = _1044 + _1042;
    float _1050 = _864 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1054 = fma(_978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1052);
    float _1056 = precise::clamp(_1054, 0.0, 1.0);
    float _1058 = _864 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1060 = rsqrt(_1048);
    float _1062 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1050);
    float _1064 = -_1056;
    float _1066 = _1064 + 1.0;
    float _1068 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1058);
    float _1070 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1072 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1062);
    float _1074 = _864 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1076 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1068);
    float _1078 = abs(_1066);
    float _1080 = log2(_1078);
    float _1082 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1084 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1074);
    float _1086 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1088 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1046);
    float _1090 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1092 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1084);
    float _1094 = _1060 * _1030;
    float _1096 = -_1090;
    float _1098 = fma(_1096, _1070, 1.0);
    float _1100 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1102 = _1060 * _1014;
    float _1104 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1106 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1088);
    float _1108 = _1060 * _1022;
    float _1110 = _1102 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1112 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1104);
    float _1114 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1116 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1118 = -_1110;
    float _1120 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1118);
    float _1122 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1112);
    float _1124 = log2(_1098);
    float _1126 = -_1108;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1120);
    float _1130 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1122);
    float _1132 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1134 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1136 = fma(_1128, -0.5, 0.5);
    float _1138 = fma(_1128, 0.5, 0.5);
    float _1140 = exp2(_1116);
    float _1142 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1132);
    float _1144 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1134);
    float _1146 = _1094 + 1.0;
    float _1148 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1142);
    float _1150 = fma(_1138, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1152 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1144);
    float _1154 = 1.0 / _1130;
    float _1156 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1148);
    float _1158 = fma(_1138, _1150, -0.212114393711090087890625);
    float _1160 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1152);
    float _1162 = fma(_1138, _1158, 1.570728778839111328125);
    float _1164 = sqrt(_1136);
    float _1166 = -_1094;
    float _1168 = fma(_1140, _1146, _1166);
    float _1170 = _1124 * 0.693147182464599609375;
    float _1172 = fma(_1168, 0.5, 0.5);
    float _1174 = _1170 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1176 = _1156 * _1154;
    float _1178 = _1160 * _1154;
    float _1180 = fma(_1176, 0.5, 0.5);
    float _1182 = fma(_1178, -0.5, 0.5);
    float _1184 = _1164 * 0.636619746685028076171875;
    float3 _3321 = float3(_1180, _1182, _1174);
    float _1186 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3321, float3(0.0), isnan(_3321)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3321, float3(0.0), isnan(_3321)), level(0.0)).x;
    float3 _3332 = float3(_1180, _1182, _1174);
    float4 _1189 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3332, float3(0.0), isnan(_3332)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3332, float3(0.0), isnan(_3332)), level(0.0)).xyzw;
    float _1191 = _1189.x;
    float _1193 = _1189.y;
    float _1195 = _1189.z;
    float _1197 = _1189.w;
    float _1199 = -_1162;
    float _1201 = fma(_1184, _1199, 1.0);
    float2 _3354 = float2(_1201, _1172);
    float3 _1205 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3354, float2(0.0), isnan(_3354)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3354, float2(0.0), isnan(_3354)), level(0.0)).xyz;
    float _1207 = _1205.x;
    float _1209 = _1205.y;
    float _1211 = _1205.z;
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1215 = _646 + _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1219 = _646 + _1217;
    float _1221 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1231 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1233 = _722 != 0.0;
    bool _1235 = isnan(_722);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan(0.0);
    bool _1241 = _1237 || _1239;
    float _1243 = 1.0 / _1229;
    bool _1245 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1247 = isnan(_646);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    out.m_59.x = _868;
    out.m_59.y = _864;
    out.m_59.z = _872;
    float _1257 = 1.0 / _1225;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1259;
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1263;
    bool _1267 = _720 == 0.0;
    bool _1269 = !_1241;
    bool _1271 = _1267 && _1269;
    float _1273 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1231);
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1275;
    float _1279 = _1219 * _1243;
    bool _1281 = _724 == 0.0;
    bool _1283 = _1281 && _1271;
    float _1285 = exp2(_1221);
    float _1287 = _1215 * _1257;
    bool _1289 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1291 = isnan(_646);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = in.m_61.x;
    float _1303 = in.m_61.y;
    float _1305 = in.m_61.z;
    float _1307 = fma(_1277, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1309 = fma(_1261, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1311 = fma(_1265, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1313 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1315 = isnan(_646);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    float _1325 = -_1299;
    float _1327 = _1325 + 1.0;
    float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1331 = _1329 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1341 = _1255 * _1327;
    float _1343 = -_1255;
    float _1345 = _1343 + 1.0;
    float _1347 = fma(_1335, _1279, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1349 = fma(_1331, _1279, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1351 = fma(_1339, _1279, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1353 = _1323 * _1345;
    float _1355 = -_1323;
    float _1357 = _1355 + 1.0;
    float _1359 = -_1285;
    float _1361 = _1359 + 1.0;
    float _1363 = _1307 * _1353;
    float _1365 = _1311 * _1353;
    float _1367 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1363);
    float _1369 = _1303;
    float _1371 = _1301;
    float _1373 = _1305;
    if (!_1283)
    {
        float _1375 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1303);
        _1369 = _1375;
    }
    float _1377 = _1369;
    float _1379 = _1309 * _1353;
    if (!_1283)
    {
        float _1381 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1301);
        _1371 = _1381;
    }
    float _1383 = _1371;
    if (!_1283)
    {
        float _1385 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1305);
        _1373 = _1385;
    }
    float _1387 = _1373;
    float _1389 = -_694;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[18].w, _668);
    float _1393 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1379);
    float _1395 = -_696;
    float _1397 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[18].w, _670);
    float _1399 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1365);
    float _1401 = fma(_1349, _1341, _1367);
    float _1403 = fma(_1347, _1341, _1393);
    float _1405 = -_692;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _666);
    float _1409 = fma(_1351, _1341, _1399);
    float _1411 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1273);
    float _1413 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1401);
    float _1415 = _1156 + _1130;
    out.m_63.x = _1391;
    out.m_63.y = _1407;
    out.m_63.z = _1397;
    float _1417 = _1377 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1419 = _1377 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1421 = _1377 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1423 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1403);
    float _1425 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1409);
    float _1427 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1411);
    float _1429 = _1413 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1431 = _1415 * 0.5;
    float _1433 = fma(_1383, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1417);
    float _1435 = fma(_1383, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1419);
    float _1437 = _1130 * 0.5;
    float _1439 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1441 = fma(_1383, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1421);
    float _1443 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1445 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1447 = _1427 + _1130;
    float _1449 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1433);
    float _1451 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1435);
    float _1453 = fma(_1160, -0.5, _1437);
    float _1455 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1441);
    float _1457 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1459 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1461 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1463 = _1447 * 0.5;
    float _1465 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1449;
    out.m_65.y = _1451;
    out.m_65.z = _1455;
    out.m_67.x = _1457;
    out.m_67.y = _1459;
    out.m_67.z = _1461;
    out.gl_Position.x = _1156;
    out.gl_Position.y = _1160;
    out.gl_Position.z = _1427;
    out.gl_Position.w = _1130;
    out.m_69.x = _1431;
    out.m_69.y = _1453;
    out.m_69.z = _1463;
    out.m_69.w = _1130;
    out.m_45.x = _1465;
    float _1467 = _1439 * _1186;
    float _1469 = -_1439;
    float _1471 = _1469 + 1.0;
    float _1473 = _1197 * _1467;
    float _1475 = _1197 * _1471;
    float _1477 = _1211 * _1467;
    float _1479 = fma(_1207, _1473, _1191);
    float _1481 = fma(_1209, _1473, _1193);
    float _1483 = fma(_1197, _1477, _1195);
    out.m_71.x = _1479;
    out.m_71.y = _1481;
    out.m_71.z = _1483;
    out.m_71.w = _1475;
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
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _638 = false;
    bool _458 = false;
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1540 = as_type<float>(_106);
        out.gl_Position.z = _1540;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    float _112 = in.m_49.z;
    float _114 = in.m_49.w;
    bool _116 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_110);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_110;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.z = _112;
    out.m_51.w = _114;
    if (_124)
    {
        float _130 = float(_90);
        _100 = _130;
    }
    float _132 = _100;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _108 = as_type<int>(_144);
    }
    int _146 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1617 = as_type<float>(_146);
        out.gl_Position.z = _1617;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_53.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
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
        float _272 = in.m_49.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_90);
        float _294 = 1.0 / _292;
        float _296 = _128 * _294;
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
    float _352 = -_314;
    float _354 = _352 + 1.0;
    float _356 = 1.0 / _334;
    float _358 = _350 * _354;
    float _360 = -_350;
    float _362 = _360 + 1.0;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _364;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _370 = 1.0 / _338;
    float _372 = _330 * _362;
    float _374 = -_330;
    float _376 = _374 + 1.0;
    float _378 = _302 * _356;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _384;
    float _388 = fma(_366, _378, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _390 = fma(_382, _378, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _392 = fma(_386, _378, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _394 = _318 * _370;
    float _396 = _388 * _372;
    float _398 = _390 * _372;
    float _400 = _392 * _372;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _414 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[107].x, _396);
    float _416 = fma(_404, _394, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _418 = fma(_408, _394, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _420 = fma(_412, _394, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _422 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[107].y, _398);
    float _424 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[107].z, _400);
    float _426 = fma(_416, _358, _414);
    float _428 = fma(_418, _358, _422);
    float _430 = fma(_420, _358, _424);
    float _432 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].x, _426);
    float _434 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].y, _428);
    float _436 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].z, _430);
    bool _438 = !_368;
    float _456;
    if (!_438)
    {
        float _440 = in.m_49.x;
        float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _444 = _440 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _446 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _448 = _446 * _442;
        float _450 = floor(_448);
        float _452 = -_450;
        float _454 = _448 + _452;
        _456 = _454;
        _458 = true;
    }
    else
    {
        float _460 = float(_90);
        float _462 = 1.0 / _460;
        float _464 = _128 * _462;
        _456 = _464;
    }
    _458 = false;
    float _466 = _456;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _470 = _466 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _478 = isnan(_466);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _496 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _498 = isnan(_466);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = 1.0 / _474;
    float _510 = -_486;
    float _512 = _510 + 1.0;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _514;
    bool _518 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _520 = isnan(_466);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = _506 * _512;
    float _532 = -_506;
    float _534 = _532 + 1.0;
    bool _536 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _538 = 1.0 / _490;
    float _540 = _528 * _534;
    float _542 = -_528;
    float _544 = _542 + 1.0;
    float _546 = 1.0 / _494;
    float _548 = _516 * _508;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _554 = fma(_548, _470, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _556 = _552 * _538;
    bool _558 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _560 = isnan(_466);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _576 = _466 + _574;
    float _578 = _554 * _540;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _582 = _466 + _580;
    float _584 = -_568;
    float _586 = _584 + 1.0;
    float _588 = fma(_556, _576, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _590 = _572 * _546;
    float _592 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[115].x, _578);
    float _594 = _486 * _586;
    float _596 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _598 = fma(_590, _582, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _600 = fma(_588, _530, _592);
    float _602 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = fma(_598, _594, _600);
    float _608 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[118].x, _606);
    float _614 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _604;
    out.m_55.y = _614;
    out.m_55.z = _610;
    out.m_55.w = _616;
    bool _618 = !_536;
    float _636;
    if (!_618)
    {
        float _620 = in.m_49.x;
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _624 = _620 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_90);
        float _642 = 1.0 / _640;
        float _644 = _128 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    float _648 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _650 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _652 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _654 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _648);
    float _656 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _650);
    float _658 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _652);
    float _660 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _654);
    float _662 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _656);
    float _664 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _658);
    float _666 = _660 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _668 = _662 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _670 = _664 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _674 = _666 + _672;
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _678 = _668 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _682 = _670 + _680;
    float _684 = _674 * _674;
    float _686 = fma(_678, _678, _684);
    float _688 = fma(_682, _682, _686);
    float _690 = rsqrt(_688);
    float _692 = _674 * _690;
    float _694 = _678 * _690;
    float _696 = _682 * _690;
    float _698 = -_692;
    float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[18].w, _674);
    float _702 = -_694;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _706 = -_696;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _682);
    float _710 = _700 * _700;
    float _712 = in.m_53.x;
    float _714 = in.m_53.y;
    float _716 = in.m_53.z;
    float _718 = fma(_704, _704, _710);
    float _720 = in.m_57.x;
    float _722 = in.m_57.y;
    float _724 = in.m_57.z;
    float _726 = fma(_708, _708, _718);
    float _728 = sqrt(_726);
    float _730 = _714 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _732 = _712 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _734 = _690 * _728;
    float _736 = _716 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _738 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _722);
    float _742 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _746 = _738 * _734;
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _720);
    float _750 = _742 * _734;
    float _752 = _744 * _734;
    float _754 = _746 * _740;
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _724);
    float _758 = _750 * _748;
    float _760 = _754 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _762 = _752 * _756;
    float _764 = _754 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[10].x, _760);
    float _768 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[8].x, _764);
    float _770 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[10].z, _766);
    float _772 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[8].z, _768);
    float _774 = _670 + _770;
    float _776 = _668 + _772;
    float _778 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _780 = _774 + _778;
    float _782 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _784 = _776 + _782;
    float _786 = _780 * _780;
    float _788 = fma(_784, _784, _786);
    float _790 = _754 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _792 = sqrt(_788);
    float _794 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[9].x, _790);
    float _796 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[9].z, _794);
    float _798 = _666 + _796;
    bool _800 = _792 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _802 = _758;
    float _804 = _762;
    float _806 = _774;
    float _808 = _788;
    if (!_800)
    {
        _802 = _776;
    }
    float _810 = _802;
    float _812 = _810;
    if (!_800)
    {
        _804 = _798;
    }
    float _814 = _804;
    bool _816 = !_800;
    float _818 = _814;
    if (!_816)
    {
        float _820 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _822 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _824 = _792 + _822;
        float _826 = _798 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = rsqrt(_788);
        float _830 = _824 * _820;
        float _832 = _830 * 0.15915493667125701904296875;
        float _834 = _832 * 6.283185482025146484375;
        float _836 = sin(_834);
        float _838 = _832 * 6.283185482025146484375;
        float _840 = cos(_838);
        float _842 = fma(_836, _826, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _844 = _828 * _842;
        float _846 = _840 + (-1.0);
        float _848 = fma(_784, _844, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _850 = fma(_780, _844, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _852 = _846 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = fma(_798, _840, _852);
        _818 = _854;
        _812 = _848;
        _806 = _850;
    }
    float _856 = _818;
    float _858 = _812;
    float _860 = _806;
    float _862 = -_692;
    float _864 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[18].w, _856);
    float _866 = -_694;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _858);
    float _870 = -_696;
    float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[18].w, _860);
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _876 = _864 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _880 = _868 + _878;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _884 = _872 + _882;
    float _886 = _876 * _876;
    float _888 = fma(_880, _880, _886);
    float _890 = fma(_884, _884, _888);
    float _892 = rsqrt(_890);
    float _894 = _892 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _896 = _880 * _894;
    float _898 = _884 * _894;
    float _900 = _896 * _896;
    float _902 = _898 * _898;
    float _904 = _900 + _902;
    float _906 = sqrt(_904);
    bool _908 = _906 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _912 = _906 + _910;
    float _914 = _884;
    float _916 = _904;
    float _918 = _912;
    float _920 = _876;
    float _922 = _886;
    if (_908)
    {
        float _924 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _914 = _924;
    }
    float _926 = _914;
    if (_908)
    {
        float _928 = rsqrt(_904);
        _916 = _928;
    }
    float _930 = _916;
    float _932 = _930;
    if (_908)
    {
        float _934 = _912 * _926;
        _918 = _934;
    }
    float _936 = _918;
    if (_908)
    {
        float _938 = _936 * 0.15915493667125701904296875;
        _808 = _938;
    }
    float _940 = _808;
    float _942 = _926;
    if (_908)
    {
        float _944 = _940 * 6.283185482025146484375;
        float _946 = sin(_944);
        _942 = _946;
    }
    float _948 = _942;
    float _950 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _952 = precise::max(0.0, _950);
    float _954 = _780;
    float _956 = _952;
    if (_908)
    {
        float _958 = _940 * 6.283185482025146484375;
        float _960 = cos(_958);
        _954 = _960;
    }
    float _962 = _954;
    float _964 = -_894;
    float _966 = -_952;
    float _968 = fma(_876, _964, _966);
    if (!_908)
    {
        _920 = _896;
    }
    float _970 = _920;
    float _972 = _970;
    if (_908)
    {
        float _974 = _968 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _956 = _974;
    }
    float _976 = _956;
    float _978 = sqrt(_890);
    float _980 = _948;
    float _982 = _976;
    if (_908)
    {
        float _984 = fma(_948, _976, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _980 = _984;
    }
    float _986 = _980;
    float _988 = _986;
    float _990 = _962;
    if (_908)
    {
        float _992 = _962 + (-1.0);
        _982 = _992;
    }
    float _994 = _982;
    float _996 = 0.0;
    float _998 = _994;
    if (_908)
    {
        float _1000 = _930 * _986;
        _996 = _1000;
    }
    float _1002 = _996;
    if (!_908)
    {
        _988 = _968;
    }
    float _1004 = _988;
    float _1006 = _1004;
    if (_908)
    {
        float _1008 = _994 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _922 = _1008;
    }
    float _1010 = _922;
    if (_908)
    {
        float _1012 = _896 * _1002;
        _972 = _1012;
    }
    float _1014 = _972;
    if (!_908)
    {
        _998 = _898;
    }
    float _1016 = _998;
    float _1018 = _1016;
    if (_908)
    {
        float _1020 = _898 * _1002;
        _1018 = _1020;
    }
    float _1022 = _1018;
    if (!_908)
    {
        _932 = _900;
    }
    float _1024 = _932;
    float _1026 = _1024;
    if (_908)
    {
        float _1028 = fma(_968, _962, _1010);
        _1006 = _1028;
    }
    float _1030 = _1006;
    if (_908)
    {
        float _1032 = _1014 * _1014;
        _1026 = _1032;
    }
    float _1034 = _1026;
    if (!_908)
    {
        _990 = _902;
    }
    float _1036 = _990;
    float _1038 = _1036;
    if (_908)
    {
        float _1040 = _1022 * _1022;
        _1038 = _1040;
    }
    float _1042 = _1038;
    float _1044 = fma(_1030, _1030, _1034);
    float _1046 = _864 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1048 = _1044 + _1042;
    float _1050 = _864 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1054 = fma(_978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1052);
    float _1056 = precise::clamp(_1054, 0.0, 1.0);
    float _1058 = _864 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1060 = rsqrt(_1048);
    float _1062 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1050);
    float _1064 = -_1056;
    float _1066 = _1064 + 1.0;
    float _1068 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1058);
    float _1070 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1072 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1062);
    float _1074 = _864 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1076 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1068);
    float _1078 = abs(_1066);
    float _1080 = log2(_1078);
    float _1082 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1084 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1074);
    float _1086 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1088 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1046);
    float _1090 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1092 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1084);
    float _1094 = _1060 * _1030;
    float _1096 = -_1090;
    float _1098 = fma(_1096, _1070, 1.0);
    float _1100 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1102 = _1060 * _1014;
    float _1104 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1106 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1088);
    float _1108 = _1060 * _1022;
    float _1110 = _1102 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1112 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1104);
    float _1114 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1116 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1118 = -_1110;
    float _1120 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1118);
    float _1122 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1112);
    float _1124 = log2(_1098);
    float _1126 = -_1108;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1120);
    float _1130 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1122);
    float _1132 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1134 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1136 = fma(_1128, -0.5, 0.5);
    float _1138 = fma(_1128, 0.5, 0.5);
    float _1140 = exp2(_1116);
    float _1142 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1132);
    float _1144 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1134);
    float _1146 = _1094 + 1.0;
    float _1148 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1142);
    float _1150 = fma(_1138, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1152 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1144);
    float _1154 = 1.0 / _1130;
    float _1156 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1148);
    float _1158 = fma(_1138, _1150, -0.212114393711090087890625);
    float _1160 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1152);
    float _1162 = fma(_1138, _1158, 1.570728778839111328125);
    float _1164 = sqrt(_1136);
    float _1166 = -_1094;
    float _1168 = fma(_1140, _1146, _1166);
    float _1170 = _1124 * 0.693147182464599609375;
    float _1172 = fma(_1168, 0.5, 0.5);
    float _1174 = _1170 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1176 = _1156 * _1154;
    float _1178 = _1160 * _1154;
    float _1180 = fma(_1176, 0.5, 0.5);
    float _1182 = fma(_1178, -0.5, 0.5);
    float _1184 = _1164 * 0.636619746685028076171875;
    float3 _3321 = float3(_1180, _1182, _1174);
    float _1186 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3321, float3(0.0), isnan(_3321)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3321, float3(0.0), isnan(_3321)), level(0.0)).x;
    float3 _3332 = float3(_1180, _1182, _1174);
    float4 _1189 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3332, float3(0.0), isnan(_3332)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3332, float3(0.0), isnan(_3332)), level(0.0)).xyzw;
    float _1191 = _1189.x;
    float _1193 = _1189.y;
    float _1195 = _1189.z;
    float _1197 = _1189.w;
    float _1199 = -_1162;
    float _1201 = fma(_1184, _1199, 1.0);
    float2 _3354 = float2(_1201, _1172);
    float3 _1205 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3354, float2(0.0), isnan(_3354)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3354, float2(0.0), isnan(_3354)), level(0.0)).xyz;
    float _1207 = _1205.x;
    float _1209 = _1205.y;
    float _1211 = _1205.z;
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1215 = _646 + _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1219 = _646 + _1217;
    float _1221 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1223;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1229 = _1227 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1231 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1233 = _722 != 0.0;
    bool _1235 = isnan(_722);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan(0.0);
    bool _1241 = _1237 || _1239;
    float _1243 = 1.0 / _1229;
    bool _1245 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1247 = isnan(_646);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    out.m_59.x = _868;
    out.m_59.y = _864;
    out.m_59.z = _872;
    float _1257 = 1.0 / _1225;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1259;
    float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1263;
    bool _1267 = _720 == 0.0;
    bool _1269 = !_1241;
    bool _1271 = _1267 && _1269;
    float _1273 = fma(_1100, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1231);
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1275;
    float _1279 = _1219 * _1243;
    bool _1281 = _724 == 0.0;
    bool _1283 = _1281 && _1271;
    float _1285 = exp2(_1221);
    float _1287 = _1215 * _1257;
    bool _1289 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1291 = isnan(_646);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = in.m_61.x;
    float _1303 = in.m_61.y;
    float _1305 = in.m_61.z;
    float _1307 = fma(_1277, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1309 = fma(_1261, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1311 = fma(_1265, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1313 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1315 = isnan(_646);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    float _1325 = -_1299;
    float _1327 = _1325 + 1.0;
    float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1331 = _1329 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1341 = _1255 * _1327;
    float _1343 = -_1255;
    float _1345 = _1343 + 1.0;
    float _1347 = fma(_1335, _1279, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1349 = fma(_1331, _1279, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1351 = fma(_1339, _1279, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1353 = _1323 * _1345;
    float _1355 = -_1323;
    float _1357 = _1355 + 1.0;
    float _1359 = -_1285;
    float _1361 = _1359 + 1.0;
    float _1363 = _1307 * _1353;
    float _1365 = _1311 * _1353;
    float _1367 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1363);
    float _1369 = _1303;
    float _1371 = _1301;
    float _1373 = _1305;
    if (!_1283)
    {
        float _1375 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1303);
        _1369 = _1375;
    }
    float _1377 = _1369;
    float _1379 = _1309 * _1353;
    if (!_1283)
    {
        float _1381 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1301);
        _1371 = _1381;
    }
    float _1383 = _1371;
    if (!_1283)
    {
        float _1385 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1305);
        _1373 = _1385;
    }
    float _1387 = _1373;
    float _1389 = -_694;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[18].w, _668);
    float _1393 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1379);
    float _1395 = -_696;
    float _1397 = fma(_1395, (*spvDescriptorSet0.vp_c9)._m0[18].w, _670);
    float _1399 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1365);
    float _1401 = fma(_1349, _1341, _1367);
    float _1403 = fma(_1347, _1341, _1393);
    float _1405 = -_692;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _666);
    float _1409 = fma(_1351, _1341, _1399);
    float _1411 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1273);
    float _1413 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1401);
    float _1415 = _1156 + _1130;
    out.m_63.x = _1391;
    out.m_63.y = _1407;
    out.m_63.z = _1397;
    float _1417 = _1377 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1419 = _1377 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1421 = _1377 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1423 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1403);
    float _1425 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1409);
    float _1427 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1411);
    float _1429 = _1413 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1431 = _1415 * 0.5;
    float _1433 = fma(_1383, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1417);
    float _1435 = fma(_1383, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1419);
    float _1437 = _1130 * 0.5;
    float _1439 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1441 = fma(_1383, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1421);
    float _1443 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1445 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1447 = _1427 + _1130;
    float _1449 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1433);
    float _1451 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1435);
    float _1453 = fma(_1160, -0.5, _1437);
    float _1455 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1441);
    float _1457 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1459 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1461 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1463 = _1447 * 0.5;
    float _1465 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1449;
    out.m_65.y = _1451;
    out.m_65.z = _1455;
    out.m_67.x = _1457;
    out.m_67.y = _1459;
    out.m_67.z = _1461;
    out.gl_Position.x = _1156;
    out.gl_Position.y = _1160;
    out.gl_Position.z = _1427;
    out.gl_Position.w = _1130;
    out.m_69.x = _1431;
    out.m_69.y = _1453;
    out.m_69.z = _1463;
    out.m_69.w = _1130;
    out.m_45.x = _1465;
    float _1467 = _1439 * _1186;
    float _1469 = -_1439;
    float _1471 = _1469 + 1.0;
    float _1473 = _1197 * _1467;
    float _1475 = _1197 * _1471;
    float _1477 = _1211 * _1467;
    float _1479 = fma(_1207, _1473, _1191);
    float _1481 = fma(_1209, _1473, _1193);
    float _1483 = fma(_1197, _1477, _1195);
    out.m_71.x = _1479;
    out.m_71.y = _1481;
    out.m_71.z = _1483;
    out.m_71.w = _1475;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

