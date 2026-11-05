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
    float4 m_75 [[user(locn6)]];
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
    float4 m_63 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_79 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_73 [[attribute(10)]];
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3014 = false;
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
        float _3319 = as_type<float>(_128);
        out.gl_Position.z = _3319;
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
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3389 = as_type<float>(_166);
        out.gl_Position.z = _3389;
    }
    if (_158)
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
    float _410 = _408 * _400;
    float _412 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[115].x, _410);
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _420 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[116].x, _412);
    float _422 = _414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _424 = _416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _428 = _420 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _422;
    out.m_59.y = _424;
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
    float _466 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _468 = log2(_466);
    float _470 = _322 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _472 = in.m_55.z;
    float _474 = _324 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _476 = in.m_55.x;
    float _478 = in.m_55.y;
    float _480 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _482 = int(_480);
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _488 = in.m_61.x;
    float _490 = in.m_61.y;
    float _492 = in.m_61.z;
    float _494 = _468 * _146;
    float _496 = exp2(_494);
    float _498 = _462 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _500 = _462 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _502 = _462 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _504 = float(_482);
    float _506 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[5].x, _498);
    float _508 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[4].x, _500);
    float _510 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[6].x, _502);
    float _512 = _472 * 2.0;
    float _514 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[5].z, _506);
    float _516 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[4].z, _508);
    float _518 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[6].z, _510);
    float _520 = _476 * 2.0;
    float _522 = _514 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _524 = _516 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _526 = _518 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _528 = floor(_512);
    float _530 = -_522;
    float _532 = _530 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _534 = -_524;
    float _536 = _534 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _538 = _478 * 2.0;
    float _540 = _532 * _532;
    float _542 = -_496;
    float _544 = _542 + 1.0;
    float _546 = floor(_520);
    float _548 = fma(_536, _536, _540);
    float _550 = -_526;
    float _552 = _550 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _556 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[78].z, _484);
    float _558 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[78].w, _486);
    float _560 = fma(_552, _552, _548);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _564 = floor(_538);
    float _566 = _476 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _568 = _478 + _476;
    bool _570 = _528 > 0.0;
    float _572 = _478 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _574 = -_562;
    float _576 = fma(_566, 2.0, _574);
    float _578 = _478 + _472;
    bool _580 = _528 >= 0.0;
    bool _582 = isnan(_528);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = sqrt(_560);
    float _592 = _568 + (-1.0);
    bool _594 = _546 > 0.0;
    float _596 = fma(_572, -2.0, _554);
    float _598 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _600 = _578 + (-1.0);
    int _602 = _588 ? 0 : 1;
    float _604 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _606 = int(_604);
    bool _608 = _564 > 0.0;
    float _610 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _612 = _546 >= 0.0;
    bool _614 = isnan(_546);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    float _622 = -_146;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[76].x, _576);
    bool _626 = _564 >= 0.0;
    bool _628 = isnan(_564);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = _504 * _146;
    int _638 = ~_602;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    float _644 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _556);
    float _646 = abs(_590);
    float _648 = precise::max(_646, 200.0);
    float _650 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _596);
    int _652 = _642;
    if (!_570)
    {
        int _654 = ~_602;
        int _656 = _654 + 1;
        _652 = _656;
    }
    int _658 = _652;
    int _660 = _620 ? 0 : 1;
    int _662 = _634 ? 0 : 1;
    bool _664 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _666 = isnan(0.0);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _672 = _668 || _670;
    float _674 = precise::min(_648, 300.0);
    int _676 = ~_660;
    int _678 = _676 + 1;
    int _680 = _678 + 1;
    int _682 = ~_662;
    int _684 = _682 + 1;
    int _686 = _684 + 1;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _690 = _688 != 0;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _694 = _692 != 0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _698 = _696 != 0;
    int _700 = _680;
    int _702 = _686;
    if (!_594)
    {
        int _704 = ~_660;
        int _706 = _704 + 1;
        _700 = _706;
    }
    int _708 = _700;
    float _710 = fma(_674, 0.00999999977648258209228515625, -2.0);
    if (!_608)
    {
        int _712 = ~_662;
        int _714 = _712 + 1;
        _702 = _714;
    }
    int _716 = _702;
    float _718 = fma(_674, 0.00999999977648258209228515625, -1.0);
    float _720 = float(_606);
    float _722 = -_710;
    float _724 = _522 + _722;
    bool _726 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _728 = isnan(1.0);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _734 = _730 || _732;
    float _736 = in.m_63.x;
    float _738 = in.m_63.y;
    float _740 = in.m_63.z;
    bool _742 = !_694;
    int _744 = _742 ? 0 : 1;
    float _746 = 1.0 / _720;
    bool _748 = !_690;
    int _750 = _748 ? 0 : 1;
    float _752 = _718 * _490;
    bool _754 = !_698;
    int _756 = _754 ? 0 : 1;
    float _758 = _718 * _492;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _770 = _768 != 0;
    float _772 = _672 ? _544 : 0.0;
    float _774 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _776 = _724 + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _780 = 1.0 + _778;
    bool _782 = !_766;
    int _784 = _782 ? 0 : 1;
    bool _786 = !_770;
    int _788 = _786 ? 0 : 1;
    float _790 = 1.0 / _780;
    int _792 = abs(_784);
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _796 = _524 + _794;
    float _798 = _776 * _776;
    int _800 = abs(_788);
    float _802 = _746 * _146;
    float _804 = float(_708);
    float _806 = fma(_796, _796, _798);
    float _808 = float(_792);
    float _810 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _558);
    bool _812 = !_762;
    int _814 = _812 ? 0 : 1;
    float _816 = float(_716);
    float _818 = _808 * _804;
    int _820 = abs(_814);
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _824 = _526 + _822;
    if (_734)
    {
        float _826 = _772 * _790;
        _148 = _826;
    }
    float _828 = _148;
    float _830 = _818 * (-2.0);
    float _832 = float(_820);
    float _834 = fma(_824, _824, _806);
    float _836 = float(_658);
    float _838 = fma(_830, _738, _738);
    float _840 = float(_800);
    float _842 = sqrt(_834);
    float _844 = fma(_610, _830, _610);
    float _846 = _832 * _836;
    float _848 = _476 + (-0.5);
    float _850 = _840 * _816;
    float _852 = _478 + (-0.5);
    float _854 = _846 * (-2.0);
    float _856 = _320 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _858 = _850 * (-2.0);
    float _860 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[196].y, _838);
    float _862 = fma(_854, _736, _736);
    float _864 = _856 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _866 = rsqrt(_834);
    float _868 = fma(_844, _828, _860);
    float _870 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[196].x, _862);
    float _872 = _472 + _476;
    float _874 = _842 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _876 = fma(_598, _854, _598);
    float _878 = _872 + (-1.0);
    float _880 = _472 + (-0.5);
    float _882 = precise::min(_864, _874);
    float _884 = fma(_858, _740, _740);
    float _886 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _888 = fma(_876, _828, _870);
    float _890 = _868 * 0.15915493667125701904296875;
    float _892 = _718 * _488;
    float _894 = fma(_886, _858, _886);
    float _896 = _866 * _882;
    float _898 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[196].z, _884);
    float _900 = _888 * 0.15915493667125701904296875;
    float _902 = _890 * 6.283185482025146484375;
    float _904 = sin(_902);
    float _906 = _776 * _896;
    float _908 = _796 * _896;
    float _910 = fma(_894, _828, _898);
    float _912 = _824 * _896;
    float _914 = -_906;
    float _916 = _776 + _914;
    float _918 = -_908;
    float _920 = _796 + _918;
    float _922 = _910 * 0.15915493667125701904296875;
    float _924 = -_912;
    float _926 = _824 + _924;
    float _928 = _916 * _916;
    float _930 = _900 * 6.283185482025146484375;
    float _932 = sin(_930);
    float _934 = fma(_920, _920, _928);
    float _936 = fma(_926, _926, _934);
    float _938 = _890 * 6.283185482025146484375;
    float _940 = cos(_938);
    float _942 = sqrt(_936);
    float _944 = _932 * _904;
    float _946 = _900 * 6.283185482025146484375;
    float _948 = cos(_946);
    float _950 = _932 * _940;
    float _952 = _922 * 6.283185482025146484375;
    float _954 = cos(_952);
    float _956 = _866 * _942;
    float _958 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _892);
    float _960 = _470 * _956;
    float _962 = _856 * _956;
    float _964 = _474 * _956;
    float _966 = _922 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = _948 * _940;
    float _972 = _948 * _904;
    float _974 = _932 * _954;
    float _976 = _940 * _954;
    float _978 = _948 * _954;
    float _980 = _904 * _954;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _752);
    float _984 = _960 * _982;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _758);
    float _988 = fma(_968, _970, _944);
    float _990 = _962 * _958;
    float _992 = _978 * _984;
    float _994 = _964 * _986;
    float _996 = -_950;
    float _998 = fma(_968, _972, _996);
    float _1000 = -_984;
    float _1002 = _968 * _1000;
    float _1004 = fma(_988, _990, _992);
    float _1006 = -_972;
    float _1008 = fma(_968, _950, _1006);
    float _1010 = _974 * _984;
    float _1012 = fma(_976, _990, _1002);
    float _1014 = fma(_998, _994, _1004);
    float _1016 = fma(_968, _944, _970);
    float _1018 = fma(_1008, _990, _1010);
    float _1020 = fma(_980, _994, _1012);
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1026 = fma(_1016, _994, _1018);
    float _1028 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1022);
    float _1030 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1024);
    float _1032 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1028);
    float _1034 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1030);
    float _1036 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1038 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1040 = _526 + _1036;
    float _1042 = _524 + _1038;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1046 = _1040 + _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1050 = _1042 + _1048;
    float _1052 = _1046 * _1046;
    float _1054 = fma(_1050, _1050, _1052);
    float _1056 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1058 = -_912;
    float _1060 = _526 + _1058;
    float _1062 = sqrt(_1054);
    float _1064 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1056);
    float _1066 = -_906;
    float _1068 = _724 + _1066;
    float _1070 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1064);
    float _1072 = -_908;
    float _1074 = _524 + _1072;
    float _1076 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1078 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1080 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1076);
    float _1082 = _724 + _1078;
    float _1084 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1080);
    bool _1086 = _1062 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1088 = _1070;
    float _1090 = _1078;
    float _1092 = _1080;
    float _1094 = _912;
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
        float _1114 = _1062 + _1112;
        float _1116 = rsqrt(_1054);
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
        float _1142 = fma(_1050, _1138, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1144 = fma(_1046, _1138, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1108 = _1140;
        _1098 = _1142;
        _1102 = _1144;
    }
    float _1146 = _1108;
    float _1148 = _1098;
    float _1150 = _1102;
    float _1152 = -_724;
    float _1154 = _1152 + _1146;
    float _1156 = -_524;
    float _1158 = _1156 + _1148;
    float _1160 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1162 = -_526;
    float _1164 = _1162 + _1150;
    float _1166 = _1154 * _1154;
    float _1168 = 1.0 / _1160;
    float _1170 = -_908;
    float _1172 = _1170 + _1148;
    float _1174 = fma(_1158, _1158, _1166);
    float _1176 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1178 = -_906;
    float _1180 = _1178 + _1146;
    float _1182 = -_912;
    float _1184 = _1182 + _1150;
    float _1186 = fma(_1164, _1164, _1174);
    float _1188 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1176);
    bool _1190 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1192 = isnan(0.5);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1198 = _1194 || _1196;
    float _1200 = sqrt(_1186);
    float _1202 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1188);
    bool _1204 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1206 = isnan(0.5);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1212 = _1208 || _1210;
    float _1214 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1216 = _1214 + _1160;
    float _1218 = _1216 * _1168;
    float _1220 = _1218 * 0.5;
    bool _1222 = _1200 > 0.0;
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1226 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1224);
    float _1228 = 1.0 / _1226;
    float _1230 = _1200;
    float _1232 = _1172;
    float _1234 = _1146;
    float _1236 = _1160;
    float _1238 = _1226;
    float _1240 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1242 = _1184;
    if (!_1222)
    {
        _1230 = _1180;
    }
    float _1244 = _1230;
    float _1246 = _1244;
    if (!_1222)
    {
        _1094 = _1184;
    }
    float _1248 = _1094;
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
            _1272 = _1180;
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
            float _1302 = fma(_188, _1300, _1172);
            float _1304 = fma(_190, _1300, _1180);
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
    if (_1198)
    {
        _196 = _1308;
    }
    float _1328 = _196;
    float _1330 = _1328;
    if (_1198)
    {
        _198 = _1310;
    }
    float _1332 = _198;
    float _1334 = _1332;
    if (_1198)
    {
        _200 = _1312;
    }
    float _1336 = _200;
    float _1338 = _1336;
    if (!_1198)
    {
        float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1342 = _1068 + _1340;
        float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1346 = _1074 + _1344;
        float _1348 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1350 = -_1074;
        float _1352 = _1350 + _1308;
        float _1354 = _1342 * _1342;
        float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1358 = _1060 + _1356;
        float _1360 = -_1068;
        float _1362 = _1360 + _1310;
        float _1364 = -_1060;
        float _1366 = _1364 + _1312;
        float _1368 = fma(_1346, _1346, _1354);
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1372 = fma(_1358, _1358, _1368);
        float _1374 = sqrt(_1372);
        float _1376 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1378 = precise::min(_1374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1380 = _1378 * _1370;
        float _1382 = _1376 * _1380;
        float _1384 = fma(_1352, _1382, _1074);
        float _1386 = fma(_1362, _1382, _1068);
        float _1388 = fma(_1366, _1382, _1060);
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
    float _1538 = fma(_1524, _1524, _1534);
    float _1540 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1536);
    float _1542 = rsqrt(_1538);
    float _1544 = _1540 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1546 = sqrt(_1538);
    float _1548 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
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
    float _1628 = fma(_1074, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1630 = _1604;
    float _1632 = _1626;
    if (_1562)
    {
        float _1634 = fma(_1604, _1626, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1322 = _1634;
    }
    float _1636 = _1322;
    float _1638 = _1636;
    if (!_1562)
    {
        _1630 = _1622;
    }
    float _1640 = _1630;
    float _1642 = floor(_1628);
    float _1644 = _1640;
    float _1646 = _1616;
    if (_1562)
    {
        float _1648 = _1616 + (-1.0);
        _1632 = _1648;
    }
    float _1650 = _1632;
    if (_1562)
    {
        float _1652 = _1586 * _1636;
        _1638 = _1652;
    }
    float _1654 = _1638;
    if (_1562)
    {
        float _1656 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1588 = _1656;
    }
    float _1658 = _1588;
    if (_1562)
    {
        float _1660 = _1550 * _1654;
        _1574 = _1660;
    }
    float _1662 = _1574;
    if (_1562)
    {
        float _1664 = _1552 * _1654;
        _1576 = _1664;
    }
    float _1666 = _1576;
    if (_1562)
    {
        float _1668 = fma(_1622, _1616, _1658);
        _1644 = _1668;
    }
    float _1670 = _1644;
    if (_1562)
    {
        float _1672 = _1662 * _1662;
        _1578 = _1672;
    }
    float _1674 = _1578;
    if (!_1562)
    {
        _1646 = _1556;
    }
    float _1676 = _1646;
    float _1678 = _1676;
    if (_1562)
    {
        float _1680 = _1666 * _1666;
        _1678 = _1680;
    }
    float _1682 = _1678;
    float _1684 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1686 = fma(_1670, _1670, _1674);
    float _1688 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1684);
    float _1690 = _1686 + _1682;
    float _1692 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1694 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1696 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1688);
    float _1698 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1532);
    float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1702 = fma(_1546, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1700);
    float _1704 = precise::clamp(_1702, 0.0, 1.0);
    float _1706 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1694);
    float _1708 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1710 = rsqrt(_1690);
    float _1712 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1714 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1706);
    float _1716 = -_1704;
    float _1718 = _1716 + 1.0;
    float _1720 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1722 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1724 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1726 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1728 = -_1720;
    float _1730 = fma(_1728, _1692, 1.0);
    float _1732 = abs(_1718);
    float _1734 = log2(_1732);
    float _1736 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1724);
    float _1738 = fma(_1060, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1740 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1736);
    float _1742 = _1710 * _1662;
    float _1744 = _1710 * _1670;
    float _1746 = _1710 * _1666;
    float _1748 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1740);
    float _1750 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1752 = floor(_1738);
    float _1754 = -_1642;
    float _1756 = _1628 + _1754;
    float _1758 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1760 = -_1750;
    float _1762 = fma(_1744, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1760);
    float _1764 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1766 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1758);
    float _1768 = -_1746;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1762);
    float _1772 = log2(_1730);
    float _1774 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1766);
    float _1776 = fma(_1770, -0.5, 0.5);
    float _1778 = fma(_1770, 0.5, 0.5);
    float _1780 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1774);
    float _1782 = exp2(_1764);
    float _1784 = -_1752;
    float _1786 = _1738 + _1784;
    float _1788 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1726);
    float _1790 = fma(_1778, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1792 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1788);
    float _1794 = fma(_1778, _1790, -0.212114393711090087890625);
    float _1796 = 1.0 / _1748;
    float _1798 = _1744 + 1.0;
    float _1800 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1792);
    float _1802 = fma(_1778, _1794, 1.570728778839111328125);
    float _1804 = _1772 * 0.693147182464599609375;
    float _1806 = sqrt(_1776);
    float _1808 = -_1744;
    float _1810 = fma(_1782, _1798, _1808);
    float _1812 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1814 = fma(_1810, 0.5, 0.5);
    float _1816 = _1780 * _1796;
    float _1818 = _1800 * _1796;
    float _1820 = fma(_1816, 0.5, 0.5);
    float _1822 = fma(_1818, -0.5, 0.5);
    float _1824 = _1806 * 0.636619746685028076171875;
    float2 _5960 = float2(_1756, _1786);
    float _1826 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5960, float2(0.0), isnan(_5960)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5960, float2(0.0), isnan(_5960)), level(0.0)).x;
    float3 _5971 = float3(_1820, _1822, _1812);
    float _1828 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5971, float3(0.0), isnan(_5971)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5971, float3(0.0), isnan(_5971)), level(0.0)).x;
    float _1830 = -_1802;
    float _1832 = fma(_1824, _1830, 1.0);
    float3 _5987 = float3(_1820, _1822, _1812);
    float4 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5987, float3(0.0), isnan(_5987)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5987, float3(0.0), isnan(_5987)), level(0.0)).xyzw;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1835.w;
    float2 _6003 = float2(_1832, _1814);
    float3 _1847 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6003, float2(0.0), isnan(_6003)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6003, float2(0.0), isnan(_6003)), level(0.0)).xyz;
    float _1849 = _1847.x;
    float _1851 = _1847.y;
    float _1853 = _1847.z;
    float _1855 = float(uint(_482));
    float _1857 = trunc(_802);
    int _1859 = int(_1857);
    int _1861 = abs(_756);
    out.m_65.w = _882;
    bool _1863 = _478 > 0.5;
    float _1865 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_67.x = _1074;
    out.m_67.y = _1068;
    out.m_67.z = _1060;
    float _1867 = 1.0 / _1855;
    out.m_69.x = _962;
    out.m_71.x = _1392;
    out.m_71.y = _1390;
    out.m_71.z = _1394;
    float _1869 = float(uint(_1859));
    float _1871 = exp2(_1865);
    int _1873 = as_type<int>(_1867) + (-2);
    float _1875 = as_type<float>(_1873) * _1869;
    int _1877 = ~_482;
    int _1879 = _1877 + 1;
    float _1881 = -_1871;
    float _1883 = _1881 + 1.0;
    int _1885 = ~_482;
    int _1887 = _1885 + 1;
    float _1889 = trunc(_1875);
    float _1891 = precise::max(_1889, 0.0);
    uint _1894 = uint(_1891);
    int _1896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1898 = _1896 != 0;
    float _1900 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1902 = !_1898;
    float _1904 = _1902 ? 7.345489978790283203125 : 1.0;
    int _1906 = _1879 * int(_1894);
    int _1908 = _1906 + _1859;
    float _1910 = float(uint(_1908));
    float _1912 = as_type<float>(_1873) * _1910;
    float _1914 = _1904 * _476;
    int _1916 = ~_482;
    int _1918 = _1916 + 1;
    float _1920 = trunc(_1912);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    float _1926 = float(_112);
    float _1928 = float(_1859);
    float _1930 = floor(_1914);
    int _1932 = int(_1894) + int(_1924);
    float _1934 = 1.0 / _1926;
    bool _1936 = _1928 >= _504;
    bool _1938 = isnan(_1928);
    bool _1940 = _1936 || _1938;
    bool _1942 = isnan(_504);
    bool _1944 = _1940 || _1942;
    float _1946 = float(_1944);
    int _1948 = _1918 * _1932;
    int _1950 = _1948 + _1859;
    float _1952 = -_1930;
    float _1954 = _1914 + _1952;
    float _1956 = trunc(_1946);
    int _1958 = int(_1956);
    bool _1960 = uint(_1950) >= uint(_482);
    float _1962 = _1954 * _504;
    bool _1964 = !_1960;
    int _1966 = _1964 ? 0 : (-1);
    float _1968 = _636 * _1934;
    bool _1970 = _482 == 0;
    float _1972 = trunc(_1962);
    int _1974 = int(_1972);
    int _1976 = ~_1932;
    int _1978 = _1976 + _1966;
    int _1980 = _1978 + 1;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1984 = _1982 != 0;
    int _1986 = _482 * _1980;
    int _1988 = _1986 + _1859;
    int _1990 = ~_1958;
    int _1992 = _1990 + 1;
    int _1994 = _1992 + 1;
    float _1996 = trunc(_1968);
    int _1998 = int(_1996);
    bool _2000 = !_1984;
    int _2002 = _2000 ? 0 : 1;
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2006 = _2004 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2008 = !_1970;
    int _2010 = _2008 ? _1988 : (-1);
    int _2012 = _482 + (-1);
    int _2014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2016 = _2014 != 0;
    int _2018 = _2010 * _1994;
    int _2020 = abs(_744);
    float _2022 = 1.0 / _2006;
    int _2024 = abs(_2002);
    int _2026 = _1958 * _2012;
    int _2028 = _2026 + _2018;
    bool _2030 = !_2016;
    int _2032 = _2030 ? 0 : 1;
    int _2034 = _1974 * _2024;
    int _2036 = _2034 + _1859;
    int _2038 = abs(_750);
    int _2040 = _2028 * _2020;
    int _2042 = abs(_2032);
    int _2044 = _1998 * _2038;
    int _2046 = _2044 + _2040;
    int _2048 = ~_482;
    int _2050 = _2048 + 1;
    int _2052 = _2036 * _1861;
    int _2054 = _2052 + _2046;
    int _2056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2058 = _2056 != 0;
    int _2060 = _1974 * _2042;
    int _2062 = _2060 + _2054;
    int _2064 = ~_482;
    int _2066 = _2064 + 1;
    float _2068 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2070 = _2068 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2074 = _2072 != 0;
    float _2076 = float(uint(_2062));
    float _2078 = 1.0 / _2070;
    float _2080 = as_type<float>(_1873) * _2076;
    float _2082 = trunc(_2080);
    float _2084 = precise::max(_2082, 0.0);
    uint _2086 = uint(_2084);
    int _2088 = _2066 * int(_2086);
    int _2090 = _2088 + _2062;
    float _2092 = float(uint(_2090));
    float _2094 = as_type<float>(_1873) * _2092;
    float _2096 = trunc(_2094);
    float _2098 = precise::max(_2096, 0.0);
    uint _2100 = uint(_2098);
    int _2102 = int(_2086) + int(_2100);
    float _2104 = float(uint(_2036));
    int _2106 = ~_482;
    int _2108 = _2106 + 1;
    int _2110 = _2050 * _2102;
    int _2112 = _2110 + _2062;
    float _2114 = as_type<float>(_1873) * _2104;
    bool _2116 = uint(_2112) >= uint(_482);
    float _2118 = trunc(_2114);
    float _2120 = precise::max(_2118, 0.0);
    uint _2122 = uint(_2120);
    bool _2124 = !_2116;
    int _2126 = _2124 ? 0 : (-1);
    int _2128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2130 = _2128 != 0;
    float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2134 = _2132 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2136 = ~_2102;
    int _2138 = _2136 + _2126;
    int _2140 = _2138 + 1;
    float _2142 = in.m_73.y;
    float _2144 = _2134 * _2078;
    int _2146 = _482 * _2140;
    int _2148 = _2146 + _2062;
    int _2150 = _2108 * int(_2122);
    int _2152 = _2150 + _2036;
    bool _2154 = !_1970;
    int _2156 = _2154 ? _2148 : (-1);
    int _2158 = _2156 >> 31;
    float _2160 = float(uint(_2152));
    int _2162 = _2158 & 3;
    float _2164 = as_type<float>(_1873) * _2160;
    int _2166 = _2156 + _2162;
    float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2168;
    int _2172 = _2166 >> 2;
    float _2174 = trunc(_2164);
    float _2176 = precise::max(_2174, 0.0);
    uint _2178 = uint(_2176);
    float _2180 = _2170 * _2022;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    int _2182 = _2172 << 4;
    int _2184 = _2182 + 368;
    float _2186 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2188 = _458 + _2186;
    float _2190 = -_2142;
    float _2192 = _2190 + 1.0;
    int _2194 = _2156 & 3;
    bool _2196 = _2194 != 0;
    uint _2198 = uint(int(uint(_2184) >> uint(2)));
    uint _2200 = uint(int(uint(int(_2198)) >> uint(2)));
    int _2202 = int(_2198) & 3;
    float _2204 = (*spvDescriptorSet0.vp_c9)._m0[int(_2200)][_2202];
    int _2206 = int(_2198) + 1;
    uint _2208 = uint(int(uint(_2206) >> uint(2)));
    int _2210 = _2206 & 3;
    float _2212 = (*spvDescriptorSet0.vp_c9)._m0[int(_2208)][_2210];
    float _2214 = fma(_2180, _2188, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2216 = _2142;
    float _2218 = _1780;
    if (_2058)
    {
        float _2220 = _1863 ? _2192 : _2142;
        _2216 = _2220;
    }
    float _2222 = _2216;
    int _2224 = _2156 & 3;
    bool _2226 = _2224 != 0;
    float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2230 = _458 + _2228;
    bool _2232 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2234 = isnan(_458);
    bool _2236 = _2232 || _2234;
    bool _2238 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2240 = _2236 || _2238;
    float _2242 = float(_2240);
    bool _2244 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2246 = isnan(_458);
    bool _2248 = _2244 || _2246;
    bool _2250 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2252 = _2248 || _2250;
    float _2254 = float(_2252);
    float _2256 = fma(_2144, _2230, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2258 = uint(_2224) > 1u;
    float _2260 = -_2242;
    float _2262 = _2260 + 1.0;
    int _2264 = int(_2122) + int(_2178);
    float _2266 = -_2254;
    float _2268 = _2266 + 1.0;
    bool _2270 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2272 = isnan(_458);
    bool _2274 = _2270 || _2272;
    bool _2276 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2278 = _2274 || _2276;
    float _2280 = float(_2278);
    float _2282 = _2254 * _2262;
    float _2284 = as_type<float>(_2178);
    if (_2130)
    {
        float _2286 = in.m_55.x;
        _2284 = _2286;
    }
    float _2288 = _2284;
    int _2290 = _2184 + 8;
    uint _2292 = uint(int(uint(_2290) >> uint(2)));
    uint _2294 = uint(int(uint(int(_2292)) >> uint(2)));
    int _2296 = int(_2292) & 3;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[int(_2294)][_2296];
    int _2300 = int(_2292) + 1;
    uint _2302 = uint(int(uint(_2300) >> uint(2)));
    int _2304 = _2300 & 3;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[int(_2302)][_2304];
    int _2308 = _2196 ? 0 : 1;
    float _2310 = _2280 * _2268;
    float _2312 = -_2280;
    float _2314 = _2312 + 1.0;
    bool _2316 = _2224 != 3;
    int _2318 = _1887 * _2264;
    int _2320 = _2318 + _2036;
    float _2322 = _2214 * _2310;
    int _2324 = ~_2308;
    int _2326 = _2324 + 1;
    int _2328 = _2326 + 1;
    int _2330 = _2328;
    if (!_2258)
    {
        int _2332 = ~_2308;
        int _2334 = _2332 + 1;
        _2330 = _2334;
    }
    int _2336 = _2330;
    float _2338 = fma(_2314, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2322);
    bool _2340 = uint(_2224) >= 2u;
    int _2342 = abs(_2336);
    float _2344 = fma(_2256, _2282, _2338);
    bool _2346 = uint(_2320) >= uint(_482);
    float _2348 = -_1826;
    float _2350 = _2348 + 1.0;
    int _2352 = _2340 ? 0 : 1;
    float _2354 = _1900 * _1828;
    int _2356 = ~_2342;
    int _2358 = _2356 + 1;
    int _2360 = _2358 + 1;
    bool _2362 = _2288 > 0.5;
    bool _2364 = _2362 && _2130;
    bool _2366 = !_2346;
    int _2368 = _2366 ? 0 : (-1);
    bool _2370 = !_2226;
    int _2372 = _2370 ? 0 : 1;
    int _2374 = ~_2352;
    int _2376 = _2374 + 1;
    int _2378 = _2376 + 1;
    int _2380 = _2360 * as_type<int>(_2212);
    bool _2382 = _2224 != 3;
    float _2384 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2386 = int(_2384);
    int _2388 = _2378;
    if (_2316)
    {
        int _2390 = ~_2352;
        int _2392 = _2390 + 1;
        _2388 = _2392;
    }
    int _2394 = _2388;
    int _2396 = ~_2264;
    int _2398 = _2396 + _2368;
    int _2400 = _2398 + 1;
    int _2402 = abs(_2372);
    bool _2404 = !_2382;
    int _2406 = _2404 ? 0 : (-1);
    int _2408 = _482 * _2400;
    int _2410 = _2408 + _2036;
    int _2412 = abs(_2394);
    bool _2414 = !_2074;
    int _2416 = _2414 ? 0 : 1;
    int _2418 = ~_2402;
    int _2420 = _2418 + 1;
    int _2422 = _2420 + 1;
    int _2424 = abs(_2406);
    int _2426 = _2422 * as_type<int>(_2204);
    int _2428 = _2426 + _2380;
    int _2430 = abs(_2416);
    float _2432 = in.m_73.x;
    int _2434 = ~_2412;
    int _2436 = _2434 + 1;
    int _2438 = _2436 + 1;
    int _2440 = ~_2424;
    int _2442 = _2440 + 1;
    int _2444 = _2442 + 1;
    float _2446 = float(uint(_2386));
    int _2448 = _2438 * as_type<int>(_2298);
    int _2450 = _2448 + _2428;
    int _2452 = abs(_2386);
    float _2454 = fma(_2242, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2344);
    int _2456 = _2444 * as_type<int>(_2306);
    int _2458 = _2456 + _2450;
    float _2460 = 1.0 / _2446;
    int _2462 = ~_2430;
    int _2464 = _2462 + 1;
    int _2466 = _2464 + 1;
    float _2468 = _978 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2470 = float(uint(_2452));
    float _2472 = _978 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2474 = !_1970;
    int _2476 = _2474 ? _2410 : (-1);
    int _2478 = _2458 * _2466;
    float _2480 = _978 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2482 = 1.0 / _2470;
    int _2484 = _2476 * _2430;
    int _2486 = _2484 + _2478;
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2490 = _2454 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2492 = float(uint(_2486));
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2496 = as_type<int>(_2460) + (-2);
    float _2498 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2500 = abs(_2486);
    float _2502 = _2494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2504 = _2488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2506 = as_type<float>(_2496) * _2492;
    float _2508 = float(uint(_2500));
    float _2510 = _2498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2512 = as_type<int>(_2482) + (-2);
    float _2514 = -_968;
    float _2516 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2468);
    float _2518 = -_968;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2472);
    float _2522 = trunc(_2506);
    float _2524 = precise::max(_2522, 0.0);
    uint _2526 = uint(_2524);
    float _2528 = -_968;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2480);
    float _2532 = as_type<float>(_2512) * _2508;
    int _2534 = ~_2386;
    int _2536 = _2534 + 1;
    out.m_77.x = _2502;
    out.m_77.y = _2504;
    out.m_77.z = _2510;
    out.m_77.w = _2490;
    float _2538 = as_type<float>(_2410);
    float _2540 = _2432;
    if (_2130)
    {
        _2538 = _2432;
    }
    float _2542 = _2538;
    bool _2544 = _752 != 0.0;
    bool _2546 = isnan(_752);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan(0.0);
    bool _2552 = _2548 || _2550;
    float _2554 = trunc(_2532);
    float _2556 = precise::max(_2554, 0.0);
    uint _2558 = uint(_2556);
    float _2560 = in.m_79.x;
    float _2562 = in.m_79.y;
    float _2564 = in.m_79.z;
    int _2566 = ~_2452;
    int _2568 = _2566 + 1;
    float _2570 = _2542;
    if (_2364)
    {
        float _2572 = -_2542;
        float _2574 = _2572 + 1.0;
        _2570 = _2574;
    }
    float _2576 = _2570;
    bool _2578 = _892 == 0.0;
    bool _2580 = !_2552;
    bool _2582 = _2578 && _2580;
    bool _2584 = _758 == 0.0;
    bool _2586 = _2584 && _2582;
    float _2588 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2520);
    if (_2130)
    {
        _2540 = _2576;
    }
    float _2590 = _2540;
    float _2592 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2516);
    float _2594 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2530);
    int _2596 = _2536 * int(_2526);
    int _2598 = _2596 + _2486;
    float _2600 = _988 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2602 = _2568 * int(_2558);
    int _2604 = _2602 + _2500;
    float _2606 = _988 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2608 = _988 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2610 = float(uint(_2598));
    float _2612 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2600);
    float _2614 = float(uint(_2604));
    float _2616 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2606);
    float _2618 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2608);
    float _2620 = as_type<float>(_2496) * _2610;
    float _2622 = abs(_1404);
    float _2624 = log2(_2622);
    float _2626 = as_type<float>(_2512) * _2614;
    float _2628 = _2562;
    float _2630 = _2560;
    float _2632 = _2564;
    if (!_2586)
    {
        float _2634 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2562);
        _2628 = _2634;
    }
    float _2636 = _2628;
    float _2638 = _998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_2586)
    {
        float _2640 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2560);
        _2630 = _2640;
    }
    float _2642 = _2630;
    if (!_2586)
    {
        float _2644 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2564);
        _2632 = _2644;
    }
    float _2646 = _2632;
    float _2648 = _2592 * _2636;
    float _2650 = _2588 * _2636;
    float _2652 = trunc(_2620);
    float _2654 = precise::max(_2652, 0.0);
    uint _2656 = uint(_2654);
    float _2658 = _2594 * _2636;
    int _2660 = ~_2386;
    int _2662 = _2660 + 1;
    float _2664 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2638);
    float _2666 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2616);
    float _2668 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2612);
    float _2670 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2618);
    float _2672 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2664);
    float _2674 = trunc(_2626);
    float _2676 = precise::max(_2674, 0.0);
    uint _2678 = uint(_2676);
    float _2680 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2682 = fma(_2666, _2642, _2650);
    float _2684 = fma(_2670, _2642, _2658);
    bool _2686 = _1404 <= 8000.0;
    bool _2688 = isnan(_1404);
    bool _2690 = _2686 || _2688;
    bool _2692 = isnan(8000.0);
    bool _2694 = _2690 || _2692;
    float _2696 = float(_2694);
    float _2698 = _998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2700 = fma(_2672, _2646, _2682);
    float _2702 = _998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2704 = int(_2526) + int(_2656);
    float _2706 = exp2(_2680);
    int _2708 = ~_2452;
    int _2710 = _2708 + 1;
    float _2712 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2698);
    float _2714 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2702);
    int _2716 = _2662 * _2704;
    int _2718 = _2716 + _2486;
    float _2720 = fma(_2668, _2642, _2648);
    float _2722 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2712);
    int _2724 = int(_2558) + int(_2678);
    float _2726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2728 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2714);
    bool _2730 = uint(_2718) >= uint(_2386);
    float _2732 = _1853 * _2354;
    int _2734 = _2710 * _2724;
    int _2736 = _2734 + _2500;
    int _2738 = _2486 ^ _2386;
    float _2740 = fma(_2722, _2646, _2720);
    bool _2742 = !_2730;
    int _2744 = _2742 ? 0 : (-1);
    float _2746 = fma(_2706, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2748 = precise::clamp(_2746, 0.0, 1.0);
    bool _2750 = uint(_2736) >= uint(_2452);
    float _2752 = fma(_2728, _2646, _2684);
    uint _2754 = uint(int(uint(_2738) >> uint(31)));
    bool _2756 = !_2750;
    int _2758 = _2756 ? 0 : (-1);
    float _2760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2762 = ~_2704;
    int _2764 = _2762 + _2744;
    int _2766 = _2764 + 1;
    out.m_81.x = _2740;
    out.m_81.y = _2700;
    out.m_81.z = _2752;
    int _2768 = ~_2758;
    int _2770 = _2724 + _2768;
    int _2772 = _2770 + 1;
    int _2774 = ~int(_2754);
    int _2776 = _2774 + 1;
    int _2778 = _2386 * _2766;
    int _2780 = _2778 + _2486;
    float _2782 = _2748 * _2748;
    int _2784 = _2772 ^ _2776;
    bool _2786 = _2386 == 0;
    float _2788 = fma(_2748, -2.0, 3.0);
    float _2790 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2792 = _2386 == 0;
    int _2794 = ~_2776;
    int _2796 = _2794 + _2784;
    int _2798 = _2796 + 1;
    float _2800 = _2782 * _2788;
    float _2802 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2790);
    bool _2804 = !_2786;
    int _2806 = _2804 ? _2780 : (-1);
    float _2808 = _2726 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2810 = !_2792;
    int _2812 = _2810 ? _2798 : (-1);
    float _2814 = -_2800;
    float _2816 = _2814 + 1.0;
    float _2818 = float(_2806);
    float _2820 = _2760 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2822 = float(_2812);
    float _2824 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2802);
    float _2826 = fma(_2808, _2590, -0.5);
    float _2828 = fma(_2808, _2818, _624);
    float _2830 = fma(_2816, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2800);
    float _2832 = -_650;
    float _2834 = fma(_2820, _2822, _2832);
    float _2836 = fma(_2820, _2222, -0.5);
    float _2838 = in.m_83.x;
    float _2840 = _2696 * _2830;
    float _2842 = fma(_644, _2826, _2828);
    float _2844 = fma(_810, _2836, _2834);
    float _2846 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2824);
    float _2848 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2850 = _1780 + _1748;
    float _2852 = _1748 * 0.5;
    float _2854 = _2846 + _1748;
    float _2856 = _2844 + 0.5;
    float _2858 = _2350 * _2848;
    float _2860 = precise::clamp(_2858, 0.0, 1.0);
    float _2862 = _2854 * 0.5;
    float _2864 = _2850 * 0.5;
    float _2866 = fma(_1800, -0.5, _2852);
    float _2868 = -_2860;
    float _2870 = fma(_2868, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2872 = _1843 * _2354;
    float _2874 = _2842 + 0.5;
    float _2876 = fma(_1843, _2732, _1841);
    out.m_85.x = _2864;
    out.m_85.y = _2866;
    out.m_85.z = _2862;
    out.m_85.w = _1748;
    float _2878 = fma(_1849, _2872, _1837);
    float _2880 = fma(_1851, _2872, _1839);
    bool _2882 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2884 = isnan(_1546);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2890 = _2886 || _2888;
    float _2892 = _2870 * _2838;
    out.m_87.x = _2874;
    out.m_87.y = _2856;
    float _2894 = _2892 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _1780;
    out.gl_Position.y = _1800;
    out.gl_Position.z = _2846;
    out.gl_Position.w = _1748;
    out.m_89.x = _2894;
    float _2896 = -_1900;
    float _2898 = _2896 + 1.0;
    float _2900 = _2872;
    float _2902 = _1748;
    float _2904 = _2862;
    float _2906 = _2866;
    if (!_2890)
    {
        _2900 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2908 = _2900;
    float _2910 = _1843 * _2898;
    float _2912 = _1458 * _1512;
    float _2914 = _2912;
    float _2916 = _2908;
    float _2918 = _2908;
    if (!_2890)
    {
        _2902 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2920 = _2902;
    float _2922 = _2920;
    float _2924 = _2920;
    if (!_2890)
    {
        _2904 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2926 = _2904;
    out.m_91.x = _2878;
    out.m_91.y = _2880;
    out.m_91.z = _2876;
    out.m_91.w = _2910;
    float _2928 = _2912 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2930 = _2926;
    float _2932 = _2926;
    if (!_2890)
    {
        _2218 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2934 = _2218;
    float _2936 = _2934;
    float _2938 = _2934;
    if (!_2890)
    {
        _2906 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2940 = _2906;
    float _2942 = _2940;
    float _2944 = _2940;
    if (!_2890)
    {
        _2914 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2946 = _2914;
    bool _2948 = !_2890;
    float _2950 = _2946;
    float _2952 = _2946;
    if (!_2948)
    {
        bool _2954 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2956 = isnan(_1546);
        bool _2958 = _2954 || _2956;
        bool _2960 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2962 = _2958 || _2960;
        if (!_2962)
        {
            float _2964 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2966 = _1546 + _2964;
            float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2970 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2968;
            float _2972 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2974 = _2972 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2976 = 1.0 / _2970;
            float _2978 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2982 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2986 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2988 = _2986 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2990 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2992 = _2990 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2994 = _2966 * _2976;
            float _2996 = precise::clamp(_2994, 0.0, 1.0);
            float _2998 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3000 = _2998 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3002 = fma(_2996, _2974, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3004 = fma(_2996, _3000, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3006 = fma(_2996, _2980, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3008 = fma(_2996, _2984, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3010 = fma(_2996, _2988, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3012 = fma(_2996, _2992, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2938 = _3006;
            _2944 = _3010;
            _2918 = _3002;
            _2932 = _3008;
            _2924 = _3004;
            _2952 = _3012;
            _3014 = true;
        }
        else
        {
            bool _3016 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3018 = isnan(_1546);
            bool _3020 = _3016 || _3018;
            bool _3022 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3024 = _3020 || _3022;
            if (!_3024)
            {
                _2916 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3026 = _2916;
            _2918 = _3026;
            if (!_3024)
            {
                _2936 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3028 = _2936;
            _2938 = _3028;
            if (!_3024)
            {
                _2922 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3030 = _2922;
            _2924 = _3030;
            if (!_3024)
            {
                _2930 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3032 = _2930;
            _2932 = _3032;
            if (!_3024)
            {
                _2942 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3034 = _2942;
            _2944 = _3034;
            if (!_3024)
            {
                _2950 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3036 = _2950;
            bool _3038 = !_3024;
            _2952 = _3036;
            if (!_3038)
            {
                bool _3040 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3042 = isnan(_1546);
                bool _3044 = _3040 || _3042;
                bool _3046 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3048 = _3044 || _3046;
                if (!_3048)
                {
                    float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3052 = _1546 + _3050;
                    float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3056 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3054;
                    float _3058 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3062 = 1.0 / _3056;
                    float _3064 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3066 = _3064 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3068 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3070 = _3068 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3072 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3074 = _3072 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3076 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3078 = _3076 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3080 = _3052 * _3062;
                    float _3082 = precise::clamp(_3080, 0.0, 1.0);
                    float _3084 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3086 = _3084 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3088 = fma(_3082, _3060, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3090 = fma(_3082, _3086, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3092 = fma(_3082, _3066, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3094 = fma(_3082, _3070, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3096 = fma(_3082, _3074, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3098 = fma(_3082, _3078, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2938 = _3092;
                    _2944 = _3096;
                    _2918 = _3088;
                    _2932 = _3094;
                    _2924 = _3090;
                    _2952 = _3098;
                    _3014 = true;
                }
                else
                {
                    _2938 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2944 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2918 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2932 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2924 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2952 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3014 = false;
    float _3100 = _2938;
    float _3102 = _2944;
    float _3104 = _2918;
    float _3106 = _2932;
    float _3108 = _2924;
    float _3110 = _2952;
    float _3112 = fma(_2700, -0.5, 0.5);
    float _3114 = precise::clamp(_3112, 0.0, 1.0);
    float _3116 = -_3100;
    float _3118 = _3116 + _3102;
    float _3120 = _2928 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3122 = -_3104;
    float _3124 = _3122 + _3106;
    float _3126 = fma(_3114, _3118, _3100);
    out.m_93.x = 0.0;
    float _3128 = -_3108;
    float _3130 = _3128 + _3110;
    float _3132 = fma(_3114, _3124, _3104);
    float _3134 = _3126 * 0.586610972881317138671875;
    out.m_49.x = _3120;
    bool _3136 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3138 = fma(_3114, _3130, _3108);
    float _3140 = fma(_3132, 0.298911988735198974609375, _3134);
    bool _3142 = _1458 > 0.0;
    bool _3144 = isnan(_1458);
    bool _3146 = _3142 || _3144;
    bool _3148 = isnan(0.0);
    bool _3150 = _3146 || _3148;
    float _3152 = fma(_3138, 0.114477999508380889892578125, _3140);
    bool _3154 = _1512 <= 0.0;
    bool _3156 = !_3150;
    bool _3158 = _3154 || _3156;
    float _3160 = -_3152;
    float _3162 = _3132 + _3160;
    float _3164 = -_3152;
    float _3166 = _3126 + _3164;
    float _3168 = -_3152;
    float _3170 = _3138 + _3168;
    float _3172 = fma(_3162, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3152);
    float _3174 = fma(_3166, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3152);
    float _3176 = fma(_3170, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3152);
    bool _3178 = !_3136;
    if (!_3178)
    {
        float _3180 = -_1390;
        float _3182 = _3180 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3184 = -_1392;
        float _3186 = _3184 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3188 = -_1394;
        float _3190 = _3188 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3192 = _3182 * _3182;
        float _3194 = fma(_3186, _3186, _3192);
        float _3196 = fma(_3190, _3190, _3194);
        float _3198 = sqrt(_3196);
        float _3200 = rsqrt(_3196);
        float _3202 = -_3198;
        float _3204 = _3202 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3206 = _3204 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3208 = precise::clamp(_3206, 0.0, 1.0);
        float _3210 = _3186 * _3200;
        float _3212 = _3182 * _3200;
        float _3214 = abs(_3208);
        float _3216 = log2(_3214);
        float _3218 = _3190 * _3200;
        float _3220 = _3210 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3222 = _2700 * _3212;
        float _3224 = -_3212;
        float _3226 = -_3220;
        float _3228 = fma(_3224, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3226);
        float _3230 = fma(_2740, _3210, _3222);
        float _3232 = -_3218;
        float _3234 = fma(_3232, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3228);
        float _3236 = fma(_2752, _3218, _3230);
        float _3238 = precise::clamp(_3236, 0.0, 1.0);
        float _3240 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3242 = _3234 + _3240;
        float _3244 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3246 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3248 = precise::clamp(_3246, 0.0, 1.0);
        float _3250 = exp2(_3244);
        float _3252 = _3250 * _3248;
        float _3254 = _3238 * _3252;
        float _3256 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3258 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3260 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3256;
        out.m_93.y = _3258;
        out.m_93.z = _3260;
    }
    out.m_65.x = _3172;
    out.m_65.y = _3174;
    out.m_65.z = _3176;
    if (!_3158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3262 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3262;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3014 = false;
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
        float _3319 = as_type<float>(_128);
        out.gl_Position.z = _3319;
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
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3389 = as_type<float>(_166);
        out.gl_Position.z = _3389;
    }
    if (_158)
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
    float _410 = _408 * _400;
    float _412 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[115].x, _410);
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _420 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[116].x, _412);
    float _422 = _414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _424 = _416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _428 = _420 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _422;
    out.m_59.y = _424;
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
    float _466 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _468 = log2(_466);
    float _470 = _322 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _472 = in.m_55.z;
    float _474 = _324 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _476 = in.m_55.x;
    float _478 = in.m_55.y;
    float _480 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _482 = int(_480);
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _488 = in.m_61.x;
    float _490 = in.m_61.y;
    float _492 = in.m_61.z;
    float _494 = _468 * _146;
    float _496 = exp2(_494);
    float _498 = _462 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _500 = _462 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _502 = _462 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _504 = float(_482);
    float _506 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[5].x, _498);
    float _508 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[4].x, _500);
    float _510 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[6].x, _502);
    float _512 = _472 * 2.0;
    float _514 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[5].z, _506);
    float _516 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[4].z, _508);
    float _518 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[6].z, _510);
    float _520 = _476 * 2.0;
    float _522 = _514 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _524 = _516 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _526 = _518 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _528 = floor(_512);
    float _530 = -_522;
    float _532 = _530 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _534 = -_524;
    float _536 = _534 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _538 = _478 * 2.0;
    float _540 = _532 * _532;
    float _542 = -_496;
    float _544 = _542 + 1.0;
    float _546 = floor(_520);
    float _548 = fma(_536, _536, _540);
    float _550 = -_526;
    float _552 = _550 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _556 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[78].z, _484);
    float _558 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[78].w, _486);
    float _560 = fma(_552, _552, _548);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _564 = floor(_538);
    float _566 = _476 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _568 = _478 + _476;
    bool _570 = _528 > 0.0;
    float _572 = _478 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _574 = -_562;
    float _576 = fma(_566, 2.0, _574);
    float _578 = _478 + _472;
    bool _580 = _528 >= 0.0;
    bool _582 = isnan(_528);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = sqrt(_560);
    float _592 = _568 + (-1.0);
    bool _594 = _546 > 0.0;
    float _596 = fma(_572, -2.0, _554);
    float _598 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _600 = _578 + (-1.0);
    int _602 = _588 ? 0 : 1;
    float _604 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _606 = int(_604);
    bool _608 = _564 > 0.0;
    float _610 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _612 = _546 >= 0.0;
    bool _614 = isnan(_546);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    float _622 = -_146;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[76].x, _576);
    bool _626 = _564 >= 0.0;
    bool _628 = isnan(_564);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = _504 * _146;
    int _638 = ~_602;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    float _644 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _556);
    float _646 = abs(_590);
    float _648 = precise::max(_646, 200.0);
    float _650 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _596);
    int _652 = _642;
    if (!_570)
    {
        int _654 = ~_602;
        int _656 = _654 + 1;
        _652 = _656;
    }
    int _658 = _652;
    int _660 = _620 ? 0 : 1;
    int _662 = _634 ? 0 : 1;
    bool _664 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _666 = isnan(0.0);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _672 = _668 || _670;
    float _674 = precise::min(_648, 300.0);
    int _676 = ~_660;
    int _678 = _676 + 1;
    int _680 = _678 + 1;
    int _682 = ~_662;
    int _684 = _682 + 1;
    int _686 = _684 + 1;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _690 = _688 != 0;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _694 = _692 != 0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _698 = _696 != 0;
    int _700 = _680;
    int _702 = _686;
    if (!_594)
    {
        int _704 = ~_660;
        int _706 = _704 + 1;
        _700 = _706;
    }
    int _708 = _700;
    float _710 = fma(_674, 0.00999999977648258209228515625, -2.0);
    if (!_608)
    {
        int _712 = ~_662;
        int _714 = _712 + 1;
        _702 = _714;
    }
    int _716 = _702;
    float _718 = fma(_674, 0.00999999977648258209228515625, -1.0);
    float _720 = float(_606);
    float _722 = -_710;
    float _724 = _522 + _722;
    bool _726 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _728 = isnan(1.0);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _734 = _730 || _732;
    float _736 = in.m_63.x;
    float _738 = in.m_63.y;
    float _740 = in.m_63.z;
    bool _742 = !_694;
    int _744 = _742 ? 0 : 1;
    float _746 = 1.0 / _720;
    bool _748 = !_690;
    int _750 = _748 ? 0 : 1;
    float _752 = _718 * _490;
    bool _754 = !_698;
    int _756 = _754 ? 0 : 1;
    float _758 = _718 * _492;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _770 = _768 != 0;
    float _772 = _672 ? _544 : 0.0;
    float _774 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _776 = _724 + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _780 = 1.0 + _778;
    bool _782 = !_766;
    int _784 = _782 ? 0 : 1;
    bool _786 = !_770;
    int _788 = _786 ? 0 : 1;
    float _790 = 1.0 / _780;
    int _792 = abs(_784);
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _796 = _524 + _794;
    float _798 = _776 * _776;
    int _800 = abs(_788);
    float _802 = _746 * _146;
    float _804 = float(_708);
    float _806 = fma(_796, _796, _798);
    float _808 = float(_792);
    float _810 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _558);
    bool _812 = !_762;
    int _814 = _812 ? 0 : 1;
    float _816 = float(_716);
    float _818 = _808 * _804;
    int _820 = abs(_814);
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _824 = _526 + _822;
    if (_734)
    {
        float _826 = _772 * _790;
        _148 = _826;
    }
    float _828 = _148;
    float _830 = _818 * (-2.0);
    float _832 = float(_820);
    float _834 = fma(_824, _824, _806);
    float _836 = float(_658);
    float _838 = fma(_830, _738, _738);
    float _840 = float(_800);
    float _842 = sqrt(_834);
    float _844 = fma(_610, _830, _610);
    float _846 = _832 * _836;
    float _848 = _476 + (-0.5);
    float _850 = _840 * _816;
    float _852 = _478 + (-0.5);
    float _854 = _846 * (-2.0);
    float _856 = _320 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _858 = _850 * (-2.0);
    float _860 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[196].y, _838);
    float _862 = fma(_854, _736, _736);
    float _864 = _856 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _866 = rsqrt(_834);
    float _868 = fma(_844, _828, _860);
    float _870 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[196].x, _862);
    float _872 = _472 + _476;
    float _874 = _842 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _876 = fma(_598, _854, _598);
    float _878 = _872 + (-1.0);
    float _880 = _472 + (-0.5);
    float _882 = precise::min(_864, _874);
    float _884 = fma(_858, _740, _740);
    float _886 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _888 = fma(_876, _828, _870);
    float _890 = _868 * 0.15915493667125701904296875;
    float _892 = _718 * _488;
    float _894 = fma(_886, _858, _886);
    float _896 = _866 * _882;
    float _898 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[196].z, _884);
    float _900 = _888 * 0.15915493667125701904296875;
    float _902 = _890 * 6.283185482025146484375;
    float _904 = sin(_902);
    float _906 = _776 * _896;
    float _908 = _796 * _896;
    float _910 = fma(_894, _828, _898);
    float _912 = _824 * _896;
    float _914 = -_906;
    float _916 = _776 + _914;
    float _918 = -_908;
    float _920 = _796 + _918;
    float _922 = _910 * 0.15915493667125701904296875;
    float _924 = -_912;
    float _926 = _824 + _924;
    float _928 = _916 * _916;
    float _930 = _900 * 6.283185482025146484375;
    float _932 = sin(_930);
    float _934 = fma(_920, _920, _928);
    float _936 = fma(_926, _926, _934);
    float _938 = _890 * 6.283185482025146484375;
    float _940 = cos(_938);
    float _942 = sqrt(_936);
    float _944 = _932 * _904;
    float _946 = _900 * 6.283185482025146484375;
    float _948 = cos(_946);
    float _950 = _932 * _940;
    float _952 = _922 * 6.283185482025146484375;
    float _954 = cos(_952);
    float _956 = _866 * _942;
    float _958 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _892);
    float _960 = _470 * _956;
    float _962 = _856 * _956;
    float _964 = _474 * _956;
    float _966 = _922 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = _948 * _940;
    float _972 = _948 * _904;
    float _974 = _932 * _954;
    float _976 = _940 * _954;
    float _978 = _948 * _954;
    float _980 = _904 * _954;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _752);
    float _984 = _960 * _982;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _758);
    float _988 = fma(_968, _970, _944);
    float _990 = _962 * _958;
    float _992 = _978 * _984;
    float _994 = _964 * _986;
    float _996 = -_950;
    float _998 = fma(_968, _972, _996);
    float _1000 = -_984;
    float _1002 = _968 * _1000;
    float _1004 = fma(_988, _990, _992);
    float _1006 = -_972;
    float _1008 = fma(_968, _950, _1006);
    float _1010 = _974 * _984;
    float _1012 = fma(_976, _990, _1002);
    float _1014 = fma(_998, _994, _1004);
    float _1016 = fma(_968, _944, _970);
    float _1018 = fma(_1008, _990, _1010);
    float _1020 = fma(_980, _994, _1012);
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1026 = fma(_1016, _994, _1018);
    float _1028 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1022);
    float _1030 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1024);
    float _1032 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1028);
    float _1034 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1030);
    float _1036 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1038 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1040 = _526 + _1036;
    float _1042 = _524 + _1038;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1046 = _1040 + _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1050 = _1042 + _1048;
    float _1052 = _1046 * _1046;
    float _1054 = fma(_1050, _1050, _1052);
    float _1056 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1058 = -_912;
    float _1060 = _526 + _1058;
    float _1062 = sqrt(_1054);
    float _1064 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1056);
    float _1066 = -_906;
    float _1068 = _724 + _1066;
    float _1070 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1064);
    float _1072 = -_908;
    float _1074 = _524 + _1072;
    float _1076 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1078 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1080 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1076);
    float _1082 = _724 + _1078;
    float _1084 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1080);
    bool _1086 = _1062 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1088 = _1070;
    float _1090 = _1078;
    float _1092 = _1080;
    float _1094 = _912;
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
        float _1114 = _1062 + _1112;
        float _1116 = rsqrt(_1054);
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
        float _1142 = fma(_1050, _1138, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1144 = fma(_1046, _1138, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1108 = _1140;
        _1098 = _1142;
        _1102 = _1144;
    }
    float _1146 = _1108;
    float _1148 = _1098;
    float _1150 = _1102;
    float _1152 = -_724;
    float _1154 = _1152 + _1146;
    float _1156 = -_524;
    float _1158 = _1156 + _1148;
    float _1160 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1162 = -_526;
    float _1164 = _1162 + _1150;
    float _1166 = _1154 * _1154;
    float _1168 = 1.0 / _1160;
    float _1170 = -_908;
    float _1172 = _1170 + _1148;
    float _1174 = fma(_1158, _1158, _1166);
    float _1176 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1178 = -_906;
    float _1180 = _1178 + _1146;
    float _1182 = -_912;
    float _1184 = _1182 + _1150;
    float _1186 = fma(_1164, _1164, _1174);
    float _1188 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1176);
    bool _1190 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1192 = isnan(0.5);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1198 = _1194 || _1196;
    float _1200 = sqrt(_1186);
    float _1202 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1188);
    bool _1204 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1206 = isnan(0.5);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1212 = _1208 || _1210;
    float _1214 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1216 = _1214 + _1160;
    float _1218 = _1216 * _1168;
    float _1220 = _1218 * 0.5;
    bool _1222 = _1200 > 0.0;
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1226 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1224);
    float _1228 = 1.0 / _1226;
    float _1230 = _1200;
    float _1232 = _1172;
    float _1234 = _1146;
    float _1236 = _1160;
    float _1238 = _1226;
    float _1240 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1242 = _1184;
    if (!_1222)
    {
        _1230 = _1180;
    }
    float _1244 = _1230;
    float _1246 = _1244;
    if (!_1222)
    {
        _1094 = _1184;
    }
    float _1248 = _1094;
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
            _1272 = _1180;
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
            float _1302 = fma(_188, _1300, _1172);
            float _1304 = fma(_190, _1300, _1180);
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
    if (_1198)
    {
        _196 = _1308;
    }
    float _1328 = _196;
    float _1330 = _1328;
    if (_1198)
    {
        _198 = _1310;
    }
    float _1332 = _198;
    float _1334 = _1332;
    if (_1198)
    {
        _200 = _1312;
    }
    float _1336 = _200;
    float _1338 = _1336;
    if (!_1198)
    {
        float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1342 = _1068 + _1340;
        float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1346 = _1074 + _1344;
        float _1348 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1350 = -_1074;
        float _1352 = _1350 + _1308;
        float _1354 = _1342 * _1342;
        float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1358 = _1060 + _1356;
        float _1360 = -_1068;
        float _1362 = _1360 + _1310;
        float _1364 = -_1060;
        float _1366 = _1364 + _1312;
        float _1368 = fma(_1346, _1346, _1354);
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1372 = fma(_1358, _1358, _1368);
        float _1374 = sqrt(_1372);
        float _1376 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1378 = precise::min(_1374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1380 = _1378 * _1370;
        float _1382 = _1376 * _1380;
        float _1384 = fma(_1352, _1382, _1074);
        float _1386 = fma(_1362, _1382, _1068);
        float _1388 = fma(_1366, _1382, _1060);
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
    float _1538 = fma(_1524, _1524, _1534);
    float _1540 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1536);
    float _1542 = rsqrt(_1538);
    float _1544 = _1540 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1546 = sqrt(_1538);
    float _1548 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
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
    float _1628 = fma(_1074, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1630 = _1604;
    float _1632 = _1626;
    if (_1562)
    {
        float _1634 = fma(_1604, _1626, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1322 = _1634;
    }
    float _1636 = _1322;
    float _1638 = _1636;
    if (!_1562)
    {
        _1630 = _1622;
    }
    float _1640 = _1630;
    float _1642 = floor(_1628);
    float _1644 = _1640;
    float _1646 = _1616;
    if (_1562)
    {
        float _1648 = _1616 + (-1.0);
        _1632 = _1648;
    }
    float _1650 = _1632;
    if (_1562)
    {
        float _1652 = _1586 * _1636;
        _1638 = _1652;
    }
    float _1654 = _1638;
    if (_1562)
    {
        float _1656 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1588 = _1656;
    }
    float _1658 = _1588;
    if (_1562)
    {
        float _1660 = _1550 * _1654;
        _1574 = _1660;
    }
    float _1662 = _1574;
    if (_1562)
    {
        float _1664 = _1552 * _1654;
        _1576 = _1664;
    }
    float _1666 = _1576;
    if (_1562)
    {
        float _1668 = fma(_1622, _1616, _1658);
        _1644 = _1668;
    }
    float _1670 = _1644;
    if (_1562)
    {
        float _1672 = _1662 * _1662;
        _1578 = _1672;
    }
    float _1674 = _1578;
    if (!_1562)
    {
        _1646 = _1556;
    }
    float _1676 = _1646;
    float _1678 = _1676;
    if (_1562)
    {
        float _1680 = _1666 * _1666;
        _1678 = _1680;
    }
    float _1682 = _1678;
    float _1684 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1686 = fma(_1670, _1670, _1674);
    float _1688 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1684);
    float _1690 = _1686 + _1682;
    float _1692 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1694 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1696 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1688);
    float _1698 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1532);
    float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1702 = fma(_1546, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1700);
    float _1704 = precise::clamp(_1702, 0.0, 1.0);
    float _1706 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1694);
    float _1708 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1710 = rsqrt(_1690);
    float _1712 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1714 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1706);
    float _1716 = -_1704;
    float _1718 = _1716 + 1.0;
    float _1720 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1722 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1724 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1726 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1728 = -_1720;
    float _1730 = fma(_1728, _1692, 1.0);
    float _1732 = abs(_1718);
    float _1734 = log2(_1732);
    float _1736 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1724);
    float _1738 = fma(_1060, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1740 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1736);
    float _1742 = _1710 * _1662;
    float _1744 = _1710 * _1670;
    float _1746 = _1710 * _1666;
    float _1748 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1740);
    float _1750 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1752 = floor(_1738);
    float _1754 = -_1642;
    float _1756 = _1628 + _1754;
    float _1758 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1760 = -_1750;
    float _1762 = fma(_1744, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1760);
    float _1764 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1766 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1758);
    float _1768 = -_1746;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1762);
    float _1772 = log2(_1730);
    float _1774 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1766);
    float _1776 = fma(_1770, -0.5, 0.5);
    float _1778 = fma(_1770, 0.5, 0.5);
    float _1780 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1774);
    float _1782 = exp2(_1764);
    float _1784 = -_1752;
    float _1786 = _1738 + _1784;
    float _1788 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1726);
    float _1790 = fma(_1778, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1792 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1788);
    float _1794 = fma(_1778, _1790, -0.212114393711090087890625);
    float _1796 = 1.0 / _1748;
    float _1798 = _1744 + 1.0;
    float _1800 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1792);
    float _1802 = fma(_1778, _1794, 1.570728778839111328125);
    float _1804 = _1772 * 0.693147182464599609375;
    float _1806 = sqrt(_1776);
    float _1808 = -_1744;
    float _1810 = fma(_1782, _1798, _1808);
    float _1812 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1814 = fma(_1810, 0.5, 0.5);
    float _1816 = _1780 * _1796;
    float _1818 = _1800 * _1796;
    float _1820 = fma(_1816, 0.5, 0.5);
    float _1822 = fma(_1818, -0.5, 0.5);
    float _1824 = _1806 * 0.636619746685028076171875;
    float2 _5960 = float2(_1756, _1786);
    float _1826 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5960, float2(0.0), isnan(_5960)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5960, float2(0.0), isnan(_5960)), level(0.0)).x;
    float3 _5971 = float3(_1820, _1822, _1812);
    float _1828 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5971, float3(0.0), isnan(_5971)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5971, float3(0.0), isnan(_5971)), level(0.0)).x;
    float _1830 = -_1802;
    float _1832 = fma(_1824, _1830, 1.0);
    float3 _5987 = float3(_1820, _1822, _1812);
    float4 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5987, float3(0.0), isnan(_5987)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5987, float3(0.0), isnan(_5987)), level(0.0)).xyzw;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1835.w;
    float2 _6003 = float2(_1832, _1814);
    float3 _1847 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6003, float2(0.0), isnan(_6003)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6003, float2(0.0), isnan(_6003)), level(0.0)).xyz;
    float _1849 = _1847.x;
    float _1851 = _1847.y;
    float _1853 = _1847.z;
    float _1855 = float(uint(_482));
    float _1857 = trunc(_802);
    int _1859 = int(_1857);
    int _1861 = abs(_756);
    out.m_65.w = _882;
    bool _1863 = _478 > 0.5;
    float _1865 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_67.x = _1074;
    out.m_67.y = _1068;
    out.m_67.z = _1060;
    float _1867 = 1.0 / _1855;
    out.m_69.x = _962;
    out.m_71.x = _1392;
    out.m_71.y = _1390;
    out.m_71.z = _1394;
    float _1869 = float(uint(_1859));
    float _1871 = exp2(_1865);
    int _1873 = as_type<int>(_1867) + (-2);
    float _1875 = as_type<float>(_1873) * _1869;
    int _1877 = ~_482;
    int _1879 = _1877 + 1;
    float _1881 = -_1871;
    float _1883 = _1881 + 1.0;
    int _1885 = ~_482;
    int _1887 = _1885 + 1;
    float _1889 = trunc(_1875);
    float _1891 = precise::max(_1889, 0.0);
    uint _1894 = uint(_1891);
    int _1896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1898 = _1896 != 0;
    float _1900 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1902 = !_1898;
    float _1904 = _1902 ? 7.345489978790283203125 : 1.0;
    int _1906 = _1879 * int(_1894);
    int _1908 = _1906 + _1859;
    float _1910 = float(uint(_1908));
    float _1912 = as_type<float>(_1873) * _1910;
    float _1914 = _1904 * _476;
    int _1916 = ~_482;
    int _1918 = _1916 + 1;
    float _1920 = trunc(_1912);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    float _1926 = float(_112);
    float _1928 = float(_1859);
    float _1930 = floor(_1914);
    int _1932 = int(_1894) + int(_1924);
    float _1934 = 1.0 / _1926;
    bool _1936 = _1928 >= _504;
    bool _1938 = isnan(_1928);
    bool _1940 = _1936 || _1938;
    bool _1942 = isnan(_504);
    bool _1944 = _1940 || _1942;
    float _1946 = float(_1944);
    int _1948 = _1918 * _1932;
    int _1950 = _1948 + _1859;
    float _1952 = -_1930;
    float _1954 = _1914 + _1952;
    float _1956 = trunc(_1946);
    int _1958 = int(_1956);
    bool _1960 = uint(_1950) >= uint(_482);
    float _1962 = _1954 * _504;
    bool _1964 = !_1960;
    int _1966 = _1964 ? 0 : (-1);
    float _1968 = _636 * _1934;
    bool _1970 = _482 == 0;
    float _1972 = trunc(_1962);
    int _1974 = int(_1972);
    int _1976 = ~_1932;
    int _1978 = _1976 + _1966;
    int _1980 = _1978 + 1;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1984 = _1982 != 0;
    int _1986 = _482 * _1980;
    int _1988 = _1986 + _1859;
    int _1990 = ~_1958;
    int _1992 = _1990 + 1;
    int _1994 = _1992 + 1;
    float _1996 = trunc(_1968);
    int _1998 = int(_1996);
    bool _2000 = !_1984;
    int _2002 = _2000 ? 0 : 1;
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2006 = _2004 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2008 = !_1970;
    int _2010 = _2008 ? _1988 : (-1);
    int _2012 = _482 + (-1);
    int _2014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2016 = _2014 != 0;
    int _2018 = _2010 * _1994;
    int _2020 = abs(_744);
    float _2022 = 1.0 / _2006;
    int _2024 = abs(_2002);
    int _2026 = _1958 * _2012;
    int _2028 = _2026 + _2018;
    bool _2030 = !_2016;
    int _2032 = _2030 ? 0 : 1;
    int _2034 = _1974 * _2024;
    int _2036 = _2034 + _1859;
    int _2038 = abs(_750);
    int _2040 = _2028 * _2020;
    int _2042 = abs(_2032);
    int _2044 = _1998 * _2038;
    int _2046 = _2044 + _2040;
    int _2048 = ~_482;
    int _2050 = _2048 + 1;
    int _2052 = _2036 * _1861;
    int _2054 = _2052 + _2046;
    int _2056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2058 = _2056 != 0;
    int _2060 = _1974 * _2042;
    int _2062 = _2060 + _2054;
    int _2064 = ~_482;
    int _2066 = _2064 + 1;
    float _2068 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2070 = _2068 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2074 = _2072 != 0;
    float _2076 = float(uint(_2062));
    float _2078 = 1.0 / _2070;
    float _2080 = as_type<float>(_1873) * _2076;
    float _2082 = trunc(_2080);
    float _2084 = precise::max(_2082, 0.0);
    uint _2086 = uint(_2084);
    int _2088 = _2066 * int(_2086);
    int _2090 = _2088 + _2062;
    float _2092 = float(uint(_2090));
    float _2094 = as_type<float>(_1873) * _2092;
    float _2096 = trunc(_2094);
    float _2098 = precise::max(_2096, 0.0);
    uint _2100 = uint(_2098);
    int _2102 = int(_2086) + int(_2100);
    float _2104 = float(uint(_2036));
    int _2106 = ~_482;
    int _2108 = _2106 + 1;
    int _2110 = _2050 * _2102;
    int _2112 = _2110 + _2062;
    float _2114 = as_type<float>(_1873) * _2104;
    bool _2116 = uint(_2112) >= uint(_482);
    float _2118 = trunc(_2114);
    float _2120 = precise::max(_2118, 0.0);
    uint _2122 = uint(_2120);
    bool _2124 = !_2116;
    int _2126 = _2124 ? 0 : (-1);
    int _2128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2130 = _2128 != 0;
    float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2134 = _2132 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2136 = ~_2102;
    int _2138 = _2136 + _2126;
    int _2140 = _2138 + 1;
    float _2142 = in.m_73.y;
    float _2144 = _2134 * _2078;
    int _2146 = _482 * _2140;
    int _2148 = _2146 + _2062;
    int _2150 = _2108 * int(_2122);
    int _2152 = _2150 + _2036;
    bool _2154 = !_1970;
    int _2156 = _2154 ? _2148 : (-1);
    int _2158 = _2156 >> 31;
    float _2160 = float(uint(_2152));
    int _2162 = _2158 & 3;
    float _2164 = as_type<float>(_1873) * _2160;
    int _2166 = _2156 + _2162;
    float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2168;
    int _2172 = _2166 >> 2;
    float _2174 = trunc(_2164);
    float _2176 = precise::max(_2174, 0.0);
    uint _2178 = uint(_2176);
    float _2180 = _2170 * _2022;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    int _2182 = _2172 << 4;
    int _2184 = _2182 + 368;
    float _2186 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2188 = _458 + _2186;
    float _2190 = -_2142;
    float _2192 = _2190 + 1.0;
    int _2194 = _2156 & 3;
    bool _2196 = _2194 != 0;
    uint _2198 = uint(int(uint(_2184) >> uint(2)));
    uint _2200 = uint(int(uint(int(_2198)) >> uint(2)));
    int _2202 = int(_2198) & 3;
    float _2204 = (*spvDescriptorSet0.vp_c9)._m0[int(_2200)][_2202];
    int _2206 = int(_2198) + 1;
    uint _2208 = uint(int(uint(_2206) >> uint(2)));
    int _2210 = _2206 & 3;
    float _2212 = (*spvDescriptorSet0.vp_c9)._m0[int(_2208)][_2210];
    float _2214 = fma(_2180, _2188, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2216 = _2142;
    float _2218 = _1780;
    if (_2058)
    {
        float _2220 = _1863 ? _2192 : _2142;
        _2216 = _2220;
    }
    float _2222 = _2216;
    int _2224 = _2156 & 3;
    bool _2226 = _2224 != 0;
    float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2230 = _458 + _2228;
    bool _2232 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2234 = isnan(_458);
    bool _2236 = _2232 || _2234;
    bool _2238 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2240 = _2236 || _2238;
    float _2242 = float(_2240);
    bool _2244 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2246 = isnan(_458);
    bool _2248 = _2244 || _2246;
    bool _2250 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2252 = _2248 || _2250;
    float _2254 = float(_2252);
    float _2256 = fma(_2144, _2230, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2258 = uint(_2224) > 1u;
    float _2260 = -_2242;
    float _2262 = _2260 + 1.0;
    int _2264 = int(_2122) + int(_2178);
    float _2266 = -_2254;
    float _2268 = _2266 + 1.0;
    bool _2270 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2272 = isnan(_458);
    bool _2274 = _2270 || _2272;
    bool _2276 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2278 = _2274 || _2276;
    float _2280 = float(_2278);
    float _2282 = _2254 * _2262;
    float _2284 = as_type<float>(_2178);
    if (_2130)
    {
        float _2286 = in.m_55.x;
        _2284 = _2286;
    }
    float _2288 = _2284;
    int _2290 = _2184 + 8;
    uint _2292 = uint(int(uint(_2290) >> uint(2)));
    uint _2294 = uint(int(uint(int(_2292)) >> uint(2)));
    int _2296 = int(_2292) & 3;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[int(_2294)][_2296];
    int _2300 = int(_2292) + 1;
    uint _2302 = uint(int(uint(_2300) >> uint(2)));
    int _2304 = _2300 & 3;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[int(_2302)][_2304];
    int _2308 = _2196 ? 0 : 1;
    float _2310 = _2280 * _2268;
    float _2312 = -_2280;
    float _2314 = _2312 + 1.0;
    bool _2316 = _2224 != 3;
    int _2318 = _1887 * _2264;
    int _2320 = _2318 + _2036;
    float _2322 = _2214 * _2310;
    int _2324 = ~_2308;
    int _2326 = _2324 + 1;
    int _2328 = _2326 + 1;
    int _2330 = _2328;
    if (!_2258)
    {
        int _2332 = ~_2308;
        int _2334 = _2332 + 1;
        _2330 = _2334;
    }
    int _2336 = _2330;
    float _2338 = fma(_2314, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2322);
    bool _2340 = uint(_2224) >= 2u;
    int _2342 = abs(_2336);
    float _2344 = fma(_2256, _2282, _2338);
    bool _2346 = uint(_2320) >= uint(_482);
    float _2348 = -_1826;
    float _2350 = _2348 + 1.0;
    int _2352 = _2340 ? 0 : 1;
    float _2354 = _1900 * _1828;
    int _2356 = ~_2342;
    int _2358 = _2356 + 1;
    int _2360 = _2358 + 1;
    bool _2362 = _2288 > 0.5;
    bool _2364 = _2362 && _2130;
    bool _2366 = !_2346;
    int _2368 = _2366 ? 0 : (-1);
    bool _2370 = !_2226;
    int _2372 = _2370 ? 0 : 1;
    int _2374 = ~_2352;
    int _2376 = _2374 + 1;
    int _2378 = _2376 + 1;
    int _2380 = _2360 * as_type<int>(_2212);
    bool _2382 = _2224 != 3;
    float _2384 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2386 = int(_2384);
    int _2388 = _2378;
    if (_2316)
    {
        int _2390 = ~_2352;
        int _2392 = _2390 + 1;
        _2388 = _2392;
    }
    int _2394 = _2388;
    int _2396 = ~_2264;
    int _2398 = _2396 + _2368;
    int _2400 = _2398 + 1;
    int _2402 = abs(_2372);
    bool _2404 = !_2382;
    int _2406 = _2404 ? 0 : (-1);
    int _2408 = _482 * _2400;
    int _2410 = _2408 + _2036;
    int _2412 = abs(_2394);
    bool _2414 = !_2074;
    int _2416 = _2414 ? 0 : 1;
    int _2418 = ~_2402;
    int _2420 = _2418 + 1;
    int _2422 = _2420 + 1;
    int _2424 = abs(_2406);
    int _2426 = _2422 * as_type<int>(_2204);
    int _2428 = _2426 + _2380;
    int _2430 = abs(_2416);
    float _2432 = in.m_73.x;
    int _2434 = ~_2412;
    int _2436 = _2434 + 1;
    int _2438 = _2436 + 1;
    int _2440 = ~_2424;
    int _2442 = _2440 + 1;
    int _2444 = _2442 + 1;
    float _2446 = float(uint(_2386));
    int _2448 = _2438 * as_type<int>(_2298);
    int _2450 = _2448 + _2428;
    int _2452 = abs(_2386);
    float _2454 = fma(_2242, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2344);
    int _2456 = _2444 * as_type<int>(_2306);
    int _2458 = _2456 + _2450;
    float _2460 = 1.0 / _2446;
    int _2462 = ~_2430;
    int _2464 = _2462 + 1;
    int _2466 = _2464 + 1;
    float _2468 = _978 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2470 = float(uint(_2452));
    float _2472 = _978 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2474 = !_1970;
    int _2476 = _2474 ? _2410 : (-1);
    int _2478 = _2458 * _2466;
    float _2480 = _978 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2482 = 1.0 / _2470;
    int _2484 = _2476 * _2430;
    int _2486 = _2484 + _2478;
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2490 = _2454 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2492 = float(uint(_2486));
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2496 = as_type<int>(_2460) + (-2);
    float _2498 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2500 = abs(_2486);
    float _2502 = _2494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2504 = _2488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2506 = as_type<float>(_2496) * _2492;
    float _2508 = float(uint(_2500));
    float _2510 = _2498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2512 = as_type<int>(_2482) + (-2);
    float _2514 = -_968;
    float _2516 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2468);
    float _2518 = -_968;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2472);
    float _2522 = trunc(_2506);
    float _2524 = precise::max(_2522, 0.0);
    uint _2526 = uint(_2524);
    float _2528 = -_968;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2480);
    float _2532 = as_type<float>(_2512) * _2508;
    int _2534 = ~_2386;
    int _2536 = _2534 + 1;
    out.m_77.x = _2502;
    out.m_77.y = _2504;
    out.m_77.z = _2510;
    out.m_77.w = _2490;
    float _2538 = as_type<float>(_2410);
    float _2540 = _2432;
    if (_2130)
    {
        _2538 = _2432;
    }
    float _2542 = _2538;
    bool _2544 = _752 != 0.0;
    bool _2546 = isnan(_752);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan(0.0);
    bool _2552 = _2548 || _2550;
    float _2554 = trunc(_2532);
    float _2556 = precise::max(_2554, 0.0);
    uint _2558 = uint(_2556);
    float _2560 = in.m_79.x;
    float _2562 = in.m_79.y;
    float _2564 = in.m_79.z;
    int _2566 = ~_2452;
    int _2568 = _2566 + 1;
    float _2570 = _2542;
    if (_2364)
    {
        float _2572 = -_2542;
        float _2574 = _2572 + 1.0;
        _2570 = _2574;
    }
    float _2576 = _2570;
    bool _2578 = _892 == 0.0;
    bool _2580 = !_2552;
    bool _2582 = _2578 && _2580;
    bool _2584 = _758 == 0.0;
    bool _2586 = _2584 && _2582;
    float _2588 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2520);
    if (_2130)
    {
        _2540 = _2576;
    }
    float _2590 = _2540;
    float _2592 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2516);
    float _2594 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2530);
    int _2596 = _2536 * int(_2526);
    int _2598 = _2596 + _2486;
    float _2600 = _988 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2602 = _2568 * int(_2558);
    int _2604 = _2602 + _2500;
    float _2606 = _988 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2608 = _988 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2610 = float(uint(_2598));
    float _2612 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2600);
    float _2614 = float(uint(_2604));
    float _2616 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2606);
    float _2618 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2608);
    float _2620 = as_type<float>(_2496) * _2610;
    float _2622 = abs(_1404);
    float _2624 = log2(_2622);
    float _2626 = as_type<float>(_2512) * _2614;
    float _2628 = _2562;
    float _2630 = _2560;
    float _2632 = _2564;
    if (!_2586)
    {
        float _2634 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2562);
        _2628 = _2634;
    }
    float _2636 = _2628;
    float _2638 = _998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_2586)
    {
        float _2640 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2560);
        _2630 = _2640;
    }
    float _2642 = _2630;
    if (!_2586)
    {
        float _2644 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2564);
        _2632 = _2644;
    }
    float _2646 = _2632;
    float _2648 = _2592 * _2636;
    float _2650 = _2588 * _2636;
    float _2652 = trunc(_2620);
    float _2654 = precise::max(_2652, 0.0);
    uint _2656 = uint(_2654);
    float _2658 = _2594 * _2636;
    int _2660 = ~_2386;
    int _2662 = _2660 + 1;
    float _2664 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2638);
    float _2666 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2616);
    float _2668 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2612);
    float _2670 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2618);
    float _2672 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2664);
    float _2674 = trunc(_2626);
    float _2676 = precise::max(_2674, 0.0);
    uint _2678 = uint(_2676);
    float _2680 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2682 = fma(_2666, _2642, _2650);
    float _2684 = fma(_2670, _2642, _2658);
    bool _2686 = _1404 <= 8000.0;
    bool _2688 = isnan(_1404);
    bool _2690 = _2686 || _2688;
    bool _2692 = isnan(8000.0);
    bool _2694 = _2690 || _2692;
    float _2696 = float(_2694);
    float _2698 = _998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2700 = fma(_2672, _2646, _2682);
    float _2702 = _998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2704 = int(_2526) + int(_2656);
    float _2706 = exp2(_2680);
    int _2708 = ~_2452;
    int _2710 = _2708 + 1;
    float _2712 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2698);
    float _2714 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2702);
    int _2716 = _2662 * _2704;
    int _2718 = _2716 + _2486;
    float _2720 = fma(_2668, _2642, _2648);
    float _2722 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2712);
    int _2724 = int(_2558) + int(_2678);
    float _2726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2728 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2714);
    bool _2730 = uint(_2718) >= uint(_2386);
    float _2732 = _1853 * _2354;
    int _2734 = _2710 * _2724;
    int _2736 = _2734 + _2500;
    int _2738 = _2486 ^ _2386;
    float _2740 = fma(_2722, _2646, _2720);
    bool _2742 = !_2730;
    int _2744 = _2742 ? 0 : (-1);
    float _2746 = fma(_2706, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2748 = precise::clamp(_2746, 0.0, 1.0);
    bool _2750 = uint(_2736) >= uint(_2452);
    float _2752 = fma(_2728, _2646, _2684);
    uint _2754 = uint(int(uint(_2738) >> uint(31)));
    bool _2756 = !_2750;
    int _2758 = _2756 ? 0 : (-1);
    float _2760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2762 = ~_2704;
    int _2764 = _2762 + _2744;
    int _2766 = _2764 + 1;
    out.m_81.x = _2740;
    out.m_81.y = _2700;
    out.m_81.z = _2752;
    int _2768 = ~_2758;
    int _2770 = _2724 + _2768;
    int _2772 = _2770 + 1;
    int _2774 = ~int(_2754);
    int _2776 = _2774 + 1;
    int _2778 = _2386 * _2766;
    int _2780 = _2778 + _2486;
    float _2782 = _2748 * _2748;
    int _2784 = _2772 ^ _2776;
    bool _2786 = _2386 == 0;
    float _2788 = fma(_2748, -2.0, 3.0);
    float _2790 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2792 = _2386 == 0;
    int _2794 = ~_2776;
    int _2796 = _2794 + _2784;
    int _2798 = _2796 + 1;
    float _2800 = _2782 * _2788;
    float _2802 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2790);
    bool _2804 = !_2786;
    int _2806 = _2804 ? _2780 : (-1);
    float _2808 = _2726 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2810 = !_2792;
    int _2812 = _2810 ? _2798 : (-1);
    float _2814 = -_2800;
    float _2816 = _2814 + 1.0;
    float _2818 = float(_2806);
    float _2820 = _2760 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2822 = float(_2812);
    float _2824 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2802);
    float _2826 = fma(_2808, _2590, -0.5);
    float _2828 = fma(_2808, _2818, _624);
    float _2830 = fma(_2816, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2800);
    float _2832 = -_650;
    float _2834 = fma(_2820, _2822, _2832);
    float _2836 = fma(_2820, _2222, -0.5);
    float _2838 = in.m_83.x;
    float _2840 = _2696 * _2830;
    float _2842 = fma(_644, _2826, _2828);
    float _2844 = fma(_810, _2836, _2834);
    float _2846 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2824);
    float _2848 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2850 = _1780 + _1748;
    float _2852 = _1748 * 0.5;
    float _2854 = _2846 + _1748;
    float _2856 = _2844 + 0.5;
    float _2858 = _2350 * _2848;
    float _2860 = precise::clamp(_2858, 0.0, 1.0);
    float _2862 = _2854 * 0.5;
    float _2864 = _2850 * 0.5;
    float _2866 = fma(_1800, -0.5, _2852);
    float _2868 = -_2860;
    float _2870 = fma(_2868, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2872 = _1843 * _2354;
    float _2874 = _2842 + 0.5;
    float _2876 = fma(_1843, _2732, _1841);
    out.m_85.x = _2864;
    out.m_85.y = _2866;
    out.m_85.z = _2862;
    out.m_85.w = _1748;
    float _2878 = fma(_1849, _2872, _1837);
    float _2880 = fma(_1851, _2872, _1839);
    bool _2882 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2884 = isnan(_1546);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2890 = _2886 || _2888;
    float _2892 = _2870 * _2838;
    out.m_87.x = _2874;
    out.m_87.y = _2856;
    float _2894 = _2892 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _1780;
    out.gl_Position.y = _1800;
    out.gl_Position.z = _2846;
    out.gl_Position.w = _1748;
    out.m_89.x = _2894;
    float _2896 = -_1900;
    float _2898 = _2896 + 1.0;
    float _2900 = _2872;
    float _2902 = _1748;
    float _2904 = _2862;
    float _2906 = _2866;
    if (!_2890)
    {
        _2900 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2908 = _2900;
    float _2910 = _1843 * _2898;
    float _2912 = _1458 * _1512;
    float _2914 = _2912;
    float _2916 = _2908;
    float _2918 = _2908;
    if (!_2890)
    {
        _2902 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2920 = _2902;
    float _2922 = _2920;
    float _2924 = _2920;
    if (!_2890)
    {
        _2904 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2926 = _2904;
    out.m_91.x = _2878;
    out.m_91.y = _2880;
    out.m_91.z = _2876;
    out.m_91.w = _2910;
    float _2928 = _2912 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2930 = _2926;
    float _2932 = _2926;
    if (!_2890)
    {
        _2218 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2934 = _2218;
    float _2936 = _2934;
    float _2938 = _2934;
    if (!_2890)
    {
        _2906 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2940 = _2906;
    float _2942 = _2940;
    float _2944 = _2940;
    if (!_2890)
    {
        _2914 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2946 = _2914;
    bool _2948 = !_2890;
    float _2950 = _2946;
    float _2952 = _2946;
    if (!_2948)
    {
        bool _2954 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2956 = isnan(_1546);
        bool _2958 = _2954 || _2956;
        bool _2960 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2962 = _2958 || _2960;
        if (!_2962)
        {
            float _2964 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2966 = _1546 + _2964;
            float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2970 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2968;
            float _2972 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2974 = _2972 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2976 = 1.0 / _2970;
            float _2978 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2982 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2986 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2988 = _2986 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2990 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2992 = _2990 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2994 = _2966 * _2976;
            float _2996 = precise::clamp(_2994, 0.0, 1.0);
            float _2998 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3000 = _2998 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3002 = fma(_2996, _2974, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3004 = fma(_2996, _3000, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3006 = fma(_2996, _2980, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3008 = fma(_2996, _2984, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3010 = fma(_2996, _2988, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3012 = fma(_2996, _2992, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2938 = _3006;
            _2944 = _3010;
            _2918 = _3002;
            _2932 = _3008;
            _2924 = _3004;
            _2952 = _3012;
            _3014 = true;
        }
        else
        {
            bool _3016 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3018 = isnan(_1546);
            bool _3020 = _3016 || _3018;
            bool _3022 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3024 = _3020 || _3022;
            if (!_3024)
            {
                _2916 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3026 = _2916;
            _2918 = _3026;
            if (!_3024)
            {
                _2936 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3028 = _2936;
            _2938 = _3028;
            if (!_3024)
            {
                _2922 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3030 = _2922;
            _2924 = _3030;
            if (!_3024)
            {
                _2930 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3032 = _2930;
            _2932 = _3032;
            if (!_3024)
            {
                _2942 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3034 = _2942;
            _2944 = _3034;
            if (!_3024)
            {
                _2950 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3036 = _2950;
            bool _3038 = !_3024;
            _2952 = _3036;
            if (!_3038)
            {
                bool _3040 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3042 = isnan(_1546);
                bool _3044 = _3040 || _3042;
                bool _3046 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3048 = _3044 || _3046;
                if (!_3048)
                {
                    float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3052 = _1546 + _3050;
                    float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3056 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3054;
                    float _3058 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3062 = 1.0 / _3056;
                    float _3064 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3066 = _3064 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3068 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3070 = _3068 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3072 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3074 = _3072 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3076 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3078 = _3076 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3080 = _3052 * _3062;
                    float _3082 = precise::clamp(_3080, 0.0, 1.0);
                    float _3084 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3086 = _3084 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3088 = fma(_3082, _3060, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3090 = fma(_3082, _3086, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3092 = fma(_3082, _3066, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3094 = fma(_3082, _3070, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3096 = fma(_3082, _3074, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3098 = fma(_3082, _3078, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2938 = _3092;
                    _2944 = _3096;
                    _2918 = _3088;
                    _2932 = _3094;
                    _2924 = _3090;
                    _2952 = _3098;
                    _3014 = true;
                }
                else
                {
                    _2938 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2944 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2918 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2932 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2924 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2952 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3014 = false;
    float _3100 = _2938;
    float _3102 = _2944;
    float _3104 = _2918;
    float _3106 = _2932;
    float _3108 = _2924;
    float _3110 = _2952;
    float _3112 = fma(_2700, -0.5, 0.5);
    float _3114 = precise::clamp(_3112, 0.0, 1.0);
    float _3116 = -_3100;
    float _3118 = _3116 + _3102;
    float _3120 = _2928 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3122 = -_3104;
    float _3124 = _3122 + _3106;
    float _3126 = fma(_3114, _3118, _3100);
    out.m_93.x = 0.0;
    float _3128 = -_3108;
    float _3130 = _3128 + _3110;
    float _3132 = fma(_3114, _3124, _3104);
    float _3134 = _3126 * 0.586610972881317138671875;
    out.m_49.x = _3120;
    bool _3136 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3138 = fma(_3114, _3130, _3108);
    float _3140 = fma(_3132, 0.298911988735198974609375, _3134);
    bool _3142 = _1458 > 0.0;
    bool _3144 = isnan(_1458);
    bool _3146 = _3142 || _3144;
    bool _3148 = isnan(0.0);
    bool _3150 = _3146 || _3148;
    float _3152 = fma(_3138, 0.114477999508380889892578125, _3140);
    bool _3154 = _1512 <= 0.0;
    bool _3156 = !_3150;
    bool _3158 = _3154 || _3156;
    float _3160 = -_3152;
    float _3162 = _3132 + _3160;
    float _3164 = -_3152;
    float _3166 = _3126 + _3164;
    float _3168 = -_3152;
    float _3170 = _3138 + _3168;
    float _3172 = fma(_3162, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3152);
    float _3174 = fma(_3166, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3152);
    float _3176 = fma(_3170, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3152);
    bool _3178 = !_3136;
    if (!_3178)
    {
        float _3180 = -_1390;
        float _3182 = _3180 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3184 = -_1392;
        float _3186 = _3184 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3188 = -_1394;
        float _3190 = _3188 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3192 = _3182 * _3182;
        float _3194 = fma(_3186, _3186, _3192);
        float _3196 = fma(_3190, _3190, _3194);
        float _3198 = sqrt(_3196);
        float _3200 = rsqrt(_3196);
        float _3202 = -_3198;
        float _3204 = _3202 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3206 = _3204 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3208 = precise::clamp(_3206, 0.0, 1.0);
        float _3210 = _3186 * _3200;
        float _3212 = _3182 * _3200;
        float _3214 = abs(_3208);
        float _3216 = log2(_3214);
        float _3218 = _3190 * _3200;
        float _3220 = _3210 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3222 = _2700 * _3212;
        float _3224 = -_3212;
        float _3226 = -_3220;
        float _3228 = fma(_3224, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3226);
        float _3230 = fma(_2740, _3210, _3222);
        float _3232 = -_3218;
        float _3234 = fma(_3232, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3228);
        float _3236 = fma(_2752, _3218, _3230);
        float _3238 = precise::clamp(_3236, 0.0, 1.0);
        float _3240 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3242 = _3234 + _3240;
        float _3244 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3246 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3248 = precise::clamp(_3246, 0.0, 1.0);
        float _3250 = exp2(_3244);
        float _3252 = _3250 * _3248;
        float _3254 = _3238 * _3252;
        float _3256 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3258 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3260 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3256;
        out.m_93.y = _3258;
        out.m_93.z = _3260;
    }
    out.m_65.x = _3172;
    out.m_65.y = _3174;
    out.m_65.z = _3176;
    if (!_3158)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3262 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3262;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3014 = false;
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
        float _3319 = as_type<float>(_128);
        out.gl_Position.z = _3319;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3389 = as_type<float>(_166);
        out.gl_Position.z = _3389;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _410 = _408 * _400;
    float _412 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[115].x, _410);
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _420 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[116].x, _412);
    float _422 = _414 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _424 = _416 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = _418 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _428 = _420 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _422;
    out.m_59.y = _424;
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
    float _466 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _468 = log2(_466);
    float _470 = _322 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _472 = in.m_55.z;
    float _474 = _324 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _476 = in.m_55.x;
    float _478 = in.m_55.y;
    float _480 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _482 = int(_480);
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _488 = in.m_61.x;
    float _490 = in.m_61.y;
    float _492 = in.m_61.z;
    float _494 = _468 * _146;
    float _496 = exp2(_494);
    float _498 = _462 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _500 = _462 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _502 = _462 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _504 = float(_482);
    float _506 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[5].x, _498);
    float _508 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[4].x, _500);
    float _510 = fma(_460, (*spvDescriptorSet0.vp_c10)._m0[6].x, _502);
    float _512 = _472 * 2.0;
    float _514 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[5].z, _506);
    float _516 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[4].z, _508);
    float _518 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[6].z, _510);
    float _520 = _476 * 2.0;
    float _522 = _514 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _524 = _516 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _526 = _518 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _528 = floor(_512);
    float _530 = -_522;
    float _532 = _530 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _534 = -_524;
    float _536 = _534 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _538 = _478 * 2.0;
    float _540 = _532 * _532;
    float _542 = -_496;
    float _544 = _542 + 1.0;
    float _546 = floor(_520);
    float _548 = fma(_536, _536, _540);
    float _550 = -_526;
    float _552 = _550 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _556 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[78].z, _484);
    float _558 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[78].w, _486);
    float _560 = fma(_552, _552, _548);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _564 = floor(_538);
    float _566 = _476 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _568 = _478 + _476;
    bool _570 = _528 > 0.0;
    float _572 = _478 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _574 = -_562;
    float _576 = fma(_566, 2.0, _574);
    float _578 = _478 + _472;
    bool _580 = _528 >= 0.0;
    bool _582 = isnan(_528);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = sqrt(_560);
    float _592 = _568 + (-1.0);
    bool _594 = _546 > 0.0;
    float _596 = fma(_572, -2.0, _554);
    float _598 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _600 = _578 + (-1.0);
    int _602 = _588 ? 0 : 1;
    float _604 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _606 = int(_604);
    bool _608 = _564 > 0.0;
    float _610 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _612 = _546 >= 0.0;
    bool _614 = isnan(_546);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    float _622 = -_146;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[76].x, _576);
    bool _626 = _564 >= 0.0;
    bool _628 = isnan(_564);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = _504 * _146;
    int _638 = ~_602;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    float _644 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _556);
    float _646 = abs(_590);
    float _648 = precise::max(_646, 200.0);
    float _650 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _596);
    int _652 = _642;
    if (!_570)
    {
        int _654 = ~_602;
        int _656 = _654 + 1;
        _652 = _656;
    }
    int _658 = _652;
    int _660 = _620 ? 0 : 1;
    int _662 = _634 ? 0 : 1;
    bool _664 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _666 = isnan(0.0);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _672 = _668 || _670;
    float _674 = precise::min(_648, 300.0);
    int _676 = ~_660;
    int _678 = _676 + 1;
    int _680 = _678 + 1;
    int _682 = ~_662;
    int _684 = _682 + 1;
    int _686 = _684 + 1;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _690 = _688 != 0;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _694 = _692 != 0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _698 = _696 != 0;
    int _700 = _680;
    int _702 = _686;
    if (!_594)
    {
        int _704 = ~_660;
        int _706 = _704 + 1;
        _700 = _706;
    }
    int _708 = _700;
    float _710 = fma(_674, 0.00999999977648258209228515625, -2.0);
    if (!_608)
    {
        int _712 = ~_662;
        int _714 = _712 + 1;
        _702 = _714;
    }
    int _716 = _702;
    float _718 = fma(_674, 0.00999999977648258209228515625, -1.0);
    float _720 = float(_606);
    float _722 = -_710;
    float _724 = _522 + _722;
    bool _726 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _728 = isnan(1.0);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _734 = _730 || _732;
    float _736 = in.m_63.x;
    float _738 = in.m_63.y;
    float _740 = in.m_63.z;
    bool _742 = !_694;
    int _744 = _742 ? 0 : 1;
    float _746 = 1.0 / _720;
    bool _748 = !_690;
    int _750 = _748 ? 0 : 1;
    float _752 = _718 * _490;
    bool _754 = !_698;
    int _756 = _754 ? 0 : 1;
    float _758 = _718 * _492;
    int _760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _762 = _760 != 0;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _766 = _764 != 0;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _770 = _768 != 0;
    float _772 = _672 ? _544 : 0.0;
    float _774 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _776 = _724 + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _780 = 1.0 + _778;
    bool _782 = !_766;
    int _784 = _782 ? 0 : 1;
    bool _786 = !_770;
    int _788 = _786 ? 0 : 1;
    float _790 = 1.0 / _780;
    int _792 = abs(_784);
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _796 = _524 + _794;
    float _798 = _776 * _776;
    int _800 = abs(_788);
    float _802 = _746 * _146;
    float _804 = float(_708);
    float _806 = fma(_796, _796, _798);
    float _808 = float(_792);
    float _810 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _558);
    bool _812 = !_762;
    int _814 = _812 ? 0 : 1;
    float _816 = float(_716);
    float _818 = _808 * _804;
    int _820 = abs(_814);
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _824 = _526 + _822;
    if (_734)
    {
        float _826 = _772 * _790;
        _148 = _826;
    }
    float _828 = _148;
    float _830 = _818 * (-2.0);
    float _832 = float(_820);
    float _834 = fma(_824, _824, _806);
    float _836 = float(_658);
    float _838 = fma(_830, _738, _738);
    float _840 = float(_800);
    float _842 = sqrt(_834);
    float _844 = fma(_610, _830, _610);
    float _846 = _832 * _836;
    float _848 = _476 + (-0.5);
    float _850 = _840 * _816;
    float _852 = _478 + (-0.5);
    float _854 = _846 * (-2.0);
    float _856 = _320 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _858 = _850 * (-2.0);
    float _860 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[196].y, _838);
    float _862 = fma(_854, _736, _736);
    float _864 = _856 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _866 = rsqrt(_834);
    float _868 = fma(_844, _828, _860);
    float _870 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[196].x, _862);
    float _872 = _472 + _476;
    float _874 = _842 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _876 = fma(_598, _854, _598);
    float _878 = _872 + (-1.0);
    float _880 = _472 + (-0.5);
    float _882 = precise::min(_864, _874);
    float _884 = fma(_858, _740, _740);
    float _886 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _888 = fma(_876, _828, _870);
    float _890 = _868 * 0.15915493667125701904296875;
    float _892 = _718 * _488;
    float _894 = fma(_886, _858, _886);
    float _896 = _866 * _882;
    float _898 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[196].z, _884);
    float _900 = _888 * 0.15915493667125701904296875;
    float _902 = _890 * 6.283185482025146484375;
    float _904 = sin(_902);
    float _906 = _776 * _896;
    float _908 = _796 * _896;
    float _910 = fma(_894, _828, _898);
    float _912 = _824 * _896;
    float _914 = -_906;
    float _916 = _776 + _914;
    float _918 = -_908;
    float _920 = _796 + _918;
    float _922 = _910 * 0.15915493667125701904296875;
    float _924 = -_912;
    float _926 = _824 + _924;
    float _928 = _916 * _916;
    float _930 = _900 * 6.283185482025146484375;
    float _932 = sin(_930);
    float _934 = fma(_920, _920, _928);
    float _936 = fma(_926, _926, _934);
    float _938 = _890 * 6.283185482025146484375;
    float _940 = cos(_938);
    float _942 = sqrt(_936);
    float _944 = _932 * _904;
    float _946 = _900 * 6.283185482025146484375;
    float _948 = cos(_946);
    float _950 = _932 * _940;
    float _952 = _922 * 6.283185482025146484375;
    float _954 = cos(_952);
    float _956 = _866 * _942;
    float _958 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _892);
    float _960 = _470 * _956;
    float _962 = _856 * _956;
    float _964 = _474 * _956;
    float _966 = _922 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = _948 * _940;
    float _972 = _948 * _904;
    float _974 = _932 * _954;
    float _976 = _940 * _954;
    float _978 = _948 * _954;
    float _980 = _904 * _954;
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _752);
    float _984 = _960 * _982;
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _758);
    float _988 = fma(_968, _970, _944);
    float _990 = _962 * _958;
    float _992 = _978 * _984;
    float _994 = _964 * _986;
    float _996 = -_950;
    float _998 = fma(_968, _972, _996);
    float _1000 = -_984;
    float _1002 = _968 * _1000;
    float _1004 = fma(_988, _990, _992);
    float _1006 = -_972;
    float _1008 = fma(_968, _950, _1006);
    float _1010 = _974 * _984;
    float _1012 = fma(_976, _990, _1002);
    float _1014 = fma(_998, _994, _1004);
    float _1016 = fma(_968, _944, _970);
    float _1018 = fma(_1008, _990, _1010);
    float _1020 = fma(_980, _994, _1012);
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1026 = fma(_1016, _994, _1018);
    float _1028 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1022);
    float _1030 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1024);
    float _1032 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1028);
    float _1034 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1030);
    float _1036 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1038 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1040 = _526 + _1036;
    float _1042 = _524 + _1038;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1046 = _1040 + _1044;
    float _1048 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1050 = _1042 + _1048;
    float _1052 = _1046 * _1046;
    float _1054 = fma(_1050, _1050, _1052);
    float _1056 = _1014 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1058 = -_912;
    float _1060 = _526 + _1058;
    float _1062 = sqrt(_1054);
    float _1064 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1056);
    float _1066 = -_906;
    float _1068 = _724 + _1066;
    float _1070 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1064);
    float _1072 = -_908;
    float _1074 = _524 + _1072;
    float _1076 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1078 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1080 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1076);
    float _1082 = _724 + _1078;
    float _1084 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1080);
    bool _1086 = _1062 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1088 = _1070;
    float _1090 = _1078;
    float _1092 = _1080;
    float _1094 = _912;
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
        float _1114 = _1062 + _1112;
        float _1116 = rsqrt(_1054);
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
        float _1142 = fma(_1050, _1138, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1144 = fma(_1046, _1138, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1108 = _1140;
        _1098 = _1142;
        _1102 = _1144;
    }
    float _1146 = _1108;
    float _1148 = _1098;
    float _1150 = _1102;
    float _1152 = -_724;
    float _1154 = _1152 + _1146;
    float _1156 = -_524;
    float _1158 = _1156 + _1148;
    float _1160 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1162 = -_526;
    float _1164 = _1162 + _1150;
    float _1166 = _1154 * _1154;
    float _1168 = 1.0 / _1160;
    float _1170 = -_908;
    float _1172 = _1170 + _1148;
    float _1174 = fma(_1158, _1158, _1166);
    float _1176 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1178 = -_906;
    float _1180 = _1178 + _1146;
    float _1182 = -_912;
    float _1184 = _1182 + _1150;
    float _1186 = fma(_1164, _1164, _1174);
    float _1188 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1176);
    bool _1190 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1192 = isnan(0.5);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1198 = _1194 || _1196;
    float _1200 = sqrt(_1186);
    float _1202 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1188);
    bool _1204 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1206 = isnan(0.5);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1212 = _1208 || _1210;
    float _1214 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1216 = _1214 + _1160;
    float _1218 = _1216 * _1168;
    float _1220 = _1218 * 0.5;
    bool _1222 = _1200 > 0.0;
    float _1224 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1226 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1224);
    float _1228 = 1.0 / _1226;
    float _1230 = _1200;
    float _1232 = _1172;
    float _1234 = _1146;
    float _1236 = _1160;
    float _1238 = _1226;
    float _1240 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1242 = _1184;
    if (!_1222)
    {
        _1230 = _1180;
    }
    float _1244 = _1230;
    float _1246 = _1244;
    if (!_1222)
    {
        _1094 = _1184;
    }
    float _1248 = _1094;
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
            _1272 = _1180;
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
            float _1302 = fma(_188, _1300, _1172);
            float _1304 = fma(_190, _1300, _1180);
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
    if (_1198)
    {
        _196 = _1308;
    }
    float _1328 = _196;
    float _1330 = _1328;
    if (_1198)
    {
        _198 = _1310;
    }
    float _1332 = _198;
    float _1334 = _1332;
    if (_1198)
    {
        _200 = _1312;
    }
    float _1336 = _200;
    float _1338 = _1336;
    if (!_1198)
    {
        float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1342 = _1068 + _1340;
        float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1346 = _1074 + _1344;
        float _1348 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1350 = -_1074;
        float _1352 = _1350 + _1308;
        float _1354 = _1342 * _1342;
        float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1358 = _1060 + _1356;
        float _1360 = -_1068;
        float _1362 = _1360 + _1310;
        float _1364 = -_1060;
        float _1366 = _1364 + _1312;
        float _1368 = fma(_1346, _1346, _1354);
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1372 = fma(_1358, _1358, _1368);
        float _1374 = sqrt(_1372);
        float _1376 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1378 = precise::min(_1374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1380 = _1378 * _1370;
        float _1382 = _1376 * _1380;
        float _1384 = fma(_1352, _1382, _1074);
        float _1386 = fma(_1362, _1382, _1068);
        float _1388 = fma(_1366, _1382, _1060);
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
    float _1538 = fma(_1524, _1524, _1534);
    float _1540 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1536);
    float _1542 = rsqrt(_1538);
    float _1544 = _1540 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1546 = sqrt(_1538);
    float _1548 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
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
    float _1628 = fma(_1074, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1630 = _1604;
    float _1632 = _1626;
    if (_1562)
    {
        float _1634 = fma(_1604, _1626, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1322 = _1634;
    }
    float _1636 = _1322;
    float _1638 = _1636;
    if (!_1562)
    {
        _1630 = _1622;
    }
    float _1640 = _1630;
    float _1642 = floor(_1628);
    float _1644 = _1640;
    float _1646 = _1616;
    if (_1562)
    {
        float _1648 = _1616 + (-1.0);
        _1632 = _1648;
    }
    float _1650 = _1632;
    if (_1562)
    {
        float _1652 = _1586 * _1636;
        _1638 = _1652;
    }
    float _1654 = _1638;
    if (_1562)
    {
        float _1656 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1588 = _1656;
    }
    float _1658 = _1588;
    if (_1562)
    {
        float _1660 = _1550 * _1654;
        _1574 = _1660;
    }
    float _1662 = _1574;
    if (_1562)
    {
        float _1664 = _1552 * _1654;
        _1576 = _1664;
    }
    float _1666 = _1576;
    if (_1562)
    {
        float _1668 = fma(_1622, _1616, _1658);
        _1644 = _1668;
    }
    float _1670 = _1644;
    if (_1562)
    {
        float _1672 = _1662 * _1662;
        _1578 = _1672;
    }
    float _1674 = _1578;
    if (!_1562)
    {
        _1646 = _1556;
    }
    float _1676 = _1646;
    float _1678 = _1676;
    if (_1562)
    {
        float _1680 = _1666 * _1666;
        _1678 = _1680;
    }
    float _1682 = _1678;
    float _1684 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1686 = fma(_1670, _1670, _1674);
    float _1688 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1684);
    float _1690 = _1686 + _1682;
    float _1692 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1694 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1696 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1688);
    float _1698 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1532);
    float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1702 = fma(_1546, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1700);
    float _1704 = precise::clamp(_1702, 0.0, 1.0);
    float _1706 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1694);
    float _1708 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1710 = rsqrt(_1690);
    float _1712 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1714 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1706);
    float _1716 = -_1704;
    float _1718 = _1716 + 1.0;
    float _1720 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1722 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1724 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1726 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1728 = -_1720;
    float _1730 = fma(_1728, _1692, 1.0);
    float _1732 = abs(_1718);
    float _1734 = log2(_1732);
    float _1736 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1724);
    float _1738 = fma(_1060, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1740 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1736);
    float _1742 = _1710 * _1662;
    float _1744 = _1710 * _1670;
    float _1746 = _1710 * _1666;
    float _1748 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1740);
    float _1750 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1752 = floor(_1738);
    float _1754 = -_1642;
    float _1756 = _1628 + _1754;
    float _1758 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1760 = -_1750;
    float _1762 = fma(_1744, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1760);
    float _1764 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1766 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1758);
    float _1768 = -_1746;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1762);
    float _1772 = log2(_1730);
    float _1774 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1766);
    float _1776 = fma(_1770, -0.5, 0.5);
    float _1778 = fma(_1770, 0.5, 0.5);
    float _1780 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1774);
    float _1782 = exp2(_1764);
    float _1784 = -_1752;
    float _1786 = _1738 + _1784;
    float _1788 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1726);
    float _1790 = fma(_1778, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1792 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1788);
    float _1794 = fma(_1778, _1790, -0.212114393711090087890625);
    float _1796 = 1.0 / _1748;
    float _1798 = _1744 + 1.0;
    float _1800 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1792);
    float _1802 = fma(_1778, _1794, 1.570728778839111328125);
    float _1804 = _1772 * 0.693147182464599609375;
    float _1806 = sqrt(_1776);
    float _1808 = -_1744;
    float _1810 = fma(_1782, _1798, _1808);
    float _1812 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1814 = fma(_1810, 0.5, 0.5);
    float _1816 = _1780 * _1796;
    float _1818 = _1800 * _1796;
    float _1820 = fma(_1816, 0.5, 0.5);
    float _1822 = fma(_1818, -0.5, 0.5);
    float _1824 = _1806 * 0.636619746685028076171875;
    float2 _5960 = float2(_1756, _1786);
    float _1826 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5960, float2(0.0), isnan(_5960)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5960, float2(0.0), isnan(_5960)), level(0.0)).x;
    float3 _5971 = float3(_1820, _1822, _1812);
    float _1828 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5971, float3(0.0), isnan(_5971)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5971, float3(0.0), isnan(_5971)), level(0.0)).x;
    float _1830 = -_1802;
    float _1832 = fma(_1824, _1830, 1.0);
    float3 _5987 = float3(_1820, _1822, _1812);
    float4 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5987, float3(0.0), isnan(_5987)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5987, float3(0.0), isnan(_5987)), level(0.0)).xyzw;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1835.w;
    float2 _6003 = float2(_1832, _1814);
    float3 _1847 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6003, float2(0.0), isnan(_6003)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6003, float2(0.0), isnan(_6003)), level(0.0)).xyz;
    float _1849 = _1847.x;
    float _1851 = _1847.y;
    float _1853 = _1847.z;
    float _1855 = float(uint(_482));
    float _1857 = trunc(_802);
    int _1859 = int(_1857);
    int _1861 = abs(_756);
    out.m_65.w = _882;
    bool _1863 = _478 > 0.5;
    float _1865 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_67.x = _1074;
    out.m_67.y = _1068;
    out.m_67.z = _1060;
    float _1867 = 1.0 / _1855;
    out.m_69.x = _962;
    out.m_71.x = _1392;
    out.m_71.y = _1390;
    out.m_71.z = _1394;
    float _1869 = float(uint(_1859));
    float _1871 = exp2(_1865);
    int _1873 = as_type<int>(_1867) + (-2);
    float _1875 = as_type<float>(_1873) * _1869;
    int _1877 = ~_482;
    int _1879 = _1877 + 1;
    float _1881 = -_1871;
    float _1883 = _1881 + 1.0;
    int _1885 = ~_482;
    int _1887 = _1885 + 1;
    float _1889 = trunc(_1875);
    float _1891 = precise::max(_1889, 0.0);
    uint _1894 = uint(_1891);
    int _1896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1898 = _1896 != 0;
    float _1900 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1902 = !_1898;
    float _1904 = _1902 ? 7.345489978790283203125 : 1.0;
    int _1906 = _1879 * int(_1894);
    int _1908 = _1906 + _1859;
    float _1910 = float(uint(_1908));
    float _1912 = as_type<float>(_1873) * _1910;
    float _1914 = _1904 * _476;
    int _1916 = ~_482;
    int _1918 = _1916 + 1;
    float _1920 = trunc(_1912);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    float _1926 = float(_112);
    float _1928 = float(_1859);
    float _1930 = floor(_1914);
    int _1932 = int(_1894) + int(_1924);
    float _1934 = 1.0 / _1926;
    bool _1936 = _1928 >= _504;
    bool _1938 = isnan(_1928);
    bool _1940 = _1936 || _1938;
    bool _1942 = isnan(_504);
    bool _1944 = _1940 || _1942;
    float _1946 = float(_1944);
    int _1948 = _1918 * _1932;
    int _1950 = _1948 + _1859;
    float _1952 = -_1930;
    float _1954 = _1914 + _1952;
    float _1956 = trunc(_1946);
    int _1958 = int(_1956);
    bool _1960 = uint(_1950) >= uint(_482);
    float _1962 = _1954 * _504;
    bool _1964 = !_1960;
    int _1966 = _1964 ? 0 : (-1);
    float _1968 = _636 * _1934;
    bool _1970 = _482 == 0;
    float _1972 = trunc(_1962);
    int _1974 = int(_1972);
    int _1976 = ~_1932;
    int _1978 = _1976 + _1966;
    int _1980 = _1978 + 1;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1984 = _1982 != 0;
    int _1986 = _482 * _1980;
    int _1988 = _1986 + _1859;
    int _1990 = ~_1958;
    int _1992 = _1990 + 1;
    int _1994 = _1992 + 1;
    float _1996 = trunc(_1968);
    int _1998 = int(_1996);
    bool _2000 = !_1984;
    int _2002 = _2000 ? 0 : 1;
    float _2004 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2006 = _2004 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2008 = !_1970;
    int _2010 = _2008 ? _1988 : (-1);
    int _2012 = _482 + (-1);
    int _2014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2016 = _2014 != 0;
    int _2018 = _2010 * _1994;
    int _2020 = abs(_744);
    float _2022 = 1.0 / _2006;
    int _2024 = abs(_2002);
    int _2026 = _1958 * _2012;
    int _2028 = _2026 + _2018;
    bool _2030 = !_2016;
    int _2032 = _2030 ? 0 : 1;
    int _2034 = _1974 * _2024;
    int _2036 = _2034 + _1859;
    int _2038 = abs(_750);
    int _2040 = _2028 * _2020;
    int _2042 = abs(_2032);
    int _2044 = _1998 * _2038;
    int _2046 = _2044 + _2040;
    int _2048 = ~_482;
    int _2050 = _2048 + 1;
    int _2052 = _2036 * _1861;
    int _2054 = _2052 + _2046;
    int _2056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2058 = _2056 != 0;
    int _2060 = _1974 * _2042;
    int _2062 = _2060 + _2054;
    int _2064 = ~_482;
    int _2066 = _2064 + 1;
    float _2068 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2070 = _2068 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2074 = _2072 != 0;
    float _2076 = float(uint(_2062));
    float _2078 = 1.0 / _2070;
    float _2080 = as_type<float>(_1873) * _2076;
    float _2082 = trunc(_2080);
    float _2084 = precise::max(_2082, 0.0);
    uint _2086 = uint(_2084);
    int _2088 = _2066 * int(_2086);
    int _2090 = _2088 + _2062;
    float _2092 = float(uint(_2090));
    float _2094 = as_type<float>(_1873) * _2092;
    float _2096 = trunc(_2094);
    float _2098 = precise::max(_2096, 0.0);
    uint _2100 = uint(_2098);
    int _2102 = int(_2086) + int(_2100);
    float _2104 = float(uint(_2036));
    int _2106 = ~_482;
    int _2108 = _2106 + 1;
    int _2110 = _2050 * _2102;
    int _2112 = _2110 + _2062;
    float _2114 = as_type<float>(_1873) * _2104;
    bool _2116 = uint(_2112) >= uint(_482);
    float _2118 = trunc(_2114);
    float _2120 = precise::max(_2118, 0.0);
    uint _2122 = uint(_2120);
    bool _2124 = !_2116;
    int _2126 = _2124 ? 0 : (-1);
    int _2128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2130 = _2128 != 0;
    float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2134 = _2132 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2136 = ~_2102;
    int _2138 = _2136 + _2126;
    int _2140 = _2138 + 1;
    float _2142 = in.m_73.y;
    float _2144 = _2134 * _2078;
    int _2146 = _482 * _2140;
    int _2148 = _2146 + _2062;
    int _2150 = _2108 * int(_2122);
    int _2152 = _2150 + _2036;
    bool _2154 = !_1970;
    int _2156 = _2154 ? _2148 : (-1);
    int _2158 = _2156 >> 31;
    float _2160 = float(uint(_2152));
    int _2162 = _2158 & 3;
    float _2164 = as_type<float>(_1873) * _2160;
    int _2166 = _2156 + _2162;
    float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2168;
    int _2172 = _2166 >> 2;
    float _2174 = trunc(_2164);
    float _2176 = precise::max(_2174, 0.0);
    uint _2178 = uint(_2176);
    float _2180 = _2170 * _2022;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    int _2182 = _2172 << 4;
    int _2184 = _2182 + 368;
    float _2186 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2188 = _458 + _2186;
    float _2190 = -_2142;
    float _2192 = _2190 + 1.0;
    int _2194 = _2156 & 3;
    bool _2196 = _2194 != 0;
    uint _2198 = uint(int(uint(_2184) >> uint(2)));
    uint _2200 = uint(int(uint(int(_2198)) >> uint(2)));
    int _2202 = int(_2198) & 3;
    float _2204 = (*spvDescriptorSet0.vp_c9)._m0[int(_2200)][_2202];
    int _2206 = int(_2198) + 1;
    uint _2208 = uint(int(uint(_2206) >> uint(2)));
    int _2210 = _2206 & 3;
    float _2212 = (*spvDescriptorSet0.vp_c9)._m0[int(_2208)][_2210];
    float _2214 = fma(_2180, _2188, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2216 = _2142;
    float _2218 = _1780;
    if (_2058)
    {
        float _2220 = _1863 ? _2192 : _2142;
        _2216 = _2220;
    }
    float _2222 = _2216;
    int _2224 = _2156 & 3;
    bool _2226 = _2224 != 0;
    float _2228 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2230 = _458 + _2228;
    bool _2232 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2234 = isnan(_458);
    bool _2236 = _2232 || _2234;
    bool _2238 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2240 = _2236 || _2238;
    float _2242 = float(_2240);
    bool _2244 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2246 = isnan(_458);
    bool _2248 = _2244 || _2246;
    bool _2250 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2252 = _2248 || _2250;
    float _2254 = float(_2252);
    float _2256 = fma(_2144, _2230, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2258 = uint(_2224) > 1u;
    float _2260 = -_2242;
    float _2262 = _2260 + 1.0;
    int _2264 = int(_2122) + int(_2178);
    float _2266 = -_2254;
    float _2268 = _2266 + 1.0;
    bool _2270 = _458 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2272 = isnan(_458);
    bool _2274 = _2270 || _2272;
    bool _2276 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2278 = _2274 || _2276;
    float _2280 = float(_2278);
    float _2282 = _2254 * _2262;
    float _2284 = as_type<float>(_2178);
    if (_2130)
    {
        float _2286 = in.m_55.x;
        _2284 = _2286;
    }
    float _2288 = _2284;
    int _2290 = _2184 + 8;
    uint _2292 = uint(int(uint(_2290) >> uint(2)));
    uint _2294 = uint(int(uint(int(_2292)) >> uint(2)));
    int _2296 = int(_2292) & 3;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[int(_2294)][_2296];
    int _2300 = int(_2292) + 1;
    uint _2302 = uint(int(uint(_2300) >> uint(2)));
    int _2304 = _2300 & 3;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[int(_2302)][_2304];
    int _2308 = _2196 ? 0 : 1;
    float _2310 = _2280 * _2268;
    float _2312 = -_2280;
    float _2314 = _2312 + 1.0;
    bool _2316 = _2224 != 3;
    int _2318 = _1887 * _2264;
    int _2320 = _2318 + _2036;
    float _2322 = _2214 * _2310;
    int _2324 = ~_2308;
    int _2326 = _2324 + 1;
    int _2328 = _2326 + 1;
    int _2330 = _2328;
    if (!_2258)
    {
        int _2332 = ~_2308;
        int _2334 = _2332 + 1;
        _2330 = _2334;
    }
    int _2336 = _2330;
    float _2338 = fma(_2314, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2322);
    bool _2340 = uint(_2224) >= 2u;
    int _2342 = abs(_2336);
    float _2344 = fma(_2256, _2282, _2338);
    bool _2346 = uint(_2320) >= uint(_482);
    float _2348 = -_1826;
    float _2350 = _2348 + 1.0;
    int _2352 = _2340 ? 0 : 1;
    float _2354 = _1900 * _1828;
    int _2356 = ~_2342;
    int _2358 = _2356 + 1;
    int _2360 = _2358 + 1;
    bool _2362 = _2288 > 0.5;
    bool _2364 = _2362 && _2130;
    bool _2366 = !_2346;
    int _2368 = _2366 ? 0 : (-1);
    bool _2370 = !_2226;
    int _2372 = _2370 ? 0 : 1;
    int _2374 = ~_2352;
    int _2376 = _2374 + 1;
    int _2378 = _2376 + 1;
    int _2380 = _2360 * as_type<int>(_2212);
    bool _2382 = _2224 != 3;
    float _2384 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2386 = int(_2384);
    int _2388 = _2378;
    if (_2316)
    {
        int _2390 = ~_2352;
        int _2392 = _2390 + 1;
        _2388 = _2392;
    }
    int _2394 = _2388;
    int _2396 = ~_2264;
    int _2398 = _2396 + _2368;
    int _2400 = _2398 + 1;
    int _2402 = abs(_2372);
    bool _2404 = !_2382;
    int _2406 = _2404 ? 0 : (-1);
    int _2408 = _482 * _2400;
    int _2410 = _2408 + _2036;
    int _2412 = abs(_2394);
    bool _2414 = !_2074;
    int _2416 = _2414 ? 0 : 1;
    int _2418 = ~_2402;
    int _2420 = _2418 + 1;
    int _2422 = _2420 + 1;
    int _2424 = abs(_2406);
    int _2426 = _2422 * as_type<int>(_2204);
    int _2428 = _2426 + _2380;
    int _2430 = abs(_2416);
    float _2432 = in.m_73.x;
    int _2434 = ~_2412;
    int _2436 = _2434 + 1;
    int _2438 = _2436 + 1;
    int _2440 = ~_2424;
    int _2442 = _2440 + 1;
    int _2444 = _2442 + 1;
    float _2446 = float(uint(_2386));
    int _2448 = _2438 * as_type<int>(_2298);
    int _2450 = _2448 + _2428;
    int _2452 = abs(_2386);
    float _2454 = fma(_2242, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2344);
    int _2456 = _2444 * as_type<int>(_2306);
    int _2458 = _2456 + _2450;
    float _2460 = 1.0 / _2446;
    int _2462 = ~_2430;
    int _2464 = _2462 + 1;
    int _2466 = _2464 + 1;
    float _2468 = _978 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2470 = float(uint(_2452));
    float _2472 = _978 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2474 = !_1970;
    int _2476 = _2474 ? _2410 : (-1);
    int _2478 = _2458 * _2466;
    float _2480 = _978 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2482 = 1.0 / _2470;
    int _2484 = _2476 * _2430;
    int _2486 = _2484 + _2478;
    float _2488 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2490 = _2454 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2492 = float(uint(_2486));
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2496 = as_type<int>(_2460) + (-2);
    float _2498 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2500 = abs(_2486);
    float _2502 = _2494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2504 = _2488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2506 = as_type<float>(_2496) * _2492;
    float _2508 = float(uint(_2500));
    float _2510 = _2498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2512 = as_type<int>(_2482) + (-2);
    float _2514 = -_968;
    float _2516 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2468);
    float _2518 = -_968;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2472);
    float _2522 = trunc(_2506);
    float _2524 = precise::max(_2522, 0.0);
    uint _2526 = uint(_2524);
    float _2528 = -_968;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2480);
    float _2532 = as_type<float>(_2512) * _2508;
    int _2534 = ~_2386;
    int _2536 = _2534 + 1;
    out.m_77.x = _2502;
    out.m_77.y = _2504;
    out.m_77.z = _2510;
    out.m_77.w = _2490;
    float _2538 = as_type<float>(_2410);
    float _2540 = _2432;
    if (_2130)
    {
        _2538 = _2432;
    }
    float _2542 = _2538;
    bool _2544 = _752 != 0.0;
    bool _2546 = isnan(_752);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan(0.0);
    bool _2552 = _2548 || _2550;
    float _2554 = trunc(_2532);
    float _2556 = precise::max(_2554, 0.0);
    uint _2558 = uint(_2556);
    float _2560 = in.m_79.x;
    float _2562 = in.m_79.y;
    float _2564 = in.m_79.z;
    int _2566 = ~_2452;
    int _2568 = _2566 + 1;
    float _2570 = _2542;
    if (_2364)
    {
        float _2572 = -_2542;
        float _2574 = _2572 + 1.0;
        _2570 = _2574;
    }
    float _2576 = _2570;
    bool _2578 = _892 == 0.0;
    bool _2580 = !_2552;
    bool _2582 = _2578 && _2580;
    bool _2584 = _758 == 0.0;
    bool _2586 = _2584 && _2582;
    float _2588 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2520);
    if (_2130)
    {
        _2540 = _2576;
    }
    float _2590 = _2540;
    float _2592 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2516);
    float _2594 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2530);
    int _2596 = _2536 * int(_2526);
    int _2598 = _2596 + _2486;
    float _2600 = _988 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2602 = _2568 * int(_2558);
    int _2604 = _2602 + _2500;
    float _2606 = _988 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2608 = _988 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2610 = float(uint(_2598));
    float _2612 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2600);
    float _2614 = float(uint(_2604));
    float _2616 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2606);
    float _2618 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2608);
    float _2620 = as_type<float>(_2496) * _2610;
    float _2622 = abs(_1404);
    float _2624 = log2(_2622);
    float _2626 = as_type<float>(_2512) * _2614;
    float _2628 = _2562;
    float _2630 = _2560;
    float _2632 = _2564;
    if (!_2586)
    {
        float _2634 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2562);
        _2628 = _2634;
    }
    float _2636 = _2628;
    float _2638 = _998 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (!_2586)
    {
        float _2640 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2560);
        _2630 = _2640;
    }
    float _2642 = _2630;
    if (!_2586)
    {
        float _2644 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2564);
        _2632 = _2644;
    }
    float _2646 = _2632;
    float _2648 = _2592 * _2636;
    float _2650 = _2588 * _2636;
    float _2652 = trunc(_2620);
    float _2654 = precise::max(_2652, 0.0);
    uint _2656 = uint(_2654);
    float _2658 = _2594 * _2636;
    int _2660 = ~_2386;
    int _2662 = _2660 + 1;
    float _2664 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2638);
    float _2666 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2616);
    float _2668 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2612);
    float _2670 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2618);
    float _2672 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2664);
    float _2674 = trunc(_2626);
    float _2676 = precise::max(_2674, 0.0);
    uint _2678 = uint(_2676);
    float _2680 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2682 = fma(_2666, _2642, _2650);
    float _2684 = fma(_2670, _2642, _2658);
    bool _2686 = _1404 <= 8000.0;
    bool _2688 = isnan(_1404);
    bool _2690 = _2686 || _2688;
    bool _2692 = isnan(8000.0);
    bool _2694 = _2690 || _2692;
    float _2696 = float(_2694);
    float _2698 = _998 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2700 = fma(_2672, _2646, _2682);
    float _2702 = _998 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2704 = int(_2526) + int(_2656);
    float _2706 = exp2(_2680);
    int _2708 = ~_2452;
    int _2710 = _2708 + 1;
    float _2712 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2698);
    float _2714 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2702);
    int _2716 = _2662 * _2704;
    int _2718 = _2716 + _2486;
    float _2720 = fma(_2668, _2642, _2648);
    float _2722 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2712);
    int _2724 = int(_2558) + int(_2678);
    float _2726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2728 = fma(_1016, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2714);
    bool _2730 = uint(_2718) >= uint(_2386);
    float _2732 = _1853 * _2354;
    int _2734 = _2710 * _2724;
    int _2736 = _2734 + _2500;
    int _2738 = _2486 ^ _2386;
    float _2740 = fma(_2722, _2646, _2720);
    bool _2742 = !_2730;
    int _2744 = _2742 ? 0 : (-1);
    float _2746 = fma(_2706, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2748 = precise::clamp(_2746, 0.0, 1.0);
    bool _2750 = uint(_2736) >= uint(_2452);
    float _2752 = fma(_2728, _2646, _2684);
    uint _2754 = uint(int(uint(_2738) >> uint(31)));
    bool _2756 = !_2750;
    int _2758 = _2756 ? 0 : (-1);
    float _2760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2762 = ~_2704;
    int _2764 = _2762 + _2744;
    int _2766 = _2764 + 1;
    out.m_81.x = _2740;
    out.m_81.y = _2700;
    out.m_81.z = _2752;
    int _2768 = ~_2758;
    int _2770 = _2724 + _2768;
    int _2772 = _2770 + 1;
    int _2774 = ~int(_2754);
    int _2776 = _2774 + 1;
    int _2778 = _2386 * _2766;
    int _2780 = _2778 + _2486;
    float _2782 = _2748 * _2748;
    int _2784 = _2772 ^ _2776;
    bool _2786 = _2386 == 0;
    float _2788 = fma(_2748, -2.0, 3.0);
    float _2790 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2792 = _2386 == 0;
    int _2794 = ~_2776;
    int _2796 = _2794 + _2784;
    int _2798 = _2796 + 1;
    float _2800 = _2782 * _2788;
    float _2802 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2790);
    bool _2804 = !_2786;
    int _2806 = _2804 ? _2780 : (-1);
    float _2808 = _2726 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2810 = !_2792;
    int _2812 = _2810 ? _2798 : (-1);
    float _2814 = -_2800;
    float _2816 = _2814 + 1.0;
    float _2818 = float(_2806);
    float _2820 = _2760 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2822 = float(_2812);
    float _2824 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2802);
    float _2826 = fma(_2808, _2590, -0.5);
    float _2828 = fma(_2808, _2818, _624);
    float _2830 = fma(_2816, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2800);
    float _2832 = -_650;
    float _2834 = fma(_2820, _2822, _2832);
    float _2836 = fma(_2820, _2222, -0.5);
    float _2838 = in.m_83.x;
    float _2840 = _2696 * _2830;
    float _2842 = fma(_644, _2826, _2828);
    float _2844 = fma(_810, _2836, _2834);
    float _2846 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2824);
    float _2848 = _2840 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2850 = _1780 + _1748;
    float _2852 = _1748 * 0.5;
    float _2854 = _2846 + _1748;
    float _2856 = _2844 + 0.5;
    float _2858 = _2350 * _2848;
    float _2860 = precise::clamp(_2858, 0.0, 1.0);
    float _2862 = _2854 * 0.5;
    float _2864 = _2850 * 0.5;
    float _2866 = fma(_1800, -0.5, _2852);
    float _2868 = -_2860;
    float _2870 = fma(_2868, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2872 = _1843 * _2354;
    float _2874 = _2842 + 0.5;
    float _2876 = fma(_1843, _2732, _1841);
    out.m_85.x = _2864;
    out.m_85.y = _2866;
    out.m_85.z = _2862;
    out.m_85.w = _1748;
    float _2878 = fma(_1849, _2872, _1837);
    float _2880 = fma(_1851, _2872, _1839);
    bool _2882 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2884 = isnan(_1546);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2890 = _2886 || _2888;
    float _2892 = _2870 * _2838;
    out.m_87.x = _2874;
    out.m_87.y = _2856;
    float _2894 = _2892 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _1780;
    out.gl_Position.y = _1800;
    out.gl_Position.z = _2846;
    out.gl_Position.w = _1748;
    out.m_89.x = _2894;
    float _2896 = -_1900;
    float _2898 = _2896 + 1.0;
    float _2900 = _2872;
    float _2902 = _1748;
    float _2904 = _2862;
    float _2906 = _2866;
    if (!_2890)
    {
        _2900 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2908 = _2900;
    float _2910 = _1843 * _2898;
    float _2912 = _1458 * _1512;
    float _2914 = _2912;
    float _2916 = _2908;
    float _2918 = _2908;
    if (!_2890)
    {
        _2902 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2920 = _2902;
    float _2922 = _2920;
    float _2924 = _2920;
    if (!_2890)
    {
        _2904 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2926 = _2904;
    out.m_91.x = _2878;
    out.m_91.y = _2880;
    out.m_91.z = _2876;
    out.m_91.w = _2910;
    float _2928 = _2912 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2930 = _2926;
    float _2932 = _2926;
    if (!_2890)
    {
        _2218 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2934 = _2218;
    float _2936 = _2934;
    float _2938 = _2934;
    if (!_2890)
    {
        _2906 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2940 = _2906;
    float _2942 = _2940;
    float _2944 = _2940;
    if (!_2890)
    {
        _2914 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2946 = _2914;
    bool _2948 = !_2890;
    float _2950 = _2946;
    float _2952 = _2946;
    if (!_2948)
    {
        bool _2954 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2956 = isnan(_1546);
        bool _2958 = _2954 || _2956;
        bool _2960 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2962 = _2958 || _2960;
        if (!_2962)
        {
            float _2964 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2966 = _1546 + _2964;
            float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2970 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2968;
            float _2972 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2974 = _2972 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2976 = 1.0 / _2970;
            float _2978 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2982 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2986 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2988 = _2986 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2990 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2992 = _2990 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2994 = _2966 * _2976;
            float _2996 = precise::clamp(_2994, 0.0, 1.0);
            float _2998 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3000 = _2998 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3002 = fma(_2996, _2974, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3004 = fma(_2996, _3000, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3006 = fma(_2996, _2980, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3008 = fma(_2996, _2984, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3010 = fma(_2996, _2988, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3012 = fma(_2996, _2992, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2938 = _3006;
            _2944 = _3010;
            _2918 = _3002;
            _2932 = _3008;
            _2924 = _3004;
            _2952 = _3012;
            _3014 = true;
        }
        else
        {
            bool _3016 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3018 = isnan(_1546);
            bool _3020 = _3016 || _3018;
            bool _3022 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3024 = _3020 || _3022;
            if (!_3024)
            {
                _2916 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3026 = _2916;
            _2918 = _3026;
            if (!_3024)
            {
                _2936 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3028 = _2936;
            _2938 = _3028;
            if (!_3024)
            {
                _2922 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3030 = _2922;
            _2924 = _3030;
            if (!_3024)
            {
                _2930 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3032 = _2930;
            _2932 = _3032;
            if (!_3024)
            {
                _2942 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3034 = _2942;
            _2944 = _3034;
            if (!_3024)
            {
                _2950 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3036 = _2950;
            bool _3038 = !_3024;
            _2952 = _3036;
            if (!_3038)
            {
                bool _3040 = _1546 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3042 = isnan(_1546);
                bool _3044 = _3040 || _3042;
                bool _3046 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3048 = _3044 || _3046;
                if (!_3048)
                {
                    float _3050 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3052 = _1546 + _3050;
                    float _3054 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3056 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3054;
                    float _3058 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3062 = 1.0 / _3056;
                    float _3064 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3066 = _3064 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3068 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3070 = _3068 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3072 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3074 = _3072 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3076 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3078 = _3076 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3080 = _3052 * _3062;
                    float _3082 = precise::clamp(_3080, 0.0, 1.0);
                    float _3084 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3086 = _3084 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3088 = fma(_3082, _3060, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3090 = fma(_3082, _3086, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3092 = fma(_3082, _3066, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3094 = fma(_3082, _3070, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3096 = fma(_3082, _3074, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3098 = fma(_3082, _3078, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2938 = _3092;
                    _2944 = _3096;
                    _2918 = _3088;
                    _2932 = _3094;
                    _2924 = _3090;
                    _2952 = _3098;
                    _3014 = true;
                }
                else
                {
                    _2938 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2944 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2918 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2932 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2924 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2952 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3014 = false;
    float _3100 = _2938;
    float _3102 = _2944;
    float _3104 = _2918;
    float _3106 = _2932;
    float _3108 = _2924;
    float _3110 = _2952;
    float _3112 = fma(_2700, -0.5, 0.5);
    float _3114 = precise::clamp(_3112, 0.0, 1.0);
    float _3116 = -_3100;
    float _3118 = _3116 + _3102;
    float _3120 = _2928 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3122 = -_3104;
    float _3124 = _3122 + _3106;
    float _3126 = fma(_3114, _3118, _3100);
    out.m_93.x = 0.0;
    float _3128 = -_3108;
    float _3130 = _3128 + _3110;
    float _3132 = fma(_3114, _3124, _3104);
    float _3134 = _3126 * 0.586610972881317138671875;
    out.m_49.x = _3120;
    bool _3136 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3138 = fma(_3114, _3130, _3108);
    float _3140 = fma(_3132, 0.298911988735198974609375, _3134);
    bool _3142 = _1458 > 0.0;
    bool _3144 = isnan(_1458);
    bool _3146 = _3142 || _3144;
    bool _3148 = isnan(0.0);
    bool _3150 = _3146 || _3148;
    float _3152 = fma(_3138, 0.114477999508380889892578125, _3140);
    bool _3154 = _1512 <= 0.0;
    bool _3156 = !_3150;
    bool _3158 = _3154 || _3156;
    float _3160 = -_3152;
    float _3162 = _3132 + _3160;
    float _3164 = -_3152;
    float _3166 = _3126 + _3164;
    float _3168 = -_3152;
    float _3170 = _3138 + _3168;
    float _3172 = fma(_3162, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3152);
    float _3174 = fma(_3166, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3152);
    float _3176 = fma(_3170, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3152);
    bool _3178 = !_3136;
    if (!_3178)
    {
        float _3180 = -_1390;
        float _3182 = _3180 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3184 = -_1392;
        float _3186 = _3184 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3188 = -_1394;
        float _3190 = _3188 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3192 = _3182 * _3182;
        float _3194 = fma(_3186, _3186, _3192);
        float _3196 = fma(_3190, _3190, _3194);
        float _3198 = sqrt(_3196);
        float _3200 = rsqrt(_3196);
        float _3202 = -_3198;
        float _3204 = _3202 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3206 = _3204 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3208 = precise::clamp(_3206, 0.0, 1.0);
        float _3210 = _3186 * _3200;
        float _3212 = _3182 * _3200;
        float _3214 = abs(_3208);
        float _3216 = log2(_3214);
        float _3218 = _3190 * _3200;
        float _3220 = _3210 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3222 = _2700 * _3212;
        float _3224 = -_3212;
        float _3226 = -_3220;
        float _3228 = fma(_3224, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3226);
        float _3230 = fma(_2740, _3210, _3222);
        float _3232 = -_3218;
        float _3234 = fma(_3232, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3228);
        float _3236 = fma(_2752, _3218, _3230);
        float _3238 = precise::clamp(_3236, 0.0, 1.0);
        float _3240 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3242 = _3234 + _3240;
        float _3244 = _3216 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3246 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3248 = precise::clamp(_3246, 0.0, 1.0);
        float _3250 = exp2(_3244);
        float _3252 = _3250 * _3248;
        float _3254 = _3238 * _3252;
        float _3256 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3258 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3260 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3256;
        out.m_93.y = _3258;
        out.m_93.z = _3260;
    }
    out.m_65.x = _3172;
    out.m_65.y = _3174;
    out.m_65.z = _3176;
    if (!_3158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3262 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3262;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

