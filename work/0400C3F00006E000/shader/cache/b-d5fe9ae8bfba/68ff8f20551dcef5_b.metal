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
    float4 m_57 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_87 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_67 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_71 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2888 = false;
    bool _418 = false;
    bool _314 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3193 = as_type<float>(_126);
        out.gl_Position.z = _3193;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = _144;
    if (_140)
    {
        float _148 = float(_110);
        _120 = _148;
    }
    float _150 = _120;
    bool _152 = _144 >= _150;
    bool _154 = !_140;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_49.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3263 = as_type<float>(_164);
        out.gl_Position.z = _3263;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_53.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    float _218 = 1.0 / _216;
    bool _220 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _222 = isnan(_196);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -_212;
    float _234 = _232 + 1.0;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _240;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _246;
    float _250 = _230 * _234;
    float _252 = -_230;
    float _254 = _252 + 1.0;
    float _256 = _200 * _218;
    float _258 = in.m_55.x;
    float _260 = in.m_55.y;
    float _262 = in.m_55.z;
    float _264 = fma(_238, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = fma(_248, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = fma(_242, _256, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _270 = _264 * _250;
    float _272 = _266 * _250;
    float _274 = _268 * _250;
    float _276 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].x, _270);
    float _278 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].y, _272);
    float _280 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].z, _274);
    float _282 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].x, _276);
    float _284 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].y, _278);
    float _286 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].z, _280);
    float _288 = _282 * _258;
    float _290 = _284 * _260;
    float _292 = _286 * _262;
    bool _294 = !_244;
    float _312;
    if (!_294)
    {
        float _296 = in.m_53.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_110);
        float _318 = 1.0 / _316;
        float _320 = _144 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    bool _324 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _326 = isnan(_322);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _340 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _342 = isnan(_322);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _358 = _322 + _356;
    float _360 = -_334;
    float _362 = _360 + 1.0;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _366 = 1.0 / _338;
    float _368 = _350 * _362;
    float _370 = -_350;
    float _372 = _370 + 1.0;
    float _374 = _354 * _366;
    float _376 = fma(_374, _358, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _378 = _376 * _368;
    float _380 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[115].x, _378);
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _388 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[116].x, _380);
    float _390 = _382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _392 = _384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _396 = _388 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _390;
    out.m_57.y = _392;
    out.m_57.z = _394;
    out.m_57.w = _396;
    bool _398 = !_364;
    float _416;
    if (!_398)
    {
        float _400 = in.m_53.x;
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _408 = _406 * _402;
        float _410 = floor(_408);
        float _412 = -_410;
        float _414 = _408 + _412;
        _416 = _414;
        _418 = true;
    }
    else
    {
        float _420 = float(_110);
        float _422 = 1.0 / _420;
        float _424 = _144 * _422;
        _416 = _424;
    }
    _418 = false;
    float _426 = _416;
    float _428 = in.m_53.x;
    float _430 = in.m_53.y;
    float _432 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _434 = log2(_432);
    float _436 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _438 = in.m_46.x;
    float _440 = in.m_46.y;
    float _442 = in.m_46.z;
    float _444 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _446 = in.m_53.z;
    float _448 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _450 = int(_448);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _454 = _436 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _456 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _464 = _460 || _462;
    float _466 = _292 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _468 = _434 * _144;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _472 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _474 = int(_472);
    float _476 = _428 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _478 = _430 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _480 = _428 * 2.0;
    float _482 = _430 * 2.0;
    float _484 = -_470;
    float _486 = fma(_476, 2.0, _484);
    float _488 = fma(_478, -2.0, _452);
    float _490 = _430 + _428;
    float _492 = _440 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _494 = _440 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _496 = floor(_480);
    float _498 = _440 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _500 = _490 + (-1.0);
    float _502 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[4].x, _492);
    float _504 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[5].x, _494);
    float _506 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[6].x, _498);
    float _508 = _430 + _446;
    float _510 = _446 * 2.0;
    float _512 = exp2(_468);
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _516 = _508 + (-1.0);
    float _518 = float(_450);
    float _520 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[4].z, _502);
    float _522 = float(_474);
    float _524 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _526 = floor(_482);
    float _528 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].z, _506);
    bool _530 = _496 > 0.0;
    float _532 = _522 * _144;
    bool _534 = _496 >= 0.0;
    bool _536 = isnan(_496);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = floor(_510);
    float _546 = -_512;
    float _548 = _546 + 1.0;
    bool _550 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(1.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _562 = 1.0 + _560;
    float _564 = 1.0 / _518;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _570 = _526 > 0.0;
    bool _572 = _526 >= 0.0;
    bool _574 = isnan(_526);
    bool _576 = _572 || _574;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    float _582 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[78].w, _568);
    float _584 = _464 ? _548 : 0.0;
    float _586 = 1.0 / _562;
    bool _588 = _544 > 0.0;
    float _590 = -_144;
    float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[76].x, _486);
    bool _594 = _544 >= 0.0;
    bool _596 = isnan(_544);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[78].z, _566);
    int _606 = _542 ? 0 : 1;
    float _608 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _488);
    float _610 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[5].z, _504);
    float _612 = _564 * _144;
    float _614 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _604);
    int _616 = ~_606;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _582);
    int _624 = _620;
    if (!_530)
    {
        int _626 = ~_606;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = _520 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _634 = _580 ? 0 : 1;
    float _636 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_558)
    {
        float _638 = _584 * _586;
        _146 = _638;
    }
    float _640 = _146;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _648 = _646 != 0;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _652 = _650 != 0;
    float _654 = _528 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _656 = ~_634;
    int _658 = _656 + 1;
    int _660 = _658 + 1;
    float _662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _664 = _632 + _662;
    int _666 = _660;
    if (!_570)
    {
        int _668 = ~_634;
        int _670 = _668 + 1;
        _666 = _670;
    }
    int _672 = _666;
    bool _674 = !_648;
    int _676 = _674 ? 0 : 1;
    float _678 = in.m_59.x;
    float _680 = in.m_59.y;
    float _682 = in.m_59.z;
    bool _684 = !_644;
    int _686 = _684 ? 0 : 1;
    bool _688 = !_652;
    int _690 = _688 ? 0 : 1;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _694 = _692 != 0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _702 = _700 != 0;
    int _704 = _602 ? 0 : 1;
    float _706 = float(_630);
    bool _708 = !_694;
    int _710 = _708 ? 0 : 1;
    bool _712 = !_698;
    int _714 = _712 ? 0 : 1;
    int _716 = abs(_710);
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _720 = _636 + _718;
    int _722 = abs(_714);
    int _724 = ~_704;
    int _726 = _724 + 1;
    int _728 = _726 + 1;
    float _730 = _720 * _720;
    float _732 = float(_722);
    float _734 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _736 = _654 + _734;
    int _738 = _728;
    if (!_588)
    {
        int _740 = ~_704;
        int _742 = _740 + 1;
        _738 = _742;
    }
    int _744 = _738;
    float _746 = fma(_664, _664, _730);
    float _748 = _732 * _706;
    float _750 = float(_716);
    float _752 = fma(_736, _736, _746);
    float _754 = float(_744);
    float _756 = _748 * (-2.0);
    float _758 = _430 + (-0.5);
    float _760 = sqrt(_752);
    bool _762 = !_702;
    int _764 = _762 ? 0 : 1;
    float _766 = fma(_756, _680, _680);
    float _768 = fma(_524, _756, _524);
    float _770 = _750 * _754;
    int _772 = abs(_764);
    float _774 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[196].y, _766);
    float _776 = _446 + _428;
    float _778 = rsqrt(_752);
    float _780 = float(_672);
    float _782 = _770 * (-2.0);
    float _784 = float(_772);
    float _786 = _776 + (-1.0);
    float _788 = _446 + (-0.5);
    float _790 = fma(_782, _678, _678);
    float _792 = fma(_514, _782, _514);
    float _794 = _760 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _796 = _784 * _780;
    float _798 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _800 = _428 + (-0.5);
    float _802 = fma(_768, _640, _774);
    float _804 = precise::min(_454, _794);
    float _806 = _796 * (-2.0);
    float _808 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[196].x, _790);
    float _810 = _802 * 0.15915493667125701904296875;
    float _812 = _778 * _804;
    float _814 = fma(_798, _806, _798);
    float _816 = fma(_806, _682, _682);
    float _818 = fma(_792, _640, _808);
    float _820 = _720 * _812;
    float _822 = _664 * _812;
    float _824 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[196].z, _816);
    float _826 = _818 * 0.15915493667125701904296875;
    float _828 = -_820;
    float _830 = _720 + _828;
    float _832 = -_822;
    float _834 = _664 + _832;
    float _836 = _736 * _812;
    float _838 = fma(_814, _640, _824);
    float _840 = _830 * _830;
    float _842 = _810 * 6.283185482025146484375;
    float _844 = sin(_842);
    float _846 = -_836;
    float _848 = _736 + _846;
    float _850 = _838 * 0.15915493667125701904296875;
    float _852 = fma(_834, _834, _840);
    float _854 = in.m_61.x;
    float _856 = in.m_61.y;
    float _858 = in.m_61.z;
    bool _860 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _862 = isnan(0.5);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _868 = _864 || _866;
    float _870 = fma(_848, _848, _852);
    float _872 = _810 * 6.283185482025146484375;
    float _874 = cos(_872);
    bool _876 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _878 = isnan(0.5);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _884 = _880 || _882;
    float _886 = sqrt(_870);
    float _888 = _826 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _856);
    float _894 = _826 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _778 * _886;
    float _900 = _444 * _898;
    float _902 = _436 * _898;
    float _904 = _466 * _898;
    float _906 = _850 * 6.283185482025146484375;
    float _908 = cos(_906);
    float _910 = _890 * _874;
    float _912 = _890 * _844;
    float _914 = _900 * _892;
    float _916 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _854);
    float _918 = _850 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _896 * _844;
    float _924 = _896 * _874;
    float _926 = _902 * _916;
    float _928 = _890 * _908;
    float _930 = _896 * _908;
    float _932 = _874 * _908;
    float _934 = _844 * _908;
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _858);
    float _938 = _928 * _914;
    float _940 = fma(_920, _910, _922);
    float _942 = -_912;
    float _944 = fma(_920, _924, _942);
    float _946 = -_924;
    float _948 = fma(_920, _912, _946);
    float _950 = _904 * _936;
    float _952 = -_914;
    float _954 = _920 * _952;
    float _956 = fma(_940, _926, _938);
    float _958 = _930 * _914;
    float _960 = fma(_920, _922, _910);
    float _962 = fma(_932, _926, _954);
    float _964 = fma(_948, _950, _956);
    float _966 = fma(_944, _926, _958);
    float _968 = fma(_934, _950, _962);
    float _970 = _964 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _972 = _964 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _974 = fma(_960, _950, _966);
    float _976 = -_820;
    float _978 = _636 + _976;
    float _980 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].x, _970);
    float _982 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].x, _972);
    float _984 = -_822;
    float _986 = _632 + _984;
    float _988 = _978 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _990 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _992 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].z, _982);
    float _994 = -_836;
    float _996 = _654 + _994;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[11].x, _988);
    float _1000 = _990 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1002 = _992 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1004 = _964 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1006 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[11].z, _998);
    float _1008 = _654 + _1000;
    float _1010 = _632 + _1002;
    float _1012 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1004);
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1018 = _1008 + _1016;
    float _1020 = _978 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1024 = _1010 + _1022;
    float _1026 = 1.0 / _1014;
    float _1028 = _1018 * _1018;
    float _1030 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1020);
    float _1032 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1012);
    float _1034 = fma(_1024, _1024, _1028);
    float _1036 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1030);
    float _1038 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1040 = sqrt(_1034);
    float _1042 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1044 = _636 + _1038;
    float _1046 = _1042 + _1014;
    float _1048 = _1046 * _1026;
    float _1050 = _1048 * 0.5;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1054 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1052);
    bool _1056 = _1040 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1058 = 1.0 / _1054;
    float _1060 = _968;
    float _1062 = _1038;
    float _1064 = _1032;
    float _1066 = _1034;
    float _1068 = _1054;
    float _1070 = _1010;
    float _1072 = _820;
    float _1074 = _836;
    float _1076 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1078 = _1026;
    float _1080 = _854;
    if (!_1056)
    {
        _1060 = _1010;
    }
    float _1082 = _1060;
    float _1084 = _1082;
    if (!_1056)
    {
        _1062 = _1008;
    }
    float _1086 = _1062;
    float _1088 = _1086;
    if (!_1056)
    {
        _1064 = _1044;
    }
    float _1090 = _1064;
    bool _1092 = !_1056;
    float _1094 = _1090;
    if (!_1092)
    {
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1100 = _1040 + _1098;
        float _1102 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1104 = rsqrt(_1034);
        float _1106 = _1100 * _1096;
        float _1108 = _1106 * 0.15915493667125701904296875;
        float _1110 = _1108 * 6.283185482025146484375;
        float _1112 = cos(_1110);
        float _1114 = _1108 * 6.283185482025146484375;
        float _1116 = sin(_1114);
        float _1118 = _1112 + (-1.0);
        float _1120 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = fma(_1116, _1102, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1124 = fma(_1044, _1112, _1120);
        float _1126 = _1104 * _1122;
        float _1128 = fma(_1024, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1130 = fma(_1018, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1084 = _1128;
        _1094 = _1124;
        _1088 = _1130;
        _1066 = _1104;
        _1068 = _1102;
    }
    float _1132 = _1084;
    float _1134 = _1094;
    float _1136 = _1088;
    float _1138 = _1066;
    float _1140 = _1068;
    float _1142 = -_822;
    float _1144 = _1142 + _1132;
    float _1146 = -_820;
    float _1148 = _1146 + _1134;
    float _1150 = -_836;
    float _1152 = _1150 + _1136;
    float _1154 = _1144;
    float _1156 = _1138;
    float _1158 = _1134;
    float _1160 = _1140;
    if (_884)
    {
        _1070 = 1.0;
    }
    float _1162 = _1070;
    float _1164 = _1162;
    if (_868)
    {
        _1072 = _1144;
    }
    float _1166 = _1072;
    float _1168 = _1166;
    if (_868)
    {
        _1074 = _1148;
    }
    float _1170 = _1074;
    float _1172 = _1170;
    if (_868)
    {
        _1154 = _1152;
    }
    float _1174 = _1154;
    float _1176 = _1174;
    if (!_868)
    {
        float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1180 = _978 + _1178;
        float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1184 = _986 + _1182;
        float _1186 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1188 = -_632;
        float _1190 = _1188 + _1132;
        float _1192 = _1180 * _1180;
        float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1196 = _996 + _1194;
        float _1198 = fma(_1184, _1184, _1192);
        float _1200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1202 = fma(_1196, _1196, _1198);
        float _1204 = sqrt(_1202);
        float _1206 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1208 = -_636;
        float _1210 = _1208 + _1134;
        float _1212 = -_654;
        float _1214 = _1212 + _1136;
        float _1216 = precise::min(_1204, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1218 = _1216 * _1200;
        float _1220 = _1206 * _1218;
        float _1222 = fma(_1190, _1220, _986);
        float _1224 = fma(_1210, _1220, _978);
        float _1226 = fma(_1214, _1220, _996);
        _1172 = _1224;
        _1168 = _1222;
        _1176 = _1226;
    }
    float _1228 = _1172;
    float _1230 = _1168;
    float _1232 = _1176;
    if (_884)
    {
        _1076 = 1.0;
    }
    float _1234 = _1076;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1238 = _1058 * _1236;
    float _1240 = _1234;
    if (!_884)
    {
        float _1242 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1244 = _1242 * 0.15915493667125701904296875;
        float _1246 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1248 = _1244 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = _1246 * 0.15915493667125701904296875;
        float _1254 = _1244 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        float _1258 = 1.0 / _1250;
        float _1260 = _1252 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        float _1264 = _1256 * _1258;
        float _1266 = _1252 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1272 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1270;
        float _1274 = _1262 * _1264;
        float _1276 = 1.0 / _1272;
        float _1278 = 1.0 / _1274;
        float _1280 = _1268 * _1278;
        float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1284 = fma(_1238, _1280, _1282);
        float _1286 = _1284 * _1276;
        float _1288 = precise::clamp(_1286, 0.0, 1.0);
        _1156 = _1244;
        _1164 = _1288;
    }
    float _1290 = _1156;
    float _1292 = _1164;
    if (!_884)
    {
        float _1294 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1296 = _1294 * 0.15915493667125701904296875;
        float _1298 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1300 = _1296 * 6.283185482025146484375;
        float _1302 = cos(_1300);
        float _1304 = _1298 * 0.15915493667125701904296875;
        float _1306 = _1296 * 6.283185482025146484375;
        float _1308 = sin(_1306);
        float _1310 = 1.0 / _1302;
        float _1312 = _1304 * 6.283185482025146484375;
        float _1314 = cos(_1312);
        float _1316 = _1308 * _1310;
        float _1318 = _1304 * 6.283185482025146484375;
        float _1320 = sin(_1318);
        float _1322 = _1314 * _1316;
        float _1324 = 1.0 / _1322;
        float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1328 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1326;
        float _1330 = 1.0 / _1328;
        float _1332 = _1320 * _1324;
        float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1336 = fma(_1238, _1332, _1334);
        float _1338 = _1336 * _1330;
        float _1340 = precise::clamp(_1338, 0.0, 1.0);
        float _1342 = -_1340;
        float _1344 = _1342 + 1.0;
        _1240 = _1344;
    }
    float _1346 = _1240;
    float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1350 = _1228 + _1348;
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1354 = _1230 + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1358 = _1232 + _1356;
    float _1360 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1362 = _1350 * _1350;
    float _1364 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1366 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1360);
    float _1368 = fma(_1354, _1354, _1362);
    float _1370 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1364);
    float _1372 = fma(_1358, _1358, _1368);
    float _1374 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1370);
    float _1376 = rsqrt(_1372);
    float _1378 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1380 = sqrt(_1372);
    float _1382 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1384 = _1354 * _1382;
    float _1386 = _1358 * _1382;
    float _1388 = _1384 * _1384;
    float _1390 = _1386 * _1386;
    float _1392 = _1388 + _1390;
    float _1394 = sqrt(_1392);
    bool _1396 = _1394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = _1394 + _1398;
    float _1402 = _1362;
    float _1404 = _1392;
    float _1406 = _1400;
    float _1408 = _1384;
    float _1410 = _1386;
    float _1412 = _1388;
    if (_1396)
    {
        float _1414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1402 = _1414;
    }
    float _1416 = _1402;
    if (_1396)
    {
        float _1418 = rsqrt(_1392);
        _1404 = _1418;
    }
    float _1420 = _1404;
    float _1422 = _1420;
    if (_1396)
    {
        float _1424 = _1400 * _1416;
        _1406 = _1424;
    }
    float _1426 = _1406;
    if (_1396)
    {
        float _1428 = _1426 * 0.15915493667125701904296875;
        _1078 = _1428;
    }
    float _1430 = _1078;
    float _1432 = _1416;
    if (_1396)
    {
        float _1434 = _1430 * 6.283185482025146484375;
        float _1436 = sin(_1434);
        _1432 = _1436;
    }
    float _1438 = _1432;
    float _1440 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1442 = precise::max(0.0, _1440);
    float _1444 = _1290;
    if (_1396)
    {
        float _1446 = _1430 * 6.283185482025146484375;
        float _1448 = cos(_1446);
        _1444 = _1448;
    }
    float _1450 = _1444;
    float _1452 = -_1382;
    float _1454 = -_1442;
    float _1456 = fma(_1350, _1452, _1454);
    if (_1396)
    {
        float _1458 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1158 = _1458;
    }
    float _1460 = _1158;
    float _1462 = fma(_986, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1464 = _1438;
    float _1466 = _1460;
    if (_1396)
    {
        float _1468 = fma(_1438, _1460, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1160 = _1468;
    }
    float _1470 = _1160;
    float _1472 = _1470;
    if (!_1396)
    {
        _1464 = _1456;
    }
    float _1474 = _1464;
    float _1476 = floor(_1462);
    float _1478 = _1474;
    float _1480 = _1450;
    if (_1396)
    {
        float _1482 = _1450 + (-1.0);
        _1466 = _1482;
    }
    float _1484 = _1466;
    if (_1396)
    {
        float _1486 = _1420 * _1470;
        _1472 = _1486;
    }
    float _1488 = _1472;
    if (_1396)
    {
        float _1490 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1422 = _1490;
    }
    float _1492 = _1422;
    if (_1396)
    {
        float _1494 = _1384 * _1488;
        _1408 = _1494;
    }
    float _1496 = _1408;
    if (_1396)
    {
        float _1498 = _1386 * _1488;
        _1410 = _1498;
    }
    float _1500 = _1410;
    if (_1396)
    {
        float _1502 = fma(_1456, _1450, _1492);
        _1478 = _1502;
    }
    float _1504 = _1478;
    if (_1396)
    {
        float _1506 = _1496 * _1496;
        _1412 = _1506;
    }
    float _1508 = _1412;
    if (!_1396)
    {
        _1480 = _1390;
    }
    float _1510 = _1480;
    float _1512 = _1510;
    if (_1396)
    {
        float _1514 = _1500 * _1500;
        _1512 = _1514;
    }
    float _1516 = _1512;
    float _1518 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1520 = fma(_1504, _1504, _1508);
    float _1522 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1518);
    float _1524 = _1520 + _1516;
    float _1526 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1528 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1530 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1522);
    float _1532 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1366);
    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1536 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1534);
    float _1538 = precise::clamp(_1536, 0.0, 1.0);
    float _1540 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1528);
    float _1542 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1544 = rsqrt(_1524);
    float _1546 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1548 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1540);
    float _1550 = -_1538;
    float _1552 = _1550 + 1.0;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1556 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1558 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1560 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1562 = -_1554;
    float _1564 = fma(_1562, _1526, 1.0);
    float _1566 = abs(_1552);
    float _1568 = log2(_1566);
    float _1570 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1558);
    float _1572 = fma(_996, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1574 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1570);
    float _1576 = _1544 * _1496;
    float _1578 = _1544 * _1504;
    float _1580 = floor(_1572);
    float _1582 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1574);
    float _1584 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1586 = _1544 * _1500;
    float _1588 = -_1476;
    float _1590 = _1462 + _1588;
    float _1592 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1594 = -_1584;
    float _1596 = fma(_1578, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1594);
    float _1598 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1600 = log2(_1564);
    float _1602 = -_1586;
    float _1604 = fma(_1602, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1596);
    float _1606 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1592);
    float _1608 = fma(_1604, -0.5, 0.5);
    float _1610 = fma(_1604, 0.5, 0.5);
    float _1612 = -_1580;
    float _1614 = _1572 + _1612;
    float _1616 = 1.0 / _1582;
    float _1618 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1560);
    float _1620 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1606);
    float _1622 = fma(_1610, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1624 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1618);
    float _1626 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1620);
    float _1628 = fma(_1610, _1622, -0.212114393711090087890625);
    float _1630 = exp2(_1598);
    float _1632 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1624);
    float _1634 = _1600 * 0.693147182464599609375;
    float _1636 = fma(_1610, _1628, 1.570728778839111328125);
    float _1638 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1640 = sqrt(_1608);
    float _1642 = _1578 + 1.0;
    float _1644 = _1626 * _1616;
    float _1646 = _1632 * _1616;
    float _1648 = -_1578;
    float _1650 = fma(_1630, _1642, _1648);
    float2 _5565 = float2(_1590, _1614);
    float _1652 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5565, float2(0.0), isnan(_5565)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5565, float2(0.0), isnan(_5565)), level(0.0)).x;
    float _1654 = fma(_1650, 0.5, 0.5);
    float _1656 = _1640 * 0.636619746685028076171875;
    float _1658 = fma(_1644, 0.5, 0.5);
    float _1660 = fma(_1646, -0.5, 0.5);
    float _1662 = -_1636;
    float _1664 = fma(_1656, _1662, 1.0);
    float3 _5590 = float3(_1658, _1660, _1638);
    float _1666 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5590, float3(0.0), isnan(_5590)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5590, float3(0.0), isnan(_5590)), level(0.0)).x;
    float3 _5601 = float3(_1658, _1660, _1638);
    float4 _1669 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5601, float3(0.0), isnan(_5601)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5601, float3(0.0), isnan(_5601)), level(0.0)).xyzw;
    float _1671 = _1669.x;
    float _1673 = _1669.y;
    float _1675 = _1669.z;
    float _1677 = _1669.w;
    float2 _5617 = float2(_1664, _1654);
    float3 _1681 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5617, float2(0.0), isnan(_5617)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5617, float2(0.0), isnan(_5617)), level(0.0)).xyz;
    float _1683 = _1681.x;
    float _1685 = _1681.y;
    float _1687 = _1681.z;
    float _1689 = float(uint(_474));
    float _1691 = trunc(_612);
    int _1693 = int(_1691);
    bool _1695 = _474 == 0;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1699 = _426 + _1697;
    int _1701 = abs(_686);
    out.m_63.x = _986;
    out.m_63.y = _978;
    out.m_63.z = _996;
    int _1703 = abs(_690);
    float _1705 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1707 = _430 > 0.5;
    float _1709 = 1.0 / _1689;
    out.m_65.w = _804;
    out.m_67.x = _902;
    float _1711 = float(uint(_1693));
    float _1713 = exp2(_1705);
    int _1715 = ~_474;
    int _1717 = _1715 + 1;
    out.m_69.x = _1230;
    out.m_69.y = _1228;
    out.m_69.z = _1232;
    int _1719 = ~_474;
    int _1721 = _1719 + 1;
    int _1723 = as_type<int>(_1709) + (-2);
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1727 = _1725 != 0;
    float _1729 = as_type<float>(_1723) * _1711;
    bool _1731 = !_1727;
    float _1733 = _1731 ? 7.345489978790283203125 : 1.0;
    float _1735 = -_1713;
    float _1737 = _1735 + 1.0;
    float _1739 = trunc(_1729);
    float _1741 = precise::max(_1739, 0.0);
    uint _1744 = uint(_1741);
    float _1746 = _1733 * _428;
    float _1748 = float(_110);
    float _1750 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1752 = float(_1693);
    bool _1754 = _1752 >= _522;
    bool _1756 = isnan(_1752);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(_522);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    float _1766 = 1.0 / _1748;
    int _1768 = _1717 * int(_1744);
    int _1770 = _1768 + _1693;
    float _1772 = floor(_1746);
    float _1774 = float(uint(_1770));
    float _1776 = as_type<float>(_1723) * _1774;
    float _1778 = trunc(_1764);
    int _1780 = int(_1778);
    float _1782 = _532 * _1766;
    int _1784 = _474 + (-1);
    float _1786 = -_1772;
    float _1788 = _1746 + _1786;
    float _1790 = trunc(_1776);
    float _1792 = precise::max(_1790, 0.0);
    uint _1794 = uint(_1792);
    float _1796 = _1788 * _522;
    int _1798 = ~_1780;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    float _1804 = trunc(_1796);
    int _1806 = int(_1804);
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1810 = _1808 != 0;
    int _1812 = int(_1744) + int(_1794);
    float _1814 = trunc(_1782);
    int _1816 = int(_1814);
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1820 = _1818 != 0;
    int _1822 = _1721 * _1812;
    int _1824 = _1822 + _1693;
    bool _1826 = uint(_1824) >= uint(_474);
    bool _1828 = !_1826;
    int _1830 = _1828 ? 0 : (-1);
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1834 = _1832 != 0;
    int _1836 = ~_1812;
    int _1838 = _1836 + _1830;
    int _1840 = _1838 + 1;
    bool _1842 = !_1834;
    int _1844 = _1842 ? 0 : 1;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1848 = _1846 != 0;
    int _1850 = _474 * _1840;
    int _1852 = _1850 + _1693;
    int _1854 = abs(_676);
    int _1856 = abs(_1844);
    bool _1858 = !_1695;
    int _1860 = _1858 ? _1852 : (-1);
    int _1862 = _1806 * _1856;
    int _1864 = _1862 + _1693;
    int _1866 = _1860 * _1802;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1870 = _426 + _1868;
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1874 = _1872 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1876 = _1780 * _1784;
    int _1878 = _1876 + _1866;
    bool _1880 = !_1848;
    int _1882 = _1880 ? 0 : 1;
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1886 = _1884 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1888 = _1878 * _1854;
    int _1890 = abs(_1882);
    float _1892 = 1.0 / _1874;
    int _1894 = _1816 * _1701;
    int _1896 = _1894 + _1888;
    int _1898 = _1864 * _1703;
    int _1900 = _1898 + _1896;
    int _1902 = ~_474;
    int _1904 = _1902 + 1;
    float _1906 = 1.0 / _1886;
    int _1908 = _1806 * _1890;
    int _1910 = _1908 + _1900;
    float _1912 = float(uint(_1910));
    float _1914 = as_type<float>(_1723) * _1912;
    float _1916 = trunc(_1914);
    float _1918 = precise::max(_1916, 0.0);
    uint _1920 = uint(_1918);
    int _1922 = _1904 * int(_1920);
    int _1924 = _1922 + _1910;
    float _1926 = float(uint(_1924));
    float _1928 = as_type<float>(_1723) * _1926;
    int _1930 = ~_474;
    int _1932 = _1930 + 1;
    float _1934 = trunc(_1928);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1942 = _1940 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1944 = float(uint(_1864));
    int _1946 = int(_1920) + int(_1938);
    float _1948 = as_type<float>(_1723) * _1944;
    float _1950 = in.m_71.y;
    float _1952 = 1.0 / _1942;
    int _1954 = _1932 * _1946;
    int _1956 = _1954 + _1910;
    bool _1958 = uint(_1956) >= uint(_474);
    float _1960 = trunc(_1948);
    float _1962 = precise::max(_1960, 0.0);
    uint _1964 = uint(_1962);
    bool _1966 = !_1958;
    int _1968 = _1966 ? 0 : (-1);
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1972 = _1970 != 0;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    int _1974 = ~_1946;
    int _1976 = _1974 + _1968;
    int _1978 = _1976 + 1;
    bool _1980 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1982 = isnan(_426);
    bool _1984 = _1980 || _1982;
    bool _1986 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1988 = _1984 || _1986;
    float _1990 = float(_1988);
    int _1992 = _474 * _1978;
    int _1994 = _1992 + _1910;
    float _1996 = -_1990;
    float _1998 = _1996 + 1.0;
    bool _2000 = !_1695;
    int _2002 = _2000 ? _1994 : (-1);
    float _2004 = -_1950;
    float _2006 = _2004 + 1.0;
    float _2008 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2008;
    float _2012 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2014 = _2012 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2016 = _2002 >> 31;
    float _2018 = _1950;
    float _2020 = _1582;
    float _2022 = _1632;
    if (_1810)
    {
        float _2024 = _1707 ? _2006 : _1950;
        _2018 = _2024;
    }
    float _2026 = _2018;
    float _2028 = _2010 * _1906;
    int _2030 = _2016 & 3;
    float _2032 = _2014 * _1952;
    int _2034 = ~_474;
    int _2036 = _2034 + 1;
    float _2038 = fma(_2028, _1870, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2040 = _2002 + _2030;
    bool _2042 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2044 = isnan(_426);
    bool _2046 = _2042 || _2044;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2050 = _2046 || _2048;
    float _2052 = float(_2050);
    int _2054 = _2036 * int(_1964);
    int _2056 = _2054 + _1864;
    int _2058 = _2040 >> 2;
    int _2060 = _2002 & 3;
    bool _2062 = _2060 != 0;
    float _2064 = -_2052;
    float _2066 = _2064 + 1.0;
    int _2068 = _2058 << 4;
    int _2070 = _2068 + 368;
    float _2072 = _2052 * _1998;
    float _2074 = float(uint(_2056));
    uint _2076 = uint(int(uint(_2070) >> uint(2)));
    uint _2078 = uint(int(uint(int(_2076)) >> uint(2)));
    int _2080 = int(_2076) & 3;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[int(_2078)][_2080];
    int _2084 = int(_2076) + 1;
    uint _2086 = uint(int(uint(_2084) >> uint(2)));
    int _2088 = _2084 & 3;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[int(_2086)][_2088];
    bool _2092 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2094 = isnan(_426);
    bool _2096 = _2092 || _2094;
    bool _2098 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2100 = _2096 || _2098;
    float _2102 = float(_2100);
    int _2104 = _2002 & 3;
    bool _2106 = _2104 != 0;
    float _2108 = as_type<float>(_1723) * _2074;
    float _2110 = _2102 * _2066;
    float _2112 = -_2102;
    float _2114 = _2112 + 1.0;
    bool _2116 = uint(_2104) > 1u;
    int _2118 = _2070 + 8;
    uint _2120 = uint(int(uint(_2118) >> uint(2)));
    uint _2122 = uint(int(uint(int(_2120)) >> uint(2)));
    int _2124 = int(_2120) & 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[int(_2122)][_2124];
    int _2128 = int(_2120) + 1;
    uint _2130 = uint(int(uint(_2128) >> uint(2)));
    int _2132 = _2128 & 3;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[int(_2130)][_2132];
    float _2136 = trunc(_2108);
    float _2138 = precise::max(_2136, 0.0);
    uint _2140 = uint(_2138);
    float _2142 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2142;
    bool _2146 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2148 = isnan(_426);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2154 = _2150 || _2152;
    float _2156 = float(_2154);
    int _2158 = _2062 ? 0 : 1;
    float _2160 = _2144 * _1892;
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2164 = _426 + _2162;
    float _2166 = _2156 * _2114;
    int _2168 = ~_2158;
    int _2170 = _2168 + 1;
    int _2172 = _2170 + 1;
    float _2174 = -_2156;
    float _2176 = _2174 + 1.0;
    bool _2178 = uint(_2104) >= 2u;
    float _2180 = _2038 * _2166;
    int _2182 = _2172;
    if (!_2116)
    {
        int _2184 = ~_2158;
        int _2186 = _2184 + 1;
        _2182 = _2186;
    }
    int _2188 = _2182;
    float _2190 = fma(_2032, _2164, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2192 = _2104 != 3;
    float _2194 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2180);
    int _2196 = ~_474;
    int _2198 = _2196 + 1;
    float _2200 = fma(_2160, _1699, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2202 = int(_1964) + int(_2140);
    float _2204 = fma(_2190, _2110, _2194);
    bool _2206 = !_2106;
    int _2208 = _2206 ? 0 : 1;
    float _2210 = -_1652;
    float _2212 = _2210 + 1.0;
    int _2214 = abs(_2188);
    int _2216 = _2178 ? 0 : 1;
    float _2218 = _1750 * _1666;
    int _2220 = abs(_2208);
    int _2222 = ~_2214;
    int _2224 = _2222 + 1;
    int _2226 = _2224 + 1;
    int _2228 = _2198 * _2202;
    int _2230 = _2228 + _1864;
    int _2232 = ~_2216;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    float _2238 = fma(_2200, _2072, _2204);
    int _2240 = _2236;
    if (_2192)
    {
        int _2242 = ~_2216;
        int _2244 = _2242 + 1;
        _2240 = _2244;
    }
    int _2246 = _2240;
    float _2248 = _928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2250 = ~_2220;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    float _2256 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2238);
    int _2258 = _2226 * as_type<int>(_2090);
    int _2260 = abs(_2246);
    bool _2262 = _2104 != 3;
    int _2264 = _2254 * as_type<int>(_2082);
    int _2266 = _2264 + _2258;
    bool _2268 = uint(_2230) >= uint(_474);
    float _2270 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2272 = int(_2270);
    float _2274 = as_type<float>(_2230);
    if (_1820)
    {
        float _2276 = in.m_53.x;
        _2274 = _2276;
    }
    float _2278 = _2274;
    bool _2280 = !_2262;
    int _2282 = _2280 ? 0 : (-1);
    float _2284 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2286 = !_2268;
    int _2288 = _2286 ? 0 : (-1);
    int _2290 = ~_2260;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = abs(_2282);
    bool _2298 = !_1972;
    int _2300 = _2298 ? 0 : 1;
    int _2302 = ~_2202;
    int _2304 = _2302 + _2288;
    int _2306 = _2304 + 1;
    int _2308 = _2294 * as_type<int>(_2126);
    int _2310 = _2308 + _2266;
    int _2312 = abs(_2300);
    float _2314 = in.m_71.x;
    int _2316 = ~_2296;
    int _2318 = _2316 + 1;
    int _2320 = _2318 + 1;
    int _2322 = _474 * _2306;
    int _2324 = _2322 + _1864;
    bool _2326 = _856 != 0.0;
    bool _2328 = isnan(_856);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan(0.0);
    bool _2334 = _2330 || _2332;
    float _2336 = in.m_75.x;
    float _2338 = in.m_75.y;
    float _2340 = in.m_75.z;
    int _2342 = ~_2312;
    int _2344 = _2342 + 1;
    int _2346 = _2344 + 1;
    int _2348 = _2320 * as_type<int>(_2134);
    int _2350 = _2348 + _2310;
    float _2352 = float(uint(_2272));
    int _2354 = abs(_2272);
    int _2356 = _2350 * _2346;
    bool _2358 = _854 == 0.0;
    bool _2360 = !_2334;
    bool _2362 = _2358 && _2360;
    float _2364 = 1.0 / _2352;
    bool _2366 = _858 == 0.0;
    bool _2368 = _2366 && _2362;
    float _2370 = float(uint(_2354));
    bool _2372 = !_1695;
    int _2374 = _2372 ? _2324 : (-1);
    bool _2376 = _2278 > 0.5;
    bool _2378 = _2376 && _1820;
    float _2380 = 1.0 / _2370;
    int _2382 = _2374 * _2312;
    int _2384 = _2382 + _2356;
    float _2386 = _2278;
    if (_1820)
    {
        _2386 = _2314;
    }
    float _2388 = _2386;
    float _2390 = _2336;
    float _2392 = _2340;
    float _2394 = _2388;
    float _2396 = _2338;
    if (!_2368)
    {
        float _2398 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2336);
        _2390 = _2398;
    }
    float _2400 = _2390;
    if (!_1820)
    {
        _1080 = _2314;
    }
    float _2402 = _1080;
    float _2404 = _2402;
    if (!_2368)
    {
        float _2406 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2340);
        _2392 = _2406;
    }
    float _2408 = _2392;
    int _2410 = as_type<int>(_2364) + (-2);
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2414 = float(uint(_2384));
    if (_2378)
    {
        float _2416 = -_2388;
        float _2418 = _2416 + 1.0;
        _2394 = _2418;
    }
    float _2420 = _2394;
    int _2422 = abs(_2384);
    float _2424 = _2412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2426 = as_type<float>(_2410) * _2414;
    float _2428 = _928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2430 = as_type<int>(_2380) + (-2);
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2434 = float(uint(_2422));
    float _2436 = trunc(_2426);
    float _2438 = precise::max(_2436, 0.0);
    uint _2440 = uint(_2438);
    float _2442 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1820)
    {
        _2404 = _2420;
    }
    float _2444 = _2404;
    float _2446 = as_type<float>(_2430) * _2434;
    int _2448 = ~_2272;
    int _2450 = _2448 + 1;
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2454 = ~_2354;
    int _2456 = _2454 + 1;
    if (!_2368)
    {
        float _2458 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2338);
        _2396 = _2458;
    }
    float _2460 = _2396;
    float _2462 = -_920;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2428);
    float _2466 = trunc(_2446);
    float _2468 = precise::max(_2466, 0.0);
    uint _2470 = uint(_2468);
    float _2472 = _2452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2474 = _928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2476 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2464);
    float _2478 = _948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_77.x = _2424;
    out.m_77.y = _2442;
    out.m_77.z = _2472;
    out.m_77.w = _2284;
    float _2480 = abs(_1238);
    float _2482 = log2(_2480);
    bool _2484 = _1238 <= 8000.0;
    bool _2486 = isnan(_1238);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan(8000.0);
    bool _2492 = _2488 || _2490;
    float _2494 = float(_2492);
    float _2496 = -_920;
    float _2498 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2248);
    int _2500 = _2450 * int(_2440);
    int _2502 = _2500 + _2384;
    float _2504 = -_920;
    float _2506 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2474);
    float _2508 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2498);
    float _2510 = _2476 * _2460;
    int _2512 = _2456 * int(_2470);
    int _2514 = _2512 + _2422;
    float _2516 = float(uint(_2502));
    float _2518 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2506);
    int _2520 = ~_2272;
    int _2522 = _2520 + 1;
    float _2524 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2526 = float(uint(_2514));
    float _2528 = as_type<float>(_2410) * _2516;
    float _2530 = _940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2532 = _940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2534 = _2518 * _2460;
    float _2536 = as_type<float>(_2430) * _2526;
    float _2538 = _2508 * _2460;
    float _2540 = trunc(_2528);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    float _2546 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2530);
    int _2548 = ~_2354;
    int _2550 = _2548 + 1;
    float _2552 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2532);
    float _2554 = _940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2556 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2546);
    float _2558 = _948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2560 = trunc(_2536);
    float _2562 = precise::max(_2560, 0.0);
    uint _2564 = uint(_2562);
    float _2566 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2552);
    float _2568 = fma(_2556, _2400, _2534);
    int _2570 = _2384 ^ _2272;
    float _2572 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2554);
    float _2574 = fma(_2566, _2400, _2510);
    float _2576 = _948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2578 = int(_2440) + int(_2544);
    float _2580 = exp2(_2524);
    float _2582 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2558);
    uint _2584 = uint(int(uint(_2570) >> uint(31)));
    float _2586 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2572);
    int _2588 = _2522 * _2578;
    int _2590 = _2588 + _2384;
    float _2592 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2582);
    float _2594 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2576);
    int _2596 = int(_2470) + int(_2564);
    float _2598 = fma(_2586, _2400, _2538);
    bool _2600 = uint(_2590) >= uint(_2272);
    float _2602 = fma(_2592, _2408, _2574);
    float _2604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2606 = _2550 * _2596;
    int _2608 = _2606 + _2422;
    bool _2610 = !_2600;
    int _2612 = _2610 ? 0 : (-1);
    float _2614 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2594);
    bool _2616 = _2272 == 0;
    float _2618 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2620 = precise::clamp(_2618, 0.0, 1.0);
    bool _2622 = uint(_2608) >= uint(_2354);
    float _2624 = fma(_2614, _2408, _2598);
    int _2626 = ~_2578;
    int _2628 = _2626 + _2612;
    int _2630 = _2628 + 1;
    float _2632 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2478);
    bool _2634 = !_2622;
    int _2636 = _2634 ? 0 : (-1);
    float _2638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2640 = _2272 * _2630;
    int _2642 = _2640 + _2384;
    int _2644 = ~_2636;
    int _2646 = _2596 + _2644;
    int _2648 = _2646 + 1;
    float _2650 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2632);
    int _2652 = ~int(_2584);
    int _2654 = _2652 + 1;
    float _2656 = fma(_2620, -2.0, 3.0);
    float _2658 = _2620 * _2620;
    bool _2660 = _2272 == 0;
    float _2662 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2664 = _2648 ^ _2654;
    float _2666 = _1687 * _2218;
    float _2668 = fma(_2650, _2408, _2568);
    float _2670 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2662);
    int _2672 = ~_2654;
    int _2674 = _2672 + _2664;
    int _2676 = _2674 + 1;
    float _2678 = _2658 * _2656;
    bool _2680 = !_2616;
    int _2682 = _2680 ? _2642 : (-1);
    float _2684 = _2638 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2686 = !_2660;
    int _2688 = _2686 ? _2676 : (-1);
    float _2690 = -_2678;
    float _2692 = _2690 + 1.0;
    float _2694 = float(_2682);
    float _2696 = fma(_2684, _2444, -0.5);
    float _2698 = float(_2688);
    float _2700 = fma(_2692, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2678);
    float _2702 = _2604 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2704 = fma(_2684, _2694, _592);
    float _2706 = _1582 * 0.5;
    float _2708 = in.m_79.x;
    float _2710 = _2494 * _2700;
    float _2712 = fma(_614, _2696, _2704);
    float _2714 = fma(_2702, _2026, -0.5);
    float _2716 = -_608;
    float _2718 = fma(_2702, _2698, _2716);
    float _2720 = fma(_1632, -0.5, _2706);
    float _2722 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2670);
    float _2724 = _2712 + 0.5;
    float _2726 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2728 = fma(_622, _2714, _2718);
    float _2730 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2722);
    float _2732 = _2212 * _2726;
    float _2734 = precise::clamp(_2732, 0.0, 1.0);
    float _2736 = _2728 + 0.5;
    float _2738 = _2730 + _1582;
    float _2740 = _1626 + _1582;
    out.gl_Position.x = _1626;
    out.gl_Position.y = _1632;
    out.gl_Position.z = _2730;
    out.gl_Position.w = _1582;
    float _2742 = -_2734;
    float _2744 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2746 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2748 = isnan(_1380);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2754 = _2750 || _2752;
    float _2756 = _2738 * 0.5;
    out.m_81.x = _2724;
    out.m_81.y = _2736;
    float _2758 = _2740 * 0.5;
    float _2760 = _2744 * _2708;
    float _2762 = fma(_1677, _2666, _1675);
    out.m_83.x = _2602;
    out.m_83.y = _2624;
    out.m_83.z = _2668;
    float _2764 = _1677 * _2218;
    float _2766 = -_1750;
    float _2768 = _2766 + 1.0;
    out.m_85.x = _2758;
    out.m_85.y = _2720;
    out.m_85.z = _2756;
    out.m_85.w = _1582;
    float _2770 = _2768;
    float _2772 = _2758;
    if (!_2754)
    {
        _2020 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2774 = _2020;
    float _2776 = fma(_1683, _2764, _1671);
    float _2778 = fma(_1685, _2764, _1673);
    float _2780 = _1677 * _2768;
    float _2782 = _2760 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2784 = _1292 * _1346;
    float _2786 = _2784;
    float _2788 = _2782;
    float _2790 = _2774;
    float _2792 = _2774;
    if (!_2754)
    {
        _2770 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2794 = _2770;
    out.m_87.x = _2776;
    out.m_87.y = _2778;
    out.m_87.z = _2762;
    out.m_87.w = _2780;
    float _2796 = _2794;
    float _2798 = _2794;
    if (!_2754)
    {
        _2022 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2800 = _2022;
    out.m_89.x = _2782;
    float _2802 = _2784 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2804 = _2800;
    float _2806 = _2800;
    if (!_2754)
    {
        _2772 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2808 = _2772;
    float _2810 = _2808;
    float _2812 = _2808;
    if (!_2754)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2814 = _2786;
    float _2816 = _2814;
    float _2818 = _2814;
    if (!_2754)
    {
        _2788 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2820 = _2788;
    bool _2822 = !_2754;
    float _2824 = _2820;
    float _2826 = _2820;
    if (!_2822)
    {
        bool _2828 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2830 = isnan(_1380);
        bool _2832 = _2828 || _2830;
        bool _2834 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2836 = _2832 || _2834;
        if (!_2836)
        {
            float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2840 = _1380 + _2838;
            float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2844 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2842;
            float _2846 = 1.0 / _2844;
            float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2850 = _2848 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2868 = _2840 * _2846;
            float _2870 = precise::clamp(_2868, 0.0, 1.0);
            float _2872 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2876 = fma(_2870, _2850, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2878 = fma(_2870, _2874, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2880 = fma(_2870, _2854, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2882 = fma(_2870, _2858, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2884 = fma(_2870, _2862, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2886 = fma(_2870, _2866, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2792 = _2878;
            _2826 = _2884;
            _2812 = _2876;
            _2806 = _2882;
            _2798 = _2880;
            _2818 = _2886;
            _2888 = true;
        }
        else
        {
            bool _2890 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2892 = isnan(_1380);
            bool _2894 = _2890 || _2892;
            bool _2896 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2898 = _2894 || _2896;
            if (!_2898)
            {
                _2810 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2900 = _2810;
            _2812 = _2900;
            if (!_2898)
            {
                _2790 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2902 = _2790;
            _2792 = _2902;
            if (!_2898)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2904 = _2796;
            _2798 = _2904;
            if (!_2898)
            {
                _2804 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2906 = _2804;
            _2806 = _2906;
            if (!_2898)
            {
                _2824 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2908 = _2824;
            _2826 = _2908;
            if (!_2898)
            {
                _2816 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2910 = _2816;
            bool _2912 = !_2898;
            _2818 = _2910;
            if (!_2912)
            {
                bool _2914 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2916 = isnan(_1380);
                bool _2918 = _2914 || _2916;
                bool _2920 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2922 = _2918 || _2920;
                if (!_2922)
                {
                    float _2924 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2926 = _1380 + _2924;
                    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2930 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2928;
                    float _2932 = 1.0 / _2930;
                    float _2934 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2936 = _2934 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2940 = _2938 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2942 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2946 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2950 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2952 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2954 = _2926 * _2932;
                    float _2956 = precise::clamp(_2954, 0.0, 1.0);
                    float _2958 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2960 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2962 = fma(_2956, _2936, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2964 = fma(_2956, _2960, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2966 = fma(_2956, _2940, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2968 = fma(_2956, _2944, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2970 = fma(_2956, _2948, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2972 = fma(_2956, _2952, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2792 = _2964;
                    _2826 = _2970;
                    _2812 = _2962;
                    _2806 = _2968;
                    _2798 = _2966;
                    _2818 = _2972;
                    _2888 = true;
                }
                else
                {
                    _2792 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2826 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2812 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2806 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2818 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2888 = false;
    float _2974 = _2792;
    float _2976 = _2826;
    float _2978 = _2812;
    float _2980 = _2806;
    float _2982 = _2798;
    float _2984 = _2818;
    float _2986 = _2802 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2988 = fma(_2624, -0.5, 0.5);
    float _2990 = precise::clamp(_2988, 0.0, 1.0);
    float _2992 = -_2974;
    float _2994 = _2992 + _2976;
    float _2996 = -_2978;
    float _2998 = _2996 + _2980;
    out.m_49.x = _2986;
    float _3000 = fma(_2990, _2994, _2974);
    float _3002 = -_2982;
    float _3004 = _3002 + _2984;
    float _3006 = fma(_2990, _2998, _2978);
    float _3008 = _3000 * 0.586610972881317138671875;
    bool _3010 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3012 = fma(_2990, _3004, _2982);
    out.m_91.x = 0.0;
    float _3014 = fma(_3006, 0.298911988735198974609375, _3008);
    bool _3016 = _1292 > 0.0;
    bool _3018 = isnan(_1292);
    bool _3020 = _3016 || _3018;
    bool _3022 = isnan(0.0);
    bool _3024 = _3020 || _3022;
    float _3026 = fma(_3012, 0.114477999508380889892578125, _3014);
    bool _3028 = _1346 <= 0.0;
    bool _3030 = !_3024;
    bool _3032 = _3028 || _3030;
    float _3034 = -_3026;
    float _3036 = _3006 + _3034;
    float _3038 = -_3026;
    float _3040 = _3000 + _3038;
    float _3042 = -_3026;
    float _3044 = _3012 + _3042;
    float _3046 = fma(_3036, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3026);
    float _3048 = fma(_3040, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3026);
    float _3050 = fma(_3044, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3026);
    bool _3052 = !_3010;
    if (!_3052)
    {
        float _3054 = -_1228;
        float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3058 = -_1230;
        float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3062 = -_1232;
        float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3066 = _3056 * _3056;
        float _3068 = fma(_3060, _3060, _3066);
        float _3070 = fma(_3064, _3064, _3068);
        float _3072 = sqrt(_3070);
        float _3074 = rsqrt(_3070);
        float _3076 = -_3072;
        float _3078 = _3076 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3080 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3082 = precise::clamp(_3080, 0.0, 1.0);
        float _3084 = _3060 * _3074;
        float _3086 = _3056 * _3074;
        float _3088 = abs(_3082);
        float _3090 = log2(_3088);
        float _3092 = _3064 * _3074;
        float _3094 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3096 = _2624 * _3086;
        float _3098 = -_3086;
        float _3100 = -_3094;
        float _3102 = fma(_3098, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3100);
        float _3104 = fma(_2602, _3084, _3096);
        float _3106 = -_3092;
        float _3108 = fma(_3106, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3102);
        float _3110 = fma(_2668, _3092, _3104);
        float _3112 = precise::clamp(_3110, 0.0, 1.0);
        float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3116 = _3108 + _3114;
        float _3118 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3120 = _3116 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3122 = precise::clamp(_3120, 0.0, 1.0);
        float _3124 = exp2(_3118);
        float _3126 = _3124 * _3122;
        float _3128 = _3112 * _3126;
        float _3130 = _3128 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3132 = _3128 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3134 = _3128 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3130;
        out.m_91.y = _3132;
        out.m_91.z = _3134;
    }
    out.m_65.x = _3046;
    out.m_65.y = _3048;
    out.m_65.z = _3050;
    if (!_3032)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3136 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3136;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2888 = false;
    bool _418 = false;
    bool _314 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3193 = as_type<float>(_126);
        out.gl_Position.z = _3193;
    }
    if (!_114)
    {
        return out;
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = _144;
    if (_140)
    {
        float _148 = float(_110);
        _120 = _148;
    }
    float _150 = _120;
    bool _152 = _144 >= _150;
    bool _154 = !_140;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_49.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3263 = as_type<float>(_164);
        out.gl_Position.z = _3263;
    }
    if (_156)
    {
        return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_53.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    float _218 = 1.0 / _216;
    bool _220 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _222 = isnan(_196);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -_212;
    float _234 = _232 + 1.0;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _240;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _246;
    float _250 = _230 * _234;
    float _252 = -_230;
    float _254 = _252 + 1.0;
    float _256 = _200 * _218;
    float _258 = in.m_55.x;
    float _260 = in.m_55.y;
    float _262 = in.m_55.z;
    float _264 = fma(_238, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = fma(_248, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = fma(_242, _256, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _270 = _264 * _250;
    float _272 = _266 * _250;
    float _274 = _268 * _250;
    float _276 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].x, _270);
    float _278 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].y, _272);
    float _280 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].z, _274);
    float _282 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].x, _276);
    float _284 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].y, _278);
    float _286 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].z, _280);
    float _288 = _282 * _258;
    float _290 = _284 * _260;
    float _292 = _286 * _262;
    bool _294 = !_244;
    float _312;
    if (!_294)
    {
        float _296 = in.m_53.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_110);
        float _318 = 1.0 / _316;
        float _320 = _144 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    bool _324 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _326 = isnan(_322);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _340 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _342 = isnan(_322);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _358 = _322 + _356;
    float _360 = -_334;
    float _362 = _360 + 1.0;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _366 = 1.0 / _338;
    float _368 = _350 * _362;
    float _370 = -_350;
    float _372 = _370 + 1.0;
    float _374 = _354 * _366;
    float _376 = fma(_374, _358, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _378 = _376 * _368;
    float _380 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[115].x, _378);
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _388 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[116].x, _380);
    float _390 = _382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _392 = _384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _396 = _388 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _390;
    out.m_57.y = _392;
    out.m_57.z = _394;
    out.m_57.w = _396;
    bool _398 = !_364;
    float _416;
    if (!_398)
    {
        float _400 = in.m_53.x;
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _408 = _406 * _402;
        float _410 = floor(_408);
        float _412 = -_410;
        float _414 = _408 + _412;
        _416 = _414;
        _418 = true;
    }
    else
    {
        float _420 = float(_110);
        float _422 = 1.0 / _420;
        float _424 = _144 * _422;
        _416 = _424;
    }
    _418 = false;
    float _426 = _416;
    float _428 = in.m_53.x;
    float _430 = in.m_53.y;
    float _432 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _434 = log2(_432);
    float _436 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _438 = in.m_46.x;
    float _440 = in.m_46.y;
    float _442 = in.m_46.z;
    float _444 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _446 = in.m_53.z;
    float _448 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _450 = int(_448);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _454 = _436 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _456 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _464 = _460 || _462;
    float _466 = _292 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _468 = _434 * _144;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _472 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _474 = int(_472);
    float _476 = _428 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _478 = _430 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _480 = _428 * 2.0;
    float _482 = _430 * 2.0;
    float _484 = -_470;
    float _486 = fma(_476, 2.0, _484);
    float _488 = fma(_478, -2.0, _452);
    float _490 = _430 + _428;
    float _492 = _440 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _494 = _440 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _496 = floor(_480);
    float _498 = _440 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _500 = _490 + (-1.0);
    float _502 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[4].x, _492);
    float _504 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[5].x, _494);
    float _506 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[6].x, _498);
    float _508 = _430 + _446;
    float _510 = _446 * 2.0;
    float _512 = exp2(_468);
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _516 = _508 + (-1.0);
    float _518 = float(_450);
    float _520 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[4].z, _502);
    float _522 = float(_474);
    float _524 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _526 = floor(_482);
    float _528 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].z, _506);
    bool _530 = _496 > 0.0;
    float _532 = _522 * _144;
    bool _534 = _496 >= 0.0;
    bool _536 = isnan(_496);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = floor(_510);
    float _546 = -_512;
    float _548 = _546 + 1.0;
    bool _550 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(1.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _562 = 1.0 + _560;
    float _564 = 1.0 / _518;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _570 = _526 > 0.0;
    bool _572 = _526 >= 0.0;
    bool _574 = isnan(_526);
    bool _576 = _572 || _574;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    float _582 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[78].w, _568);
    float _584 = _464 ? _548 : 0.0;
    float _586 = 1.0 / _562;
    bool _588 = _544 > 0.0;
    float _590 = -_144;
    float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[76].x, _486);
    bool _594 = _544 >= 0.0;
    bool _596 = isnan(_544);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[78].z, _566);
    int _606 = _542 ? 0 : 1;
    float _608 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _488);
    float _610 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[5].z, _504);
    float _612 = _564 * _144;
    float _614 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _604);
    int _616 = ~_606;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _582);
    int _624 = _620;
    if (!_530)
    {
        int _626 = ~_606;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = _520 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _634 = _580 ? 0 : 1;
    float _636 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_558)
    {
        float _638 = _584 * _586;
        _146 = _638;
    }
    float _640 = _146;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _648 = _646 != 0;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _652 = _650 != 0;
    float _654 = _528 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _656 = ~_634;
    int _658 = _656 + 1;
    int _660 = _658 + 1;
    float _662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _664 = _632 + _662;
    int _666 = _660;
    if (!_570)
    {
        int _668 = ~_634;
        int _670 = _668 + 1;
        _666 = _670;
    }
    int _672 = _666;
    bool _674 = !_648;
    int _676 = _674 ? 0 : 1;
    float _678 = in.m_59.x;
    float _680 = in.m_59.y;
    float _682 = in.m_59.z;
    bool _684 = !_644;
    int _686 = _684 ? 0 : 1;
    bool _688 = !_652;
    int _690 = _688 ? 0 : 1;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _694 = _692 != 0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _702 = _700 != 0;
    int _704 = _602 ? 0 : 1;
    float _706 = float(_630);
    bool _708 = !_694;
    int _710 = _708 ? 0 : 1;
    bool _712 = !_698;
    int _714 = _712 ? 0 : 1;
    int _716 = abs(_710);
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _720 = _636 + _718;
    int _722 = abs(_714);
    int _724 = ~_704;
    int _726 = _724 + 1;
    int _728 = _726 + 1;
    float _730 = _720 * _720;
    float _732 = float(_722);
    float _734 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _736 = _654 + _734;
    int _738 = _728;
    if (!_588)
    {
        int _740 = ~_704;
        int _742 = _740 + 1;
        _738 = _742;
    }
    int _744 = _738;
    float _746 = fma(_664, _664, _730);
    float _748 = _732 * _706;
    float _750 = float(_716);
    float _752 = fma(_736, _736, _746);
    float _754 = float(_744);
    float _756 = _748 * (-2.0);
    float _758 = _430 + (-0.5);
    float _760 = sqrt(_752);
    bool _762 = !_702;
    int _764 = _762 ? 0 : 1;
    float _766 = fma(_756, _680, _680);
    float _768 = fma(_524, _756, _524);
    float _770 = _750 * _754;
    int _772 = abs(_764);
    float _774 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[196].y, _766);
    float _776 = _446 + _428;
    float _778 = rsqrt(_752);
    float _780 = float(_672);
    float _782 = _770 * (-2.0);
    float _784 = float(_772);
    float _786 = _776 + (-1.0);
    float _788 = _446 + (-0.5);
    float _790 = fma(_782, _678, _678);
    float _792 = fma(_514, _782, _514);
    float _794 = _760 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _796 = _784 * _780;
    float _798 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _800 = _428 + (-0.5);
    float _802 = fma(_768, _640, _774);
    float _804 = precise::min(_454, _794);
    float _806 = _796 * (-2.0);
    float _808 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[196].x, _790);
    float _810 = _802 * 0.15915493667125701904296875;
    float _812 = _778 * _804;
    float _814 = fma(_798, _806, _798);
    float _816 = fma(_806, _682, _682);
    float _818 = fma(_792, _640, _808);
    float _820 = _720 * _812;
    float _822 = _664 * _812;
    float _824 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[196].z, _816);
    float _826 = _818 * 0.15915493667125701904296875;
    float _828 = -_820;
    float _830 = _720 + _828;
    float _832 = -_822;
    float _834 = _664 + _832;
    float _836 = _736 * _812;
    float _838 = fma(_814, _640, _824);
    float _840 = _830 * _830;
    float _842 = _810 * 6.283185482025146484375;
    float _844 = sin(_842);
    float _846 = -_836;
    float _848 = _736 + _846;
    float _850 = _838 * 0.15915493667125701904296875;
    float _852 = fma(_834, _834, _840);
    float _854 = in.m_61.x;
    float _856 = in.m_61.y;
    float _858 = in.m_61.z;
    bool _860 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _862 = isnan(0.5);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _868 = _864 || _866;
    float _870 = fma(_848, _848, _852);
    float _872 = _810 * 6.283185482025146484375;
    float _874 = cos(_872);
    bool _876 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _878 = isnan(0.5);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _884 = _880 || _882;
    float _886 = sqrt(_870);
    float _888 = _826 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _856);
    float _894 = _826 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _778 * _886;
    float _900 = _444 * _898;
    float _902 = _436 * _898;
    float _904 = _466 * _898;
    float _906 = _850 * 6.283185482025146484375;
    float _908 = cos(_906);
    float _910 = _890 * _874;
    float _912 = _890 * _844;
    float _914 = _900 * _892;
    float _916 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _854);
    float _918 = _850 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _896 * _844;
    float _924 = _896 * _874;
    float _926 = _902 * _916;
    float _928 = _890 * _908;
    float _930 = _896 * _908;
    float _932 = _874 * _908;
    float _934 = _844 * _908;
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _858);
    float _938 = _928 * _914;
    float _940 = fma(_920, _910, _922);
    float _942 = -_912;
    float _944 = fma(_920, _924, _942);
    float _946 = -_924;
    float _948 = fma(_920, _912, _946);
    float _950 = _904 * _936;
    float _952 = -_914;
    float _954 = _920 * _952;
    float _956 = fma(_940, _926, _938);
    float _958 = _930 * _914;
    float _960 = fma(_920, _922, _910);
    float _962 = fma(_932, _926, _954);
    float _964 = fma(_948, _950, _956);
    float _966 = fma(_944, _926, _958);
    float _968 = fma(_934, _950, _962);
    float _970 = _964 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _972 = _964 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _974 = fma(_960, _950, _966);
    float _976 = -_820;
    float _978 = _636 + _976;
    float _980 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].x, _970);
    float _982 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].x, _972);
    float _984 = -_822;
    float _986 = _632 + _984;
    float _988 = _978 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _990 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _992 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].z, _982);
    float _994 = -_836;
    float _996 = _654 + _994;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[11].x, _988);
    float _1000 = _990 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1002 = _992 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1004 = _964 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1006 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[11].z, _998);
    float _1008 = _654 + _1000;
    float _1010 = _632 + _1002;
    float _1012 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1004);
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1018 = _1008 + _1016;
    float _1020 = _978 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1024 = _1010 + _1022;
    float _1026 = 1.0 / _1014;
    float _1028 = _1018 * _1018;
    float _1030 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1020);
    float _1032 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1012);
    float _1034 = fma(_1024, _1024, _1028);
    float _1036 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1030);
    float _1038 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1040 = sqrt(_1034);
    float _1042 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1044 = _636 + _1038;
    float _1046 = _1042 + _1014;
    float _1048 = _1046 * _1026;
    float _1050 = _1048 * 0.5;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1054 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1052);
    bool _1056 = _1040 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1058 = 1.0 / _1054;
    float _1060 = _968;
    float _1062 = _1038;
    float _1064 = _1032;
    float _1066 = _1034;
    float _1068 = _1054;
    float _1070 = _1010;
    float _1072 = _820;
    float _1074 = _836;
    float _1076 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1078 = _1026;
    float _1080 = _854;
    if (!_1056)
    {
        _1060 = _1010;
    }
    float _1082 = _1060;
    float _1084 = _1082;
    if (!_1056)
    {
        _1062 = _1008;
    }
    float _1086 = _1062;
    float _1088 = _1086;
    if (!_1056)
    {
        _1064 = _1044;
    }
    float _1090 = _1064;
    bool _1092 = !_1056;
    float _1094 = _1090;
    if (!_1092)
    {
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1100 = _1040 + _1098;
        float _1102 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1104 = rsqrt(_1034);
        float _1106 = _1100 * _1096;
        float _1108 = _1106 * 0.15915493667125701904296875;
        float _1110 = _1108 * 6.283185482025146484375;
        float _1112 = cos(_1110);
        float _1114 = _1108 * 6.283185482025146484375;
        float _1116 = sin(_1114);
        float _1118 = _1112 + (-1.0);
        float _1120 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = fma(_1116, _1102, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1124 = fma(_1044, _1112, _1120);
        float _1126 = _1104 * _1122;
        float _1128 = fma(_1024, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1130 = fma(_1018, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1084 = _1128;
        _1094 = _1124;
        _1088 = _1130;
        _1066 = _1104;
        _1068 = _1102;
    }
    float _1132 = _1084;
    float _1134 = _1094;
    float _1136 = _1088;
    float _1138 = _1066;
    float _1140 = _1068;
    float _1142 = -_822;
    float _1144 = _1142 + _1132;
    float _1146 = -_820;
    float _1148 = _1146 + _1134;
    float _1150 = -_836;
    float _1152 = _1150 + _1136;
    float _1154 = _1144;
    float _1156 = _1138;
    float _1158 = _1134;
    float _1160 = _1140;
    if (_884)
    {
        _1070 = 1.0;
    }
    float _1162 = _1070;
    float _1164 = _1162;
    if (_868)
    {
        _1072 = _1144;
    }
    float _1166 = _1072;
    float _1168 = _1166;
    if (_868)
    {
        _1074 = _1148;
    }
    float _1170 = _1074;
    float _1172 = _1170;
    if (_868)
    {
        _1154 = _1152;
    }
    float _1174 = _1154;
    float _1176 = _1174;
    if (!_868)
    {
        float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1180 = _978 + _1178;
        float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1184 = _986 + _1182;
        float _1186 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1188 = -_632;
        float _1190 = _1188 + _1132;
        float _1192 = _1180 * _1180;
        float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1196 = _996 + _1194;
        float _1198 = fma(_1184, _1184, _1192);
        float _1200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1202 = fma(_1196, _1196, _1198);
        float _1204 = sqrt(_1202);
        float _1206 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1208 = -_636;
        float _1210 = _1208 + _1134;
        float _1212 = -_654;
        float _1214 = _1212 + _1136;
        float _1216 = precise::min(_1204, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1218 = _1216 * _1200;
        float _1220 = _1206 * _1218;
        float _1222 = fma(_1190, _1220, _986);
        float _1224 = fma(_1210, _1220, _978);
        float _1226 = fma(_1214, _1220, _996);
        _1172 = _1224;
        _1168 = _1222;
        _1176 = _1226;
    }
    float _1228 = _1172;
    float _1230 = _1168;
    float _1232 = _1176;
    if (_884)
    {
        _1076 = 1.0;
    }
    float _1234 = _1076;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1238 = _1058 * _1236;
    float _1240 = _1234;
    if (!_884)
    {
        float _1242 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1244 = _1242 * 0.15915493667125701904296875;
        float _1246 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1248 = _1244 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = _1246 * 0.15915493667125701904296875;
        float _1254 = _1244 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        float _1258 = 1.0 / _1250;
        float _1260 = _1252 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        float _1264 = _1256 * _1258;
        float _1266 = _1252 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1272 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1270;
        float _1274 = _1262 * _1264;
        float _1276 = 1.0 / _1272;
        float _1278 = 1.0 / _1274;
        float _1280 = _1268 * _1278;
        float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1284 = fma(_1238, _1280, _1282);
        float _1286 = _1284 * _1276;
        float _1288 = precise::clamp(_1286, 0.0, 1.0);
        _1156 = _1244;
        _1164 = _1288;
    }
    float _1290 = _1156;
    float _1292 = _1164;
    if (!_884)
    {
        float _1294 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1296 = _1294 * 0.15915493667125701904296875;
        float _1298 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1300 = _1296 * 6.283185482025146484375;
        float _1302 = cos(_1300);
        float _1304 = _1298 * 0.15915493667125701904296875;
        float _1306 = _1296 * 6.283185482025146484375;
        float _1308 = sin(_1306);
        float _1310 = 1.0 / _1302;
        float _1312 = _1304 * 6.283185482025146484375;
        float _1314 = cos(_1312);
        float _1316 = _1308 * _1310;
        float _1318 = _1304 * 6.283185482025146484375;
        float _1320 = sin(_1318);
        float _1322 = _1314 * _1316;
        float _1324 = 1.0 / _1322;
        float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1328 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1326;
        float _1330 = 1.0 / _1328;
        float _1332 = _1320 * _1324;
        float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1336 = fma(_1238, _1332, _1334);
        float _1338 = _1336 * _1330;
        float _1340 = precise::clamp(_1338, 0.0, 1.0);
        float _1342 = -_1340;
        float _1344 = _1342 + 1.0;
        _1240 = _1344;
    }
    float _1346 = _1240;
    float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1350 = _1228 + _1348;
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1354 = _1230 + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1358 = _1232 + _1356;
    float _1360 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1362 = _1350 * _1350;
    float _1364 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1366 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1360);
    float _1368 = fma(_1354, _1354, _1362);
    float _1370 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1364);
    float _1372 = fma(_1358, _1358, _1368);
    float _1374 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1370);
    float _1376 = rsqrt(_1372);
    float _1378 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1380 = sqrt(_1372);
    float _1382 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1384 = _1354 * _1382;
    float _1386 = _1358 * _1382;
    float _1388 = _1384 * _1384;
    float _1390 = _1386 * _1386;
    float _1392 = _1388 + _1390;
    float _1394 = sqrt(_1392);
    bool _1396 = _1394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = _1394 + _1398;
    float _1402 = _1362;
    float _1404 = _1392;
    float _1406 = _1400;
    float _1408 = _1384;
    float _1410 = _1386;
    float _1412 = _1388;
    if (_1396)
    {
        float _1414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1402 = _1414;
    }
    float _1416 = _1402;
    if (_1396)
    {
        float _1418 = rsqrt(_1392);
        _1404 = _1418;
    }
    float _1420 = _1404;
    float _1422 = _1420;
    if (_1396)
    {
        float _1424 = _1400 * _1416;
        _1406 = _1424;
    }
    float _1426 = _1406;
    if (_1396)
    {
        float _1428 = _1426 * 0.15915493667125701904296875;
        _1078 = _1428;
    }
    float _1430 = _1078;
    float _1432 = _1416;
    if (_1396)
    {
        float _1434 = _1430 * 6.283185482025146484375;
        float _1436 = sin(_1434);
        _1432 = _1436;
    }
    float _1438 = _1432;
    float _1440 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1442 = precise::max(0.0, _1440);
    float _1444 = _1290;
    if (_1396)
    {
        float _1446 = _1430 * 6.283185482025146484375;
        float _1448 = cos(_1446);
        _1444 = _1448;
    }
    float _1450 = _1444;
    float _1452 = -_1382;
    float _1454 = -_1442;
    float _1456 = fma(_1350, _1452, _1454);
    if (_1396)
    {
        float _1458 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1158 = _1458;
    }
    float _1460 = _1158;
    float _1462 = fma(_986, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1464 = _1438;
    float _1466 = _1460;
    if (_1396)
    {
        float _1468 = fma(_1438, _1460, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1160 = _1468;
    }
    float _1470 = _1160;
    float _1472 = _1470;
    if (!_1396)
    {
        _1464 = _1456;
    }
    float _1474 = _1464;
    float _1476 = floor(_1462);
    float _1478 = _1474;
    float _1480 = _1450;
    if (_1396)
    {
        float _1482 = _1450 + (-1.0);
        _1466 = _1482;
    }
    float _1484 = _1466;
    if (_1396)
    {
        float _1486 = _1420 * _1470;
        _1472 = _1486;
    }
    float _1488 = _1472;
    if (_1396)
    {
        float _1490 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1422 = _1490;
    }
    float _1492 = _1422;
    if (_1396)
    {
        float _1494 = _1384 * _1488;
        _1408 = _1494;
    }
    float _1496 = _1408;
    if (_1396)
    {
        float _1498 = _1386 * _1488;
        _1410 = _1498;
    }
    float _1500 = _1410;
    if (_1396)
    {
        float _1502 = fma(_1456, _1450, _1492);
        _1478 = _1502;
    }
    float _1504 = _1478;
    if (_1396)
    {
        float _1506 = _1496 * _1496;
        _1412 = _1506;
    }
    float _1508 = _1412;
    if (!_1396)
    {
        _1480 = _1390;
    }
    float _1510 = _1480;
    float _1512 = _1510;
    if (_1396)
    {
        float _1514 = _1500 * _1500;
        _1512 = _1514;
    }
    float _1516 = _1512;
    float _1518 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1520 = fma(_1504, _1504, _1508);
    float _1522 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1518);
    float _1524 = _1520 + _1516;
    float _1526 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1528 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1530 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1522);
    float _1532 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1366);
    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1536 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1534);
    float _1538 = precise::clamp(_1536, 0.0, 1.0);
    float _1540 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1528);
    float _1542 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1544 = rsqrt(_1524);
    float _1546 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1548 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1540);
    float _1550 = -_1538;
    float _1552 = _1550 + 1.0;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1556 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1558 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1560 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1562 = -_1554;
    float _1564 = fma(_1562, _1526, 1.0);
    float _1566 = abs(_1552);
    float _1568 = log2(_1566);
    float _1570 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1558);
    float _1572 = fma(_996, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1574 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1570);
    float _1576 = _1544 * _1496;
    float _1578 = _1544 * _1504;
    float _1580 = floor(_1572);
    float _1582 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1574);
    float _1584 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1586 = _1544 * _1500;
    float _1588 = -_1476;
    float _1590 = _1462 + _1588;
    float _1592 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1594 = -_1584;
    float _1596 = fma(_1578, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1594);
    float _1598 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1600 = log2(_1564);
    float _1602 = -_1586;
    float _1604 = fma(_1602, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1596);
    float _1606 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1592);
    float _1608 = fma(_1604, -0.5, 0.5);
    float _1610 = fma(_1604, 0.5, 0.5);
    float _1612 = -_1580;
    float _1614 = _1572 + _1612;
    float _1616 = 1.0 / _1582;
    float _1618 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1560);
    float _1620 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1606);
    float _1622 = fma(_1610, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1624 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1618);
    float _1626 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1620);
    float _1628 = fma(_1610, _1622, -0.212114393711090087890625);
    float _1630 = exp2(_1598);
    float _1632 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1624);
    float _1634 = _1600 * 0.693147182464599609375;
    float _1636 = fma(_1610, _1628, 1.570728778839111328125);
    float _1638 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1640 = sqrt(_1608);
    float _1642 = _1578 + 1.0;
    float _1644 = _1626 * _1616;
    float _1646 = _1632 * _1616;
    float _1648 = -_1578;
    float _1650 = fma(_1630, _1642, _1648);
    float2 _5565 = float2(_1590, _1614);
    float _1652 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5565, float2(0.0), isnan(_5565)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5565, float2(0.0), isnan(_5565)), level(0.0)).x;
    float _1654 = fma(_1650, 0.5, 0.5);
    float _1656 = _1640 * 0.636619746685028076171875;
    float _1658 = fma(_1644, 0.5, 0.5);
    float _1660 = fma(_1646, -0.5, 0.5);
    float _1662 = -_1636;
    float _1664 = fma(_1656, _1662, 1.0);
    float3 _5590 = float3(_1658, _1660, _1638);
    float _1666 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5590, float3(0.0), isnan(_5590)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5590, float3(0.0), isnan(_5590)), level(0.0)).x;
    float3 _5601 = float3(_1658, _1660, _1638);
    float4 _1669 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5601, float3(0.0), isnan(_5601)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5601, float3(0.0), isnan(_5601)), level(0.0)).xyzw;
    float _1671 = _1669.x;
    float _1673 = _1669.y;
    float _1675 = _1669.z;
    float _1677 = _1669.w;
    float2 _5617 = float2(_1664, _1654);
    float3 _1681 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5617, float2(0.0), isnan(_5617)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5617, float2(0.0), isnan(_5617)), level(0.0)).xyz;
    float _1683 = _1681.x;
    float _1685 = _1681.y;
    float _1687 = _1681.z;
    float _1689 = float(uint(_474));
    float _1691 = trunc(_612);
    int _1693 = int(_1691);
    bool _1695 = _474 == 0;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1699 = _426 + _1697;
    int _1701 = abs(_686);
    out.m_63.x = _986;
    out.m_63.y = _978;
    out.m_63.z = _996;
    int _1703 = abs(_690);
    float _1705 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1707 = _430 > 0.5;
    float _1709 = 1.0 / _1689;
    out.m_65.w = _804;
    out.m_67.x = _902;
    float _1711 = float(uint(_1693));
    float _1713 = exp2(_1705);
    int _1715 = ~_474;
    int _1717 = _1715 + 1;
    out.m_69.x = _1230;
    out.m_69.y = _1228;
    out.m_69.z = _1232;
    int _1719 = ~_474;
    int _1721 = _1719 + 1;
    int _1723 = as_type<int>(_1709) + (-2);
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1727 = _1725 != 0;
    float _1729 = as_type<float>(_1723) * _1711;
    bool _1731 = !_1727;
    float _1733 = _1731 ? 7.345489978790283203125 : 1.0;
    float _1735 = -_1713;
    float _1737 = _1735 + 1.0;
    float _1739 = trunc(_1729);
    float _1741 = precise::max(_1739, 0.0);
    uint _1744 = uint(_1741);
    float _1746 = _1733 * _428;
    float _1748 = float(_110);
    float _1750 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1752 = float(_1693);
    bool _1754 = _1752 >= _522;
    bool _1756 = isnan(_1752);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(_522);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    float _1766 = 1.0 / _1748;
    int _1768 = _1717 * int(_1744);
    int _1770 = _1768 + _1693;
    float _1772 = floor(_1746);
    float _1774 = float(uint(_1770));
    float _1776 = as_type<float>(_1723) * _1774;
    float _1778 = trunc(_1764);
    int _1780 = int(_1778);
    float _1782 = _532 * _1766;
    int _1784 = _474 + (-1);
    float _1786 = -_1772;
    float _1788 = _1746 + _1786;
    float _1790 = trunc(_1776);
    float _1792 = precise::max(_1790, 0.0);
    uint _1794 = uint(_1792);
    float _1796 = _1788 * _522;
    int _1798 = ~_1780;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    float _1804 = trunc(_1796);
    int _1806 = int(_1804);
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1810 = _1808 != 0;
    int _1812 = int(_1744) + int(_1794);
    float _1814 = trunc(_1782);
    int _1816 = int(_1814);
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1820 = _1818 != 0;
    int _1822 = _1721 * _1812;
    int _1824 = _1822 + _1693;
    bool _1826 = uint(_1824) >= uint(_474);
    bool _1828 = !_1826;
    int _1830 = _1828 ? 0 : (-1);
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1834 = _1832 != 0;
    int _1836 = ~_1812;
    int _1838 = _1836 + _1830;
    int _1840 = _1838 + 1;
    bool _1842 = !_1834;
    int _1844 = _1842 ? 0 : 1;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1848 = _1846 != 0;
    int _1850 = _474 * _1840;
    int _1852 = _1850 + _1693;
    int _1854 = abs(_676);
    int _1856 = abs(_1844);
    bool _1858 = !_1695;
    int _1860 = _1858 ? _1852 : (-1);
    int _1862 = _1806 * _1856;
    int _1864 = _1862 + _1693;
    int _1866 = _1860 * _1802;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1870 = _426 + _1868;
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1874 = _1872 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1876 = _1780 * _1784;
    int _1878 = _1876 + _1866;
    bool _1880 = !_1848;
    int _1882 = _1880 ? 0 : 1;
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1886 = _1884 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1888 = _1878 * _1854;
    int _1890 = abs(_1882);
    float _1892 = 1.0 / _1874;
    int _1894 = _1816 * _1701;
    int _1896 = _1894 + _1888;
    int _1898 = _1864 * _1703;
    int _1900 = _1898 + _1896;
    int _1902 = ~_474;
    int _1904 = _1902 + 1;
    float _1906 = 1.0 / _1886;
    int _1908 = _1806 * _1890;
    int _1910 = _1908 + _1900;
    float _1912 = float(uint(_1910));
    float _1914 = as_type<float>(_1723) * _1912;
    float _1916 = trunc(_1914);
    float _1918 = precise::max(_1916, 0.0);
    uint _1920 = uint(_1918);
    int _1922 = _1904 * int(_1920);
    int _1924 = _1922 + _1910;
    float _1926 = float(uint(_1924));
    float _1928 = as_type<float>(_1723) * _1926;
    int _1930 = ~_474;
    int _1932 = _1930 + 1;
    float _1934 = trunc(_1928);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1942 = _1940 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1944 = float(uint(_1864));
    int _1946 = int(_1920) + int(_1938);
    float _1948 = as_type<float>(_1723) * _1944;
    float _1950 = in.m_71.y;
    float _1952 = 1.0 / _1942;
    int _1954 = _1932 * _1946;
    int _1956 = _1954 + _1910;
    bool _1958 = uint(_1956) >= uint(_474);
    float _1960 = trunc(_1948);
    float _1962 = precise::max(_1960, 0.0);
    uint _1964 = uint(_1962);
    bool _1966 = !_1958;
    int _1968 = _1966 ? 0 : (-1);
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1972 = _1970 != 0;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    int _1974 = ~_1946;
    int _1976 = _1974 + _1968;
    int _1978 = _1976 + 1;
    bool _1980 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1982 = isnan(_426);
    bool _1984 = _1980 || _1982;
    bool _1986 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1988 = _1984 || _1986;
    float _1990 = float(_1988);
    int _1992 = _474 * _1978;
    int _1994 = _1992 + _1910;
    float _1996 = -_1990;
    float _1998 = _1996 + 1.0;
    bool _2000 = !_1695;
    int _2002 = _2000 ? _1994 : (-1);
    float _2004 = -_1950;
    float _2006 = _2004 + 1.0;
    float _2008 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2008;
    float _2012 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2014 = _2012 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2016 = _2002 >> 31;
    float _2018 = _1950;
    float _2020 = _1582;
    float _2022 = _1632;
    if (_1810)
    {
        float _2024 = _1707 ? _2006 : _1950;
        _2018 = _2024;
    }
    float _2026 = _2018;
    float _2028 = _2010 * _1906;
    int _2030 = _2016 & 3;
    float _2032 = _2014 * _1952;
    int _2034 = ~_474;
    int _2036 = _2034 + 1;
    float _2038 = fma(_2028, _1870, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2040 = _2002 + _2030;
    bool _2042 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2044 = isnan(_426);
    bool _2046 = _2042 || _2044;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2050 = _2046 || _2048;
    float _2052 = float(_2050);
    int _2054 = _2036 * int(_1964);
    int _2056 = _2054 + _1864;
    int _2058 = _2040 >> 2;
    int _2060 = _2002 & 3;
    bool _2062 = _2060 != 0;
    float _2064 = -_2052;
    float _2066 = _2064 + 1.0;
    int _2068 = _2058 << 4;
    int _2070 = _2068 + 368;
    float _2072 = _2052 * _1998;
    float _2074 = float(uint(_2056));
    uint _2076 = uint(int(uint(_2070) >> uint(2)));
    uint _2078 = uint(int(uint(int(_2076)) >> uint(2)));
    int _2080 = int(_2076) & 3;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[int(_2078)][_2080];
    int _2084 = int(_2076) + 1;
    uint _2086 = uint(int(uint(_2084) >> uint(2)));
    int _2088 = _2084 & 3;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[int(_2086)][_2088];
    bool _2092 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2094 = isnan(_426);
    bool _2096 = _2092 || _2094;
    bool _2098 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2100 = _2096 || _2098;
    float _2102 = float(_2100);
    int _2104 = _2002 & 3;
    bool _2106 = _2104 != 0;
    float _2108 = as_type<float>(_1723) * _2074;
    float _2110 = _2102 * _2066;
    float _2112 = -_2102;
    float _2114 = _2112 + 1.0;
    bool _2116 = uint(_2104) > 1u;
    int _2118 = _2070 + 8;
    uint _2120 = uint(int(uint(_2118) >> uint(2)));
    uint _2122 = uint(int(uint(int(_2120)) >> uint(2)));
    int _2124 = int(_2120) & 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[int(_2122)][_2124];
    int _2128 = int(_2120) + 1;
    uint _2130 = uint(int(uint(_2128) >> uint(2)));
    int _2132 = _2128 & 3;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[int(_2130)][_2132];
    float _2136 = trunc(_2108);
    float _2138 = precise::max(_2136, 0.0);
    uint _2140 = uint(_2138);
    float _2142 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2142;
    bool _2146 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2148 = isnan(_426);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2154 = _2150 || _2152;
    float _2156 = float(_2154);
    int _2158 = _2062 ? 0 : 1;
    float _2160 = _2144 * _1892;
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2164 = _426 + _2162;
    float _2166 = _2156 * _2114;
    int _2168 = ~_2158;
    int _2170 = _2168 + 1;
    int _2172 = _2170 + 1;
    float _2174 = -_2156;
    float _2176 = _2174 + 1.0;
    bool _2178 = uint(_2104) >= 2u;
    float _2180 = _2038 * _2166;
    int _2182 = _2172;
    if (!_2116)
    {
        int _2184 = ~_2158;
        int _2186 = _2184 + 1;
        _2182 = _2186;
    }
    int _2188 = _2182;
    float _2190 = fma(_2032, _2164, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2192 = _2104 != 3;
    float _2194 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2180);
    int _2196 = ~_474;
    int _2198 = _2196 + 1;
    float _2200 = fma(_2160, _1699, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2202 = int(_1964) + int(_2140);
    float _2204 = fma(_2190, _2110, _2194);
    bool _2206 = !_2106;
    int _2208 = _2206 ? 0 : 1;
    float _2210 = -_1652;
    float _2212 = _2210 + 1.0;
    int _2214 = abs(_2188);
    int _2216 = _2178 ? 0 : 1;
    float _2218 = _1750 * _1666;
    int _2220 = abs(_2208);
    int _2222 = ~_2214;
    int _2224 = _2222 + 1;
    int _2226 = _2224 + 1;
    int _2228 = _2198 * _2202;
    int _2230 = _2228 + _1864;
    int _2232 = ~_2216;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    float _2238 = fma(_2200, _2072, _2204);
    int _2240 = _2236;
    if (_2192)
    {
        int _2242 = ~_2216;
        int _2244 = _2242 + 1;
        _2240 = _2244;
    }
    int _2246 = _2240;
    float _2248 = _928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2250 = ~_2220;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    float _2256 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2238);
    int _2258 = _2226 * as_type<int>(_2090);
    int _2260 = abs(_2246);
    bool _2262 = _2104 != 3;
    int _2264 = _2254 * as_type<int>(_2082);
    int _2266 = _2264 + _2258;
    bool _2268 = uint(_2230) >= uint(_474);
    float _2270 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2272 = int(_2270);
    float _2274 = as_type<float>(_2230);
    if (_1820)
    {
        float _2276 = in.m_53.x;
        _2274 = _2276;
    }
    float _2278 = _2274;
    bool _2280 = !_2262;
    int _2282 = _2280 ? 0 : (-1);
    float _2284 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2286 = !_2268;
    int _2288 = _2286 ? 0 : (-1);
    int _2290 = ~_2260;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = abs(_2282);
    bool _2298 = !_1972;
    int _2300 = _2298 ? 0 : 1;
    int _2302 = ~_2202;
    int _2304 = _2302 + _2288;
    int _2306 = _2304 + 1;
    int _2308 = _2294 * as_type<int>(_2126);
    int _2310 = _2308 + _2266;
    int _2312 = abs(_2300);
    float _2314 = in.m_71.x;
    int _2316 = ~_2296;
    int _2318 = _2316 + 1;
    int _2320 = _2318 + 1;
    int _2322 = _474 * _2306;
    int _2324 = _2322 + _1864;
    bool _2326 = _856 != 0.0;
    bool _2328 = isnan(_856);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan(0.0);
    bool _2334 = _2330 || _2332;
    float _2336 = in.m_75.x;
    float _2338 = in.m_75.y;
    float _2340 = in.m_75.z;
    int _2342 = ~_2312;
    int _2344 = _2342 + 1;
    int _2346 = _2344 + 1;
    int _2348 = _2320 * as_type<int>(_2134);
    int _2350 = _2348 + _2310;
    float _2352 = float(uint(_2272));
    int _2354 = abs(_2272);
    int _2356 = _2350 * _2346;
    bool _2358 = _854 == 0.0;
    bool _2360 = !_2334;
    bool _2362 = _2358 && _2360;
    float _2364 = 1.0 / _2352;
    bool _2366 = _858 == 0.0;
    bool _2368 = _2366 && _2362;
    float _2370 = float(uint(_2354));
    bool _2372 = !_1695;
    int _2374 = _2372 ? _2324 : (-1);
    bool _2376 = _2278 > 0.5;
    bool _2378 = _2376 && _1820;
    float _2380 = 1.0 / _2370;
    int _2382 = _2374 * _2312;
    int _2384 = _2382 + _2356;
    float _2386 = _2278;
    if (_1820)
    {
        _2386 = _2314;
    }
    float _2388 = _2386;
    float _2390 = _2336;
    float _2392 = _2340;
    float _2394 = _2388;
    float _2396 = _2338;
    if (!_2368)
    {
        float _2398 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2336);
        _2390 = _2398;
    }
    float _2400 = _2390;
    if (!_1820)
    {
        _1080 = _2314;
    }
    float _2402 = _1080;
    float _2404 = _2402;
    if (!_2368)
    {
        float _2406 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2340);
        _2392 = _2406;
    }
    float _2408 = _2392;
    int _2410 = as_type<int>(_2364) + (-2);
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2414 = float(uint(_2384));
    if (_2378)
    {
        float _2416 = -_2388;
        float _2418 = _2416 + 1.0;
        _2394 = _2418;
    }
    float _2420 = _2394;
    int _2422 = abs(_2384);
    float _2424 = _2412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2426 = as_type<float>(_2410) * _2414;
    float _2428 = _928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2430 = as_type<int>(_2380) + (-2);
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2434 = float(uint(_2422));
    float _2436 = trunc(_2426);
    float _2438 = precise::max(_2436, 0.0);
    uint _2440 = uint(_2438);
    float _2442 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1820)
    {
        _2404 = _2420;
    }
    float _2444 = _2404;
    float _2446 = as_type<float>(_2430) * _2434;
    int _2448 = ~_2272;
    int _2450 = _2448 + 1;
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2454 = ~_2354;
    int _2456 = _2454 + 1;
    if (!_2368)
    {
        float _2458 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2338);
        _2396 = _2458;
    }
    float _2460 = _2396;
    float _2462 = -_920;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2428);
    float _2466 = trunc(_2446);
    float _2468 = precise::max(_2466, 0.0);
    uint _2470 = uint(_2468);
    float _2472 = _2452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2474 = _928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2476 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2464);
    float _2478 = _948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_77.x = _2424;
    out.m_77.y = _2442;
    out.m_77.z = _2472;
    out.m_77.w = _2284;
    float _2480 = abs(_1238);
    float _2482 = log2(_2480);
    bool _2484 = _1238 <= 8000.0;
    bool _2486 = isnan(_1238);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan(8000.0);
    bool _2492 = _2488 || _2490;
    float _2494 = float(_2492);
    float _2496 = -_920;
    float _2498 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2248);
    int _2500 = _2450 * int(_2440);
    int _2502 = _2500 + _2384;
    float _2504 = -_920;
    float _2506 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2474);
    float _2508 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2498);
    float _2510 = _2476 * _2460;
    int _2512 = _2456 * int(_2470);
    int _2514 = _2512 + _2422;
    float _2516 = float(uint(_2502));
    float _2518 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2506);
    int _2520 = ~_2272;
    int _2522 = _2520 + 1;
    float _2524 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2526 = float(uint(_2514));
    float _2528 = as_type<float>(_2410) * _2516;
    float _2530 = _940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2532 = _940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2534 = _2518 * _2460;
    float _2536 = as_type<float>(_2430) * _2526;
    float _2538 = _2508 * _2460;
    float _2540 = trunc(_2528);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    float _2546 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2530);
    int _2548 = ~_2354;
    int _2550 = _2548 + 1;
    float _2552 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2532);
    float _2554 = _940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2556 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2546);
    float _2558 = _948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2560 = trunc(_2536);
    float _2562 = precise::max(_2560, 0.0);
    uint _2564 = uint(_2562);
    float _2566 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2552);
    float _2568 = fma(_2556, _2400, _2534);
    int _2570 = _2384 ^ _2272;
    float _2572 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2554);
    float _2574 = fma(_2566, _2400, _2510);
    float _2576 = _948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2578 = int(_2440) + int(_2544);
    float _2580 = exp2(_2524);
    float _2582 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2558);
    uint _2584 = uint(int(uint(_2570) >> uint(31)));
    float _2586 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2572);
    int _2588 = _2522 * _2578;
    int _2590 = _2588 + _2384;
    float _2592 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2582);
    float _2594 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2576);
    int _2596 = int(_2470) + int(_2564);
    float _2598 = fma(_2586, _2400, _2538);
    bool _2600 = uint(_2590) >= uint(_2272);
    float _2602 = fma(_2592, _2408, _2574);
    float _2604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2606 = _2550 * _2596;
    int _2608 = _2606 + _2422;
    bool _2610 = !_2600;
    int _2612 = _2610 ? 0 : (-1);
    float _2614 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2594);
    bool _2616 = _2272 == 0;
    float _2618 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2620 = precise::clamp(_2618, 0.0, 1.0);
    bool _2622 = uint(_2608) >= uint(_2354);
    float _2624 = fma(_2614, _2408, _2598);
    int _2626 = ~_2578;
    int _2628 = _2626 + _2612;
    int _2630 = _2628 + 1;
    float _2632 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2478);
    bool _2634 = !_2622;
    int _2636 = _2634 ? 0 : (-1);
    float _2638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2640 = _2272 * _2630;
    int _2642 = _2640 + _2384;
    int _2644 = ~_2636;
    int _2646 = _2596 + _2644;
    int _2648 = _2646 + 1;
    float _2650 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2632);
    int _2652 = ~int(_2584);
    int _2654 = _2652 + 1;
    float _2656 = fma(_2620, -2.0, 3.0);
    float _2658 = _2620 * _2620;
    bool _2660 = _2272 == 0;
    float _2662 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2664 = _2648 ^ _2654;
    float _2666 = _1687 * _2218;
    float _2668 = fma(_2650, _2408, _2568);
    float _2670 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2662);
    int _2672 = ~_2654;
    int _2674 = _2672 + _2664;
    int _2676 = _2674 + 1;
    float _2678 = _2658 * _2656;
    bool _2680 = !_2616;
    int _2682 = _2680 ? _2642 : (-1);
    float _2684 = _2638 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2686 = !_2660;
    int _2688 = _2686 ? _2676 : (-1);
    float _2690 = -_2678;
    float _2692 = _2690 + 1.0;
    float _2694 = float(_2682);
    float _2696 = fma(_2684, _2444, -0.5);
    float _2698 = float(_2688);
    float _2700 = fma(_2692, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2678);
    float _2702 = _2604 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2704 = fma(_2684, _2694, _592);
    float _2706 = _1582 * 0.5;
    float _2708 = in.m_79.x;
    float _2710 = _2494 * _2700;
    float _2712 = fma(_614, _2696, _2704);
    float _2714 = fma(_2702, _2026, -0.5);
    float _2716 = -_608;
    float _2718 = fma(_2702, _2698, _2716);
    float _2720 = fma(_1632, -0.5, _2706);
    float _2722 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2670);
    float _2724 = _2712 + 0.5;
    float _2726 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2728 = fma(_622, _2714, _2718);
    float _2730 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2722);
    float _2732 = _2212 * _2726;
    float _2734 = precise::clamp(_2732, 0.0, 1.0);
    float _2736 = _2728 + 0.5;
    float _2738 = _2730 + _1582;
    float _2740 = _1626 + _1582;
    out.gl_Position.x = _1626;
    out.gl_Position.y = _1632;
    out.gl_Position.z = _2730;
    out.gl_Position.w = _1582;
    float _2742 = -_2734;
    float _2744 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2746 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2748 = isnan(_1380);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2754 = _2750 || _2752;
    float _2756 = _2738 * 0.5;
    out.m_81.x = _2724;
    out.m_81.y = _2736;
    float _2758 = _2740 * 0.5;
    float _2760 = _2744 * _2708;
    float _2762 = fma(_1677, _2666, _1675);
    out.m_83.x = _2602;
    out.m_83.y = _2624;
    out.m_83.z = _2668;
    float _2764 = _1677 * _2218;
    float _2766 = -_1750;
    float _2768 = _2766 + 1.0;
    out.m_85.x = _2758;
    out.m_85.y = _2720;
    out.m_85.z = _2756;
    out.m_85.w = _1582;
    float _2770 = _2768;
    float _2772 = _2758;
    if (!_2754)
    {
        _2020 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2774 = _2020;
    float _2776 = fma(_1683, _2764, _1671);
    float _2778 = fma(_1685, _2764, _1673);
    float _2780 = _1677 * _2768;
    float _2782 = _2760 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2784 = _1292 * _1346;
    float _2786 = _2784;
    float _2788 = _2782;
    float _2790 = _2774;
    float _2792 = _2774;
    if (!_2754)
    {
        _2770 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2794 = _2770;
    out.m_87.x = _2776;
    out.m_87.y = _2778;
    out.m_87.z = _2762;
    out.m_87.w = _2780;
    float _2796 = _2794;
    float _2798 = _2794;
    if (!_2754)
    {
        _2022 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2800 = _2022;
    out.m_89.x = _2782;
    float _2802 = _2784 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2804 = _2800;
    float _2806 = _2800;
    if (!_2754)
    {
        _2772 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2808 = _2772;
    float _2810 = _2808;
    float _2812 = _2808;
    if (!_2754)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2814 = _2786;
    float _2816 = _2814;
    float _2818 = _2814;
    if (!_2754)
    {
        _2788 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2820 = _2788;
    bool _2822 = !_2754;
    float _2824 = _2820;
    float _2826 = _2820;
    if (!_2822)
    {
        bool _2828 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2830 = isnan(_1380);
        bool _2832 = _2828 || _2830;
        bool _2834 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2836 = _2832 || _2834;
        if (!_2836)
        {
            float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2840 = _1380 + _2838;
            float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2844 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2842;
            float _2846 = 1.0 / _2844;
            float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2850 = _2848 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2868 = _2840 * _2846;
            float _2870 = precise::clamp(_2868, 0.0, 1.0);
            float _2872 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2876 = fma(_2870, _2850, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2878 = fma(_2870, _2874, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2880 = fma(_2870, _2854, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2882 = fma(_2870, _2858, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2884 = fma(_2870, _2862, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2886 = fma(_2870, _2866, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2792 = _2878;
            _2826 = _2884;
            _2812 = _2876;
            _2806 = _2882;
            _2798 = _2880;
            _2818 = _2886;
            _2888 = true;
        }
        else
        {
            bool _2890 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2892 = isnan(_1380);
            bool _2894 = _2890 || _2892;
            bool _2896 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2898 = _2894 || _2896;
            if (!_2898)
            {
                _2810 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2900 = _2810;
            _2812 = _2900;
            if (!_2898)
            {
                _2790 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2902 = _2790;
            _2792 = _2902;
            if (!_2898)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2904 = _2796;
            _2798 = _2904;
            if (!_2898)
            {
                _2804 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2906 = _2804;
            _2806 = _2906;
            if (!_2898)
            {
                _2824 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2908 = _2824;
            _2826 = _2908;
            if (!_2898)
            {
                _2816 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2910 = _2816;
            bool _2912 = !_2898;
            _2818 = _2910;
            if (!_2912)
            {
                bool _2914 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2916 = isnan(_1380);
                bool _2918 = _2914 || _2916;
                bool _2920 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2922 = _2918 || _2920;
                if (!_2922)
                {
                    float _2924 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2926 = _1380 + _2924;
                    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2930 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2928;
                    float _2932 = 1.0 / _2930;
                    float _2934 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2936 = _2934 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2940 = _2938 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2942 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2946 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2950 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2952 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2954 = _2926 * _2932;
                    float _2956 = precise::clamp(_2954, 0.0, 1.0);
                    float _2958 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2960 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2962 = fma(_2956, _2936, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2964 = fma(_2956, _2960, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2966 = fma(_2956, _2940, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2968 = fma(_2956, _2944, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2970 = fma(_2956, _2948, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2972 = fma(_2956, _2952, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2792 = _2964;
                    _2826 = _2970;
                    _2812 = _2962;
                    _2806 = _2968;
                    _2798 = _2966;
                    _2818 = _2972;
                    _2888 = true;
                }
                else
                {
                    _2792 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2826 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2812 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2806 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2818 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2888 = false;
    float _2974 = _2792;
    float _2976 = _2826;
    float _2978 = _2812;
    float _2980 = _2806;
    float _2982 = _2798;
    float _2984 = _2818;
    float _2986 = _2802 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2988 = fma(_2624, -0.5, 0.5);
    float _2990 = precise::clamp(_2988, 0.0, 1.0);
    float _2992 = -_2974;
    float _2994 = _2992 + _2976;
    float _2996 = -_2978;
    float _2998 = _2996 + _2980;
    out.m_49.x = _2986;
    float _3000 = fma(_2990, _2994, _2974);
    float _3002 = -_2982;
    float _3004 = _3002 + _2984;
    float _3006 = fma(_2990, _2998, _2978);
    float _3008 = _3000 * 0.586610972881317138671875;
    bool _3010 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3012 = fma(_2990, _3004, _2982);
    out.m_91.x = 0.0;
    float _3014 = fma(_3006, 0.298911988735198974609375, _3008);
    bool _3016 = _1292 > 0.0;
    bool _3018 = isnan(_1292);
    bool _3020 = _3016 || _3018;
    bool _3022 = isnan(0.0);
    bool _3024 = _3020 || _3022;
    float _3026 = fma(_3012, 0.114477999508380889892578125, _3014);
    bool _3028 = _1346 <= 0.0;
    bool _3030 = !_3024;
    bool _3032 = _3028 || _3030;
    float _3034 = -_3026;
    float _3036 = _3006 + _3034;
    float _3038 = -_3026;
    float _3040 = _3000 + _3038;
    float _3042 = -_3026;
    float _3044 = _3012 + _3042;
    float _3046 = fma(_3036, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3026);
    float _3048 = fma(_3040, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3026);
    float _3050 = fma(_3044, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3026);
    bool _3052 = !_3010;
    if (!_3052)
    {
        float _3054 = -_1228;
        float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3058 = -_1230;
        float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3062 = -_1232;
        float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3066 = _3056 * _3056;
        float _3068 = fma(_3060, _3060, _3066);
        float _3070 = fma(_3064, _3064, _3068);
        float _3072 = sqrt(_3070);
        float _3074 = rsqrt(_3070);
        float _3076 = -_3072;
        float _3078 = _3076 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3080 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3082 = precise::clamp(_3080, 0.0, 1.0);
        float _3084 = _3060 * _3074;
        float _3086 = _3056 * _3074;
        float _3088 = abs(_3082);
        float _3090 = log2(_3088);
        float _3092 = _3064 * _3074;
        float _3094 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3096 = _2624 * _3086;
        float _3098 = -_3086;
        float _3100 = -_3094;
        float _3102 = fma(_3098, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3100);
        float _3104 = fma(_2602, _3084, _3096);
        float _3106 = -_3092;
        float _3108 = fma(_3106, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3102);
        float _3110 = fma(_2668, _3092, _3104);
        float _3112 = precise::clamp(_3110, 0.0, 1.0);
        float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3116 = _3108 + _3114;
        float _3118 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3120 = _3116 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3122 = precise::clamp(_3120, 0.0, 1.0);
        float _3124 = exp2(_3118);
        float _3126 = _3124 * _3122;
        float _3128 = _3112 * _3126;
        float _3130 = _3128 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3132 = _3128 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3134 = _3128 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3130;
        out.m_91.y = _3132;
        out.m_91.z = _3134;
    }
    out.m_65.x = _3046;
    out.m_65.y = _3048;
    out.m_65.z = _3050;
    if (!_3032)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3136 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3136;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2888 = false;
    bool _418 = false;
    bool _314 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3193 = as_type<float>(_126);
        out.gl_Position.z = _3193;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = _144;
    if (_140)
    {
        float _148 = float(_110);
        _120 = _148;
    }
    float _150 = _120;
    bool _152 = _144 >= _150;
    bool _154 = !_140;
    bool _156 = _152 || _154;
    float _158 = _150;
    if (_156)
    {
        _158 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _158;
    if (_156)
    {
        out.m_49.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3263 = as_type<float>(_164);
        out.gl_Position.z = _3263;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_53.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    float _218 = 1.0 / _216;
    bool _220 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _222 = isnan(_196);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -_212;
    float _234 = _232 + 1.0;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _240;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _246;
    float _250 = _230 * _234;
    float _252 = -_230;
    float _254 = _252 + 1.0;
    float _256 = _200 * _218;
    float _258 = in.m_55.x;
    float _260 = in.m_55.y;
    float _262 = in.m_55.z;
    float _264 = fma(_238, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = fma(_248, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = fma(_242, _256, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _270 = _264 * _250;
    float _272 = _266 * _250;
    float _274 = _268 * _250;
    float _276 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].x, _270);
    float _278 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].y, _272);
    float _280 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].z, _274);
    float _282 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].x, _276);
    float _284 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].y, _278);
    float _286 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].z, _280);
    float _288 = _282 * _258;
    float _290 = _284 * _260;
    float _292 = _286 * _262;
    bool _294 = !_244;
    float _312;
    if (!_294)
    {
        float _296 = in.m_53.x;
        float _298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _300 = _296 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _304 = _302 * _298;
        float _306 = floor(_304);
        float _308 = -_306;
        float _310 = _304 + _308;
        _312 = _310;
        _314 = true;
    }
    else
    {
        float _316 = float(_110);
        float _318 = 1.0 / _316;
        float _320 = _144 * _318;
        _312 = _320;
    }
    _314 = false;
    float _322 = _312;
    bool _324 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _326 = isnan(_322);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _340 = _322 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _342 = isnan(_322);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _358 = _322 + _356;
    float _360 = -_334;
    float _362 = _360 + 1.0;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _366 = 1.0 / _338;
    float _368 = _350 * _362;
    float _370 = -_350;
    float _372 = _370 + 1.0;
    float _374 = _354 * _366;
    float _376 = fma(_374, _358, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _378 = _376 * _368;
    float _380 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[115].x, _378);
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _388 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[116].x, _380);
    float _390 = _382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _392 = _384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _394 = _386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _396 = _388 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _390;
    out.m_57.y = _392;
    out.m_57.z = _394;
    out.m_57.w = _396;
    bool _398 = !_364;
    float _416;
    if (!_398)
    {
        float _400 = in.m_53.x;
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _408 = _406 * _402;
        float _410 = floor(_408);
        float _412 = -_410;
        float _414 = _408 + _412;
        _416 = _414;
        _418 = true;
    }
    else
    {
        float _420 = float(_110);
        float _422 = 1.0 / _420;
        float _424 = _144 * _422;
        _416 = _424;
    }
    _418 = false;
    float _426 = _416;
    float _428 = in.m_53.x;
    float _430 = in.m_53.y;
    float _432 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _434 = log2(_432);
    float _436 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _438 = in.m_46.x;
    float _440 = in.m_46.y;
    float _442 = in.m_46.z;
    float _444 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _446 = in.m_53.z;
    float _448 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _450 = int(_448);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _454 = _436 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _456 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _458 = isnan(0.0);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _464 = _460 || _462;
    float _466 = _292 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _468 = _434 * _144;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _472 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _474 = int(_472);
    float _476 = _428 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _478 = _430 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _480 = _428 * 2.0;
    float _482 = _430 * 2.0;
    float _484 = -_470;
    float _486 = fma(_476, 2.0, _484);
    float _488 = fma(_478, -2.0, _452);
    float _490 = _430 + _428;
    float _492 = _440 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _494 = _440 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _496 = floor(_480);
    float _498 = _440 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _500 = _490 + (-1.0);
    float _502 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[4].x, _492);
    float _504 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[5].x, _494);
    float _506 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[6].x, _498);
    float _508 = _430 + _446;
    float _510 = _446 * 2.0;
    float _512 = exp2(_468);
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _516 = _508 + (-1.0);
    float _518 = float(_450);
    float _520 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[4].z, _502);
    float _522 = float(_474);
    float _524 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _526 = floor(_482);
    float _528 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].z, _506);
    bool _530 = _496 > 0.0;
    float _532 = _522 * _144;
    bool _534 = _496 >= 0.0;
    bool _536 = isnan(_496);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = floor(_510);
    float _546 = -_512;
    float _548 = _546 + 1.0;
    bool _550 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _552 = isnan(1.0);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _558 = _554 || _556;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _562 = 1.0 + _560;
    float _564 = 1.0 / _518;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _570 = _526 > 0.0;
    bool _572 = _526 >= 0.0;
    bool _574 = isnan(_526);
    bool _576 = _572 || _574;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    float _582 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[78].w, _568);
    float _584 = _464 ? _548 : 0.0;
    float _586 = 1.0 / _562;
    bool _588 = _544 > 0.0;
    float _590 = -_144;
    float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[76].x, _486);
    bool _594 = _544 >= 0.0;
    bool _596 = isnan(_544);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[78].z, _566);
    int _606 = _542 ? 0 : 1;
    float _608 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _488);
    float _610 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[5].z, _504);
    float _612 = _564 * _144;
    float _614 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _604);
    int _616 = ~_606;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _582);
    int _624 = _620;
    if (!_530)
    {
        int _626 = ~_606;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = _520 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _634 = _580 ? 0 : 1;
    float _636 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_558)
    {
        float _638 = _584 * _586;
        _146 = _638;
    }
    float _640 = _146;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _648 = _646 != 0;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _652 = _650 != 0;
    float _654 = _528 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _656 = ~_634;
    int _658 = _656 + 1;
    int _660 = _658 + 1;
    float _662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _664 = _632 + _662;
    int _666 = _660;
    if (!_570)
    {
        int _668 = ~_634;
        int _670 = _668 + 1;
        _666 = _670;
    }
    int _672 = _666;
    bool _674 = !_648;
    int _676 = _674 ? 0 : 1;
    float _678 = in.m_59.x;
    float _680 = in.m_59.y;
    float _682 = in.m_59.z;
    bool _684 = !_644;
    int _686 = _684 ? 0 : 1;
    bool _688 = !_652;
    int _690 = _688 ? 0 : 1;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _694 = _692 != 0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _702 = _700 != 0;
    int _704 = _602 ? 0 : 1;
    float _706 = float(_630);
    bool _708 = !_694;
    int _710 = _708 ? 0 : 1;
    bool _712 = !_698;
    int _714 = _712 ? 0 : 1;
    int _716 = abs(_710);
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _720 = _636 + _718;
    int _722 = abs(_714);
    int _724 = ~_704;
    int _726 = _724 + 1;
    int _728 = _726 + 1;
    float _730 = _720 * _720;
    float _732 = float(_722);
    float _734 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _736 = _654 + _734;
    int _738 = _728;
    if (!_588)
    {
        int _740 = ~_704;
        int _742 = _740 + 1;
        _738 = _742;
    }
    int _744 = _738;
    float _746 = fma(_664, _664, _730);
    float _748 = _732 * _706;
    float _750 = float(_716);
    float _752 = fma(_736, _736, _746);
    float _754 = float(_744);
    float _756 = _748 * (-2.0);
    float _758 = _430 + (-0.5);
    float _760 = sqrt(_752);
    bool _762 = !_702;
    int _764 = _762 ? 0 : 1;
    float _766 = fma(_756, _680, _680);
    float _768 = fma(_524, _756, _524);
    float _770 = _750 * _754;
    int _772 = abs(_764);
    float _774 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[196].y, _766);
    float _776 = _446 + _428;
    float _778 = rsqrt(_752);
    float _780 = float(_672);
    float _782 = _770 * (-2.0);
    float _784 = float(_772);
    float _786 = _776 + (-1.0);
    float _788 = _446 + (-0.5);
    float _790 = fma(_782, _678, _678);
    float _792 = fma(_514, _782, _514);
    float _794 = _760 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _796 = _784 * _780;
    float _798 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _800 = _428 + (-0.5);
    float _802 = fma(_768, _640, _774);
    float _804 = precise::min(_454, _794);
    float _806 = _796 * (-2.0);
    float _808 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[196].x, _790);
    float _810 = _802 * 0.15915493667125701904296875;
    float _812 = _778 * _804;
    float _814 = fma(_798, _806, _798);
    float _816 = fma(_806, _682, _682);
    float _818 = fma(_792, _640, _808);
    float _820 = _720 * _812;
    float _822 = _664 * _812;
    float _824 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[196].z, _816);
    float _826 = _818 * 0.15915493667125701904296875;
    float _828 = -_820;
    float _830 = _720 + _828;
    float _832 = -_822;
    float _834 = _664 + _832;
    float _836 = _736 * _812;
    float _838 = fma(_814, _640, _824);
    float _840 = _830 * _830;
    float _842 = _810 * 6.283185482025146484375;
    float _844 = sin(_842);
    float _846 = -_836;
    float _848 = _736 + _846;
    float _850 = _838 * 0.15915493667125701904296875;
    float _852 = fma(_834, _834, _840);
    float _854 = in.m_61.x;
    float _856 = in.m_61.y;
    float _858 = in.m_61.z;
    bool _860 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _862 = isnan(0.5);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _868 = _864 || _866;
    float _870 = fma(_848, _848, _852);
    float _872 = _810 * 6.283185482025146484375;
    float _874 = cos(_872);
    bool _876 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _878 = isnan(0.5);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _884 = _880 || _882;
    float _886 = sqrt(_870);
    float _888 = _826 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _856);
    float _894 = _826 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _778 * _886;
    float _900 = _444 * _898;
    float _902 = _436 * _898;
    float _904 = _466 * _898;
    float _906 = _850 * 6.283185482025146484375;
    float _908 = cos(_906);
    float _910 = _890 * _874;
    float _912 = _890 * _844;
    float _914 = _900 * _892;
    float _916 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _854);
    float _918 = _850 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _896 * _844;
    float _924 = _896 * _874;
    float _926 = _902 * _916;
    float _928 = _890 * _908;
    float _930 = _896 * _908;
    float _932 = _874 * _908;
    float _934 = _844 * _908;
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _858);
    float _938 = _928 * _914;
    float _940 = fma(_920, _910, _922);
    float _942 = -_912;
    float _944 = fma(_920, _924, _942);
    float _946 = -_924;
    float _948 = fma(_920, _912, _946);
    float _950 = _904 * _936;
    float _952 = -_914;
    float _954 = _920 * _952;
    float _956 = fma(_940, _926, _938);
    float _958 = _930 * _914;
    float _960 = fma(_920, _922, _910);
    float _962 = fma(_932, _926, _954);
    float _964 = fma(_948, _950, _956);
    float _966 = fma(_944, _926, _958);
    float _968 = fma(_934, _950, _962);
    float _970 = _964 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _972 = _964 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _974 = fma(_960, _950, _966);
    float _976 = -_820;
    float _978 = _636 + _976;
    float _980 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].x, _970);
    float _982 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].x, _972);
    float _984 = -_822;
    float _986 = _632 + _984;
    float _988 = _978 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _990 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _992 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].z, _982);
    float _994 = -_836;
    float _996 = _654 + _994;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[11].x, _988);
    float _1000 = _990 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1002 = _992 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1004 = _964 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1006 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[11].z, _998);
    float _1008 = _654 + _1000;
    float _1010 = _632 + _1002;
    float _1012 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1004);
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1018 = _1008 + _1016;
    float _1020 = _978 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1024 = _1010 + _1022;
    float _1026 = 1.0 / _1014;
    float _1028 = _1018 * _1018;
    float _1030 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1020);
    float _1032 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1012);
    float _1034 = fma(_1024, _1024, _1028);
    float _1036 = fma(_996, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1030);
    float _1038 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1040 = sqrt(_1034);
    float _1042 = _1036 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1044 = _636 + _1038;
    float _1046 = _1042 + _1014;
    float _1048 = _1046 * _1026;
    float _1050 = _1048 * 0.5;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1054 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1052);
    bool _1056 = _1040 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1058 = 1.0 / _1054;
    float _1060 = _968;
    float _1062 = _1038;
    float _1064 = _1032;
    float _1066 = _1034;
    float _1068 = _1054;
    float _1070 = _1010;
    float _1072 = _820;
    float _1074 = _836;
    float _1076 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1078 = _1026;
    float _1080 = _854;
    if (!_1056)
    {
        _1060 = _1010;
    }
    float _1082 = _1060;
    float _1084 = _1082;
    if (!_1056)
    {
        _1062 = _1008;
    }
    float _1086 = _1062;
    float _1088 = _1086;
    if (!_1056)
    {
        _1064 = _1044;
    }
    float _1090 = _1064;
    bool _1092 = !_1056;
    float _1094 = _1090;
    if (!_1092)
    {
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1100 = _1040 + _1098;
        float _1102 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1104 = rsqrt(_1034);
        float _1106 = _1100 * _1096;
        float _1108 = _1106 * 0.15915493667125701904296875;
        float _1110 = _1108 * 6.283185482025146484375;
        float _1112 = cos(_1110);
        float _1114 = _1108 * 6.283185482025146484375;
        float _1116 = sin(_1114);
        float _1118 = _1112 + (-1.0);
        float _1120 = _1118 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = fma(_1116, _1102, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1124 = fma(_1044, _1112, _1120);
        float _1126 = _1104 * _1122;
        float _1128 = fma(_1024, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1130 = fma(_1018, _1126, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1084 = _1128;
        _1094 = _1124;
        _1088 = _1130;
        _1066 = _1104;
        _1068 = _1102;
    }
    float _1132 = _1084;
    float _1134 = _1094;
    float _1136 = _1088;
    float _1138 = _1066;
    float _1140 = _1068;
    float _1142 = -_822;
    float _1144 = _1142 + _1132;
    float _1146 = -_820;
    float _1148 = _1146 + _1134;
    float _1150 = -_836;
    float _1152 = _1150 + _1136;
    float _1154 = _1144;
    float _1156 = _1138;
    float _1158 = _1134;
    float _1160 = _1140;
    if (_884)
    {
        _1070 = 1.0;
    }
    float _1162 = _1070;
    float _1164 = _1162;
    if (_868)
    {
        _1072 = _1144;
    }
    float _1166 = _1072;
    float _1168 = _1166;
    if (_868)
    {
        _1074 = _1148;
    }
    float _1170 = _1074;
    float _1172 = _1170;
    if (_868)
    {
        _1154 = _1152;
    }
    float _1174 = _1154;
    float _1176 = _1174;
    if (!_868)
    {
        float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1180 = _978 + _1178;
        float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1184 = _986 + _1182;
        float _1186 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1188 = -_632;
        float _1190 = _1188 + _1132;
        float _1192 = _1180 * _1180;
        float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1196 = _996 + _1194;
        float _1198 = fma(_1184, _1184, _1192);
        float _1200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1202 = fma(_1196, _1196, _1198);
        float _1204 = sqrt(_1202);
        float _1206 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1208 = -_636;
        float _1210 = _1208 + _1134;
        float _1212 = -_654;
        float _1214 = _1212 + _1136;
        float _1216 = precise::min(_1204, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1218 = _1216 * _1200;
        float _1220 = _1206 * _1218;
        float _1222 = fma(_1190, _1220, _986);
        float _1224 = fma(_1210, _1220, _978);
        float _1226 = fma(_1214, _1220, _996);
        _1172 = _1224;
        _1168 = _1222;
        _1176 = _1226;
    }
    float _1228 = _1172;
    float _1230 = _1168;
    float _1232 = _1176;
    if (_884)
    {
        _1076 = 1.0;
    }
    float _1234 = _1076;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1238 = _1058 * _1236;
    float _1240 = _1234;
    if (!_884)
    {
        float _1242 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1244 = _1242 * 0.15915493667125701904296875;
        float _1246 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1248 = _1244 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = _1246 * 0.15915493667125701904296875;
        float _1254 = _1244 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        float _1258 = 1.0 / _1250;
        float _1260 = _1252 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        float _1264 = _1256 * _1258;
        float _1266 = _1252 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1272 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1270;
        float _1274 = _1262 * _1264;
        float _1276 = 1.0 / _1272;
        float _1278 = 1.0 / _1274;
        float _1280 = _1268 * _1278;
        float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1284 = fma(_1238, _1280, _1282);
        float _1286 = _1284 * _1276;
        float _1288 = precise::clamp(_1286, 0.0, 1.0);
        _1156 = _1244;
        _1164 = _1288;
    }
    float _1290 = _1156;
    float _1292 = _1164;
    if (!_884)
    {
        float _1294 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1296 = _1294 * 0.15915493667125701904296875;
        float _1298 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1300 = _1296 * 6.283185482025146484375;
        float _1302 = cos(_1300);
        float _1304 = _1298 * 0.15915493667125701904296875;
        float _1306 = _1296 * 6.283185482025146484375;
        float _1308 = sin(_1306);
        float _1310 = 1.0 / _1302;
        float _1312 = _1304 * 6.283185482025146484375;
        float _1314 = cos(_1312);
        float _1316 = _1308 * _1310;
        float _1318 = _1304 * 6.283185482025146484375;
        float _1320 = sin(_1318);
        float _1322 = _1314 * _1316;
        float _1324 = 1.0 / _1322;
        float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1328 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1326;
        float _1330 = 1.0 / _1328;
        float _1332 = _1320 * _1324;
        float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1336 = fma(_1238, _1332, _1334);
        float _1338 = _1336 * _1330;
        float _1340 = precise::clamp(_1338, 0.0, 1.0);
        float _1342 = -_1340;
        float _1344 = _1342 + 1.0;
        _1240 = _1344;
    }
    float _1346 = _1240;
    float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1350 = _1228 + _1348;
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1354 = _1230 + _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1358 = _1232 + _1356;
    float _1360 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1362 = _1350 * _1350;
    float _1364 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1366 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1360);
    float _1368 = fma(_1354, _1354, _1362);
    float _1370 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1364);
    float _1372 = fma(_1358, _1358, _1368);
    float _1374 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1370);
    float _1376 = rsqrt(_1372);
    float _1378 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1380 = sqrt(_1372);
    float _1382 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1384 = _1354 * _1382;
    float _1386 = _1358 * _1382;
    float _1388 = _1384 * _1384;
    float _1390 = _1386 * _1386;
    float _1392 = _1388 + _1390;
    float _1394 = sqrt(_1392);
    bool _1396 = _1394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1400 = _1394 + _1398;
    float _1402 = _1362;
    float _1404 = _1392;
    float _1406 = _1400;
    float _1408 = _1384;
    float _1410 = _1386;
    float _1412 = _1388;
    if (_1396)
    {
        float _1414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1402 = _1414;
    }
    float _1416 = _1402;
    if (_1396)
    {
        float _1418 = rsqrt(_1392);
        _1404 = _1418;
    }
    float _1420 = _1404;
    float _1422 = _1420;
    if (_1396)
    {
        float _1424 = _1400 * _1416;
        _1406 = _1424;
    }
    float _1426 = _1406;
    if (_1396)
    {
        float _1428 = _1426 * 0.15915493667125701904296875;
        _1078 = _1428;
    }
    float _1430 = _1078;
    float _1432 = _1416;
    if (_1396)
    {
        float _1434 = _1430 * 6.283185482025146484375;
        float _1436 = sin(_1434);
        _1432 = _1436;
    }
    float _1438 = _1432;
    float _1440 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1442 = precise::max(0.0, _1440);
    float _1444 = _1290;
    if (_1396)
    {
        float _1446 = _1430 * 6.283185482025146484375;
        float _1448 = cos(_1446);
        _1444 = _1448;
    }
    float _1450 = _1444;
    float _1452 = -_1382;
    float _1454 = -_1442;
    float _1456 = fma(_1350, _1452, _1454);
    if (_1396)
    {
        float _1458 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1158 = _1458;
    }
    float _1460 = _1158;
    float _1462 = fma(_986, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1464 = _1438;
    float _1466 = _1460;
    if (_1396)
    {
        float _1468 = fma(_1438, _1460, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1160 = _1468;
    }
    float _1470 = _1160;
    float _1472 = _1470;
    if (!_1396)
    {
        _1464 = _1456;
    }
    float _1474 = _1464;
    float _1476 = floor(_1462);
    float _1478 = _1474;
    float _1480 = _1450;
    if (_1396)
    {
        float _1482 = _1450 + (-1.0);
        _1466 = _1482;
    }
    float _1484 = _1466;
    if (_1396)
    {
        float _1486 = _1420 * _1470;
        _1472 = _1486;
    }
    float _1488 = _1472;
    if (_1396)
    {
        float _1490 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1422 = _1490;
    }
    float _1492 = _1422;
    if (_1396)
    {
        float _1494 = _1384 * _1488;
        _1408 = _1494;
    }
    float _1496 = _1408;
    if (_1396)
    {
        float _1498 = _1386 * _1488;
        _1410 = _1498;
    }
    float _1500 = _1410;
    if (_1396)
    {
        float _1502 = fma(_1456, _1450, _1492);
        _1478 = _1502;
    }
    float _1504 = _1478;
    if (_1396)
    {
        float _1506 = _1496 * _1496;
        _1412 = _1506;
    }
    float _1508 = _1412;
    if (!_1396)
    {
        _1480 = _1390;
    }
    float _1510 = _1480;
    float _1512 = _1510;
    if (_1396)
    {
        float _1514 = _1500 * _1500;
        _1512 = _1514;
    }
    float _1516 = _1512;
    float _1518 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1520 = fma(_1504, _1504, _1508);
    float _1522 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1518);
    float _1524 = _1520 + _1516;
    float _1526 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1528 = _1228 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1530 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1522);
    float _1532 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1366);
    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1536 = fma(_1380, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1534);
    float _1538 = precise::clamp(_1536, 0.0, 1.0);
    float _1540 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1528);
    float _1542 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1544 = rsqrt(_1524);
    float _1546 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1548 = fma(_1232, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1540);
    float _1550 = -_1538;
    float _1552 = _1550 + 1.0;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1556 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1558 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1560 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1562 = -_1554;
    float _1564 = fma(_1562, _1526, 1.0);
    float _1566 = abs(_1552);
    float _1568 = log2(_1566);
    float _1570 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1558);
    float _1572 = fma(_996, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1574 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1570);
    float _1576 = _1544 * _1496;
    float _1578 = _1544 * _1504;
    float _1580 = floor(_1572);
    float _1582 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1574);
    float _1584 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1586 = _1544 * _1500;
    float _1588 = -_1476;
    float _1590 = _1462 + _1588;
    float _1592 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1594 = -_1584;
    float _1596 = fma(_1578, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1594);
    float _1598 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1600 = log2(_1564);
    float _1602 = -_1586;
    float _1604 = fma(_1602, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1596);
    float _1606 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1592);
    float _1608 = fma(_1604, -0.5, 0.5);
    float _1610 = fma(_1604, 0.5, 0.5);
    float _1612 = -_1580;
    float _1614 = _1572 + _1612;
    float _1616 = 1.0 / _1582;
    float _1618 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1560);
    float _1620 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1606);
    float _1622 = fma(_1610, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1624 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1618);
    float _1626 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1620);
    float _1628 = fma(_1610, _1622, -0.212114393711090087890625);
    float _1630 = exp2(_1598);
    float _1632 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1624);
    float _1634 = _1600 * 0.693147182464599609375;
    float _1636 = fma(_1610, _1628, 1.570728778839111328125);
    float _1638 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1640 = sqrt(_1608);
    float _1642 = _1578 + 1.0;
    float _1644 = _1626 * _1616;
    float _1646 = _1632 * _1616;
    float _1648 = -_1578;
    float _1650 = fma(_1630, _1642, _1648);
    float2 _5565 = float2(_1590, _1614);
    float _1652 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5565, float2(0.0), isnan(_5565)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5565, float2(0.0), isnan(_5565)), level(0.0)).x;
    float _1654 = fma(_1650, 0.5, 0.5);
    float _1656 = _1640 * 0.636619746685028076171875;
    float _1658 = fma(_1644, 0.5, 0.5);
    float _1660 = fma(_1646, -0.5, 0.5);
    float _1662 = -_1636;
    float _1664 = fma(_1656, _1662, 1.0);
    float3 _5590 = float3(_1658, _1660, _1638);
    float _1666 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5590, float3(0.0), isnan(_5590)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5590, float3(0.0), isnan(_5590)), level(0.0)).x;
    float3 _5601 = float3(_1658, _1660, _1638);
    float4 _1669 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5601, float3(0.0), isnan(_5601)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5601, float3(0.0), isnan(_5601)), level(0.0)).xyzw;
    float _1671 = _1669.x;
    float _1673 = _1669.y;
    float _1675 = _1669.z;
    float _1677 = _1669.w;
    float2 _5617 = float2(_1664, _1654);
    float3 _1681 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5617, float2(0.0), isnan(_5617)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5617, float2(0.0), isnan(_5617)), level(0.0)).xyz;
    float _1683 = _1681.x;
    float _1685 = _1681.y;
    float _1687 = _1681.z;
    float _1689 = float(uint(_474));
    float _1691 = trunc(_612);
    int _1693 = int(_1691);
    bool _1695 = _474 == 0;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1699 = _426 + _1697;
    int _1701 = abs(_686);
    out.m_63.x = _986;
    out.m_63.y = _978;
    out.m_63.z = _996;
    int _1703 = abs(_690);
    float _1705 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1707 = _430 > 0.5;
    float _1709 = 1.0 / _1689;
    out.m_65.w = _804;
    out.m_67.x = _902;
    float _1711 = float(uint(_1693));
    float _1713 = exp2(_1705);
    int _1715 = ~_474;
    int _1717 = _1715 + 1;
    out.m_69.x = _1230;
    out.m_69.y = _1228;
    out.m_69.z = _1232;
    int _1719 = ~_474;
    int _1721 = _1719 + 1;
    int _1723 = as_type<int>(_1709) + (-2);
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1727 = _1725 != 0;
    float _1729 = as_type<float>(_1723) * _1711;
    bool _1731 = !_1727;
    float _1733 = _1731 ? 7.345489978790283203125 : 1.0;
    float _1735 = -_1713;
    float _1737 = _1735 + 1.0;
    float _1739 = trunc(_1729);
    float _1741 = precise::max(_1739, 0.0);
    uint _1744 = uint(_1741);
    float _1746 = _1733 * _428;
    float _1748 = float(_110);
    float _1750 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1752 = float(_1693);
    bool _1754 = _1752 >= _522;
    bool _1756 = isnan(_1752);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(_522);
    bool _1762 = _1758 || _1760;
    float _1764 = float(_1762);
    float _1766 = 1.0 / _1748;
    int _1768 = _1717 * int(_1744);
    int _1770 = _1768 + _1693;
    float _1772 = floor(_1746);
    float _1774 = float(uint(_1770));
    float _1776 = as_type<float>(_1723) * _1774;
    float _1778 = trunc(_1764);
    int _1780 = int(_1778);
    float _1782 = _532 * _1766;
    int _1784 = _474 + (-1);
    float _1786 = -_1772;
    float _1788 = _1746 + _1786;
    float _1790 = trunc(_1776);
    float _1792 = precise::max(_1790, 0.0);
    uint _1794 = uint(_1792);
    float _1796 = _1788 * _522;
    int _1798 = ~_1780;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    float _1804 = trunc(_1796);
    int _1806 = int(_1804);
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1810 = _1808 != 0;
    int _1812 = int(_1744) + int(_1794);
    float _1814 = trunc(_1782);
    int _1816 = int(_1814);
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1820 = _1818 != 0;
    int _1822 = _1721 * _1812;
    int _1824 = _1822 + _1693;
    bool _1826 = uint(_1824) >= uint(_474);
    bool _1828 = !_1826;
    int _1830 = _1828 ? 0 : (-1);
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1834 = _1832 != 0;
    int _1836 = ~_1812;
    int _1838 = _1836 + _1830;
    int _1840 = _1838 + 1;
    bool _1842 = !_1834;
    int _1844 = _1842 ? 0 : 1;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1848 = _1846 != 0;
    int _1850 = _474 * _1840;
    int _1852 = _1850 + _1693;
    int _1854 = abs(_676);
    int _1856 = abs(_1844);
    bool _1858 = !_1695;
    int _1860 = _1858 ? _1852 : (-1);
    int _1862 = _1806 * _1856;
    int _1864 = _1862 + _1693;
    int _1866 = _1860 * _1802;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1870 = _426 + _1868;
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1874 = _1872 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1876 = _1780 * _1784;
    int _1878 = _1876 + _1866;
    bool _1880 = !_1848;
    int _1882 = _1880 ? 0 : 1;
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1886 = _1884 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1888 = _1878 * _1854;
    int _1890 = abs(_1882);
    float _1892 = 1.0 / _1874;
    int _1894 = _1816 * _1701;
    int _1896 = _1894 + _1888;
    int _1898 = _1864 * _1703;
    int _1900 = _1898 + _1896;
    int _1902 = ~_474;
    int _1904 = _1902 + 1;
    float _1906 = 1.0 / _1886;
    int _1908 = _1806 * _1890;
    int _1910 = _1908 + _1900;
    float _1912 = float(uint(_1910));
    float _1914 = as_type<float>(_1723) * _1912;
    float _1916 = trunc(_1914);
    float _1918 = precise::max(_1916, 0.0);
    uint _1920 = uint(_1918);
    int _1922 = _1904 * int(_1920);
    int _1924 = _1922 + _1910;
    float _1926 = float(uint(_1924));
    float _1928 = as_type<float>(_1723) * _1926;
    int _1930 = ~_474;
    int _1932 = _1930 + 1;
    float _1934 = trunc(_1928);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1942 = _1940 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1944 = float(uint(_1864));
    int _1946 = int(_1920) + int(_1938);
    float _1948 = as_type<float>(_1723) * _1944;
    float _1950 = in.m_71.y;
    float _1952 = 1.0 / _1942;
    int _1954 = _1932 * _1946;
    int _1956 = _1954 + _1910;
    bool _1958 = uint(_1956) >= uint(_474);
    float _1960 = trunc(_1948);
    float _1962 = precise::max(_1960, 0.0);
    uint _1964 = uint(_1962);
    bool _1966 = !_1958;
    int _1968 = _1966 ? 0 : (-1);
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1972 = _1970 != 0;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    int _1974 = ~_1946;
    int _1976 = _1974 + _1968;
    int _1978 = _1976 + 1;
    bool _1980 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1982 = isnan(_426);
    bool _1984 = _1980 || _1982;
    bool _1986 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1988 = _1984 || _1986;
    float _1990 = float(_1988);
    int _1992 = _474 * _1978;
    int _1994 = _1992 + _1910;
    float _1996 = -_1990;
    float _1998 = _1996 + 1.0;
    bool _2000 = !_1695;
    int _2002 = _2000 ? _1994 : (-1);
    float _2004 = -_1950;
    float _2006 = _2004 + 1.0;
    float _2008 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2008;
    float _2012 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2014 = _2012 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2016 = _2002 >> 31;
    float _2018 = _1950;
    float _2020 = _1582;
    float _2022 = _1632;
    if (_1810)
    {
        float _2024 = _1707 ? _2006 : _1950;
        _2018 = _2024;
    }
    float _2026 = _2018;
    float _2028 = _2010 * _1906;
    int _2030 = _2016 & 3;
    float _2032 = _2014 * _1952;
    int _2034 = ~_474;
    int _2036 = _2034 + 1;
    float _2038 = fma(_2028, _1870, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2040 = _2002 + _2030;
    bool _2042 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2044 = isnan(_426);
    bool _2046 = _2042 || _2044;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2050 = _2046 || _2048;
    float _2052 = float(_2050);
    int _2054 = _2036 * int(_1964);
    int _2056 = _2054 + _1864;
    int _2058 = _2040 >> 2;
    int _2060 = _2002 & 3;
    bool _2062 = _2060 != 0;
    float _2064 = -_2052;
    float _2066 = _2064 + 1.0;
    int _2068 = _2058 << 4;
    int _2070 = _2068 + 368;
    float _2072 = _2052 * _1998;
    float _2074 = float(uint(_2056));
    uint _2076 = uint(int(uint(_2070) >> uint(2)));
    uint _2078 = uint(int(uint(int(_2076)) >> uint(2)));
    int _2080 = int(_2076) & 3;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[int(_2078)][_2080];
    int _2084 = int(_2076) + 1;
    uint _2086 = uint(int(uint(_2084) >> uint(2)));
    int _2088 = _2084 & 3;
    float _2090 = (*spvDescriptorSet0.vp_c9)._m0[int(_2086)][_2088];
    bool _2092 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2094 = isnan(_426);
    bool _2096 = _2092 || _2094;
    bool _2098 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2100 = _2096 || _2098;
    float _2102 = float(_2100);
    int _2104 = _2002 & 3;
    bool _2106 = _2104 != 0;
    float _2108 = as_type<float>(_1723) * _2074;
    float _2110 = _2102 * _2066;
    float _2112 = -_2102;
    float _2114 = _2112 + 1.0;
    bool _2116 = uint(_2104) > 1u;
    int _2118 = _2070 + 8;
    uint _2120 = uint(int(uint(_2118) >> uint(2)));
    uint _2122 = uint(int(uint(int(_2120)) >> uint(2)));
    int _2124 = int(_2120) & 3;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[int(_2122)][_2124];
    int _2128 = int(_2120) + 1;
    uint _2130 = uint(int(uint(_2128) >> uint(2)));
    int _2132 = _2128 & 3;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[int(_2130)][_2132];
    float _2136 = trunc(_2108);
    float _2138 = precise::max(_2136, 0.0);
    uint _2140 = uint(_2138);
    float _2142 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2144 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2142;
    bool _2146 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2148 = isnan(_426);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2154 = _2150 || _2152;
    float _2156 = float(_2154);
    int _2158 = _2062 ? 0 : 1;
    float _2160 = _2144 * _1892;
    float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2164 = _426 + _2162;
    float _2166 = _2156 * _2114;
    int _2168 = ~_2158;
    int _2170 = _2168 + 1;
    int _2172 = _2170 + 1;
    float _2174 = -_2156;
    float _2176 = _2174 + 1.0;
    bool _2178 = uint(_2104) >= 2u;
    float _2180 = _2038 * _2166;
    int _2182 = _2172;
    if (!_2116)
    {
        int _2184 = ~_2158;
        int _2186 = _2184 + 1;
        _2182 = _2186;
    }
    int _2188 = _2182;
    float _2190 = fma(_2032, _2164, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2192 = _2104 != 3;
    float _2194 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2180);
    int _2196 = ~_474;
    int _2198 = _2196 + 1;
    float _2200 = fma(_2160, _1699, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2202 = int(_1964) + int(_2140);
    float _2204 = fma(_2190, _2110, _2194);
    bool _2206 = !_2106;
    int _2208 = _2206 ? 0 : 1;
    float _2210 = -_1652;
    float _2212 = _2210 + 1.0;
    int _2214 = abs(_2188);
    int _2216 = _2178 ? 0 : 1;
    float _2218 = _1750 * _1666;
    int _2220 = abs(_2208);
    int _2222 = ~_2214;
    int _2224 = _2222 + 1;
    int _2226 = _2224 + 1;
    int _2228 = _2198 * _2202;
    int _2230 = _2228 + _1864;
    int _2232 = ~_2216;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    float _2238 = fma(_2200, _2072, _2204);
    int _2240 = _2236;
    if (_2192)
    {
        int _2242 = ~_2216;
        int _2244 = _2242 + 1;
        _2240 = _2244;
    }
    int _2246 = _2240;
    float _2248 = _928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2250 = ~_2220;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    float _2256 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2238);
    int _2258 = _2226 * as_type<int>(_2090);
    int _2260 = abs(_2246);
    bool _2262 = _2104 != 3;
    int _2264 = _2254 * as_type<int>(_2082);
    int _2266 = _2264 + _2258;
    bool _2268 = uint(_2230) >= uint(_474);
    float _2270 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2272 = int(_2270);
    float _2274 = as_type<float>(_2230);
    if (_1820)
    {
        float _2276 = in.m_53.x;
        _2274 = _2276;
    }
    float _2278 = _2274;
    bool _2280 = !_2262;
    int _2282 = _2280 ? 0 : (-1);
    float _2284 = _2256 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2286 = !_2268;
    int _2288 = _2286 ? 0 : (-1);
    int _2290 = ~_2260;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    int _2296 = abs(_2282);
    bool _2298 = !_1972;
    int _2300 = _2298 ? 0 : 1;
    int _2302 = ~_2202;
    int _2304 = _2302 + _2288;
    int _2306 = _2304 + 1;
    int _2308 = _2294 * as_type<int>(_2126);
    int _2310 = _2308 + _2266;
    int _2312 = abs(_2300);
    float _2314 = in.m_71.x;
    int _2316 = ~_2296;
    int _2318 = _2316 + 1;
    int _2320 = _2318 + 1;
    int _2322 = _474 * _2306;
    int _2324 = _2322 + _1864;
    bool _2326 = _856 != 0.0;
    bool _2328 = isnan(_856);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan(0.0);
    bool _2334 = _2330 || _2332;
    float _2336 = in.m_75.x;
    float _2338 = in.m_75.y;
    float _2340 = in.m_75.z;
    int _2342 = ~_2312;
    int _2344 = _2342 + 1;
    int _2346 = _2344 + 1;
    int _2348 = _2320 * as_type<int>(_2134);
    int _2350 = _2348 + _2310;
    float _2352 = float(uint(_2272));
    int _2354 = abs(_2272);
    int _2356 = _2350 * _2346;
    bool _2358 = _854 == 0.0;
    bool _2360 = !_2334;
    bool _2362 = _2358 && _2360;
    float _2364 = 1.0 / _2352;
    bool _2366 = _858 == 0.0;
    bool _2368 = _2366 && _2362;
    float _2370 = float(uint(_2354));
    bool _2372 = !_1695;
    int _2374 = _2372 ? _2324 : (-1);
    bool _2376 = _2278 > 0.5;
    bool _2378 = _2376 && _1820;
    float _2380 = 1.0 / _2370;
    int _2382 = _2374 * _2312;
    int _2384 = _2382 + _2356;
    float _2386 = _2278;
    if (_1820)
    {
        _2386 = _2314;
    }
    float _2388 = _2386;
    float _2390 = _2336;
    float _2392 = _2340;
    float _2394 = _2388;
    float _2396 = _2338;
    if (!_2368)
    {
        float _2398 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2336);
        _2390 = _2398;
    }
    float _2400 = _2390;
    if (!_1820)
    {
        _1080 = _2314;
    }
    float _2402 = _1080;
    float _2404 = _2402;
    if (!_2368)
    {
        float _2406 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2340);
        _2392 = _2406;
    }
    float _2408 = _2392;
    int _2410 = as_type<int>(_2364) + (-2);
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2414 = float(uint(_2384));
    if (_2378)
    {
        float _2416 = -_2388;
        float _2418 = _2416 + 1.0;
        _2394 = _2418;
    }
    float _2420 = _2394;
    int _2422 = abs(_2384);
    float _2424 = _2412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2426 = as_type<float>(_2410) * _2414;
    float _2428 = _928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2430 = as_type<int>(_2380) + (-2);
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2434 = float(uint(_2422));
    float _2436 = trunc(_2426);
    float _2438 = precise::max(_2436, 0.0);
    uint _2440 = uint(_2438);
    float _2442 = _2432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1820)
    {
        _2404 = _2420;
    }
    float _2444 = _2404;
    float _2446 = as_type<float>(_2430) * _2434;
    int _2448 = ~_2272;
    int _2450 = _2448 + 1;
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2454 = ~_2354;
    int _2456 = _2454 + 1;
    if (!_2368)
    {
        float _2458 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2338);
        _2396 = _2458;
    }
    float _2460 = _2396;
    float _2462 = -_920;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2428);
    float _2466 = trunc(_2446);
    float _2468 = precise::max(_2466, 0.0);
    uint _2470 = uint(_2468);
    float _2472 = _2452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2474 = _928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2476 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2464);
    float _2478 = _948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_77.x = _2424;
    out.m_77.y = _2442;
    out.m_77.z = _2472;
    out.m_77.w = _2284;
    float _2480 = abs(_1238);
    float _2482 = log2(_2480);
    bool _2484 = _1238 <= 8000.0;
    bool _2486 = isnan(_1238);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan(8000.0);
    bool _2492 = _2488 || _2490;
    float _2494 = float(_2492);
    float _2496 = -_920;
    float _2498 = fma(_2496, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2248);
    int _2500 = _2450 * int(_2440);
    int _2502 = _2500 + _2384;
    float _2504 = -_920;
    float _2506 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2474);
    float _2508 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2498);
    float _2510 = _2476 * _2460;
    int _2512 = _2456 * int(_2470);
    int _2514 = _2512 + _2422;
    float _2516 = float(uint(_2502));
    float _2518 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2506);
    int _2520 = ~_2272;
    int _2522 = _2520 + 1;
    float _2524 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2526 = float(uint(_2514));
    float _2528 = as_type<float>(_2410) * _2516;
    float _2530 = _940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2532 = _940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2534 = _2518 * _2460;
    float _2536 = as_type<float>(_2430) * _2526;
    float _2538 = _2508 * _2460;
    float _2540 = trunc(_2528);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    float _2546 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2530);
    int _2548 = ~_2354;
    int _2550 = _2548 + 1;
    float _2552 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2532);
    float _2554 = _940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2556 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2546);
    float _2558 = _948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2560 = trunc(_2536);
    float _2562 = precise::max(_2560, 0.0);
    uint _2564 = uint(_2562);
    float _2566 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2552);
    float _2568 = fma(_2556, _2400, _2534);
    int _2570 = _2384 ^ _2272;
    float _2572 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2554);
    float _2574 = fma(_2566, _2400, _2510);
    float _2576 = _948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2578 = int(_2440) + int(_2544);
    float _2580 = exp2(_2524);
    float _2582 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2558);
    uint _2584 = uint(int(uint(_2570) >> uint(31)));
    float _2586 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2572);
    int _2588 = _2522 * _2578;
    int _2590 = _2588 + _2384;
    float _2592 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2582);
    float _2594 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2576);
    int _2596 = int(_2470) + int(_2564);
    float _2598 = fma(_2586, _2400, _2538);
    bool _2600 = uint(_2590) >= uint(_2272);
    float _2602 = fma(_2592, _2408, _2574);
    float _2604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2606 = _2550 * _2596;
    int _2608 = _2606 + _2422;
    bool _2610 = !_2600;
    int _2612 = _2610 ? 0 : (-1);
    float _2614 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2594);
    bool _2616 = _2272 == 0;
    float _2618 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2620 = precise::clamp(_2618, 0.0, 1.0);
    bool _2622 = uint(_2608) >= uint(_2354);
    float _2624 = fma(_2614, _2408, _2598);
    int _2626 = ~_2578;
    int _2628 = _2626 + _2612;
    int _2630 = _2628 + 1;
    float _2632 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2478);
    bool _2634 = !_2622;
    int _2636 = _2634 ? 0 : (-1);
    float _2638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2640 = _2272 * _2630;
    int _2642 = _2640 + _2384;
    int _2644 = ~_2636;
    int _2646 = _2596 + _2644;
    int _2648 = _2646 + 1;
    float _2650 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2632);
    int _2652 = ~int(_2584);
    int _2654 = _2652 + 1;
    float _2656 = fma(_2620, -2.0, 3.0);
    float _2658 = _2620 * _2620;
    bool _2660 = _2272 == 0;
    float _2662 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2664 = _2648 ^ _2654;
    float _2666 = _1687 * _2218;
    float _2668 = fma(_2650, _2408, _2568);
    float _2670 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2662);
    int _2672 = ~_2654;
    int _2674 = _2672 + _2664;
    int _2676 = _2674 + 1;
    float _2678 = _2658 * _2656;
    bool _2680 = !_2616;
    int _2682 = _2680 ? _2642 : (-1);
    float _2684 = _2638 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2686 = !_2660;
    int _2688 = _2686 ? _2676 : (-1);
    float _2690 = -_2678;
    float _2692 = _2690 + 1.0;
    float _2694 = float(_2682);
    float _2696 = fma(_2684, _2444, -0.5);
    float _2698 = float(_2688);
    float _2700 = fma(_2692, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2678);
    float _2702 = _2604 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2704 = fma(_2684, _2694, _592);
    float _2706 = _1582 * 0.5;
    float _2708 = in.m_79.x;
    float _2710 = _2494 * _2700;
    float _2712 = fma(_614, _2696, _2704);
    float _2714 = fma(_2702, _2026, -0.5);
    float _2716 = -_608;
    float _2718 = fma(_2702, _2698, _2716);
    float _2720 = fma(_1632, -0.5, _2706);
    float _2722 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2670);
    float _2724 = _2712 + 0.5;
    float _2726 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2728 = fma(_622, _2714, _2718);
    float _2730 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2722);
    float _2732 = _2212 * _2726;
    float _2734 = precise::clamp(_2732, 0.0, 1.0);
    float _2736 = _2728 + 0.5;
    float _2738 = _2730 + _1582;
    float _2740 = _1626 + _1582;
    out.gl_Position.x = _1626;
    out.gl_Position.y = _1632;
    out.gl_Position.z = _2730;
    out.gl_Position.w = _1582;
    float _2742 = -_2734;
    float _2744 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2746 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2748 = isnan(_1380);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2754 = _2750 || _2752;
    float _2756 = _2738 * 0.5;
    out.m_81.x = _2724;
    out.m_81.y = _2736;
    float _2758 = _2740 * 0.5;
    float _2760 = _2744 * _2708;
    float _2762 = fma(_1677, _2666, _1675);
    out.m_83.x = _2602;
    out.m_83.y = _2624;
    out.m_83.z = _2668;
    float _2764 = _1677 * _2218;
    float _2766 = -_1750;
    float _2768 = _2766 + 1.0;
    out.m_85.x = _2758;
    out.m_85.y = _2720;
    out.m_85.z = _2756;
    out.m_85.w = _1582;
    float _2770 = _2768;
    float _2772 = _2758;
    if (!_2754)
    {
        _2020 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2774 = _2020;
    float _2776 = fma(_1683, _2764, _1671);
    float _2778 = fma(_1685, _2764, _1673);
    float _2780 = _1677 * _2768;
    float _2782 = _2760 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2784 = _1292 * _1346;
    float _2786 = _2784;
    float _2788 = _2782;
    float _2790 = _2774;
    float _2792 = _2774;
    if (!_2754)
    {
        _2770 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2794 = _2770;
    out.m_87.x = _2776;
    out.m_87.y = _2778;
    out.m_87.z = _2762;
    out.m_87.w = _2780;
    float _2796 = _2794;
    float _2798 = _2794;
    if (!_2754)
    {
        _2022 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2800 = _2022;
    out.m_89.x = _2782;
    float _2802 = _2784 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2804 = _2800;
    float _2806 = _2800;
    if (!_2754)
    {
        _2772 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2808 = _2772;
    float _2810 = _2808;
    float _2812 = _2808;
    if (!_2754)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2814 = _2786;
    float _2816 = _2814;
    float _2818 = _2814;
    if (!_2754)
    {
        _2788 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2820 = _2788;
    bool _2822 = !_2754;
    float _2824 = _2820;
    float _2826 = _2820;
    if (!_2822)
    {
        bool _2828 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2830 = isnan(_1380);
        bool _2832 = _2828 || _2830;
        bool _2834 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2836 = _2832 || _2834;
        if (!_2836)
        {
            float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2840 = _1380 + _2838;
            float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2844 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2842;
            float _2846 = 1.0 / _2844;
            float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2850 = _2848 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2854 = _2852 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2858 = _2856 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2860 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2862 = _2860 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2864 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2866 = _2864 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2868 = _2840 * _2846;
            float _2870 = precise::clamp(_2868, 0.0, 1.0);
            float _2872 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2874 = _2872 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2876 = fma(_2870, _2850, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2878 = fma(_2870, _2874, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2880 = fma(_2870, _2854, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2882 = fma(_2870, _2858, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2884 = fma(_2870, _2862, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2886 = fma(_2870, _2866, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2792 = _2878;
            _2826 = _2884;
            _2812 = _2876;
            _2806 = _2882;
            _2798 = _2880;
            _2818 = _2886;
            _2888 = true;
        }
        else
        {
            bool _2890 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2892 = isnan(_1380);
            bool _2894 = _2890 || _2892;
            bool _2896 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2898 = _2894 || _2896;
            if (!_2898)
            {
                _2810 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2900 = _2810;
            _2812 = _2900;
            if (!_2898)
            {
                _2790 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2902 = _2790;
            _2792 = _2902;
            if (!_2898)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2904 = _2796;
            _2798 = _2904;
            if (!_2898)
            {
                _2804 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2906 = _2804;
            _2806 = _2906;
            if (!_2898)
            {
                _2824 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2908 = _2824;
            _2826 = _2908;
            if (!_2898)
            {
                _2816 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2910 = _2816;
            bool _2912 = !_2898;
            _2818 = _2910;
            if (!_2912)
            {
                bool _2914 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2916 = isnan(_1380);
                bool _2918 = _2914 || _2916;
                bool _2920 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2922 = _2918 || _2920;
                if (!_2922)
                {
                    float _2924 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2926 = _1380 + _2924;
                    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2930 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2928;
                    float _2932 = 1.0 / _2930;
                    float _2934 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2936 = _2934 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2940 = _2938 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2942 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2946 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2950 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2952 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2954 = _2926 * _2932;
                    float _2956 = precise::clamp(_2954, 0.0, 1.0);
                    float _2958 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2960 = _2958 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2962 = fma(_2956, _2936, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2964 = fma(_2956, _2960, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2966 = fma(_2956, _2940, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2968 = fma(_2956, _2944, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2970 = fma(_2956, _2948, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2972 = fma(_2956, _2952, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2792 = _2964;
                    _2826 = _2970;
                    _2812 = _2962;
                    _2806 = _2968;
                    _2798 = _2966;
                    _2818 = _2972;
                    _2888 = true;
                }
                else
                {
                    _2792 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2826 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2812 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2806 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2818 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2888 = false;
    float _2974 = _2792;
    float _2976 = _2826;
    float _2978 = _2812;
    float _2980 = _2806;
    float _2982 = _2798;
    float _2984 = _2818;
    float _2986 = _2802 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2988 = fma(_2624, -0.5, 0.5);
    float _2990 = precise::clamp(_2988, 0.0, 1.0);
    float _2992 = -_2974;
    float _2994 = _2992 + _2976;
    float _2996 = -_2978;
    float _2998 = _2996 + _2980;
    out.m_49.x = _2986;
    float _3000 = fma(_2990, _2994, _2974);
    float _3002 = -_2982;
    float _3004 = _3002 + _2984;
    float _3006 = fma(_2990, _2998, _2978);
    float _3008 = _3000 * 0.586610972881317138671875;
    bool _3010 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3012 = fma(_2990, _3004, _2982);
    out.m_91.x = 0.0;
    float _3014 = fma(_3006, 0.298911988735198974609375, _3008);
    bool _3016 = _1292 > 0.0;
    bool _3018 = isnan(_1292);
    bool _3020 = _3016 || _3018;
    bool _3022 = isnan(0.0);
    bool _3024 = _3020 || _3022;
    float _3026 = fma(_3012, 0.114477999508380889892578125, _3014);
    bool _3028 = _1346 <= 0.0;
    bool _3030 = !_3024;
    bool _3032 = _3028 || _3030;
    float _3034 = -_3026;
    float _3036 = _3006 + _3034;
    float _3038 = -_3026;
    float _3040 = _3000 + _3038;
    float _3042 = -_3026;
    float _3044 = _3012 + _3042;
    float _3046 = fma(_3036, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3026);
    float _3048 = fma(_3040, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3026);
    float _3050 = fma(_3044, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3026);
    bool _3052 = !_3010;
    if (!_3052)
    {
        float _3054 = -_1228;
        float _3056 = _3054 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3058 = -_1230;
        float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3062 = -_1232;
        float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3066 = _3056 * _3056;
        float _3068 = fma(_3060, _3060, _3066);
        float _3070 = fma(_3064, _3064, _3068);
        float _3072 = sqrt(_3070);
        float _3074 = rsqrt(_3070);
        float _3076 = -_3072;
        float _3078 = _3076 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3080 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3082 = precise::clamp(_3080, 0.0, 1.0);
        float _3084 = _3060 * _3074;
        float _3086 = _3056 * _3074;
        float _3088 = abs(_3082);
        float _3090 = log2(_3088);
        float _3092 = _3064 * _3074;
        float _3094 = _3084 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3096 = _2624 * _3086;
        float _3098 = -_3086;
        float _3100 = -_3094;
        float _3102 = fma(_3098, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3100);
        float _3104 = fma(_2602, _3084, _3096);
        float _3106 = -_3092;
        float _3108 = fma(_3106, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3102);
        float _3110 = fma(_2668, _3092, _3104);
        float _3112 = precise::clamp(_3110, 0.0, 1.0);
        float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3116 = _3108 + _3114;
        float _3118 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3120 = _3116 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3122 = precise::clamp(_3120, 0.0, 1.0);
        float _3124 = exp2(_3118);
        float _3126 = _3124 * _3122;
        float _3128 = _3112 * _3126;
        float _3130 = _3128 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3132 = _3128 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3134 = _3128 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3130;
        out.m_91.y = _3132;
        out.m_91.z = _3134;
    }
    out.m_65.x = _3046;
    out.m_65.y = _3048;
    out.m_65.z = _3050;
    if (!_3032)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3136 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3136;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

