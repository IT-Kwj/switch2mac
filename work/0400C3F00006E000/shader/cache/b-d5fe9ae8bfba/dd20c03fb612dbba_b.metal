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
    float4 m_79 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
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
    float4 m_81 [[attribute(0)]];
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2808 = false;
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
        float _3113 = as_type<float>(_126);
        out.gl_Position.z = _3113;
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
        float _3183 = as_type<float>(_164);
        out.gl_Position.z = _3183;
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
    float _476 = _428 * 2.0;
    float _478 = _428 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _480 = _430 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _482 = _430 * 2.0;
    float _484 = floor(_476);
    float _486 = -_470;
    float _488 = fma(_478, 2.0, _486);
    float _490 = fma(_480, -2.0, _452);
    float _492 = _430 + _428;
    float _494 = _440 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _496 = _440 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _498 = _440 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _500 = _492 + (-1.0);
    float _502 = exp2(_468);
    float _504 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[4].x, _494);
    float _506 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[6].x, _498);
    float _508 = _446 * 2.0;
    float _510 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[5].x, _496);
    float _512 = _430 + _446;
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _516 = float(_450);
    float _518 = floor(_482);
    bool _520 = _484 > 0.0;
    float _522 = _512 + (-1.0);
    bool _524 = _484 >= 0.0;
    bool _526 = isnan(_484);
    bool _528 = _524 || _526;
    bool _530 = isnan(0.0);
    bool _532 = _528 || _530;
    float _534 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[4].z, _504);
    float _536 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _538 = floor(_508);
    float _540 = -_502;
    float _542 = _540 + 1.0;
    float _544 = float(_474);
    float _546 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].z, _506);
    bool _548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(1.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _560 = 1.0 + _558;
    float _562 = _464 ? _542 : 0.0;
    float _564 = 1.0 / _516;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _570 = _518 > 0.0;
    float _572 = _544 * _144;
    bool _574 = _518 >= 0.0;
    bool _576 = isnan(_518);
    bool _578 = _574 || _576;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    float _584 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[78].w, _568);
    float _586 = 1.0 / _560;
    bool _588 = _538 > 0.0;
    float _590 = -_144;
    float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[76].x, _488);
    bool _594 = _538 >= 0.0;
    bool _596 = isnan(_538);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[78].z, _566);
    int _606 = _532 ? 0 : 1;
    float _608 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _490);
    float _610 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[5].z, _510);
    float _612 = _564 * _144;
    float _614 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _604);
    int _616 = ~_606;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _584);
    int _624 = _620;
    if (!_520)
    {
        int _626 = ~_606;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = _534 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _634 = _582 ? 0 : 1;
    float _636 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_556)
    {
        float _638 = _562 * _586;
        _146 = _638;
    }
    float _640 = _146;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _648 = _646 != 0;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _652 = _650 != 0;
    float _654 = _546 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
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
    float _768 = fma(_536, _756, _536);
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
    float2 _5485 = float2(_1590, _1614);
    float _1652 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5485, float2(0.0), isnan(_5485)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5485, float2(0.0), isnan(_5485)), level(0.0)).x;
    float _1654 = fma(_1650, 0.5, 0.5);
    float _1656 = _1640 * 0.636619746685028076171875;
    float _1658 = fma(_1644, 0.5, 0.5);
    float _1660 = fma(_1646, -0.5, 0.5);
    float _1662 = -_1636;
    float _1664 = fma(_1656, _1662, 1.0);
    float3 _5510 = float3(_1658, _1660, _1638);
    float _1666 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5510, float3(0.0), isnan(_5510)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5510, float3(0.0), isnan(_5510)), level(0.0)).x;
    float3 _5521 = float3(_1658, _1660, _1638);
    float4 _1669 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5521, float3(0.0), isnan(_5521)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5521, float3(0.0), isnan(_5521)), level(0.0)).xyzw;
    float _1671 = _1669.x;
    float _1673 = _1669.y;
    float _1675 = _1669.z;
    float _1677 = _1669.w;
    float2 _5537 = float2(_1664, _1654);
    float3 _1681 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5537, float2(0.0), isnan(_5537)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5537, float2(0.0), isnan(_5537)), level(0.0)).xyz;
    float _1683 = _1681.x;
    float _1685 = _1681.y;
    float _1687 = _1681.z;
    float _1689 = float(uint(_474));
    float _1691 = trunc(_612);
    int _1693 = int(_1691);
    bool _1695 = _474 == 0;
    out.m_63.x = _986;
    out.m_63.y = _978;
    out.m_63.z = _996;
    int _1697 = abs(_690);
    float _1699 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1701 = _430 > 0.5;
    out.m_65.w = _804;
    float _1703 = 1.0 / _1689;
    int _1705 = ~_474;
    int _1707 = _1705 + 1;
    out.m_67.x = _902;
    int _1709 = ~_474;
    int _1711 = _1709 + 1;
    out.m_69.x = _1230;
    out.m_69.y = _1228;
    out.m_69.z = _1232;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1715 = _1713 != 0;
    float _1717 = exp2(_1699);
    float _1719 = float(uint(_1693));
    bool _1721 = !_1715;
    float _1723 = _1721 ? 7.345489978790283203125 : 1.0;
    int _1725 = as_type<int>(_1703) + (-2);
    float _1727 = _1723 * _428;
    float _1729 = as_type<float>(_1725) * _1719;
    float _1731 = floor(_1727);
    float _1733 = -_1717;
    float _1735 = _1733 + 1.0;
    float _1737 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1739 = trunc(_1729);
    float _1741 = precise::max(_1739, 0.0);
    uint _1744 = uint(_1741);
    float _1746 = -_1731;
    float _1748 = _1727 + _1746;
    float _1750 = _1748 * _544;
    int _1752 = _1707 * int(_1744);
    int _1754 = _1752 + _1693;
    float _1756 = trunc(_1750);
    int _1758 = int(_1756);
    float _1760 = float(uint(_1754));
    float _1762 = as_type<float>(_1725) * _1760;
    float _1764 = float(_110);
    float _1766 = float(_1693);
    float _1768 = trunc(_1762);
    float _1770 = precise::max(_1768, 0.0);
    uint _1772 = uint(_1770);
    bool _1774 = _1766 >= _544;
    bool _1776 = isnan(_1766);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan(_544);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    int _1786 = _474 + (-1);
    float _1788 = 1.0 / _1764;
    int _1790 = int(_1744) + int(_1772);
    float _1792 = trunc(_1784);
    int _1794 = int(_1792);
    int _1796 = _1711 * _1790;
    int _1798 = _1796 + _1693;
    float _1800 = _572 * _1788;
    int _1802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1804 = _1802 != 0;
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1808 = _1806 != 0;
    bool _1810 = uint(_1798) >= uint(_474);
    float _1812 = trunc(_1800);
    int _1814 = int(_1812);
    bool _1816 = !_1810;
    int _1818 = _1816 ? 0 : (-1);
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1822 = _1820 != 0;
    int _1824 = ~_1790;
    int _1826 = _1824 + _1818;
    int _1828 = _1826 + 1;
    int _1830 = ~_1794;
    int _1832 = _1830 + 1;
    int _1834 = _1832 + 1;
    bool _1836 = !_1822;
    int _1838 = _1836 ? 0 : 1;
    int _1840 = _474 * _1828;
    int _1842 = _1840 + _1693;
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1846 = _1844 != 0;
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1850 = _426 + _1848;
    int _1852 = abs(_676);
    bool _1854 = !_1695;
    int _1856 = _1854 ? _1842 : (-1);
    int _1858 = abs(_1838);
    int _1860 = abs(_686);
    int _1862 = _1856 * _1834;
    int _1864 = _1758 * _1858;
    int _1866 = _1864 + _1693;
    int _1868 = _1794 * _1786;
    int _1870 = _1868 + _1862;
    bool _1872 = !_1846;
    int _1874 = _1872 ? 0 : 1;
    float _1876 = in.m_71.y;
    int _1878 = _1870 * _1852;
    int _1880 = abs(_1874);
    int _1882 = _1814 * _1860;
    int _1884 = _1882 + _1878;
    int _1886 = ~_474;
    int _1888 = _1886 + 1;
    int _1890 = _1866 * _1697;
    int _1892 = _1890 + _1884;
    int _1894 = ~_474;
    int _1896 = _1894 + 1;
    int _1898 = _1758 * _1880;
    int _1900 = _1898 + _1892;
    float _1902 = float(uint(_1900));
    float _1904 = as_type<float>(_1725) * _1902;
    float _1906 = trunc(_1904);
    float _1908 = precise::max(_1906, 0.0);
    uint _1910 = uint(_1908);
    int _1912 = _1896 * int(_1910);
    int _1914 = _1912 + _1900;
    float _1916 = float(uint(_1914));
    float _1918 = as_type<float>(_1725) * _1916;
    float _1920 = trunc(_1918);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    int _1926 = int(_1910) + int(_1924);
    float _1928 = float(uint(_1866));
    int _1930 = _1888 * _1926;
    int _1932 = _1930 + _1900;
    float _1934 = as_type<float>(_1725) * _1928;
    bool _1936 = uint(_1932) >= uint(_474);
    float _1938 = trunc(_1934);
    float _1940 = precise::max(_1938, 0.0);
    uint _1942 = uint(_1940);
    bool _1944 = !_1936;
    int _1946 = _1944 ? 0 : (-1);
    int _1948 = ~_1926;
    int _1950 = _1948 + _1946;
    int _1952 = _1950 + 1;
    int _1954 = _474 * _1952;
    int _1956 = _1954 + _1900;
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1962 = !_1695;
    int _1964 = _1962 ? _1956 : (-1);
    int _1966 = _1888 * int(_1942);
    int _1968 = _1966 + _1866;
    float _1970 = 1.0 / _1960;
    int _1972 = _1964 >> 31;
    float _1974 = float(uint(_1968));
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1976;
    int _1980 = _1972 & 3;
    int _1982 = _1964 & 3;
    bool _1984 = _1982 != 0;
    float _1986 = as_type<float>(_1725) * _1974;
    int _1988 = _1964 + _1980;
    bool _1990 = uint(_1982) > 1u;
    int _1992 = _1988 >> 2;
    float _1994 = trunc(_1986);
    float _1996 = precise::max(_1994, 0.0);
    uint _1998 = uint(_1996);
    float _2000 = _1978 * _1970;
    int _2002 = _1992 << 4;
    int _2004 = _2002 + 368;
    float _2006 = fma(_2000, _1850, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    uint _2008 = uint(int(uint(_2004) >> uint(2)));
    uint _2010 = uint(int(uint(int(_2008)) >> uint(2)));
    int _2012 = int(_2008) & 3;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[int(_2010)][_2012];
    int _2016 = int(_2008) + 1;
    uint _2018 = uint(int(uint(_2016) >> uint(2)));
    int _2020 = _2016 & 3;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[int(_2018)][_2020];
    bool _2024 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2026 = isnan(_426);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2032 = _2028 || _2030;
    float _2034 = float(_2032);
    int _2036 = _1964 & 3;
    bool _2038 = _2036 != 0;
    float _2040 = -_1876;
    float _2042 = _2040 + 1.0;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    bool _2044 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2046 = isnan(_426);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2052 = _2048 || _2050;
    float _2054 = float(_2052);
    int _2056 = _2004 + 8;
    uint _2058 = uint(int(uint(_2056) >> uint(2)));
    uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
    int _2062 = int(_2058) & 3;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[int(_2060)][_2062];
    int _2066 = int(_2058) + 1;
    uint _2068 = uint(int(uint(_2066) >> uint(2)));
    int _2070 = _2066 & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    float _2074 = _1876;
    float _2076 = _1582;
    float _2078 = _1632;
    if (_1804)
    {
        float _2080 = _1701 ? _2042 : _1876;
        _2074 = _2080;
    }
    float _2082 = _2074;
    bool _2084 = _1982 != 3;
    bool _2086 = uint(_1982) >= 2u;
    int _2088 = int(_1942) + int(_1998);
    float _2090 = -_2034;
    float _2092 = _2090 + 1.0;
    int _2094 = _2038 ? 0 : 1;
    int _2096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2098 = _2096 != 0;
    float _2100 = _2054 * _2092;
    int _2102 = ~_2094;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    float _2108 = -_2054;
    float _2110 = _2108 + 1.0;
    int _2112 = _2106;
    if (!_1990)
    {
        int _2114 = ~_2094;
        int _2116 = _2114 + 1;
        _2112 = _2116;
    }
    int _2118 = _2112;
    float _2120 = _2006 * _2100;
    bool _2122 = !_1984;
    int _2124 = _2122 ? 0 : 1;
    float _2126 = _928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2128 = abs(_2118);
    float _2130 = fma(_2110, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2120);
    int _2132 = _2086 ? 0 : 1;
    float _2134 = -_1652;
    float _2136 = _2134 + 1.0;
    int _2138 = abs(_2124);
    int _2140 = ~_2128;
    int _2142 = _2140 + 1;
    int _2144 = _2142 + 1;
    int _2146 = ~_2132;
    int _2148 = _2146 + 1;
    int _2150 = _2148 + 1;
    float _2152 = _1737 * _1666;
    int _2154 = _2150;
    if (_2084)
    {
        int _2156 = ~_2132;
        int _2158 = _2156 + 1;
        _2154 = _2158;
    }
    int _2160 = _2154;
    int _2162 = ~_474;
    int _2164 = _2162 + 1;
    int _2166 = ~_2138;
    int _2168 = _2166 + 1;
    int _2170 = _2168 + 1;
    int _2172 = abs(_2160);
    int _2174 = _2164 * _2088;
    int _2176 = _2174 + _1866;
    bool _2178 = _1982 != 3;
    int _2180 = _2144 * as_type<int>(_2022);
    float _2182 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2184 = int(_2182);
    bool _2186 = uint(_2176) >= uint(_474);
    int _2188 = _2170 * as_type<int>(_2014);
    int _2190 = _2188 + _2180;
    float _2192 = as_type<float>(_2176);
    if (_1808)
    {
        float _2194 = in.m_53.x;
        _2192 = _2194;
    }
    float _2196 = _2192;
    bool _2198 = !_2178;
    int _2200 = _2198 ? 0 : (-1);
    int _2202 = ~_2172;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    int _2208 = abs(_2200);
    bool _2210 = !_2186;
    int _2212 = _2210 ? 0 : (-1);
    int _2214 = _2206 * as_type<int>(_2064);
    int _2216 = _2214 + _2190;
    bool _2218 = !_2098;
    int _2220 = _2218 ? 0 : 1;
    float _2222 = in.m_71.x;
    int _2224 = ~_2088;
    int _2226 = _2224 + _2212;
    int _2228 = _2226 + 1;
    int _2230 = abs(_2220);
    int _2232 = ~_2208;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = _474 * _2228;
    int _2240 = _2238 + _1866;
    int _2242 = ~_2230;
    int _2244 = _2242 + 1;
    int _2246 = _2244 + 1;
    float _2248 = in.m_75.x;
    float _2250 = in.m_75.y;
    float _2252 = in.m_75.z;
    bool _2254 = _856 != 0.0;
    bool _2256 = isnan(_856);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan(0.0);
    bool _2262 = _2258 || _2260;
    int _2264 = _2236 * as_type<int>(_2072);
    int _2266 = _2264 + _2216;
    float _2268 = float(uint(_2184));
    float _2270 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2130);
    bool _2272 = _854 == 0.0;
    bool _2274 = !_2262;
    bool _2276 = _2272 && _2274;
    int _2278 = _2266 * _2246;
    bool _2280 = !_1695;
    int _2282 = _2280 ? _2240 : (-1);
    float _2284 = _2270 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2286 = abs(_2184);
    float _2288 = 1.0 / _2268;
    bool _2290 = _858 == 0.0;
    bool _2292 = _2290 && _2276;
    int _2294 = _2282 * _2230;
    int _2296 = _2294 + _2278;
    float _2298 = float(uint(_2286));
    float _2300 = 1.0 / _2298;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2306 = _2196 > 0.5;
    bool _2308 = _2306 && _1808;
    float _2310 = _2248;
    float _2312 = _2196;
    float _2314 = _2252;
    float _2316 = _2250;
    if (!_2292)
    {
        float _2318 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2248);
        _2310 = _2318;
    }
    float _2320 = _2310;
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1808)
    {
        _2312 = _2222;
    }
    float _2324 = _2312;
    float _2326 = _2324;
    if (!_2292)
    {
        float _2328 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2252);
        _2314 = _2328;
    }
    float _2330 = _2314;
    if (!_1808)
    {
        _1080 = _2222;
    }
    float _2332 = _1080;
    float _2334 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2336 = abs(_2296);
    float _2338 = _2304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2340 = as_type<int>(_2288) + (-2);
    float _2342 = _2322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2344 = float(uint(_2296));
    float _2346 = _2332;
    if (!_2292)
    {
        float _2348 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2250);
        _2316 = _2348;
    }
    float _2350 = _2316;
    if (_2308)
    {
        float _2352 = -_2324;
        float _2354 = _2352 + 1.0;
        _2326 = _2354;
    }
    float _2356 = _2326;
    int _2358 = as_type<int>(_2300) + (-2);
    float _2360 = as_type<float>(_2340) * _2344;
    float _2362 = float(uint(_2336));
    out.m_77.x = _2334;
    out.m_77.y = _2338;
    out.m_77.z = _2342;
    out.m_77.w = _2284;
    if (_1808)
    {
        _2346 = _2356;
    }
    float _2364 = _2346;
    int _2366 = ~_2184;
    int _2368 = _2366 + 1;
    float _2370 = as_type<float>(_2358) * _2362;
    float _2372 = trunc(_2360);
    float _2374 = precise::max(_2372, 0.0);
    uint _2376 = uint(_2374);
    int _2378 = ~_2286;
    int _2380 = _2378 + 1;
    float _2382 = _928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2384 = _928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2386 = -_920;
    float _2388 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2382);
    float _2390 = _948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2392 = trunc(_2370);
    float _2394 = precise::max(_2392, 0.0);
    uint _2396 = uint(_2394);
    float _2398 = -_920;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2126);
    float _2402 = -_920;
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2384);
    float _2406 = _940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2408 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2400);
    float _2410 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2388);
    float _2412 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2404);
    int _2414 = _2368 * int(_2376);
    int _2416 = _2414 + _2296;
    float _2418 = abs(_1238);
    float _2420 = log2(_2418);
    int _2422 = ~_2184;
    int _2424 = _2422 + 1;
    float _2426 = _2410 * _2350;
    float _2428 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2406);
    float _2430 = float(uint(_2416));
    float _2432 = _940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2434 = _948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2436 = _2380 * int(_2396);
    int _2438 = _2436 + _2336;
    float _2440 = _940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2442 = as_type<float>(_2340) * _2430;
    float _2444 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2432);
    float _2446 = _2412 * _2350;
    float _2448 = float(uint(_2438));
    float _2450 = _2408 * _2350;
    float _2452 = trunc(_2442);
    float _2454 = precise::max(_2452, 0.0);
    uint _2456 = uint(_2454);
    float _2458 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2460 = as_type<float>(_2358) * _2448;
    int _2462 = ~_2286;
    int _2464 = _2462 + 1;
    float _2466 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2440);
    float _2468 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2428);
    float _2470 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2444);
    float _2472 = _948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2474 = trunc(_2460);
    float _2476 = precise::max(_2474, 0.0);
    uint _2478 = uint(_2476);
    float _2480 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2466);
    float _2482 = fma(_2468, _2320, _2446);
    int _2484 = _2296 ^ _2184;
    float _2486 = fma(_2470, _2320, _2450);
    float _2488 = fma(_2480, _2320, _2426);
    float _2490 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2472);
    int _2492 = int(_2376) + int(_2456);
    float _2494 = exp2(_2458);
    uint _2496 = uint(int(uint(_2484) >> uint(31)));
    float _2498 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2390);
    bool _2500 = _1238 <= 8000.0;
    bool _2502 = isnan(_1238);
    bool _2504 = _2500 || _2502;
    bool _2506 = isnan(8000.0);
    bool _2508 = _2504 || _2506;
    float _2510 = float(_2508);
    int _2512 = _2424 * _2492;
    int _2514 = _2512 + _2296;
    float _2516 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2434);
    float _2518 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2498);
    int _2520 = int(_2396) + int(_2478);
    float _2522 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2490);
    bool _2524 = uint(_2514) >= uint(_2184);
    float _2526 = fma(_2518, _2330, _2486);
    float _2528 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2516);
    int _2530 = _2464 * _2520;
    int _2532 = _2530 + _2336;
    bool _2534 = !_2524;
    int _2536 = _2534 ? 0 : (-1);
    float _2538 = fma(_2494, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2540 = precise::clamp(_2538, 0.0, 1.0);
    bool _2542 = _2184 == 0;
    float _2544 = fma(_2522, _2330, _2488);
    bool _2546 = uint(_2532) >= uint(_2286);
    float _2548 = _1687 * _2152;
    int _2550 = ~_2492;
    int _2552 = _2550 + _2536;
    int _2554 = _2552 + 1;
    float _2556 = fma(_2528, _2330, _2482);
    bool _2558 = !_2546;
    int _2560 = _2558 ? 0 : (-1);
    float _2562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2564 = _2184 == 0;
    int _2566 = _2184 * _2554;
    int _2568 = _2566 + _2296;
    int _2570 = ~_2560;
    int _2572 = _2520 + _2570;
    int _2574 = _2572 + 1;
    out.m_79.x = _2544;
    out.m_79.y = _2526;
    out.m_79.z = _2556;
    int _2576 = ~int(_2496);
    int _2578 = _2576 + 1;
    float _2580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2582 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2584 = fma(_2540, -2.0, 3.0);
    int _2586 = _2574 ^ _2578;
    float _2588 = _2540 * _2540;
    float _2590 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2582);
    int _2592 = ~_2578;
    int _2594 = _2592 + _2586;
    int _2596 = _2594 + 1;
    float _2598 = _2588 * _2584;
    bool _2600 = !_2542;
    int _2602 = _2600 ? _2568 : (-1);
    float _2604 = _2562 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2606 = !_2564;
    int _2608 = _2606 ? _2596 : (-1);
    float _2610 = -_2598;
    float _2612 = _2610 + 1.0;
    float _2614 = float(_2602);
    float _2616 = fma(_2604, _2364, -0.5);
    float _2618 = float(_2608);
    float _2620 = fma(_2612, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2598);
    float _2622 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2624 = fma(_2604, _2614, _592);
    float _2626 = _1582 * 0.5;
    float _2628 = in.m_81.x;
    float _2630 = _2510 * _2620;
    float _2632 = fma(_614, _2616, _2624);
    float _2634 = fma(_2622, _2082, -0.5);
    float _2636 = -_608;
    float _2638 = fma(_2622, _2618, _2636);
    float _2640 = fma(_1632, -0.5, _2626);
    float _2642 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2590);
    float _2644 = _2632 + 0.5;
    float _2646 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2648 = fma(_622, _2634, _2638);
    float _2650 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2642);
    float _2652 = _2136 * _2646;
    float _2654 = precise::clamp(_2652, 0.0, 1.0);
    float _2656 = _2648 + 0.5;
    float _2658 = _2650 + _1582;
    float _2660 = _1626 + _1582;
    out.gl_Position.x = _1626;
    out.gl_Position.y = _1632;
    out.gl_Position.z = _2650;
    out.gl_Position.w = _1582;
    float _2662 = -_2654;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2666 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2668 = isnan(_1380);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2674 = _2670 || _2672;
    float _2676 = _2658 * 0.5;
    out.m_83.x = _2644;
    out.m_83.y = _2656;
    float _2678 = _2660 * 0.5;
    float _2680 = _2664 * _2628;
    float _2682 = fma(_1677, _2548, _1675);
    out.m_85.x = _2678;
    out.m_85.y = _2640;
    out.m_85.z = _2676;
    out.m_85.w = _1582;
    float _2684 = _1677 * _2152;
    float _2686 = -_1737;
    float _2688 = _2686 + 1.0;
    float _2690 = _2688;
    float _2692 = _2678;
    if (!_2674)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2694 = _2076;
    float _2696 = fma(_1683, _2684, _1671);
    float _2698 = fma(_1685, _2684, _1673);
    float _2700 = _1677 * _2688;
    float _2702 = _2680 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2704 = _1292 * _1346;
    float _2706 = _2704;
    float _2708 = _2702;
    float _2710 = _2694;
    float _2712 = _2694;
    if (!_2674)
    {
        _2690 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2714 = _2690;
    out.m_87.x = _2696;
    out.m_87.y = _2698;
    out.m_87.z = _2682;
    out.m_87.w = _2700;
    float _2716 = _2704 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2718 = _2714;
    float _2720 = _2714;
    if (!_2674)
    {
        _2692 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2722 = _2692;
    out.m_89.x = _2702;
    float _2724 = _2722;
    float _2726 = _2722;
    if (!_2674)
    {
        _2078 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2728 = _2078;
    float _2730 = _2728;
    float _2732 = _2728;
    if (!_2674)
    {
        _2706 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2734 = _2706;
    float _2736 = _2734;
    float _2738 = _2734;
    if (!_2674)
    {
        _2708 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2740 = _2708;
    bool _2742 = !_2674;
    float _2744 = _2740;
    float _2746 = _2740;
    if (!_2742)
    {
        bool _2748 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2750 = isnan(_1380);
        bool _2752 = _2748 || _2750;
        bool _2754 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2756 = _2752 || _2754;
        if (!_2756)
        {
            float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2760 = _1380 + _2758;
            float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2764 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2762;
            float _2766 = 1.0 / _2764;
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2788 = _2760 * _2766;
            float _2790 = precise::clamp(_2788, 0.0, 1.0);
            float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2796 = fma(_2790, _2770, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2798 = fma(_2790, _2794, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2800 = fma(_2790, _2774, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2802 = fma(_2790, _2778, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2804 = fma(_2790, _2782, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2806 = fma(_2790, _2786, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2712 = _2798;
            _2746 = _2804;
            _2726 = _2796;
            _2732 = _2802;
            _2720 = _2800;
            _2738 = _2806;
            _2808 = true;
        }
        else
        {
            bool _2810 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2812 = isnan(_1380);
            bool _2814 = _2810 || _2812;
            bool _2816 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2818 = _2814 || _2816;
            if (!_2818)
            {
                _2724 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2820 = _2724;
            _2726 = _2820;
            if (!_2818)
            {
                _2710 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2822 = _2710;
            _2712 = _2822;
            if (!_2818)
            {
                _2718 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2824 = _2718;
            _2720 = _2824;
            if (!_2818)
            {
                _2730 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2826 = _2730;
            _2732 = _2826;
            if (!_2818)
            {
                _2744 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2828 = _2744;
            _2746 = _2828;
            if (!_2818)
            {
                _2736 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2830 = _2736;
            bool _2832 = !_2818;
            _2738 = _2830;
            if (!_2832)
            {
                bool _2834 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2836 = isnan(_1380);
                bool _2838 = _2834 || _2836;
                bool _2840 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2842 = _2838 || _2840;
                if (!_2842)
                {
                    float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2846 = _1380 + _2844;
                    float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2850 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2848;
                    float _2852 = 1.0 / _2850;
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2866 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2868 = _2866 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2874 = _2846 * _2852;
                    float _2876 = precise::clamp(_2874, 0.0, 1.0);
                    float _2878 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2880 = _2878 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2882 = fma(_2876, _2856, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2884 = fma(_2876, _2880, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2886 = fma(_2876, _2860, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2888 = fma(_2876, _2864, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2890 = fma(_2876, _2868, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2892 = fma(_2876, _2872, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2712 = _2884;
                    _2746 = _2890;
                    _2726 = _2882;
                    _2732 = _2888;
                    _2720 = _2886;
                    _2738 = _2892;
                    _2808 = true;
                }
                else
                {
                    _2712 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2746 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2726 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2732 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2720 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2738 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2808 = false;
    float _2894 = _2712;
    float _2896 = _2746;
    float _2898 = _2726;
    float _2900 = _2732;
    float _2902 = _2720;
    float _2904 = _2738;
    float _2906 = _2716 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2908 = fma(_2526, -0.5, 0.5);
    float _2910 = precise::clamp(_2908, 0.0, 1.0);
    float _2912 = -_2894;
    float _2914 = _2912 + _2896;
    float _2916 = -_2898;
    float _2918 = _2916 + _2900;
    out.m_49.x = _2906;
    float _2920 = fma(_2910, _2914, _2894);
    float _2922 = -_2902;
    float _2924 = _2922 + _2904;
    float _2926 = fma(_2910, _2918, _2898);
    float _2928 = _2920 * 0.586610972881317138671875;
    bool _2930 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2932 = fma(_2910, _2924, _2902);
    out.m_91.x = 0.0;
    float _2934 = fma(_2926, 0.298911988735198974609375, _2928);
    bool _2936 = _1292 > 0.0;
    bool _2938 = isnan(_1292);
    bool _2940 = _2936 || _2938;
    bool _2942 = isnan(0.0);
    bool _2944 = _2940 || _2942;
    float _2946 = fma(_2932, 0.114477999508380889892578125, _2934);
    bool _2948 = _1346 <= 0.0;
    bool _2950 = !_2944;
    bool _2952 = _2948 || _2950;
    float _2954 = -_2946;
    float _2956 = _2926 + _2954;
    float _2958 = -_2946;
    float _2960 = _2920 + _2958;
    float _2962 = -_2946;
    float _2964 = _2932 + _2962;
    float _2966 = fma(_2956, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2946);
    float _2968 = fma(_2960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2946);
    float _2970 = fma(_2964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2946);
    bool _2972 = !_2930;
    if (!_2972)
    {
        float _2974 = -_1228;
        float _2976 = _2974 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2978 = -_1230;
        float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2982 = -_1232;
        float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2986 = _2976 * _2976;
        float _2988 = fma(_2980, _2980, _2986);
        float _2990 = fma(_2984, _2984, _2988);
        float _2992 = sqrt(_2990);
        float _2994 = rsqrt(_2990);
        float _2996 = -_2992;
        float _2998 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3000 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3002 = precise::clamp(_3000, 0.0, 1.0);
        float _3004 = _2980 * _2994;
        float _3006 = _2976 * _2994;
        float _3008 = abs(_3002);
        float _3010 = log2(_3008);
        float _3012 = _2984 * _2994;
        float _3014 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3016 = _2526 * _3006;
        float _3018 = -_3006;
        float _3020 = -_3014;
        float _3022 = fma(_3018, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3020);
        float _3024 = fma(_2544, _3004, _3016);
        float _3026 = -_3012;
        float _3028 = fma(_3026, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3022);
        float _3030 = fma(_2556, _3012, _3024);
        float _3032 = precise::clamp(_3030, 0.0, 1.0);
        float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3036 = _3028 + _3034;
        float _3038 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3040 = _3036 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3042 = precise::clamp(_3040, 0.0, 1.0);
        float _3044 = exp2(_3038);
        float _3046 = _3044 * _3042;
        float _3048 = _3032 * _3046;
        float _3050 = _3048 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3052 = _3048 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3054 = _3048 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3050;
        out.m_91.y = _3052;
        out.m_91.z = _3054;
    }
    out.m_65.x = _2966;
    out.m_65.y = _2968;
    out.m_65.z = _2970;
    if (!_2952)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3056 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3056;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2808 = false;
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
        float _3113 = as_type<float>(_126);
        out.gl_Position.z = _3113;
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
        float _3183 = as_type<float>(_164);
        out.gl_Position.z = _3183;
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
    float _476 = _428 * 2.0;
    float _478 = _428 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _480 = _430 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _482 = _430 * 2.0;
    float _484 = floor(_476);
    float _486 = -_470;
    float _488 = fma(_478, 2.0, _486);
    float _490 = fma(_480, -2.0, _452);
    float _492 = _430 + _428;
    float _494 = _440 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _496 = _440 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _498 = _440 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _500 = _492 + (-1.0);
    float _502 = exp2(_468);
    float _504 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[4].x, _494);
    float _506 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[6].x, _498);
    float _508 = _446 * 2.0;
    float _510 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[5].x, _496);
    float _512 = _430 + _446;
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _516 = float(_450);
    float _518 = floor(_482);
    bool _520 = _484 > 0.0;
    float _522 = _512 + (-1.0);
    bool _524 = _484 >= 0.0;
    bool _526 = isnan(_484);
    bool _528 = _524 || _526;
    bool _530 = isnan(0.0);
    bool _532 = _528 || _530;
    float _534 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[4].z, _504);
    float _536 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _538 = floor(_508);
    float _540 = -_502;
    float _542 = _540 + 1.0;
    float _544 = float(_474);
    float _546 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].z, _506);
    bool _548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(1.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _560 = 1.0 + _558;
    float _562 = _464 ? _542 : 0.0;
    float _564 = 1.0 / _516;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _570 = _518 > 0.0;
    float _572 = _544 * _144;
    bool _574 = _518 >= 0.0;
    bool _576 = isnan(_518);
    bool _578 = _574 || _576;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    float _584 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[78].w, _568);
    float _586 = 1.0 / _560;
    bool _588 = _538 > 0.0;
    float _590 = -_144;
    float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[76].x, _488);
    bool _594 = _538 >= 0.0;
    bool _596 = isnan(_538);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[78].z, _566);
    int _606 = _532 ? 0 : 1;
    float _608 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _490);
    float _610 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[5].z, _510);
    float _612 = _564 * _144;
    float _614 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _604);
    int _616 = ~_606;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _584);
    int _624 = _620;
    if (!_520)
    {
        int _626 = ~_606;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = _534 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _634 = _582 ? 0 : 1;
    float _636 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_556)
    {
        float _638 = _562 * _586;
        _146 = _638;
    }
    float _640 = _146;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _648 = _646 != 0;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _652 = _650 != 0;
    float _654 = _546 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
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
    float _768 = fma(_536, _756, _536);
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
    float2 _5485 = float2(_1590, _1614);
    float _1652 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5485, float2(0.0), isnan(_5485)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5485, float2(0.0), isnan(_5485)), level(0.0)).x;
    float _1654 = fma(_1650, 0.5, 0.5);
    float _1656 = _1640 * 0.636619746685028076171875;
    float _1658 = fma(_1644, 0.5, 0.5);
    float _1660 = fma(_1646, -0.5, 0.5);
    float _1662 = -_1636;
    float _1664 = fma(_1656, _1662, 1.0);
    float3 _5510 = float3(_1658, _1660, _1638);
    float _1666 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5510, float3(0.0), isnan(_5510)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5510, float3(0.0), isnan(_5510)), level(0.0)).x;
    float3 _5521 = float3(_1658, _1660, _1638);
    float4 _1669 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5521, float3(0.0), isnan(_5521)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5521, float3(0.0), isnan(_5521)), level(0.0)).xyzw;
    float _1671 = _1669.x;
    float _1673 = _1669.y;
    float _1675 = _1669.z;
    float _1677 = _1669.w;
    float2 _5537 = float2(_1664, _1654);
    float3 _1681 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5537, float2(0.0), isnan(_5537)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5537, float2(0.0), isnan(_5537)), level(0.0)).xyz;
    float _1683 = _1681.x;
    float _1685 = _1681.y;
    float _1687 = _1681.z;
    float _1689 = float(uint(_474));
    float _1691 = trunc(_612);
    int _1693 = int(_1691);
    bool _1695 = _474 == 0;
    out.m_63.x = _986;
    out.m_63.y = _978;
    out.m_63.z = _996;
    int _1697 = abs(_690);
    float _1699 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1701 = _430 > 0.5;
    out.m_65.w = _804;
    float _1703 = 1.0 / _1689;
    int _1705 = ~_474;
    int _1707 = _1705 + 1;
    out.m_67.x = _902;
    int _1709 = ~_474;
    int _1711 = _1709 + 1;
    out.m_69.x = _1230;
    out.m_69.y = _1228;
    out.m_69.z = _1232;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1715 = _1713 != 0;
    float _1717 = exp2(_1699);
    float _1719 = float(uint(_1693));
    bool _1721 = !_1715;
    float _1723 = _1721 ? 7.345489978790283203125 : 1.0;
    int _1725 = as_type<int>(_1703) + (-2);
    float _1727 = _1723 * _428;
    float _1729 = as_type<float>(_1725) * _1719;
    float _1731 = floor(_1727);
    float _1733 = -_1717;
    float _1735 = _1733 + 1.0;
    float _1737 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1739 = trunc(_1729);
    float _1741 = precise::max(_1739, 0.0);
    uint _1744 = uint(_1741);
    float _1746 = -_1731;
    float _1748 = _1727 + _1746;
    float _1750 = _1748 * _544;
    int _1752 = _1707 * int(_1744);
    int _1754 = _1752 + _1693;
    float _1756 = trunc(_1750);
    int _1758 = int(_1756);
    float _1760 = float(uint(_1754));
    float _1762 = as_type<float>(_1725) * _1760;
    float _1764 = float(_110);
    float _1766 = float(_1693);
    float _1768 = trunc(_1762);
    float _1770 = precise::max(_1768, 0.0);
    uint _1772 = uint(_1770);
    bool _1774 = _1766 >= _544;
    bool _1776 = isnan(_1766);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan(_544);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    int _1786 = _474 + (-1);
    float _1788 = 1.0 / _1764;
    int _1790 = int(_1744) + int(_1772);
    float _1792 = trunc(_1784);
    int _1794 = int(_1792);
    int _1796 = _1711 * _1790;
    int _1798 = _1796 + _1693;
    float _1800 = _572 * _1788;
    int _1802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1804 = _1802 != 0;
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1808 = _1806 != 0;
    bool _1810 = uint(_1798) >= uint(_474);
    float _1812 = trunc(_1800);
    int _1814 = int(_1812);
    bool _1816 = !_1810;
    int _1818 = _1816 ? 0 : (-1);
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1822 = _1820 != 0;
    int _1824 = ~_1790;
    int _1826 = _1824 + _1818;
    int _1828 = _1826 + 1;
    int _1830 = ~_1794;
    int _1832 = _1830 + 1;
    int _1834 = _1832 + 1;
    bool _1836 = !_1822;
    int _1838 = _1836 ? 0 : 1;
    int _1840 = _474 * _1828;
    int _1842 = _1840 + _1693;
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1846 = _1844 != 0;
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1850 = _426 + _1848;
    int _1852 = abs(_676);
    bool _1854 = !_1695;
    int _1856 = _1854 ? _1842 : (-1);
    int _1858 = abs(_1838);
    int _1860 = abs(_686);
    int _1862 = _1856 * _1834;
    int _1864 = _1758 * _1858;
    int _1866 = _1864 + _1693;
    int _1868 = _1794 * _1786;
    int _1870 = _1868 + _1862;
    bool _1872 = !_1846;
    int _1874 = _1872 ? 0 : 1;
    float _1876 = in.m_71.y;
    int _1878 = _1870 * _1852;
    int _1880 = abs(_1874);
    int _1882 = _1814 * _1860;
    int _1884 = _1882 + _1878;
    int _1886 = ~_474;
    int _1888 = _1886 + 1;
    int _1890 = _1866 * _1697;
    int _1892 = _1890 + _1884;
    int _1894 = ~_474;
    int _1896 = _1894 + 1;
    int _1898 = _1758 * _1880;
    int _1900 = _1898 + _1892;
    float _1902 = float(uint(_1900));
    float _1904 = as_type<float>(_1725) * _1902;
    float _1906 = trunc(_1904);
    float _1908 = precise::max(_1906, 0.0);
    uint _1910 = uint(_1908);
    int _1912 = _1896 * int(_1910);
    int _1914 = _1912 + _1900;
    float _1916 = float(uint(_1914));
    float _1918 = as_type<float>(_1725) * _1916;
    float _1920 = trunc(_1918);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    int _1926 = int(_1910) + int(_1924);
    float _1928 = float(uint(_1866));
    int _1930 = _1888 * _1926;
    int _1932 = _1930 + _1900;
    float _1934 = as_type<float>(_1725) * _1928;
    bool _1936 = uint(_1932) >= uint(_474);
    float _1938 = trunc(_1934);
    float _1940 = precise::max(_1938, 0.0);
    uint _1942 = uint(_1940);
    bool _1944 = !_1936;
    int _1946 = _1944 ? 0 : (-1);
    int _1948 = ~_1926;
    int _1950 = _1948 + _1946;
    int _1952 = _1950 + 1;
    int _1954 = _474 * _1952;
    int _1956 = _1954 + _1900;
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1962 = !_1695;
    int _1964 = _1962 ? _1956 : (-1);
    int _1966 = _1888 * int(_1942);
    int _1968 = _1966 + _1866;
    float _1970 = 1.0 / _1960;
    int _1972 = _1964 >> 31;
    float _1974 = float(uint(_1968));
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1976;
    int _1980 = _1972 & 3;
    int _1982 = _1964 & 3;
    bool _1984 = _1982 != 0;
    float _1986 = as_type<float>(_1725) * _1974;
    int _1988 = _1964 + _1980;
    bool _1990 = uint(_1982) > 1u;
    int _1992 = _1988 >> 2;
    float _1994 = trunc(_1986);
    float _1996 = precise::max(_1994, 0.0);
    uint _1998 = uint(_1996);
    float _2000 = _1978 * _1970;
    int _2002 = _1992 << 4;
    int _2004 = _2002 + 368;
    float _2006 = fma(_2000, _1850, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    uint _2008 = uint(int(uint(_2004) >> uint(2)));
    uint _2010 = uint(int(uint(int(_2008)) >> uint(2)));
    int _2012 = int(_2008) & 3;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[int(_2010)][_2012];
    int _2016 = int(_2008) + 1;
    uint _2018 = uint(int(uint(_2016) >> uint(2)));
    int _2020 = _2016 & 3;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[int(_2018)][_2020];
    bool _2024 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2026 = isnan(_426);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2032 = _2028 || _2030;
    float _2034 = float(_2032);
    int _2036 = _1964 & 3;
    bool _2038 = _2036 != 0;
    float _2040 = -_1876;
    float _2042 = _2040 + 1.0;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    bool _2044 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2046 = isnan(_426);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2052 = _2048 || _2050;
    float _2054 = float(_2052);
    int _2056 = _2004 + 8;
    uint _2058 = uint(int(uint(_2056) >> uint(2)));
    uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
    int _2062 = int(_2058) & 3;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[int(_2060)][_2062];
    int _2066 = int(_2058) + 1;
    uint _2068 = uint(int(uint(_2066) >> uint(2)));
    int _2070 = _2066 & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    float _2074 = _1876;
    float _2076 = _1582;
    float _2078 = _1632;
    if (_1804)
    {
        float _2080 = _1701 ? _2042 : _1876;
        _2074 = _2080;
    }
    float _2082 = _2074;
    bool _2084 = _1982 != 3;
    bool _2086 = uint(_1982) >= 2u;
    int _2088 = int(_1942) + int(_1998);
    float _2090 = -_2034;
    float _2092 = _2090 + 1.0;
    int _2094 = _2038 ? 0 : 1;
    int _2096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2098 = _2096 != 0;
    float _2100 = _2054 * _2092;
    int _2102 = ~_2094;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    float _2108 = -_2054;
    float _2110 = _2108 + 1.0;
    int _2112 = _2106;
    if (!_1990)
    {
        int _2114 = ~_2094;
        int _2116 = _2114 + 1;
        _2112 = _2116;
    }
    int _2118 = _2112;
    float _2120 = _2006 * _2100;
    bool _2122 = !_1984;
    int _2124 = _2122 ? 0 : 1;
    float _2126 = _928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2128 = abs(_2118);
    float _2130 = fma(_2110, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2120);
    int _2132 = _2086 ? 0 : 1;
    float _2134 = -_1652;
    float _2136 = _2134 + 1.0;
    int _2138 = abs(_2124);
    int _2140 = ~_2128;
    int _2142 = _2140 + 1;
    int _2144 = _2142 + 1;
    int _2146 = ~_2132;
    int _2148 = _2146 + 1;
    int _2150 = _2148 + 1;
    float _2152 = _1737 * _1666;
    int _2154 = _2150;
    if (_2084)
    {
        int _2156 = ~_2132;
        int _2158 = _2156 + 1;
        _2154 = _2158;
    }
    int _2160 = _2154;
    int _2162 = ~_474;
    int _2164 = _2162 + 1;
    int _2166 = ~_2138;
    int _2168 = _2166 + 1;
    int _2170 = _2168 + 1;
    int _2172 = abs(_2160);
    int _2174 = _2164 * _2088;
    int _2176 = _2174 + _1866;
    bool _2178 = _1982 != 3;
    int _2180 = _2144 * as_type<int>(_2022);
    float _2182 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2184 = int(_2182);
    bool _2186 = uint(_2176) >= uint(_474);
    int _2188 = _2170 * as_type<int>(_2014);
    int _2190 = _2188 + _2180;
    float _2192 = as_type<float>(_2176);
    if (_1808)
    {
        float _2194 = in.m_53.x;
        _2192 = _2194;
    }
    float _2196 = _2192;
    bool _2198 = !_2178;
    int _2200 = _2198 ? 0 : (-1);
    int _2202 = ~_2172;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    int _2208 = abs(_2200);
    bool _2210 = !_2186;
    int _2212 = _2210 ? 0 : (-1);
    int _2214 = _2206 * as_type<int>(_2064);
    int _2216 = _2214 + _2190;
    bool _2218 = !_2098;
    int _2220 = _2218 ? 0 : 1;
    float _2222 = in.m_71.x;
    int _2224 = ~_2088;
    int _2226 = _2224 + _2212;
    int _2228 = _2226 + 1;
    int _2230 = abs(_2220);
    int _2232 = ~_2208;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = _474 * _2228;
    int _2240 = _2238 + _1866;
    int _2242 = ~_2230;
    int _2244 = _2242 + 1;
    int _2246 = _2244 + 1;
    float _2248 = in.m_75.x;
    float _2250 = in.m_75.y;
    float _2252 = in.m_75.z;
    bool _2254 = _856 != 0.0;
    bool _2256 = isnan(_856);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan(0.0);
    bool _2262 = _2258 || _2260;
    int _2264 = _2236 * as_type<int>(_2072);
    int _2266 = _2264 + _2216;
    float _2268 = float(uint(_2184));
    float _2270 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2130);
    bool _2272 = _854 == 0.0;
    bool _2274 = !_2262;
    bool _2276 = _2272 && _2274;
    int _2278 = _2266 * _2246;
    bool _2280 = !_1695;
    int _2282 = _2280 ? _2240 : (-1);
    float _2284 = _2270 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2286 = abs(_2184);
    float _2288 = 1.0 / _2268;
    bool _2290 = _858 == 0.0;
    bool _2292 = _2290 && _2276;
    int _2294 = _2282 * _2230;
    int _2296 = _2294 + _2278;
    float _2298 = float(uint(_2286));
    float _2300 = 1.0 / _2298;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2306 = _2196 > 0.5;
    bool _2308 = _2306 && _1808;
    float _2310 = _2248;
    float _2312 = _2196;
    float _2314 = _2252;
    float _2316 = _2250;
    if (!_2292)
    {
        float _2318 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2248);
        _2310 = _2318;
    }
    float _2320 = _2310;
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1808)
    {
        _2312 = _2222;
    }
    float _2324 = _2312;
    float _2326 = _2324;
    if (!_2292)
    {
        float _2328 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2252);
        _2314 = _2328;
    }
    float _2330 = _2314;
    if (!_1808)
    {
        _1080 = _2222;
    }
    float _2332 = _1080;
    float _2334 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2336 = abs(_2296);
    float _2338 = _2304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2340 = as_type<int>(_2288) + (-2);
    float _2342 = _2322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2344 = float(uint(_2296));
    float _2346 = _2332;
    if (!_2292)
    {
        float _2348 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2250);
        _2316 = _2348;
    }
    float _2350 = _2316;
    if (_2308)
    {
        float _2352 = -_2324;
        float _2354 = _2352 + 1.0;
        _2326 = _2354;
    }
    float _2356 = _2326;
    int _2358 = as_type<int>(_2300) + (-2);
    float _2360 = as_type<float>(_2340) * _2344;
    float _2362 = float(uint(_2336));
    out.m_77.x = _2334;
    out.m_77.y = _2338;
    out.m_77.z = _2342;
    out.m_77.w = _2284;
    if (_1808)
    {
        _2346 = _2356;
    }
    float _2364 = _2346;
    int _2366 = ~_2184;
    int _2368 = _2366 + 1;
    float _2370 = as_type<float>(_2358) * _2362;
    float _2372 = trunc(_2360);
    float _2374 = precise::max(_2372, 0.0);
    uint _2376 = uint(_2374);
    int _2378 = ~_2286;
    int _2380 = _2378 + 1;
    float _2382 = _928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2384 = _928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2386 = -_920;
    float _2388 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2382);
    float _2390 = _948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2392 = trunc(_2370);
    float _2394 = precise::max(_2392, 0.0);
    uint _2396 = uint(_2394);
    float _2398 = -_920;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2126);
    float _2402 = -_920;
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2384);
    float _2406 = _940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2408 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2400);
    float _2410 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2388);
    float _2412 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2404);
    int _2414 = _2368 * int(_2376);
    int _2416 = _2414 + _2296;
    float _2418 = abs(_1238);
    float _2420 = log2(_2418);
    int _2422 = ~_2184;
    int _2424 = _2422 + 1;
    float _2426 = _2410 * _2350;
    float _2428 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2406);
    float _2430 = float(uint(_2416));
    float _2432 = _940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2434 = _948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2436 = _2380 * int(_2396);
    int _2438 = _2436 + _2336;
    float _2440 = _940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2442 = as_type<float>(_2340) * _2430;
    float _2444 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2432);
    float _2446 = _2412 * _2350;
    float _2448 = float(uint(_2438));
    float _2450 = _2408 * _2350;
    float _2452 = trunc(_2442);
    float _2454 = precise::max(_2452, 0.0);
    uint _2456 = uint(_2454);
    float _2458 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2460 = as_type<float>(_2358) * _2448;
    int _2462 = ~_2286;
    int _2464 = _2462 + 1;
    float _2466 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2440);
    float _2468 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2428);
    float _2470 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2444);
    float _2472 = _948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2474 = trunc(_2460);
    float _2476 = precise::max(_2474, 0.0);
    uint _2478 = uint(_2476);
    float _2480 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2466);
    float _2482 = fma(_2468, _2320, _2446);
    int _2484 = _2296 ^ _2184;
    float _2486 = fma(_2470, _2320, _2450);
    float _2488 = fma(_2480, _2320, _2426);
    float _2490 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2472);
    int _2492 = int(_2376) + int(_2456);
    float _2494 = exp2(_2458);
    uint _2496 = uint(int(uint(_2484) >> uint(31)));
    float _2498 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2390);
    bool _2500 = _1238 <= 8000.0;
    bool _2502 = isnan(_1238);
    bool _2504 = _2500 || _2502;
    bool _2506 = isnan(8000.0);
    bool _2508 = _2504 || _2506;
    float _2510 = float(_2508);
    int _2512 = _2424 * _2492;
    int _2514 = _2512 + _2296;
    float _2516 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2434);
    float _2518 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2498);
    int _2520 = int(_2396) + int(_2478);
    float _2522 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2490);
    bool _2524 = uint(_2514) >= uint(_2184);
    float _2526 = fma(_2518, _2330, _2486);
    float _2528 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2516);
    int _2530 = _2464 * _2520;
    int _2532 = _2530 + _2336;
    bool _2534 = !_2524;
    int _2536 = _2534 ? 0 : (-1);
    float _2538 = fma(_2494, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2540 = precise::clamp(_2538, 0.0, 1.0);
    bool _2542 = _2184 == 0;
    float _2544 = fma(_2522, _2330, _2488);
    bool _2546 = uint(_2532) >= uint(_2286);
    float _2548 = _1687 * _2152;
    int _2550 = ~_2492;
    int _2552 = _2550 + _2536;
    int _2554 = _2552 + 1;
    float _2556 = fma(_2528, _2330, _2482);
    bool _2558 = !_2546;
    int _2560 = _2558 ? 0 : (-1);
    float _2562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2564 = _2184 == 0;
    int _2566 = _2184 * _2554;
    int _2568 = _2566 + _2296;
    int _2570 = ~_2560;
    int _2572 = _2520 + _2570;
    int _2574 = _2572 + 1;
    out.m_79.x = _2544;
    out.m_79.y = _2526;
    out.m_79.z = _2556;
    int _2576 = ~int(_2496);
    int _2578 = _2576 + 1;
    float _2580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2582 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2584 = fma(_2540, -2.0, 3.0);
    int _2586 = _2574 ^ _2578;
    float _2588 = _2540 * _2540;
    float _2590 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2582);
    int _2592 = ~_2578;
    int _2594 = _2592 + _2586;
    int _2596 = _2594 + 1;
    float _2598 = _2588 * _2584;
    bool _2600 = !_2542;
    int _2602 = _2600 ? _2568 : (-1);
    float _2604 = _2562 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2606 = !_2564;
    int _2608 = _2606 ? _2596 : (-1);
    float _2610 = -_2598;
    float _2612 = _2610 + 1.0;
    float _2614 = float(_2602);
    float _2616 = fma(_2604, _2364, -0.5);
    float _2618 = float(_2608);
    float _2620 = fma(_2612, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2598);
    float _2622 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2624 = fma(_2604, _2614, _592);
    float _2626 = _1582 * 0.5;
    float _2628 = in.m_81.x;
    float _2630 = _2510 * _2620;
    float _2632 = fma(_614, _2616, _2624);
    float _2634 = fma(_2622, _2082, -0.5);
    float _2636 = -_608;
    float _2638 = fma(_2622, _2618, _2636);
    float _2640 = fma(_1632, -0.5, _2626);
    float _2642 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2590);
    float _2644 = _2632 + 0.5;
    float _2646 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2648 = fma(_622, _2634, _2638);
    float _2650 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2642);
    float _2652 = _2136 * _2646;
    float _2654 = precise::clamp(_2652, 0.0, 1.0);
    float _2656 = _2648 + 0.5;
    float _2658 = _2650 + _1582;
    float _2660 = _1626 + _1582;
    out.gl_Position.x = _1626;
    out.gl_Position.y = _1632;
    out.gl_Position.z = _2650;
    out.gl_Position.w = _1582;
    float _2662 = -_2654;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2666 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2668 = isnan(_1380);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2674 = _2670 || _2672;
    float _2676 = _2658 * 0.5;
    out.m_83.x = _2644;
    out.m_83.y = _2656;
    float _2678 = _2660 * 0.5;
    float _2680 = _2664 * _2628;
    float _2682 = fma(_1677, _2548, _1675);
    out.m_85.x = _2678;
    out.m_85.y = _2640;
    out.m_85.z = _2676;
    out.m_85.w = _1582;
    float _2684 = _1677 * _2152;
    float _2686 = -_1737;
    float _2688 = _2686 + 1.0;
    float _2690 = _2688;
    float _2692 = _2678;
    if (!_2674)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2694 = _2076;
    float _2696 = fma(_1683, _2684, _1671);
    float _2698 = fma(_1685, _2684, _1673);
    float _2700 = _1677 * _2688;
    float _2702 = _2680 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2704 = _1292 * _1346;
    float _2706 = _2704;
    float _2708 = _2702;
    float _2710 = _2694;
    float _2712 = _2694;
    if (!_2674)
    {
        _2690 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2714 = _2690;
    out.m_87.x = _2696;
    out.m_87.y = _2698;
    out.m_87.z = _2682;
    out.m_87.w = _2700;
    float _2716 = _2704 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2718 = _2714;
    float _2720 = _2714;
    if (!_2674)
    {
        _2692 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2722 = _2692;
    out.m_89.x = _2702;
    float _2724 = _2722;
    float _2726 = _2722;
    if (!_2674)
    {
        _2078 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2728 = _2078;
    float _2730 = _2728;
    float _2732 = _2728;
    if (!_2674)
    {
        _2706 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2734 = _2706;
    float _2736 = _2734;
    float _2738 = _2734;
    if (!_2674)
    {
        _2708 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2740 = _2708;
    bool _2742 = !_2674;
    float _2744 = _2740;
    float _2746 = _2740;
    if (!_2742)
    {
        bool _2748 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2750 = isnan(_1380);
        bool _2752 = _2748 || _2750;
        bool _2754 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2756 = _2752 || _2754;
        if (!_2756)
        {
            float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2760 = _1380 + _2758;
            float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2764 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2762;
            float _2766 = 1.0 / _2764;
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2788 = _2760 * _2766;
            float _2790 = precise::clamp(_2788, 0.0, 1.0);
            float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2796 = fma(_2790, _2770, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2798 = fma(_2790, _2794, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2800 = fma(_2790, _2774, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2802 = fma(_2790, _2778, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2804 = fma(_2790, _2782, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2806 = fma(_2790, _2786, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2712 = _2798;
            _2746 = _2804;
            _2726 = _2796;
            _2732 = _2802;
            _2720 = _2800;
            _2738 = _2806;
            _2808 = true;
        }
        else
        {
            bool _2810 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2812 = isnan(_1380);
            bool _2814 = _2810 || _2812;
            bool _2816 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2818 = _2814 || _2816;
            if (!_2818)
            {
                _2724 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2820 = _2724;
            _2726 = _2820;
            if (!_2818)
            {
                _2710 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2822 = _2710;
            _2712 = _2822;
            if (!_2818)
            {
                _2718 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2824 = _2718;
            _2720 = _2824;
            if (!_2818)
            {
                _2730 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2826 = _2730;
            _2732 = _2826;
            if (!_2818)
            {
                _2744 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2828 = _2744;
            _2746 = _2828;
            if (!_2818)
            {
                _2736 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2830 = _2736;
            bool _2832 = !_2818;
            _2738 = _2830;
            if (!_2832)
            {
                bool _2834 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2836 = isnan(_1380);
                bool _2838 = _2834 || _2836;
                bool _2840 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2842 = _2838 || _2840;
                if (!_2842)
                {
                    float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2846 = _1380 + _2844;
                    float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2850 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2848;
                    float _2852 = 1.0 / _2850;
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2866 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2868 = _2866 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2874 = _2846 * _2852;
                    float _2876 = precise::clamp(_2874, 0.0, 1.0);
                    float _2878 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2880 = _2878 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2882 = fma(_2876, _2856, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2884 = fma(_2876, _2880, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2886 = fma(_2876, _2860, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2888 = fma(_2876, _2864, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2890 = fma(_2876, _2868, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2892 = fma(_2876, _2872, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2712 = _2884;
                    _2746 = _2890;
                    _2726 = _2882;
                    _2732 = _2888;
                    _2720 = _2886;
                    _2738 = _2892;
                    _2808 = true;
                }
                else
                {
                    _2712 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2746 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2726 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2732 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2720 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2738 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2808 = false;
    float _2894 = _2712;
    float _2896 = _2746;
    float _2898 = _2726;
    float _2900 = _2732;
    float _2902 = _2720;
    float _2904 = _2738;
    float _2906 = _2716 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2908 = fma(_2526, -0.5, 0.5);
    float _2910 = precise::clamp(_2908, 0.0, 1.0);
    float _2912 = -_2894;
    float _2914 = _2912 + _2896;
    float _2916 = -_2898;
    float _2918 = _2916 + _2900;
    out.m_49.x = _2906;
    float _2920 = fma(_2910, _2914, _2894);
    float _2922 = -_2902;
    float _2924 = _2922 + _2904;
    float _2926 = fma(_2910, _2918, _2898);
    float _2928 = _2920 * 0.586610972881317138671875;
    bool _2930 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2932 = fma(_2910, _2924, _2902);
    out.m_91.x = 0.0;
    float _2934 = fma(_2926, 0.298911988735198974609375, _2928);
    bool _2936 = _1292 > 0.0;
    bool _2938 = isnan(_1292);
    bool _2940 = _2936 || _2938;
    bool _2942 = isnan(0.0);
    bool _2944 = _2940 || _2942;
    float _2946 = fma(_2932, 0.114477999508380889892578125, _2934);
    bool _2948 = _1346 <= 0.0;
    bool _2950 = !_2944;
    bool _2952 = _2948 || _2950;
    float _2954 = -_2946;
    float _2956 = _2926 + _2954;
    float _2958 = -_2946;
    float _2960 = _2920 + _2958;
    float _2962 = -_2946;
    float _2964 = _2932 + _2962;
    float _2966 = fma(_2956, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2946);
    float _2968 = fma(_2960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2946);
    float _2970 = fma(_2964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2946);
    bool _2972 = !_2930;
    if (!_2972)
    {
        float _2974 = -_1228;
        float _2976 = _2974 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2978 = -_1230;
        float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2982 = -_1232;
        float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2986 = _2976 * _2976;
        float _2988 = fma(_2980, _2980, _2986);
        float _2990 = fma(_2984, _2984, _2988);
        float _2992 = sqrt(_2990);
        float _2994 = rsqrt(_2990);
        float _2996 = -_2992;
        float _2998 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3000 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3002 = precise::clamp(_3000, 0.0, 1.0);
        float _3004 = _2980 * _2994;
        float _3006 = _2976 * _2994;
        float _3008 = abs(_3002);
        float _3010 = log2(_3008);
        float _3012 = _2984 * _2994;
        float _3014 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3016 = _2526 * _3006;
        float _3018 = -_3006;
        float _3020 = -_3014;
        float _3022 = fma(_3018, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3020);
        float _3024 = fma(_2544, _3004, _3016);
        float _3026 = -_3012;
        float _3028 = fma(_3026, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3022);
        float _3030 = fma(_2556, _3012, _3024);
        float _3032 = precise::clamp(_3030, 0.0, 1.0);
        float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3036 = _3028 + _3034;
        float _3038 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3040 = _3036 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3042 = precise::clamp(_3040, 0.0, 1.0);
        float _3044 = exp2(_3038);
        float _3046 = _3044 * _3042;
        float _3048 = _3032 * _3046;
        float _3050 = _3048 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3052 = _3048 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3054 = _3048 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3050;
        out.m_91.y = _3052;
        out.m_91.z = _3054;
    }
    out.m_65.x = _2966;
    out.m_65.y = _2968;
    out.m_65.z = _2970;
    if (!_2952)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3056 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3056;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2808 = false;
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
        float _3113 = as_type<float>(_126);
        out.gl_Position.z = _3113;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3183 = as_type<float>(_164);
        out.gl_Position.z = _3183;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _476 = _428 * 2.0;
    float _478 = _428 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _480 = _430 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _482 = _430 * 2.0;
    float _484 = floor(_476);
    float _486 = -_470;
    float _488 = fma(_478, 2.0, _486);
    float _490 = fma(_480, -2.0, _452);
    float _492 = _430 + _428;
    float _494 = _440 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _496 = _440 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _498 = _440 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _500 = _492 + (-1.0);
    float _502 = exp2(_468);
    float _504 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[4].x, _494);
    float _506 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[6].x, _498);
    float _508 = _446 * 2.0;
    float _510 = fma(_438, (*spvDescriptorSet0.vp_c10)._m0[5].x, _496);
    float _512 = _430 + _446;
    float _514 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _516 = float(_450);
    float _518 = floor(_482);
    bool _520 = _484 > 0.0;
    float _522 = _512 + (-1.0);
    bool _524 = _484 >= 0.0;
    bool _526 = isnan(_484);
    bool _528 = _524 || _526;
    bool _530 = isnan(0.0);
    bool _532 = _528 || _530;
    float _534 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[4].z, _504);
    float _536 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _538 = floor(_508);
    float _540 = -_502;
    float _542 = _540 + 1.0;
    float _544 = float(_474);
    float _546 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].z, _506);
    bool _548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(1.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _560 = 1.0 + _558;
    float _562 = _464 ? _542 : 0.0;
    float _564 = 1.0 / _516;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _570 = _518 > 0.0;
    float _572 = _544 * _144;
    bool _574 = _518 >= 0.0;
    bool _576 = isnan(_518);
    bool _578 = _574 || _576;
    bool _580 = isnan(0.0);
    bool _582 = _578 || _580;
    float _584 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[78].w, _568);
    float _586 = 1.0 / _560;
    bool _588 = _538 > 0.0;
    float _590 = -_144;
    float _592 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[76].x, _488);
    bool _594 = _538 >= 0.0;
    bool _596 = isnan(_538);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    float _604 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[78].z, _566);
    int _606 = _532 ? 0 : 1;
    float _608 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _490);
    float _610 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[5].z, _510);
    float _612 = _564 * _144;
    float _614 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _604);
    int _616 = ~_606;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _584);
    int _624 = _620;
    if (!_520)
    {
        int _626 = ~_606;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = _534 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _634 = _582 ? 0 : 1;
    float _636 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_556)
    {
        float _638 = _562 * _586;
        _146 = _638;
    }
    float _640 = _146;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _648 = _646 != 0;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _652 = _650 != 0;
    float _654 = _546 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
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
    float _768 = fma(_536, _756, _536);
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
    float2 _5485 = float2(_1590, _1614);
    float _1652 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5485, float2(0.0), isnan(_5485)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5485, float2(0.0), isnan(_5485)), level(0.0)).x;
    float _1654 = fma(_1650, 0.5, 0.5);
    float _1656 = _1640 * 0.636619746685028076171875;
    float _1658 = fma(_1644, 0.5, 0.5);
    float _1660 = fma(_1646, -0.5, 0.5);
    float _1662 = -_1636;
    float _1664 = fma(_1656, _1662, 1.0);
    float3 _5510 = float3(_1658, _1660, _1638);
    float _1666 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5510, float3(0.0), isnan(_5510)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5510, float3(0.0), isnan(_5510)), level(0.0)).x;
    float3 _5521 = float3(_1658, _1660, _1638);
    float4 _1669 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5521, float3(0.0), isnan(_5521)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5521, float3(0.0), isnan(_5521)), level(0.0)).xyzw;
    float _1671 = _1669.x;
    float _1673 = _1669.y;
    float _1675 = _1669.z;
    float _1677 = _1669.w;
    float2 _5537 = float2(_1664, _1654);
    float3 _1681 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5537, float2(0.0), isnan(_5537)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5537, float2(0.0), isnan(_5537)), level(0.0)).xyz;
    float _1683 = _1681.x;
    float _1685 = _1681.y;
    float _1687 = _1681.z;
    float _1689 = float(uint(_474));
    float _1691 = trunc(_612);
    int _1693 = int(_1691);
    bool _1695 = _474 == 0;
    out.m_63.x = _986;
    out.m_63.y = _978;
    out.m_63.z = _996;
    int _1697 = abs(_690);
    float _1699 = _1568 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1701 = _430 > 0.5;
    out.m_65.w = _804;
    float _1703 = 1.0 / _1689;
    int _1705 = ~_474;
    int _1707 = _1705 + 1;
    out.m_67.x = _902;
    int _1709 = ~_474;
    int _1711 = _1709 + 1;
    out.m_69.x = _1230;
    out.m_69.y = _1228;
    out.m_69.z = _1232;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1715 = _1713 != 0;
    float _1717 = exp2(_1699);
    float _1719 = float(uint(_1693));
    bool _1721 = !_1715;
    float _1723 = _1721 ? 7.345489978790283203125 : 1.0;
    int _1725 = as_type<int>(_1703) + (-2);
    float _1727 = _1723 * _428;
    float _1729 = as_type<float>(_1725) * _1719;
    float _1731 = floor(_1727);
    float _1733 = -_1717;
    float _1735 = _1733 + 1.0;
    float _1737 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1739 = trunc(_1729);
    float _1741 = precise::max(_1739, 0.0);
    uint _1744 = uint(_1741);
    float _1746 = -_1731;
    float _1748 = _1727 + _1746;
    float _1750 = _1748 * _544;
    int _1752 = _1707 * int(_1744);
    int _1754 = _1752 + _1693;
    float _1756 = trunc(_1750);
    int _1758 = int(_1756);
    float _1760 = float(uint(_1754));
    float _1762 = as_type<float>(_1725) * _1760;
    float _1764 = float(_110);
    float _1766 = float(_1693);
    float _1768 = trunc(_1762);
    float _1770 = precise::max(_1768, 0.0);
    uint _1772 = uint(_1770);
    bool _1774 = _1766 >= _544;
    bool _1776 = isnan(_1766);
    bool _1778 = _1774 || _1776;
    bool _1780 = isnan(_544);
    bool _1782 = _1778 || _1780;
    float _1784 = float(_1782);
    int _1786 = _474 + (-1);
    float _1788 = 1.0 / _1764;
    int _1790 = int(_1744) + int(_1772);
    float _1792 = trunc(_1784);
    int _1794 = int(_1792);
    int _1796 = _1711 * _1790;
    int _1798 = _1796 + _1693;
    float _1800 = _572 * _1788;
    int _1802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1804 = _1802 != 0;
    int _1806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1808 = _1806 != 0;
    bool _1810 = uint(_1798) >= uint(_474);
    float _1812 = trunc(_1800);
    int _1814 = int(_1812);
    bool _1816 = !_1810;
    int _1818 = _1816 ? 0 : (-1);
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1822 = _1820 != 0;
    int _1824 = ~_1790;
    int _1826 = _1824 + _1818;
    int _1828 = _1826 + 1;
    int _1830 = ~_1794;
    int _1832 = _1830 + 1;
    int _1834 = _1832 + 1;
    bool _1836 = !_1822;
    int _1838 = _1836 ? 0 : 1;
    int _1840 = _474 * _1828;
    int _1842 = _1840 + _1693;
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1846 = _1844 != 0;
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1850 = _426 + _1848;
    int _1852 = abs(_676);
    bool _1854 = !_1695;
    int _1856 = _1854 ? _1842 : (-1);
    int _1858 = abs(_1838);
    int _1860 = abs(_686);
    int _1862 = _1856 * _1834;
    int _1864 = _1758 * _1858;
    int _1866 = _1864 + _1693;
    int _1868 = _1794 * _1786;
    int _1870 = _1868 + _1862;
    bool _1872 = !_1846;
    int _1874 = _1872 ? 0 : 1;
    float _1876 = in.m_71.y;
    int _1878 = _1870 * _1852;
    int _1880 = abs(_1874);
    int _1882 = _1814 * _1860;
    int _1884 = _1882 + _1878;
    int _1886 = ~_474;
    int _1888 = _1886 + 1;
    int _1890 = _1866 * _1697;
    int _1892 = _1890 + _1884;
    int _1894 = ~_474;
    int _1896 = _1894 + 1;
    int _1898 = _1758 * _1880;
    int _1900 = _1898 + _1892;
    float _1902 = float(uint(_1900));
    float _1904 = as_type<float>(_1725) * _1902;
    float _1906 = trunc(_1904);
    float _1908 = precise::max(_1906, 0.0);
    uint _1910 = uint(_1908);
    int _1912 = _1896 * int(_1910);
    int _1914 = _1912 + _1900;
    float _1916 = float(uint(_1914));
    float _1918 = as_type<float>(_1725) * _1916;
    float _1920 = trunc(_1918);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    int _1926 = int(_1910) + int(_1924);
    float _1928 = float(uint(_1866));
    int _1930 = _1888 * _1926;
    int _1932 = _1930 + _1900;
    float _1934 = as_type<float>(_1725) * _1928;
    bool _1936 = uint(_1932) >= uint(_474);
    float _1938 = trunc(_1934);
    float _1940 = precise::max(_1938, 0.0);
    uint _1942 = uint(_1940);
    bool _1944 = !_1936;
    int _1946 = _1944 ? 0 : (-1);
    int _1948 = ~_1926;
    int _1950 = _1948 + _1946;
    int _1952 = _1950 + 1;
    int _1954 = _474 * _1952;
    int _1956 = _1954 + _1900;
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1962 = !_1695;
    int _1964 = _1962 ? _1956 : (-1);
    int _1966 = _1888 * int(_1942);
    int _1968 = _1966 + _1866;
    float _1970 = 1.0 / _1960;
    int _1972 = _1964 >> 31;
    float _1974 = float(uint(_1968));
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1976;
    int _1980 = _1972 & 3;
    int _1982 = _1964 & 3;
    bool _1984 = _1982 != 0;
    float _1986 = as_type<float>(_1725) * _1974;
    int _1988 = _1964 + _1980;
    bool _1990 = uint(_1982) > 1u;
    int _1992 = _1988 >> 2;
    float _1994 = trunc(_1986);
    float _1996 = precise::max(_1994, 0.0);
    uint _1998 = uint(_1996);
    float _2000 = _1978 * _1970;
    int _2002 = _1992 << 4;
    int _2004 = _2002 + 368;
    float _2006 = fma(_2000, _1850, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    uint _2008 = uint(int(uint(_2004) >> uint(2)));
    uint _2010 = uint(int(uint(int(_2008)) >> uint(2)));
    int _2012 = int(_2008) & 3;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[int(_2010)][_2012];
    int _2016 = int(_2008) + 1;
    uint _2018 = uint(int(uint(_2016) >> uint(2)));
    int _2020 = _2016 & 3;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[int(_2018)][_2020];
    bool _2024 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2026 = isnan(_426);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2032 = _2028 || _2030;
    float _2034 = float(_2032);
    int _2036 = _1964 & 3;
    bool _2038 = _2036 != 0;
    float _2040 = -_1876;
    float _2042 = _2040 + 1.0;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    bool _2044 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2046 = isnan(_426);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2052 = _2048 || _2050;
    float _2054 = float(_2052);
    int _2056 = _2004 + 8;
    uint _2058 = uint(int(uint(_2056) >> uint(2)));
    uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
    int _2062 = int(_2058) & 3;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[int(_2060)][_2062];
    int _2066 = int(_2058) + 1;
    uint _2068 = uint(int(uint(_2066) >> uint(2)));
    int _2070 = _2066 & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    float _2074 = _1876;
    float _2076 = _1582;
    float _2078 = _1632;
    if (_1804)
    {
        float _2080 = _1701 ? _2042 : _1876;
        _2074 = _2080;
    }
    float _2082 = _2074;
    bool _2084 = _1982 != 3;
    bool _2086 = uint(_1982) >= 2u;
    int _2088 = int(_1942) + int(_1998);
    float _2090 = -_2034;
    float _2092 = _2090 + 1.0;
    int _2094 = _2038 ? 0 : 1;
    int _2096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2098 = _2096 != 0;
    float _2100 = _2054 * _2092;
    int _2102 = ~_2094;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    float _2108 = -_2054;
    float _2110 = _2108 + 1.0;
    int _2112 = _2106;
    if (!_1990)
    {
        int _2114 = ~_2094;
        int _2116 = _2114 + 1;
        _2112 = _2116;
    }
    int _2118 = _2112;
    float _2120 = _2006 * _2100;
    bool _2122 = !_1984;
    int _2124 = _2122 ? 0 : 1;
    float _2126 = _928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2128 = abs(_2118);
    float _2130 = fma(_2110, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2120);
    int _2132 = _2086 ? 0 : 1;
    float _2134 = -_1652;
    float _2136 = _2134 + 1.0;
    int _2138 = abs(_2124);
    int _2140 = ~_2128;
    int _2142 = _2140 + 1;
    int _2144 = _2142 + 1;
    int _2146 = ~_2132;
    int _2148 = _2146 + 1;
    int _2150 = _2148 + 1;
    float _2152 = _1737 * _1666;
    int _2154 = _2150;
    if (_2084)
    {
        int _2156 = ~_2132;
        int _2158 = _2156 + 1;
        _2154 = _2158;
    }
    int _2160 = _2154;
    int _2162 = ~_474;
    int _2164 = _2162 + 1;
    int _2166 = ~_2138;
    int _2168 = _2166 + 1;
    int _2170 = _2168 + 1;
    int _2172 = abs(_2160);
    int _2174 = _2164 * _2088;
    int _2176 = _2174 + _1866;
    bool _2178 = _1982 != 3;
    int _2180 = _2144 * as_type<int>(_2022);
    float _2182 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2184 = int(_2182);
    bool _2186 = uint(_2176) >= uint(_474);
    int _2188 = _2170 * as_type<int>(_2014);
    int _2190 = _2188 + _2180;
    float _2192 = as_type<float>(_2176);
    if (_1808)
    {
        float _2194 = in.m_53.x;
        _2192 = _2194;
    }
    float _2196 = _2192;
    bool _2198 = !_2178;
    int _2200 = _2198 ? 0 : (-1);
    int _2202 = ~_2172;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    int _2208 = abs(_2200);
    bool _2210 = !_2186;
    int _2212 = _2210 ? 0 : (-1);
    int _2214 = _2206 * as_type<int>(_2064);
    int _2216 = _2214 + _2190;
    bool _2218 = !_2098;
    int _2220 = _2218 ? 0 : 1;
    float _2222 = in.m_71.x;
    int _2224 = ~_2088;
    int _2226 = _2224 + _2212;
    int _2228 = _2226 + 1;
    int _2230 = abs(_2220);
    int _2232 = ~_2208;
    int _2234 = _2232 + 1;
    int _2236 = _2234 + 1;
    int _2238 = _474 * _2228;
    int _2240 = _2238 + _1866;
    int _2242 = ~_2230;
    int _2244 = _2242 + 1;
    int _2246 = _2244 + 1;
    float _2248 = in.m_75.x;
    float _2250 = in.m_75.y;
    float _2252 = in.m_75.z;
    bool _2254 = _856 != 0.0;
    bool _2256 = isnan(_856);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan(0.0);
    bool _2262 = _2258 || _2260;
    int _2264 = _2236 * as_type<int>(_2072);
    int _2266 = _2264 + _2216;
    float _2268 = float(uint(_2184));
    float _2270 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2130);
    bool _2272 = _854 == 0.0;
    bool _2274 = !_2262;
    bool _2276 = _2272 && _2274;
    int _2278 = _2266 * _2246;
    bool _2280 = !_1695;
    int _2282 = _2280 ? _2240 : (-1);
    float _2284 = _2270 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2286 = abs(_2184);
    float _2288 = 1.0 / _2268;
    bool _2290 = _858 == 0.0;
    bool _2292 = _2290 && _2276;
    int _2294 = _2282 * _2230;
    int _2296 = _2294 + _2278;
    float _2298 = float(uint(_2286));
    float _2300 = 1.0 / _2298;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2306 = _2196 > 0.5;
    bool _2308 = _2306 && _1808;
    float _2310 = _2248;
    float _2312 = _2196;
    float _2314 = _2252;
    float _2316 = _2250;
    if (!_2292)
    {
        float _2318 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2248);
        _2310 = _2318;
    }
    float _2320 = _2310;
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1808)
    {
        _2312 = _2222;
    }
    float _2324 = _2312;
    float _2326 = _2324;
    if (!_2292)
    {
        float _2328 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2252);
        _2314 = _2328;
    }
    float _2330 = _2314;
    if (!_1808)
    {
        _1080 = _2222;
    }
    float _2332 = _1080;
    float _2334 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2336 = abs(_2296);
    float _2338 = _2304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2340 = as_type<int>(_2288) + (-2);
    float _2342 = _2322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2344 = float(uint(_2296));
    float _2346 = _2332;
    if (!_2292)
    {
        float _2348 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2250);
        _2316 = _2348;
    }
    float _2350 = _2316;
    if (_2308)
    {
        float _2352 = -_2324;
        float _2354 = _2352 + 1.0;
        _2326 = _2354;
    }
    float _2356 = _2326;
    int _2358 = as_type<int>(_2300) + (-2);
    float _2360 = as_type<float>(_2340) * _2344;
    float _2362 = float(uint(_2336));
    out.m_77.x = _2334;
    out.m_77.y = _2338;
    out.m_77.z = _2342;
    out.m_77.w = _2284;
    if (_1808)
    {
        _2346 = _2356;
    }
    float _2364 = _2346;
    int _2366 = ~_2184;
    int _2368 = _2366 + 1;
    float _2370 = as_type<float>(_2358) * _2362;
    float _2372 = trunc(_2360);
    float _2374 = precise::max(_2372, 0.0);
    uint _2376 = uint(_2374);
    int _2378 = ~_2286;
    int _2380 = _2378 + 1;
    float _2382 = _928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2384 = _928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2386 = -_920;
    float _2388 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2382);
    float _2390 = _948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2392 = trunc(_2370);
    float _2394 = precise::max(_2392, 0.0);
    uint _2396 = uint(_2394);
    float _2398 = -_920;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2126);
    float _2402 = -_920;
    float _2404 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2384);
    float _2406 = _940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2408 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2400);
    float _2410 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2388);
    float _2412 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2404);
    int _2414 = _2368 * int(_2376);
    int _2416 = _2414 + _2296;
    float _2418 = abs(_1238);
    float _2420 = log2(_2418);
    int _2422 = ~_2184;
    int _2424 = _2422 + 1;
    float _2426 = _2410 * _2350;
    float _2428 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2406);
    float _2430 = float(uint(_2416));
    float _2432 = _940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2434 = _948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2436 = _2380 * int(_2396);
    int _2438 = _2436 + _2336;
    float _2440 = _940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2442 = as_type<float>(_2340) * _2430;
    float _2444 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2432);
    float _2446 = _2412 * _2350;
    float _2448 = float(uint(_2438));
    float _2450 = _2408 * _2350;
    float _2452 = trunc(_2442);
    float _2454 = precise::max(_2452, 0.0);
    uint _2456 = uint(_2454);
    float _2458 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2460 = as_type<float>(_2358) * _2448;
    int _2462 = ~_2286;
    int _2464 = _2462 + 1;
    float _2466 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2440);
    float _2468 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2428);
    float _2470 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2444);
    float _2472 = _948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2474 = trunc(_2460);
    float _2476 = precise::max(_2474, 0.0);
    uint _2478 = uint(_2476);
    float _2480 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2466);
    float _2482 = fma(_2468, _2320, _2446);
    int _2484 = _2296 ^ _2184;
    float _2486 = fma(_2470, _2320, _2450);
    float _2488 = fma(_2480, _2320, _2426);
    float _2490 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2472);
    int _2492 = int(_2376) + int(_2456);
    float _2494 = exp2(_2458);
    uint _2496 = uint(int(uint(_2484) >> uint(31)));
    float _2498 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2390);
    bool _2500 = _1238 <= 8000.0;
    bool _2502 = isnan(_1238);
    bool _2504 = _2500 || _2502;
    bool _2506 = isnan(8000.0);
    bool _2508 = _2504 || _2506;
    float _2510 = float(_2508);
    int _2512 = _2424 * _2492;
    int _2514 = _2512 + _2296;
    float _2516 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2434);
    float _2518 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2498);
    int _2520 = int(_2396) + int(_2478);
    float _2522 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2490);
    bool _2524 = uint(_2514) >= uint(_2184);
    float _2526 = fma(_2518, _2330, _2486);
    float _2528 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2516);
    int _2530 = _2464 * _2520;
    int _2532 = _2530 + _2336;
    bool _2534 = !_2524;
    int _2536 = _2534 ? 0 : (-1);
    float _2538 = fma(_2494, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2540 = precise::clamp(_2538, 0.0, 1.0);
    bool _2542 = _2184 == 0;
    float _2544 = fma(_2522, _2330, _2488);
    bool _2546 = uint(_2532) >= uint(_2286);
    float _2548 = _1687 * _2152;
    int _2550 = ~_2492;
    int _2552 = _2550 + _2536;
    int _2554 = _2552 + 1;
    float _2556 = fma(_2528, _2330, _2482);
    bool _2558 = !_2546;
    int _2560 = _2558 ? 0 : (-1);
    float _2562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2564 = _2184 == 0;
    int _2566 = _2184 * _2554;
    int _2568 = _2566 + _2296;
    int _2570 = ~_2560;
    int _2572 = _2520 + _2570;
    int _2574 = _2572 + 1;
    out.m_79.x = _2544;
    out.m_79.y = _2526;
    out.m_79.z = _2556;
    int _2576 = ~int(_2496);
    int _2578 = _2576 + 1;
    float _2580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2582 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2584 = fma(_2540, -2.0, 3.0);
    int _2586 = _2574 ^ _2578;
    float _2588 = _2540 * _2540;
    float _2590 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2582);
    int _2592 = ~_2578;
    int _2594 = _2592 + _2586;
    int _2596 = _2594 + 1;
    float _2598 = _2588 * _2584;
    bool _2600 = !_2542;
    int _2602 = _2600 ? _2568 : (-1);
    float _2604 = _2562 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2606 = !_2564;
    int _2608 = _2606 ? _2596 : (-1);
    float _2610 = -_2598;
    float _2612 = _2610 + 1.0;
    float _2614 = float(_2602);
    float _2616 = fma(_2604, _2364, -0.5);
    float _2618 = float(_2608);
    float _2620 = fma(_2612, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2598);
    float _2622 = _2580 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2624 = fma(_2604, _2614, _592);
    float _2626 = _1582 * 0.5;
    float _2628 = in.m_81.x;
    float _2630 = _2510 * _2620;
    float _2632 = fma(_614, _2616, _2624);
    float _2634 = fma(_2622, _2082, -0.5);
    float _2636 = -_608;
    float _2638 = fma(_2622, _2618, _2636);
    float _2640 = fma(_1632, -0.5, _2626);
    float _2642 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2590);
    float _2644 = _2632 + 0.5;
    float _2646 = _2630 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2648 = fma(_622, _2634, _2638);
    float _2650 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2642);
    float _2652 = _2136 * _2646;
    float _2654 = precise::clamp(_2652, 0.0, 1.0);
    float _2656 = _2648 + 0.5;
    float _2658 = _2650 + _1582;
    float _2660 = _1626 + _1582;
    out.gl_Position.x = _1626;
    out.gl_Position.y = _1632;
    out.gl_Position.z = _2650;
    out.gl_Position.w = _1582;
    float _2662 = -_2654;
    float _2664 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2666 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2668 = isnan(_1380);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2674 = _2670 || _2672;
    float _2676 = _2658 * 0.5;
    out.m_83.x = _2644;
    out.m_83.y = _2656;
    float _2678 = _2660 * 0.5;
    float _2680 = _2664 * _2628;
    float _2682 = fma(_1677, _2548, _1675);
    out.m_85.x = _2678;
    out.m_85.y = _2640;
    out.m_85.z = _2676;
    out.m_85.w = _1582;
    float _2684 = _1677 * _2152;
    float _2686 = -_1737;
    float _2688 = _2686 + 1.0;
    float _2690 = _2688;
    float _2692 = _2678;
    if (!_2674)
    {
        _2076 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2694 = _2076;
    float _2696 = fma(_1683, _2684, _1671);
    float _2698 = fma(_1685, _2684, _1673);
    float _2700 = _1677 * _2688;
    float _2702 = _2680 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2704 = _1292 * _1346;
    float _2706 = _2704;
    float _2708 = _2702;
    float _2710 = _2694;
    float _2712 = _2694;
    if (!_2674)
    {
        _2690 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2714 = _2690;
    out.m_87.x = _2696;
    out.m_87.y = _2698;
    out.m_87.z = _2682;
    out.m_87.w = _2700;
    float _2716 = _2704 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2718 = _2714;
    float _2720 = _2714;
    if (!_2674)
    {
        _2692 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2722 = _2692;
    out.m_89.x = _2702;
    float _2724 = _2722;
    float _2726 = _2722;
    if (!_2674)
    {
        _2078 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2728 = _2078;
    float _2730 = _2728;
    float _2732 = _2728;
    if (!_2674)
    {
        _2706 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2734 = _2706;
    float _2736 = _2734;
    float _2738 = _2734;
    if (!_2674)
    {
        _2708 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2740 = _2708;
    bool _2742 = !_2674;
    float _2744 = _2740;
    float _2746 = _2740;
    if (!_2742)
    {
        bool _2748 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2750 = isnan(_1380);
        bool _2752 = _2748 || _2750;
        bool _2754 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2756 = _2752 || _2754;
        if (!_2756)
        {
            float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2760 = _1380 + _2758;
            float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2764 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2762;
            float _2766 = 1.0 / _2764;
            float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2776 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2786 = _2784 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2788 = _2760 * _2766;
            float _2790 = precise::clamp(_2788, 0.0, 1.0);
            float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2796 = fma(_2790, _2770, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2798 = fma(_2790, _2794, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2800 = fma(_2790, _2774, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2802 = fma(_2790, _2778, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2804 = fma(_2790, _2782, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2806 = fma(_2790, _2786, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2712 = _2798;
            _2746 = _2804;
            _2726 = _2796;
            _2732 = _2802;
            _2720 = _2800;
            _2738 = _2806;
            _2808 = true;
        }
        else
        {
            bool _2810 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2812 = isnan(_1380);
            bool _2814 = _2810 || _2812;
            bool _2816 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2818 = _2814 || _2816;
            if (!_2818)
            {
                _2724 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2820 = _2724;
            _2726 = _2820;
            if (!_2818)
            {
                _2710 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2822 = _2710;
            _2712 = _2822;
            if (!_2818)
            {
                _2718 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2824 = _2718;
            _2720 = _2824;
            if (!_2818)
            {
                _2730 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2826 = _2730;
            _2732 = _2826;
            if (!_2818)
            {
                _2744 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2828 = _2744;
            _2746 = _2828;
            if (!_2818)
            {
                _2736 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2830 = _2736;
            bool _2832 = !_2818;
            _2738 = _2830;
            if (!_2832)
            {
                bool _2834 = _1380 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2836 = isnan(_1380);
                bool _2838 = _2834 || _2836;
                bool _2840 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2842 = _2838 || _2840;
                if (!_2842)
                {
                    float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2846 = _1380 + _2844;
                    float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2850 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2848;
                    float _2852 = 1.0 / _2850;
                    float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2862 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2866 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2868 = _2866 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2872 = _2870 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2874 = _2846 * _2852;
                    float _2876 = precise::clamp(_2874, 0.0, 1.0);
                    float _2878 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2880 = _2878 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2882 = fma(_2876, _2856, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2884 = fma(_2876, _2880, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2886 = fma(_2876, _2860, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2888 = fma(_2876, _2864, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2890 = fma(_2876, _2868, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2892 = fma(_2876, _2872, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2712 = _2884;
                    _2746 = _2890;
                    _2726 = _2882;
                    _2732 = _2888;
                    _2720 = _2886;
                    _2738 = _2892;
                    _2808 = true;
                }
                else
                {
                    _2712 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2746 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2726 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2732 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2720 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2738 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2808 = false;
    float _2894 = _2712;
    float _2896 = _2746;
    float _2898 = _2726;
    float _2900 = _2732;
    float _2902 = _2720;
    float _2904 = _2738;
    float _2906 = _2716 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2908 = fma(_2526, -0.5, 0.5);
    float _2910 = precise::clamp(_2908, 0.0, 1.0);
    float _2912 = -_2894;
    float _2914 = _2912 + _2896;
    float _2916 = -_2898;
    float _2918 = _2916 + _2900;
    out.m_49.x = _2906;
    float _2920 = fma(_2910, _2914, _2894);
    float _2922 = -_2902;
    float _2924 = _2922 + _2904;
    float _2926 = fma(_2910, _2918, _2898);
    float _2928 = _2920 * 0.586610972881317138671875;
    bool _2930 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2932 = fma(_2910, _2924, _2902);
    out.m_91.x = 0.0;
    float _2934 = fma(_2926, 0.298911988735198974609375, _2928);
    bool _2936 = _1292 > 0.0;
    bool _2938 = isnan(_1292);
    bool _2940 = _2936 || _2938;
    bool _2942 = isnan(0.0);
    bool _2944 = _2940 || _2942;
    float _2946 = fma(_2932, 0.114477999508380889892578125, _2934);
    bool _2948 = _1346 <= 0.0;
    bool _2950 = !_2944;
    bool _2952 = _2948 || _2950;
    float _2954 = -_2946;
    float _2956 = _2926 + _2954;
    float _2958 = -_2946;
    float _2960 = _2920 + _2958;
    float _2962 = -_2946;
    float _2964 = _2932 + _2962;
    float _2966 = fma(_2956, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2946);
    float _2968 = fma(_2960, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2946);
    float _2970 = fma(_2964, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2946);
    bool _2972 = !_2930;
    if (!_2972)
    {
        float _2974 = -_1228;
        float _2976 = _2974 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2978 = -_1230;
        float _2980 = _2978 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2982 = -_1232;
        float _2984 = _2982 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2986 = _2976 * _2976;
        float _2988 = fma(_2980, _2980, _2986);
        float _2990 = fma(_2984, _2984, _2988);
        float _2992 = sqrt(_2990);
        float _2994 = rsqrt(_2990);
        float _2996 = -_2992;
        float _2998 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3000 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3002 = precise::clamp(_3000, 0.0, 1.0);
        float _3004 = _2980 * _2994;
        float _3006 = _2976 * _2994;
        float _3008 = abs(_3002);
        float _3010 = log2(_3008);
        float _3012 = _2984 * _2994;
        float _3014 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3016 = _2526 * _3006;
        float _3018 = -_3006;
        float _3020 = -_3014;
        float _3022 = fma(_3018, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3020);
        float _3024 = fma(_2544, _3004, _3016);
        float _3026 = -_3012;
        float _3028 = fma(_3026, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3022);
        float _3030 = fma(_2556, _3012, _3024);
        float _3032 = precise::clamp(_3030, 0.0, 1.0);
        float _3034 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3036 = _3028 + _3034;
        float _3038 = _3010 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3040 = _3036 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3042 = precise::clamp(_3040, 0.0, 1.0);
        float _3044 = exp2(_3038);
        float _3046 = _3044 * _3042;
        float _3048 = _3032 * _3046;
        float _3050 = _3048 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3052 = _3048 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3054 = _3048 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3050;
        out.m_91.y = _3052;
        out.m_91.z = _3054;
    }
    out.m_65.x = _2966;
    out.m_65.y = _2968;
    out.m_65.z = _2970;
    if (!_2952)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3056 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3056;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

