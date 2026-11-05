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
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_28 [[id(7)]];
    sampler vp_t_tcb_28Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_28Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_73 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_95 [[user(locn2)]];
    float4 m_99 [[user(locn3)]];
    float4 m_107 [[user(locn4)]];
    float4 m_103 [[user(locn5)]];
    float4 m_105 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_101 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_97 [[user(locn13)]];
    float4 m_83 [[user(locn14)]];
    float4 m_81 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_85 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_93 [[attribute(8)]];
    float4 m_91 [[attribute(9)]];
    float4 m_69 [[attribute(10)]];
    float4 m_71 [[attribute(11)]];
    float4 m_57 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3836 = false;
    bool _2811 = false;
    bool _734 = false;
    bool _630 = false;
    bool _488 = false;
    bool _254 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_50.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_53.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4141 = as_type<float>(_142);
        out.gl_Position.z = _4141;
    }
    if (!_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_55.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_53.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4211 = as_type<float>(_180);
        out.gl_Position.z = _4211;
    }
    if (_172)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _182 = in.m_57.x;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = in.m_57.y;
    float _188 = in.m_59.x;
    float _190 = in.m_59.y;
    float _192 = in.m_59.z;
    float _194 = in.m_61.x;
    float _196 = in.m_61.y;
    float _198 = in.m_61.z;
    float _200 = in.m_63.x;
    float _202 = in.m_63.y;
    float _204 = in.m_63.z;
    float _206 = in.m_65.x;
    float _208 = in.m_65.y;
    float _210 = in.m_65.z;
    out.m_67.x = _182;
    out.m_67.y = _186;
    float _212 = _190 * _196;
    float _214 = _190 * _202;
    float _216 = fma(_188, _194, _212);
    float _218 = _190 * _208;
    float _220 = fma(_188, _200, _214);
    float _222 = fma(_192, _198, _216);
    float _224 = fma(_188, _206, _218);
    float _226 = fma(_192, _204, _220);
    float _228 = fma(_192, _210, _224);
    bool _230 = !_184;
    float _232 = _186;
    float _234 = _182;
    float _252;
    if (!_230)
    {
        float _236 = in.m_69.x;
        float _238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _240 = _236 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _242 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _244 = _242 * _238;
        float _246 = floor(_244);
        float _248 = -_246;
        float _250 = _244 + _248;
        _252 = _250;
        _254 = true;
    }
    else
    {
        float _256 = float(_126);
        float _258 = 1.0 / _256;
        float _260 = _160 * _258;
        _252 = _260;
    }
    _254 = false;
    float _262 = _252;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = _262 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _262 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = _262 + _284;
    float _288 = 1.0 / _274;
    bool _290 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _292 = isnan(_262);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    bool _302 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_262);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    bool _314 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_262);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _328 = 1.0 / _278;
    float _330 = 1.0 / _282;
    float _332 = _266 * _288;
    bool _334 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _336 = isnan(_262);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _350 = -_344;
    float _352 = _350 + 1.0;
    float _354 = _270 * _328;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _356;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _360;
    float _364 = -_312;
    float _366 = _364 + 1.0;
    float _368 = fma(_362, _332, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _374 = _286 * _330;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    float _380 = fma(_358, _332, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = _324 * _366;
    float _388 = fma(_378, _332, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _390 = _300 * _352;
    float _392 = -_300;
    float _394 = _392 + 1.0;
    float _396 = fma(_372, _354, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _398 = _380 * _386;
    float _400 = _312 * _394;
    float _402 = fma(_348, _354, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _404 = fma(_384, _354, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _406 = in.m_71.x;
    float _408 = in.m_71.y;
    float _410 = in.m_71.z;
    float _412 = _368 * _386;
    float _414 = -_324;
    float _416 = _414 + 1.0;
    float _418 = _388 * _386;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _424;
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _398);
    float _430 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _412);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _432;
    float _436 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _418);
    float _438 = fma(_426, _374, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _440 = fma(_422, _374, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _442 = fma(_434, _374, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = fma(_402, _400, _428);
    float _446 = fma(_404, _400, _430);
    float _448 = fma(_396, _400, _436);
    float _450 = fma(_438, _390, _444);
    float _452 = fma(_440, _390, _446);
    float _454 = fma(_442, _390, _448);
    float _456 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].x, _450);
    float _458 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].y, _452);
    float _460 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].z, _454);
    float _462 = _456 * _406;
    float _464 = _458 * _408;
    float _466 = _460 * _410;
    bool _468 = !_326;
    float _486;
    if (!_468)
    {
        float _470 = in.m_69.x;
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _474 = _470 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _476 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _478 = _476 * _472;
        float _480 = floor(_478);
        float _482 = -_480;
        float _484 = _478 + _482;
        _486 = _484;
        _488 = true;
    }
    else
    {
        float _490 = float(_126);
        float _492 = 1.0 / _490;
        float _494 = _160 * _492;
        _486 = _494;
    }
    _488 = false;
    float _496 = _486;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _500 = _496 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _506 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _508 = isnan(_496);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _522 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _524 = isnan(_496);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _534;
    bool _538 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _540 = isnan(_496);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = 1.0 / _504;
    float _552 = -_516;
    float _554 = _552 + 1.0;
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _558 = 1.0 / _520;
    float _560 = _536 * _550;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _566 = -_548;
    float _568 = _566 + 1.0;
    float _570 = fma(_560, _500, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _572 = _532 * _554;
    float _574 = -_532;
    float _576 = _574 + 1.0;
    float _578 = _516 * _568;
    float _580 = _564 * _558;
    float _582 = _570 * _572;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _586 = _496 + _584;
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    float _590 = fma(_580, _586, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _594 = fma(_590, _578, _588);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _598 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _602 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[117].x, _594);
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _598;
    out.m_73.y = _604;
    out.m_73.z = _606;
    out.m_73.w = _608;
    bool _610 = !_556;
    float _628;
    if (!_610)
    {
        float _612 = in.m_69.x;
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        float _632 = float(_126);
        float _634 = 1.0 / _632;
        float _636 = _160 * _634;
        _628 = _636;
    }
    _630 = false;
    float _638 = _628;
    bool _640 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _642 = isnan(_638);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _656 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _658 = isnan(_638);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _674 = _638 + _672;
    float _676 = -_650;
    float _678 = _676 + 1.0;
    float _680 = 1.0 / _654;
    bool _682 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _684 = _666 * _678;
    float _686 = -_666;
    float _688 = _686 + 1.0;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _692 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _670 * _680;
    float _696 = fma(_694, _674, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _698 = _696 * _684;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _704 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[131].x, _698);
    float _706 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[132].x, _704);
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _706 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _708;
    out.m_75.y = _710;
    out.m_75.z = _692;
    out.m_75.w = _712;
    bool _714 = !_682;
    float _732;
    if (!_714)
    {
        float _716 = in.m_69.x;
        float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _720 = _716 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[14].x, _160);
        float _724 = _722 * _718;
        float _726 = floor(_724);
        float _728 = -_726;
        float _730 = _724 + _728;
        _732 = _730;
        _734 = true;
    }
    else
    {
        float _736 = float(_126);
        float _738 = 1.0 / _736;
        float _740 = _160 * _738;
        _732 = _740;
    }
    _734 = false;
    float _742 = _732;
    float _744 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _746 = int(_744);
    float _748 = float(_126);
    float _750 = in.m_61.w;
    float _752 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _754 = in.m_65.w;
    float _756 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _758 = int(_756);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _768 = 1.0 / _748;
    float _770 = float(_746);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _772;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _784 = 1.0 / _770;
    float _786 = float(uint(_758));
    int _788 = ~_758;
    int _790 = _788 + 1;
    int _792 = ~_758;
    int _794 = _792 + 1;
    int _796 = ~_758;
    int _798 = _796 + 1;
    float _800 = 1.0 / _786;
    float _802 = _784 * _160;
    float _804 = 1.0 / _762;
    int _806 = as_type<int>(_800) + (-2);
    float _808 = trunc(_802);
    int _810 = int(_808);
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _814 = _812 != 0;
    float _816 = 1.0 / _782;
    bool _818 = !_814;
    float _820 = _818 ? 7.345489978790283203125 : 1.0;
    float _822 = float(uint(_810));
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _826 = as_type<float>(_806) * _822;
    float _828 = trunc(_826);
    float _830 = precise::max(_828, 0.0);
    uint _833 = uint(_830);
    float _835 = _824 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _837 = float(_758);
    int _839 = _790 * int(_833);
    int _841 = _839 + _810;
    float _843 = float(uint(_841));
    float _845 = in.m_69.x;
    float _847 = as_type<float>(_806) * _843;
    float _849 = trunc(_847);
    float _851 = precise::max(_849, 0.0);
    uint _853 = uint(_851);
    float _855 = _820 * _845;
    int _857 = int(_833) + int(_853);
    float _859 = float(_810);
    float _861 = 0.0;
    if (_814)
    {
        _861 = _845;
    }
    float _863 = _861;
    int _865 = _794 * _857;
    int _867 = _865 + _810;
    bool _869 = _859 >= _837;
    bool _871 = isnan(_859);
    bool _873 = _869 || _871;
    bool _875 = isnan(_837);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = floor(_855);
    bool _883 = uint(_867) >= uint(_758);
    bool _885 = !_883;
    int _887 = _885 ? 0 : (-1);
    float _889 = trunc(_879);
    int _891 = int(_889);
    bool _893 = _758 == 0;
    int _895 = ~_857;
    int _897 = _895 + _887;
    int _899 = _897 + 1;
    int _901 = _758 * _899;
    int _903 = _901 + _810;
    float _905 = -_881;
    float _907 = _855 + _905;
    int _909 = _758 + (-1);
    float _911 = _907 * _837;
    bool _913 = !_893;
    int _915 = _913 ? _903 : (-1);
    float _917 = _837 * _160;
    int _919 = ~_891;
    int _921 = _919 + 1;
    int _923 = _921 + 1;
    float _925 = trunc(_911);
    int _927 = int(_925);
    int _929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _931 = _929 != 0;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _935 = _933 != 0;
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _939 = _937 != 0;
    float _941 = _917 * _768;
    int _943 = _915 * _923;
    bool _945 = !_935;
    int _947 = _945 ? 0 : 1;
    float _949 = trunc(_941);
    int _951 = int(_949);
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _955 = _953 != 0;
    int _957 = _891 * _909;
    int _959 = _957 + _943;
    bool _961 = !_931;
    int _963 = _961 ? 0 : 1;
    bool _965 = !_955;
    int _967 = _965 ? 0 : 1;
    int _969 = abs(_947);
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _973 = _971 != 0;
    bool _975 = !_939;
    int _977 = _975 ? 0 : 1;
    int _979 = _959 * _969;
    int _981 = abs(_963);
    int _983 = abs(_967);
    bool _985 = !_973;
    int _987 = _985 ? 0 : 1;
    int _989 = abs(_977);
    int _991 = _927 * _983;
    int _993 = _991 + _810;
    int _995 = abs(_987);
    int _997 = _951 * _981;
    int _999 = _997 + _979;
    float _1001 = in.m_50.x;
    float _1003 = in.m_50.y;
    int _1005 = _993 * _989;
    int _1007 = _1005 + _999;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1015 = _1013 != 0;
    int _1017 = _927 * _995;
    int _1019 = _1017 + _1007;
    int _1021 = ~_758;
    int _1023 = _1021 + 1;
    float _1025 = in.m_77.y;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1029 = _1027 != 0;
    float _1031 = float(uint(_1019));
    float _1033 = as_type<float>(_806) * _1031;
    int _1035 = _999;
    bool _1037 = _973;
    float _1039 = _863;
    if (_1011)
    {
        float _1041 = -_182;
        float _1043 = _1041 + 1.0;
        _1035 = as_type<int>(_1043);
    }
    int _1045 = _1035;
    if (_1011)
    {
        bool _1047 = _845 > 0.5;
        _1037 = _1047;
    }
    bool _1049 = _1037;
    float _1051 = trunc(_1033);
    float _1053 = precise::max(_1051, 0.0);
    uint _1055 = uint(_1053);
    float _1057 = 0.0;
    if (!_1029)
    {
        _1057 = _182;
    }
    float _1059 = _1057;
    float _1061 = _208 * _1003;
    float _1063 = _202 * _1003;
    float _1065 = _845 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1067 = in.m_69.y;
    float _1069 = fma(_200, _1001, _1063);
    float _1071 = -_764;
    float _1073 = fma(_1065, 2.0, _1071);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1079 = _1023 * int(_1055);
    int _1081 = _1079 + _1019;
    float _1083 = 1.0 / _1077;
    float _1085 = float(uint(_1081));
    float _1087 = as_type<float>(_1081);
    float _1089 = _1059;
    if (!_1011)
    {
        _1087 = _182;
    }
    float _1091 = _1087;
    float _1093 = _1091;
    if (_1011)
    {
        float _1095 = _1049 ? as_type<float>(_1045) : _182;
        _1093 = _1095;
    }
    float _1097 = _1093;
    float _1099 = as_type<float>(_806) * _1085;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1103 = _1101 != 0;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1105;
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1111 = _1109 != 0;
    float _1113 = _196 * _1003;
    float _1115 = trunc(_1099);
    float _1117 = precise::max(_1115, 0.0);
    uint _1119 = uint(_1117);
    float _1121 = _1003 + _1025;
    float _1123 = fma(_194, _1001, _1113);
    float _1125 = fma(_206, _1001, _1061);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1131 = float(uint(_993));
    float _1133 = _1107 * _804;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1139 = 1.0 / _1129;
    float _1141 = -_186;
    float _1143 = _1141 + 1.0;
    float _1145 = as_type<float>(_806) * _1131;
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1149 = _1147 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1151 = !_1103;
    int _1153 = _1151 ? 0 : 1;
    float _1155 = _1149 * _1083;
    int _1157 = int(_1055) + int(_1119);
    float _1159 = 1.0 / _1137;
    float _1161 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1163 = _798 * _1157;
    int _1165 = _1163 + _1019;
    float _1167 = fma(_1161, -2.0, _766);
    float _1169 = _778 * _1139;
    float _1171 = trunc(_1145);
    float _1173 = precise::max(_1171, 0.0);
    uint _1175 = uint(_1173);
    float _1177 = in.m_69.z;
    bool _1179 = uint(_1165) >= uint(_758);
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1189 = in.m_50.z;
    bool _1191 = !_1179;
    int _1193 = _1191 ? 0 : (-1);
    bool _1195 = _1067 > 0.5;
    float _1197 = _774 * _1159;
    int _1199 = ~_1157;
    int _1201 = _1199 + _1193;
    int _1203 = _1201 + 1;
    float _1205 = 1.0 / _1183;
    int _1207 = _1195 ? as_type<int>(_1143) : as_type<int>(_186);
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1209;
    int _1213 = _758 * _1203;
    int _1215 = _1213 + _1019;
    int _1217 = ~_758;
    int _1219 = _1217 + 1;
    float _1221 = _1211 * _816;
    float _1223 = _1015 ? as_type<float>(_1207) : _186;
    float _1225 = 1.0 / _1187;
    bool _1227 = !_893;
    int _1229 = _1227 ? _1215 : (-1);
    int _1231 = _1219 * int(_1175);
    int _1233 = _1231 + _993;
    float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1237 = _1235 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1239 = ~_758;
    int _1241 = _1239 + 1;
    bool _1243 = _1177 > 0.5;
    int _1245 = _1229 & 3;
    bool _1247 = _1245 != 0;
    float _1249 = _1237 * _1205;
    if (_1111)
    {
        float _1251 = _1243 ? _1143 : _186;
        _232 = _1251;
    }
    float _1253 = _232;
    float _1255 = fma(_204, _1189, _1069);
    bool _1257 = uint(_1245) > 1u;
    float _1259 = _845 * 2.0;
    float _1261 = float(uint(_1233));
    float _1263 = fma(_835, _1253, -0.5);
    int _1265 = _1229 & 3;
    bool _1267 = _1265 != 0;
    float _1269 = as_type<float>(_806) * _1261;
    int _1271 = _1267 ? 0 : 1;
    float _1273 = floor(_1259);
    bool _1275 = uint(_1245) >= 2u;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1277;
    int _1281 = ~_1271;
    int _1283 = _1281 + 1;
    int _1285 = _1283 + 1;
    float _1287 = _1067 * 2.0;
    int _1289 = _1285;
    float _1291 = _1287;
    if (!_1257)
    {
        int _1293 = ~_1271;
        int _1295 = _1293 + 1;
        _1289 = _1295;
    }
    int _1297 = _1289;
    float _1299 = _1279 * _1225;
    int _1301 = _1275 ? 0 : 1;
    float _1303 = trunc(_1269);
    float _1305 = precise::max(_1303, 0.0);
    uint _1307 = uint(_1305);
    bool _1309 = _1067 > 0.5;
    bool _1311 = _1309 && _1029;
    float _1313 = fma(_198, _1189, _1123);
    bool _1315 = _1245 != 3;
    float _1317 = fma(_210, _1189, _1125);
    float _1319 = _1067 + _1177;
    if (!_814)
    {
        _1039 = _1177;
    }
    float _1321 = _1039;
    float _1323 = _845 + _1067;
    float _1325 = floor(_1287);
    int _1327 = ~_1301;
    int _1329 = _1327 + 1;
    int _1331 = _1329 + 1;
    float _1333 = _1319 + (-1.0);
    bool _1335 = !_1247;
    int _1337 = _1335 ? 0 : 1;
    float _1339 = _1323 + (-1.0);
    int _1341 = _1331;
    if (_1311)
    {
        float _1343 = -_182;
        float _1345 = _1343 + 1.0;
        _234 = _1345;
    }
    float _1347 = _234;
    bool _1349 = _1273 >= 0.0;
    bool _1351 = isnan(_1273);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan(0.0);
    bool _1357 = _1353 || _1355;
    float _1359 = _1317 + _754;
    int _1361 = int(_1175) + int(_1307);
    float _1363 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_1029)
    {
        _1089 = _1347;
    }
    float _1365 = _1089;
    if (_1315)
    {
        int _1367 = ~_1301;
        int _1369 = _1367 + 1;
        _1341 = _1369;
    }
    int _1371 = _1341;
    int _1373 = _1241 * _1361;
    int _1375 = _1373 + _993;
    bool _1377 = _1273 > 0.0;
    float _1379 = _1177 * 2.0;
    bool _1381 = uint(_1375) >= uint(_758);
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1385 = _742 + _1383;
    if (_814)
    {
        _1291 = _1067;
    }
    float _1387 = _1291;
    float _1389 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1391 = _1245 != 3;
    float _1393 = floor(_1379);
    float _1395 = _1387;
    if (!_814)
    {
        _1395 = _845;
    }
    float _1397 = _1395;
    float _1399 = fma(_1133, _1385, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1401 = !_1381;
    int _1403 = _1401 ? 0 : (-1);
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1407 = _742 + _1405;
    bool _1409 = _1325 > 0.0;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1413 = _742 + _1411;
    bool _1415 = _1325 >= 0.0;
    bool _1417 = isnan(_1325);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan(0.0);
    bool _1423 = _1419 || _1421;
    float _1425 = fma(_1169, _1407, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _1427 = _1357 ? 0 : 1;
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1431 = _742 + _1429;
    bool _1433 = !_1391;
    int _1435 = _1433 ? 0 : (-1);
    float _1437 = fma(_1249, _1413, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1441 = _1439 != 0;
    int _1443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1445 = _1443 != 0;
    int _1447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1449 = _1447 != 0;
    float _1451 = fma(_1197, _1431, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1453 = _1229 >> 31;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1457 = _742 + _1455;
    int _1459 = ~_1427;
    int _1461 = _1459 + 1;
    int _1463 = _1461 + 1;
    int _1465 = _1463;
    if (!_1377)
    {
        int _1467 = ~_1427;
        int _1469 = _1467 + 1;
        _1465 = _1469;
    }
    int _1471 = _1465;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1475 = _742 + _1473;
    bool _1477 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1479 = isnan(_742);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1485 = _1481 || _1483;
    float _1487 = float(_1485);
    float _1489 = fma(_1221, _1457, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _1491 = _1453 & 3;
    float _1493 = fma(_1155, _1475, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1495 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1497 = isnan(_742);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1503 = _1499 || _1501;
    float _1505 = float(_1503);
    float _1507 = -_1487;
    float _1509 = _1507 + 1.0;
    int _1511 = _1229 + _1491;
    bool _1513 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1515 = isnan(_742);
    bool _1517 = _1513 || _1515;
    bool _1519 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1521 = _1517 || _1519;
    float _1523 = float(_1521);
    float _1525 = in.m_63.w;
    int _1527 = _1511 >> 2;
    float _1529 = _1505 * _1509;
    int _1531 = _1423 ? 0 : 1;
    float _1533 = -_1505;
    float _1535 = _1533 + 1.0;
    bool _1537 = _1393 > 0.0;
    bool _1539 = _1393 >= 0.0;
    bool _1541 = isnan(_1393);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan(0.0);
    bool _1547 = _1543 || _1545;
    float _1549 = -_1523;
    float _1551 = _1549 + 1.0;
    bool _1553 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1555 = isnan(_742);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1561 = _1557 || _1559;
    float _1563 = float(_1561);
    int _1565 = _1527 << 4;
    int _1567 = _1565 + 368;
    float _1569 = _1487 * _1551;
    bool _1571 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1573 = isnan(_742);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1579 = _1575 || _1577;
    float _1581 = float(_1579);
    float _1583 = _1563 * _1535;
    float _1585 = -_1563;
    float _1587 = _1585 + 1.0;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1591 = _742 + _1589;
    uint _1593 = uint(int(uint(_1567) >> uint(2)));
    uint _1595 = uint(int(uint(int(_1593)) >> uint(2)));
    int _1597 = int(_1593) & 3;
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[int(_1595)][_1597];
    int _1601 = int(_1593) + 1;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    int _1605 = _1601 & 3;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[int(_1603)][_1605];
    bool _1609 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1611 = isnan(_742);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1617 = _1613 || _1615;
    float _1619 = float(_1617);
    float _1621 = -_1581;
    float _1623 = _1621 + 1.0;
    float _1625 = fma(_1299, _1591, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1627 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1629 = isnan(_742);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1635 = _1631 || _1633;
    float _1637 = float(_1635);
    float _1639 = _1581 * _1587;
    float _1641 = _1619 * _1623;
    float _1643 = -_1619;
    float _1645 = _1643 + 1.0;
    float _1647 = _1313 + _750;
    bool _1649 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1651 = isnan(_742);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = -_1637;
    float _1663 = _1661 + 1.0;
    float _1665 = _1637 * _1645;
    float _1667 = _1255 + _1525;
    float _1669 = _1659 * _1663;
    float _1671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1673 = _1567 + 8;
    uint _1675 = uint(int(uint(_1673) >> uint(2)));
    uint _1677 = uint(int(uint(int(_1675)) >> uint(2)));
    int _1679 = int(_1675) & 3;
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[int(_1677)][_1679];
    int _1683 = int(_1675) + 1;
    uint _1685 = uint(int(uint(_1683) >> uint(2)));
    int _1687 = _1683 & 3;
    float _1689 = (*spvDescriptorSet0.vp_c9)._m0[int(_1685)][_1687];
    float _1691 = -_1659;
    float _1693 = _1691 + 1.0;
    float _1695 = _1399 * _1669;
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1699 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1701 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1695);
    int _1703 = abs(_1297);
    float _1705 = -_1697;
    float _1707 = fma(_1699, 2.0, _1705);
    float _1709 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1711 = ~_1361;
    int _1713 = _1711 + _1403;
    int _1715 = _1713 + 1;
    float _1717 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1719 = int(_1717);
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1723 = abs(_1371);
    float _1725 = fma(_1493, _1665, _1701);
    float _1727 = _1671 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1729 = ~_1531;
    int _1731 = _1729 + 1;
    int _1733 = _1731 + 1;
    float _1735 = fma(_1709, -2.0, _1721);
    int _1737 = _1733;
    if (!_1409)
    {
        int _1739 = ~_1531;
        int _1741 = _1739 + 1;
        _1737 = _1741;
    }
    int _1743 = _1737;
    float _1745 = fma(_1727, _1365, -0.5);
    float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1749 = _1647 + _1747;
    int _1751 = abs(_1337);
    int _1753 = _758 * _1715;
    int _1755 = _1753 + _993;
    int _1757 = ~_1703;
    int _1759 = _1757 + 1;
    int _1761 = _1759 + 1;
    float _1763 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1765 = _1667 + _1763;
    float _1767 = _1749 * _1749;
    float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1771 = _1359 + _1769;
    float _1773 = float(uint(_1719));
    float _1775 = -_160;
    float _1777 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1707);
    int _1779 = ~_1751;
    int _1781 = _1779 + 1;
    int _1783 = _1781 + 1;
    float _1785 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1735);
    int _1787 = _1761 * as_type<int>(_1607);
    float _1789 = fma(_1765, _1765, _1767);
    int _1791 = abs(_1435);
    float _1793 = 1.0 / _1773;
    int _1795 = _1783 * as_type<int>(_1599);
    int _1797 = _1795 + _1787;
    float _1799 = fma(_1771, _1771, _1789);
    float _1801 = fma(_1451, _1641, _1725);
    int _1803 = abs(_1153);
    int _1805 = ~_1723;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    float _1811 = sqrt(_1799);
    int _1813 = abs(_1719);
    int _1815 = ~_1791;
    int _1817 = _1815 + 1;
    int _1819 = _1817 + 1;
    int _1821 = _1809 * as_type<int>(_1681);
    int _1823 = _1821 + _1797;
    float _1825 = float(uint(_1813));
    float _1827 = rsqrt(_1799);
    int _1829 = ~_1803;
    int _1831 = _1829 + 1;
    int _1833 = _1831 + 1;
    int _1835 = _1819 * as_type<int>(_1689);
    int _1837 = _1835 + _1823;
    int _1839 = _1547 ? 0 : 1;
    int _1841 = _1837 * _1833;
    bool _1843 = !_893;
    int _1845 = _1843 ? _1755 : (-1);
    float _1847 = 1.0 / _1825;
    float _1849 = _1811 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1853 = ~_1839;
    int _1855 = _1853 + 1;
    int _1857 = _1855 + 1;
    int _1859 = _1845 * _1803;
    int _1861 = _1859 + _1841;
    int _1863 = _1857;
    float _1865 = as_type<float>(_1813);
    if (!_1537)
    {
        int _1867 = ~_1839;
        int _1869 = _1867 + 1;
        _1863 = _1869;
    }
    int _1871 = _1863;
    float _1873 = _752 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1877 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1879 = log2(_1877);
    int _1881 = as_type<int>(_1793) + (-2);
    float _1883 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1851);
    float _1885 = precise::min(_1873, _1849);
    float _1887 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1875);
    float _1889 = float(uint(_1861));
    float _1891 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1883);
    int _1893 = abs(_1861);
    out.m_79.w = _1885;
    int _1895 = as_type<int>(_1847) + (-2);
    float _1897 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1887);
    float _1899 = float(uint(_1893));
    float _1901 = as_type<float>(_1881) * _1889;
    int _1903 = ~_1719;
    int _1905 = _1903 + 1;
    float _1907 = fma(_1897, _1745, _1777);
    float _1909 = trunc(_1901);
    float _1911 = precise::max(_1909, 0.0);
    uint _1913 = uint(_1911);
    float _1915 = as_type<float>(_1895) * _1899;
    float _1917 = -_1785;
    float _1919 = fma(_1891, _1263, _1917);
    float _1921 = _1827 * _1885;
    float _1923 = _1879 * _160;
    bool _1925 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1927 = isnan(1.0);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1933 = _1929 || _1931;
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1937 = 1.0 + _1935;
    float _1939 = _1765 * _1921;
    float _1941 = trunc(_1915);
    float _1943 = precise::max(_1941, 0.0);
    uint _1945 = uint(_1943);
    float _1947 = _1749 * _1921;
    int _1949 = ~_1813;
    int _1951 = _1949 + 1;
    float _1953 = -_1939;
    float _1955 = _1765 + _1953;
    bool _1957 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1959 = isnan(0.0);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1965 = _1961 || _1963;
    float _1967 = -_1947;
    float _1969 = _1749 + _1967;
    float _1971 = _1919 + 0.5;
    float _1973 = _1955 * _1955;
    float _1975 = _1771 * _1921;
    float _1977 = exp2(_1923);
    int _1979 = _1905 * int(_1913);
    int _1981 = _1979 + _1861;
    float _1983 = fma(_1969, _1969, _1973);
    float _1985 = -_1975;
    float _1987 = _1771 + _1985;
    float _1989 = float(uint(_1981));
    int _1991 = _1951 * int(_1945);
    int _1993 = _1991 + _1893;
    float _1995 = fma(_1987, _1987, _1983);
    float _1997 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1999 = _1121 + _1997;
    float _2001 = as_type<float>(_1881) * _1989;
    float _2003 = float(uint(_1993));
    float _2005 = sqrt(_1995);
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2009 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2011 = -_1977;
    float _2013 = _2011 + 1.0;
    float _2015 = as_type<float>(_1895) * _2003;
    float _2017 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2007);
    float _2019 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2009);
    float _2021 = -_160;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1073);
    float _2025 = 1.0 / _1937;
    float _2027 = fma(_1999, _1999, _1767);
    float _2029 = _1965 ? _2013 : 0.0;
    float _2031 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2017);
    float _2033 = float(_1471);
    float _2035 = fma(_1771, _1771, _2027);
    float _2037 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1167);
    float _2039 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2019);
    float _2041 = trunc(_2001);
    float _2043 = precise::max(_2041, 0.0);
    uint _2045 = uint(_2043);
    float _2047 = _1999 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2049 = _1827 * _2005;
    float _2051 = _1907 + 0.5;
    float _2053 = fma(_1425, _1639, _1801);
    float _2055 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2047);
    float _2057 = _752 * _2049;
    bool _2059 = !_1445;
    int _2061 = _2059 ? 0 : 1;
    float _2063 = trunc(_2015);
    float _2065 = precise::max(_2063, 0.0);
    uint _2067 = uint(_2065);
    float _2069 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2055);
    if (_1933)
    {
        float _2071 = _2029 * _2025;
        _162 = _2071;
    }
    float _2073 = _162;
    float _2075 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_81.x = _2051;
    out.m_81.y = _1971;
    float _2077 = fma(_1489, _1583, _2053);
    bool _2079 = _2069 >= 0.0;
    float _2081 = rsqrt(_2035);
    int _2083 = int(_1913) + int(_2045);
    float _2085 = fma(_1437, _1529, _2077);
    int _2087 = ~_1719;
    int _2089 = _2087 + 1;
    int _2091 = ~_1813;
    int _2093 = _2091 + 1;
    float _2095 = fma(_1625, _1569, _2085);
    int _2097 = _1861 ^ _1719;
    int _2099 = _2089 * _2083;
    int _2101 = _2099 + _1861;
    int _2103 = int(_1945) + int(_2067);
    float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2107 = abs(_2061);
    float _2109 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2095);
    bool _2111 = uint(_2101) >= uint(_1719);
    int _2113 = _2093 * _2103;
    int _2115 = _2113 + _1893;
    float _2117 = float(_2107);
    float _2119 = _2075 * _2081;
    bool _2121 = !_2111;
    int _2123 = _2121 ? 0 : (-1);
    float _2125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2127 = uint(_2115) >= uint(_1813);
    float _2129 = _1999 * _2119;
    float _2131 = _1749 * _2119;
    int _2133 = ~_2083;
    int _2135 = _2133 + _2123;
    int _2137 = _2135 + 1;
    out.m_83.x = _2109;
    float _2139 = -_2129;
    float _2141 = _1999 + _2139;
    float _2143 = -_2131;
    float _2145 = _1749 + _2143;
    bool _2147 = !_2127;
    int _2149 = _2147 ? 0 : (-1);
    float _2151 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2153 = _2141 * _2141;
    bool _2155 = _1719 == 0;
    if (_2079)
    {
        out.m_53.x = 0.0;
    }
    bool _2157 = _1719 == 0;
    float _2159 = fma(_2145, _2145, _2153);
    uint _2161 = uint(int(uint(_2097) >> uint(31)));
    int _2163 = _1719 * _2137;
    int _2165 = _2163 + _1861;
    int _2167 = ~_2149;
    int _2169 = _2103 + _2167;
    int _2171 = _2169 + 1;
    int _2173 = ~int(_2161);
    int _2175 = _2173 + 1;
    float _2177 = _1771 * _2119;
    bool _2179 = !_2155;
    int _2181 = _2179 ? _2165 : (-1);
    float _2183 = fma(_2151, _1097, -0.5);
    if (_2079)
    {
        _1865 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2185 = _1865;
    float _2187 = -_2177;
    float _2189 = _1771 + _2187;
    float _2191 = float(_2181);
    float _2193 = _2125 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2195 = _2171 ^ _2175;
    float _2197 = fma(_2189, _2189, _2159);
    int _2199 = as_type<int>(_2185);
    if (_2079)
    {
        float _2201 = _2185 * 5.0;
        _2199 = as_type<int>(_2201);
    }
    int _2203 = _2199;
    float _2205 = fma(_2151, _2191, _2023);
    int _2207 = ~_2175;
    int _2209 = _2207 + _2195;
    int _2211 = _2209 + 1;
    float _2213 = fma(_2193, _1223, -0.5);
    float _2215 = _2117 * _2033;
    float _2217 = sqrt(_2197);
    if (_2079)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7282 = as_type<float>(_2203);
        out.gl_Position.z = _7282;
    }
    float _2219 = fma(_2031, _2183, _2205);
    bool _2221 = !_2157;
    int _2223 = _2221 ? _2211 : (-1);
    float _2225 = float(_1871);
    float _2227 = _2219 + 0.5;
    float _2229 = float(_2223);
    float _2231 = -_2037;
    float _2233 = fma(_2193, _2229, _2231);
    bool _2235 = !_1449;
    int _2237 = _2235 ? 0 : 1;
    bool _2239 = !_1441;
    int _2241 = _2239 ? 0 : 1;
    float _2243 = fma(_2039, _2213, _2233);
    int _2245 = abs(_2237);
    float _2247 = _2081 * _2217;
    int _2249 = abs(_2241);
    float _2251 = _2243 + 0.5;
    float _2253 = in.m_85.x;
    float _2255 = in.m_85.y;
    float _2257 = in.m_85.z;
    float _2259 = _2057 * _2247;
    float _2261 = float(_1743);
    out.m_87.x = _2227;
    out.m_87.y = _2251;
    float _2263 = float(_2245);
    float _2265 = float(_2249);
    out.m_89.x = _2259;
    if (_2079)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2267 = _2265 * _2225;
    float _2269 = -_2131;
    float _2271 = _1647 + _2269;
    float _2273 = -_2129;
    float _2275 = _1121 + _2273;
    float _2277 = _2267 * (-2.0);
    float _2279 = _2263 * _2261;
    float _2281 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2283 = _2271 + _2281;
    float _2285 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2287 = _2275 + _2285;
    float _2289 = fma(_2277, _2253, _2253);
    float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[191].y + _2291;
    float _2295 = -_2177;
    float _2297 = _1359 + _2295;
    float _2299 = _2287 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2301 = fma(_1363, _2277, _1363);
    float _2303 = _2215 * (-2.0);
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2307 = _2297 + _2305;
    float _2309 = 1.0 / _2293;
    float _2311 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2299);
    float _2313 = _845 + (-0.5);
    float _2315 = precise::max(_1189, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _2317 = _845 + _1177;
    float _2319 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2311);
    float _2321 = fma(_1389, _2303, _1389);
    float _2323 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2289);
    float _2325 = fma(_2303, _2255, _2255);
    float _2327 = precise::min(_2315, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _2329 = _1067 + (-0.5);
    float _2331 = _2317 + (-1.0);
    float _2333 = fma(_2301, _2073, _2323);
    bool _2335 = _2319 >= 0.0;
    float _2337 = _2279 * (-2.0);
    float _2339 = fma(_2329, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2325);
    float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2343 = _2327 + _2341;
    float _2345 = fma(_2331, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2347 = _2333 * 0.15915493667125701904296875;
    float _2349 = fma(_2321, _2073, _2339);
    float _2351 = _2343 * _2309;
    float _2353 = fma(_2337, _2257, _2257);
    float _2355 = fma(_2345, _2337, _2345);
    float _2357 = _2349 * 0.15915493667125701904296875;
    float _2359 = in.m_91.x;
    float _2361 = in.m_91.y;
    float _2363 = in.m_91.z;
    float _2365 = _1177 + (-0.5);
    float _2367 = _2357 * 6.283185482025146484375;
    float _2369 = sin(_2367);
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    int _2373 = as_type<int>(_2347);
    if (_2335)
    {
        _2371 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2375 = _2371;
    float _2377 = fma(_2365, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2353);
    if (_2335)
    {
        out.m_53.x = 0.0;
    }
    float _2379 = (*spvDescriptorSet0.vp_c9)._m0[191].z + (-1.0);
    float _2381 = fma(_2355, _2073, _2377);
    float _2383 = _2357 * 6.283185482025146484375;
    float _2385 = cos(_2383);
    float _2387 = fma(_2351, _2379, 1.0);
    float _2389 = _2381 * 0.15915493667125701904296875;
    float _2391 = _2347 * 6.283185482025146484375;
    float _2393 = sin(_2391);
    float _2395 = _2347 * 6.283185482025146484375;
    float _2397 = cos(_2395);
    if (_2335)
    {
        float _2399 = _2375 * 5.0;
        _2373 = as_type<int>(_2399);
    }
    int _2401 = _2373;
    if (_2335)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7571 = as_type<float>(_2401);
        out.gl_Position.z = _7571;
    }
    if (_2335)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2403 = _2389 * 6.283185482025146484375;
    float _2405 = cos(_2403);
    float _2407 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2409 = _2049 * _2247;
    float _2411 = _2387 * _2361;
    float _2413 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2415 = _2387 * _2363;
    float _2417 = _2387 * _2359;
    float _2419 = _2389 * 6.283185482025146484375;
    float _2421 = sin(_2419);
    float _2423 = _2407 * _2409;
    float _2425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2411);
    float _2427 = _2413 * _2409;
    float _2429 = _2393 * _2369;
    float _2431 = _2397 * _2385;
    float _2433 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2417);
    float _2435 = _2423 * _2425;
    float _2437 = _2397 * _2405;
    float _2439 = _2397 * _2369;
    float _2441 = _2369 * _2405;
    float _2443 = _2393 * _2385;
    float _2445 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2415);
    float _2447 = _2259 * _2433;
    float _2449 = _2437 * _2435;
    float _2451 = _2385 * _2405;
    float _2453 = fma(_2421, _2431, _2429);
    float _2455 = _2393 * _2405;
    float _2457 = -_2435;
    float _2459 = _2421 * _2457;
    float _2461 = _2427 * _2445;
    float _2463 = -_2443;
    float _2465 = fma(_2421, _2439, _2463);
    float _2467 = fma(_2453, _2447, _2449);
    float _2469 = -_2439;
    float _2471 = fma(_2421, _2443, _2469);
    float _2473 = fma(_2451, _2447, _2459);
    float _2475 = _2455 * _2435;
    float _2477 = fma(_2465, _2461, _2467);
    float _2479 = fma(_2421, _2429, _2431);
    float _2481 = fma(_2441, _2461, _2473);
    float _2483 = fma(_2471, _2447, _2475);
    float _2485 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2487 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2489 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2491 = fma(_2479, _2461, _2483);
    float _2493 = fma(_2481, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2485);
    float _2495 = fma(_2481, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2487);
    float _2497 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2499 = _2411 != 0.0;
    bool _2501 = isnan(_2411);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan(0.0);
    bool _2507 = _2503 || _2505;
    float _2509 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2493);
    float _2511 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2495);
    float _2513 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2497);
    float _2515 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2517 = _2509 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2519 = _2511 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2521 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2523 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2525 = _1359 + _2517;
    float _2527 = _1647 + _2519;
    float _2529 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2523);
    float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2533 = _2525 + _2531;
    float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2537 = _2527 + _2535;
    float _2539 = -_2421;
    float _2541 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2515);
    float _2543 = -_2421;
    float _2545 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2489);
    float _2547 = _2533 * _2533;
    bool _2549 = _2417 == 0.0;
    bool _2551 = !_2507;
    bool _2553 = _2549 && _2551;
    float _2555 = fma(_2537, _2537, _2547);
    float _2557 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2559 = fma(_2481, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2521);
    float _2561 = sqrt(_2555);
    float _2563 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2557);
    float _2565 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2559);
    float _2567 = in.m_93.x;
    float _2569 = in.m_93.y;
    float _2571 = in.m_93.z;
    float _2573 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2575 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2563);
    float _2577 = _2565 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2579 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2529);
    float _2581 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2513);
    float _2583 = -_2421;
    float _2585 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2573);
    float _2587 = _1121 + _2577;
    bool _2589 = _2561 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2591 = _2513;
    float _2593 = _2471;
    float _2595 = _2525;
    float _2597 = _2417;
    if (!_2589)
    {
        _2591 = _2525;
    }
    float _2599 = _2591;
    float _2601 = _2599;
    if (!_2589)
    {
        _2593 = _2527;
    }
    float _2603 = _2593;
    float _2605 = _2603;
    if (!_2589)
    {
        _2595 = _2587;
    }
    float _2607 = _2595;
    bool _2609 = !_2589;
    float _2611 = _2607;
    float _2613 = _2569;
    float _2615 = _2567;
    float _2617 = _2571;
    if (!_2609)
    {
        float _2619 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2623 = _2561 + _2621;
        float _2625 = rsqrt(_2555);
        float _2627 = _2623 * _2619;
        float _2629 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2631 = _2627 * 0.15915493667125701904296875;
        float _2633 = _2631 * 6.283185482025146484375;
        float _2635 = cos(_2633);
        float _2637 = _2631 * 6.283185482025146484375;
        float _2639 = sin(_2637);
        float _2641 = _2635 + (-1.0);
        float _2643 = _2641 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2645 = fma(_2639, _2629, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2647 = fma(_2587, _2635, _2643);
        float _2649 = _2625 * _2645;
        float _2651 = fma(_2537, _2649, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2653 = fma(_2533, _2649, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2611 = _2647;
        _2605 = _2651;
        _2601 = _2653;
    }
    float _2655 = _2611;
    float _2657 = _2605;
    float _2659 = _2601;
    bool _2661 = _2415 == 0.0;
    bool _2663 = _2661 && _2553;
    float _2665 = -_1939;
    float _2667 = _2665 + _2655;
    float _2669 = _2465 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2671 = _2465 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2673 = _2465 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2675 = -_1947;
    float _2677 = _2675 + _2657;
    float _2679 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2681 = _2667 + _2679;
    float _2683 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2669);
    float _2685 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2671);
    float _2687 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2673);
    float _2689 = _2681 * _2681;
    float _2691 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2585);
    float _2693 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2541);
    float _2695 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2545);
    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2699 = _2677 + _2697;
    float _2701 = -_1975;
    float _2703 = _2701 + _2659;
    if (!_2663)
    {
        float _2705 = fma(_2411, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2569);
        _2613 = _2705;
    }
    float _2707 = _2613;
    if (!_2663)
    {
        float _2709 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2567);
        _2615 = _2709;
    }
    float _2711 = _2615;
    float _2713 = fma(_2699, _2699, _2689);
    float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2717 = _2703 + _2715;
    float _2719 = _2691 * _2707;
    float _2721 = _2693 * _2707;
    float _2723 = _2695 * _2707;
    float _2725 = fma(_2717, _2717, _2713);
    float _2727 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2683);
    float _2729 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2685);
    float _2731 = fma(_2575, _2711, _2719);
    if (!_2663)
    {
        float _2733 = fma(_2415, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2571);
        _2617 = _2733;
    }
    float _2735 = _2617;
    float _2737 = fma(_2579, _2711, _2721);
    float _2739 = sqrt(_2725);
    float _2741 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2687);
    float _2743 = fma(_2581, _2711, _2723);
    float _2745 = fma(_2727, _2735, _2731);
    float _2747 = fma(_2729, _2735, _2737);
    float _2749 = fma(_2741, _2735, _2743);
    float _2751 = -_1947;
    float _2753 = _1647 + _2751;
    float _2755 = -_1939;
    float _2757 = _2755 + _1121;
    float _2759 = -_1975;
    float _2761 = _1359 + _2759;
    out.m_95.x = _2745;
    out.m_95.y = _2747;
    out.m_95.z = _2749;
    bool _2763 = _2739 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2765 = isnan(_2739);
    bool _2767 = _2763 || _2765;
    bool _2769 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2771 = _2767 || _2769;
    float _2773 = _2753;
    float _2775 = _2761;
    if (!_2771)
    {
        _2597 = 1.0;
    }
    float _2777 = _2597;
    bool _2779 = !_2771;
    float _2781 = _2777;
    if (!_2779)
    {
        bool _2783 = _2739 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2785 = isnan(_2739);
        bool _2787 = _2783 || _2785;
        bool _2789 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2791 = _2787 || _2789;
        if (!_2791)
        {
            float _2793 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2795 = _2739 + _2793;
            float _2797 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2799 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2797;
            float _2801 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2803 = _2801 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2805 = 1.0 / _2799;
            float _2807 = _2795 * _2805;
            float _2809 = fma(_2807, _2803, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2781 = _2809;
            _2811 = true;
        }
        else
        {
            bool _2813 = _2739 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2815 = isnan(_2739);
            bool _2817 = _2813 || _2815;
            bool _2819 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2821 = _2817 || _2819;
            if (!_2821)
            {
                float _2823 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2825 = _2739 + _2823;
                float _2827 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2829 = _2827 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2831 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2833 = _2831 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2835 = 1.0 / _2829;
                float _2837 = _2825 * _2835;
                float _2839 = fma(_2837, _2833, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2781 = _2839;
                _2811 = true;
            }
            else
            {
                _2781 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2811 = false;
    float _2841 = _2781;
    float _2843 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2845 = _2677 + _2843;
    float _2847 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2849 = _2703 + _2847;
    float _2851 = fma(_2845, _2841, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2853 = fma(_2849, _2841, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2857 = _2851 + _2855;
    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2861 = _2853 + _2859;
    float _2863 = fma(_2857, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2865 = fma(_2861, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _8373 = float2(_2863, _2865);
    float _2867 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_8373, float2(0.0), isnan(_8373)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_8373, float2(0.0), isnan(_8373)), level(0.0)).x;
    float _2869 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2871 = _2667 + _2869;
    float _2873 = -_2131;
    float _2875 = _2873 + _2753;
    float _2877 = -_2177;
    float _2879 = _2877 + _2761;
    float _2881 = -_2753;
    float _2883 = _2881 + _2851;
    float _2885 = fma(_2871, _2841, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2887 = -_2761;
    float _2889 = _2887 + _2853;
    float _2891 = -_2757;
    float _2893 = _2891 + _2885;
    float _2895 = _2893 * _2893;
    bool _2897 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2899 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2901 = _2897 || _2899;
    bool _2903 = isnan(0.5);
    bool _2905 = _2901 || _2903;
    float _2907 = fma(_2883, _2883, _2895);
    float _2909 = fma(_2889, _2889, _2907);
    float _2911 = sqrt(_2909);
    bool _2913 = _2911 > 0.0;
    bool _2915 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2917 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2919 = _2915 || _2917;
    bool _2921 = isnan(0.5);
    bool _2923 = _2919 || _2921;
    float _2925 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2927 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2929 = _2853;
    float _2931 = _2885;
    float _2933 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2935 = _2879;
    if (!_2913)
    {
        _2925 = _2851;
    }
    float _2937 = _2925;
    float _2939 = fma(_2867, 100.0, _2757);
    float _2941 = fma(_2867, 100.0, _2885);
    float _2943 = -_2129;
    float _2945 = _2943 + _2939;
    float _2947 = _2937;
    float _2949 = _2937;
    float _2951 = _2941;
    float _2953 = _2945;
    if (!_2913)
    {
        _2927 = _2941;
    }
    float _2955 = _2927;
    float _2957 = _2945 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2959 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2957);
    float _2961 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2959);
    float _2963 = _2961 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2965 = _2945 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2967 = 1.0 / _2963;
    float _2969 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2965);
    float _2971 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2969);
    float _2973 = _2971 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2975 = _2973 + _2963;
    float _2977 = _2975 * _2967;
    float _2979 = _2977 * 0.5;
    float _2981 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2983 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2981);
    float _2985 = 1.0 / _2983;
    bool _2987 = !_2913;
    float _2989 = _2955;
    if (!_2987)
    {
        float _2991 = _226 * _226;
        float _2993 = rsqrt(_2909);
        float _2995 = fma(_222, _222, _2991);
        float _2997 = fma(_228, _228, _2995);
        float _2999 = sqrt(_2997);
        float _3001 = _2883 * _2993;
        float _3003 = _2893 * _2993;
        float _3005 = _2889 * _2993;
        bool _3007 = _2999 > 0.0;
        float _3009 = _2999;
        _2931 = _2993;
        if (!_3007)
        {
            _2947 = _2851;
        }
        float _3011 = _2947;
        _2949 = _3011;
        if (!_3007)
        {
            _3009 = _2941;
        }
        float _3013 = _3009;
        bool _3015 = !_3007;
        _2989 = _3013;
        if (!_3015)
        {
            float _3017 = rsqrt(_2997);
            float _3019 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3021 = _226 * _3017;
            float _3023 = _222 * _3017;
            float _3025 = _3003 * _3021;
            float _3027 = _228 * _3017;
            float _3029 = fma(_3001, _3023, _3025);
            float _3031 = _3019 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3033 = fma(_3005, _3027, _3029);
            float _3035 = _3033 * _3031;
            float _3037 = fma(_222, _3035, _2851);
            float _3039 = fma(_226, _3035, _2941);
            float _3041 = fma(_228, _3035, _2853);
            _2949 = _3037;
            _2989 = _3039;
            _2929 = _3041;
            _2931 = _3023;
        }
    }
    float _3043 = _2949;
    float _3045 = _2989;
    float _3047 = _2929;
    float _3049 = _2931;
    float _3051 = -_2131;
    float _3053 = _3051 + _3043;
    float _3055 = -_2129;
    float _3057 = _3055 + _3045;
    float _3059 = -_2177;
    float _3061 = _3059 + _3047;
    float _3063 = _3049;
    float _3065 = _3057;
    float _3067 = _3053;
    float _3069 = _3061;
    if (_2905)
    {
        _3063 = 1.0;
    }
    float _3071 = _3063;
    float _3073 = _3071;
    if (!_2923)
    {
        float _3075 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3077 = _2945 + _3075;
        float _3079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3081 = _2875 + _3079;
        float _3083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3085 = -_2761;
        float _3087 = _3085 + _3047;
        float _3089 = _3077 * _3077;
        float _3091 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3093 = _2879 + _3091;
        float _3095 = -_2753;
        float _3097 = _3095 + _3043;
        float _3099 = -_2939;
        float _3101 = _3099 + _3045;
        float _3103 = fma(_3081, _3081, _3089);
        float _3105 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3107 = fma(_3093, _3093, _3103);
        float _3109 = sqrt(_3107);
        float _3111 = 1.0 / _2247;
        float _3113 = _3105 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3115 = precise::min(_3109, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3117 = _3115 * _3083;
        float _3119 = _3117 * _3111;
        float _3121 = _3113 * _3119;
        float _3123 = _3087 * _3119;
        float _3125 = fma(_3097, _3121, _2875);
        float _3127 = fma(_3101, _3121, _2945);
        float _3129 = fma(_3113, _3123, _2879);
        _2951 = _3113;
        _3065 = _3127;
        _3067 = _3125;
        _3069 = _3129;
    }
    float _3131 = _2951;
    float _3133 = _3065;
    float _3135 = _3067;
    float _3137 = _3069;
    float _3139 = _3131;
    if (_2905)
    {
        _2773 = 1.0;
    }
    float _3141 = _2773;
    float _3143 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3145 = _2985 * _3143;
    float _3147 = _3141;
    if (!_2905)
    {
        float _3149 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3151 = _3149 * 0.15915493667125701904296875;
        float _3153 = _3151 * 6.283185482025146484375;
        float _3155 = cos(_3153);
        float _3157 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3159 = _3157 * 0.15915493667125701904296875;
        float _3161 = _3151 * 6.283185482025146484375;
        float _3163 = sin(_3161);
        float _3165 = 1.0 / _3155;
        float _3167 = _3159 * 6.283185482025146484375;
        float _3169 = cos(_3167);
        float _3171 = _3163 * _3165;
        float _3173 = _3159 * 6.283185482025146484375;
        float _3175 = sin(_3173);
        float _3177 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3179 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3177;
        float _3181 = _3169 * _3171;
        float _3183 = 1.0 / _3181;
        float _3185 = 1.0 / _3179;
        float _3187 = _3175 * _3183;
        float _3189 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3191 = fma(_3145, _3187, _3189);
        float _3193 = _3191 * _3185;
        float _3195 = precise::clamp(_3193, 0.0, 1.0);
        _3139 = _3159;
        _3073 = _3195;
    }
    float _3197 = _3139;
    float _3199 = _3073;
    float _3201 = _3197;
    if (!_2905)
    {
        float _3203 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3205 = _3203 * 0.15915493667125701904296875;
        float _3207 = _3205 * 6.283185482025146484375;
        float _3209 = cos(_3207);
        float _3211 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3213 = _3211 * 0.15915493667125701904296875;
        float _3215 = _3205 * 6.283185482025146484375;
        float _3217 = sin(_3215);
        float _3219 = 1.0 / _3209;
        float _3221 = _3213 * 6.283185482025146484375;
        float _3223 = cos(_3221);
        float _3225 = _3217 * _3219;
        float _3227 = _3213 * 6.283185482025146484375;
        float _3229 = sin(_3227);
        float _3231 = _3223 * _3225;
        float _3233 = 1.0 / _3231;
        float _3235 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3237 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3235;
        float _3239 = 1.0 / _3237;
        float _3241 = _3229 * _3233;
        float _3243 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3245 = fma(_3145, _3241, _3243);
        float _3247 = _3245 * _3239;
        float _3249 = precise::clamp(_3247, 0.0, 1.0);
        float _3251 = -_3249;
        float _3253 = _3251 + 1.0;
        _3201 = _3209;
        _3147 = _3253;
    }
    float _3255 = _3201;
    float _3257 = _3147;
    float _3259 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3261 = _3133 + _3259;
    float _3263 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3265 = _3135 + _3263;
    float _3267 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3269 = _3137 + _3267;
    float _3271 = _3261 * _3261;
    float _3273 = fma(_3265, _3265, _3271);
    float _3275 = fma(_3269, _3269, _3273);
    float _3277 = rsqrt(_3275);
    float _3279 = _3277 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3281 = _3265 * _3279;
    float _3283 = _3269 * _3279;
    float _3285 = _3281 * _3281;
    float _3287 = _3283 * _3283;
    float _3289 = _3285 + _3287;
    float _3291 = sqrt(_3289);
    bool _3293 = _3291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3295 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3297 = _3291 + _3295;
    float _3299 = _3277;
    float _3301 = _3289;
    float _3303 = _3297;
    float _3305 = _3261;
    if (_3293)
    {
        float _3307 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3299 = _3307;
    }
    float _3309 = _3299;
    if (_3293)
    {
        float _3311 = rsqrt(_3289);
        _3301 = _3311;
    }
    float _3313 = _3301;
    float _3315 = _3313;
    if (_3293)
    {
        float _3317 = _3297 * _3309;
        _3303 = _3317;
    }
    float _3319 = _3303;
    if (_3293)
    {
        float _3321 = _3319 * 0.15915493667125701904296875;
        _2775 = _3321;
    }
    float _3323 = _2775;
    float _3325 = _3255;
    float _3327 = _3323;
    if (_3293)
    {
        float _3329 = _3323 * 6.283185482025146484375;
        float _3331 = sin(_3329);
        _3325 = _3331;
    }
    float _3333 = _3325;
    float _3335 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3337 = precise::max(0.0, _3335);
    float _3339 = _3269;
    float _3341 = _3337;
    float _3343 = _3335;
    if (_3293)
    {
        float _3345 = _3323 * 6.283185482025146484375;
        float _3347 = cos(_3345);
        _3339 = _3347;
    }
    float _3349 = _3339;
    float _3351 = -_3279;
    float _3353 = -_3337;
    float _3355 = fma(_3261, _3351, _3353);
    float _3357 = _3355;
    if (!_3293)
    {
        _3305 = _3285;
    }
    float _3359 = _3305;
    float _3361 = _3359;
    if (_3293)
    {
        float _3363 = _3355 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3341 = _3363;
    }
    float _3365 = _3341;
    float _3367 = _3365;
    if (!_3293)
    {
        _3327 = _3281;
    }
    float _3369 = _3327;
    float _3371 = _3333;
    float _3373 = _3369;
    if (_3293)
    {
        float _3375 = fma(_3333, _3365, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3371 = _3375;
    }
    float _3377 = _3371;
    float _3379 = _3349;
    if (_3293)
    {
        float _3381 = _3349 + (-1.0);
        _3343 = _3381;
    }
    float _3383 = _3343;
    if (_3293)
    {
        float _3385 = _3313 * _3377;
        _2933 = _3385;
    }
    float _3387 = _2933;
    if (!_3293)
    {
        _3315 = _3283;
    }
    float _3389 = _3315;
    float _3391 = _3389;
    if (_3293)
    {
        float _3393 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3367 = _3393;
    }
    float _3395 = _3367;
    if (_3293)
    {
        float _3397 = _3281 * _3387;
        _3373 = _3397;
    }
    float _3399 = _3373;
    float _3401 = sqrt(_3275);
    if (_3293)
    {
        float _3403 = _3283 * _3387;
        _3391 = _3403;
    }
    float _3405 = _3391;
    if (_3293)
    {
        float _3407 = fma(_3355, _3349, _3395);
        _3357 = _3407;
    }
    float _3409 = _3357;
    if (_3293)
    {
        float _3411 = _3399 * _3399;
        _3361 = _3411;
    }
    float _3413 = _3361;
    if (!_3293)
    {
        _3379 = _3287;
    }
    float _3415 = _3379;
    float _3417 = _3415;
    if (_3293)
    {
        float _3419 = _3405 * _3405;
        _3417 = _3419;
    }
    float _3421 = _3417;
    float _3423 = fma(_3409, _3409, _3413);
    float _3425 = _3133 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3427 = _3133 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3429 = _3423 + _3421;
    float _3431 = fma(_3135, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3425);
    float _3433 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3435 = rsqrt(_3429);
    float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3439 = fma(_3401, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3437);
    float _3441 = precise::clamp(_3439, 0.0, 1.0);
    float _3443 = fma(_3137, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3431);
    float _3445 = fma(_2879, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3447 = _3133 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3449 = -_3441;
    float _3451 = _3449 + 1.0;
    float _3453 = _3443 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3455 = fma(_3135, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3447);
    float _3457 = abs(_3451);
    float _3459 = log2(_3457);
    float _3461 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3463 = fma(_3135, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3427);
    float _3465 = fma(_2875, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3467 = -_3461;
    float _3469 = fma(_3467, _3433, 1.0);
    float _3471 = _3133 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3473 = _3435 * _3399;
    float _3475 = _3435 * _3409;
    float _3477 = _3435 * _3405;
    float _3479 = fma(_3135, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3471);
    float _3481 = fma(_3137, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3455);
    float _3483 = _3473 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3485 = floor(_3465);
    float _3487 = fma(_3137, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3479);
    float _3489 = _3481 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3491 = -_3483;
    float _3493 = fma(_3475, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3491);
    float _3495 = fma(_3137, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3463);
    float _3497 = _3487 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3499 = _3489 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3501 = -_3477;
    float _3503 = fma(_3501, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3493);
    float _3505 = floor(_3445);
    float _3507 = _3459 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3509 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3499);
    float _3511 = _3495 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3513 = fma(_3503, -0.5, 0.5);
    float _3515 = fma(_3503, 0.5, 0.5);
    float _3517 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3509);
    float _3519 = exp2(_3507);
    float _3521 = -_3485;
    float _3523 = _3465 + _3521;
    float _3525 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3517);
    float _3527 = _3489 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3529 = sqrt(_3513);
    float _3531 = _3489 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3533 = -_3505;
    float _3535 = _3445 + _3533;
    float _3537 = fma(_3515, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3539 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3527);
    float _3541 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3531);
    float _3543 = _3475 + 1.0;
    float _3545 = fma(_3515, _3537, -0.212114393711090087890625);
    float _3547 = log2(_3469);
    float _3549 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3539);
    float _3551 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3541);
    float _3553 = -_3475;
    float _3555 = fma(_3519, _3543, _3553);
    float _3557 = 1.0 / _3525;
    float _3559 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3549);
    float _3561 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3551);
    float _3563 = _3529 * 0.636619746685028076171875;
    float2 _9455 = float2(_3523, _3535);
    float _3565 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9455, float2(0.0), isnan(_9455)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9455, float2(0.0), isnan(_9455)), level(0.0)).x;
    float _3567 = fma(_3515, _3545, 1.570728778839111328125);
    float _3569 = _3547 * 0.693147182464599609375;
    float _3571 = -_3567;
    float _3573 = fma(_3563, _3571, 1.0);
    float _3575 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3577 = fma(_3555, 0.5, 0.5);
    float _3579 = _3559 * _3557;
    float _3581 = _3561 * _3557;
    float _3583 = fma(_3579, 0.5, 0.5);
    float _3585 = fma(_3581, -0.5, 0.5);
    float3 _9492 = float3(_3583, _3585, _3575);
    float _3587 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9492, float3(0.0), isnan(_9492)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9492, float3(0.0), isnan(_9492)), level(0.0)).x;
    float3 _9503 = float3(_3583, _3585, _3575);
    float4 _3590 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9503, float3(0.0), isnan(_9503)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9503, float3(0.0), isnan(_9503)), level(0.0)).xyzw;
    float _3592 = _3590.x;
    float _3594 = _3590.y;
    float _3596 = _3590.z;
    float _3598 = _3590.w;
    float2 _9519 = float2(_3573, _3577);
    float3 _3602 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9519, float2(0.0), isnan(_9519)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9519, float2(0.0), isnan(_9519)), level(0.0)).xyz;
    float _3604 = _3602.x;
    float _3606 = _3602.y;
    float _3608 = _3602.z;
    float _3610 = abs(_3145);
    float _3612 = log2(_3610);
    float _3614 = _3459 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3616 = in.m_77.x;
    bool _3618 = _3401 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3620 = isnan(_3401);
    bool _3622 = _3618 || _3620;
    bool _3624 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3626 = _3622 || _3624;
    float _3628 = exp2(_3614);
    bool _3630 = _3145 <= 8000.0;
    bool _3632 = isnan(_3145);
    bool _3634 = _3630 || _3632;
    bool _3636 = isnan(8000.0);
    bool _3638 = _3634 || _3636;
    float _3640 = float(_3638);
    out.m_97.x = _2875;
    out.m_97.y = _2945;
    out.m_97.z = _2879;
    out.m_99.x = _3135;
    out.m_99.y = _3133;
    out.m_99.z = _3137;
    float _3642 = _3612 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3644 = exp2(_3642);
    float _3646 = _3559;
    if (!_3626)
    {
        _2935 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3648 = _2935;
    float _3650 = -_3628;
    float _3652 = _3650 + 1.0;
    float _3654 = _3652;
    float _3656 = _3648;
    float _3658 = _3648;
    if (!_3626)
    {
        _2953 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3660 = _2953;
    float _3662 = fma(_3644, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3664 = precise::clamp(_3662, 0.0, 1.0);
    float _3666 = fma(_3664, -2.0, 3.0);
    float _3668 = _3664 * _3664;
    float _3670 = _3489 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3672 = _3668 * _3666;
    float _3674 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3670);
    float _3676 = -_3672;
    float _3678 = _3676 + 1.0;
    float _3680 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3674);
    float _3682 = _3559 + _3525;
    float _3684 = fma(_3678, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3672);
    float _3686 = _3525 * 0.5;
    float _3688 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3680);
    float _3690 = _3682 * 0.5;
    float _3692 = _3640 * _3684;
    float _3694 = fma(_3561, -0.5, _3686);
    float _3696 = _3652 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3698 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3700 = _3688 + _3525;
    out.gl_Position.x = _3559;
    out.gl_Position.y = _3561;
    out.gl_Position.z = _3688;
    out.gl_Position.w = _3525;
    float _3702 = _3660;
    float _3704 = _3660;
    if (!_3626)
    {
        _3654 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3706 = _3654;
    float _3708 = _3700 * 0.5;
    out.m_101.x = _3690;
    out.m_101.y = _3694;
    out.m_101.z = _3708;
    out.m_101.w = _3525;
    float _3710 = _3706;
    float _3712 = _3706;
    if (!_3626)
    {
        _3646 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3714 = _3646;
    float _3716 = -_3565;
    float _3718 = _3716 + 1.0;
    float _3720 = _3718 * _3698;
    float _3722 = precise::clamp(_3720, 0.0, 1.0);
    float _3724 = -_3722;
    float _3726 = fma(_3724, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3728 = _3726 * _3616;
    float _3730 = _3728 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3732 = _3728;
    float _3734 = _3714;
    float _3736 = _3714;
    if (!_3626)
    {
        _3732 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3738 = _3732;
    float _3740 = _3696 * _3587;
    float _3742 = -_3696;
    float _3744 = _3742 + 1.0;
    out.m_103.x = _3730;
    float _3746 = _3598 * _3740;
    float _3748 = _3608 * _3740;
    float _3750 = _3598 * _3744;
    float _3752 = fma(_3604, _3746, _3592);
    float _3754 = fma(_3606, _3746, _3594);
    float _3756 = fma(_3598, _3748, _3596);
    float _3758 = _3199 * _3257;
    out.m_105.x = _3752;
    out.m_105.y = _3754;
    out.m_105.z = _3756;
    out.m_105.w = _3750;
    float _3760 = _3758 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3762 = _3758;
    float _3764 = _3738;
    float _3766 = _3738;
    if (!_3626)
    {
        _3762 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3768 = _3762;
    bool _3770 = !_3626;
    float _3772 = _3768;
    float _3774 = _3768;
    if (!_3770)
    {
        bool _3776 = _3401 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3778 = isnan(_3401);
        bool _3780 = _3776 || _3778;
        bool _3782 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3784 = _3780 || _3782;
        if (!_3784)
        {
            float _3786 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3788 = _3401 + _3786;
            float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3792 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3790;
            float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3796 = _3794 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3798 = 1.0 / _3792;
            float _3800 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3802 = _3800 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3804 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3806 = _3804 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3810 = _3808 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3814 = _3812 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3816 = _3788 * _3798;
            float _3818 = precise::clamp(_3816, 0.0, 1.0);
            float _3820 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3822 = _3820 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3824 = fma(_3818, _3796, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3826 = fma(_3818, _3822, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3828 = fma(_3818, _3802, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3830 = fma(_3818, _3806, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3832 = fma(_3818, _3810, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3834 = fma(_3818, _3814, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3736 = _3828;
            _3704 = _3832;
            _3712 = _3824;
            _3658 = _3830;
            _3766 = _3826;
            _3774 = _3834;
            _3836 = true;
        }
        else
        {
            bool _3838 = _3401 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3840 = isnan(_3401);
            bool _3842 = _3838 || _3840;
            bool _3844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3846 = _3842 || _3844;
            if (!_3846)
            {
                _3710 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3848 = _3710;
            _3712 = _3848;
            if (!_3846)
            {
                _3734 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3850 = _3734;
            _3736 = _3850;
            if (!_3846)
            {
                _3764 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3852 = _3764;
            _3766 = _3852;
            if (!_3846)
            {
                _3656 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3854 = _3656;
            _3658 = _3854;
            if (!_3846)
            {
                _3702 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3856 = _3702;
            _3704 = _3856;
            if (!_3846)
            {
                _3772 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3858 = _3772;
            bool _3860 = !_3846;
            _3774 = _3858;
            if (!_3860)
            {
                bool _3862 = _3401 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3864 = isnan(_3401);
                bool _3866 = _3862 || _3864;
                bool _3868 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3870 = _3866 || _3868;
                if (!_3870)
                {
                    float _3872 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3874 = _3401 + _3872;
                    float _3876 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3878 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3876;
                    float _3880 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3884 = 1.0 / _3878;
                    float _3886 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3888 = _3886 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3892 = _3890 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3896 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3902 = _3874 * _3884;
                    float _3904 = precise::clamp(_3902, 0.0, 1.0);
                    float _3906 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3908 = _3906 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3910 = fma(_3904, _3882, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3912 = fma(_3904, _3908, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3914 = fma(_3904, _3888, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3916 = fma(_3904, _3892, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3918 = fma(_3904, _3896, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3920 = fma(_3904, _3900, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3736 = _3914;
                    _3704 = _3918;
                    _3712 = _3910;
                    _3658 = _3916;
                    _3766 = _3912;
                    _3774 = _3920;
                    _3836 = true;
                }
                else
                {
                    _3736 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3704 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3712 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3658 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3766 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3774 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3836 = false;
    float _3922 = _3736;
    float _3924 = _3704;
    float _3926 = _3712;
    float _3928 = _3658;
    float _3930 = _3766;
    float _3932 = _3774;
    float _3934 = fma(_2747, -0.5, 0.5);
    float _3936 = precise::clamp(_3934, 0.0, 1.0);
    float _3938 = -_3922;
    float _3940 = _3938 + _3924;
    float _3942 = _3760 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3944 = -_3926;
    float _3946 = _3944 + _3928;
    out.m_107.x = 0.0;
    float _3948 = fma(_3936, _3940, _3922);
    float _3950 = fma(_3936, _3946, _3926);
    out.m_53.x = _3942;
    float _3952 = -_3930;
    float _3954 = _3952 + _3932;
    float _3956 = _3948 * 0.586610972881317138671875;
    bool _3958 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3960 = fma(_3936, _3954, _3930);
    float _3962 = fma(_3950, 0.298911988735198974609375, _3956);
    bool _3964 = _3199 > 0.0;
    bool _3966 = isnan(_3199);
    bool _3968 = _3964 || _3966;
    bool _3970 = isnan(0.0);
    bool _3972 = _3968 || _3970;
    float _3974 = fma(_3960, 0.114477999508380889892578125, _3962);
    bool _3976 = _3257 <= 0.0;
    bool _3978 = !_3972;
    bool _3980 = _3976 || _3978;
    float _3982 = -_3974;
    float _3984 = _3950 + _3982;
    float _3986 = -_3974;
    float _3988 = _3948 + _3986;
    float _3990 = -_3974;
    float _3992 = _3960 + _3990;
    float _3994 = fma(_3984, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3974);
    float _3996 = fma(_3988, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3974);
    float _3998 = fma(_3992, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3974);
    bool _4000 = !_3958;
    if (!_4000)
    {
        float _4002 = -_3133;
        float _4004 = _4002 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4006 = -_3135;
        float _4008 = _4006 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4010 = -_3137;
        float _4012 = _4010 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4014 = _4004 * _4004;
        float _4016 = fma(_4008, _4008, _4014);
        float _4018 = fma(_4012, _4012, _4016);
        float _4020 = sqrt(_4018);
        float _4022 = rsqrt(_4018);
        float _4024 = -_4020;
        float _4026 = _4024 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4028 = _4026 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4030 = precise::clamp(_4028, 0.0, 1.0);
        float _4032 = _4008 * _4022;
        float _4034 = _4004 * _4022;
        float _4036 = abs(_4030);
        float _4038 = log2(_4036);
        float _4040 = _4012 * _4022;
        float _4042 = _4032 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4044 = _2747 * _4034;
        float _4046 = -_4034;
        float _4048 = -_4042;
        float _4050 = fma(_4046, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4048);
        float _4052 = fma(_2745, _4032, _4044);
        float _4054 = -_4040;
        float _4056 = fma(_4054, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4050);
        float _4058 = fma(_2749, _4040, _4052);
        float _4060 = precise::clamp(_4058, 0.0, 1.0);
        float _4062 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4064 = _4056 + _4062;
        float _4066 = _4038 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4068 = _4064 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4070 = precise::clamp(_4068, 0.0, 1.0);
        float _4072 = exp2(_4066);
        float _4074 = _4072 * _4070;
        float _4076 = _4060 * _4074;
        float _4078 = _4076 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4080 = _4076 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4082 = _4076 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _4078;
        out.m_107.y = _4080;
        out.m_107.z = _4082;
    }
    out.m_79.x = _3994;
    out.m_79.y = _3996;
    out.m_79.z = _3998;
    if (!_3980)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _4084 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4084;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3836 = false;
    bool _2811 = false;
    bool _734 = false;
    bool _630 = false;
    bool _488 = false;
    bool _254 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_50.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_53.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4141 = as_type<float>(_142);
        out.gl_Position.z = _4141;
    }
    if (!_130)
    {
        return out;
    }
    float _146 = in.m_55.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_53.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4211 = as_type<float>(_180);
        out.gl_Position.z = _4211;
    }
    if (_172)
    {
        return out;
    }
    float _182 = in.m_57.x;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = in.m_57.y;
    float _188 = in.m_59.x;
    float _190 = in.m_59.y;
    float _192 = in.m_59.z;
    float _194 = in.m_61.x;
    float _196 = in.m_61.y;
    float _198 = in.m_61.z;
    float _200 = in.m_63.x;
    float _202 = in.m_63.y;
    float _204 = in.m_63.z;
    float _206 = in.m_65.x;
    float _208 = in.m_65.y;
    float _210 = in.m_65.z;
    out.m_67.x = _182;
    out.m_67.y = _186;
    float _212 = _190 * _196;
    float _214 = _190 * _202;
    float _216 = fma(_188, _194, _212);
    float _218 = _190 * _208;
    float _220 = fma(_188, _200, _214);
    float _222 = fma(_192, _198, _216);
    float _224 = fma(_188, _206, _218);
    float _226 = fma(_192, _204, _220);
    float _228 = fma(_192, _210, _224);
    bool _230 = !_184;
    float _232 = _186;
    float _234 = _182;
    float _252;
    if (!_230)
    {
        float _236 = in.m_69.x;
        float _238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _240 = _236 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _242 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _244 = _242 * _238;
        float _246 = floor(_244);
        float _248 = -_246;
        float _250 = _244 + _248;
        _252 = _250;
        _254 = true;
    }
    else
    {
        float _256 = float(_126);
        float _258 = 1.0 / _256;
        float _260 = _160 * _258;
        _252 = _260;
    }
    _254 = false;
    float _262 = _252;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = _262 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _262 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = _262 + _284;
    float _288 = 1.0 / _274;
    bool _290 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _292 = isnan(_262);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    bool _302 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_262);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    bool _314 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_262);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _328 = 1.0 / _278;
    float _330 = 1.0 / _282;
    float _332 = _266 * _288;
    bool _334 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _336 = isnan(_262);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _350 = -_344;
    float _352 = _350 + 1.0;
    float _354 = _270 * _328;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _356;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _360;
    float _364 = -_312;
    float _366 = _364 + 1.0;
    float _368 = fma(_362, _332, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _374 = _286 * _330;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    float _380 = fma(_358, _332, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = _324 * _366;
    float _388 = fma(_378, _332, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _390 = _300 * _352;
    float _392 = -_300;
    float _394 = _392 + 1.0;
    float _396 = fma(_372, _354, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _398 = _380 * _386;
    float _400 = _312 * _394;
    float _402 = fma(_348, _354, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _404 = fma(_384, _354, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _406 = in.m_71.x;
    float _408 = in.m_71.y;
    float _410 = in.m_71.z;
    float _412 = _368 * _386;
    float _414 = -_324;
    float _416 = _414 + 1.0;
    float _418 = _388 * _386;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _424;
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _398);
    float _430 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _412);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _432;
    float _436 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _418);
    float _438 = fma(_426, _374, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _440 = fma(_422, _374, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _442 = fma(_434, _374, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = fma(_402, _400, _428);
    float _446 = fma(_404, _400, _430);
    float _448 = fma(_396, _400, _436);
    float _450 = fma(_438, _390, _444);
    float _452 = fma(_440, _390, _446);
    float _454 = fma(_442, _390, _448);
    float _456 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].x, _450);
    float _458 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].y, _452);
    float _460 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].z, _454);
    float _462 = _456 * _406;
    float _464 = _458 * _408;
    float _466 = _460 * _410;
    bool _468 = !_326;
    float _486;
    if (!_468)
    {
        float _470 = in.m_69.x;
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _474 = _470 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _476 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _478 = _476 * _472;
        float _480 = floor(_478);
        float _482 = -_480;
        float _484 = _478 + _482;
        _486 = _484;
        _488 = true;
    }
    else
    {
        float _490 = float(_126);
        float _492 = 1.0 / _490;
        float _494 = _160 * _492;
        _486 = _494;
    }
    _488 = false;
    float _496 = _486;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _500 = _496 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _506 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _508 = isnan(_496);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _522 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _524 = isnan(_496);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _534;
    bool _538 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _540 = isnan(_496);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = 1.0 / _504;
    float _552 = -_516;
    float _554 = _552 + 1.0;
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _558 = 1.0 / _520;
    float _560 = _536 * _550;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _566 = -_548;
    float _568 = _566 + 1.0;
    float _570 = fma(_560, _500, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _572 = _532 * _554;
    float _574 = -_532;
    float _576 = _574 + 1.0;
    float _578 = _516 * _568;
    float _580 = _564 * _558;
    float _582 = _570 * _572;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _586 = _496 + _584;
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    float _590 = fma(_580, _586, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _594 = fma(_590, _578, _588);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _598 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _602 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[117].x, _594);
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _598;
    out.m_73.y = _604;
    out.m_73.z = _606;
    out.m_73.w = _608;
    bool _610 = !_556;
    float _628;
    if (!_610)
    {
        float _612 = in.m_69.x;
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        float _632 = float(_126);
        float _634 = 1.0 / _632;
        float _636 = _160 * _634;
        _628 = _636;
    }
    _630 = false;
    float _638 = _628;
    bool _640 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _642 = isnan(_638);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _656 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _658 = isnan(_638);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _674 = _638 + _672;
    float _676 = -_650;
    float _678 = _676 + 1.0;
    float _680 = 1.0 / _654;
    bool _682 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _684 = _666 * _678;
    float _686 = -_666;
    float _688 = _686 + 1.0;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _692 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _670 * _680;
    float _696 = fma(_694, _674, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _698 = _696 * _684;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _704 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[131].x, _698);
    float _706 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[132].x, _704);
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _706 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _708;
    out.m_75.y = _710;
    out.m_75.z = _692;
    out.m_75.w = _712;
    bool _714 = !_682;
    float _732;
    if (!_714)
    {
        float _716 = in.m_69.x;
        float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _720 = _716 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[14].x, _160);
        float _724 = _722 * _718;
        float _726 = floor(_724);
        float _728 = -_726;
        float _730 = _724 + _728;
        _732 = _730;
        _734 = true;
    }
    else
    {
        float _736 = float(_126);
        float _738 = 1.0 / _736;
        float _740 = _160 * _738;
        _732 = _740;
    }
    _734 = false;
    float _742 = _732;
    float _744 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _746 = int(_744);
    float _748 = float(_126);
    float _750 = in.m_61.w;
    float _752 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _754 = in.m_65.w;
    float _756 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _758 = int(_756);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _768 = 1.0 / _748;
    float _770 = float(_746);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _772;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _784 = 1.0 / _770;
    float _786 = float(uint(_758));
    int _788 = ~_758;
    int _790 = _788 + 1;
    int _792 = ~_758;
    int _794 = _792 + 1;
    int _796 = ~_758;
    int _798 = _796 + 1;
    float _800 = 1.0 / _786;
    float _802 = _784 * _160;
    float _804 = 1.0 / _762;
    int _806 = as_type<int>(_800) + (-2);
    float _808 = trunc(_802);
    int _810 = int(_808);
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _814 = _812 != 0;
    float _816 = 1.0 / _782;
    bool _818 = !_814;
    float _820 = _818 ? 7.345489978790283203125 : 1.0;
    float _822 = float(uint(_810));
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _826 = as_type<float>(_806) * _822;
    float _828 = trunc(_826);
    float _830 = precise::max(_828, 0.0);
    uint _833 = uint(_830);
    float _835 = _824 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _837 = float(_758);
    int _839 = _790 * int(_833);
    int _841 = _839 + _810;
    float _843 = float(uint(_841));
    float _845 = in.m_69.x;
    float _847 = as_type<float>(_806) * _843;
    float _849 = trunc(_847);
    float _851 = precise::max(_849, 0.0);
    uint _853 = uint(_851);
    float _855 = _820 * _845;
    int _857 = int(_833) + int(_853);
    float _859 = float(_810);
    float _861 = 0.0;
    if (_814)
    {
        _861 = _845;
    }
    float _863 = _861;
    int _865 = _794 * _857;
    int _867 = _865 + _810;
    bool _869 = _859 >= _837;
    bool _871 = isnan(_859);
    bool _873 = _869 || _871;
    bool _875 = isnan(_837);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = floor(_855);
    bool _883 = uint(_867) >= uint(_758);
    bool _885 = !_883;
    int _887 = _885 ? 0 : (-1);
    float _889 = trunc(_879);
    int _891 = int(_889);
    bool _893 = _758 == 0;
    int _895 = ~_857;
    int _897 = _895 + _887;
    int _899 = _897 + 1;
    int _901 = _758 * _899;
    int _903 = _901 + _810;
    float _905 = -_881;
    float _907 = _855 + _905;
    int _909 = _758 + (-1);
    float _911 = _907 * _837;
    bool _913 = !_893;
    int _915 = _913 ? _903 : (-1);
    float _917 = _837 * _160;
    int _919 = ~_891;
    int _921 = _919 + 1;
    int _923 = _921 + 1;
    float _925 = trunc(_911);
    int _927 = int(_925);
    int _929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _931 = _929 != 0;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _935 = _933 != 0;
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _939 = _937 != 0;
    float _941 = _917 * _768;
    int _943 = _915 * _923;
    bool _945 = !_935;
    int _947 = _945 ? 0 : 1;
    float _949 = trunc(_941);
    int _951 = int(_949);
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _955 = _953 != 0;
    int _957 = _891 * _909;
    int _959 = _957 + _943;
    bool _961 = !_931;
    int _963 = _961 ? 0 : 1;
    bool _965 = !_955;
    int _967 = _965 ? 0 : 1;
    int _969 = abs(_947);
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _973 = _971 != 0;
    bool _975 = !_939;
    int _977 = _975 ? 0 : 1;
    int _979 = _959 * _969;
    int _981 = abs(_963);
    int _983 = abs(_967);
    bool _985 = !_973;
    int _987 = _985 ? 0 : 1;
    int _989 = abs(_977);
    int _991 = _927 * _983;
    int _993 = _991 + _810;
    int _995 = abs(_987);
    int _997 = _951 * _981;
    int _999 = _997 + _979;
    float _1001 = in.m_50.x;
    float _1003 = in.m_50.y;
    int _1005 = _993 * _989;
    int _1007 = _1005 + _999;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1015 = _1013 != 0;
    int _1017 = _927 * _995;
    int _1019 = _1017 + _1007;
    int _1021 = ~_758;
    int _1023 = _1021 + 1;
    float _1025 = in.m_77.y;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1029 = _1027 != 0;
    float _1031 = float(uint(_1019));
    float _1033 = as_type<float>(_806) * _1031;
    int _1035 = _999;
    bool _1037 = _973;
    float _1039 = _863;
    if (_1011)
    {
        float _1041 = -_182;
        float _1043 = _1041 + 1.0;
        _1035 = as_type<int>(_1043);
    }
    int _1045 = _1035;
    if (_1011)
    {
        bool _1047 = _845 > 0.5;
        _1037 = _1047;
    }
    bool _1049 = _1037;
    float _1051 = trunc(_1033);
    float _1053 = precise::max(_1051, 0.0);
    uint _1055 = uint(_1053);
    float _1057 = 0.0;
    if (!_1029)
    {
        _1057 = _182;
    }
    float _1059 = _1057;
    float _1061 = _208 * _1003;
    float _1063 = _202 * _1003;
    float _1065 = _845 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1067 = in.m_69.y;
    float _1069 = fma(_200, _1001, _1063);
    float _1071 = -_764;
    float _1073 = fma(_1065, 2.0, _1071);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1079 = _1023 * int(_1055);
    int _1081 = _1079 + _1019;
    float _1083 = 1.0 / _1077;
    float _1085 = float(uint(_1081));
    float _1087 = as_type<float>(_1081);
    float _1089 = _1059;
    if (!_1011)
    {
        _1087 = _182;
    }
    float _1091 = _1087;
    float _1093 = _1091;
    if (_1011)
    {
        float _1095 = _1049 ? as_type<float>(_1045) : _182;
        _1093 = _1095;
    }
    float _1097 = _1093;
    float _1099 = as_type<float>(_806) * _1085;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1103 = _1101 != 0;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1105;
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1111 = _1109 != 0;
    float _1113 = _196 * _1003;
    float _1115 = trunc(_1099);
    float _1117 = precise::max(_1115, 0.0);
    uint _1119 = uint(_1117);
    float _1121 = _1003 + _1025;
    float _1123 = fma(_194, _1001, _1113);
    float _1125 = fma(_206, _1001, _1061);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1131 = float(uint(_993));
    float _1133 = _1107 * _804;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1139 = 1.0 / _1129;
    float _1141 = -_186;
    float _1143 = _1141 + 1.0;
    float _1145 = as_type<float>(_806) * _1131;
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1149 = _1147 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1151 = !_1103;
    int _1153 = _1151 ? 0 : 1;
    float _1155 = _1149 * _1083;
    int _1157 = int(_1055) + int(_1119);
    float _1159 = 1.0 / _1137;
    float _1161 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1163 = _798 * _1157;
    int _1165 = _1163 + _1019;
    float _1167 = fma(_1161, -2.0, _766);
    float _1169 = _778 * _1139;
    float _1171 = trunc(_1145);
    float _1173 = precise::max(_1171, 0.0);
    uint _1175 = uint(_1173);
    float _1177 = in.m_69.z;
    bool _1179 = uint(_1165) >= uint(_758);
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1189 = in.m_50.z;
    bool _1191 = !_1179;
    int _1193 = _1191 ? 0 : (-1);
    bool _1195 = _1067 > 0.5;
    float _1197 = _774 * _1159;
    int _1199 = ~_1157;
    int _1201 = _1199 + _1193;
    int _1203 = _1201 + 1;
    float _1205 = 1.0 / _1183;
    int _1207 = _1195 ? as_type<int>(_1143) : as_type<int>(_186);
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1209;
    int _1213 = _758 * _1203;
    int _1215 = _1213 + _1019;
    int _1217 = ~_758;
    int _1219 = _1217 + 1;
    float _1221 = _1211 * _816;
    float _1223 = _1015 ? as_type<float>(_1207) : _186;
    float _1225 = 1.0 / _1187;
    bool _1227 = !_893;
    int _1229 = _1227 ? _1215 : (-1);
    int _1231 = _1219 * int(_1175);
    int _1233 = _1231 + _993;
    float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1237 = _1235 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1239 = ~_758;
    int _1241 = _1239 + 1;
    bool _1243 = _1177 > 0.5;
    int _1245 = _1229 & 3;
    bool _1247 = _1245 != 0;
    float _1249 = _1237 * _1205;
    if (_1111)
    {
        float _1251 = _1243 ? _1143 : _186;
        _232 = _1251;
    }
    float _1253 = _232;
    float _1255 = fma(_204, _1189, _1069);
    bool _1257 = uint(_1245) > 1u;
    float _1259 = _845 * 2.0;
    float _1261 = float(uint(_1233));
    float _1263 = fma(_835, _1253, -0.5);
    int _1265 = _1229 & 3;
    bool _1267 = _1265 != 0;
    float _1269 = as_type<float>(_806) * _1261;
    int _1271 = _1267 ? 0 : 1;
    float _1273 = floor(_1259);
    bool _1275 = uint(_1245) >= 2u;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1277;
    int _1281 = ~_1271;
    int _1283 = _1281 + 1;
    int _1285 = _1283 + 1;
    float _1287 = _1067 * 2.0;
    int _1289 = _1285;
    float _1291 = _1287;
    if (!_1257)
    {
        int _1293 = ~_1271;
        int _1295 = _1293 + 1;
        _1289 = _1295;
    }
    int _1297 = _1289;
    float _1299 = _1279 * _1225;
    int _1301 = _1275 ? 0 : 1;
    float _1303 = trunc(_1269);
    float _1305 = precise::max(_1303, 0.0);
    uint _1307 = uint(_1305);
    bool _1309 = _1067 > 0.5;
    bool _1311 = _1309 && _1029;
    float _1313 = fma(_198, _1189, _1123);
    bool _1315 = _1245 != 3;
    float _1317 = fma(_210, _1189, _1125);
    float _1319 = _1067 + _1177;
    if (!_814)
    {
        _1039 = _1177;
    }
    float _1321 = _1039;
    float _1323 = _845 + _1067;
    float _1325 = floor(_1287);
    int _1327 = ~_1301;
    int _1329 = _1327 + 1;
    int _1331 = _1329 + 1;
    float _1333 = _1319 + (-1.0);
    bool _1335 = !_1247;
    int _1337 = _1335 ? 0 : 1;
    float _1339 = _1323 + (-1.0);
    int _1341 = _1331;
    if (_1311)
    {
        float _1343 = -_182;
        float _1345 = _1343 + 1.0;
        _234 = _1345;
    }
    float _1347 = _234;
    bool _1349 = _1273 >= 0.0;
    bool _1351 = isnan(_1273);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan(0.0);
    bool _1357 = _1353 || _1355;
    float _1359 = _1317 + _754;
    int _1361 = int(_1175) + int(_1307);
    float _1363 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_1029)
    {
        _1089 = _1347;
    }
    float _1365 = _1089;
    if (_1315)
    {
        int _1367 = ~_1301;
        int _1369 = _1367 + 1;
        _1341 = _1369;
    }
    int _1371 = _1341;
    int _1373 = _1241 * _1361;
    int _1375 = _1373 + _993;
    bool _1377 = _1273 > 0.0;
    float _1379 = _1177 * 2.0;
    bool _1381 = uint(_1375) >= uint(_758);
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1385 = _742 + _1383;
    if (_814)
    {
        _1291 = _1067;
    }
    float _1387 = _1291;
    float _1389 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1391 = _1245 != 3;
    float _1393 = floor(_1379);
    float _1395 = _1387;
    if (!_814)
    {
        _1395 = _845;
    }
    float _1397 = _1395;
    float _1399 = fma(_1133, _1385, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1401 = !_1381;
    int _1403 = _1401 ? 0 : (-1);
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1407 = _742 + _1405;
    bool _1409 = _1325 > 0.0;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1413 = _742 + _1411;
    bool _1415 = _1325 >= 0.0;
    bool _1417 = isnan(_1325);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan(0.0);
    bool _1423 = _1419 || _1421;
    float _1425 = fma(_1169, _1407, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _1427 = _1357 ? 0 : 1;
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1431 = _742 + _1429;
    bool _1433 = !_1391;
    int _1435 = _1433 ? 0 : (-1);
    float _1437 = fma(_1249, _1413, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1441 = _1439 != 0;
    int _1443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1445 = _1443 != 0;
    int _1447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1449 = _1447 != 0;
    float _1451 = fma(_1197, _1431, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1453 = _1229 >> 31;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1457 = _742 + _1455;
    int _1459 = ~_1427;
    int _1461 = _1459 + 1;
    int _1463 = _1461 + 1;
    int _1465 = _1463;
    if (!_1377)
    {
        int _1467 = ~_1427;
        int _1469 = _1467 + 1;
        _1465 = _1469;
    }
    int _1471 = _1465;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1475 = _742 + _1473;
    bool _1477 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1479 = isnan(_742);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1485 = _1481 || _1483;
    float _1487 = float(_1485);
    float _1489 = fma(_1221, _1457, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _1491 = _1453 & 3;
    float _1493 = fma(_1155, _1475, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1495 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1497 = isnan(_742);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1503 = _1499 || _1501;
    float _1505 = float(_1503);
    float _1507 = -_1487;
    float _1509 = _1507 + 1.0;
    int _1511 = _1229 + _1491;
    bool _1513 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1515 = isnan(_742);
    bool _1517 = _1513 || _1515;
    bool _1519 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1521 = _1517 || _1519;
    float _1523 = float(_1521);
    float _1525 = in.m_63.w;
    int _1527 = _1511 >> 2;
    float _1529 = _1505 * _1509;
    int _1531 = _1423 ? 0 : 1;
    float _1533 = -_1505;
    float _1535 = _1533 + 1.0;
    bool _1537 = _1393 > 0.0;
    bool _1539 = _1393 >= 0.0;
    bool _1541 = isnan(_1393);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan(0.0);
    bool _1547 = _1543 || _1545;
    float _1549 = -_1523;
    float _1551 = _1549 + 1.0;
    bool _1553 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1555 = isnan(_742);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1561 = _1557 || _1559;
    float _1563 = float(_1561);
    int _1565 = _1527 << 4;
    int _1567 = _1565 + 368;
    float _1569 = _1487 * _1551;
    bool _1571 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1573 = isnan(_742);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1579 = _1575 || _1577;
    float _1581 = float(_1579);
    float _1583 = _1563 * _1535;
    float _1585 = -_1563;
    float _1587 = _1585 + 1.0;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1591 = _742 + _1589;
    uint _1593 = uint(int(uint(_1567) >> uint(2)));
    uint _1595 = uint(int(uint(int(_1593)) >> uint(2)));
    int _1597 = int(_1593) & 3;
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[int(_1595)][_1597];
    int _1601 = int(_1593) + 1;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    int _1605 = _1601 & 3;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[int(_1603)][_1605];
    bool _1609 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1611 = isnan(_742);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1617 = _1613 || _1615;
    float _1619 = float(_1617);
    float _1621 = -_1581;
    float _1623 = _1621 + 1.0;
    float _1625 = fma(_1299, _1591, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1627 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1629 = isnan(_742);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1635 = _1631 || _1633;
    float _1637 = float(_1635);
    float _1639 = _1581 * _1587;
    float _1641 = _1619 * _1623;
    float _1643 = -_1619;
    float _1645 = _1643 + 1.0;
    float _1647 = _1313 + _750;
    bool _1649 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1651 = isnan(_742);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = -_1637;
    float _1663 = _1661 + 1.0;
    float _1665 = _1637 * _1645;
    float _1667 = _1255 + _1525;
    float _1669 = _1659 * _1663;
    float _1671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1673 = _1567 + 8;
    uint _1675 = uint(int(uint(_1673) >> uint(2)));
    uint _1677 = uint(int(uint(int(_1675)) >> uint(2)));
    int _1679 = int(_1675) & 3;
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[int(_1677)][_1679];
    int _1683 = int(_1675) + 1;
    uint _1685 = uint(int(uint(_1683) >> uint(2)));
    int _1687 = _1683 & 3;
    float _1689 = (*spvDescriptorSet0.vp_c9)._m0[int(_1685)][_1687];
    float _1691 = -_1659;
    float _1693 = _1691 + 1.0;
    float _1695 = _1399 * _1669;
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1699 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1701 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1695);
    int _1703 = abs(_1297);
    float _1705 = -_1697;
    float _1707 = fma(_1699, 2.0, _1705);
    float _1709 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1711 = ~_1361;
    int _1713 = _1711 + _1403;
    int _1715 = _1713 + 1;
    float _1717 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1719 = int(_1717);
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1723 = abs(_1371);
    float _1725 = fma(_1493, _1665, _1701);
    float _1727 = _1671 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1729 = ~_1531;
    int _1731 = _1729 + 1;
    int _1733 = _1731 + 1;
    float _1735 = fma(_1709, -2.0, _1721);
    int _1737 = _1733;
    if (!_1409)
    {
        int _1739 = ~_1531;
        int _1741 = _1739 + 1;
        _1737 = _1741;
    }
    int _1743 = _1737;
    float _1745 = fma(_1727, _1365, -0.5);
    float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1749 = _1647 + _1747;
    int _1751 = abs(_1337);
    int _1753 = _758 * _1715;
    int _1755 = _1753 + _993;
    int _1757 = ~_1703;
    int _1759 = _1757 + 1;
    int _1761 = _1759 + 1;
    float _1763 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1765 = _1667 + _1763;
    float _1767 = _1749 * _1749;
    float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1771 = _1359 + _1769;
    float _1773 = float(uint(_1719));
    float _1775 = -_160;
    float _1777 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1707);
    int _1779 = ~_1751;
    int _1781 = _1779 + 1;
    int _1783 = _1781 + 1;
    float _1785 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1735);
    int _1787 = _1761 * as_type<int>(_1607);
    float _1789 = fma(_1765, _1765, _1767);
    int _1791 = abs(_1435);
    float _1793 = 1.0 / _1773;
    int _1795 = _1783 * as_type<int>(_1599);
    int _1797 = _1795 + _1787;
    float _1799 = fma(_1771, _1771, _1789);
    float _1801 = fma(_1451, _1641, _1725);
    int _1803 = abs(_1153);
    int _1805 = ~_1723;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    float _1811 = sqrt(_1799);
    int _1813 = abs(_1719);
    int _1815 = ~_1791;
    int _1817 = _1815 + 1;
    int _1819 = _1817 + 1;
    int _1821 = _1809 * as_type<int>(_1681);
    int _1823 = _1821 + _1797;
    float _1825 = float(uint(_1813));
    float _1827 = rsqrt(_1799);
    int _1829 = ~_1803;
    int _1831 = _1829 + 1;
    int _1833 = _1831 + 1;
    int _1835 = _1819 * as_type<int>(_1689);
    int _1837 = _1835 + _1823;
    int _1839 = _1547 ? 0 : 1;
    int _1841 = _1837 * _1833;
    bool _1843 = !_893;
    int _1845 = _1843 ? _1755 : (-1);
    float _1847 = 1.0 / _1825;
    float _1849 = _1811 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1853 = ~_1839;
    int _1855 = _1853 + 1;
    int _1857 = _1855 + 1;
    int _1859 = _1845 * _1803;
    int _1861 = _1859 + _1841;
    int _1863 = _1857;
    float _1865 = as_type<float>(_1813);
    if (!_1537)
    {
        int _1867 = ~_1839;
        int _1869 = _1867 + 1;
        _1863 = _1869;
    }
    int _1871 = _1863;
    float _1873 = _752 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1877 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1879 = log2(_1877);
    int _1881 = as_type<int>(_1793) + (-2);
    float _1883 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1851);
    float _1885 = precise::min(_1873, _1849);
    float _1887 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1875);
    float _1889 = float(uint(_1861));
    float _1891 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1883);
    int _1893 = abs(_1861);
    out.m_79.w = _1885;
    int _1895 = as_type<int>(_1847) + (-2);
    float _1897 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1887);
    float _1899 = float(uint(_1893));
    float _1901 = as_type<float>(_1881) * _1889;
    int _1903 = ~_1719;
    int _1905 = _1903 + 1;
    float _1907 = fma(_1897, _1745, _1777);
    float _1909 = trunc(_1901);
    float _1911 = precise::max(_1909, 0.0);
    uint _1913 = uint(_1911);
    float _1915 = as_type<float>(_1895) * _1899;
    float _1917 = -_1785;
    float _1919 = fma(_1891, _1263, _1917);
    float _1921 = _1827 * _1885;
    float _1923 = _1879 * _160;
    bool _1925 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1927 = isnan(1.0);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1933 = _1929 || _1931;
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1937 = 1.0 + _1935;
    float _1939 = _1765 * _1921;
    float _1941 = trunc(_1915);
    float _1943 = precise::max(_1941, 0.0);
    uint _1945 = uint(_1943);
    float _1947 = _1749 * _1921;
    int _1949 = ~_1813;
    int _1951 = _1949 + 1;
    float _1953 = -_1939;
    float _1955 = _1765 + _1953;
    bool _1957 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1959 = isnan(0.0);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1965 = _1961 || _1963;
    float _1967 = -_1947;
    float _1969 = _1749 + _1967;
    float _1971 = _1919 + 0.5;
    float _1973 = _1955 * _1955;
    float _1975 = _1771 * _1921;
    float _1977 = exp2(_1923);
    int _1979 = _1905 * int(_1913);
    int _1981 = _1979 + _1861;
    float _1983 = fma(_1969, _1969, _1973);
    float _1985 = -_1975;
    float _1987 = _1771 + _1985;
    float _1989 = float(uint(_1981));
    int _1991 = _1951 * int(_1945);
    int _1993 = _1991 + _1893;
    float _1995 = fma(_1987, _1987, _1983);
    float _1997 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1999 = _1121 + _1997;
    float _2001 = as_type<float>(_1881) * _1989;
    float _2003 = float(uint(_1993));
    float _2005 = sqrt(_1995);
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2009 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2011 = -_1977;
    float _2013 = _2011 + 1.0;
    float _2015 = as_type<float>(_1895) * _2003;
    float _2017 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2007);
    float _2019 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2009);
    float _2021 = -_160;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1073);
    float _2025 = 1.0 / _1937;
    float _2027 = fma(_1999, _1999, _1767);
    float _2029 = _1965 ? _2013 : 0.0;
    float _2031 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2017);
    float _2033 = float(_1471);
    float _2035 = fma(_1771, _1771, _2027);
    float _2037 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1167);
    float _2039 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2019);
    float _2041 = trunc(_2001);
    float _2043 = precise::max(_2041, 0.0);
    uint _2045 = uint(_2043);
    float _2047 = _1999 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2049 = _1827 * _2005;
    float _2051 = _1907 + 0.5;
    float _2053 = fma(_1425, _1639, _1801);
    float _2055 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2047);
    float _2057 = _752 * _2049;
    bool _2059 = !_1445;
    int _2061 = _2059 ? 0 : 1;
    float _2063 = trunc(_2015);
    float _2065 = precise::max(_2063, 0.0);
    uint _2067 = uint(_2065);
    float _2069 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2055);
    if (_1933)
    {
        float _2071 = _2029 * _2025;
        _162 = _2071;
    }
    float _2073 = _162;
    float _2075 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_81.x = _2051;
    out.m_81.y = _1971;
    float _2077 = fma(_1489, _1583, _2053);
    bool _2079 = _2069 >= 0.0;
    float _2081 = rsqrt(_2035);
    int _2083 = int(_1913) + int(_2045);
    float _2085 = fma(_1437, _1529, _2077);
    int _2087 = ~_1719;
    int _2089 = _2087 + 1;
    int _2091 = ~_1813;
    int _2093 = _2091 + 1;
    float _2095 = fma(_1625, _1569, _2085);
    int _2097 = _1861 ^ _1719;
    int _2099 = _2089 * _2083;
    int _2101 = _2099 + _1861;
    int _2103 = int(_1945) + int(_2067);
    float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2107 = abs(_2061);
    float _2109 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2095);
    bool _2111 = uint(_2101) >= uint(_1719);
    int _2113 = _2093 * _2103;
    int _2115 = _2113 + _1893;
    float _2117 = float(_2107);
    float _2119 = _2075 * _2081;
    bool _2121 = !_2111;
    int _2123 = _2121 ? 0 : (-1);
    float _2125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2127 = uint(_2115) >= uint(_1813);
    float _2129 = _1999 * _2119;
    float _2131 = _1749 * _2119;
    int _2133 = ~_2083;
    int _2135 = _2133 + _2123;
    int _2137 = _2135 + 1;
    out.m_83.x = _2109;
    float _2139 = -_2129;
    float _2141 = _1999 + _2139;
    float _2143 = -_2131;
    float _2145 = _1749 + _2143;
    bool _2147 = !_2127;
    int _2149 = _2147 ? 0 : (-1);
    float _2151 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2153 = _2141 * _2141;
    bool _2155 = _1719 == 0;
    if (_2079)
    {
        out.m_53.x = 0.0;
    }
    bool _2157 = _1719 == 0;
    float _2159 = fma(_2145, _2145, _2153);
    uint _2161 = uint(int(uint(_2097) >> uint(31)));
    int _2163 = _1719 * _2137;
    int _2165 = _2163 + _1861;
    int _2167 = ~_2149;
    int _2169 = _2103 + _2167;
    int _2171 = _2169 + 1;
    int _2173 = ~int(_2161);
    int _2175 = _2173 + 1;
    float _2177 = _1771 * _2119;
    bool _2179 = !_2155;
    int _2181 = _2179 ? _2165 : (-1);
    float _2183 = fma(_2151, _1097, -0.5);
    if (_2079)
    {
        _1865 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2185 = _1865;
    float _2187 = -_2177;
    float _2189 = _1771 + _2187;
    float _2191 = float(_2181);
    float _2193 = _2125 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2195 = _2171 ^ _2175;
    float _2197 = fma(_2189, _2189, _2159);
    int _2199 = as_type<int>(_2185);
    if (_2079)
    {
        float _2201 = _2185 * 5.0;
        _2199 = as_type<int>(_2201);
    }
    int _2203 = _2199;
    float _2205 = fma(_2151, _2191, _2023);
    int _2207 = ~_2175;
    int _2209 = _2207 + _2195;
    int _2211 = _2209 + 1;
    float _2213 = fma(_2193, _1223, -0.5);
    float _2215 = _2117 * _2033;
    float _2217 = sqrt(_2197);
    if (_2079)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7282 = as_type<float>(_2203);
        out.gl_Position.z = _7282;
    }
    float _2219 = fma(_2031, _2183, _2205);
    bool _2221 = !_2157;
    int _2223 = _2221 ? _2211 : (-1);
    float _2225 = float(_1871);
    float _2227 = _2219 + 0.5;
    float _2229 = float(_2223);
    float _2231 = -_2037;
    float _2233 = fma(_2193, _2229, _2231);
    bool _2235 = !_1449;
    int _2237 = _2235 ? 0 : 1;
    bool _2239 = !_1441;
    int _2241 = _2239 ? 0 : 1;
    float _2243 = fma(_2039, _2213, _2233);
    int _2245 = abs(_2237);
    float _2247 = _2081 * _2217;
    int _2249 = abs(_2241);
    float _2251 = _2243 + 0.5;
    float _2253 = in.m_85.x;
    float _2255 = in.m_85.y;
    float _2257 = in.m_85.z;
    float _2259 = _2057 * _2247;
    float _2261 = float(_1743);
    out.m_87.x = _2227;
    out.m_87.y = _2251;
    float _2263 = float(_2245);
    float _2265 = float(_2249);
    out.m_89.x = _2259;
    if (_2079)
    {
        return out;
    }
    float _2267 = _2265 * _2225;
    float _2269 = -_2131;
    float _2271 = _1647 + _2269;
    float _2273 = -_2129;
    float _2275 = _1121 + _2273;
    float _2277 = _2267 * (-2.0);
    float _2279 = _2263 * _2261;
    float _2281 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2283 = _2271 + _2281;
    float _2285 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2287 = _2275 + _2285;
    float _2289 = fma(_2277, _2253, _2253);
    float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[191].y + _2291;
    float _2295 = -_2177;
    float _2297 = _1359 + _2295;
    float _2299 = _2287 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2301 = fma(_1363, _2277, _1363);
    float _2303 = _2215 * (-2.0);
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2307 = _2297 + _2305;
    float _2309 = 1.0 / _2293;
    float _2311 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2299);
    float _2313 = _845 + (-0.5);
    float _2315 = precise::max(_1189, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _2317 = _845 + _1177;
    float _2319 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2311);
    float _2321 = fma(_1389, _2303, _1389);
    float _2323 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2289);
    float _2325 = fma(_2303, _2255, _2255);
    float _2327 = precise::min(_2315, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _2329 = _1067 + (-0.5);
    float _2331 = _2317 + (-1.0);
    float _2333 = fma(_2301, _2073, _2323);
    bool _2335 = _2319 >= 0.0;
    float _2337 = _2279 * (-2.0);
    float _2339 = fma(_2329, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2325);
    float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2343 = _2327 + _2341;
    float _2345 = fma(_2331, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2347 = _2333 * 0.15915493667125701904296875;
    float _2349 = fma(_2321, _2073, _2339);
    float _2351 = _2343 * _2309;
    float _2353 = fma(_2337, _2257, _2257);
    float _2355 = fma(_2345, _2337, _2345);
    float _2357 = _2349 * 0.15915493667125701904296875;
    float _2359 = in.m_91.x;
    float _2361 = in.m_91.y;
    float _2363 = in.m_91.z;
    float _2365 = _1177 + (-0.5);
    float _2367 = _2357 * 6.283185482025146484375;
    float _2369 = sin(_2367);
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    int _2373 = as_type<int>(_2347);
    if (_2335)
    {
        _2371 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2375 = _2371;
    float _2377 = fma(_2365, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2353);
    if (_2335)
    {
        out.m_53.x = 0.0;
    }
    float _2379 = (*spvDescriptorSet0.vp_c9)._m0[191].z + (-1.0);
    float _2381 = fma(_2355, _2073, _2377);
    float _2383 = _2357 * 6.283185482025146484375;
    float _2385 = cos(_2383);
    float _2387 = fma(_2351, _2379, 1.0);
    float _2389 = _2381 * 0.15915493667125701904296875;
    float _2391 = _2347 * 6.283185482025146484375;
    float _2393 = sin(_2391);
    float _2395 = _2347 * 6.283185482025146484375;
    float _2397 = cos(_2395);
    if (_2335)
    {
        float _2399 = _2375 * 5.0;
        _2373 = as_type<int>(_2399);
    }
    int _2401 = _2373;
    if (_2335)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7571 = as_type<float>(_2401);
        out.gl_Position.z = _7571;
    }
    if (_2335)
    {
        return out;
    }
    float _2403 = _2389 * 6.283185482025146484375;
    float _2405 = cos(_2403);
    float _2407 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2409 = _2049 * _2247;
    float _2411 = _2387 * _2361;
    float _2413 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2415 = _2387 * _2363;
    float _2417 = _2387 * _2359;
    float _2419 = _2389 * 6.283185482025146484375;
    float _2421 = sin(_2419);
    float _2423 = _2407 * _2409;
    float _2425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2411);
    float _2427 = _2413 * _2409;
    float _2429 = _2393 * _2369;
    float _2431 = _2397 * _2385;
    float _2433 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2417);
    float _2435 = _2423 * _2425;
    float _2437 = _2397 * _2405;
    float _2439 = _2397 * _2369;
    float _2441 = _2369 * _2405;
    float _2443 = _2393 * _2385;
    float _2445 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2415);
    float _2447 = _2259 * _2433;
    float _2449 = _2437 * _2435;
    float _2451 = _2385 * _2405;
    float _2453 = fma(_2421, _2431, _2429);
    float _2455 = _2393 * _2405;
    float _2457 = -_2435;
    float _2459 = _2421 * _2457;
    float _2461 = _2427 * _2445;
    float _2463 = -_2443;
    float _2465 = fma(_2421, _2439, _2463);
    float _2467 = fma(_2453, _2447, _2449);
    float _2469 = -_2439;
    float _2471 = fma(_2421, _2443, _2469);
    float _2473 = fma(_2451, _2447, _2459);
    float _2475 = _2455 * _2435;
    float _2477 = fma(_2465, _2461, _2467);
    float _2479 = fma(_2421, _2429, _2431);
    float _2481 = fma(_2441, _2461, _2473);
    float _2483 = fma(_2471, _2447, _2475);
    float _2485 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2487 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2489 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2491 = fma(_2479, _2461, _2483);
    float _2493 = fma(_2481, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2485);
    float _2495 = fma(_2481, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2487);
    float _2497 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2499 = _2411 != 0.0;
    bool _2501 = isnan(_2411);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan(0.0);
    bool _2507 = _2503 || _2505;
    float _2509 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2493);
    float _2511 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2495);
    float _2513 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2497);
    float _2515 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2517 = _2509 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2519 = _2511 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2521 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2523 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2525 = _1359 + _2517;
    float _2527 = _1647 + _2519;
    float _2529 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2523);
    float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2533 = _2525 + _2531;
    float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2537 = _2527 + _2535;
    float _2539 = -_2421;
    float _2541 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2515);
    float _2543 = -_2421;
    float _2545 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2489);
    float _2547 = _2533 * _2533;
    bool _2549 = _2417 == 0.0;
    bool _2551 = !_2507;
    bool _2553 = _2549 && _2551;
    float _2555 = fma(_2537, _2537, _2547);
    float _2557 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2559 = fma(_2481, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2521);
    float _2561 = sqrt(_2555);
    float _2563 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2557);
    float _2565 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2559);
    float _2567 = in.m_93.x;
    float _2569 = in.m_93.y;
    float _2571 = in.m_93.z;
    float _2573 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2575 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2563);
    float _2577 = _2565 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2579 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2529);
    float _2581 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2513);
    float _2583 = -_2421;
    float _2585 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2573);
    float _2587 = _1121 + _2577;
    bool _2589 = _2561 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2591 = _2513;
    float _2593 = _2471;
    float _2595 = _2525;
    float _2597 = _2417;
    if (!_2589)
    {
        _2591 = _2525;
    }
    float _2599 = _2591;
    float _2601 = _2599;
    if (!_2589)
    {
        _2593 = _2527;
    }
    float _2603 = _2593;
    float _2605 = _2603;
    if (!_2589)
    {
        _2595 = _2587;
    }
    float _2607 = _2595;
    bool _2609 = !_2589;
    float _2611 = _2607;
    float _2613 = _2569;
    float _2615 = _2567;
    float _2617 = _2571;
    if (!_2609)
    {
        float _2619 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2623 = _2561 + _2621;
        float _2625 = rsqrt(_2555);
        float _2627 = _2623 * _2619;
        float _2629 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2631 = _2627 * 0.15915493667125701904296875;
        float _2633 = _2631 * 6.283185482025146484375;
        float _2635 = cos(_2633);
        float _2637 = _2631 * 6.283185482025146484375;
        float _2639 = sin(_2637);
        float _2641 = _2635 + (-1.0);
        float _2643 = _2641 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2645 = fma(_2639, _2629, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2647 = fma(_2587, _2635, _2643);
        float _2649 = _2625 * _2645;
        float _2651 = fma(_2537, _2649, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2653 = fma(_2533, _2649, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2611 = _2647;
        _2605 = _2651;
        _2601 = _2653;
    }
    float _2655 = _2611;
    float _2657 = _2605;
    float _2659 = _2601;
    bool _2661 = _2415 == 0.0;
    bool _2663 = _2661 && _2553;
    float _2665 = -_1939;
    float _2667 = _2665 + _2655;
    float _2669 = _2465 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2671 = _2465 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2673 = _2465 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2675 = -_1947;
    float _2677 = _2675 + _2657;
    float _2679 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2681 = _2667 + _2679;
    float _2683 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2669);
    float _2685 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2671);
    float _2687 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2673);
    float _2689 = _2681 * _2681;
    float _2691 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2585);
    float _2693 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2541);
    float _2695 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2545);
    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2699 = _2677 + _2697;
    float _2701 = -_1975;
    float _2703 = _2701 + _2659;
    if (!_2663)
    {
        float _2705 = fma(_2411, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2569);
        _2613 = _2705;
    }
    float _2707 = _2613;
    if (!_2663)
    {
        float _2709 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2567);
        _2615 = _2709;
    }
    float _2711 = _2615;
    float _2713 = fma(_2699, _2699, _2689);
    float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2717 = _2703 + _2715;
    float _2719 = _2691 * _2707;
    float _2721 = _2693 * _2707;
    float _2723 = _2695 * _2707;
    float _2725 = fma(_2717, _2717, _2713);
    float _2727 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2683);
    float _2729 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2685);
    float _2731 = fma(_2575, _2711, _2719);
    if (!_2663)
    {
        float _2733 = fma(_2415, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2571);
        _2617 = _2733;
    }
    float _2735 = _2617;
    float _2737 = fma(_2579, _2711, _2721);
    float _2739 = sqrt(_2725);
    float _2741 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2687);
    float _2743 = fma(_2581, _2711, _2723);
    float _2745 = fma(_2727, _2735, _2731);
    float _2747 = fma(_2729, _2735, _2737);
    float _2749 = fma(_2741, _2735, _2743);
    float _2751 = -_1947;
    float _2753 = _1647 + _2751;
    float _2755 = -_1939;
    float _2757 = _2755 + _1121;
    float _2759 = -_1975;
    float _2761 = _1359 + _2759;
    out.m_95.x = _2745;
    out.m_95.y = _2747;
    out.m_95.z = _2749;
    bool _2763 = _2739 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2765 = isnan(_2739);
    bool _2767 = _2763 || _2765;
    bool _2769 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2771 = _2767 || _2769;
    float _2773 = _2753;
    float _2775 = _2761;
    if (!_2771)
    {
        _2597 = 1.0;
    }
    float _2777 = _2597;
    bool _2779 = !_2771;
    float _2781 = _2777;
    if (!_2779)
    {
        bool _2783 = _2739 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2785 = isnan(_2739);
        bool _2787 = _2783 || _2785;
        bool _2789 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2791 = _2787 || _2789;
        if (!_2791)
        {
            float _2793 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2795 = _2739 + _2793;
            float _2797 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2799 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2797;
            float _2801 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2803 = _2801 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2805 = 1.0 / _2799;
            float _2807 = _2795 * _2805;
            float _2809 = fma(_2807, _2803, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2781 = _2809;
            _2811 = true;
        }
        else
        {
            bool _2813 = _2739 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2815 = isnan(_2739);
            bool _2817 = _2813 || _2815;
            bool _2819 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2821 = _2817 || _2819;
            if (!_2821)
            {
                float _2823 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2825 = _2739 + _2823;
                float _2827 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2829 = _2827 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2831 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2833 = _2831 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2835 = 1.0 / _2829;
                float _2837 = _2825 * _2835;
                float _2839 = fma(_2837, _2833, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2781 = _2839;
                _2811 = true;
            }
            else
            {
                _2781 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2811 = false;
    float _2841 = _2781;
    float _2843 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2845 = _2677 + _2843;
    float _2847 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2849 = _2703 + _2847;
    float _2851 = fma(_2845, _2841, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2853 = fma(_2849, _2841, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2857 = _2851 + _2855;
    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2861 = _2853 + _2859;
    float _2863 = fma(_2857, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2865 = fma(_2861, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _8373 = float2(_2863, _2865);
    float _2867 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_8373, float2(0.0), isnan(_8373)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_8373, float2(0.0), isnan(_8373)), level(0.0)).x;
    float _2869 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2871 = _2667 + _2869;
    float _2873 = -_2131;
    float _2875 = _2873 + _2753;
    float _2877 = -_2177;
    float _2879 = _2877 + _2761;
    float _2881 = -_2753;
    float _2883 = _2881 + _2851;
    float _2885 = fma(_2871, _2841, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2887 = -_2761;
    float _2889 = _2887 + _2853;
    float _2891 = -_2757;
    float _2893 = _2891 + _2885;
    float _2895 = _2893 * _2893;
    bool _2897 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2899 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2901 = _2897 || _2899;
    bool _2903 = isnan(0.5);
    bool _2905 = _2901 || _2903;
    float _2907 = fma(_2883, _2883, _2895);
    float _2909 = fma(_2889, _2889, _2907);
    float _2911 = sqrt(_2909);
    bool _2913 = _2911 > 0.0;
    bool _2915 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2917 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2919 = _2915 || _2917;
    bool _2921 = isnan(0.5);
    bool _2923 = _2919 || _2921;
    float _2925 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2927 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2929 = _2853;
    float _2931 = _2885;
    float _2933 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2935 = _2879;
    if (!_2913)
    {
        _2925 = _2851;
    }
    float _2937 = _2925;
    float _2939 = fma(_2867, 100.0, _2757);
    float _2941 = fma(_2867, 100.0, _2885);
    float _2943 = -_2129;
    float _2945 = _2943 + _2939;
    float _2947 = _2937;
    float _2949 = _2937;
    float _2951 = _2941;
    float _2953 = _2945;
    if (!_2913)
    {
        _2927 = _2941;
    }
    float _2955 = _2927;
    float _2957 = _2945 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2959 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2957);
    float _2961 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2959);
    float _2963 = _2961 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2965 = _2945 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2967 = 1.0 / _2963;
    float _2969 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2965);
    float _2971 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2969);
    float _2973 = _2971 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2975 = _2973 + _2963;
    float _2977 = _2975 * _2967;
    float _2979 = _2977 * 0.5;
    float _2981 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2983 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2981);
    float _2985 = 1.0 / _2983;
    bool _2987 = !_2913;
    float _2989 = _2955;
    if (!_2987)
    {
        float _2991 = _226 * _226;
        float _2993 = rsqrt(_2909);
        float _2995 = fma(_222, _222, _2991);
        float _2997 = fma(_228, _228, _2995);
        float _2999 = sqrt(_2997);
        float _3001 = _2883 * _2993;
        float _3003 = _2893 * _2993;
        float _3005 = _2889 * _2993;
        bool _3007 = _2999 > 0.0;
        float _3009 = _2999;
        _2931 = _2993;
        if (!_3007)
        {
            _2947 = _2851;
        }
        float _3011 = _2947;
        _2949 = _3011;
        if (!_3007)
        {
            _3009 = _2941;
        }
        float _3013 = _3009;
        bool _3015 = !_3007;
        _2989 = _3013;
        if (!_3015)
        {
            float _3017 = rsqrt(_2997);
            float _3019 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3021 = _226 * _3017;
            float _3023 = _222 * _3017;
            float _3025 = _3003 * _3021;
            float _3027 = _228 * _3017;
            float _3029 = fma(_3001, _3023, _3025);
            float _3031 = _3019 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3033 = fma(_3005, _3027, _3029);
            float _3035 = _3033 * _3031;
            float _3037 = fma(_222, _3035, _2851);
            float _3039 = fma(_226, _3035, _2941);
            float _3041 = fma(_228, _3035, _2853);
            _2949 = _3037;
            _2989 = _3039;
            _2929 = _3041;
            _2931 = _3023;
        }
    }
    float _3043 = _2949;
    float _3045 = _2989;
    float _3047 = _2929;
    float _3049 = _2931;
    float _3051 = -_2131;
    float _3053 = _3051 + _3043;
    float _3055 = -_2129;
    float _3057 = _3055 + _3045;
    float _3059 = -_2177;
    float _3061 = _3059 + _3047;
    float _3063 = _3049;
    float _3065 = _3057;
    float _3067 = _3053;
    float _3069 = _3061;
    if (_2905)
    {
        _3063 = 1.0;
    }
    float _3071 = _3063;
    float _3073 = _3071;
    if (!_2923)
    {
        float _3075 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3077 = _2945 + _3075;
        float _3079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3081 = _2875 + _3079;
        float _3083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3085 = -_2761;
        float _3087 = _3085 + _3047;
        float _3089 = _3077 * _3077;
        float _3091 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3093 = _2879 + _3091;
        float _3095 = -_2753;
        float _3097 = _3095 + _3043;
        float _3099 = -_2939;
        float _3101 = _3099 + _3045;
        float _3103 = fma(_3081, _3081, _3089);
        float _3105 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3107 = fma(_3093, _3093, _3103);
        float _3109 = sqrt(_3107);
        float _3111 = 1.0 / _2247;
        float _3113 = _3105 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3115 = precise::min(_3109, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3117 = _3115 * _3083;
        float _3119 = _3117 * _3111;
        float _3121 = _3113 * _3119;
        float _3123 = _3087 * _3119;
        float _3125 = fma(_3097, _3121, _2875);
        float _3127 = fma(_3101, _3121, _2945);
        float _3129 = fma(_3113, _3123, _2879);
        _2951 = _3113;
        _3065 = _3127;
        _3067 = _3125;
        _3069 = _3129;
    }
    float _3131 = _2951;
    float _3133 = _3065;
    float _3135 = _3067;
    float _3137 = _3069;
    float _3139 = _3131;
    if (_2905)
    {
        _2773 = 1.0;
    }
    float _3141 = _2773;
    float _3143 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3145 = _2985 * _3143;
    float _3147 = _3141;
    if (!_2905)
    {
        float _3149 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3151 = _3149 * 0.15915493667125701904296875;
        float _3153 = _3151 * 6.283185482025146484375;
        float _3155 = cos(_3153);
        float _3157 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3159 = _3157 * 0.15915493667125701904296875;
        float _3161 = _3151 * 6.283185482025146484375;
        float _3163 = sin(_3161);
        float _3165 = 1.0 / _3155;
        float _3167 = _3159 * 6.283185482025146484375;
        float _3169 = cos(_3167);
        float _3171 = _3163 * _3165;
        float _3173 = _3159 * 6.283185482025146484375;
        float _3175 = sin(_3173);
        float _3177 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3179 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3177;
        float _3181 = _3169 * _3171;
        float _3183 = 1.0 / _3181;
        float _3185 = 1.0 / _3179;
        float _3187 = _3175 * _3183;
        float _3189 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3191 = fma(_3145, _3187, _3189);
        float _3193 = _3191 * _3185;
        float _3195 = precise::clamp(_3193, 0.0, 1.0);
        _3139 = _3159;
        _3073 = _3195;
    }
    float _3197 = _3139;
    float _3199 = _3073;
    float _3201 = _3197;
    if (!_2905)
    {
        float _3203 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3205 = _3203 * 0.15915493667125701904296875;
        float _3207 = _3205 * 6.283185482025146484375;
        float _3209 = cos(_3207);
        float _3211 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3213 = _3211 * 0.15915493667125701904296875;
        float _3215 = _3205 * 6.283185482025146484375;
        float _3217 = sin(_3215);
        float _3219 = 1.0 / _3209;
        float _3221 = _3213 * 6.283185482025146484375;
        float _3223 = cos(_3221);
        float _3225 = _3217 * _3219;
        float _3227 = _3213 * 6.283185482025146484375;
        float _3229 = sin(_3227);
        float _3231 = _3223 * _3225;
        float _3233 = 1.0 / _3231;
        float _3235 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3237 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3235;
        float _3239 = 1.0 / _3237;
        float _3241 = _3229 * _3233;
        float _3243 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3245 = fma(_3145, _3241, _3243);
        float _3247 = _3245 * _3239;
        float _3249 = precise::clamp(_3247, 0.0, 1.0);
        float _3251 = -_3249;
        float _3253 = _3251 + 1.0;
        _3201 = _3209;
        _3147 = _3253;
    }
    float _3255 = _3201;
    float _3257 = _3147;
    float _3259 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3261 = _3133 + _3259;
    float _3263 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3265 = _3135 + _3263;
    float _3267 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3269 = _3137 + _3267;
    float _3271 = _3261 * _3261;
    float _3273 = fma(_3265, _3265, _3271);
    float _3275 = fma(_3269, _3269, _3273);
    float _3277 = rsqrt(_3275);
    float _3279 = _3277 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3281 = _3265 * _3279;
    float _3283 = _3269 * _3279;
    float _3285 = _3281 * _3281;
    float _3287 = _3283 * _3283;
    float _3289 = _3285 + _3287;
    float _3291 = sqrt(_3289);
    bool _3293 = _3291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3295 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3297 = _3291 + _3295;
    float _3299 = _3277;
    float _3301 = _3289;
    float _3303 = _3297;
    float _3305 = _3261;
    if (_3293)
    {
        float _3307 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3299 = _3307;
    }
    float _3309 = _3299;
    if (_3293)
    {
        float _3311 = rsqrt(_3289);
        _3301 = _3311;
    }
    float _3313 = _3301;
    float _3315 = _3313;
    if (_3293)
    {
        float _3317 = _3297 * _3309;
        _3303 = _3317;
    }
    float _3319 = _3303;
    if (_3293)
    {
        float _3321 = _3319 * 0.15915493667125701904296875;
        _2775 = _3321;
    }
    float _3323 = _2775;
    float _3325 = _3255;
    float _3327 = _3323;
    if (_3293)
    {
        float _3329 = _3323 * 6.283185482025146484375;
        float _3331 = sin(_3329);
        _3325 = _3331;
    }
    float _3333 = _3325;
    float _3335 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3337 = precise::max(0.0, _3335);
    float _3339 = _3269;
    float _3341 = _3337;
    float _3343 = _3335;
    if (_3293)
    {
        float _3345 = _3323 * 6.283185482025146484375;
        float _3347 = cos(_3345);
        _3339 = _3347;
    }
    float _3349 = _3339;
    float _3351 = -_3279;
    float _3353 = -_3337;
    float _3355 = fma(_3261, _3351, _3353);
    float _3357 = _3355;
    if (!_3293)
    {
        _3305 = _3285;
    }
    float _3359 = _3305;
    float _3361 = _3359;
    if (_3293)
    {
        float _3363 = _3355 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3341 = _3363;
    }
    float _3365 = _3341;
    float _3367 = _3365;
    if (!_3293)
    {
        _3327 = _3281;
    }
    float _3369 = _3327;
    float _3371 = _3333;
    float _3373 = _3369;
    if (_3293)
    {
        float _3375 = fma(_3333, _3365, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3371 = _3375;
    }
    float _3377 = _3371;
    float _3379 = _3349;
    if (_3293)
    {
        float _3381 = _3349 + (-1.0);
        _3343 = _3381;
    }
    float _3383 = _3343;
    if (_3293)
    {
        float _3385 = _3313 * _3377;
        _2933 = _3385;
    }
    float _3387 = _2933;
    if (!_3293)
    {
        _3315 = _3283;
    }
    float _3389 = _3315;
    float _3391 = _3389;
    if (_3293)
    {
        float _3393 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3367 = _3393;
    }
    float _3395 = _3367;
    if (_3293)
    {
        float _3397 = _3281 * _3387;
        _3373 = _3397;
    }
    float _3399 = _3373;
    float _3401 = sqrt(_3275);
    if (_3293)
    {
        float _3403 = _3283 * _3387;
        _3391 = _3403;
    }
    float _3405 = _3391;
    if (_3293)
    {
        float _3407 = fma(_3355, _3349, _3395);
        _3357 = _3407;
    }
    float _3409 = _3357;
    if (_3293)
    {
        float _3411 = _3399 * _3399;
        _3361 = _3411;
    }
    float _3413 = _3361;
    if (!_3293)
    {
        _3379 = _3287;
    }
    float _3415 = _3379;
    float _3417 = _3415;
    if (_3293)
    {
        float _3419 = _3405 * _3405;
        _3417 = _3419;
    }
    float _3421 = _3417;
    float _3423 = fma(_3409, _3409, _3413);
    float _3425 = _3133 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3427 = _3133 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3429 = _3423 + _3421;
    float _3431 = fma(_3135, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3425);
    float _3433 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3435 = rsqrt(_3429);
    float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3439 = fma(_3401, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3437);
    float _3441 = precise::clamp(_3439, 0.0, 1.0);
    float _3443 = fma(_3137, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3431);
    float _3445 = fma(_2879, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3447 = _3133 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3449 = -_3441;
    float _3451 = _3449 + 1.0;
    float _3453 = _3443 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3455 = fma(_3135, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3447);
    float _3457 = abs(_3451);
    float _3459 = log2(_3457);
    float _3461 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3463 = fma(_3135, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3427);
    float _3465 = fma(_2875, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3467 = -_3461;
    float _3469 = fma(_3467, _3433, 1.0);
    float _3471 = _3133 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3473 = _3435 * _3399;
    float _3475 = _3435 * _3409;
    float _3477 = _3435 * _3405;
    float _3479 = fma(_3135, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3471);
    float _3481 = fma(_3137, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3455);
    float _3483 = _3473 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3485 = floor(_3465);
    float _3487 = fma(_3137, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3479);
    float _3489 = _3481 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3491 = -_3483;
    float _3493 = fma(_3475, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3491);
    float _3495 = fma(_3137, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3463);
    float _3497 = _3487 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3499 = _3489 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3501 = -_3477;
    float _3503 = fma(_3501, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3493);
    float _3505 = floor(_3445);
    float _3507 = _3459 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3509 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3499);
    float _3511 = _3495 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3513 = fma(_3503, -0.5, 0.5);
    float _3515 = fma(_3503, 0.5, 0.5);
    float _3517 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3509);
    float _3519 = exp2(_3507);
    float _3521 = -_3485;
    float _3523 = _3465 + _3521;
    float _3525 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3517);
    float _3527 = _3489 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3529 = sqrt(_3513);
    float _3531 = _3489 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3533 = -_3505;
    float _3535 = _3445 + _3533;
    float _3537 = fma(_3515, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3539 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3527);
    float _3541 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3531);
    float _3543 = _3475 + 1.0;
    float _3545 = fma(_3515, _3537, -0.212114393711090087890625);
    float _3547 = log2(_3469);
    float _3549 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3539);
    float _3551 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3541);
    float _3553 = -_3475;
    float _3555 = fma(_3519, _3543, _3553);
    float _3557 = 1.0 / _3525;
    float _3559 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3549);
    float _3561 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3551);
    float _3563 = _3529 * 0.636619746685028076171875;
    float2 _9455 = float2(_3523, _3535);
    float _3565 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9455, float2(0.0), isnan(_9455)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9455, float2(0.0), isnan(_9455)), level(0.0)).x;
    float _3567 = fma(_3515, _3545, 1.570728778839111328125);
    float _3569 = _3547 * 0.693147182464599609375;
    float _3571 = -_3567;
    float _3573 = fma(_3563, _3571, 1.0);
    float _3575 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3577 = fma(_3555, 0.5, 0.5);
    float _3579 = _3559 * _3557;
    float _3581 = _3561 * _3557;
    float _3583 = fma(_3579, 0.5, 0.5);
    float _3585 = fma(_3581, -0.5, 0.5);
    float3 _9492 = float3(_3583, _3585, _3575);
    float _3587 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9492, float3(0.0), isnan(_9492)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9492, float3(0.0), isnan(_9492)), level(0.0)).x;
    float3 _9503 = float3(_3583, _3585, _3575);
    float4 _3590 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9503, float3(0.0), isnan(_9503)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9503, float3(0.0), isnan(_9503)), level(0.0)).xyzw;
    float _3592 = _3590.x;
    float _3594 = _3590.y;
    float _3596 = _3590.z;
    float _3598 = _3590.w;
    float2 _9519 = float2(_3573, _3577);
    float3 _3602 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9519, float2(0.0), isnan(_9519)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9519, float2(0.0), isnan(_9519)), level(0.0)).xyz;
    float _3604 = _3602.x;
    float _3606 = _3602.y;
    float _3608 = _3602.z;
    float _3610 = abs(_3145);
    float _3612 = log2(_3610);
    float _3614 = _3459 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3616 = in.m_77.x;
    bool _3618 = _3401 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3620 = isnan(_3401);
    bool _3622 = _3618 || _3620;
    bool _3624 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3626 = _3622 || _3624;
    float _3628 = exp2(_3614);
    bool _3630 = _3145 <= 8000.0;
    bool _3632 = isnan(_3145);
    bool _3634 = _3630 || _3632;
    bool _3636 = isnan(8000.0);
    bool _3638 = _3634 || _3636;
    float _3640 = float(_3638);
    out.m_97.x = _2875;
    out.m_97.y = _2945;
    out.m_97.z = _2879;
    out.m_99.x = _3135;
    out.m_99.y = _3133;
    out.m_99.z = _3137;
    float _3642 = _3612 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3644 = exp2(_3642);
    float _3646 = _3559;
    if (!_3626)
    {
        _2935 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3648 = _2935;
    float _3650 = -_3628;
    float _3652 = _3650 + 1.0;
    float _3654 = _3652;
    float _3656 = _3648;
    float _3658 = _3648;
    if (!_3626)
    {
        _2953 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3660 = _2953;
    float _3662 = fma(_3644, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3664 = precise::clamp(_3662, 0.0, 1.0);
    float _3666 = fma(_3664, -2.0, 3.0);
    float _3668 = _3664 * _3664;
    float _3670 = _3489 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3672 = _3668 * _3666;
    float _3674 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3670);
    float _3676 = -_3672;
    float _3678 = _3676 + 1.0;
    float _3680 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3674);
    float _3682 = _3559 + _3525;
    float _3684 = fma(_3678, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3672);
    float _3686 = _3525 * 0.5;
    float _3688 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3680);
    float _3690 = _3682 * 0.5;
    float _3692 = _3640 * _3684;
    float _3694 = fma(_3561, -0.5, _3686);
    float _3696 = _3652 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3698 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3700 = _3688 + _3525;
    out.gl_Position.x = _3559;
    out.gl_Position.y = _3561;
    out.gl_Position.z = _3688;
    out.gl_Position.w = _3525;
    float _3702 = _3660;
    float _3704 = _3660;
    if (!_3626)
    {
        _3654 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3706 = _3654;
    float _3708 = _3700 * 0.5;
    out.m_101.x = _3690;
    out.m_101.y = _3694;
    out.m_101.z = _3708;
    out.m_101.w = _3525;
    float _3710 = _3706;
    float _3712 = _3706;
    if (!_3626)
    {
        _3646 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3714 = _3646;
    float _3716 = -_3565;
    float _3718 = _3716 + 1.0;
    float _3720 = _3718 * _3698;
    float _3722 = precise::clamp(_3720, 0.0, 1.0);
    float _3724 = -_3722;
    float _3726 = fma(_3724, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3728 = _3726 * _3616;
    float _3730 = _3728 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3732 = _3728;
    float _3734 = _3714;
    float _3736 = _3714;
    if (!_3626)
    {
        _3732 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3738 = _3732;
    float _3740 = _3696 * _3587;
    float _3742 = -_3696;
    float _3744 = _3742 + 1.0;
    out.m_103.x = _3730;
    float _3746 = _3598 * _3740;
    float _3748 = _3608 * _3740;
    float _3750 = _3598 * _3744;
    float _3752 = fma(_3604, _3746, _3592);
    float _3754 = fma(_3606, _3746, _3594);
    float _3756 = fma(_3598, _3748, _3596);
    float _3758 = _3199 * _3257;
    out.m_105.x = _3752;
    out.m_105.y = _3754;
    out.m_105.z = _3756;
    out.m_105.w = _3750;
    float _3760 = _3758 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3762 = _3758;
    float _3764 = _3738;
    float _3766 = _3738;
    if (!_3626)
    {
        _3762 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3768 = _3762;
    bool _3770 = !_3626;
    float _3772 = _3768;
    float _3774 = _3768;
    if (!_3770)
    {
        bool _3776 = _3401 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3778 = isnan(_3401);
        bool _3780 = _3776 || _3778;
        bool _3782 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3784 = _3780 || _3782;
        if (!_3784)
        {
            float _3786 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3788 = _3401 + _3786;
            float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3792 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3790;
            float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3796 = _3794 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3798 = 1.0 / _3792;
            float _3800 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3802 = _3800 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3804 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3806 = _3804 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3810 = _3808 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3814 = _3812 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3816 = _3788 * _3798;
            float _3818 = precise::clamp(_3816, 0.0, 1.0);
            float _3820 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3822 = _3820 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3824 = fma(_3818, _3796, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3826 = fma(_3818, _3822, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3828 = fma(_3818, _3802, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3830 = fma(_3818, _3806, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3832 = fma(_3818, _3810, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3834 = fma(_3818, _3814, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3736 = _3828;
            _3704 = _3832;
            _3712 = _3824;
            _3658 = _3830;
            _3766 = _3826;
            _3774 = _3834;
            _3836 = true;
        }
        else
        {
            bool _3838 = _3401 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3840 = isnan(_3401);
            bool _3842 = _3838 || _3840;
            bool _3844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3846 = _3842 || _3844;
            if (!_3846)
            {
                _3710 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3848 = _3710;
            _3712 = _3848;
            if (!_3846)
            {
                _3734 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3850 = _3734;
            _3736 = _3850;
            if (!_3846)
            {
                _3764 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3852 = _3764;
            _3766 = _3852;
            if (!_3846)
            {
                _3656 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3854 = _3656;
            _3658 = _3854;
            if (!_3846)
            {
                _3702 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3856 = _3702;
            _3704 = _3856;
            if (!_3846)
            {
                _3772 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3858 = _3772;
            bool _3860 = !_3846;
            _3774 = _3858;
            if (!_3860)
            {
                bool _3862 = _3401 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3864 = isnan(_3401);
                bool _3866 = _3862 || _3864;
                bool _3868 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3870 = _3866 || _3868;
                if (!_3870)
                {
                    float _3872 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3874 = _3401 + _3872;
                    float _3876 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3878 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3876;
                    float _3880 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3884 = 1.0 / _3878;
                    float _3886 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3888 = _3886 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3892 = _3890 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3896 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3902 = _3874 * _3884;
                    float _3904 = precise::clamp(_3902, 0.0, 1.0);
                    float _3906 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3908 = _3906 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3910 = fma(_3904, _3882, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3912 = fma(_3904, _3908, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3914 = fma(_3904, _3888, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3916 = fma(_3904, _3892, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3918 = fma(_3904, _3896, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3920 = fma(_3904, _3900, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3736 = _3914;
                    _3704 = _3918;
                    _3712 = _3910;
                    _3658 = _3916;
                    _3766 = _3912;
                    _3774 = _3920;
                    _3836 = true;
                }
                else
                {
                    _3736 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3704 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3712 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3658 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3766 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3774 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3836 = false;
    float _3922 = _3736;
    float _3924 = _3704;
    float _3926 = _3712;
    float _3928 = _3658;
    float _3930 = _3766;
    float _3932 = _3774;
    float _3934 = fma(_2747, -0.5, 0.5);
    float _3936 = precise::clamp(_3934, 0.0, 1.0);
    float _3938 = -_3922;
    float _3940 = _3938 + _3924;
    float _3942 = _3760 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3944 = -_3926;
    float _3946 = _3944 + _3928;
    out.m_107.x = 0.0;
    float _3948 = fma(_3936, _3940, _3922);
    float _3950 = fma(_3936, _3946, _3926);
    out.m_53.x = _3942;
    float _3952 = -_3930;
    float _3954 = _3952 + _3932;
    float _3956 = _3948 * 0.586610972881317138671875;
    bool _3958 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3960 = fma(_3936, _3954, _3930);
    float _3962 = fma(_3950, 0.298911988735198974609375, _3956);
    bool _3964 = _3199 > 0.0;
    bool _3966 = isnan(_3199);
    bool _3968 = _3964 || _3966;
    bool _3970 = isnan(0.0);
    bool _3972 = _3968 || _3970;
    float _3974 = fma(_3960, 0.114477999508380889892578125, _3962);
    bool _3976 = _3257 <= 0.0;
    bool _3978 = !_3972;
    bool _3980 = _3976 || _3978;
    float _3982 = -_3974;
    float _3984 = _3950 + _3982;
    float _3986 = -_3974;
    float _3988 = _3948 + _3986;
    float _3990 = -_3974;
    float _3992 = _3960 + _3990;
    float _3994 = fma(_3984, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3974);
    float _3996 = fma(_3988, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3974);
    float _3998 = fma(_3992, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3974);
    bool _4000 = !_3958;
    if (!_4000)
    {
        float _4002 = -_3133;
        float _4004 = _4002 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4006 = -_3135;
        float _4008 = _4006 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4010 = -_3137;
        float _4012 = _4010 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4014 = _4004 * _4004;
        float _4016 = fma(_4008, _4008, _4014);
        float _4018 = fma(_4012, _4012, _4016);
        float _4020 = sqrt(_4018);
        float _4022 = rsqrt(_4018);
        float _4024 = -_4020;
        float _4026 = _4024 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4028 = _4026 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4030 = precise::clamp(_4028, 0.0, 1.0);
        float _4032 = _4008 * _4022;
        float _4034 = _4004 * _4022;
        float _4036 = abs(_4030);
        float _4038 = log2(_4036);
        float _4040 = _4012 * _4022;
        float _4042 = _4032 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4044 = _2747 * _4034;
        float _4046 = -_4034;
        float _4048 = -_4042;
        float _4050 = fma(_4046, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4048);
        float _4052 = fma(_2745, _4032, _4044);
        float _4054 = -_4040;
        float _4056 = fma(_4054, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4050);
        float _4058 = fma(_2749, _4040, _4052);
        float _4060 = precise::clamp(_4058, 0.0, 1.0);
        float _4062 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4064 = _4056 + _4062;
        float _4066 = _4038 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4068 = _4064 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4070 = precise::clamp(_4068, 0.0, 1.0);
        float _4072 = exp2(_4066);
        float _4074 = _4072 * _4070;
        float _4076 = _4060 * _4074;
        float _4078 = _4076 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4080 = _4076 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4082 = _4076 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _4078;
        out.m_107.y = _4080;
        out.m_107.z = _4082;
    }
    out.m_79.x = _3994;
    out.m_79.y = _3996;
    out.m_79.z = _3998;
    if (!_3980)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _4084 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4084;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3836 = false;
    bool _2811 = false;
    bool _734 = false;
    bool _630 = false;
    bool _488 = false;
    bool _254 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_50.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_53.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4141 = as_type<float>(_142);
        out.gl_Position.z = _4141;
    }
    if (!_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_55.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _162 = _160;
    if (_156)
    {
        float _164 = float(_126);
        _136 = _164;
    }
    float _166 = _136;
    bool _168 = _160 >= _166;
    bool _170 = !_156;
    bool _172 = _168 || _170;
    float _174 = _166;
    if (_172)
    {
        _174 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _174;
    if (_172)
    {
        out.m_53.x = 0.0;
    }
    if (_172)
    {
        float _178 = _176 * 5.0;
        _144 = as_type<int>(_178);
    }
    int _180 = _144;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4211 = as_type<float>(_180);
        out.gl_Position.z = _4211;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _182 = in.m_57.x;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = in.m_57.y;
    float _188 = in.m_59.x;
    float _190 = in.m_59.y;
    float _192 = in.m_59.z;
    float _194 = in.m_61.x;
    float _196 = in.m_61.y;
    float _198 = in.m_61.z;
    float _200 = in.m_63.x;
    float _202 = in.m_63.y;
    float _204 = in.m_63.z;
    float _206 = in.m_65.x;
    float _208 = in.m_65.y;
    float _210 = in.m_65.z;
    out.m_67.x = _182;
    out.m_67.y = _186;
    float _212 = _190 * _196;
    float _214 = _190 * _202;
    float _216 = fma(_188, _194, _212);
    float _218 = _190 * _208;
    float _220 = fma(_188, _200, _214);
    float _222 = fma(_192, _198, _216);
    float _224 = fma(_188, _206, _218);
    float _226 = fma(_192, _204, _220);
    float _228 = fma(_192, _210, _224);
    bool _230 = !_184;
    float _232 = _186;
    float _234 = _182;
    float _252;
    if (!_230)
    {
        float _236 = in.m_69.x;
        float _238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _240 = _236 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _242 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _244 = _242 * _238;
        float _246 = floor(_244);
        float _248 = -_246;
        float _250 = _244 + _248;
        _252 = _250;
        _254 = true;
    }
    else
    {
        float _256 = float(_126);
        float _258 = 1.0 / _256;
        float _260 = _160 * _258;
        _252 = _260;
    }
    _254 = false;
    float _262 = _252;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = _262 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _262 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = _262 + _284;
    float _288 = 1.0 / _274;
    bool _290 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _292 = isnan(_262);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    bool _302 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_262);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    bool _314 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_262);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _328 = 1.0 / _278;
    float _330 = 1.0 / _282;
    float _332 = _266 * _288;
    bool _334 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _336 = isnan(_262);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _350 = -_344;
    float _352 = _350 + 1.0;
    float _354 = _270 * _328;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _356;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _360;
    float _364 = -_312;
    float _366 = _364 + 1.0;
    float _368 = fma(_362, _332, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _374 = _286 * _330;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    float _380 = fma(_358, _332, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = _324 * _366;
    float _388 = fma(_378, _332, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _390 = _300 * _352;
    float _392 = -_300;
    float _394 = _392 + 1.0;
    float _396 = fma(_372, _354, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _398 = _380 * _386;
    float _400 = _312 * _394;
    float _402 = fma(_348, _354, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _404 = fma(_384, _354, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _406 = in.m_71.x;
    float _408 = in.m_71.y;
    float _410 = in.m_71.z;
    float _412 = _368 * _386;
    float _414 = -_324;
    float _416 = _414 + 1.0;
    float _418 = _388 * _386;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _424;
    float _428 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].x, _398);
    float _430 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].y, _412);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _432;
    float _436 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[143].z, _418);
    float _438 = fma(_426, _374, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _440 = fma(_422, _374, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _442 = fma(_434, _374, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = fma(_402, _400, _428);
    float _446 = fma(_404, _400, _430);
    float _448 = fma(_396, _400, _436);
    float _450 = fma(_438, _390, _444);
    float _452 = fma(_440, _390, _446);
    float _454 = fma(_442, _390, _448);
    float _456 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].x, _450);
    float _458 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].y, _452);
    float _460 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].z, _454);
    float _462 = _456 * _406;
    float _464 = _458 * _408;
    float _466 = _460 * _410;
    bool _468 = !_326;
    float _486;
    if (!_468)
    {
        float _470 = in.m_69.x;
        float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _474 = _470 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _476 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _478 = _476 * _472;
        float _480 = floor(_478);
        float _482 = -_480;
        float _484 = _478 + _482;
        _486 = _484;
        _488 = true;
    }
    else
    {
        float _490 = float(_126);
        float _492 = 1.0 / _490;
        float _494 = _160 * _492;
        _486 = _494;
    }
    _488 = false;
    float _496 = _486;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _500 = _496 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _506 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _508 = isnan(_496);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _522 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _524 = isnan(_496);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _534;
    bool _538 = _496 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _540 = isnan(_496);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = 1.0 / _504;
    float _552 = -_516;
    float _554 = _552 + 1.0;
    bool _556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _558 = 1.0 / _520;
    float _560 = _536 * _550;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _566 = -_548;
    float _568 = _566 + 1.0;
    float _570 = fma(_560, _500, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _572 = _532 * _554;
    float _574 = -_532;
    float _576 = _574 + 1.0;
    float _578 = _516 * _568;
    float _580 = _564 * _558;
    float _582 = _570 * _572;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _586 = _496 + _584;
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    float _590 = fma(_580, _586, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _594 = fma(_590, _578, _588);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _598 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _602 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[117].x, _594);
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _598;
    out.m_73.y = _604;
    out.m_73.z = _606;
    out.m_73.w = _608;
    bool _610 = !_556;
    float _628;
    if (!_610)
    {
        float _612 = in.m_69.x;
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        float _632 = float(_126);
        float _634 = 1.0 / _632;
        float _636 = _160 * _634;
        _628 = _636;
    }
    _630 = false;
    float _638 = _628;
    bool _640 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _642 = isnan(_638);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _656 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _658 = isnan(_638);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _674 = _638 + _672;
    float _676 = -_650;
    float _678 = _676 + 1.0;
    float _680 = 1.0 / _654;
    bool _682 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _684 = _666 * _678;
    float _686 = -_666;
    float _688 = _686 + 1.0;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _692 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _670 * _680;
    float _696 = fma(_694, _674, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _698 = _696 * _684;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _704 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[131].x, _698);
    float _706 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[132].x, _704);
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _706 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _708;
    out.m_75.y = _710;
    out.m_75.z = _692;
    out.m_75.w = _712;
    bool _714 = !_682;
    float _732;
    if (!_714)
    {
        float _716 = in.m_69.x;
        float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _720 = _716 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[14].x, _160);
        float _724 = _722 * _718;
        float _726 = floor(_724);
        float _728 = -_726;
        float _730 = _724 + _728;
        _732 = _730;
        _734 = true;
    }
    else
    {
        float _736 = float(_126);
        float _738 = 1.0 / _736;
        float _740 = _160 * _738;
        _732 = _740;
    }
    _734 = false;
    float _742 = _732;
    float _744 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _746 = int(_744);
    float _748 = float(_126);
    float _750 = in.m_61.w;
    float _752 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _754 = in.m_65.w;
    float _756 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _758 = int(_756);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _768 = 1.0 / _748;
    float _770 = float(_746);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _772;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _784 = 1.0 / _770;
    float _786 = float(uint(_758));
    int _788 = ~_758;
    int _790 = _788 + 1;
    int _792 = ~_758;
    int _794 = _792 + 1;
    int _796 = ~_758;
    int _798 = _796 + 1;
    float _800 = 1.0 / _786;
    float _802 = _784 * _160;
    float _804 = 1.0 / _762;
    int _806 = as_type<int>(_800) + (-2);
    float _808 = trunc(_802);
    int _810 = int(_808);
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _814 = _812 != 0;
    float _816 = 1.0 / _782;
    bool _818 = !_814;
    float _820 = _818 ? 7.345489978790283203125 : 1.0;
    float _822 = float(uint(_810));
    float _824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _826 = as_type<float>(_806) * _822;
    float _828 = trunc(_826);
    float _830 = precise::max(_828, 0.0);
    uint _833 = uint(_830);
    float _835 = _824 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _837 = float(_758);
    int _839 = _790 * int(_833);
    int _841 = _839 + _810;
    float _843 = float(uint(_841));
    float _845 = in.m_69.x;
    float _847 = as_type<float>(_806) * _843;
    float _849 = trunc(_847);
    float _851 = precise::max(_849, 0.0);
    uint _853 = uint(_851);
    float _855 = _820 * _845;
    int _857 = int(_833) + int(_853);
    float _859 = float(_810);
    float _861 = 0.0;
    if (_814)
    {
        _861 = _845;
    }
    float _863 = _861;
    int _865 = _794 * _857;
    int _867 = _865 + _810;
    bool _869 = _859 >= _837;
    bool _871 = isnan(_859);
    bool _873 = _869 || _871;
    bool _875 = isnan(_837);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = floor(_855);
    bool _883 = uint(_867) >= uint(_758);
    bool _885 = !_883;
    int _887 = _885 ? 0 : (-1);
    float _889 = trunc(_879);
    int _891 = int(_889);
    bool _893 = _758 == 0;
    int _895 = ~_857;
    int _897 = _895 + _887;
    int _899 = _897 + 1;
    int _901 = _758 * _899;
    int _903 = _901 + _810;
    float _905 = -_881;
    float _907 = _855 + _905;
    int _909 = _758 + (-1);
    float _911 = _907 * _837;
    bool _913 = !_893;
    int _915 = _913 ? _903 : (-1);
    float _917 = _837 * _160;
    int _919 = ~_891;
    int _921 = _919 + 1;
    int _923 = _921 + 1;
    float _925 = trunc(_911);
    int _927 = int(_925);
    int _929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _931 = _929 != 0;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _935 = _933 != 0;
    int _937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _939 = _937 != 0;
    float _941 = _917 * _768;
    int _943 = _915 * _923;
    bool _945 = !_935;
    int _947 = _945 ? 0 : 1;
    float _949 = trunc(_941);
    int _951 = int(_949);
    int _953 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _955 = _953 != 0;
    int _957 = _891 * _909;
    int _959 = _957 + _943;
    bool _961 = !_931;
    int _963 = _961 ? 0 : 1;
    bool _965 = !_955;
    int _967 = _965 ? 0 : 1;
    int _969 = abs(_947);
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _973 = _971 != 0;
    bool _975 = !_939;
    int _977 = _975 ? 0 : 1;
    int _979 = _959 * _969;
    int _981 = abs(_963);
    int _983 = abs(_967);
    bool _985 = !_973;
    int _987 = _985 ? 0 : 1;
    int _989 = abs(_977);
    int _991 = _927 * _983;
    int _993 = _991 + _810;
    int _995 = abs(_987);
    int _997 = _951 * _981;
    int _999 = _997 + _979;
    float _1001 = in.m_50.x;
    float _1003 = in.m_50.y;
    int _1005 = _993 * _989;
    int _1007 = _1005 + _999;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1015 = _1013 != 0;
    int _1017 = _927 * _995;
    int _1019 = _1017 + _1007;
    int _1021 = ~_758;
    int _1023 = _1021 + 1;
    float _1025 = in.m_77.y;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1029 = _1027 != 0;
    float _1031 = float(uint(_1019));
    float _1033 = as_type<float>(_806) * _1031;
    int _1035 = _999;
    bool _1037 = _973;
    float _1039 = _863;
    if (_1011)
    {
        float _1041 = -_182;
        float _1043 = _1041 + 1.0;
        _1035 = as_type<int>(_1043);
    }
    int _1045 = _1035;
    if (_1011)
    {
        bool _1047 = _845 > 0.5;
        _1037 = _1047;
    }
    bool _1049 = _1037;
    float _1051 = trunc(_1033);
    float _1053 = precise::max(_1051, 0.0);
    uint _1055 = uint(_1053);
    float _1057 = 0.0;
    if (!_1029)
    {
        _1057 = _182;
    }
    float _1059 = _1057;
    float _1061 = _208 * _1003;
    float _1063 = _202 * _1003;
    float _1065 = _845 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1067 = in.m_69.y;
    float _1069 = fma(_200, _1001, _1063);
    float _1071 = -_764;
    float _1073 = fma(_1065, 2.0, _1071);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1079 = _1023 * int(_1055);
    int _1081 = _1079 + _1019;
    float _1083 = 1.0 / _1077;
    float _1085 = float(uint(_1081));
    float _1087 = as_type<float>(_1081);
    float _1089 = _1059;
    if (!_1011)
    {
        _1087 = _182;
    }
    float _1091 = _1087;
    float _1093 = _1091;
    if (_1011)
    {
        float _1095 = _1049 ? as_type<float>(_1045) : _182;
        _1093 = _1095;
    }
    float _1097 = _1093;
    float _1099 = as_type<float>(_806) * _1085;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1103 = _1101 != 0;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1105;
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1111 = _1109 != 0;
    float _1113 = _196 * _1003;
    float _1115 = trunc(_1099);
    float _1117 = precise::max(_1115, 0.0);
    uint _1119 = uint(_1117);
    float _1121 = _1003 + _1025;
    float _1123 = fma(_194, _1001, _1113);
    float _1125 = fma(_206, _1001, _1061);
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1131 = float(uint(_993));
    float _1133 = _1107 * _804;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1139 = 1.0 / _1129;
    float _1141 = -_186;
    float _1143 = _1141 + 1.0;
    float _1145 = as_type<float>(_806) * _1131;
    float _1147 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1149 = _1147 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1151 = !_1103;
    int _1153 = _1151 ? 0 : 1;
    float _1155 = _1149 * _1083;
    int _1157 = int(_1055) + int(_1119);
    float _1159 = 1.0 / _1137;
    float _1161 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1163 = _798 * _1157;
    int _1165 = _1163 + _1019;
    float _1167 = fma(_1161, -2.0, _766);
    float _1169 = _778 * _1139;
    float _1171 = trunc(_1145);
    float _1173 = precise::max(_1171, 0.0);
    uint _1175 = uint(_1173);
    float _1177 = in.m_69.z;
    bool _1179 = uint(_1165) >= uint(_758);
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1187 = _1185 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1189 = in.m_50.z;
    bool _1191 = !_1179;
    int _1193 = _1191 ? 0 : (-1);
    bool _1195 = _1067 > 0.5;
    float _1197 = _774 * _1159;
    int _1199 = ~_1157;
    int _1201 = _1199 + _1193;
    int _1203 = _1201 + 1;
    float _1205 = 1.0 / _1183;
    int _1207 = _1195 ? as_type<int>(_1143) : as_type<int>(_186);
    float _1209 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1209;
    int _1213 = _758 * _1203;
    int _1215 = _1213 + _1019;
    int _1217 = ~_758;
    int _1219 = _1217 + 1;
    float _1221 = _1211 * _816;
    float _1223 = _1015 ? as_type<float>(_1207) : _186;
    float _1225 = 1.0 / _1187;
    bool _1227 = !_893;
    int _1229 = _1227 ? _1215 : (-1);
    int _1231 = _1219 * int(_1175);
    int _1233 = _1231 + _993;
    float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1237 = _1235 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1239 = ~_758;
    int _1241 = _1239 + 1;
    bool _1243 = _1177 > 0.5;
    int _1245 = _1229 & 3;
    bool _1247 = _1245 != 0;
    float _1249 = _1237 * _1205;
    if (_1111)
    {
        float _1251 = _1243 ? _1143 : _186;
        _232 = _1251;
    }
    float _1253 = _232;
    float _1255 = fma(_204, _1189, _1069);
    bool _1257 = uint(_1245) > 1u;
    float _1259 = _845 * 2.0;
    float _1261 = float(uint(_1233));
    float _1263 = fma(_835, _1253, -0.5);
    int _1265 = _1229 & 3;
    bool _1267 = _1265 != 0;
    float _1269 = as_type<float>(_806) * _1261;
    int _1271 = _1267 ? 0 : 1;
    float _1273 = floor(_1259);
    bool _1275 = uint(_1245) >= 2u;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1277;
    int _1281 = ~_1271;
    int _1283 = _1281 + 1;
    int _1285 = _1283 + 1;
    float _1287 = _1067 * 2.0;
    int _1289 = _1285;
    float _1291 = _1287;
    if (!_1257)
    {
        int _1293 = ~_1271;
        int _1295 = _1293 + 1;
        _1289 = _1295;
    }
    int _1297 = _1289;
    float _1299 = _1279 * _1225;
    int _1301 = _1275 ? 0 : 1;
    float _1303 = trunc(_1269);
    float _1305 = precise::max(_1303, 0.0);
    uint _1307 = uint(_1305);
    bool _1309 = _1067 > 0.5;
    bool _1311 = _1309 && _1029;
    float _1313 = fma(_198, _1189, _1123);
    bool _1315 = _1245 != 3;
    float _1317 = fma(_210, _1189, _1125);
    float _1319 = _1067 + _1177;
    if (!_814)
    {
        _1039 = _1177;
    }
    float _1321 = _1039;
    float _1323 = _845 + _1067;
    float _1325 = floor(_1287);
    int _1327 = ~_1301;
    int _1329 = _1327 + 1;
    int _1331 = _1329 + 1;
    float _1333 = _1319 + (-1.0);
    bool _1335 = !_1247;
    int _1337 = _1335 ? 0 : 1;
    float _1339 = _1323 + (-1.0);
    int _1341 = _1331;
    if (_1311)
    {
        float _1343 = -_182;
        float _1345 = _1343 + 1.0;
        _234 = _1345;
    }
    float _1347 = _234;
    bool _1349 = _1273 >= 0.0;
    bool _1351 = isnan(_1273);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan(0.0);
    bool _1357 = _1353 || _1355;
    float _1359 = _1317 + _754;
    int _1361 = int(_1175) + int(_1307);
    float _1363 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    if (_1029)
    {
        _1089 = _1347;
    }
    float _1365 = _1089;
    if (_1315)
    {
        int _1367 = ~_1301;
        int _1369 = _1367 + 1;
        _1341 = _1369;
    }
    int _1371 = _1341;
    int _1373 = _1241 * _1361;
    int _1375 = _1373 + _993;
    bool _1377 = _1273 > 0.0;
    float _1379 = _1177 * 2.0;
    bool _1381 = uint(_1375) >= uint(_758);
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1385 = _742 + _1383;
    if (_814)
    {
        _1291 = _1067;
    }
    float _1387 = _1291;
    float _1389 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1391 = _1245 != 3;
    float _1393 = floor(_1379);
    float _1395 = _1387;
    if (!_814)
    {
        _1395 = _845;
    }
    float _1397 = _1395;
    float _1399 = fma(_1133, _1385, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1401 = !_1381;
    int _1403 = _1401 ? 0 : (-1);
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1407 = _742 + _1405;
    bool _1409 = _1325 > 0.0;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1413 = _742 + _1411;
    bool _1415 = _1325 >= 0.0;
    bool _1417 = isnan(_1325);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan(0.0);
    bool _1423 = _1419 || _1421;
    float _1425 = fma(_1169, _1407, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _1427 = _1357 ? 0 : 1;
    float _1429 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1431 = _742 + _1429;
    bool _1433 = !_1391;
    int _1435 = _1433 ? 0 : (-1);
    float _1437 = fma(_1249, _1413, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1441 = _1439 != 0;
    int _1443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1445 = _1443 != 0;
    int _1447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1449 = _1447 != 0;
    float _1451 = fma(_1197, _1431, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1453 = _1229 >> 31;
    float _1455 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1457 = _742 + _1455;
    int _1459 = ~_1427;
    int _1461 = _1459 + 1;
    int _1463 = _1461 + 1;
    int _1465 = _1463;
    if (!_1377)
    {
        int _1467 = ~_1427;
        int _1469 = _1467 + 1;
        _1465 = _1469;
    }
    int _1471 = _1465;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1475 = _742 + _1473;
    bool _1477 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1479 = isnan(_742);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1485 = _1481 || _1483;
    float _1487 = float(_1485);
    float _1489 = fma(_1221, _1457, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _1491 = _1453 & 3;
    float _1493 = fma(_1155, _1475, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1495 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1497 = isnan(_742);
    bool _1499 = _1495 || _1497;
    bool _1501 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1503 = _1499 || _1501;
    float _1505 = float(_1503);
    float _1507 = -_1487;
    float _1509 = _1507 + 1.0;
    int _1511 = _1229 + _1491;
    bool _1513 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1515 = isnan(_742);
    bool _1517 = _1513 || _1515;
    bool _1519 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1521 = _1517 || _1519;
    float _1523 = float(_1521);
    float _1525 = in.m_63.w;
    int _1527 = _1511 >> 2;
    float _1529 = _1505 * _1509;
    int _1531 = _1423 ? 0 : 1;
    float _1533 = -_1505;
    float _1535 = _1533 + 1.0;
    bool _1537 = _1393 > 0.0;
    bool _1539 = _1393 >= 0.0;
    bool _1541 = isnan(_1393);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan(0.0);
    bool _1547 = _1543 || _1545;
    float _1549 = -_1523;
    float _1551 = _1549 + 1.0;
    bool _1553 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1555 = isnan(_742);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1561 = _1557 || _1559;
    float _1563 = float(_1561);
    int _1565 = _1527 << 4;
    int _1567 = _1565 + 368;
    float _1569 = _1487 * _1551;
    bool _1571 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1573 = isnan(_742);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1579 = _1575 || _1577;
    float _1581 = float(_1579);
    float _1583 = _1563 * _1535;
    float _1585 = -_1563;
    float _1587 = _1585 + 1.0;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1591 = _742 + _1589;
    uint _1593 = uint(int(uint(_1567) >> uint(2)));
    uint _1595 = uint(int(uint(int(_1593)) >> uint(2)));
    int _1597 = int(_1593) & 3;
    float _1599 = (*spvDescriptorSet0.vp_c9)._m0[int(_1595)][_1597];
    int _1601 = int(_1593) + 1;
    uint _1603 = uint(int(uint(_1601) >> uint(2)));
    int _1605 = _1601 & 3;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[int(_1603)][_1605];
    bool _1609 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1611 = isnan(_742);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1617 = _1613 || _1615;
    float _1619 = float(_1617);
    float _1621 = -_1581;
    float _1623 = _1621 + 1.0;
    float _1625 = fma(_1299, _1591, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1627 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1629 = isnan(_742);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1635 = _1631 || _1633;
    float _1637 = float(_1635);
    float _1639 = _1581 * _1587;
    float _1641 = _1619 * _1623;
    float _1643 = -_1619;
    float _1645 = _1643 + 1.0;
    float _1647 = _1313 + _750;
    bool _1649 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1651 = isnan(_742);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = -_1637;
    float _1663 = _1661 + 1.0;
    float _1665 = _1637 * _1645;
    float _1667 = _1255 + _1525;
    float _1669 = _1659 * _1663;
    float _1671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1673 = _1567 + 8;
    uint _1675 = uint(int(uint(_1673) >> uint(2)));
    uint _1677 = uint(int(uint(int(_1675)) >> uint(2)));
    int _1679 = int(_1675) & 3;
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[int(_1677)][_1679];
    int _1683 = int(_1675) + 1;
    uint _1685 = uint(int(uint(_1683) >> uint(2)));
    int _1687 = _1683 & 3;
    float _1689 = (*spvDescriptorSet0.vp_c9)._m0[int(_1685)][_1687];
    float _1691 = -_1659;
    float _1693 = _1691 + 1.0;
    float _1695 = _1399 * _1669;
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1699 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1701 = fma(_1693, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1695);
    int _1703 = abs(_1297);
    float _1705 = -_1697;
    float _1707 = fma(_1699, 2.0, _1705);
    float _1709 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1711 = ~_1361;
    int _1713 = _1711 + _1403;
    int _1715 = _1713 + 1;
    float _1717 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1719 = int(_1717);
    float _1721 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1723 = abs(_1371);
    float _1725 = fma(_1493, _1665, _1701);
    float _1727 = _1671 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1729 = ~_1531;
    int _1731 = _1729 + 1;
    int _1733 = _1731 + 1;
    float _1735 = fma(_1709, -2.0, _1721);
    int _1737 = _1733;
    if (!_1409)
    {
        int _1739 = ~_1531;
        int _1741 = _1739 + 1;
        _1737 = _1741;
    }
    int _1743 = _1737;
    float _1745 = fma(_1727, _1365, -0.5);
    float _1747 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1749 = _1647 + _1747;
    int _1751 = abs(_1337);
    int _1753 = _758 * _1715;
    int _1755 = _1753 + _993;
    int _1757 = ~_1703;
    int _1759 = _1757 + 1;
    int _1761 = _1759 + 1;
    float _1763 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1765 = _1667 + _1763;
    float _1767 = _1749 * _1749;
    float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1771 = _1359 + _1769;
    float _1773 = float(uint(_1719));
    float _1775 = -_160;
    float _1777 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1707);
    int _1779 = ~_1751;
    int _1781 = _1779 + 1;
    int _1783 = _1781 + 1;
    float _1785 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1735);
    int _1787 = _1761 * as_type<int>(_1607);
    float _1789 = fma(_1765, _1765, _1767);
    int _1791 = abs(_1435);
    float _1793 = 1.0 / _1773;
    int _1795 = _1783 * as_type<int>(_1599);
    int _1797 = _1795 + _1787;
    float _1799 = fma(_1771, _1771, _1789);
    float _1801 = fma(_1451, _1641, _1725);
    int _1803 = abs(_1153);
    int _1805 = ~_1723;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    float _1811 = sqrt(_1799);
    int _1813 = abs(_1719);
    int _1815 = ~_1791;
    int _1817 = _1815 + 1;
    int _1819 = _1817 + 1;
    int _1821 = _1809 * as_type<int>(_1681);
    int _1823 = _1821 + _1797;
    float _1825 = float(uint(_1813));
    float _1827 = rsqrt(_1799);
    int _1829 = ~_1803;
    int _1831 = _1829 + 1;
    int _1833 = _1831 + 1;
    int _1835 = _1819 * as_type<int>(_1689);
    int _1837 = _1835 + _1823;
    int _1839 = _1547 ? 0 : 1;
    int _1841 = _1837 * _1833;
    bool _1843 = !_893;
    int _1845 = _1843 ? _1755 : (-1);
    float _1847 = 1.0 / _1825;
    float _1849 = _1811 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1853 = ~_1839;
    int _1855 = _1853 + 1;
    int _1857 = _1855 + 1;
    int _1859 = _1845 * _1803;
    int _1861 = _1859 + _1841;
    int _1863 = _1857;
    float _1865 = as_type<float>(_1813);
    if (!_1537)
    {
        int _1867 = ~_1839;
        int _1869 = _1867 + 1;
        _1863 = _1869;
    }
    int _1871 = _1863;
    float _1873 = _752 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1875 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1877 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1879 = log2(_1877);
    int _1881 = as_type<int>(_1793) + (-2);
    float _1883 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1851);
    float _1885 = precise::min(_1873, _1849);
    float _1887 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1875);
    float _1889 = float(uint(_1861));
    float _1891 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1883);
    int _1893 = abs(_1861);
    out.m_79.w = _1885;
    int _1895 = as_type<int>(_1847) + (-2);
    float _1897 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1887);
    float _1899 = float(uint(_1893));
    float _1901 = as_type<float>(_1881) * _1889;
    int _1903 = ~_1719;
    int _1905 = _1903 + 1;
    float _1907 = fma(_1897, _1745, _1777);
    float _1909 = trunc(_1901);
    float _1911 = precise::max(_1909, 0.0);
    uint _1913 = uint(_1911);
    float _1915 = as_type<float>(_1895) * _1899;
    float _1917 = -_1785;
    float _1919 = fma(_1891, _1263, _1917);
    float _1921 = _1827 * _1885;
    float _1923 = _1879 * _160;
    bool _1925 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1927 = isnan(1.0);
    bool _1929 = _1925 || _1927;
    bool _1931 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1933 = _1929 || _1931;
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1937 = 1.0 + _1935;
    float _1939 = _1765 * _1921;
    float _1941 = trunc(_1915);
    float _1943 = precise::max(_1941, 0.0);
    uint _1945 = uint(_1943);
    float _1947 = _1749 * _1921;
    int _1949 = ~_1813;
    int _1951 = _1949 + 1;
    float _1953 = -_1939;
    float _1955 = _1765 + _1953;
    bool _1957 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1959 = isnan(0.0);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1965 = _1961 || _1963;
    float _1967 = -_1947;
    float _1969 = _1749 + _1967;
    float _1971 = _1919 + 0.5;
    float _1973 = _1955 * _1955;
    float _1975 = _1771 * _1921;
    float _1977 = exp2(_1923);
    int _1979 = _1905 * int(_1913);
    int _1981 = _1979 + _1861;
    float _1983 = fma(_1969, _1969, _1973);
    float _1985 = -_1975;
    float _1987 = _1771 + _1985;
    float _1989 = float(uint(_1981));
    int _1991 = _1951 * int(_1945);
    int _1993 = _1991 + _1893;
    float _1995 = fma(_1987, _1987, _1983);
    float _1997 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1999 = _1121 + _1997;
    float _2001 = as_type<float>(_1881) * _1989;
    float _2003 = float(uint(_1993));
    float _2005 = sqrt(_1995);
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2009 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2011 = -_1977;
    float _2013 = _2011 + 1.0;
    float _2015 = as_type<float>(_1895) * _2003;
    float _2017 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2007);
    float _2019 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2009);
    float _2021 = -_160;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1073);
    float _2025 = 1.0 / _1937;
    float _2027 = fma(_1999, _1999, _1767);
    float _2029 = _1965 ? _2013 : 0.0;
    float _2031 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2017);
    float _2033 = float(_1471);
    float _2035 = fma(_1771, _1771, _2027);
    float _2037 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1167);
    float _2039 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2019);
    float _2041 = trunc(_2001);
    float _2043 = precise::max(_2041, 0.0);
    uint _2045 = uint(_2043);
    float _2047 = _1999 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2049 = _1827 * _2005;
    float _2051 = _1907 + 0.5;
    float _2053 = fma(_1425, _1639, _1801);
    float _2055 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2047);
    float _2057 = _752 * _2049;
    bool _2059 = !_1445;
    int _2061 = _2059 ? 0 : 1;
    float _2063 = trunc(_2015);
    float _2065 = precise::max(_2063, 0.0);
    uint _2067 = uint(_2065);
    float _2069 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2055);
    if (_1933)
    {
        float _2071 = _2029 * _2025;
        _162 = _2071;
    }
    float _2073 = _162;
    float _2075 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_81.x = _2051;
    out.m_81.y = _1971;
    float _2077 = fma(_1489, _1583, _2053);
    bool _2079 = _2069 >= 0.0;
    float _2081 = rsqrt(_2035);
    int _2083 = int(_1913) + int(_2045);
    float _2085 = fma(_1437, _1529, _2077);
    int _2087 = ~_1719;
    int _2089 = _2087 + 1;
    int _2091 = ~_1813;
    int _2093 = _2091 + 1;
    float _2095 = fma(_1625, _1569, _2085);
    int _2097 = _1861 ^ _1719;
    int _2099 = _2089 * _2083;
    int _2101 = _2099 + _1861;
    int _2103 = int(_1945) + int(_2067);
    float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2107 = abs(_2061);
    float _2109 = fma(_1523, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2095);
    bool _2111 = uint(_2101) >= uint(_1719);
    int _2113 = _2093 * _2103;
    int _2115 = _2113 + _1893;
    float _2117 = float(_2107);
    float _2119 = _2075 * _2081;
    bool _2121 = !_2111;
    int _2123 = _2121 ? 0 : (-1);
    float _2125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2127 = uint(_2115) >= uint(_1813);
    float _2129 = _1999 * _2119;
    float _2131 = _1749 * _2119;
    int _2133 = ~_2083;
    int _2135 = _2133 + _2123;
    int _2137 = _2135 + 1;
    out.m_83.x = _2109;
    float _2139 = -_2129;
    float _2141 = _1999 + _2139;
    float _2143 = -_2131;
    float _2145 = _1749 + _2143;
    bool _2147 = !_2127;
    int _2149 = _2147 ? 0 : (-1);
    float _2151 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2153 = _2141 * _2141;
    bool _2155 = _1719 == 0;
    if (_2079)
    {
        out.m_53.x = 0.0;
    }
    bool _2157 = _1719 == 0;
    float _2159 = fma(_2145, _2145, _2153);
    uint _2161 = uint(int(uint(_2097) >> uint(31)));
    int _2163 = _1719 * _2137;
    int _2165 = _2163 + _1861;
    int _2167 = ~_2149;
    int _2169 = _2103 + _2167;
    int _2171 = _2169 + 1;
    int _2173 = ~int(_2161);
    int _2175 = _2173 + 1;
    float _2177 = _1771 * _2119;
    bool _2179 = !_2155;
    int _2181 = _2179 ? _2165 : (-1);
    float _2183 = fma(_2151, _1097, -0.5);
    if (_2079)
    {
        _1865 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2185 = _1865;
    float _2187 = -_2177;
    float _2189 = _1771 + _2187;
    float _2191 = float(_2181);
    float _2193 = _2125 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2195 = _2171 ^ _2175;
    float _2197 = fma(_2189, _2189, _2159);
    int _2199 = as_type<int>(_2185);
    if (_2079)
    {
        float _2201 = _2185 * 5.0;
        _2199 = as_type<int>(_2201);
    }
    int _2203 = _2199;
    float _2205 = fma(_2151, _2191, _2023);
    int _2207 = ~_2175;
    int _2209 = _2207 + _2195;
    int _2211 = _2209 + 1;
    float _2213 = fma(_2193, _1223, -0.5);
    float _2215 = _2117 * _2033;
    float _2217 = sqrt(_2197);
    if (_2079)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7282 = as_type<float>(_2203);
        out.gl_Position.z = _7282;
    }
    float _2219 = fma(_2031, _2183, _2205);
    bool _2221 = !_2157;
    int _2223 = _2221 ? _2211 : (-1);
    float _2225 = float(_1871);
    float _2227 = _2219 + 0.5;
    float _2229 = float(_2223);
    float _2231 = -_2037;
    float _2233 = fma(_2193, _2229, _2231);
    bool _2235 = !_1449;
    int _2237 = _2235 ? 0 : 1;
    bool _2239 = !_1441;
    int _2241 = _2239 ? 0 : 1;
    float _2243 = fma(_2039, _2213, _2233);
    int _2245 = abs(_2237);
    float _2247 = _2081 * _2217;
    int _2249 = abs(_2241);
    float _2251 = _2243 + 0.5;
    float _2253 = in.m_85.x;
    float _2255 = in.m_85.y;
    float _2257 = in.m_85.z;
    float _2259 = _2057 * _2247;
    float _2261 = float(_1743);
    out.m_87.x = _2227;
    out.m_87.y = _2251;
    float _2263 = float(_2245);
    float _2265 = float(_2249);
    out.m_89.x = _2259;
    if (_2079)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2267 = _2265 * _2225;
    float _2269 = -_2131;
    float _2271 = _1647 + _2269;
    float _2273 = -_2129;
    float _2275 = _1121 + _2273;
    float _2277 = _2267 * (-2.0);
    float _2279 = _2263 * _2261;
    float _2281 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2283 = _2271 + _2281;
    float _2285 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2287 = _2275 + _2285;
    float _2289 = fma(_2277, _2253, _2253);
    float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2293 = (*spvDescriptorSet0.vp_c9)._m0[191].y + _2291;
    float _2295 = -_2177;
    float _2297 = _1359 + _2295;
    float _2299 = _2287 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2301 = fma(_1363, _2277, _1363);
    float _2303 = _2215 * (-2.0);
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2307 = _2297 + _2305;
    float _2309 = 1.0 / _2293;
    float _2311 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2299);
    float _2313 = _845 + (-0.5);
    float _2315 = precise::max(_1189, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _2317 = _845 + _1177;
    float _2319 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2311);
    float _2321 = fma(_1389, _2303, _1389);
    float _2323 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2289);
    float _2325 = fma(_2303, _2255, _2255);
    float _2327 = precise::min(_2315, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _2329 = _1067 + (-0.5);
    float _2331 = _2317 + (-1.0);
    float _2333 = fma(_2301, _2073, _2323);
    bool _2335 = _2319 >= 0.0;
    float _2337 = _2279 * (-2.0);
    float _2339 = fma(_2329, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2325);
    float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _2343 = _2327 + _2341;
    float _2345 = fma(_2331, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2347 = _2333 * 0.15915493667125701904296875;
    float _2349 = fma(_2321, _2073, _2339);
    float _2351 = _2343 * _2309;
    float _2353 = fma(_2337, _2257, _2257);
    float _2355 = fma(_2345, _2337, _2345);
    float _2357 = _2349 * 0.15915493667125701904296875;
    float _2359 = in.m_91.x;
    float _2361 = in.m_91.y;
    float _2363 = in.m_91.z;
    float _2365 = _1177 + (-0.5);
    float _2367 = _2357 * 6.283185482025146484375;
    float _2369 = sin(_2367);
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    int _2373 = as_type<int>(_2347);
    if (_2335)
    {
        _2371 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2375 = _2371;
    float _2377 = fma(_2365, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2353);
    if (_2335)
    {
        out.m_53.x = 0.0;
    }
    float _2379 = (*spvDescriptorSet0.vp_c9)._m0[191].z + (-1.0);
    float _2381 = fma(_2355, _2073, _2377);
    float _2383 = _2357 * 6.283185482025146484375;
    float _2385 = cos(_2383);
    float _2387 = fma(_2351, _2379, 1.0);
    float _2389 = _2381 * 0.15915493667125701904296875;
    float _2391 = _2347 * 6.283185482025146484375;
    float _2393 = sin(_2391);
    float _2395 = _2347 * 6.283185482025146484375;
    float _2397 = cos(_2395);
    if (_2335)
    {
        float _2399 = _2375 * 5.0;
        _2373 = as_type<int>(_2399);
    }
    int _2401 = _2373;
    if (_2335)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7571 = as_type<float>(_2401);
        out.gl_Position.z = _7571;
    }
    if (_2335)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2403 = _2389 * 6.283185482025146484375;
    float _2405 = cos(_2403);
    float _2407 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2409 = _2049 * _2247;
    float _2411 = _2387 * _2361;
    float _2413 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2415 = _2387 * _2363;
    float _2417 = _2387 * _2359;
    float _2419 = _2389 * 6.283185482025146484375;
    float _2421 = sin(_2419);
    float _2423 = _2407 * _2409;
    float _2425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2411);
    float _2427 = _2413 * _2409;
    float _2429 = _2393 * _2369;
    float _2431 = _2397 * _2385;
    float _2433 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2417);
    float _2435 = _2423 * _2425;
    float _2437 = _2397 * _2405;
    float _2439 = _2397 * _2369;
    float _2441 = _2369 * _2405;
    float _2443 = _2393 * _2385;
    float _2445 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2415);
    float _2447 = _2259 * _2433;
    float _2449 = _2437 * _2435;
    float _2451 = _2385 * _2405;
    float _2453 = fma(_2421, _2431, _2429);
    float _2455 = _2393 * _2405;
    float _2457 = -_2435;
    float _2459 = _2421 * _2457;
    float _2461 = _2427 * _2445;
    float _2463 = -_2443;
    float _2465 = fma(_2421, _2439, _2463);
    float _2467 = fma(_2453, _2447, _2449);
    float _2469 = -_2439;
    float _2471 = fma(_2421, _2443, _2469);
    float _2473 = fma(_2451, _2447, _2459);
    float _2475 = _2455 * _2435;
    float _2477 = fma(_2465, _2461, _2467);
    float _2479 = fma(_2421, _2429, _2431);
    float _2481 = fma(_2441, _2461, _2473);
    float _2483 = fma(_2471, _2447, _2475);
    float _2485 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2487 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2489 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2491 = fma(_2479, _2461, _2483);
    float _2493 = fma(_2481, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2485);
    float _2495 = fma(_2481, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2487);
    float _2497 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2499 = _2411 != 0.0;
    bool _2501 = isnan(_2411);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan(0.0);
    bool _2507 = _2503 || _2505;
    float _2509 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2493);
    float _2511 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2495);
    float _2513 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2497);
    float _2515 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2517 = _2509 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2519 = _2511 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2521 = _2477 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2523 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2525 = _1359 + _2517;
    float _2527 = _1647 + _2519;
    float _2529 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2523);
    float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2533 = _2525 + _2531;
    float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2537 = _2527 + _2535;
    float _2539 = -_2421;
    float _2541 = fma(_2539, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2515);
    float _2543 = -_2421;
    float _2545 = fma(_2543, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2489);
    float _2547 = _2533 * _2533;
    bool _2549 = _2417 == 0.0;
    bool _2551 = !_2507;
    bool _2553 = _2549 && _2551;
    float _2555 = fma(_2537, _2537, _2547);
    float _2557 = _2453 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2559 = fma(_2481, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2521);
    float _2561 = sqrt(_2555);
    float _2563 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2557);
    float _2565 = fma(_2491, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2559);
    float _2567 = in.m_93.x;
    float _2569 = in.m_93.y;
    float _2571 = in.m_93.z;
    float _2573 = _2437 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2575 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2563);
    float _2577 = _2565 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2579 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2529);
    float _2581 = fma(_2471, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2513);
    float _2583 = -_2421;
    float _2585 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2573);
    float _2587 = _1121 + _2577;
    bool _2589 = _2561 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2591 = _2513;
    float _2593 = _2471;
    float _2595 = _2525;
    float _2597 = _2417;
    if (!_2589)
    {
        _2591 = _2525;
    }
    float _2599 = _2591;
    float _2601 = _2599;
    if (!_2589)
    {
        _2593 = _2527;
    }
    float _2603 = _2593;
    float _2605 = _2603;
    if (!_2589)
    {
        _2595 = _2587;
    }
    float _2607 = _2595;
    bool _2609 = !_2589;
    float _2611 = _2607;
    float _2613 = _2569;
    float _2615 = _2567;
    float _2617 = _2571;
    if (!_2609)
    {
        float _2619 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2623 = _2561 + _2621;
        float _2625 = rsqrt(_2555);
        float _2627 = _2623 * _2619;
        float _2629 = _2587 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2631 = _2627 * 0.15915493667125701904296875;
        float _2633 = _2631 * 6.283185482025146484375;
        float _2635 = cos(_2633);
        float _2637 = _2631 * 6.283185482025146484375;
        float _2639 = sin(_2637);
        float _2641 = _2635 + (-1.0);
        float _2643 = _2641 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2645 = fma(_2639, _2629, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2647 = fma(_2587, _2635, _2643);
        float _2649 = _2625 * _2645;
        float _2651 = fma(_2537, _2649, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2653 = fma(_2533, _2649, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2611 = _2647;
        _2605 = _2651;
        _2601 = _2653;
    }
    float _2655 = _2611;
    float _2657 = _2605;
    float _2659 = _2601;
    bool _2661 = _2415 == 0.0;
    bool _2663 = _2661 && _2553;
    float _2665 = -_1939;
    float _2667 = _2665 + _2655;
    float _2669 = _2465 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2671 = _2465 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2673 = _2465 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2675 = -_1947;
    float _2677 = _2675 + _2657;
    float _2679 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2681 = _2667 + _2679;
    float _2683 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2669);
    float _2685 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2671);
    float _2687 = fma(_2441, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2673);
    float _2689 = _2681 * _2681;
    float _2691 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2585);
    float _2693 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2541);
    float _2695 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2545);
    float _2697 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2699 = _2677 + _2697;
    float _2701 = -_1975;
    float _2703 = _2701 + _2659;
    if (!_2663)
    {
        float _2705 = fma(_2411, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2569);
        _2613 = _2705;
    }
    float _2707 = _2613;
    if (!_2663)
    {
        float _2709 = fma(_2417, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2567);
        _2615 = _2709;
    }
    float _2711 = _2615;
    float _2713 = fma(_2699, _2699, _2689);
    float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2717 = _2703 + _2715;
    float _2719 = _2691 * _2707;
    float _2721 = _2693 * _2707;
    float _2723 = _2695 * _2707;
    float _2725 = fma(_2717, _2717, _2713);
    float _2727 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2683);
    float _2729 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2685);
    float _2731 = fma(_2575, _2711, _2719);
    if (!_2663)
    {
        float _2733 = fma(_2415, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2571);
        _2617 = _2733;
    }
    float _2735 = _2617;
    float _2737 = fma(_2579, _2711, _2721);
    float _2739 = sqrt(_2725);
    float _2741 = fma(_2479, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2687);
    float _2743 = fma(_2581, _2711, _2723);
    float _2745 = fma(_2727, _2735, _2731);
    float _2747 = fma(_2729, _2735, _2737);
    float _2749 = fma(_2741, _2735, _2743);
    float _2751 = -_1947;
    float _2753 = _1647 + _2751;
    float _2755 = -_1939;
    float _2757 = _2755 + _1121;
    float _2759 = -_1975;
    float _2761 = _1359 + _2759;
    out.m_95.x = _2745;
    out.m_95.y = _2747;
    out.m_95.z = _2749;
    bool _2763 = _2739 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2765 = isnan(_2739);
    bool _2767 = _2763 || _2765;
    bool _2769 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2771 = _2767 || _2769;
    float _2773 = _2753;
    float _2775 = _2761;
    if (!_2771)
    {
        _2597 = 1.0;
    }
    float _2777 = _2597;
    bool _2779 = !_2771;
    float _2781 = _2777;
    if (!_2779)
    {
        bool _2783 = _2739 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2785 = isnan(_2739);
        bool _2787 = _2783 || _2785;
        bool _2789 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2791 = _2787 || _2789;
        if (!_2791)
        {
            float _2793 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2795 = _2739 + _2793;
            float _2797 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2799 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2797;
            float _2801 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2803 = _2801 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2805 = 1.0 / _2799;
            float _2807 = _2795 * _2805;
            float _2809 = fma(_2807, _2803, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2781 = _2809;
            _2811 = true;
        }
        else
        {
            bool _2813 = _2739 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2815 = isnan(_2739);
            bool _2817 = _2813 || _2815;
            bool _2819 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2821 = _2817 || _2819;
            if (!_2821)
            {
                float _2823 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2825 = _2739 + _2823;
                float _2827 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2829 = _2827 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2831 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2833 = _2831 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2835 = 1.0 / _2829;
                float _2837 = _2825 * _2835;
                float _2839 = fma(_2837, _2833, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2781 = _2839;
                _2811 = true;
            }
            else
            {
                _2781 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2811 = false;
    float _2841 = _2781;
    float _2843 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2845 = _2677 + _2843;
    float _2847 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2849 = _2703 + _2847;
    float _2851 = fma(_2845, _2841, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2853 = fma(_2849, _2841, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2857 = _2851 + _2855;
    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2861 = _2853 + _2859;
    float _2863 = fma(_2857, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2865 = fma(_2861, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _8373 = float2(_2863, _2865);
    float _2867 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_8373, float2(0.0), isnan(_8373)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_8373, float2(0.0), isnan(_8373)), level(0.0)).x;
    float _2869 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2871 = _2667 + _2869;
    float _2873 = -_2131;
    float _2875 = _2873 + _2753;
    float _2877 = -_2177;
    float _2879 = _2877 + _2761;
    float _2881 = -_2753;
    float _2883 = _2881 + _2851;
    float _2885 = fma(_2871, _2841, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2887 = -_2761;
    float _2889 = _2887 + _2853;
    float _2891 = -_2757;
    float _2893 = _2891 + _2885;
    float _2895 = _2893 * _2893;
    bool _2897 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2899 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2901 = _2897 || _2899;
    bool _2903 = isnan(0.5);
    bool _2905 = _2901 || _2903;
    float _2907 = fma(_2883, _2883, _2895);
    float _2909 = fma(_2889, _2889, _2907);
    float _2911 = sqrt(_2909);
    bool _2913 = _2911 > 0.0;
    bool _2915 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2917 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2919 = _2915 || _2917;
    bool _2921 = isnan(0.5);
    bool _2923 = _2919 || _2921;
    float _2925 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2927 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2929 = _2853;
    float _2931 = _2885;
    float _2933 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2935 = _2879;
    if (!_2913)
    {
        _2925 = _2851;
    }
    float _2937 = _2925;
    float _2939 = fma(_2867, 100.0, _2757);
    float _2941 = fma(_2867, 100.0, _2885);
    float _2943 = -_2129;
    float _2945 = _2943 + _2939;
    float _2947 = _2937;
    float _2949 = _2937;
    float _2951 = _2941;
    float _2953 = _2945;
    if (!_2913)
    {
        _2927 = _2941;
    }
    float _2955 = _2927;
    float _2957 = _2945 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2959 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2957);
    float _2961 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2959);
    float _2963 = _2961 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2965 = _2945 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2967 = 1.0 / _2963;
    float _2969 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2965);
    float _2971 = fma(_2879, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2969);
    float _2973 = _2971 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2975 = _2973 + _2963;
    float _2977 = _2975 * _2967;
    float _2979 = _2977 * 0.5;
    float _2981 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2983 = fma(_2979, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2981);
    float _2985 = 1.0 / _2983;
    bool _2987 = !_2913;
    float _2989 = _2955;
    if (!_2987)
    {
        float _2991 = _226 * _226;
        float _2993 = rsqrt(_2909);
        float _2995 = fma(_222, _222, _2991);
        float _2997 = fma(_228, _228, _2995);
        float _2999 = sqrt(_2997);
        float _3001 = _2883 * _2993;
        float _3003 = _2893 * _2993;
        float _3005 = _2889 * _2993;
        bool _3007 = _2999 > 0.0;
        float _3009 = _2999;
        _2931 = _2993;
        if (!_3007)
        {
            _2947 = _2851;
        }
        float _3011 = _2947;
        _2949 = _3011;
        if (!_3007)
        {
            _3009 = _2941;
        }
        float _3013 = _3009;
        bool _3015 = !_3007;
        _2989 = _3013;
        if (!_3015)
        {
            float _3017 = rsqrt(_2997);
            float _3019 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3021 = _226 * _3017;
            float _3023 = _222 * _3017;
            float _3025 = _3003 * _3021;
            float _3027 = _228 * _3017;
            float _3029 = fma(_3001, _3023, _3025);
            float _3031 = _3019 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3033 = fma(_3005, _3027, _3029);
            float _3035 = _3033 * _3031;
            float _3037 = fma(_222, _3035, _2851);
            float _3039 = fma(_226, _3035, _2941);
            float _3041 = fma(_228, _3035, _2853);
            _2949 = _3037;
            _2989 = _3039;
            _2929 = _3041;
            _2931 = _3023;
        }
    }
    float _3043 = _2949;
    float _3045 = _2989;
    float _3047 = _2929;
    float _3049 = _2931;
    float _3051 = -_2131;
    float _3053 = _3051 + _3043;
    float _3055 = -_2129;
    float _3057 = _3055 + _3045;
    float _3059 = -_2177;
    float _3061 = _3059 + _3047;
    float _3063 = _3049;
    float _3065 = _3057;
    float _3067 = _3053;
    float _3069 = _3061;
    if (_2905)
    {
        _3063 = 1.0;
    }
    float _3071 = _3063;
    float _3073 = _3071;
    if (!_2923)
    {
        float _3075 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3077 = _2945 + _3075;
        float _3079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3081 = _2875 + _3079;
        float _3083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3085 = -_2761;
        float _3087 = _3085 + _3047;
        float _3089 = _3077 * _3077;
        float _3091 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3093 = _2879 + _3091;
        float _3095 = -_2753;
        float _3097 = _3095 + _3043;
        float _3099 = -_2939;
        float _3101 = _3099 + _3045;
        float _3103 = fma(_3081, _3081, _3089);
        float _3105 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3107 = fma(_3093, _3093, _3103);
        float _3109 = sqrt(_3107);
        float _3111 = 1.0 / _2247;
        float _3113 = _3105 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3115 = precise::min(_3109, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3117 = _3115 * _3083;
        float _3119 = _3117 * _3111;
        float _3121 = _3113 * _3119;
        float _3123 = _3087 * _3119;
        float _3125 = fma(_3097, _3121, _2875);
        float _3127 = fma(_3101, _3121, _2945);
        float _3129 = fma(_3113, _3123, _2879);
        _2951 = _3113;
        _3065 = _3127;
        _3067 = _3125;
        _3069 = _3129;
    }
    float _3131 = _2951;
    float _3133 = _3065;
    float _3135 = _3067;
    float _3137 = _3069;
    float _3139 = _3131;
    if (_2905)
    {
        _2773 = 1.0;
    }
    float _3141 = _2773;
    float _3143 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3145 = _2985 * _3143;
    float _3147 = _3141;
    if (!_2905)
    {
        float _3149 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3151 = _3149 * 0.15915493667125701904296875;
        float _3153 = _3151 * 6.283185482025146484375;
        float _3155 = cos(_3153);
        float _3157 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3159 = _3157 * 0.15915493667125701904296875;
        float _3161 = _3151 * 6.283185482025146484375;
        float _3163 = sin(_3161);
        float _3165 = 1.0 / _3155;
        float _3167 = _3159 * 6.283185482025146484375;
        float _3169 = cos(_3167);
        float _3171 = _3163 * _3165;
        float _3173 = _3159 * 6.283185482025146484375;
        float _3175 = sin(_3173);
        float _3177 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3179 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3177;
        float _3181 = _3169 * _3171;
        float _3183 = 1.0 / _3181;
        float _3185 = 1.0 / _3179;
        float _3187 = _3175 * _3183;
        float _3189 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3191 = fma(_3145, _3187, _3189);
        float _3193 = _3191 * _3185;
        float _3195 = precise::clamp(_3193, 0.0, 1.0);
        _3139 = _3159;
        _3073 = _3195;
    }
    float _3197 = _3139;
    float _3199 = _3073;
    float _3201 = _3197;
    if (!_2905)
    {
        float _3203 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3205 = _3203 * 0.15915493667125701904296875;
        float _3207 = _3205 * 6.283185482025146484375;
        float _3209 = cos(_3207);
        float _3211 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3213 = _3211 * 0.15915493667125701904296875;
        float _3215 = _3205 * 6.283185482025146484375;
        float _3217 = sin(_3215);
        float _3219 = 1.0 / _3209;
        float _3221 = _3213 * 6.283185482025146484375;
        float _3223 = cos(_3221);
        float _3225 = _3217 * _3219;
        float _3227 = _3213 * 6.283185482025146484375;
        float _3229 = sin(_3227);
        float _3231 = _3223 * _3225;
        float _3233 = 1.0 / _3231;
        float _3235 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3237 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3235;
        float _3239 = 1.0 / _3237;
        float _3241 = _3229 * _3233;
        float _3243 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3245 = fma(_3145, _3241, _3243);
        float _3247 = _3245 * _3239;
        float _3249 = precise::clamp(_3247, 0.0, 1.0);
        float _3251 = -_3249;
        float _3253 = _3251 + 1.0;
        _3201 = _3209;
        _3147 = _3253;
    }
    float _3255 = _3201;
    float _3257 = _3147;
    float _3259 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3261 = _3133 + _3259;
    float _3263 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3265 = _3135 + _3263;
    float _3267 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3269 = _3137 + _3267;
    float _3271 = _3261 * _3261;
    float _3273 = fma(_3265, _3265, _3271);
    float _3275 = fma(_3269, _3269, _3273);
    float _3277 = rsqrt(_3275);
    float _3279 = _3277 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3281 = _3265 * _3279;
    float _3283 = _3269 * _3279;
    float _3285 = _3281 * _3281;
    float _3287 = _3283 * _3283;
    float _3289 = _3285 + _3287;
    float _3291 = sqrt(_3289);
    bool _3293 = _3291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3295 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3297 = _3291 + _3295;
    float _3299 = _3277;
    float _3301 = _3289;
    float _3303 = _3297;
    float _3305 = _3261;
    if (_3293)
    {
        float _3307 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3299 = _3307;
    }
    float _3309 = _3299;
    if (_3293)
    {
        float _3311 = rsqrt(_3289);
        _3301 = _3311;
    }
    float _3313 = _3301;
    float _3315 = _3313;
    if (_3293)
    {
        float _3317 = _3297 * _3309;
        _3303 = _3317;
    }
    float _3319 = _3303;
    if (_3293)
    {
        float _3321 = _3319 * 0.15915493667125701904296875;
        _2775 = _3321;
    }
    float _3323 = _2775;
    float _3325 = _3255;
    float _3327 = _3323;
    if (_3293)
    {
        float _3329 = _3323 * 6.283185482025146484375;
        float _3331 = sin(_3329);
        _3325 = _3331;
    }
    float _3333 = _3325;
    float _3335 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3337 = precise::max(0.0, _3335);
    float _3339 = _3269;
    float _3341 = _3337;
    float _3343 = _3335;
    if (_3293)
    {
        float _3345 = _3323 * 6.283185482025146484375;
        float _3347 = cos(_3345);
        _3339 = _3347;
    }
    float _3349 = _3339;
    float _3351 = -_3279;
    float _3353 = -_3337;
    float _3355 = fma(_3261, _3351, _3353);
    float _3357 = _3355;
    if (!_3293)
    {
        _3305 = _3285;
    }
    float _3359 = _3305;
    float _3361 = _3359;
    if (_3293)
    {
        float _3363 = _3355 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3341 = _3363;
    }
    float _3365 = _3341;
    float _3367 = _3365;
    if (!_3293)
    {
        _3327 = _3281;
    }
    float _3369 = _3327;
    float _3371 = _3333;
    float _3373 = _3369;
    if (_3293)
    {
        float _3375 = fma(_3333, _3365, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3371 = _3375;
    }
    float _3377 = _3371;
    float _3379 = _3349;
    if (_3293)
    {
        float _3381 = _3349 + (-1.0);
        _3343 = _3381;
    }
    float _3383 = _3343;
    if (_3293)
    {
        float _3385 = _3313 * _3377;
        _2933 = _3385;
    }
    float _3387 = _2933;
    if (!_3293)
    {
        _3315 = _3283;
    }
    float _3389 = _3315;
    float _3391 = _3389;
    if (_3293)
    {
        float _3393 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3367 = _3393;
    }
    float _3395 = _3367;
    if (_3293)
    {
        float _3397 = _3281 * _3387;
        _3373 = _3397;
    }
    float _3399 = _3373;
    float _3401 = sqrt(_3275);
    if (_3293)
    {
        float _3403 = _3283 * _3387;
        _3391 = _3403;
    }
    float _3405 = _3391;
    if (_3293)
    {
        float _3407 = fma(_3355, _3349, _3395);
        _3357 = _3407;
    }
    float _3409 = _3357;
    if (_3293)
    {
        float _3411 = _3399 * _3399;
        _3361 = _3411;
    }
    float _3413 = _3361;
    if (!_3293)
    {
        _3379 = _3287;
    }
    float _3415 = _3379;
    float _3417 = _3415;
    if (_3293)
    {
        float _3419 = _3405 * _3405;
        _3417 = _3419;
    }
    float _3421 = _3417;
    float _3423 = fma(_3409, _3409, _3413);
    float _3425 = _3133 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3427 = _3133 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3429 = _3423 + _3421;
    float _3431 = fma(_3135, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3425);
    float _3433 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3435 = rsqrt(_3429);
    float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3439 = fma(_3401, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3437);
    float _3441 = precise::clamp(_3439, 0.0, 1.0);
    float _3443 = fma(_3137, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3431);
    float _3445 = fma(_2879, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3447 = _3133 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3449 = -_3441;
    float _3451 = _3449 + 1.0;
    float _3453 = _3443 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3455 = fma(_3135, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3447);
    float _3457 = abs(_3451);
    float _3459 = log2(_3457);
    float _3461 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3463 = fma(_3135, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3427);
    float _3465 = fma(_2875, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3467 = -_3461;
    float _3469 = fma(_3467, _3433, 1.0);
    float _3471 = _3133 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3473 = _3435 * _3399;
    float _3475 = _3435 * _3409;
    float _3477 = _3435 * _3405;
    float _3479 = fma(_3135, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3471);
    float _3481 = fma(_3137, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3455);
    float _3483 = _3473 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3485 = floor(_3465);
    float _3487 = fma(_3137, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3479);
    float _3489 = _3481 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3491 = -_3483;
    float _3493 = fma(_3475, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3491);
    float _3495 = fma(_3137, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3463);
    float _3497 = _3487 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3499 = _3489 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3501 = -_3477;
    float _3503 = fma(_3501, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3493);
    float _3505 = floor(_3445);
    float _3507 = _3459 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3509 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3499);
    float _3511 = _3495 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3513 = fma(_3503, -0.5, 0.5);
    float _3515 = fma(_3503, 0.5, 0.5);
    float _3517 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3509);
    float _3519 = exp2(_3507);
    float _3521 = -_3485;
    float _3523 = _3465 + _3521;
    float _3525 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3517);
    float _3527 = _3489 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3529 = sqrt(_3513);
    float _3531 = _3489 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3533 = -_3505;
    float _3535 = _3445 + _3533;
    float _3537 = fma(_3515, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3539 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3527);
    float _3541 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3531);
    float _3543 = _3475 + 1.0;
    float _3545 = fma(_3515, _3537, -0.212114393711090087890625);
    float _3547 = log2(_3469);
    float _3549 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3539);
    float _3551 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3541);
    float _3553 = -_3475;
    float _3555 = fma(_3519, _3543, _3553);
    float _3557 = 1.0 / _3525;
    float _3559 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3549);
    float _3561 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3551);
    float _3563 = _3529 * 0.636619746685028076171875;
    float2 _9455 = float2(_3523, _3535);
    float _3565 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9455, float2(0.0), isnan(_9455)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9455, float2(0.0), isnan(_9455)), level(0.0)).x;
    float _3567 = fma(_3515, _3545, 1.570728778839111328125);
    float _3569 = _3547 * 0.693147182464599609375;
    float _3571 = -_3567;
    float _3573 = fma(_3563, _3571, 1.0);
    float _3575 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3577 = fma(_3555, 0.5, 0.5);
    float _3579 = _3559 * _3557;
    float _3581 = _3561 * _3557;
    float _3583 = fma(_3579, 0.5, 0.5);
    float _3585 = fma(_3581, -0.5, 0.5);
    float3 _9492 = float3(_3583, _3585, _3575);
    float _3587 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9492, float3(0.0), isnan(_9492)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9492, float3(0.0), isnan(_9492)), level(0.0)).x;
    float3 _9503 = float3(_3583, _3585, _3575);
    float4 _3590 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9503, float3(0.0), isnan(_9503)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9503, float3(0.0), isnan(_9503)), level(0.0)).xyzw;
    float _3592 = _3590.x;
    float _3594 = _3590.y;
    float _3596 = _3590.z;
    float _3598 = _3590.w;
    float2 _9519 = float2(_3573, _3577);
    float3 _3602 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9519, float2(0.0), isnan(_9519)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9519, float2(0.0), isnan(_9519)), level(0.0)).xyz;
    float _3604 = _3602.x;
    float _3606 = _3602.y;
    float _3608 = _3602.z;
    float _3610 = abs(_3145);
    float _3612 = log2(_3610);
    float _3614 = _3459 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3616 = in.m_77.x;
    bool _3618 = _3401 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3620 = isnan(_3401);
    bool _3622 = _3618 || _3620;
    bool _3624 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3626 = _3622 || _3624;
    float _3628 = exp2(_3614);
    bool _3630 = _3145 <= 8000.0;
    bool _3632 = isnan(_3145);
    bool _3634 = _3630 || _3632;
    bool _3636 = isnan(8000.0);
    bool _3638 = _3634 || _3636;
    float _3640 = float(_3638);
    out.m_97.x = _2875;
    out.m_97.y = _2945;
    out.m_97.z = _2879;
    out.m_99.x = _3135;
    out.m_99.y = _3133;
    out.m_99.z = _3137;
    float _3642 = _3612 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3644 = exp2(_3642);
    float _3646 = _3559;
    if (!_3626)
    {
        _2935 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3648 = _2935;
    float _3650 = -_3628;
    float _3652 = _3650 + 1.0;
    float _3654 = _3652;
    float _3656 = _3648;
    float _3658 = _3648;
    if (!_3626)
    {
        _2953 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3660 = _2953;
    float _3662 = fma(_3644, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3664 = precise::clamp(_3662, 0.0, 1.0);
    float _3666 = fma(_3664, -2.0, 3.0);
    float _3668 = _3664 * _3664;
    float _3670 = _3489 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3672 = _3668 * _3666;
    float _3674 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3670);
    float _3676 = -_3672;
    float _3678 = _3676 + 1.0;
    float _3680 = fma(_3453, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3674);
    float _3682 = _3559 + _3525;
    float _3684 = fma(_3678, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3672);
    float _3686 = _3525 * 0.5;
    float _3688 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3680);
    float _3690 = _3682 * 0.5;
    float _3692 = _3640 * _3684;
    float _3694 = fma(_3561, -0.5, _3686);
    float _3696 = _3652 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3698 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3700 = _3688 + _3525;
    out.gl_Position.x = _3559;
    out.gl_Position.y = _3561;
    out.gl_Position.z = _3688;
    out.gl_Position.w = _3525;
    float _3702 = _3660;
    float _3704 = _3660;
    if (!_3626)
    {
        _3654 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3706 = _3654;
    float _3708 = _3700 * 0.5;
    out.m_101.x = _3690;
    out.m_101.y = _3694;
    out.m_101.z = _3708;
    out.m_101.w = _3525;
    float _3710 = _3706;
    float _3712 = _3706;
    if (!_3626)
    {
        _3646 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3714 = _3646;
    float _3716 = -_3565;
    float _3718 = _3716 + 1.0;
    float _3720 = _3718 * _3698;
    float _3722 = precise::clamp(_3720, 0.0, 1.0);
    float _3724 = -_3722;
    float _3726 = fma(_3724, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3728 = _3726 * _3616;
    float _3730 = _3728 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3732 = _3728;
    float _3734 = _3714;
    float _3736 = _3714;
    if (!_3626)
    {
        _3732 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3738 = _3732;
    float _3740 = _3696 * _3587;
    float _3742 = -_3696;
    float _3744 = _3742 + 1.0;
    out.m_103.x = _3730;
    float _3746 = _3598 * _3740;
    float _3748 = _3608 * _3740;
    float _3750 = _3598 * _3744;
    float _3752 = fma(_3604, _3746, _3592);
    float _3754 = fma(_3606, _3746, _3594);
    float _3756 = fma(_3598, _3748, _3596);
    float _3758 = _3199 * _3257;
    out.m_105.x = _3752;
    out.m_105.y = _3754;
    out.m_105.z = _3756;
    out.m_105.w = _3750;
    float _3760 = _3758 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3762 = _3758;
    float _3764 = _3738;
    float _3766 = _3738;
    if (!_3626)
    {
        _3762 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3768 = _3762;
    bool _3770 = !_3626;
    float _3772 = _3768;
    float _3774 = _3768;
    if (!_3770)
    {
        bool _3776 = _3401 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3778 = isnan(_3401);
        bool _3780 = _3776 || _3778;
        bool _3782 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3784 = _3780 || _3782;
        if (!_3784)
        {
            float _3786 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3788 = _3401 + _3786;
            float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3792 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3790;
            float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3796 = _3794 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3798 = 1.0 / _3792;
            float _3800 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3802 = _3800 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3804 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3806 = _3804 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3808 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3810 = _3808 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3812 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3814 = _3812 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3816 = _3788 * _3798;
            float _3818 = precise::clamp(_3816, 0.0, 1.0);
            float _3820 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3822 = _3820 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3824 = fma(_3818, _3796, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3826 = fma(_3818, _3822, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3828 = fma(_3818, _3802, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3830 = fma(_3818, _3806, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3832 = fma(_3818, _3810, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3834 = fma(_3818, _3814, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3736 = _3828;
            _3704 = _3832;
            _3712 = _3824;
            _3658 = _3830;
            _3766 = _3826;
            _3774 = _3834;
            _3836 = true;
        }
        else
        {
            bool _3838 = _3401 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3840 = isnan(_3401);
            bool _3842 = _3838 || _3840;
            bool _3844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3846 = _3842 || _3844;
            if (!_3846)
            {
                _3710 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3848 = _3710;
            _3712 = _3848;
            if (!_3846)
            {
                _3734 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3850 = _3734;
            _3736 = _3850;
            if (!_3846)
            {
                _3764 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3852 = _3764;
            _3766 = _3852;
            if (!_3846)
            {
                _3656 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3854 = _3656;
            _3658 = _3854;
            if (!_3846)
            {
                _3702 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3856 = _3702;
            _3704 = _3856;
            if (!_3846)
            {
                _3772 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3858 = _3772;
            bool _3860 = !_3846;
            _3774 = _3858;
            if (!_3860)
            {
                bool _3862 = _3401 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3864 = isnan(_3401);
                bool _3866 = _3862 || _3864;
                bool _3868 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3870 = _3866 || _3868;
                if (!_3870)
                {
                    float _3872 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3874 = _3401 + _3872;
                    float _3876 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3878 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3876;
                    float _3880 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3884 = 1.0 / _3878;
                    float _3886 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3888 = _3886 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3890 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3892 = _3890 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3894 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3896 = _3894 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3898 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3900 = _3898 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3902 = _3874 * _3884;
                    float _3904 = precise::clamp(_3902, 0.0, 1.0);
                    float _3906 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3908 = _3906 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3910 = fma(_3904, _3882, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3912 = fma(_3904, _3908, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3914 = fma(_3904, _3888, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3916 = fma(_3904, _3892, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3918 = fma(_3904, _3896, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3920 = fma(_3904, _3900, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3736 = _3914;
                    _3704 = _3918;
                    _3712 = _3910;
                    _3658 = _3916;
                    _3766 = _3912;
                    _3774 = _3920;
                    _3836 = true;
                }
                else
                {
                    _3736 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3704 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3712 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3658 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3766 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3774 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3836 = false;
    float _3922 = _3736;
    float _3924 = _3704;
    float _3926 = _3712;
    float _3928 = _3658;
    float _3930 = _3766;
    float _3932 = _3774;
    float _3934 = fma(_2747, -0.5, 0.5);
    float _3936 = precise::clamp(_3934, 0.0, 1.0);
    float _3938 = -_3922;
    float _3940 = _3938 + _3924;
    float _3942 = _3760 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3944 = -_3926;
    float _3946 = _3944 + _3928;
    out.m_107.x = 0.0;
    float _3948 = fma(_3936, _3940, _3922);
    float _3950 = fma(_3936, _3946, _3926);
    out.m_53.x = _3942;
    float _3952 = -_3930;
    float _3954 = _3952 + _3932;
    float _3956 = _3948 * 0.586610972881317138671875;
    bool _3958 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3960 = fma(_3936, _3954, _3930);
    float _3962 = fma(_3950, 0.298911988735198974609375, _3956);
    bool _3964 = _3199 > 0.0;
    bool _3966 = isnan(_3199);
    bool _3968 = _3964 || _3966;
    bool _3970 = isnan(0.0);
    bool _3972 = _3968 || _3970;
    float _3974 = fma(_3960, 0.114477999508380889892578125, _3962);
    bool _3976 = _3257 <= 0.0;
    bool _3978 = !_3972;
    bool _3980 = _3976 || _3978;
    float _3982 = -_3974;
    float _3984 = _3950 + _3982;
    float _3986 = -_3974;
    float _3988 = _3948 + _3986;
    float _3990 = -_3974;
    float _3992 = _3960 + _3990;
    float _3994 = fma(_3984, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3974);
    float _3996 = fma(_3988, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3974);
    float _3998 = fma(_3992, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3974);
    bool _4000 = !_3958;
    if (!_4000)
    {
        float _4002 = -_3133;
        float _4004 = _4002 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4006 = -_3135;
        float _4008 = _4006 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4010 = -_3137;
        float _4012 = _4010 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4014 = _4004 * _4004;
        float _4016 = fma(_4008, _4008, _4014);
        float _4018 = fma(_4012, _4012, _4016);
        float _4020 = sqrt(_4018);
        float _4022 = rsqrt(_4018);
        float _4024 = -_4020;
        float _4026 = _4024 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4028 = _4026 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4030 = precise::clamp(_4028, 0.0, 1.0);
        float _4032 = _4008 * _4022;
        float _4034 = _4004 * _4022;
        float _4036 = abs(_4030);
        float _4038 = log2(_4036);
        float _4040 = _4012 * _4022;
        float _4042 = _4032 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4044 = _2747 * _4034;
        float _4046 = -_4034;
        float _4048 = -_4042;
        float _4050 = fma(_4046, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4048);
        float _4052 = fma(_2745, _4032, _4044);
        float _4054 = -_4040;
        float _4056 = fma(_4054, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4050);
        float _4058 = fma(_2749, _4040, _4052);
        float _4060 = precise::clamp(_4058, 0.0, 1.0);
        float _4062 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4064 = _4056 + _4062;
        float _4066 = _4038 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4068 = _4064 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4070 = precise::clamp(_4068, 0.0, 1.0);
        float _4072 = exp2(_4066);
        float _4074 = _4072 * _4070;
        float _4076 = _4060 * _4074;
        float _4078 = _4076 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4080 = _4076 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4082 = _4076 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _4078;
        out.m_107.y = _4080;
        out.m_107.z = _4082;
    }
    out.m_79.x = _3994;
    out.m_79.y = _3996;
    out.m_79.z = _3998;
    if (!_3980)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _4084 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4084;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

