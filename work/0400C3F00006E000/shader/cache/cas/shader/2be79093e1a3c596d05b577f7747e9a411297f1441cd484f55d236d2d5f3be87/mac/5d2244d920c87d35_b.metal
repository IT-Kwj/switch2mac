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
    constant _16* vp_c13 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_67 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2371 = false;
    bool _1752 = false;
    bool _594 = false;
    bool _474 = false;
    bool _342 = false;
    bool _180 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_46.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2655 = as_type<float>(_116);
        out.gl_Position.z = _2655;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_51.w;
    float _122 = float(_102);
    float _124 = 1.0 / _122;
    float _126 = -_120;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_120);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = _128 * _124;
    bool _142 = _128 >= _122;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    out.m_53.x = _140;
    float _148 = _120;
    float _150 = _128;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _148;
    if (_146)
    {
        out.m_49.x = 0.0;
    }
    if (_146)
    {
        float _154 = _152 * 5.0;
        _118 = as_type<int>(_154);
    }
    int _156 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2727 = as_type<float>(_156);
        out.gl_Position.z = _2727;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _160 = !_158;
    float _178;
    if (!_160)
    {
        float _162 = in.m_55.x;
        float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _168 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _170 = _168 * _164;
        float _172 = floor(_170);
        float _174 = -_172;
        float _176 = _170 + _174;
        _178 = _176;
        _180 = true;
    }
    else
    {
        _178 = _140;
    }
    _180 = false;
    float _182 = _178;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _186 = _182 + _184;
    bool _188 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _190 = isnan(_182);
    bool _192 = _188 || _190;
    bool _194 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _196 = _192 || _194;
    float _198 = float(_196);
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _182 + _200;
    bool _204 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _206 = isnan(_182);
    bool _208 = _204 || _206;
    bool _210 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _212 = _208 || _210;
    float _214 = float(_212);
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _224 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_182);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -_198;
    float _238 = _236 + 1.0;
    float _240 = 1.0 / _222;
    float _242 = _234 * _238;
    float _244 = -_234;
    float _246 = _244 + 1.0;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _248;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _254 = 1.0 / _218;
    float _256 = _214 * _246;
    float _258 = -_214;
    float _260 = _258 + 1.0;
    float _262 = _202 * _240;
    float _264 = _186 * _254;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = fma(_250, _264, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _276 = fma(_268, _264, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _278 = fma(_272, _264, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _280 = _274 * _256;
    float _282 = _276 * _256;
    float _284 = _278 * _256;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _298 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].x, _280);
    float _300 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].y, _282);
    float _302 = fma(_288, _262, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _304 = fma(_292, _262, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _306 = fma(_296, _262, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _308 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].z, _284);
    float _310 = fma(_302, _242, _298);
    float _312 = fma(_304, _242, _300);
    float _314 = fma(_306, _242, _308);
    float _316 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[145].x, _310);
    float _318 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[145].y, _312);
    float _320 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[145].z, _314);
    bool _322 = !_252;
    float _340;
    if (!_322)
    {
        float _324 = in.m_55.x;
        float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _328 = _324 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _332 = _330 * _326;
        float _334 = floor(_332);
        float _336 = -_334;
        float _338 = _332 + _336;
        _340 = _338;
        _342 = true;
    }
    else
    {
        _340 = _140;
    }
    _342 = false;
    float _344 = _340;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _348 = _344 + _346;
    float _350 = in.m_57.x;
    float _352 = in.m_57.y;
    float _354 = in.m_57.z;
    bool _356 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _358 = isnan(_344);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _368;
    bool _372 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _374 = isnan(_344);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_366;
    float _386 = _384 + 1.0;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _388;
    float _392 = 1.0 / _370;
    bool _394 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _396 = _382 * _386;
    float _398 = -_382;
    float _400 = _398 + 1.0;
    float _402 = _348 * _392;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _404;
    float _408 = _320 * _354;
    float _410 = fma(_390, _402, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _412 = _318 * _352;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _414;
    float _418 = fma(_406, _402, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _420 = _410 * _396;
    float _422 = _316 * _350;
    float _424 = fma(_416, _402, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _426 = _418 * _396;
    float _428 = _424 * _396;
    float _430 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _420);
    float _432 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _428);
    float _434 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _426);
    float _436 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].x, _430);
    float _438 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].y, _432);
    float _440 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].z, _434);
    float _442 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _444 = _438 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _446 = _440 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _448 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _452 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _448;
    out.m_59.y = _450;
    out.m_59.z = _452;
    bool _454 = !_394;
    float _472;
    if (!_454)
    {
        float _456 = in.m_55.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _460 = _456 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        _472 = _140;
    }
    _474 = false;
    float _476 = _472;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _480 = _476 + _478;
    bool _482 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _484 = isnan(_476);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _494;
    bool _498 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _500 = isnan(_476);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = -_492;
    float _512 = _510 + 1.0;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _514;
    float _518 = 1.0 / _496;
    bool _520 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _522 = _508 * _512;
    float _524 = -_508;
    float _526 = _524 + 1.0;
    float _528 = _480 * _518;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _530;
    float _534 = fma(_516, _528, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _536;
    float _540 = fma(_532, _528, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _542 = _534 * _522;
    float _544 = fma(_538, _528, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _546 = _540 * _522;
    float _548 = _544 * _522;
    float _550 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[123].x, _542);
    float _552 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[123].y, _548);
    float _554 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[123].z, _546);
    float _556 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[124].x, _550);
    float _558 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[124].y, _552);
    float _560 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[124].z, _554);
    float _562 = _556 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _564 = _558 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _566 = _560 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _568 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _568;
    out.m_61.y = _570;
    out.m_61.z = _572;
    bool _574 = !_520;
    float _592;
    if (!_574)
    {
        float _576 = in.m_55.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _592 = _590;
        _594 = true;
    }
    else
    {
        _592 = _140;
    }
    _594 = false;
    float _596 = _592;
    float _598 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _600 = log2(_598);
    float _602 = in.m_55.x;
    float _604 = in.m_55.y;
    float _606 = in.m_55.z;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _612 = 1.0 / _610;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _632 = _630 != 0;
    float _634 = 1.0 / _616;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _644 = 1.0 / _620;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _650 = _600 * _128;
    float _652 = _606 + _602;
    float _654 = _606 * 2.0;
    float _656 = _602 * 2.0;
    float _658 = _604 + (-0.5);
    float _660 = _604 * 2.0;
    float _662 = exp2(_650);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _664;
    bool _668 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _676 = _672 || _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _682 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(1.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = _652 + (-1.0);
    bool _694 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _696 = isnan(_596);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = 1.0 / _642;
    float _708 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _710 = 1.0 / _638;
    float _712 = _604 + _606;
    float _714 = -_662;
    float _716 = _714 + 1.0;
    float _718 = _712 + (-1.0);
    float _720 = _676 ? _716 : 0.0;
    float _722 = 1.0 / _648;
    float _724 = _606 + (-0.5);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _728 = 1.0 + _726;
    float _730 = _604 + _602;
    float _732 = _730 + (-1.0);
    float _734 = 1.0 / _728;
    float _736 = _602 + (-0.5);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _750 = _666 * _710;
    float _752 = _740 * _612;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _754;
    float _758 = floor(_654);
    float _760 = _748 * _634;
    float _762 = _756 * _644;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _768 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _770 = isnan(_596);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _782 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _784 = isnan(_596);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = 1.0 / _744;
    float _796 = _766 * _706;
    int _798 = as_type<int>(_780);
    if (_690)
    {
        float _800 = _720 * _734;
        _150 = _800;
    }
    float _802 = _150;
    float _804 = -_778;
    float _806 = _804 + 1.0;
    bool _808 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _810 = isnan(_596);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = _680 * _722;
    float _822 = floor(_656);
    bool _824 = _758 > 0.0;
    float _826 = _792 * _806;
    bool _828 = _758 >= 0.0;
    bool _830 = isnan(_758);
    bool _832 = _828 || _830;
    bool _834 = isnan(0.0);
    bool _836 = _832 || _834;
    float _838 = -_792;
    float _840 = _838 + 1.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _842;
    bool _846 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _848 = isnan(_596);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _860 = _596 + _858;
    float _862 = floor(_660);
    float _864 = -_818;
    float _866 = _864 + 1.0;
    float _868 = _844 * _794;
    float _870 = _818 * _840;
    bool _872 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _874 = isnan(_596);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = _856 * _866;
    float _886 = fma(_752, _860, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _888 = -_856;
    float _890 = _888 + 1.0;
    float _892 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _894 = in.m_46.x;
    float _896 = in.m_46.y;
    float _898 = in.m_46.z;
    bool _900 = _822 > 0.0;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _904 = _596 + _902;
    bool _906 = _822 >= 0.0;
    bool _908 = isnan(_822);
    bool _910 = _906 || _908;
    bool _912 = isnan(0.0);
    bool _914 = _910 || _912;
    float _916 = -_882;
    float _918 = _916 + 1.0;
    int _920 = _836 ? 0 : 1;
    float _922 = _882 * _890;
    bool _924 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _926 = isnan(_596);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = fma(_762, _904, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _938 = _862 >= 0.0;
    bool _940 = isnan(_862);
    bool _942 = _938 || _940;
    bool _944 = isnan(0.0);
    bool _946 = _942 || _944;
    bool _948 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _950 = isnan(_596);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = _934 * _918;
    int _962 = _946 ? 0 : 1;
    float _964 = -_934;
    float _966 = _964 + 1.0;
    bool _968 = _862 > 0.0;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _972 = _596 + _970;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _976 = _596 + _974;
    float _978 = -_958;
    float _980 = _978 + 1.0;
    float _982 = _958 * _966;
    float _984 = fma(_760, _972, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _986 = fma(_750, _976, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _990 = _596 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _994 = _596 + _992;
    float _996 = _704 * _980;
    int _998 = ~_920;
    int _1000 = _998 + 1;
    int _1002 = _1000 + 1;
    float _1004 = fma(_796, _990, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1006 = fma(_820, _994, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1008 = _886 * _996;
    int _1010 = ~_962;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    float _1016 = in.m_63.x;
    float _1018 = in.m_63.y;
    float _1020 = in.m_63.z;
    int _1022 = _1002;
    int _1024 = _1014;
    bool _1026 = _824;
    if (!_824)
    {
        int _1028 = ~_920;
        int _1030 = _1028 + 1;
        _1022 = _1030;
    }
    int _1032 = _1022;
    float _1034 = _896 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1036 = _898;
    if (!_968)
    {
        int _1038 = ~_962;
        int _1040 = _1038 + 1;
        _1024 = _1040;
    }
    int _1042 = _1024;
    float _1044 = _896 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1046 = !_624;
    int _1048 = _1046 ? 0 : 1;
    float _1050 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1034);
    float _1052 = float(_1032);
    float _1054 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1044);
    int _1056 = abs(_1048);
    float _1058 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1050);
    bool _1060 = !_632;
    int _1062 = _1060 ? 0 : 1;
    float _1064 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1054);
    float _1066 = float(_1056);
    float _1068 = -_704;
    float _1070 = _1068 + 1.0;
    int _1072 = abs(_1062);
    float _1074 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1076 = _1064 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1078 = _1066 * _1052;
    float _1080 = float(_1072);
    float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1084 = _1074 + _1082;
    float _1086 = float(_1042);
    float _1088 = -_1076;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1092 = _1078 * (-2.0);
    int _1094 = _914 ? 0 : 1;
    float _1096 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1008);
    float _1098 = _1080 * _1086;
    float _1100 = fma(_1092, _1016, _1016);
    float _1102 = abs(_1084);
    float _1104 = abs(_1090);
    float _1106 = precise::max(_1102, _1104);
    float _1108 = fma(_892, _1092, _892);
    bool _1110 = !_628;
    int _1112 = _1110 ? 0 : 1;
    float _1114 = _1098 * (-2.0);
    int _1116 = ~_1094;
    int _1118 = _1116 + 1;
    int _1120 = _1118 + 1;
    float _1122 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1100);
    int _1124 = _1120;
    float _1126 = _1090;
    float _1128 = _1076;
    float _1130 = _1074;
    if (!_900)
    {
        int _1132 = ~_1094;
        int _1134 = _1132 + 1;
        _1124 = _1134;
    }
    int _1136 = _1124;
    float _1138 = fma(_1114, _1020, _1020);
    bool _1140 = _1106 >= 16.0;
    float _1142 = fma(_1108, _802, _1122);
    int _1144 = abs(_1112);
    float _1146 = fma(_708, _1114, _708);
    float _1148 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1138);
    float _1150 = float(_1136);
    float _1152 = fma(_984, _982, _1096);
    float _1154 = _1084 * 0.0625;
    float _1156 = fma(_1146, _802, _1148);
    float _1158 = fma(_936, _960, _1152);
    float _1160 = float(_1144);
    float _1162 = in.m_65.x;
    float _1164 = in.m_65.y;
    float _1166 = in.m_65.z;
    float _1168 = _1140 ? _1154 : _1084;
    if (_1140)
    {
        float _1170 = _1090 * 0.0625;
        _1126 = _1170;
    }
    float _1172 = _1126;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1176 = _596 + _1174;
    float _1178 = _1160 * _1150;
    float _1180 = abs(_1168);
    bool _1182 = _1180 != 0.0;
    bool _1184 = isnan(_1180);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan(0.0);
    bool _1190 = _1186 || _1188;
    float _1192 = in.m_67.x;
    float _1194 = in.m_67.y;
    float _1196 = in.m_67.z;
    float _1198 = _1142 * 0.15915493667125701904296875;
    float _1200 = _1156 * 0.15915493667125701904296875;
    float _1202 = abs(_1172);
    bool _1204 = _1202 == 0.0;
    bool _1206 = !_1190;
    bool _1208 = _1204 && _1206;
    float _1210 = _1178 * (-2.0);
    float _1212 = abs(_1172);
    bool _1214 = _1212 == 0.0;
    float _1216 = fma(_1004, _922, _1158);
    float _1218 = _1198 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = fma(_868, _1176, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1224 = fma(_1210, _1018, _1018);
    float _1226 = fma(_986, _884, _1216);
    float _1228 = fma(_780, _1210, _780);
    float _1230 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1224);
    float _1232 = fma(_1006, _870, _1226);
    float _1234 = _1198 * 6.283185482025146484375;
    float _1236 = cos(_1234);
    int _1238 = as_type<int>(_1222);
    if (_1208)
    {
        bool _1240 = as_type<int>(_1172) >= 0;
        _1026 = _1240;
    }
    bool _1242 = _1026;
    float _1244 = fma(_1228, _802, _1230);
    float _1246 = fma(_1222, _826, _1232);
    int _1248 = _1242 ? (-1) : 0;
    if (_1208)
    {
        int _1250 = _1242 ? 0 : 1078530011;
        _798 = _1250;
    }
    int _1252 = _798;
    float _1254 = _1200 * 6.283185482025146484375;
    float _1256 = sin(_1254);
    if (_1208)
    {
        int _1258 = int(0x80000000) & as_type<int>(_1168);
        int _1260 = _1252 | _1258;
        _1238 = _1260;
    }
    int _1262 = _1238;
    bool _1264 = !_1190;
    bool _1266 = _1264 && _1214;
    int _1268 = _1262;
    float _1270 = as_type<float>(_1262);
    if (!_1266)
    {
        float _1272 = abs(_1168);
        bool _1274 = _1272 != as_type<float>(0x7f800000u /* inf */);
        bool _1276 = isnan(_1272);
        bool _1278 = _1274 || _1276;
        bool _1280 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1282 = _1278 || _1280;
        float _1284 = abs(_1172);
        bool _1286 = _1284 == as_type<float>(0x7f800000u /* inf */);
        float _1288 = abs(_1172);
        bool _1290 = _1288 == as_type<float>(0x7f800000u /* inf */);
        bool _1292 = !_1282;
        bool _1294 = _1290 && _1292;
        if (_1294)
        {
            bool _1296 = as_type<int>(_1172) >= 0;
            _1248 = _1296 ? (-1) : 0;
        }
        int _1298 = _1248;
        if (_1294)
        {
            _1268 = 1075235812;
        }
        int _1300 = _1268;
        int _1302 = _1300;
        if (_1294)
        {
            int _1304 = ~_1298;
            int _1306 = (_1304 != 0) ? _1300 : 1061752795;
            _1302 = _1306;
        }
        int _1308 = _1302;
        float _1310 = as_type<float>(_1308);
        if (_1294)
        {
            int _1312 = int(0x80000000) & as_type<int>(_1168);
            int _1314 = _1308 | _1312;
            _1310 = as_type<float>(_1314);
        }
        float _1316 = _1310;
        bool _1318 = !_1282;
        bool _1320 = _1318 && _1286;
        _1270 = _1316;
        if (!_1320)
        {
            float _1322 = abs(_1172);
            float _1324 = abs(_1168);
            float _1326 = precise::max(_1322, _1324);
            float _1328 = abs(_1172);
            float _1330 = abs(_1168);
            float _1332 = precise::min(_1328, _1330);
            float _1334 = 1.0 / _1326;
            float _1336 = abs(_1168);
            float _1338 = abs(_1172);
            bool _1340 = _1336 > _1338;
            bool _1342 = as_type<int>(_1172) >= 0;
            float _1344 = _1332 * _1334;
            float _1346 = abs(_1172);
            float _1348 = abs(_1168);
            float _1350 = _1346 + _1348;
            float _1352 = _1344 * _1344;
            bool _1354 = _1350 > as_type<float>(0x7f800000u /* inf */);
            bool _1356 = isnan(_1350);
            bool _1358 = _1354 || _1356;
            bool _1360 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1362 = _1358 || _1360;
            float _1364 = _1352 + 11.33538818359375;
            float _1366 = fma(_1352, _1364, 28.84246826171875);
            float _1368 = fma(_1352, _1366, 19.6966705322265625);
            float _1370 = fma(_1352, -0.82336294651031494140625, -5.674867153167724609375);
            float _1372 = fma(_1352, _1370, -6.565555095672607421875);
            float _1374 = 1.0 / _1368;
            float _1376 = _1352 * _1372;
            float _1378 = _1344 * _1376;
            float _1380 = fma(_1378, _1374, _1344);
            int _1382 = as_type<int>(_1168) & int(0x80000000);
            float _1384 = _1380;
            _1270 = _1350;
            if (_1340)
            {
                float _1386 = -_1380;
                float _1388 = _1386 + 1.57079637050628662109375;
                _1384 = _1388;
            }
            float _1390 = _1384;
            int _1392 = as_type<int>(_1390);
            if (!_1342)
            {
                float _1394 = -_1390;
                float _1396 = _1394 + 3.1415927410125732421875;
                _1392 = as_type<int>(_1396);
            }
            int _1398 = _1392;
            if (!_1362)
            {
                int _1400 = _1382 | _1398;
                _1270 = as_type<float>(_1400);
            }
        }
    }
    float _1402 = _1270;
    float _1404 = -_1402;
    float _1406 = _1244 + _1404;
    float _1408 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1246);
    float _1410 = -_1162;
    float _1412 = _1410 + _1192;
    float _1414 = _1200 * 6.283185482025146484375;
    float _1416 = cos(_1414);
    float _1418 = _1406 * 0.15915493667125701904296875;
    float _1420 = -_1166;
    float _1422 = _1420 + _1196;
    float _1424 = fma(_1408, _1412, _1162);
    float _1426 = -_1164;
    float _1428 = _1426 + _1194;
    float _1430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1432 = _896 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1434 = _1418 * 6.283185482025146484375;
    float _1436 = cos(_1434);
    float _1438 = fma(_1408, _1428, _1164);
    float _1440 = fma(_1408, _1422, _1166);
    float _1442 = _412 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1444 = _408 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1446 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1438);
    float _1448 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1424);
    float _1450 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1440);
    float _1452 = _1418 * 6.283185482025146484375;
    float _1454 = sin(_1452);
    float _1456 = _1446 * _1442;
    float _1458 = _1220 * _1416;
    float _1460 = _1448 * _1430;
    float _1462 = _1450 * _1444;
    float _1464 = -_1456;
    float _1466 = _1256 * _1464;
    float _1468 = _1458 * _1456;
    float _1470 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1432);
    float _1472 = _1220 * _1436;
    float _1474 = _1436 * _1416;
    float _1476 = _1236 * _1436;
    bool _1478 = _1438 != 0.0;
    bool _1480 = isnan(_1438);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan(0.0);
    bool _1486 = _1482 || _1484;
    float _1488 = fma(_1474, _1460, _1466);
    bool _1490 = _1424 == 0.0;
    bool _1492 = !_1486;
    bool _1494 = _1490 && _1492;
    float _1496 = _1236 * _1454;
    float _1498 = _1220 * _1454;
    float _1500 = _1454 * _1416;
    float _1502 = _1236 * _1416;
    float _1504 = -_1496;
    float _1506 = fma(_1256, _1472, _1504);
    float _1508 = fma(_1256, _1498, _1476);
    float _1510 = fma(_1500, _1462, _1488);
    float _1512 = fma(_1256, _1476, _1498);
    float _1514 = fma(_1506, _1460, _1468);
    float _1516 = _1502 * _1456;
    float _1518 = _1074 + _1510;
    float _1520 = -_1472;
    float _1522 = fma(_1256, _1496, _1520);
    float _1524 = fma(_1508, _1462, _1514);
    float _1526 = in.m_69.x;
    float _1528 = in.m_69.y;
    float _1530 = in.m_69.z;
    float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1534 = _1518 + _1532;
    float _1536 = fma(_1512, _1460, _1516);
    float _1538 = _1076 + _1524;
    float _1540 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1470);
    float _1542 = _1534 * _1534;
    float _1544 = fma(_1522, _1462, _1536);
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1548 = _1538 + _1546;
    float _1550 = _1540 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1552 = _1440 == 0.0;
    bool _1554 = _1552 && _1494;
    float _1556 = _1548 * _1548;
    float _1558 = _1550 + _1544;
    float _1560 = _1542 + _1556;
    float _1562 = sqrt(_1560);
    bool _1564 = _1562 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1566 = _1462;
    float _1568 = _1460;
    float _1570 = _1544;
    float _1572 = _1536;
    float _1574 = _1438;
    float _1576 = _1534;
    if (!_1564)
    {
        _1566 = _1556;
    }
    float _1578 = _1566;
    float _1580 = _1578;
    if (!_1564)
    {
        _1568 = _1542;
    }
    float _1582 = _1568;
    float _1584 = _1582;
    if (!_1564)
    {
        _1036 = _1518;
    }
    float _1586 = _1036;
    float _1588 = _1586;
    if (!_1564)
    {
        _1570 = _1538;
    }
    float _1590 = _1570;
    float _1592 = _1590;
    if (!_1564)
    {
        _1572 = _1558;
    }
    float _1594 = _1572;
    bool _1596 = !_1564;
    float _1598 = _1594;
    float _1600 = _1528;
    float _1602 = _1526;
    float _1604 = _1530;
    if (!_1596)
    {
        float _1606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1610 = _1562 + _1608;
        float _1612 = _1558 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1614 = rsqrt(_1560);
        float _1616 = _1610 * _1606;
        float _1618 = _1616 * 0.15915493667125701904296875;
        float _1620 = _1618 * 6.283185482025146484375;
        float _1622 = sin(_1620);
        float _1624 = _1618 * 6.283185482025146484375;
        float _1626 = cos(_1624);
        float _1628 = fma(_1622, _1612, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1630 = _1614 * _1628;
        float _1632 = _1626 + (-1.0);
        float _1634 = fma(_1534, _1630, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1636 = fma(_1548, _1630, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1638 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1642 = _1634 + _1640;
        float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1646 = _1636 + _1644;
        float _1648 = fma(_1558, _1626, _1638);
        float _1650 = _1642 * _1642;
        float _1652 = _1646 * _1646;
        _1598 = _1648;
        _1584 = _1650;
        _1580 = _1652;
        _1592 = _1636;
        _1588 = _1634;
    }
    float _1654 = _1598;
    float _1656 = _1584;
    float _1658 = _1580;
    float _1660 = _1592;
    float _1662 = _1588;
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1666 = _1654 + _1664;
    if (!_1554)
    {
        float _1668 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1528);
        _1600 = _1668;
    }
    float _1670 = _1600;
    if (!_1554)
    {
        float _1672 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1526);
        _1602 = _1672;
    }
    float _1674 = _1602;
    if (!_1554)
    {
        float _1676 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1530);
        _1604 = _1676;
    }
    float _1678 = _1604;
    float _1680 = fma(_1666, _1666, _1656);
    float _1682 = -_1670;
    float _1684 = _1256 * _1682;
    float _1686 = _1502 * _1670;
    float _1688 = _1458 * _1670;
    float _1690 = _1680 + _1658;
    float _1692 = fma(_1474, _1674, _1684);
    float _1694 = fma(_1512, _1674, _1686);
    float _1696 = fma(_1506, _1674, _1688);
    out.m_71.y = _1194;
    float _1698 = fma(_1500, _1678, _1692);
    float _1700 = sqrt(_1690);
    float _1702 = fma(_1522, _1678, _1694);
    float _1704 = fma(_1508, _1678, _1696);
    out.m_73.x = _1698;
    out.m_73.y = _1702;
    out.m_73.z = _1704;
    bool _1706 = _1700 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1708 = isnan(_1700);
    bool _1710 = _1706 || _1708;
    bool _1712 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1714 = _1710 || _1712;
    float _1716 = _1696;
    if (!_1714)
    {
        _1574 = 1.0;
    }
    float _1718 = _1574;
    bool _1720 = !_1714;
    float _1722 = _1718;
    if (!_1720)
    {
        bool _1724 = _1700 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1726 = isnan(_1700);
        bool _1728 = _1724 || _1726;
        bool _1730 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1732 = _1728 || _1730;
        if (!_1732)
        {
            float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1736 = _1700 + _1734;
            float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1740 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1738;
            float _1742 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1744 = _1742 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1746 = 1.0 / _1740;
            float _1748 = _1736 * _1746;
            float _1750 = fma(_1748, _1744, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1722 = _1750;
            _1752 = true;
        }
        else
        {
            bool _1754 = _1700 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1756 = isnan(_1700);
            bool _1758 = _1754 || _1756;
            bool _1760 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1762 = _1758 || _1760;
            if (!_1762)
            {
                float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1766 = _1700 + _1764;
                float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1770 = _1768 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1774 = _1772 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1776 = 1.0 / _1770;
                float _1778 = _1766 * _1776;
                float _1780 = fma(_1778, _1774, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1722 = _1780;
                _1752 = true;
            }
            else
            {
                _1722 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1752 = false;
    float _1782 = _1722;
    float _1784 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1786 = _1654 + _1784;
    float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1790 = _1660 + _1788;
    bool _1792 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan(0.5);
    bool _1800 = _1796 || _1798;
    float _1802 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1804 = _1662 + _1802;
    float _1806 = fma(_1786, _1782, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1808 = fma(_1790, _1782, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1810 = fma(_1804, _1782, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1812 = _1782;
    float _1814 = _1804;
    if (_1800)
    {
        _1812 = _1810;
    }
    float _1816 = _1812;
    float _1818 = _1816;
    if (_1800)
    {
        _1814 = _1806;
    }
    float _1820 = _1814;
    float _1822 = _1820;
    if (_1800)
    {
        _1716 = _1808;
    }
    float _1824 = _1716;
    float _1826 = _1824;
    if (!_1800)
    {
        float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1830 = _1550 + _1828;
        float _1832 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1834 = _1830 * _1830;
        float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1838 = _1076 + _1836;
        float _1840 = fma(_1084, _1084, _1834);
        float _1842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1844 = fma(_1838, _1838, _1840);
        float _1846 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1848 = sqrt(_1844);
        float _1850 = precise::min(_1848, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1852 = _1850 * _1842;
        float _1854 = -_1074;
        float _1856 = _1854 + _1810;
        float _1858 = _1846 * _1852;
        float _1860 = -_1550;
        float _1862 = _1860 + _1806;
        float _1864 = -_1076;
        float _1866 = _1864 + _1808;
        float _1868 = fma(_1856, _1858, _1074);
        float _1870 = fma(_1862, _1858, _1550);
        float _1872 = fma(_1866, _1858, _1076);
        _1822 = _1870;
        _1818 = _1868;
        _1826 = _1872;
    }
    float _1874 = _1822;
    float _1876 = _1818;
    float _1878 = _1826;
    float _1880 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1882 = _1874 + _1880;
    float _1884 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1886 = _1876 + _1884;
    float _1888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1890 = _1878 + _1888;
    float _1892 = _1882 * _1882;
    float _1894 = fma(_1886, _1886, _1892);
    float _1896 = fma(_1890, _1890, _1894);
    float _1898 = rsqrt(_1896);
    float _1900 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1902 = _1886 * _1900;
    float _1904 = _1890 * _1900;
    float _1906 = _1902 * _1902;
    float _1908 = _1904 * _1904;
    float _1910 = _1906 + _1908;
    float _1912 = sqrt(_1910);
    bool _1914 = _1912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1918 = _1912 + _1916;
    float _1920 = _1898;
    float _1922 = _1918;
    float _1924 = _1882;
    float _1926 = _1902;
    if (_1914)
    {
        float _1928 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1920 = _1928;
    }
    float _1930 = _1920;
    if (_1914)
    {
        float _1932 = rsqrt(_1910);
        _1128 = _1932;
    }
    float _1934 = _1128;
    float _1936 = _1934;
    if (_1914)
    {
        float _1938 = _1918 * _1930;
        _1922 = _1938;
    }
    float _1940 = _1922;
    if (_1914)
    {
        float _1942 = _1940 * 0.15915493667125701904296875;
        _1130 = _1942;
    }
    float _1944 = _1130;
    float _1946 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1948 = _1890;
    float _1950 = _1944;
    if (_1914)
    {
        float _1952 = _1944 * 6.283185482025146484375;
        float _1954 = sin(_1952);
        _1948 = _1954;
    }
    float _1956 = _1948;
    float _1958 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1960 = precise::max(0.0, _1958);
    float _1962 = _1930;
    float _1964 = _1960;
    if (_1914)
    {
        float _1966 = _1944 * 6.283185482025146484375;
        float _1968 = cos(_1966);
        _1962 = _1968;
    }
    float _1970 = _1962;
    float _1972 = -_1900;
    float _1974 = -_1960;
    float _1976 = fma(_1882, _1972, _1974);
    if (_1914)
    {
        float _1978 = _1976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1924 = _1978;
    }
    float _1980 = _1924;
    float _1982 = _1980;
    float _1984 = _1956;
    if (_1914)
    {
        float _1986 = fma(_1956, _1980, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1982 = _1986;
    }
    float _1988 = _1982;
    float _1990 = _1988;
    if (!_1914)
    {
        _1984 = _1904;
    }
    float _1992 = _1984;
    float _1994 = _1992;
    float _1996 = _1970;
    if (_1914)
    {
        float _1998 = _1970 + (-1.0);
        _1964 = _1998;
    }
    float _2000 = _1964;
    if (_1914)
    {
        float _2002 = _1934 * _1988;
        _1576 = _2002;
    }
    float _2004 = _1576;
    if (!_1914)
    {
        _1936 = _1976;
    }
    float _2006 = _1936;
    float _2008 = _2006;
    if (_1914)
    {
        float _2010 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1950 = _2010;
    }
    float _2012 = _1950;
    if (_1914)
    {
        float _2014 = _1902 * _2004;
        _1926 = _2014;
    }
    float _2016 = _1926;
    float _2018 = sqrt(_1896);
    if (!_1914)
    {
        _1990 = _1906;
    }
    float _2020 = _1990;
    float _2022 = _2020;
    if (_1914)
    {
        float _2024 = fma(_1976, _1970, _2012);
        _2008 = _2024;
    }
    float _2026 = _2008;
    if (_1914)
    {
        float _2028 = _1904 * _2004;
        _1994 = _2028;
    }
    float _2030 = _1994;
    if (_1914)
    {
        float _2032 = _2016 * _2016;
        _2022 = _2032;
    }
    float _2034 = _2022;
    if (!_1914)
    {
        _1996 = _1908;
    }
    float _2036 = _1996;
    float _2038 = _1874 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2040 = _2036;
    if (_1914)
    {
        float _2042 = _2030 * _2030;
        _2040 = _2042;
    }
    float _2044 = _2040;
    float _2046 = fma(_2026, _2026, _2034);
    float _2048 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2038);
    float _2050 = _1874 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2052 = _2046 + _2044;
    float _2054 = _1874 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2056 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2050);
    float _2058 = rsqrt(_2052);
    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2062 = fma(_2018, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2060);
    float _2064 = precise::clamp(_2062, 0.0, 1.0);
    float _2066 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2048);
    float _2068 = _1874 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2070 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2056);
    float _2072 = -_2064;
    float _2074 = _2072 + 1.0;
    float _2076 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2054);
    float _2078 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2068);
    float _2080 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2082 = abs(_2074);
    float _2084 = log2(_2082);
    float _2086 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2078);
    float _2088 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2090 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2076);
    float _2092 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2094 = _2058 * _2016;
    float _2096 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2098 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2100 = _2058 * _2026;
    float _2102 = _2094 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2104 = _2058 * _2030;
    float _2106 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2098);
    float _2108 = -_2092;
    float _2110 = fma(_2108, _1946, 1.0);
    float _2112 = -_2102;
    float _2114 = fma(_2100, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2112);
    float _2116 = _2090 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2118 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2106);
    float _2120 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2122 = -_2104;
    float _2124 = fma(_2122, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2114);
    float _2126 = log2(_2110);
    float _2128 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2118);
    float _2130 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2132 = fma(_2124, -0.5, 0.5);
    float _2134 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2136 = fma(_2124, 0.5, 0.5);
    float _2138 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2130);
    float _2140 = _2100 + 1.0;
    float _2142 = exp2(_2120);
    float _2144 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2134);
    float _2146 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2138);
    float _2148 = fma(_2136, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2150 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2144);
    float _2152 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2146);
    float _2154 = fma(_2136, _2148, -0.212114393711090087890625);
    float _2156 = 1.0 / _2128;
    float _2158 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2150);
    float _2160 = _2126 * 0.693147182464599609375;
    float _2162 = fma(_2136, _2154, 1.570728778839111328125);
    float _2164 = _2160 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2166 = sqrt(_2132);
    float _2168 = -_2100;
    float _2170 = fma(_2142, _2140, _2168);
    float _2172 = fma(_2170, 0.5, 0.5);
    float _2174 = _2152 * _2156;
    float _2176 = _2158 * _2156;
    float _2178 = fma(_2174, 0.5, 0.5);
    float _2180 = fma(_2176, -0.5, 0.5);
    float _2182 = _2166 * 0.636619746685028076171875;
    float3 _5913 = float3(_2178, _2180, _2164);
    float _2184 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5913, float3(0.0), isnan(_5913)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5913, float3(0.0), isnan(_5913)), level(0.0)).x;
    float3 _5924 = float3(_2178, _2180, _2164);
    float4 _2187 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5924, float3(0.0), isnan(_5924)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5924, float3(0.0), isnan(_5924)), level(0.0)).xyzw;
    float _2189 = _2187.x;
    float _2191 = _2187.y;
    float _2193 = _2187.z;
    float _2195 = _2187.w;
    float _2197 = -_2162;
    float _2199 = fma(_2182, _2197, 1.0);
    float2 _5946 = float2(_2199, _2172);
    float3 _2203 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5946, float2(0.0), isnan(_5946)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5946, float2(0.0), isnan(_5946)), level(0.0)).xyz;
    float _2205 = _2203.x;
    float _2207 = _2203.y;
    float _2209 = _2203.z;
    float _2211 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2213 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _1876;
    out.m_75.y = _1874;
    out.m_75.z = _1878;
    bool _2215 = _2018 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2217 = isnan(_2018);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2223 = _2219 || _2221;
    float _2225 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2213);
    float _2227 = exp2(_2211);
    float _2229 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2225);
    float _2231 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2229);
    float _2233 = _2231 + _2128;
    out.gl_Position.x = _2152;
    out.gl_Position.y = _2158;
    out.gl_Position.z = _2231;
    out.gl_Position.w = _2128;
    float _2235 = _2233 * 0.5;
    float _2237 = -_2227;
    float _2239 = _2237 + 1.0;
    float _2241 = _2233;
    float _2243 = _2128;
    float _2245 = _2231;
    float _2247 = _2158;
    float _2249 = _2152;
    if (!_2223)
    {
        _2241 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2251 = _2241;
    float _2253 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _2235;
    out.m_77.w = _2128;
    float _2255 = -_2253;
    float _2257 = _2255 + 1.0;
    float _2259 = _2257;
    float _2261 = _2251;
    float _2263 = _2251;
    if (!_2223)
    {
        _2243 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2265 = _2243;
    float _2267 = _2265;
    float _2269 = _2265;
    if (!_2223)
    {
        _2245 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2271 = _2245;
    float _2273 = _2271;
    float _2275 = _2271;
    if (!_2223)
    {
        _2247 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2277 = _2247;
    float _2279 = _2277;
    float _2281 = _2277;
    if (!_2223)
    {
        _2249 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2283 = _2249;
    float _2285 = _2253 * _2184;
    float _2287 = _2195 * _2285;
    float _2289 = _2195 * _2257;
    float _2291 = _2283;
    float _2293 = _2283;
    if (!_2223)
    {
        _2259 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2295 = _2259;
    float _2297 = _2209 * _2285;
    float _2299 = fma(_2205, _2287, _2189);
    float _2301 = fma(_2207, _2287, _2191);
    float _2303 = fma(_2195, _2297, _2193);
    out.m_79.x = _2299;
    out.m_79.y = _2301;
    out.m_79.z = _2303;
    out.m_79.w = _2289;
    bool _2305 = !_2223;
    float _2307 = _2295;
    float _2309 = _2295;
    if (!_2305)
    {
        bool _2311 = _2018 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2313 = isnan(_2018);
        bool _2315 = _2311 || _2313;
        bool _2317 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2319 = _2315 || _2317;
        if (!_2319)
        {
            float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2323 = _2018 + _2321;
            float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2327 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2325;
            float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2333 = 1.0 / _2327;
            float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2337 = _2335 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2345 = _2343 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2351 = _2323 * _2333;
            float _2353 = precise::clamp(_2351, 0.0, 1.0);
            float _2355 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2357 = _2355 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2359 = fma(_2353, _2331, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2361 = fma(_2353, _2357, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2363 = fma(_2353, _2337, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2365 = fma(_2353, _2341, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2367 = fma(_2353, _2345, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2369 = fma(_2353, _2349, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2309 = _2363;
            _2281 = _2367;
            _2263 = _2359;
            _2275 = _2365;
            _2269 = _2361;
            _2293 = _2369;
            _2371 = true;
        }
        else
        {
            bool _2373 = _2018 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2375 = isnan(_2018);
            bool _2377 = _2373 || _2375;
            bool _2379 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2381 = _2377 || _2379;
            if (!_2381)
            {
                _2261 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2383 = _2261;
            _2263 = _2383;
            if (!_2381)
            {
                _2307 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2385 = _2307;
            _2309 = _2385;
            if (!_2381)
            {
                _2267 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2387 = _2267;
            _2269 = _2387;
            if (!_2381)
            {
                _2273 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2389 = _2273;
            _2275 = _2389;
            if (!_2381)
            {
                _2279 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2391 = _2279;
            _2281 = _2391;
            if (!_2381)
            {
                _2291 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2393 = _2291;
            bool _2395 = !_2381;
            _2293 = _2393;
            if (!_2395)
            {
                bool _2397 = _2018 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2399 = isnan(_2018);
                bool _2401 = _2397 || _2399;
                bool _2403 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2405 = _2401 || _2403;
                if (!_2405)
                {
                    float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2409 = _2018 + _2407;
                    float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2413 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2411;
                    float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2417 = _2415 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2419 = 1.0 / _2413;
                    float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2429 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2431 = _2429 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2437 = _2409 * _2419;
                    float _2439 = precise::clamp(_2437, 0.0, 1.0);
                    float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2443 = _2441 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2445 = fma(_2439, _2417, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2447 = fma(_2439, _2443, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2449 = fma(_2439, _2423, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2451 = fma(_2439, _2427, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2453 = fma(_2439, _2431, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2455 = fma(_2439, _2435, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2309 = _2449;
                    _2281 = _2453;
                    _2263 = _2445;
                    _2275 = _2451;
                    _2269 = _2447;
                    _2293 = _2455;
                    _2371 = true;
                }
                else
                {
                    _2309 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2281 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2263 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2275 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2269 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2293 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2371 = false;
    float _2457 = _2309;
    float _2459 = _2281;
    float _2461 = _2263;
    float _2463 = _2275;
    float _2465 = _2269;
    float _2467 = _2293;
    float _2469 = fma(_1702, -0.5, 0.5);
    float _2471 = precise::clamp(_2469, 0.0, 1.0);
    float _2473 = -_2457;
    float _2475 = _2473 + _2459;
    float _2477 = -_2461;
    float _2479 = _2477 + _2463;
    float _2481 = -_2465;
    float _2483 = _2481 + _2467;
    bool _2485 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2487 = fma(_2471, _2475, _2457);
    float _2489 = fma(_2471, _2479, _2461);
    float _2491 = fma(_2471, _2483, _2465);
    float _2493 = _2487 * 0.586610972881317138671875;
    out.m_81.x = 0.0;
    float _2495 = fma(_2489, 0.298911988735198974609375, _2493);
    float _2497 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2499 = fma(_2491, 0.114477999508380889892578125, _2495);
    out.m_49.x = _2497;
    float _2501 = -_2499;
    float _2503 = _2489 + _2501;
    float _2505 = -_2499;
    float _2507 = _2487 + _2505;
    float _2509 = -_2499;
    float _2511 = _2491 + _2509;
    float _2513 = fma(_2503, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2499);
    float _2515 = fma(_2507, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2499);
    float _2517 = fma(_2511, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2499);
    out.m_83.x = _2513;
    out.m_83.y = _2515;
    out.m_83.z = _2517;
    if (!_2485)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2519 = -_1874;
    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2523 = -_1876;
    float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2527 = -_1878;
    float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2531 = _2521 * _2521;
    float _2533 = fma(_2525, _2525, _2531);
    float _2535 = fma(_2529, _2529, _2533);
    float _2537 = sqrt(_2535);
    float _2539 = rsqrt(_2535);
    float _2541 = -_2537;
    float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2545 = _2543 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2547 = precise::clamp(_2545, 0.0, 1.0);
    float _2549 = _2525 * _2539;
    float _2551 = _2521 * _2539;
    float _2553 = abs(_2547);
    float _2555 = log2(_2553);
    float _2557 = _2529 * _2539;
    float _2559 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2561 = _1702 * _2551;
    float _2563 = -_2551;
    float _2565 = -_2559;
    float _2567 = fma(_2563, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2565);
    float _2569 = fma(_1698, _2549, _2561);
    float _2571 = -_2557;
    float _2573 = fma(_2571, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2567);
    float _2575 = fma(_1704, _2557, _2569);
    float _2577 = precise::clamp(_2575, 0.0, 1.0);
    float _2579 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2581 = _2573 + _2579;
    float _2583 = _2555 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2585 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2587 = precise::clamp(_2585, 0.0, 1.0);
    float _2589 = exp2(_2583);
    float _2591 = _2589 * _2587;
    float _2593 = _2577 * _2591;
    float _2595 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2597 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2599 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _2595;
    out.m_81.y = _2597;
    out.m_81.z = _2599;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2371 = false;
    bool _1752 = false;
    bool _594 = false;
    bool _474 = false;
    bool _342 = false;
    bool _180 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_46.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2655 = as_type<float>(_116);
        out.gl_Position.z = _2655;
    }
    if (!_106)
    {
        return out;
    }
    float _120 = in.m_51.w;
    float _122 = float(_102);
    float _124 = 1.0 / _122;
    float _126 = -_120;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_120);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = _128 * _124;
    bool _142 = _128 >= _122;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    out.m_53.x = _140;
    float _148 = _120;
    float _150 = _128;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _148;
    if (_146)
    {
        out.m_49.x = 0.0;
    }
    if (_146)
    {
        float _154 = _152 * 5.0;
        _118 = as_type<int>(_154);
    }
    int _156 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2727 = as_type<float>(_156);
        out.gl_Position.z = _2727;
    }
    if (_146)
    {
        return out;
    }
    bool _158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _160 = !_158;
    float _178;
    if (!_160)
    {
        float _162 = in.m_55.x;
        float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _168 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _170 = _168 * _164;
        float _172 = floor(_170);
        float _174 = -_172;
        float _176 = _170 + _174;
        _178 = _176;
        _180 = true;
    }
    else
    {
        _178 = _140;
    }
    _180 = false;
    float _182 = _178;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _186 = _182 + _184;
    bool _188 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _190 = isnan(_182);
    bool _192 = _188 || _190;
    bool _194 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _196 = _192 || _194;
    float _198 = float(_196);
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _182 + _200;
    bool _204 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _206 = isnan(_182);
    bool _208 = _204 || _206;
    bool _210 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _212 = _208 || _210;
    float _214 = float(_212);
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _224 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_182);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -_198;
    float _238 = _236 + 1.0;
    float _240 = 1.0 / _222;
    float _242 = _234 * _238;
    float _244 = -_234;
    float _246 = _244 + 1.0;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _248;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _254 = 1.0 / _218;
    float _256 = _214 * _246;
    float _258 = -_214;
    float _260 = _258 + 1.0;
    float _262 = _202 * _240;
    float _264 = _186 * _254;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = fma(_250, _264, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _276 = fma(_268, _264, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _278 = fma(_272, _264, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _280 = _274 * _256;
    float _282 = _276 * _256;
    float _284 = _278 * _256;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _298 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].x, _280);
    float _300 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].y, _282);
    float _302 = fma(_288, _262, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _304 = fma(_292, _262, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _306 = fma(_296, _262, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _308 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].z, _284);
    float _310 = fma(_302, _242, _298);
    float _312 = fma(_304, _242, _300);
    float _314 = fma(_306, _242, _308);
    float _316 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[145].x, _310);
    float _318 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[145].y, _312);
    float _320 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[145].z, _314);
    bool _322 = !_252;
    float _340;
    if (!_322)
    {
        float _324 = in.m_55.x;
        float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _328 = _324 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _332 = _330 * _326;
        float _334 = floor(_332);
        float _336 = -_334;
        float _338 = _332 + _336;
        _340 = _338;
        _342 = true;
    }
    else
    {
        _340 = _140;
    }
    _342 = false;
    float _344 = _340;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _348 = _344 + _346;
    float _350 = in.m_57.x;
    float _352 = in.m_57.y;
    float _354 = in.m_57.z;
    bool _356 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _358 = isnan(_344);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _368;
    bool _372 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _374 = isnan(_344);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_366;
    float _386 = _384 + 1.0;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _388;
    float _392 = 1.0 / _370;
    bool _394 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _396 = _382 * _386;
    float _398 = -_382;
    float _400 = _398 + 1.0;
    float _402 = _348 * _392;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _404;
    float _408 = _320 * _354;
    float _410 = fma(_390, _402, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _412 = _318 * _352;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _414;
    float _418 = fma(_406, _402, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _420 = _410 * _396;
    float _422 = _316 * _350;
    float _424 = fma(_416, _402, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _426 = _418 * _396;
    float _428 = _424 * _396;
    float _430 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _420);
    float _432 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _428);
    float _434 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _426);
    float _436 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].x, _430);
    float _438 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].y, _432);
    float _440 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].z, _434);
    float _442 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _444 = _438 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _446 = _440 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _448 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _452 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _448;
    out.m_59.y = _450;
    out.m_59.z = _452;
    bool _454 = !_394;
    float _472;
    if (!_454)
    {
        float _456 = in.m_55.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _460 = _456 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        _472 = _140;
    }
    _474 = false;
    float _476 = _472;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _480 = _476 + _478;
    bool _482 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _484 = isnan(_476);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _494;
    bool _498 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _500 = isnan(_476);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = -_492;
    float _512 = _510 + 1.0;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _514;
    float _518 = 1.0 / _496;
    bool _520 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _522 = _508 * _512;
    float _524 = -_508;
    float _526 = _524 + 1.0;
    float _528 = _480 * _518;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _530;
    float _534 = fma(_516, _528, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _536;
    float _540 = fma(_532, _528, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _542 = _534 * _522;
    float _544 = fma(_538, _528, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _546 = _540 * _522;
    float _548 = _544 * _522;
    float _550 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[123].x, _542);
    float _552 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[123].y, _548);
    float _554 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[123].z, _546);
    float _556 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[124].x, _550);
    float _558 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[124].y, _552);
    float _560 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[124].z, _554);
    float _562 = _556 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _564 = _558 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _566 = _560 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _568 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _568;
    out.m_61.y = _570;
    out.m_61.z = _572;
    bool _574 = !_520;
    float _592;
    if (!_574)
    {
        float _576 = in.m_55.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _592 = _590;
        _594 = true;
    }
    else
    {
        _592 = _140;
    }
    _594 = false;
    float _596 = _592;
    float _598 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _600 = log2(_598);
    float _602 = in.m_55.x;
    float _604 = in.m_55.y;
    float _606 = in.m_55.z;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _612 = 1.0 / _610;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _632 = _630 != 0;
    float _634 = 1.0 / _616;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _644 = 1.0 / _620;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _650 = _600 * _128;
    float _652 = _606 + _602;
    float _654 = _606 * 2.0;
    float _656 = _602 * 2.0;
    float _658 = _604 + (-0.5);
    float _660 = _604 * 2.0;
    float _662 = exp2(_650);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _664;
    bool _668 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _676 = _672 || _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _682 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(1.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = _652 + (-1.0);
    bool _694 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _696 = isnan(_596);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = 1.0 / _642;
    float _708 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _710 = 1.0 / _638;
    float _712 = _604 + _606;
    float _714 = -_662;
    float _716 = _714 + 1.0;
    float _718 = _712 + (-1.0);
    float _720 = _676 ? _716 : 0.0;
    float _722 = 1.0 / _648;
    float _724 = _606 + (-0.5);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _728 = 1.0 + _726;
    float _730 = _604 + _602;
    float _732 = _730 + (-1.0);
    float _734 = 1.0 / _728;
    float _736 = _602 + (-0.5);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _750 = _666 * _710;
    float _752 = _740 * _612;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _754;
    float _758 = floor(_654);
    float _760 = _748 * _634;
    float _762 = _756 * _644;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _768 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _770 = isnan(_596);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _782 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _784 = isnan(_596);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = 1.0 / _744;
    float _796 = _766 * _706;
    int _798 = as_type<int>(_780);
    if (_690)
    {
        float _800 = _720 * _734;
        _150 = _800;
    }
    float _802 = _150;
    float _804 = -_778;
    float _806 = _804 + 1.0;
    bool _808 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _810 = isnan(_596);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = _680 * _722;
    float _822 = floor(_656);
    bool _824 = _758 > 0.0;
    float _826 = _792 * _806;
    bool _828 = _758 >= 0.0;
    bool _830 = isnan(_758);
    bool _832 = _828 || _830;
    bool _834 = isnan(0.0);
    bool _836 = _832 || _834;
    float _838 = -_792;
    float _840 = _838 + 1.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _842;
    bool _846 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _848 = isnan(_596);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _860 = _596 + _858;
    float _862 = floor(_660);
    float _864 = -_818;
    float _866 = _864 + 1.0;
    float _868 = _844 * _794;
    float _870 = _818 * _840;
    bool _872 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _874 = isnan(_596);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = _856 * _866;
    float _886 = fma(_752, _860, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _888 = -_856;
    float _890 = _888 + 1.0;
    float _892 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _894 = in.m_46.x;
    float _896 = in.m_46.y;
    float _898 = in.m_46.z;
    bool _900 = _822 > 0.0;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _904 = _596 + _902;
    bool _906 = _822 >= 0.0;
    bool _908 = isnan(_822);
    bool _910 = _906 || _908;
    bool _912 = isnan(0.0);
    bool _914 = _910 || _912;
    float _916 = -_882;
    float _918 = _916 + 1.0;
    int _920 = _836 ? 0 : 1;
    float _922 = _882 * _890;
    bool _924 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _926 = isnan(_596);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = fma(_762, _904, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _938 = _862 >= 0.0;
    bool _940 = isnan(_862);
    bool _942 = _938 || _940;
    bool _944 = isnan(0.0);
    bool _946 = _942 || _944;
    bool _948 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _950 = isnan(_596);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = _934 * _918;
    int _962 = _946 ? 0 : 1;
    float _964 = -_934;
    float _966 = _964 + 1.0;
    bool _968 = _862 > 0.0;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _972 = _596 + _970;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _976 = _596 + _974;
    float _978 = -_958;
    float _980 = _978 + 1.0;
    float _982 = _958 * _966;
    float _984 = fma(_760, _972, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _986 = fma(_750, _976, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _990 = _596 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _994 = _596 + _992;
    float _996 = _704 * _980;
    int _998 = ~_920;
    int _1000 = _998 + 1;
    int _1002 = _1000 + 1;
    float _1004 = fma(_796, _990, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1006 = fma(_820, _994, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1008 = _886 * _996;
    int _1010 = ~_962;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    float _1016 = in.m_63.x;
    float _1018 = in.m_63.y;
    float _1020 = in.m_63.z;
    int _1022 = _1002;
    int _1024 = _1014;
    bool _1026 = _824;
    if (!_824)
    {
        int _1028 = ~_920;
        int _1030 = _1028 + 1;
        _1022 = _1030;
    }
    int _1032 = _1022;
    float _1034 = _896 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1036 = _898;
    if (!_968)
    {
        int _1038 = ~_962;
        int _1040 = _1038 + 1;
        _1024 = _1040;
    }
    int _1042 = _1024;
    float _1044 = _896 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1046 = !_624;
    int _1048 = _1046 ? 0 : 1;
    float _1050 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1034);
    float _1052 = float(_1032);
    float _1054 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1044);
    int _1056 = abs(_1048);
    float _1058 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1050);
    bool _1060 = !_632;
    int _1062 = _1060 ? 0 : 1;
    float _1064 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1054);
    float _1066 = float(_1056);
    float _1068 = -_704;
    float _1070 = _1068 + 1.0;
    int _1072 = abs(_1062);
    float _1074 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1076 = _1064 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1078 = _1066 * _1052;
    float _1080 = float(_1072);
    float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1084 = _1074 + _1082;
    float _1086 = float(_1042);
    float _1088 = -_1076;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1092 = _1078 * (-2.0);
    int _1094 = _914 ? 0 : 1;
    float _1096 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1008);
    float _1098 = _1080 * _1086;
    float _1100 = fma(_1092, _1016, _1016);
    float _1102 = abs(_1084);
    float _1104 = abs(_1090);
    float _1106 = precise::max(_1102, _1104);
    float _1108 = fma(_892, _1092, _892);
    bool _1110 = !_628;
    int _1112 = _1110 ? 0 : 1;
    float _1114 = _1098 * (-2.0);
    int _1116 = ~_1094;
    int _1118 = _1116 + 1;
    int _1120 = _1118 + 1;
    float _1122 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1100);
    int _1124 = _1120;
    float _1126 = _1090;
    float _1128 = _1076;
    float _1130 = _1074;
    if (!_900)
    {
        int _1132 = ~_1094;
        int _1134 = _1132 + 1;
        _1124 = _1134;
    }
    int _1136 = _1124;
    float _1138 = fma(_1114, _1020, _1020);
    bool _1140 = _1106 >= 16.0;
    float _1142 = fma(_1108, _802, _1122);
    int _1144 = abs(_1112);
    float _1146 = fma(_708, _1114, _708);
    float _1148 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1138);
    float _1150 = float(_1136);
    float _1152 = fma(_984, _982, _1096);
    float _1154 = _1084 * 0.0625;
    float _1156 = fma(_1146, _802, _1148);
    float _1158 = fma(_936, _960, _1152);
    float _1160 = float(_1144);
    float _1162 = in.m_65.x;
    float _1164 = in.m_65.y;
    float _1166 = in.m_65.z;
    float _1168 = _1140 ? _1154 : _1084;
    if (_1140)
    {
        float _1170 = _1090 * 0.0625;
        _1126 = _1170;
    }
    float _1172 = _1126;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1176 = _596 + _1174;
    float _1178 = _1160 * _1150;
    float _1180 = abs(_1168);
    bool _1182 = _1180 != 0.0;
    bool _1184 = isnan(_1180);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan(0.0);
    bool _1190 = _1186 || _1188;
    float _1192 = in.m_67.x;
    float _1194 = in.m_67.y;
    float _1196 = in.m_67.z;
    float _1198 = _1142 * 0.15915493667125701904296875;
    float _1200 = _1156 * 0.15915493667125701904296875;
    float _1202 = abs(_1172);
    bool _1204 = _1202 == 0.0;
    bool _1206 = !_1190;
    bool _1208 = _1204 && _1206;
    float _1210 = _1178 * (-2.0);
    float _1212 = abs(_1172);
    bool _1214 = _1212 == 0.0;
    float _1216 = fma(_1004, _922, _1158);
    float _1218 = _1198 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = fma(_868, _1176, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1224 = fma(_1210, _1018, _1018);
    float _1226 = fma(_986, _884, _1216);
    float _1228 = fma(_780, _1210, _780);
    float _1230 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1224);
    float _1232 = fma(_1006, _870, _1226);
    float _1234 = _1198 * 6.283185482025146484375;
    float _1236 = cos(_1234);
    int _1238 = as_type<int>(_1222);
    if (_1208)
    {
        bool _1240 = as_type<int>(_1172) >= 0;
        _1026 = _1240;
    }
    bool _1242 = _1026;
    float _1244 = fma(_1228, _802, _1230);
    float _1246 = fma(_1222, _826, _1232);
    int _1248 = _1242 ? (-1) : 0;
    if (_1208)
    {
        int _1250 = _1242 ? 0 : 1078530011;
        _798 = _1250;
    }
    int _1252 = _798;
    float _1254 = _1200 * 6.283185482025146484375;
    float _1256 = sin(_1254);
    if (_1208)
    {
        int _1258 = int(0x80000000) & as_type<int>(_1168);
        int _1260 = _1252 | _1258;
        _1238 = _1260;
    }
    int _1262 = _1238;
    bool _1264 = !_1190;
    bool _1266 = _1264 && _1214;
    int _1268 = _1262;
    float _1270 = as_type<float>(_1262);
    if (!_1266)
    {
        float _1272 = abs(_1168);
        bool _1274 = _1272 != as_type<float>(0x7f800000u /* inf */);
        bool _1276 = isnan(_1272);
        bool _1278 = _1274 || _1276;
        bool _1280 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1282 = _1278 || _1280;
        float _1284 = abs(_1172);
        bool _1286 = _1284 == as_type<float>(0x7f800000u /* inf */);
        float _1288 = abs(_1172);
        bool _1290 = _1288 == as_type<float>(0x7f800000u /* inf */);
        bool _1292 = !_1282;
        bool _1294 = _1290 && _1292;
        if (_1294)
        {
            bool _1296 = as_type<int>(_1172) >= 0;
            _1248 = _1296 ? (-1) : 0;
        }
        int _1298 = _1248;
        if (_1294)
        {
            _1268 = 1075235812;
        }
        int _1300 = _1268;
        int _1302 = _1300;
        if (_1294)
        {
            int _1304 = ~_1298;
            int _1306 = (_1304 != 0) ? _1300 : 1061752795;
            _1302 = _1306;
        }
        int _1308 = _1302;
        float _1310 = as_type<float>(_1308);
        if (_1294)
        {
            int _1312 = int(0x80000000) & as_type<int>(_1168);
            int _1314 = _1308 | _1312;
            _1310 = as_type<float>(_1314);
        }
        float _1316 = _1310;
        bool _1318 = !_1282;
        bool _1320 = _1318 && _1286;
        _1270 = _1316;
        if (!_1320)
        {
            float _1322 = abs(_1172);
            float _1324 = abs(_1168);
            float _1326 = precise::max(_1322, _1324);
            float _1328 = abs(_1172);
            float _1330 = abs(_1168);
            float _1332 = precise::min(_1328, _1330);
            float _1334 = 1.0 / _1326;
            float _1336 = abs(_1168);
            float _1338 = abs(_1172);
            bool _1340 = _1336 > _1338;
            bool _1342 = as_type<int>(_1172) >= 0;
            float _1344 = _1332 * _1334;
            float _1346 = abs(_1172);
            float _1348 = abs(_1168);
            float _1350 = _1346 + _1348;
            float _1352 = _1344 * _1344;
            bool _1354 = _1350 > as_type<float>(0x7f800000u /* inf */);
            bool _1356 = isnan(_1350);
            bool _1358 = _1354 || _1356;
            bool _1360 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1362 = _1358 || _1360;
            float _1364 = _1352 + 11.33538818359375;
            float _1366 = fma(_1352, _1364, 28.84246826171875);
            float _1368 = fma(_1352, _1366, 19.6966705322265625);
            float _1370 = fma(_1352, -0.82336294651031494140625, -5.674867153167724609375);
            float _1372 = fma(_1352, _1370, -6.565555095672607421875);
            float _1374 = 1.0 / _1368;
            float _1376 = _1352 * _1372;
            float _1378 = _1344 * _1376;
            float _1380 = fma(_1378, _1374, _1344);
            int _1382 = as_type<int>(_1168) & int(0x80000000);
            float _1384 = _1380;
            _1270 = _1350;
            if (_1340)
            {
                float _1386 = -_1380;
                float _1388 = _1386 + 1.57079637050628662109375;
                _1384 = _1388;
            }
            float _1390 = _1384;
            int _1392 = as_type<int>(_1390);
            if (!_1342)
            {
                float _1394 = -_1390;
                float _1396 = _1394 + 3.1415927410125732421875;
                _1392 = as_type<int>(_1396);
            }
            int _1398 = _1392;
            if (!_1362)
            {
                int _1400 = _1382 | _1398;
                _1270 = as_type<float>(_1400);
            }
        }
    }
    float _1402 = _1270;
    float _1404 = -_1402;
    float _1406 = _1244 + _1404;
    float _1408 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1246);
    float _1410 = -_1162;
    float _1412 = _1410 + _1192;
    float _1414 = _1200 * 6.283185482025146484375;
    float _1416 = cos(_1414);
    float _1418 = _1406 * 0.15915493667125701904296875;
    float _1420 = -_1166;
    float _1422 = _1420 + _1196;
    float _1424 = fma(_1408, _1412, _1162);
    float _1426 = -_1164;
    float _1428 = _1426 + _1194;
    float _1430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1432 = _896 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1434 = _1418 * 6.283185482025146484375;
    float _1436 = cos(_1434);
    float _1438 = fma(_1408, _1428, _1164);
    float _1440 = fma(_1408, _1422, _1166);
    float _1442 = _412 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1444 = _408 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1446 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1438);
    float _1448 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1424);
    float _1450 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1440);
    float _1452 = _1418 * 6.283185482025146484375;
    float _1454 = sin(_1452);
    float _1456 = _1446 * _1442;
    float _1458 = _1220 * _1416;
    float _1460 = _1448 * _1430;
    float _1462 = _1450 * _1444;
    float _1464 = -_1456;
    float _1466 = _1256 * _1464;
    float _1468 = _1458 * _1456;
    float _1470 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1432);
    float _1472 = _1220 * _1436;
    float _1474 = _1436 * _1416;
    float _1476 = _1236 * _1436;
    bool _1478 = _1438 != 0.0;
    bool _1480 = isnan(_1438);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan(0.0);
    bool _1486 = _1482 || _1484;
    float _1488 = fma(_1474, _1460, _1466);
    bool _1490 = _1424 == 0.0;
    bool _1492 = !_1486;
    bool _1494 = _1490 && _1492;
    float _1496 = _1236 * _1454;
    float _1498 = _1220 * _1454;
    float _1500 = _1454 * _1416;
    float _1502 = _1236 * _1416;
    float _1504 = -_1496;
    float _1506 = fma(_1256, _1472, _1504);
    float _1508 = fma(_1256, _1498, _1476);
    float _1510 = fma(_1500, _1462, _1488);
    float _1512 = fma(_1256, _1476, _1498);
    float _1514 = fma(_1506, _1460, _1468);
    float _1516 = _1502 * _1456;
    float _1518 = _1074 + _1510;
    float _1520 = -_1472;
    float _1522 = fma(_1256, _1496, _1520);
    float _1524 = fma(_1508, _1462, _1514);
    float _1526 = in.m_69.x;
    float _1528 = in.m_69.y;
    float _1530 = in.m_69.z;
    float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1534 = _1518 + _1532;
    float _1536 = fma(_1512, _1460, _1516);
    float _1538 = _1076 + _1524;
    float _1540 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1470);
    float _1542 = _1534 * _1534;
    float _1544 = fma(_1522, _1462, _1536);
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1548 = _1538 + _1546;
    float _1550 = _1540 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1552 = _1440 == 0.0;
    bool _1554 = _1552 && _1494;
    float _1556 = _1548 * _1548;
    float _1558 = _1550 + _1544;
    float _1560 = _1542 + _1556;
    float _1562 = sqrt(_1560);
    bool _1564 = _1562 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1566 = _1462;
    float _1568 = _1460;
    float _1570 = _1544;
    float _1572 = _1536;
    float _1574 = _1438;
    float _1576 = _1534;
    if (!_1564)
    {
        _1566 = _1556;
    }
    float _1578 = _1566;
    float _1580 = _1578;
    if (!_1564)
    {
        _1568 = _1542;
    }
    float _1582 = _1568;
    float _1584 = _1582;
    if (!_1564)
    {
        _1036 = _1518;
    }
    float _1586 = _1036;
    float _1588 = _1586;
    if (!_1564)
    {
        _1570 = _1538;
    }
    float _1590 = _1570;
    float _1592 = _1590;
    if (!_1564)
    {
        _1572 = _1558;
    }
    float _1594 = _1572;
    bool _1596 = !_1564;
    float _1598 = _1594;
    float _1600 = _1528;
    float _1602 = _1526;
    float _1604 = _1530;
    if (!_1596)
    {
        float _1606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1610 = _1562 + _1608;
        float _1612 = _1558 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1614 = rsqrt(_1560);
        float _1616 = _1610 * _1606;
        float _1618 = _1616 * 0.15915493667125701904296875;
        float _1620 = _1618 * 6.283185482025146484375;
        float _1622 = sin(_1620);
        float _1624 = _1618 * 6.283185482025146484375;
        float _1626 = cos(_1624);
        float _1628 = fma(_1622, _1612, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1630 = _1614 * _1628;
        float _1632 = _1626 + (-1.0);
        float _1634 = fma(_1534, _1630, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1636 = fma(_1548, _1630, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1638 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1642 = _1634 + _1640;
        float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1646 = _1636 + _1644;
        float _1648 = fma(_1558, _1626, _1638);
        float _1650 = _1642 * _1642;
        float _1652 = _1646 * _1646;
        _1598 = _1648;
        _1584 = _1650;
        _1580 = _1652;
        _1592 = _1636;
        _1588 = _1634;
    }
    float _1654 = _1598;
    float _1656 = _1584;
    float _1658 = _1580;
    float _1660 = _1592;
    float _1662 = _1588;
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1666 = _1654 + _1664;
    if (!_1554)
    {
        float _1668 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1528);
        _1600 = _1668;
    }
    float _1670 = _1600;
    if (!_1554)
    {
        float _1672 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1526);
        _1602 = _1672;
    }
    float _1674 = _1602;
    if (!_1554)
    {
        float _1676 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1530);
        _1604 = _1676;
    }
    float _1678 = _1604;
    float _1680 = fma(_1666, _1666, _1656);
    float _1682 = -_1670;
    float _1684 = _1256 * _1682;
    float _1686 = _1502 * _1670;
    float _1688 = _1458 * _1670;
    float _1690 = _1680 + _1658;
    float _1692 = fma(_1474, _1674, _1684);
    float _1694 = fma(_1512, _1674, _1686);
    float _1696 = fma(_1506, _1674, _1688);
    out.m_71.y = _1194;
    float _1698 = fma(_1500, _1678, _1692);
    float _1700 = sqrt(_1690);
    float _1702 = fma(_1522, _1678, _1694);
    float _1704 = fma(_1508, _1678, _1696);
    out.m_73.x = _1698;
    out.m_73.y = _1702;
    out.m_73.z = _1704;
    bool _1706 = _1700 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1708 = isnan(_1700);
    bool _1710 = _1706 || _1708;
    bool _1712 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1714 = _1710 || _1712;
    float _1716 = _1696;
    if (!_1714)
    {
        _1574 = 1.0;
    }
    float _1718 = _1574;
    bool _1720 = !_1714;
    float _1722 = _1718;
    if (!_1720)
    {
        bool _1724 = _1700 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1726 = isnan(_1700);
        bool _1728 = _1724 || _1726;
        bool _1730 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1732 = _1728 || _1730;
        if (!_1732)
        {
            float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1736 = _1700 + _1734;
            float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1740 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1738;
            float _1742 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1744 = _1742 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1746 = 1.0 / _1740;
            float _1748 = _1736 * _1746;
            float _1750 = fma(_1748, _1744, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1722 = _1750;
            _1752 = true;
        }
        else
        {
            bool _1754 = _1700 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1756 = isnan(_1700);
            bool _1758 = _1754 || _1756;
            bool _1760 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1762 = _1758 || _1760;
            if (!_1762)
            {
                float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1766 = _1700 + _1764;
                float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1770 = _1768 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1774 = _1772 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1776 = 1.0 / _1770;
                float _1778 = _1766 * _1776;
                float _1780 = fma(_1778, _1774, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1722 = _1780;
                _1752 = true;
            }
            else
            {
                _1722 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1752 = false;
    float _1782 = _1722;
    float _1784 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1786 = _1654 + _1784;
    float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1790 = _1660 + _1788;
    bool _1792 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan(0.5);
    bool _1800 = _1796 || _1798;
    float _1802 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1804 = _1662 + _1802;
    float _1806 = fma(_1786, _1782, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1808 = fma(_1790, _1782, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1810 = fma(_1804, _1782, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1812 = _1782;
    float _1814 = _1804;
    if (_1800)
    {
        _1812 = _1810;
    }
    float _1816 = _1812;
    float _1818 = _1816;
    if (_1800)
    {
        _1814 = _1806;
    }
    float _1820 = _1814;
    float _1822 = _1820;
    if (_1800)
    {
        _1716 = _1808;
    }
    float _1824 = _1716;
    float _1826 = _1824;
    if (!_1800)
    {
        float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1830 = _1550 + _1828;
        float _1832 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1834 = _1830 * _1830;
        float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1838 = _1076 + _1836;
        float _1840 = fma(_1084, _1084, _1834);
        float _1842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1844 = fma(_1838, _1838, _1840);
        float _1846 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1848 = sqrt(_1844);
        float _1850 = precise::min(_1848, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1852 = _1850 * _1842;
        float _1854 = -_1074;
        float _1856 = _1854 + _1810;
        float _1858 = _1846 * _1852;
        float _1860 = -_1550;
        float _1862 = _1860 + _1806;
        float _1864 = -_1076;
        float _1866 = _1864 + _1808;
        float _1868 = fma(_1856, _1858, _1074);
        float _1870 = fma(_1862, _1858, _1550);
        float _1872 = fma(_1866, _1858, _1076);
        _1822 = _1870;
        _1818 = _1868;
        _1826 = _1872;
    }
    float _1874 = _1822;
    float _1876 = _1818;
    float _1878 = _1826;
    float _1880 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1882 = _1874 + _1880;
    float _1884 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1886 = _1876 + _1884;
    float _1888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1890 = _1878 + _1888;
    float _1892 = _1882 * _1882;
    float _1894 = fma(_1886, _1886, _1892);
    float _1896 = fma(_1890, _1890, _1894);
    float _1898 = rsqrt(_1896);
    float _1900 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1902 = _1886 * _1900;
    float _1904 = _1890 * _1900;
    float _1906 = _1902 * _1902;
    float _1908 = _1904 * _1904;
    float _1910 = _1906 + _1908;
    float _1912 = sqrt(_1910);
    bool _1914 = _1912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1918 = _1912 + _1916;
    float _1920 = _1898;
    float _1922 = _1918;
    float _1924 = _1882;
    float _1926 = _1902;
    if (_1914)
    {
        float _1928 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1920 = _1928;
    }
    float _1930 = _1920;
    if (_1914)
    {
        float _1932 = rsqrt(_1910);
        _1128 = _1932;
    }
    float _1934 = _1128;
    float _1936 = _1934;
    if (_1914)
    {
        float _1938 = _1918 * _1930;
        _1922 = _1938;
    }
    float _1940 = _1922;
    if (_1914)
    {
        float _1942 = _1940 * 0.15915493667125701904296875;
        _1130 = _1942;
    }
    float _1944 = _1130;
    float _1946 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1948 = _1890;
    float _1950 = _1944;
    if (_1914)
    {
        float _1952 = _1944 * 6.283185482025146484375;
        float _1954 = sin(_1952);
        _1948 = _1954;
    }
    float _1956 = _1948;
    float _1958 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1960 = precise::max(0.0, _1958);
    float _1962 = _1930;
    float _1964 = _1960;
    if (_1914)
    {
        float _1966 = _1944 * 6.283185482025146484375;
        float _1968 = cos(_1966);
        _1962 = _1968;
    }
    float _1970 = _1962;
    float _1972 = -_1900;
    float _1974 = -_1960;
    float _1976 = fma(_1882, _1972, _1974);
    if (_1914)
    {
        float _1978 = _1976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1924 = _1978;
    }
    float _1980 = _1924;
    float _1982 = _1980;
    float _1984 = _1956;
    if (_1914)
    {
        float _1986 = fma(_1956, _1980, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1982 = _1986;
    }
    float _1988 = _1982;
    float _1990 = _1988;
    if (!_1914)
    {
        _1984 = _1904;
    }
    float _1992 = _1984;
    float _1994 = _1992;
    float _1996 = _1970;
    if (_1914)
    {
        float _1998 = _1970 + (-1.0);
        _1964 = _1998;
    }
    float _2000 = _1964;
    if (_1914)
    {
        float _2002 = _1934 * _1988;
        _1576 = _2002;
    }
    float _2004 = _1576;
    if (!_1914)
    {
        _1936 = _1976;
    }
    float _2006 = _1936;
    float _2008 = _2006;
    if (_1914)
    {
        float _2010 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1950 = _2010;
    }
    float _2012 = _1950;
    if (_1914)
    {
        float _2014 = _1902 * _2004;
        _1926 = _2014;
    }
    float _2016 = _1926;
    float _2018 = sqrt(_1896);
    if (!_1914)
    {
        _1990 = _1906;
    }
    float _2020 = _1990;
    float _2022 = _2020;
    if (_1914)
    {
        float _2024 = fma(_1976, _1970, _2012);
        _2008 = _2024;
    }
    float _2026 = _2008;
    if (_1914)
    {
        float _2028 = _1904 * _2004;
        _1994 = _2028;
    }
    float _2030 = _1994;
    if (_1914)
    {
        float _2032 = _2016 * _2016;
        _2022 = _2032;
    }
    float _2034 = _2022;
    if (!_1914)
    {
        _1996 = _1908;
    }
    float _2036 = _1996;
    float _2038 = _1874 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2040 = _2036;
    if (_1914)
    {
        float _2042 = _2030 * _2030;
        _2040 = _2042;
    }
    float _2044 = _2040;
    float _2046 = fma(_2026, _2026, _2034);
    float _2048 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2038);
    float _2050 = _1874 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2052 = _2046 + _2044;
    float _2054 = _1874 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2056 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2050);
    float _2058 = rsqrt(_2052);
    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2062 = fma(_2018, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2060);
    float _2064 = precise::clamp(_2062, 0.0, 1.0);
    float _2066 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2048);
    float _2068 = _1874 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2070 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2056);
    float _2072 = -_2064;
    float _2074 = _2072 + 1.0;
    float _2076 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2054);
    float _2078 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2068);
    float _2080 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2082 = abs(_2074);
    float _2084 = log2(_2082);
    float _2086 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2078);
    float _2088 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2090 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2076);
    float _2092 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2094 = _2058 * _2016;
    float _2096 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2098 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2100 = _2058 * _2026;
    float _2102 = _2094 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2104 = _2058 * _2030;
    float _2106 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2098);
    float _2108 = -_2092;
    float _2110 = fma(_2108, _1946, 1.0);
    float _2112 = -_2102;
    float _2114 = fma(_2100, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2112);
    float _2116 = _2090 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2118 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2106);
    float _2120 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2122 = -_2104;
    float _2124 = fma(_2122, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2114);
    float _2126 = log2(_2110);
    float _2128 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2118);
    float _2130 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2132 = fma(_2124, -0.5, 0.5);
    float _2134 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2136 = fma(_2124, 0.5, 0.5);
    float _2138 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2130);
    float _2140 = _2100 + 1.0;
    float _2142 = exp2(_2120);
    float _2144 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2134);
    float _2146 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2138);
    float _2148 = fma(_2136, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2150 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2144);
    float _2152 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2146);
    float _2154 = fma(_2136, _2148, -0.212114393711090087890625);
    float _2156 = 1.0 / _2128;
    float _2158 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2150);
    float _2160 = _2126 * 0.693147182464599609375;
    float _2162 = fma(_2136, _2154, 1.570728778839111328125);
    float _2164 = _2160 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2166 = sqrt(_2132);
    float _2168 = -_2100;
    float _2170 = fma(_2142, _2140, _2168);
    float _2172 = fma(_2170, 0.5, 0.5);
    float _2174 = _2152 * _2156;
    float _2176 = _2158 * _2156;
    float _2178 = fma(_2174, 0.5, 0.5);
    float _2180 = fma(_2176, -0.5, 0.5);
    float _2182 = _2166 * 0.636619746685028076171875;
    float3 _5913 = float3(_2178, _2180, _2164);
    float _2184 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5913, float3(0.0), isnan(_5913)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5913, float3(0.0), isnan(_5913)), level(0.0)).x;
    float3 _5924 = float3(_2178, _2180, _2164);
    float4 _2187 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5924, float3(0.0), isnan(_5924)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5924, float3(0.0), isnan(_5924)), level(0.0)).xyzw;
    float _2189 = _2187.x;
    float _2191 = _2187.y;
    float _2193 = _2187.z;
    float _2195 = _2187.w;
    float _2197 = -_2162;
    float _2199 = fma(_2182, _2197, 1.0);
    float2 _5946 = float2(_2199, _2172);
    float3 _2203 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5946, float2(0.0), isnan(_5946)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5946, float2(0.0), isnan(_5946)), level(0.0)).xyz;
    float _2205 = _2203.x;
    float _2207 = _2203.y;
    float _2209 = _2203.z;
    float _2211 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2213 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _1876;
    out.m_75.y = _1874;
    out.m_75.z = _1878;
    bool _2215 = _2018 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2217 = isnan(_2018);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2223 = _2219 || _2221;
    float _2225 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2213);
    float _2227 = exp2(_2211);
    float _2229 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2225);
    float _2231 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2229);
    float _2233 = _2231 + _2128;
    out.gl_Position.x = _2152;
    out.gl_Position.y = _2158;
    out.gl_Position.z = _2231;
    out.gl_Position.w = _2128;
    float _2235 = _2233 * 0.5;
    float _2237 = -_2227;
    float _2239 = _2237 + 1.0;
    float _2241 = _2233;
    float _2243 = _2128;
    float _2245 = _2231;
    float _2247 = _2158;
    float _2249 = _2152;
    if (!_2223)
    {
        _2241 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2251 = _2241;
    float _2253 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _2235;
    out.m_77.w = _2128;
    float _2255 = -_2253;
    float _2257 = _2255 + 1.0;
    float _2259 = _2257;
    float _2261 = _2251;
    float _2263 = _2251;
    if (!_2223)
    {
        _2243 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2265 = _2243;
    float _2267 = _2265;
    float _2269 = _2265;
    if (!_2223)
    {
        _2245 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2271 = _2245;
    float _2273 = _2271;
    float _2275 = _2271;
    if (!_2223)
    {
        _2247 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2277 = _2247;
    float _2279 = _2277;
    float _2281 = _2277;
    if (!_2223)
    {
        _2249 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2283 = _2249;
    float _2285 = _2253 * _2184;
    float _2287 = _2195 * _2285;
    float _2289 = _2195 * _2257;
    float _2291 = _2283;
    float _2293 = _2283;
    if (!_2223)
    {
        _2259 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2295 = _2259;
    float _2297 = _2209 * _2285;
    float _2299 = fma(_2205, _2287, _2189);
    float _2301 = fma(_2207, _2287, _2191);
    float _2303 = fma(_2195, _2297, _2193);
    out.m_79.x = _2299;
    out.m_79.y = _2301;
    out.m_79.z = _2303;
    out.m_79.w = _2289;
    bool _2305 = !_2223;
    float _2307 = _2295;
    float _2309 = _2295;
    if (!_2305)
    {
        bool _2311 = _2018 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2313 = isnan(_2018);
        bool _2315 = _2311 || _2313;
        bool _2317 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2319 = _2315 || _2317;
        if (!_2319)
        {
            float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2323 = _2018 + _2321;
            float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2327 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2325;
            float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2333 = 1.0 / _2327;
            float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2337 = _2335 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2345 = _2343 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2351 = _2323 * _2333;
            float _2353 = precise::clamp(_2351, 0.0, 1.0);
            float _2355 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2357 = _2355 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2359 = fma(_2353, _2331, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2361 = fma(_2353, _2357, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2363 = fma(_2353, _2337, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2365 = fma(_2353, _2341, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2367 = fma(_2353, _2345, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2369 = fma(_2353, _2349, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2309 = _2363;
            _2281 = _2367;
            _2263 = _2359;
            _2275 = _2365;
            _2269 = _2361;
            _2293 = _2369;
            _2371 = true;
        }
        else
        {
            bool _2373 = _2018 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2375 = isnan(_2018);
            bool _2377 = _2373 || _2375;
            bool _2379 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2381 = _2377 || _2379;
            if (!_2381)
            {
                _2261 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2383 = _2261;
            _2263 = _2383;
            if (!_2381)
            {
                _2307 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2385 = _2307;
            _2309 = _2385;
            if (!_2381)
            {
                _2267 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2387 = _2267;
            _2269 = _2387;
            if (!_2381)
            {
                _2273 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2389 = _2273;
            _2275 = _2389;
            if (!_2381)
            {
                _2279 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2391 = _2279;
            _2281 = _2391;
            if (!_2381)
            {
                _2291 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2393 = _2291;
            bool _2395 = !_2381;
            _2293 = _2393;
            if (!_2395)
            {
                bool _2397 = _2018 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2399 = isnan(_2018);
                bool _2401 = _2397 || _2399;
                bool _2403 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2405 = _2401 || _2403;
                if (!_2405)
                {
                    float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2409 = _2018 + _2407;
                    float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2413 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2411;
                    float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2417 = _2415 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2419 = 1.0 / _2413;
                    float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2429 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2431 = _2429 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2437 = _2409 * _2419;
                    float _2439 = precise::clamp(_2437, 0.0, 1.0);
                    float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2443 = _2441 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2445 = fma(_2439, _2417, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2447 = fma(_2439, _2443, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2449 = fma(_2439, _2423, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2451 = fma(_2439, _2427, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2453 = fma(_2439, _2431, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2455 = fma(_2439, _2435, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2309 = _2449;
                    _2281 = _2453;
                    _2263 = _2445;
                    _2275 = _2451;
                    _2269 = _2447;
                    _2293 = _2455;
                    _2371 = true;
                }
                else
                {
                    _2309 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2281 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2263 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2275 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2269 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2293 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2371 = false;
    float _2457 = _2309;
    float _2459 = _2281;
    float _2461 = _2263;
    float _2463 = _2275;
    float _2465 = _2269;
    float _2467 = _2293;
    float _2469 = fma(_1702, -0.5, 0.5);
    float _2471 = precise::clamp(_2469, 0.0, 1.0);
    float _2473 = -_2457;
    float _2475 = _2473 + _2459;
    float _2477 = -_2461;
    float _2479 = _2477 + _2463;
    float _2481 = -_2465;
    float _2483 = _2481 + _2467;
    bool _2485 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2487 = fma(_2471, _2475, _2457);
    float _2489 = fma(_2471, _2479, _2461);
    float _2491 = fma(_2471, _2483, _2465);
    float _2493 = _2487 * 0.586610972881317138671875;
    out.m_81.x = 0.0;
    float _2495 = fma(_2489, 0.298911988735198974609375, _2493);
    float _2497 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2499 = fma(_2491, 0.114477999508380889892578125, _2495);
    out.m_49.x = _2497;
    float _2501 = -_2499;
    float _2503 = _2489 + _2501;
    float _2505 = -_2499;
    float _2507 = _2487 + _2505;
    float _2509 = -_2499;
    float _2511 = _2491 + _2509;
    float _2513 = fma(_2503, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2499);
    float _2515 = fma(_2507, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2499);
    float _2517 = fma(_2511, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2499);
    out.m_83.x = _2513;
    out.m_83.y = _2515;
    out.m_83.z = _2517;
    if (!_2485)
    {
        return out;
    }
    float _2519 = -_1874;
    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2523 = -_1876;
    float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2527 = -_1878;
    float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2531 = _2521 * _2521;
    float _2533 = fma(_2525, _2525, _2531);
    float _2535 = fma(_2529, _2529, _2533);
    float _2537 = sqrt(_2535);
    float _2539 = rsqrt(_2535);
    float _2541 = -_2537;
    float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2545 = _2543 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2547 = precise::clamp(_2545, 0.0, 1.0);
    float _2549 = _2525 * _2539;
    float _2551 = _2521 * _2539;
    float _2553 = abs(_2547);
    float _2555 = log2(_2553);
    float _2557 = _2529 * _2539;
    float _2559 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2561 = _1702 * _2551;
    float _2563 = -_2551;
    float _2565 = -_2559;
    float _2567 = fma(_2563, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2565);
    float _2569 = fma(_1698, _2549, _2561);
    float _2571 = -_2557;
    float _2573 = fma(_2571, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2567);
    float _2575 = fma(_1704, _2557, _2569);
    float _2577 = precise::clamp(_2575, 0.0, 1.0);
    float _2579 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2581 = _2573 + _2579;
    float _2583 = _2555 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2585 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2587 = precise::clamp(_2585, 0.0, 1.0);
    float _2589 = exp2(_2583);
    float _2591 = _2589 * _2587;
    float _2593 = _2577 * _2591;
    float _2595 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2597 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2599 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _2595;
    out.m_81.y = _2597;
    out.m_81.z = _2599;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2371 = false;
    bool _1752 = false;
    bool _594 = false;
    bool _474 = false;
    bool _342 = false;
    bool _180 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_46.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2655 = as_type<float>(_116);
        out.gl_Position.z = _2655;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_51.w;
    float _122 = float(_102);
    float _124 = 1.0 / _122;
    float _126 = -_120;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_120);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = _128 * _124;
    bool _142 = _128 >= _122;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    out.m_53.x = _140;
    float _148 = _120;
    float _150 = _128;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _148;
    if (_146)
    {
        out.m_49.x = 0.0;
    }
    if (_146)
    {
        float _154 = _152 * 5.0;
        _118 = as_type<int>(_154);
    }
    int _156 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2727 = as_type<float>(_156);
        out.gl_Position.z = _2727;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _160 = !_158;
    float _178;
    if (!_160)
    {
        float _162 = in.m_55.x;
        float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _166 = _162 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _168 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _170 = _168 * _164;
        float _172 = floor(_170);
        float _174 = -_172;
        float _176 = _170 + _174;
        _178 = _176;
        _180 = true;
    }
    else
    {
        _178 = _140;
    }
    _180 = false;
    float _182 = _178;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _186 = _182 + _184;
    bool _188 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _190 = isnan(_182);
    bool _192 = _188 || _190;
    bool _194 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _196 = _192 || _194;
    float _198 = float(_196);
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _182 + _200;
    bool _204 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _206 = isnan(_182);
    bool _208 = _204 || _206;
    bool _210 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _212 = _208 || _210;
    float _214 = float(_212);
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _224 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_182);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -_198;
    float _238 = _236 + 1.0;
    float _240 = 1.0 / _222;
    float _242 = _234 * _238;
    float _244 = -_234;
    float _246 = _244 + 1.0;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _250 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _248;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _254 = 1.0 / _218;
    float _256 = _214 * _246;
    float _258 = -_214;
    float _260 = _258 + 1.0;
    float _262 = _202 * _240;
    float _264 = _186 * _254;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = fma(_250, _264, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _276 = fma(_268, _264, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _278 = fma(_272, _264, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _280 = _274 * _256;
    float _282 = _276 * _256;
    float _284 = _278 * _256;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _298 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].x, _280);
    float _300 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].y, _282);
    float _302 = fma(_288, _262, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _304 = fma(_292, _262, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _306 = fma(_296, _262, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _308 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].z, _284);
    float _310 = fma(_302, _242, _298);
    float _312 = fma(_304, _242, _300);
    float _314 = fma(_306, _242, _308);
    float _316 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[145].x, _310);
    float _318 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[145].y, _312);
    float _320 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[145].z, _314);
    bool _322 = !_252;
    float _340;
    if (!_322)
    {
        float _324 = in.m_55.x;
        float _326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _328 = _324 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _330 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _332 = _330 * _326;
        float _334 = floor(_332);
        float _336 = -_334;
        float _338 = _332 + _336;
        _340 = _338;
        _342 = true;
    }
    else
    {
        _340 = _140;
    }
    _342 = false;
    float _344 = _340;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _348 = _344 + _346;
    float _350 = in.m_57.x;
    float _352 = in.m_57.y;
    float _354 = in.m_57.z;
    bool _356 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _358 = isnan(_344);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _368;
    bool _372 = _344 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _374 = isnan(_344);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_366;
    float _386 = _384 + 1.0;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _388;
    float _392 = 1.0 / _370;
    bool _394 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _396 = _382 * _386;
    float _398 = -_382;
    float _400 = _398 + 1.0;
    float _402 = _348 * _392;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _404;
    float _408 = _320 * _354;
    float _410 = fma(_390, _402, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _412 = _318 * _352;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _414;
    float _418 = fma(_406, _402, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _420 = _410 * _396;
    float _422 = _316 * _350;
    float _424 = fma(_416, _402, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _426 = _418 * _396;
    float _428 = _424 * _396;
    float _430 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _420);
    float _432 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _428);
    float _434 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _426);
    float _436 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].x, _430);
    float _438 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].y, _432);
    float _440 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[108].z, _434);
    float _442 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _444 = _438 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _446 = _440 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _448 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _452 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _448;
    out.m_59.y = _450;
    out.m_59.z = _452;
    bool _454 = !_394;
    float _472;
    if (!_454)
    {
        float _456 = in.m_55.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _460 = _456 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        _472 = _140;
    }
    _474 = false;
    float _476 = _472;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _480 = _476 + _478;
    bool _482 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _484 = isnan(_476);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _494;
    bool _498 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _500 = isnan(_476);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = -_492;
    float _512 = _510 + 1.0;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _514;
    float _518 = 1.0 / _496;
    bool _520 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _522 = _508 * _512;
    float _524 = -_508;
    float _526 = _524 + 1.0;
    float _528 = _480 * _518;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _530;
    float _534 = fma(_516, _528, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _536;
    float _540 = fma(_532, _528, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _542 = _534 * _522;
    float _544 = fma(_538, _528, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _546 = _540 * _522;
    float _548 = _544 * _522;
    float _550 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[123].x, _542);
    float _552 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[123].y, _548);
    float _554 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[123].z, _546);
    float _556 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[124].x, _550);
    float _558 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[124].y, _552);
    float _560 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[124].z, _554);
    float _562 = _556 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _564 = _558 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _566 = _560 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _568 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _568;
    out.m_61.y = _570;
    out.m_61.z = _572;
    bool _574 = !_520;
    float _592;
    if (!_574)
    {
        float _576 = in.m_55.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _592 = _590;
        _594 = true;
    }
    else
    {
        _592 = _140;
    }
    _594 = false;
    float _596 = _592;
    float _598 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _600 = log2(_598);
    float _602 = in.m_55.x;
    float _604 = in.m_55.y;
    float _606 = in.m_55.z;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _612 = 1.0 / _610;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _624 = _622 != 0;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _632 = _630 != 0;
    float _634 = 1.0 / _616;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _644 = 1.0 / _620;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _650 = _600 * _128;
    float _652 = _606 + _602;
    float _654 = _606 * 2.0;
    float _656 = _602 * 2.0;
    float _658 = _604 + (-0.5);
    float _660 = _604 * 2.0;
    float _662 = exp2(_650);
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _664;
    bool _668 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _676 = _672 || _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _682 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(1.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = _652 + (-1.0);
    bool _694 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _696 = isnan(_596);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = 1.0 / _642;
    float _708 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _710 = 1.0 / _638;
    float _712 = _604 + _606;
    float _714 = -_662;
    float _716 = _714 + 1.0;
    float _718 = _712 + (-1.0);
    float _720 = _676 ? _716 : 0.0;
    float _722 = 1.0 / _648;
    float _724 = _606 + (-0.5);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _728 = 1.0 + _726;
    float _730 = _604 + _602;
    float _732 = _730 + (-1.0);
    float _734 = 1.0 / _728;
    float _736 = _602 + (-0.5);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _750 = _666 * _710;
    float _752 = _740 * _612;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _754;
    float _758 = floor(_654);
    float _760 = _748 * _634;
    float _762 = _756 * _644;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _768 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _770 = isnan(_596);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _782 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _784 = isnan(_596);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = 1.0 / _744;
    float _796 = _766 * _706;
    int _798 = as_type<int>(_780);
    if (_690)
    {
        float _800 = _720 * _734;
        _150 = _800;
    }
    float _802 = _150;
    float _804 = -_778;
    float _806 = _804 + 1.0;
    bool _808 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _810 = isnan(_596);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = _680 * _722;
    float _822 = floor(_656);
    bool _824 = _758 > 0.0;
    float _826 = _792 * _806;
    bool _828 = _758 >= 0.0;
    bool _830 = isnan(_758);
    bool _832 = _828 || _830;
    bool _834 = isnan(0.0);
    bool _836 = _832 || _834;
    float _838 = -_792;
    float _840 = _838 + 1.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _842;
    bool _846 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _848 = isnan(_596);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _860 = _596 + _858;
    float _862 = floor(_660);
    float _864 = -_818;
    float _866 = _864 + 1.0;
    float _868 = _844 * _794;
    float _870 = _818 * _840;
    bool _872 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _874 = isnan(_596);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = _856 * _866;
    float _886 = fma(_752, _860, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _888 = -_856;
    float _890 = _888 + 1.0;
    float _892 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _894 = in.m_46.x;
    float _896 = in.m_46.y;
    float _898 = in.m_46.z;
    bool _900 = _822 > 0.0;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _904 = _596 + _902;
    bool _906 = _822 >= 0.0;
    bool _908 = isnan(_822);
    bool _910 = _906 || _908;
    bool _912 = isnan(0.0);
    bool _914 = _910 || _912;
    float _916 = -_882;
    float _918 = _916 + 1.0;
    int _920 = _836 ? 0 : 1;
    float _922 = _882 * _890;
    bool _924 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _926 = isnan(_596);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = fma(_762, _904, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _938 = _862 >= 0.0;
    bool _940 = isnan(_862);
    bool _942 = _938 || _940;
    bool _944 = isnan(0.0);
    bool _946 = _942 || _944;
    bool _948 = _596 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _950 = isnan(_596);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = _934 * _918;
    int _962 = _946 ? 0 : 1;
    float _964 = -_934;
    float _966 = _964 + 1.0;
    bool _968 = _862 > 0.0;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _972 = _596 + _970;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _976 = _596 + _974;
    float _978 = -_958;
    float _980 = _978 + 1.0;
    float _982 = _958 * _966;
    float _984 = fma(_760, _972, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _986 = fma(_750, _976, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _990 = _596 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _994 = _596 + _992;
    float _996 = _704 * _980;
    int _998 = ~_920;
    int _1000 = _998 + 1;
    int _1002 = _1000 + 1;
    float _1004 = fma(_796, _990, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1006 = fma(_820, _994, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1008 = _886 * _996;
    int _1010 = ~_962;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    float _1016 = in.m_63.x;
    float _1018 = in.m_63.y;
    float _1020 = in.m_63.z;
    int _1022 = _1002;
    int _1024 = _1014;
    bool _1026 = _824;
    if (!_824)
    {
        int _1028 = ~_920;
        int _1030 = _1028 + 1;
        _1022 = _1030;
    }
    int _1032 = _1022;
    float _1034 = _896 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1036 = _898;
    if (!_968)
    {
        int _1038 = ~_962;
        int _1040 = _1038 + 1;
        _1024 = _1040;
    }
    int _1042 = _1024;
    float _1044 = _896 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1046 = !_624;
    int _1048 = _1046 ? 0 : 1;
    float _1050 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1034);
    float _1052 = float(_1032);
    float _1054 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1044);
    int _1056 = abs(_1048);
    float _1058 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1050);
    bool _1060 = !_632;
    int _1062 = _1060 ? 0 : 1;
    float _1064 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1054);
    float _1066 = float(_1056);
    float _1068 = -_704;
    float _1070 = _1068 + 1.0;
    int _1072 = abs(_1062);
    float _1074 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1076 = _1064 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1078 = _1066 * _1052;
    float _1080 = float(_1072);
    float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1084 = _1074 + _1082;
    float _1086 = float(_1042);
    float _1088 = -_1076;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1092 = _1078 * (-2.0);
    int _1094 = _914 ? 0 : 1;
    float _1096 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1008);
    float _1098 = _1080 * _1086;
    float _1100 = fma(_1092, _1016, _1016);
    float _1102 = abs(_1084);
    float _1104 = abs(_1090);
    float _1106 = precise::max(_1102, _1104);
    float _1108 = fma(_892, _1092, _892);
    bool _1110 = !_628;
    int _1112 = _1110 ? 0 : 1;
    float _1114 = _1098 * (-2.0);
    int _1116 = ~_1094;
    int _1118 = _1116 + 1;
    int _1120 = _1118 + 1;
    float _1122 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1100);
    int _1124 = _1120;
    float _1126 = _1090;
    float _1128 = _1076;
    float _1130 = _1074;
    if (!_900)
    {
        int _1132 = ~_1094;
        int _1134 = _1132 + 1;
        _1124 = _1134;
    }
    int _1136 = _1124;
    float _1138 = fma(_1114, _1020, _1020);
    bool _1140 = _1106 >= 16.0;
    float _1142 = fma(_1108, _802, _1122);
    int _1144 = abs(_1112);
    float _1146 = fma(_708, _1114, _708);
    float _1148 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1138);
    float _1150 = float(_1136);
    float _1152 = fma(_984, _982, _1096);
    float _1154 = _1084 * 0.0625;
    float _1156 = fma(_1146, _802, _1148);
    float _1158 = fma(_936, _960, _1152);
    float _1160 = float(_1144);
    float _1162 = in.m_65.x;
    float _1164 = in.m_65.y;
    float _1166 = in.m_65.z;
    float _1168 = _1140 ? _1154 : _1084;
    if (_1140)
    {
        float _1170 = _1090 * 0.0625;
        _1126 = _1170;
    }
    float _1172 = _1126;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1176 = _596 + _1174;
    float _1178 = _1160 * _1150;
    float _1180 = abs(_1168);
    bool _1182 = _1180 != 0.0;
    bool _1184 = isnan(_1180);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan(0.0);
    bool _1190 = _1186 || _1188;
    float _1192 = in.m_67.x;
    float _1194 = in.m_67.y;
    float _1196 = in.m_67.z;
    float _1198 = _1142 * 0.15915493667125701904296875;
    float _1200 = _1156 * 0.15915493667125701904296875;
    float _1202 = abs(_1172);
    bool _1204 = _1202 == 0.0;
    bool _1206 = !_1190;
    bool _1208 = _1204 && _1206;
    float _1210 = _1178 * (-2.0);
    float _1212 = abs(_1172);
    bool _1214 = _1212 == 0.0;
    float _1216 = fma(_1004, _922, _1158);
    float _1218 = _1198 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = fma(_868, _1176, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1224 = fma(_1210, _1018, _1018);
    float _1226 = fma(_986, _884, _1216);
    float _1228 = fma(_780, _1210, _780);
    float _1230 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1224);
    float _1232 = fma(_1006, _870, _1226);
    float _1234 = _1198 * 6.283185482025146484375;
    float _1236 = cos(_1234);
    int _1238 = as_type<int>(_1222);
    if (_1208)
    {
        bool _1240 = as_type<int>(_1172) >= 0;
        _1026 = _1240;
    }
    bool _1242 = _1026;
    float _1244 = fma(_1228, _802, _1230);
    float _1246 = fma(_1222, _826, _1232);
    int _1248 = _1242 ? (-1) : 0;
    if (_1208)
    {
        int _1250 = _1242 ? 0 : 1078530011;
        _798 = _1250;
    }
    int _1252 = _798;
    float _1254 = _1200 * 6.283185482025146484375;
    float _1256 = sin(_1254);
    if (_1208)
    {
        int _1258 = int(0x80000000) & as_type<int>(_1168);
        int _1260 = _1252 | _1258;
        _1238 = _1260;
    }
    int _1262 = _1238;
    bool _1264 = !_1190;
    bool _1266 = _1264 && _1214;
    int _1268 = _1262;
    float _1270 = as_type<float>(_1262);
    if (!_1266)
    {
        float _1272 = abs(_1168);
        bool _1274 = _1272 != as_type<float>(0x7f800000u /* inf */);
        bool _1276 = isnan(_1272);
        bool _1278 = _1274 || _1276;
        bool _1280 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1282 = _1278 || _1280;
        float _1284 = abs(_1172);
        bool _1286 = _1284 == as_type<float>(0x7f800000u /* inf */);
        float _1288 = abs(_1172);
        bool _1290 = _1288 == as_type<float>(0x7f800000u /* inf */);
        bool _1292 = !_1282;
        bool _1294 = _1290 && _1292;
        if (_1294)
        {
            bool _1296 = as_type<int>(_1172) >= 0;
            _1248 = _1296 ? (-1) : 0;
        }
        int _1298 = _1248;
        if (_1294)
        {
            _1268 = 1075235812;
        }
        int _1300 = _1268;
        int _1302 = _1300;
        if (_1294)
        {
            int _1304 = ~_1298;
            int _1306 = (_1304 != 0) ? _1300 : 1061752795;
            _1302 = _1306;
        }
        int _1308 = _1302;
        float _1310 = as_type<float>(_1308);
        if (_1294)
        {
            int _1312 = int(0x80000000) & as_type<int>(_1168);
            int _1314 = _1308 | _1312;
            _1310 = as_type<float>(_1314);
        }
        float _1316 = _1310;
        bool _1318 = !_1282;
        bool _1320 = _1318 && _1286;
        _1270 = _1316;
        if (!_1320)
        {
            float _1322 = abs(_1172);
            float _1324 = abs(_1168);
            float _1326 = precise::max(_1322, _1324);
            float _1328 = abs(_1172);
            float _1330 = abs(_1168);
            float _1332 = precise::min(_1328, _1330);
            float _1334 = 1.0 / _1326;
            float _1336 = abs(_1168);
            float _1338 = abs(_1172);
            bool _1340 = _1336 > _1338;
            bool _1342 = as_type<int>(_1172) >= 0;
            float _1344 = _1332 * _1334;
            float _1346 = abs(_1172);
            float _1348 = abs(_1168);
            float _1350 = _1346 + _1348;
            float _1352 = _1344 * _1344;
            bool _1354 = _1350 > as_type<float>(0x7f800000u /* inf */);
            bool _1356 = isnan(_1350);
            bool _1358 = _1354 || _1356;
            bool _1360 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1362 = _1358 || _1360;
            float _1364 = _1352 + 11.33538818359375;
            float _1366 = fma(_1352, _1364, 28.84246826171875);
            float _1368 = fma(_1352, _1366, 19.6966705322265625);
            float _1370 = fma(_1352, -0.82336294651031494140625, -5.674867153167724609375);
            float _1372 = fma(_1352, _1370, -6.565555095672607421875);
            float _1374 = 1.0 / _1368;
            float _1376 = _1352 * _1372;
            float _1378 = _1344 * _1376;
            float _1380 = fma(_1378, _1374, _1344);
            int _1382 = as_type<int>(_1168) & int(0x80000000);
            float _1384 = _1380;
            _1270 = _1350;
            if (_1340)
            {
                float _1386 = -_1380;
                float _1388 = _1386 + 1.57079637050628662109375;
                _1384 = _1388;
            }
            float _1390 = _1384;
            int _1392 = as_type<int>(_1390);
            if (!_1342)
            {
                float _1394 = -_1390;
                float _1396 = _1394 + 3.1415927410125732421875;
                _1392 = as_type<int>(_1396);
            }
            int _1398 = _1392;
            if (!_1362)
            {
                int _1400 = _1382 | _1398;
                _1270 = as_type<float>(_1400);
            }
        }
    }
    float _1402 = _1270;
    float _1404 = -_1402;
    float _1406 = _1244 + _1404;
    float _1408 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1246);
    float _1410 = -_1162;
    float _1412 = _1410 + _1192;
    float _1414 = _1200 * 6.283185482025146484375;
    float _1416 = cos(_1414);
    float _1418 = _1406 * 0.15915493667125701904296875;
    float _1420 = -_1166;
    float _1422 = _1420 + _1196;
    float _1424 = fma(_1408, _1412, _1162);
    float _1426 = -_1164;
    float _1428 = _1426 + _1194;
    float _1430 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1432 = _896 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1434 = _1418 * 6.283185482025146484375;
    float _1436 = cos(_1434);
    float _1438 = fma(_1408, _1428, _1164);
    float _1440 = fma(_1408, _1422, _1166);
    float _1442 = _412 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1444 = _408 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1446 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1438);
    float _1448 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1424);
    float _1450 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1440);
    float _1452 = _1418 * 6.283185482025146484375;
    float _1454 = sin(_1452);
    float _1456 = _1446 * _1442;
    float _1458 = _1220 * _1416;
    float _1460 = _1448 * _1430;
    float _1462 = _1450 * _1444;
    float _1464 = -_1456;
    float _1466 = _1256 * _1464;
    float _1468 = _1458 * _1456;
    float _1470 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1432);
    float _1472 = _1220 * _1436;
    float _1474 = _1436 * _1416;
    float _1476 = _1236 * _1436;
    bool _1478 = _1438 != 0.0;
    bool _1480 = isnan(_1438);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan(0.0);
    bool _1486 = _1482 || _1484;
    float _1488 = fma(_1474, _1460, _1466);
    bool _1490 = _1424 == 0.0;
    bool _1492 = !_1486;
    bool _1494 = _1490 && _1492;
    float _1496 = _1236 * _1454;
    float _1498 = _1220 * _1454;
    float _1500 = _1454 * _1416;
    float _1502 = _1236 * _1416;
    float _1504 = -_1496;
    float _1506 = fma(_1256, _1472, _1504);
    float _1508 = fma(_1256, _1498, _1476);
    float _1510 = fma(_1500, _1462, _1488);
    float _1512 = fma(_1256, _1476, _1498);
    float _1514 = fma(_1506, _1460, _1468);
    float _1516 = _1502 * _1456;
    float _1518 = _1074 + _1510;
    float _1520 = -_1472;
    float _1522 = fma(_1256, _1496, _1520);
    float _1524 = fma(_1508, _1462, _1514);
    float _1526 = in.m_69.x;
    float _1528 = in.m_69.y;
    float _1530 = in.m_69.z;
    float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1534 = _1518 + _1532;
    float _1536 = fma(_1512, _1460, _1516);
    float _1538 = _1076 + _1524;
    float _1540 = fma(_898, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1470);
    float _1542 = _1534 * _1534;
    float _1544 = fma(_1522, _1462, _1536);
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1548 = _1538 + _1546;
    float _1550 = _1540 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1552 = _1440 == 0.0;
    bool _1554 = _1552 && _1494;
    float _1556 = _1548 * _1548;
    float _1558 = _1550 + _1544;
    float _1560 = _1542 + _1556;
    float _1562 = sqrt(_1560);
    bool _1564 = _1562 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1566 = _1462;
    float _1568 = _1460;
    float _1570 = _1544;
    float _1572 = _1536;
    float _1574 = _1438;
    float _1576 = _1534;
    if (!_1564)
    {
        _1566 = _1556;
    }
    float _1578 = _1566;
    float _1580 = _1578;
    if (!_1564)
    {
        _1568 = _1542;
    }
    float _1582 = _1568;
    float _1584 = _1582;
    if (!_1564)
    {
        _1036 = _1518;
    }
    float _1586 = _1036;
    float _1588 = _1586;
    if (!_1564)
    {
        _1570 = _1538;
    }
    float _1590 = _1570;
    float _1592 = _1590;
    if (!_1564)
    {
        _1572 = _1558;
    }
    float _1594 = _1572;
    bool _1596 = !_1564;
    float _1598 = _1594;
    float _1600 = _1528;
    float _1602 = _1526;
    float _1604 = _1530;
    if (!_1596)
    {
        float _1606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1610 = _1562 + _1608;
        float _1612 = _1558 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1614 = rsqrt(_1560);
        float _1616 = _1610 * _1606;
        float _1618 = _1616 * 0.15915493667125701904296875;
        float _1620 = _1618 * 6.283185482025146484375;
        float _1622 = sin(_1620);
        float _1624 = _1618 * 6.283185482025146484375;
        float _1626 = cos(_1624);
        float _1628 = fma(_1622, _1612, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1630 = _1614 * _1628;
        float _1632 = _1626 + (-1.0);
        float _1634 = fma(_1534, _1630, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1636 = fma(_1548, _1630, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1638 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1642 = _1634 + _1640;
        float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1646 = _1636 + _1644;
        float _1648 = fma(_1558, _1626, _1638);
        float _1650 = _1642 * _1642;
        float _1652 = _1646 * _1646;
        _1598 = _1648;
        _1584 = _1650;
        _1580 = _1652;
        _1592 = _1636;
        _1588 = _1634;
    }
    float _1654 = _1598;
    float _1656 = _1584;
    float _1658 = _1580;
    float _1660 = _1592;
    float _1662 = _1588;
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1666 = _1654 + _1664;
    if (!_1554)
    {
        float _1668 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1528);
        _1600 = _1668;
    }
    float _1670 = _1600;
    if (!_1554)
    {
        float _1672 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1526);
        _1602 = _1672;
    }
    float _1674 = _1602;
    if (!_1554)
    {
        float _1676 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1530);
        _1604 = _1676;
    }
    float _1678 = _1604;
    float _1680 = fma(_1666, _1666, _1656);
    float _1682 = -_1670;
    float _1684 = _1256 * _1682;
    float _1686 = _1502 * _1670;
    float _1688 = _1458 * _1670;
    float _1690 = _1680 + _1658;
    float _1692 = fma(_1474, _1674, _1684);
    float _1694 = fma(_1512, _1674, _1686);
    float _1696 = fma(_1506, _1674, _1688);
    out.m_71.y = _1194;
    float _1698 = fma(_1500, _1678, _1692);
    float _1700 = sqrt(_1690);
    float _1702 = fma(_1522, _1678, _1694);
    float _1704 = fma(_1508, _1678, _1696);
    out.m_73.x = _1698;
    out.m_73.y = _1702;
    out.m_73.z = _1704;
    bool _1706 = _1700 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1708 = isnan(_1700);
    bool _1710 = _1706 || _1708;
    bool _1712 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1714 = _1710 || _1712;
    float _1716 = _1696;
    if (!_1714)
    {
        _1574 = 1.0;
    }
    float _1718 = _1574;
    bool _1720 = !_1714;
    float _1722 = _1718;
    if (!_1720)
    {
        bool _1724 = _1700 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1726 = isnan(_1700);
        bool _1728 = _1724 || _1726;
        bool _1730 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1732 = _1728 || _1730;
        if (!_1732)
        {
            float _1734 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1736 = _1700 + _1734;
            float _1738 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1740 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1738;
            float _1742 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1744 = _1742 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1746 = 1.0 / _1740;
            float _1748 = _1736 * _1746;
            float _1750 = fma(_1748, _1744, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1722 = _1750;
            _1752 = true;
        }
        else
        {
            bool _1754 = _1700 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1756 = isnan(_1700);
            bool _1758 = _1754 || _1756;
            bool _1760 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1762 = _1758 || _1760;
            if (!_1762)
            {
                float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1766 = _1700 + _1764;
                float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1770 = _1768 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1774 = _1772 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1776 = 1.0 / _1770;
                float _1778 = _1766 * _1776;
                float _1780 = fma(_1778, _1774, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1722 = _1780;
                _1752 = true;
            }
            else
            {
                _1722 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1752 = false;
    float _1782 = _1722;
    float _1784 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1786 = _1654 + _1784;
    float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1790 = _1660 + _1788;
    bool _1792 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1794 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1796 = _1792 || _1794;
    bool _1798 = isnan(0.5);
    bool _1800 = _1796 || _1798;
    float _1802 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1804 = _1662 + _1802;
    float _1806 = fma(_1786, _1782, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1808 = fma(_1790, _1782, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1810 = fma(_1804, _1782, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1812 = _1782;
    float _1814 = _1804;
    if (_1800)
    {
        _1812 = _1810;
    }
    float _1816 = _1812;
    float _1818 = _1816;
    if (_1800)
    {
        _1814 = _1806;
    }
    float _1820 = _1814;
    float _1822 = _1820;
    if (_1800)
    {
        _1716 = _1808;
    }
    float _1824 = _1716;
    float _1826 = _1824;
    if (!_1800)
    {
        float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1830 = _1550 + _1828;
        float _1832 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1834 = _1830 * _1830;
        float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1838 = _1076 + _1836;
        float _1840 = fma(_1084, _1084, _1834);
        float _1842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1844 = fma(_1838, _1838, _1840);
        float _1846 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1848 = sqrt(_1844);
        float _1850 = precise::min(_1848, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1852 = _1850 * _1842;
        float _1854 = -_1074;
        float _1856 = _1854 + _1810;
        float _1858 = _1846 * _1852;
        float _1860 = -_1550;
        float _1862 = _1860 + _1806;
        float _1864 = -_1076;
        float _1866 = _1864 + _1808;
        float _1868 = fma(_1856, _1858, _1074);
        float _1870 = fma(_1862, _1858, _1550);
        float _1872 = fma(_1866, _1858, _1076);
        _1822 = _1870;
        _1818 = _1868;
        _1826 = _1872;
    }
    float _1874 = _1822;
    float _1876 = _1818;
    float _1878 = _1826;
    float _1880 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1882 = _1874 + _1880;
    float _1884 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1886 = _1876 + _1884;
    float _1888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1890 = _1878 + _1888;
    float _1892 = _1882 * _1882;
    float _1894 = fma(_1886, _1886, _1892);
    float _1896 = fma(_1890, _1890, _1894);
    float _1898 = rsqrt(_1896);
    float _1900 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1902 = _1886 * _1900;
    float _1904 = _1890 * _1900;
    float _1906 = _1902 * _1902;
    float _1908 = _1904 * _1904;
    float _1910 = _1906 + _1908;
    float _1912 = sqrt(_1910);
    bool _1914 = _1912 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1918 = _1912 + _1916;
    float _1920 = _1898;
    float _1922 = _1918;
    float _1924 = _1882;
    float _1926 = _1902;
    if (_1914)
    {
        float _1928 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1920 = _1928;
    }
    float _1930 = _1920;
    if (_1914)
    {
        float _1932 = rsqrt(_1910);
        _1128 = _1932;
    }
    float _1934 = _1128;
    float _1936 = _1934;
    if (_1914)
    {
        float _1938 = _1918 * _1930;
        _1922 = _1938;
    }
    float _1940 = _1922;
    if (_1914)
    {
        float _1942 = _1940 * 0.15915493667125701904296875;
        _1130 = _1942;
    }
    float _1944 = _1130;
    float _1946 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1948 = _1890;
    float _1950 = _1944;
    if (_1914)
    {
        float _1952 = _1944 * 6.283185482025146484375;
        float _1954 = sin(_1952);
        _1948 = _1954;
    }
    float _1956 = _1948;
    float _1958 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1960 = precise::max(0.0, _1958);
    float _1962 = _1930;
    float _1964 = _1960;
    if (_1914)
    {
        float _1966 = _1944 * 6.283185482025146484375;
        float _1968 = cos(_1966);
        _1962 = _1968;
    }
    float _1970 = _1962;
    float _1972 = -_1900;
    float _1974 = -_1960;
    float _1976 = fma(_1882, _1972, _1974);
    if (_1914)
    {
        float _1978 = _1976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1924 = _1978;
    }
    float _1980 = _1924;
    float _1982 = _1980;
    float _1984 = _1956;
    if (_1914)
    {
        float _1986 = fma(_1956, _1980, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1982 = _1986;
    }
    float _1988 = _1982;
    float _1990 = _1988;
    if (!_1914)
    {
        _1984 = _1904;
    }
    float _1992 = _1984;
    float _1994 = _1992;
    float _1996 = _1970;
    if (_1914)
    {
        float _1998 = _1970 + (-1.0);
        _1964 = _1998;
    }
    float _2000 = _1964;
    if (_1914)
    {
        float _2002 = _1934 * _1988;
        _1576 = _2002;
    }
    float _2004 = _1576;
    if (!_1914)
    {
        _1936 = _1976;
    }
    float _2006 = _1936;
    float _2008 = _2006;
    if (_1914)
    {
        float _2010 = _2000 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1950 = _2010;
    }
    float _2012 = _1950;
    if (_1914)
    {
        float _2014 = _1902 * _2004;
        _1926 = _2014;
    }
    float _2016 = _1926;
    float _2018 = sqrt(_1896);
    if (!_1914)
    {
        _1990 = _1906;
    }
    float _2020 = _1990;
    float _2022 = _2020;
    if (_1914)
    {
        float _2024 = fma(_1976, _1970, _2012);
        _2008 = _2024;
    }
    float _2026 = _2008;
    if (_1914)
    {
        float _2028 = _1904 * _2004;
        _1994 = _2028;
    }
    float _2030 = _1994;
    if (_1914)
    {
        float _2032 = _2016 * _2016;
        _2022 = _2032;
    }
    float _2034 = _2022;
    if (!_1914)
    {
        _1996 = _1908;
    }
    float _2036 = _1996;
    float _2038 = _1874 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2040 = _2036;
    if (_1914)
    {
        float _2042 = _2030 * _2030;
        _2040 = _2042;
    }
    float _2044 = _2040;
    float _2046 = fma(_2026, _2026, _2034);
    float _2048 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2038);
    float _2050 = _1874 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2052 = _2046 + _2044;
    float _2054 = _1874 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2056 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2050);
    float _2058 = rsqrt(_2052);
    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2062 = fma(_2018, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2060);
    float _2064 = precise::clamp(_2062, 0.0, 1.0);
    float _2066 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2048);
    float _2068 = _1874 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2070 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2056);
    float _2072 = -_2064;
    float _2074 = _2072 + 1.0;
    float _2076 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2054);
    float _2078 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2068);
    float _2080 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2082 = abs(_2074);
    float _2084 = log2(_2082);
    float _2086 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2078);
    float _2088 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2090 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2076);
    float _2092 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2094 = _2058 * _2016;
    float _2096 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2098 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2100 = _2058 * _2026;
    float _2102 = _2094 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2104 = _2058 * _2030;
    float _2106 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2098);
    float _2108 = -_2092;
    float _2110 = fma(_2108, _1946, 1.0);
    float _2112 = -_2102;
    float _2114 = fma(_2100, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2112);
    float _2116 = _2090 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2118 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2106);
    float _2120 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2122 = -_2104;
    float _2124 = fma(_2122, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2114);
    float _2126 = log2(_2110);
    float _2128 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2118);
    float _2130 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2132 = fma(_2124, -0.5, 0.5);
    float _2134 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2136 = fma(_2124, 0.5, 0.5);
    float _2138 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2130);
    float _2140 = _2100 + 1.0;
    float _2142 = exp2(_2120);
    float _2144 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2134);
    float _2146 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2138);
    float _2148 = fma(_2136, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2150 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2144);
    float _2152 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2146);
    float _2154 = fma(_2136, _2148, -0.212114393711090087890625);
    float _2156 = 1.0 / _2128;
    float _2158 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2150);
    float _2160 = _2126 * 0.693147182464599609375;
    float _2162 = fma(_2136, _2154, 1.570728778839111328125);
    float _2164 = _2160 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2166 = sqrt(_2132);
    float _2168 = -_2100;
    float _2170 = fma(_2142, _2140, _2168);
    float _2172 = fma(_2170, 0.5, 0.5);
    float _2174 = _2152 * _2156;
    float _2176 = _2158 * _2156;
    float _2178 = fma(_2174, 0.5, 0.5);
    float _2180 = fma(_2176, -0.5, 0.5);
    float _2182 = _2166 * 0.636619746685028076171875;
    float3 _5913 = float3(_2178, _2180, _2164);
    float _2184 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5913, float3(0.0), isnan(_5913)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5913, float3(0.0), isnan(_5913)), level(0.0)).x;
    float3 _5924 = float3(_2178, _2180, _2164);
    float4 _2187 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5924, float3(0.0), isnan(_5924)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5924, float3(0.0), isnan(_5924)), level(0.0)).xyzw;
    float _2189 = _2187.x;
    float _2191 = _2187.y;
    float _2193 = _2187.z;
    float _2195 = _2187.w;
    float _2197 = -_2162;
    float _2199 = fma(_2182, _2197, 1.0);
    float2 _5946 = float2(_2199, _2172);
    float3 _2203 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5946, float2(0.0), isnan(_5946)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5946, float2(0.0), isnan(_5946)), level(0.0)).xyz;
    float _2205 = _2203.x;
    float _2207 = _2203.y;
    float _2209 = _2203.z;
    float _2211 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2213 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _1876;
    out.m_75.y = _1874;
    out.m_75.z = _1878;
    bool _2215 = _2018 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2217 = isnan(_2018);
    bool _2219 = _2215 || _2217;
    bool _2221 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2223 = _2219 || _2221;
    float _2225 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2213);
    float _2227 = exp2(_2211);
    float _2229 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2225);
    float _2231 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2229);
    float _2233 = _2231 + _2128;
    out.gl_Position.x = _2152;
    out.gl_Position.y = _2158;
    out.gl_Position.z = _2231;
    out.gl_Position.w = _2128;
    float _2235 = _2233 * 0.5;
    float _2237 = -_2227;
    float _2239 = _2237 + 1.0;
    float _2241 = _2233;
    float _2243 = _2128;
    float _2245 = _2231;
    float _2247 = _2158;
    float _2249 = _2152;
    if (!_2223)
    {
        _2241 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2251 = _2241;
    float _2253 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _2235;
    out.m_77.w = _2128;
    float _2255 = -_2253;
    float _2257 = _2255 + 1.0;
    float _2259 = _2257;
    float _2261 = _2251;
    float _2263 = _2251;
    if (!_2223)
    {
        _2243 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2265 = _2243;
    float _2267 = _2265;
    float _2269 = _2265;
    if (!_2223)
    {
        _2245 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2271 = _2245;
    float _2273 = _2271;
    float _2275 = _2271;
    if (!_2223)
    {
        _2247 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2277 = _2247;
    float _2279 = _2277;
    float _2281 = _2277;
    if (!_2223)
    {
        _2249 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2283 = _2249;
    float _2285 = _2253 * _2184;
    float _2287 = _2195 * _2285;
    float _2289 = _2195 * _2257;
    float _2291 = _2283;
    float _2293 = _2283;
    if (!_2223)
    {
        _2259 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2295 = _2259;
    float _2297 = _2209 * _2285;
    float _2299 = fma(_2205, _2287, _2189);
    float _2301 = fma(_2207, _2287, _2191);
    float _2303 = fma(_2195, _2297, _2193);
    out.m_79.x = _2299;
    out.m_79.y = _2301;
    out.m_79.z = _2303;
    out.m_79.w = _2289;
    bool _2305 = !_2223;
    float _2307 = _2295;
    float _2309 = _2295;
    if (!_2305)
    {
        bool _2311 = _2018 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2313 = isnan(_2018);
        bool _2315 = _2311 || _2313;
        bool _2317 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2319 = _2315 || _2317;
        if (!_2319)
        {
            float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2323 = _2018 + _2321;
            float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2327 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2325;
            float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2333 = 1.0 / _2327;
            float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2337 = _2335 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2345 = _2343 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2351 = _2323 * _2333;
            float _2353 = precise::clamp(_2351, 0.0, 1.0);
            float _2355 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2357 = _2355 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2359 = fma(_2353, _2331, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2361 = fma(_2353, _2357, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2363 = fma(_2353, _2337, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2365 = fma(_2353, _2341, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2367 = fma(_2353, _2345, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2369 = fma(_2353, _2349, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2309 = _2363;
            _2281 = _2367;
            _2263 = _2359;
            _2275 = _2365;
            _2269 = _2361;
            _2293 = _2369;
            _2371 = true;
        }
        else
        {
            bool _2373 = _2018 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2375 = isnan(_2018);
            bool _2377 = _2373 || _2375;
            bool _2379 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2381 = _2377 || _2379;
            if (!_2381)
            {
                _2261 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2383 = _2261;
            _2263 = _2383;
            if (!_2381)
            {
                _2307 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2385 = _2307;
            _2309 = _2385;
            if (!_2381)
            {
                _2267 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2387 = _2267;
            _2269 = _2387;
            if (!_2381)
            {
                _2273 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2389 = _2273;
            _2275 = _2389;
            if (!_2381)
            {
                _2279 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2391 = _2279;
            _2281 = _2391;
            if (!_2381)
            {
                _2291 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2393 = _2291;
            bool _2395 = !_2381;
            _2293 = _2393;
            if (!_2395)
            {
                bool _2397 = _2018 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2399 = isnan(_2018);
                bool _2401 = _2397 || _2399;
                bool _2403 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2405 = _2401 || _2403;
                if (!_2405)
                {
                    float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2409 = _2018 + _2407;
                    float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2413 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2411;
                    float _2415 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2417 = _2415 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2419 = 1.0 / _2413;
                    float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2429 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2431 = _2429 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2437 = _2409 * _2419;
                    float _2439 = precise::clamp(_2437, 0.0, 1.0);
                    float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2443 = _2441 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2445 = fma(_2439, _2417, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2447 = fma(_2439, _2443, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2449 = fma(_2439, _2423, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2451 = fma(_2439, _2427, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2453 = fma(_2439, _2431, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2455 = fma(_2439, _2435, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2309 = _2449;
                    _2281 = _2453;
                    _2263 = _2445;
                    _2275 = _2451;
                    _2269 = _2447;
                    _2293 = _2455;
                    _2371 = true;
                }
                else
                {
                    _2309 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2281 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2263 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2275 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2269 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2293 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2371 = false;
    float _2457 = _2309;
    float _2459 = _2281;
    float _2461 = _2263;
    float _2463 = _2275;
    float _2465 = _2269;
    float _2467 = _2293;
    float _2469 = fma(_1702, -0.5, 0.5);
    float _2471 = precise::clamp(_2469, 0.0, 1.0);
    float _2473 = -_2457;
    float _2475 = _2473 + _2459;
    float _2477 = -_2461;
    float _2479 = _2477 + _2463;
    float _2481 = -_2465;
    float _2483 = _2481 + _2467;
    bool _2485 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2487 = fma(_2471, _2475, _2457);
    float _2489 = fma(_2471, _2479, _2461);
    float _2491 = fma(_2471, _2483, _2465);
    float _2493 = _2487 * 0.586610972881317138671875;
    out.m_81.x = 0.0;
    float _2495 = fma(_2489, 0.298911988735198974609375, _2493);
    float _2497 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2499 = fma(_2491, 0.114477999508380889892578125, _2495);
    out.m_49.x = _2497;
    float _2501 = -_2499;
    float _2503 = _2489 + _2501;
    float _2505 = -_2499;
    float _2507 = _2487 + _2505;
    float _2509 = -_2499;
    float _2511 = _2491 + _2509;
    float _2513 = fma(_2503, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2499);
    float _2515 = fma(_2507, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2499);
    float _2517 = fma(_2511, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2499);
    out.m_83.x = _2513;
    out.m_83.y = _2515;
    out.m_83.z = _2517;
    if (!_2485)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2519 = -_1874;
    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2523 = -_1876;
    float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2527 = -_1878;
    float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2531 = _2521 * _2521;
    float _2533 = fma(_2525, _2525, _2531);
    float _2535 = fma(_2529, _2529, _2533);
    float _2537 = sqrt(_2535);
    float _2539 = rsqrt(_2535);
    float _2541 = -_2537;
    float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2545 = _2543 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2547 = precise::clamp(_2545, 0.0, 1.0);
    float _2549 = _2525 * _2539;
    float _2551 = _2521 * _2539;
    float _2553 = abs(_2547);
    float _2555 = log2(_2553);
    float _2557 = _2529 * _2539;
    float _2559 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2561 = _1702 * _2551;
    float _2563 = -_2551;
    float _2565 = -_2559;
    float _2567 = fma(_2563, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2565);
    float _2569 = fma(_1698, _2549, _2561);
    float _2571 = -_2557;
    float _2573 = fma(_2571, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2567);
    float _2575 = fma(_1704, _2557, _2569);
    float _2577 = precise::clamp(_2575, 0.0, 1.0);
    float _2579 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2581 = _2573 + _2579;
    float _2583 = _2555 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2585 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2587 = precise::clamp(_2585, 0.0, 1.0);
    float _2589 = exp2(_2583);
    float _2591 = _2589 * _2587;
    float _2593 = _2577 * _2591;
    float _2595 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2597 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2599 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _2595;
    out.m_81.y = _2597;
    out.m_81.z = _2599;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

