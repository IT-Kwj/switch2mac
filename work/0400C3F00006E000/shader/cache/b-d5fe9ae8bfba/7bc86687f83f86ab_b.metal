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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_69 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_83 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_79 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_75 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3052 = false;
    bool _450 = false;
    bool _346 = false;
    bool _220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3357 = as_type<float>(_128);
        out.gl_Position.z = _3357;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_112);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _122;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3426 = as_type<float>(_166);
        out.gl_Position.z = _3426;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _178 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _180 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _182 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _184);
    float _192 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _186);
    bool _194 = !_174;
    float _196 = _188;
    float _198 = _190;
    float _200 = _192;
    float _218;
    if (!_194)
    {
        float _202 = in.m_55.x;
        float _204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _210 = _208 * _204;
        float _212 = floor(_210);
        float _214 = -_212;
        float _216 = _210 + _214;
        _218 = _216;
        _220 = true;
    }
    else
    {
        float _222 = float(_112);
        float _224 = 1.0 / _222;
        float _226 = _146 * _224;
        _218 = _226;
    }
    _220 = false;
    float _228 = _218;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _228 + _230;
    bool _234 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_228);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = -_244;
    float _252 = _250 + 1.0;
    bool _254 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _256 = isnan(_228);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = 1.0 / _248;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _278 = _264 * _252;
    float _280 = -_264;
    float _282 = _280 + 1.0;
    float _284 = _232 * _266;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _286;
    float _290 = in.m_57.x;
    float _292 = in.m_57.y;
    float _294 = in.m_57.z;
    float _296 = fma(_270, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = fma(_288, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _300 = fma(_274, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _302 = _296 * _278;
    float _304 = _298 * _278;
    float _306 = _300 * _278;
    float _308 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].x, _302);
    float _310 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].y, _304);
    float _312 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].z, _306);
    float _314 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].x, _308);
    float _316 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].y, _310);
    float _318 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].z, _312);
    float _320 = _314 * _290;
    float _322 = _316 * _292;
    float _324 = _318 * _294;
    bool _326 = !_276;
    float _344;
    if (!_326)
    {
        float _328 = in.m_55.x;
        float _330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _332 = _328 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _336 = _334 * _330;
        float _338 = floor(_336);
        float _340 = -_338;
        float _342 = _336 + _340;
        _344 = _342;
        _346 = true;
    }
    else
    {
        float _348 = float(_112);
        float _350 = 1.0 / _348;
        float _352 = _146 * _350;
        _344 = _352;
    }
    _346 = false;
    float _354 = _344;
    bool _356 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _358 = isnan(_354);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _372 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _374 = isnan(_354);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _390 = _354 + _388;
    float _392 = -_366;
    float _394 = _392 + 1.0;
    bool _396 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _398 = 1.0 / _370;
    float _400 = _382 * _394;
    float _402 = -_382;
    float _404 = _402 + 1.0;
    float _406 = _386 * _398;
    float _408 = fma(_406, _390, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _412 = _408 * _400;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _416 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[115].x, _412);
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _422 = _414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _424 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[116].x, _418);
    float _426 = _420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _428 = _424 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _422;
    out.m_59.y = _416;
    out.m_59.z = _426;
    out.m_59.w = _428;
    bool _430 = !_396;
    float _448;
    if (!_430)
    {
        float _432 = in.m_55.x;
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _436 = _432 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _438 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _440 = _438 * _434;
        float _442 = floor(_440);
        float _444 = -_442;
        float _446 = _440 + _444;
        _448 = _446;
        _450 = true;
    }
    else
    {
        float _452 = float(_112);
        float _454 = 1.0 / _452;
        float _456 = _146 * _454;
        _448 = _456;
    }
    _450 = false;
    float _458 = _448;
    float _460 = in.m_46.x;
    float _462 = in.m_46.y;
    float _464 = in.m_46.z;
    float _466 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _468 = int(_466);
    float _470 = in.m_55.x;
    float _472 = in.m_55.y;
    float _474 = _322 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _476 = _324 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _478 = in.m_55.z;
    float _480 = float(_468);
    float _482 = _480 * _146;
    float _484 = _462 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _486 = _462 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _488 = _462 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _490 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[5].x, _484);
    float _492 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[4].x, _486);
    float _494 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[6].x, _488);
    float _496 = _470 * 2.0;
    float _498 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[5].z, _490);
    float _500 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[4].z, _492);
    float _502 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[6].z, _494);
    float _504 = _478 * 2.0;
    float _506 = _498 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _508 = _500 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _510 = _502 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _512 = -_506;
    float _514 = _512 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _516 = -_508;
    float _518 = _516 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _520 = floor(_496);
    float _522 = _472 * 2.0;
    float _524 = _514 * _514;
    float _526 = fma(_518, _518, _524);
    float _528 = -_510;
    float _530 = _528 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _532 = floor(_504);
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _536 = fma(_530, _530, _526);
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _540 = _470 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _542 = _472 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _544 = floor(_522);
    float _546 = -_538;
    float _548 = fma(_540, 2.0, _546);
    float _550 = _472 + _478;
    bool _552 = _520 > 0.0;
    float _554 = fma(_542, -2.0, _534);
    float _556 = _550 + (-1.0);
    bool _558 = _520 >= 0.0;
    bool _560 = isnan(_520);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    float _568 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _570 = log2(_568);
    float _572 = _472 + _470;
    bool _574 = _532 > 0.0;
    float _576 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _578 = _532 >= 0.0;
    bool _580 = isnan(_532);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    float _588 = _572 + (-1.0);
    int _590 = _566 ? 0 : 1;
    float _592 = sqrt(_536);
    bool _594 = _544 > 0.0;
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _598 = _544 >= 0.0;
    bool _600 = isnan(_544);
    bool _602 = _598 || _600;
    bool _604 = isnan(0.0);
    bool _606 = _602 || _604;
    int _608 = _586 ? 0 : 1;
    int _610 = _606 ? 0 : 1;
    float _612 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _614 = int(_612);
    float _616 = _570 * _146;
    int _618 = ~_608;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    int _624 = ~_610;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    int _630 = _622;
    int _632 = _628;
    if (!_574)
    {
        int _634 = ~_608;
        int _636 = _634 + 1;
        _630 = _636;
    }
    int _638 = _630;
    float _640 = abs(_592);
    float _642 = precise::max(_640, 200.0);
    float _644 = exp2(_616);
    if (!_594)
    {
        int _646 = ~_610;
        int _648 = _646 + 1;
        _632 = _648;
    }
    int _650 = _632;
    float _652 = precise::min(_642, 300.0);
    bool _654 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _662 = _658 || _660;
    float _664 = float(_614);
    int _666 = ~_590;
    int _668 = _666 + 1;
    int _670 = _668 + 1;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _676 = _674 != 0;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _684 = _682 != 0;
    float _686 = 1.0 / _664;
    int _688 = _670;
    if (!_552)
    {
        int _690 = ~_590;
        int _692 = _690 + 1;
        _688 = _692;
    }
    int _694 = _688;
    float _696 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[78].w, _672);
    float _698 = -_644;
    float _700 = _698 + 1.0;
    bool _702 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _704 = isnan(1.0);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _710 = _706 || _708;
    float _712 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _696);
    bool _714 = !_680;
    int _716 = _714 ? 0 : 1;
    float _718 = fma(_652, 0.00999999977648258209228515625, -2.0);
    bool _720 = !_676;
    int _722 = _720 ? 0 : 1;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _726 = 1.0 + _724;
    bool _728 = !_684;
    int _730 = _728 ? 0 : 1;
    float _732 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _554);
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _740 = _738 != 0;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _744 = _742 != 0;
    float _746 = -_718;
    float _748 = _506 + _746;
    float _750 = 1.0 / _726;
    float _752 = in.m_61.x;
    float _754 = in.m_61.y;
    float _756 = in.m_61.z;
    float _758 = _686 * _146;
    bool _760 = !_744;
    int _762 = _760 ? 0 : 1;
    float _764 = -_146;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[76].x, _548);
    bool _768 = !_736;
    int _770 = _768 ? 0 : 1;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _774 = abs(_762);
    float _776 = fma(_652, 0.00999999977648258209228515625, -1.0);
    bool _778 = !_740;
    int _780 = _778 ? 0 : 1;
    float _782 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[78].z, _772);
    int _784 = abs(_770);
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _788 = _748 + _786;
    int _790 = abs(_780);
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _794 = _508 + _792;
    float _796 = float(_694);
    float _798 = _788 * _788;
    float _800 = _662 ? _700 : 0.0;
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _804 = _510 + _802;
    float _806 = float(_790);
    float _808 = fma(_794, _794, _798);
    float _810 = float(_650);
    float _812 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _782);
    float _814 = float(_784);
    float _816 = _806 * _796;
    float _818 = float(_638);
    float _820 = fma(_804, _804, _808);
    float _822 = float(_774);
    if (_710)
    {
        float _824 = _800 * _750;
        _150 = _824;
    }
    float _826 = _150;
    float _828 = _816 * (-2.0);
    float _830 = _814 * _818;
    float _832 = sqrt(_820);
    float _834 = _822 * _810;
    float _836 = _472 + (-0.5);
    float _838 = _830 * (-2.0);
    float _840 = fma(_828, _754, _754);
    float _842 = fma(_576, _828, _576);
    float _844 = _320 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _846 = fma(_596, _838, _596);
    float _848 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[196].y, _840);
    float _850 = fma(_838, _752, _752);
    float _852 = rsqrt(_820);
    float _854 = _470 + (-0.5);
    float _856 = fma(_842, _826, _848);
    float _858 = _844 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _860 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[196].x, _850);
    float _862 = _832 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _864 = _478 + _470;
    float _866 = _856 * 0.15915493667125701904296875;
    float _868 = _834 * (-2.0);
    float _870 = fma(_846, _826, _860);
    float _872 = precise::min(_858, _862);
    float _874 = _864 + (-1.0);
    float _876 = _866 * 6.283185482025146484375;
    float _878 = sin(_876);
    float _880 = _870 * 0.15915493667125701904296875;
    float _882 = _852 * _872;
    float _884 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _886 = fma(_868, _756, _756);
    float _888 = _478 + (-0.5);
    float _890 = _788 * _882;
    float _892 = fma(_884, _868, _884);
    float _894 = _794 * _882;
    float _896 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].z, _886);
    float _898 = -_890;
    float _900 = _788 + _898;
    float _902 = _880 * 6.283185482025146484375;
    float _904 = sin(_902);
    float _906 = -_894;
    float _908 = _794 + _906;
    float _910 = fma(_892, _826, _896);
    float _912 = _900 * _900;
    float _914 = _804 * _882;
    float _916 = _910 * 0.15915493667125701904296875;
    float _918 = fma(_908, _908, _912);
    float _920 = -_914;
    float _922 = _804 + _920;
    float _924 = in.m_63.x;
    float _926 = in.m_63.y;
    float _928 = in.m_63.z;
    float _930 = _866 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = fma(_922, _922, _918);
    float _936 = _904 * _878;
    float _938 = sqrt(_934);
    float _940 = _880 * 6.283185482025146484375;
    float _942 = cos(_940);
    float _944 = _904 * _932;
    float _946 = _776 * _926;
    float _948 = _916 * 6.283185482025146484375;
    float _950 = cos(_948);
    float _952 = _852 * _938;
    float _954 = _776 * _924;
    float _956 = _776 * _928;
    float _958 = _474 * _952;
    float _960 = _844 * _952;
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _954);
    float _964 = _916 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = _942 * _932;
    float _970 = _942 * _878;
    float _972 = _476 * _952;
    float _974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _956);
    float _976 = _904 * _950;
    float _978 = _932 * _950;
    float _980 = _942 * _950;
    float _982 = _878 * _950;
    float _984 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _946);
    float _986 = _972 * _974;
    float _988 = _958 * _984;
    float _990 = fma(_966, _968, _936);
    float _992 = _960 * _962;
    float _994 = -_944;
    float _996 = fma(_966, _970, _994);
    float _998 = _980 * _988;
    float _1000 = -_988;
    float _1002 = _966 * _1000;
    float _1004 = -_970;
    float _1006 = fma(_966, _944, _1004);
    float _1008 = _976 * _988;
    float _1010 = fma(_990, _992, _998);
    float _1012 = fma(_978, _992, _1002);
    float _1014 = fma(_966, _936, _968);
    float _1016 = fma(_1006, _992, _1008);
    float _1018 = fma(_996, _986, _1010);
    float _1020 = fma(_982, _986, _1012);
    float _1022 = fma(_1014, _986, _1016);
    float _1024 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1026 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1028 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1024);
    float _1030 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1026);
    float _1032 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1028);
    float _1034 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1030);
    float _1036 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1038 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1040 = _510 + _1036;
    float _1042 = _508 + _1038;
    float _1044 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1046 = -_914;
    float _1048 = _510 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1052 = _1040 + _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1056 = _1042 + _1054;
    float _1058 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1044);
    float _1060 = -_890;
    float _1062 = _748 + _1060;
    float _1064 = _1052 * _1052;
    float _1066 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1058);
    float _1068 = -_894;
    float _1070 = _508 + _1068;
    float _1072 = fma(_1056, _1056, _1064);
    float _1074 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1076 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1078 = sqrt(_1072);
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1074);
    float _1082 = _748 + _1076;
    float _1084 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1080);
    bool _1086 = _1078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1088 = _1066;
    float _1090 = _1076;
    float _1092 = _1080;
    float _1094 = _914;
    if (!_1086)
    {
        _1088 = _1042;
    }
    float _1096 = _1088;
    float _1098 = _1096;
    if (!_1086)
    {
        _1090 = _1040;
    }
    float _1100 = _1090;
    float _1102 = _1100;
    if (!_1086)
    {
        _1092 = _1082;
    }
    float _1104 = _1092;
    bool _1106 = !_1086;
    float _1108 = _1104;
    if (!_1106)
    {
        float _1110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1114 = _1078 + _1112;
        float _1116 = rsqrt(_1072);
        float _1118 = _1114 * _1110;
        float _1120 = _1082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = _1118 * 0.15915493667125701904296875;
        float _1124 = _1122 * 6.283185482025146484375;
        float _1126 = cos(_1124);
        float _1128 = _1122 * 6.283185482025146484375;
        float _1130 = sin(_1128);
        float _1132 = _1126 + (-1.0);
        float _1134 = fma(_1130, _1120, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1136 = _1132 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1138 = _1116 * _1134;
        float _1140 = fma(_1082, _1126, _1136);
        float _1142 = fma(_1056, _1138, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1144 = fma(_1052, _1138, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1108 = _1140;
        _1098 = _1142;
        _1102 = _1144;
    }
    float _1146 = _1108;
    float _1148 = _1098;
    float _1150 = _1102;
    float _1152 = -_748;
    float _1154 = _1152 + _1146;
    float _1156 = -_508;
    float _1158 = _1156 + _1148;
    float _1160 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1162 = -_510;
    float _1164 = _1162 + _1150;
    float _1166 = _1154 * _1154;
    float _1168 = -_894;
    float _1170 = _1168 + _1148;
    float _1172 = 1.0 / _1160;
    float _1174 = -_890;
    float _1176 = _1174 + _1146;
    float _1178 = fma(_1158, _1158, _1166);
    float _1180 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1182 = -_914;
    float _1184 = _1182 + _1150;
    float _1186 = fma(_1164, _1164, _1178);
    float _1188 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1180);
    float _1190 = sqrt(_1186);
    float _1192 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1188);
    bool _1194 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1196 = isnan(0.5);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1202 = _1198 || _1200;
    bool _1204 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1206 = isnan(0.5);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1212 = _1208 || _1210;
    float _1214 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1216 = _1214 + _1160;
    float _1218 = _1216 * _1172;
    float _1220 = _1218 * 0.5;
    bool _1222 = _1190 > 0.0;
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1226 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1224);
    float _1228 = 1.0 / _1226;
    float _1230 = _1190;
    float _1232 = _1170;
    float _1234 = _1146;
    float _1236 = _1160;
    float _1238 = _1226;
    float _1240 = _1172;
    float _1242 = _1184;
    if (!_1222)
    {
        _1094 = _1176;
    }
    float _1244 = _1094;
    float _1246 = _1244;
    if (!_1222)
    {
        _1230 = _1184;
    }
    float _1248 = _1230;
    bool _1250 = !_1222;
    float _1252 = _1248;
    if (!_1250)
    {
        float _1254 = _190 * _190;
        float _1256 = rsqrt(_1186);
        float _1258 = fma(_188, _188, _1254);
        float _1260 = fma(_192, _192, _1258);
        float _1262 = sqrt(_1260);
        float _1264 = _1158 * _1256;
        float _1266 = _1154 * _1256;
        float _1268 = _1164 * _1256;
        bool _1270 = _1262 > 0.0;
        float _1272 = _1256;
        float _1274 = _1262;
        _1234 = _1268;
        _1236 = _1266;
        if (!_1270)
        {
            _1272 = _1176;
        }
        float _1276 = _1272;
        _1246 = _1276;
        if (!_1270)
        {
            _1274 = _1184;
        }
        float _1278 = _1274;
        bool _1280 = !_1270;
        _1252 = _1278;
        if (!_1280)
        {
            float _1282 = rsqrt(_1260);
            float _1284 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1286 = _190 * _1282;
            float _1288 = _188 * _1282;
            float _1290 = _192 * _1282;
            float _1292 = _1266 * _1286;
            float _1294 = fma(_1264, _1288, _1292);
            float _1296 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1298 = fma(_1268, _1290, _1294);
            float _1300 = _1298 * _1296;
            float _1302 = fma(_188, _1300, _1170);
            float _1304 = fma(_190, _1300, _1176);
            float _1306 = fma(_192, _1300, _1184);
            _1232 = _1302;
            _1246 = _1304;
            _1252 = _1306;
        }
    }
    float _1308 = _1232;
    float _1310 = _1246;
    float _1312 = _1252;
    float _1314 = _1234;
    float _1316 = _1236;
    float _1318 = _1308;
    float _1320 = _1316;
    float _1322 = _1314;
    if (_1212)
    {
        _1238 = 1.0;
    }
    float _1324 = _1238;
    float _1326 = _1324;
    if (_1202)
    {
        _196 = _1308;
    }
    float _1328 = _196;
    float _1330 = _1328;
    if (_1202)
    {
        _198 = _1310;
    }
    float _1332 = _198;
    float _1334 = _1332;
    if (_1202)
    {
        _200 = _1312;
    }
    float _1336 = _200;
    float _1338 = _1336;
    if (!_1202)
    {
        float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1342 = _1062 + _1340;
        float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1346 = _1070 + _1344;
        float _1348 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1350 = -_1070;
        float _1352 = _1350 + _1308;
        float _1354 = _1342 * _1342;
        float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1358 = _1048 + _1356;
        float _1360 = -_1062;
        float _1362 = _1360 + _1310;
        float _1364 = -_1048;
        float _1366 = _1364 + _1312;
        float _1368 = fma(_1346, _1346, _1354);
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1372 = fma(_1358, _1358, _1368);
        float _1374 = sqrt(_1372);
        float _1376 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1378 = precise::min(_1374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1380 = _1378 * _1370;
        float _1382 = _1376 * _1380;
        float _1384 = fma(_1352, _1382, _1070);
        float _1386 = fma(_1362, _1382, _1062);
        float _1388 = fma(_1366, _1382, _1048);
        _1334 = _1386;
        _1330 = _1384;
        _1338 = _1388;
        _1318 = _1352;
    }
    float _1390 = _1334;
    float _1392 = _1330;
    float _1394 = _1338;
    float _1396 = _1318;
    float _1398 = _1396;
    if (_1212)
    {
        _1320 = 1.0;
    }
    float _1400 = _1320;
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1404 = _1228 * _1402;
    float _1406 = _1400;
    if (!_1212)
    {
        float _1408 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1410 = _1408 * 0.15915493667125701904296875;
        float _1412 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1414 = _1410 * 6.283185482025146484375;
        float _1416 = cos(_1414);
        float _1418 = _1412 * 0.15915493667125701904296875;
        float _1420 = _1410 * 6.283185482025146484375;
        float _1422 = sin(_1420);
        float _1424 = 1.0 / _1416;
        float _1426 = _1418 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1422 * _1424;
        float _1432 = _1418 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1438 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1436;
        float _1440 = _1428 * _1430;
        float _1442 = 1.0 / _1438;
        float _1444 = 1.0 / _1440;
        float _1446 = _1434 * _1444;
        float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1450 = fma(_1404, _1446, _1448);
        float _1452 = _1450 * _1442;
        float _1454 = precise::clamp(_1452, 0.0, 1.0);
        _1398 = _1410;
        _1326 = _1454;
    }
    float _1456 = _1398;
    float _1458 = _1326;
    if (!_1212)
    {
        float _1460 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1462 = _1460 * 0.15915493667125701904296875;
        float _1464 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1466 = _1462 * 6.283185482025146484375;
        float _1468 = cos(_1466);
        float _1470 = _1464 * 0.15915493667125701904296875;
        float _1472 = _1462 * 6.283185482025146484375;
        float _1474 = sin(_1472);
        float _1476 = 1.0 / _1468;
        float _1478 = _1470 * 6.283185482025146484375;
        float _1480 = cos(_1478);
        float _1482 = _1474 * _1476;
        float _1484 = _1470 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        float _1488 = _1480 * _1482;
        float _1490 = 1.0 / _1488;
        float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1494 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1492;
        float _1496 = 1.0 / _1494;
        float _1498 = _1486 * _1490;
        float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1502 = fma(_1404, _1498, _1500);
        float _1504 = _1502 * _1496;
        float _1506 = precise::clamp(_1504, 0.0, 1.0);
        float _1508 = -_1506;
        float _1510 = _1508 + 1.0;
        _1406 = _1510;
    }
    float _1512 = _1406;
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1516 = _1390 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1520 = _1392 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1524 = _1394 + _1522;
    float _1526 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1528 = _1516 * _1516;
    float _1530 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1532 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1526);
    float _1534 = fma(_1520, _1520, _1528);
    float _1536 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1530);
    float _1538 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1532);
    float _1540 = fma(_1524, _1524, _1534);
    float _1542 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1544 = rsqrt(_1540);
    float _1546 = sqrt(_1540);
    float _1548 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1550 = _1520 * _1548;
    float _1552 = _1524 * _1548;
    float _1554 = _1550 * _1550;
    float _1556 = _1552 * _1552;
    float _1558 = _1554 + _1556;
    float _1560 = sqrt(_1558);
    bool _1562 = _1560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1566 = _1560 + _1564;
    float _1568 = _1528;
    float _1570 = _1558;
    float _1572 = _1566;
    float _1574 = _1550;
    float _1576 = _1552;
    float _1578 = _1554;
    if (_1562)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1580;
    }
    float _1582 = _1568;
    if (_1562)
    {
        float _1584 = rsqrt(_1558);
        _1570 = _1584;
    }
    float _1586 = _1570;
    float _1588 = _1586;
    if (_1562)
    {
        float _1590 = _1566 * _1582;
        _1572 = _1590;
    }
    float _1592 = _1572;
    if (_1562)
    {
        float _1594 = _1592 * 0.15915493667125701904296875;
        _1240 = _1594;
    }
    float _1596 = _1240;
    float _1598 = _1582;
    if (_1562)
    {
        float _1600 = _1596 * 6.283185482025146484375;
        float _1602 = sin(_1600);
        _1598 = _1602;
    }
    float _1604 = _1598;
    float _1606 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1608 = precise::max(0.0, _1606);
    float _1610 = _1456;
    if (_1562)
    {
        float _1612 = _1596 * 6.283185482025146484375;
        float _1614 = cos(_1612);
        _1610 = _1614;
    }
    float _1616 = _1610;
    float _1618 = -_1548;
    float _1620 = -_1608;
    float _1622 = fma(_1516, _1618, _1620);
    if (_1562)
    {
        float _1624 = _1622 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1624;
    }
    float _1626 = _1242;
    float _1628 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1630 = fma(_1070, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1632 = _1604;
    float _1634 = _1626;
    if (_1562)
    {
        float _1636 = fma(_1604, _1626, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1322 = _1636;
    }
    float _1638 = _1322;
    float _1640 = _1638;
    if (!_1562)
    {
        _1632 = _1622;
    }
    float _1642 = _1632;
    float _1644 = floor(_1630);
    float _1646 = _1642;
    float _1648 = _1616;
    if (_1562)
    {
        float _1650 = _1616 + (-1.0);
        _1634 = _1650;
    }
    float _1652 = _1634;
    if (_1562)
    {
        float _1654 = _1586 * _1638;
        _1640 = _1654;
    }
    float _1656 = _1640;
    if (_1562)
    {
        float _1658 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1588 = _1658;
    }
    float _1660 = _1588;
    if (_1562)
    {
        float _1662 = _1550 * _1656;
        _1574 = _1662;
    }
    float _1664 = _1574;
    if (_1562)
    {
        float _1666 = _1552 * _1656;
        _1576 = _1666;
    }
    float _1668 = _1576;
    if (_1562)
    {
        float _1670 = fma(_1622, _1616, _1660);
        _1646 = _1670;
    }
    float _1672 = _1646;
    if (_1562)
    {
        float _1674 = _1664 * _1664;
        _1578 = _1674;
    }
    float _1676 = _1578;
    if (!_1562)
    {
        _1648 = _1556;
    }
    float _1678 = _1648;
    float _1680 = _1678;
    if (_1562)
    {
        float _1682 = _1668 * _1668;
        _1680 = _1682;
    }
    float _1684 = _1680;
    float _1686 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1688 = fma(_1672, _1672, _1676);
    float _1690 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1686);
    float _1692 = _1688 + _1684;
    float _1694 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1696 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1698 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1690);
    float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1702 = fma(_1546, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1700);
    float _1704 = precise::clamp(_1702, 0.0, 1.0);
    float _1706 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1696);
    float _1708 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1710 = rsqrt(_1692);
    float _1712 = -_1704;
    float _1714 = _1712 + 1.0;
    float _1716 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1706);
    float _1718 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1720 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1536);
    float _1722 = fma(_1048, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1724 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1726 = -_1628;
    float _1728 = fma(_1726, _1694, 1.0);
    float _1730 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1732 = abs(_1714);
    float _1734 = log2(_1732);
    float _1736 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1718);
    float _1738 = -_1644;
    float _1740 = _1630 + _1738;
    float _1742 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1744 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1746 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1736);
    float _1748 = _1710 * _1664;
    float _1750 = _1710 * _1668;
    float _1752 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1746);
    float _1754 = _1710 * _1672;
    float _1756 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1758 = floor(_1722);
    float _1760 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1742);
    float _1762 = -_1756;
    float _1764 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1760);
    float _1770 = -_1750;
    float _1772 = fma(_1770, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1774 = log2(_1728);
    float _1776 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1768);
    float _1778 = fma(_1772, -0.5, 0.5);
    float _1780 = fma(_1772, 0.5, 0.5);
    float _1782 = exp2(_1766);
    float _1784 = -_1758;
    float _1786 = _1722 + _1784;
    float _1788 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1744);
    float _1790 = fma(_1780, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1792 = _1754 + 1.0;
    float _1794 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1788);
    float _1796 = fma(_1780, _1790, -0.212114393711090087890625);
    float _1798 = 1.0 / _1752;
    float _1800 = _1774 * 0.693147182464599609375;
    float _1802 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1794);
    float _1804 = fma(_1780, _1796, 1.570728778839111328125);
    float _1806 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1808 = sqrt(_1778);
    float _1810 = -_1754;
    float _1812 = fma(_1782, _1792, _1810);
    float2 _5981 = float2(_1740, _1786);
    float _1814 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5981, float2(0.0), isnan(_5981)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5981, float2(0.0), isnan(_5981)), level(0.0)).x;
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = _1776 * _1798;
    float _1820 = _1802 * _1798;
    float _1822 = fma(_1818, 0.5, 0.5);
    float _1824 = fma(_1820, -0.5, 0.5);
    float _1826 = _1808 * 0.636619746685028076171875;
    float _1828 = -_1804;
    float _1830 = fma(_1826, _1828, 1.0);
    float3 _6012 = float3(_1822, _1824, _1806);
    float _1832 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6012, float3(0.0), isnan(_6012)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6012, float3(0.0), isnan(_6012)), level(0.0)).x;
    float3 _6023 = float3(_1822, _1824, _1806);
    float4 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6023, float3(0.0), isnan(_6023)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6023, float3(0.0), isnan(_6023)), level(0.0)).xyzw;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1835.w;
    float2 _6039 = float2(_1830, _1816);
    float3 _1847 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6039, float2(0.0), isnan(_6039)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6039, float2(0.0), isnan(_6039)), level(0.0)).xyz;
    float _1849 = _1847.x;
    float _1851 = _1847.y;
    float _1853 = _1847.z;
    float _1855 = float(uint(_468));
    float _1857 = trunc(_758);
    int _1859 = int(_1857);
    int _1861 = abs(_716);
    float _1863 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1865 = ~_468;
    int _1867 = _1865 + 1;
    float _1869 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1871 = abs(_722);
    float _1873 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1863);
    int _1875 = abs(_730);
    float _1877 = 1.0 / _1855;
    bool _1879 = _472 > 0.5;
    out.m_65.w = _872;
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1883 = _458 + _1881;
    int _1885 = ~_468;
    int _1887 = _1885 + 1;
    out.m_67.x = _1070;
    out.m_67.y = _1062;
    out.m_67.z = _1048;
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1891 = _1889 != 0;
    float _1893 = exp2(_1869);
    float _1895 = float(uint(_1859));
    out.m_69.x = _960;
    int _1897 = ~_468;
    int _1899 = _1897 + 1;
    out.m_71.x = _1392;
    out.m_71.y = _1390;
    out.m_71.z = _1394;
    bool _1901 = !_1891;
    float _1903 = _1901 ? 7.345489978790283203125 : 1.0;
    int _1905 = as_type<int>(_1877) + (-2);
    float _1907 = _1776 + _1752;
    float _1909 = _1903 * _470;
    float _1911 = float(_112);
    float _1913 = as_type<float>(_1905) * _1895;
    float _1915 = _1907 * 0.5;
    float _1917 = -_1893;
    float _1919 = _1917 + 1.0;
    float _1921 = 1.0 / _1911;
    float _1923 = trunc(_1913);
    float _1925 = precise::max(_1923, 0.0);
    uint _1928 = uint(_1925);
    float _1930 = _482 * _1921;
    int _1932 = _468 + (-1);
    int _1934 = _1867 * int(_1928);
    int _1936 = _1934 + _1859;
    float _1938 = floor(_1909);
    float _1940 = float(uint(_1936));
    float _1942 = as_type<float>(_1905) * _1940;
    int _1944 = ~_468;
    int _1946 = _1944 + 1;
    float _1948 = trunc(_1942);
    float _1950 = precise::max(_1948, 0.0);
    uint _1952 = uint(_1950);
    float _1954 = -_1938;
    float _1956 = _1909 + _1954;
    float _1958 = _1956 * _480;
    float _1960 = trunc(_1958);
    int _1962 = int(_1960);
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1964;
    int _1968 = int(_1928) + int(_1952);
    float _1970 = float(_1859);
    int _1972 = _1946 * _1968;
    int _1974 = _1972 + _1859;
    bool _1976 = _1970 >= _480;
    bool _1978 = isnan(_1970);
    bool _1980 = _1976 || _1978;
    bool _1982 = isnan(_480);
    bool _1984 = _1980 || _1982;
    float _1986 = float(_1984);
    float _1988 = trunc(_1930);
    int _1990 = int(_1988);
    bool _1992 = uint(_1974) >= uint(_468);
    int _1994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1996 = _1994 != 0;
    bool _1998 = !_1992;
    int _2000 = _1998 ? 0 : (-1);
    bool _2002 = _468 == 0;
    float _2004 = trunc(_1986);
    int _2006 = int(_2004);
    int _2008 = ~_1968;
    int _2010 = _2008 + _2000;
    int _2012 = _2010 + 1;
    bool _2014 = !_1996;
    int _2016 = _2014 ? 0 : 1;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2020 = _2018 != 0;
    int _2022 = _468 * _2012;
    int _2024 = _2022 + _1859;
    int _2026 = abs(_2016);
    bool _2028 = !_2002;
    int _2030 = _2028 ? _2024 : (-1);
    int _2032 = _1962 * _2026;
    int _2034 = _2032 + _1859;
    int _2036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2038 = _2036 != 0;
    float _2040 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2040;
    int _2044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2046 = _2044 != 0;
    float _2048 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2050 = _2048 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2052 = ~_2006;
    int _2054 = _2052 + 1;
    int _2056 = _2054 + 1;
    bool _2058 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2060 = isnan(_458);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2066 = _2062 || _2064;
    float _2068 = float(_2066);
    int _2070 = _2030 * _2056;
    int _2072 = _2006 * _1932;
    int _2074 = _2072 + _2070;
    bool _2076 = !_2020;
    int _2078 = _2076 ? 0 : 1;
    int _2080 = _2074 * _1861;
    int _2082 = abs(_2078);
    int _2084 = _1990 * _1871;
    int _2086 = _2084 + _2080;
    int _2088 = ~_468;
    int _2090 = _2088 + 1;
    float _2092 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2094 = _2092 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2096 = _2034 * _1875;
    int _2098 = _2096 + _2086;
    int _2100 = ~_468;
    int _2102 = _2100 + 1;
    int _2104 = _1962 * _2082;
    int _2106 = _2104 + _2098;
    float _2108 = 1.0 / _2094;
    float _2110 = float(uint(_2106));
    float _2112 = as_type<float>(_1905) * _2110;
    float _2114 = trunc(_2112);
    float _2116 = precise::max(_2114, 0.0);
    uint _2118 = uint(_2116);
    float _2120 = _2050 * _2108;
    int _2122 = _2102 * int(_2118);
    int _2124 = _2122 + _2106;
    float _2126 = float(uint(_2124));
    float _2128 = as_type<float>(_1905) * _2126;
    float _2130 = float(uint(_2034));
    float _2132 = trunc(_2128);
    float _2134 = precise::max(_2132, 0.0);
    uint _2136 = uint(_2134);
    float _2138 = as_type<float>(_1905) * _2130;
    float _2140 = trunc(_2138);
    float _2142 = precise::max(_2140, 0.0);
    uint _2144 = uint(_2142);
    float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2148 = _2146 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2150 = int(_2118) + int(_2136);
    float _2152 = 1.0 / _2148;
    int _2154 = _2090 * _2150;
    int _2156 = _2154 + _2106;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    bool _2158 = uint(_2156) >= uint(_468);
    bool _2160 = !_2158;
    int _2162 = _2160 ? 0 : (-1);
    int _2164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2166 = _2164 != 0;
    float _2168 = _2042 * _2152;
    int _2170 = ~_2150;
    int _2172 = _2170 + _2162;
    int _2174 = _2172 + 1;
    float _2176 = in.m_75.y;
    int _2178 = _1887 * int(_2144);
    int _2180 = _2178 + _2034;
    float _2182 = fma(_2168, _1883, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2184 = _468 * _2174;
    int _2186 = _2184 + _2106;
    bool _2188 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2190 = isnan(_458);
    bool _2192 = _2188 || _2190;
    bool _2194 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2196 = _2192 || _2194;
    float _2198 = float(_2196);
    float _2200 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2202 = _458 + _2200;
    float _2204 = float(uint(_2180));
    bool _2206 = !_2002;
    int _2208 = _2206 ? _2186 : (-1);
    float _2210 = -_2198;
    float _2212 = _2210 + 1.0;
    float _2214 = as_type<float>(_1905) * _2204;
    int _2216 = _2208 >> 31;
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2220 = _2218 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2222 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2224 = isnan(_458);
    bool _2226 = _2222 || _2224;
    bool _2228 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2230 = _2226 || _2228;
    float _2232 = float(_2230);
    int _2234 = _2216 & 3;
    float _2236 = trunc(_2214);
    float _2238 = precise::max(_2236, 0.0);
    uint _2240 = uint(_2238);
    bool _2242 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2244 = isnan(_458);
    bool _2246 = _2242 || _2244;
    bool _2248 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2250 = _2246 || _2248;
    float _2252 = float(_2250);
    int _2254 = _2208 + _2234;
    int _2256 = _2208 & 3;
    bool _2258 = _2256 != 0;
    float _2260 = -_2252;
    float _2262 = _2260 + 1.0;
    int _2264 = _2254 >> 2;
    float _2266 = 1.0 / _2220;
    float _2268 = _2252 * _2212;
    float _2270 = _2068 * _2262;
    int _2272 = _2264 << 4;
    int _2274 = _2272 + 368;
    float _2276 = -_2068;
    float _2278 = _2276 + 1.0;
    float _2280 = -_2176;
    float _2282 = _2280 + 1.0;
    uint _2284 = uint(int(uint(_2274) >> uint(2)));
    uint _2286 = uint(int(uint(int(_2284)) >> uint(2)));
    int _2288 = int(_2284) & 3;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[int(_2286)][_2288];
    int _2292 = int(_2284) + 1;
    uint _2294 = uint(int(uint(_2292) >> uint(2)));
    int _2296 = _2292 & 3;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[int(_2294)][_2296];
    float _2300 = _2232 * _2278;
    int _2302 = int(_2144) + int(_2240);
    float _2304 = -_2232;
    float _2306 = _2304 + 1.0;
    float _2308 = _2176;
    if (_2038)
    {
        float _2310 = _1879 ? _2282 : _2176;
        _2308 = _2310;
    }
    float _2312 = _2308;
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2316 = _458 + _2314;
    int _2318 = _2258 ? 0 : 1;
    float _2320 = _1966 * _2266;
    float _2322 = _2182 * _2300;
    int _2324 = _2208 & 3;
    bool _2326 = _2324 != 0;
    float _2328 = _2182;
    if (_2166)
    {
        float _2330 = in.m_55.x;
        _2328 = _2330;
    }
    float _2332 = _2328;
    int _2334 = _2274 + 8;
    uint _2336 = uint(int(uint(_2334) >> uint(2)));
    uint _2338 = uint(int(uint(int(_2336)) >> uint(2)));
    int _2340 = int(_2336) & 3;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[int(_2338)][_2340];
    int _2344 = int(_2336) + 1;
    uint _2346 = uint(int(uint(_2344) >> uint(2)));
    int _2348 = _2344 & 3;
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[int(_2346)][_2348];
    float _2352 = fma(_2120, _2316, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2354 = uint(_2324) > 1u;
    float _2356 = fma(_2306, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2322);
    bool _2358 = _2324 != 3;
    float _2360 = fma(_2320, _2202, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2362 = ~_2318;
    int _2364 = _2362 + 1;
    int _2366 = _2364 + 1;
    int _2368 = _1899 * _2302;
    int _2370 = _2368 + _2034;
    float _2372 = fma(_2352, _2270, _2356);
    float _2374 = -_1814;
    float _2376 = _2374 + 1.0;
    bool _2378 = uint(_2370) >= uint(_468);
    float _2380 = fma(_2360, _2268, _2372);
    int _2382 = _2366;
    if (!_2354)
    {
        int _2384 = ~_2318;
        int _2386 = _2384 + 1;
        _2382 = _2386;
    }
    int _2388 = _2382;
    bool _2390 = uint(_2324) >= 2u;
    int _2392 = abs(_2388);
    int _2394 = _2390 ? 0 : 1;
    bool _2396 = !_2326;
    int _2398 = _2396 ? 0 : 1;
    bool _2400 = !_2378;
    int _2402 = _2400 ? 0 : (-1);
    int _2404 = ~_2394;
    int _2406 = _2404 + 1;
    int _2408 = _2406 + 1;
    bool _2410 = _2324 != 3;
    int _2412 = _2408;
    if (_2358)
    {
        int _2414 = ~_2394;
        int _2416 = _2414 + 1;
        _2412 = _2416;
    }
    int _2418 = _2412;
    int _2420 = ~_2392;
    int _2422 = _2420 + 1;
    int _2424 = _2422 + 1;
    int _2426 = abs(_2398);
    int _2428 = ~_2302;
    int _2430 = _2428 + _2402;
    int _2432 = _2430 + 1;
    float _2434 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2436 = int(_2434);
    bool _2438 = !_2410;
    int _2440 = _2438 ? 0 : (-1);
    int _2442 = _2424 * as_type<int>(_2298);
    int _2444 = abs(_2418);
    bool _2446 = !_2046;
    int _2448 = _2446 ? 0 : 1;
    int _2450 = ~_2426;
    int _2452 = _2450 + 1;
    int _2454 = _2452 + 1;
    int _2456 = abs(_2440);
    int _2458 = _2454 * as_type<int>(_2290);
    int _2460 = _2458 + _2442;
    bool _2462 = _2332 > 0.5;
    bool _2464 = _2462 && _2166;
    int _2466 = _468 * _2432;
    int _2468 = _2466 + _2034;
    int _2470 = abs(_2448);
    float _2472 = in.m_75.x;
    int _2474 = ~_2444;
    int _2476 = _2474 + 1;
    int _2478 = _2476 + 1;
    int _2480 = ~_2456;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    float _2486 = _980 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2488 = abs(_2436);
    int _2490 = _2478 * as_type<int>(_2342);
    int _2492 = _2490 + _2460;
    float _2494 = _980 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2496 = float(uint(_2436));
    int _2498 = _2484 * as_type<int>(_2350);
    int _2500 = _2498 + _2492;
    bool _2502 = !_2002;
    int _2504 = _2502 ? _2468 : (-1);
    float _2506 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2380);
    float _2508 = float(uint(_2488));
    float _2510 = _980 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2512 = ~_2470;
    int _2514 = _2512 + 1;
    int _2516 = _2514 + 1;
    float _2518 = 1.0 / _2496;
    float _2520 = _2506 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2522 = _2500 * _2516;
    float _2524 = -_966;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2486);
    float _2528 = -_966;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2494);
    float _2532 = 1.0 / _2508;
    int _2534 = _2504 * _2470;
    int _2536 = _2534 + _2522;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2540 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2544 = -_966;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2510);
    int _2548 = abs(_2536);
    float _2550 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2552 = as_type<int>(_2518) + (-2);
    float _2554 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2556 = float(uint(_2536));
    float _2558 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2560 = float(uint(_2548));
    int _2562 = ~_2436;
    int _2564 = _2562 + 1;
    float _2566 = as_type<float>(_2552) * _2556;
    int _2568 = as_type<int>(_2532) + (-2);
    out.m_77.x = _2550;
    out.m_77.y = _2554;
    out.m_77.z = _2558;
    out.m_77.w = _2520;
    bool _2570 = _946 != 0.0;
    bool _2572 = isnan(_946);
    bool _2574 = _2570 || _2572;
    bool _2576 = isnan(0.0);
    bool _2578 = _2574 || _2576;
    int _2580 = ~_2488;
    int _2582 = _2580 + 1;
    float _2584 = as_type<float>(_2568) * _2560;
    float _2586 = trunc(_2566);
    float _2588 = precise::max(_2586, 0.0);
    uint _2590 = uint(_2588);
    float _2592 = in.m_79.x;
    float _2594 = in.m_79.y;
    float _2596 = in.m_79.z;
    float _2598 = as_type<float>(_2444);
    float _2600 = _2472;
    if (_2166)
    {
        _2598 = _2472;
    }
    float _2602 = _2598;
    bool _2604 = _954 == 0.0;
    bool _2606 = !_2578;
    bool _2608 = _2604 && _2606;
    float _2610 = _2602;
    if (_2464)
    {
        float _2612 = -_2602;
        float _2614 = _2612 + 1.0;
        _2610 = _2614;
    }
    float _2616 = _2610;
    float _2618 = trunc(_2584);
    float _2620 = precise::max(_2618, 0.0);
    uint _2622 = uint(_2620);
    float _2624 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2530);
    bool _2626 = _956 == 0.0;
    bool _2628 = _2626 && _2608;
    float _2630 = _990 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_2166)
    {
        _2600 = _2616;
    }
    float _2632 = _2600;
    float _2634 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2526);
    float _2636 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2546);
    int _2638 = _2564 * int(_2590);
    int _2640 = _2638 + _2536;
    float _2642 = _990 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2644 = _990 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2646 = _996 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2648 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2630);
    float _2650 = float(uint(_2640));
    float _2652 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2642);
    float _2654 = abs(_1404);
    float _2656 = log2(_2654);
    int _2658 = _2582 * int(_2622);
    int _2660 = _2658 + _2548;
    float _2662 = _2594;
    float _2664 = _2592;
    float _2666 = _2596;
    if (!_2628)
    {
        float _2668 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2594);
        _2662 = _2668;
    }
    float _2670 = _2662;
    float _2672 = as_type<float>(_2552) * _2650;
    float _2674 = _996 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2676 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2646);
    float _2678 = float(uint(_2660));
    float _2680 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2644);
    float _2682 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2674);
    float _2684 = trunc(_2672);
    float _2686 = precise::max(_2684, 0.0);
    uint _2688 = uint(_2686);
    float _2690 = _2634 * _2670;
    float _2692 = as_type<float>(_2568) * _2678;
    float _2694 = _996 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2696 = _2624 * _2670;
    float _2698 = _2636 * _2670;
    float _2700 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2676);
    float _2702 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2694);
    float _2704 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2706 = trunc(_2692);
    float _2708 = precise::max(_2706, 0.0);
    uint _2710 = uint(_2708);
    int _2712 = ~_2488;
    int _2714 = _2712 + 1;
    if (!_2628)
    {
        float _2716 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2592);
        _2664 = _2716;
    }
    float _2718 = _2664;
    int _2720 = ~_2436;
    int _2722 = _2720 + 1;
    if (!_2628)
    {
        float _2724 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2596);
        _2666 = _2724;
    }
    float _2726 = _2666;
    float _2728 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2680);
    float _2730 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2652);
    int _2732 = int(_2590) + int(_2688);
    float _2734 = exp2(_2704);
    float _2736 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2648);
    float _2738 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2682);
    float _2740 = fma(_2728, _2718, _2696);
    int _2742 = _2722 * _2732;
    int _2744 = _2742 + _2536;
    float _2746 = fma(_2736, _2718, _2698);
    float _2748 = fma(_2738, _2726, _2740);
    int _2750 = int(_2622) + int(_2710);
    float _2752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2754 = uint(_2744) >= uint(_2436);
    float _2756 = fma(_2730, _2718, _2690);
    bool _2758 = _1404 <= 8000.0;
    bool _2760 = isnan(_1404);
    bool _2762 = _2758 || _2760;
    bool _2764 = isnan(8000.0);
    bool _2766 = _2762 || _2764;
    float _2768 = float(_2766);
    int _2770 = _2714 * _2750;
    int _2772 = _2770 + _2548;
    bool _2774 = !_2754;
    int _2776 = _2774 ? 0 : (-1);
    float _2778 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2702);
    bool _2780 = _2436 == 0;
    float _2782 = fma(_2700, _2726, _2756);
    bool _2784 = uint(_2772) >= uint(_2488);
    float _2786 = fma(_2778, _2726, _2746);
    int _2788 = _2536 ^ _2436;
    bool _2790 = !_2784;
    int _2792 = _2790 ? 0 : (-1);
    float _2794 = _2752 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _2796 = uint(int(uint(_2788) >> uint(31)));
    float _2798 = fma(_2734, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2800 = precise::clamp(_2798, 0.0, 1.0);
    int _2802 = ~_2732;
    int _2804 = _2802 + _2776;
    int _2806 = _2804 + 1;
    float _2808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2810 = ~_2792;
    int _2812 = _2750 + _2810;
    int _2814 = _2812 + 1;
    float _2816 = fma(_2794, _2632, -0.5);
    int _2818 = ~int(_2796);
    int _2820 = _2818 + 1;
    int _2822 = _2436 * _2806;
    int _2824 = _2822 + _2536;
    float _2826 = fma(_2800, -2.0, 3.0);
    float _2828 = _2800 * _2800;
    int _2830 = _2814 ^ _2820;
    out.m_81.x = _2782;
    out.m_81.y = _2748;
    out.m_81.z = _2786;
    bool _2832 = _2436 == 0;
    float _2834 = _2828 * _2826;
    int _2836 = ~_2820;
    int _2838 = _2836 + _2830;
    int _2840 = _2838 + 1;
    bool _2842 = !_2780;
    int _2844 = _2842 ? _2824 : (-1);
    float _2846 = -_2834;
    float _2848 = _2846 + 1.0;
    bool _2850 = !_2832;
    int _2852 = _2850 ? _2840 : (-1);
    float _2854 = float(_2844);
    float _2856 = _2808 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2858 = float(_2852);
    float _2860 = fma(_2848, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2834);
    bool _2862 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2864 = isnan(_1546);
    bool _2866 = _2862 || _2864;
    bool _2868 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2870 = _2866 || _2868;
    float _2872 = fma(_2856, _2312, -0.5);
    float _2874 = fma(_2794, _2854, _766);
    float _2876 = -_732;
    float _2878 = fma(_2856, _2858, _2876);
    float _2880 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1873);
    float _2882 = in.m_83.x;
    float _2884 = _2768 * _2860;
    float _2886 = _1752 * 0.5;
    float _2888 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2880);
    float _2890 = fma(_812, _2816, _2874);
    float _2892 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2894 = fma(_712, _2872, _2878);
    float _2896 = _2888 + _1752;
    float _2898 = fma(_1802, -0.5, _2886);
    float _2900 = _2890 + 0.5;
    float _2902 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2904 = _2376 * _2892;
    float _2906 = precise::clamp(_2904, 0.0, 1.0);
    float _2908 = _2896 * 0.5;
    float _2910 = _2902 * _1832;
    float _2912 = -_2906;
    float _2914 = fma(_2912, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2916 = _2894 + 0.5;
    out.gl_Position.x = _1776;
    out.gl_Position.y = _1802;
    out.gl_Position.z = _2888;
    out.gl_Position.w = _1752;
    float _2918 = _1853 * _2910;
    out.m_85.x = _1915;
    out.m_85.y = _2898;
    out.m_85.z = _2908;
    out.m_85.w = _1752;
    float _2920 = _2914 * _2882;
    out.m_87.x = _2900;
    out.m_87.y = _2916;
    float _2922 = _2920 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2924 = _1843 * _2910;
    out.m_89.x = _2922;
    float _2926 = -_2902;
    float _2928 = _2926 + 1.0;
    float _2930 = fma(_1849, _2924, _1837);
    float _2932 = fma(_1851, _2924, _1839);
    float _2934 = fma(_1843, _2918, _1841);
    float _2936 = _1843 * _2928;
    float _2938 = _1458 * _1512;
    float _2940 = _2902;
    float _2942 = _2924;
    float _2944 = _1752;
    float _2946 = _2908;
    float _2948 = _2898;
    float _2950 = _2938;
    if (!_2870)
    {
        _2940 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2952 = _2940;
    float _2954 = _2952;
    float _2956 = _2952;
    if (!_2870)
    {
        _2942 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2958 = _2942;
    out.m_91.x = _2930;
    out.m_91.y = _2932;
    out.m_91.z = _2934;
    out.m_91.w = _2936;
    float _2960 = _2938 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2962 = _2958;
    float _2964 = _2958;
    if (!_2870)
    {
        _2944 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2966 = _2944;
    float _2968 = _2966;
    float _2970 = _2966;
    if (!_2870)
    {
        _2946 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2972 = _2946;
    float _2974 = _2972;
    float _2976 = _2972;
    if (!_2870)
    {
        _2948 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2978 = _2948;
    float _2980 = _2978;
    float _2982 = _2978;
    if (!_2870)
    {
        _2950 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2984 = _2950;
    bool _2986 = !_2870;
    float _2988 = _2984;
    float _2990 = _2984;
    if (!_2986)
    {
        bool _2992 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2994 = isnan(_1546);
        bool _2996 = _2992 || _2994;
        bool _2998 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3000 = _2996 || _2998;
        if (!_3000)
        {
            float _3002 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3004 = _1546 + _3002;
            float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3008 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3006;
            float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3012 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3014 = 1.0 / _3008;
            float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3018 = _3016 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3022 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3026 = _3024 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3028 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3030 = _3028 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3032 = _3004 * _3014;
            float _3034 = precise::clamp(_3032, 0.0, 1.0);
            float _3036 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3038 = _3036 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3040 = fma(_3034, _3012, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3042 = fma(_3034, _3038, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3044 = fma(_3034, _3018, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3046 = fma(_3034, _3022, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3048 = fma(_3034, _3026, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3050 = fma(_3034, _3030, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2964 = _3044;
            _2982 = _3048;
            _2956 = _3040;
            _2976 = _3046;
            _2970 = _3042;
            _2990 = _3050;
            _3052 = true;
        }
        else
        {
            bool _3054 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3056 = isnan(_1546);
            bool _3058 = _3054 || _3056;
            bool _3060 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3062 = _3058 || _3060;
            if (!_3062)
            {
                _2954 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3064 = _2954;
            _2956 = _3064;
            if (!_3062)
            {
                _2962 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3066 = _2962;
            _2964 = _3066;
            if (!_3062)
            {
                _2968 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3068 = _2968;
            _2970 = _3068;
            if (!_3062)
            {
                _2974 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3070 = _2974;
            _2976 = _3070;
            if (!_3062)
            {
                _2980 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3072 = _2980;
            _2982 = _3072;
            if (!_3062)
            {
                _2988 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3074 = _2988;
            bool _3076 = !_3062;
            _2990 = _3074;
            if (!_3076)
            {
                bool _3078 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3080 = isnan(_1546);
                bool _3082 = _3078 || _3080;
                bool _3084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3086 = _3082 || _3084;
                if (!_3086)
                {
                    float _3088 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3090 = _1546 + _3088;
                    float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3094 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3092;
                    float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3098 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3100 = 1.0 / _3094;
                    float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3104 = _3102 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3110 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3118 = _3090 * _3100;
                    float _3120 = precise::clamp(_3118, 0.0, 1.0);
                    float _3122 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3124 = _3122 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3126 = fma(_3120, _3098, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3128 = fma(_3120, _3124, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3130 = fma(_3120, _3104, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3132 = fma(_3120, _3108, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3134 = fma(_3120, _3112, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3136 = fma(_3120, _3116, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2964 = _3130;
                    _2982 = _3134;
                    _2956 = _3126;
                    _2976 = _3132;
                    _2970 = _3128;
                    _2990 = _3136;
                    _3052 = true;
                }
                else
                {
                    _2964 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2982 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2956 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2976 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2970 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2990 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3052 = false;
    float _3138 = _2964;
    float _3140 = _2982;
    float _3142 = _2956;
    float _3144 = _2976;
    float _3146 = _2970;
    float _3148 = _2990;
    float _3150 = fma(_2748, -0.5, 0.5);
    float _3152 = precise::clamp(_3150, 0.0, 1.0);
    float _3154 = -_3138;
    float _3156 = _3154 + _3140;
    float _3158 = _2960 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3160 = -_3142;
    float _3162 = _3160 + _3144;
    float _3164 = fma(_3152, _3156, _3138);
    out.m_93.x = 0.0;
    float _3166 = -_3146;
    float _3168 = _3166 + _3148;
    float _3170 = fma(_3152, _3162, _3142);
    float _3172 = _3164 * 0.586610972881317138671875;
    out.m_49.x = _3158;
    bool _3174 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3176 = fma(_3152, _3168, _3146);
    float _3178 = fma(_3170, 0.298911988735198974609375, _3172);
    bool _3180 = _1458 > 0.0;
    bool _3182 = isnan(_1458);
    bool _3184 = _3180 || _3182;
    bool _3186 = isnan(0.0);
    bool _3188 = _3184 || _3186;
    float _3190 = fma(_3176, 0.114477999508380889892578125, _3178);
    bool _3192 = _1512 <= 0.0;
    bool _3194 = !_3188;
    bool _3196 = _3192 || _3194;
    float _3198 = -_3190;
    float _3200 = _3170 + _3198;
    float _3202 = -_3190;
    float _3204 = _3164 + _3202;
    float _3206 = -_3190;
    float _3208 = _3176 + _3206;
    float _3210 = fma(_3200, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3190);
    float _3212 = fma(_3204, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3190);
    float _3214 = fma(_3208, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3190);
    bool _3216 = !_3174;
    if (!_3216)
    {
        float _3218 = -_1390;
        float _3220 = _3218 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3222 = -_1392;
        float _3224 = _3222 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3226 = -_1394;
        float _3228 = _3226 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3230 = _3220 * _3220;
        float _3232 = fma(_3224, _3224, _3230);
        float _3234 = fma(_3228, _3228, _3232);
        float _3236 = sqrt(_3234);
        float _3238 = rsqrt(_3234);
        float _3240 = -_3236;
        float _3242 = _3240 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3244 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3246 = precise::clamp(_3244, 0.0, 1.0);
        float _3248 = _3224 * _3238;
        float _3250 = _3220 * _3238;
        float _3252 = abs(_3246);
        float _3254 = log2(_3252);
        float _3256 = _3228 * _3238;
        float _3258 = _3248 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3260 = _2748 * _3250;
        float _3262 = -_3250;
        float _3264 = -_3258;
        float _3266 = fma(_3262, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3264);
        float _3268 = fma(_2782, _3248, _3260);
        float _3270 = -_3256;
        float _3272 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3266);
        float _3274 = fma(_2786, _3256, _3268);
        float _3276 = precise::clamp(_3274, 0.0, 1.0);
        float _3278 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3280 = _3272 + _3278;
        float _3282 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3284 = _3280 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3286 = precise::clamp(_3284, 0.0, 1.0);
        float _3288 = exp2(_3282);
        float _3290 = _3288 * _3286;
        float _3292 = _3276 * _3290;
        float _3294 = _3292 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3296 = _3292 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3298 = _3292 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3294;
        out.m_93.y = _3296;
        out.m_93.z = _3298;
    }
    out.m_65.x = _3210;
    out.m_65.y = _3212;
    out.m_65.z = _3214;
    if (!_3196)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3300 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3300;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3052 = false;
    bool _450 = false;
    bool _346 = false;
    bool _220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3357 = as_type<float>(_128);
        out.gl_Position.z = _3357;
    }
    if (!_116)
    {
        return out;
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_112);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _122;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3426 = as_type<float>(_166);
        out.gl_Position.z = _3426;
    }
    if (_160)
    {
        return out;
    }
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _178 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _180 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _182 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _184);
    float _192 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _186);
    bool _194 = !_174;
    float _196 = _188;
    float _198 = _190;
    float _200 = _192;
    float _218;
    if (!_194)
    {
        float _202 = in.m_55.x;
        float _204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _210 = _208 * _204;
        float _212 = floor(_210);
        float _214 = -_212;
        float _216 = _210 + _214;
        _218 = _216;
        _220 = true;
    }
    else
    {
        float _222 = float(_112);
        float _224 = 1.0 / _222;
        float _226 = _146 * _224;
        _218 = _226;
    }
    _220 = false;
    float _228 = _218;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _228 + _230;
    bool _234 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_228);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = -_244;
    float _252 = _250 + 1.0;
    bool _254 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _256 = isnan(_228);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = 1.0 / _248;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _278 = _264 * _252;
    float _280 = -_264;
    float _282 = _280 + 1.0;
    float _284 = _232 * _266;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _286;
    float _290 = in.m_57.x;
    float _292 = in.m_57.y;
    float _294 = in.m_57.z;
    float _296 = fma(_270, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = fma(_288, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _300 = fma(_274, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _302 = _296 * _278;
    float _304 = _298 * _278;
    float _306 = _300 * _278;
    float _308 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].x, _302);
    float _310 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].y, _304);
    float _312 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].z, _306);
    float _314 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].x, _308);
    float _316 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].y, _310);
    float _318 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].z, _312);
    float _320 = _314 * _290;
    float _322 = _316 * _292;
    float _324 = _318 * _294;
    bool _326 = !_276;
    float _344;
    if (!_326)
    {
        float _328 = in.m_55.x;
        float _330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _332 = _328 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _336 = _334 * _330;
        float _338 = floor(_336);
        float _340 = -_338;
        float _342 = _336 + _340;
        _344 = _342;
        _346 = true;
    }
    else
    {
        float _348 = float(_112);
        float _350 = 1.0 / _348;
        float _352 = _146 * _350;
        _344 = _352;
    }
    _346 = false;
    float _354 = _344;
    bool _356 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _358 = isnan(_354);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _372 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _374 = isnan(_354);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _390 = _354 + _388;
    float _392 = -_366;
    float _394 = _392 + 1.0;
    bool _396 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _398 = 1.0 / _370;
    float _400 = _382 * _394;
    float _402 = -_382;
    float _404 = _402 + 1.0;
    float _406 = _386 * _398;
    float _408 = fma(_406, _390, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _412 = _408 * _400;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _416 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[115].x, _412);
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _422 = _414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _424 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[116].x, _418);
    float _426 = _420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _428 = _424 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _422;
    out.m_59.y = _416;
    out.m_59.z = _426;
    out.m_59.w = _428;
    bool _430 = !_396;
    float _448;
    if (!_430)
    {
        float _432 = in.m_55.x;
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _436 = _432 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _438 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _440 = _438 * _434;
        float _442 = floor(_440);
        float _444 = -_442;
        float _446 = _440 + _444;
        _448 = _446;
        _450 = true;
    }
    else
    {
        float _452 = float(_112);
        float _454 = 1.0 / _452;
        float _456 = _146 * _454;
        _448 = _456;
    }
    _450 = false;
    float _458 = _448;
    float _460 = in.m_46.x;
    float _462 = in.m_46.y;
    float _464 = in.m_46.z;
    float _466 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _468 = int(_466);
    float _470 = in.m_55.x;
    float _472 = in.m_55.y;
    float _474 = _322 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _476 = _324 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _478 = in.m_55.z;
    float _480 = float(_468);
    float _482 = _480 * _146;
    float _484 = _462 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _486 = _462 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _488 = _462 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _490 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[5].x, _484);
    float _492 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[4].x, _486);
    float _494 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[6].x, _488);
    float _496 = _470 * 2.0;
    float _498 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[5].z, _490);
    float _500 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[4].z, _492);
    float _502 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[6].z, _494);
    float _504 = _478 * 2.0;
    float _506 = _498 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _508 = _500 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _510 = _502 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _512 = -_506;
    float _514 = _512 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _516 = -_508;
    float _518 = _516 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _520 = floor(_496);
    float _522 = _472 * 2.0;
    float _524 = _514 * _514;
    float _526 = fma(_518, _518, _524);
    float _528 = -_510;
    float _530 = _528 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _532 = floor(_504);
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _536 = fma(_530, _530, _526);
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _540 = _470 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _542 = _472 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _544 = floor(_522);
    float _546 = -_538;
    float _548 = fma(_540, 2.0, _546);
    float _550 = _472 + _478;
    bool _552 = _520 > 0.0;
    float _554 = fma(_542, -2.0, _534);
    float _556 = _550 + (-1.0);
    bool _558 = _520 >= 0.0;
    bool _560 = isnan(_520);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    float _568 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _570 = log2(_568);
    float _572 = _472 + _470;
    bool _574 = _532 > 0.0;
    float _576 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _578 = _532 >= 0.0;
    bool _580 = isnan(_532);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    float _588 = _572 + (-1.0);
    int _590 = _566 ? 0 : 1;
    float _592 = sqrt(_536);
    bool _594 = _544 > 0.0;
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _598 = _544 >= 0.0;
    bool _600 = isnan(_544);
    bool _602 = _598 || _600;
    bool _604 = isnan(0.0);
    bool _606 = _602 || _604;
    int _608 = _586 ? 0 : 1;
    int _610 = _606 ? 0 : 1;
    float _612 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _614 = int(_612);
    float _616 = _570 * _146;
    int _618 = ~_608;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    int _624 = ~_610;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    int _630 = _622;
    int _632 = _628;
    if (!_574)
    {
        int _634 = ~_608;
        int _636 = _634 + 1;
        _630 = _636;
    }
    int _638 = _630;
    float _640 = abs(_592);
    float _642 = precise::max(_640, 200.0);
    float _644 = exp2(_616);
    if (!_594)
    {
        int _646 = ~_610;
        int _648 = _646 + 1;
        _632 = _648;
    }
    int _650 = _632;
    float _652 = precise::min(_642, 300.0);
    bool _654 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _662 = _658 || _660;
    float _664 = float(_614);
    int _666 = ~_590;
    int _668 = _666 + 1;
    int _670 = _668 + 1;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _676 = _674 != 0;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _684 = _682 != 0;
    float _686 = 1.0 / _664;
    int _688 = _670;
    if (!_552)
    {
        int _690 = ~_590;
        int _692 = _690 + 1;
        _688 = _692;
    }
    int _694 = _688;
    float _696 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[78].w, _672);
    float _698 = -_644;
    float _700 = _698 + 1.0;
    bool _702 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _704 = isnan(1.0);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _710 = _706 || _708;
    float _712 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _696);
    bool _714 = !_680;
    int _716 = _714 ? 0 : 1;
    float _718 = fma(_652, 0.00999999977648258209228515625, -2.0);
    bool _720 = !_676;
    int _722 = _720 ? 0 : 1;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _726 = 1.0 + _724;
    bool _728 = !_684;
    int _730 = _728 ? 0 : 1;
    float _732 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _554);
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _740 = _738 != 0;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _744 = _742 != 0;
    float _746 = -_718;
    float _748 = _506 + _746;
    float _750 = 1.0 / _726;
    float _752 = in.m_61.x;
    float _754 = in.m_61.y;
    float _756 = in.m_61.z;
    float _758 = _686 * _146;
    bool _760 = !_744;
    int _762 = _760 ? 0 : 1;
    float _764 = -_146;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[76].x, _548);
    bool _768 = !_736;
    int _770 = _768 ? 0 : 1;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _774 = abs(_762);
    float _776 = fma(_652, 0.00999999977648258209228515625, -1.0);
    bool _778 = !_740;
    int _780 = _778 ? 0 : 1;
    float _782 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[78].z, _772);
    int _784 = abs(_770);
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _788 = _748 + _786;
    int _790 = abs(_780);
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _794 = _508 + _792;
    float _796 = float(_694);
    float _798 = _788 * _788;
    float _800 = _662 ? _700 : 0.0;
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _804 = _510 + _802;
    float _806 = float(_790);
    float _808 = fma(_794, _794, _798);
    float _810 = float(_650);
    float _812 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _782);
    float _814 = float(_784);
    float _816 = _806 * _796;
    float _818 = float(_638);
    float _820 = fma(_804, _804, _808);
    float _822 = float(_774);
    if (_710)
    {
        float _824 = _800 * _750;
        _150 = _824;
    }
    float _826 = _150;
    float _828 = _816 * (-2.0);
    float _830 = _814 * _818;
    float _832 = sqrt(_820);
    float _834 = _822 * _810;
    float _836 = _472 + (-0.5);
    float _838 = _830 * (-2.0);
    float _840 = fma(_828, _754, _754);
    float _842 = fma(_576, _828, _576);
    float _844 = _320 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _846 = fma(_596, _838, _596);
    float _848 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[196].y, _840);
    float _850 = fma(_838, _752, _752);
    float _852 = rsqrt(_820);
    float _854 = _470 + (-0.5);
    float _856 = fma(_842, _826, _848);
    float _858 = _844 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _860 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[196].x, _850);
    float _862 = _832 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _864 = _478 + _470;
    float _866 = _856 * 0.15915493667125701904296875;
    float _868 = _834 * (-2.0);
    float _870 = fma(_846, _826, _860);
    float _872 = precise::min(_858, _862);
    float _874 = _864 + (-1.0);
    float _876 = _866 * 6.283185482025146484375;
    float _878 = sin(_876);
    float _880 = _870 * 0.15915493667125701904296875;
    float _882 = _852 * _872;
    float _884 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _886 = fma(_868, _756, _756);
    float _888 = _478 + (-0.5);
    float _890 = _788 * _882;
    float _892 = fma(_884, _868, _884);
    float _894 = _794 * _882;
    float _896 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].z, _886);
    float _898 = -_890;
    float _900 = _788 + _898;
    float _902 = _880 * 6.283185482025146484375;
    float _904 = sin(_902);
    float _906 = -_894;
    float _908 = _794 + _906;
    float _910 = fma(_892, _826, _896);
    float _912 = _900 * _900;
    float _914 = _804 * _882;
    float _916 = _910 * 0.15915493667125701904296875;
    float _918 = fma(_908, _908, _912);
    float _920 = -_914;
    float _922 = _804 + _920;
    float _924 = in.m_63.x;
    float _926 = in.m_63.y;
    float _928 = in.m_63.z;
    float _930 = _866 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = fma(_922, _922, _918);
    float _936 = _904 * _878;
    float _938 = sqrt(_934);
    float _940 = _880 * 6.283185482025146484375;
    float _942 = cos(_940);
    float _944 = _904 * _932;
    float _946 = _776 * _926;
    float _948 = _916 * 6.283185482025146484375;
    float _950 = cos(_948);
    float _952 = _852 * _938;
    float _954 = _776 * _924;
    float _956 = _776 * _928;
    float _958 = _474 * _952;
    float _960 = _844 * _952;
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _954);
    float _964 = _916 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = _942 * _932;
    float _970 = _942 * _878;
    float _972 = _476 * _952;
    float _974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _956);
    float _976 = _904 * _950;
    float _978 = _932 * _950;
    float _980 = _942 * _950;
    float _982 = _878 * _950;
    float _984 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _946);
    float _986 = _972 * _974;
    float _988 = _958 * _984;
    float _990 = fma(_966, _968, _936);
    float _992 = _960 * _962;
    float _994 = -_944;
    float _996 = fma(_966, _970, _994);
    float _998 = _980 * _988;
    float _1000 = -_988;
    float _1002 = _966 * _1000;
    float _1004 = -_970;
    float _1006 = fma(_966, _944, _1004);
    float _1008 = _976 * _988;
    float _1010 = fma(_990, _992, _998);
    float _1012 = fma(_978, _992, _1002);
    float _1014 = fma(_966, _936, _968);
    float _1016 = fma(_1006, _992, _1008);
    float _1018 = fma(_996, _986, _1010);
    float _1020 = fma(_982, _986, _1012);
    float _1022 = fma(_1014, _986, _1016);
    float _1024 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1026 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1028 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1024);
    float _1030 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1026);
    float _1032 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1028);
    float _1034 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1030);
    float _1036 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1038 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1040 = _510 + _1036;
    float _1042 = _508 + _1038;
    float _1044 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1046 = -_914;
    float _1048 = _510 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1052 = _1040 + _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1056 = _1042 + _1054;
    float _1058 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1044);
    float _1060 = -_890;
    float _1062 = _748 + _1060;
    float _1064 = _1052 * _1052;
    float _1066 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1058);
    float _1068 = -_894;
    float _1070 = _508 + _1068;
    float _1072 = fma(_1056, _1056, _1064);
    float _1074 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1076 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1078 = sqrt(_1072);
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1074);
    float _1082 = _748 + _1076;
    float _1084 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1080);
    bool _1086 = _1078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1088 = _1066;
    float _1090 = _1076;
    float _1092 = _1080;
    float _1094 = _914;
    if (!_1086)
    {
        _1088 = _1042;
    }
    float _1096 = _1088;
    float _1098 = _1096;
    if (!_1086)
    {
        _1090 = _1040;
    }
    float _1100 = _1090;
    float _1102 = _1100;
    if (!_1086)
    {
        _1092 = _1082;
    }
    float _1104 = _1092;
    bool _1106 = !_1086;
    float _1108 = _1104;
    if (!_1106)
    {
        float _1110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1114 = _1078 + _1112;
        float _1116 = rsqrt(_1072);
        float _1118 = _1114 * _1110;
        float _1120 = _1082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = _1118 * 0.15915493667125701904296875;
        float _1124 = _1122 * 6.283185482025146484375;
        float _1126 = cos(_1124);
        float _1128 = _1122 * 6.283185482025146484375;
        float _1130 = sin(_1128);
        float _1132 = _1126 + (-1.0);
        float _1134 = fma(_1130, _1120, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1136 = _1132 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1138 = _1116 * _1134;
        float _1140 = fma(_1082, _1126, _1136);
        float _1142 = fma(_1056, _1138, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1144 = fma(_1052, _1138, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1108 = _1140;
        _1098 = _1142;
        _1102 = _1144;
    }
    float _1146 = _1108;
    float _1148 = _1098;
    float _1150 = _1102;
    float _1152 = -_748;
    float _1154 = _1152 + _1146;
    float _1156 = -_508;
    float _1158 = _1156 + _1148;
    float _1160 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1162 = -_510;
    float _1164 = _1162 + _1150;
    float _1166 = _1154 * _1154;
    float _1168 = -_894;
    float _1170 = _1168 + _1148;
    float _1172 = 1.0 / _1160;
    float _1174 = -_890;
    float _1176 = _1174 + _1146;
    float _1178 = fma(_1158, _1158, _1166);
    float _1180 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1182 = -_914;
    float _1184 = _1182 + _1150;
    float _1186 = fma(_1164, _1164, _1178);
    float _1188 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1180);
    float _1190 = sqrt(_1186);
    float _1192 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1188);
    bool _1194 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1196 = isnan(0.5);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1202 = _1198 || _1200;
    bool _1204 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1206 = isnan(0.5);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1212 = _1208 || _1210;
    float _1214 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1216 = _1214 + _1160;
    float _1218 = _1216 * _1172;
    float _1220 = _1218 * 0.5;
    bool _1222 = _1190 > 0.0;
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1226 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1224);
    float _1228 = 1.0 / _1226;
    float _1230 = _1190;
    float _1232 = _1170;
    float _1234 = _1146;
    float _1236 = _1160;
    float _1238 = _1226;
    float _1240 = _1172;
    float _1242 = _1184;
    if (!_1222)
    {
        _1094 = _1176;
    }
    float _1244 = _1094;
    float _1246 = _1244;
    if (!_1222)
    {
        _1230 = _1184;
    }
    float _1248 = _1230;
    bool _1250 = !_1222;
    float _1252 = _1248;
    if (!_1250)
    {
        float _1254 = _190 * _190;
        float _1256 = rsqrt(_1186);
        float _1258 = fma(_188, _188, _1254);
        float _1260 = fma(_192, _192, _1258);
        float _1262 = sqrt(_1260);
        float _1264 = _1158 * _1256;
        float _1266 = _1154 * _1256;
        float _1268 = _1164 * _1256;
        bool _1270 = _1262 > 0.0;
        float _1272 = _1256;
        float _1274 = _1262;
        _1234 = _1268;
        _1236 = _1266;
        if (!_1270)
        {
            _1272 = _1176;
        }
        float _1276 = _1272;
        _1246 = _1276;
        if (!_1270)
        {
            _1274 = _1184;
        }
        float _1278 = _1274;
        bool _1280 = !_1270;
        _1252 = _1278;
        if (!_1280)
        {
            float _1282 = rsqrt(_1260);
            float _1284 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1286 = _190 * _1282;
            float _1288 = _188 * _1282;
            float _1290 = _192 * _1282;
            float _1292 = _1266 * _1286;
            float _1294 = fma(_1264, _1288, _1292);
            float _1296 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1298 = fma(_1268, _1290, _1294);
            float _1300 = _1298 * _1296;
            float _1302 = fma(_188, _1300, _1170);
            float _1304 = fma(_190, _1300, _1176);
            float _1306 = fma(_192, _1300, _1184);
            _1232 = _1302;
            _1246 = _1304;
            _1252 = _1306;
        }
    }
    float _1308 = _1232;
    float _1310 = _1246;
    float _1312 = _1252;
    float _1314 = _1234;
    float _1316 = _1236;
    float _1318 = _1308;
    float _1320 = _1316;
    float _1322 = _1314;
    if (_1212)
    {
        _1238 = 1.0;
    }
    float _1324 = _1238;
    float _1326 = _1324;
    if (_1202)
    {
        _196 = _1308;
    }
    float _1328 = _196;
    float _1330 = _1328;
    if (_1202)
    {
        _198 = _1310;
    }
    float _1332 = _198;
    float _1334 = _1332;
    if (_1202)
    {
        _200 = _1312;
    }
    float _1336 = _200;
    float _1338 = _1336;
    if (!_1202)
    {
        float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1342 = _1062 + _1340;
        float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1346 = _1070 + _1344;
        float _1348 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1350 = -_1070;
        float _1352 = _1350 + _1308;
        float _1354 = _1342 * _1342;
        float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1358 = _1048 + _1356;
        float _1360 = -_1062;
        float _1362 = _1360 + _1310;
        float _1364 = -_1048;
        float _1366 = _1364 + _1312;
        float _1368 = fma(_1346, _1346, _1354);
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1372 = fma(_1358, _1358, _1368);
        float _1374 = sqrt(_1372);
        float _1376 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1378 = precise::min(_1374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1380 = _1378 * _1370;
        float _1382 = _1376 * _1380;
        float _1384 = fma(_1352, _1382, _1070);
        float _1386 = fma(_1362, _1382, _1062);
        float _1388 = fma(_1366, _1382, _1048);
        _1334 = _1386;
        _1330 = _1384;
        _1338 = _1388;
        _1318 = _1352;
    }
    float _1390 = _1334;
    float _1392 = _1330;
    float _1394 = _1338;
    float _1396 = _1318;
    float _1398 = _1396;
    if (_1212)
    {
        _1320 = 1.0;
    }
    float _1400 = _1320;
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1404 = _1228 * _1402;
    float _1406 = _1400;
    if (!_1212)
    {
        float _1408 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1410 = _1408 * 0.15915493667125701904296875;
        float _1412 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1414 = _1410 * 6.283185482025146484375;
        float _1416 = cos(_1414);
        float _1418 = _1412 * 0.15915493667125701904296875;
        float _1420 = _1410 * 6.283185482025146484375;
        float _1422 = sin(_1420);
        float _1424 = 1.0 / _1416;
        float _1426 = _1418 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1422 * _1424;
        float _1432 = _1418 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1438 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1436;
        float _1440 = _1428 * _1430;
        float _1442 = 1.0 / _1438;
        float _1444 = 1.0 / _1440;
        float _1446 = _1434 * _1444;
        float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1450 = fma(_1404, _1446, _1448);
        float _1452 = _1450 * _1442;
        float _1454 = precise::clamp(_1452, 0.0, 1.0);
        _1398 = _1410;
        _1326 = _1454;
    }
    float _1456 = _1398;
    float _1458 = _1326;
    if (!_1212)
    {
        float _1460 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1462 = _1460 * 0.15915493667125701904296875;
        float _1464 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1466 = _1462 * 6.283185482025146484375;
        float _1468 = cos(_1466);
        float _1470 = _1464 * 0.15915493667125701904296875;
        float _1472 = _1462 * 6.283185482025146484375;
        float _1474 = sin(_1472);
        float _1476 = 1.0 / _1468;
        float _1478 = _1470 * 6.283185482025146484375;
        float _1480 = cos(_1478);
        float _1482 = _1474 * _1476;
        float _1484 = _1470 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        float _1488 = _1480 * _1482;
        float _1490 = 1.0 / _1488;
        float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1494 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1492;
        float _1496 = 1.0 / _1494;
        float _1498 = _1486 * _1490;
        float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1502 = fma(_1404, _1498, _1500);
        float _1504 = _1502 * _1496;
        float _1506 = precise::clamp(_1504, 0.0, 1.0);
        float _1508 = -_1506;
        float _1510 = _1508 + 1.0;
        _1406 = _1510;
    }
    float _1512 = _1406;
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1516 = _1390 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1520 = _1392 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1524 = _1394 + _1522;
    float _1526 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1528 = _1516 * _1516;
    float _1530 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1532 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1526);
    float _1534 = fma(_1520, _1520, _1528);
    float _1536 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1530);
    float _1538 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1532);
    float _1540 = fma(_1524, _1524, _1534);
    float _1542 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1544 = rsqrt(_1540);
    float _1546 = sqrt(_1540);
    float _1548 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1550 = _1520 * _1548;
    float _1552 = _1524 * _1548;
    float _1554 = _1550 * _1550;
    float _1556 = _1552 * _1552;
    float _1558 = _1554 + _1556;
    float _1560 = sqrt(_1558);
    bool _1562 = _1560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1566 = _1560 + _1564;
    float _1568 = _1528;
    float _1570 = _1558;
    float _1572 = _1566;
    float _1574 = _1550;
    float _1576 = _1552;
    float _1578 = _1554;
    if (_1562)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1580;
    }
    float _1582 = _1568;
    if (_1562)
    {
        float _1584 = rsqrt(_1558);
        _1570 = _1584;
    }
    float _1586 = _1570;
    float _1588 = _1586;
    if (_1562)
    {
        float _1590 = _1566 * _1582;
        _1572 = _1590;
    }
    float _1592 = _1572;
    if (_1562)
    {
        float _1594 = _1592 * 0.15915493667125701904296875;
        _1240 = _1594;
    }
    float _1596 = _1240;
    float _1598 = _1582;
    if (_1562)
    {
        float _1600 = _1596 * 6.283185482025146484375;
        float _1602 = sin(_1600);
        _1598 = _1602;
    }
    float _1604 = _1598;
    float _1606 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1608 = precise::max(0.0, _1606);
    float _1610 = _1456;
    if (_1562)
    {
        float _1612 = _1596 * 6.283185482025146484375;
        float _1614 = cos(_1612);
        _1610 = _1614;
    }
    float _1616 = _1610;
    float _1618 = -_1548;
    float _1620 = -_1608;
    float _1622 = fma(_1516, _1618, _1620);
    if (_1562)
    {
        float _1624 = _1622 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1624;
    }
    float _1626 = _1242;
    float _1628 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1630 = fma(_1070, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1632 = _1604;
    float _1634 = _1626;
    if (_1562)
    {
        float _1636 = fma(_1604, _1626, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1322 = _1636;
    }
    float _1638 = _1322;
    float _1640 = _1638;
    if (!_1562)
    {
        _1632 = _1622;
    }
    float _1642 = _1632;
    float _1644 = floor(_1630);
    float _1646 = _1642;
    float _1648 = _1616;
    if (_1562)
    {
        float _1650 = _1616 + (-1.0);
        _1634 = _1650;
    }
    float _1652 = _1634;
    if (_1562)
    {
        float _1654 = _1586 * _1638;
        _1640 = _1654;
    }
    float _1656 = _1640;
    if (_1562)
    {
        float _1658 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1588 = _1658;
    }
    float _1660 = _1588;
    if (_1562)
    {
        float _1662 = _1550 * _1656;
        _1574 = _1662;
    }
    float _1664 = _1574;
    if (_1562)
    {
        float _1666 = _1552 * _1656;
        _1576 = _1666;
    }
    float _1668 = _1576;
    if (_1562)
    {
        float _1670 = fma(_1622, _1616, _1660);
        _1646 = _1670;
    }
    float _1672 = _1646;
    if (_1562)
    {
        float _1674 = _1664 * _1664;
        _1578 = _1674;
    }
    float _1676 = _1578;
    if (!_1562)
    {
        _1648 = _1556;
    }
    float _1678 = _1648;
    float _1680 = _1678;
    if (_1562)
    {
        float _1682 = _1668 * _1668;
        _1680 = _1682;
    }
    float _1684 = _1680;
    float _1686 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1688 = fma(_1672, _1672, _1676);
    float _1690 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1686);
    float _1692 = _1688 + _1684;
    float _1694 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1696 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1698 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1690);
    float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1702 = fma(_1546, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1700);
    float _1704 = precise::clamp(_1702, 0.0, 1.0);
    float _1706 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1696);
    float _1708 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1710 = rsqrt(_1692);
    float _1712 = -_1704;
    float _1714 = _1712 + 1.0;
    float _1716 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1706);
    float _1718 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1720 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1536);
    float _1722 = fma(_1048, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1724 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1726 = -_1628;
    float _1728 = fma(_1726, _1694, 1.0);
    float _1730 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1732 = abs(_1714);
    float _1734 = log2(_1732);
    float _1736 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1718);
    float _1738 = -_1644;
    float _1740 = _1630 + _1738;
    float _1742 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1744 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1746 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1736);
    float _1748 = _1710 * _1664;
    float _1750 = _1710 * _1668;
    float _1752 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1746);
    float _1754 = _1710 * _1672;
    float _1756 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1758 = floor(_1722);
    float _1760 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1742);
    float _1762 = -_1756;
    float _1764 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1760);
    float _1770 = -_1750;
    float _1772 = fma(_1770, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1774 = log2(_1728);
    float _1776 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1768);
    float _1778 = fma(_1772, -0.5, 0.5);
    float _1780 = fma(_1772, 0.5, 0.5);
    float _1782 = exp2(_1766);
    float _1784 = -_1758;
    float _1786 = _1722 + _1784;
    float _1788 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1744);
    float _1790 = fma(_1780, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1792 = _1754 + 1.0;
    float _1794 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1788);
    float _1796 = fma(_1780, _1790, -0.212114393711090087890625);
    float _1798 = 1.0 / _1752;
    float _1800 = _1774 * 0.693147182464599609375;
    float _1802 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1794);
    float _1804 = fma(_1780, _1796, 1.570728778839111328125);
    float _1806 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1808 = sqrt(_1778);
    float _1810 = -_1754;
    float _1812 = fma(_1782, _1792, _1810);
    float2 _5981 = float2(_1740, _1786);
    float _1814 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5981, float2(0.0), isnan(_5981)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5981, float2(0.0), isnan(_5981)), level(0.0)).x;
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = _1776 * _1798;
    float _1820 = _1802 * _1798;
    float _1822 = fma(_1818, 0.5, 0.5);
    float _1824 = fma(_1820, -0.5, 0.5);
    float _1826 = _1808 * 0.636619746685028076171875;
    float _1828 = -_1804;
    float _1830 = fma(_1826, _1828, 1.0);
    float3 _6012 = float3(_1822, _1824, _1806);
    float _1832 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6012, float3(0.0), isnan(_6012)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6012, float3(0.0), isnan(_6012)), level(0.0)).x;
    float3 _6023 = float3(_1822, _1824, _1806);
    float4 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6023, float3(0.0), isnan(_6023)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6023, float3(0.0), isnan(_6023)), level(0.0)).xyzw;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1835.w;
    float2 _6039 = float2(_1830, _1816);
    float3 _1847 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6039, float2(0.0), isnan(_6039)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6039, float2(0.0), isnan(_6039)), level(0.0)).xyz;
    float _1849 = _1847.x;
    float _1851 = _1847.y;
    float _1853 = _1847.z;
    float _1855 = float(uint(_468));
    float _1857 = trunc(_758);
    int _1859 = int(_1857);
    int _1861 = abs(_716);
    float _1863 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1865 = ~_468;
    int _1867 = _1865 + 1;
    float _1869 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1871 = abs(_722);
    float _1873 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1863);
    int _1875 = abs(_730);
    float _1877 = 1.0 / _1855;
    bool _1879 = _472 > 0.5;
    out.m_65.w = _872;
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1883 = _458 + _1881;
    int _1885 = ~_468;
    int _1887 = _1885 + 1;
    out.m_67.x = _1070;
    out.m_67.y = _1062;
    out.m_67.z = _1048;
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1891 = _1889 != 0;
    float _1893 = exp2(_1869);
    float _1895 = float(uint(_1859));
    out.m_69.x = _960;
    int _1897 = ~_468;
    int _1899 = _1897 + 1;
    out.m_71.x = _1392;
    out.m_71.y = _1390;
    out.m_71.z = _1394;
    bool _1901 = !_1891;
    float _1903 = _1901 ? 7.345489978790283203125 : 1.0;
    int _1905 = as_type<int>(_1877) + (-2);
    float _1907 = _1776 + _1752;
    float _1909 = _1903 * _470;
    float _1911 = float(_112);
    float _1913 = as_type<float>(_1905) * _1895;
    float _1915 = _1907 * 0.5;
    float _1917 = -_1893;
    float _1919 = _1917 + 1.0;
    float _1921 = 1.0 / _1911;
    float _1923 = trunc(_1913);
    float _1925 = precise::max(_1923, 0.0);
    uint _1928 = uint(_1925);
    float _1930 = _482 * _1921;
    int _1932 = _468 + (-1);
    int _1934 = _1867 * int(_1928);
    int _1936 = _1934 + _1859;
    float _1938 = floor(_1909);
    float _1940 = float(uint(_1936));
    float _1942 = as_type<float>(_1905) * _1940;
    int _1944 = ~_468;
    int _1946 = _1944 + 1;
    float _1948 = trunc(_1942);
    float _1950 = precise::max(_1948, 0.0);
    uint _1952 = uint(_1950);
    float _1954 = -_1938;
    float _1956 = _1909 + _1954;
    float _1958 = _1956 * _480;
    float _1960 = trunc(_1958);
    int _1962 = int(_1960);
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1964;
    int _1968 = int(_1928) + int(_1952);
    float _1970 = float(_1859);
    int _1972 = _1946 * _1968;
    int _1974 = _1972 + _1859;
    bool _1976 = _1970 >= _480;
    bool _1978 = isnan(_1970);
    bool _1980 = _1976 || _1978;
    bool _1982 = isnan(_480);
    bool _1984 = _1980 || _1982;
    float _1986 = float(_1984);
    float _1988 = trunc(_1930);
    int _1990 = int(_1988);
    bool _1992 = uint(_1974) >= uint(_468);
    int _1994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1996 = _1994 != 0;
    bool _1998 = !_1992;
    int _2000 = _1998 ? 0 : (-1);
    bool _2002 = _468 == 0;
    float _2004 = trunc(_1986);
    int _2006 = int(_2004);
    int _2008 = ~_1968;
    int _2010 = _2008 + _2000;
    int _2012 = _2010 + 1;
    bool _2014 = !_1996;
    int _2016 = _2014 ? 0 : 1;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2020 = _2018 != 0;
    int _2022 = _468 * _2012;
    int _2024 = _2022 + _1859;
    int _2026 = abs(_2016);
    bool _2028 = !_2002;
    int _2030 = _2028 ? _2024 : (-1);
    int _2032 = _1962 * _2026;
    int _2034 = _2032 + _1859;
    int _2036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2038 = _2036 != 0;
    float _2040 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2040;
    int _2044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2046 = _2044 != 0;
    float _2048 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2050 = _2048 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2052 = ~_2006;
    int _2054 = _2052 + 1;
    int _2056 = _2054 + 1;
    bool _2058 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2060 = isnan(_458);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2066 = _2062 || _2064;
    float _2068 = float(_2066);
    int _2070 = _2030 * _2056;
    int _2072 = _2006 * _1932;
    int _2074 = _2072 + _2070;
    bool _2076 = !_2020;
    int _2078 = _2076 ? 0 : 1;
    int _2080 = _2074 * _1861;
    int _2082 = abs(_2078);
    int _2084 = _1990 * _1871;
    int _2086 = _2084 + _2080;
    int _2088 = ~_468;
    int _2090 = _2088 + 1;
    float _2092 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2094 = _2092 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2096 = _2034 * _1875;
    int _2098 = _2096 + _2086;
    int _2100 = ~_468;
    int _2102 = _2100 + 1;
    int _2104 = _1962 * _2082;
    int _2106 = _2104 + _2098;
    float _2108 = 1.0 / _2094;
    float _2110 = float(uint(_2106));
    float _2112 = as_type<float>(_1905) * _2110;
    float _2114 = trunc(_2112);
    float _2116 = precise::max(_2114, 0.0);
    uint _2118 = uint(_2116);
    float _2120 = _2050 * _2108;
    int _2122 = _2102 * int(_2118);
    int _2124 = _2122 + _2106;
    float _2126 = float(uint(_2124));
    float _2128 = as_type<float>(_1905) * _2126;
    float _2130 = float(uint(_2034));
    float _2132 = trunc(_2128);
    float _2134 = precise::max(_2132, 0.0);
    uint _2136 = uint(_2134);
    float _2138 = as_type<float>(_1905) * _2130;
    float _2140 = trunc(_2138);
    float _2142 = precise::max(_2140, 0.0);
    uint _2144 = uint(_2142);
    float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2148 = _2146 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2150 = int(_2118) + int(_2136);
    float _2152 = 1.0 / _2148;
    int _2154 = _2090 * _2150;
    int _2156 = _2154 + _2106;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    bool _2158 = uint(_2156) >= uint(_468);
    bool _2160 = !_2158;
    int _2162 = _2160 ? 0 : (-1);
    int _2164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2166 = _2164 != 0;
    float _2168 = _2042 * _2152;
    int _2170 = ~_2150;
    int _2172 = _2170 + _2162;
    int _2174 = _2172 + 1;
    float _2176 = in.m_75.y;
    int _2178 = _1887 * int(_2144);
    int _2180 = _2178 + _2034;
    float _2182 = fma(_2168, _1883, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2184 = _468 * _2174;
    int _2186 = _2184 + _2106;
    bool _2188 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2190 = isnan(_458);
    bool _2192 = _2188 || _2190;
    bool _2194 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2196 = _2192 || _2194;
    float _2198 = float(_2196);
    float _2200 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2202 = _458 + _2200;
    float _2204 = float(uint(_2180));
    bool _2206 = !_2002;
    int _2208 = _2206 ? _2186 : (-1);
    float _2210 = -_2198;
    float _2212 = _2210 + 1.0;
    float _2214 = as_type<float>(_1905) * _2204;
    int _2216 = _2208 >> 31;
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2220 = _2218 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2222 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2224 = isnan(_458);
    bool _2226 = _2222 || _2224;
    bool _2228 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2230 = _2226 || _2228;
    float _2232 = float(_2230);
    int _2234 = _2216 & 3;
    float _2236 = trunc(_2214);
    float _2238 = precise::max(_2236, 0.0);
    uint _2240 = uint(_2238);
    bool _2242 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2244 = isnan(_458);
    bool _2246 = _2242 || _2244;
    bool _2248 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2250 = _2246 || _2248;
    float _2252 = float(_2250);
    int _2254 = _2208 + _2234;
    int _2256 = _2208 & 3;
    bool _2258 = _2256 != 0;
    float _2260 = -_2252;
    float _2262 = _2260 + 1.0;
    int _2264 = _2254 >> 2;
    float _2266 = 1.0 / _2220;
    float _2268 = _2252 * _2212;
    float _2270 = _2068 * _2262;
    int _2272 = _2264 << 4;
    int _2274 = _2272 + 368;
    float _2276 = -_2068;
    float _2278 = _2276 + 1.0;
    float _2280 = -_2176;
    float _2282 = _2280 + 1.0;
    uint _2284 = uint(int(uint(_2274) >> uint(2)));
    uint _2286 = uint(int(uint(int(_2284)) >> uint(2)));
    int _2288 = int(_2284) & 3;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[int(_2286)][_2288];
    int _2292 = int(_2284) + 1;
    uint _2294 = uint(int(uint(_2292) >> uint(2)));
    int _2296 = _2292 & 3;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[int(_2294)][_2296];
    float _2300 = _2232 * _2278;
    int _2302 = int(_2144) + int(_2240);
    float _2304 = -_2232;
    float _2306 = _2304 + 1.0;
    float _2308 = _2176;
    if (_2038)
    {
        float _2310 = _1879 ? _2282 : _2176;
        _2308 = _2310;
    }
    float _2312 = _2308;
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2316 = _458 + _2314;
    int _2318 = _2258 ? 0 : 1;
    float _2320 = _1966 * _2266;
    float _2322 = _2182 * _2300;
    int _2324 = _2208 & 3;
    bool _2326 = _2324 != 0;
    float _2328 = _2182;
    if (_2166)
    {
        float _2330 = in.m_55.x;
        _2328 = _2330;
    }
    float _2332 = _2328;
    int _2334 = _2274 + 8;
    uint _2336 = uint(int(uint(_2334) >> uint(2)));
    uint _2338 = uint(int(uint(int(_2336)) >> uint(2)));
    int _2340 = int(_2336) & 3;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[int(_2338)][_2340];
    int _2344 = int(_2336) + 1;
    uint _2346 = uint(int(uint(_2344) >> uint(2)));
    int _2348 = _2344 & 3;
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[int(_2346)][_2348];
    float _2352 = fma(_2120, _2316, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2354 = uint(_2324) > 1u;
    float _2356 = fma(_2306, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2322);
    bool _2358 = _2324 != 3;
    float _2360 = fma(_2320, _2202, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2362 = ~_2318;
    int _2364 = _2362 + 1;
    int _2366 = _2364 + 1;
    int _2368 = _1899 * _2302;
    int _2370 = _2368 + _2034;
    float _2372 = fma(_2352, _2270, _2356);
    float _2374 = -_1814;
    float _2376 = _2374 + 1.0;
    bool _2378 = uint(_2370) >= uint(_468);
    float _2380 = fma(_2360, _2268, _2372);
    int _2382 = _2366;
    if (!_2354)
    {
        int _2384 = ~_2318;
        int _2386 = _2384 + 1;
        _2382 = _2386;
    }
    int _2388 = _2382;
    bool _2390 = uint(_2324) >= 2u;
    int _2392 = abs(_2388);
    int _2394 = _2390 ? 0 : 1;
    bool _2396 = !_2326;
    int _2398 = _2396 ? 0 : 1;
    bool _2400 = !_2378;
    int _2402 = _2400 ? 0 : (-1);
    int _2404 = ~_2394;
    int _2406 = _2404 + 1;
    int _2408 = _2406 + 1;
    bool _2410 = _2324 != 3;
    int _2412 = _2408;
    if (_2358)
    {
        int _2414 = ~_2394;
        int _2416 = _2414 + 1;
        _2412 = _2416;
    }
    int _2418 = _2412;
    int _2420 = ~_2392;
    int _2422 = _2420 + 1;
    int _2424 = _2422 + 1;
    int _2426 = abs(_2398);
    int _2428 = ~_2302;
    int _2430 = _2428 + _2402;
    int _2432 = _2430 + 1;
    float _2434 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2436 = int(_2434);
    bool _2438 = !_2410;
    int _2440 = _2438 ? 0 : (-1);
    int _2442 = _2424 * as_type<int>(_2298);
    int _2444 = abs(_2418);
    bool _2446 = !_2046;
    int _2448 = _2446 ? 0 : 1;
    int _2450 = ~_2426;
    int _2452 = _2450 + 1;
    int _2454 = _2452 + 1;
    int _2456 = abs(_2440);
    int _2458 = _2454 * as_type<int>(_2290);
    int _2460 = _2458 + _2442;
    bool _2462 = _2332 > 0.5;
    bool _2464 = _2462 && _2166;
    int _2466 = _468 * _2432;
    int _2468 = _2466 + _2034;
    int _2470 = abs(_2448);
    float _2472 = in.m_75.x;
    int _2474 = ~_2444;
    int _2476 = _2474 + 1;
    int _2478 = _2476 + 1;
    int _2480 = ~_2456;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    float _2486 = _980 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2488 = abs(_2436);
    int _2490 = _2478 * as_type<int>(_2342);
    int _2492 = _2490 + _2460;
    float _2494 = _980 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2496 = float(uint(_2436));
    int _2498 = _2484 * as_type<int>(_2350);
    int _2500 = _2498 + _2492;
    bool _2502 = !_2002;
    int _2504 = _2502 ? _2468 : (-1);
    float _2506 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2380);
    float _2508 = float(uint(_2488));
    float _2510 = _980 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2512 = ~_2470;
    int _2514 = _2512 + 1;
    int _2516 = _2514 + 1;
    float _2518 = 1.0 / _2496;
    float _2520 = _2506 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2522 = _2500 * _2516;
    float _2524 = -_966;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2486);
    float _2528 = -_966;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2494);
    float _2532 = 1.0 / _2508;
    int _2534 = _2504 * _2470;
    int _2536 = _2534 + _2522;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2540 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2544 = -_966;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2510);
    int _2548 = abs(_2536);
    float _2550 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2552 = as_type<int>(_2518) + (-2);
    float _2554 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2556 = float(uint(_2536));
    float _2558 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2560 = float(uint(_2548));
    int _2562 = ~_2436;
    int _2564 = _2562 + 1;
    float _2566 = as_type<float>(_2552) * _2556;
    int _2568 = as_type<int>(_2532) + (-2);
    out.m_77.x = _2550;
    out.m_77.y = _2554;
    out.m_77.z = _2558;
    out.m_77.w = _2520;
    bool _2570 = _946 != 0.0;
    bool _2572 = isnan(_946);
    bool _2574 = _2570 || _2572;
    bool _2576 = isnan(0.0);
    bool _2578 = _2574 || _2576;
    int _2580 = ~_2488;
    int _2582 = _2580 + 1;
    float _2584 = as_type<float>(_2568) * _2560;
    float _2586 = trunc(_2566);
    float _2588 = precise::max(_2586, 0.0);
    uint _2590 = uint(_2588);
    float _2592 = in.m_79.x;
    float _2594 = in.m_79.y;
    float _2596 = in.m_79.z;
    float _2598 = as_type<float>(_2444);
    float _2600 = _2472;
    if (_2166)
    {
        _2598 = _2472;
    }
    float _2602 = _2598;
    bool _2604 = _954 == 0.0;
    bool _2606 = !_2578;
    bool _2608 = _2604 && _2606;
    float _2610 = _2602;
    if (_2464)
    {
        float _2612 = -_2602;
        float _2614 = _2612 + 1.0;
        _2610 = _2614;
    }
    float _2616 = _2610;
    float _2618 = trunc(_2584);
    float _2620 = precise::max(_2618, 0.0);
    uint _2622 = uint(_2620);
    float _2624 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2530);
    bool _2626 = _956 == 0.0;
    bool _2628 = _2626 && _2608;
    float _2630 = _990 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_2166)
    {
        _2600 = _2616;
    }
    float _2632 = _2600;
    float _2634 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2526);
    float _2636 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2546);
    int _2638 = _2564 * int(_2590);
    int _2640 = _2638 + _2536;
    float _2642 = _990 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2644 = _990 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2646 = _996 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2648 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2630);
    float _2650 = float(uint(_2640));
    float _2652 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2642);
    float _2654 = abs(_1404);
    float _2656 = log2(_2654);
    int _2658 = _2582 * int(_2622);
    int _2660 = _2658 + _2548;
    float _2662 = _2594;
    float _2664 = _2592;
    float _2666 = _2596;
    if (!_2628)
    {
        float _2668 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2594);
        _2662 = _2668;
    }
    float _2670 = _2662;
    float _2672 = as_type<float>(_2552) * _2650;
    float _2674 = _996 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2676 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2646);
    float _2678 = float(uint(_2660));
    float _2680 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2644);
    float _2682 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2674);
    float _2684 = trunc(_2672);
    float _2686 = precise::max(_2684, 0.0);
    uint _2688 = uint(_2686);
    float _2690 = _2634 * _2670;
    float _2692 = as_type<float>(_2568) * _2678;
    float _2694 = _996 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2696 = _2624 * _2670;
    float _2698 = _2636 * _2670;
    float _2700 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2676);
    float _2702 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2694);
    float _2704 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2706 = trunc(_2692);
    float _2708 = precise::max(_2706, 0.0);
    uint _2710 = uint(_2708);
    int _2712 = ~_2488;
    int _2714 = _2712 + 1;
    if (!_2628)
    {
        float _2716 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2592);
        _2664 = _2716;
    }
    float _2718 = _2664;
    int _2720 = ~_2436;
    int _2722 = _2720 + 1;
    if (!_2628)
    {
        float _2724 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2596);
        _2666 = _2724;
    }
    float _2726 = _2666;
    float _2728 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2680);
    float _2730 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2652);
    int _2732 = int(_2590) + int(_2688);
    float _2734 = exp2(_2704);
    float _2736 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2648);
    float _2738 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2682);
    float _2740 = fma(_2728, _2718, _2696);
    int _2742 = _2722 * _2732;
    int _2744 = _2742 + _2536;
    float _2746 = fma(_2736, _2718, _2698);
    float _2748 = fma(_2738, _2726, _2740);
    int _2750 = int(_2622) + int(_2710);
    float _2752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2754 = uint(_2744) >= uint(_2436);
    float _2756 = fma(_2730, _2718, _2690);
    bool _2758 = _1404 <= 8000.0;
    bool _2760 = isnan(_1404);
    bool _2762 = _2758 || _2760;
    bool _2764 = isnan(8000.0);
    bool _2766 = _2762 || _2764;
    float _2768 = float(_2766);
    int _2770 = _2714 * _2750;
    int _2772 = _2770 + _2548;
    bool _2774 = !_2754;
    int _2776 = _2774 ? 0 : (-1);
    float _2778 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2702);
    bool _2780 = _2436 == 0;
    float _2782 = fma(_2700, _2726, _2756);
    bool _2784 = uint(_2772) >= uint(_2488);
    float _2786 = fma(_2778, _2726, _2746);
    int _2788 = _2536 ^ _2436;
    bool _2790 = !_2784;
    int _2792 = _2790 ? 0 : (-1);
    float _2794 = _2752 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _2796 = uint(int(uint(_2788) >> uint(31)));
    float _2798 = fma(_2734, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2800 = precise::clamp(_2798, 0.0, 1.0);
    int _2802 = ~_2732;
    int _2804 = _2802 + _2776;
    int _2806 = _2804 + 1;
    float _2808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2810 = ~_2792;
    int _2812 = _2750 + _2810;
    int _2814 = _2812 + 1;
    float _2816 = fma(_2794, _2632, -0.5);
    int _2818 = ~int(_2796);
    int _2820 = _2818 + 1;
    int _2822 = _2436 * _2806;
    int _2824 = _2822 + _2536;
    float _2826 = fma(_2800, -2.0, 3.0);
    float _2828 = _2800 * _2800;
    int _2830 = _2814 ^ _2820;
    out.m_81.x = _2782;
    out.m_81.y = _2748;
    out.m_81.z = _2786;
    bool _2832 = _2436 == 0;
    float _2834 = _2828 * _2826;
    int _2836 = ~_2820;
    int _2838 = _2836 + _2830;
    int _2840 = _2838 + 1;
    bool _2842 = !_2780;
    int _2844 = _2842 ? _2824 : (-1);
    float _2846 = -_2834;
    float _2848 = _2846 + 1.0;
    bool _2850 = !_2832;
    int _2852 = _2850 ? _2840 : (-1);
    float _2854 = float(_2844);
    float _2856 = _2808 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2858 = float(_2852);
    float _2860 = fma(_2848, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2834);
    bool _2862 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2864 = isnan(_1546);
    bool _2866 = _2862 || _2864;
    bool _2868 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2870 = _2866 || _2868;
    float _2872 = fma(_2856, _2312, -0.5);
    float _2874 = fma(_2794, _2854, _766);
    float _2876 = -_732;
    float _2878 = fma(_2856, _2858, _2876);
    float _2880 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1873);
    float _2882 = in.m_83.x;
    float _2884 = _2768 * _2860;
    float _2886 = _1752 * 0.5;
    float _2888 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2880);
    float _2890 = fma(_812, _2816, _2874);
    float _2892 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2894 = fma(_712, _2872, _2878);
    float _2896 = _2888 + _1752;
    float _2898 = fma(_1802, -0.5, _2886);
    float _2900 = _2890 + 0.5;
    float _2902 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2904 = _2376 * _2892;
    float _2906 = precise::clamp(_2904, 0.0, 1.0);
    float _2908 = _2896 * 0.5;
    float _2910 = _2902 * _1832;
    float _2912 = -_2906;
    float _2914 = fma(_2912, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2916 = _2894 + 0.5;
    out.gl_Position.x = _1776;
    out.gl_Position.y = _1802;
    out.gl_Position.z = _2888;
    out.gl_Position.w = _1752;
    float _2918 = _1853 * _2910;
    out.m_85.x = _1915;
    out.m_85.y = _2898;
    out.m_85.z = _2908;
    out.m_85.w = _1752;
    float _2920 = _2914 * _2882;
    out.m_87.x = _2900;
    out.m_87.y = _2916;
    float _2922 = _2920 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2924 = _1843 * _2910;
    out.m_89.x = _2922;
    float _2926 = -_2902;
    float _2928 = _2926 + 1.0;
    float _2930 = fma(_1849, _2924, _1837);
    float _2932 = fma(_1851, _2924, _1839);
    float _2934 = fma(_1843, _2918, _1841);
    float _2936 = _1843 * _2928;
    float _2938 = _1458 * _1512;
    float _2940 = _2902;
    float _2942 = _2924;
    float _2944 = _1752;
    float _2946 = _2908;
    float _2948 = _2898;
    float _2950 = _2938;
    if (!_2870)
    {
        _2940 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2952 = _2940;
    float _2954 = _2952;
    float _2956 = _2952;
    if (!_2870)
    {
        _2942 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2958 = _2942;
    out.m_91.x = _2930;
    out.m_91.y = _2932;
    out.m_91.z = _2934;
    out.m_91.w = _2936;
    float _2960 = _2938 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2962 = _2958;
    float _2964 = _2958;
    if (!_2870)
    {
        _2944 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2966 = _2944;
    float _2968 = _2966;
    float _2970 = _2966;
    if (!_2870)
    {
        _2946 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2972 = _2946;
    float _2974 = _2972;
    float _2976 = _2972;
    if (!_2870)
    {
        _2948 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2978 = _2948;
    float _2980 = _2978;
    float _2982 = _2978;
    if (!_2870)
    {
        _2950 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2984 = _2950;
    bool _2986 = !_2870;
    float _2988 = _2984;
    float _2990 = _2984;
    if (!_2986)
    {
        bool _2992 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2994 = isnan(_1546);
        bool _2996 = _2992 || _2994;
        bool _2998 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3000 = _2996 || _2998;
        if (!_3000)
        {
            float _3002 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3004 = _1546 + _3002;
            float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3008 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3006;
            float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3012 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3014 = 1.0 / _3008;
            float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3018 = _3016 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3022 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3026 = _3024 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3028 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3030 = _3028 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3032 = _3004 * _3014;
            float _3034 = precise::clamp(_3032, 0.0, 1.0);
            float _3036 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3038 = _3036 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3040 = fma(_3034, _3012, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3042 = fma(_3034, _3038, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3044 = fma(_3034, _3018, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3046 = fma(_3034, _3022, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3048 = fma(_3034, _3026, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3050 = fma(_3034, _3030, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2964 = _3044;
            _2982 = _3048;
            _2956 = _3040;
            _2976 = _3046;
            _2970 = _3042;
            _2990 = _3050;
            _3052 = true;
        }
        else
        {
            bool _3054 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3056 = isnan(_1546);
            bool _3058 = _3054 || _3056;
            bool _3060 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3062 = _3058 || _3060;
            if (!_3062)
            {
                _2954 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3064 = _2954;
            _2956 = _3064;
            if (!_3062)
            {
                _2962 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3066 = _2962;
            _2964 = _3066;
            if (!_3062)
            {
                _2968 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3068 = _2968;
            _2970 = _3068;
            if (!_3062)
            {
                _2974 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3070 = _2974;
            _2976 = _3070;
            if (!_3062)
            {
                _2980 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3072 = _2980;
            _2982 = _3072;
            if (!_3062)
            {
                _2988 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3074 = _2988;
            bool _3076 = !_3062;
            _2990 = _3074;
            if (!_3076)
            {
                bool _3078 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3080 = isnan(_1546);
                bool _3082 = _3078 || _3080;
                bool _3084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3086 = _3082 || _3084;
                if (!_3086)
                {
                    float _3088 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3090 = _1546 + _3088;
                    float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3094 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3092;
                    float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3098 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3100 = 1.0 / _3094;
                    float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3104 = _3102 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3110 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3118 = _3090 * _3100;
                    float _3120 = precise::clamp(_3118, 0.0, 1.0);
                    float _3122 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3124 = _3122 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3126 = fma(_3120, _3098, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3128 = fma(_3120, _3124, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3130 = fma(_3120, _3104, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3132 = fma(_3120, _3108, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3134 = fma(_3120, _3112, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3136 = fma(_3120, _3116, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2964 = _3130;
                    _2982 = _3134;
                    _2956 = _3126;
                    _2976 = _3132;
                    _2970 = _3128;
                    _2990 = _3136;
                    _3052 = true;
                }
                else
                {
                    _2964 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2982 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2956 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2976 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2970 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2990 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3052 = false;
    float _3138 = _2964;
    float _3140 = _2982;
    float _3142 = _2956;
    float _3144 = _2976;
    float _3146 = _2970;
    float _3148 = _2990;
    float _3150 = fma(_2748, -0.5, 0.5);
    float _3152 = precise::clamp(_3150, 0.0, 1.0);
    float _3154 = -_3138;
    float _3156 = _3154 + _3140;
    float _3158 = _2960 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3160 = -_3142;
    float _3162 = _3160 + _3144;
    float _3164 = fma(_3152, _3156, _3138);
    out.m_93.x = 0.0;
    float _3166 = -_3146;
    float _3168 = _3166 + _3148;
    float _3170 = fma(_3152, _3162, _3142);
    float _3172 = _3164 * 0.586610972881317138671875;
    out.m_49.x = _3158;
    bool _3174 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3176 = fma(_3152, _3168, _3146);
    float _3178 = fma(_3170, 0.298911988735198974609375, _3172);
    bool _3180 = _1458 > 0.0;
    bool _3182 = isnan(_1458);
    bool _3184 = _3180 || _3182;
    bool _3186 = isnan(0.0);
    bool _3188 = _3184 || _3186;
    float _3190 = fma(_3176, 0.114477999508380889892578125, _3178);
    bool _3192 = _1512 <= 0.0;
    bool _3194 = !_3188;
    bool _3196 = _3192 || _3194;
    float _3198 = -_3190;
    float _3200 = _3170 + _3198;
    float _3202 = -_3190;
    float _3204 = _3164 + _3202;
    float _3206 = -_3190;
    float _3208 = _3176 + _3206;
    float _3210 = fma(_3200, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3190);
    float _3212 = fma(_3204, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3190);
    float _3214 = fma(_3208, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3190);
    bool _3216 = !_3174;
    if (!_3216)
    {
        float _3218 = -_1390;
        float _3220 = _3218 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3222 = -_1392;
        float _3224 = _3222 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3226 = -_1394;
        float _3228 = _3226 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3230 = _3220 * _3220;
        float _3232 = fma(_3224, _3224, _3230);
        float _3234 = fma(_3228, _3228, _3232);
        float _3236 = sqrt(_3234);
        float _3238 = rsqrt(_3234);
        float _3240 = -_3236;
        float _3242 = _3240 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3244 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3246 = precise::clamp(_3244, 0.0, 1.0);
        float _3248 = _3224 * _3238;
        float _3250 = _3220 * _3238;
        float _3252 = abs(_3246);
        float _3254 = log2(_3252);
        float _3256 = _3228 * _3238;
        float _3258 = _3248 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3260 = _2748 * _3250;
        float _3262 = -_3250;
        float _3264 = -_3258;
        float _3266 = fma(_3262, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3264);
        float _3268 = fma(_2782, _3248, _3260);
        float _3270 = -_3256;
        float _3272 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3266);
        float _3274 = fma(_2786, _3256, _3268);
        float _3276 = precise::clamp(_3274, 0.0, 1.0);
        float _3278 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3280 = _3272 + _3278;
        float _3282 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3284 = _3280 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3286 = precise::clamp(_3284, 0.0, 1.0);
        float _3288 = exp2(_3282);
        float _3290 = _3288 * _3286;
        float _3292 = _3276 * _3290;
        float _3294 = _3292 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3296 = _3292 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3298 = _3292 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3294;
        out.m_93.y = _3296;
        out.m_93.z = _3298;
    }
    out.m_65.x = _3210;
    out.m_65.y = _3212;
    out.m_65.z = _3214;
    if (!_3196)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3300 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3300;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3052 = false;
    bool _450 = false;
    bool _346 = false;
    bool _220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3357 = as_type<float>(_128);
        out.gl_Position.z = _3357;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_112);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _122;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3426 = as_type<float>(_166);
        out.gl_Position.z = _3426;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _178 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _180 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _182 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _184);
    float _192 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _186);
    bool _194 = !_174;
    float _196 = _188;
    float _198 = _190;
    float _200 = _192;
    float _218;
    if (!_194)
    {
        float _202 = in.m_55.x;
        float _204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _210 = _208 * _204;
        float _212 = floor(_210);
        float _214 = -_212;
        float _216 = _210 + _214;
        _218 = _216;
        _220 = true;
    }
    else
    {
        float _222 = float(_112);
        float _224 = 1.0 / _222;
        float _226 = _146 * _224;
        _218 = _226;
    }
    _220 = false;
    float _228 = _218;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _228 + _230;
    bool _234 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_228);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    float _250 = -_244;
    float _252 = _250 + 1.0;
    bool _254 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _256 = isnan(_228);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = 1.0 / _248;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _278 = _264 * _252;
    float _280 = -_264;
    float _282 = _280 + 1.0;
    float _284 = _232 * _266;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _286;
    float _290 = in.m_57.x;
    float _292 = in.m_57.y;
    float _294 = in.m_57.z;
    float _296 = fma(_270, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = fma(_288, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _300 = fma(_274, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _302 = _296 * _278;
    float _304 = _298 * _278;
    float _306 = _300 * _278;
    float _308 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].x, _302);
    float _310 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].y, _304);
    float _312 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].z, _306);
    float _314 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].x, _308);
    float _316 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].y, _310);
    float _318 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].z, _312);
    float _320 = _314 * _290;
    float _322 = _316 * _292;
    float _324 = _318 * _294;
    bool _326 = !_276;
    float _344;
    if (!_326)
    {
        float _328 = in.m_55.x;
        float _330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _332 = _328 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _336 = _334 * _330;
        float _338 = floor(_336);
        float _340 = -_338;
        float _342 = _336 + _340;
        _344 = _342;
        _346 = true;
    }
    else
    {
        float _348 = float(_112);
        float _350 = 1.0 / _348;
        float _352 = _146 * _350;
        _344 = _352;
    }
    _346 = false;
    float _354 = _344;
    bool _356 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _358 = isnan(_354);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _372 = _354 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _374 = isnan(_354);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _390 = _354 + _388;
    float _392 = -_366;
    float _394 = _392 + 1.0;
    bool _396 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _398 = 1.0 / _370;
    float _400 = _382 * _394;
    float _402 = -_382;
    float _404 = _402 + 1.0;
    float _406 = _386 * _398;
    float _408 = fma(_406, _390, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _412 = _408 * _400;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _416 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[115].x, _412);
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _422 = _414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _424 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[116].x, _418);
    float _426 = _420 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _428 = _424 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _422;
    out.m_59.y = _416;
    out.m_59.z = _426;
    out.m_59.w = _428;
    bool _430 = !_396;
    float _448;
    if (!_430)
    {
        float _432 = in.m_55.x;
        float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _436 = _432 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _438 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _440 = _438 * _434;
        float _442 = floor(_440);
        float _444 = -_442;
        float _446 = _440 + _444;
        _448 = _446;
        _450 = true;
    }
    else
    {
        float _452 = float(_112);
        float _454 = 1.0 / _452;
        float _456 = _146 * _454;
        _448 = _456;
    }
    _450 = false;
    float _458 = _448;
    float _460 = in.m_46.x;
    float _462 = in.m_46.y;
    float _464 = in.m_46.z;
    float _466 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _468 = int(_466);
    float _470 = in.m_55.x;
    float _472 = in.m_55.y;
    float _474 = _322 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _476 = _324 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _478 = in.m_55.z;
    float _480 = float(_468);
    float _482 = _480 * _146;
    float _484 = _462 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _486 = _462 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _488 = _462 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _490 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[5].x, _484);
    float _492 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[4].x, _486);
    float _494 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[6].x, _488);
    float _496 = _470 * 2.0;
    float _498 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[5].z, _490);
    float _500 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[4].z, _492);
    float _502 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[6].z, _494);
    float _504 = _478 * 2.0;
    float _506 = _498 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _508 = _500 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _510 = _502 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _512 = -_506;
    float _514 = _512 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _516 = -_508;
    float _518 = _516 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _520 = floor(_496);
    float _522 = _472 * 2.0;
    float _524 = _514 * _514;
    float _526 = fma(_518, _518, _524);
    float _528 = -_510;
    float _530 = _528 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _532 = floor(_504);
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _536 = fma(_530, _530, _526);
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _540 = _470 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _542 = _472 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _544 = floor(_522);
    float _546 = -_538;
    float _548 = fma(_540, 2.0, _546);
    float _550 = _472 + _478;
    bool _552 = _520 > 0.0;
    float _554 = fma(_542, -2.0, _534);
    float _556 = _550 + (-1.0);
    bool _558 = _520 >= 0.0;
    bool _560 = isnan(_520);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    float _568 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _570 = log2(_568);
    float _572 = _472 + _470;
    bool _574 = _532 > 0.0;
    float _576 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _578 = _532 >= 0.0;
    bool _580 = isnan(_532);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    float _588 = _572 + (-1.0);
    int _590 = _566 ? 0 : 1;
    float _592 = sqrt(_536);
    bool _594 = _544 > 0.0;
    float _596 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _598 = _544 >= 0.0;
    bool _600 = isnan(_544);
    bool _602 = _598 || _600;
    bool _604 = isnan(0.0);
    bool _606 = _602 || _604;
    int _608 = _586 ? 0 : 1;
    int _610 = _606 ? 0 : 1;
    float _612 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _614 = int(_612);
    float _616 = _570 * _146;
    int _618 = ~_608;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    int _624 = ~_610;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    int _630 = _622;
    int _632 = _628;
    if (!_574)
    {
        int _634 = ~_608;
        int _636 = _634 + 1;
        _630 = _636;
    }
    int _638 = _630;
    float _640 = abs(_592);
    float _642 = precise::max(_640, 200.0);
    float _644 = exp2(_616);
    if (!_594)
    {
        int _646 = ~_610;
        int _648 = _646 + 1;
        _632 = _648;
    }
    int _650 = _632;
    float _652 = precise::min(_642, 300.0);
    bool _654 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _662 = _658 || _660;
    float _664 = float(_614);
    int _666 = ~_590;
    int _668 = _666 + 1;
    int _670 = _668 + 1;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _676 = _674 != 0;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _684 = _682 != 0;
    float _686 = 1.0 / _664;
    int _688 = _670;
    if (!_552)
    {
        int _690 = ~_590;
        int _692 = _690 + 1;
        _688 = _692;
    }
    int _694 = _688;
    float _696 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[78].w, _672);
    float _698 = -_644;
    float _700 = _698 + 1.0;
    bool _702 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _704 = isnan(1.0);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _710 = _706 || _708;
    float _712 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _696);
    bool _714 = !_680;
    int _716 = _714 ? 0 : 1;
    float _718 = fma(_652, 0.00999999977648258209228515625, -2.0);
    bool _720 = !_676;
    int _722 = _720 ? 0 : 1;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _726 = 1.0 + _724;
    bool _728 = !_684;
    int _730 = _728 ? 0 : 1;
    float _732 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _554);
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _740 = _738 != 0;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _744 = _742 != 0;
    float _746 = -_718;
    float _748 = _506 + _746;
    float _750 = 1.0 / _726;
    float _752 = in.m_61.x;
    float _754 = in.m_61.y;
    float _756 = in.m_61.z;
    float _758 = _686 * _146;
    bool _760 = !_744;
    int _762 = _760 ? 0 : 1;
    float _764 = -_146;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[76].x, _548);
    bool _768 = !_736;
    int _770 = _768 ? 0 : 1;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _774 = abs(_762);
    float _776 = fma(_652, 0.00999999977648258209228515625, -1.0);
    bool _778 = !_740;
    int _780 = _778 ? 0 : 1;
    float _782 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[78].z, _772);
    int _784 = abs(_770);
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _788 = _748 + _786;
    int _790 = abs(_780);
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _794 = _508 + _792;
    float _796 = float(_694);
    float _798 = _788 * _788;
    float _800 = _662 ? _700 : 0.0;
    float _802 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _804 = _510 + _802;
    float _806 = float(_790);
    float _808 = fma(_794, _794, _798);
    float _810 = float(_650);
    float _812 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _782);
    float _814 = float(_784);
    float _816 = _806 * _796;
    float _818 = float(_638);
    float _820 = fma(_804, _804, _808);
    float _822 = float(_774);
    if (_710)
    {
        float _824 = _800 * _750;
        _150 = _824;
    }
    float _826 = _150;
    float _828 = _816 * (-2.0);
    float _830 = _814 * _818;
    float _832 = sqrt(_820);
    float _834 = _822 * _810;
    float _836 = _472 + (-0.5);
    float _838 = _830 * (-2.0);
    float _840 = fma(_828, _754, _754);
    float _842 = fma(_576, _828, _576);
    float _844 = _320 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _846 = fma(_596, _838, _596);
    float _848 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[196].y, _840);
    float _850 = fma(_838, _752, _752);
    float _852 = rsqrt(_820);
    float _854 = _470 + (-0.5);
    float _856 = fma(_842, _826, _848);
    float _858 = _844 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _860 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[196].x, _850);
    float _862 = _832 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _864 = _478 + _470;
    float _866 = _856 * 0.15915493667125701904296875;
    float _868 = _834 * (-2.0);
    float _870 = fma(_846, _826, _860);
    float _872 = precise::min(_858, _862);
    float _874 = _864 + (-1.0);
    float _876 = _866 * 6.283185482025146484375;
    float _878 = sin(_876);
    float _880 = _870 * 0.15915493667125701904296875;
    float _882 = _852 * _872;
    float _884 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _886 = fma(_868, _756, _756);
    float _888 = _478 + (-0.5);
    float _890 = _788 * _882;
    float _892 = fma(_884, _868, _884);
    float _894 = _794 * _882;
    float _896 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].z, _886);
    float _898 = -_890;
    float _900 = _788 + _898;
    float _902 = _880 * 6.283185482025146484375;
    float _904 = sin(_902);
    float _906 = -_894;
    float _908 = _794 + _906;
    float _910 = fma(_892, _826, _896);
    float _912 = _900 * _900;
    float _914 = _804 * _882;
    float _916 = _910 * 0.15915493667125701904296875;
    float _918 = fma(_908, _908, _912);
    float _920 = -_914;
    float _922 = _804 + _920;
    float _924 = in.m_63.x;
    float _926 = in.m_63.y;
    float _928 = in.m_63.z;
    float _930 = _866 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = fma(_922, _922, _918);
    float _936 = _904 * _878;
    float _938 = sqrt(_934);
    float _940 = _880 * 6.283185482025146484375;
    float _942 = cos(_940);
    float _944 = _904 * _932;
    float _946 = _776 * _926;
    float _948 = _916 * 6.283185482025146484375;
    float _950 = cos(_948);
    float _952 = _852 * _938;
    float _954 = _776 * _924;
    float _956 = _776 * _928;
    float _958 = _474 * _952;
    float _960 = _844 * _952;
    float _962 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _954);
    float _964 = _916 * 6.283185482025146484375;
    float _966 = sin(_964);
    float _968 = _942 * _932;
    float _970 = _942 * _878;
    float _972 = _476 * _952;
    float _974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _956);
    float _976 = _904 * _950;
    float _978 = _932 * _950;
    float _980 = _942 * _950;
    float _982 = _878 * _950;
    float _984 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _946);
    float _986 = _972 * _974;
    float _988 = _958 * _984;
    float _990 = fma(_966, _968, _936);
    float _992 = _960 * _962;
    float _994 = -_944;
    float _996 = fma(_966, _970, _994);
    float _998 = _980 * _988;
    float _1000 = -_988;
    float _1002 = _966 * _1000;
    float _1004 = -_970;
    float _1006 = fma(_966, _944, _1004);
    float _1008 = _976 * _988;
    float _1010 = fma(_990, _992, _998);
    float _1012 = fma(_978, _992, _1002);
    float _1014 = fma(_966, _936, _968);
    float _1016 = fma(_1006, _992, _1008);
    float _1018 = fma(_996, _986, _1010);
    float _1020 = fma(_982, _986, _1012);
    float _1022 = fma(_1014, _986, _1016);
    float _1024 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1026 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1028 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1024);
    float _1030 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1026);
    float _1032 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1028);
    float _1034 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1030);
    float _1036 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1038 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1040 = _510 + _1036;
    float _1042 = _508 + _1038;
    float _1044 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1046 = -_914;
    float _1048 = _510 + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1052 = _1040 + _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1056 = _1042 + _1054;
    float _1058 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1044);
    float _1060 = -_890;
    float _1062 = _748 + _1060;
    float _1064 = _1052 * _1052;
    float _1066 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1058);
    float _1068 = -_894;
    float _1070 = _508 + _1068;
    float _1072 = fma(_1056, _1056, _1064);
    float _1074 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1076 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1078 = sqrt(_1072);
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1074);
    float _1082 = _748 + _1076;
    float _1084 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1080);
    bool _1086 = _1078 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1088 = _1066;
    float _1090 = _1076;
    float _1092 = _1080;
    float _1094 = _914;
    if (!_1086)
    {
        _1088 = _1042;
    }
    float _1096 = _1088;
    float _1098 = _1096;
    if (!_1086)
    {
        _1090 = _1040;
    }
    float _1100 = _1090;
    float _1102 = _1100;
    if (!_1086)
    {
        _1092 = _1082;
    }
    float _1104 = _1092;
    bool _1106 = !_1086;
    float _1108 = _1104;
    if (!_1106)
    {
        float _1110 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1114 = _1078 + _1112;
        float _1116 = rsqrt(_1072);
        float _1118 = _1114 * _1110;
        float _1120 = _1082 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = _1118 * 0.15915493667125701904296875;
        float _1124 = _1122 * 6.283185482025146484375;
        float _1126 = cos(_1124);
        float _1128 = _1122 * 6.283185482025146484375;
        float _1130 = sin(_1128);
        float _1132 = _1126 + (-1.0);
        float _1134 = fma(_1130, _1120, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1136 = _1132 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1138 = _1116 * _1134;
        float _1140 = fma(_1082, _1126, _1136);
        float _1142 = fma(_1056, _1138, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1144 = fma(_1052, _1138, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1108 = _1140;
        _1098 = _1142;
        _1102 = _1144;
    }
    float _1146 = _1108;
    float _1148 = _1098;
    float _1150 = _1102;
    float _1152 = -_748;
    float _1154 = _1152 + _1146;
    float _1156 = -_508;
    float _1158 = _1156 + _1148;
    float _1160 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1162 = -_510;
    float _1164 = _1162 + _1150;
    float _1166 = _1154 * _1154;
    float _1168 = -_894;
    float _1170 = _1168 + _1148;
    float _1172 = 1.0 / _1160;
    float _1174 = -_890;
    float _1176 = _1174 + _1146;
    float _1178 = fma(_1158, _1158, _1166);
    float _1180 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1182 = -_914;
    float _1184 = _1182 + _1150;
    float _1186 = fma(_1164, _1164, _1178);
    float _1188 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1180);
    float _1190 = sqrt(_1186);
    float _1192 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1188);
    bool _1194 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1196 = isnan(0.5);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1202 = _1198 || _1200;
    bool _1204 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1206 = isnan(0.5);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1212 = _1208 || _1210;
    float _1214 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1216 = _1214 + _1160;
    float _1218 = _1216 * _1172;
    float _1220 = _1218 * 0.5;
    bool _1222 = _1190 > 0.0;
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1226 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1224);
    float _1228 = 1.0 / _1226;
    float _1230 = _1190;
    float _1232 = _1170;
    float _1234 = _1146;
    float _1236 = _1160;
    float _1238 = _1226;
    float _1240 = _1172;
    float _1242 = _1184;
    if (!_1222)
    {
        _1094 = _1176;
    }
    float _1244 = _1094;
    float _1246 = _1244;
    if (!_1222)
    {
        _1230 = _1184;
    }
    float _1248 = _1230;
    bool _1250 = !_1222;
    float _1252 = _1248;
    if (!_1250)
    {
        float _1254 = _190 * _190;
        float _1256 = rsqrt(_1186);
        float _1258 = fma(_188, _188, _1254);
        float _1260 = fma(_192, _192, _1258);
        float _1262 = sqrt(_1260);
        float _1264 = _1158 * _1256;
        float _1266 = _1154 * _1256;
        float _1268 = _1164 * _1256;
        bool _1270 = _1262 > 0.0;
        float _1272 = _1256;
        float _1274 = _1262;
        _1234 = _1268;
        _1236 = _1266;
        if (!_1270)
        {
            _1272 = _1176;
        }
        float _1276 = _1272;
        _1246 = _1276;
        if (!_1270)
        {
            _1274 = _1184;
        }
        float _1278 = _1274;
        bool _1280 = !_1270;
        _1252 = _1278;
        if (!_1280)
        {
            float _1282 = rsqrt(_1260);
            float _1284 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1286 = _190 * _1282;
            float _1288 = _188 * _1282;
            float _1290 = _192 * _1282;
            float _1292 = _1266 * _1286;
            float _1294 = fma(_1264, _1288, _1292);
            float _1296 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1298 = fma(_1268, _1290, _1294);
            float _1300 = _1298 * _1296;
            float _1302 = fma(_188, _1300, _1170);
            float _1304 = fma(_190, _1300, _1176);
            float _1306 = fma(_192, _1300, _1184);
            _1232 = _1302;
            _1246 = _1304;
            _1252 = _1306;
        }
    }
    float _1308 = _1232;
    float _1310 = _1246;
    float _1312 = _1252;
    float _1314 = _1234;
    float _1316 = _1236;
    float _1318 = _1308;
    float _1320 = _1316;
    float _1322 = _1314;
    if (_1212)
    {
        _1238 = 1.0;
    }
    float _1324 = _1238;
    float _1326 = _1324;
    if (_1202)
    {
        _196 = _1308;
    }
    float _1328 = _196;
    float _1330 = _1328;
    if (_1202)
    {
        _198 = _1310;
    }
    float _1332 = _198;
    float _1334 = _1332;
    if (_1202)
    {
        _200 = _1312;
    }
    float _1336 = _200;
    float _1338 = _1336;
    if (!_1202)
    {
        float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1342 = _1062 + _1340;
        float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1346 = _1070 + _1344;
        float _1348 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1350 = -_1070;
        float _1352 = _1350 + _1308;
        float _1354 = _1342 * _1342;
        float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1358 = _1048 + _1356;
        float _1360 = -_1062;
        float _1362 = _1360 + _1310;
        float _1364 = -_1048;
        float _1366 = _1364 + _1312;
        float _1368 = fma(_1346, _1346, _1354);
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1372 = fma(_1358, _1358, _1368);
        float _1374 = sqrt(_1372);
        float _1376 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1378 = precise::min(_1374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1380 = _1378 * _1370;
        float _1382 = _1376 * _1380;
        float _1384 = fma(_1352, _1382, _1070);
        float _1386 = fma(_1362, _1382, _1062);
        float _1388 = fma(_1366, _1382, _1048);
        _1334 = _1386;
        _1330 = _1384;
        _1338 = _1388;
        _1318 = _1352;
    }
    float _1390 = _1334;
    float _1392 = _1330;
    float _1394 = _1338;
    float _1396 = _1318;
    float _1398 = _1396;
    if (_1212)
    {
        _1320 = 1.0;
    }
    float _1400 = _1320;
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1404 = _1228 * _1402;
    float _1406 = _1400;
    if (!_1212)
    {
        float _1408 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1410 = _1408 * 0.15915493667125701904296875;
        float _1412 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1414 = _1410 * 6.283185482025146484375;
        float _1416 = cos(_1414);
        float _1418 = _1412 * 0.15915493667125701904296875;
        float _1420 = _1410 * 6.283185482025146484375;
        float _1422 = sin(_1420);
        float _1424 = 1.0 / _1416;
        float _1426 = _1418 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1422 * _1424;
        float _1432 = _1418 * 6.283185482025146484375;
        float _1434 = sin(_1432);
        float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1438 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1436;
        float _1440 = _1428 * _1430;
        float _1442 = 1.0 / _1438;
        float _1444 = 1.0 / _1440;
        float _1446 = _1434 * _1444;
        float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1450 = fma(_1404, _1446, _1448);
        float _1452 = _1450 * _1442;
        float _1454 = precise::clamp(_1452, 0.0, 1.0);
        _1398 = _1410;
        _1326 = _1454;
    }
    float _1456 = _1398;
    float _1458 = _1326;
    if (!_1212)
    {
        float _1460 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1462 = _1460 * 0.15915493667125701904296875;
        float _1464 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1466 = _1462 * 6.283185482025146484375;
        float _1468 = cos(_1466);
        float _1470 = _1464 * 0.15915493667125701904296875;
        float _1472 = _1462 * 6.283185482025146484375;
        float _1474 = sin(_1472);
        float _1476 = 1.0 / _1468;
        float _1478 = _1470 * 6.283185482025146484375;
        float _1480 = cos(_1478);
        float _1482 = _1474 * _1476;
        float _1484 = _1470 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        float _1488 = _1480 * _1482;
        float _1490 = 1.0 / _1488;
        float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1494 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1492;
        float _1496 = 1.0 / _1494;
        float _1498 = _1486 * _1490;
        float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1502 = fma(_1404, _1498, _1500);
        float _1504 = _1502 * _1496;
        float _1506 = precise::clamp(_1504, 0.0, 1.0);
        float _1508 = -_1506;
        float _1510 = _1508 + 1.0;
        _1406 = _1510;
    }
    float _1512 = _1406;
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1516 = _1390 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1520 = _1392 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1524 = _1394 + _1522;
    float _1526 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1528 = _1516 * _1516;
    float _1530 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1532 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1526);
    float _1534 = fma(_1520, _1520, _1528);
    float _1536 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1530);
    float _1538 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1532);
    float _1540 = fma(_1524, _1524, _1534);
    float _1542 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1544 = rsqrt(_1540);
    float _1546 = sqrt(_1540);
    float _1548 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1550 = _1520 * _1548;
    float _1552 = _1524 * _1548;
    float _1554 = _1550 * _1550;
    float _1556 = _1552 * _1552;
    float _1558 = _1554 + _1556;
    float _1560 = sqrt(_1558);
    bool _1562 = _1560 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1566 = _1560 + _1564;
    float _1568 = _1528;
    float _1570 = _1558;
    float _1572 = _1566;
    float _1574 = _1550;
    float _1576 = _1552;
    float _1578 = _1554;
    if (_1562)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1580;
    }
    float _1582 = _1568;
    if (_1562)
    {
        float _1584 = rsqrt(_1558);
        _1570 = _1584;
    }
    float _1586 = _1570;
    float _1588 = _1586;
    if (_1562)
    {
        float _1590 = _1566 * _1582;
        _1572 = _1590;
    }
    float _1592 = _1572;
    if (_1562)
    {
        float _1594 = _1592 * 0.15915493667125701904296875;
        _1240 = _1594;
    }
    float _1596 = _1240;
    float _1598 = _1582;
    if (_1562)
    {
        float _1600 = _1596 * 6.283185482025146484375;
        float _1602 = sin(_1600);
        _1598 = _1602;
    }
    float _1604 = _1598;
    float _1606 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1608 = precise::max(0.0, _1606);
    float _1610 = _1456;
    if (_1562)
    {
        float _1612 = _1596 * 6.283185482025146484375;
        float _1614 = cos(_1612);
        _1610 = _1614;
    }
    float _1616 = _1610;
    float _1618 = -_1548;
    float _1620 = -_1608;
    float _1622 = fma(_1516, _1618, _1620);
    if (_1562)
    {
        float _1624 = _1622 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1624;
    }
    float _1626 = _1242;
    float _1628 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1630 = fma(_1070, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1632 = _1604;
    float _1634 = _1626;
    if (_1562)
    {
        float _1636 = fma(_1604, _1626, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1322 = _1636;
    }
    float _1638 = _1322;
    float _1640 = _1638;
    if (!_1562)
    {
        _1632 = _1622;
    }
    float _1642 = _1632;
    float _1644 = floor(_1630);
    float _1646 = _1642;
    float _1648 = _1616;
    if (_1562)
    {
        float _1650 = _1616 + (-1.0);
        _1634 = _1650;
    }
    float _1652 = _1634;
    if (_1562)
    {
        float _1654 = _1586 * _1638;
        _1640 = _1654;
    }
    float _1656 = _1640;
    if (_1562)
    {
        float _1658 = _1652 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1588 = _1658;
    }
    float _1660 = _1588;
    if (_1562)
    {
        float _1662 = _1550 * _1656;
        _1574 = _1662;
    }
    float _1664 = _1574;
    if (_1562)
    {
        float _1666 = _1552 * _1656;
        _1576 = _1666;
    }
    float _1668 = _1576;
    if (_1562)
    {
        float _1670 = fma(_1622, _1616, _1660);
        _1646 = _1670;
    }
    float _1672 = _1646;
    if (_1562)
    {
        float _1674 = _1664 * _1664;
        _1578 = _1674;
    }
    float _1676 = _1578;
    if (!_1562)
    {
        _1648 = _1556;
    }
    float _1678 = _1648;
    float _1680 = _1678;
    if (_1562)
    {
        float _1682 = _1668 * _1668;
        _1680 = _1682;
    }
    float _1684 = _1680;
    float _1686 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1688 = fma(_1672, _1672, _1676);
    float _1690 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1686);
    float _1692 = _1688 + _1684;
    float _1694 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1696 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1698 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1690);
    float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1702 = fma(_1546, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1700);
    float _1704 = precise::clamp(_1702, 0.0, 1.0);
    float _1706 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1696);
    float _1708 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1710 = rsqrt(_1692);
    float _1712 = -_1704;
    float _1714 = _1712 + 1.0;
    float _1716 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1706);
    float _1718 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1720 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1536);
    float _1722 = fma(_1048, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1724 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1726 = -_1628;
    float _1728 = fma(_1726, _1694, 1.0);
    float _1730 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1732 = abs(_1714);
    float _1734 = log2(_1732);
    float _1736 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1718);
    float _1738 = -_1644;
    float _1740 = _1630 + _1738;
    float _1742 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1744 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1746 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1736);
    float _1748 = _1710 * _1664;
    float _1750 = _1710 * _1668;
    float _1752 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1746);
    float _1754 = _1710 * _1672;
    float _1756 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1758 = floor(_1722);
    float _1760 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1742);
    float _1762 = -_1756;
    float _1764 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1760);
    float _1770 = -_1750;
    float _1772 = fma(_1770, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1774 = log2(_1728);
    float _1776 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1768);
    float _1778 = fma(_1772, -0.5, 0.5);
    float _1780 = fma(_1772, 0.5, 0.5);
    float _1782 = exp2(_1766);
    float _1784 = -_1758;
    float _1786 = _1722 + _1784;
    float _1788 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1744);
    float _1790 = fma(_1780, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1792 = _1754 + 1.0;
    float _1794 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1788);
    float _1796 = fma(_1780, _1790, -0.212114393711090087890625);
    float _1798 = 1.0 / _1752;
    float _1800 = _1774 * 0.693147182464599609375;
    float _1802 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1794);
    float _1804 = fma(_1780, _1796, 1.570728778839111328125);
    float _1806 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1808 = sqrt(_1778);
    float _1810 = -_1754;
    float _1812 = fma(_1782, _1792, _1810);
    float2 _5981 = float2(_1740, _1786);
    float _1814 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5981, float2(0.0), isnan(_5981)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5981, float2(0.0), isnan(_5981)), level(0.0)).x;
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = _1776 * _1798;
    float _1820 = _1802 * _1798;
    float _1822 = fma(_1818, 0.5, 0.5);
    float _1824 = fma(_1820, -0.5, 0.5);
    float _1826 = _1808 * 0.636619746685028076171875;
    float _1828 = -_1804;
    float _1830 = fma(_1826, _1828, 1.0);
    float3 _6012 = float3(_1822, _1824, _1806);
    float _1832 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6012, float3(0.0), isnan(_6012)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6012, float3(0.0), isnan(_6012)), level(0.0)).x;
    float3 _6023 = float3(_1822, _1824, _1806);
    float4 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6023, float3(0.0), isnan(_6023)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6023, float3(0.0), isnan(_6023)), level(0.0)).xyzw;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1835.w;
    float2 _6039 = float2(_1830, _1816);
    float3 _1847 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6039, float2(0.0), isnan(_6039)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6039, float2(0.0), isnan(_6039)), level(0.0)).xyz;
    float _1849 = _1847.x;
    float _1851 = _1847.y;
    float _1853 = _1847.z;
    float _1855 = float(uint(_468));
    float _1857 = trunc(_758);
    int _1859 = int(_1857);
    int _1861 = abs(_716);
    float _1863 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1865 = ~_468;
    int _1867 = _1865 + 1;
    float _1869 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1871 = abs(_722);
    float _1873 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1863);
    int _1875 = abs(_730);
    float _1877 = 1.0 / _1855;
    bool _1879 = _472 > 0.5;
    out.m_65.w = _872;
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1883 = _458 + _1881;
    int _1885 = ~_468;
    int _1887 = _1885 + 1;
    out.m_67.x = _1070;
    out.m_67.y = _1062;
    out.m_67.z = _1048;
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1891 = _1889 != 0;
    float _1893 = exp2(_1869);
    float _1895 = float(uint(_1859));
    out.m_69.x = _960;
    int _1897 = ~_468;
    int _1899 = _1897 + 1;
    out.m_71.x = _1392;
    out.m_71.y = _1390;
    out.m_71.z = _1394;
    bool _1901 = !_1891;
    float _1903 = _1901 ? 7.345489978790283203125 : 1.0;
    int _1905 = as_type<int>(_1877) + (-2);
    float _1907 = _1776 + _1752;
    float _1909 = _1903 * _470;
    float _1911 = float(_112);
    float _1913 = as_type<float>(_1905) * _1895;
    float _1915 = _1907 * 0.5;
    float _1917 = -_1893;
    float _1919 = _1917 + 1.0;
    float _1921 = 1.0 / _1911;
    float _1923 = trunc(_1913);
    float _1925 = precise::max(_1923, 0.0);
    uint _1928 = uint(_1925);
    float _1930 = _482 * _1921;
    int _1932 = _468 + (-1);
    int _1934 = _1867 * int(_1928);
    int _1936 = _1934 + _1859;
    float _1938 = floor(_1909);
    float _1940 = float(uint(_1936));
    float _1942 = as_type<float>(_1905) * _1940;
    int _1944 = ~_468;
    int _1946 = _1944 + 1;
    float _1948 = trunc(_1942);
    float _1950 = precise::max(_1948, 0.0);
    uint _1952 = uint(_1950);
    float _1954 = -_1938;
    float _1956 = _1909 + _1954;
    float _1958 = _1956 * _480;
    float _1960 = trunc(_1958);
    int _1962 = int(_1960);
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1964;
    int _1968 = int(_1928) + int(_1952);
    float _1970 = float(_1859);
    int _1972 = _1946 * _1968;
    int _1974 = _1972 + _1859;
    bool _1976 = _1970 >= _480;
    bool _1978 = isnan(_1970);
    bool _1980 = _1976 || _1978;
    bool _1982 = isnan(_480);
    bool _1984 = _1980 || _1982;
    float _1986 = float(_1984);
    float _1988 = trunc(_1930);
    int _1990 = int(_1988);
    bool _1992 = uint(_1974) >= uint(_468);
    int _1994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1996 = _1994 != 0;
    bool _1998 = !_1992;
    int _2000 = _1998 ? 0 : (-1);
    bool _2002 = _468 == 0;
    float _2004 = trunc(_1986);
    int _2006 = int(_2004);
    int _2008 = ~_1968;
    int _2010 = _2008 + _2000;
    int _2012 = _2010 + 1;
    bool _2014 = !_1996;
    int _2016 = _2014 ? 0 : 1;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2020 = _2018 != 0;
    int _2022 = _468 * _2012;
    int _2024 = _2022 + _1859;
    int _2026 = abs(_2016);
    bool _2028 = !_2002;
    int _2030 = _2028 ? _2024 : (-1);
    int _2032 = _1962 * _2026;
    int _2034 = _2032 + _1859;
    int _2036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2038 = _2036 != 0;
    float _2040 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2040;
    int _2044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2046 = _2044 != 0;
    float _2048 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2050 = _2048 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2052 = ~_2006;
    int _2054 = _2052 + 1;
    int _2056 = _2054 + 1;
    bool _2058 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2060 = isnan(_458);
    bool _2062 = _2058 || _2060;
    bool _2064 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2066 = _2062 || _2064;
    float _2068 = float(_2066);
    int _2070 = _2030 * _2056;
    int _2072 = _2006 * _1932;
    int _2074 = _2072 + _2070;
    bool _2076 = !_2020;
    int _2078 = _2076 ? 0 : 1;
    int _2080 = _2074 * _1861;
    int _2082 = abs(_2078);
    int _2084 = _1990 * _1871;
    int _2086 = _2084 + _2080;
    int _2088 = ~_468;
    int _2090 = _2088 + 1;
    float _2092 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2094 = _2092 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2096 = _2034 * _1875;
    int _2098 = _2096 + _2086;
    int _2100 = ~_468;
    int _2102 = _2100 + 1;
    int _2104 = _1962 * _2082;
    int _2106 = _2104 + _2098;
    float _2108 = 1.0 / _2094;
    float _2110 = float(uint(_2106));
    float _2112 = as_type<float>(_1905) * _2110;
    float _2114 = trunc(_2112);
    float _2116 = precise::max(_2114, 0.0);
    uint _2118 = uint(_2116);
    float _2120 = _2050 * _2108;
    int _2122 = _2102 * int(_2118);
    int _2124 = _2122 + _2106;
    float _2126 = float(uint(_2124));
    float _2128 = as_type<float>(_1905) * _2126;
    float _2130 = float(uint(_2034));
    float _2132 = trunc(_2128);
    float _2134 = precise::max(_2132, 0.0);
    uint _2136 = uint(_2134);
    float _2138 = as_type<float>(_1905) * _2130;
    float _2140 = trunc(_2138);
    float _2142 = precise::max(_2140, 0.0);
    uint _2144 = uint(_2142);
    float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2148 = _2146 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2150 = int(_2118) + int(_2136);
    float _2152 = 1.0 / _2148;
    int _2154 = _2090 * _2150;
    int _2156 = _2154 + _2106;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    bool _2158 = uint(_2156) >= uint(_468);
    bool _2160 = !_2158;
    int _2162 = _2160 ? 0 : (-1);
    int _2164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2166 = _2164 != 0;
    float _2168 = _2042 * _2152;
    int _2170 = ~_2150;
    int _2172 = _2170 + _2162;
    int _2174 = _2172 + 1;
    float _2176 = in.m_75.y;
    int _2178 = _1887 * int(_2144);
    int _2180 = _2178 + _2034;
    float _2182 = fma(_2168, _1883, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2184 = _468 * _2174;
    int _2186 = _2184 + _2106;
    bool _2188 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2190 = isnan(_458);
    bool _2192 = _2188 || _2190;
    bool _2194 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2196 = _2192 || _2194;
    float _2198 = float(_2196);
    float _2200 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2202 = _458 + _2200;
    float _2204 = float(uint(_2180));
    bool _2206 = !_2002;
    int _2208 = _2206 ? _2186 : (-1);
    float _2210 = -_2198;
    float _2212 = _2210 + 1.0;
    float _2214 = as_type<float>(_1905) * _2204;
    int _2216 = _2208 >> 31;
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2220 = _2218 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2222 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2224 = isnan(_458);
    bool _2226 = _2222 || _2224;
    bool _2228 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2230 = _2226 || _2228;
    float _2232 = float(_2230);
    int _2234 = _2216 & 3;
    float _2236 = trunc(_2214);
    float _2238 = precise::max(_2236, 0.0);
    uint _2240 = uint(_2238);
    bool _2242 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2244 = isnan(_458);
    bool _2246 = _2242 || _2244;
    bool _2248 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2250 = _2246 || _2248;
    float _2252 = float(_2250);
    int _2254 = _2208 + _2234;
    int _2256 = _2208 & 3;
    bool _2258 = _2256 != 0;
    float _2260 = -_2252;
    float _2262 = _2260 + 1.0;
    int _2264 = _2254 >> 2;
    float _2266 = 1.0 / _2220;
    float _2268 = _2252 * _2212;
    float _2270 = _2068 * _2262;
    int _2272 = _2264 << 4;
    int _2274 = _2272 + 368;
    float _2276 = -_2068;
    float _2278 = _2276 + 1.0;
    float _2280 = -_2176;
    float _2282 = _2280 + 1.0;
    uint _2284 = uint(int(uint(_2274) >> uint(2)));
    uint _2286 = uint(int(uint(int(_2284)) >> uint(2)));
    int _2288 = int(_2284) & 3;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[int(_2286)][_2288];
    int _2292 = int(_2284) + 1;
    uint _2294 = uint(int(uint(_2292) >> uint(2)));
    int _2296 = _2292 & 3;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[int(_2294)][_2296];
    float _2300 = _2232 * _2278;
    int _2302 = int(_2144) + int(_2240);
    float _2304 = -_2232;
    float _2306 = _2304 + 1.0;
    float _2308 = _2176;
    if (_2038)
    {
        float _2310 = _1879 ? _2282 : _2176;
        _2308 = _2310;
    }
    float _2312 = _2308;
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2316 = _458 + _2314;
    int _2318 = _2258 ? 0 : 1;
    float _2320 = _1966 * _2266;
    float _2322 = _2182 * _2300;
    int _2324 = _2208 & 3;
    bool _2326 = _2324 != 0;
    float _2328 = _2182;
    if (_2166)
    {
        float _2330 = in.m_55.x;
        _2328 = _2330;
    }
    float _2332 = _2328;
    int _2334 = _2274 + 8;
    uint _2336 = uint(int(uint(_2334) >> uint(2)));
    uint _2338 = uint(int(uint(int(_2336)) >> uint(2)));
    int _2340 = int(_2336) & 3;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[int(_2338)][_2340];
    int _2344 = int(_2336) + 1;
    uint _2346 = uint(int(uint(_2344) >> uint(2)));
    int _2348 = _2344 & 3;
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[int(_2346)][_2348];
    float _2352 = fma(_2120, _2316, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2354 = uint(_2324) > 1u;
    float _2356 = fma(_2306, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2322);
    bool _2358 = _2324 != 3;
    float _2360 = fma(_2320, _2202, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2362 = ~_2318;
    int _2364 = _2362 + 1;
    int _2366 = _2364 + 1;
    int _2368 = _1899 * _2302;
    int _2370 = _2368 + _2034;
    float _2372 = fma(_2352, _2270, _2356);
    float _2374 = -_1814;
    float _2376 = _2374 + 1.0;
    bool _2378 = uint(_2370) >= uint(_468);
    float _2380 = fma(_2360, _2268, _2372);
    int _2382 = _2366;
    if (!_2354)
    {
        int _2384 = ~_2318;
        int _2386 = _2384 + 1;
        _2382 = _2386;
    }
    int _2388 = _2382;
    bool _2390 = uint(_2324) >= 2u;
    int _2392 = abs(_2388);
    int _2394 = _2390 ? 0 : 1;
    bool _2396 = !_2326;
    int _2398 = _2396 ? 0 : 1;
    bool _2400 = !_2378;
    int _2402 = _2400 ? 0 : (-1);
    int _2404 = ~_2394;
    int _2406 = _2404 + 1;
    int _2408 = _2406 + 1;
    bool _2410 = _2324 != 3;
    int _2412 = _2408;
    if (_2358)
    {
        int _2414 = ~_2394;
        int _2416 = _2414 + 1;
        _2412 = _2416;
    }
    int _2418 = _2412;
    int _2420 = ~_2392;
    int _2422 = _2420 + 1;
    int _2424 = _2422 + 1;
    int _2426 = abs(_2398);
    int _2428 = ~_2302;
    int _2430 = _2428 + _2402;
    int _2432 = _2430 + 1;
    float _2434 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2436 = int(_2434);
    bool _2438 = !_2410;
    int _2440 = _2438 ? 0 : (-1);
    int _2442 = _2424 * as_type<int>(_2298);
    int _2444 = abs(_2418);
    bool _2446 = !_2046;
    int _2448 = _2446 ? 0 : 1;
    int _2450 = ~_2426;
    int _2452 = _2450 + 1;
    int _2454 = _2452 + 1;
    int _2456 = abs(_2440);
    int _2458 = _2454 * as_type<int>(_2290);
    int _2460 = _2458 + _2442;
    bool _2462 = _2332 > 0.5;
    bool _2464 = _2462 && _2166;
    int _2466 = _468 * _2432;
    int _2468 = _2466 + _2034;
    int _2470 = abs(_2448);
    float _2472 = in.m_75.x;
    int _2474 = ~_2444;
    int _2476 = _2474 + 1;
    int _2478 = _2476 + 1;
    int _2480 = ~_2456;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    float _2486 = _980 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2488 = abs(_2436);
    int _2490 = _2478 * as_type<int>(_2342);
    int _2492 = _2490 + _2460;
    float _2494 = _980 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2496 = float(uint(_2436));
    int _2498 = _2484 * as_type<int>(_2350);
    int _2500 = _2498 + _2492;
    bool _2502 = !_2002;
    int _2504 = _2502 ? _2468 : (-1);
    float _2506 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2380);
    float _2508 = float(uint(_2488));
    float _2510 = _980 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2512 = ~_2470;
    int _2514 = _2512 + 1;
    int _2516 = _2514 + 1;
    float _2518 = 1.0 / _2496;
    float _2520 = _2506 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2522 = _2500 * _2516;
    float _2524 = -_966;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2486);
    float _2528 = -_966;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2494);
    float _2532 = 1.0 / _2508;
    int _2534 = _2504 * _2470;
    int _2536 = _2534 + _2522;
    float _2538 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2540 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2544 = -_966;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2510);
    int _2548 = abs(_2536);
    float _2550 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2552 = as_type<int>(_2518) + (-2);
    float _2554 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2556 = float(uint(_2536));
    float _2558 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2560 = float(uint(_2548));
    int _2562 = ~_2436;
    int _2564 = _2562 + 1;
    float _2566 = as_type<float>(_2552) * _2556;
    int _2568 = as_type<int>(_2532) + (-2);
    out.m_77.x = _2550;
    out.m_77.y = _2554;
    out.m_77.z = _2558;
    out.m_77.w = _2520;
    bool _2570 = _946 != 0.0;
    bool _2572 = isnan(_946);
    bool _2574 = _2570 || _2572;
    bool _2576 = isnan(0.0);
    bool _2578 = _2574 || _2576;
    int _2580 = ~_2488;
    int _2582 = _2580 + 1;
    float _2584 = as_type<float>(_2568) * _2560;
    float _2586 = trunc(_2566);
    float _2588 = precise::max(_2586, 0.0);
    uint _2590 = uint(_2588);
    float _2592 = in.m_79.x;
    float _2594 = in.m_79.y;
    float _2596 = in.m_79.z;
    float _2598 = as_type<float>(_2444);
    float _2600 = _2472;
    if (_2166)
    {
        _2598 = _2472;
    }
    float _2602 = _2598;
    bool _2604 = _954 == 0.0;
    bool _2606 = !_2578;
    bool _2608 = _2604 && _2606;
    float _2610 = _2602;
    if (_2464)
    {
        float _2612 = -_2602;
        float _2614 = _2612 + 1.0;
        _2610 = _2614;
    }
    float _2616 = _2610;
    float _2618 = trunc(_2584);
    float _2620 = precise::max(_2618, 0.0);
    uint _2622 = uint(_2620);
    float _2624 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2530);
    bool _2626 = _956 == 0.0;
    bool _2628 = _2626 && _2608;
    float _2630 = _990 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_2166)
    {
        _2600 = _2616;
    }
    float _2632 = _2600;
    float _2634 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2526);
    float _2636 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2546);
    int _2638 = _2564 * int(_2590);
    int _2640 = _2638 + _2536;
    float _2642 = _990 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2644 = _990 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2646 = _996 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2648 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2630);
    float _2650 = float(uint(_2640));
    float _2652 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2642);
    float _2654 = abs(_1404);
    float _2656 = log2(_2654);
    int _2658 = _2582 * int(_2622);
    int _2660 = _2658 + _2548;
    float _2662 = _2594;
    float _2664 = _2592;
    float _2666 = _2596;
    if (!_2628)
    {
        float _2668 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2594);
        _2662 = _2668;
    }
    float _2670 = _2662;
    float _2672 = as_type<float>(_2552) * _2650;
    float _2674 = _996 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2676 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2646);
    float _2678 = float(uint(_2660));
    float _2680 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2644);
    float _2682 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2674);
    float _2684 = trunc(_2672);
    float _2686 = precise::max(_2684, 0.0);
    uint _2688 = uint(_2686);
    float _2690 = _2634 * _2670;
    float _2692 = as_type<float>(_2568) * _2678;
    float _2694 = _996 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2696 = _2624 * _2670;
    float _2698 = _2636 * _2670;
    float _2700 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2676);
    float _2702 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2694);
    float _2704 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2706 = trunc(_2692);
    float _2708 = precise::max(_2706, 0.0);
    uint _2710 = uint(_2708);
    int _2712 = ~_2488;
    int _2714 = _2712 + 1;
    if (!_2628)
    {
        float _2716 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2592);
        _2664 = _2716;
    }
    float _2718 = _2664;
    int _2720 = ~_2436;
    int _2722 = _2720 + 1;
    if (!_2628)
    {
        float _2724 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2596);
        _2666 = _2724;
    }
    float _2726 = _2666;
    float _2728 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2680);
    float _2730 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2652);
    int _2732 = int(_2590) + int(_2688);
    float _2734 = exp2(_2704);
    float _2736 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2648);
    float _2738 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2682);
    float _2740 = fma(_2728, _2718, _2696);
    int _2742 = _2722 * _2732;
    int _2744 = _2742 + _2536;
    float _2746 = fma(_2736, _2718, _2698);
    float _2748 = fma(_2738, _2726, _2740);
    int _2750 = int(_2622) + int(_2710);
    float _2752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2754 = uint(_2744) >= uint(_2436);
    float _2756 = fma(_2730, _2718, _2690);
    bool _2758 = _1404 <= 8000.0;
    bool _2760 = isnan(_1404);
    bool _2762 = _2758 || _2760;
    bool _2764 = isnan(8000.0);
    bool _2766 = _2762 || _2764;
    float _2768 = float(_2766);
    int _2770 = _2714 * _2750;
    int _2772 = _2770 + _2548;
    bool _2774 = !_2754;
    int _2776 = _2774 ? 0 : (-1);
    float _2778 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2702);
    bool _2780 = _2436 == 0;
    float _2782 = fma(_2700, _2726, _2756);
    bool _2784 = uint(_2772) >= uint(_2488);
    float _2786 = fma(_2778, _2726, _2746);
    int _2788 = _2536 ^ _2436;
    bool _2790 = !_2784;
    int _2792 = _2790 ? 0 : (-1);
    float _2794 = _2752 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _2796 = uint(int(uint(_2788) >> uint(31)));
    float _2798 = fma(_2734, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2800 = precise::clamp(_2798, 0.0, 1.0);
    int _2802 = ~_2732;
    int _2804 = _2802 + _2776;
    int _2806 = _2804 + 1;
    float _2808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2810 = ~_2792;
    int _2812 = _2750 + _2810;
    int _2814 = _2812 + 1;
    float _2816 = fma(_2794, _2632, -0.5);
    int _2818 = ~int(_2796);
    int _2820 = _2818 + 1;
    int _2822 = _2436 * _2806;
    int _2824 = _2822 + _2536;
    float _2826 = fma(_2800, -2.0, 3.0);
    float _2828 = _2800 * _2800;
    int _2830 = _2814 ^ _2820;
    out.m_81.x = _2782;
    out.m_81.y = _2748;
    out.m_81.z = _2786;
    bool _2832 = _2436 == 0;
    float _2834 = _2828 * _2826;
    int _2836 = ~_2820;
    int _2838 = _2836 + _2830;
    int _2840 = _2838 + 1;
    bool _2842 = !_2780;
    int _2844 = _2842 ? _2824 : (-1);
    float _2846 = -_2834;
    float _2848 = _2846 + 1.0;
    bool _2850 = !_2832;
    int _2852 = _2850 ? _2840 : (-1);
    float _2854 = float(_2844);
    float _2856 = _2808 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2858 = float(_2852);
    float _2860 = fma(_2848, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2834);
    bool _2862 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2864 = isnan(_1546);
    bool _2866 = _2862 || _2864;
    bool _2868 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2870 = _2866 || _2868;
    float _2872 = fma(_2856, _2312, -0.5);
    float _2874 = fma(_2794, _2854, _766);
    float _2876 = -_732;
    float _2878 = fma(_2856, _2858, _2876);
    float _2880 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1873);
    float _2882 = in.m_83.x;
    float _2884 = _2768 * _2860;
    float _2886 = _1752 * 0.5;
    float _2888 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2880);
    float _2890 = fma(_812, _2816, _2874);
    float _2892 = _2884 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2894 = fma(_712, _2872, _2878);
    float _2896 = _2888 + _1752;
    float _2898 = fma(_1802, -0.5, _2886);
    float _2900 = _2890 + 0.5;
    float _2902 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2904 = _2376 * _2892;
    float _2906 = precise::clamp(_2904, 0.0, 1.0);
    float _2908 = _2896 * 0.5;
    float _2910 = _2902 * _1832;
    float _2912 = -_2906;
    float _2914 = fma(_2912, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2916 = _2894 + 0.5;
    out.gl_Position.x = _1776;
    out.gl_Position.y = _1802;
    out.gl_Position.z = _2888;
    out.gl_Position.w = _1752;
    float _2918 = _1853 * _2910;
    out.m_85.x = _1915;
    out.m_85.y = _2898;
    out.m_85.z = _2908;
    out.m_85.w = _1752;
    float _2920 = _2914 * _2882;
    out.m_87.x = _2900;
    out.m_87.y = _2916;
    float _2922 = _2920 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2924 = _1843 * _2910;
    out.m_89.x = _2922;
    float _2926 = -_2902;
    float _2928 = _2926 + 1.0;
    float _2930 = fma(_1849, _2924, _1837);
    float _2932 = fma(_1851, _2924, _1839);
    float _2934 = fma(_1843, _2918, _1841);
    float _2936 = _1843 * _2928;
    float _2938 = _1458 * _1512;
    float _2940 = _2902;
    float _2942 = _2924;
    float _2944 = _1752;
    float _2946 = _2908;
    float _2948 = _2898;
    float _2950 = _2938;
    if (!_2870)
    {
        _2940 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2952 = _2940;
    float _2954 = _2952;
    float _2956 = _2952;
    if (!_2870)
    {
        _2942 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2958 = _2942;
    out.m_91.x = _2930;
    out.m_91.y = _2932;
    out.m_91.z = _2934;
    out.m_91.w = _2936;
    float _2960 = _2938 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2962 = _2958;
    float _2964 = _2958;
    if (!_2870)
    {
        _2944 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2966 = _2944;
    float _2968 = _2966;
    float _2970 = _2966;
    if (!_2870)
    {
        _2946 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2972 = _2946;
    float _2974 = _2972;
    float _2976 = _2972;
    if (!_2870)
    {
        _2948 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2978 = _2948;
    float _2980 = _2978;
    float _2982 = _2978;
    if (!_2870)
    {
        _2950 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2984 = _2950;
    bool _2986 = !_2870;
    float _2988 = _2984;
    float _2990 = _2984;
    if (!_2986)
    {
        bool _2992 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2994 = isnan(_1546);
        bool _2996 = _2992 || _2994;
        bool _2998 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3000 = _2996 || _2998;
        if (!_3000)
        {
            float _3002 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3004 = _1546 + _3002;
            float _3006 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3008 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3006;
            float _3010 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3012 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3014 = 1.0 / _3008;
            float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3018 = _3016 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3020 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3022 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3024 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3026 = _3024 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3028 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3030 = _3028 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3032 = _3004 * _3014;
            float _3034 = precise::clamp(_3032, 0.0, 1.0);
            float _3036 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3038 = _3036 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3040 = fma(_3034, _3012, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3042 = fma(_3034, _3038, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3044 = fma(_3034, _3018, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3046 = fma(_3034, _3022, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3048 = fma(_3034, _3026, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3050 = fma(_3034, _3030, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2964 = _3044;
            _2982 = _3048;
            _2956 = _3040;
            _2976 = _3046;
            _2970 = _3042;
            _2990 = _3050;
            _3052 = true;
        }
        else
        {
            bool _3054 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3056 = isnan(_1546);
            bool _3058 = _3054 || _3056;
            bool _3060 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3062 = _3058 || _3060;
            if (!_3062)
            {
                _2954 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3064 = _2954;
            _2956 = _3064;
            if (!_3062)
            {
                _2962 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3066 = _2962;
            _2964 = _3066;
            if (!_3062)
            {
                _2968 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3068 = _2968;
            _2970 = _3068;
            if (!_3062)
            {
                _2974 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3070 = _2974;
            _2976 = _3070;
            if (!_3062)
            {
                _2980 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3072 = _2980;
            _2982 = _3072;
            if (!_3062)
            {
                _2988 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3074 = _2988;
            bool _3076 = !_3062;
            _2990 = _3074;
            if (!_3076)
            {
                bool _3078 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3080 = isnan(_1546);
                bool _3082 = _3078 || _3080;
                bool _3084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3086 = _3082 || _3084;
                if (!_3086)
                {
                    float _3088 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3090 = _1546 + _3088;
                    float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3094 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3092;
                    float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3098 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3100 = 1.0 / _3094;
                    float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3104 = _3102 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3110 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3118 = _3090 * _3100;
                    float _3120 = precise::clamp(_3118, 0.0, 1.0);
                    float _3122 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3124 = _3122 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3126 = fma(_3120, _3098, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3128 = fma(_3120, _3124, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3130 = fma(_3120, _3104, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3132 = fma(_3120, _3108, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3134 = fma(_3120, _3112, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3136 = fma(_3120, _3116, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2964 = _3130;
                    _2982 = _3134;
                    _2956 = _3126;
                    _2976 = _3132;
                    _2970 = _3128;
                    _2990 = _3136;
                    _3052 = true;
                }
                else
                {
                    _2964 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2982 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2956 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2976 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2970 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2990 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3052 = false;
    float _3138 = _2964;
    float _3140 = _2982;
    float _3142 = _2956;
    float _3144 = _2976;
    float _3146 = _2970;
    float _3148 = _2990;
    float _3150 = fma(_2748, -0.5, 0.5);
    float _3152 = precise::clamp(_3150, 0.0, 1.0);
    float _3154 = -_3138;
    float _3156 = _3154 + _3140;
    float _3158 = _2960 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3160 = -_3142;
    float _3162 = _3160 + _3144;
    float _3164 = fma(_3152, _3156, _3138);
    out.m_93.x = 0.0;
    float _3166 = -_3146;
    float _3168 = _3166 + _3148;
    float _3170 = fma(_3152, _3162, _3142);
    float _3172 = _3164 * 0.586610972881317138671875;
    out.m_49.x = _3158;
    bool _3174 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3176 = fma(_3152, _3168, _3146);
    float _3178 = fma(_3170, 0.298911988735198974609375, _3172);
    bool _3180 = _1458 > 0.0;
    bool _3182 = isnan(_1458);
    bool _3184 = _3180 || _3182;
    bool _3186 = isnan(0.0);
    bool _3188 = _3184 || _3186;
    float _3190 = fma(_3176, 0.114477999508380889892578125, _3178);
    bool _3192 = _1512 <= 0.0;
    bool _3194 = !_3188;
    bool _3196 = _3192 || _3194;
    float _3198 = -_3190;
    float _3200 = _3170 + _3198;
    float _3202 = -_3190;
    float _3204 = _3164 + _3202;
    float _3206 = -_3190;
    float _3208 = _3176 + _3206;
    float _3210 = fma(_3200, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3190);
    float _3212 = fma(_3204, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3190);
    float _3214 = fma(_3208, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3190);
    bool _3216 = !_3174;
    if (!_3216)
    {
        float _3218 = -_1390;
        float _3220 = _3218 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3222 = -_1392;
        float _3224 = _3222 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3226 = -_1394;
        float _3228 = _3226 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3230 = _3220 * _3220;
        float _3232 = fma(_3224, _3224, _3230);
        float _3234 = fma(_3228, _3228, _3232);
        float _3236 = sqrt(_3234);
        float _3238 = rsqrt(_3234);
        float _3240 = -_3236;
        float _3242 = _3240 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3244 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3246 = precise::clamp(_3244, 0.0, 1.0);
        float _3248 = _3224 * _3238;
        float _3250 = _3220 * _3238;
        float _3252 = abs(_3246);
        float _3254 = log2(_3252);
        float _3256 = _3228 * _3238;
        float _3258 = _3248 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3260 = _2748 * _3250;
        float _3262 = -_3250;
        float _3264 = -_3258;
        float _3266 = fma(_3262, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3264);
        float _3268 = fma(_2782, _3248, _3260);
        float _3270 = -_3256;
        float _3272 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3266);
        float _3274 = fma(_2786, _3256, _3268);
        float _3276 = precise::clamp(_3274, 0.0, 1.0);
        float _3278 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3280 = _3272 + _3278;
        float _3282 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3284 = _3280 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3286 = precise::clamp(_3284, 0.0, 1.0);
        float _3288 = exp2(_3282);
        float _3290 = _3288 * _3286;
        float _3292 = _3276 * _3290;
        float _3294 = _3292 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3296 = _3292 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3298 = _3292 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3294;
        out.m_93.y = _3296;
        out.m_93.z = _3298;
    }
    out.m_65.x = _3210;
    out.m_65.y = _3212;
    out.m_65.z = _3214;
    if (!_3196)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3300 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3300;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

