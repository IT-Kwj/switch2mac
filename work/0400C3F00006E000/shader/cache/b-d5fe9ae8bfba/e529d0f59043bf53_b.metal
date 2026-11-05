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
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_69 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_63 [[user(locn11)]];
    float4 m_83 [[user(locn12)]];
    float4 m_85 [[user(locn13)]];
    float4 m_81 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_51 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1657 = false;
    bool _472 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1940 = as_type<float>(_122);
        out.gl_Position.z = _1940;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_49.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _116 = _142;
    }
    float _144 = _116;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2009 = as_type<float>(_158);
        out.gl_Position.z = _2009;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_51.y;
    float _162 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _164 = in.m_53.w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_49.x;
    float _178 = in.m_49.y;
    float _180 = in.m_49.z;
    float _182 = in.m_44.x;
    float _184 = in.m_44.y;
    float _186 = in.m_44.z;
    float _188 = 0.0;
    float _190 = _162;
    if (!_174)
    {
        float _192 = _162 * _162;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    out.m_55.y = _160;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _162 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _162);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _162 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _176, _266);
    float _274 = fma(_262, _178, _268);
    float _276 = fma(_262, _180, _270);
    float _278 = fma(_272, _164, _182);
    float _280 = fma(_274, _164, _184);
    float _282 = fma(_276, _164, _186);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_57.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_106);
        float _308 = 1.0 / _306;
        float _310 = _140 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _316 = _312 + _314;
    bool _318 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _320 = isnan(_312);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _332 = _312 + _330;
    bool _334 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _336 = isnan(_312);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _354 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _356 = isnan(_312);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_328;
    float _368 = _366 + 1.0;
    float _370 = 1.0 / _352;
    float _372 = _364 * _368;
    float _374 = -_364;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _378;
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _384 = 1.0 / _348;
    float _386 = _344 * _376;
    float _388 = -_344;
    float _390 = _388 + 1.0;
    float _392 = _332 * _370;
    float _394 = _316 * _384;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _400;
    float _404 = fma(_380, _394, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _406 = fma(_398, _394, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _408 = fma(_402, _394, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _410 = _404 * _386;
    float _412 = _406 * _386;
    float _414 = _408 * _386;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _428 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[107].x, _410);
    float _430 = fma(_418, _392, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _432 = fma(_422, _392, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _434 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[107].y, _412);
    float _436 = fma(_426, _392, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _438 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[107].z, _414);
    float _440 = fma(_430, _372, _428);
    float _442 = fma(_432, _372, _434);
    float _444 = fma(_436, _372, _438);
    float _446 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[109].x, _440);
    float _448 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[109].y, _442);
    float _450 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[109].z, _444);
    bool _452 = !_382;
    float _470;
    if (!_452)
    {
        float _454 = in.m_57.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_106);
        float _476 = 1.0 / _474;
        float _478 = _140 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = in.m_53.x;
    float _484 = in.m_53.y;
    float _486 = in.m_59.x;
    float _488 = in.m_59.y;
    float _490 = in.m_59.z;
    float _492 = in.m_53.z;
    float _494 = in.m_51.x;
    float _496 = _482 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _500 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _502 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _486);
    float _504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _488);
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _508 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _510 = _500 * _502;
    float _512 = _492 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _514 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _516 = _506 * _504;
    float _518 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _490);
    float _520 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _522 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _514);
    float _524 = _516 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _526 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _508);
    float _528 = _516 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _530 = _520 * _518;
    float _532 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _522);
    float _534 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[10].x, _524);
    float _536 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
    float _538 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[8].x, _528);
    float _540 = _532 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _542 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[10].z, _534);
    float _544 = _536 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _546 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[8].z, _538);
    float _548 = in.m_57.x;
    float _550 = in.m_57.y;
    float _552 = in.m_57.z;
    float _554 = in.m_57.w;
    float _556 = _540 + _542;
    float _558 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _560 = _544 + _546;
    float _562 = _506 * _160;
    float _564 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _566 = _556 + _564;
    float _568 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _570 = _560 + _568;
    float _572 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _558);
    float _574 = _566 * _566;
    float _576 = -_494;
    float _578 = _576 + 1.0;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _582 = _580 != 0;
    float _584 = _516 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _586 = fma(_570, _570, _574);
    float _588 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _572);
    float _590 = -_562;
    float _592 = _590 + 1.0;
    float _594 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[9].x, _584);
    float _596 = sqrt(_586);
    float _598 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[9].z, _594);
    bool _600 = _554 > 0.5;
    bool _602 = _548 > 0.5;
    bool _604 = _552 > 0.5;
    int _606 = _602 ? as_type<int>(_578) : as_type<int>(_494);
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _614 = _612 != 0;
    bool _616 = _596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _620 = _618 != 0;
    int _622 = _604 ? as_type<int>(_578) : as_type<int>(_494);
    float _624 = _582 ? as_type<float>(_606) : _494;
    float _626 = _588 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _628 = _550 > 0.5;
    int _630 = _600 ? as_type<int>(_592) : as_type<int>(_562);
    float _632 = _626 + _598;
    float _634 = _620 ? as_type<float>(_622) : _494;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _638 = _636 != 0;
    int _640 = _628 ? as_type<int>(_592) : as_type<int>(_562);
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _644 = _642 != 0;
    bool _646 = !_638;
    float _648 = _646 ? _562 : as_type<float>(_640);
    bool _650 = !_644;
    float _652 = _650 ? _562 : as_type<float>(_630);
    float _654 = _494;
    float _656 = _562;
    float _658 = _578;
    float _660 = _626;
    float _662 = _592;
    float _664 = _596;
    float _666 = _550;
    if (_610)
    {
        float _668 = _628 ? _578 : _494;
        _654 = _668;
    }
    float _670 = _654;
    float _672 = _670;
    if (_614)
    {
        float _674 = _604 ? _592 : _562;
        _656 = _674;
    }
    float _676 = _656;
    if (!_616)
    {
        _658 = _560;
    }
    float _678 = _658;
    float _680 = _678;
    if (!_616)
    {
        _660 = _556;
    }
    float _682 = _660;
    float _684 = _682;
    if (!_616)
    {
        _662 = _632;
    }
    float _686 = _662;
    bool _688 = !_616;
    float _690 = _686;
    if (!_688)
    {
        float _692 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _694 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _696 = _596 + _694;
        float _698 = _632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _700 = rsqrt(_586);
        float _702 = _696 * _692;
        float _704 = _702 * 0.15915493667125701904296875;
        float _706 = _704 * 6.283185482025146484375;
        float _708 = cos(_706);
        float _710 = _704 * 6.283185482025146484375;
        float _712 = sin(_710);
        float _714 = _708 + (-1.0);
        float _716 = _714 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _718 = fma(_712, _698, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _720 = fma(_632, _708, _716);
        float _722 = _700 * _718;
        float _724 = fma(_570, _722, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _726 = fma(_566, _722, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _690 = _720;
        _680 = _724;
        _684 = _726;
        _664 = _696;
    }
    float _728 = _690;
    float _730 = _680;
    float _732 = _684;
    float _734 = _664;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _738 = _728 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _742 = _730 + _740;
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _746 = _732 + _744;
    float _748 = _738 * _738;
    float _750 = fma(_742, _742, _748);
    float _752 = fma(_746, _746, _750);
    float _754 = rsqrt(_752);
    float _756 = _754 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _758 = _742 * _756;
    float _760 = _746 * _756;
    float _762 = _758 * _758;
    float _764 = _760 * _760;
    float _766 = _762 + _764;
    float _768 = sqrt(_766);
    bool _770 = _768 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _772 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _774 = _768 + _772;
    float _776 = _586;
    float _778 = _766;
    float _780 = _774;
    float _782 = _734;
    float _784 = _738;
    float _786 = _756;
    float _788 = _758;
    if (_770)
    {
        float _790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _776 = _790;
    }
    float _792 = _776;
    if (_770)
    {
        float _794 = rsqrt(_766);
        _778 = _794;
    }
    float _796 = _778;
    float _798 = _792;
    float _800 = _796;
    if (_770)
    {
        float _802 = _774 * _792;
        _780 = _802;
    }
    float _804 = _780;
    if (_770)
    {
        float _806 = _804 * 0.15915493667125701904296875;
        _782 = _806;
    }
    float _808 = _782;
    float _810 = _746;
    if (_770)
    {
        float _812 = _808 * 6.283185482025146484375;
        float _814 = sin(_812);
        _810 = _814;
    }
    float _816 = _810;
    float _818 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _820 = precise::max(0.0, _818);
    float _822 = _632;
    float _824 = _820;
    if (_770)
    {
        float _826 = _808 * 6.283185482025146484375;
        float _828 = cos(_826);
        _822 = _828;
    }
    float _830 = _822;
    float _832 = -_756;
    float _834 = -_820;
    float _836 = fma(_738, _832, _834);
    if (_770)
    {
        float _838 = _836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _784 = _838;
    }
    float _840 = _784;
    float _842 = _728 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _844 = _816;
    float _846 = _840;
    if (_770)
    {
        float _848 = fma(_816, _840, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _844 = _848;
    }
    float _850 = _844;
    float _852 = _850;
    if (!_770)
    {
        _846 = _760;
    }
    float _854 = _846;
    float _856 = _854;
    float _858 = _830;
    if (_770)
    {
        float _860 = _830 + (-1.0);
        _824 = _860;
    }
    float _862 = _824;
    if (_770)
    {
        float _864 = _796 * _850;
        _786 = _864;
    }
    float _866 = _786;
    if (!_770)
    {
        _852 = _836;
    }
    float _868 = _852;
    float _870 = _868;
    if (_770)
    {
        float _872 = _862 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _798 = _872;
    }
    float _874 = _798;
    if (_770)
    {
        float _876 = _758 * _866;
        _788 = _876;
    }
    float _878 = _788;
    if (!_770)
    {
        _800 = _762;
    }
    float _880 = _800;
    float _882 = _880;
    if (_770)
    {
        float _884 = _760 * _866;
        _856 = _884;
    }
    float _886 = _856;
    if (_770)
    {
        float _888 = fma(_836, _830, _874);
        _870 = _888;
    }
    float _890 = _870;
    if (_770)
    {
        float _892 = _878 * _878;
        _882 = _892;
    }
    float _894 = _882;
    if (!_770)
    {
        _858 = _764;
    }
    float _896 = _858;
    float _898 = _896;
    if (_770)
    {
        float _900 = _886 * _886;
        _898 = _900;
    }
    float _902 = _898;
    float _904 = sqrt(_752);
    float _906 = fma(_890, _890, _894);
    float _908 = _728 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _910 = _906 + _902;
    float _912 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[2].x, _842);
    float _914 = _728 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _916 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[3].x, _908);
    float _918 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _920 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[2].z, _912);
    float _922 = rsqrt(_910);
    float _924 = _728 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _926 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[1].x, _914);
    float _928 = _920 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _930 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[3].z, _916);
    float _932 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[0].x, _924);
    float _934 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _936 = fma(_904, (*spvDescriptorSet0.vp_c15)._m0[23].w, _934);
    float _938 = precise::clamp(_936, 0.0, 1.0);
    float _940 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[1].z, _926);
    float _942 = _928 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _944 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[0].z, _932);
    float _946 = -_938;
    float _948 = _946 + 1.0;
    float _950 = _940 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _952 = -_942;
    float _954 = fma(_952, _918, 1.0);
    float _956 = _944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _958 = _930 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _960 = _950 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _962 = _922 * _878;
    float _964 = abs(_948);
    float _966 = log2(_964);
    float _968 = _922 * _890;
    float _970 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[7].x, _960);
    float _972 = _962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _974 = _922 * _886;
    float _976 = _968 + 1.0;
    float _978 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _970);
    float _980 = -_972;
    float _982 = fma(_968, (*spvDescriptorSet0.vp_c15)._m0[21].y, _980);
    float _984 = log2(_954);
    float _986 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[7].w, _978);
    float _988 = -_974;
    float _990 = fma(_988, (*spvDescriptorSet0.vp_c15)._m0[21].z, _982);
    float _992 = _950 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _994 = _950 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _996 = fma(_990, -0.5, 0.5);
    float _998 = _966 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1000 = 1.0 / _986;
    float _1002 = fma(_990, 0.5, 0.5);
    float _1004 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[4].x, _992);
    float _1006 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[5].x, _994);
    float _1008 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1004);
    float _1010 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1006);
    float _1012 = exp2(_998);
    float _1014 = _984 * 0.693147182464599609375;
    float _1016 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1008);
    float _1018 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1010);
    float _1020 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1022 = sqrt(_996);
    float _1024 = fma(_1002, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1026 = _1016 * _1000;
    float _1028 = _1018 * _1000;
    float _1030 = fma(_1002, _1024, -0.212114393711090087890625);
    float _1032 = fma(_1026, 0.5, 0.5);
    float _1034 = fma(_1028, -0.5, 0.5);
    float _1036 = -_968;
    float _1038 = fma(_1012, _976, _1036);
    float _1040 = fma(_1002, _1030, 1.570728778839111328125);
    float _1042 = fma(_1038, 0.5, 0.5);
    float _1044 = _1022 * 0.636619746685028076171875;
    float3 _3461 = float3(_1032, _1034, _1020);
    float _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3461, float3(0.0), isnan(_3461)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3461, float3(0.0), isnan(_3461)), level(0.0)).x;
    float _1048 = -_1040;
    float _1050 = fma(_1044, _1048, 1.0);
    float3 _3477 = float3(_1032, _1034, _1020);
    float4 _1053 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3477, float3(0.0), isnan(_3477)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3477, float3(0.0), isnan(_3477)), level(0.0)).xyzw;
    float _1055 = _1053.x;
    float _1057 = _1053.y;
    float _1059 = _1053.z;
    float _1061 = _1053.w;
    float2 _3494 = float2(_1050, _1042);
    float3 _1065 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3494, float2(0.0), isnan(_3494)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3494, float2(0.0), isnan(_3494)), level(0.0)).xyz;
    float _1067 = _1065.x;
    float _1069 = _1065.y;
    float _1071 = _1065.z;
    float _1073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1075 = _950 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = _730;
    out.m_61.y = _728;
    out.m_61.z = _732;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1085 = _548 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_63.x = (*spvDescriptorSet0.vp_c10)._m0[8].x;
    out.m_63.y = (*spvDescriptorSet0.vp_c10)._m0[9].x;
    out.m_63.z = (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _1087 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1089 = 1.0 / _1079;
    float _1091 = -_1081;
    float _1093 = fma(_1085, 2.0, _1091);
    int _1095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1097 = _1095 != 0;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1101 = _550 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1109 = fma(_624, _1087, -0.5);
    float _1111 = fma(_1101, -2.0, _1099);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1113;
    float _1117 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1119 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1129 = _1115 * _1089;
    float _1131 = fma(_634, _1123, -0.5);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1135 = _480 + _1133;
    out.m_65.x = _1117;
    out.m_65.y = _1119;
    out.m_65.z = _1121;
    bool _1137 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1139 = isnan(_480);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    bool _1149 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1151 = isnan(_480);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = fma(_1129, _1135, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1163 = -_1147;
    float _1165 = _1163 + 1.0;
    bool _1167 = _488 != 0.0;
    bool _1169 = isnan(_488);
    bool _1171 = _1167 || _1169;
    bool _1173 = isnan(0.0);
    bool _1175 = _1171 || _1173;
    float _1177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1179 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1181 = _486 == 0.0;
    bool _1183 = !_1175;
    bool _1185 = _1181 && _1183;
    float _1187 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1127);
    float _1189 = _1117;
    float _1191 = _1093;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    float _1195 = _986;
    float _1197 = _1018;
    float _1199 = _1016;
    if (_1097)
    {
        _1189 = _548;
    }
    float _1201 = _1189;
    float _1203 = -_140;
    float _1205 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1093);
    float _1207 = -_1159;
    float _1209 = _1207 + 1.0;
    float _1211 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1187);
    float _1213 = _1201;
    if (!_1097)
    {
        _1213 = _552;
    }
    float _1215 = _1213;
    float _1217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_1097)
    {
        _1191 = _550;
    }
    float _1219 = _1191;
    float _1221 = fma(_1211, _1109, _1205);
    float _1223 = _1147 * _1209;
    float _1225 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1227 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1229 = _1161 * _1223;
    float _1231 = -_1179;
    float _1233 = fma(_1225, 2.0, _1231);
    float _1235 = fma(_1227, _670, -0.5);
    float _1237 = _1219;
    if (_1097)
    {
        _1237 = _548;
    }
    float _1239 = _1237;
    float _1241 = in.m_67.x;
    float _1243 = in.m_67.y;
    float _1245 = in.m_67.z;
    float _1247 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1229);
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1251 = -_140;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1233);
    bool _1255 = _490 == 0.0;
    bool _1257 = _1255 && _1185;
    float _1259 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1249);
    float _1261 = _1249;
    if (!_1097)
    {
        _672 = _552;
    }
    float _1263 = _672;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1267 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1269 = _1263;
    int _1271 = as_type<int>(_1265);
    if (_1097)
    {
        _1269 = _550;
    }
    float _1273 = _1269;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1277 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1279 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1247);
    float _1281 = 0.0;
    float _1283 = _1275;
    if (!_1097)
    {
        _1281 = _552;
    }
    float _1285 = _1281;
    float _1287 = -_1265;
    float _1289 = fma(_1267, 2.0, _1287);
    float _1291 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1275);
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1299 = _1285;
    float _1301 = _1293;
    if (_1097)
    {
        _1299 = _550;
    }
    float _1303 = _1299;
    float _1305 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1293);
    float _1307 = _1243;
    float _1309 = _1241;
    if (_1257)
    {
        _1283 = _1243;
    }
    float _1311 = _1283;
    float _1313 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1295);
    float _1315 = _1311;
    if (_1257)
    {
        _1193 = _1245;
    }
    float _1317 = _1193;
    float _1319 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1297);
    float _1321 = _1317;
    if (!_1097)
    {
        _666 = _548;
    }
    float _1323 = _666;
    if (_1257)
    {
        float _1325 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1311);
        _1271 = as_type<int>(_1325);
    }
    int _1327 = _1271;
    int _1329 = _1327;
    if (_1257)
    {
        _1301 = _1311;
    }
    float _1331 = _1301;
    float _1333 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1305);
    float _1335 = _1331;
    if (_1257)
    {
        float _1337 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1317);
        _1261 = _1337;
    }
    float _1339 = _1261;
    float _1341 = _1339;
    if (!_1257)
    {
        _1315 = _1243;
    }
    float _1343 = _1315;
    float _1345 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_1257)
    {
        _1307 = _1317;
    }
    float _1347 = _1307;
    float _1349 = _1347;
    if (!_1257)
    {
        float _1351 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1241);
        _1309 = _1351;
    }
    float _1353 = _1309;
    if (!_1257)
    {
        _1321 = _1245;
    }
    float _1355 = _1321;
    float _1357 = fma(_1333, _1235, _1253);
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1361 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (!_1257)
    {
        float _1365 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1343);
        _1329 = as_type<int>(_1365);
    }
    int _1367 = _1329;
    float _1369 = fma(_648, _1277, -0.5);
    float _1371 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1313);
    float _1373 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1111);
    float _1375 = fma(_652, _1361, -0.5);
    float _1377 = fma(_1345, -2.0, _1359);
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1381 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1383 = -_1373;
    float _1385 = fma(_1371, _1369, _1383);
    if (!_1257)
    {
        float _1387 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1355);
        _1341 = _1387;
    }
    float _1389 = _1341;
    bool _1391 = !_1257;
    float _1393 = _1391 ? as_type<float>(_1367) : _1343;
    float _1395 = fma(_1381, -2.0, _1379);
    float _1397 = _448 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1399 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1259);
    float _1401 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1403 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (!_1257)
    {
        _1349 = _1389;
    }
    float _1405 = _1349;
    float _1407 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1395);
    float _1409 = fma(_1401, _676, -0.5);
    float _1411 = _1279 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1413 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1319);
    bool _1415 = !_1257;
    float _1417 = _1415 ? _1389 : _1355;
    float _1419 = _966 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1421 = _1393 * _1393;
    float _1423 = -_140;
    float _1425 = fma(_1423, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1289);
    float _1427 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1291);
    float _1429 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1377);
    float _1431 = -_1407;
    float _1433 = fma(_1413, _1409, _1431);
    float _1435 = fma(_1417, _1417, _1421);
    float _1437 = exp2(_1419);
    float _1439 = fma(_1399, _1131, _1425);
    float _1441 = _450 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (!_1257)
    {
        _1335 = as_type<float>(_1367);
    }
    float _1443 = _1335;
    float _1445 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1449 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1451 = -_1429;
    float _1453 = fma(_1427, _1375, _1451);
    float _1455 = rsqrt(_1435);
    float _1457 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1075);
    float _1459 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1461 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1463 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_69.x = _1445;
    out.m_69.y = _1447;
    out.m_69.z = _1449;
    out.m_69.w = _1411;
    float _1465 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1459);
    float _1467 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1461);
    float _1469 = -_1437;
    float _1471 = _1469 + 1.0;
    float _1473 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1457);
    float _1475 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1463);
    float _1477 = _1357 + 0.5;
    float _1479 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1481 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1473);
    float _1483 = _1433 + 0.5;
    float _1485 = _1393 * _1455;
    float _1487 = _1417 * _1455;
    bool _1489 = _904 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1491 = isnan(_904);
    bool _1493 = _1489 || _1491;
    bool _1495 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1497 = _1493 || _1495;
    float _1499 = _1221 + 0.5;
    float _1501 = _1439 + 0.5;
    float _1503 = _1385 + 0.5;
    float _1505 = _1453 + 0.5;
    float _1507 = -(*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1509 = _1485 * _1507;
    float _1511 = -(*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1513 = _1485 * _1511;
    float _1515 = -(*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1517 = _1485 * _1515;
    out.m_71.x = _1477;
    out.m_71.y = _1483;
    float _1519 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1509);
    float _1521 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1513);
    float _1523 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1517);
    out.m_73.x = _1499;
    out.m_73.y = _1503;
    out.m_73.z = _1501;
    out.m_73.w = _1505;
    out.m_75.x = _1521;
    out.m_75.y = _1519;
    out.m_75.z = _1523;
    out.gl_Position.x = _1016;
    out.gl_Position.y = _1018;
    out.gl_Position.z = _1481;
    out.gl_Position.w = _986;
    float _1525 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1475);
    float _1527 = _1481 + _986;
    float _1529 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1467);
    float _1531 = _1521;
    float _1533 = _1481;
    if (!_1497)
    {
        _1531 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1535 = _1531;
    float _1537 = _1527 * 0.5;
    float _1539 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1465);
    float _1541 = _1535;
    float _1543 = _1535;
    if (!_1497)
    {
        _1195 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1545 = _1195;
    out.m_77.z = _1537;
    out.m_77.w = _986;
    float _1547 = _1545;
    float _1549 = _1545;
    if (!_1497)
    {
        _1533 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1551 = _1533;
    float _1553 = _1551;
    float _1555 = _1551;
    if (!_1497)
    {
        _1197 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1557 = _1197;
    out.m_79.x = _1539;
    out.m_79.y = _1529;
    out.m_79.z = _1525;
    float _1559 = _1557;
    float _1561 = _1557;
    if (!_1497)
    {
        _1199 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1563 = _1199;
    float _1565 = _1479 * _1046;
    float _1567 = -_1479;
    float _1569 = _1567 + 1.0;
    float _1571 = _1061 * _1565;
    float _1573 = _1061 * _1569;
    float _1575 = _1071 * _1565;
    float _1577 = fma(_1067, _1571, _1055);
    float _1579 = fma(_1069, _1571, _1057);
    float _1581 = _1571;
    float _1583 = _1563;
    float _1585 = _1563;
    if (!_1497)
    {
        _1581 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1587 = _1581;
    float _1589 = fma(_1061, _1575, _1059);
    out.m_81.x = _1577;
    out.m_81.y = _1579;
    out.m_81.z = _1589;
    out.m_81.w = _1573;
    bool _1591 = !_1497;
    float _1593 = _1587;
    float _1595 = _1587;
    if (!_1591)
    {
        bool _1597 = _904 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1599 = isnan(_904);
        bool _1601 = _1597 || _1599;
        bool _1603 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1605 = _1601 || _1603;
        if (!_1605)
        {
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1609 = _904 + _1607;
            float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1613 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1611;
            float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1619 = 1.0 / _1613;
            float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1623 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1627 = _1625 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1631 = _1629 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1635 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1637 = _1609 * _1619;
            float _1639 = precise::clamp(_1637, 0.0, 1.0);
            float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1643 = _1641 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1645 = fma(_1639, _1617, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1647 = fma(_1639, _1643, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1649 = fma(_1639, _1623, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1651 = fma(_1639, _1627, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1653 = fma(_1639, _1631, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1655 = fma(_1639, _1635, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1543 = _1649;
            _1561 = _1653;
            _1595 = _1645;
            _1555 = _1651;
            _1549 = _1647;
            _1585 = _1655;
            _1657 = true;
        }
        else
        {
            bool _1659 = _904 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1661 = isnan(_904);
            bool _1663 = _1659 || _1661;
            bool _1665 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1667 = _1663 || _1665;
            if (!_1667)
            {
                _1593 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1669 = _1593;
            _1595 = _1669;
            if (!_1667)
            {
                _1541 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1671 = _1541;
            _1543 = _1671;
            if (!_1667)
            {
                _1547 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1673 = _1547;
            _1549 = _1673;
            if (!_1667)
            {
                _1553 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1675 = _1553;
            _1555 = _1675;
            if (!_1667)
            {
                _1559 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1677 = _1559;
            _1561 = _1677;
            if (!_1667)
            {
                _1583 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1679 = _1583;
            bool _1681 = !_1667;
            _1585 = _1679;
            if (!_1681)
            {
                bool _1683 = _904 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1685 = isnan(_904);
                bool _1687 = _1683 || _1685;
                bool _1689 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1691 = _1687 || _1689;
                if (!_1691)
                {
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1695 = _904 + _1693;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1699 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1697;
                    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1705 = 1.0 / _1699;
                    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1721 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1723 = _1695 * _1705;
                    float _1725 = precise::clamp(_1723, 0.0, 1.0);
                    float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1729 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1731 = fma(_1725, _1703, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1733 = fma(_1725, _1729, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1735 = fma(_1725, _1709, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1737 = fma(_1725, _1713, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1739 = fma(_1725, _1717, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1741 = fma(_1725, _1721, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1543 = _1735;
                    _1561 = _1739;
                    _1595 = _1731;
                    _1555 = _1737;
                    _1549 = _1733;
                    _1585 = _1741;
                    _1657 = true;
                }
                else
                {
                    _1543 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1561 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1595 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1555 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1549 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1585 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1657 = false;
    float _1743 = _1543;
    float _1745 = _1561;
    float _1747 = _1595;
    float _1749 = _1555;
    float _1751 = _1549;
    float _1753 = _1585;
    float _1755 = fma(_1529, -0.5, 0.5);
    float _1757 = precise::clamp(_1755, 0.0, 1.0);
    float _1759 = -_1743;
    float _1761 = _1759 + _1745;
    float _1763 = -_1747;
    float _1765 = _1763 + _1749;
    float _1767 = -_1751;
    float _1769 = _1767 + _1753;
    bool _1771 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1773 = fma(_1757, _1761, _1743);
    float _1775 = fma(_1757, _1765, _1747);
    float _1777 = fma(_1757, _1769, _1751);
    float _1779 = _1773 * 0.586610972881317138671875;
    out.m_83.x = 0.0;
    float _1781 = fma(_1775, 0.298911988735198974609375, _1779);
    out.m_85.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1783 = fma(_1777, 0.114477999508380889892578125, _1781);
    out.m_47.x = 1.0;
    float _1785 = -_1783;
    float _1787 = _1775 + _1785;
    float _1789 = -_1783;
    float _1791 = _1773 + _1789;
    float _1793 = -_1783;
    float _1795 = _1777 + _1793;
    float _1797 = fma(_1787, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    float _1799 = fma(_1791, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    float _1801 = fma(_1795, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    out.m_87.x = _1797;
    out.m_87.y = _1799;
    out.m_87.z = _1801;
    if (!_1771)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1803 = -_728;
    float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1807 = -_730;
    float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1811 = -_732;
    float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1815 = _1805 * _1805;
    float _1817 = fma(_1809, _1809, _1815);
    float _1819 = fma(_1813, _1813, _1817);
    float _1821 = sqrt(_1819);
    float _1823 = rsqrt(_1819);
    float _1825 = -_1821;
    float _1827 = _1825 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1829 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1831 = precise::clamp(_1829, 0.0, 1.0);
    float _1833 = _1809 * _1823;
    float _1835 = _1805 * _1823;
    float _1837 = abs(_1831);
    float _1839 = log2(_1837);
    float _1841 = _1813 * _1823;
    float _1843 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1845 = _1529 * _1835;
    float _1847 = -_1835;
    float _1849 = -_1843;
    float _1851 = fma(_1847, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1849);
    float _1853 = fma(_1539, _1833, _1845);
    float _1855 = -_1841;
    float _1857 = fma(_1855, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1851);
    float _1859 = fma(_1525, _1841, _1853);
    float _1861 = precise::clamp(_1859, 0.0, 1.0);
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1865 = _1857 + _1863;
    float _1867 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1869 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1871 = precise::clamp(_1869, 0.0, 1.0);
    float _1873 = exp2(_1867);
    float _1875 = _1873 * _1871;
    float _1877 = _1861 * _1875;
    float _1879 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1881 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1883 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _1879;
    out.m_83.y = _1881;
    out.m_83.z = _1883;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1657 = false;
    bool _472 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1940 = as_type<float>(_122);
        out.gl_Position.z = _1940;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_49.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _116 = _142;
    }
    float _144 = _116;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2009 = as_type<float>(_158);
        out.gl_Position.z = _2009;
    }
    if (_150)
    {
        return out;
    }
    float _160 = in.m_51.y;
    float _162 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _164 = in.m_53.w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_49.x;
    float _178 = in.m_49.y;
    float _180 = in.m_49.z;
    float _182 = in.m_44.x;
    float _184 = in.m_44.y;
    float _186 = in.m_44.z;
    float _188 = 0.0;
    float _190 = _162;
    if (!_174)
    {
        float _192 = _162 * _162;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    out.m_55.y = _160;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _162 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _162);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _162 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _176, _266);
    float _274 = fma(_262, _178, _268);
    float _276 = fma(_262, _180, _270);
    float _278 = fma(_272, _164, _182);
    float _280 = fma(_274, _164, _184);
    float _282 = fma(_276, _164, _186);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_57.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_106);
        float _308 = 1.0 / _306;
        float _310 = _140 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _316 = _312 + _314;
    bool _318 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _320 = isnan(_312);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _332 = _312 + _330;
    bool _334 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _336 = isnan(_312);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _354 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _356 = isnan(_312);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_328;
    float _368 = _366 + 1.0;
    float _370 = 1.0 / _352;
    float _372 = _364 * _368;
    float _374 = -_364;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _378;
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _384 = 1.0 / _348;
    float _386 = _344 * _376;
    float _388 = -_344;
    float _390 = _388 + 1.0;
    float _392 = _332 * _370;
    float _394 = _316 * _384;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _400;
    float _404 = fma(_380, _394, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _406 = fma(_398, _394, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _408 = fma(_402, _394, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _410 = _404 * _386;
    float _412 = _406 * _386;
    float _414 = _408 * _386;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _428 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[107].x, _410);
    float _430 = fma(_418, _392, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _432 = fma(_422, _392, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _434 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[107].y, _412);
    float _436 = fma(_426, _392, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _438 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[107].z, _414);
    float _440 = fma(_430, _372, _428);
    float _442 = fma(_432, _372, _434);
    float _444 = fma(_436, _372, _438);
    float _446 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[109].x, _440);
    float _448 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[109].y, _442);
    float _450 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[109].z, _444);
    bool _452 = !_382;
    float _470;
    if (!_452)
    {
        float _454 = in.m_57.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_106);
        float _476 = 1.0 / _474;
        float _478 = _140 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = in.m_53.x;
    float _484 = in.m_53.y;
    float _486 = in.m_59.x;
    float _488 = in.m_59.y;
    float _490 = in.m_59.z;
    float _492 = in.m_53.z;
    float _494 = in.m_51.x;
    float _496 = _482 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _500 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _502 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _486);
    float _504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _488);
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _508 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _510 = _500 * _502;
    float _512 = _492 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _514 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _516 = _506 * _504;
    float _518 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _490);
    float _520 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _522 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _514);
    float _524 = _516 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _526 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _508);
    float _528 = _516 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _530 = _520 * _518;
    float _532 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _522);
    float _534 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[10].x, _524);
    float _536 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
    float _538 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[8].x, _528);
    float _540 = _532 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _542 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[10].z, _534);
    float _544 = _536 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _546 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[8].z, _538);
    float _548 = in.m_57.x;
    float _550 = in.m_57.y;
    float _552 = in.m_57.z;
    float _554 = in.m_57.w;
    float _556 = _540 + _542;
    float _558 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _560 = _544 + _546;
    float _562 = _506 * _160;
    float _564 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _566 = _556 + _564;
    float _568 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _570 = _560 + _568;
    float _572 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _558);
    float _574 = _566 * _566;
    float _576 = -_494;
    float _578 = _576 + 1.0;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _582 = _580 != 0;
    float _584 = _516 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _586 = fma(_570, _570, _574);
    float _588 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _572);
    float _590 = -_562;
    float _592 = _590 + 1.0;
    float _594 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[9].x, _584);
    float _596 = sqrt(_586);
    float _598 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[9].z, _594);
    bool _600 = _554 > 0.5;
    bool _602 = _548 > 0.5;
    bool _604 = _552 > 0.5;
    int _606 = _602 ? as_type<int>(_578) : as_type<int>(_494);
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _614 = _612 != 0;
    bool _616 = _596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _620 = _618 != 0;
    int _622 = _604 ? as_type<int>(_578) : as_type<int>(_494);
    float _624 = _582 ? as_type<float>(_606) : _494;
    float _626 = _588 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _628 = _550 > 0.5;
    int _630 = _600 ? as_type<int>(_592) : as_type<int>(_562);
    float _632 = _626 + _598;
    float _634 = _620 ? as_type<float>(_622) : _494;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _638 = _636 != 0;
    int _640 = _628 ? as_type<int>(_592) : as_type<int>(_562);
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _644 = _642 != 0;
    bool _646 = !_638;
    float _648 = _646 ? _562 : as_type<float>(_640);
    bool _650 = !_644;
    float _652 = _650 ? _562 : as_type<float>(_630);
    float _654 = _494;
    float _656 = _562;
    float _658 = _578;
    float _660 = _626;
    float _662 = _592;
    float _664 = _596;
    float _666 = _550;
    if (_610)
    {
        float _668 = _628 ? _578 : _494;
        _654 = _668;
    }
    float _670 = _654;
    float _672 = _670;
    if (_614)
    {
        float _674 = _604 ? _592 : _562;
        _656 = _674;
    }
    float _676 = _656;
    if (!_616)
    {
        _658 = _560;
    }
    float _678 = _658;
    float _680 = _678;
    if (!_616)
    {
        _660 = _556;
    }
    float _682 = _660;
    float _684 = _682;
    if (!_616)
    {
        _662 = _632;
    }
    float _686 = _662;
    bool _688 = !_616;
    float _690 = _686;
    if (!_688)
    {
        float _692 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _694 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _696 = _596 + _694;
        float _698 = _632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _700 = rsqrt(_586);
        float _702 = _696 * _692;
        float _704 = _702 * 0.15915493667125701904296875;
        float _706 = _704 * 6.283185482025146484375;
        float _708 = cos(_706);
        float _710 = _704 * 6.283185482025146484375;
        float _712 = sin(_710);
        float _714 = _708 + (-1.0);
        float _716 = _714 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _718 = fma(_712, _698, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _720 = fma(_632, _708, _716);
        float _722 = _700 * _718;
        float _724 = fma(_570, _722, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _726 = fma(_566, _722, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _690 = _720;
        _680 = _724;
        _684 = _726;
        _664 = _696;
    }
    float _728 = _690;
    float _730 = _680;
    float _732 = _684;
    float _734 = _664;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _738 = _728 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _742 = _730 + _740;
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _746 = _732 + _744;
    float _748 = _738 * _738;
    float _750 = fma(_742, _742, _748);
    float _752 = fma(_746, _746, _750);
    float _754 = rsqrt(_752);
    float _756 = _754 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _758 = _742 * _756;
    float _760 = _746 * _756;
    float _762 = _758 * _758;
    float _764 = _760 * _760;
    float _766 = _762 + _764;
    float _768 = sqrt(_766);
    bool _770 = _768 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _772 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _774 = _768 + _772;
    float _776 = _586;
    float _778 = _766;
    float _780 = _774;
    float _782 = _734;
    float _784 = _738;
    float _786 = _756;
    float _788 = _758;
    if (_770)
    {
        float _790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _776 = _790;
    }
    float _792 = _776;
    if (_770)
    {
        float _794 = rsqrt(_766);
        _778 = _794;
    }
    float _796 = _778;
    float _798 = _792;
    float _800 = _796;
    if (_770)
    {
        float _802 = _774 * _792;
        _780 = _802;
    }
    float _804 = _780;
    if (_770)
    {
        float _806 = _804 * 0.15915493667125701904296875;
        _782 = _806;
    }
    float _808 = _782;
    float _810 = _746;
    if (_770)
    {
        float _812 = _808 * 6.283185482025146484375;
        float _814 = sin(_812);
        _810 = _814;
    }
    float _816 = _810;
    float _818 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _820 = precise::max(0.0, _818);
    float _822 = _632;
    float _824 = _820;
    if (_770)
    {
        float _826 = _808 * 6.283185482025146484375;
        float _828 = cos(_826);
        _822 = _828;
    }
    float _830 = _822;
    float _832 = -_756;
    float _834 = -_820;
    float _836 = fma(_738, _832, _834);
    if (_770)
    {
        float _838 = _836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _784 = _838;
    }
    float _840 = _784;
    float _842 = _728 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _844 = _816;
    float _846 = _840;
    if (_770)
    {
        float _848 = fma(_816, _840, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _844 = _848;
    }
    float _850 = _844;
    float _852 = _850;
    if (!_770)
    {
        _846 = _760;
    }
    float _854 = _846;
    float _856 = _854;
    float _858 = _830;
    if (_770)
    {
        float _860 = _830 + (-1.0);
        _824 = _860;
    }
    float _862 = _824;
    if (_770)
    {
        float _864 = _796 * _850;
        _786 = _864;
    }
    float _866 = _786;
    if (!_770)
    {
        _852 = _836;
    }
    float _868 = _852;
    float _870 = _868;
    if (_770)
    {
        float _872 = _862 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _798 = _872;
    }
    float _874 = _798;
    if (_770)
    {
        float _876 = _758 * _866;
        _788 = _876;
    }
    float _878 = _788;
    if (!_770)
    {
        _800 = _762;
    }
    float _880 = _800;
    float _882 = _880;
    if (_770)
    {
        float _884 = _760 * _866;
        _856 = _884;
    }
    float _886 = _856;
    if (_770)
    {
        float _888 = fma(_836, _830, _874);
        _870 = _888;
    }
    float _890 = _870;
    if (_770)
    {
        float _892 = _878 * _878;
        _882 = _892;
    }
    float _894 = _882;
    if (!_770)
    {
        _858 = _764;
    }
    float _896 = _858;
    float _898 = _896;
    if (_770)
    {
        float _900 = _886 * _886;
        _898 = _900;
    }
    float _902 = _898;
    float _904 = sqrt(_752);
    float _906 = fma(_890, _890, _894);
    float _908 = _728 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _910 = _906 + _902;
    float _912 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[2].x, _842);
    float _914 = _728 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _916 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[3].x, _908);
    float _918 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _920 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[2].z, _912);
    float _922 = rsqrt(_910);
    float _924 = _728 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _926 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[1].x, _914);
    float _928 = _920 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _930 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[3].z, _916);
    float _932 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[0].x, _924);
    float _934 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _936 = fma(_904, (*spvDescriptorSet0.vp_c15)._m0[23].w, _934);
    float _938 = precise::clamp(_936, 0.0, 1.0);
    float _940 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[1].z, _926);
    float _942 = _928 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _944 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[0].z, _932);
    float _946 = -_938;
    float _948 = _946 + 1.0;
    float _950 = _940 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _952 = -_942;
    float _954 = fma(_952, _918, 1.0);
    float _956 = _944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _958 = _930 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _960 = _950 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _962 = _922 * _878;
    float _964 = abs(_948);
    float _966 = log2(_964);
    float _968 = _922 * _890;
    float _970 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[7].x, _960);
    float _972 = _962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _974 = _922 * _886;
    float _976 = _968 + 1.0;
    float _978 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _970);
    float _980 = -_972;
    float _982 = fma(_968, (*spvDescriptorSet0.vp_c15)._m0[21].y, _980);
    float _984 = log2(_954);
    float _986 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[7].w, _978);
    float _988 = -_974;
    float _990 = fma(_988, (*spvDescriptorSet0.vp_c15)._m0[21].z, _982);
    float _992 = _950 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _994 = _950 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _996 = fma(_990, -0.5, 0.5);
    float _998 = _966 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1000 = 1.0 / _986;
    float _1002 = fma(_990, 0.5, 0.5);
    float _1004 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[4].x, _992);
    float _1006 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[5].x, _994);
    float _1008 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1004);
    float _1010 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1006);
    float _1012 = exp2(_998);
    float _1014 = _984 * 0.693147182464599609375;
    float _1016 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1008);
    float _1018 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1010);
    float _1020 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1022 = sqrt(_996);
    float _1024 = fma(_1002, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1026 = _1016 * _1000;
    float _1028 = _1018 * _1000;
    float _1030 = fma(_1002, _1024, -0.212114393711090087890625);
    float _1032 = fma(_1026, 0.5, 0.5);
    float _1034 = fma(_1028, -0.5, 0.5);
    float _1036 = -_968;
    float _1038 = fma(_1012, _976, _1036);
    float _1040 = fma(_1002, _1030, 1.570728778839111328125);
    float _1042 = fma(_1038, 0.5, 0.5);
    float _1044 = _1022 * 0.636619746685028076171875;
    float3 _3461 = float3(_1032, _1034, _1020);
    float _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3461, float3(0.0), isnan(_3461)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3461, float3(0.0), isnan(_3461)), level(0.0)).x;
    float _1048 = -_1040;
    float _1050 = fma(_1044, _1048, 1.0);
    float3 _3477 = float3(_1032, _1034, _1020);
    float4 _1053 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3477, float3(0.0), isnan(_3477)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3477, float3(0.0), isnan(_3477)), level(0.0)).xyzw;
    float _1055 = _1053.x;
    float _1057 = _1053.y;
    float _1059 = _1053.z;
    float _1061 = _1053.w;
    float2 _3494 = float2(_1050, _1042);
    float3 _1065 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3494, float2(0.0), isnan(_3494)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3494, float2(0.0), isnan(_3494)), level(0.0)).xyz;
    float _1067 = _1065.x;
    float _1069 = _1065.y;
    float _1071 = _1065.z;
    float _1073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1075 = _950 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = _730;
    out.m_61.y = _728;
    out.m_61.z = _732;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1085 = _548 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_63.x = (*spvDescriptorSet0.vp_c10)._m0[8].x;
    out.m_63.y = (*spvDescriptorSet0.vp_c10)._m0[9].x;
    out.m_63.z = (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _1087 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1089 = 1.0 / _1079;
    float _1091 = -_1081;
    float _1093 = fma(_1085, 2.0, _1091);
    int _1095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1097 = _1095 != 0;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1101 = _550 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1109 = fma(_624, _1087, -0.5);
    float _1111 = fma(_1101, -2.0, _1099);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1113;
    float _1117 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1119 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1129 = _1115 * _1089;
    float _1131 = fma(_634, _1123, -0.5);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1135 = _480 + _1133;
    out.m_65.x = _1117;
    out.m_65.y = _1119;
    out.m_65.z = _1121;
    bool _1137 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1139 = isnan(_480);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    bool _1149 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1151 = isnan(_480);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = fma(_1129, _1135, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1163 = -_1147;
    float _1165 = _1163 + 1.0;
    bool _1167 = _488 != 0.0;
    bool _1169 = isnan(_488);
    bool _1171 = _1167 || _1169;
    bool _1173 = isnan(0.0);
    bool _1175 = _1171 || _1173;
    float _1177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1179 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1181 = _486 == 0.0;
    bool _1183 = !_1175;
    bool _1185 = _1181 && _1183;
    float _1187 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1127);
    float _1189 = _1117;
    float _1191 = _1093;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    float _1195 = _986;
    float _1197 = _1018;
    float _1199 = _1016;
    if (_1097)
    {
        _1189 = _548;
    }
    float _1201 = _1189;
    float _1203 = -_140;
    float _1205 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1093);
    float _1207 = -_1159;
    float _1209 = _1207 + 1.0;
    float _1211 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1187);
    float _1213 = _1201;
    if (!_1097)
    {
        _1213 = _552;
    }
    float _1215 = _1213;
    float _1217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_1097)
    {
        _1191 = _550;
    }
    float _1219 = _1191;
    float _1221 = fma(_1211, _1109, _1205);
    float _1223 = _1147 * _1209;
    float _1225 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1227 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1229 = _1161 * _1223;
    float _1231 = -_1179;
    float _1233 = fma(_1225, 2.0, _1231);
    float _1235 = fma(_1227, _670, -0.5);
    float _1237 = _1219;
    if (_1097)
    {
        _1237 = _548;
    }
    float _1239 = _1237;
    float _1241 = in.m_67.x;
    float _1243 = in.m_67.y;
    float _1245 = in.m_67.z;
    float _1247 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1229);
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1251 = -_140;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1233);
    bool _1255 = _490 == 0.0;
    bool _1257 = _1255 && _1185;
    float _1259 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1249);
    float _1261 = _1249;
    if (!_1097)
    {
        _672 = _552;
    }
    float _1263 = _672;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1267 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1269 = _1263;
    int _1271 = as_type<int>(_1265);
    if (_1097)
    {
        _1269 = _550;
    }
    float _1273 = _1269;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1277 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1279 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1247);
    float _1281 = 0.0;
    float _1283 = _1275;
    if (!_1097)
    {
        _1281 = _552;
    }
    float _1285 = _1281;
    float _1287 = -_1265;
    float _1289 = fma(_1267, 2.0, _1287);
    float _1291 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1275);
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1299 = _1285;
    float _1301 = _1293;
    if (_1097)
    {
        _1299 = _550;
    }
    float _1303 = _1299;
    float _1305 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1293);
    float _1307 = _1243;
    float _1309 = _1241;
    if (_1257)
    {
        _1283 = _1243;
    }
    float _1311 = _1283;
    float _1313 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1295);
    float _1315 = _1311;
    if (_1257)
    {
        _1193 = _1245;
    }
    float _1317 = _1193;
    float _1319 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1297);
    float _1321 = _1317;
    if (!_1097)
    {
        _666 = _548;
    }
    float _1323 = _666;
    if (_1257)
    {
        float _1325 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1311);
        _1271 = as_type<int>(_1325);
    }
    int _1327 = _1271;
    int _1329 = _1327;
    if (_1257)
    {
        _1301 = _1311;
    }
    float _1331 = _1301;
    float _1333 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1305);
    float _1335 = _1331;
    if (_1257)
    {
        float _1337 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1317);
        _1261 = _1337;
    }
    float _1339 = _1261;
    float _1341 = _1339;
    if (!_1257)
    {
        _1315 = _1243;
    }
    float _1343 = _1315;
    float _1345 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_1257)
    {
        _1307 = _1317;
    }
    float _1347 = _1307;
    float _1349 = _1347;
    if (!_1257)
    {
        float _1351 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1241);
        _1309 = _1351;
    }
    float _1353 = _1309;
    if (!_1257)
    {
        _1321 = _1245;
    }
    float _1355 = _1321;
    float _1357 = fma(_1333, _1235, _1253);
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1361 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (!_1257)
    {
        float _1365 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1343);
        _1329 = as_type<int>(_1365);
    }
    int _1367 = _1329;
    float _1369 = fma(_648, _1277, -0.5);
    float _1371 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1313);
    float _1373 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1111);
    float _1375 = fma(_652, _1361, -0.5);
    float _1377 = fma(_1345, -2.0, _1359);
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1381 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1383 = -_1373;
    float _1385 = fma(_1371, _1369, _1383);
    if (!_1257)
    {
        float _1387 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1355);
        _1341 = _1387;
    }
    float _1389 = _1341;
    bool _1391 = !_1257;
    float _1393 = _1391 ? as_type<float>(_1367) : _1343;
    float _1395 = fma(_1381, -2.0, _1379);
    float _1397 = _448 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1399 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1259);
    float _1401 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1403 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (!_1257)
    {
        _1349 = _1389;
    }
    float _1405 = _1349;
    float _1407 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1395);
    float _1409 = fma(_1401, _676, -0.5);
    float _1411 = _1279 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1413 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1319);
    bool _1415 = !_1257;
    float _1417 = _1415 ? _1389 : _1355;
    float _1419 = _966 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1421 = _1393 * _1393;
    float _1423 = -_140;
    float _1425 = fma(_1423, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1289);
    float _1427 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1291);
    float _1429 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1377);
    float _1431 = -_1407;
    float _1433 = fma(_1413, _1409, _1431);
    float _1435 = fma(_1417, _1417, _1421);
    float _1437 = exp2(_1419);
    float _1439 = fma(_1399, _1131, _1425);
    float _1441 = _450 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (!_1257)
    {
        _1335 = as_type<float>(_1367);
    }
    float _1443 = _1335;
    float _1445 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1449 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1451 = -_1429;
    float _1453 = fma(_1427, _1375, _1451);
    float _1455 = rsqrt(_1435);
    float _1457 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1075);
    float _1459 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1461 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1463 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_69.x = _1445;
    out.m_69.y = _1447;
    out.m_69.z = _1449;
    out.m_69.w = _1411;
    float _1465 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1459);
    float _1467 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1461);
    float _1469 = -_1437;
    float _1471 = _1469 + 1.0;
    float _1473 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1457);
    float _1475 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1463);
    float _1477 = _1357 + 0.5;
    float _1479 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1481 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1473);
    float _1483 = _1433 + 0.5;
    float _1485 = _1393 * _1455;
    float _1487 = _1417 * _1455;
    bool _1489 = _904 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1491 = isnan(_904);
    bool _1493 = _1489 || _1491;
    bool _1495 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1497 = _1493 || _1495;
    float _1499 = _1221 + 0.5;
    float _1501 = _1439 + 0.5;
    float _1503 = _1385 + 0.5;
    float _1505 = _1453 + 0.5;
    float _1507 = -(*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1509 = _1485 * _1507;
    float _1511 = -(*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1513 = _1485 * _1511;
    float _1515 = -(*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1517 = _1485 * _1515;
    out.m_71.x = _1477;
    out.m_71.y = _1483;
    float _1519 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1509);
    float _1521 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1513);
    float _1523 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1517);
    out.m_73.x = _1499;
    out.m_73.y = _1503;
    out.m_73.z = _1501;
    out.m_73.w = _1505;
    out.m_75.x = _1521;
    out.m_75.y = _1519;
    out.m_75.z = _1523;
    out.gl_Position.x = _1016;
    out.gl_Position.y = _1018;
    out.gl_Position.z = _1481;
    out.gl_Position.w = _986;
    float _1525 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1475);
    float _1527 = _1481 + _986;
    float _1529 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1467);
    float _1531 = _1521;
    float _1533 = _1481;
    if (!_1497)
    {
        _1531 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1535 = _1531;
    float _1537 = _1527 * 0.5;
    float _1539 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1465);
    float _1541 = _1535;
    float _1543 = _1535;
    if (!_1497)
    {
        _1195 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1545 = _1195;
    out.m_77.z = _1537;
    out.m_77.w = _986;
    float _1547 = _1545;
    float _1549 = _1545;
    if (!_1497)
    {
        _1533 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1551 = _1533;
    float _1553 = _1551;
    float _1555 = _1551;
    if (!_1497)
    {
        _1197 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1557 = _1197;
    out.m_79.x = _1539;
    out.m_79.y = _1529;
    out.m_79.z = _1525;
    float _1559 = _1557;
    float _1561 = _1557;
    if (!_1497)
    {
        _1199 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1563 = _1199;
    float _1565 = _1479 * _1046;
    float _1567 = -_1479;
    float _1569 = _1567 + 1.0;
    float _1571 = _1061 * _1565;
    float _1573 = _1061 * _1569;
    float _1575 = _1071 * _1565;
    float _1577 = fma(_1067, _1571, _1055);
    float _1579 = fma(_1069, _1571, _1057);
    float _1581 = _1571;
    float _1583 = _1563;
    float _1585 = _1563;
    if (!_1497)
    {
        _1581 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1587 = _1581;
    float _1589 = fma(_1061, _1575, _1059);
    out.m_81.x = _1577;
    out.m_81.y = _1579;
    out.m_81.z = _1589;
    out.m_81.w = _1573;
    bool _1591 = !_1497;
    float _1593 = _1587;
    float _1595 = _1587;
    if (!_1591)
    {
        bool _1597 = _904 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1599 = isnan(_904);
        bool _1601 = _1597 || _1599;
        bool _1603 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1605 = _1601 || _1603;
        if (!_1605)
        {
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1609 = _904 + _1607;
            float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1613 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1611;
            float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1619 = 1.0 / _1613;
            float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1623 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1627 = _1625 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1631 = _1629 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1635 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1637 = _1609 * _1619;
            float _1639 = precise::clamp(_1637, 0.0, 1.0);
            float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1643 = _1641 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1645 = fma(_1639, _1617, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1647 = fma(_1639, _1643, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1649 = fma(_1639, _1623, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1651 = fma(_1639, _1627, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1653 = fma(_1639, _1631, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1655 = fma(_1639, _1635, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1543 = _1649;
            _1561 = _1653;
            _1595 = _1645;
            _1555 = _1651;
            _1549 = _1647;
            _1585 = _1655;
            _1657 = true;
        }
        else
        {
            bool _1659 = _904 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1661 = isnan(_904);
            bool _1663 = _1659 || _1661;
            bool _1665 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1667 = _1663 || _1665;
            if (!_1667)
            {
                _1593 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1669 = _1593;
            _1595 = _1669;
            if (!_1667)
            {
                _1541 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1671 = _1541;
            _1543 = _1671;
            if (!_1667)
            {
                _1547 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1673 = _1547;
            _1549 = _1673;
            if (!_1667)
            {
                _1553 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1675 = _1553;
            _1555 = _1675;
            if (!_1667)
            {
                _1559 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1677 = _1559;
            _1561 = _1677;
            if (!_1667)
            {
                _1583 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1679 = _1583;
            bool _1681 = !_1667;
            _1585 = _1679;
            if (!_1681)
            {
                bool _1683 = _904 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1685 = isnan(_904);
                bool _1687 = _1683 || _1685;
                bool _1689 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1691 = _1687 || _1689;
                if (!_1691)
                {
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1695 = _904 + _1693;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1699 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1697;
                    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1705 = 1.0 / _1699;
                    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1721 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1723 = _1695 * _1705;
                    float _1725 = precise::clamp(_1723, 0.0, 1.0);
                    float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1729 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1731 = fma(_1725, _1703, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1733 = fma(_1725, _1729, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1735 = fma(_1725, _1709, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1737 = fma(_1725, _1713, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1739 = fma(_1725, _1717, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1741 = fma(_1725, _1721, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1543 = _1735;
                    _1561 = _1739;
                    _1595 = _1731;
                    _1555 = _1737;
                    _1549 = _1733;
                    _1585 = _1741;
                    _1657 = true;
                }
                else
                {
                    _1543 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1561 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1595 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1555 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1549 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1585 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1657 = false;
    float _1743 = _1543;
    float _1745 = _1561;
    float _1747 = _1595;
    float _1749 = _1555;
    float _1751 = _1549;
    float _1753 = _1585;
    float _1755 = fma(_1529, -0.5, 0.5);
    float _1757 = precise::clamp(_1755, 0.0, 1.0);
    float _1759 = -_1743;
    float _1761 = _1759 + _1745;
    float _1763 = -_1747;
    float _1765 = _1763 + _1749;
    float _1767 = -_1751;
    float _1769 = _1767 + _1753;
    bool _1771 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1773 = fma(_1757, _1761, _1743);
    float _1775 = fma(_1757, _1765, _1747);
    float _1777 = fma(_1757, _1769, _1751);
    float _1779 = _1773 * 0.586610972881317138671875;
    out.m_83.x = 0.0;
    float _1781 = fma(_1775, 0.298911988735198974609375, _1779);
    out.m_85.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1783 = fma(_1777, 0.114477999508380889892578125, _1781);
    out.m_47.x = 1.0;
    float _1785 = -_1783;
    float _1787 = _1775 + _1785;
    float _1789 = -_1783;
    float _1791 = _1773 + _1789;
    float _1793 = -_1783;
    float _1795 = _1777 + _1793;
    float _1797 = fma(_1787, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    float _1799 = fma(_1791, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    float _1801 = fma(_1795, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    out.m_87.x = _1797;
    out.m_87.y = _1799;
    out.m_87.z = _1801;
    if (!_1771)
    {
        return out;
    }
    float _1803 = -_728;
    float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1807 = -_730;
    float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1811 = -_732;
    float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1815 = _1805 * _1805;
    float _1817 = fma(_1809, _1809, _1815);
    float _1819 = fma(_1813, _1813, _1817);
    float _1821 = sqrt(_1819);
    float _1823 = rsqrt(_1819);
    float _1825 = -_1821;
    float _1827 = _1825 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1829 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1831 = precise::clamp(_1829, 0.0, 1.0);
    float _1833 = _1809 * _1823;
    float _1835 = _1805 * _1823;
    float _1837 = abs(_1831);
    float _1839 = log2(_1837);
    float _1841 = _1813 * _1823;
    float _1843 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1845 = _1529 * _1835;
    float _1847 = -_1835;
    float _1849 = -_1843;
    float _1851 = fma(_1847, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1849);
    float _1853 = fma(_1539, _1833, _1845);
    float _1855 = -_1841;
    float _1857 = fma(_1855, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1851);
    float _1859 = fma(_1525, _1841, _1853);
    float _1861 = precise::clamp(_1859, 0.0, 1.0);
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1865 = _1857 + _1863;
    float _1867 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1869 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1871 = precise::clamp(_1869, 0.0, 1.0);
    float _1873 = exp2(_1867);
    float _1875 = _1873 * _1871;
    float _1877 = _1861 * _1875;
    float _1879 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1881 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1883 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _1879;
    out.m_83.y = _1881;
    out.m_83.z = _1883;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1657 = false;
    bool _472 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1940 = as_type<float>(_122);
        out.gl_Position.z = _1940;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_49.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _116 = _142;
    }
    float _144 = _116;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2009 = as_type<float>(_158);
        out.gl_Position.z = _2009;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_51.y;
    float _162 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _164 = in.m_53.w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_49.x;
    float _178 = in.m_49.y;
    float _180 = in.m_49.z;
    float _182 = in.m_44.x;
    float _184 = in.m_44.y;
    float _186 = in.m_44.z;
    float _188 = 0.0;
    float _190 = _162;
    if (!_174)
    {
        float _192 = _162 * _162;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    out.m_55.y = _160;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _162 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _162);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _162 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _176, _266);
    float _274 = fma(_262, _178, _268);
    float _276 = fma(_262, _180, _270);
    float _278 = fma(_272, _164, _182);
    float _280 = fma(_274, _164, _184);
    float _282 = fma(_276, _164, _186);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_57.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_106);
        float _308 = 1.0 / _306;
        float _310 = _140 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _316 = _312 + _314;
    bool _318 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _320 = isnan(_312);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _332 = _312 + _330;
    bool _334 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _336 = isnan(_312);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _354 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _356 = isnan(_312);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_328;
    float _368 = _366 + 1.0;
    float _370 = 1.0 / _352;
    float _372 = _364 * _368;
    float _374 = -_364;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _378;
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _384 = 1.0 / _348;
    float _386 = _344 * _376;
    float _388 = -_344;
    float _390 = _388 + 1.0;
    float _392 = _332 * _370;
    float _394 = _316 * _384;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _400;
    float _404 = fma(_380, _394, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _406 = fma(_398, _394, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _408 = fma(_402, _394, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _410 = _404 * _386;
    float _412 = _406 * _386;
    float _414 = _408 * _386;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _428 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[107].x, _410);
    float _430 = fma(_418, _392, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _432 = fma(_422, _392, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _434 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[107].y, _412);
    float _436 = fma(_426, _392, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _438 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[107].z, _414);
    float _440 = fma(_430, _372, _428);
    float _442 = fma(_432, _372, _434);
    float _444 = fma(_436, _372, _438);
    float _446 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[109].x, _440);
    float _448 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[109].y, _442);
    float _450 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[109].z, _444);
    bool _452 = !_382;
    float _470;
    if (!_452)
    {
        float _454 = in.m_57.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_106);
        float _476 = 1.0 / _474;
        float _478 = _140 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = in.m_53.x;
    float _484 = in.m_53.y;
    float _486 = in.m_59.x;
    float _488 = in.m_59.y;
    float _490 = in.m_59.z;
    float _492 = in.m_53.z;
    float _494 = in.m_51.x;
    float _496 = _482 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _500 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _502 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _486);
    float _504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _488);
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _508 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _510 = _500 * _502;
    float _512 = _492 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _514 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _516 = _506 * _504;
    float _518 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _490);
    float _520 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _522 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _514);
    float _524 = _516 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _526 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _508);
    float _528 = _516 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _530 = _520 * _518;
    float _532 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _522);
    float _534 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[10].x, _524);
    float _536 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _526);
    float _538 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[8].x, _528);
    float _540 = _532 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _542 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[10].z, _534);
    float _544 = _536 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _546 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[8].z, _538);
    float _548 = in.m_57.x;
    float _550 = in.m_57.y;
    float _552 = in.m_57.z;
    float _554 = in.m_57.w;
    float _556 = _540 + _542;
    float _558 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _560 = _544 + _546;
    float _562 = _506 * _160;
    float _564 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _566 = _556 + _564;
    float _568 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _570 = _560 + _568;
    float _572 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _558);
    float _574 = _566 * _566;
    float _576 = -_494;
    float _578 = _576 + 1.0;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _582 = _580 != 0;
    float _584 = _516 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _586 = fma(_570, _570, _574);
    float _588 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _572);
    float _590 = -_562;
    float _592 = _590 + 1.0;
    float _594 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[9].x, _584);
    float _596 = sqrt(_586);
    float _598 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[9].z, _594);
    bool _600 = _554 > 0.5;
    bool _602 = _548 > 0.5;
    bool _604 = _552 > 0.5;
    int _606 = _602 ? as_type<int>(_578) : as_type<int>(_494);
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _614 = _612 != 0;
    bool _616 = _596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _620 = _618 != 0;
    int _622 = _604 ? as_type<int>(_578) : as_type<int>(_494);
    float _624 = _582 ? as_type<float>(_606) : _494;
    float _626 = _588 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _628 = _550 > 0.5;
    int _630 = _600 ? as_type<int>(_592) : as_type<int>(_562);
    float _632 = _626 + _598;
    float _634 = _620 ? as_type<float>(_622) : _494;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _638 = _636 != 0;
    int _640 = _628 ? as_type<int>(_592) : as_type<int>(_562);
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _644 = _642 != 0;
    bool _646 = !_638;
    float _648 = _646 ? _562 : as_type<float>(_640);
    bool _650 = !_644;
    float _652 = _650 ? _562 : as_type<float>(_630);
    float _654 = _494;
    float _656 = _562;
    float _658 = _578;
    float _660 = _626;
    float _662 = _592;
    float _664 = _596;
    float _666 = _550;
    if (_610)
    {
        float _668 = _628 ? _578 : _494;
        _654 = _668;
    }
    float _670 = _654;
    float _672 = _670;
    if (_614)
    {
        float _674 = _604 ? _592 : _562;
        _656 = _674;
    }
    float _676 = _656;
    if (!_616)
    {
        _658 = _560;
    }
    float _678 = _658;
    float _680 = _678;
    if (!_616)
    {
        _660 = _556;
    }
    float _682 = _660;
    float _684 = _682;
    if (!_616)
    {
        _662 = _632;
    }
    float _686 = _662;
    bool _688 = !_616;
    float _690 = _686;
    if (!_688)
    {
        float _692 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _694 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _696 = _596 + _694;
        float _698 = _632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _700 = rsqrt(_586);
        float _702 = _696 * _692;
        float _704 = _702 * 0.15915493667125701904296875;
        float _706 = _704 * 6.283185482025146484375;
        float _708 = cos(_706);
        float _710 = _704 * 6.283185482025146484375;
        float _712 = sin(_710);
        float _714 = _708 + (-1.0);
        float _716 = _714 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _718 = fma(_712, _698, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _720 = fma(_632, _708, _716);
        float _722 = _700 * _718;
        float _724 = fma(_570, _722, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _726 = fma(_566, _722, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _690 = _720;
        _680 = _724;
        _684 = _726;
        _664 = _696;
    }
    float _728 = _690;
    float _730 = _680;
    float _732 = _684;
    float _734 = _664;
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _738 = _728 + _736;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _742 = _730 + _740;
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _746 = _732 + _744;
    float _748 = _738 * _738;
    float _750 = fma(_742, _742, _748);
    float _752 = fma(_746, _746, _750);
    float _754 = rsqrt(_752);
    float _756 = _754 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _758 = _742 * _756;
    float _760 = _746 * _756;
    float _762 = _758 * _758;
    float _764 = _760 * _760;
    float _766 = _762 + _764;
    float _768 = sqrt(_766);
    bool _770 = _768 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _772 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _774 = _768 + _772;
    float _776 = _586;
    float _778 = _766;
    float _780 = _774;
    float _782 = _734;
    float _784 = _738;
    float _786 = _756;
    float _788 = _758;
    if (_770)
    {
        float _790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _776 = _790;
    }
    float _792 = _776;
    if (_770)
    {
        float _794 = rsqrt(_766);
        _778 = _794;
    }
    float _796 = _778;
    float _798 = _792;
    float _800 = _796;
    if (_770)
    {
        float _802 = _774 * _792;
        _780 = _802;
    }
    float _804 = _780;
    if (_770)
    {
        float _806 = _804 * 0.15915493667125701904296875;
        _782 = _806;
    }
    float _808 = _782;
    float _810 = _746;
    if (_770)
    {
        float _812 = _808 * 6.283185482025146484375;
        float _814 = sin(_812);
        _810 = _814;
    }
    float _816 = _810;
    float _818 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _820 = precise::max(0.0, _818);
    float _822 = _632;
    float _824 = _820;
    if (_770)
    {
        float _826 = _808 * 6.283185482025146484375;
        float _828 = cos(_826);
        _822 = _828;
    }
    float _830 = _822;
    float _832 = -_756;
    float _834 = -_820;
    float _836 = fma(_738, _832, _834);
    if (_770)
    {
        float _838 = _836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _784 = _838;
    }
    float _840 = _784;
    float _842 = _728 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _844 = _816;
    float _846 = _840;
    if (_770)
    {
        float _848 = fma(_816, _840, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _844 = _848;
    }
    float _850 = _844;
    float _852 = _850;
    if (!_770)
    {
        _846 = _760;
    }
    float _854 = _846;
    float _856 = _854;
    float _858 = _830;
    if (_770)
    {
        float _860 = _830 + (-1.0);
        _824 = _860;
    }
    float _862 = _824;
    if (_770)
    {
        float _864 = _796 * _850;
        _786 = _864;
    }
    float _866 = _786;
    if (!_770)
    {
        _852 = _836;
    }
    float _868 = _852;
    float _870 = _868;
    if (_770)
    {
        float _872 = _862 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _798 = _872;
    }
    float _874 = _798;
    if (_770)
    {
        float _876 = _758 * _866;
        _788 = _876;
    }
    float _878 = _788;
    if (!_770)
    {
        _800 = _762;
    }
    float _880 = _800;
    float _882 = _880;
    if (_770)
    {
        float _884 = _760 * _866;
        _856 = _884;
    }
    float _886 = _856;
    if (_770)
    {
        float _888 = fma(_836, _830, _874);
        _870 = _888;
    }
    float _890 = _870;
    if (_770)
    {
        float _892 = _878 * _878;
        _882 = _892;
    }
    float _894 = _882;
    if (!_770)
    {
        _858 = _764;
    }
    float _896 = _858;
    float _898 = _896;
    if (_770)
    {
        float _900 = _886 * _886;
        _898 = _900;
    }
    float _902 = _898;
    float _904 = sqrt(_752);
    float _906 = fma(_890, _890, _894);
    float _908 = _728 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _910 = _906 + _902;
    float _912 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[2].x, _842);
    float _914 = _728 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _916 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[3].x, _908);
    float _918 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _920 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[2].z, _912);
    float _922 = rsqrt(_910);
    float _924 = _728 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _926 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[1].x, _914);
    float _928 = _920 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _930 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[3].z, _916);
    float _932 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[0].x, _924);
    float _934 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _936 = fma(_904, (*spvDescriptorSet0.vp_c15)._m0[23].w, _934);
    float _938 = precise::clamp(_936, 0.0, 1.0);
    float _940 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[1].z, _926);
    float _942 = _928 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _944 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[0].z, _932);
    float _946 = -_938;
    float _948 = _946 + 1.0;
    float _950 = _940 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _952 = -_942;
    float _954 = fma(_952, _918, 1.0);
    float _956 = _944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _958 = _930 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _960 = _950 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _962 = _922 * _878;
    float _964 = abs(_948);
    float _966 = log2(_964);
    float _968 = _922 * _890;
    float _970 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[7].x, _960);
    float _972 = _962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _974 = _922 * _886;
    float _976 = _968 + 1.0;
    float _978 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _970);
    float _980 = -_972;
    float _982 = fma(_968, (*spvDescriptorSet0.vp_c15)._m0[21].y, _980);
    float _984 = log2(_954);
    float _986 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[7].w, _978);
    float _988 = -_974;
    float _990 = fma(_988, (*spvDescriptorSet0.vp_c15)._m0[21].z, _982);
    float _992 = _950 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _994 = _950 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _996 = fma(_990, -0.5, 0.5);
    float _998 = _966 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1000 = 1.0 / _986;
    float _1002 = fma(_990, 0.5, 0.5);
    float _1004 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[4].x, _992);
    float _1006 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[5].x, _994);
    float _1008 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1004);
    float _1010 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1006);
    float _1012 = exp2(_998);
    float _1014 = _984 * 0.693147182464599609375;
    float _1016 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1008);
    float _1018 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1010);
    float _1020 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1022 = sqrt(_996);
    float _1024 = fma(_1002, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1026 = _1016 * _1000;
    float _1028 = _1018 * _1000;
    float _1030 = fma(_1002, _1024, -0.212114393711090087890625);
    float _1032 = fma(_1026, 0.5, 0.5);
    float _1034 = fma(_1028, -0.5, 0.5);
    float _1036 = -_968;
    float _1038 = fma(_1012, _976, _1036);
    float _1040 = fma(_1002, _1030, 1.570728778839111328125);
    float _1042 = fma(_1038, 0.5, 0.5);
    float _1044 = _1022 * 0.636619746685028076171875;
    float3 _3461 = float3(_1032, _1034, _1020);
    float _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3461, float3(0.0), isnan(_3461)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3461, float3(0.0), isnan(_3461)), level(0.0)).x;
    float _1048 = -_1040;
    float _1050 = fma(_1044, _1048, 1.0);
    float3 _3477 = float3(_1032, _1034, _1020);
    float4 _1053 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3477, float3(0.0), isnan(_3477)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3477, float3(0.0), isnan(_3477)), level(0.0)).xyzw;
    float _1055 = _1053.x;
    float _1057 = _1053.y;
    float _1059 = _1053.z;
    float _1061 = _1053.w;
    float2 _3494 = float2(_1050, _1042);
    float3 _1065 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3494, float2(0.0), isnan(_3494)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3494, float2(0.0), isnan(_3494)), level(0.0)).xyz;
    float _1067 = _1065.x;
    float _1069 = _1065.y;
    float _1071 = _1065.z;
    float _1073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1075 = _950 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = _730;
    out.m_61.y = _728;
    out.m_61.z = _732;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1085 = _548 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_63.x = (*spvDescriptorSet0.vp_c10)._m0[8].x;
    out.m_63.y = (*spvDescriptorSet0.vp_c10)._m0[9].x;
    out.m_63.z = (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _1087 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1089 = 1.0 / _1079;
    float _1091 = -_1081;
    float _1093 = fma(_1085, 2.0, _1091);
    int _1095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1097 = _1095 != 0;
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1101 = _550 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1109 = fma(_624, _1087, -0.5);
    float _1111 = fma(_1101, -2.0, _1099);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1113;
    float _1117 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1119 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1129 = _1115 * _1089;
    float _1131 = fma(_634, _1123, -0.5);
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1135 = _480 + _1133;
    out.m_65.x = _1117;
    out.m_65.y = _1119;
    out.m_65.z = _1121;
    bool _1137 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1139 = isnan(_480);
    bool _1141 = _1137 || _1139;
    bool _1143 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1145 = _1141 || _1143;
    float _1147 = float(_1145);
    bool _1149 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1151 = isnan(_480);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = fma(_1129, _1135, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1163 = -_1147;
    float _1165 = _1163 + 1.0;
    bool _1167 = _488 != 0.0;
    bool _1169 = isnan(_488);
    bool _1171 = _1167 || _1169;
    bool _1173 = isnan(0.0);
    bool _1175 = _1171 || _1173;
    float _1177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1179 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1181 = _486 == 0.0;
    bool _1183 = !_1175;
    bool _1185 = _1181 && _1183;
    float _1187 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1127);
    float _1189 = _1117;
    float _1191 = _1093;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    float _1195 = _986;
    float _1197 = _1018;
    float _1199 = _1016;
    if (_1097)
    {
        _1189 = _548;
    }
    float _1201 = _1189;
    float _1203 = -_140;
    float _1205 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1093);
    float _1207 = -_1159;
    float _1209 = _1207 + 1.0;
    float _1211 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1187);
    float _1213 = _1201;
    if (!_1097)
    {
        _1213 = _552;
    }
    float _1215 = _1213;
    float _1217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_1097)
    {
        _1191 = _550;
    }
    float _1219 = _1191;
    float _1221 = fma(_1211, _1109, _1205);
    float _1223 = _1147 * _1209;
    float _1225 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1227 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1229 = _1161 * _1223;
    float _1231 = -_1179;
    float _1233 = fma(_1225, 2.0, _1231);
    float _1235 = fma(_1227, _670, -0.5);
    float _1237 = _1219;
    if (_1097)
    {
        _1237 = _548;
    }
    float _1239 = _1237;
    float _1241 = in.m_67.x;
    float _1243 = in.m_67.y;
    float _1245 = in.m_67.z;
    float _1247 = fma(_1165, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1229);
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1251 = -_140;
    float _1253 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1233);
    bool _1255 = _490 == 0.0;
    bool _1257 = _1255 && _1185;
    float _1259 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1249);
    float _1261 = _1249;
    if (!_1097)
    {
        _672 = _552;
    }
    float _1263 = _672;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1267 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1269 = _1263;
    int _1271 = as_type<int>(_1265);
    if (_1097)
    {
        _1269 = _550;
    }
    float _1273 = _1269;
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1277 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1279 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1247);
    float _1281 = 0.0;
    float _1283 = _1275;
    if (!_1097)
    {
        _1281 = _552;
    }
    float _1285 = _1281;
    float _1287 = -_1265;
    float _1289 = fma(_1267, 2.0, _1287);
    float _1291 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1275);
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1299 = _1285;
    float _1301 = _1293;
    if (_1097)
    {
        _1299 = _550;
    }
    float _1303 = _1299;
    float _1305 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1293);
    float _1307 = _1243;
    float _1309 = _1241;
    if (_1257)
    {
        _1283 = _1243;
    }
    float _1311 = _1283;
    float _1313 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1295);
    float _1315 = _1311;
    if (_1257)
    {
        _1193 = _1245;
    }
    float _1317 = _1193;
    float _1319 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1297);
    float _1321 = _1317;
    if (!_1097)
    {
        _666 = _548;
    }
    float _1323 = _666;
    if (_1257)
    {
        float _1325 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1311);
        _1271 = as_type<int>(_1325);
    }
    int _1327 = _1271;
    int _1329 = _1327;
    if (_1257)
    {
        _1301 = _1311;
    }
    float _1331 = _1301;
    float _1333 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1305);
    float _1335 = _1331;
    if (_1257)
    {
        float _1337 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1317);
        _1261 = _1337;
    }
    float _1339 = _1261;
    float _1341 = _1339;
    if (!_1257)
    {
        _1315 = _1243;
    }
    float _1343 = _1315;
    float _1345 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_1257)
    {
        _1307 = _1317;
    }
    float _1347 = _1307;
    float _1349 = _1347;
    if (!_1257)
    {
        float _1351 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1241);
        _1309 = _1351;
    }
    float _1353 = _1309;
    if (!_1257)
    {
        _1321 = _1245;
    }
    float _1355 = _1321;
    float _1357 = fma(_1333, _1235, _1253);
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1361 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1363 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (!_1257)
    {
        float _1365 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1343);
        _1329 = as_type<int>(_1365);
    }
    int _1367 = _1329;
    float _1369 = fma(_648, _1277, -0.5);
    float _1371 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1313);
    float _1373 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1111);
    float _1375 = fma(_652, _1361, -0.5);
    float _1377 = fma(_1345, -2.0, _1359);
    float _1379 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1381 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1383 = -_1373;
    float _1385 = fma(_1371, _1369, _1383);
    if (!_1257)
    {
        float _1387 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1355);
        _1341 = _1387;
    }
    float _1389 = _1341;
    bool _1391 = !_1257;
    float _1393 = _1391 ? as_type<float>(_1367) : _1343;
    float _1395 = fma(_1381, -2.0, _1379);
    float _1397 = _448 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1399 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1259);
    float _1401 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1403 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (!_1257)
    {
        _1349 = _1389;
    }
    float _1405 = _1349;
    float _1407 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1395);
    float _1409 = fma(_1401, _676, -0.5);
    float _1411 = _1279 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1413 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1319);
    bool _1415 = !_1257;
    float _1417 = _1415 ? _1389 : _1355;
    float _1419 = _966 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1421 = _1393 * _1393;
    float _1423 = -_140;
    float _1425 = fma(_1423, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1289);
    float _1427 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1291);
    float _1429 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1377);
    float _1431 = -_1407;
    float _1433 = fma(_1413, _1409, _1431);
    float _1435 = fma(_1417, _1417, _1421);
    float _1437 = exp2(_1419);
    float _1439 = fma(_1399, _1131, _1425);
    float _1441 = _450 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (!_1257)
    {
        _1335 = as_type<float>(_1367);
    }
    float _1443 = _1335;
    float _1445 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1447 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1449 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1451 = -_1429;
    float _1453 = fma(_1427, _1375, _1451);
    float _1455 = rsqrt(_1435);
    float _1457 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1075);
    float _1459 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1461 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1463 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_69.x = _1445;
    out.m_69.y = _1447;
    out.m_69.z = _1449;
    out.m_69.w = _1411;
    float _1465 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1459);
    float _1467 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1461);
    float _1469 = -_1437;
    float _1471 = _1469 + 1.0;
    float _1473 = fma(_928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1457);
    float _1475 = fma(_1353, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1463);
    float _1477 = _1357 + 0.5;
    float _1479 = _1471 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1481 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1473);
    float _1483 = _1433 + 0.5;
    float _1485 = _1393 * _1455;
    float _1487 = _1417 * _1455;
    bool _1489 = _904 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1491 = isnan(_904);
    bool _1493 = _1489 || _1491;
    bool _1495 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1497 = _1493 || _1495;
    float _1499 = _1221 + 0.5;
    float _1501 = _1439 + 0.5;
    float _1503 = _1385 + 0.5;
    float _1505 = _1453 + 0.5;
    float _1507 = -(*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1509 = _1485 * _1507;
    float _1511 = -(*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1513 = _1485 * _1511;
    float _1515 = -(*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1517 = _1485 * _1515;
    out.m_71.x = _1477;
    out.m_71.y = _1483;
    float _1519 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1509);
    float _1521 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1513);
    float _1523 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1517);
    out.m_73.x = _1499;
    out.m_73.y = _1503;
    out.m_73.z = _1501;
    out.m_73.w = _1505;
    out.m_75.x = _1521;
    out.m_75.y = _1519;
    out.m_75.z = _1523;
    out.gl_Position.x = _1016;
    out.gl_Position.y = _1018;
    out.gl_Position.z = _1481;
    out.gl_Position.w = _986;
    float _1525 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1475);
    float _1527 = _1481 + _986;
    float _1529 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1467);
    float _1531 = _1521;
    float _1533 = _1481;
    if (!_1497)
    {
        _1531 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1535 = _1531;
    float _1537 = _1527 * 0.5;
    float _1539 = fma(_1405, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1465);
    float _1541 = _1535;
    float _1543 = _1535;
    if (!_1497)
    {
        _1195 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1545 = _1195;
    out.m_77.z = _1537;
    out.m_77.w = _986;
    float _1547 = _1545;
    float _1549 = _1545;
    if (!_1497)
    {
        _1533 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1551 = _1533;
    float _1553 = _1551;
    float _1555 = _1551;
    if (!_1497)
    {
        _1197 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1557 = _1197;
    out.m_79.x = _1539;
    out.m_79.y = _1529;
    out.m_79.z = _1525;
    float _1559 = _1557;
    float _1561 = _1557;
    if (!_1497)
    {
        _1199 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1563 = _1199;
    float _1565 = _1479 * _1046;
    float _1567 = -_1479;
    float _1569 = _1567 + 1.0;
    float _1571 = _1061 * _1565;
    float _1573 = _1061 * _1569;
    float _1575 = _1071 * _1565;
    float _1577 = fma(_1067, _1571, _1055);
    float _1579 = fma(_1069, _1571, _1057);
    float _1581 = _1571;
    float _1583 = _1563;
    float _1585 = _1563;
    if (!_1497)
    {
        _1581 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1587 = _1581;
    float _1589 = fma(_1061, _1575, _1059);
    out.m_81.x = _1577;
    out.m_81.y = _1579;
    out.m_81.z = _1589;
    out.m_81.w = _1573;
    bool _1591 = !_1497;
    float _1593 = _1587;
    float _1595 = _1587;
    if (!_1591)
    {
        bool _1597 = _904 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1599 = isnan(_904);
        bool _1601 = _1597 || _1599;
        bool _1603 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1605 = _1601 || _1603;
        if (!_1605)
        {
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1609 = _904 + _1607;
            float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1613 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1611;
            float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1619 = 1.0 / _1613;
            float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1623 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1627 = _1625 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1631 = _1629 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1635 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1637 = _1609 * _1619;
            float _1639 = precise::clamp(_1637, 0.0, 1.0);
            float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1643 = _1641 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1645 = fma(_1639, _1617, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1647 = fma(_1639, _1643, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1649 = fma(_1639, _1623, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1651 = fma(_1639, _1627, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1653 = fma(_1639, _1631, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1655 = fma(_1639, _1635, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1543 = _1649;
            _1561 = _1653;
            _1595 = _1645;
            _1555 = _1651;
            _1549 = _1647;
            _1585 = _1655;
            _1657 = true;
        }
        else
        {
            bool _1659 = _904 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1661 = isnan(_904);
            bool _1663 = _1659 || _1661;
            bool _1665 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1667 = _1663 || _1665;
            if (!_1667)
            {
                _1593 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1669 = _1593;
            _1595 = _1669;
            if (!_1667)
            {
                _1541 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1671 = _1541;
            _1543 = _1671;
            if (!_1667)
            {
                _1547 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1673 = _1547;
            _1549 = _1673;
            if (!_1667)
            {
                _1553 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1675 = _1553;
            _1555 = _1675;
            if (!_1667)
            {
                _1559 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1677 = _1559;
            _1561 = _1677;
            if (!_1667)
            {
                _1583 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1679 = _1583;
            bool _1681 = !_1667;
            _1585 = _1679;
            if (!_1681)
            {
                bool _1683 = _904 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1685 = isnan(_904);
                bool _1687 = _1683 || _1685;
                bool _1689 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1691 = _1687 || _1689;
                if (!_1691)
                {
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1695 = _904 + _1693;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1699 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1697;
                    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1705 = 1.0 / _1699;
                    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1717 = _1715 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1721 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1723 = _1695 * _1705;
                    float _1725 = precise::clamp(_1723, 0.0, 1.0);
                    float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1729 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1731 = fma(_1725, _1703, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1733 = fma(_1725, _1729, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1735 = fma(_1725, _1709, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1737 = fma(_1725, _1713, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1739 = fma(_1725, _1717, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1741 = fma(_1725, _1721, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1543 = _1735;
                    _1561 = _1739;
                    _1595 = _1731;
                    _1555 = _1737;
                    _1549 = _1733;
                    _1585 = _1741;
                    _1657 = true;
                }
                else
                {
                    _1543 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1561 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1595 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1555 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1549 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1585 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1657 = false;
    float _1743 = _1543;
    float _1745 = _1561;
    float _1747 = _1595;
    float _1749 = _1555;
    float _1751 = _1549;
    float _1753 = _1585;
    float _1755 = fma(_1529, -0.5, 0.5);
    float _1757 = precise::clamp(_1755, 0.0, 1.0);
    float _1759 = -_1743;
    float _1761 = _1759 + _1745;
    float _1763 = -_1747;
    float _1765 = _1763 + _1749;
    float _1767 = -_1751;
    float _1769 = _1767 + _1753;
    bool _1771 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1773 = fma(_1757, _1761, _1743);
    float _1775 = fma(_1757, _1765, _1747);
    float _1777 = fma(_1757, _1769, _1751);
    float _1779 = _1773 * 0.586610972881317138671875;
    out.m_83.x = 0.0;
    float _1781 = fma(_1775, 0.298911988735198974609375, _1779);
    out.m_85.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1783 = fma(_1777, 0.114477999508380889892578125, _1781);
    out.m_47.x = 1.0;
    float _1785 = -_1783;
    float _1787 = _1775 + _1785;
    float _1789 = -_1783;
    float _1791 = _1773 + _1789;
    float _1793 = -_1783;
    float _1795 = _1777 + _1793;
    float _1797 = fma(_1787, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    float _1799 = fma(_1791, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    float _1801 = fma(_1795, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    out.m_87.x = _1797;
    out.m_87.y = _1799;
    out.m_87.z = _1801;
    if (!_1771)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1803 = -_728;
    float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1807 = -_730;
    float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1811 = -_732;
    float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1815 = _1805 * _1805;
    float _1817 = fma(_1809, _1809, _1815);
    float _1819 = fma(_1813, _1813, _1817);
    float _1821 = sqrt(_1819);
    float _1823 = rsqrt(_1819);
    float _1825 = -_1821;
    float _1827 = _1825 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1829 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1831 = precise::clamp(_1829, 0.0, 1.0);
    float _1833 = _1809 * _1823;
    float _1835 = _1805 * _1823;
    float _1837 = abs(_1831);
    float _1839 = log2(_1837);
    float _1841 = _1813 * _1823;
    float _1843 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1845 = _1529 * _1835;
    float _1847 = -_1835;
    float _1849 = -_1843;
    float _1851 = fma(_1847, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1849);
    float _1853 = fma(_1539, _1833, _1845);
    float _1855 = -_1841;
    float _1857 = fma(_1855, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1851);
    float _1859 = fma(_1525, _1841, _1853);
    float _1861 = precise::clamp(_1859, 0.0, 1.0);
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1865 = _1857 + _1863;
    float _1867 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1869 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1871 = precise::clamp(_1869, 0.0, 1.0);
    float _1873 = exp2(_1867);
    float _1875 = _1873 * _1871;
    float _1877 = _1861 * _1875;
    float _1879 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1881 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1883 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _1879;
    out.m_83.y = _1881;
    out.m_83.z = _1883;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

