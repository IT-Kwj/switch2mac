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
    float4 m_71 [[user(locn6)]];
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
    float4 m_73 [[attribute(9)]];
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2846 = false;
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
        float _3151 = as_type<float>(_126);
        out.gl_Position.z = _3151;
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
        float _3221 = as_type<float>(_164);
        out.gl_Position.z = _3221;
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
    float _516 = floor(_482);
    bool _518 = _484 > 0.0;
    float _520 = _512 + (-1.0);
    bool _522 = _484 >= 0.0;
    bool _524 = isnan(_484);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[4].z, _504);
    float _534 = float(_450);
    float _536 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
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
    float _562 = 1.0 / _534;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _566 = _516 > 0.0;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _570 = _516 >= 0.0;
    bool _572 = isnan(_516);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.0);
    bool _578 = _574 || _576;
    float _580 = _544 * _144;
    float _582 = _464 ? _542 : 0.0;
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
    float _604 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[78].z, _564);
    int _606 = _530 ? 0 : 1;
    float _608 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _490);
    float _610 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[5].z, _510);
    float _612 = _562 * _144;
    float _614 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _604);
    int _616 = ~_606;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _584);
    int _624 = _620;
    if (!_518)
    {
        int _626 = ~_606;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = _532 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _634 = _578 ? 0 : 1;
    float _636 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_556)
    {
        float _638 = _582 * _586;
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
    if (!_566)
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
    float _704 = float(_630);
    int _706 = _602 ? 0 : 1;
    bool _708 = !_698;
    int _710 = _708 ? 0 : 1;
    bool _712 = !_694;
    int _714 = _712 ? 0 : 1;
    int _716 = abs(_710);
    int _718 = abs(_714);
    float _720 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _722 = _636 + _720;
    float _724 = float(_716);
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _728 = _654 + _726;
    int _730 = ~_706;
    int _732 = _730 + 1;
    int _734 = _732 + 1;
    float _736 = _722 * _722;
    int _738 = _734;
    if (!_588)
    {
        int _740 = ~_706;
        int _742 = _740 + 1;
        _738 = _742;
    }
    int _744 = _738;
    float _746 = _724 * _704;
    float _748 = float(_718);
    float _750 = fma(_664, _664, _736);
    float _752 = float(_744);
    float _754 = _746 * (-2.0);
    float _756 = _430 + (-0.5);
    float _758 = fma(_728, _728, _750);
    bool _760 = !_702;
    int _762 = _760 ? 0 : 1;
    float _764 = fma(_754, _680, _680);
    float _766 = _748 * _752;
    float _768 = sqrt(_758);
    int _770 = abs(_762);
    float _772 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _764);
    float _774 = _446 + _428;
    float _776 = fma(_536, _754, _536);
    float _778 = _766 * (-2.0);
    float _780 = _774 + (-1.0);
    float _782 = float(_672);
    float _784 = rsqrt(_758);
    float _786 = float(_770);
    float _788 = fma(_776, _640, _772);
    float _790 = _446 + (-0.5);
    float _792 = fma(_514, _778, _514);
    float _794 = _786 * _782;
    float _796 = _768 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _798 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _800 = _428 + (-0.5);
    float _802 = _788 * 0.15915493667125701904296875;
    float _804 = fma(_778, _678, _678);
    float _806 = precise::min(_454, _796);
    float _808 = _794 * (-2.0);
    float _810 = _802 * 6.283185482025146484375;
    float _812 = sin(_810);
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[196].x, _804);
    float _816 = fma(_798, _808, _798);
    float _818 = _784 * _806;
    float _820 = fma(_808, _682, _682);
    float _822 = fma(_792, _640, _814);
    bool _824 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _826 = isnan(0.5);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _832 = _828 || _830;
    float _834 = _722 * _818;
    float _836 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[196].z, _820);
    float _838 = _664 * _818;
    float _840 = _802 * 6.283185482025146484375;
    float _842 = cos(_840);
    float _844 = -_834;
    float _846 = _722 + _844;
    float _848 = fma(_816, _640, _836);
    float _850 = -_838;
    float _852 = _664 + _850;
    float _854 = _728 * _818;
    float _856 = _846 * _846;
    float _858 = _822 * 0.15915493667125701904296875;
    bool _860 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _862 = isnan(0.5);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _868 = _864 || _866;
    float _870 = -_854;
    float _872 = _728 + _870;
    float _874 = fma(_852, _852, _856);
    float _876 = _848 * 0.15915493667125701904296875;
    float _878 = _858 * 6.283185482025146484375;
    float _880 = cos(_878);
    float _882 = fma(_872, _872, _874);
    float _884 = in.m_61.x;
    float _886 = in.m_61.y;
    float _888 = in.m_61.z;
    float _890 = sqrt(_882);
    float _892 = _858 * 6.283185482025146484375;
    float _894 = sin(_892);
    float _896 = _880 * _812;
    float _898 = _876 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = _784 * _890;
    float _904 = _880 * _842;
    float _906 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _886);
    float _908 = _444 * _902;
    float _910 = _436 * _902;
    float _912 = _466 * _902;
    float _914 = _876 * 6.283185482025146484375;
    float _916 = sin(_914);
    float _918 = _908 * _906;
    float _920 = _894 * _812;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _884);
    float _924 = _894 * _842;
    float _926 = _910 * _922;
    float _928 = _880 * _900;
    float _930 = _894 * _900;
    float _932 = _842 * _900;
    float _934 = _812 * _900;
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _888);
    float _938 = _928 * _918;
    float _940 = fma(_916, _904, _920);
    float _942 = -_896;
    float _944 = fma(_916, _924, _942);
    float _946 = -_924;
    float _948 = fma(_916, _896, _946);
    float _950 = _912 * _936;
    float _952 = -_918;
    float _954 = _916 * _952;
    float _956 = fma(_940, _926, _938);
    float _958 = _930 * _918;
    float _960 = fma(_916, _920, _904);
    float _962 = fma(_932, _926, _954);
    float _964 = fma(_948, _950, _956);
    float _966 = fma(_944, _926, _958);
    float _968 = fma(_934, _950, _962);
    float _970 = _964 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _972 = fma(_960, _950, _966);
    float _974 = _964 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _976 = -_834;
    float _978 = _636 + _976;
    float _980 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].x, _970);
    float _982 = -_838;
    float _984 = _632 + _982;
    float _986 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].x, _974);
    float _988 = _978 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _990 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _992 = -_854;
    float _994 = _654 + _992;
    float _996 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[24].z, _986);
    float _998 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[11].x, _988);
    float _1000 = _990 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1002 = _964 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1004 = _996 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1006 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[11].z, _998);
    float _1008 = _654 + _1000;
    float _1010 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1002);
    float _1012 = _632 + _1004;
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1018 = _1008 + _1016;
    float _1020 = _978 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1024 = _1012 + _1022;
    float _1026 = 1.0 / _1014;
    float _1028 = _1018 * _1018;
    float _1030 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1020);
    float _1032 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1034 = fma(_1024, _1024, _1028);
    float _1036 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1030);
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
    float _1070 = _1012;
    float _1072 = _834;
    float _1074 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1076 = _1026;
    float _1078 = _884;
    if (!_1056)
    {
        _1060 = _1012;
    }
    float _1080 = _1060;
    float _1082 = _1080;
    if (!_1056)
    {
        _1062 = _1008;
    }
    float _1084 = _1062;
    float _1086 = _1084;
    if (!_1056)
    {
        _1064 = _1044;
    }
    float _1088 = _1064;
    bool _1090 = !_1056;
    float _1092 = _1088;
    if (!_1090)
    {
        float _1094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1098 = _1040 + _1096;
        float _1100 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1102 = rsqrt(_1034);
        float _1104 = _1098 * _1094;
        float _1106 = _1104 * 0.15915493667125701904296875;
        float _1108 = _1106 * 6.283185482025146484375;
        float _1110 = cos(_1108);
        float _1112 = _1106 * 6.283185482025146484375;
        float _1114 = sin(_1112);
        float _1116 = _1110 + (-1.0);
        float _1118 = _1116 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = fma(_1114, _1100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1122 = fma(_1044, _1110, _1118);
        float _1124 = _1102 * _1120;
        float _1126 = fma(_1024, _1124, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1128 = fma(_1018, _1124, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1082 = _1126;
        _1086 = _1128;
        _1092 = _1122;
        _1066 = _1102;
        _1068 = _1100;
    }
    float _1130 = _1082;
    float _1132 = _1086;
    float _1134 = _1092;
    float _1136 = _1066;
    float _1138 = _1068;
    float _1140 = -_838;
    float _1142 = _1140 + _1130;
    float _1144 = -_854;
    float _1146 = _1144 + _1132;
    float _1148 = -_834;
    float _1150 = _1148 + _1134;
    float _1152 = _1142;
    float _1154 = _1150;
    float _1156 = _1136;
    float _1158 = _1134;
    float _1160 = _1138;
    if (_868)
    {
        _1070 = 1.0;
    }
    float _1162 = _1070;
    float _1164 = _1162;
    if (_832)
    {
        _1072 = _1142;
    }
    float _1166 = _1072;
    float _1168 = _1166;
    if (_832)
    {
        _1152 = _1146;
    }
    float _1170 = _1152;
    float _1172 = _1170;
    if (!_832)
    {
        float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1176 = _978 + _1174;
        float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1180 = _984 + _1178;
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1184 = -_632;
        float _1186 = _1184 + _1130;
        float _1188 = _1176 * _1176;
        float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1192 = _994 + _1190;
        float _1194 = fma(_1180, _1180, _1188);
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1198 = fma(_1192, _1192, _1194);
        float _1200 = sqrt(_1198);
        float _1202 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1204 = -_636;
        float _1206 = _1204 + _1134;
        float _1208 = -_654;
        float _1210 = _1208 + _1132;
        float _1212 = precise::min(_1200, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1214 = _1212 * _1196;
        float _1216 = _1202 * _1214;
        float _1218 = fma(_1186, _1216, _984);
        float _1220 = fma(_1206, _1216, _978);
        float _1222 = fma(_1210, _1216, _994);
        _1154 = _1220;
        _1168 = _1218;
        _1172 = _1222;
    }
    float _1224 = _1154;
    float _1226 = _1168;
    float _1228 = _1172;
    if (_868)
    {
        _1074 = 1.0;
    }
    float _1230 = _1074;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1234 = _1058 * _1232;
    float _1236 = _1230;
    if (!_868)
    {
        float _1238 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1240 = _1238 * 0.15915493667125701904296875;
        float _1242 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1244 = _1240 * 6.283185482025146484375;
        float _1246 = cos(_1244);
        float _1248 = _1242 * 0.15915493667125701904296875;
        float _1250 = _1240 * 6.283185482025146484375;
        float _1252 = sin(_1250);
        float _1254 = 1.0 / _1246;
        float _1256 = _1248 * 6.283185482025146484375;
        float _1258 = cos(_1256);
        float _1260 = _1252 * _1254;
        float _1262 = _1248 * 6.283185482025146484375;
        float _1264 = sin(_1262);
        float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1268 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1266;
        float _1270 = _1258 * _1260;
        float _1272 = 1.0 / _1268;
        float _1274 = 1.0 / _1270;
        float _1276 = _1264 * _1274;
        float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1280 = fma(_1234, _1276, _1278);
        float _1282 = _1280 * _1272;
        float _1284 = precise::clamp(_1282, 0.0, 1.0);
        _1156 = _1240;
        _1164 = _1284;
    }
    float _1286 = _1156;
    float _1288 = _1164;
    if (!_868)
    {
        float _1290 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1292 = _1290 * 0.15915493667125701904296875;
        float _1294 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1296 = _1292 * 6.283185482025146484375;
        float _1298 = cos(_1296);
        float _1300 = _1294 * 0.15915493667125701904296875;
        float _1302 = _1292 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        float _1306 = 1.0 / _1298;
        float _1308 = _1300 * 6.283185482025146484375;
        float _1310 = cos(_1308);
        float _1312 = _1304 * _1306;
        float _1314 = _1300 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        float _1318 = _1310 * _1312;
        float _1320 = 1.0 / _1318;
        float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1324 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1322;
        float _1326 = 1.0 / _1324;
        float _1328 = _1316 * _1320;
        float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1332 = fma(_1234, _1328, _1330);
        float _1334 = _1332 * _1326;
        float _1336 = precise::clamp(_1334, 0.0, 1.0);
        float _1338 = -_1336;
        float _1340 = _1338 + 1.0;
        _1236 = _1340;
    }
    float _1342 = _1236;
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1346 = _1224 + _1344;
    float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1350 = _1226 + _1348;
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1354 = _1228 + _1352;
    float _1356 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1358 = _1346 * _1346;
    float _1360 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1362 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1356);
    float _1364 = fma(_1350, _1350, _1358);
    float _1366 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1360);
    float _1368 = fma(_1354, _1354, _1364);
    float _1370 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1366);
    float _1372 = rsqrt(_1368);
    float _1374 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1376 = sqrt(_1368);
    float _1378 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1380 = _1350 * _1378;
    float _1382 = _1354 * _1378;
    float _1384 = _1380 * _1380;
    float _1386 = _1382 * _1382;
    float _1388 = _1384 + _1386;
    float _1390 = sqrt(_1388);
    bool _1392 = _1390 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1396 = _1390 + _1394;
    float _1398 = _1358;
    float _1400 = _1388;
    float _1402 = _1396;
    float _1404 = _1380;
    float _1406 = _1382;
    float _1408 = _1384;
    if (_1392)
    {
        float _1410 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1398 = _1410;
    }
    float _1412 = _1398;
    if (_1392)
    {
        float _1414 = rsqrt(_1388);
        _1400 = _1414;
    }
    float _1416 = _1400;
    float _1418 = _1416;
    if (_1392)
    {
        float _1420 = _1396 * _1412;
        _1402 = _1420;
    }
    float _1422 = _1402;
    if (_1392)
    {
        float _1424 = _1422 * 0.15915493667125701904296875;
        _1076 = _1424;
    }
    float _1426 = _1076;
    float _1428 = _1412;
    if (_1392)
    {
        float _1430 = _1426 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        _1428 = _1432;
    }
    float _1434 = _1428;
    float _1436 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1438 = precise::max(0.0, _1436);
    float _1440 = _1286;
    if (_1392)
    {
        float _1442 = _1426 * 6.283185482025146484375;
        float _1444 = cos(_1442);
        _1440 = _1444;
    }
    float _1446 = _1440;
    float _1448 = -_1378;
    float _1450 = -_1438;
    float _1452 = fma(_1346, _1448, _1450);
    if (_1392)
    {
        float _1454 = _1452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1158 = _1454;
    }
    float _1456 = _1158;
    float _1458 = fma(_984, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1460 = _1434;
    float _1462 = _1456;
    if (_1392)
    {
        float _1464 = fma(_1434, _1456, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1160 = _1464;
    }
    float _1466 = _1160;
    float _1468 = _1466;
    if (!_1392)
    {
        _1460 = _1452;
    }
    float _1470 = _1460;
    float _1472 = floor(_1458);
    float _1474 = _1470;
    float _1476 = _1446;
    if (_1392)
    {
        float _1478 = _1446 + (-1.0);
        _1462 = _1478;
    }
    float _1480 = _1462;
    if (_1392)
    {
        float _1482 = _1416 * _1466;
        _1468 = _1482;
    }
    float _1484 = _1468;
    if (_1392)
    {
        float _1486 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1418 = _1486;
    }
    float _1488 = _1418;
    if (_1392)
    {
        float _1490 = _1380 * _1484;
        _1404 = _1490;
    }
    float _1492 = _1404;
    if (_1392)
    {
        float _1494 = _1382 * _1484;
        _1406 = _1494;
    }
    float _1496 = _1406;
    if (_1392)
    {
        float _1498 = fma(_1452, _1446, _1488);
        _1474 = _1498;
    }
    float _1500 = _1474;
    if (_1392)
    {
        float _1502 = _1492 * _1492;
        _1408 = _1502;
    }
    float _1504 = _1408;
    if (!_1392)
    {
        _1476 = _1386;
    }
    float _1506 = _1476;
    float _1508 = _1506;
    if (_1392)
    {
        float _1510 = _1496 * _1496;
        _1508 = _1510;
    }
    float _1512 = _1508;
    float _1514 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1516 = fma(_1500, _1500, _1504);
    float _1518 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1514);
    float _1520 = _1516 + _1512;
    float _1522 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1524 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1526 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1518);
    float _1528 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1362);
    float _1530 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1532 = fma(_1376, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1530);
    float _1534 = precise::clamp(_1532, 0.0, 1.0);
    float _1536 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1524);
    float _1538 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1540 = rsqrt(_1520);
    float _1542 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1544 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1536);
    float _1546 = -_1534;
    float _1548 = _1546 + 1.0;
    float _1550 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1552 = _1544 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1554 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1556 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1558 = -_1550;
    float _1560 = fma(_1558, _1522, 1.0);
    float _1562 = abs(_1548);
    float _1564 = log2(_1562);
    float _1566 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1554);
    float _1568 = fma(_994, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1570 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1566);
    float _1572 = _1540 * _1492;
    float _1574 = _1540 * _1500;
    float _1576 = floor(_1568);
    float _1578 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1570);
    float _1580 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1582 = _1540 * _1496;
    float _1584 = -_1472;
    float _1586 = _1458 + _1584;
    float _1588 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1590 = -_1580;
    float _1592 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1590);
    float _1594 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1596 = log2(_1560);
    float _1598 = -_1582;
    float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1592);
    float _1602 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1588);
    float _1604 = fma(_1600, -0.5, 0.5);
    float _1606 = fma(_1600, 0.5, 0.5);
    float _1608 = -_1576;
    float _1610 = _1568 + _1608;
    float _1612 = 1.0 / _1578;
    float _1614 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1556);
    float _1616 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1602);
    float _1618 = fma(_1606, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1620 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1614);
    float _1622 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1616);
    float _1624 = fma(_1606, _1618, -0.212114393711090087890625);
    float _1626 = exp2(_1594);
    float _1628 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1620);
    float _1630 = _1596 * 0.693147182464599609375;
    float _1632 = fma(_1606, _1624, 1.570728778839111328125);
    float _1634 = _1630 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1636 = sqrt(_1604);
    float _1638 = _1574 + 1.0;
    float _1640 = _1622 * _1612;
    float _1642 = _1628 * _1612;
    float _1644 = -_1574;
    float _1646 = fma(_1626, _1638, _1644);
    float2 _5517 = float2(_1586, _1610);
    float _1648 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5517, float2(0.0), isnan(_5517)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5517, float2(0.0), isnan(_5517)), level(0.0)).x;
    float _1650 = fma(_1646, 0.5, 0.5);
    float _1652 = _1636 * 0.636619746685028076171875;
    float _1654 = fma(_1640, 0.5, 0.5);
    float _1656 = fma(_1642, -0.5, 0.5);
    float _1658 = -_1632;
    float _1660 = fma(_1652, _1658, 1.0);
    float3 _5542 = float3(_1654, _1656, _1634);
    float _1662 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5542, float3(0.0), isnan(_5542)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5542, float3(0.0), isnan(_5542)), level(0.0)).x;
    float3 _5553 = float3(_1654, _1656, _1634);
    float4 _1665 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5553, float3(0.0), isnan(_5553)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5553, float3(0.0), isnan(_5553)), level(0.0)).xyzw;
    float _1667 = _1665.x;
    float _1669 = _1665.y;
    float _1671 = _1665.z;
    float _1673 = _1665.w;
    float2 _5569 = float2(_1660, _1650);
    float3 _1677 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5569, float2(0.0), isnan(_5569)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5569, float2(0.0), isnan(_5569)), level(0.0)).xyz;
    float _1679 = _1677.x;
    float _1681 = _1677.y;
    float _1683 = _1677.z;
    float _1685 = float(uint(_474));
    float _1687 = trunc(_612);
    int _1689 = int(_1687);
    bool _1691 = _474 == 0;
    out.m_63.x = _984;
    out.m_63.y = _978;
    out.m_63.z = _994;
    int _1693 = abs(_676);
    float _1695 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1697 = abs(_690);
    out.m_65.w = _806;
    bool _1699 = _430 > 0.5;
    float _1701 = 1.0 / _1685;
    int _1703 = ~_474;
    int _1705 = _1703 + 1;
    out.m_67.x = _910;
    int _1707 = ~_474;
    int _1709 = _1707 + 1;
    float _1711 = _940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1715 = _1713 != 0;
    float _1717 = exp2(_1695);
    float _1719 = float(uint(_1689));
    float _1721 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1711);
    out.m_69.x = _1226;
    out.m_69.y = _1224;
    out.m_69.z = _1228;
    float _1723 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1721);
    bool _1725 = !_1715;
    float _1727 = _1725 ? 7.345489978790283203125 : 1.0;
    int _1729 = as_type<int>(_1701) + (-2);
    float _1731 = _1727 * _428;
    float _1733 = as_type<float>(_1729) * _1719;
    float _1735 = floor(_1731);
    float _1737 = -_1717;
    float _1739 = _1737 + 1.0;
    float _1741 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1743 = trunc(_1733);
    float _1745 = precise::max(_1743, 0.0);
    uint _1748 = uint(_1745);
    float _1750 = -_1735;
    float _1752 = _1731 + _1750;
    float _1754 = _1752 * _544;
    int _1756 = _1705 * int(_1748);
    int _1758 = _1756 + _1689;
    float _1760 = trunc(_1754);
    int _1762 = int(_1760);
    float _1764 = float(uint(_1758));
    float _1766 = as_type<float>(_1729) * _1764;
    float _1768 = float(_110);
    float _1770 = float(_1689);
    float _1772 = trunc(_1766);
    float _1774 = precise::max(_1772, 0.0);
    uint _1776 = uint(_1774);
    bool _1778 = _1770 >= _544;
    bool _1780 = isnan(_1770);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan(_544);
    bool _1786 = _1782 || _1784;
    float _1788 = float(_1786);
    float _1790 = 1.0 / _1768;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1794 = _1792 != 0;
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1798 = _426 + _1796;
    int _1800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1802 = _1800 != 0;
    int _1804 = int(_1748) + int(_1776);
    float _1806 = trunc(_1788);
    int _1808 = int(_1806);
    int _1810 = _474 + (-1);
    int _1812 = _1709 * _1804;
    int _1814 = _1812 + _1689;
    float _1816 = _580 * _1790;
    bool _1818 = uint(_1814) >= uint(_474);
    float _1820 = trunc(_1816);
    int _1822 = int(_1820);
    bool _1824 = !_1818;
    int _1826 = _1824 ? 0 : (-1);
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1830 = _1828 != 0;
    int _1832 = ~_1804;
    int _1834 = _1832 + _1826;
    int _1836 = _1834 + 1;
    int _1838 = ~_1808;
    int _1840 = _1838 + 1;
    int _1842 = _1840 + 1;
    bool _1844 = !_1830;
    int _1846 = _1844 ? 0 : 1;
    int _1848 = _474 * _1836;
    int _1850 = _1848 + _1689;
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1854 = _1852 != 0;
    int _1856 = abs(_1846);
    bool _1858 = !_1691;
    int _1860 = _1858 ? _1850 : (-1);
    int _1862 = abs(_686);
    int _1864 = _1860 * _1842;
    int _1866 = _1808 * _1810;
    int _1868 = _1866 + _1864;
    bool _1870 = !_1854;
    int _1872 = _1870 ? 0 : 1;
    int _1874 = _1868 * _1693;
    int _1876 = _1762 * _1856;
    int _1878 = _1876 + _1689;
    int _1880 = abs(_1872);
    int _1882 = _1822 * _1862;
    int _1884 = _1882 + _1874;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1890 = ~_474;
    int _1892 = _1890 + 1;
    bool _1894 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1896 = isnan(_426);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    int _1906 = _1878 * _1697;
    int _1908 = _1906 + _1884;
    int _1910 = ~_474;
    int _1912 = _1910 + 1;
    float _1914 = 1.0 / _1888;
    int _1916 = _1762 * _1880;
    int _1918 = _1916 + _1908;
    float _1920 = -_1904;
    float _1922 = _1920 + 1.0;
    float _1924 = float(uint(_1918));
    float _1926 = as_type<float>(_1729) * _1924;
    float _1928 = trunc(_1926);
    float _1930 = precise::max(_1928, 0.0);
    uint _1932 = uint(_1930);
    int _1934 = _1912 * int(_1932);
    int _1936 = _1934 + _1918;
    float _1938 = float(uint(_1936));
    float _1940 = as_type<float>(_1729) * _1938;
    float _1942 = trunc(_1940);
    float _1944 = precise::max(_1942, 0.0);
    uint _1946 = uint(_1944);
    int _1948 = int(_1932) + int(_1946);
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1950;
    float _1954 = float(uint(_1878));
    float _1956 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1958 = _1956 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1960 = _1892 * _1948;
    int _1962 = _1960 + _1918;
    float _1964 = as_type<float>(_1729) * _1954;
    float _1966 = _1958 * _1914;
    bool _1968 = uint(_1962) >= uint(_474);
    float _1970 = trunc(_1964);
    float _1972 = precise::max(_1970, 0.0);
    uint _1974 = uint(_1972);
    bool _1976 = !_1968;
    int _1978 = _1976 ? 0 : (-1);
    int _1980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1982 = _1980 != 0;
    int _1984 = ~_1948;
    int _1986 = _1984 + _1978;
    int _1988 = _1986 + 1;
    bool _1990 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1992 = isnan(_426);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    int _2002 = _474 * _1988;
    int _2004 = _2002 + _1918;
    float _2006 = _2000 * _1922;
    bool _2008 = !_1691;
    int _2010 = _2008 ? _2004 : (-1);
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    int _2012 = _2010 >> 31;
    int _2014 = _2010 & 3;
    bool _2016 = _2014 != 0;
    float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2020 = _2018 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2022 = _2012 & 3;
    int _2024 = ~_474;
    int _2026 = _2024 + 1;
    float _2028 = 1.0 / _2020;
    int _2030 = _2010 + _2022;
    float _2032 = in.m_73.y;
    int _2034 = _2026 * int(_1974);
    int _2036 = _2034 + _1878;
    int _2038 = _2030 >> 2;
    bool _2040 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2042 = isnan(_426);
    bool _2044 = _2040 || _2042;
    bool _2046 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2048 = _2044 || _2046;
    float _2050 = float(_2048);
    int _2052 = _2038 << 4;
    int _2054 = _2052 + 368;
    float _2056 = float(uint(_2036));
    uint _2058 = uint(int(uint(_2054) >> uint(2)));
    uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
    int _2062 = int(_2058) & 3;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[int(_2060)][_2062];
    int _2066 = int(_2058) + 1;
    uint _2068 = uint(int(uint(_2066) >> uint(2)));
    int _2070 = _2066 & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    int _2074 = _2010 & 3;
    bool _2076 = _2074 != 0;
    float _2078 = as_type<float>(_1729) * _2056;
    float _2080 = _1952 * _2028;
    float _2082 = -_2050;
    float _2084 = _2082 + 1.0;
    int _2086 = _2016 ? 0 : 1;
    int _2088 = _2054 + 8;
    uint _2090 = uint(int(uint(_2088) >> uint(2)));
    uint _2092 = uint(int(uint(int(_2090)) >> uint(2)));
    int _2094 = int(_2090) & 3;
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[int(_2092)][_2094];
    int _2098 = int(_2090) + 1;
    uint _2100 = uint(int(uint(_2098) >> uint(2)));
    int _2102 = _2098 & 3;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[int(_2100)][_2102];
    bool _2106 = uint(_2074) > 1u;
    float _2108 = _1904 * _2084;
    float _2110 = trunc(_2078);
    float _2112 = precise::max(_2110, 0.0);
    uint _2114 = uint(_2112);
    float _2116 = fma(_2080, _1798, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2118 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2120 = _426 + _2118;
    float _2122 = -_2032;
    float _2124 = _2122 + 1.0;
    int _2126 = ~_2086;
    int _2128 = _2126 + 1;
    int _2130 = _2128 + 1;
    float _2132 = _2116 * _2006;
    float _2134 = fma(_1966, _2120, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2136 = _2032;
    int _2138 = _2130;
    float _2140 = _1578;
    float _2142 = _1628;
    if (_1794)
    {
        float _2144 = _1699 ? _2124 : _2032;
        _2136 = _2144;
    }
    float _2146 = _2136;
    bool _2148 = _2074 != 3;
    float _2150 = -_1648;
    float _2152 = _2150 + 1.0;
    if (!_2106)
    {
        int _2154 = ~_2086;
        int _2156 = _2154 + 1;
        _2138 = _2156;
    }
    int _2158 = _2138;
    float _2160 = -_2000;
    float _2162 = _2160 + 1.0;
    bool _2164 = uint(_2074) >= 2u;
    bool _2166 = !_2076;
    int _2168 = _2166 ? 0 : 1;
    float _2170 = fma(_2162, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2132);
    int _2172 = abs(_2158);
    int _2174 = _2164 ? 0 : 1;
    float _2176 = fma(_2134, _2108, _2170);
    int _2178 = int(_1974) + int(_2114);
    int _2180 = ~_474;
    int _2182 = _2180 + 1;
    float _2184 = _1741 * _1662;
    int _2186 = abs(_2168);
    int _2188 = ~_2174;
    int _2190 = _2188 + 1;
    int _2192 = _2190 + 1;
    int _2194 = _2182 * _2178;
    int _2196 = _2194 + _1878;
    int _2198 = ~_2172;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    int _2204 = _2192;
    if (_2148)
    {
        int _2206 = ~_2174;
        int _2208 = _2206 + 1;
        _2204 = _2208;
    }
    int _2210 = _2204;
    float _2212 = _928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2214 = ~_2186;
    int _2216 = _2214 + 1;
    int _2218 = _2216 + 1;
    int _2220 = abs(_2210);
    int _2222 = _2202 * as_type<int>(_2072);
    bool _2224 = uint(_2196) >= uint(_474);
    float _2226 = as_type<float>(_2186);
    if (_1802)
    {
        float _2228 = in.m_53.x;
        _2226 = _2228;
    }
    float _2230 = _2226;
    bool _2232 = _2074 != 3;
    int _2234 = _2218 * as_type<int>(_2064);
    int _2236 = _2234 + _2222;
    float _2238 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2240 = int(_2238);
    bool _2242 = !_2232;
    int _2244 = _2242 ? 0 : (-1);
    bool _2246 = !_2224;
    int _2248 = _2246 ? 0 : (-1);
    int _2250 = ~_2220;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    bool _2256 = !_1982;
    int _2258 = _2256 ? 0 : 1;
    int _2260 = abs(_2244);
    int _2262 = _2254 * as_type<int>(_2096);
    int _2264 = _2262 + _2236;
    int _2266 = ~_2178;
    int _2268 = _2266 + _2248;
    int _2270 = _2268 + 1;
    int _2272 = abs(_2258);
    float _2274 = in.m_73.x;
    int _2276 = ~_2260;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = _474 * _2270;
    int _2284 = _2282 + _1878;
    int _2286 = ~_2272;
    int _2288 = _2286 + 1;
    int _2290 = _2288 + 1;
    float _2292 = in.m_75.x;
    float _2294 = in.m_75.y;
    float _2296 = in.m_75.z;
    bool _2298 = _886 != 0.0;
    bool _2300 = isnan(_886);
    bool _2302 = _2298 || _2300;
    bool _2304 = isnan(0.0);
    bool _2306 = _2302 || _2304;
    int _2308 = _2280 * as_type<int>(_2104);
    int _2310 = _2308 + _2264;
    int _2312 = abs(_2240);
    bool _2314 = _884 == 0.0;
    bool _2316 = !_2306;
    bool _2318 = _2314 && _2316;
    int _2320 = _2310 * _2290;
    float _2322 = float(uint(_2240));
    float _2324 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2176);
    bool _2326 = !_1691;
    int _2328 = _2326 ? _2284 : (-1);
    bool _2330 = _888 == 0.0;
    bool _2332 = _2330 && _2318;
    float _2334 = 1.0 / _2322;
    float _2336 = float(uint(_2312));
    int _2338 = _2328 * _2272;
    int _2340 = _2338 + _2320;
    float _2342 = _2324 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2344 = 1.0 / _2336;
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2350 = _2230 > 0.5;
    bool _2352 = _2350 && _1802;
    float _2354 = _2292;
    float _2356 = _2230;
    float _2358 = _2296;
    float _2360 = _2294;
    if (!_2332)
    {
        float _2362 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2292);
        _2354 = _2362;
    }
    float _2364 = _2354;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1802)
    {
        _2356 = _2274;
    }
    float _2368 = _2356;
    float _2370 = _2368;
    if (!_2332)
    {
        float _2372 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2296);
        _2358 = _2372;
    }
    float _2374 = _2358;
    if (!_1802)
    {
        _1078 = _2274;
    }
    float _2376 = _1078;
    float _2378 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2380 = abs(_2340);
    float _2382 = _2348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2384 = as_type<int>(_2334) + (-2);
    float _2386 = _2366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2388 = float(uint(_2340));
    float _2390 = _2376;
    if (!_2332)
    {
        float _2392 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2294);
        _2360 = _2392;
    }
    float _2394 = _2360;
    if (_2352)
    {
        float _2396 = -_2368;
        float _2398 = _2396 + 1.0;
        _2370 = _2398;
    }
    float _2400 = _2370;
    int _2402 = as_type<int>(_2344) + (-2);
    float _2404 = as_type<float>(_2384) * _2388;
    float _2406 = float(uint(_2380));
    out.m_77.x = _2378;
    out.m_77.y = _2382;
    out.m_77.z = _2386;
    out.m_77.w = _2342;
    if (_1802)
    {
        _2390 = _2400;
    }
    float _2408 = _2390;
    float _2410 = _928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2412 = ~_2240;
    int _2414 = _2412 + 1;
    float _2416 = trunc(_2404);
    float _2418 = precise::max(_2416, 0.0);
    uint _2420 = uint(_2418);
    float _2422 = as_type<float>(_2402) * _2406;
    int _2424 = ~_2312;
    int _2426 = _2424 + 1;
    float _2428 = -_916;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2410);
    float _2432 = _928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2434 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2430);
    float _2436 = trunc(_2422);
    float _2438 = precise::max(_2436, 0.0);
    uint _2440 = uint(_2438);
    float _2442 = _940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2444 = -_916;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2212);
    float _2448 = -_916;
    float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2432);
    float _2452 = _948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2454 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2442);
    float _2456 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2446);
    int _2458 = _2414 * int(_2420);
    int _2460 = _2458 + _2340;
    float _2462 = abs(_1234);
    float _2464 = log2(_2462);
    float _2466 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2450);
    float _2468 = _2434 * _2394;
    float _2470 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2452);
    float _2472 = float(uint(_2460));
    float _2474 = _2456 * _2394;
    int _2476 = ~_2312;
    int _2478 = _2476 + 1;
    int _2480 = _2426 * int(_2440);
    int _2482 = _2480 + _2380;
    float _2484 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2454);
    float _2486 = as_type<float>(_2384) * _2472;
    float _2488 = _940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2490 = _948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2492 = float(uint(_2482));
    float _2494 = _948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2496 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2488);
    float _2498 = trunc(_2486);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    float _2504 = _2464 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2506 = as_type<float>(_2402) * _2492;
    float _2508 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2490);
    float _2510 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2494);
    int _2512 = ~_2240;
    int _2514 = _2512 + 1;
    float _2516 = _2466 * _2394;
    float _2518 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2496);
    float _2520 = trunc(_2506);
    float _2522 = precise::max(_2520, 0.0);
    uint _2524 = uint(_2522);
    float _2526 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2508);
    float _2528 = fma(_1723, _2364, _2516);
    int _2530 = _2340 ^ _2240;
    float _2532 = fma(_2518, _2364, _2474);
    float _2534 = fma(_2484, _2364, _2468);
    float _2536 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2470);
    uint _2538 = uint(int(uint(_2530) >> uint(31)));
    float _2540 = exp2(_2504);
    int _2542 = int(_2420) + int(_2502);
    float _2544 = fma(_2526, _2374, _2534);
    float _2546 = fma(_2536, _2374, _2532);
    bool _2548 = _1234 <= 8000.0;
    bool _2550 = isnan(_1234);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan(8000.0);
    bool _2556 = _2552 || _2554;
    float _2558 = float(_2556);
    float _2560 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2510);
    int _2562 = int(_2440) + int(_2524);
    int _2564 = _2514 * _2542;
    int _2566 = _2564 + _2340;
    float _2568 = _1683 * _2184;
    float _2570 = fma(_2560, _2374, _2528);
    int _2572 = _2478 * _2562;
    int _2574 = _2572 + _2380;
    bool _2576 = uint(_2566) >= uint(_2240);
    out.m_79.x = _2544;
    out.m_79.y = _2546;
    out.m_79.z = _2570;
    bool _2578 = uint(_2574) >= uint(_2312);
    bool _2580 = !_2576;
    int _2582 = _2580 ? 0 : (-1);
    float _2584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2586 = !_2578;
    int _2588 = _2586 ? 0 : (-1);
    float _2590 = fma(_2540, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2592 = precise::clamp(_2590, 0.0, 1.0);
    int _2594 = ~_2588;
    int _2596 = _2562 + _2594;
    int _2598 = _2596 + 1;
    int _2600 = ~_2542;
    int _2602 = _2600 + _2582;
    int _2604 = _2602 + 1;
    float _2606 = fma(_2592, -2.0, 3.0);
    int _2608 = ~int(_2538);
    int _2610 = _2608 + 1;
    float _2612 = _2592 * _2592;
    bool _2614 = _2240 == 0;
    int _2616 = _2240 * _2604;
    int _2618 = _2616 + _2340;
    int _2620 = _2598 ^ _2610;
    float _2622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2624 = _2240 == 0;
    float _2626 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2628 = ~_2610;
    int _2630 = _2628 + _2620;
    int _2632 = _2630 + 1;
    float _2634 = _2612 * _2606;
    bool _2636 = !_2614;
    int _2638 = _2636 ? _2618 : (-1);
    float _2640 = _2584 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2642 = !_2624;
    int _2644 = _2642 ? _2632 : (-1);
    float _2646 = -_2634;
    float _2648 = _2646 + 1.0;
    float _2650 = float(_2638);
    float _2652 = fma(_2640, _2408, -0.5);
    float _2654 = float(_2644);
    float _2656 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2634);
    float _2658 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2626);
    float _2660 = fma(_2640, _2650, _592);
    float _2662 = _1578 * 0.5;
    float _2664 = in.m_81.x;
    float _2666 = _2622 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2668 = fma(_614, _2652, _2660);
    float _2670 = _2558 * _2656;
    float _2672 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2658);
    float _2674 = fma(_2666, _2146, -0.5);
    float _2676 = -_608;
    float _2678 = fma(_2666, _2654, _2676);
    float _2680 = fma(_1628, -0.5, _2662);
    float _2682 = _2668 + 0.5;
    float _2684 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2686 = fma(_622, _2674, _2678);
    float _2688 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2672);
    float _2690 = _2152 * _2684;
    float _2692 = precise::clamp(_2690, 0.0, 1.0);
    float _2694 = _2686 + 0.5;
    float _2696 = _2688 + _1578;
    float _2698 = _1622 + _1578;
    out.gl_Position.x = _1622;
    out.gl_Position.y = _1628;
    out.gl_Position.z = _2688;
    out.gl_Position.w = _1578;
    float _2700 = -_2692;
    float _2702 = fma(_2700, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2704 = _1376 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2706 = isnan(_1376);
    bool _2708 = _2704 || _2706;
    bool _2710 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2712 = _2708 || _2710;
    float _2714 = _2696 * 0.5;
    out.m_83.x = _2682;
    out.m_83.y = _2694;
    float _2716 = _2698 * 0.5;
    float _2718 = _2702 * _2664;
    float _2720 = fma(_1673, _2568, _1671);
    out.m_85.x = _2716;
    out.m_85.y = _2680;
    out.m_85.z = _2714;
    out.m_85.w = _1578;
    float _2722 = _1673 * _2184;
    float _2724 = -_1741;
    float _2726 = _2724 + 1.0;
    float _2728 = _2726;
    float _2730 = _2716;
    if (!_2712)
    {
        _2140 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2732 = _2140;
    float _2734 = fma(_1679, _2722, _1667);
    float _2736 = fma(_1681, _2722, _1669);
    float _2738 = _1673 * _2726;
    float _2740 = _2718 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2742 = _1288 * _1342;
    float _2744 = _2742;
    float _2746 = _2740;
    float _2748 = _2732;
    float _2750 = _2732;
    if (!_2712)
    {
        _2728 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2752 = _2728;
    out.m_87.x = _2734;
    out.m_87.y = _2736;
    out.m_87.z = _2720;
    out.m_87.w = _2738;
    float _2754 = _2742 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2756 = _2752;
    float _2758 = _2752;
    if (!_2712)
    {
        _2730 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2760 = _2730;
    out.m_89.x = _2740;
    float _2762 = _2760;
    float _2764 = _2760;
    if (!_2712)
    {
        _2142 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2766 = _2142;
    float _2768 = _2766;
    float _2770 = _2766;
    if (!_2712)
    {
        _2744 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2772 = _2744;
    float _2774 = _2772;
    float _2776 = _2772;
    if (!_2712)
    {
        _2746 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2778 = _2746;
    bool _2780 = !_2712;
    float _2782 = _2778;
    float _2784 = _2778;
    if (!_2780)
    {
        bool _2786 = _1376 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2788 = isnan(_1376);
        bool _2790 = _2786 || _2788;
        bool _2792 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2794 = _2790 || _2792;
        if (!_2794)
        {
            float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2798 = _1376 + _2796;
            float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2802 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2800;
            float _2804 = 1.0 / _2802;
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2826 = _2798 * _2804;
            float _2828 = precise::clamp(_2826, 0.0, 1.0);
            float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2834 = fma(_2828, _2808, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2836 = fma(_2828, _2832, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2838 = fma(_2828, _2812, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2840 = fma(_2828, _2816, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2842 = fma(_2828, _2820, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2844 = fma(_2828, _2824, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2750 = _2836;
            _2784 = _2842;
            _2764 = _2834;
            _2770 = _2840;
            _2758 = _2838;
            _2776 = _2844;
            _2846 = true;
        }
        else
        {
            bool _2848 = _1376 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2850 = isnan(_1376);
            bool _2852 = _2848 || _2850;
            bool _2854 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2856 = _2852 || _2854;
            if (!_2856)
            {
                _2762 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2858 = _2762;
            _2764 = _2858;
            if (!_2856)
            {
                _2748 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2860 = _2748;
            _2750 = _2860;
            if (!_2856)
            {
                _2756 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2862 = _2756;
            _2758 = _2862;
            if (!_2856)
            {
                _2768 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2864 = _2768;
            _2770 = _2864;
            if (!_2856)
            {
                _2782 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2866 = _2782;
            _2784 = _2866;
            if (!_2856)
            {
                _2774 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2868 = _2774;
            bool _2870 = !_2856;
            _2776 = _2868;
            if (!_2870)
            {
                bool _2872 = _1376 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2874 = isnan(_1376);
                bool _2876 = _2872 || _2874;
                bool _2878 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2880 = _2876 || _2878;
                if (!_2880)
                {
                    float _2882 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2884 = _1376 + _2882;
                    float _2886 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2888 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2886;
                    float _2890 = 1.0 / _2888;
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2898 = _2896 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2904 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2906 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2912 = _2884 * _2890;
                    float _2914 = precise::clamp(_2912, 0.0, 1.0);
                    float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2920 = fma(_2914, _2894, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2922 = fma(_2914, _2918, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2924 = fma(_2914, _2898, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2926 = fma(_2914, _2902, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2928 = fma(_2914, _2906, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2930 = fma(_2914, _2910, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2750 = _2922;
                    _2784 = _2928;
                    _2764 = _2920;
                    _2770 = _2926;
                    _2758 = _2924;
                    _2776 = _2930;
                    _2846 = true;
                }
                else
                {
                    _2750 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2784 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2764 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2770 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2758 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2776 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2846 = false;
    float _2932 = _2750;
    float _2934 = _2784;
    float _2936 = _2764;
    float _2938 = _2770;
    float _2940 = _2758;
    float _2942 = _2776;
    float _2944 = _2754 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2946 = fma(_2546, -0.5, 0.5);
    float _2948 = precise::clamp(_2946, 0.0, 1.0);
    float _2950 = -_2932;
    float _2952 = _2950 + _2934;
    float _2954 = -_2936;
    float _2956 = _2954 + _2938;
    out.m_49.x = _2944;
    float _2958 = fma(_2948, _2952, _2932);
    float _2960 = -_2940;
    float _2962 = _2960 + _2942;
    float _2964 = fma(_2948, _2956, _2936);
    float _2966 = _2958 * 0.586610972881317138671875;
    bool _2968 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2970 = fma(_2948, _2962, _2940);
    out.m_91.x = 0.0;
    float _2972 = fma(_2964, 0.298911988735198974609375, _2966);
    bool _2974 = _1288 > 0.0;
    bool _2976 = isnan(_1288);
    bool _2978 = _2974 || _2976;
    bool _2980 = isnan(0.0);
    bool _2982 = _2978 || _2980;
    float _2984 = fma(_2970, 0.114477999508380889892578125, _2972);
    bool _2986 = _1342 <= 0.0;
    bool _2988 = !_2982;
    bool _2990 = _2986 || _2988;
    float _2992 = -_2984;
    float _2994 = _2964 + _2992;
    float _2996 = -_2984;
    float _2998 = _2958 + _2996;
    float _3000 = -_2984;
    float _3002 = _2970 + _3000;
    float _3004 = fma(_2994, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2984);
    float _3006 = fma(_2998, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2984);
    float _3008 = fma(_3002, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2984);
    bool _3010 = !_2968;
    if (!_3010)
    {
        float _3012 = -_1224;
        float _3014 = _3012 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3016 = -_1226;
        float _3018 = _3016 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3020 = -_1228;
        float _3022 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3024 = _3014 * _3014;
        float _3026 = fma(_3018, _3018, _3024);
        float _3028 = fma(_3022, _3022, _3026);
        float _3030 = sqrt(_3028);
        float _3032 = rsqrt(_3028);
        float _3034 = -_3030;
        float _3036 = _3034 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3038 = _3036 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3040 = precise::clamp(_3038, 0.0, 1.0);
        float _3042 = _3018 * _3032;
        float _3044 = _3014 * _3032;
        float _3046 = abs(_3040);
        float _3048 = log2(_3046);
        float _3050 = _3022 * _3032;
        float _3052 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3054 = _2546 * _3044;
        float _3056 = -_3044;
        float _3058 = -_3052;
        float _3060 = fma(_3056, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3058);
        float _3062 = fma(_2544, _3042, _3054);
        float _3064 = -_3050;
        float _3066 = fma(_3064, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3060);
        float _3068 = fma(_2570, _3050, _3062);
        float _3070 = precise::clamp(_3068, 0.0, 1.0);
        float _3072 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3074 = _3066 + _3072;
        float _3076 = _3048 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3078 = _3074 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3080 = precise::clamp(_3078, 0.0, 1.0);
        float _3082 = exp2(_3076);
        float _3084 = _3082 * _3080;
        float _3086 = _3070 * _3084;
        float _3088 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3090 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3092 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3088;
        out.m_91.y = _3090;
        out.m_91.z = _3092;
    }
    out.m_65.x = _3004;
    out.m_65.y = _3006;
    out.m_65.z = _3008;
    if (!_2990)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3094 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3094;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2846 = false;
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
        float _3151 = as_type<float>(_126);
        out.gl_Position.z = _3151;
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
        float _3221 = as_type<float>(_164);
        out.gl_Position.z = _3221;
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
    float _516 = floor(_482);
    bool _518 = _484 > 0.0;
    float _520 = _512 + (-1.0);
    bool _522 = _484 >= 0.0;
    bool _524 = isnan(_484);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[4].z, _504);
    float _534 = float(_450);
    float _536 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
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
    float _562 = 1.0 / _534;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _566 = _516 > 0.0;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _570 = _516 >= 0.0;
    bool _572 = isnan(_516);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.0);
    bool _578 = _574 || _576;
    float _580 = _544 * _144;
    float _582 = _464 ? _542 : 0.0;
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
    float _604 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[78].z, _564);
    int _606 = _530 ? 0 : 1;
    float _608 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _490);
    float _610 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[5].z, _510);
    float _612 = _562 * _144;
    float _614 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _604);
    int _616 = ~_606;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _584);
    int _624 = _620;
    if (!_518)
    {
        int _626 = ~_606;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = _532 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _634 = _578 ? 0 : 1;
    float _636 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_556)
    {
        float _638 = _582 * _586;
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
    if (!_566)
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
    float _704 = float(_630);
    int _706 = _602 ? 0 : 1;
    bool _708 = !_698;
    int _710 = _708 ? 0 : 1;
    bool _712 = !_694;
    int _714 = _712 ? 0 : 1;
    int _716 = abs(_710);
    int _718 = abs(_714);
    float _720 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _722 = _636 + _720;
    float _724 = float(_716);
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _728 = _654 + _726;
    int _730 = ~_706;
    int _732 = _730 + 1;
    int _734 = _732 + 1;
    float _736 = _722 * _722;
    int _738 = _734;
    if (!_588)
    {
        int _740 = ~_706;
        int _742 = _740 + 1;
        _738 = _742;
    }
    int _744 = _738;
    float _746 = _724 * _704;
    float _748 = float(_718);
    float _750 = fma(_664, _664, _736);
    float _752 = float(_744);
    float _754 = _746 * (-2.0);
    float _756 = _430 + (-0.5);
    float _758 = fma(_728, _728, _750);
    bool _760 = !_702;
    int _762 = _760 ? 0 : 1;
    float _764 = fma(_754, _680, _680);
    float _766 = _748 * _752;
    float _768 = sqrt(_758);
    int _770 = abs(_762);
    float _772 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _764);
    float _774 = _446 + _428;
    float _776 = fma(_536, _754, _536);
    float _778 = _766 * (-2.0);
    float _780 = _774 + (-1.0);
    float _782 = float(_672);
    float _784 = rsqrt(_758);
    float _786 = float(_770);
    float _788 = fma(_776, _640, _772);
    float _790 = _446 + (-0.5);
    float _792 = fma(_514, _778, _514);
    float _794 = _786 * _782;
    float _796 = _768 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _798 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _800 = _428 + (-0.5);
    float _802 = _788 * 0.15915493667125701904296875;
    float _804 = fma(_778, _678, _678);
    float _806 = precise::min(_454, _796);
    float _808 = _794 * (-2.0);
    float _810 = _802 * 6.283185482025146484375;
    float _812 = sin(_810);
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[196].x, _804);
    float _816 = fma(_798, _808, _798);
    float _818 = _784 * _806;
    float _820 = fma(_808, _682, _682);
    float _822 = fma(_792, _640, _814);
    bool _824 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _826 = isnan(0.5);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _832 = _828 || _830;
    float _834 = _722 * _818;
    float _836 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[196].z, _820);
    float _838 = _664 * _818;
    float _840 = _802 * 6.283185482025146484375;
    float _842 = cos(_840);
    float _844 = -_834;
    float _846 = _722 + _844;
    float _848 = fma(_816, _640, _836);
    float _850 = -_838;
    float _852 = _664 + _850;
    float _854 = _728 * _818;
    float _856 = _846 * _846;
    float _858 = _822 * 0.15915493667125701904296875;
    bool _860 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _862 = isnan(0.5);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _868 = _864 || _866;
    float _870 = -_854;
    float _872 = _728 + _870;
    float _874 = fma(_852, _852, _856);
    float _876 = _848 * 0.15915493667125701904296875;
    float _878 = _858 * 6.283185482025146484375;
    float _880 = cos(_878);
    float _882 = fma(_872, _872, _874);
    float _884 = in.m_61.x;
    float _886 = in.m_61.y;
    float _888 = in.m_61.z;
    float _890 = sqrt(_882);
    float _892 = _858 * 6.283185482025146484375;
    float _894 = sin(_892);
    float _896 = _880 * _812;
    float _898 = _876 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = _784 * _890;
    float _904 = _880 * _842;
    float _906 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _886);
    float _908 = _444 * _902;
    float _910 = _436 * _902;
    float _912 = _466 * _902;
    float _914 = _876 * 6.283185482025146484375;
    float _916 = sin(_914);
    float _918 = _908 * _906;
    float _920 = _894 * _812;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _884);
    float _924 = _894 * _842;
    float _926 = _910 * _922;
    float _928 = _880 * _900;
    float _930 = _894 * _900;
    float _932 = _842 * _900;
    float _934 = _812 * _900;
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _888);
    float _938 = _928 * _918;
    float _940 = fma(_916, _904, _920);
    float _942 = -_896;
    float _944 = fma(_916, _924, _942);
    float _946 = -_924;
    float _948 = fma(_916, _896, _946);
    float _950 = _912 * _936;
    float _952 = -_918;
    float _954 = _916 * _952;
    float _956 = fma(_940, _926, _938);
    float _958 = _930 * _918;
    float _960 = fma(_916, _920, _904);
    float _962 = fma(_932, _926, _954);
    float _964 = fma(_948, _950, _956);
    float _966 = fma(_944, _926, _958);
    float _968 = fma(_934, _950, _962);
    float _970 = _964 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _972 = fma(_960, _950, _966);
    float _974 = _964 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _976 = -_834;
    float _978 = _636 + _976;
    float _980 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].x, _970);
    float _982 = -_838;
    float _984 = _632 + _982;
    float _986 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].x, _974);
    float _988 = _978 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _990 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _992 = -_854;
    float _994 = _654 + _992;
    float _996 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[24].z, _986);
    float _998 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[11].x, _988);
    float _1000 = _990 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1002 = _964 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1004 = _996 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1006 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[11].z, _998);
    float _1008 = _654 + _1000;
    float _1010 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1002);
    float _1012 = _632 + _1004;
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1018 = _1008 + _1016;
    float _1020 = _978 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1024 = _1012 + _1022;
    float _1026 = 1.0 / _1014;
    float _1028 = _1018 * _1018;
    float _1030 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1020);
    float _1032 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1034 = fma(_1024, _1024, _1028);
    float _1036 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1030);
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
    float _1070 = _1012;
    float _1072 = _834;
    float _1074 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1076 = _1026;
    float _1078 = _884;
    if (!_1056)
    {
        _1060 = _1012;
    }
    float _1080 = _1060;
    float _1082 = _1080;
    if (!_1056)
    {
        _1062 = _1008;
    }
    float _1084 = _1062;
    float _1086 = _1084;
    if (!_1056)
    {
        _1064 = _1044;
    }
    float _1088 = _1064;
    bool _1090 = !_1056;
    float _1092 = _1088;
    if (!_1090)
    {
        float _1094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1098 = _1040 + _1096;
        float _1100 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1102 = rsqrt(_1034);
        float _1104 = _1098 * _1094;
        float _1106 = _1104 * 0.15915493667125701904296875;
        float _1108 = _1106 * 6.283185482025146484375;
        float _1110 = cos(_1108);
        float _1112 = _1106 * 6.283185482025146484375;
        float _1114 = sin(_1112);
        float _1116 = _1110 + (-1.0);
        float _1118 = _1116 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = fma(_1114, _1100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1122 = fma(_1044, _1110, _1118);
        float _1124 = _1102 * _1120;
        float _1126 = fma(_1024, _1124, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1128 = fma(_1018, _1124, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1082 = _1126;
        _1086 = _1128;
        _1092 = _1122;
        _1066 = _1102;
        _1068 = _1100;
    }
    float _1130 = _1082;
    float _1132 = _1086;
    float _1134 = _1092;
    float _1136 = _1066;
    float _1138 = _1068;
    float _1140 = -_838;
    float _1142 = _1140 + _1130;
    float _1144 = -_854;
    float _1146 = _1144 + _1132;
    float _1148 = -_834;
    float _1150 = _1148 + _1134;
    float _1152 = _1142;
    float _1154 = _1150;
    float _1156 = _1136;
    float _1158 = _1134;
    float _1160 = _1138;
    if (_868)
    {
        _1070 = 1.0;
    }
    float _1162 = _1070;
    float _1164 = _1162;
    if (_832)
    {
        _1072 = _1142;
    }
    float _1166 = _1072;
    float _1168 = _1166;
    if (_832)
    {
        _1152 = _1146;
    }
    float _1170 = _1152;
    float _1172 = _1170;
    if (!_832)
    {
        float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1176 = _978 + _1174;
        float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1180 = _984 + _1178;
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1184 = -_632;
        float _1186 = _1184 + _1130;
        float _1188 = _1176 * _1176;
        float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1192 = _994 + _1190;
        float _1194 = fma(_1180, _1180, _1188);
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1198 = fma(_1192, _1192, _1194);
        float _1200 = sqrt(_1198);
        float _1202 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1204 = -_636;
        float _1206 = _1204 + _1134;
        float _1208 = -_654;
        float _1210 = _1208 + _1132;
        float _1212 = precise::min(_1200, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1214 = _1212 * _1196;
        float _1216 = _1202 * _1214;
        float _1218 = fma(_1186, _1216, _984);
        float _1220 = fma(_1206, _1216, _978);
        float _1222 = fma(_1210, _1216, _994);
        _1154 = _1220;
        _1168 = _1218;
        _1172 = _1222;
    }
    float _1224 = _1154;
    float _1226 = _1168;
    float _1228 = _1172;
    if (_868)
    {
        _1074 = 1.0;
    }
    float _1230 = _1074;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1234 = _1058 * _1232;
    float _1236 = _1230;
    if (!_868)
    {
        float _1238 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1240 = _1238 * 0.15915493667125701904296875;
        float _1242 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1244 = _1240 * 6.283185482025146484375;
        float _1246 = cos(_1244);
        float _1248 = _1242 * 0.15915493667125701904296875;
        float _1250 = _1240 * 6.283185482025146484375;
        float _1252 = sin(_1250);
        float _1254 = 1.0 / _1246;
        float _1256 = _1248 * 6.283185482025146484375;
        float _1258 = cos(_1256);
        float _1260 = _1252 * _1254;
        float _1262 = _1248 * 6.283185482025146484375;
        float _1264 = sin(_1262);
        float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1268 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1266;
        float _1270 = _1258 * _1260;
        float _1272 = 1.0 / _1268;
        float _1274 = 1.0 / _1270;
        float _1276 = _1264 * _1274;
        float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1280 = fma(_1234, _1276, _1278);
        float _1282 = _1280 * _1272;
        float _1284 = precise::clamp(_1282, 0.0, 1.0);
        _1156 = _1240;
        _1164 = _1284;
    }
    float _1286 = _1156;
    float _1288 = _1164;
    if (!_868)
    {
        float _1290 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1292 = _1290 * 0.15915493667125701904296875;
        float _1294 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1296 = _1292 * 6.283185482025146484375;
        float _1298 = cos(_1296);
        float _1300 = _1294 * 0.15915493667125701904296875;
        float _1302 = _1292 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        float _1306 = 1.0 / _1298;
        float _1308 = _1300 * 6.283185482025146484375;
        float _1310 = cos(_1308);
        float _1312 = _1304 * _1306;
        float _1314 = _1300 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        float _1318 = _1310 * _1312;
        float _1320 = 1.0 / _1318;
        float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1324 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1322;
        float _1326 = 1.0 / _1324;
        float _1328 = _1316 * _1320;
        float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1332 = fma(_1234, _1328, _1330);
        float _1334 = _1332 * _1326;
        float _1336 = precise::clamp(_1334, 0.0, 1.0);
        float _1338 = -_1336;
        float _1340 = _1338 + 1.0;
        _1236 = _1340;
    }
    float _1342 = _1236;
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1346 = _1224 + _1344;
    float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1350 = _1226 + _1348;
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1354 = _1228 + _1352;
    float _1356 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1358 = _1346 * _1346;
    float _1360 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1362 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1356);
    float _1364 = fma(_1350, _1350, _1358);
    float _1366 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1360);
    float _1368 = fma(_1354, _1354, _1364);
    float _1370 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1366);
    float _1372 = rsqrt(_1368);
    float _1374 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1376 = sqrt(_1368);
    float _1378 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1380 = _1350 * _1378;
    float _1382 = _1354 * _1378;
    float _1384 = _1380 * _1380;
    float _1386 = _1382 * _1382;
    float _1388 = _1384 + _1386;
    float _1390 = sqrt(_1388);
    bool _1392 = _1390 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1396 = _1390 + _1394;
    float _1398 = _1358;
    float _1400 = _1388;
    float _1402 = _1396;
    float _1404 = _1380;
    float _1406 = _1382;
    float _1408 = _1384;
    if (_1392)
    {
        float _1410 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1398 = _1410;
    }
    float _1412 = _1398;
    if (_1392)
    {
        float _1414 = rsqrt(_1388);
        _1400 = _1414;
    }
    float _1416 = _1400;
    float _1418 = _1416;
    if (_1392)
    {
        float _1420 = _1396 * _1412;
        _1402 = _1420;
    }
    float _1422 = _1402;
    if (_1392)
    {
        float _1424 = _1422 * 0.15915493667125701904296875;
        _1076 = _1424;
    }
    float _1426 = _1076;
    float _1428 = _1412;
    if (_1392)
    {
        float _1430 = _1426 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        _1428 = _1432;
    }
    float _1434 = _1428;
    float _1436 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1438 = precise::max(0.0, _1436);
    float _1440 = _1286;
    if (_1392)
    {
        float _1442 = _1426 * 6.283185482025146484375;
        float _1444 = cos(_1442);
        _1440 = _1444;
    }
    float _1446 = _1440;
    float _1448 = -_1378;
    float _1450 = -_1438;
    float _1452 = fma(_1346, _1448, _1450);
    if (_1392)
    {
        float _1454 = _1452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1158 = _1454;
    }
    float _1456 = _1158;
    float _1458 = fma(_984, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1460 = _1434;
    float _1462 = _1456;
    if (_1392)
    {
        float _1464 = fma(_1434, _1456, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1160 = _1464;
    }
    float _1466 = _1160;
    float _1468 = _1466;
    if (!_1392)
    {
        _1460 = _1452;
    }
    float _1470 = _1460;
    float _1472 = floor(_1458);
    float _1474 = _1470;
    float _1476 = _1446;
    if (_1392)
    {
        float _1478 = _1446 + (-1.0);
        _1462 = _1478;
    }
    float _1480 = _1462;
    if (_1392)
    {
        float _1482 = _1416 * _1466;
        _1468 = _1482;
    }
    float _1484 = _1468;
    if (_1392)
    {
        float _1486 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1418 = _1486;
    }
    float _1488 = _1418;
    if (_1392)
    {
        float _1490 = _1380 * _1484;
        _1404 = _1490;
    }
    float _1492 = _1404;
    if (_1392)
    {
        float _1494 = _1382 * _1484;
        _1406 = _1494;
    }
    float _1496 = _1406;
    if (_1392)
    {
        float _1498 = fma(_1452, _1446, _1488);
        _1474 = _1498;
    }
    float _1500 = _1474;
    if (_1392)
    {
        float _1502 = _1492 * _1492;
        _1408 = _1502;
    }
    float _1504 = _1408;
    if (!_1392)
    {
        _1476 = _1386;
    }
    float _1506 = _1476;
    float _1508 = _1506;
    if (_1392)
    {
        float _1510 = _1496 * _1496;
        _1508 = _1510;
    }
    float _1512 = _1508;
    float _1514 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1516 = fma(_1500, _1500, _1504);
    float _1518 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1514);
    float _1520 = _1516 + _1512;
    float _1522 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1524 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1526 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1518);
    float _1528 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1362);
    float _1530 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1532 = fma(_1376, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1530);
    float _1534 = precise::clamp(_1532, 0.0, 1.0);
    float _1536 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1524);
    float _1538 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1540 = rsqrt(_1520);
    float _1542 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1544 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1536);
    float _1546 = -_1534;
    float _1548 = _1546 + 1.0;
    float _1550 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1552 = _1544 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1554 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1556 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1558 = -_1550;
    float _1560 = fma(_1558, _1522, 1.0);
    float _1562 = abs(_1548);
    float _1564 = log2(_1562);
    float _1566 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1554);
    float _1568 = fma(_994, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1570 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1566);
    float _1572 = _1540 * _1492;
    float _1574 = _1540 * _1500;
    float _1576 = floor(_1568);
    float _1578 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1570);
    float _1580 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1582 = _1540 * _1496;
    float _1584 = -_1472;
    float _1586 = _1458 + _1584;
    float _1588 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1590 = -_1580;
    float _1592 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1590);
    float _1594 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1596 = log2(_1560);
    float _1598 = -_1582;
    float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1592);
    float _1602 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1588);
    float _1604 = fma(_1600, -0.5, 0.5);
    float _1606 = fma(_1600, 0.5, 0.5);
    float _1608 = -_1576;
    float _1610 = _1568 + _1608;
    float _1612 = 1.0 / _1578;
    float _1614 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1556);
    float _1616 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1602);
    float _1618 = fma(_1606, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1620 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1614);
    float _1622 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1616);
    float _1624 = fma(_1606, _1618, -0.212114393711090087890625);
    float _1626 = exp2(_1594);
    float _1628 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1620);
    float _1630 = _1596 * 0.693147182464599609375;
    float _1632 = fma(_1606, _1624, 1.570728778839111328125);
    float _1634 = _1630 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1636 = sqrt(_1604);
    float _1638 = _1574 + 1.0;
    float _1640 = _1622 * _1612;
    float _1642 = _1628 * _1612;
    float _1644 = -_1574;
    float _1646 = fma(_1626, _1638, _1644);
    float2 _5517 = float2(_1586, _1610);
    float _1648 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5517, float2(0.0), isnan(_5517)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5517, float2(0.0), isnan(_5517)), level(0.0)).x;
    float _1650 = fma(_1646, 0.5, 0.5);
    float _1652 = _1636 * 0.636619746685028076171875;
    float _1654 = fma(_1640, 0.5, 0.5);
    float _1656 = fma(_1642, -0.5, 0.5);
    float _1658 = -_1632;
    float _1660 = fma(_1652, _1658, 1.0);
    float3 _5542 = float3(_1654, _1656, _1634);
    float _1662 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5542, float3(0.0), isnan(_5542)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5542, float3(0.0), isnan(_5542)), level(0.0)).x;
    float3 _5553 = float3(_1654, _1656, _1634);
    float4 _1665 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5553, float3(0.0), isnan(_5553)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5553, float3(0.0), isnan(_5553)), level(0.0)).xyzw;
    float _1667 = _1665.x;
    float _1669 = _1665.y;
    float _1671 = _1665.z;
    float _1673 = _1665.w;
    float2 _5569 = float2(_1660, _1650);
    float3 _1677 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5569, float2(0.0), isnan(_5569)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5569, float2(0.0), isnan(_5569)), level(0.0)).xyz;
    float _1679 = _1677.x;
    float _1681 = _1677.y;
    float _1683 = _1677.z;
    float _1685 = float(uint(_474));
    float _1687 = trunc(_612);
    int _1689 = int(_1687);
    bool _1691 = _474 == 0;
    out.m_63.x = _984;
    out.m_63.y = _978;
    out.m_63.z = _994;
    int _1693 = abs(_676);
    float _1695 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1697 = abs(_690);
    out.m_65.w = _806;
    bool _1699 = _430 > 0.5;
    float _1701 = 1.0 / _1685;
    int _1703 = ~_474;
    int _1705 = _1703 + 1;
    out.m_67.x = _910;
    int _1707 = ~_474;
    int _1709 = _1707 + 1;
    float _1711 = _940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1715 = _1713 != 0;
    float _1717 = exp2(_1695);
    float _1719 = float(uint(_1689));
    float _1721 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1711);
    out.m_69.x = _1226;
    out.m_69.y = _1224;
    out.m_69.z = _1228;
    float _1723 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1721);
    bool _1725 = !_1715;
    float _1727 = _1725 ? 7.345489978790283203125 : 1.0;
    int _1729 = as_type<int>(_1701) + (-2);
    float _1731 = _1727 * _428;
    float _1733 = as_type<float>(_1729) * _1719;
    float _1735 = floor(_1731);
    float _1737 = -_1717;
    float _1739 = _1737 + 1.0;
    float _1741 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1743 = trunc(_1733);
    float _1745 = precise::max(_1743, 0.0);
    uint _1748 = uint(_1745);
    float _1750 = -_1735;
    float _1752 = _1731 + _1750;
    float _1754 = _1752 * _544;
    int _1756 = _1705 * int(_1748);
    int _1758 = _1756 + _1689;
    float _1760 = trunc(_1754);
    int _1762 = int(_1760);
    float _1764 = float(uint(_1758));
    float _1766 = as_type<float>(_1729) * _1764;
    float _1768 = float(_110);
    float _1770 = float(_1689);
    float _1772 = trunc(_1766);
    float _1774 = precise::max(_1772, 0.0);
    uint _1776 = uint(_1774);
    bool _1778 = _1770 >= _544;
    bool _1780 = isnan(_1770);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan(_544);
    bool _1786 = _1782 || _1784;
    float _1788 = float(_1786);
    float _1790 = 1.0 / _1768;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1794 = _1792 != 0;
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1798 = _426 + _1796;
    int _1800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1802 = _1800 != 0;
    int _1804 = int(_1748) + int(_1776);
    float _1806 = trunc(_1788);
    int _1808 = int(_1806);
    int _1810 = _474 + (-1);
    int _1812 = _1709 * _1804;
    int _1814 = _1812 + _1689;
    float _1816 = _580 * _1790;
    bool _1818 = uint(_1814) >= uint(_474);
    float _1820 = trunc(_1816);
    int _1822 = int(_1820);
    bool _1824 = !_1818;
    int _1826 = _1824 ? 0 : (-1);
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1830 = _1828 != 0;
    int _1832 = ~_1804;
    int _1834 = _1832 + _1826;
    int _1836 = _1834 + 1;
    int _1838 = ~_1808;
    int _1840 = _1838 + 1;
    int _1842 = _1840 + 1;
    bool _1844 = !_1830;
    int _1846 = _1844 ? 0 : 1;
    int _1848 = _474 * _1836;
    int _1850 = _1848 + _1689;
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1854 = _1852 != 0;
    int _1856 = abs(_1846);
    bool _1858 = !_1691;
    int _1860 = _1858 ? _1850 : (-1);
    int _1862 = abs(_686);
    int _1864 = _1860 * _1842;
    int _1866 = _1808 * _1810;
    int _1868 = _1866 + _1864;
    bool _1870 = !_1854;
    int _1872 = _1870 ? 0 : 1;
    int _1874 = _1868 * _1693;
    int _1876 = _1762 * _1856;
    int _1878 = _1876 + _1689;
    int _1880 = abs(_1872);
    int _1882 = _1822 * _1862;
    int _1884 = _1882 + _1874;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1890 = ~_474;
    int _1892 = _1890 + 1;
    bool _1894 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1896 = isnan(_426);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    int _1906 = _1878 * _1697;
    int _1908 = _1906 + _1884;
    int _1910 = ~_474;
    int _1912 = _1910 + 1;
    float _1914 = 1.0 / _1888;
    int _1916 = _1762 * _1880;
    int _1918 = _1916 + _1908;
    float _1920 = -_1904;
    float _1922 = _1920 + 1.0;
    float _1924 = float(uint(_1918));
    float _1926 = as_type<float>(_1729) * _1924;
    float _1928 = trunc(_1926);
    float _1930 = precise::max(_1928, 0.0);
    uint _1932 = uint(_1930);
    int _1934 = _1912 * int(_1932);
    int _1936 = _1934 + _1918;
    float _1938 = float(uint(_1936));
    float _1940 = as_type<float>(_1729) * _1938;
    float _1942 = trunc(_1940);
    float _1944 = precise::max(_1942, 0.0);
    uint _1946 = uint(_1944);
    int _1948 = int(_1932) + int(_1946);
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1950;
    float _1954 = float(uint(_1878));
    float _1956 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1958 = _1956 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1960 = _1892 * _1948;
    int _1962 = _1960 + _1918;
    float _1964 = as_type<float>(_1729) * _1954;
    float _1966 = _1958 * _1914;
    bool _1968 = uint(_1962) >= uint(_474);
    float _1970 = trunc(_1964);
    float _1972 = precise::max(_1970, 0.0);
    uint _1974 = uint(_1972);
    bool _1976 = !_1968;
    int _1978 = _1976 ? 0 : (-1);
    int _1980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1982 = _1980 != 0;
    int _1984 = ~_1948;
    int _1986 = _1984 + _1978;
    int _1988 = _1986 + 1;
    bool _1990 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1992 = isnan(_426);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    int _2002 = _474 * _1988;
    int _2004 = _2002 + _1918;
    float _2006 = _2000 * _1922;
    bool _2008 = !_1691;
    int _2010 = _2008 ? _2004 : (-1);
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    int _2012 = _2010 >> 31;
    int _2014 = _2010 & 3;
    bool _2016 = _2014 != 0;
    float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2020 = _2018 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2022 = _2012 & 3;
    int _2024 = ~_474;
    int _2026 = _2024 + 1;
    float _2028 = 1.0 / _2020;
    int _2030 = _2010 + _2022;
    float _2032 = in.m_73.y;
    int _2034 = _2026 * int(_1974);
    int _2036 = _2034 + _1878;
    int _2038 = _2030 >> 2;
    bool _2040 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2042 = isnan(_426);
    bool _2044 = _2040 || _2042;
    bool _2046 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2048 = _2044 || _2046;
    float _2050 = float(_2048);
    int _2052 = _2038 << 4;
    int _2054 = _2052 + 368;
    float _2056 = float(uint(_2036));
    uint _2058 = uint(int(uint(_2054) >> uint(2)));
    uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
    int _2062 = int(_2058) & 3;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[int(_2060)][_2062];
    int _2066 = int(_2058) + 1;
    uint _2068 = uint(int(uint(_2066) >> uint(2)));
    int _2070 = _2066 & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    int _2074 = _2010 & 3;
    bool _2076 = _2074 != 0;
    float _2078 = as_type<float>(_1729) * _2056;
    float _2080 = _1952 * _2028;
    float _2082 = -_2050;
    float _2084 = _2082 + 1.0;
    int _2086 = _2016 ? 0 : 1;
    int _2088 = _2054 + 8;
    uint _2090 = uint(int(uint(_2088) >> uint(2)));
    uint _2092 = uint(int(uint(int(_2090)) >> uint(2)));
    int _2094 = int(_2090) & 3;
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[int(_2092)][_2094];
    int _2098 = int(_2090) + 1;
    uint _2100 = uint(int(uint(_2098) >> uint(2)));
    int _2102 = _2098 & 3;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[int(_2100)][_2102];
    bool _2106 = uint(_2074) > 1u;
    float _2108 = _1904 * _2084;
    float _2110 = trunc(_2078);
    float _2112 = precise::max(_2110, 0.0);
    uint _2114 = uint(_2112);
    float _2116 = fma(_2080, _1798, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2118 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2120 = _426 + _2118;
    float _2122 = -_2032;
    float _2124 = _2122 + 1.0;
    int _2126 = ~_2086;
    int _2128 = _2126 + 1;
    int _2130 = _2128 + 1;
    float _2132 = _2116 * _2006;
    float _2134 = fma(_1966, _2120, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2136 = _2032;
    int _2138 = _2130;
    float _2140 = _1578;
    float _2142 = _1628;
    if (_1794)
    {
        float _2144 = _1699 ? _2124 : _2032;
        _2136 = _2144;
    }
    float _2146 = _2136;
    bool _2148 = _2074 != 3;
    float _2150 = -_1648;
    float _2152 = _2150 + 1.0;
    if (!_2106)
    {
        int _2154 = ~_2086;
        int _2156 = _2154 + 1;
        _2138 = _2156;
    }
    int _2158 = _2138;
    float _2160 = -_2000;
    float _2162 = _2160 + 1.0;
    bool _2164 = uint(_2074) >= 2u;
    bool _2166 = !_2076;
    int _2168 = _2166 ? 0 : 1;
    float _2170 = fma(_2162, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2132);
    int _2172 = abs(_2158);
    int _2174 = _2164 ? 0 : 1;
    float _2176 = fma(_2134, _2108, _2170);
    int _2178 = int(_1974) + int(_2114);
    int _2180 = ~_474;
    int _2182 = _2180 + 1;
    float _2184 = _1741 * _1662;
    int _2186 = abs(_2168);
    int _2188 = ~_2174;
    int _2190 = _2188 + 1;
    int _2192 = _2190 + 1;
    int _2194 = _2182 * _2178;
    int _2196 = _2194 + _1878;
    int _2198 = ~_2172;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    int _2204 = _2192;
    if (_2148)
    {
        int _2206 = ~_2174;
        int _2208 = _2206 + 1;
        _2204 = _2208;
    }
    int _2210 = _2204;
    float _2212 = _928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2214 = ~_2186;
    int _2216 = _2214 + 1;
    int _2218 = _2216 + 1;
    int _2220 = abs(_2210);
    int _2222 = _2202 * as_type<int>(_2072);
    bool _2224 = uint(_2196) >= uint(_474);
    float _2226 = as_type<float>(_2186);
    if (_1802)
    {
        float _2228 = in.m_53.x;
        _2226 = _2228;
    }
    float _2230 = _2226;
    bool _2232 = _2074 != 3;
    int _2234 = _2218 * as_type<int>(_2064);
    int _2236 = _2234 + _2222;
    float _2238 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2240 = int(_2238);
    bool _2242 = !_2232;
    int _2244 = _2242 ? 0 : (-1);
    bool _2246 = !_2224;
    int _2248 = _2246 ? 0 : (-1);
    int _2250 = ~_2220;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    bool _2256 = !_1982;
    int _2258 = _2256 ? 0 : 1;
    int _2260 = abs(_2244);
    int _2262 = _2254 * as_type<int>(_2096);
    int _2264 = _2262 + _2236;
    int _2266 = ~_2178;
    int _2268 = _2266 + _2248;
    int _2270 = _2268 + 1;
    int _2272 = abs(_2258);
    float _2274 = in.m_73.x;
    int _2276 = ~_2260;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = _474 * _2270;
    int _2284 = _2282 + _1878;
    int _2286 = ~_2272;
    int _2288 = _2286 + 1;
    int _2290 = _2288 + 1;
    float _2292 = in.m_75.x;
    float _2294 = in.m_75.y;
    float _2296 = in.m_75.z;
    bool _2298 = _886 != 0.0;
    bool _2300 = isnan(_886);
    bool _2302 = _2298 || _2300;
    bool _2304 = isnan(0.0);
    bool _2306 = _2302 || _2304;
    int _2308 = _2280 * as_type<int>(_2104);
    int _2310 = _2308 + _2264;
    int _2312 = abs(_2240);
    bool _2314 = _884 == 0.0;
    bool _2316 = !_2306;
    bool _2318 = _2314 && _2316;
    int _2320 = _2310 * _2290;
    float _2322 = float(uint(_2240));
    float _2324 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2176);
    bool _2326 = !_1691;
    int _2328 = _2326 ? _2284 : (-1);
    bool _2330 = _888 == 0.0;
    bool _2332 = _2330 && _2318;
    float _2334 = 1.0 / _2322;
    float _2336 = float(uint(_2312));
    int _2338 = _2328 * _2272;
    int _2340 = _2338 + _2320;
    float _2342 = _2324 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2344 = 1.0 / _2336;
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2350 = _2230 > 0.5;
    bool _2352 = _2350 && _1802;
    float _2354 = _2292;
    float _2356 = _2230;
    float _2358 = _2296;
    float _2360 = _2294;
    if (!_2332)
    {
        float _2362 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2292);
        _2354 = _2362;
    }
    float _2364 = _2354;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1802)
    {
        _2356 = _2274;
    }
    float _2368 = _2356;
    float _2370 = _2368;
    if (!_2332)
    {
        float _2372 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2296);
        _2358 = _2372;
    }
    float _2374 = _2358;
    if (!_1802)
    {
        _1078 = _2274;
    }
    float _2376 = _1078;
    float _2378 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2380 = abs(_2340);
    float _2382 = _2348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2384 = as_type<int>(_2334) + (-2);
    float _2386 = _2366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2388 = float(uint(_2340));
    float _2390 = _2376;
    if (!_2332)
    {
        float _2392 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2294);
        _2360 = _2392;
    }
    float _2394 = _2360;
    if (_2352)
    {
        float _2396 = -_2368;
        float _2398 = _2396 + 1.0;
        _2370 = _2398;
    }
    float _2400 = _2370;
    int _2402 = as_type<int>(_2344) + (-2);
    float _2404 = as_type<float>(_2384) * _2388;
    float _2406 = float(uint(_2380));
    out.m_77.x = _2378;
    out.m_77.y = _2382;
    out.m_77.z = _2386;
    out.m_77.w = _2342;
    if (_1802)
    {
        _2390 = _2400;
    }
    float _2408 = _2390;
    float _2410 = _928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2412 = ~_2240;
    int _2414 = _2412 + 1;
    float _2416 = trunc(_2404);
    float _2418 = precise::max(_2416, 0.0);
    uint _2420 = uint(_2418);
    float _2422 = as_type<float>(_2402) * _2406;
    int _2424 = ~_2312;
    int _2426 = _2424 + 1;
    float _2428 = -_916;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2410);
    float _2432 = _928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2434 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2430);
    float _2436 = trunc(_2422);
    float _2438 = precise::max(_2436, 0.0);
    uint _2440 = uint(_2438);
    float _2442 = _940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2444 = -_916;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2212);
    float _2448 = -_916;
    float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2432);
    float _2452 = _948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2454 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2442);
    float _2456 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2446);
    int _2458 = _2414 * int(_2420);
    int _2460 = _2458 + _2340;
    float _2462 = abs(_1234);
    float _2464 = log2(_2462);
    float _2466 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2450);
    float _2468 = _2434 * _2394;
    float _2470 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2452);
    float _2472 = float(uint(_2460));
    float _2474 = _2456 * _2394;
    int _2476 = ~_2312;
    int _2478 = _2476 + 1;
    int _2480 = _2426 * int(_2440);
    int _2482 = _2480 + _2380;
    float _2484 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2454);
    float _2486 = as_type<float>(_2384) * _2472;
    float _2488 = _940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2490 = _948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2492 = float(uint(_2482));
    float _2494 = _948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2496 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2488);
    float _2498 = trunc(_2486);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    float _2504 = _2464 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2506 = as_type<float>(_2402) * _2492;
    float _2508 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2490);
    float _2510 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2494);
    int _2512 = ~_2240;
    int _2514 = _2512 + 1;
    float _2516 = _2466 * _2394;
    float _2518 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2496);
    float _2520 = trunc(_2506);
    float _2522 = precise::max(_2520, 0.0);
    uint _2524 = uint(_2522);
    float _2526 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2508);
    float _2528 = fma(_1723, _2364, _2516);
    int _2530 = _2340 ^ _2240;
    float _2532 = fma(_2518, _2364, _2474);
    float _2534 = fma(_2484, _2364, _2468);
    float _2536 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2470);
    uint _2538 = uint(int(uint(_2530) >> uint(31)));
    float _2540 = exp2(_2504);
    int _2542 = int(_2420) + int(_2502);
    float _2544 = fma(_2526, _2374, _2534);
    float _2546 = fma(_2536, _2374, _2532);
    bool _2548 = _1234 <= 8000.0;
    bool _2550 = isnan(_1234);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan(8000.0);
    bool _2556 = _2552 || _2554;
    float _2558 = float(_2556);
    float _2560 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2510);
    int _2562 = int(_2440) + int(_2524);
    int _2564 = _2514 * _2542;
    int _2566 = _2564 + _2340;
    float _2568 = _1683 * _2184;
    float _2570 = fma(_2560, _2374, _2528);
    int _2572 = _2478 * _2562;
    int _2574 = _2572 + _2380;
    bool _2576 = uint(_2566) >= uint(_2240);
    out.m_79.x = _2544;
    out.m_79.y = _2546;
    out.m_79.z = _2570;
    bool _2578 = uint(_2574) >= uint(_2312);
    bool _2580 = !_2576;
    int _2582 = _2580 ? 0 : (-1);
    float _2584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2586 = !_2578;
    int _2588 = _2586 ? 0 : (-1);
    float _2590 = fma(_2540, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2592 = precise::clamp(_2590, 0.0, 1.0);
    int _2594 = ~_2588;
    int _2596 = _2562 + _2594;
    int _2598 = _2596 + 1;
    int _2600 = ~_2542;
    int _2602 = _2600 + _2582;
    int _2604 = _2602 + 1;
    float _2606 = fma(_2592, -2.0, 3.0);
    int _2608 = ~int(_2538);
    int _2610 = _2608 + 1;
    float _2612 = _2592 * _2592;
    bool _2614 = _2240 == 0;
    int _2616 = _2240 * _2604;
    int _2618 = _2616 + _2340;
    int _2620 = _2598 ^ _2610;
    float _2622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2624 = _2240 == 0;
    float _2626 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2628 = ~_2610;
    int _2630 = _2628 + _2620;
    int _2632 = _2630 + 1;
    float _2634 = _2612 * _2606;
    bool _2636 = !_2614;
    int _2638 = _2636 ? _2618 : (-1);
    float _2640 = _2584 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2642 = !_2624;
    int _2644 = _2642 ? _2632 : (-1);
    float _2646 = -_2634;
    float _2648 = _2646 + 1.0;
    float _2650 = float(_2638);
    float _2652 = fma(_2640, _2408, -0.5);
    float _2654 = float(_2644);
    float _2656 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2634);
    float _2658 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2626);
    float _2660 = fma(_2640, _2650, _592);
    float _2662 = _1578 * 0.5;
    float _2664 = in.m_81.x;
    float _2666 = _2622 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2668 = fma(_614, _2652, _2660);
    float _2670 = _2558 * _2656;
    float _2672 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2658);
    float _2674 = fma(_2666, _2146, -0.5);
    float _2676 = -_608;
    float _2678 = fma(_2666, _2654, _2676);
    float _2680 = fma(_1628, -0.5, _2662);
    float _2682 = _2668 + 0.5;
    float _2684 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2686 = fma(_622, _2674, _2678);
    float _2688 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2672);
    float _2690 = _2152 * _2684;
    float _2692 = precise::clamp(_2690, 0.0, 1.0);
    float _2694 = _2686 + 0.5;
    float _2696 = _2688 + _1578;
    float _2698 = _1622 + _1578;
    out.gl_Position.x = _1622;
    out.gl_Position.y = _1628;
    out.gl_Position.z = _2688;
    out.gl_Position.w = _1578;
    float _2700 = -_2692;
    float _2702 = fma(_2700, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2704 = _1376 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2706 = isnan(_1376);
    bool _2708 = _2704 || _2706;
    bool _2710 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2712 = _2708 || _2710;
    float _2714 = _2696 * 0.5;
    out.m_83.x = _2682;
    out.m_83.y = _2694;
    float _2716 = _2698 * 0.5;
    float _2718 = _2702 * _2664;
    float _2720 = fma(_1673, _2568, _1671);
    out.m_85.x = _2716;
    out.m_85.y = _2680;
    out.m_85.z = _2714;
    out.m_85.w = _1578;
    float _2722 = _1673 * _2184;
    float _2724 = -_1741;
    float _2726 = _2724 + 1.0;
    float _2728 = _2726;
    float _2730 = _2716;
    if (!_2712)
    {
        _2140 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2732 = _2140;
    float _2734 = fma(_1679, _2722, _1667);
    float _2736 = fma(_1681, _2722, _1669);
    float _2738 = _1673 * _2726;
    float _2740 = _2718 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2742 = _1288 * _1342;
    float _2744 = _2742;
    float _2746 = _2740;
    float _2748 = _2732;
    float _2750 = _2732;
    if (!_2712)
    {
        _2728 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2752 = _2728;
    out.m_87.x = _2734;
    out.m_87.y = _2736;
    out.m_87.z = _2720;
    out.m_87.w = _2738;
    float _2754 = _2742 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2756 = _2752;
    float _2758 = _2752;
    if (!_2712)
    {
        _2730 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2760 = _2730;
    out.m_89.x = _2740;
    float _2762 = _2760;
    float _2764 = _2760;
    if (!_2712)
    {
        _2142 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2766 = _2142;
    float _2768 = _2766;
    float _2770 = _2766;
    if (!_2712)
    {
        _2744 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2772 = _2744;
    float _2774 = _2772;
    float _2776 = _2772;
    if (!_2712)
    {
        _2746 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2778 = _2746;
    bool _2780 = !_2712;
    float _2782 = _2778;
    float _2784 = _2778;
    if (!_2780)
    {
        bool _2786 = _1376 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2788 = isnan(_1376);
        bool _2790 = _2786 || _2788;
        bool _2792 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2794 = _2790 || _2792;
        if (!_2794)
        {
            float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2798 = _1376 + _2796;
            float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2802 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2800;
            float _2804 = 1.0 / _2802;
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2826 = _2798 * _2804;
            float _2828 = precise::clamp(_2826, 0.0, 1.0);
            float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2834 = fma(_2828, _2808, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2836 = fma(_2828, _2832, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2838 = fma(_2828, _2812, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2840 = fma(_2828, _2816, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2842 = fma(_2828, _2820, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2844 = fma(_2828, _2824, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2750 = _2836;
            _2784 = _2842;
            _2764 = _2834;
            _2770 = _2840;
            _2758 = _2838;
            _2776 = _2844;
            _2846 = true;
        }
        else
        {
            bool _2848 = _1376 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2850 = isnan(_1376);
            bool _2852 = _2848 || _2850;
            bool _2854 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2856 = _2852 || _2854;
            if (!_2856)
            {
                _2762 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2858 = _2762;
            _2764 = _2858;
            if (!_2856)
            {
                _2748 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2860 = _2748;
            _2750 = _2860;
            if (!_2856)
            {
                _2756 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2862 = _2756;
            _2758 = _2862;
            if (!_2856)
            {
                _2768 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2864 = _2768;
            _2770 = _2864;
            if (!_2856)
            {
                _2782 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2866 = _2782;
            _2784 = _2866;
            if (!_2856)
            {
                _2774 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2868 = _2774;
            bool _2870 = !_2856;
            _2776 = _2868;
            if (!_2870)
            {
                bool _2872 = _1376 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2874 = isnan(_1376);
                bool _2876 = _2872 || _2874;
                bool _2878 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2880 = _2876 || _2878;
                if (!_2880)
                {
                    float _2882 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2884 = _1376 + _2882;
                    float _2886 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2888 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2886;
                    float _2890 = 1.0 / _2888;
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2898 = _2896 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2904 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2906 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2912 = _2884 * _2890;
                    float _2914 = precise::clamp(_2912, 0.0, 1.0);
                    float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2920 = fma(_2914, _2894, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2922 = fma(_2914, _2918, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2924 = fma(_2914, _2898, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2926 = fma(_2914, _2902, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2928 = fma(_2914, _2906, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2930 = fma(_2914, _2910, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2750 = _2922;
                    _2784 = _2928;
                    _2764 = _2920;
                    _2770 = _2926;
                    _2758 = _2924;
                    _2776 = _2930;
                    _2846 = true;
                }
                else
                {
                    _2750 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2784 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2764 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2770 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2758 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2776 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2846 = false;
    float _2932 = _2750;
    float _2934 = _2784;
    float _2936 = _2764;
    float _2938 = _2770;
    float _2940 = _2758;
    float _2942 = _2776;
    float _2944 = _2754 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2946 = fma(_2546, -0.5, 0.5);
    float _2948 = precise::clamp(_2946, 0.0, 1.0);
    float _2950 = -_2932;
    float _2952 = _2950 + _2934;
    float _2954 = -_2936;
    float _2956 = _2954 + _2938;
    out.m_49.x = _2944;
    float _2958 = fma(_2948, _2952, _2932);
    float _2960 = -_2940;
    float _2962 = _2960 + _2942;
    float _2964 = fma(_2948, _2956, _2936);
    float _2966 = _2958 * 0.586610972881317138671875;
    bool _2968 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2970 = fma(_2948, _2962, _2940);
    out.m_91.x = 0.0;
    float _2972 = fma(_2964, 0.298911988735198974609375, _2966);
    bool _2974 = _1288 > 0.0;
    bool _2976 = isnan(_1288);
    bool _2978 = _2974 || _2976;
    bool _2980 = isnan(0.0);
    bool _2982 = _2978 || _2980;
    float _2984 = fma(_2970, 0.114477999508380889892578125, _2972);
    bool _2986 = _1342 <= 0.0;
    bool _2988 = !_2982;
    bool _2990 = _2986 || _2988;
    float _2992 = -_2984;
    float _2994 = _2964 + _2992;
    float _2996 = -_2984;
    float _2998 = _2958 + _2996;
    float _3000 = -_2984;
    float _3002 = _2970 + _3000;
    float _3004 = fma(_2994, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2984);
    float _3006 = fma(_2998, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2984);
    float _3008 = fma(_3002, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2984);
    bool _3010 = !_2968;
    if (!_3010)
    {
        float _3012 = -_1224;
        float _3014 = _3012 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3016 = -_1226;
        float _3018 = _3016 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3020 = -_1228;
        float _3022 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3024 = _3014 * _3014;
        float _3026 = fma(_3018, _3018, _3024);
        float _3028 = fma(_3022, _3022, _3026);
        float _3030 = sqrt(_3028);
        float _3032 = rsqrt(_3028);
        float _3034 = -_3030;
        float _3036 = _3034 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3038 = _3036 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3040 = precise::clamp(_3038, 0.0, 1.0);
        float _3042 = _3018 * _3032;
        float _3044 = _3014 * _3032;
        float _3046 = abs(_3040);
        float _3048 = log2(_3046);
        float _3050 = _3022 * _3032;
        float _3052 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3054 = _2546 * _3044;
        float _3056 = -_3044;
        float _3058 = -_3052;
        float _3060 = fma(_3056, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3058);
        float _3062 = fma(_2544, _3042, _3054);
        float _3064 = -_3050;
        float _3066 = fma(_3064, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3060);
        float _3068 = fma(_2570, _3050, _3062);
        float _3070 = precise::clamp(_3068, 0.0, 1.0);
        float _3072 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3074 = _3066 + _3072;
        float _3076 = _3048 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3078 = _3074 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3080 = precise::clamp(_3078, 0.0, 1.0);
        float _3082 = exp2(_3076);
        float _3084 = _3082 * _3080;
        float _3086 = _3070 * _3084;
        float _3088 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3090 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3092 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3088;
        out.m_91.y = _3090;
        out.m_91.z = _3092;
    }
    out.m_65.x = _3004;
    out.m_65.y = _3006;
    out.m_65.z = _3008;
    if (!_2990)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3094 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3094;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2846 = false;
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
        float _3151 = as_type<float>(_126);
        out.gl_Position.z = _3151;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3221 = as_type<float>(_164);
        out.gl_Position.z = _3221;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _516 = floor(_482);
    bool _518 = _484 > 0.0;
    float _520 = _512 + (-1.0);
    bool _522 = _484 >= 0.0;
    bool _524 = isnan(_484);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[4].z, _504);
    float _534 = float(_450);
    float _536 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
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
    float _562 = 1.0 / _534;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _566 = _516 > 0.0;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _570 = _516 >= 0.0;
    bool _572 = isnan(_516);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.0);
    bool _578 = _574 || _576;
    float _580 = _544 * _144;
    float _582 = _464 ? _542 : 0.0;
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
    float _604 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[78].z, _564);
    int _606 = _530 ? 0 : 1;
    float _608 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _490);
    float _610 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[5].z, _510);
    float _612 = _562 * _144;
    float _614 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _604);
    int _616 = ~_606;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _584);
    int _624 = _620;
    if (!_518)
    {
        int _626 = ~_606;
        int _628 = _626 + 1;
        _624 = _628;
    }
    int _630 = _624;
    float _632 = _532 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _634 = _578 ? 0 : 1;
    float _636 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_556)
    {
        float _638 = _582 * _586;
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
    if (!_566)
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
    float _704 = float(_630);
    int _706 = _602 ? 0 : 1;
    bool _708 = !_698;
    int _710 = _708 ? 0 : 1;
    bool _712 = !_694;
    int _714 = _712 ? 0 : 1;
    int _716 = abs(_710);
    int _718 = abs(_714);
    float _720 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _722 = _636 + _720;
    float _724 = float(_716);
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _728 = _654 + _726;
    int _730 = ~_706;
    int _732 = _730 + 1;
    int _734 = _732 + 1;
    float _736 = _722 * _722;
    int _738 = _734;
    if (!_588)
    {
        int _740 = ~_706;
        int _742 = _740 + 1;
        _738 = _742;
    }
    int _744 = _738;
    float _746 = _724 * _704;
    float _748 = float(_718);
    float _750 = fma(_664, _664, _736);
    float _752 = float(_744);
    float _754 = _746 * (-2.0);
    float _756 = _430 + (-0.5);
    float _758 = fma(_728, _728, _750);
    bool _760 = !_702;
    int _762 = _760 ? 0 : 1;
    float _764 = fma(_754, _680, _680);
    float _766 = _748 * _752;
    float _768 = sqrt(_758);
    int _770 = abs(_762);
    float _772 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[196].y, _764);
    float _774 = _446 + _428;
    float _776 = fma(_536, _754, _536);
    float _778 = _766 * (-2.0);
    float _780 = _774 + (-1.0);
    float _782 = float(_672);
    float _784 = rsqrt(_758);
    float _786 = float(_770);
    float _788 = fma(_776, _640, _772);
    float _790 = _446 + (-0.5);
    float _792 = fma(_514, _778, _514);
    float _794 = _786 * _782;
    float _796 = _768 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _798 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _800 = _428 + (-0.5);
    float _802 = _788 * 0.15915493667125701904296875;
    float _804 = fma(_778, _678, _678);
    float _806 = precise::min(_454, _796);
    float _808 = _794 * (-2.0);
    float _810 = _802 * 6.283185482025146484375;
    float _812 = sin(_810);
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[196].x, _804);
    float _816 = fma(_798, _808, _798);
    float _818 = _784 * _806;
    float _820 = fma(_808, _682, _682);
    float _822 = fma(_792, _640, _814);
    bool _824 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _826 = isnan(0.5);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _832 = _828 || _830;
    float _834 = _722 * _818;
    float _836 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[196].z, _820);
    float _838 = _664 * _818;
    float _840 = _802 * 6.283185482025146484375;
    float _842 = cos(_840);
    float _844 = -_834;
    float _846 = _722 + _844;
    float _848 = fma(_816, _640, _836);
    float _850 = -_838;
    float _852 = _664 + _850;
    float _854 = _728 * _818;
    float _856 = _846 * _846;
    float _858 = _822 * 0.15915493667125701904296875;
    bool _860 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _862 = isnan(0.5);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _868 = _864 || _866;
    float _870 = -_854;
    float _872 = _728 + _870;
    float _874 = fma(_852, _852, _856);
    float _876 = _848 * 0.15915493667125701904296875;
    float _878 = _858 * 6.283185482025146484375;
    float _880 = cos(_878);
    float _882 = fma(_872, _872, _874);
    float _884 = in.m_61.x;
    float _886 = in.m_61.y;
    float _888 = in.m_61.z;
    float _890 = sqrt(_882);
    float _892 = _858 * 6.283185482025146484375;
    float _894 = sin(_892);
    float _896 = _880 * _812;
    float _898 = _876 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = _784 * _890;
    float _904 = _880 * _842;
    float _906 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _886);
    float _908 = _444 * _902;
    float _910 = _436 * _902;
    float _912 = _466 * _902;
    float _914 = _876 * 6.283185482025146484375;
    float _916 = sin(_914);
    float _918 = _908 * _906;
    float _920 = _894 * _812;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _884);
    float _924 = _894 * _842;
    float _926 = _910 * _922;
    float _928 = _880 * _900;
    float _930 = _894 * _900;
    float _932 = _842 * _900;
    float _934 = _812 * _900;
    float _936 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _888);
    float _938 = _928 * _918;
    float _940 = fma(_916, _904, _920);
    float _942 = -_896;
    float _944 = fma(_916, _924, _942);
    float _946 = -_924;
    float _948 = fma(_916, _896, _946);
    float _950 = _912 * _936;
    float _952 = -_918;
    float _954 = _916 * _952;
    float _956 = fma(_940, _926, _938);
    float _958 = _930 * _918;
    float _960 = fma(_916, _920, _904);
    float _962 = fma(_932, _926, _954);
    float _964 = fma(_948, _950, _956);
    float _966 = fma(_944, _926, _958);
    float _968 = fma(_934, _950, _962);
    float _970 = _964 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _972 = fma(_960, _950, _966);
    float _974 = _964 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _976 = -_834;
    float _978 = _636 + _976;
    float _980 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].x, _970);
    float _982 = -_838;
    float _984 = _632 + _982;
    float _986 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].x, _974);
    float _988 = _978 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _990 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[26].z, _980);
    float _992 = -_854;
    float _994 = _654 + _992;
    float _996 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[24].z, _986);
    float _998 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[11].x, _988);
    float _1000 = _990 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1002 = _964 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1004 = _996 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1006 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[11].z, _998);
    float _1008 = _654 + _1000;
    float _1010 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1002);
    float _1012 = _632 + _1004;
    float _1014 = _1006 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1016 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1018 = _1008 + _1016;
    float _1020 = _978 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1024 = _1012 + _1022;
    float _1026 = 1.0 / _1014;
    float _1028 = _1018 * _1018;
    float _1030 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1020);
    float _1032 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1034 = fma(_1024, _1024, _1028);
    float _1036 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1030);
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
    float _1070 = _1012;
    float _1072 = _834;
    float _1074 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1076 = _1026;
    float _1078 = _884;
    if (!_1056)
    {
        _1060 = _1012;
    }
    float _1080 = _1060;
    float _1082 = _1080;
    if (!_1056)
    {
        _1062 = _1008;
    }
    float _1084 = _1062;
    float _1086 = _1084;
    if (!_1056)
    {
        _1064 = _1044;
    }
    float _1088 = _1064;
    bool _1090 = !_1056;
    float _1092 = _1088;
    if (!_1090)
    {
        float _1094 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1098 = _1040 + _1096;
        float _1100 = _1044 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1102 = rsqrt(_1034);
        float _1104 = _1098 * _1094;
        float _1106 = _1104 * 0.15915493667125701904296875;
        float _1108 = _1106 * 6.283185482025146484375;
        float _1110 = cos(_1108);
        float _1112 = _1106 * 6.283185482025146484375;
        float _1114 = sin(_1112);
        float _1116 = _1110 + (-1.0);
        float _1118 = _1116 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = fma(_1114, _1100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1122 = fma(_1044, _1110, _1118);
        float _1124 = _1102 * _1120;
        float _1126 = fma(_1024, _1124, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1128 = fma(_1018, _1124, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1082 = _1126;
        _1086 = _1128;
        _1092 = _1122;
        _1066 = _1102;
        _1068 = _1100;
    }
    float _1130 = _1082;
    float _1132 = _1086;
    float _1134 = _1092;
    float _1136 = _1066;
    float _1138 = _1068;
    float _1140 = -_838;
    float _1142 = _1140 + _1130;
    float _1144 = -_854;
    float _1146 = _1144 + _1132;
    float _1148 = -_834;
    float _1150 = _1148 + _1134;
    float _1152 = _1142;
    float _1154 = _1150;
    float _1156 = _1136;
    float _1158 = _1134;
    float _1160 = _1138;
    if (_868)
    {
        _1070 = 1.0;
    }
    float _1162 = _1070;
    float _1164 = _1162;
    if (_832)
    {
        _1072 = _1142;
    }
    float _1166 = _1072;
    float _1168 = _1166;
    if (_832)
    {
        _1152 = _1146;
    }
    float _1170 = _1152;
    float _1172 = _1170;
    if (!_832)
    {
        float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1176 = _978 + _1174;
        float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1180 = _984 + _1178;
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1184 = -_632;
        float _1186 = _1184 + _1130;
        float _1188 = _1176 * _1176;
        float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1192 = _994 + _1190;
        float _1194 = fma(_1180, _1180, _1188);
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1198 = fma(_1192, _1192, _1194);
        float _1200 = sqrt(_1198);
        float _1202 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1204 = -_636;
        float _1206 = _1204 + _1134;
        float _1208 = -_654;
        float _1210 = _1208 + _1132;
        float _1212 = precise::min(_1200, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1214 = _1212 * _1196;
        float _1216 = _1202 * _1214;
        float _1218 = fma(_1186, _1216, _984);
        float _1220 = fma(_1206, _1216, _978);
        float _1222 = fma(_1210, _1216, _994);
        _1154 = _1220;
        _1168 = _1218;
        _1172 = _1222;
    }
    float _1224 = _1154;
    float _1226 = _1168;
    float _1228 = _1172;
    if (_868)
    {
        _1074 = 1.0;
    }
    float _1230 = _1074;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1234 = _1058 * _1232;
    float _1236 = _1230;
    if (!_868)
    {
        float _1238 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1240 = _1238 * 0.15915493667125701904296875;
        float _1242 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1244 = _1240 * 6.283185482025146484375;
        float _1246 = cos(_1244);
        float _1248 = _1242 * 0.15915493667125701904296875;
        float _1250 = _1240 * 6.283185482025146484375;
        float _1252 = sin(_1250);
        float _1254 = 1.0 / _1246;
        float _1256 = _1248 * 6.283185482025146484375;
        float _1258 = cos(_1256);
        float _1260 = _1252 * _1254;
        float _1262 = _1248 * 6.283185482025146484375;
        float _1264 = sin(_1262);
        float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1268 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1266;
        float _1270 = _1258 * _1260;
        float _1272 = 1.0 / _1268;
        float _1274 = 1.0 / _1270;
        float _1276 = _1264 * _1274;
        float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1280 = fma(_1234, _1276, _1278);
        float _1282 = _1280 * _1272;
        float _1284 = precise::clamp(_1282, 0.0, 1.0);
        _1156 = _1240;
        _1164 = _1284;
    }
    float _1286 = _1156;
    float _1288 = _1164;
    if (!_868)
    {
        float _1290 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1292 = _1290 * 0.15915493667125701904296875;
        float _1294 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1296 = _1292 * 6.283185482025146484375;
        float _1298 = cos(_1296);
        float _1300 = _1294 * 0.15915493667125701904296875;
        float _1302 = _1292 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        float _1306 = 1.0 / _1298;
        float _1308 = _1300 * 6.283185482025146484375;
        float _1310 = cos(_1308);
        float _1312 = _1304 * _1306;
        float _1314 = _1300 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        float _1318 = _1310 * _1312;
        float _1320 = 1.0 / _1318;
        float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1324 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1322;
        float _1326 = 1.0 / _1324;
        float _1328 = _1316 * _1320;
        float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1332 = fma(_1234, _1328, _1330);
        float _1334 = _1332 * _1326;
        float _1336 = precise::clamp(_1334, 0.0, 1.0);
        float _1338 = -_1336;
        float _1340 = _1338 + 1.0;
        _1236 = _1340;
    }
    float _1342 = _1236;
    float _1344 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1346 = _1224 + _1344;
    float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1350 = _1226 + _1348;
    float _1352 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1354 = _1228 + _1352;
    float _1356 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1358 = _1346 * _1346;
    float _1360 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1362 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1356);
    float _1364 = fma(_1350, _1350, _1358);
    float _1366 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1360);
    float _1368 = fma(_1354, _1354, _1364);
    float _1370 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1366);
    float _1372 = rsqrt(_1368);
    float _1374 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1376 = sqrt(_1368);
    float _1378 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1380 = _1350 * _1378;
    float _1382 = _1354 * _1378;
    float _1384 = _1380 * _1380;
    float _1386 = _1382 * _1382;
    float _1388 = _1384 + _1386;
    float _1390 = sqrt(_1388);
    bool _1392 = _1390 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1396 = _1390 + _1394;
    float _1398 = _1358;
    float _1400 = _1388;
    float _1402 = _1396;
    float _1404 = _1380;
    float _1406 = _1382;
    float _1408 = _1384;
    if (_1392)
    {
        float _1410 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1398 = _1410;
    }
    float _1412 = _1398;
    if (_1392)
    {
        float _1414 = rsqrt(_1388);
        _1400 = _1414;
    }
    float _1416 = _1400;
    float _1418 = _1416;
    if (_1392)
    {
        float _1420 = _1396 * _1412;
        _1402 = _1420;
    }
    float _1422 = _1402;
    if (_1392)
    {
        float _1424 = _1422 * 0.15915493667125701904296875;
        _1076 = _1424;
    }
    float _1426 = _1076;
    float _1428 = _1412;
    if (_1392)
    {
        float _1430 = _1426 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        _1428 = _1432;
    }
    float _1434 = _1428;
    float _1436 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1438 = precise::max(0.0, _1436);
    float _1440 = _1286;
    if (_1392)
    {
        float _1442 = _1426 * 6.283185482025146484375;
        float _1444 = cos(_1442);
        _1440 = _1444;
    }
    float _1446 = _1440;
    float _1448 = -_1378;
    float _1450 = -_1438;
    float _1452 = fma(_1346, _1448, _1450);
    if (_1392)
    {
        float _1454 = _1452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1158 = _1454;
    }
    float _1456 = _1158;
    float _1458 = fma(_984, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1460 = _1434;
    float _1462 = _1456;
    if (_1392)
    {
        float _1464 = fma(_1434, _1456, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1160 = _1464;
    }
    float _1466 = _1160;
    float _1468 = _1466;
    if (!_1392)
    {
        _1460 = _1452;
    }
    float _1470 = _1460;
    float _1472 = floor(_1458);
    float _1474 = _1470;
    float _1476 = _1446;
    if (_1392)
    {
        float _1478 = _1446 + (-1.0);
        _1462 = _1478;
    }
    float _1480 = _1462;
    if (_1392)
    {
        float _1482 = _1416 * _1466;
        _1468 = _1482;
    }
    float _1484 = _1468;
    if (_1392)
    {
        float _1486 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1418 = _1486;
    }
    float _1488 = _1418;
    if (_1392)
    {
        float _1490 = _1380 * _1484;
        _1404 = _1490;
    }
    float _1492 = _1404;
    if (_1392)
    {
        float _1494 = _1382 * _1484;
        _1406 = _1494;
    }
    float _1496 = _1406;
    if (_1392)
    {
        float _1498 = fma(_1452, _1446, _1488);
        _1474 = _1498;
    }
    float _1500 = _1474;
    if (_1392)
    {
        float _1502 = _1492 * _1492;
        _1408 = _1502;
    }
    float _1504 = _1408;
    if (!_1392)
    {
        _1476 = _1386;
    }
    float _1506 = _1476;
    float _1508 = _1506;
    if (_1392)
    {
        float _1510 = _1496 * _1496;
        _1508 = _1510;
    }
    float _1512 = _1508;
    float _1514 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1516 = fma(_1500, _1500, _1504);
    float _1518 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1514);
    float _1520 = _1516 + _1512;
    float _1522 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1524 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1526 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1518);
    float _1528 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1362);
    float _1530 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1532 = fma(_1376, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1530);
    float _1534 = precise::clamp(_1532, 0.0, 1.0);
    float _1536 = fma(_1226, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1524);
    float _1538 = _1526 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1540 = rsqrt(_1520);
    float _1542 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1544 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1536);
    float _1546 = -_1534;
    float _1548 = _1546 + 1.0;
    float _1550 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1552 = _1544 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1554 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1556 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1558 = -_1550;
    float _1560 = fma(_1558, _1522, 1.0);
    float _1562 = abs(_1548);
    float _1564 = log2(_1562);
    float _1566 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1554);
    float _1568 = fma(_994, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1570 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1566);
    float _1572 = _1540 * _1492;
    float _1574 = _1540 * _1500;
    float _1576 = floor(_1568);
    float _1578 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1570);
    float _1580 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1582 = _1540 * _1496;
    float _1584 = -_1472;
    float _1586 = _1458 + _1584;
    float _1588 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1590 = -_1580;
    float _1592 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1590);
    float _1594 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1596 = log2(_1560);
    float _1598 = -_1582;
    float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1592);
    float _1602 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1588);
    float _1604 = fma(_1600, -0.5, 0.5);
    float _1606 = fma(_1600, 0.5, 0.5);
    float _1608 = -_1576;
    float _1610 = _1568 + _1608;
    float _1612 = 1.0 / _1578;
    float _1614 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1556);
    float _1616 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1602);
    float _1618 = fma(_1606, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1620 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1614);
    float _1622 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1616);
    float _1624 = fma(_1606, _1618, -0.212114393711090087890625);
    float _1626 = exp2(_1594);
    float _1628 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1620);
    float _1630 = _1596 * 0.693147182464599609375;
    float _1632 = fma(_1606, _1624, 1.570728778839111328125);
    float _1634 = _1630 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1636 = sqrt(_1604);
    float _1638 = _1574 + 1.0;
    float _1640 = _1622 * _1612;
    float _1642 = _1628 * _1612;
    float _1644 = -_1574;
    float _1646 = fma(_1626, _1638, _1644);
    float2 _5517 = float2(_1586, _1610);
    float _1648 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5517, float2(0.0), isnan(_5517)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5517, float2(0.0), isnan(_5517)), level(0.0)).x;
    float _1650 = fma(_1646, 0.5, 0.5);
    float _1652 = _1636 * 0.636619746685028076171875;
    float _1654 = fma(_1640, 0.5, 0.5);
    float _1656 = fma(_1642, -0.5, 0.5);
    float _1658 = -_1632;
    float _1660 = fma(_1652, _1658, 1.0);
    float3 _5542 = float3(_1654, _1656, _1634);
    float _1662 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5542, float3(0.0), isnan(_5542)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5542, float3(0.0), isnan(_5542)), level(0.0)).x;
    float3 _5553 = float3(_1654, _1656, _1634);
    float4 _1665 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5553, float3(0.0), isnan(_5553)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5553, float3(0.0), isnan(_5553)), level(0.0)).xyzw;
    float _1667 = _1665.x;
    float _1669 = _1665.y;
    float _1671 = _1665.z;
    float _1673 = _1665.w;
    float2 _5569 = float2(_1660, _1650);
    float3 _1677 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5569, float2(0.0), isnan(_5569)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5569, float2(0.0), isnan(_5569)), level(0.0)).xyz;
    float _1679 = _1677.x;
    float _1681 = _1677.y;
    float _1683 = _1677.z;
    float _1685 = float(uint(_474));
    float _1687 = trunc(_612);
    int _1689 = int(_1687);
    bool _1691 = _474 == 0;
    out.m_63.x = _984;
    out.m_63.y = _978;
    out.m_63.z = _994;
    int _1693 = abs(_676);
    float _1695 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1697 = abs(_690);
    out.m_65.w = _806;
    bool _1699 = _430 > 0.5;
    float _1701 = 1.0 / _1685;
    int _1703 = ~_474;
    int _1705 = _1703 + 1;
    out.m_67.x = _910;
    int _1707 = ~_474;
    int _1709 = _1707 + 1;
    float _1711 = _940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1715 = _1713 != 0;
    float _1717 = exp2(_1695);
    float _1719 = float(uint(_1689));
    float _1721 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1711);
    out.m_69.x = _1226;
    out.m_69.y = _1224;
    out.m_69.z = _1228;
    float _1723 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1721);
    bool _1725 = !_1715;
    float _1727 = _1725 ? 7.345489978790283203125 : 1.0;
    int _1729 = as_type<int>(_1701) + (-2);
    float _1731 = _1727 * _428;
    float _1733 = as_type<float>(_1729) * _1719;
    float _1735 = floor(_1731);
    float _1737 = -_1717;
    float _1739 = _1737 + 1.0;
    float _1741 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1743 = trunc(_1733);
    float _1745 = precise::max(_1743, 0.0);
    uint _1748 = uint(_1745);
    float _1750 = -_1735;
    float _1752 = _1731 + _1750;
    float _1754 = _1752 * _544;
    int _1756 = _1705 * int(_1748);
    int _1758 = _1756 + _1689;
    float _1760 = trunc(_1754);
    int _1762 = int(_1760);
    float _1764 = float(uint(_1758));
    float _1766 = as_type<float>(_1729) * _1764;
    float _1768 = float(_110);
    float _1770 = float(_1689);
    float _1772 = trunc(_1766);
    float _1774 = precise::max(_1772, 0.0);
    uint _1776 = uint(_1774);
    bool _1778 = _1770 >= _544;
    bool _1780 = isnan(_1770);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan(_544);
    bool _1786 = _1782 || _1784;
    float _1788 = float(_1786);
    float _1790 = 1.0 / _1768;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1794 = _1792 != 0;
    float _1796 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1798 = _426 + _1796;
    int _1800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1802 = _1800 != 0;
    int _1804 = int(_1748) + int(_1776);
    float _1806 = trunc(_1788);
    int _1808 = int(_1806);
    int _1810 = _474 + (-1);
    int _1812 = _1709 * _1804;
    int _1814 = _1812 + _1689;
    float _1816 = _580 * _1790;
    bool _1818 = uint(_1814) >= uint(_474);
    float _1820 = trunc(_1816);
    int _1822 = int(_1820);
    bool _1824 = !_1818;
    int _1826 = _1824 ? 0 : (-1);
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1830 = _1828 != 0;
    int _1832 = ~_1804;
    int _1834 = _1832 + _1826;
    int _1836 = _1834 + 1;
    int _1838 = ~_1808;
    int _1840 = _1838 + 1;
    int _1842 = _1840 + 1;
    bool _1844 = !_1830;
    int _1846 = _1844 ? 0 : 1;
    int _1848 = _474 * _1836;
    int _1850 = _1848 + _1689;
    int _1852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1854 = _1852 != 0;
    int _1856 = abs(_1846);
    bool _1858 = !_1691;
    int _1860 = _1858 ? _1850 : (-1);
    int _1862 = abs(_686);
    int _1864 = _1860 * _1842;
    int _1866 = _1808 * _1810;
    int _1868 = _1866 + _1864;
    bool _1870 = !_1854;
    int _1872 = _1870 ? 0 : 1;
    int _1874 = _1868 * _1693;
    int _1876 = _1762 * _1856;
    int _1878 = _1876 + _1689;
    int _1880 = abs(_1872);
    int _1882 = _1822 * _1862;
    int _1884 = _1882 + _1874;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1890 = ~_474;
    int _1892 = _1890 + 1;
    bool _1894 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1896 = isnan(_426);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    int _1906 = _1878 * _1697;
    int _1908 = _1906 + _1884;
    int _1910 = ~_474;
    int _1912 = _1910 + 1;
    float _1914 = 1.0 / _1888;
    int _1916 = _1762 * _1880;
    int _1918 = _1916 + _1908;
    float _1920 = -_1904;
    float _1922 = _1920 + 1.0;
    float _1924 = float(uint(_1918));
    float _1926 = as_type<float>(_1729) * _1924;
    float _1928 = trunc(_1926);
    float _1930 = precise::max(_1928, 0.0);
    uint _1932 = uint(_1930);
    int _1934 = _1912 * int(_1932);
    int _1936 = _1934 + _1918;
    float _1938 = float(uint(_1936));
    float _1940 = as_type<float>(_1729) * _1938;
    float _1942 = trunc(_1940);
    float _1944 = precise::max(_1942, 0.0);
    uint _1946 = uint(_1944);
    int _1948 = int(_1932) + int(_1946);
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1950;
    float _1954 = float(uint(_1878));
    float _1956 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1958 = _1956 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1960 = _1892 * _1948;
    int _1962 = _1960 + _1918;
    float _1964 = as_type<float>(_1729) * _1954;
    float _1966 = _1958 * _1914;
    bool _1968 = uint(_1962) >= uint(_474);
    float _1970 = trunc(_1964);
    float _1972 = precise::max(_1970, 0.0);
    uint _1974 = uint(_1972);
    bool _1976 = !_1968;
    int _1978 = _1976 ? 0 : (-1);
    int _1980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1982 = _1980 != 0;
    int _1984 = ~_1948;
    int _1986 = _1984 + _1978;
    int _1988 = _1986 + 1;
    bool _1990 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1992 = isnan(_426);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    int _2002 = _474 * _1988;
    int _2004 = _2002 + _1918;
    float _2006 = _2000 * _1922;
    bool _2008 = !_1691;
    int _2010 = _2008 ? _2004 : (-1);
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    int _2012 = _2010 >> 31;
    int _2014 = _2010 & 3;
    bool _2016 = _2014 != 0;
    float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2020 = _2018 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2022 = _2012 & 3;
    int _2024 = ~_474;
    int _2026 = _2024 + 1;
    float _2028 = 1.0 / _2020;
    int _2030 = _2010 + _2022;
    float _2032 = in.m_73.y;
    int _2034 = _2026 * int(_1974);
    int _2036 = _2034 + _1878;
    int _2038 = _2030 >> 2;
    bool _2040 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2042 = isnan(_426);
    bool _2044 = _2040 || _2042;
    bool _2046 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2048 = _2044 || _2046;
    float _2050 = float(_2048);
    int _2052 = _2038 << 4;
    int _2054 = _2052 + 368;
    float _2056 = float(uint(_2036));
    uint _2058 = uint(int(uint(_2054) >> uint(2)));
    uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
    int _2062 = int(_2058) & 3;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[int(_2060)][_2062];
    int _2066 = int(_2058) + 1;
    uint _2068 = uint(int(uint(_2066) >> uint(2)));
    int _2070 = _2066 & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    int _2074 = _2010 & 3;
    bool _2076 = _2074 != 0;
    float _2078 = as_type<float>(_1729) * _2056;
    float _2080 = _1952 * _2028;
    float _2082 = -_2050;
    float _2084 = _2082 + 1.0;
    int _2086 = _2016 ? 0 : 1;
    int _2088 = _2054 + 8;
    uint _2090 = uint(int(uint(_2088) >> uint(2)));
    uint _2092 = uint(int(uint(int(_2090)) >> uint(2)));
    int _2094 = int(_2090) & 3;
    float _2096 = (*spvDescriptorSet0.vp_c9)._m0[int(_2092)][_2094];
    int _2098 = int(_2090) + 1;
    uint _2100 = uint(int(uint(_2098) >> uint(2)));
    int _2102 = _2098 & 3;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[int(_2100)][_2102];
    bool _2106 = uint(_2074) > 1u;
    float _2108 = _1904 * _2084;
    float _2110 = trunc(_2078);
    float _2112 = precise::max(_2110, 0.0);
    uint _2114 = uint(_2112);
    float _2116 = fma(_2080, _1798, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2118 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2120 = _426 + _2118;
    float _2122 = -_2032;
    float _2124 = _2122 + 1.0;
    int _2126 = ~_2086;
    int _2128 = _2126 + 1;
    int _2130 = _2128 + 1;
    float _2132 = _2116 * _2006;
    float _2134 = fma(_1966, _2120, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2136 = _2032;
    int _2138 = _2130;
    float _2140 = _1578;
    float _2142 = _1628;
    if (_1794)
    {
        float _2144 = _1699 ? _2124 : _2032;
        _2136 = _2144;
    }
    float _2146 = _2136;
    bool _2148 = _2074 != 3;
    float _2150 = -_1648;
    float _2152 = _2150 + 1.0;
    if (!_2106)
    {
        int _2154 = ~_2086;
        int _2156 = _2154 + 1;
        _2138 = _2156;
    }
    int _2158 = _2138;
    float _2160 = -_2000;
    float _2162 = _2160 + 1.0;
    bool _2164 = uint(_2074) >= 2u;
    bool _2166 = !_2076;
    int _2168 = _2166 ? 0 : 1;
    float _2170 = fma(_2162, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2132);
    int _2172 = abs(_2158);
    int _2174 = _2164 ? 0 : 1;
    float _2176 = fma(_2134, _2108, _2170);
    int _2178 = int(_1974) + int(_2114);
    int _2180 = ~_474;
    int _2182 = _2180 + 1;
    float _2184 = _1741 * _1662;
    int _2186 = abs(_2168);
    int _2188 = ~_2174;
    int _2190 = _2188 + 1;
    int _2192 = _2190 + 1;
    int _2194 = _2182 * _2178;
    int _2196 = _2194 + _1878;
    int _2198 = ~_2172;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    int _2204 = _2192;
    if (_2148)
    {
        int _2206 = ~_2174;
        int _2208 = _2206 + 1;
        _2204 = _2208;
    }
    int _2210 = _2204;
    float _2212 = _928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2214 = ~_2186;
    int _2216 = _2214 + 1;
    int _2218 = _2216 + 1;
    int _2220 = abs(_2210);
    int _2222 = _2202 * as_type<int>(_2072);
    bool _2224 = uint(_2196) >= uint(_474);
    float _2226 = as_type<float>(_2186);
    if (_1802)
    {
        float _2228 = in.m_53.x;
        _2226 = _2228;
    }
    float _2230 = _2226;
    bool _2232 = _2074 != 3;
    int _2234 = _2218 * as_type<int>(_2064);
    int _2236 = _2234 + _2222;
    float _2238 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2240 = int(_2238);
    bool _2242 = !_2232;
    int _2244 = _2242 ? 0 : (-1);
    bool _2246 = !_2224;
    int _2248 = _2246 ? 0 : (-1);
    int _2250 = ~_2220;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    bool _2256 = !_1982;
    int _2258 = _2256 ? 0 : 1;
    int _2260 = abs(_2244);
    int _2262 = _2254 * as_type<int>(_2096);
    int _2264 = _2262 + _2236;
    int _2266 = ~_2178;
    int _2268 = _2266 + _2248;
    int _2270 = _2268 + 1;
    int _2272 = abs(_2258);
    float _2274 = in.m_73.x;
    int _2276 = ~_2260;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = _474 * _2270;
    int _2284 = _2282 + _1878;
    int _2286 = ~_2272;
    int _2288 = _2286 + 1;
    int _2290 = _2288 + 1;
    float _2292 = in.m_75.x;
    float _2294 = in.m_75.y;
    float _2296 = in.m_75.z;
    bool _2298 = _886 != 0.0;
    bool _2300 = isnan(_886);
    bool _2302 = _2298 || _2300;
    bool _2304 = isnan(0.0);
    bool _2306 = _2302 || _2304;
    int _2308 = _2280 * as_type<int>(_2104);
    int _2310 = _2308 + _2264;
    int _2312 = abs(_2240);
    bool _2314 = _884 == 0.0;
    bool _2316 = !_2306;
    bool _2318 = _2314 && _2316;
    int _2320 = _2310 * _2290;
    float _2322 = float(uint(_2240));
    float _2324 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2176);
    bool _2326 = !_1691;
    int _2328 = _2326 ? _2284 : (-1);
    bool _2330 = _888 == 0.0;
    bool _2332 = _2330 && _2318;
    float _2334 = 1.0 / _2322;
    float _2336 = float(uint(_2312));
    int _2338 = _2328 * _2272;
    int _2340 = _2338 + _2320;
    float _2342 = _2324 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2344 = 1.0 / _2336;
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2350 = _2230 > 0.5;
    bool _2352 = _2350 && _1802;
    float _2354 = _2292;
    float _2356 = _2230;
    float _2358 = _2296;
    float _2360 = _2294;
    if (!_2332)
    {
        float _2362 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2292);
        _2354 = _2362;
    }
    float _2364 = _2354;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1802)
    {
        _2356 = _2274;
    }
    float _2368 = _2356;
    float _2370 = _2368;
    if (!_2332)
    {
        float _2372 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2296);
        _2358 = _2372;
    }
    float _2374 = _2358;
    if (!_1802)
    {
        _1078 = _2274;
    }
    float _2376 = _1078;
    float _2378 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2380 = abs(_2340);
    float _2382 = _2348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2384 = as_type<int>(_2334) + (-2);
    float _2386 = _2366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2388 = float(uint(_2340));
    float _2390 = _2376;
    if (!_2332)
    {
        float _2392 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2294);
        _2360 = _2392;
    }
    float _2394 = _2360;
    if (_2352)
    {
        float _2396 = -_2368;
        float _2398 = _2396 + 1.0;
        _2370 = _2398;
    }
    float _2400 = _2370;
    int _2402 = as_type<int>(_2344) + (-2);
    float _2404 = as_type<float>(_2384) * _2388;
    float _2406 = float(uint(_2380));
    out.m_77.x = _2378;
    out.m_77.y = _2382;
    out.m_77.z = _2386;
    out.m_77.w = _2342;
    if (_1802)
    {
        _2390 = _2400;
    }
    float _2408 = _2390;
    float _2410 = _928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2412 = ~_2240;
    int _2414 = _2412 + 1;
    float _2416 = trunc(_2404);
    float _2418 = precise::max(_2416, 0.0);
    uint _2420 = uint(_2418);
    float _2422 = as_type<float>(_2402) * _2406;
    int _2424 = ~_2312;
    int _2426 = _2424 + 1;
    float _2428 = -_916;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2410);
    float _2432 = _928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2434 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2430);
    float _2436 = trunc(_2422);
    float _2438 = precise::max(_2436, 0.0);
    uint _2440 = uint(_2438);
    float _2442 = _940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2444 = -_916;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2212);
    float _2448 = -_916;
    float _2450 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2432);
    float _2452 = _948 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2454 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2442);
    float _2456 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2446);
    int _2458 = _2414 * int(_2420);
    int _2460 = _2458 + _2340;
    float _2462 = abs(_1234);
    float _2464 = log2(_2462);
    float _2466 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2450);
    float _2468 = _2434 * _2394;
    float _2470 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2452);
    float _2472 = float(uint(_2460));
    float _2474 = _2456 * _2394;
    int _2476 = ~_2312;
    int _2478 = _2476 + 1;
    int _2480 = _2426 * int(_2440);
    int _2482 = _2480 + _2380;
    float _2484 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2454);
    float _2486 = as_type<float>(_2384) * _2472;
    float _2488 = _940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2490 = _948 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2492 = float(uint(_2482));
    float _2494 = _948 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2496 = fma(_932, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2488);
    float _2498 = trunc(_2486);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    float _2504 = _2464 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2506 = as_type<float>(_2402) * _2492;
    float _2508 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2490);
    float _2510 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2494);
    int _2512 = ~_2240;
    int _2514 = _2512 + 1;
    float _2516 = _2466 * _2394;
    float _2518 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2496);
    float _2520 = trunc(_2506);
    float _2522 = precise::max(_2520, 0.0);
    uint _2524 = uint(_2522);
    float _2526 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2508);
    float _2528 = fma(_1723, _2364, _2516);
    int _2530 = _2340 ^ _2240;
    float _2532 = fma(_2518, _2364, _2474);
    float _2534 = fma(_2484, _2364, _2468);
    float _2536 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2470);
    uint _2538 = uint(int(uint(_2530) >> uint(31)));
    float _2540 = exp2(_2504);
    int _2542 = int(_2420) + int(_2502);
    float _2544 = fma(_2526, _2374, _2534);
    float _2546 = fma(_2536, _2374, _2532);
    bool _2548 = _1234 <= 8000.0;
    bool _2550 = isnan(_1234);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan(8000.0);
    bool _2556 = _2552 || _2554;
    float _2558 = float(_2556);
    float _2560 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2510);
    int _2562 = int(_2440) + int(_2524);
    int _2564 = _2514 * _2542;
    int _2566 = _2564 + _2340;
    float _2568 = _1683 * _2184;
    float _2570 = fma(_2560, _2374, _2528);
    int _2572 = _2478 * _2562;
    int _2574 = _2572 + _2380;
    bool _2576 = uint(_2566) >= uint(_2240);
    out.m_79.x = _2544;
    out.m_79.y = _2546;
    out.m_79.z = _2570;
    bool _2578 = uint(_2574) >= uint(_2312);
    bool _2580 = !_2576;
    int _2582 = _2580 ? 0 : (-1);
    float _2584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2586 = !_2578;
    int _2588 = _2586 ? 0 : (-1);
    float _2590 = fma(_2540, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2592 = precise::clamp(_2590, 0.0, 1.0);
    int _2594 = ~_2588;
    int _2596 = _2562 + _2594;
    int _2598 = _2596 + 1;
    int _2600 = ~_2542;
    int _2602 = _2600 + _2582;
    int _2604 = _2602 + 1;
    float _2606 = fma(_2592, -2.0, 3.0);
    int _2608 = ~int(_2538);
    int _2610 = _2608 + 1;
    float _2612 = _2592 * _2592;
    bool _2614 = _2240 == 0;
    int _2616 = _2240 * _2604;
    int _2618 = _2616 + _2340;
    int _2620 = _2598 ^ _2610;
    float _2622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2624 = _2240 == 0;
    float _2626 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2628 = ~_2610;
    int _2630 = _2628 + _2620;
    int _2632 = _2630 + 1;
    float _2634 = _2612 * _2606;
    bool _2636 = !_2614;
    int _2638 = _2636 ? _2618 : (-1);
    float _2640 = _2584 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2642 = !_2624;
    int _2644 = _2642 ? _2632 : (-1);
    float _2646 = -_2634;
    float _2648 = _2646 + 1.0;
    float _2650 = float(_2638);
    float _2652 = fma(_2640, _2408, -0.5);
    float _2654 = float(_2644);
    float _2656 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2634);
    float _2658 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2626);
    float _2660 = fma(_2640, _2650, _592);
    float _2662 = _1578 * 0.5;
    float _2664 = in.m_81.x;
    float _2666 = _2622 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2668 = fma(_614, _2652, _2660);
    float _2670 = _2558 * _2656;
    float _2672 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2658);
    float _2674 = fma(_2666, _2146, -0.5);
    float _2676 = -_608;
    float _2678 = fma(_2666, _2654, _2676);
    float _2680 = fma(_1628, -0.5, _2662);
    float _2682 = _2668 + 0.5;
    float _2684 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2686 = fma(_622, _2674, _2678);
    float _2688 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2672);
    float _2690 = _2152 * _2684;
    float _2692 = precise::clamp(_2690, 0.0, 1.0);
    float _2694 = _2686 + 0.5;
    float _2696 = _2688 + _1578;
    float _2698 = _1622 + _1578;
    out.gl_Position.x = _1622;
    out.gl_Position.y = _1628;
    out.gl_Position.z = _2688;
    out.gl_Position.w = _1578;
    float _2700 = -_2692;
    float _2702 = fma(_2700, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _2704 = _1376 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2706 = isnan(_1376);
    bool _2708 = _2704 || _2706;
    bool _2710 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2712 = _2708 || _2710;
    float _2714 = _2696 * 0.5;
    out.m_83.x = _2682;
    out.m_83.y = _2694;
    float _2716 = _2698 * 0.5;
    float _2718 = _2702 * _2664;
    float _2720 = fma(_1673, _2568, _1671);
    out.m_85.x = _2716;
    out.m_85.y = _2680;
    out.m_85.z = _2714;
    out.m_85.w = _1578;
    float _2722 = _1673 * _2184;
    float _2724 = -_1741;
    float _2726 = _2724 + 1.0;
    float _2728 = _2726;
    float _2730 = _2716;
    if (!_2712)
    {
        _2140 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2732 = _2140;
    float _2734 = fma(_1679, _2722, _1667);
    float _2736 = fma(_1681, _2722, _1669);
    float _2738 = _1673 * _2726;
    float _2740 = _2718 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2742 = _1288 * _1342;
    float _2744 = _2742;
    float _2746 = _2740;
    float _2748 = _2732;
    float _2750 = _2732;
    if (!_2712)
    {
        _2728 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2752 = _2728;
    out.m_87.x = _2734;
    out.m_87.y = _2736;
    out.m_87.z = _2720;
    out.m_87.w = _2738;
    float _2754 = _2742 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2756 = _2752;
    float _2758 = _2752;
    if (!_2712)
    {
        _2730 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2760 = _2730;
    out.m_89.x = _2740;
    float _2762 = _2760;
    float _2764 = _2760;
    if (!_2712)
    {
        _2142 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2766 = _2142;
    float _2768 = _2766;
    float _2770 = _2766;
    if (!_2712)
    {
        _2744 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2772 = _2744;
    float _2774 = _2772;
    float _2776 = _2772;
    if (!_2712)
    {
        _2746 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2778 = _2746;
    bool _2780 = !_2712;
    float _2782 = _2778;
    float _2784 = _2778;
    if (!_2780)
    {
        bool _2786 = _1376 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2788 = isnan(_1376);
        bool _2790 = _2786 || _2788;
        bool _2792 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2794 = _2790 || _2792;
        if (!_2794)
        {
            float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2798 = _1376 + _2796;
            float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2802 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2800;
            float _2804 = 1.0 / _2802;
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2826 = _2798 * _2804;
            float _2828 = precise::clamp(_2826, 0.0, 1.0);
            float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2834 = fma(_2828, _2808, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2836 = fma(_2828, _2832, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2838 = fma(_2828, _2812, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2840 = fma(_2828, _2816, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2842 = fma(_2828, _2820, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2844 = fma(_2828, _2824, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2750 = _2836;
            _2784 = _2842;
            _2764 = _2834;
            _2770 = _2840;
            _2758 = _2838;
            _2776 = _2844;
            _2846 = true;
        }
        else
        {
            bool _2848 = _1376 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2850 = isnan(_1376);
            bool _2852 = _2848 || _2850;
            bool _2854 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2856 = _2852 || _2854;
            if (!_2856)
            {
                _2762 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2858 = _2762;
            _2764 = _2858;
            if (!_2856)
            {
                _2748 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2860 = _2748;
            _2750 = _2860;
            if (!_2856)
            {
                _2756 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2862 = _2756;
            _2758 = _2862;
            if (!_2856)
            {
                _2768 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2864 = _2768;
            _2770 = _2864;
            if (!_2856)
            {
                _2782 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2866 = _2782;
            _2784 = _2866;
            if (!_2856)
            {
                _2774 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2868 = _2774;
            bool _2870 = !_2856;
            _2776 = _2868;
            if (!_2870)
            {
                bool _2872 = _1376 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2874 = isnan(_1376);
                bool _2876 = _2872 || _2874;
                bool _2878 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2880 = _2876 || _2878;
                if (!_2880)
                {
                    float _2882 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2884 = _1376 + _2882;
                    float _2886 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2888 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2886;
                    float _2890 = 1.0 / _2888;
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2894 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2898 = _2896 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2904 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2906 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2908 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2912 = _2884 * _2890;
                    float _2914 = precise::clamp(_2912, 0.0, 1.0);
                    float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2920 = fma(_2914, _2894, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2922 = fma(_2914, _2918, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2924 = fma(_2914, _2898, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2926 = fma(_2914, _2902, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2928 = fma(_2914, _2906, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2930 = fma(_2914, _2910, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2750 = _2922;
                    _2784 = _2928;
                    _2764 = _2920;
                    _2770 = _2926;
                    _2758 = _2924;
                    _2776 = _2930;
                    _2846 = true;
                }
                else
                {
                    _2750 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2784 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2764 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2770 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2758 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2776 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2846 = false;
    float _2932 = _2750;
    float _2934 = _2784;
    float _2936 = _2764;
    float _2938 = _2770;
    float _2940 = _2758;
    float _2942 = _2776;
    float _2944 = _2754 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2946 = fma(_2546, -0.5, 0.5);
    float _2948 = precise::clamp(_2946, 0.0, 1.0);
    float _2950 = -_2932;
    float _2952 = _2950 + _2934;
    float _2954 = -_2936;
    float _2956 = _2954 + _2938;
    out.m_49.x = _2944;
    float _2958 = fma(_2948, _2952, _2932);
    float _2960 = -_2940;
    float _2962 = _2960 + _2942;
    float _2964 = fma(_2948, _2956, _2936);
    float _2966 = _2958 * 0.586610972881317138671875;
    bool _2968 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2970 = fma(_2948, _2962, _2940);
    out.m_91.x = 0.0;
    float _2972 = fma(_2964, 0.298911988735198974609375, _2966);
    bool _2974 = _1288 > 0.0;
    bool _2976 = isnan(_1288);
    bool _2978 = _2974 || _2976;
    bool _2980 = isnan(0.0);
    bool _2982 = _2978 || _2980;
    float _2984 = fma(_2970, 0.114477999508380889892578125, _2972);
    bool _2986 = _1342 <= 0.0;
    bool _2988 = !_2982;
    bool _2990 = _2986 || _2988;
    float _2992 = -_2984;
    float _2994 = _2964 + _2992;
    float _2996 = -_2984;
    float _2998 = _2958 + _2996;
    float _3000 = -_2984;
    float _3002 = _2970 + _3000;
    float _3004 = fma(_2994, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2984);
    float _3006 = fma(_2998, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2984);
    float _3008 = fma(_3002, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2984);
    bool _3010 = !_2968;
    if (!_3010)
    {
        float _3012 = -_1224;
        float _3014 = _3012 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3016 = -_1226;
        float _3018 = _3016 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3020 = -_1228;
        float _3022 = _3020 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3024 = _3014 * _3014;
        float _3026 = fma(_3018, _3018, _3024);
        float _3028 = fma(_3022, _3022, _3026);
        float _3030 = sqrt(_3028);
        float _3032 = rsqrt(_3028);
        float _3034 = -_3030;
        float _3036 = _3034 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3038 = _3036 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3040 = precise::clamp(_3038, 0.0, 1.0);
        float _3042 = _3018 * _3032;
        float _3044 = _3014 * _3032;
        float _3046 = abs(_3040);
        float _3048 = log2(_3046);
        float _3050 = _3022 * _3032;
        float _3052 = _3042 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3054 = _2546 * _3044;
        float _3056 = -_3044;
        float _3058 = -_3052;
        float _3060 = fma(_3056, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3058);
        float _3062 = fma(_2544, _3042, _3054);
        float _3064 = -_3050;
        float _3066 = fma(_3064, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3060);
        float _3068 = fma(_2570, _3050, _3062);
        float _3070 = precise::clamp(_3068, 0.0, 1.0);
        float _3072 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3074 = _3066 + _3072;
        float _3076 = _3048 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3078 = _3074 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3080 = precise::clamp(_3078, 0.0, 1.0);
        float _3082 = exp2(_3076);
        float _3084 = _3082 * _3080;
        float _3086 = _3070 * _3084;
        float _3088 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3090 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3092 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3088;
        out.m_91.y = _3090;
        out.m_91.z = _3092;
    }
    out.m_65.x = _3004;
    out.m_65.y = _3006;
    out.m_65.z = _3008;
    if (!_2990)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3094 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3094;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

