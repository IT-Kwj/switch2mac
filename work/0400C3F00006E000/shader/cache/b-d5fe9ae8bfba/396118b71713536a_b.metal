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
    float4 m_55 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1178 = false;
    bool _628 = false;
    bool _508 = false;
    bool _286 = false;
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
    float _108 = as_type<float>(_106);
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2007 = as_type<float>(_106);
        out.gl_Position.z = _2007;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    if (_120)
    {
        float _128 = float(_90);
        _126 = _128;
    }
    float _130 = _126;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _100;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    int _140 = 0;
    if (_136)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2075 = as_type<float>(_144);
        out.gl_Position.z = _2075;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = _148;
    if (!_158)
    {
        float _174 = _148 * _148;
        float _176 = _174 * 0.5;
        _108 = _176;
    }
    float _178 = _108;
    float _180 = _178;
    if (!_158)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_158;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _148 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _148);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_158;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _148 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _160, _248);
    float _256 = fma(_244, _162, _250);
    float _258 = fma(_244, _164, _252);
    float _260 = fma(_254, _146, _166);
    float _262 = fma(_256, _146, _168);
    float _264 = fma(_258, _146, _170);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_53.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_90);
        float _290 = 1.0 / _288;
        float _292 = _124 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _302 = _294 + _300;
    bool _304 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _306 = isnan(_294);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = _294 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = 1.0 / _318;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = 1.0 / _330;
    float _338 = 1.0 / _326;
    float _340 = _298 * _332;
    bool _342 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = isnan(_294);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_314;
    float _356 = _354 + 1.0;
    float _358 = _352 * _356;
    float _360 = _302 * _336;
    bool _362 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _364 = isnan(_294);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _374;
    bool _378 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _380 = isnan(_294);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = -_352;
    float _396 = _394 + 1.0;
    float _398 = -_372;
    float _400 = _398 + 1.0;
    float _402 = _322 * _338;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _408;
    float _412 = _388 * _400;
    float _414 = fma(_376, _402, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _416 = fma(_406, _402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _418 = fma(_410, _402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _420 = _372 * _396;
    float _422 = -_388;
    float _424 = _422 + 1.0;
    float _426 = _416 * _412;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = _418 * _412;
    float _438 = _414 * _412;
    float _440 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[143].x, _426);
    float _442 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[143].y, _436);
    float _444 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[143].z, _438);
    float _446 = fma(_392, _360, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _448 = fma(_430, _360, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _450 = fma(_434, _360, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _460;
    float _464 = fma(_446, _420, _440);
    float _466 = fma(_454, _340, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _468 = fma(_458, _340, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _470 = fma(_462, _340, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _472 = fma(_448, _420, _442);
    float _474 = fma(_450, _420, _444);
    float _476 = fma(_466, _358, _464);
    float _478 = fma(_468, _358, _472);
    float _480 = fma(_470, _358, _474);
    float _482 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    bool _488 = !_334;
    float _506;
    if (!_488)
    {
        float _490 = in.m_53.x;
        float _492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _494 = _490 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _498 = _496 * _492;
        float _500 = floor(_498);
        float _502 = -_500;
        float _504 = _498 + _502;
        _506 = _504;
        _508 = true;
    }
    else
    {
        float _510 = float(_90);
        float _512 = 1.0 / _510;
        float _514 = _124 * _512;
        _506 = _514;
    }
    _508 = false;
    float _516 = _506;
    bool _518 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _520 = isnan(_516);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _534 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _536 = isnan(_516);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _516 + _550;
    float _554 = -_528;
    float _556 = _554 + 1.0;
    float _558 = 1.0 / _532;
    bool _560 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _562 = _544 * _556;
    float _564 = -_544;
    float _566 = _564 + 1.0;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _570 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = _548 * _558;
    float _574 = fma(_572, _552, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _576 = _574 * _562;
    float _578 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[115].x, _576);
    float _580 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[116].x, _578);
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _586 = in.m_51.x;
    float _588 = in.m_51.y;
    float _590 = in.m_51.z;
    float _592 = _580 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _594 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _596 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _594;
    out.m_55.y = _570;
    out.m_55.z = _596;
    out.m_55.w = _592;
    float _598 = _486 * _590;
    float _600 = _484 * _588;
    float _602 = _482 * _586;
    bool _604 = !_560;
    float _606 = _582;
    bool _608 = _560;
    float _626;
    if (!_604)
    {
        float _610 = in.m_53.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_90);
        float _632 = 1.0 / _630;
        float _634 = _124 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    float _638 = in.m_57.x;
    float _640 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _642 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _646 = _644 != 0;
    float _648 = in.m_53.x;
    float _650 = in.m_53.y;
    float _652 = in.m_53.z;
    float _654 = in.m_53.w;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _658 = _656 != 0;
    float _660 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _640);
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _664 = _662 != 0;
    float _666 = in.m_59.x;
    float _668 = in.m_59.y;
    float _670 = in.m_59.z;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _674 = _672 != 0;
    float _676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _678 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _680 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _682 = _580;
    float _684 = _678;
    if (_646)
    {
        float _686 = in.m_53.z;
        _682 = _686;
    }
    float _688 = _682;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _698 = 1.0 / _692;
    float _700 = -_638;
    float _702 = _700 + 1.0;
    float _704 = _638;
    if (!_646)
    {
        _606 = _638;
    }
    float _706 = _606;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _710 = _654 > 0.5;
    float _712 = _648 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _716 = _706;
    if (_646)
    {
        bool _718 = _688 > 0.5;
        _608 = _718;
    }
    bool _720 = _608;
    float _722 = in.m_57.y;
    if (_646)
    {
        float _724 = _720 ? _702 : _638;
        _716 = _724;
    }
    float _726 = _716;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _734 = _732 != 0;
    float _736 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _738 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _742 = _740 != 0;
    float _744 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _736);
    float _746 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _738);
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _670);
    float _752 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _744);
    float _754 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _746);
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _666);
    float _758 = _678 * _638;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _668);
    float _762 = -_722;
    float _764 = _762 + 1.0;
    float _766 = _642 * _722;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _770 = _650 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _772 = -_758;
    float _774 = _772 + 1.0;
    float _776 = _722;
    float _778 = _758;
    float _780 = _766;
    if (_664)
    {
        float _782 = _710 ? _764 : _722;
        _776 = _782;
    }
    float _784 = _776;
    float _786 = -_748;
    float _788 = fma(_712, 2.0, _786);
    float _790 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _660);
    float _792 = fma(_770, -2.0, _768);
    bool _794 = _650 > 0.5;
    float _796 = _678 * _756;
    float _798 = _792;
    if (_742)
    {
        _684 = _648;
    }
    float _800 = _684;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _802;
    float _806 = _800;
    if (_658)
    {
        float _808 = _794 ? _774 : _758;
        _778 = _808;
    }
    float _810 = _778;
    float _812 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[88].w, _694);
    bool _814 = _652 > 0.5;
    float _816 = _804 * _698;
    float _818 = _642 * _760;
    if (!_742)
    {
        _806 = _652;
    }
    float _820 = _806;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _824 = _636 + _822;
    float _826 = 0.0;
    if (_742)
    {
        _826 = _650;
    }
    float _828 = _826;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _832 = _680 * _750;
    float _834 = fma(_816, _824, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _836 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[78].w, _830);
    float _838 = _676 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _840 = _818 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _844 = fma(_810, _838, -0.5);
    float _846 = _818 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _850 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[26].x, _840);
    bool _852 = _648 > 0.5;
    float _854 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[24].x, _846);
    float _856 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[78].z, _842);
    float _858 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[88].z, _848);
    float _860 = _828;
    if (!_742)
    {
        _860 = _648;
    }
    float _862 = _860;
    float _864 = _752 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _866 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _868 = isnan(_636);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    float _878 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[24].z, _854);
    bool _880 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _882 = isnan(_636);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[26].z, _850);
    float _894 = _818 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _896 = -_876;
    float _898 = _896 + 1.0;
    float _900 = _754 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _902 = _878 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _904 = _892 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _906 = _890 * _898;
    float _908 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[25].x, _894);
    float _910 = _864 + _902;
    float _912 = _900 + _904;
    float _914 = _834 * _906;
    float _916 = -_766;
    float _918 = _916 + 1.0;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _922 = _910 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _926 = _912 + _924;
    float _928 = _912;
    float _930 = _910;
    float _932 = _900;
    if (_730)
    {
        float _934 = _852 ? _702 : _638;
        _704 = _934;
    }
    float _936 = _704;
    float _938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _940 = _922 * _922;
    float _942 = _926 * _926;
    int _944 = _814 ? as_type<int>(_918) : as_type<int>(_766);
    float _946 = _862 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _948 = _820 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _950 = _940 + _942;
    bool _952 = !_674;
    float _954 = _952 ? _766 : as_type<float>(_944);
    float _956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _958 = _940;
    float _960 = _942;
    if (_734)
    {
        float _962 = _794 ? _918 : _766;
        _780 = _962;
    }
    float _964 = _780;
    float _966 = fma(_946, -2.0, _696);
    float _968 = -_708;
    float _970 = fma(_948, 2.0, _968);
    float _972 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[25].z, _908);
    float _974 = _790 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _976 = -_890;
    float _978 = _976 + 1.0;
    float _980 = _714 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _982 = sqrt(_950);
    float _984 = _938 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _986 = _972 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _988 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _856);
    float _990 = -_124;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[76].x, _788);
    float _994 = fma(_984, _936, -0.5);
    float _996 = _974 + _986;
    float _998 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[131].x, _914);
    float _1000 = _956 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1004 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _836);
    float _1006 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _792);
    float _1008 = fma(_1000, _964, -0.5);
    float _1010 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _858);
    float _1012 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _812);
    float _1014 = -_124;
    float _1016 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[86].x, _970);
    bool _1018 = _982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1022 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _966);
    float _1024 = fma(_954, _980, -0.5);
    float _1026 = fma(_988, _994, _992);
    if (!_1018)
    {
        _798 = _996;
    }
    float _1028 = _798;
    bool _1030 = !_1018;
    float _1032 = _1028;
    if (!_1030)
    {
        float _1034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1038 = _982 + _1036;
        float _1040 = rsqrt(_950);
        float _1042 = _1038 * _1034;
        float _1044 = _996 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = _1042 * 0.15915493667125701904296875;
        float _1048 = _1046 * 6.283185482025146484375;
        float _1050 = sin(_1048);
        float _1052 = _1046 * 6.283185482025146484375;
        float _1054 = cos(_1052);
        float _1056 = fma(_1050, _1044, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1058 = _1040 * _1056;
        float _1060 = _1054 + (-1.0);
        float _1062 = fma(_922, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1064 = fma(_926, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1066 = _1060 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1070 = _1062 + _1068;
        float _1072 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1074 = _1064 + _1072;
        float _1076 = fma(_996, _1054, _1066);
        float _1078 = _1070 * _1070;
        float _1080 = _1074 * _1074;
        _1032 = _1076;
        _958 = _1078;
        _960 = _1080;
        _928 = _1064;
        _930 = _1062;
    }
    float _1082 = _1032;
    float _1084 = _958;
    float _1086 = _960;
    float _1088 = _928;
    float _1090 = _930;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1094 = _1082 + _1092;
    float _1096 = -_1006;
    float _1098 = fma(_1004, _1008, _1096);
    float _1100 = fma(_1010, _844, _1016);
    float _1102 = -_1022;
    float _1104 = fma(_1012, _1024, _1102);
    float _1106 = fma(_1094, _1094, _1084);
    float _1108 = _784 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1110 = _726 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1112 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[132].x, _998);
    float _1114 = _1106 + _1086;
    float _1116 = _1108 * _1020;
    float _1118 = _1110 * _1002;
    float _1120 = _1100 + 0.5;
    float _1122 = sqrt(_1114);
    float _1124 = _1026 + 0.5;
    float _1126 = _1098 + 0.5;
    float _1128 = _1104 + 0.5;
    float _1130 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    out.m_63.x = _1124;
    out.m_63.y = _1126;
    out.m_63.z = _1118;
    out.m_63.w = _1116;
    out.m_65.x = _1120;
    out.m_65.y = _1128;
    bool _1132 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1134 = isnan(_1122);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1140 = _1136 || _1138;
    out.m_67.w = _1130;
    float _1142 = _1100;
    if (!_1140)
    {
        _1142 = 1.0;
    }
    float _1144 = _1142;
    bool _1146 = !_1140;
    float _1148 = _1144;
    if (!_1146)
    {
        bool _1150 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1152 = isnan(_1122);
        bool _1154 = _1150 || _1152;
        bool _1156 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1158 = _1154 || _1156;
        if (!_1158)
        {
            float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1162 = _1122 + _1160;
            float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1166 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1164;
            float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1170 = _1168 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1172 = 1.0 / _1166;
            float _1174 = _1162 * _1172;
            float _1176 = fma(_1174, _1170, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1148 = _1176;
            _1178 = true;
        }
        else
        {
            bool _1180 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1182 = isnan(_1122);
            bool _1184 = _1180 || _1182;
            bool _1186 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1188 = _1184 || _1186;
            if (!_1188)
            {
                float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1192 = _1122 + _1190;
                float _1194 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1196 = _1194 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1198 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1200 = _1198 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1202 = 1.0 / _1196;
                float _1204 = _1192 * _1202;
                float _1206 = fma(_1204, _1200, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1148 = _1206;
                _1178 = true;
            }
            else
            {
                _1148 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1178 = false;
    float _1208 = _1148;
    float _1210 = _974 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1214 = _1082 + _1212;
    float _1216 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1210);
    float _1218 = _974 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1220 = fma(_1214, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1222 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1216);
    bool _1224 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan(0.5);
    bool _1232 = _1228 || _1230;
    bool _1234 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan(0.5);
    bool _1242 = _1238 || _1240;
    float _1244 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1246 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1218);
    float _1248 = 1.0 / _1244;
    float _1250 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1246);
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1254 = _1252 + _1244;
    float _1256 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1258 = _1088 + _1256;
    float _1260 = fma(_1258, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1262 = _1258;
    float _1264 = _1208;
    float _1266 = _1260;
    float _1268 = _1220;
    if (_1232)
    {
        _1262 = _1220;
    }
    float _1270 = _1262;
    float _1272 = _1254 * _1248;
    float _1274 = _1272 * 0.5;
    float _1276 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1278 = _1090 + _1276;
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1282 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1280);
    float _1284 = fma(_1278, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1286 = _1274;
    float _1288 = _1278;
    float _1290 = _1270;
    if (_1242)
    {
        _1264 = 1.0;
    }
    float _1292 = _1264;
    float _1294 = 1.0 / _1282;
    float _1296 = _1292;
    if (_1232)
    {
        _1286 = _1260;
    }
    float _1298 = _1286;
    float _1300 = _1298;
    if (_1232)
    {
        _1288 = _1284;
    }
    float _1302 = _1288;
    float _1304 = _1302;
    if (!_1232)
    {
        float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1308 = _974 + _1306;
        float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1312 = _864 + _1310;
        float _1314 = -_864;
        float _1316 = _1314 + _1284;
        float _1318 = -_900;
        float _1320 = _1318 + _1260;
        float _1322 = _1308 * _1308;
        float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1326 = _900 + _1324;
        float _1328 = -_974;
        float _1330 = _1328 + _1220;
        float _1332 = fma(_1312, _1312, _1322);
        float _1334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1336 = fma(_1326, _1326, _1332);
        float _1338 = sqrt(_1336);
        float _1340 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1342 = _1338 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1344 = isnan(_1338);
        bool _1346 = _1342 || _1344;
        bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1350 = _1346 || _1348;
        float _1352 = precise::min(_1338, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1354 = _1352 * _1334;
        float _1356 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1358 = _1356 * _1354;
        float _1360 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
        float _1362 = _1334;
        float _1364 = _1338;
        float _1366 = _1358;
        float _1368 = _1356;
        _1266 = _1320;
        _1268 = _1330;
        if (_1350)
        {
            float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1360 = _1370;
        }
        float _1372 = _1360;
        if (_1350)
        {
            float _1374 = precise::max(_1338, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1362 = _1374;
        }
        float _1376 = _1362;
        float _1378 = fma(_1316, _1358, _864);
        if (_1350)
        {
            float _1380 = _1376 * _1372;
            _1364 = _1380;
        }
        float _1382 = _1364;
        float _1384 = fma(_1320, _1358, _900);
        float _1386 = fma(_1330, _1358, _974);
        float _1388 = _1382;
        float _1390 = _1386;
        if (_1350)
        {
            float _1392 = _1356 * _1382;
            _1366 = _1392;
        }
        float _1394 = _1366;
        if (!_1350)
        {
            _1368 = _1378;
        }
        float _1396 = _1368;
        float _1398 = _1396;
        if (!_1350)
        {
            _1388 = _1384;
        }
        float _1400 = _1388;
        _1300 = _1400;
        if (_1350)
        {
            float _1402 = fma(_1316, _1394, _864);
            _1398 = _1402;
        }
        float _1404 = _1398;
        _1304 = _1404;
        if (_1350)
        {
            float _1406 = fma(_1330, _1394, _974);
            _1390 = _1406;
        }
        float _1408 = _1390;
        _1290 = _1408;
        if (_1350)
        {
            float _1410 = fma(_1320, _1394, _900);
            _1300 = _1410;
        }
    }
    float _1412 = _1266;
    float _1414 = _1268;
    float _1416 = _1290;
    float _1418 = _1304;
    float _1420 = _1300;
    float _1422 = _1412;
    float _1424 = _1414;
    if (_1242)
    {
        _932 = 1.0;
    }
    float _1426 = _932;
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1430 = _1294 * _1428;
    float _1432 = _1426;
    float _1434 = _1430;
    if (!_1242)
    {
        float _1436 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1438 = _1436 * 0.15915493667125701904296875;
        float _1440 = _1438 * 6.283185482025146484375;
        float _1442 = cos(_1440);
        float _1444 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1446 = _1444 * 0.15915493667125701904296875;
        float _1448 = _1438 * 6.283185482025146484375;
        float _1450 = sin(_1448);
        float _1452 = 1.0 / _1442;
        float _1454 = _1446 * 6.283185482025146484375;
        float _1456 = cos(_1454);
        float _1458 = _1450 * _1452;
        float _1460 = _1446 * 6.283185482025146484375;
        float _1462 = sin(_1460);
        float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1466 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1464;
        float _1468 = _1456 * _1458;
        float _1470 = 1.0 / _1466;
        float _1472 = 1.0 / _1468;
        float _1474 = _1462 * _1472;
        float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1478 = fma(_1430, _1474, _1476);
        float _1480 = _1478 * _1470;
        float _1482 = precise::clamp(_1480, 0.0, 1.0);
        _1422 = _1446;
        _1424 = _1470;
        _1296 = _1482;
    }
    float _1484 = _1422;
    float _1486 = _1424;
    float _1488 = _1296;
    float _1490 = _1484;
    float _1492 = _1486;
    if (!_1242)
    {
        float _1494 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1496 = _1494 * 0.15915493667125701904296875;
        float _1498 = _1496 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        float _1502 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1504 = _1502 * 0.15915493667125701904296875;
        float _1506 = _1496 * 6.283185482025146484375;
        float _1508 = sin(_1506);
        float _1510 = 1.0 / _1500;
        float _1512 = _1504 * 6.283185482025146484375;
        float _1514 = cos(_1512);
        float _1516 = _1508 * _1510;
        float _1518 = _1504 * 6.283185482025146484375;
        float _1520 = sin(_1518);
        float _1522 = _1514 * _1516;
        float _1524 = 1.0 / _1522;
        float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1528 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1526;
        float _1530 = 1.0 / _1528;
        float _1532 = _1520 * _1524;
        float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1536 = fma(_1430, _1532, _1534);
        float _1538 = _1536 * _1530;
        float _1540 = precise::clamp(_1538, 0.0, 1.0);
        float _1542 = -_1540;
        float _1544 = _1542 + 1.0;
        _1490 = _1500;
        _1492 = _1524;
        _1432 = _1544;
    }
    float _1546 = _1490;
    float _1548 = _1492;
    float _1550 = _1432;
    float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1554 = _1416 + _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1558 = _1418 + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1562 = _1420 + _1560;
    float _1564 = _1554 * _1554;
    float _1566 = fma(_1558, _1558, _1564);
    float _1568 = fma(_1562, _1562, _1566);
    float _1570 = rsqrt(_1568);
    float _1572 = sqrt(_1568);
    float _1574 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1576 = _1558 * _1574;
    float _1578 = _1562 * _1574;
    float _1580 = _1576 * _1576;
    float _1582 = _1578 * _1578;
    float _1584 = _1580 + _1582;
    float _1586 = sqrt(_1584);
    bool _1588 = _1586 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1592 = _1586 + _1590;
    float _1594 = _1570;
    float _1596 = _1548;
    float _1598 = _1592;
    float _1600 = _1574;
    float _1602 = _1576;
    if (_1588)
    {
        float _1604 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1604;
    }
    float _1606 = _1594;
    if (_1588)
    {
        float _1608 = rsqrt(_1584);
        _1596 = _1608;
    }
    float _1610 = _1596;
    float _1612 = _1610;
    if (_1588)
    {
        float _1614 = _1592 * _1606;
        _1598 = _1614;
    }
    float _1616 = _1598;
    if (_1588)
    {
        float _1618 = _1616 * 0.15915493667125701904296875;
        _1434 = _1618;
    }
    float _1620 = _1434;
    float _1622 = _1546;
    if (_1588)
    {
        float _1624 = _1620 * 6.283185482025146484375;
        float _1626 = sin(_1624);
        _1622 = _1626;
    }
    float _1628 = _1622;
    float _1630 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1632 = precise::max(0.0, _1630);
    float _1634 = _1562;
    float _1636 = _1632;
    float _1638 = _1630;
    if (_1588)
    {
        float _1640 = _1620 * 6.283185482025146484375;
        float _1642 = cos(_1640);
        _1634 = _1642;
    }
    float _1644 = _1634;
    float _1646 = -_1574;
    float _1648 = -_1632;
    float _1650 = fma(_1554, _1646, _1648);
    float _1652 = _1650;
    if (_1588)
    {
        float _1654 = _1650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1636 = _1654;
    }
    float _1656 = _1636;
    float _1658 = _1628;
    float _1660 = _1656;
    if (_1588)
    {
        float _1662 = fma(_1628, _1656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1658 = _1662;
    }
    float _1664 = _1658;
    float _1666 = _1664;
    if (_1588)
    {
        float _1668 = _1644 + (-1.0);
        _1638 = _1668;
    }
    float _1670 = _1638;
    float _1672 = _1670;
    if (_1588)
    {
        float _1674 = _1610 * _1664;
        _1600 = _1674;
    }
    float _1676 = _1600;
    if (!_1588)
    {
        _1612 = _1650;
    }
    float _1678 = _1612;
    float _1680 = _1678;
    if (_1588)
    {
        float _1682 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1660 = _1682;
    }
    float _1684 = _1660;
    if (_1588)
    {
        float _1686 = _1576 * _1676;
        _1602 = _1686;
    }
    float _1688 = _1602;
    if (!_1588)
    {
        _1666 = _1578;
    }
    float _1690 = _1666;
    float _1692 = _1690;
    if (_1588)
    {
        float _1694 = _1578 * _1676;
        _1692 = _1694;
    }
    float _1696 = _1692;
    if (!_1588)
    {
        _1672 = _1580;
    }
    float _1698 = _1672;
    float _1700 = _1698;
    if (_1588)
    {
        float _1702 = fma(_1650, _1644, _1684);
        _1680 = _1702;
    }
    float _1704 = _1680;
    if (_1588)
    {
        float _1706 = _1688 * _1688;
        _1700 = _1706;
    }
    float _1708 = _1700;
    if (!_1588)
    {
        _1652 = _1582;
    }
    float _1710 = _1652;
    float _1712 = _1710;
    if (_1588)
    {
        float _1714 = _1696 * _1696;
        _1712 = _1714;
    }
    float _1716 = _1712;
    float _1718 = fma(_1704, _1704, _1708);
    float _1720 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1722 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1724 = _1718 + _1716;
    float _1726 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1720);
    float _1728 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1732 = fma(_1572, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1730);
    float _1734 = precise::clamp(_1732, 0.0, 1.0);
    float _1736 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1738 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1726);
    float _1740 = rsqrt(_1724);
    float _1742 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1728);
    float _1744 = -_1734;
    float _1746 = _1744 + 1.0;
    float _1748 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1750 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1752 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1722);
    float _1754 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1742);
    float _1756 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1748);
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1760 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1752);
    float _1762 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1764 = abs(_1746);
    float _1766 = log2(_1764);
    float _1768 = -_1758;
    float _1770 = fma(_1768, _1736, 1.0);
    float _1772 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1774 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1776 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1756);
    float _1778 = _1740 * _1688;
    float _1780 = _1740 * _1696;
    float _1782 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1774);
    float _1784 = _1740 * _1704;
    float _1786 = _1778 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1788 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1790 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1782);
    float _1792 = log2(_1770);
    float _1794 = -_1786;
    float _1796 = fma(_1784, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1794);
    float _1798 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1800 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1790);
    float _1802 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1804 = -_1780;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1796);
    float _1808 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1810 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1798);
    float _1812 = 1.0 / _1800;
    float _1814 = fma(_1806, -0.5, 0.5);
    float _1816 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1808);
    float _1818 = fma(_1806, 0.5, 0.5);
    float _1820 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1810);
    float _1822 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1816);
    float _1824 = _1784 + 1.0;
    float _1826 = exp2(_1802);
    float _1828 = fma(_1818, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1830 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1822);
    float _1832 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1820);
    float _1834 = _1792 * 0.693147182464599609375;
    float _1836 = fma(_1818, _1828, -0.212114393711090087890625);
    float _1838 = sqrt(_1814);
    float _1840 = _1832 * _1812;
    float _1842 = fma(_1818, _1836, 1.570728778839111328125);
    float _1844 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1846 = fma(_1840, -0.5, 0.5);
    float _1848 = -_1784;
    float _1850 = fma(_1826, _1824, _1848);
    float _1852 = _1830 * _1812;
    float _1854 = fma(_1850, 0.5, 0.5);
    float _1856 = fma(_1852, 0.5, 0.5);
    float _1858 = _1838 * 0.636619746685028076171875;
    float _1860 = -_1842;
    float _1862 = fma(_1858, _1860, 1.0);
    float3 _4863 = float3(_1856, _1846, _1844);
    float _1864 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4863, float3(0.0), isnan(_4863)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4863, float3(0.0), isnan(_4863)), level(0.0)).x;
    float3 _4874 = float3(_1856, _1846, _1844);
    float4 _1867 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4874, float3(0.0), isnan(_4874)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4874, float3(0.0), isnan(_4874)), level(0.0)).xyzw;
    float _1869 = _1867.x;
    float _1871 = _1867.y;
    float _1873 = _1867.z;
    float _1875 = _1867.w;
    float2 _4891 = float2(_1862, _1854);
    float3 _1879 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4891, float2(0.0), isnan(_4891)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4891, float2(0.0), isnan(_4891)), level(0.0)).xyz;
    float _1881 = _1879.x;
    float _1883 = _1879.y;
    float _1885 = _1879.z;
    float _1887 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1889 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1891 = _1488 * _1550;
    bool _1893 = _1488 > 0.0;
    bool _1895 = isnan(_1488);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan(0.0);
    bool _1901 = _1897 || _1899;
    float _1903 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1889);
    float _1905 = exp2(_1887);
    bool _1907 = _1550 <= 0.0;
    bool _1909 = !_1901;
    bool _1911 = _1907 || _1909;
    float _1913 = _1891 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1915 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1903);
    float _1917 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1915);
    float _1919 = _1913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1921 = _1917 + _1800;
    float _1923 = -_1905;
    float _1925 = _1923 + 1.0;
    float _1927 = _1921 * 0.5;
    out.gl_Position.x = _1830;
    out.gl_Position.y = _1832;
    out.gl_Position.z = _1917;
    out.gl_Position.w = _1800;
    float _1929 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1927;
    out.m_69.w = _1800;
    float _1931 = -_1929;
    float _1933 = _1931 + 1.0;
    out.m_47.x = _1919;
    float _1935 = _1929 * _1864;
    float _1937 = _1875 * _1935;
    float _1939 = _1885 * _1935;
    float _1941 = fma(_1881, _1937, _1869);
    float _1943 = fma(_1883, _1937, _1871);
    float _1945 = _1875 * _1933;
    float _1947 = fma(_1875, _1939, _1873);
    out.m_71.x = _1941;
    out.m_71.y = _1943;
    out.m_71.z = _1947;
    out.m_71.w = _1945;
    if (!_1911)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1949 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1949;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1178 = false;
    bool _628 = false;
    bool _508 = false;
    bool _286 = false;
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
    float _108 = as_type<float>(_106);
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2007 = as_type<float>(_106);
        out.gl_Position.z = _2007;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    if (_120)
    {
        float _128 = float(_90);
        _126 = _128;
    }
    float _130 = _126;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _100;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    int _140 = 0;
    if (_136)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2075 = as_type<float>(_144);
        out.gl_Position.z = _2075;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = _148;
    if (!_158)
    {
        float _174 = _148 * _148;
        float _176 = _174 * 0.5;
        _108 = _176;
    }
    float _178 = _108;
    float _180 = _178;
    if (!_158)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_158;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _148 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _148);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_158;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _148 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _160, _248);
    float _256 = fma(_244, _162, _250);
    float _258 = fma(_244, _164, _252);
    float _260 = fma(_254, _146, _166);
    float _262 = fma(_256, _146, _168);
    float _264 = fma(_258, _146, _170);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_53.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_90);
        float _290 = 1.0 / _288;
        float _292 = _124 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _302 = _294 + _300;
    bool _304 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _306 = isnan(_294);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = _294 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = 1.0 / _318;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = 1.0 / _330;
    float _338 = 1.0 / _326;
    float _340 = _298 * _332;
    bool _342 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = isnan(_294);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_314;
    float _356 = _354 + 1.0;
    float _358 = _352 * _356;
    float _360 = _302 * _336;
    bool _362 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _364 = isnan(_294);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _374;
    bool _378 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _380 = isnan(_294);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = -_352;
    float _396 = _394 + 1.0;
    float _398 = -_372;
    float _400 = _398 + 1.0;
    float _402 = _322 * _338;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _408;
    float _412 = _388 * _400;
    float _414 = fma(_376, _402, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _416 = fma(_406, _402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _418 = fma(_410, _402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _420 = _372 * _396;
    float _422 = -_388;
    float _424 = _422 + 1.0;
    float _426 = _416 * _412;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = _418 * _412;
    float _438 = _414 * _412;
    float _440 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[143].x, _426);
    float _442 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[143].y, _436);
    float _444 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[143].z, _438);
    float _446 = fma(_392, _360, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _448 = fma(_430, _360, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _450 = fma(_434, _360, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _460;
    float _464 = fma(_446, _420, _440);
    float _466 = fma(_454, _340, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _468 = fma(_458, _340, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _470 = fma(_462, _340, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _472 = fma(_448, _420, _442);
    float _474 = fma(_450, _420, _444);
    float _476 = fma(_466, _358, _464);
    float _478 = fma(_468, _358, _472);
    float _480 = fma(_470, _358, _474);
    float _482 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    bool _488 = !_334;
    float _506;
    if (!_488)
    {
        float _490 = in.m_53.x;
        float _492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _494 = _490 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _498 = _496 * _492;
        float _500 = floor(_498);
        float _502 = -_500;
        float _504 = _498 + _502;
        _506 = _504;
        _508 = true;
    }
    else
    {
        float _510 = float(_90);
        float _512 = 1.0 / _510;
        float _514 = _124 * _512;
        _506 = _514;
    }
    _508 = false;
    float _516 = _506;
    bool _518 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _520 = isnan(_516);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _534 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _536 = isnan(_516);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _516 + _550;
    float _554 = -_528;
    float _556 = _554 + 1.0;
    float _558 = 1.0 / _532;
    bool _560 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _562 = _544 * _556;
    float _564 = -_544;
    float _566 = _564 + 1.0;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _570 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = _548 * _558;
    float _574 = fma(_572, _552, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _576 = _574 * _562;
    float _578 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[115].x, _576);
    float _580 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[116].x, _578);
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _586 = in.m_51.x;
    float _588 = in.m_51.y;
    float _590 = in.m_51.z;
    float _592 = _580 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _594 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _596 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _594;
    out.m_55.y = _570;
    out.m_55.z = _596;
    out.m_55.w = _592;
    float _598 = _486 * _590;
    float _600 = _484 * _588;
    float _602 = _482 * _586;
    bool _604 = !_560;
    float _606 = _582;
    bool _608 = _560;
    float _626;
    if (!_604)
    {
        float _610 = in.m_53.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_90);
        float _632 = 1.0 / _630;
        float _634 = _124 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    float _638 = in.m_57.x;
    float _640 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _642 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _646 = _644 != 0;
    float _648 = in.m_53.x;
    float _650 = in.m_53.y;
    float _652 = in.m_53.z;
    float _654 = in.m_53.w;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _658 = _656 != 0;
    float _660 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _640);
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _664 = _662 != 0;
    float _666 = in.m_59.x;
    float _668 = in.m_59.y;
    float _670 = in.m_59.z;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _674 = _672 != 0;
    float _676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _678 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _680 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _682 = _580;
    float _684 = _678;
    if (_646)
    {
        float _686 = in.m_53.z;
        _682 = _686;
    }
    float _688 = _682;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _698 = 1.0 / _692;
    float _700 = -_638;
    float _702 = _700 + 1.0;
    float _704 = _638;
    if (!_646)
    {
        _606 = _638;
    }
    float _706 = _606;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _710 = _654 > 0.5;
    float _712 = _648 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _716 = _706;
    if (_646)
    {
        bool _718 = _688 > 0.5;
        _608 = _718;
    }
    bool _720 = _608;
    float _722 = in.m_57.y;
    if (_646)
    {
        float _724 = _720 ? _702 : _638;
        _716 = _724;
    }
    float _726 = _716;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _734 = _732 != 0;
    float _736 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _738 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _742 = _740 != 0;
    float _744 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _736);
    float _746 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _738);
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _670);
    float _752 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _744);
    float _754 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _746);
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _666);
    float _758 = _678 * _638;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _668);
    float _762 = -_722;
    float _764 = _762 + 1.0;
    float _766 = _642 * _722;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _770 = _650 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _772 = -_758;
    float _774 = _772 + 1.0;
    float _776 = _722;
    float _778 = _758;
    float _780 = _766;
    if (_664)
    {
        float _782 = _710 ? _764 : _722;
        _776 = _782;
    }
    float _784 = _776;
    float _786 = -_748;
    float _788 = fma(_712, 2.0, _786);
    float _790 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _660);
    float _792 = fma(_770, -2.0, _768);
    bool _794 = _650 > 0.5;
    float _796 = _678 * _756;
    float _798 = _792;
    if (_742)
    {
        _684 = _648;
    }
    float _800 = _684;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _802;
    float _806 = _800;
    if (_658)
    {
        float _808 = _794 ? _774 : _758;
        _778 = _808;
    }
    float _810 = _778;
    float _812 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[88].w, _694);
    bool _814 = _652 > 0.5;
    float _816 = _804 * _698;
    float _818 = _642 * _760;
    if (!_742)
    {
        _806 = _652;
    }
    float _820 = _806;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _824 = _636 + _822;
    float _826 = 0.0;
    if (_742)
    {
        _826 = _650;
    }
    float _828 = _826;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _832 = _680 * _750;
    float _834 = fma(_816, _824, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _836 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[78].w, _830);
    float _838 = _676 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _840 = _818 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _844 = fma(_810, _838, -0.5);
    float _846 = _818 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _850 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[26].x, _840);
    bool _852 = _648 > 0.5;
    float _854 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[24].x, _846);
    float _856 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[78].z, _842);
    float _858 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[88].z, _848);
    float _860 = _828;
    if (!_742)
    {
        _860 = _648;
    }
    float _862 = _860;
    float _864 = _752 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _866 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _868 = isnan(_636);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    float _878 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[24].z, _854);
    bool _880 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _882 = isnan(_636);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[26].z, _850);
    float _894 = _818 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _896 = -_876;
    float _898 = _896 + 1.0;
    float _900 = _754 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _902 = _878 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _904 = _892 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _906 = _890 * _898;
    float _908 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[25].x, _894);
    float _910 = _864 + _902;
    float _912 = _900 + _904;
    float _914 = _834 * _906;
    float _916 = -_766;
    float _918 = _916 + 1.0;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _922 = _910 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _926 = _912 + _924;
    float _928 = _912;
    float _930 = _910;
    float _932 = _900;
    if (_730)
    {
        float _934 = _852 ? _702 : _638;
        _704 = _934;
    }
    float _936 = _704;
    float _938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _940 = _922 * _922;
    float _942 = _926 * _926;
    int _944 = _814 ? as_type<int>(_918) : as_type<int>(_766);
    float _946 = _862 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _948 = _820 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _950 = _940 + _942;
    bool _952 = !_674;
    float _954 = _952 ? _766 : as_type<float>(_944);
    float _956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _958 = _940;
    float _960 = _942;
    if (_734)
    {
        float _962 = _794 ? _918 : _766;
        _780 = _962;
    }
    float _964 = _780;
    float _966 = fma(_946, -2.0, _696);
    float _968 = -_708;
    float _970 = fma(_948, 2.0, _968);
    float _972 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[25].z, _908);
    float _974 = _790 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _976 = -_890;
    float _978 = _976 + 1.0;
    float _980 = _714 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _982 = sqrt(_950);
    float _984 = _938 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _986 = _972 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _988 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _856);
    float _990 = -_124;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[76].x, _788);
    float _994 = fma(_984, _936, -0.5);
    float _996 = _974 + _986;
    float _998 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[131].x, _914);
    float _1000 = _956 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1004 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _836);
    float _1006 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _792);
    float _1008 = fma(_1000, _964, -0.5);
    float _1010 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _858);
    float _1012 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _812);
    float _1014 = -_124;
    float _1016 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[86].x, _970);
    bool _1018 = _982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1022 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _966);
    float _1024 = fma(_954, _980, -0.5);
    float _1026 = fma(_988, _994, _992);
    if (!_1018)
    {
        _798 = _996;
    }
    float _1028 = _798;
    bool _1030 = !_1018;
    float _1032 = _1028;
    if (!_1030)
    {
        float _1034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1038 = _982 + _1036;
        float _1040 = rsqrt(_950);
        float _1042 = _1038 * _1034;
        float _1044 = _996 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = _1042 * 0.15915493667125701904296875;
        float _1048 = _1046 * 6.283185482025146484375;
        float _1050 = sin(_1048);
        float _1052 = _1046 * 6.283185482025146484375;
        float _1054 = cos(_1052);
        float _1056 = fma(_1050, _1044, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1058 = _1040 * _1056;
        float _1060 = _1054 + (-1.0);
        float _1062 = fma(_922, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1064 = fma(_926, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1066 = _1060 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1070 = _1062 + _1068;
        float _1072 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1074 = _1064 + _1072;
        float _1076 = fma(_996, _1054, _1066);
        float _1078 = _1070 * _1070;
        float _1080 = _1074 * _1074;
        _1032 = _1076;
        _958 = _1078;
        _960 = _1080;
        _928 = _1064;
        _930 = _1062;
    }
    float _1082 = _1032;
    float _1084 = _958;
    float _1086 = _960;
    float _1088 = _928;
    float _1090 = _930;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1094 = _1082 + _1092;
    float _1096 = -_1006;
    float _1098 = fma(_1004, _1008, _1096);
    float _1100 = fma(_1010, _844, _1016);
    float _1102 = -_1022;
    float _1104 = fma(_1012, _1024, _1102);
    float _1106 = fma(_1094, _1094, _1084);
    float _1108 = _784 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1110 = _726 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1112 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[132].x, _998);
    float _1114 = _1106 + _1086;
    float _1116 = _1108 * _1020;
    float _1118 = _1110 * _1002;
    float _1120 = _1100 + 0.5;
    float _1122 = sqrt(_1114);
    float _1124 = _1026 + 0.5;
    float _1126 = _1098 + 0.5;
    float _1128 = _1104 + 0.5;
    float _1130 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    out.m_63.x = _1124;
    out.m_63.y = _1126;
    out.m_63.z = _1118;
    out.m_63.w = _1116;
    out.m_65.x = _1120;
    out.m_65.y = _1128;
    bool _1132 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1134 = isnan(_1122);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1140 = _1136 || _1138;
    out.m_67.w = _1130;
    float _1142 = _1100;
    if (!_1140)
    {
        _1142 = 1.0;
    }
    float _1144 = _1142;
    bool _1146 = !_1140;
    float _1148 = _1144;
    if (!_1146)
    {
        bool _1150 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1152 = isnan(_1122);
        bool _1154 = _1150 || _1152;
        bool _1156 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1158 = _1154 || _1156;
        if (!_1158)
        {
            float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1162 = _1122 + _1160;
            float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1166 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1164;
            float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1170 = _1168 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1172 = 1.0 / _1166;
            float _1174 = _1162 * _1172;
            float _1176 = fma(_1174, _1170, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1148 = _1176;
            _1178 = true;
        }
        else
        {
            bool _1180 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1182 = isnan(_1122);
            bool _1184 = _1180 || _1182;
            bool _1186 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1188 = _1184 || _1186;
            if (!_1188)
            {
                float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1192 = _1122 + _1190;
                float _1194 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1196 = _1194 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1198 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1200 = _1198 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1202 = 1.0 / _1196;
                float _1204 = _1192 * _1202;
                float _1206 = fma(_1204, _1200, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1148 = _1206;
                _1178 = true;
            }
            else
            {
                _1148 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1178 = false;
    float _1208 = _1148;
    float _1210 = _974 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1214 = _1082 + _1212;
    float _1216 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1210);
    float _1218 = _974 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1220 = fma(_1214, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1222 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1216);
    bool _1224 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan(0.5);
    bool _1232 = _1228 || _1230;
    bool _1234 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan(0.5);
    bool _1242 = _1238 || _1240;
    float _1244 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1246 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1218);
    float _1248 = 1.0 / _1244;
    float _1250 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1246);
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1254 = _1252 + _1244;
    float _1256 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1258 = _1088 + _1256;
    float _1260 = fma(_1258, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1262 = _1258;
    float _1264 = _1208;
    float _1266 = _1260;
    float _1268 = _1220;
    if (_1232)
    {
        _1262 = _1220;
    }
    float _1270 = _1262;
    float _1272 = _1254 * _1248;
    float _1274 = _1272 * 0.5;
    float _1276 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1278 = _1090 + _1276;
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1282 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1280);
    float _1284 = fma(_1278, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1286 = _1274;
    float _1288 = _1278;
    float _1290 = _1270;
    if (_1242)
    {
        _1264 = 1.0;
    }
    float _1292 = _1264;
    float _1294 = 1.0 / _1282;
    float _1296 = _1292;
    if (_1232)
    {
        _1286 = _1260;
    }
    float _1298 = _1286;
    float _1300 = _1298;
    if (_1232)
    {
        _1288 = _1284;
    }
    float _1302 = _1288;
    float _1304 = _1302;
    if (!_1232)
    {
        float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1308 = _974 + _1306;
        float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1312 = _864 + _1310;
        float _1314 = -_864;
        float _1316 = _1314 + _1284;
        float _1318 = -_900;
        float _1320 = _1318 + _1260;
        float _1322 = _1308 * _1308;
        float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1326 = _900 + _1324;
        float _1328 = -_974;
        float _1330 = _1328 + _1220;
        float _1332 = fma(_1312, _1312, _1322);
        float _1334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1336 = fma(_1326, _1326, _1332);
        float _1338 = sqrt(_1336);
        float _1340 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1342 = _1338 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1344 = isnan(_1338);
        bool _1346 = _1342 || _1344;
        bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1350 = _1346 || _1348;
        float _1352 = precise::min(_1338, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1354 = _1352 * _1334;
        float _1356 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1358 = _1356 * _1354;
        float _1360 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
        float _1362 = _1334;
        float _1364 = _1338;
        float _1366 = _1358;
        float _1368 = _1356;
        _1266 = _1320;
        _1268 = _1330;
        if (_1350)
        {
            float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1360 = _1370;
        }
        float _1372 = _1360;
        if (_1350)
        {
            float _1374 = precise::max(_1338, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1362 = _1374;
        }
        float _1376 = _1362;
        float _1378 = fma(_1316, _1358, _864);
        if (_1350)
        {
            float _1380 = _1376 * _1372;
            _1364 = _1380;
        }
        float _1382 = _1364;
        float _1384 = fma(_1320, _1358, _900);
        float _1386 = fma(_1330, _1358, _974);
        float _1388 = _1382;
        float _1390 = _1386;
        if (_1350)
        {
            float _1392 = _1356 * _1382;
            _1366 = _1392;
        }
        float _1394 = _1366;
        if (!_1350)
        {
            _1368 = _1378;
        }
        float _1396 = _1368;
        float _1398 = _1396;
        if (!_1350)
        {
            _1388 = _1384;
        }
        float _1400 = _1388;
        _1300 = _1400;
        if (_1350)
        {
            float _1402 = fma(_1316, _1394, _864);
            _1398 = _1402;
        }
        float _1404 = _1398;
        _1304 = _1404;
        if (_1350)
        {
            float _1406 = fma(_1330, _1394, _974);
            _1390 = _1406;
        }
        float _1408 = _1390;
        _1290 = _1408;
        if (_1350)
        {
            float _1410 = fma(_1320, _1394, _900);
            _1300 = _1410;
        }
    }
    float _1412 = _1266;
    float _1414 = _1268;
    float _1416 = _1290;
    float _1418 = _1304;
    float _1420 = _1300;
    float _1422 = _1412;
    float _1424 = _1414;
    if (_1242)
    {
        _932 = 1.0;
    }
    float _1426 = _932;
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1430 = _1294 * _1428;
    float _1432 = _1426;
    float _1434 = _1430;
    if (!_1242)
    {
        float _1436 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1438 = _1436 * 0.15915493667125701904296875;
        float _1440 = _1438 * 6.283185482025146484375;
        float _1442 = cos(_1440);
        float _1444 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1446 = _1444 * 0.15915493667125701904296875;
        float _1448 = _1438 * 6.283185482025146484375;
        float _1450 = sin(_1448);
        float _1452 = 1.0 / _1442;
        float _1454 = _1446 * 6.283185482025146484375;
        float _1456 = cos(_1454);
        float _1458 = _1450 * _1452;
        float _1460 = _1446 * 6.283185482025146484375;
        float _1462 = sin(_1460);
        float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1466 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1464;
        float _1468 = _1456 * _1458;
        float _1470 = 1.0 / _1466;
        float _1472 = 1.0 / _1468;
        float _1474 = _1462 * _1472;
        float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1478 = fma(_1430, _1474, _1476);
        float _1480 = _1478 * _1470;
        float _1482 = precise::clamp(_1480, 0.0, 1.0);
        _1422 = _1446;
        _1424 = _1470;
        _1296 = _1482;
    }
    float _1484 = _1422;
    float _1486 = _1424;
    float _1488 = _1296;
    float _1490 = _1484;
    float _1492 = _1486;
    if (!_1242)
    {
        float _1494 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1496 = _1494 * 0.15915493667125701904296875;
        float _1498 = _1496 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        float _1502 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1504 = _1502 * 0.15915493667125701904296875;
        float _1506 = _1496 * 6.283185482025146484375;
        float _1508 = sin(_1506);
        float _1510 = 1.0 / _1500;
        float _1512 = _1504 * 6.283185482025146484375;
        float _1514 = cos(_1512);
        float _1516 = _1508 * _1510;
        float _1518 = _1504 * 6.283185482025146484375;
        float _1520 = sin(_1518);
        float _1522 = _1514 * _1516;
        float _1524 = 1.0 / _1522;
        float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1528 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1526;
        float _1530 = 1.0 / _1528;
        float _1532 = _1520 * _1524;
        float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1536 = fma(_1430, _1532, _1534);
        float _1538 = _1536 * _1530;
        float _1540 = precise::clamp(_1538, 0.0, 1.0);
        float _1542 = -_1540;
        float _1544 = _1542 + 1.0;
        _1490 = _1500;
        _1492 = _1524;
        _1432 = _1544;
    }
    float _1546 = _1490;
    float _1548 = _1492;
    float _1550 = _1432;
    float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1554 = _1416 + _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1558 = _1418 + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1562 = _1420 + _1560;
    float _1564 = _1554 * _1554;
    float _1566 = fma(_1558, _1558, _1564);
    float _1568 = fma(_1562, _1562, _1566);
    float _1570 = rsqrt(_1568);
    float _1572 = sqrt(_1568);
    float _1574 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1576 = _1558 * _1574;
    float _1578 = _1562 * _1574;
    float _1580 = _1576 * _1576;
    float _1582 = _1578 * _1578;
    float _1584 = _1580 + _1582;
    float _1586 = sqrt(_1584);
    bool _1588 = _1586 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1592 = _1586 + _1590;
    float _1594 = _1570;
    float _1596 = _1548;
    float _1598 = _1592;
    float _1600 = _1574;
    float _1602 = _1576;
    if (_1588)
    {
        float _1604 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1604;
    }
    float _1606 = _1594;
    if (_1588)
    {
        float _1608 = rsqrt(_1584);
        _1596 = _1608;
    }
    float _1610 = _1596;
    float _1612 = _1610;
    if (_1588)
    {
        float _1614 = _1592 * _1606;
        _1598 = _1614;
    }
    float _1616 = _1598;
    if (_1588)
    {
        float _1618 = _1616 * 0.15915493667125701904296875;
        _1434 = _1618;
    }
    float _1620 = _1434;
    float _1622 = _1546;
    if (_1588)
    {
        float _1624 = _1620 * 6.283185482025146484375;
        float _1626 = sin(_1624);
        _1622 = _1626;
    }
    float _1628 = _1622;
    float _1630 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1632 = precise::max(0.0, _1630);
    float _1634 = _1562;
    float _1636 = _1632;
    float _1638 = _1630;
    if (_1588)
    {
        float _1640 = _1620 * 6.283185482025146484375;
        float _1642 = cos(_1640);
        _1634 = _1642;
    }
    float _1644 = _1634;
    float _1646 = -_1574;
    float _1648 = -_1632;
    float _1650 = fma(_1554, _1646, _1648);
    float _1652 = _1650;
    if (_1588)
    {
        float _1654 = _1650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1636 = _1654;
    }
    float _1656 = _1636;
    float _1658 = _1628;
    float _1660 = _1656;
    if (_1588)
    {
        float _1662 = fma(_1628, _1656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1658 = _1662;
    }
    float _1664 = _1658;
    float _1666 = _1664;
    if (_1588)
    {
        float _1668 = _1644 + (-1.0);
        _1638 = _1668;
    }
    float _1670 = _1638;
    float _1672 = _1670;
    if (_1588)
    {
        float _1674 = _1610 * _1664;
        _1600 = _1674;
    }
    float _1676 = _1600;
    if (!_1588)
    {
        _1612 = _1650;
    }
    float _1678 = _1612;
    float _1680 = _1678;
    if (_1588)
    {
        float _1682 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1660 = _1682;
    }
    float _1684 = _1660;
    if (_1588)
    {
        float _1686 = _1576 * _1676;
        _1602 = _1686;
    }
    float _1688 = _1602;
    if (!_1588)
    {
        _1666 = _1578;
    }
    float _1690 = _1666;
    float _1692 = _1690;
    if (_1588)
    {
        float _1694 = _1578 * _1676;
        _1692 = _1694;
    }
    float _1696 = _1692;
    if (!_1588)
    {
        _1672 = _1580;
    }
    float _1698 = _1672;
    float _1700 = _1698;
    if (_1588)
    {
        float _1702 = fma(_1650, _1644, _1684);
        _1680 = _1702;
    }
    float _1704 = _1680;
    if (_1588)
    {
        float _1706 = _1688 * _1688;
        _1700 = _1706;
    }
    float _1708 = _1700;
    if (!_1588)
    {
        _1652 = _1582;
    }
    float _1710 = _1652;
    float _1712 = _1710;
    if (_1588)
    {
        float _1714 = _1696 * _1696;
        _1712 = _1714;
    }
    float _1716 = _1712;
    float _1718 = fma(_1704, _1704, _1708);
    float _1720 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1722 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1724 = _1718 + _1716;
    float _1726 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1720);
    float _1728 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1732 = fma(_1572, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1730);
    float _1734 = precise::clamp(_1732, 0.0, 1.0);
    float _1736 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1738 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1726);
    float _1740 = rsqrt(_1724);
    float _1742 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1728);
    float _1744 = -_1734;
    float _1746 = _1744 + 1.0;
    float _1748 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1750 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1752 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1722);
    float _1754 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1742);
    float _1756 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1748);
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1760 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1752);
    float _1762 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1764 = abs(_1746);
    float _1766 = log2(_1764);
    float _1768 = -_1758;
    float _1770 = fma(_1768, _1736, 1.0);
    float _1772 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1774 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1776 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1756);
    float _1778 = _1740 * _1688;
    float _1780 = _1740 * _1696;
    float _1782 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1774);
    float _1784 = _1740 * _1704;
    float _1786 = _1778 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1788 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1790 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1782);
    float _1792 = log2(_1770);
    float _1794 = -_1786;
    float _1796 = fma(_1784, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1794);
    float _1798 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1800 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1790);
    float _1802 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1804 = -_1780;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1796);
    float _1808 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1810 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1798);
    float _1812 = 1.0 / _1800;
    float _1814 = fma(_1806, -0.5, 0.5);
    float _1816 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1808);
    float _1818 = fma(_1806, 0.5, 0.5);
    float _1820 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1810);
    float _1822 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1816);
    float _1824 = _1784 + 1.0;
    float _1826 = exp2(_1802);
    float _1828 = fma(_1818, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1830 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1822);
    float _1832 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1820);
    float _1834 = _1792 * 0.693147182464599609375;
    float _1836 = fma(_1818, _1828, -0.212114393711090087890625);
    float _1838 = sqrt(_1814);
    float _1840 = _1832 * _1812;
    float _1842 = fma(_1818, _1836, 1.570728778839111328125);
    float _1844 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1846 = fma(_1840, -0.5, 0.5);
    float _1848 = -_1784;
    float _1850 = fma(_1826, _1824, _1848);
    float _1852 = _1830 * _1812;
    float _1854 = fma(_1850, 0.5, 0.5);
    float _1856 = fma(_1852, 0.5, 0.5);
    float _1858 = _1838 * 0.636619746685028076171875;
    float _1860 = -_1842;
    float _1862 = fma(_1858, _1860, 1.0);
    float3 _4863 = float3(_1856, _1846, _1844);
    float _1864 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4863, float3(0.0), isnan(_4863)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4863, float3(0.0), isnan(_4863)), level(0.0)).x;
    float3 _4874 = float3(_1856, _1846, _1844);
    float4 _1867 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4874, float3(0.0), isnan(_4874)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4874, float3(0.0), isnan(_4874)), level(0.0)).xyzw;
    float _1869 = _1867.x;
    float _1871 = _1867.y;
    float _1873 = _1867.z;
    float _1875 = _1867.w;
    float2 _4891 = float2(_1862, _1854);
    float3 _1879 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4891, float2(0.0), isnan(_4891)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4891, float2(0.0), isnan(_4891)), level(0.0)).xyz;
    float _1881 = _1879.x;
    float _1883 = _1879.y;
    float _1885 = _1879.z;
    float _1887 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1889 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1891 = _1488 * _1550;
    bool _1893 = _1488 > 0.0;
    bool _1895 = isnan(_1488);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan(0.0);
    bool _1901 = _1897 || _1899;
    float _1903 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1889);
    float _1905 = exp2(_1887);
    bool _1907 = _1550 <= 0.0;
    bool _1909 = !_1901;
    bool _1911 = _1907 || _1909;
    float _1913 = _1891 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1915 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1903);
    float _1917 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1915);
    float _1919 = _1913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1921 = _1917 + _1800;
    float _1923 = -_1905;
    float _1925 = _1923 + 1.0;
    float _1927 = _1921 * 0.5;
    out.gl_Position.x = _1830;
    out.gl_Position.y = _1832;
    out.gl_Position.z = _1917;
    out.gl_Position.w = _1800;
    float _1929 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1927;
    out.m_69.w = _1800;
    float _1931 = -_1929;
    float _1933 = _1931 + 1.0;
    out.m_47.x = _1919;
    float _1935 = _1929 * _1864;
    float _1937 = _1875 * _1935;
    float _1939 = _1885 * _1935;
    float _1941 = fma(_1881, _1937, _1869);
    float _1943 = fma(_1883, _1937, _1871);
    float _1945 = _1875 * _1933;
    float _1947 = fma(_1875, _1939, _1873);
    out.m_71.x = _1941;
    out.m_71.y = _1943;
    out.m_71.z = _1947;
    out.m_71.w = _1945;
    if (!_1911)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1949 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1949;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1178 = false;
    bool _628 = false;
    bool _508 = false;
    bool _286 = false;
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
    float _108 = as_type<float>(_106);
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2007 = as_type<float>(_106);
        out.gl_Position.z = _2007;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    if (_120)
    {
        float _128 = float(_90);
        _126 = _128;
    }
    float _130 = _126;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _100;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    int _140 = 0;
    if (_136)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2075 = as_type<float>(_144);
        out.gl_Position.z = _2075;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = _148;
    if (!_158)
    {
        float _174 = _148 * _148;
        float _176 = _174 * 0.5;
        _108 = _176;
    }
    float _178 = _108;
    float _180 = _178;
    if (!_158)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_158;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _148 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _148);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_158;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _148 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _160, _248);
    float _256 = fma(_244, _162, _250);
    float _258 = fma(_244, _164, _252);
    float _260 = fma(_254, _146, _166);
    float _262 = fma(_256, _146, _168);
    float _264 = fma(_258, _146, _170);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_53.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_90);
        float _290 = 1.0 / _288;
        float _292 = _124 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _302 = _294 + _300;
    bool _304 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _306 = isnan(_294);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = _294 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = 1.0 / _318;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = 1.0 / _330;
    float _338 = 1.0 / _326;
    float _340 = _298 * _332;
    bool _342 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = isnan(_294);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_314;
    float _356 = _354 + 1.0;
    float _358 = _352 * _356;
    float _360 = _302 * _336;
    bool _362 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _364 = isnan(_294);
    bool _366 = _362 || _364;
    bool _368 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _370 = _366 || _368;
    float _372 = float(_370);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _374;
    bool _378 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _380 = isnan(_294);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = -_352;
    float _396 = _394 + 1.0;
    float _398 = -_372;
    float _400 = _398 + 1.0;
    float _402 = _322 * _338;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _404;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _408;
    float _412 = _388 * _400;
    float _414 = fma(_376, _402, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _416 = fma(_406, _402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _418 = fma(_410, _402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _420 = _372 * _396;
    float _422 = -_388;
    float _424 = _422 + 1.0;
    float _426 = _416 * _412;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = _418 * _412;
    float _438 = _414 * _412;
    float _440 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[143].x, _426);
    float _442 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[143].y, _436);
    float _444 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[143].z, _438);
    float _446 = fma(_392, _360, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _448 = fma(_430, _360, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _450 = fma(_434, _360, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _460;
    float _464 = fma(_446, _420, _440);
    float _466 = fma(_454, _340, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _468 = fma(_458, _340, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _470 = fma(_462, _340, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _472 = fma(_448, _420, _442);
    float _474 = fma(_450, _420, _444);
    float _476 = fma(_466, _358, _464);
    float _478 = fma(_468, _358, _472);
    float _480 = fma(_470, _358, _474);
    float _482 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    bool _488 = !_334;
    float _506;
    if (!_488)
    {
        float _490 = in.m_53.x;
        float _492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _494 = _490 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _498 = _496 * _492;
        float _500 = floor(_498);
        float _502 = -_500;
        float _504 = _498 + _502;
        _506 = _504;
        _508 = true;
    }
    else
    {
        float _510 = float(_90);
        float _512 = 1.0 / _510;
        float _514 = _124 * _512;
        _506 = _514;
    }
    _508 = false;
    float _516 = _506;
    bool _518 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _520 = isnan(_516);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _534 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _536 = isnan(_516);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _516 + _550;
    float _554 = -_528;
    float _556 = _554 + 1.0;
    float _558 = 1.0 / _532;
    bool _560 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _562 = _544 * _556;
    float _564 = -_544;
    float _566 = _564 + 1.0;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _570 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = _548 * _558;
    float _574 = fma(_572, _552, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _576 = _574 * _562;
    float _578 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[115].x, _576);
    float _580 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[116].x, _578);
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _586 = in.m_51.x;
    float _588 = in.m_51.y;
    float _590 = in.m_51.z;
    float _592 = _580 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _594 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _596 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _594;
    out.m_55.y = _570;
    out.m_55.z = _596;
    out.m_55.w = _592;
    float _598 = _486 * _590;
    float _600 = _484 * _588;
    float _602 = _482 * _586;
    bool _604 = !_560;
    float _606 = _582;
    bool _608 = _560;
    float _626;
    if (!_604)
    {
        float _610 = in.m_53.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_90);
        float _632 = 1.0 / _630;
        float _634 = _124 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    float _638 = in.m_57.x;
    float _640 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _642 = _600 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _646 = _644 != 0;
    float _648 = in.m_53.x;
    float _650 = in.m_53.y;
    float _652 = in.m_53.z;
    float _654 = in.m_53.w;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _658 = _656 != 0;
    float _660 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _640);
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _664 = _662 != 0;
    float _666 = in.m_59.x;
    float _668 = in.m_59.y;
    float _670 = in.m_59.z;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _674 = _672 != 0;
    float _676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _678 = _602 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _680 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _682 = _580;
    float _684 = _678;
    if (_646)
    {
        float _686 = in.m_53.z;
        _682 = _686;
    }
    float _688 = _682;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _698 = 1.0 / _692;
    float _700 = -_638;
    float _702 = _700 + 1.0;
    float _704 = _638;
    if (!_646)
    {
        _606 = _638;
    }
    float _706 = _606;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _710 = _654 > 0.5;
    float _712 = _648 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _716 = _706;
    if (_646)
    {
        bool _718 = _688 > 0.5;
        _608 = _718;
    }
    bool _720 = _608;
    float _722 = in.m_57.y;
    if (_646)
    {
        float _724 = _720 ? _702 : _638;
        _716 = _724;
    }
    float _726 = _716;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _734 = _732 != 0;
    float _736 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _738 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _742 = _740 != 0;
    float _744 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _736);
    float _746 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _738);
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _670);
    float _752 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _744);
    float _754 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _746);
    float _756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _666);
    float _758 = _678 * _638;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _668);
    float _762 = -_722;
    float _764 = _762 + 1.0;
    float _766 = _642 * _722;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _770 = _650 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _772 = -_758;
    float _774 = _772 + 1.0;
    float _776 = _722;
    float _778 = _758;
    float _780 = _766;
    if (_664)
    {
        float _782 = _710 ? _764 : _722;
        _776 = _782;
    }
    float _784 = _776;
    float _786 = -_748;
    float _788 = fma(_712, 2.0, _786);
    float _790 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _660);
    float _792 = fma(_770, -2.0, _768);
    bool _794 = _650 > 0.5;
    float _796 = _678 * _756;
    float _798 = _792;
    if (_742)
    {
        _684 = _648;
    }
    float _800 = _684;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _802;
    float _806 = _800;
    if (_658)
    {
        float _808 = _794 ? _774 : _758;
        _778 = _808;
    }
    float _810 = _778;
    float _812 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[88].w, _694);
    bool _814 = _652 > 0.5;
    float _816 = _804 * _698;
    float _818 = _642 * _760;
    if (!_742)
    {
        _806 = _652;
    }
    float _820 = _806;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _824 = _636 + _822;
    float _826 = 0.0;
    if (_742)
    {
        _826 = _650;
    }
    float _828 = _826;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _832 = _680 * _750;
    float _834 = fma(_816, _824, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _836 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[78].w, _830);
    float _838 = _676 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _840 = _818 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _844 = fma(_810, _838, -0.5);
    float _846 = _818 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _850 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[26].x, _840);
    bool _852 = _648 > 0.5;
    float _854 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[24].x, _846);
    float _856 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[78].z, _842);
    float _858 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[88].z, _848);
    float _860 = _828;
    if (!_742)
    {
        _860 = _648;
    }
    float _862 = _860;
    float _864 = _752 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _866 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _868 = isnan(_636);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    float _878 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[24].z, _854);
    bool _880 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _882 = isnan(_636);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[26].z, _850);
    float _894 = _818 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _896 = -_876;
    float _898 = _896 + 1.0;
    float _900 = _754 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _902 = _878 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _904 = _892 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _906 = _890 * _898;
    float _908 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[25].x, _894);
    float _910 = _864 + _902;
    float _912 = _900 + _904;
    float _914 = _834 * _906;
    float _916 = -_766;
    float _918 = _916 + 1.0;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _922 = _910 + _920;
    float _924 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _926 = _912 + _924;
    float _928 = _912;
    float _930 = _910;
    float _932 = _900;
    if (_730)
    {
        float _934 = _852 ? _702 : _638;
        _704 = _934;
    }
    float _936 = _704;
    float _938 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _940 = _922 * _922;
    float _942 = _926 * _926;
    int _944 = _814 ? as_type<int>(_918) : as_type<int>(_766);
    float _946 = _862 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _948 = _820 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _950 = _940 + _942;
    bool _952 = !_674;
    float _954 = _952 ? _766 : as_type<float>(_944);
    float _956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _958 = _940;
    float _960 = _942;
    if (_734)
    {
        float _962 = _794 ? _918 : _766;
        _780 = _962;
    }
    float _964 = _780;
    float _966 = fma(_946, -2.0, _696);
    float _968 = -_708;
    float _970 = fma(_948, 2.0, _968);
    float _972 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[25].z, _908);
    float _974 = _790 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _976 = -_890;
    float _978 = _976 + 1.0;
    float _980 = _714 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _982 = sqrt(_950);
    float _984 = _938 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _986 = _972 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _988 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _856);
    float _990 = -_124;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[76].x, _788);
    float _994 = fma(_984, _936, -0.5);
    float _996 = _974 + _986;
    float _998 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[131].x, _914);
    float _1000 = _956 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1004 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _836);
    float _1006 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _792);
    float _1008 = fma(_1000, _964, -0.5);
    float _1010 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _858);
    float _1012 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _812);
    float _1014 = -_124;
    float _1016 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[86].x, _970);
    bool _1018 = _982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1020 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1022 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _966);
    float _1024 = fma(_954, _980, -0.5);
    float _1026 = fma(_988, _994, _992);
    if (!_1018)
    {
        _798 = _996;
    }
    float _1028 = _798;
    bool _1030 = !_1018;
    float _1032 = _1028;
    if (!_1030)
    {
        float _1034 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1038 = _982 + _1036;
        float _1040 = rsqrt(_950);
        float _1042 = _1038 * _1034;
        float _1044 = _996 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = _1042 * 0.15915493667125701904296875;
        float _1048 = _1046 * 6.283185482025146484375;
        float _1050 = sin(_1048);
        float _1052 = _1046 * 6.283185482025146484375;
        float _1054 = cos(_1052);
        float _1056 = fma(_1050, _1044, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1058 = _1040 * _1056;
        float _1060 = _1054 + (-1.0);
        float _1062 = fma(_922, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1064 = fma(_926, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1066 = _1060 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1070 = _1062 + _1068;
        float _1072 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1074 = _1064 + _1072;
        float _1076 = fma(_996, _1054, _1066);
        float _1078 = _1070 * _1070;
        float _1080 = _1074 * _1074;
        _1032 = _1076;
        _958 = _1078;
        _960 = _1080;
        _928 = _1064;
        _930 = _1062;
    }
    float _1082 = _1032;
    float _1084 = _958;
    float _1086 = _960;
    float _1088 = _928;
    float _1090 = _930;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1094 = _1082 + _1092;
    float _1096 = -_1006;
    float _1098 = fma(_1004, _1008, _1096);
    float _1100 = fma(_1010, _844, _1016);
    float _1102 = -_1022;
    float _1104 = fma(_1012, _1024, _1102);
    float _1106 = fma(_1094, _1094, _1084);
    float _1108 = _784 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1110 = _726 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1112 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[132].x, _998);
    float _1114 = _1106 + _1086;
    float _1116 = _1108 * _1020;
    float _1118 = _1110 * _1002;
    float _1120 = _1100 + 0.5;
    float _1122 = sqrt(_1114);
    float _1124 = _1026 + 0.5;
    float _1126 = _1098 + 0.5;
    float _1128 = _1104 + 0.5;
    float _1130 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    out.m_63.x = _1124;
    out.m_63.y = _1126;
    out.m_63.z = _1118;
    out.m_63.w = _1116;
    out.m_65.x = _1120;
    out.m_65.y = _1128;
    bool _1132 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1134 = isnan(_1122);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1140 = _1136 || _1138;
    out.m_67.w = _1130;
    float _1142 = _1100;
    if (!_1140)
    {
        _1142 = 1.0;
    }
    float _1144 = _1142;
    bool _1146 = !_1140;
    float _1148 = _1144;
    if (!_1146)
    {
        bool _1150 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1152 = isnan(_1122);
        bool _1154 = _1150 || _1152;
        bool _1156 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1158 = _1154 || _1156;
        if (!_1158)
        {
            float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1162 = _1122 + _1160;
            float _1164 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1166 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1164;
            float _1168 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1170 = _1168 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1172 = 1.0 / _1166;
            float _1174 = _1162 * _1172;
            float _1176 = fma(_1174, _1170, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1148 = _1176;
            _1178 = true;
        }
        else
        {
            bool _1180 = _1122 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1182 = isnan(_1122);
            bool _1184 = _1180 || _1182;
            bool _1186 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1188 = _1184 || _1186;
            if (!_1188)
            {
                float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1192 = _1122 + _1190;
                float _1194 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1196 = _1194 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1198 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1200 = _1198 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1202 = 1.0 / _1196;
                float _1204 = _1192 * _1202;
                float _1206 = fma(_1204, _1200, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1148 = _1206;
                _1178 = true;
            }
            else
            {
                _1148 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1178 = false;
    float _1208 = _1148;
    float _1210 = _974 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1214 = _1082 + _1212;
    float _1216 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1210);
    float _1218 = _974 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1220 = fma(_1214, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1222 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1216);
    bool _1224 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan(0.5);
    bool _1232 = _1228 || _1230;
    bool _1234 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1236 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan(0.5);
    bool _1242 = _1238 || _1240;
    float _1244 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1246 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1218);
    float _1248 = 1.0 / _1244;
    float _1250 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1246);
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1254 = _1252 + _1244;
    float _1256 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1258 = _1088 + _1256;
    float _1260 = fma(_1258, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1262 = _1258;
    float _1264 = _1208;
    float _1266 = _1260;
    float _1268 = _1220;
    if (_1232)
    {
        _1262 = _1220;
    }
    float _1270 = _1262;
    float _1272 = _1254 * _1248;
    float _1274 = _1272 * 0.5;
    float _1276 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1278 = _1090 + _1276;
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1282 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1280);
    float _1284 = fma(_1278, _1208, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1286 = _1274;
    float _1288 = _1278;
    float _1290 = _1270;
    if (_1242)
    {
        _1264 = 1.0;
    }
    float _1292 = _1264;
    float _1294 = 1.0 / _1282;
    float _1296 = _1292;
    if (_1232)
    {
        _1286 = _1260;
    }
    float _1298 = _1286;
    float _1300 = _1298;
    if (_1232)
    {
        _1288 = _1284;
    }
    float _1302 = _1288;
    float _1304 = _1302;
    if (!_1232)
    {
        float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1308 = _974 + _1306;
        float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1312 = _864 + _1310;
        float _1314 = -_864;
        float _1316 = _1314 + _1284;
        float _1318 = -_900;
        float _1320 = _1318 + _1260;
        float _1322 = _1308 * _1308;
        float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1326 = _900 + _1324;
        float _1328 = -_974;
        float _1330 = _1328 + _1220;
        float _1332 = fma(_1312, _1312, _1322);
        float _1334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1336 = fma(_1326, _1326, _1332);
        float _1338 = sqrt(_1336);
        float _1340 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1342 = _1338 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1344 = isnan(_1338);
        bool _1346 = _1342 || _1344;
        bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1350 = _1346 || _1348;
        float _1352 = precise::min(_1338, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1354 = _1352 * _1334;
        float _1356 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1358 = _1356 * _1354;
        float _1360 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
        float _1362 = _1334;
        float _1364 = _1338;
        float _1366 = _1358;
        float _1368 = _1356;
        _1266 = _1320;
        _1268 = _1330;
        if (_1350)
        {
            float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1360 = _1370;
        }
        float _1372 = _1360;
        if (_1350)
        {
            float _1374 = precise::max(_1338, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1362 = _1374;
        }
        float _1376 = _1362;
        float _1378 = fma(_1316, _1358, _864);
        if (_1350)
        {
            float _1380 = _1376 * _1372;
            _1364 = _1380;
        }
        float _1382 = _1364;
        float _1384 = fma(_1320, _1358, _900);
        float _1386 = fma(_1330, _1358, _974);
        float _1388 = _1382;
        float _1390 = _1386;
        if (_1350)
        {
            float _1392 = _1356 * _1382;
            _1366 = _1392;
        }
        float _1394 = _1366;
        if (!_1350)
        {
            _1368 = _1378;
        }
        float _1396 = _1368;
        float _1398 = _1396;
        if (!_1350)
        {
            _1388 = _1384;
        }
        float _1400 = _1388;
        _1300 = _1400;
        if (_1350)
        {
            float _1402 = fma(_1316, _1394, _864);
            _1398 = _1402;
        }
        float _1404 = _1398;
        _1304 = _1404;
        if (_1350)
        {
            float _1406 = fma(_1330, _1394, _974);
            _1390 = _1406;
        }
        float _1408 = _1390;
        _1290 = _1408;
        if (_1350)
        {
            float _1410 = fma(_1320, _1394, _900);
            _1300 = _1410;
        }
    }
    float _1412 = _1266;
    float _1414 = _1268;
    float _1416 = _1290;
    float _1418 = _1304;
    float _1420 = _1300;
    float _1422 = _1412;
    float _1424 = _1414;
    if (_1242)
    {
        _932 = 1.0;
    }
    float _1426 = _932;
    float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1430 = _1294 * _1428;
    float _1432 = _1426;
    float _1434 = _1430;
    if (!_1242)
    {
        float _1436 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1438 = _1436 * 0.15915493667125701904296875;
        float _1440 = _1438 * 6.283185482025146484375;
        float _1442 = cos(_1440);
        float _1444 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1446 = _1444 * 0.15915493667125701904296875;
        float _1448 = _1438 * 6.283185482025146484375;
        float _1450 = sin(_1448);
        float _1452 = 1.0 / _1442;
        float _1454 = _1446 * 6.283185482025146484375;
        float _1456 = cos(_1454);
        float _1458 = _1450 * _1452;
        float _1460 = _1446 * 6.283185482025146484375;
        float _1462 = sin(_1460);
        float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1466 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1464;
        float _1468 = _1456 * _1458;
        float _1470 = 1.0 / _1466;
        float _1472 = 1.0 / _1468;
        float _1474 = _1462 * _1472;
        float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1478 = fma(_1430, _1474, _1476);
        float _1480 = _1478 * _1470;
        float _1482 = precise::clamp(_1480, 0.0, 1.0);
        _1422 = _1446;
        _1424 = _1470;
        _1296 = _1482;
    }
    float _1484 = _1422;
    float _1486 = _1424;
    float _1488 = _1296;
    float _1490 = _1484;
    float _1492 = _1486;
    if (!_1242)
    {
        float _1494 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1496 = _1494 * 0.15915493667125701904296875;
        float _1498 = _1496 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        float _1502 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1504 = _1502 * 0.15915493667125701904296875;
        float _1506 = _1496 * 6.283185482025146484375;
        float _1508 = sin(_1506);
        float _1510 = 1.0 / _1500;
        float _1512 = _1504 * 6.283185482025146484375;
        float _1514 = cos(_1512);
        float _1516 = _1508 * _1510;
        float _1518 = _1504 * 6.283185482025146484375;
        float _1520 = sin(_1518);
        float _1522 = _1514 * _1516;
        float _1524 = 1.0 / _1522;
        float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1528 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1526;
        float _1530 = 1.0 / _1528;
        float _1532 = _1520 * _1524;
        float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1536 = fma(_1430, _1532, _1534);
        float _1538 = _1536 * _1530;
        float _1540 = precise::clamp(_1538, 0.0, 1.0);
        float _1542 = -_1540;
        float _1544 = _1542 + 1.0;
        _1490 = _1500;
        _1492 = _1524;
        _1432 = _1544;
    }
    float _1546 = _1490;
    float _1548 = _1492;
    float _1550 = _1432;
    float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1554 = _1416 + _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1558 = _1418 + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1562 = _1420 + _1560;
    float _1564 = _1554 * _1554;
    float _1566 = fma(_1558, _1558, _1564);
    float _1568 = fma(_1562, _1562, _1566);
    float _1570 = rsqrt(_1568);
    float _1572 = sqrt(_1568);
    float _1574 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1576 = _1558 * _1574;
    float _1578 = _1562 * _1574;
    float _1580 = _1576 * _1576;
    float _1582 = _1578 * _1578;
    float _1584 = _1580 + _1582;
    float _1586 = sqrt(_1584);
    bool _1588 = _1586 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1592 = _1586 + _1590;
    float _1594 = _1570;
    float _1596 = _1548;
    float _1598 = _1592;
    float _1600 = _1574;
    float _1602 = _1576;
    if (_1588)
    {
        float _1604 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1604;
    }
    float _1606 = _1594;
    if (_1588)
    {
        float _1608 = rsqrt(_1584);
        _1596 = _1608;
    }
    float _1610 = _1596;
    float _1612 = _1610;
    if (_1588)
    {
        float _1614 = _1592 * _1606;
        _1598 = _1614;
    }
    float _1616 = _1598;
    if (_1588)
    {
        float _1618 = _1616 * 0.15915493667125701904296875;
        _1434 = _1618;
    }
    float _1620 = _1434;
    float _1622 = _1546;
    if (_1588)
    {
        float _1624 = _1620 * 6.283185482025146484375;
        float _1626 = sin(_1624);
        _1622 = _1626;
    }
    float _1628 = _1622;
    float _1630 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1632 = precise::max(0.0, _1630);
    float _1634 = _1562;
    float _1636 = _1632;
    float _1638 = _1630;
    if (_1588)
    {
        float _1640 = _1620 * 6.283185482025146484375;
        float _1642 = cos(_1640);
        _1634 = _1642;
    }
    float _1644 = _1634;
    float _1646 = -_1574;
    float _1648 = -_1632;
    float _1650 = fma(_1554, _1646, _1648);
    float _1652 = _1650;
    if (_1588)
    {
        float _1654 = _1650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1636 = _1654;
    }
    float _1656 = _1636;
    float _1658 = _1628;
    float _1660 = _1656;
    if (_1588)
    {
        float _1662 = fma(_1628, _1656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1658 = _1662;
    }
    float _1664 = _1658;
    float _1666 = _1664;
    if (_1588)
    {
        float _1668 = _1644 + (-1.0);
        _1638 = _1668;
    }
    float _1670 = _1638;
    float _1672 = _1670;
    if (_1588)
    {
        float _1674 = _1610 * _1664;
        _1600 = _1674;
    }
    float _1676 = _1600;
    if (!_1588)
    {
        _1612 = _1650;
    }
    float _1678 = _1612;
    float _1680 = _1678;
    if (_1588)
    {
        float _1682 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1660 = _1682;
    }
    float _1684 = _1660;
    if (_1588)
    {
        float _1686 = _1576 * _1676;
        _1602 = _1686;
    }
    float _1688 = _1602;
    if (!_1588)
    {
        _1666 = _1578;
    }
    float _1690 = _1666;
    float _1692 = _1690;
    if (_1588)
    {
        float _1694 = _1578 * _1676;
        _1692 = _1694;
    }
    float _1696 = _1692;
    if (!_1588)
    {
        _1672 = _1580;
    }
    float _1698 = _1672;
    float _1700 = _1698;
    if (_1588)
    {
        float _1702 = fma(_1650, _1644, _1684);
        _1680 = _1702;
    }
    float _1704 = _1680;
    if (_1588)
    {
        float _1706 = _1688 * _1688;
        _1700 = _1706;
    }
    float _1708 = _1700;
    if (!_1588)
    {
        _1652 = _1582;
    }
    float _1710 = _1652;
    float _1712 = _1710;
    if (_1588)
    {
        float _1714 = _1696 * _1696;
        _1712 = _1714;
    }
    float _1716 = _1712;
    float _1718 = fma(_1704, _1704, _1708);
    float _1720 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1722 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1724 = _1718 + _1716;
    float _1726 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1720);
    float _1728 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1730 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1732 = fma(_1572, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1730);
    float _1734 = precise::clamp(_1732, 0.0, 1.0);
    float _1736 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1738 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1726);
    float _1740 = rsqrt(_1724);
    float _1742 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1728);
    float _1744 = -_1734;
    float _1746 = _1744 + 1.0;
    float _1748 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1750 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1752 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1722);
    float _1754 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1742);
    float _1756 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1748);
    float _1758 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1760 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1752);
    float _1762 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1764 = abs(_1746);
    float _1766 = log2(_1764);
    float _1768 = -_1758;
    float _1770 = fma(_1768, _1736, 1.0);
    float _1772 = _1760 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1774 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1776 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1756);
    float _1778 = _1740 * _1688;
    float _1780 = _1740 * _1696;
    float _1782 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1774);
    float _1784 = _1740 * _1704;
    float _1786 = _1778 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1788 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1790 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1782);
    float _1792 = log2(_1770);
    float _1794 = -_1786;
    float _1796 = fma(_1784, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1794);
    float _1798 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1800 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1790);
    float _1802 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1804 = -_1780;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1796);
    float _1808 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1810 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1798);
    float _1812 = 1.0 / _1800;
    float _1814 = fma(_1806, -0.5, 0.5);
    float _1816 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1808);
    float _1818 = fma(_1806, 0.5, 0.5);
    float _1820 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1810);
    float _1822 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1816);
    float _1824 = _1784 + 1.0;
    float _1826 = exp2(_1802);
    float _1828 = fma(_1818, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1830 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1822);
    float _1832 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1820);
    float _1834 = _1792 * 0.693147182464599609375;
    float _1836 = fma(_1818, _1828, -0.212114393711090087890625);
    float _1838 = sqrt(_1814);
    float _1840 = _1832 * _1812;
    float _1842 = fma(_1818, _1836, 1.570728778839111328125);
    float _1844 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1846 = fma(_1840, -0.5, 0.5);
    float _1848 = -_1784;
    float _1850 = fma(_1826, _1824, _1848);
    float _1852 = _1830 * _1812;
    float _1854 = fma(_1850, 0.5, 0.5);
    float _1856 = fma(_1852, 0.5, 0.5);
    float _1858 = _1838 * 0.636619746685028076171875;
    float _1860 = -_1842;
    float _1862 = fma(_1858, _1860, 1.0);
    float3 _4863 = float3(_1856, _1846, _1844);
    float _1864 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4863, float3(0.0), isnan(_4863)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4863, float3(0.0), isnan(_4863)), level(0.0)).x;
    float3 _4874 = float3(_1856, _1846, _1844);
    float4 _1867 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4874, float3(0.0), isnan(_4874)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4874, float3(0.0), isnan(_4874)), level(0.0)).xyzw;
    float _1869 = _1867.x;
    float _1871 = _1867.y;
    float _1873 = _1867.z;
    float _1875 = _1867.w;
    float2 _4891 = float2(_1862, _1854);
    float3 _1879 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4891, float2(0.0), isnan(_4891)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4891, float2(0.0), isnan(_4891)), level(0.0)).xyz;
    float _1881 = _1879.x;
    float _1883 = _1879.y;
    float _1885 = _1879.z;
    float _1887 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1889 = _1762 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1891 = _1488 * _1550;
    bool _1893 = _1488 > 0.0;
    bool _1895 = isnan(_1488);
    bool _1897 = _1893 || _1895;
    bool _1899 = isnan(0.0);
    bool _1901 = _1897 || _1899;
    float _1903 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1889);
    float _1905 = exp2(_1887);
    bool _1907 = _1550 <= 0.0;
    bool _1909 = !_1901;
    bool _1911 = _1907 || _1909;
    float _1913 = _1891 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1915 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1903);
    float _1917 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1915);
    float _1919 = _1913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1921 = _1917 + _1800;
    float _1923 = -_1905;
    float _1925 = _1923 + 1.0;
    float _1927 = _1921 * 0.5;
    out.gl_Position.x = _1830;
    out.gl_Position.y = _1832;
    out.gl_Position.z = _1917;
    out.gl_Position.w = _1800;
    float _1929 = _1925 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1927;
    out.m_69.w = _1800;
    float _1931 = -_1929;
    float _1933 = _1931 + 1.0;
    out.m_47.x = _1919;
    float _1935 = _1929 * _1864;
    float _1937 = _1875 * _1935;
    float _1939 = _1885 * _1935;
    float _1941 = fma(_1881, _1937, _1869);
    float _1943 = fma(_1883, _1937, _1871);
    float _1945 = _1875 * _1933;
    float _1947 = fma(_1875, _1939, _1873);
    out.m_71.x = _1941;
    out.m_71.y = _1943;
    out.m_71.z = _1947;
    out.m_71.w = _1945;
    if (!_1911)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1949 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1949;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

