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
    float4 m_81 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_101 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_97 [[user(locn13)]];
    float4 m_83 [[user(locn14)]];
    float4 m_79 [[user(locn15)]];
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3728 = false;
    bool _2777 = false;
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
        float _4027 = as_type<float>(_142);
        out.gl_Position.z = _4027;
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
        float _4097 = as_type<float>(_180);
        out.gl_Position.z = _4097;
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
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _262 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
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
    float _314 = 1.0 / _278;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = 1.0 / _282;
    float _320 = _270 * _288;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _326;
    float _330 = _266 * _314;
    bool _332 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _334 = isnan(_262);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _344;
    float _348 = -_342;
    float _350 = _348 + 1.0;
    float _352 = fma(_346, _320, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _354 = _286 * _318;
    float _356 = fma(_324, _320, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = fma(_328, _320, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _360 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _362 = isnan(_262);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = _300 * _350;
    float _374 = -_300;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = -_312;
    float _392 = _390 + 1.0;
    float _394 = _312 * _376;
    float _396 = fma(_380, _330, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _398 = fma(_384, _330, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _400 = fma(_388, _330, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _402 = _370 * _392;
    float _404 = in.m_71.x;
    float _406 = in.m_71.y;
    float _408 = in.m_71.z;
    float _410 = -_370;
    float _412 = _410 + 1.0;
    float _414 = _356 * _402;
    float _416 = _358 * _402;
    float _418 = _352 * _402;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _428;
    float _432 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[143].x, _414);
    float _434 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[143].y, _416);
    float _436 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[143].z, _418);
    float _438 = fma(_422, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _440 = fma(_426, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _442 = fma(_430, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = fma(_396, _394, _432);
    float _446 = fma(_398, _394, _434);
    float _448 = fma(_400, _394, _436);
    float _450 = fma(_438, _372, _444);
    float _452 = fma(_440, _372, _446);
    float _454 = fma(_442, _372, _448);
    float _456 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].x, _450);
    float _458 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].y, _452);
    float _460 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].z, _454);
    float _462 = _456 * _404;
    float _464 = _458 * _406;
    float _466 = _460 * _408;
    bool _468 = !_316;
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
    float _556 = _532 * _554;
    float _558 = -_532;
    float _560 = _558 + 1.0;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _564 = 1.0 / _520;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _568 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _570 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _536 * _550;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _580 = fma(_574, _500, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = -_548;
    float _584 = _582 + 1.0;
    float _586 = _580 * _556;
    float _588 = _578 * _564;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _592 = _496 + _590;
    float _594 = _516 * _584;
    float _596 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _598 = fma(_588, _592, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _600 = fma(_598, _594, _596);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _604 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[117].x, _600);
    float _606 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _606;
    out.m_73.y = _570;
    out.m_73.z = _572;
    out.m_73.w = _608;
    bool _610 = !_568;
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
    float _682 = _666 * _678;
    float _684 = -_666;
    float _686 = _684 + 1.0;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _692 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _670 * _680;
    float _704 = fma(_702, _674, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _706 = _704 * _682;
    float _708 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[131].x, _706);
    float _710 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[132].x, _708);
    float _712 = _710 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _696;
    out.m_75.y = _698;
    out.m_75.z = _700;
    out.m_75.w = _712;
    bool _714 = !_692;
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
    float _748 = in.m_61.w;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _752 = _742 + _750;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _756 = _754 != 0;
    float _758 = in.m_63.w;
    float _760 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _762 = int(_760);
    bool _764 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _766 = isnan(_742);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = float(_746);
    float _778 = -_774;
    float _780 = _778 + 1.0;
    float _782 = 1.0 / _776;
    float _784 = float(uint(_762));
    int _786 = ~_762;
    int _788 = _786 + 1;
    int _790 = ~_762;
    int _792 = _790 + 1;
    float _794 = 1.0 / _784;
    bool _796 = _762 == 0;
    float _798 = _782 * _160;
    float _800 = trunc(_798);
    int _802 = int(_800);
    int _804 = as_type<int>(_794) + (-2);
    float _806 = float(uint(_802));
    float _808 = as_type<float>(_804) * _806;
    float _810 = trunc(_808);
    float _812 = precise::max(_810, 0.0);
    uint _815 = uint(_812);
    int _817 = _788 * int(_815);
    int _819 = _817 + _802;
    float _821 = in.m_69.x;
    float _823 = float(uint(_819));
    float _825 = as_type<float>(_804) * _823;
    float _827 = trunc(_825);
    float _829 = precise::max(_827, 0.0);
    uint _831 = uint(_829);
    bool _833 = !_756;
    float _835 = _833 ? 7.345489978790283203125 : 1.0;
    float _837 = _821 * 2.0;
    float _839 = _835 * _821;
    int _841 = int(_815) + int(_831);
    float _843 = float(_762);
    float _845 = floor(_837);
    float _847 = float(_802);
    bool _849 = _847 >= _843;
    bool _851 = isnan(_847);
    bool _853 = _849 || _851;
    bool _855 = isnan(_843);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    int _861 = _792 * _841;
    int _863 = _861 + _802;
    float _865 = float(_126);
    bool _867 = uint(_863) >= uint(_762);
    float _869 = trunc(_859);
    int _871 = int(_869);
    bool _873 = !_867;
    int _875 = _873 ? 0 : (-1);
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _887 = _885 != 0;
    int _889 = ~_841;
    int _891 = _889 + _875;
    int _893 = _891 + 1;
    float _895 = floor(_839);
    int _897 = _762 * _893;
    int _899 = _897 + _802;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _903 = _901 != 0;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _907 = _905 != 0;
    float _909 = 1.0 / _865;
    int _911 = ~_871;
    int _913 = _911 + 1;
    int _915 = _913 + 1;
    bool _917 = !_796;
    int _919 = _917 ? _899 : (-1);
    float _921 = -_895;
    float _923 = _839 + _921;
    int _925 = _919 * _915;
    int _927 = _762 + (-1);
    float _929 = _923 * _843;
    float _931 = _843 * _160;
    bool _933 = !_883;
    int _935 = _933 ? 0 : 1;
    int _937 = _871 * _927;
    int _939 = _937 + _925;
    float _941 = trunc(_929);
    int _943 = int(_941);
    float _945 = _931 * _909;
    bool _947 = !_903;
    int _949 = _947 ? 0 : 1;
    bool _951 = !_879;
    int _953 = _951 ? 0 : 1;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _957 = _955 != 0;
    float _959 = trunc(_945);
    int _961 = int(_959);
    int _963 = abs(_935);
    bool _965 = !_887;
    int _967 = _965 ? 0 : 1;
    int _969 = abs(_949);
    int _971 = abs(_953);
    int _973 = abs(_967);
    int _975 = _939 * _963;
    bool _977 = !_957;
    int _979 = _977 ? 0 : 1;
    int _981 = _943 * _969;
    int _983 = _981 + _802;
    int _985 = _939;
    bool _987 = _957;
    float _989 = as_type<float>(_969);
    if (_907)
    {
        float _991 = -_182;
        float _993 = _991 + 1.0;
        _985 = as_type<int>(_993);
    }
    int _995 = _985;
    int _997 = abs(_979);
    int _999 = _961 * _971;
    int _1001 = _999 + _975;
    if (_907)
    {
        bool _1003 = _821 > 0.5;
        _987 = _1003;
    }
    bool _1005 = _987;
    int _1007 = ~_762;
    int _1009 = _1007 + 1;
    int _1011 = _983 * _973;
    int _1013 = _1011 + _1001;
    if (!_907)
    {
        _989 = _182;
    }
    float _1015 = _989;
    float _1017 = _1015;
    if (_907)
    {
        float _1019 = _1005 ? as_type<float>(_995) : _182;
        _1017 = _1019;
    }
    float _1021 = _1017;
    int _1023 = _943 * _997;
    int _1025 = _1023 + _1013;
    float _1027 = in.m_69.y;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1031 = _1029 != 0;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1035 = _1033 != 0;
    float _1037 = in.m_77.y;
    float _1039 = float(uint(_1025));
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1043 = _1041 != 0;
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1047 = _1045 != 0;
    float _1049 = as_type<float>(_804) * _1039;
    float _1051 = float(uint(_983));
    float _1053 = in.m_50.x;
    float _1055 = in.m_50.y;
    float _1057 = in.m_50.z;
    bool _1059 = !_1031;
    int _1061 = _1059 ? 0 : 1;
    bool _1063 = _845 >= 0.0;
    bool _1065 = isnan(_845);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan(0.0);
    bool _1071 = _1067 || _1069;
    float _1073 = trunc(_1049);
    float _1075 = precise::max(_1073, 0.0);
    uint _1077 = uint(_1075);
    float _1079 = as_type<float>(_804) * _1051;
    int _1081 = _1071 ? 0 : 1;
    float _1083 = 0.0;
    if (!_1043)
    {
        _1083 = _182;
    }
    float _1085 = _1083;
    int _1087 = _1009 * int(_1077);
    int _1089 = _1087 + _1025;
    float _1091 = _208 * _1055;
    float _1093 = float(uint(_1089));
    float _1095 = _196 * _1055;
    float _1097 = _202 * _1055;
    float _1099 = fma(_206, _1053, _1091);
    float _1101 = as_type<float>(_804) * _1093;
    float _1103 = _1055 + _1037;
    float _1105 = fma(_194, _1053, _1095);
    float _1107 = trunc(_1079);
    float _1109 = precise::max(_1107, 0.0);
    uint _1111 = uint(_1109);
    float _1113 = fma(_200, _1053, _1097);
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1117 = _821 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1121 = trunc(_1101);
    float _1123 = precise::max(_1121, 0.0);
    uint _1125 = uint(_1123);
    float _1127 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1129 = fma(_198, _1057, _1105);
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1135 = -_1115;
    float _1137 = fma(_1117, 2.0, _1135);
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1143 = ~_762;
    int _1145 = _1143 + 1;
    float _1147 = in.m_69.z;
    int _1149 = ~_762;
    int _1151 = _1149 + 1;
    float _1153 = fma(_1127, -2.0, _1119);
    float _1155 = 1.0 / _1133;
    float _1157 = fma(_210, _1057, _1099);
    int _1159 = int(_1077) + int(_1125);
    int _1161 = _1151 * int(_1111);
    int _1163 = _1161 + _983;
    float _1165 = 1.0 / _1141;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1169 = _1167 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1171 = fma(_204, _1057, _1113);
    float _1173 = float(uint(_1163));
    float _1175 = _1171 + _758;
    float _1177 = 1.0 / _1169;
    int _1179 = _1145 * _1159;
    int _1181 = _1179 + _1025;
    float _1183 = as_type<float>(_804) * _1173;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1191 = _1189 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1193 = uint(_1181) >= uint(_762);
    float _1195 = -_186;
    float _1197 = _1195 + 1.0;
    float _1199 = trunc(_1183);
    float _1201 = precise::max(_1199, 0.0);
    uint _1203 = uint(_1201);
    float _1205 = _1191 * _1165;
    bool _1207 = !_1193;
    int _1209 = _1207 ? 0 : (-1);
    float _1211 = _1187 * _1155;
    bool _1213 = _1027 > 0.5;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1217 = _1215 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _1219 = ~_1159;
    int _1221 = _1219 + _1209;
    int _1223 = _1221 + 1;
    int _1225 = _1213 ? as_type<int>(_1197) : as_type<int>(_186);
    bool _1227 = _1147 > 0.5;
    float _1229 = _1035 ? as_type<float>(_1225) : _186;
    float _1231 = _1085;
    if (_1047)
    {
        float _1233 = _1227 ? _1197 : _186;
        _232 = _1233;
    }
    float _1235 = _232;
    int _1237 = _762 * _1223;
    int _1239 = _1237 + _1025;
    bool _1241 = !_796;
    int _1243 = _1241 ? _1239 : (-1);
    int _1245 = int(_1111) + int(_1203);
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1247;
    int _1251 = _1243 & 3;
    bool _1253 = _1251 != 0;
    float _1255 = 1.0 / _1217;
    int _1257 = _1243 & 3;
    bool _1259 = _1257 != 0;
    float _1261 = _1249 * _1177;
    bool _1263 = uint(_1251) > 1u;
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1267 = _1265 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _1269 = ~_762;
    int _1271 = _1269 + 1;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1275 = _1273 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _1277 = _1259 ? 0 : 1;
    int _1279 = _1271 * _1245;
    int _1281 = _1279 + _983;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1285 = _1283 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1287 = 1.0 / _1275;
    int _1289 = ~_1277;
    int _1291 = _1289 + 1;
    int _1293 = _1291 + 1;
    int _1295 = _1293;
    if (!_1263)
    {
        int _1297 = ~_1277;
        int _1299 = _1297 + 1;
        _1295 = _1299;
    }
    int _1301 = _1295;
    float _1303 = _1027 * 2.0;
    bool _1305 = uint(_1281) >= uint(_762);
    float _1307 = _1267 * _1255;
    bool _1309 = uint(_1251) >= 2u;
    float _1311 = 1.0 / _1285;
    bool _1313 = !_1305;
    int _1315 = _1313 ? 0 : (-1);
    int _1317 = _1309 ? 0 : 1;
    bool _1319 = _1027 > 0.5;
    bool _1321 = _1319 && _1043;
    int _1323 = ~_1245;
    int _1325 = _1323 + _1315;
    int _1327 = _1325 + 1;
    float _1329 = floor(_1303);
    bool _1331 = _1251 != 3;
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1337 = _762 * _1327;
    int _1339 = _1337 + _983;
    int _1341 = _1243 >> 31;
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1345 = _742 + _1343;
    bool _1347 = !_1253;
    int _1349 = _1347 ? 0 : 1;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1351;
    bool _1355 = !_796;
    int _1357 = _1355 ? _1339 : (-1);
    float _1359 = as_type<float>(_1341);
    float _1361 = as_type<float>(_1339);
    if (_1321)
    {
        float _1363 = -_182;
        float _1365 = _1363 + 1.0;
        _234 = _1365;
    }
    float _1367 = _234;
    float _1369 = 1.0 / _1335;
    float _1371 = _1353 * _1311;
    int _1373 = ~_1317;
    int _1375 = _1373 + 1;
    int _1377 = _1375 + 1;
    float _1379 = fma(_1261, _1345, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1381 = _1377;
    if (_1331)
    {
        int _1383 = ~_1317;
        int _1385 = _1383 + 1;
        _1381 = _1385;
    }
    int _1387 = _1381;
    float _1389 = _1147 * 2.0;
    bool _1391 = _1329 > 0.0;
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1395 = _742 + _1393;
    bool _1397 = _1329 >= 0.0;
    bool _1399 = isnan(_1329);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan(0.0);
    bool _1405 = _1401 || _1403;
    float _1407 = _821 + _1027;
    int _1409 = _1341 & 3;
    float _1411 = floor(_1389);
    if (_1043)
    {
        _1231 = _1367;
    }
    float _1413 = _1231;
    float _1415 = _1407 + (-1.0);
    int _1417 = _1243 + _1409;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1421 = _742 + _1419;
    bool _1423 = _1251 != 3;
    float _1425 = fma(_1415, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1427 = _1417 >> 2;
    float _1429 = fma(_1211, _1421, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    if (_756)
    {
        _1359 = _821;
    }
    float _1431 = _1359;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1435 = _742 + _1433;
    int _1437 = _1427 << 4;
    int _1439 = _1437 + 368;
    float _1441 = fma(_1307, _1395, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1443 = _1431;
    if (_756)
    {
        _1361 = _1027;
    }
    float _1445 = _1361;
    float _1447 = fma(_1371, _1435, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    uint _1449 = uint(int(uint(_1439) >> uint(2)));
    uint _1451 = uint(int(uint(int(_1449)) >> uint(2)));
    int _1453 = int(_1449) & 3;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[int(_1451)][_1453];
    int _1457 = int(_1449) + 1;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    int _1461 = _1457 & 3;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[int(_1459)][_1461];
    bool _1465 = !_1423;
    int _1467 = _1465 ? 0 : (-1);
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1473 = _1445;
    if (!_756)
    {
        _1443 = _1147;
    }
    float _1475 = _1443;
    if (!_756)
    {
        _1473 = _821;
    }
    float _1477 = _1473;
    float _1479 = _1471 * _1287;
    int _1481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1483 = _1481 != 0;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1487 = _1485 != 0;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1491 = _1489 != 0;
    int _1493 = _1439 + 8;
    uint _1495 = uint(int(uint(_1493) >> uint(2)));
    uint _1497 = uint(int(uint(int(_1495)) >> uint(2)));
    int _1499 = int(_1495) & 3;
    float _1501 = (*spvDescriptorSet0.vp_c9)._m0[int(_1497)][_1499];
    int _1503 = int(_1495) + 1;
    uint _1505 = uint(int(uint(_1503) >> uint(2)));
    int _1507 = _1503 & 3;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[int(_1505)][_1507];
    bool _1511 = _1411 > 0.0;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1515 = _742 + _1513;
    bool _1517 = _1411 >= 0.0;
    bool _1519 = isnan(_1411);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan(0.0);
    bool _1525 = _1521 || _1523;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1529 = _742 + _1527;
    float _1531 = fma(_1479, _1515, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1533 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1535 = isnan(_742);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = fma(_1205, _1529, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1547 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1549 = isnan(_742);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1555 = _1551 || _1553;
    float _1557 = float(_1555);
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1559;
    bool _1563 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1565 = isnan(_742);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1571 = _1567 || _1569;
    float _1573 = float(_1571);
    float _1575 = -_1543;
    float _1577 = _1575 + 1.0;
    int _1579 = abs(_1301);
    float _1581 = _1561 * _1369;
    float _1583 = -_1557;
    float _1585 = _1583 + 1.0;
    float _1587 = _1557 * _1577;
    bool _1589 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1591 = isnan(_742);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = in.m_65.w;
    float _1603 = _1573 * _1585;
    float _1605 = -_1573;
    float _1607 = _1605 + 1.0;
    float _1609 = fma(_1581, _752, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1611 = _1599 * _780;
    float _1613 = -_1599;
    float _1615 = _1613 + 1.0;
    float _1617 = _774 * _1607;
    bool _1619 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1621 = isnan(_742);
    bool _1623 = _1619 || _1621;
    bool _1625 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1627 = _1623 || _1625;
    float _1629 = float(_1627);
    float _1631 = _1129 + _748;
    bool _1633 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1635 = isnan(_742);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    bool _1645 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1647 = isnan(_742);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1653 = _1649 || _1651;
    float _1655 = float(_1653);
    float _1657 = _1629 * _1615;
    float _1659 = -_1629;
    float _1661 = _1659 + 1.0;
    int _1663 = abs(_1349);
    float _1665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1667 = _1655 * _1661;
    float _1669 = -_1655;
    float _1671 = _1669 + 1.0;
    int _1673 = ~_1579;
    int _1675 = _1673 + 1;
    int _1677 = _1675 + 1;
    float _1679 = _1643 * _1671;
    int _1681 = ~_1663;
    int _1683 = _1681 + 1;
    int _1685 = _1683 + 1;
    float _1687 = _1157 + _1601;
    int _1689 = abs(_1387);
    int _1691 = _1677 * as_type<int>(_1463);
    float _1693 = _1429 * _1679;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1697 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1699 = _1631 + _1697;
    int _1701 = _1685 * as_type<int>(_1455);
    int _1703 = _1701 + _1691;
    float _1705 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1707 = int(_1705);
    float _1709 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1713 = _1175 + _1711;
    float _1715 = _1699 * _1699;
    float _1717 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1719 = ~_1689;
    int _1721 = _1719 + 1;
    int _1723 = _1721 + 1;
    float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1727 = _1687 + _1725;
    float _1729 = fma(_1713, _1713, _1715);
    int _1731 = abs(_1467);
    float _1733 = fma(_1709, _1235, -0.5);
    int _1735 = _1723 * as_type<int>(_1501);
    int _1737 = _1735 + _1703;
    float _1739 = fma(_1727, _1727, _1729);
    float _1741 = -_1695;
    float _1743 = fma(_1717, 2.0, _1741);
    int _1745 = abs(_1061);
    float _1747 = sqrt(_1739);
    float _1749 = float(uint(_1707));
    float _1751 = -_1643;
    float _1753 = _1751 + 1.0;
    int _1755 = ~_1731;
    int _1757 = _1755 + 1;
    int _1759 = _1757 + 1;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1763 = ~_1745;
    int _1765 = _1763 + 1;
    int _1767 = _1765 + 1;
    float _1769 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1693);
    int _1771 = abs(_1707);
    int _1773 = _1759 * as_type<int>(_1509);
    int _1775 = _1773 + _1737;
    float _1777 = 1.0 / _1749;
    float _1779 = _1477 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1781 = _1405 ? 0 : 1;
    int _1783 = _1775 * _1767;
    float _1785 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1787 = _845 > 0.0;
    float _1789 = fma(_1779, -2.0, _1761);
    int _1791 = _1357 * _1745;
    int _1793 = _1791 + _1783;
    float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1797 = float(uint(_1771));
    float _1799 = _1785 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1801 = _1747 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1803 = float(uint(_1793));
    float _1805 = fma(_1545, _1667, _1769);
    int _1807 = ~_1781;
    int _1809 = _1807 + 1;
    int _1811 = _1809 + 1;
    float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1815 = _1103 + _1813;
    float _1817 = rsqrt(_1739);
    float _1819 = precise::min(_1799, _1801);
    float _1821 = fma(_1379, _1657, _1805);
    int _1823 = as_type<int>(_1777) + (-2);
    float _1825 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1827 = _1525 ? 0 : 1;
    float _1829 = fma(_1441, _1611, _1821);
    int _1831 = _1811;
    if (!_1391)
    {
        int _1833 = ~_1781;
        int _1835 = _1833 + 1;
        _1831 = _1835;
    }
    int _1837 = _1831;
    float _1839 = 1.0 / _1797;
    float _1841 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1843 = as_type<float>(_1823) * _1803;
    int _1845 = abs(_1793);
    float _1847 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1825);
    float _1849 = fma(_1841, _1413, -0.5);
    int _1851 = ~_1081;
    int _1853 = _1851 + 1;
    int _1855 = _1853 + 1;
    float _1857 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1789);
    float _1859 = _1817 * _1819;
    int _1861 = _1855;
    if (!_1787)
    {
        int _1863 = ~_1081;
        int _1865 = _1863 + 1;
        _1861 = _1865;
    }
    int _1867 = _1861;
    float _1869 = trunc(_1843);
    float _1871 = precise::max(_1869, 0.0);
    uint _1873 = uint(_1871);
    int _1875 = ~_1827;
    int _1877 = _1875 + 1;
    int _1879 = _1877 + 1;
    float _1881 = _1713 * _1859;
    int _1883 = _1879;
    if (!_1511)
    {
        int _1885 = ~_1827;
        int _1887 = _1885 + 1;
        _1883 = _1887;
    }
    int _1889 = _1883;
    float _1891 = _1699 * _1859;
    float _1893 = float(uint(_1845));
    float _1895 = -_1881;
    float _1897 = _1713 + _1895;
    int _1899 = as_type<int>(_1839) + (-2);
    float _1901 = -_1891;
    float _1903 = _1699 + _1901;
    int _1905 = ~_1707;
    int _1907 = _1905 + 1;
    float _1909 = _1897 * _1897;
    float _1911 = _1727 * _1859;
    float _1913 = fma(_1447, _1617, _1829);
    float _1915 = fma(_1903, _1903, _1909);
    float _1917 = as_type<float>(_1899) * _1893;
    int _1919 = _1907 * int(_1873);
    int _1921 = _1919 + _1793;
    float _1923 = -_1911;
    float _1925 = _1727 + _1923;
    bool _1927 = !_1483;
    int _1929 = _1927 ? 0 : 1;
    float _1931 = fma(_1531, _1603, _1913);
    int _1933 = ~_1707;
    int _1935 = _1933 + 1;
    float _1937 = trunc(_1917);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    float _1943 = float(uint(_1921));
    float _1945 = fma(_1925, _1925, _1915);
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1949 = ~_1771;
    int _1951 = _1949 + 1;
    float _1953 = as_type<float>(_1823) * _1943;
    float _1955 = float(_1889);
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1959 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1947);
    float _1961 = sqrt(_1945);
    int _1963 = ~_1771;
    int _1965 = _1963 + 1;
    float _1967 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1957);
    float _1969 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1959);
    float _1971 = -_160;
    float _1973 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1743);
    float _1975 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1847);
    int _1977 = _1951 * int(_1941);
    int _1979 = _1977 + _1845;
    float _1981 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1967);
    float _1983 = trunc(_1953);
    float _1985 = precise::max(_1983, 0.0);
    uint _1987 = uint(_1985);
    float _1989 = fma(_1969, _1849, _1973);
    float _1991 = fma(_1815, _1815, _1715);
    float _1993 = float(uint(_1979));
    float _1995 = -_1857;
    float _1997 = fma(_1981, _1733, _1995);
    int _1999 = abs(_1929);
    float _2001 = fma(_1727, _1727, _1991);
    bool _2003 = _1975 >= 0.0;
    float _2005 = as_type<float>(_1899) * _1993;
    float _2007 = _1817 * _1961;
    float _2009 = _1989 + 0.5;
    float _2011 = rsqrt(_2001);
    float _2013 = _1785 * _2007;
    float _2015 = _1997 + 0.5;
    float _2017 = float(_1999);
    float _2019 = fma(_1609, _1587, _1931);
    int _2021 = int(_1873) + int(_1987);
    float _2023 = _2013 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_79.x = _2009;
    out.m_79.y = _2015;
    float _2025 = trunc(_2005);
    float _2027 = precise::max(_2025, 0.0);
    uint _2029 = uint(_2027);
    float _2031 = _1931;
    int _2033 = as_type<int>(_2009);
    float _2035 = _1911;
    if (_2003)
    {
        _2031 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2037 = _2031;
    int _2039 = _1935 * _2021;
    int _2041 = _2039 + _1793;
    float _2043 = _2017 * _1955;
    bool _2045 = _1707 == 0;
    float _2047 = fma(_1543, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2019);
    out.m_81.w = _1819;
    bool _2049 = uint(_2041) >= uint(_1707);
    float _2051 = _2023 * _2011;
    if (_2003)
    {
        float _2053 = _2037 * 5.0;
        _2033 = as_type<int>(_2053);
    }
    int _2055 = _2033;
    float _2057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2059 = _1815 * _2051;
    float _2061 = _1699 * _2051;
    float _2063 = _1727 * _2051;
    float _2065 = _2061;
    if (_2003)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6931 = as_type<float>(_2055);
        out.gl_Position.z = _6931;
    }
    int _2067 = int(_1941) + int(_2029);
    float _2069 = -_2059;
    float _2071 = _1815 + _2069;
    float _2073 = -_2061;
    float _2075 = _1699 + _2073;
    float _2077 = -_2063;
    float _2079 = _1727 + _2077;
    out.m_83.x = _2047;
    int _2081 = _1965 * _2067;
    int _2083 = _2081 + _1845;
    bool _2085 = !_2049;
    int _2087 = _2085 ? 0 : (-1);
    float _2089 = _2071 * _2071;
    bool _2091 = _1707 == 0;
    if (_2003)
    {
        out.m_53.x = 0.0;
    }
    bool _2093 = uint(_2083) >= uint(_1771);
    float _2095 = fma(_2075, _2075, _2089);
    int _2097 = _1793 ^ _1707;
    float _2099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2101 = ~_2021;
    int _2103 = _2101 + _2087;
    int _2105 = _2103 + 1;
    float _2107 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2109 = !_2093;
    int _2111 = _2109 ? 0 : (-1);
    float _2113 = fma(_2079, _2079, _2095);
    uint _2115 = uint(int(uint(_2097) >> uint(31)));
    int _2117 = _1707 * _2105;
    int _2119 = _2117 + _1793;
    int _2121 = ~_2111;
    int _2123 = _2067 + _2121;
    int _2125 = _2123 + 1;
    float _2127 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2129 = log2(_2127);
    int _2131 = ~int(_2115);
    int _2133 = _2131 + 1;
    float _2135 = fma(_2107, _1021, -0.5);
    bool _2137 = !_2091;
    int _2139 = _2137 ? _2119 : (-1);
    float _2141 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1153);
    int _2143 = _2125 ^ _2133;
    float _2145 = -_160;
    float _2147 = fma(_2145, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1137);
    float _2149 = float(_2139);
    int _2151 = ~_2133;
    int _2153 = _2151 + _2143;
    int _2155 = _2153 + 1;
    float _2157 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2159 = fma(_2107, _2149, _2147);
    bool _2161 = !_2045;
    int _2163 = _2161 ? _2155 : (-1);
    float _2165 = _2099 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2167 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2157);
    float _2169 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2171 = _2129 * _160;
    float _2173 = float(_2163);
    float _2175 = sqrt(_2113);
    float _2177 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2169);
    float _2179 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2167);
    float _2181 = fma(_2165, _1229, -0.5);
    float _2183 = -_2141;
    float _2185 = fma(_2165, _2173, _2183);
    float _2187 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2177);
    float _2189 = fma(_2179, _2135, _2159);
    bool _2191 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2193 = isnan(0.0);
    bool _2195 = _2191 || _2193;
    bool _2197 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2199 = _2195 || _2197;
    float _2201 = exp2(_2171);
    float _2203 = fma(_2187, _2181, _2185);
    float _2205 = _2189 + 0.5;
    bool _2207 = !_1487;
    int _2209 = _2207 ? 0 : 1;
    float _2211 = in.m_85.x;
    float _2213 = in.m_85.y;
    float _2215 = in.m_85.z;
    bool _2217 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2219 = isnan(1.0);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2225 = _2221 || _2223;
    float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2229 = 1.0 + _2227;
    float _2231 = _2011 * _2175;
    float _2233 = _2203 + 0.5;
    bool _2235 = !_1491;
    int _2237 = _2235 ? 0 : 1;
    float _2239 = 1.0 / _2229;
    float _2241 = _2013 * _2231;
    out.m_87.x = _2205;
    out.m_87.y = _2233;
    float _2243 = -_2201;
    float _2245 = _2243 + 1.0;
    out.m_89.x = _2241;
    float _2247 = _2215;
    if (_2003)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2249 = -_2059;
    float _2251 = _1103 + _2249;
    float _2253 = _2043 * (-2.0);
    float _2255 = -_2061;
    float _2257 = _1631 + _2255;
    float _2259 = _2199 ? _2245 : 0.0;
    float _2261 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2263 = _2251 + _2261;
    float _2265 = fma(_2253, _2211, _2211);
    float _2267 = _821 + (-0.5);
    float _2269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2271 = _2257 + _2269;
    float _2273 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2275 = fma(_1425, _2253, _1425);
    int _2277 = abs(_2209);
    float _2279 = fma(_2267, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2265);
    float _2281 = float(_1867);
    float _2283 = -_2063;
    float _2285 = _1687 + _2283;
    float _2287 = float(_2277);
    if (_2225)
    {
        float _2289 = _2259 * _2239;
        _162 = _2289;
    }
    float _2291 = _162;
    float _2293 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2273);
    float _2295 = _1027 + _1147;
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2299 = _2285 + _2297;
    float _2301 = _2287 * _2281;
    float _2303 = _2295 + (-1.0);
    int _2305 = abs(_2237);
    float _2307 = _2301 * (-2.0);
    float _2309 = fma(_2299, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2293);
    float _2311 = fma(_2275, _2291, _2279);
    float _2313 = fma(_2303, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2315 = _1027 + (-0.5);
    float _2317 = fma(_2307, _2213, _2213);
    float _2319 = float(_1837);
    float _2321 = _821 + _1147;
    float _2323 = float(_2305);
    float _2325 = _2311 * 0.15915493667125701904296875;
    bool _2327 = _2309 >= 0.0;
    float _2329 = fma(_2313, _2307, _2313);
    float _2331 = fma(_2315, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2317);
    float _2333 = _2323 * _2319;
    float _2335 = _2321 + (-1.0);
    float _2337 = fma(_2329, _2291, _2331);
    float _2339 = _2333 * (-2.0);
    float _2341 = _2325 * 6.283185482025146484375;
    float _2343 = sin(_2341);
    float _2345 = fma(_2335, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2347 = _2337 * 0.15915493667125701904296875;
    float _2349 = fma(_2339, _2215, _2215);
    float _2351 = _1147 + (-0.5);
    if (_2327)
    {
        _2247 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2353 = _2247;
    float _2355 = fma(_2345, _2339, _2345);
    int _2357 = as_type<int>(_2353);
    if (_2327)
    {
        out.m_53.x = 0.0;
    }
    float _2359 = _2325 * 6.283185482025146484375;
    float _2361 = cos(_2359);
    if (_2327)
    {
        float _2363 = _2353 * 5.0;
        _2357 = as_type<int>(_2363);
    }
    int _2365 = _2357;
    float _2367 = fma(_2351, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2349);
    if (_2327)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7407 = as_type<float>(_2365);
        out.gl_Position.z = _7407;
    }
    float _2369 = _2347 * 6.283185482025146484375;
    float _2371 = sin(_2369);
    float _2373 = fma(_2355, _2291, _2367);
    float _2375 = _2347 * 6.283185482025146484375;
    float _2377 = cos(_2375);
    if (_2327)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2379 = in.m_91.x;
    float _2381 = in.m_91.y;
    float _2383 = in.m_91.z;
    float _2385 = _2373 * 0.15915493667125701904296875;
    float _2387 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2389 = _2007 * _2231;
    float _2391 = _2385 * 6.283185482025146484375;
    float _2393 = cos(_2391);
    float _2395 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2397 = _2361 * _2377;
    float _2399 = _2343 * _2377;
    float _2401 = _2387 * _2389;
    float _2403 = _2395 * _2389;
    float _2405 = _2343 * _2371;
    float _2407 = _2361 * _2371;
    float _2409 = _2385 * 6.283185482025146484375;
    float _2411 = sin(_2409);
    float _2413 = _2377 * _2393;
    float _2415 = _2371 * _2393;
    float _2417 = _2361 * _2393;
    float _2419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2381);
    float _2421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2379);
    float _2423 = _2343 * _2393;
    float _2425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2383);
    float _2427 = _2401 * _2419;
    float _2429 = _2241 * _2421;
    float _2431 = fma(_2411, _2397, _2405);
    float _2433 = _2403 * _2425;
    float _2435 = _2417 * _2427;
    float _2437 = -_2399;
    float _2439 = fma(_2411, _2407, _2437);
    float _2441 = -_2427;
    float _2443 = _2411 * _2441;
    float _2445 = -_2407;
    float _2447 = fma(_2411, _2399, _2445);
    float _2449 = fma(_2431, _2429, _2435);
    float _2451 = _2423 * _2427;
    float _2453 = fma(_2413, _2429, _2443);
    float _2455 = fma(_2411, _2405, _2397);
    float _2457 = fma(_2439, _2433, _2449);
    float _2459 = fma(_2447, _2429, _2451);
    float _2461 = fma(_2415, _2433, _2453);
    float _2463 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2465 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2467 = fma(_2455, _2433, _2459);
    float _2469 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2471 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2463);
    float _2473 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2465);
    float _2475 = _2417 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2477 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2469);
    bool _2479 = _2381 != 0.0;
    bool _2481 = isnan(_2381);
    bool _2483 = _2479 || _2481;
    bool _2485 = isnan(0.0);
    bool _2487 = _2483 || _2485;
    float _2489 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2473);
    float _2491 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2477);
    bool _2493 = _2379 == 0.0;
    bool _2495 = !_2487;
    bool _2497 = _2493 && _2495;
    float _2499 = _2489 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2501 = _2491 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _2503 = _2383 == 0.0;
    bool _2505 = _2503 && _2497;
    float _2507 = _1687 + _2499;
    float _2509 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2511 = _1631 + _2501;
    float _2513 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2517 = _2507 + _2515;
    float _2519 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2509);
    float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2523 = _2511 + _2521;
    float _2525 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2513);
    float _2527 = _2517 * _2517;
    float _2529 = _2417 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2531 = _2417 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2533 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2535 = fma(_2523, _2523, _2527);
    float _2537 = -_2411;
    float _2539 = fma(_2537, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2529);
    float _2541 = -_2411;
    float _2543 = fma(_2541, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2475);
    float _2545 = -_2411;
    float _2547 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2531);
    float _2549 = sqrt(_2535);
    float _2551 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2533);
    float _2553 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2519);
    float _2555 = in.m_93.x;
    float _2557 = in.m_93.y;
    float _2559 = in.m_93.z;
    float _2561 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2471);
    float _2563 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2551);
    float _2565 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2525);
    float _2567 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2569 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2571 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2573 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2575 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2567);
    float _2577 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2569);
    float _2579 = _1103 + _2571;
    float _2581 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2573);
    bool _2583 = _2549 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2585 = _2415;
    float _2587 = _2511;
    float _2589 = _2507;
    if (!_2583)
    {
        _2585 = _2579;
    }
    float _2591 = _2585;
    bool _2593 = !_2583;
    float _2595 = _2591;
    float _2597 = _2555;
    float _2599 = _2557;
    float _2601 = _2559;
    if (!_2593)
    {
        float _2603 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2607 = _2549 + _2605;
        float _2609 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2611 = rsqrt(_2535);
        float _2613 = _2607 * _2603;
        float _2615 = _2613 * 0.15915493667125701904296875;
        float _2617 = _2615 * 6.283185482025146484375;
        float _2619 = cos(_2617);
        float _2621 = _2615 * 6.283185482025146484375;
        float _2623 = sin(_2621);
        float _2625 = _2619 + (-1.0);
        float _2627 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2629 = fma(_2623, _2609, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2631 = fma(_2579, _2619, _2627);
        float _2633 = _2611 * _2629;
        float _2635 = fma(_2523, _2633, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2637 = fma(_2517, _2633, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2595 = _2631;
        _2587 = _2635;
        _2589 = _2637;
    }
    float _2639 = _2595;
    float _2641 = _2587;
    float _2643 = _2589;
    float _2645 = -_1881;
    float _2647 = _2645 + _2639;
    if (!_2505)
    {
        float _2649 = fma(_2379, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2555);
        _2597 = _2649;
    }
    float _2651 = _2597;
    if (!_2505)
    {
        float _2653 = fma(_2381, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2557);
        _2599 = _2653;
    }
    float _2655 = _2599;
    float _2657 = -_1891;
    float _2659 = _2657 + _2641;
    float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2663 = _2647 + _2661;
    if (!_2505)
    {
        float _2665 = fma(_2383, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2559);
        _2601 = _2665;
    }
    float _2667 = _2601;
    float _2669 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2539);
    float _2671 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2673 = _2659 + _2671;
    float _2675 = _2663 * _2663;
    float _2677 = -_1911;
    float _2679 = _2677 + _2643;
    float _2681 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2543);
    float _2683 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2547);
    float _2685 = fma(_2673, _2673, _2675);
    float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2689 = _2679 + _2687;
    float _2691 = _2669 * _2655;
    float _2693 = _2681 * _2655;
    float _2695 = _2683 * _2655;
    float _2697 = fma(_2689, _2689, _2685);
    float _2699 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2575);
    float _2701 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2577);
    float _2703 = fma(_2553, _2651, _2691);
    float _2705 = fma(_2561, _2651, _2693);
    float _2707 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2581);
    float _2709 = sqrt(_2697);
    float _2711 = fma(_2565, _2651, _2695);
    float _2713 = fma(_2699, _2667, _2703);
    float _2715 = fma(_2701, _2667, _2705);
    float _2717 = fma(_2707, _2667, _2711);
    float _2719 = -_1891;
    float _2721 = _1631 + _2719;
    float _2723 = -_1881;
    float _2725 = _2723 + _1103;
    float _2727 = -_1911;
    float _2729 = _1687 + _2727;
    out.m_95.x = _2713;
    out.m_95.y = _2715;
    out.m_95.z = _2717;
    bool _2731 = _2709 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2733 = isnan(_2709);
    bool _2735 = _2731 || _2733;
    bool _2737 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2739 = _2735 || _2737;
    float _2741 = _2689;
    if (!_2739)
    {
        _2741 = 1.0;
    }
    float _2743 = _2741;
    bool _2745 = !_2739;
    float _2747 = _2743;
    if (!_2745)
    {
        bool _2749 = _2709 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2751 = isnan(_2709);
        bool _2753 = _2749 || _2751;
        bool _2755 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2757 = _2753 || _2755;
        if (!_2757)
        {
            float _2759 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2761 = _2709 + _2759;
            float _2763 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2765 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2763;
            float _2767 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2769 = _2767 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2771 = 1.0 / _2765;
            float _2773 = _2761 * _2771;
            float _2775 = fma(_2773, _2769, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2747 = _2775;
            _2777 = true;
        }
        else
        {
            bool _2779 = _2709 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2781 = isnan(_2709);
            bool _2783 = _2779 || _2781;
            bool _2785 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2787 = _2783 || _2785;
            if (!_2787)
            {
                float _2789 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2791 = _2709 + _2789;
                float _2793 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2795 = _2793 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2797 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2799 = _2797 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2801 = 1.0 / _2795;
                float _2803 = _2791 * _2801;
                float _2805 = fma(_2803, _2799, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2747 = _2805;
                _2777 = true;
            }
            else
            {
                _2747 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2777 = false;
    float _2807 = _2747;
    float _2809 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2811 = _2659 + _2809;
    float _2813 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2815 = _2679 + _2813;
    float _2817 = fma(_2811, _2807, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2819 = fma(_2815, _2807, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2823 = _2817 + _2821;
    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2827 = _2819 + _2825;
    float _2829 = fma(_2823, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2831 = fma(_2827, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _8204 = float2(_2829, _2831);
    float _2833 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_8204, float2(0.0), isnan(_8204)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_8204, float2(0.0), isnan(_8204)), level(0.0)).x;
    float _2835 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2837 = _2647 + _2835;
    float _2839 = -_2061;
    float _2841 = _2839 + _2721;
    float _2843 = -_2721;
    float _2845 = _2843 + _2817;
    float _2847 = -_2729;
    float _2849 = _2847 + _2819;
    float _2851 = fma(_2837, _2807, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2853 = -_2063;
    float _2855 = _2853 + _2729;
    float _2857 = -_2725;
    float _2859 = _2857 + _2851;
    float _2861 = _2859 * _2859;
    float _2863 = fma(_2845, _2845, _2861);
    float _2865 = fma(_2849, _2849, _2863);
    float _2867 = sqrt(_2865);
    bool _2869 = _2867 > 0.0;
    float _2871 = fma(_2833, 100.0, _2725);
    float _2873 = -_2059;
    float _2875 = _2873 + _2871;
    bool _2877 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2879 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2881 = _2877 || _2879;
    bool _2883 = isnan(0.5);
    bool _2885 = _2881 || _2883;
    float _2887 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2889 = fma(_2841, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2887);
    float _2891 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2889);
    float _2893 = _2891 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2895 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2897 = 1.0 / _2893;
    float _2899 = fma(_2841, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2895);
    float _2901 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2899);
    float _2903 = _2901 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2905 = _2903 + _2893;
    float _2907 = _2905 * _2897;
    float _2909 = _2907 * 0.5;
    float _2911 = fma(_2833, 100.0, _2851);
    float _2913 = _2833;
    float _2915 = _2819;
    float _2917 = _2855;
    float _2919 = _2875;
    if (!_2869)
    {
        _2913 = _2817;
    }
    float _2921 = _2913;
    float _2923 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2925 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2923);
    bool _2927 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2929 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2931 = _2927 || _2929;
    bool _2933 = isnan(0.5);
    bool _2935 = _2931 || _2933;
    float _2937 = 1.0 / _2925;
    float _2939 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2941 = _2921;
    if (!_2869)
    {
        _2939 = _2911;
    }
    float _2943 = _2939;
    bool _2945 = !_2869;
    float _2947 = _2943;
    if (!_2945)
    {
        float _2949 = _226 * _226;
        float _2951 = fma(_222, _222, _2949);
        float _2953 = fma(_228, _228, _2951);
        float _2955 = rsqrt(_2865);
        float _2957 = sqrt(_2953);
        float _2959 = _2845 * _2955;
        float _2961 = _2859 * _2955;
        float _2963 = _2849 * _2955;
        bool _2965 = _2957 > 0.0;
        float _2967 = _2949;
        float _2969 = _2957;
        _2035 = _2959;
        if (!_2965)
        {
            _2967 = _2817;
        }
        float _2971 = _2967;
        _2941 = _2971;
        if (!_2965)
        {
            _2969 = _2911;
        }
        float _2973 = _2969;
        bool _2975 = !_2965;
        _2947 = _2973;
        if (!_2975)
        {
            float _2977 = rsqrt(_2953);
            float _2979 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2981 = _226 * _2977;
            float _2983 = _222 * _2977;
            float _2985 = _228 * _2977;
            float _2987 = _2961 * _2981;
            float _2989 = fma(_2959, _2983, _2987);
            float _2991 = _2979 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2993 = fma(_2963, _2985, _2989);
            float _2995 = _2993 * _2991;
            float _2997 = fma(_222, _2995, _2817);
            float _2999 = fma(_226, _2995, _2911);
            float _3001 = fma(_228, _2995, _2819);
            _2941 = _2997;
            _2947 = _2999;
            _2915 = _3001;
        }
    }
    float _3003 = _2941;
    float _3005 = _2947;
    float _3007 = _2915;
    float _3009 = _2035;
    float _3011 = -_2061;
    float _3013 = _3011 + _3003;
    float _3015 = -_2059;
    float _3017 = _3015 + _3005;
    float _3019 = -_2063;
    float _3021 = _3019 + _3007;
    float _3023 = _3017;
    float _3025 = _3013;
    float _3027 = _3021;
    float _3029 = _3005;
    float _3031 = _3009;
    if (_2885)
    {
        _2065 = 1.0;
    }
    float _3033 = _2065;
    float _3035 = _3033;
    if (!_2935)
    {
        float _3037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3039 = _2875 + _3037;
        float _3041 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3043 = _2841 + _3041;
        float _3045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3047 = -_2729;
        float _3049 = _3047 + _3007;
        float _3051 = _3039 * _3039;
        float _3053 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3055 = _2855 + _3053;
        float _3057 = -_2721;
        float _3059 = _3057 + _3003;
        float _3061 = -_2871;
        float _3063 = _3061 + _3005;
        float _3065 = fma(_3043, _3043, _3051);
        float _3067 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3069 = fma(_3055, _3055, _3065);
        float _3071 = sqrt(_3069);
        float _3073 = 1.0 / _2231;
        float _3075 = precise::min(_3071, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3077 = _3075 * _3045;
        float _3079 = _3067 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3081 = _3077 * _3073;
        float _3083 = _3079 * _3081;
        float _3085 = _3049 * _3081;
        float _3087 = fma(_3059, _3083, _2841);
        float _3089 = fma(_3063, _3083, _2875);
        float _3091 = fma(_3079, _3085, _2855);
        _3023 = _3089;
        _3025 = _3087;
        _3027 = _3091;
    }
    float _3093 = _3023;
    float _3095 = _3025;
    float _3097 = _3027;
    float _3099 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3101 = _2937 * _3099;
    if (!_2885)
    {
        float _3103 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3105 = _3103 * 0.15915493667125701904296875;
        float _3107 = _3105 * 6.283185482025146484375;
        float _3109 = cos(_3107);
        float _3111 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3113 = _3111 * 0.15915493667125701904296875;
        float _3115 = _3105 * 6.283185482025146484375;
        float _3117 = sin(_3115);
        float _3119 = 1.0 / _3109;
        float _3121 = _3113 * 6.283185482025146484375;
        float _3123 = cos(_3121);
        float _3125 = _3117 * _3119;
        float _3127 = _3113 * 6.283185482025146484375;
        float _3129 = sin(_3127);
        float _3131 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3133 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3131;
        float _3135 = _3123 * _3125;
        float _3137 = 1.0 / _3133;
        float _3139 = 1.0 / _3135;
        float _3141 = _3129 * _3139;
        float _3143 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3145 = fma(_3101, _3141, _3143);
        float _3147 = _3145 * _3137;
        float _3149 = precise::clamp(_3147, 0.0, 1.0);
        _3035 = _3149;
    }
    float _3151 = _3035;
    float _3153 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3155 = _3093 + _3153;
    float _3157 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3159 = _3095 + _3157;
    float _3161 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3163 = _3097 + _3161;
    float _3165 = _3155 * _3155;
    float _3167 = fma(_3159, _3159, _3165);
    float _3169 = fma(_3163, _3163, _3167);
    float _3171 = rsqrt(_3169);
    float _3173 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3175 = _3159 * _3173;
    float _3177 = _3163 * _3173;
    float _3179 = _3175 * _3175;
    float _3181 = _3177 * _3177;
    float _3183 = _3179 + _3181;
    float _3185 = sqrt(_3183);
    bool _3187 = _3185 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3191 = _3185 + _3189;
    float _3193 = _3163;
    float _3195 = _3183;
    float _3197 = _3191;
    float _3199 = _3155;
    if (_3187)
    {
        float _3201 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3193 = _3201;
    }
    float _3203 = _3193;
    if (_3187)
    {
        float _3205 = rsqrt(_3183);
        _3195 = _3205;
    }
    float _3207 = _3195;
    float _3209 = _3207;
    if (_3187)
    {
        float _3211 = _3191 * _3203;
        _3197 = _3211;
    }
    float _3213 = _3197;
    if (_3187)
    {
        float _3215 = _3213 * 0.15915493667125701904296875;
        _3029 = _3215;
    }
    float _3217 = _3029;
    float _3219 = _3165;
    float _3221 = _3217;
    if (_3187)
    {
        float _3223 = _3217 * 6.283185482025146484375;
        float _3225 = sin(_3223);
        _3219 = _3225;
    }
    float _3227 = _3219;
    float _3229 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3231 = precise::max(0.0, _3229);
    float _3233 = _3171;
    float _3235 = _3229;
    float _3237 = _3231;
    if (_3187)
    {
        float _3239 = _3217 * 6.283185482025146484375;
        float _3241 = cos(_3239);
        _3233 = _3241;
    }
    float _3243 = _3233;
    float _3245 = -_3173;
    float _3247 = -_3231;
    float _3249 = fma(_3155, _3245, _3247);
    float _3251 = _3249;
    if (_3187)
    {
        float _3253 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3235 = _3253;
    }
    float _3255 = _3235;
    if (!_3187)
    {
        _3221 = _3175;
    }
    float _3257 = _3221;
    float _3259 = _3227;
    float _3261 = _3257;
    if (_3187)
    {
        float _3263 = fma(_3227, _3255, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3259 = _3263;
    }
    float _3265 = _3259;
    float _3267 = sqrt(_3169);
    float _3269 = _3265;
    if (_3187)
    {
        float _3271 = _3243 + (-1.0);
        _3199 = _3271;
    }
    float _3273 = _3199;
    float _3275 = _3273;
    if (_3187)
    {
        float _3277 = _3207 * _3265;
        _3031 = _3277;
    }
    float _3279 = _3031;
    if (!_3187)
    {
        _3209 = _3177;
    }
    float _3281 = _3209;
    float _3283 = _3281;
    if (_3187)
    {
        float _3285 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3237 = _3285;
    }
    float _3287 = _3237;
    if (_3187)
    {
        float _3289 = _3175 * _3279;
        _3261 = _3289;
    }
    float _3291 = _3261;
    if (!_3187)
    {
        _3269 = _3179;
    }
    float _3293 = _3269;
    float _3295 = _3293;
    if (_3187)
    {
        float _3297 = _3177 * _3279;
        _3283 = _3297;
    }
    float _3299 = _3283;
    if (_3187)
    {
        float _3301 = fma(_3249, _3243, _3287);
        _3251 = _3301;
    }
    float _3303 = _3251;
    if (_3187)
    {
        float _3305 = _3291 * _3291;
        _3295 = _3305;
    }
    float _3307 = _3295;
    if (!_3187)
    {
        _3275 = _3181;
    }
    float _3309 = _3275;
    float _3311 = _3309;
    if (_3187)
    {
        float _3313 = _3299 * _3299;
        _3311 = _3313;
    }
    float _3315 = _3311;
    float _3317 = _3093 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3319 = fma(_3303, _3303, _3307);
    float _3321 = _3093 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3323 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3317);
    float _3325 = _3319 + _3315;
    float _3327 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3329 = fma(_3267, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3327);
    float _3331 = precise::clamp(_3329, 0.0, 1.0);
    float _3333 = fma(_3097, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3323);
    float _3335 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3321);
    float _3337 = rsqrt(_3325);
    float _3339 = _3333 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3341 = fma(_2855, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3343 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3345 = -_3331;
    float _3347 = _3345 + 1.0;
    float _3349 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3351 = _3093 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3353 = floor(_3341);
    float _3355 = -_3349;
    float _3357 = fma(_3355, _3343, 1.0);
    float _3359 = _3093 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3361 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3351);
    float _3363 = fma(_2841, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3365 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3359);
    float _3367 = abs(_3347);
    float _3369 = log2(_3367);
    float _3371 = _3337 * _3291;
    float _3373 = _3337 * _3303;
    float _3375 = fma(_3097, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3361);
    float _3377 = _3337 * _3299;
    float _3379 = _3371 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3381 = fma(_3097, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3365);
    float _3383 = _3375 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3385 = floor(_3363);
    float _3387 = -_3379;
    float _3389 = fma(_3373, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3387);
    float _3391 = _3381 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3393 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3395 = -_3377;
    float _3397 = fma(_3395, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3389);
    float _3399 = fma(_3097, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3335);
    float _3401 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3393);
    float _3403 = _3369 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3405 = fma(_3397, -0.5, 0.5);
    float _3407 = _3399 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3409 = fma(_3339, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3401);
    float _3411 = exp2(_3403);
    float _3413 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3415 = fma(_3397, 0.5, 0.5);
    float _3417 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3409);
    float _3419 = -_3385;
    float _3421 = _3363 + _3419;
    float _3423 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3425 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3413);
    float _3427 = log2(_3357);
    float _3429 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3423);
    float _3431 = -_3353;
    float _3433 = _3341 + _3431;
    float _3435 = _3373 + 1.0;
    float _3437 = fma(_3415, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3439 = fma(_3339, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3429);
    float _3441 = fma(_3339, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3425);
    float _3443 = 1.0 / _3417;
    float _3445 = -_3373;
    float _3447 = fma(_3411, _3435, _3445);
    float _3449 = fma(_3415, _3437, -0.212114393711090087890625);
    float _3451 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3439);
    float _3453 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3441);
    float _3455 = sqrt(_3405);
    float _3457 = fma(_3415, _3449, 1.570728778839111328125);
    float _3459 = _3427 * 0.693147182464599609375;
    float2 _9202 = float2(_3421, _3433);
    float _3461 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9202, float2(0.0), isnan(_9202)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9202, float2(0.0), isnan(_9202)), level(0.0)).x;
    float _3463 = fma(_3447, 0.5, 0.5);
    float _3465 = _3459 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3467 = _3451 * _3443;
    float _3469 = _3453 * _3443;
    float _3471 = fma(_3467, 0.5, 0.5);
    float _3473 = fma(_3469, -0.5, 0.5);
    float _3475 = _3455 * 0.636619746685028076171875;
    float3 _9230 = float3(_3471, _3473, _3465);
    float _3477 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9230, float3(0.0), isnan(_9230)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9230, float3(0.0), isnan(_9230)), level(0.0)).x;
    float _3479 = -_3457;
    float _3481 = fma(_3475, _3479, 1.0);
    float3 _9246 = float3(_3471, _3473, _3465);
    float4 _3484 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9246, float3(0.0), isnan(_9246)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9246, float3(0.0), isnan(_9246)), level(0.0)).xyzw;
    float _3486 = _3484.x;
    float _3488 = _3484.y;
    float _3490 = _3484.z;
    float _3492 = _3484.w;
    float2 _9262 = float2(_3481, _3463);
    float3 _3496 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9262, float2(0.0), isnan(_9262)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9262, float2(0.0), isnan(_9262)), level(0.0)).xyz;
    float _3498 = _3496.x;
    float _3500 = _3496.y;
    float _3502 = _3496.z;
    float _3504 = abs(_3101);
    float _3506 = log2(_3504);
    out.m_97.x = _2841;
    out.m_97.y = _2875;
    out.m_97.z = _2855;
    bool _3508 = _3267 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3510 = isnan(_3267);
    bool _3512 = _3508 || _3510;
    bool _3514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3516 = _3512 || _3514;
    out.m_99.x = _3095;
    out.m_99.y = _3093;
    out.m_99.z = _3097;
    float _3518 = _3506 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3520 = in.m_77.x;
    float _3522 = _3453;
    if (!_3516)
    {
        _2917 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3524 = _2917;
    float _3526 = _3524;
    float _3528 = _3524;
    if (!_3516)
    {
        _2919 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3530 = _2919;
    float _3532 = exp2(_3518);
    float _3534 = fma(_3532, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3536 = precise::clamp(_3534, 0.0, 1.0);
    float _3538 = fma(_3536, -2.0, 3.0);
    float _3540 = _3536 * _3536;
    float _3542 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3544 = _3369 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3546 = _3101 <= 8000.0;
    bool _3548 = isnan(_3101);
    bool _3550 = _3546 || _3548;
    bool _3552 = isnan(8000.0);
    bool _3554 = _3550 || _3552;
    float _3556 = float(_3554);
    float _3558 = _3540 * _3538;
    float _3560 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3542);
    float _3562 = _3417 * 0.5;
    float _3564 = exp2(_3544);
    float _3566 = -_3558;
    float _3568 = _3566 + 1.0;
    float _3570 = fma(_3453, -0.5, _3562);
    float _3572 = fma(_3339, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3560);
    float _3574 = fma(_3568, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3558);
    float _3576 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3572);
    float _3578 = _3451 + _3417;
    float _3580 = _3556 * _3574;
    float _3582 = _3576 + _3417;
    out.gl_Position.x = _3451;
    out.gl_Position.y = _3453;
    out.gl_Position.z = _3576;
    out.gl_Position.w = _3417;
    float _3584 = _3580 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3586 = _3578 * 0.5;
    float _3588 = _3582 * 0.5;
    float _3590 = -_3564;
    float _3592 = _3590 + 1.0;
    float _3594 = _3592 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_101.x = _3586;
    out.m_101.y = _3570;
    out.m_101.z = _3588;
    out.m_101.w = _3417;
    float _3596 = _3151 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3598 = _3530;
    float _3600 = _3530;
    if (!_3516)
    {
        _3522 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3602 = _3522;
    float _3604 = -_3461;
    float _3606 = _3604 + 1.0;
    float _3608 = _3606 * _3584;
    float _3610 = precise::clamp(_3608, 0.0, 1.0);
    float _3612 = -_3610;
    float _3614 = fma(_3612, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3616 = _3614 * _3520;
    float _3618 = _3594 * _3477;
    float _3620 = -_3594;
    float _3622 = _3620 + 1.0;
    float _3624 = _3616 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3626 = _3616;
    float _3628 = _3622;
    float _3630 = _3602;
    float _3632 = _3602;
    if (!_3516)
    {
        _3626 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3634 = _3626;
    float _3636 = _3492 * _3618;
    out.m_103.x = _3624;
    float _3638 = _3502 * _3618;
    float _3640 = fma(_3498, _3636, _3486);
    float _3642 = fma(_3500, _3636, _3488);
    float _3644 = _3492 * _3622;
    float _3646 = fma(_3492, _3638, _3490);
    float _3648 = _3636;
    float _3650 = _3634;
    float _3652 = _3634;
    if (!_3516)
    {
        _3628 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3654 = _3628;
    float _3656 = _3654;
    float _3658 = _3654;
    if (!_3516)
    {
        _3648 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3660 = _3648;
    out.m_105.x = _3640;
    out.m_105.y = _3642;
    out.m_105.z = _3646;
    out.m_105.w = _3644;
    bool _3662 = !_3516;
    float _3664 = _3660;
    float _3666 = _3660;
    if (!_3662)
    {
        bool _3668 = _3267 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3670 = isnan(_3267);
        bool _3672 = _3668 || _3670;
        bool _3674 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3676 = _3672 || _3674;
        if (!_3676)
        {
            float _3678 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3680 = _3267 + _3678;
            float _3682 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3684 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3682;
            float _3686 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3688 = _3686 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3690 = 1.0 / _3684;
            float _3692 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3694 = _3692 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3696 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3698 = _3696 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3700 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3702 = _3700 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3704 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3706 = _3704 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3708 = _3680 * _3690;
            float _3710 = precise::clamp(_3708, 0.0, 1.0);
            float _3712 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3714 = _3712 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3716 = fma(_3710, _3688, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3718 = fma(_3710, _3714, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3720 = fma(_3710, _3694, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3722 = fma(_3710, _3698, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3724 = fma(_3710, _3702, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3726 = fma(_3710, _3706, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3658 = _3720;
            _3600 = _3724;
            _3632 = _3716;
            _3528 = _3722;
            _3652 = _3718;
            _3666 = _3726;
            _3728 = true;
        }
        else
        {
            bool _3730 = _3267 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3732 = isnan(_3267);
            bool _3734 = _3730 || _3732;
            bool _3736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3738 = _3734 || _3736;
            if (!_3738)
            {
                _3630 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3740 = _3630;
            _3632 = _3740;
            if (!_3738)
            {
                _3656 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3742 = _3656;
            _3658 = _3742;
            if (!_3738)
            {
                _3650 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3744 = _3650;
            _3652 = _3744;
            if (!_3738)
            {
                _3526 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3746 = _3526;
            _3528 = _3746;
            if (!_3738)
            {
                _3598 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3748 = _3598;
            _3600 = _3748;
            if (!_3738)
            {
                _3664 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3750 = _3664;
            bool _3752 = !_3738;
            _3666 = _3750;
            if (!_3752)
            {
                bool _3754 = _3267 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3756 = isnan(_3267);
                bool _3758 = _3754 || _3756;
                bool _3760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3762 = _3758 || _3760;
                if (!_3762)
                {
                    float _3764 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3766 = _3267 + _3764;
                    float _3768 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3770 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3768;
                    float _3772 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3774 = _3772 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3776 = 1.0 / _3770;
                    float _3778 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3780 = _3778 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3782 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3784 = _3782 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3786 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3788 = _3786 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3792 = _3790 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3794 = _3766 * _3776;
                    float _3796 = precise::clamp(_3794, 0.0, 1.0);
                    float _3798 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3800 = _3798 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3802 = fma(_3796, _3774, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3804 = fma(_3796, _3800, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3806 = fma(_3796, _3780, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3808 = fma(_3796, _3784, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3810 = fma(_3796, _3788, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3812 = fma(_3796, _3792, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3658 = _3806;
                    _3600 = _3810;
                    _3632 = _3802;
                    _3528 = _3808;
                    _3652 = _3804;
                    _3666 = _3812;
                    _3728 = true;
                }
                else
                {
                    _3658 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3600 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3632 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3528 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3652 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3666 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3728 = false;
    float _3814 = _3658;
    float _3816 = _3600;
    float _3818 = _3632;
    float _3820 = _3528;
    float _3822 = _3652;
    float _3824 = _3666;
    float _3826 = fma(_2715, -0.5, 0.5);
    float _3828 = precise::clamp(_3826, 0.0, 1.0);
    float _3830 = -_3814;
    float _3832 = _3830 + _3816;
    float _3834 = _3596 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3836 = -_3818;
    float _3838 = _3836 + _3820;
    float _3840 = fma(_3828, _3832, _3814);
    out.m_107.x = 0.0;
    float _3842 = -_3822;
    float _3844 = _3842 + _3824;
    float _3846 = fma(_3828, _3838, _3818);
    float _3848 = _3840 * 0.586610972881317138671875;
    out.m_53.x = _3834;
    bool _3850 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3852 = fma(_3828, _3844, _3822);
    float _3854 = fma(_3846, 0.298911988735198974609375, _3848);
    bool _3856 = _3151 > 0.0;
    bool _3858 = isnan(_3151);
    bool _3860 = _3856 || _3858;
    bool _3862 = isnan(0.0);
    bool _3864 = _3860 || _3862;
    float _3866 = fma(_3852, 0.114477999508380889892578125, _3854);
    float _3868 = -_3866;
    float _3870 = _3846 + _3868;
    float _3872 = -_3866;
    float _3874 = _3840 + _3872;
    float _3876 = -_3866;
    float _3878 = _3852 + _3876;
    float _3880 = fma(_3870, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3866);
    float _3882 = fma(_3874, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3866);
    float _3884 = fma(_3878, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3866);
    bool _3886 = !_3850;
    if (!_3886)
    {
        float _3888 = -_3093;
        float _3890 = _3888 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3892 = -_3095;
        float _3894 = _3892 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3896 = -_3097;
        float _3898 = _3896 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3900 = _3890 * _3890;
        float _3902 = fma(_3894, _3894, _3900);
        float _3904 = fma(_3898, _3898, _3902);
        float _3906 = sqrt(_3904);
        float _3908 = rsqrt(_3904);
        float _3910 = -_3906;
        float _3912 = _3910 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3914 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3916 = precise::clamp(_3914, 0.0, 1.0);
        float _3918 = _3894 * _3908;
        float _3920 = _3890 * _3908;
        float _3922 = abs(_3916);
        float _3924 = log2(_3922);
        float _3926 = _3898 * _3908;
        float _3928 = _3918 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3930 = _2715 * _3920;
        float _3932 = -_3920;
        float _3934 = -_3928;
        float _3936 = fma(_3932, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3934);
        float _3938 = fma(_2713, _3918, _3930);
        float _3940 = -_3926;
        float _3942 = fma(_3940, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3936);
        float _3944 = fma(_2717, _3926, _3938);
        float _3946 = precise::clamp(_3944, 0.0, 1.0);
        float _3948 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3950 = _3942 + _3948;
        float _3952 = _3924 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3954 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3956 = precise::clamp(_3954, 0.0, 1.0);
        float _3958 = exp2(_3952);
        float _3960 = _3958 * _3956;
        float _3962 = _3946 * _3960;
        float _3964 = _3962 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3966 = _3962 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3968 = _3962 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _3964;
        out.m_107.y = _3966;
        out.m_107.z = _3968;
    }
    out.m_81.x = _3880;
    out.m_81.y = _3882;
    out.m_81.z = _3884;
    if (_3864)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3970 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3970;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3728 = false;
    bool _2777 = false;
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
        float _4027 = as_type<float>(_142);
        out.gl_Position.z = _4027;
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
        float _4097 = as_type<float>(_180);
        out.gl_Position.z = _4097;
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
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _262 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
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
    float _314 = 1.0 / _278;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = 1.0 / _282;
    float _320 = _270 * _288;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _326;
    float _330 = _266 * _314;
    bool _332 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _334 = isnan(_262);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _344;
    float _348 = -_342;
    float _350 = _348 + 1.0;
    float _352 = fma(_346, _320, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _354 = _286 * _318;
    float _356 = fma(_324, _320, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = fma(_328, _320, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _360 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _362 = isnan(_262);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = _300 * _350;
    float _374 = -_300;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = -_312;
    float _392 = _390 + 1.0;
    float _394 = _312 * _376;
    float _396 = fma(_380, _330, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _398 = fma(_384, _330, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _400 = fma(_388, _330, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _402 = _370 * _392;
    float _404 = in.m_71.x;
    float _406 = in.m_71.y;
    float _408 = in.m_71.z;
    float _410 = -_370;
    float _412 = _410 + 1.0;
    float _414 = _356 * _402;
    float _416 = _358 * _402;
    float _418 = _352 * _402;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _428;
    float _432 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[143].x, _414);
    float _434 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[143].y, _416);
    float _436 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[143].z, _418);
    float _438 = fma(_422, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _440 = fma(_426, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _442 = fma(_430, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = fma(_396, _394, _432);
    float _446 = fma(_398, _394, _434);
    float _448 = fma(_400, _394, _436);
    float _450 = fma(_438, _372, _444);
    float _452 = fma(_440, _372, _446);
    float _454 = fma(_442, _372, _448);
    float _456 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].x, _450);
    float _458 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].y, _452);
    float _460 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].z, _454);
    float _462 = _456 * _404;
    float _464 = _458 * _406;
    float _466 = _460 * _408;
    bool _468 = !_316;
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
    float _556 = _532 * _554;
    float _558 = -_532;
    float _560 = _558 + 1.0;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _564 = 1.0 / _520;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _568 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _570 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _536 * _550;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _580 = fma(_574, _500, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = -_548;
    float _584 = _582 + 1.0;
    float _586 = _580 * _556;
    float _588 = _578 * _564;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _592 = _496 + _590;
    float _594 = _516 * _584;
    float _596 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _598 = fma(_588, _592, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _600 = fma(_598, _594, _596);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _604 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[117].x, _600);
    float _606 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _606;
    out.m_73.y = _570;
    out.m_73.z = _572;
    out.m_73.w = _608;
    bool _610 = !_568;
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
    float _682 = _666 * _678;
    float _684 = -_666;
    float _686 = _684 + 1.0;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _692 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _670 * _680;
    float _704 = fma(_702, _674, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _706 = _704 * _682;
    float _708 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[131].x, _706);
    float _710 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[132].x, _708);
    float _712 = _710 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _696;
    out.m_75.y = _698;
    out.m_75.z = _700;
    out.m_75.w = _712;
    bool _714 = !_692;
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
    float _748 = in.m_61.w;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _752 = _742 + _750;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _756 = _754 != 0;
    float _758 = in.m_63.w;
    float _760 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _762 = int(_760);
    bool _764 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _766 = isnan(_742);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = float(_746);
    float _778 = -_774;
    float _780 = _778 + 1.0;
    float _782 = 1.0 / _776;
    float _784 = float(uint(_762));
    int _786 = ~_762;
    int _788 = _786 + 1;
    int _790 = ~_762;
    int _792 = _790 + 1;
    float _794 = 1.0 / _784;
    bool _796 = _762 == 0;
    float _798 = _782 * _160;
    float _800 = trunc(_798);
    int _802 = int(_800);
    int _804 = as_type<int>(_794) + (-2);
    float _806 = float(uint(_802));
    float _808 = as_type<float>(_804) * _806;
    float _810 = trunc(_808);
    float _812 = precise::max(_810, 0.0);
    uint _815 = uint(_812);
    int _817 = _788 * int(_815);
    int _819 = _817 + _802;
    float _821 = in.m_69.x;
    float _823 = float(uint(_819));
    float _825 = as_type<float>(_804) * _823;
    float _827 = trunc(_825);
    float _829 = precise::max(_827, 0.0);
    uint _831 = uint(_829);
    bool _833 = !_756;
    float _835 = _833 ? 7.345489978790283203125 : 1.0;
    float _837 = _821 * 2.0;
    float _839 = _835 * _821;
    int _841 = int(_815) + int(_831);
    float _843 = float(_762);
    float _845 = floor(_837);
    float _847 = float(_802);
    bool _849 = _847 >= _843;
    bool _851 = isnan(_847);
    bool _853 = _849 || _851;
    bool _855 = isnan(_843);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    int _861 = _792 * _841;
    int _863 = _861 + _802;
    float _865 = float(_126);
    bool _867 = uint(_863) >= uint(_762);
    float _869 = trunc(_859);
    int _871 = int(_869);
    bool _873 = !_867;
    int _875 = _873 ? 0 : (-1);
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _887 = _885 != 0;
    int _889 = ~_841;
    int _891 = _889 + _875;
    int _893 = _891 + 1;
    float _895 = floor(_839);
    int _897 = _762 * _893;
    int _899 = _897 + _802;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _903 = _901 != 0;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _907 = _905 != 0;
    float _909 = 1.0 / _865;
    int _911 = ~_871;
    int _913 = _911 + 1;
    int _915 = _913 + 1;
    bool _917 = !_796;
    int _919 = _917 ? _899 : (-1);
    float _921 = -_895;
    float _923 = _839 + _921;
    int _925 = _919 * _915;
    int _927 = _762 + (-1);
    float _929 = _923 * _843;
    float _931 = _843 * _160;
    bool _933 = !_883;
    int _935 = _933 ? 0 : 1;
    int _937 = _871 * _927;
    int _939 = _937 + _925;
    float _941 = trunc(_929);
    int _943 = int(_941);
    float _945 = _931 * _909;
    bool _947 = !_903;
    int _949 = _947 ? 0 : 1;
    bool _951 = !_879;
    int _953 = _951 ? 0 : 1;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _957 = _955 != 0;
    float _959 = trunc(_945);
    int _961 = int(_959);
    int _963 = abs(_935);
    bool _965 = !_887;
    int _967 = _965 ? 0 : 1;
    int _969 = abs(_949);
    int _971 = abs(_953);
    int _973 = abs(_967);
    int _975 = _939 * _963;
    bool _977 = !_957;
    int _979 = _977 ? 0 : 1;
    int _981 = _943 * _969;
    int _983 = _981 + _802;
    int _985 = _939;
    bool _987 = _957;
    float _989 = as_type<float>(_969);
    if (_907)
    {
        float _991 = -_182;
        float _993 = _991 + 1.0;
        _985 = as_type<int>(_993);
    }
    int _995 = _985;
    int _997 = abs(_979);
    int _999 = _961 * _971;
    int _1001 = _999 + _975;
    if (_907)
    {
        bool _1003 = _821 > 0.5;
        _987 = _1003;
    }
    bool _1005 = _987;
    int _1007 = ~_762;
    int _1009 = _1007 + 1;
    int _1011 = _983 * _973;
    int _1013 = _1011 + _1001;
    if (!_907)
    {
        _989 = _182;
    }
    float _1015 = _989;
    float _1017 = _1015;
    if (_907)
    {
        float _1019 = _1005 ? as_type<float>(_995) : _182;
        _1017 = _1019;
    }
    float _1021 = _1017;
    int _1023 = _943 * _997;
    int _1025 = _1023 + _1013;
    float _1027 = in.m_69.y;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1031 = _1029 != 0;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1035 = _1033 != 0;
    float _1037 = in.m_77.y;
    float _1039 = float(uint(_1025));
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1043 = _1041 != 0;
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1047 = _1045 != 0;
    float _1049 = as_type<float>(_804) * _1039;
    float _1051 = float(uint(_983));
    float _1053 = in.m_50.x;
    float _1055 = in.m_50.y;
    float _1057 = in.m_50.z;
    bool _1059 = !_1031;
    int _1061 = _1059 ? 0 : 1;
    bool _1063 = _845 >= 0.0;
    bool _1065 = isnan(_845);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan(0.0);
    bool _1071 = _1067 || _1069;
    float _1073 = trunc(_1049);
    float _1075 = precise::max(_1073, 0.0);
    uint _1077 = uint(_1075);
    float _1079 = as_type<float>(_804) * _1051;
    int _1081 = _1071 ? 0 : 1;
    float _1083 = 0.0;
    if (!_1043)
    {
        _1083 = _182;
    }
    float _1085 = _1083;
    int _1087 = _1009 * int(_1077);
    int _1089 = _1087 + _1025;
    float _1091 = _208 * _1055;
    float _1093 = float(uint(_1089));
    float _1095 = _196 * _1055;
    float _1097 = _202 * _1055;
    float _1099 = fma(_206, _1053, _1091);
    float _1101 = as_type<float>(_804) * _1093;
    float _1103 = _1055 + _1037;
    float _1105 = fma(_194, _1053, _1095);
    float _1107 = trunc(_1079);
    float _1109 = precise::max(_1107, 0.0);
    uint _1111 = uint(_1109);
    float _1113 = fma(_200, _1053, _1097);
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1117 = _821 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1121 = trunc(_1101);
    float _1123 = precise::max(_1121, 0.0);
    uint _1125 = uint(_1123);
    float _1127 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1129 = fma(_198, _1057, _1105);
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1135 = -_1115;
    float _1137 = fma(_1117, 2.0, _1135);
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1143 = ~_762;
    int _1145 = _1143 + 1;
    float _1147 = in.m_69.z;
    int _1149 = ~_762;
    int _1151 = _1149 + 1;
    float _1153 = fma(_1127, -2.0, _1119);
    float _1155 = 1.0 / _1133;
    float _1157 = fma(_210, _1057, _1099);
    int _1159 = int(_1077) + int(_1125);
    int _1161 = _1151 * int(_1111);
    int _1163 = _1161 + _983;
    float _1165 = 1.0 / _1141;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1169 = _1167 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1171 = fma(_204, _1057, _1113);
    float _1173 = float(uint(_1163));
    float _1175 = _1171 + _758;
    float _1177 = 1.0 / _1169;
    int _1179 = _1145 * _1159;
    int _1181 = _1179 + _1025;
    float _1183 = as_type<float>(_804) * _1173;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1191 = _1189 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1193 = uint(_1181) >= uint(_762);
    float _1195 = -_186;
    float _1197 = _1195 + 1.0;
    float _1199 = trunc(_1183);
    float _1201 = precise::max(_1199, 0.0);
    uint _1203 = uint(_1201);
    float _1205 = _1191 * _1165;
    bool _1207 = !_1193;
    int _1209 = _1207 ? 0 : (-1);
    float _1211 = _1187 * _1155;
    bool _1213 = _1027 > 0.5;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1217 = _1215 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _1219 = ~_1159;
    int _1221 = _1219 + _1209;
    int _1223 = _1221 + 1;
    int _1225 = _1213 ? as_type<int>(_1197) : as_type<int>(_186);
    bool _1227 = _1147 > 0.5;
    float _1229 = _1035 ? as_type<float>(_1225) : _186;
    float _1231 = _1085;
    if (_1047)
    {
        float _1233 = _1227 ? _1197 : _186;
        _232 = _1233;
    }
    float _1235 = _232;
    int _1237 = _762 * _1223;
    int _1239 = _1237 + _1025;
    bool _1241 = !_796;
    int _1243 = _1241 ? _1239 : (-1);
    int _1245 = int(_1111) + int(_1203);
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1247;
    int _1251 = _1243 & 3;
    bool _1253 = _1251 != 0;
    float _1255 = 1.0 / _1217;
    int _1257 = _1243 & 3;
    bool _1259 = _1257 != 0;
    float _1261 = _1249 * _1177;
    bool _1263 = uint(_1251) > 1u;
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1267 = _1265 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _1269 = ~_762;
    int _1271 = _1269 + 1;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1275 = _1273 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _1277 = _1259 ? 0 : 1;
    int _1279 = _1271 * _1245;
    int _1281 = _1279 + _983;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1285 = _1283 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1287 = 1.0 / _1275;
    int _1289 = ~_1277;
    int _1291 = _1289 + 1;
    int _1293 = _1291 + 1;
    int _1295 = _1293;
    if (!_1263)
    {
        int _1297 = ~_1277;
        int _1299 = _1297 + 1;
        _1295 = _1299;
    }
    int _1301 = _1295;
    float _1303 = _1027 * 2.0;
    bool _1305 = uint(_1281) >= uint(_762);
    float _1307 = _1267 * _1255;
    bool _1309 = uint(_1251) >= 2u;
    float _1311 = 1.0 / _1285;
    bool _1313 = !_1305;
    int _1315 = _1313 ? 0 : (-1);
    int _1317 = _1309 ? 0 : 1;
    bool _1319 = _1027 > 0.5;
    bool _1321 = _1319 && _1043;
    int _1323 = ~_1245;
    int _1325 = _1323 + _1315;
    int _1327 = _1325 + 1;
    float _1329 = floor(_1303);
    bool _1331 = _1251 != 3;
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1337 = _762 * _1327;
    int _1339 = _1337 + _983;
    int _1341 = _1243 >> 31;
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1345 = _742 + _1343;
    bool _1347 = !_1253;
    int _1349 = _1347 ? 0 : 1;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1351;
    bool _1355 = !_796;
    int _1357 = _1355 ? _1339 : (-1);
    float _1359 = as_type<float>(_1341);
    float _1361 = as_type<float>(_1339);
    if (_1321)
    {
        float _1363 = -_182;
        float _1365 = _1363 + 1.0;
        _234 = _1365;
    }
    float _1367 = _234;
    float _1369 = 1.0 / _1335;
    float _1371 = _1353 * _1311;
    int _1373 = ~_1317;
    int _1375 = _1373 + 1;
    int _1377 = _1375 + 1;
    float _1379 = fma(_1261, _1345, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1381 = _1377;
    if (_1331)
    {
        int _1383 = ~_1317;
        int _1385 = _1383 + 1;
        _1381 = _1385;
    }
    int _1387 = _1381;
    float _1389 = _1147 * 2.0;
    bool _1391 = _1329 > 0.0;
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1395 = _742 + _1393;
    bool _1397 = _1329 >= 0.0;
    bool _1399 = isnan(_1329);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan(0.0);
    bool _1405 = _1401 || _1403;
    float _1407 = _821 + _1027;
    int _1409 = _1341 & 3;
    float _1411 = floor(_1389);
    if (_1043)
    {
        _1231 = _1367;
    }
    float _1413 = _1231;
    float _1415 = _1407 + (-1.0);
    int _1417 = _1243 + _1409;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1421 = _742 + _1419;
    bool _1423 = _1251 != 3;
    float _1425 = fma(_1415, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1427 = _1417 >> 2;
    float _1429 = fma(_1211, _1421, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    if (_756)
    {
        _1359 = _821;
    }
    float _1431 = _1359;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1435 = _742 + _1433;
    int _1437 = _1427 << 4;
    int _1439 = _1437 + 368;
    float _1441 = fma(_1307, _1395, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1443 = _1431;
    if (_756)
    {
        _1361 = _1027;
    }
    float _1445 = _1361;
    float _1447 = fma(_1371, _1435, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    uint _1449 = uint(int(uint(_1439) >> uint(2)));
    uint _1451 = uint(int(uint(int(_1449)) >> uint(2)));
    int _1453 = int(_1449) & 3;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[int(_1451)][_1453];
    int _1457 = int(_1449) + 1;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    int _1461 = _1457 & 3;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[int(_1459)][_1461];
    bool _1465 = !_1423;
    int _1467 = _1465 ? 0 : (-1);
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1473 = _1445;
    if (!_756)
    {
        _1443 = _1147;
    }
    float _1475 = _1443;
    if (!_756)
    {
        _1473 = _821;
    }
    float _1477 = _1473;
    float _1479 = _1471 * _1287;
    int _1481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1483 = _1481 != 0;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1487 = _1485 != 0;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1491 = _1489 != 0;
    int _1493 = _1439 + 8;
    uint _1495 = uint(int(uint(_1493) >> uint(2)));
    uint _1497 = uint(int(uint(int(_1495)) >> uint(2)));
    int _1499 = int(_1495) & 3;
    float _1501 = (*spvDescriptorSet0.vp_c9)._m0[int(_1497)][_1499];
    int _1503 = int(_1495) + 1;
    uint _1505 = uint(int(uint(_1503) >> uint(2)));
    int _1507 = _1503 & 3;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[int(_1505)][_1507];
    bool _1511 = _1411 > 0.0;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1515 = _742 + _1513;
    bool _1517 = _1411 >= 0.0;
    bool _1519 = isnan(_1411);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan(0.0);
    bool _1525 = _1521 || _1523;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1529 = _742 + _1527;
    float _1531 = fma(_1479, _1515, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1533 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1535 = isnan(_742);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = fma(_1205, _1529, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1547 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1549 = isnan(_742);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1555 = _1551 || _1553;
    float _1557 = float(_1555);
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1559;
    bool _1563 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1565 = isnan(_742);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1571 = _1567 || _1569;
    float _1573 = float(_1571);
    float _1575 = -_1543;
    float _1577 = _1575 + 1.0;
    int _1579 = abs(_1301);
    float _1581 = _1561 * _1369;
    float _1583 = -_1557;
    float _1585 = _1583 + 1.0;
    float _1587 = _1557 * _1577;
    bool _1589 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1591 = isnan(_742);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = in.m_65.w;
    float _1603 = _1573 * _1585;
    float _1605 = -_1573;
    float _1607 = _1605 + 1.0;
    float _1609 = fma(_1581, _752, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1611 = _1599 * _780;
    float _1613 = -_1599;
    float _1615 = _1613 + 1.0;
    float _1617 = _774 * _1607;
    bool _1619 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1621 = isnan(_742);
    bool _1623 = _1619 || _1621;
    bool _1625 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1627 = _1623 || _1625;
    float _1629 = float(_1627);
    float _1631 = _1129 + _748;
    bool _1633 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1635 = isnan(_742);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    bool _1645 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1647 = isnan(_742);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1653 = _1649 || _1651;
    float _1655 = float(_1653);
    float _1657 = _1629 * _1615;
    float _1659 = -_1629;
    float _1661 = _1659 + 1.0;
    int _1663 = abs(_1349);
    float _1665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1667 = _1655 * _1661;
    float _1669 = -_1655;
    float _1671 = _1669 + 1.0;
    int _1673 = ~_1579;
    int _1675 = _1673 + 1;
    int _1677 = _1675 + 1;
    float _1679 = _1643 * _1671;
    int _1681 = ~_1663;
    int _1683 = _1681 + 1;
    int _1685 = _1683 + 1;
    float _1687 = _1157 + _1601;
    int _1689 = abs(_1387);
    int _1691 = _1677 * as_type<int>(_1463);
    float _1693 = _1429 * _1679;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1697 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1699 = _1631 + _1697;
    int _1701 = _1685 * as_type<int>(_1455);
    int _1703 = _1701 + _1691;
    float _1705 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1707 = int(_1705);
    float _1709 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1713 = _1175 + _1711;
    float _1715 = _1699 * _1699;
    float _1717 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1719 = ~_1689;
    int _1721 = _1719 + 1;
    int _1723 = _1721 + 1;
    float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1727 = _1687 + _1725;
    float _1729 = fma(_1713, _1713, _1715);
    int _1731 = abs(_1467);
    float _1733 = fma(_1709, _1235, -0.5);
    int _1735 = _1723 * as_type<int>(_1501);
    int _1737 = _1735 + _1703;
    float _1739 = fma(_1727, _1727, _1729);
    float _1741 = -_1695;
    float _1743 = fma(_1717, 2.0, _1741);
    int _1745 = abs(_1061);
    float _1747 = sqrt(_1739);
    float _1749 = float(uint(_1707));
    float _1751 = -_1643;
    float _1753 = _1751 + 1.0;
    int _1755 = ~_1731;
    int _1757 = _1755 + 1;
    int _1759 = _1757 + 1;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1763 = ~_1745;
    int _1765 = _1763 + 1;
    int _1767 = _1765 + 1;
    float _1769 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1693);
    int _1771 = abs(_1707);
    int _1773 = _1759 * as_type<int>(_1509);
    int _1775 = _1773 + _1737;
    float _1777 = 1.0 / _1749;
    float _1779 = _1477 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1781 = _1405 ? 0 : 1;
    int _1783 = _1775 * _1767;
    float _1785 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1787 = _845 > 0.0;
    float _1789 = fma(_1779, -2.0, _1761);
    int _1791 = _1357 * _1745;
    int _1793 = _1791 + _1783;
    float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1797 = float(uint(_1771));
    float _1799 = _1785 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1801 = _1747 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1803 = float(uint(_1793));
    float _1805 = fma(_1545, _1667, _1769);
    int _1807 = ~_1781;
    int _1809 = _1807 + 1;
    int _1811 = _1809 + 1;
    float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1815 = _1103 + _1813;
    float _1817 = rsqrt(_1739);
    float _1819 = precise::min(_1799, _1801);
    float _1821 = fma(_1379, _1657, _1805);
    int _1823 = as_type<int>(_1777) + (-2);
    float _1825 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1827 = _1525 ? 0 : 1;
    float _1829 = fma(_1441, _1611, _1821);
    int _1831 = _1811;
    if (!_1391)
    {
        int _1833 = ~_1781;
        int _1835 = _1833 + 1;
        _1831 = _1835;
    }
    int _1837 = _1831;
    float _1839 = 1.0 / _1797;
    float _1841 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1843 = as_type<float>(_1823) * _1803;
    int _1845 = abs(_1793);
    float _1847 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1825);
    float _1849 = fma(_1841, _1413, -0.5);
    int _1851 = ~_1081;
    int _1853 = _1851 + 1;
    int _1855 = _1853 + 1;
    float _1857 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1789);
    float _1859 = _1817 * _1819;
    int _1861 = _1855;
    if (!_1787)
    {
        int _1863 = ~_1081;
        int _1865 = _1863 + 1;
        _1861 = _1865;
    }
    int _1867 = _1861;
    float _1869 = trunc(_1843);
    float _1871 = precise::max(_1869, 0.0);
    uint _1873 = uint(_1871);
    int _1875 = ~_1827;
    int _1877 = _1875 + 1;
    int _1879 = _1877 + 1;
    float _1881 = _1713 * _1859;
    int _1883 = _1879;
    if (!_1511)
    {
        int _1885 = ~_1827;
        int _1887 = _1885 + 1;
        _1883 = _1887;
    }
    int _1889 = _1883;
    float _1891 = _1699 * _1859;
    float _1893 = float(uint(_1845));
    float _1895 = -_1881;
    float _1897 = _1713 + _1895;
    int _1899 = as_type<int>(_1839) + (-2);
    float _1901 = -_1891;
    float _1903 = _1699 + _1901;
    int _1905 = ~_1707;
    int _1907 = _1905 + 1;
    float _1909 = _1897 * _1897;
    float _1911 = _1727 * _1859;
    float _1913 = fma(_1447, _1617, _1829);
    float _1915 = fma(_1903, _1903, _1909);
    float _1917 = as_type<float>(_1899) * _1893;
    int _1919 = _1907 * int(_1873);
    int _1921 = _1919 + _1793;
    float _1923 = -_1911;
    float _1925 = _1727 + _1923;
    bool _1927 = !_1483;
    int _1929 = _1927 ? 0 : 1;
    float _1931 = fma(_1531, _1603, _1913);
    int _1933 = ~_1707;
    int _1935 = _1933 + 1;
    float _1937 = trunc(_1917);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    float _1943 = float(uint(_1921));
    float _1945 = fma(_1925, _1925, _1915);
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1949 = ~_1771;
    int _1951 = _1949 + 1;
    float _1953 = as_type<float>(_1823) * _1943;
    float _1955 = float(_1889);
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1959 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1947);
    float _1961 = sqrt(_1945);
    int _1963 = ~_1771;
    int _1965 = _1963 + 1;
    float _1967 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1957);
    float _1969 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1959);
    float _1971 = -_160;
    float _1973 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1743);
    float _1975 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1847);
    int _1977 = _1951 * int(_1941);
    int _1979 = _1977 + _1845;
    float _1981 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1967);
    float _1983 = trunc(_1953);
    float _1985 = precise::max(_1983, 0.0);
    uint _1987 = uint(_1985);
    float _1989 = fma(_1969, _1849, _1973);
    float _1991 = fma(_1815, _1815, _1715);
    float _1993 = float(uint(_1979));
    float _1995 = -_1857;
    float _1997 = fma(_1981, _1733, _1995);
    int _1999 = abs(_1929);
    float _2001 = fma(_1727, _1727, _1991);
    bool _2003 = _1975 >= 0.0;
    float _2005 = as_type<float>(_1899) * _1993;
    float _2007 = _1817 * _1961;
    float _2009 = _1989 + 0.5;
    float _2011 = rsqrt(_2001);
    float _2013 = _1785 * _2007;
    float _2015 = _1997 + 0.5;
    float _2017 = float(_1999);
    float _2019 = fma(_1609, _1587, _1931);
    int _2021 = int(_1873) + int(_1987);
    float _2023 = _2013 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_79.x = _2009;
    out.m_79.y = _2015;
    float _2025 = trunc(_2005);
    float _2027 = precise::max(_2025, 0.0);
    uint _2029 = uint(_2027);
    float _2031 = _1931;
    int _2033 = as_type<int>(_2009);
    float _2035 = _1911;
    if (_2003)
    {
        _2031 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2037 = _2031;
    int _2039 = _1935 * _2021;
    int _2041 = _2039 + _1793;
    float _2043 = _2017 * _1955;
    bool _2045 = _1707 == 0;
    float _2047 = fma(_1543, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2019);
    out.m_81.w = _1819;
    bool _2049 = uint(_2041) >= uint(_1707);
    float _2051 = _2023 * _2011;
    if (_2003)
    {
        float _2053 = _2037 * 5.0;
        _2033 = as_type<int>(_2053);
    }
    int _2055 = _2033;
    float _2057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2059 = _1815 * _2051;
    float _2061 = _1699 * _2051;
    float _2063 = _1727 * _2051;
    float _2065 = _2061;
    if (_2003)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6931 = as_type<float>(_2055);
        out.gl_Position.z = _6931;
    }
    int _2067 = int(_1941) + int(_2029);
    float _2069 = -_2059;
    float _2071 = _1815 + _2069;
    float _2073 = -_2061;
    float _2075 = _1699 + _2073;
    float _2077 = -_2063;
    float _2079 = _1727 + _2077;
    out.m_83.x = _2047;
    int _2081 = _1965 * _2067;
    int _2083 = _2081 + _1845;
    bool _2085 = !_2049;
    int _2087 = _2085 ? 0 : (-1);
    float _2089 = _2071 * _2071;
    bool _2091 = _1707 == 0;
    if (_2003)
    {
        out.m_53.x = 0.0;
    }
    bool _2093 = uint(_2083) >= uint(_1771);
    float _2095 = fma(_2075, _2075, _2089);
    int _2097 = _1793 ^ _1707;
    float _2099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2101 = ~_2021;
    int _2103 = _2101 + _2087;
    int _2105 = _2103 + 1;
    float _2107 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2109 = !_2093;
    int _2111 = _2109 ? 0 : (-1);
    float _2113 = fma(_2079, _2079, _2095);
    uint _2115 = uint(int(uint(_2097) >> uint(31)));
    int _2117 = _1707 * _2105;
    int _2119 = _2117 + _1793;
    int _2121 = ~_2111;
    int _2123 = _2067 + _2121;
    int _2125 = _2123 + 1;
    float _2127 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2129 = log2(_2127);
    int _2131 = ~int(_2115);
    int _2133 = _2131 + 1;
    float _2135 = fma(_2107, _1021, -0.5);
    bool _2137 = !_2091;
    int _2139 = _2137 ? _2119 : (-1);
    float _2141 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1153);
    int _2143 = _2125 ^ _2133;
    float _2145 = -_160;
    float _2147 = fma(_2145, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1137);
    float _2149 = float(_2139);
    int _2151 = ~_2133;
    int _2153 = _2151 + _2143;
    int _2155 = _2153 + 1;
    float _2157 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2159 = fma(_2107, _2149, _2147);
    bool _2161 = !_2045;
    int _2163 = _2161 ? _2155 : (-1);
    float _2165 = _2099 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2167 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2157);
    float _2169 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2171 = _2129 * _160;
    float _2173 = float(_2163);
    float _2175 = sqrt(_2113);
    float _2177 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2169);
    float _2179 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2167);
    float _2181 = fma(_2165, _1229, -0.5);
    float _2183 = -_2141;
    float _2185 = fma(_2165, _2173, _2183);
    float _2187 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2177);
    float _2189 = fma(_2179, _2135, _2159);
    bool _2191 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2193 = isnan(0.0);
    bool _2195 = _2191 || _2193;
    bool _2197 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2199 = _2195 || _2197;
    float _2201 = exp2(_2171);
    float _2203 = fma(_2187, _2181, _2185);
    float _2205 = _2189 + 0.5;
    bool _2207 = !_1487;
    int _2209 = _2207 ? 0 : 1;
    float _2211 = in.m_85.x;
    float _2213 = in.m_85.y;
    float _2215 = in.m_85.z;
    bool _2217 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2219 = isnan(1.0);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2225 = _2221 || _2223;
    float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2229 = 1.0 + _2227;
    float _2231 = _2011 * _2175;
    float _2233 = _2203 + 0.5;
    bool _2235 = !_1491;
    int _2237 = _2235 ? 0 : 1;
    float _2239 = 1.0 / _2229;
    float _2241 = _2013 * _2231;
    out.m_87.x = _2205;
    out.m_87.y = _2233;
    float _2243 = -_2201;
    float _2245 = _2243 + 1.0;
    out.m_89.x = _2241;
    float _2247 = _2215;
    if (_2003)
    {
        return out;
    }
    float _2249 = -_2059;
    float _2251 = _1103 + _2249;
    float _2253 = _2043 * (-2.0);
    float _2255 = -_2061;
    float _2257 = _1631 + _2255;
    float _2259 = _2199 ? _2245 : 0.0;
    float _2261 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2263 = _2251 + _2261;
    float _2265 = fma(_2253, _2211, _2211);
    float _2267 = _821 + (-0.5);
    float _2269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2271 = _2257 + _2269;
    float _2273 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2275 = fma(_1425, _2253, _1425);
    int _2277 = abs(_2209);
    float _2279 = fma(_2267, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2265);
    float _2281 = float(_1867);
    float _2283 = -_2063;
    float _2285 = _1687 + _2283;
    float _2287 = float(_2277);
    if (_2225)
    {
        float _2289 = _2259 * _2239;
        _162 = _2289;
    }
    float _2291 = _162;
    float _2293 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2273);
    float _2295 = _1027 + _1147;
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2299 = _2285 + _2297;
    float _2301 = _2287 * _2281;
    float _2303 = _2295 + (-1.0);
    int _2305 = abs(_2237);
    float _2307 = _2301 * (-2.0);
    float _2309 = fma(_2299, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2293);
    float _2311 = fma(_2275, _2291, _2279);
    float _2313 = fma(_2303, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2315 = _1027 + (-0.5);
    float _2317 = fma(_2307, _2213, _2213);
    float _2319 = float(_1837);
    float _2321 = _821 + _1147;
    float _2323 = float(_2305);
    float _2325 = _2311 * 0.15915493667125701904296875;
    bool _2327 = _2309 >= 0.0;
    float _2329 = fma(_2313, _2307, _2313);
    float _2331 = fma(_2315, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2317);
    float _2333 = _2323 * _2319;
    float _2335 = _2321 + (-1.0);
    float _2337 = fma(_2329, _2291, _2331);
    float _2339 = _2333 * (-2.0);
    float _2341 = _2325 * 6.283185482025146484375;
    float _2343 = sin(_2341);
    float _2345 = fma(_2335, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2347 = _2337 * 0.15915493667125701904296875;
    float _2349 = fma(_2339, _2215, _2215);
    float _2351 = _1147 + (-0.5);
    if (_2327)
    {
        _2247 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2353 = _2247;
    float _2355 = fma(_2345, _2339, _2345);
    int _2357 = as_type<int>(_2353);
    if (_2327)
    {
        out.m_53.x = 0.0;
    }
    float _2359 = _2325 * 6.283185482025146484375;
    float _2361 = cos(_2359);
    if (_2327)
    {
        float _2363 = _2353 * 5.0;
        _2357 = as_type<int>(_2363);
    }
    int _2365 = _2357;
    float _2367 = fma(_2351, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2349);
    if (_2327)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7407 = as_type<float>(_2365);
        out.gl_Position.z = _7407;
    }
    float _2369 = _2347 * 6.283185482025146484375;
    float _2371 = sin(_2369);
    float _2373 = fma(_2355, _2291, _2367);
    float _2375 = _2347 * 6.283185482025146484375;
    float _2377 = cos(_2375);
    if (_2327)
    {
        return out;
    }
    float _2379 = in.m_91.x;
    float _2381 = in.m_91.y;
    float _2383 = in.m_91.z;
    float _2385 = _2373 * 0.15915493667125701904296875;
    float _2387 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2389 = _2007 * _2231;
    float _2391 = _2385 * 6.283185482025146484375;
    float _2393 = cos(_2391);
    float _2395 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2397 = _2361 * _2377;
    float _2399 = _2343 * _2377;
    float _2401 = _2387 * _2389;
    float _2403 = _2395 * _2389;
    float _2405 = _2343 * _2371;
    float _2407 = _2361 * _2371;
    float _2409 = _2385 * 6.283185482025146484375;
    float _2411 = sin(_2409);
    float _2413 = _2377 * _2393;
    float _2415 = _2371 * _2393;
    float _2417 = _2361 * _2393;
    float _2419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2381);
    float _2421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2379);
    float _2423 = _2343 * _2393;
    float _2425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2383);
    float _2427 = _2401 * _2419;
    float _2429 = _2241 * _2421;
    float _2431 = fma(_2411, _2397, _2405);
    float _2433 = _2403 * _2425;
    float _2435 = _2417 * _2427;
    float _2437 = -_2399;
    float _2439 = fma(_2411, _2407, _2437);
    float _2441 = -_2427;
    float _2443 = _2411 * _2441;
    float _2445 = -_2407;
    float _2447 = fma(_2411, _2399, _2445);
    float _2449 = fma(_2431, _2429, _2435);
    float _2451 = _2423 * _2427;
    float _2453 = fma(_2413, _2429, _2443);
    float _2455 = fma(_2411, _2405, _2397);
    float _2457 = fma(_2439, _2433, _2449);
    float _2459 = fma(_2447, _2429, _2451);
    float _2461 = fma(_2415, _2433, _2453);
    float _2463 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2465 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2467 = fma(_2455, _2433, _2459);
    float _2469 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2471 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2463);
    float _2473 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2465);
    float _2475 = _2417 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2477 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2469);
    bool _2479 = _2381 != 0.0;
    bool _2481 = isnan(_2381);
    bool _2483 = _2479 || _2481;
    bool _2485 = isnan(0.0);
    bool _2487 = _2483 || _2485;
    float _2489 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2473);
    float _2491 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2477);
    bool _2493 = _2379 == 0.0;
    bool _2495 = !_2487;
    bool _2497 = _2493 && _2495;
    float _2499 = _2489 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2501 = _2491 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _2503 = _2383 == 0.0;
    bool _2505 = _2503 && _2497;
    float _2507 = _1687 + _2499;
    float _2509 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2511 = _1631 + _2501;
    float _2513 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2517 = _2507 + _2515;
    float _2519 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2509);
    float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2523 = _2511 + _2521;
    float _2525 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2513);
    float _2527 = _2517 * _2517;
    float _2529 = _2417 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2531 = _2417 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2533 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2535 = fma(_2523, _2523, _2527);
    float _2537 = -_2411;
    float _2539 = fma(_2537, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2529);
    float _2541 = -_2411;
    float _2543 = fma(_2541, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2475);
    float _2545 = -_2411;
    float _2547 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2531);
    float _2549 = sqrt(_2535);
    float _2551 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2533);
    float _2553 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2519);
    float _2555 = in.m_93.x;
    float _2557 = in.m_93.y;
    float _2559 = in.m_93.z;
    float _2561 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2471);
    float _2563 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2551);
    float _2565 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2525);
    float _2567 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2569 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2571 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2573 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2575 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2567);
    float _2577 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2569);
    float _2579 = _1103 + _2571;
    float _2581 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2573);
    bool _2583 = _2549 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2585 = _2415;
    float _2587 = _2511;
    float _2589 = _2507;
    if (!_2583)
    {
        _2585 = _2579;
    }
    float _2591 = _2585;
    bool _2593 = !_2583;
    float _2595 = _2591;
    float _2597 = _2555;
    float _2599 = _2557;
    float _2601 = _2559;
    if (!_2593)
    {
        float _2603 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2607 = _2549 + _2605;
        float _2609 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2611 = rsqrt(_2535);
        float _2613 = _2607 * _2603;
        float _2615 = _2613 * 0.15915493667125701904296875;
        float _2617 = _2615 * 6.283185482025146484375;
        float _2619 = cos(_2617);
        float _2621 = _2615 * 6.283185482025146484375;
        float _2623 = sin(_2621);
        float _2625 = _2619 + (-1.0);
        float _2627 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2629 = fma(_2623, _2609, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2631 = fma(_2579, _2619, _2627);
        float _2633 = _2611 * _2629;
        float _2635 = fma(_2523, _2633, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2637 = fma(_2517, _2633, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2595 = _2631;
        _2587 = _2635;
        _2589 = _2637;
    }
    float _2639 = _2595;
    float _2641 = _2587;
    float _2643 = _2589;
    float _2645 = -_1881;
    float _2647 = _2645 + _2639;
    if (!_2505)
    {
        float _2649 = fma(_2379, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2555);
        _2597 = _2649;
    }
    float _2651 = _2597;
    if (!_2505)
    {
        float _2653 = fma(_2381, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2557);
        _2599 = _2653;
    }
    float _2655 = _2599;
    float _2657 = -_1891;
    float _2659 = _2657 + _2641;
    float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2663 = _2647 + _2661;
    if (!_2505)
    {
        float _2665 = fma(_2383, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2559);
        _2601 = _2665;
    }
    float _2667 = _2601;
    float _2669 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2539);
    float _2671 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2673 = _2659 + _2671;
    float _2675 = _2663 * _2663;
    float _2677 = -_1911;
    float _2679 = _2677 + _2643;
    float _2681 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2543);
    float _2683 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2547);
    float _2685 = fma(_2673, _2673, _2675);
    float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2689 = _2679 + _2687;
    float _2691 = _2669 * _2655;
    float _2693 = _2681 * _2655;
    float _2695 = _2683 * _2655;
    float _2697 = fma(_2689, _2689, _2685);
    float _2699 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2575);
    float _2701 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2577);
    float _2703 = fma(_2553, _2651, _2691);
    float _2705 = fma(_2561, _2651, _2693);
    float _2707 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2581);
    float _2709 = sqrt(_2697);
    float _2711 = fma(_2565, _2651, _2695);
    float _2713 = fma(_2699, _2667, _2703);
    float _2715 = fma(_2701, _2667, _2705);
    float _2717 = fma(_2707, _2667, _2711);
    float _2719 = -_1891;
    float _2721 = _1631 + _2719;
    float _2723 = -_1881;
    float _2725 = _2723 + _1103;
    float _2727 = -_1911;
    float _2729 = _1687 + _2727;
    out.m_95.x = _2713;
    out.m_95.y = _2715;
    out.m_95.z = _2717;
    bool _2731 = _2709 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2733 = isnan(_2709);
    bool _2735 = _2731 || _2733;
    bool _2737 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2739 = _2735 || _2737;
    float _2741 = _2689;
    if (!_2739)
    {
        _2741 = 1.0;
    }
    float _2743 = _2741;
    bool _2745 = !_2739;
    float _2747 = _2743;
    if (!_2745)
    {
        bool _2749 = _2709 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2751 = isnan(_2709);
        bool _2753 = _2749 || _2751;
        bool _2755 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2757 = _2753 || _2755;
        if (!_2757)
        {
            float _2759 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2761 = _2709 + _2759;
            float _2763 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2765 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2763;
            float _2767 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2769 = _2767 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2771 = 1.0 / _2765;
            float _2773 = _2761 * _2771;
            float _2775 = fma(_2773, _2769, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2747 = _2775;
            _2777 = true;
        }
        else
        {
            bool _2779 = _2709 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2781 = isnan(_2709);
            bool _2783 = _2779 || _2781;
            bool _2785 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2787 = _2783 || _2785;
            if (!_2787)
            {
                float _2789 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2791 = _2709 + _2789;
                float _2793 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2795 = _2793 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2797 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2799 = _2797 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2801 = 1.0 / _2795;
                float _2803 = _2791 * _2801;
                float _2805 = fma(_2803, _2799, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2747 = _2805;
                _2777 = true;
            }
            else
            {
                _2747 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2777 = false;
    float _2807 = _2747;
    float _2809 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2811 = _2659 + _2809;
    float _2813 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2815 = _2679 + _2813;
    float _2817 = fma(_2811, _2807, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2819 = fma(_2815, _2807, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2823 = _2817 + _2821;
    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2827 = _2819 + _2825;
    float _2829 = fma(_2823, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2831 = fma(_2827, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _8204 = float2(_2829, _2831);
    float _2833 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_8204, float2(0.0), isnan(_8204)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_8204, float2(0.0), isnan(_8204)), level(0.0)).x;
    float _2835 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2837 = _2647 + _2835;
    float _2839 = -_2061;
    float _2841 = _2839 + _2721;
    float _2843 = -_2721;
    float _2845 = _2843 + _2817;
    float _2847 = -_2729;
    float _2849 = _2847 + _2819;
    float _2851 = fma(_2837, _2807, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2853 = -_2063;
    float _2855 = _2853 + _2729;
    float _2857 = -_2725;
    float _2859 = _2857 + _2851;
    float _2861 = _2859 * _2859;
    float _2863 = fma(_2845, _2845, _2861);
    float _2865 = fma(_2849, _2849, _2863);
    float _2867 = sqrt(_2865);
    bool _2869 = _2867 > 0.0;
    float _2871 = fma(_2833, 100.0, _2725);
    float _2873 = -_2059;
    float _2875 = _2873 + _2871;
    bool _2877 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2879 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2881 = _2877 || _2879;
    bool _2883 = isnan(0.5);
    bool _2885 = _2881 || _2883;
    float _2887 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2889 = fma(_2841, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2887);
    float _2891 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2889);
    float _2893 = _2891 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2895 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2897 = 1.0 / _2893;
    float _2899 = fma(_2841, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2895);
    float _2901 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2899);
    float _2903 = _2901 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2905 = _2903 + _2893;
    float _2907 = _2905 * _2897;
    float _2909 = _2907 * 0.5;
    float _2911 = fma(_2833, 100.0, _2851);
    float _2913 = _2833;
    float _2915 = _2819;
    float _2917 = _2855;
    float _2919 = _2875;
    if (!_2869)
    {
        _2913 = _2817;
    }
    float _2921 = _2913;
    float _2923 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2925 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2923);
    bool _2927 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2929 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2931 = _2927 || _2929;
    bool _2933 = isnan(0.5);
    bool _2935 = _2931 || _2933;
    float _2937 = 1.0 / _2925;
    float _2939 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2941 = _2921;
    if (!_2869)
    {
        _2939 = _2911;
    }
    float _2943 = _2939;
    bool _2945 = !_2869;
    float _2947 = _2943;
    if (!_2945)
    {
        float _2949 = _226 * _226;
        float _2951 = fma(_222, _222, _2949);
        float _2953 = fma(_228, _228, _2951);
        float _2955 = rsqrt(_2865);
        float _2957 = sqrt(_2953);
        float _2959 = _2845 * _2955;
        float _2961 = _2859 * _2955;
        float _2963 = _2849 * _2955;
        bool _2965 = _2957 > 0.0;
        float _2967 = _2949;
        float _2969 = _2957;
        _2035 = _2959;
        if (!_2965)
        {
            _2967 = _2817;
        }
        float _2971 = _2967;
        _2941 = _2971;
        if (!_2965)
        {
            _2969 = _2911;
        }
        float _2973 = _2969;
        bool _2975 = !_2965;
        _2947 = _2973;
        if (!_2975)
        {
            float _2977 = rsqrt(_2953);
            float _2979 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2981 = _226 * _2977;
            float _2983 = _222 * _2977;
            float _2985 = _228 * _2977;
            float _2987 = _2961 * _2981;
            float _2989 = fma(_2959, _2983, _2987);
            float _2991 = _2979 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2993 = fma(_2963, _2985, _2989);
            float _2995 = _2993 * _2991;
            float _2997 = fma(_222, _2995, _2817);
            float _2999 = fma(_226, _2995, _2911);
            float _3001 = fma(_228, _2995, _2819);
            _2941 = _2997;
            _2947 = _2999;
            _2915 = _3001;
        }
    }
    float _3003 = _2941;
    float _3005 = _2947;
    float _3007 = _2915;
    float _3009 = _2035;
    float _3011 = -_2061;
    float _3013 = _3011 + _3003;
    float _3015 = -_2059;
    float _3017 = _3015 + _3005;
    float _3019 = -_2063;
    float _3021 = _3019 + _3007;
    float _3023 = _3017;
    float _3025 = _3013;
    float _3027 = _3021;
    float _3029 = _3005;
    float _3031 = _3009;
    if (_2885)
    {
        _2065 = 1.0;
    }
    float _3033 = _2065;
    float _3035 = _3033;
    if (!_2935)
    {
        float _3037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3039 = _2875 + _3037;
        float _3041 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3043 = _2841 + _3041;
        float _3045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3047 = -_2729;
        float _3049 = _3047 + _3007;
        float _3051 = _3039 * _3039;
        float _3053 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3055 = _2855 + _3053;
        float _3057 = -_2721;
        float _3059 = _3057 + _3003;
        float _3061 = -_2871;
        float _3063 = _3061 + _3005;
        float _3065 = fma(_3043, _3043, _3051);
        float _3067 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3069 = fma(_3055, _3055, _3065);
        float _3071 = sqrt(_3069);
        float _3073 = 1.0 / _2231;
        float _3075 = precise::min(_3071, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3077 = _3075 * _3045;
        float _3079 = _3067 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3081 = _3077 * _3073;
        float _3083 = _3079 * _3081;
        float _3085 = _3049 * _3081;
        float _3087 = fma(_3059, _3083, _2841);
        float _3089 = fma(_3063, _3083, _2875);
        float _3091 = fma(_3079, _3085, _2855);
        _3023 = _3089;
        _3025 = _3087;
        _3027 = _3091;
    }
    float _3093 = _3023;
    float _3095 = _3025;
    float _3097 = _3027;
    float _3099 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3101 = _2937 * _3099;
    if (!_2885)
    {
        float _3103 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3105 = _3103 * 0.15915493667125701904296875;
        float _3107 = _3105 * 6.283185482025146484375;
        float _3109 = cos(_3107);
        float _3111 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3113 = _3111 * 0.15915493667125701904296875;
        float _3115 = _3105 * 6.283185482025146484375;
        float _3117 = sin(_3115);
        float _3119 = 1.0 / _3109;
        float _3121 = _3113 * 6.283185482025146484375;
        float _3123 = cos(_3121);
        float _3125 = _3117 * _3119;
        float _3127 = _3113 * 6.283185482025146484375;
        float _3129 = sin(_3127);
        float _3131 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3133 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3131;
        float _3135 = _3123 * _3125;
        float _3137 = 1.0 / _3133;
        float _3139 = 1.0 / _3135;
        float _3141 = _3129 * _3139;
        float _3143 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3145 = fma(_3101, _3141, _3143);
        float _3147 = _3145 * _3137;
        float _3149 = precise::clamp(_3147, 0.0, 1.0);
        _3035 = _3149;
    }
    float _3151 = _3035;
    float _3153 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3155 = _3093 + _3153;
    float _3157 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3159 = _3095 + _3157;
    float _3161 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3163 = _3097 + _3161;
    float _3165 = _3155 * _3155;
    float _3167 = fma(_3159, _3159, _3165);
    float _3169 = fma(_3163, _3163, _3167);
    float _3171 = rsqrt(_3169);
    float _3173 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3175 = _3159 * _3173;
    float _3177 = _3163 * _3173;
    float _3179 = _3175 * _3175;
    float _3181 = _3177 * _3177;
    float _3183 = _3179 + _3181;
    float _3185 = sqrt(_3183);
    bool _3187 = _3185 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3191 = _3185 + _3189;
    float _3193 = _3163;
    float _3195 = _3183;
    float _3197 = _3191;
    float _3199 = _3155;
    if (_3187)
    {
        float _3201 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3193 = _3201;
    }
    float _3203 = _3193;
    if (_3187)
    {
        float _3205 = rsqrt(_3183);
        _3195 = _3205;
    }
    float _3207 = _3195;
    float _3209 = _3207;
    if (_3187)
    {
        float _3211 = _3191 * _3203;
        _3197 = _3211;
    }
    float _3213 = _3197;
    if (_3187)
    {
        float _3215 = _3213 * 0.15915493667125701904296875;
        _3029 = _3215;
    }
    float _3217 = _3029;
    float _3219 = _3165;
    float _3221 = _3217;
    if (_3187)
    {
        float _3223 = _3217 * 6.283185482025146484375;
        float _3225 = sin(_3223);
        _3219 = _3225;
    }
    float _3227 = _3219;
    float _3229 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3231 = precise::max(0.0, _3229);
    float _3233 = _3171;
    float _3235 = _3229;
    float _3237 = _3231;
    if (_3187)
    {
        float _3239 = _3217 * 6.283185482025146484375;
        float _3241 = cos(_3239);
        _3233 = _3241;
    }
    float _3243 = _3233;
    float _3245 = -_3173;
    float _3247 = -_3231;
    float _3249 = fma(_3155, _3245, _3247);
    float _3251 = _3249;
    if (_3187)
    {
        float _3253 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3235 = _3253;
    }
    float _3255 = _3235;
    if (!_3187)
    {
        _3221 = _3175;
    }
    float _3257 = _3221;
    float _3259 = _3227;
    float _3261 = _3257;
    if (_3187)
    {
        float _3263 = fma(_3227, _3255, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3259 = _3263;
    }
    float _3265 = _3259;
    float _3267 = sqrt(_3169);
    float _3269 = _3265;
    if (_3187)
    {
        float _3271 = _3243 + (-1.0);
        _3199 = _3271;
    }
    float _3273 = _3199;
    float _3275 = _3273;
    if (_3187)
    {
        float _3277 = _3207 * _3265;
        _3031 = _3277;
    }
    float _3279 = _3031;
    if (!_3187)
    {
        _3209 = _3177;
    }
    float _3281 = _3209;
    float _3283 = _3281;
    if (_3187)
    {
        float _3285 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3237 = _3285;
    }
    float _3287 = _3237;
    if (_3187)
    {
        float _3289 = _3175 * _3279;
        _3261 = _3289;
    }
    float _3291 = _3261;
    if (!_3187)
    {
        _3269 = _3179;
    }
    float _3293 = _3269;
    float _3295 = _3293;
    if (_3187)
    {
        float _3297 = _3177 * _3279;
        _3283 = _3297;
    }
    float _3299 = _3283;
    if (_3187)
    {
        float _3301 = fma(_3249, _3243, _3287);
        _3251 = _3301;
    }
    float _3303 = _3251;
    if (_3187)
    {
        float _3305 = _3291 * _3291;
        _3295 = _3305;
    }
    float _3307 = _3295;
    if (!_3187)
    {
        _3275 = _3181;
    }
    float _3309 = _3275;
    float _3311 = _3309;
    if (_3187)
    {
        float _3313 = _3299 * _3299;
        _3311 = _3313;
    }
    float _3315 = _3311;
    float _3317 = _3093 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3319 = fma(_3303, _3303, _3307);
    float _3321 = _3093 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3323 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3317);
    float _3325 = _3319 + _3315;
    float _3327 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3329 = fma(_3267, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3327);
    float _3331 = precise::clamp(_3329, 0.0, 1.0);
    float _3333 = fma(_3097, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3323);
    float _3335 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3321);
    float _3337 = rsqrt(_3325);
    float _3339 = _3333 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3341 = fma(_2855, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3343 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3345 = -_3331;
    float _3347 = _3345 + 1.0;
    float _3349 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3351 = _3093 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3353 = floor(_3341);
    float _3355 = -_3349;
    float _3357 = fma(_3355, _3343, 1.0);
    float _3359 = _3093 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3361 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3351);
    float _3363 = fma(_2841, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3365 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3359);
    float _3367 = abs(_3347);
    float _3369 = log2(_3367);
    float _3371 = _3337 * _3291;
    float _3373 = _3337 * _3303;
    float _3375 = fma(_3097, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3361);
    float _3377 = _3337 * _3299;
    float _3379 = _3371 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3381 = fma(_3097, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3365);
    float _3383 = _3375 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3385 = floor(_3363);
    float _3387 = -_3379;
    float _3389 = fma(_3373, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3387);
    float _3391 = _3381 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3393 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3395 = -_3377;
    float _3397 = fma(_3395, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3389);
    float _3399 = fma(_3097, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3335);
    float _3401 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3393);
    float _3403 = _3369 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3405 = fma(_3397, -0.5, 0.5);
    float _3407 = _3399 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3409 = fma(_3339, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3401);
    float _3411 = exp2(_3403);
    float _3413 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3415 = fma(_3397, 0.5, 0.5);
    float _3417 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3409);
    float _3419 = -_3385;
    float _3421 = _3363 + _3419;
    float _3423 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3425 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3413);
    float _3427 = log2(_3357);
    float _3429 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3423);
    float _3431 = -_3353;
    float _3433 = _3341 + _3431;
    float _3435 = _3373 + 1.0;
    float _3437 = fma(_3415, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3439 = fma(_3339, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3429);
    float _3441 = fma(_3339, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3425);
    float _3443 = 1.0 / _3417;
    float _3445 = -_3373;
    float _3447 = fma(_3411, _3435, _3445);
    float _3449 = fma(_3415, _3437, -0.212114393711090087890625);
    float _3451 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3439);
    float _3453 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3441);
    float _3455 = sqrt(_3405);
    float _3457 = fma(_3415, _3449, 1.570728778839111328125);
    float _3459 = _3427 * 0.693147182464599609375;
    float2 _9202 = float2(_3421, _3433);
    float _3461 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9202, float2(0.0), isnan(_9202)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9202, float2(0.0), isnan(_9202)), level(0.0)).x;
    float _3463 = fma(_3447, 0.5, 0.5);
    float _3465 = _3459 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3467 = _3451 * _3443;
    float _3469 = _3453 * _3443;
    float _3471 = fma(_3467, 0.5, 0.5);
    float _3473 = fma(_3469, -0.5, 0.5);
    float _3475 = _3455 * 0.636619746685028076171875;
    float3 _9230 = float3(_3471, _3473, _3465);
    float _3477 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9230, float3(0.0), isnan(_9230)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9230, float3(0.0), isnan(_9230)), level(0.0)).x;
    float _3479 = -_3457;
    float _3481 = fma(_3475, _3479, 1.0);
    float3 _9246 = float3(_3471, _3473, _3465);
    float4 _3484 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9246, float3(0.0), isnan(_9246)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9246, float3(0.0), isnan(_9246)), level(0.0)).xyzw;
    float _3486 = _3484.x;
    float _3488 = _3484.y;
    float _3490 = _3484.z;
    float _3492 = _3484.w;
    float2 _9262 = float2(_3481, _3463);
    float3 _3496 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9262, float2(0.0), isnan(_9262)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9262, float2(0.0), isnan(_9262)), level(0.0)).xyz;
    float _3498 = _3496.x;
    float _3500 = _3496.y;
    float _3502 = _3496.z;
    float _3504 = abs(_3101);
    float _3506 = log2(_3504);
    out.m_97.x = _2841;
    out.m_97.y = _2875;
    out.m_97.z = _2855;
    bool _3508 = _3267 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3510 = isnan(_3267);
    bool _3512 = _3508 || _3510;
    bool _3514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3516 = _3512 || _3514;
    out.m_99.x = _3095;
    out.m_99.y = _3093;
    out.m_99.z = _3097;
    float _3518 = _3506 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3520 = in.m_77.x;
    float _3522 = _3453;
    if (!_3516)
    {
        _2917 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3524 = _2917;
    float _3526 = _3524;
    float _3528 = _3524;
    if (!_3516)
    {
        _2919 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3530 = _2919;
    float _3532 = exp2(_3518);
    float _3534 = fma(_3532, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3536 = precise::clamp(_3534, 0.0, 1.0);
    float _3538 = fma(_3536, -2.0, 3.0);
    float _3540 = _3536 * _3536;
    float _3542 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3544 = _3369 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3546 = _3101 <= 8000.0;
    bool _3548 = isnan(_3101);
    bool _3550 = _3546 || _3548;
    bool _3552 = isnan(8000.0);
    bool _3554 = _3550 || _3552;
    float _3556 = float(_3554);
    float _3558 = _3540 * _3538;
    float _3560 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3542);
    float _3562 = _3417 * 0.5;
    float _3564 = exp2(_3544);
    float _3566 = -_3558;
    float _3568 = _3566 + 1.0;
    float _3570 = fma(_3453, -0.5, _3562);
    float _3572 = fma(_3339, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3560);
    float _3574 = fma(_3568, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3558);
    float _3576 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3572);
    float _3578 = _3451 + _3417;
    float _3580 = _3556 * _3574;
    float _3582 = _3576 + _3417;
    out.gl_Position.x = _3451;
    out.gl_Position.y = _3453;
    out.gl_Position.z = _3576;
    out.gl_Position.w = _3417;
    float _3584 = _3580 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3586 = _3578 * 0.5;
    float _3588 = _3582 * 0.5;
    float _3590 = -_3564;
    float _3592 = _3590 + 1.0;
    float _3594 = _3592 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_101.x = _3586;
    out.m_101.y = _3570;
    out.m_101.z = _3588;
    out.m_101.w = _3417;
    float _3596 = _3151 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3598 = _3530;
    float _3600 = _3530;
    if (!_3516)
    {
        _3522 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3602 = _3522;
    float _3604 = -_3461;
    float _3606 = _3604 + 1.0;
    float _3608 = _3606 * _3584;
    float _3610 = precise::clamp(_3608, 0.0, 1.0);
    float _3612 = -_3610;
    float _3614 = fma(_3612, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3616 = _3614 * _3520;
    float _3618 = _3594 * _3477;
    float _3620 = -_3594;
    float _3622 = _3620 + 1.0;
    float _3624 = _3616 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3626 = _3616;
    float _3628 = _3622;
    float _3630 = _3602;
    float _3632 = _3602;
    if (!_3516)
    {
        _3626 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3634 = _3626;
    float _3636 = _3492 * _3618;
    out.m_103.x = _3624;
    float _3638 = _3502 * _3618;
    float _3640 = fma(_3498, _3636, _3486);
    float _3642 = fma(_3500, _3636, _3488);
    float _3644 = _3492 * _3622;
    float _3646 = fma(_3492, _3638, _3490);
    float _3648 = _3636;
    float _3650 = _3634;
    float _3652 = _3634;
    if (!_3516)
    {
        _3628 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3654 = _3628;
    float _3656 = _3654;
    float _3658 = _3654;
    if (!_3516)
    {
        _3648 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3660 = _3648;
    out.m_105.x = _3640;
    out.m_105.y = _3642;
    out.m_105.z = _3646;
    out.m_105.w = _3644;
    bool _3662 = !_3516;
    float _3664 = _3660;
    float _3666 = _3660;
    if (!_3662)
    {
        bool _3668 = _3267 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3670 = isnan(_3267);
        bool _3672 = _3668 || _3670;
        bool _3674 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3676 = _3672 || _3674;
        if (!_3676)
        {
            float _3678 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3680 = _3267 + _3678;
            float _3682 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3684 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3682;
            float _3686 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3688 = _3686 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3690 = 1.0 / _3684;
            float _3692 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3694 = _3692 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3696 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3698 = _3696 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3700 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3702 = _3700 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3704 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3706 = _3704 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3708 = _3680 * _3690;
            float _3710 = precise::clamp(_3708, 0.0, 1.0);
            float _3712 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3714 = _3712 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3716 = fma(_3710, _3688, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3718 = fma(_3710, _3714, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3720 = fma(_3710, _3694, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3722 = fma(_3710, _3698, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3724 = fma(_3710, _3702, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3726 = fma(_3710, _3706, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3658 = _3720;
            _3600 = _3724;
            _3632 = _3716;
            _3528 = _3722;
            _3652 = _3718;
            _3666 = _3726;
            _3728 = true;
        }
        else
        {
            bool _3730 = _3267 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3732 = isnan(_3267);
            bool _3734 = _3730 || _3732;
            bool _3736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3738 = _3734 || _3736;
            if (!_3738)
            {
                _3630 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3740 = _3630;
            _3632 = _3740;
            if (!_3738)
            {
                _3656 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3742 = _3656;
            _3658 = _3742;
            if (!_3738)
            {
                _3650 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3744 = _3650;
            _3652 = _3744;
            if (!_3738)
            {
                _3526 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3746 = _3526;
            _3528 = _3746;
            if (!_3738)
            {
                _3598 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3748 = _3598;
            _3600 = _3748;
            if (!_3738)
            {
                _3664 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3750 = _3664;
            bool _3752 = !_3738;
            _3666 = _3750;
            if (!_3752)
            {
                bool _3754 = _3267 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3756 = isnan(_3267);
                bool _3758 = _3754 || _3756;
                bool _3760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3762 = _3758 || _3760;
                if (!_3762)
                {
                    float _3764 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3766 = _3267 + _3764;
                    float _3768 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3770 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3768;
                    float _3772 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3774 = _3772 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3776 = 1.0 / _3770;
                    float _3778 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3780 = _3778 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3782 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3784 = _3782 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3786 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3788 = _3786 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3792 = _3790 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3794 = _3766 * _3776;
                    float _3796 = precise::clamp(_3794, 0.0, 1.0);
                    float _3798 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3800 = _3798 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3802 = fma(_3796, _3774, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3804 = fma(_3796, _3800, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3806 = fma(_3796, _3780, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3808 = fma(_3796, _3784, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3810 = fma(_3796, _3788, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3812 = fma(_3796, _3792, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3658 = _3806;
                    _3600 = _3810;
                    _3632 = _3802;
                    _3528 = _3808;
                    _3652 = _3804;
                    _3666 = _3812;
                    _3728 = true;
                }
                else
                {
                    _3658 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3600 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3632 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3528 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3652 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3666 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3728 = false;
    float _3814 = _3658;
    float _3816 = _3600;
    float _3818 = _3632;
    float _3820 = _3528;
    float _3822 = _3652;
    float _3824 = _3666;
    float _3826 = fma(_2715, -0.5, 0.5);
    float _3828 = precise::clamp(_3826, 0.0, 1.0);
    float _3830 = -_3814;
    float _3832 = _3830 + _3816;
    float _3834 = _3596 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3836 = -_3818;
    float _3838 = _3836 + _3820;
    float _3840 = fma(_3828, _3832, _3814);
    out.m_107.x = 0.0;
    float _3842 = -_3822;
    float _3844 = _3842 + _3824;
    float _3846 = fma(_3828, _3838, _3818);
    float _3848 = _3840 * 0.586610972881317138671875;
    out.m_53.x = _3834;
    bool _3850 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3852 = fma(_3828, _3844, _3822);
    float _3854 = fma(_3846, 0.298911988735198974609375, _3848);
    bool _3856 = _3151 > 0.0;
    bool _3858 = isnan(_3151);
    bool _3860 = _3856 || _3858;
    bool _3862 = isnan(0.0);
    bool _3864 = _3860 || _3862;
    float _3866 = fma(_3852, 0.114477999508380889892578125, _3854);
    float _3868 = -_3866;
    float _3870 = _3846 + _3868;
    float _3872 = -_3866;
    float _3874 = _3840 + _3872;
    float _3876 = -_3866;
    float _3878 = _3852 + _3876;
    float _3880 = fma(_3870, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3866);
    float _3882 = fma(_3874, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3866);
    float _3884 = fma(_3878, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3866);
    bool _3886 = !_3850;
    if (!_3886)
    {
        float _3888 = -_3093;
        float _3890 = _3888 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3892 = -_3095;
        float _3894 = _3892 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3896 = -_3097;
        float _3898 = _3896 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3900 = _3890 * _3890;
        float _3902 = fma(_3894, _3894, _3900);
        float _3904 = fma(_3898, _3898, _3902);
        float _3906 = sqrt(_3904);
        float _3908 = rsqrt(_3904);
        float _3910 = -_3906;
        float _3912 = _3910 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3914 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3916 = precise::clamp(_3914, 0.0, 1.0);
        float _3918 = _3894 * _3908;
        float _3920 = _3890 * _3908;
        float _3922 = abs(_3916);
        float _3924 = log2(_3922);
        float _3926 = _3898 * _3908;
        float _3928 = _3918 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3930 = _2715 * _3920;
        float _3932 = -_3920;
        float _3934 = -_3928;
        float _3936 = fma(_3932, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3934);
        float _3938 = fma(_2713, _3918, _3930);
        float _3940 = -_3926;
        float _3942 = fma(_3940, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3936);
        float _3944 = fma(_2717, _3926, _3938);
        float _3946 = precise::clamp(_3944, 0.0, 1.0);
        float _3948 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3950 = _3942 + _3948;
        float _3952 = _3924 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3954 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3956 = precise::clamp(_3954, 0.0, 1.0);
        float _3958 = exp2(_3952);
        float _3960 = _3958 * _3956;
        float _3962 = _3946 * _3960;
        float _3964 = _3962 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3966 = _3962 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3968 = _3962 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _3964;
        out.m_107.y = _3966;
        out.m_107.z = _3968;
    }
    out.m_81.x = _3880;
    out.m_81.y = _3882;
    out.m_81.z = _3884;
    if (_3864)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3970 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3970;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3728 = false;
    bool _2777 = false;
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
        float _4027 = as_type<float>(_142);
        out.gl_Position.z = _4027;
    }
    if (!_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _4097 = as_type<float>(_180);
        out.gl_Position.z = _4097;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _262 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
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
    float _314 = 1.0 / _278;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = 1.0 / _282;
    float _320 = _270 * _288;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _326;
    float _330 = _266 * _314;
    bool _332 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _334 = isnan(_262);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _344;
    float _348 = -_342;
    float _350 = _348 + 1.0;
    float _352 = fma(_346, _320, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _354 = _286 * _318;
    float _356 = fma(_324, _320, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = fma(_328, _320, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _360 = _262 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _362 = isnan(_262);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = _300 * _350;
    float _374 = -_300;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = -_312;
    float _392 = _390 + 1.0;
    float _394 = _312 * _376;
    float _396 = fma(_380, _330, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _398 = fma(_384, _330, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _400 = fma(_388, _330, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _402 = _370 * _392;
    float _404 = in.m_71.x;
    float _406 = in.m_71.y;
    float _408 = in.m_71.z;
    float _410 = -_370;
    float _412 = _410 + 1.0;
    float _414 = _356 * _402;
    float _416 = _358 * _402;
    float _418 = _352 * _402;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _428;
    float _432 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[143].x, _414);
    float _434 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[143].y, _416);
    float _436 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[143].z, _418);
    float _438 = fma(_422, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _440 = fma(_426, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _442 = fma(_430, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = fma(_396, _394, _432);
    float _446 = fma(_398, _394, _434);
    float _448 = fma(_400, _394, _436);
    float _450 = fma(_438, _372, _444);
    float _452 = fma(_440, _372, _446);
    float _454 = fma(_442, _372, _448);
    float _456 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].x, _450);
    float _458 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].y, _452);
    float _460 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[146].z, _454);
    float _462 = _456 * _404;
    float _464 = _458 * _406;
    float _466 = _460 * _408;
    bool _468 = !_316;
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
    float _556 = _532 * _554;
    float _558 = -_532;
    float _560 = _558 + 1.0;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _564 = 1.0 / _520;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _568 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _570 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _536 * _550;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _580 = fma(_574, _500, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = -_548;
    float _584 = _582 + 1.0;
    float _586 = _580 * _556;
    float _588 = _578 * _564;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _592 = _496 + _590;
    float _594 = _516 * _584;
    float _596 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _598 = fma(_588, _592, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _600 = fma(_598, _594, _596);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _604 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[117].x, _600);
    float _606 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _606;
    out.m_73.y = _570;
    out.m_73.z = _572;
    out.m_73.w = _608;
    bool _610 = !_568;
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
    float _682 = _666 * _678;
    float _684 = -_666;
    float _686 = _684 + 1.0;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _692 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _670 * _680;
    float _704 = fma(_702, _674, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _706 = _704 * _682;
    float _708 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[131].x, _706);
    float _710 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[132].x, _708);
    float _712 = _710 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _696;
    out.m_75.y = _698;
    out.m_75.z = _700;
    out.m_75.w = _712;
    bool _714 = !_692;
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
    float _748 = in.m_61.w;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _752 = _742 + _750;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _756 = _754 != 0;
    float _758 = in.m_63.w;
    float _760 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _762 = int(_760);
    bool _764 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _766 = isnan(_742);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = float(_746);
    float _778 = -_774;
    float _780 = _778 + 1.0;
    float _782 = 1.0 / _776;
    float _784 = float(uint(_762));
    int _786 = ~_762;
    int _788 = _786 + 1;
    int _790 = ~_762;
    int _792 = _790 + 1;
    float _794 = 1.0 / _784;
    bool _796 = _762 == 0;
    float _798 = _782 * _160;
    float _800 = trunc(_798);
    int _802 = int(_800);
    int _804 = as_type<int>(_794) + (-2);
    float _806 = float(uint(_802));
    float _808 = as_type<float>(_804) * _806;
    float _810 = trunc(_808);
    float _812 = precise::max(_810, 0.0);
    uint _815 = uint(_812);
    int _817 = _788 * int(_815);
    int _819 = _817 + _802;
    float _821 = in.m_69.x;
    float _823 = float(uint(_819));
    float _825 = as_type<float>(_804) * _823;
    float _827 = trunc(_825);
    float _829 = precise::max(_827, 0.0);
    uint _831 = uint(_829);
    bool _833 = !_756;
    float _835 = _833 ? 7.345489978790283203125 : 1.0;
    float _837 = _821 * 2.0;
    float _839 = _835 * _821;
    int _841 = int(_815) + int(_831);
    float _843 = float(_762);
    float _845 = floor(_837);
    float _847 = float(_802);
    bool _849 = _847 >= _843;
    bool _851 = isnan(_847);
    bool _853 = _849 || _851;
    bool _855 = isnan(_843);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    int _861 = _792 * _841;
    int _863 = _861 + _802;
    float _865 = float(_126);
    bool _867 = uint(_863) >= uint(_762);
    float _869 = trunc(_859);
    int _871 = int(_869);
    bool _873 = !_867;
    int _875 = _873 ? 0 : (-1);
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _887 = _885 != 0;
    int _889 = ~_841;
    int _891 = _889 + _875;
    int _893 = _891 + 1;
    float _895 = floor(_839);
    int _897 = _762 * _893;
    int _899 = _897 + _802;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _903 = _901 != 0;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _907 = _905 != 0;
    float _909 = 1.0 / _865;
    int _911 = ~_871;
    int _913 = _911 + 1;
    int _915 = _913 + 1;
    bool _917 = !_796;
    int _919 = _917 ? _899 : (-1);
    float _921 = -_895;
    float _923 = _839 + _921;
    int _925 = _919 * _915;
    int _927 = _762 + (-1);
    float _929 = _923 * _843;
    float _931 = _843 * _160;
    bool _933 = !_883;
    int _935 = _933 ? 0 : 1;
    int _937 = _871 * _927;
    int _939 = _937 + _925;
    float _941 = trunc(_929);
    int _943 = int(_941);
    float _945 = _931 * _909;
    bool _947 = !_903;
    int _949 = _947 ? 0 : 1;
    bool _951 = !_879;
    int _953 = _951 ? 0 : 1;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _957 = _955 != 0;
    float _959 = trunc(_945);
    int _961 = int(_959);
    int _963 = abs(_935);
    bool _965 = !_887;
    int _967 = _965 ? 0 : 1;
    int _969 = abs(_949);
    int _971 = abs(_953);
    int _973 = abs(_967);
    int _975 = _939 * _963;
    bool _977 = !_957;
    int _979 = _977 ? 0 : 1;
    int _981 = _943 * _969;
    int _983 = _981 + _802;
    int _985 = _939;
    bool _987 = _957;
    float _989 = as_type<float>(_969);
    if (_907)
    {
        float _991 = -_182;
        float _993 = _991 + 1.0;
        _985 = as_type<int>(_993);
    }
    int _995 = _985;
    int _997 = abs(_979);
    int _999 = _961 * _971;
    int _1001 = _999 + _975;
    if (_907)
    {
        bool _1003 = _821 > 0.5;
        _987 = _1003;
    }
    bool _1005 = _987;
    int _1007 = ~_762;
    int _1009 = _1007 + 1;
    int _1011 = _983 * _973;
    int _1013 = _1011 + _1001;
    if (!_907)
    {
        _989 = _182;
    }
    float _1015 = _989;
    float _1017 = _1015;
    if (_907)
    {
        float _1019 = _1005 ? as_type<float>(_995) : _182;
        _1017 = _1019;
    }
    float _1021 = _1017;
    int _1023 = _943 * _997;
    int _1025 = _1023 + _1013;
    float _1027 = in.m_69.y;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1031 = _1029 != 0;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1035 = _1033 != 0;
    float _1037 = in.m_77.y;
    float _1039 = float(uint(_1025));
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1043 = _1041 != 0;
    int _1045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1047 = _1045 != 0;
    float _1049 = as_type<float>(_804) * _1039;
    float _1051 = float(uint(_983));
    float _1053 = in.m_50.x;
    float _1055 = in.m_50.y;
    float _1057 = in.m_50.z;
    bool _1059 = !_1031;
    int _1061 = _1059 ? 0 : 1;
    bool _1063 = _845 >= 0.0;
    bool _1065 = isnan(_845);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan(0.0);
    bool _1071 = _1067 || _1069;
    float _1073 = trunc(_1049);
    float _1075 = precise::max(_1073, 0.0);
    uint _1077 = uint(_1075);
    float _1079 = as_type<float>(_804) * _1051;
    int _1081 = _1071 ? 0 : 1;
    float _1083 = 0.0;
    if (!_1043)
    {
        _1083 = _182;
    }
    float _1085 = _1083;
    int _1087 = _1009 * int(_1077);
    int _1089 = _1087 + _1025;
    float _1091 = _208 * _1055;
    float _1093 = float(uint(_1089));
    float _1095 = _196 * _1055;
    float _1097 = _202 * _1055;
    float _1099 = fma(_206, _1053, _1091);
    float _1101 = as_type<float>(_804) * _1093;
    float _1103 = _1055 + _1037;
    float _1105 = fma(_194, _1053, _1095);
    float _1107 = trunc(_1079);
    float _1109 = precise::max(_1107, 0.0);
    uint _1111 = uint(_1109);
    float _1113 = fma(_200, _1053, _1097);
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1117 = _821 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1119 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1121 = trunc(_1101);
    float _1123 = precise::max(_1121, 0.0);
    uint _1125 = uint(_1123);
    float _1127 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1129 = fma(_198, _1057, _1105);
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1135 = -_1115;
    float _1137 = fma(_1117, 2.0, _1135);
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1143 = ~_762;
    int _1145 = _1143 + 1;
    float _1147 = in.m_69.z;
    int _1149 = ~_762;
    int _1151 = _1149 + 1;
    float _1153 = fma(_1127, -2.0, _1119);
    float _1155 = 1.0 / _1133;
    float _1157 = fma(_210, _1057, _1099);
    int _1159 = int(_1077) + int(_1125);
    int _1161 = _1151 * int(_1111);
    int _1163 = _1161 + _983;
    float _1165 = 1.0 / _1141;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1169 = _1167 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1171 = fma(_204, _1057, _1113);
    float _1173 = float(uint(_1163));
    float _1175 = _1171 + _758;
    float _1177 = 1.0 / _1169;
    int _1179 = _1145 * _1159;
    int _1181 = _1179 + _1025;
    float _1183 = as_type<float>(_804) * _1173;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1191 = _1189 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _1193 = uint(_1181) >= uint(_762);
    float _1195 = -_186;
    float _1197 = _1195 + 1.0;
    float _1199 = trunc(_1183);
    float _1201 = precise::max(_1199, 0.0);
    uint _1203 = uint(_1201);
    float _1205 = _1191 * _1165;
    bool _1207 = !_1193;
    int _1209 = _1207 ? 0 : (-1);
    float _1211 = _1187 * _1155;
    bool _1213 = _1027 > 0.5;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1217 = _1215 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _1219 = ~_1159;
    int _1221 = _1219 + _1209;
    int _1223 = _1221 + 1;
    int _1225 = _1213 ? as_type<int>(_1197) : as_type<int>(_186);
    bool _1227 = _1147 > 0.5;
    float _1229 = _1035 ? as_type<float>(_1225) : _186;
    float _1231 = _1085;
    if (_1047)
    {
        float _1233 = _1227 ? _1197 : _186;
        _232 = _1233;
    }
    float _1235 = _232;
    int _1237 = _762 * _1223;
    int _1239 = _1237 + _1025;
    bool _1241 = !_796;
    int _1243 = _1241 ? _1239 : (-1);
    int _1245 = int(_1111) + int(_1203);
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1247;
    int _1251 = _1243 & 3;
    bool _1253 = _1251 != 0;
    float _1255 = 1.0 / _1217;
    int _1257 = _1243 & 3;
    bool _1259 = _1257 != 0;
    float _1261 = _1249 * _1177;
    bool _1263 = uint(_1251) > 1u;
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1267 = _1265 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _1269 = ~_762;
    int _1271 = _1269 + 1;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1275 = _1273 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _1277 = _1259 ? 0 : 1;
    int _1279 = _1271 * _1245;
    int _1281 = _1279 + _983;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1285 = _1283 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1287 = 1.0 / _1275;
    int _1289 = ~_1277;
    int _1291 = _1289 + 1;
    int _1293 = _1291 + 1;
    int _1295 = _1293;
    if (!_1263)
    {
        int _1297 = ~_1277;
        int _1299 = _1297 + 1;
        _1295 = _1299;
    }
    int _1301 = _1295;
    float _1303 = _1027 * 2.0;
    bool _1305 = uint(_1281) >= uint(_762);
    float _1307 = _1267 * _1255;
    bool _1309 = uint(_1251) >= 2u;
    float _1311 = 1.0 / _1285;
    bool _1313 = !_1305;
    int _1315 = _1313 ? 0 : (-1);
    int _1317 = _1309 ? 0 : 1;
    bool _1319 = _1027 > 0.5;
    bool _1321 = _1319 && _1043;
    int _1323 = ~_1245;
    int _1325 = _1323 + _1315;
    int _1327 = _1325 + 1;
    float _1329 = floor(_1303);
    bool _1331 = _1251 != 3;
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1337 = _762 * _1327;
    int _1339 = _1337 + _983;
    int _1341 = _1243 >> 31;
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1345 = _742 + _1343;
    bool _1347 = !_1253;
    int _1349 = _1347 ? 0 : 1;
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1351;
    bool _1355 = !_796;
    int _1357 = _1355 ? _1339 : (-1);
    float _1359 = as_type<float>(_1341);
    float _1361 = as_type<float>(_1339);
    if (_1321)
    {
        float _1363 = -_182;
        float _1365 = _1363 + 1.0;
        _234 = _1365;
    }
    float _1367 = _234;
    float _1369 = 1.0 / _1335;
    float _1371 = _1353 * _1311;
    int _1373 = ~_1317;
    int _1375 = _1373 + 1;
    int _1377 = _1375 + 1;
    float _1379 = fma(_1261, _1345, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1381 = _1377;
    if (_1331)
    {
        int _1383 = ~_1317;
        int _1385 = _1383 + 1;
        _1381 = _1385;
    }
    int _1387 = _1381;
    float _1389 = _1147 * 2.0;
    bool _1391 = _1329 > 0.0;
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1395 = _742 + _1393;
    bool _1397 = _1329 >= 0.0;
    bool _1399 = isnan(_1329);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan(0.0);
    bool _1405 = _1401 || _1403;
    float _1407 = _821 + _1027;
    int _1409 = _1341 & 3;
    float _1411 = floor(_1389);
    if (_1043)
    {
        _1231 = _1367;
    }
    float _1413 = _1231;
    float _1415 = _1407 + (-1.0);
    int _1417 = _1243 + _1409;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1421 = _742 + _1419;
    bool _1423 = _1251 != 3;
    float _1425 = fma(_1415, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1427 = _1417 >> 2;
    float _1429 = fma(_1211, _1421, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    if (_756)
    {
        _1359 = _821;
    }
    float _1431 = _1359;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1435 = _742 + _1433;
    int _1437 = _1427 << 4;
    int _1439 = _1437 + 368;
    float _1441 = fma(_1307, _1395, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1443 = _1431;
    if (_756)
    {
        _1361 = _1027;
    }
    float _1445 = _1361;
    float _1447 = fma(_1371, _1435, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    uint _1449 = uint(int(uint(_1439) >> uint(2)));
    uint _1451 = uint(int(uint(int(_1449)) >> uint(2)));
    int _1453 = int(_1449) & 3;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[int(_1451)][_1453];
    int _1457 = int(_1449) + 1;
    uint _1459 = uint(int(uint(_1457) >> uint(2)));
    int _1461 = _1457 & 3;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[int(_1459)][_1461];
    bool _1465 = !_1423;
    int _1467 = _1465 ? 0 : (-1);
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1473 = _1445;
    if (!_756)
    {
        _1443 = _1147;
    }
    float _1475 = _1443;
    if (!_756)
    {
        _1473 = _821;
    }
    float _1477 = _1473;
    float _1479 = _1471 * _1287;
    int _1481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1483 = _1481 != 0;
    int _1485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1487 = _1485 != 0;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1491 = _1489 != 0;
    int _1493 = _1439 + 8;
    uint _1495 = uint(int(uint(_1493) >> uint(2)));
    uint _1497 = uint(int(uint(int(_1495)) >> uint(2)));
    int _1499 = int(_1495) & 3;
    float _1501 = (*spvDescriptorSet0.vp_c9)._m0[int(_1497)][_1499];
    int _1503 = int(_1495) + 1;
    uint _1505 = uint(int(uint(_1503) >> uint(2)));
    int _1507 = _1503 & 3;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[int(_1505)][_1507];
    bool _1511 = _1411 > 0.0;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1515 = _742 + _1513;
    bool _1517 = _1411 >= 0.0;
    bool _1519 = isnan(_1411);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan(0.0);
    bool _1525 = _1521 || _1523;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1529 = _742 + _1527;
    float _1531 = fma(_1479, _1515, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1533 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1535 = isnan(_742);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = fma(_1205, _1529, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1547 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1549 = isnan(_742);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1555 = _1551 || _1553;
    float _1557 = float(_1555);
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1561 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1559;
    bool _1563 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1565 = isnan(_742);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1571 = _1567 || _1569;
    float _1573 = float(_1571);
    float _1575 = -_1543;
    float _1577 = _1575 + 1.0;
    int _1579 = abs(_1301);
    float _1581 = _1561 * _1369;
    float _1583 = -_1557;
    float _1585 = _1583 + 1.0;
    float _1587 = _1557 * _1577;
    bool _1589 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1591 = isnan(_742);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = in.m_65.w;
    float _1603 = _1573 * _1585;
    float _1605 = -_1573;
    float _1607 = _1605 + 1.0;
    float _1609 = fma(_1581, _752, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1611 = _1599 * _780;
    float _1613 = -_1599;
    float _1615 = _1613 + 1.0;
    float _1617 = _774 * _1607;
    bool _1619 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1621 = isnan(_742);
    bool _1623 = _1619 || _1621;
    bool _1625 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1627 = _1623 || _1625;
    float _1629 = float(_1627);
    float _1631 = _1129 + _748;
    bool _1633 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1635 = isnan(_742);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    bool _1645 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1647 = isnan(_742);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1653 = _1649 || _1651;
    float _1655 = float(_1653);
    float _1657 = _1629 * _1615;
    float _1659 = -_1629;
    float _1661 = _1659 + 1.0;
    int _1663 = abs(_1349);
    float _1665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1667 = _1655 * _1661;
    float _1669 = -_1655;
    float _1671 = _1669 + 1.0;
    int _1673 = ~_1579;
    int _1675 = _1673 + 1;
    int _1677 = _1675 + 1;
    float _1679 = _1643 * _1671;
    int _1681 = ~_1663;
    int _1683 = _1681 + 1;
    int _1685 = _1683 + 1;
    float _1687 = _1157 + _1601;
    int _1689 = abs(_1387);
    int _1691 = _1677 * as_type<int>(_1463);
    float _1693 = _1429 * _1679;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1697 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1699 = _1631 + _1697;
    int _1701 = _1685 * as_type<int>(_1455);
    int _1703 = _1701 + _1691;
    float _1705 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1707 = int(_1705);
    float _1709 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1713 = _1175 + _1711;
    float _1715 = _1699 * _1699;
    float _1717 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1719 = ~_1689;
    int _1721 = _1719 + 1;
    int _1723 = _1721 + 1;
    float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1727 = _1687 + _1725;
    float _1729 = fma(_1713, _1713, _1715);
    int _1731 = abs(_1467);
    float _1733 = fma(_1709, _1235, -0.5);
    int _1735 = _1723 * as_type<int>(_1501);
    int _1737 = _1735 + _1703;
    float _1739 = fma(_1727, _1727, _1729);
    float _1741 = -_1695;
    float _1743 = fma(_1717, 2.0, _1741);
    int _1745 = abs(_1061);
    float _1747 = sqrt(_1739);
    float _1749 = float(uint(_1707));
    float _1751 = -_1643;
    float _1753 = _1751 + 1.0;
    int _1755 = ~_1731;
    int _1757 = _1755 + 1;
    int _1759 = _1757 + 1;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1763 = ~_1745;
    int _1765 = _1763 + 1;
    int _1767 = _1765 + 1;
    float _1769 = fma(_1753, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1693);
    int _1771 = abs(_1707);
    int _1773 = _1759 * as_type<int>(_1509);
    int _1775 = _1773 + _1737;
    float _1777 = 1.0 / _1749;
    float _1779 = _1477 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1781 = _1405 ? 0 : 1;
    int _1783 = _1775 * _1767;
    float _1785 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1787 = _845 > 0.0;
    float _1789 = fma(_1779, -2.0, _1761);
    int _1791 = _1357 * _1745;
    int _1793 = _1791 + _1783;
    float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1797 = float(uint(_1771));
    float _1799 = _1785 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1801 = _1747 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1803 = float(uint(_1793));
    float _1805 = fma(_1545, _1667, _1769);
    int _1807 = ~_1781;
    int _1809 = _1807 + 1;
    int _1811 = _1809 + 1;
    float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1815 = _1103 + _1813;
    float _1817 = rsqrt(_1739);
    float _1819 = precise::min(_1799, _1801);
    float _1821 = fma(_1379, _1657, _1805);
    int _1823 = as_type<int>(_1777) + (-2);
    float _1825 = _1815 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1827 = _1525 ? 0 : 1;
    float _1829 = fma(_1441, _1611, _1821);
    int _1831 = _1811;
    if (!_1391)
    {
        int _1833 = ~_1781;
        int _1835 = _1833 + 1;
        _1831 = _1835;
    }
    int _1837 = _1831;
    float _1839 = 1.0 / _1797;
    float _1841 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1843 = as_type<float>(_1823) * _1803;
    int _1845 = abs(_1793);
    float _1847 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1825);
    float _1849 = fma(_1841, _1413, -0.5);
    int _1851 = ~_1081;
    int _1853 = _1851 + 1;
    int _1855 = _1853 + 1;
    float _1857 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1789);
    float _1859 = _1817 * _1819;
    int _1861 = _1855;
    if (!_1787)
    {
        int _1863 = ~_1081;
        int _1865 = _1863 + 1;
        _1861 = _1865;
    }
    int _1867 = _1861;
    float _1869 = trunc(_1843);
    float _1871 = precise::max(_1869, 0.0);
    uint _1873 = uint(_1871);
    int _1875 = ~_1827;
    int _1877 = _1875 + 1;
    int _1879 = _1877 + 1;
    float _1881 = _1713 * _1859;
    int _1883 = _1879;
    if (!_1511)
    {
        int _1885 = ~_1827;
        int _1887 = _1885 + 1;
        _1883 = _1887;
    }
    int _1889 = _1883;
    float _1891 = _1699 * _1859;
    float _1893 = float(uint(_1845));
    float _1895 = -_1881;
    float _1897 = _1713 + _1895;
    int _1899 = as_type<int>(_1839) + (-2);
    float _1901 = -_1891;
    float _1903 = _1699 + _1901;
    int _1905 = ~_1707;
    int _1907 = _1905 + 1;
    float _1909 = _1897 * _1897;
    float _1911 = _1727 * _1859;
    float _1913 = fma(_1447, _1617, _1829);
    float _1915 = fma(_1903, _1903, _1909);
    float _1917 = as_type<float>(_1899) * _1893;
    int _1919 = _1907 * int(_1873);
    int _1921 = _1919 + _1793;
    float _1923 = -_1911;
    float _1925 = _1727 + _1923;
    bool _1927 = !_1483;
    int _1929 = _1927 ? 0 : 1;
    float _1931 = fma(_1531, _1603, _1913);
    int _1933 = ~_1707;
    int _1935 = _1933 + 1;
    float _1937 = trunc(_1917);
    float _1939 = precise::max(_1937, 0.0);
    uint _1941 = uint(_1939);
    float _1943 = float(uint(_1921));
    float _1945 = fma(_1925, _1925, _1915);
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1949 = ~_1771;
    int _1951 = _1949 + 1;
    float _1953 = as_type<float>(_1823) * _1943;
    float _1955 = float(_1889);
    float _1957 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1959 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1947);
    float _1961 = sqrt(_1945);
    int _1963 = ~_1771;
    int _1965 = _1963 + 1;
    float _1967 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1957);
    float _1969 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1959);
    float _1971 = -_160;
    float _1973 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1743);
    float _1975 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1847);
    int _1977 = _1951 * int(_1941);
    int _1979 = _1977 + _1845;
    float _1981 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1967);
    float _1983 = trunc(_1953);
    float _1985 = precise::max(_1983, 0.0);
    uint _1987 = uint(_1985);
    float _1989 = fma(_1969, _1849, _1973);
    float _1991 = fma(_1815, _1815, _1715);
    float _1993 = float(uint(_1979));
    float _1995 = -_1857;
    float _1997 = fma(_1981, _1733, _1995);
    int _1999 = abs(_1929);
    float _2001 = fma(_1727, _1727, _1991);
    bool _2003 = _1975 >= 0.0;
    float _2005 = as_type<float>(_1899) * _1993;
    float _2007 = _1817 * _1961;
    float _2009 = _1989 + 0.5;
    float _2011 = rsqrt(_2001);
    float _2013 = _1785 * _2007;
    float _2015 = _1997 + 0.5;
    float _2017 = float(_1999);
    float _2019 = fma(_1609, _1587, _1931);
    int _2021 = int(_1873) + int(_1987);
    float _2023 = _2013 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_79.x = _2009;
    out.m_79.y = _2015;
    float _2025 = trunc(_2005);
    float _2027 = precise::max(_2025, 0.0);
    uint _2029 = uint(_2027);
    float _2031 = _1931;
    int _2033 = as_type<int>(_2009);
    float _2035 = _1911;
    if (_2003)
    {
        _2031 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2037 = _2031;
    int _2039 = _1935 * _2021;
    int _2041 = _2039 + _1793;
    float _2043 = _2017 * _1955;
    bool _2045 = _1707 == 0;
    float _2047 = fma(_1543, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2019);
    out.m_81.w = _1819;
    bool _2049 = uint(_2041) >= uint(_1707);
    float _2051 = _2023 * _2011;
    if (_2003)
    {
        float _2053 = _2037 * 5.0;
        _2033 = as_type<int>(_2053);
    }
    int _2055 = _2033;
    float _2057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2059 = _1815 * _2051;
    float _2061 = _1699 * _2051;
    float _2063 = _1727 * _2051;
    float _2065 = _2061;
    if (_2003)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6931 = as_type<float>(_2055);
        out.gl_Position.z = _6931;
    }
    int _2067 = int(_1941) + int(_2029);
    float _2069 = -_2059;
    float _2071 = _1815 + _2069;
    float _2073 = -_2061;
    float _2075 = _1699 + _2073;
    float _2077 = -_2063;
    float _2079 = _1727 + _2077;
    out.m_83.x = _2047;
    int _2081 = _1965 * _2067;
    int _2083 = _2081 + _1845;
    bool _2085 = !_2049;
    int _2087 = _2085 ? 0 : (-1);
    float _2089 = _2071 * _2071;
    bool _2091 = _1707 == 0;
    if (_2003)
    {
        out.m_53.x = 0.0;
    }
    bool _2093 = uint(_2083) >= uint(_1771);
    float _2095 = fma(_2075, _2075, _2089);
    int _2097 = _1793 ^ _1707;
    float _2099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2101 = ~_2021;
    int _2103 = _2101 + _2087;
    int _2105 = _2103 + 1;
    float _2107 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2109 = !_2093;
    int _2111 = _2109 ? 0 : (-1);
    float _2113 = fma(_2079, _2079, _2095);
    uint _2115 = uint(int(uint(_2097) >> uint(31)));
    int _2117 = _1707 * _2105;
    int _2119 = _2117 + _1793;
    int _2121 = ~_2111;
    int _2123 = _2067 + _2121;
    int _2125 = _2123 + 1;
    float _2127 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2129 = log2(_2127);
    int _2131 = ~int(_2115);
    int _2133 = _2131 + 1;
    float _2135 = fma(_2107, _1021, -0.5);
    bool _2137 = !_2091;
    int _2139 = _2137 ? _2119 : (-1);
    float _2141 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1153);
    int _2143 = _2125 ^ _2133;
    float _2145 = -_160;
    float _2147 = fma(_2145, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1137);
    float _2149 = float(_2139);
    int _2151 = ~_2133;
    int _2153 = _2151 + _2143;
    int _2155 = _2153 + 1;
    float _2157 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2159 = fma(_2107, _2149, _2147);
    bool _2161 = !_2045;
    int _2163 = _2161 ? _2155 : (-1);
    float _2165 = _2099 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2167 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2157);
    float _2169 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2171 = _2129 * _160;
    float _2173 = float(_2163);
    float _2175 = sqrt(_2113);
    float _2177 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2169);
    float _2179 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2167);
    float _2181 = fma(_2165, _1229, -0.5);
    float _2183 = -_2141;
    float _2185 = fma(_2165, _2173, _2183);
    float _2187 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2177);
    float _2189 = fma(_2179, _2135, _2159);
    bool _2191 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2193 = isnan(0.0);
    bool _2195 = _2191 || _2193;
    bool _2197 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2199 = _2195 || _2197;
    float _2201 = exp2(_2171);
    float _2203 = fma(_2187, _2181, _2185);
    float _2205 = _2189 + 0.5;
    bool _2207 = !_1487;
    int _2209 = _2207 ? 0 : 1;
    float _2211 = in.m_85.x;
    float _2213 = in.m_85.y;
    float _2215 = in.m_85.z;
    bool _2217 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2219 = isnan(1.0);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2225 = _2221 || _2223;
    float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2229 = 1.0 + _2227;
    float _2231 = _2011 * _2175;
    float _2233 = _2203 + 0.5;
    bool _2235 = !_1491;
    int _2237 = _2235 ? 0 : 1;
    float _2239 = 1.0 / _2229;
    float _2241 = _2013 * _2231;
    out.m_87.x = _2205;
    out.m_87.y = _2233;
    float _2243 = -_2201;
    float _2245 = _2243 + 1.0;
    out.m_89.x = _2241;
    float _2247 = _2215;
    if (_2003)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2249 = -_2059;
    float _2251 = _1103 + _2249;
    float _2253 = _2043 * (-2.0);
    float _2255 = -_2061;
    float _2257 = _1631 + _2255;
    float _2259 = _2199 ? _2245 : 0.0;
    float _2261 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2263 = _2251 + _2261;
    float _2265 = fma(_2253, _2211, _2211);
    float _2267 = _821 + (-0.5);
    float _2269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2271 = _2257 + _2269;
    float _2273 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2275 = fma(_1425, _2253, _1425);
    int _2277 = abs(_2209);
    float _2279 = fma(_2267, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2265);
    float _2281 = float(_1867);
    float _2283 = -_2063;
    float _2285 = _1687 + _2283;
    float _2287 = float(_2277);
    if (_2225)
    {
        float _2289 = _2259 * _2239;
        _162 = _2289;
    }
    float _2291 = _162;
    float _2293 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2273);
    float _2295 = _1027 + _1147;
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2299 = _2285 + _2297;
    float _2301 = _2287 * _2281;
    float _2303 = _2295 + (-1.0);
    int _2305 = abs(_2237);
    float _2307 = _2301 * (-2.0);
    float _2309 = fma(_2299, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2293);
    float _2311 = fma(_2275, _2291, _2279);
    float _2313 = fma(_2303, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2315 = _1027 + (-0.5);
    float _2317 = fma(_2307, _2213, _2213);
    float _2319 = float(_1837);
    float _2321 = _821 + _1147;
    float _2323 = float(_2305);
    float _2325 = _2311 * 0.15915493667125701904296875;
    bool _2327 = _2309 >= 0.0;
    float _2329 = fma(_2313, _2307, _2313);
    float _2331 = fma(_2315, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2317);
    float _2333 = _2323 * _2319;
    float _2335 = _2321 + (-1.0);
    float _2337 = fma(_2329, _2291, _2331);
    float _2339 = _2333 * (-2.0);
    float _2341 = _2325 * 6.283185482025146484375;
    float _2343 = sin(_2341);
    float _2345 = fma(_2335, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2347 = _2337 * 0.15915493667125701904296875;
    float _2349 = fma(_2339, _2215, _2215);
    float _2351 = _1147 + (-0.5);
    if (_2327)
    {
        _2247 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2353 = _2247;
    float _2355 = fma(_2345, _2339, _2345);
    int _2357 = as_type<int>(_2353);
    if (_2327)
    {
        out.m_53.x = 0.0;
    }
    float _2359 = _2325 * 6.283185482025146484375;
    float _2361 = cos(_2359);
    if (_2327)
    {
        float _2363 = _2353 * 5.0;
        _2357 = as_type<int>(_2363);
    }
    int _2365 = _2357;
    float _2367 = fma(_2351, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2349);
    if (_2327)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7407 = as_type<float>(_2365);
        out.gl_Position.z = _7407;
    }
    float _2369 = _2347 * 6.283185482025146484375;
    float _2371 = sin(_2369);
    float _2373 = fma(_2355, _2291, _2367);
    float _2375 = _2347 * 6.283185482025146484375;
    float _2377 = cos(_2375);
    if (_2327)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2379 = in.m_91.x;
    float _2381 = in.m_91.y;
    float _2383 = in.m_91.z;
    float _2385 = _2373 * 0.15915493667125701904296875;
    float _2387 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2389 = _2007 * _2231;
    float _2391 = _2385 * 6.283185482025146484375;
    float _2393 = cos(_2391);
    float _2395 = _466 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2397 = _2361 * _2377;
    float _2399 = _2343 * _2377;
    float _2401 = _2387 * _2389;
    float _2403 = _2395 * _2389;
    float _2405 = _2343 * _2371;
    float _2407 = _2361 * _2371;
    float _2409 = _2385 * 6.283185482025146484375;
    float _2411 = sin(_2409);
    float _2413 = _2377 * _2393;
    float _2415 = _2371 * _2393;
    float _2417 = _2361 * _2393;
    float _2419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2381);
    float _2421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2379);
    float _2423 = _2343 * _2393;
    float _2425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2383);
    float _2427 = _2401 * _2419;
    float _2429 = _2241 * _2421;
    float _2431 = fma(_2411, _2397, _2405);
    float _2433 = _2403 * _2425;
    float _2435 = _2417 * _2427;
    float _2437 = -_2399;
    float _2439 = fma(_2411, _2407, _2437);
    float _2441 = -_2427;
    float _2443 = _2411 * _2441;
    float _2445 = -_2407;
    float _2447 = fma(_2411, _2399, _2445);
    float _2449 = fma(_2431, _2429, _2435);
    float _2451 = _2423 * _2427;
    float _2453 = fma(_2413, _2429, _2443);
    float _2455 = fma(_2411, _2405, _2397);
    float _2457 = fma(_2439, _2433, _2449);
    float _2459 = fma(_2447, _2429, _2451);
    float _2461 = fma(_2415, _2433, _2453);
    float _2463 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2465 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2467 = fma(_2455, _2433, _2459);
    float _2469 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2471 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2463);
    float _2473 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2465);
    float _2475 = _2417 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2477 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2469);
    bool _2479 = _2381 != 0.0;
    bool _2481 = isnan(_2381);
    bool _2483 = _2479 || _2481;
    bool _2485 = isnan(0.0);
    bool _2487 = _2483 || _2485;
    float _2489 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2473);
    float _2491 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2477);
    bool _2493 = _2379 == 0.0;
    bool _2495 = !_2487;
    bool _2497 = _2493 && _2495;
    float _2499 = _2489 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2501 = _2491 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _2503 = _2383 == 0.0;
    bool _2505 = _2503 && _2497;
    float _2507 = _1687 + _2499;
    float _2509 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2511 = _1631 + _2501;
    float _2513 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2517 = _2507 + _2515;
    float _2519 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2509);
    float _2521 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2523 = _2511 + _2521;
    float _2525 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2513);
    float _2527 = _2517 * _2517;
    float _2529 = _2417 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2531 = _2417 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2533 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2535 = fma(_2523, _2523, _2527);
    float _2537 = -_2411;
    float _2539 = fma(_2537, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2529);
    float _2541 = -_2411;
    float _2543 = fma(_2541, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2475);
    float _2545 = -_2411;
    float _2547 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2531);
    float _2549 = sqrt(_2535);
    float _2551 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2533);
    float _2553 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2519);
    float _2555 = in.m_93.x;
    float _2557 = in.m_93.y;
    float _2559 = in.m_93.z;
    float _2561 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2471);
    float _2563 = fma(_2467, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2551);
    float _2565 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2525);
    float _2567 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2569 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2571 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2573 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2575 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2567);
    float _2577 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2569);
    float _2579 = _1103 + _2571;
    float _2581 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2573);
    bool _2583 = _2549 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2585 = _2415;
    float _2587 = _2511;
    float _2589 = _2507;
    if (!_2583)
    {
        _2585 = _2579;
    }
    float _2591 = _2585;
    bool _2593 = !_2583;
    float _2595 = _2591;
    float _2597 = _2555;
    float _2599 = _2557;
    float _2601 = _2559;
    if (!_2593)
    {
        float _2603 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2607 = _2549 + _2605;
        float _2609 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2611 = rsqrt(_2535);
        float _2613 = _2607 * _2603;
        float _2615 = _2613 * 0.15915493667125701904296875;
        float _2617 = _2615 * 6.283185482025146484375;
        float _2619 = cos(_2617);
        float _2621 = _2615 * 6.283185482025146484375;
        float _2623 = sin(_2621);
        float _2625 = _2619 + (-1.0);
        float _2627 = _2625 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2629 = fma(_2623, _2609, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2631 = fma(_2579, _2619, _2627);
        float _2633 = _2611 * _2629;
        float _2635 = fma(_2523, _2633, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2637 = fma(_2517, _2633, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2595 = _2631;
        _2587 = _2635;
        _2589 = _2637;
    }
    float _2639 = _2595;
    float _2641 = _2587;
    float _2643 = _2589;
    float _2645 = -_1881;
    float _2647 = _2645 + _2639;
    if (!_2505)
    {
        float _2649 = fma(_2379, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2555);
        _2597 = _2649;
    }
    float _2651 = _2597;
    if (!_2505)
    {
        float _2653 = fma(_2381, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2557);
        _2599 = _2653;
    }
    float _2655 = _2599;
    float _2657 = -_1891;
    float _2659 = _2657 + _2641;
    float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2663 = _2647 + _2661;
    if (!_2505)
    {
        float _2665 = fma(_2383, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2559);
        _2601 = _2665;
    }
    float _2667 = _2601;
    float _2669 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2539);
    float _2671 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2673 = _2659 + _2671;
    float _2675 = _2663 * _2663;
    float _2677 = -_1911;
    float _2679 = _2677 + _2643;
    float _2681 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2543);
    float _2683 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2547);
    float _2685 = fma(_2673, _2673, _2675);
    float _2687 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2689 = _2679 + _2687;
    float _2691 = _2669 * _2655;
    float _2693 = _2681 * _2655;
    float _2695 = _2683 * _2655;
    float _2697 = fma(_2689, _2689, _2685);
    float _2699 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2575);
    float _2701 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2577);
    float _2703 = fma(_2553, _2651, _2691);
    float _2705 = fma(_2561, _2651, _2693);
    float _2707 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2581);
    float _2709 = sqrt(_2697);
    float _2711 = fma(_2565, _2651, _2695);
    float _2713 = fma(_2699, _2667, _2703);
    float _2715 = fma(_2701, _2667, _2705);
    float _2717 = fma(_2707, _2667, _2711);
    float _2719 = -_1891;
    float _2721 = _1631 + _2719;
    float _2723 = -_1881;
    float _2725 = _2723 + _1103;
    float _2727 = -_1911;
    float _2729 = _1687 + _2727;
    out.m_95.x = _2713;
    out.m_95.y = _2715;
    out.m_95.z = _2717;
    bool _2731 = _2709 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2733 = isnan(_2709);
    bool _2735 = _2731 || _2733;
    bool _2737 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2739 = _2735 || _2737;
    float _2741 = _2689;
    if (!_2739)
    {
        _2741 = 1.0;
    }
    float _2743 = _2741;
    bool _2745 = !_2739;
    float _2747 = _2743;
    if (!_2745)
    {
        bool _2749 = _2709 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2751 = isnan(_2709);
        bool _2753 = _2749 || _2751;
        bool _2755 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2757 = _2753 || _2755;
        if (!_2757)
        {
            float _2759 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2761 = _2709 + _2759;
            float _2763 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2765 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2763;
            float _2767 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2769 = _2767 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2771 = 1.0 / _2765;
            float _2773 = _2761 * _2771;
            float _2775 = fma(_2773, _2769, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2747 = _2775;
            _2777 = true;
        }
        else
        {
            bool _2779 = _2709 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2781 = isnan(_2709);
            bool _2783 = _2779 || _2781;
            bool _2785 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2787 = _2783 || _2785;
            if (!_2787)
            {
                float _2789 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2791 = _2709 + _2789;
                float _2793 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2795 = _2793 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2797 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2799 = _2797 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2801 = 1.0 / _2795;
                float _2803 = _2791 * _2801;
                float _2805 = fma(_2803, _2799, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2747 = _2805;
                _2777 = true;
            }
            else
            {
                _2747 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2777 = false;
    float _2807 = _2747;
    float _2809 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2811 = _2659 + _2809;
    float _2813 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2815 = _2679 + _2813;
    float _2817 = fma(_2811, _2807, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2819 = fma(_2815, _2807, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2821 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2823 = _2817 + _2821;
    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2827 = _2819 + _2825;
    float _2829 = fma(_2823, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2831 = fma(_2827, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _8204 = float2(_2829, _2831);
    float _2833 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_8204, float2(0.0), isnan(_8204)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_8204, float2(0.0), isnan(_8204)), level(0.0)).x;
    float _2835 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2837 = _2647 + _2835;
    float _2839 = -_2061;
    float _2841 = _2839 + _2721;
    float _2843 = -_2721;
    float _2845 = _2843 + _2817;
    float _2847 = -_2729;
    float _2849 = _2847 + _2819;
    float _2851 = fma(_2837, _2807, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2853 = -_2063;
    float _2855 = _2853 + _2729;
    float _2857 = -_2725;
    float _2859 = _2857 + _2851;
    float _2861 = _2859 * _2859;
    float _2863 = fma(_2845, _2845, _2861);
    float _2865 = fma(_2849, _2849, _2863);
    float _2867 = sqrt(_2865);
    bool _2869 = _2867 > 0.0;
    float _2871 = fma(_2833, 100.0, _2725);
    float _2873 = -_2059;
    float _2875 = _2873 + _2871;
    bool _2877 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2879 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2881 = _2877 || _2879;
    bool _2883 = isnan(0.5);
    bool _2885 = _2881 || _2883;
    float _2887 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2889 = fma(_2841, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2887);
    float _2891 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2889);
    float _2893 = _2891 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2895 = _2875 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2897 = 1.0 / _2893;
    float _2899 = fma(_2841, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2895);
    float _2901 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2899);
    float _2903 = _2901 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2905 = _2903 + _2893;
    float _2907 = _2905 * _2897;
    float _2909 = _2907 * 0.5;
    float _2911 = fma(_2833, 100.0, _2851);
    float _2913 = _2833;
    float _2915 = _2819;
    float _2917 = _2855;
    float _2919 = _2875;
    if (!_2869)
    {
        _2913 = _2817;
    }
    float _2921 = _2913;
    float _2923 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2925 = fma(_2909, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2923);
    bool _2927 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2929 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2931 = _2927 || _2929;
    bool _2933 = isnan(0.5);
    bool _2935 = _2931 || _2933;
    float _2937 = 1.0 / _2925;
    float _2939 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2941 = _2921;
    if (!_2869)
    {
        _2939 = _2911;
    }
    float _2943 = _2939;
    bool _2945 = !_2869;
    float _2947 = _2943;
    if (!_2945)
    {
        float _2949 = _226 * _226;
        float _2951 = fma(_222, _222, _2949);
        float _2953 = fma(_228, _228, _2951);
        float _2955 = rsqrt(_2865);
        float _2957 = sqrt(_2953);
        float _2959 = _2845 * _2955;
        float _2961 = _2859 * _2955;
        float _2963 = _2849 * _2955;
        bool _2965 = _2957 > 0.0;
        float _2967 = _2949;
        float _2969 = _2957;
        _2035 = _2959;
        if (!_2965)
        {
            _2967 = _2817;
        }
        float _2971 = _2967;
        _2941 = _2971;
        if (!_2965)
        {
            _2969 = _2911;
        }
        float _2973 = _2969;
        bool _2975 = !_2965;
        _2947 = _2973;
        if (!_2975)
        {
            float _2977 = rsqrt(_2953);
            float _2979 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2981 = _226 * _2977;
            float _2983 = _222 * _2977;
            float _2985 = _228 * _2977;
            float _2987 = _2961 * _2981;
            float _2989 = fma(_2959, _2983, _2987);
            float _2991 = _2979 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2993 = fma(_2963, _2985, _2989);
            float _2995 = _2993 * _2991;
            float _2997 = fma(_222, _2995, _2817);
            float _2999 = fma(_226, _2995, _2911);
            float _3001 = fma(_228, _2995, _2819);
            _2941 = _2997;
            _2947 = _2999;
            _2915 = _3001;
        }
    }
    float _3003 = _2941;
    float _3005 = _2947;
    float _3007 = _2915;
    float _3009 = _2035;
    float _3011 = -_2061;
    float _3013 = _3011 + _3003;
    float _3015 = -_2059;
    float _3017 = _3015 + _3005;
    float _3019 = -_2063;
    float _3021 = _3019 + _3007;
    float _3023 = _3017;
    float _3025 = _3013;
    float _3027 = _3021;
    float _3029 = _3005;
    float _3031 = _3009;
    if (_2885)
    {
        _2065 = 1.0;
    }
    float _3033 = _2065;
    float _3035 = _3033;
    if (!_2935)
    {
        float _3037 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3039 = _2875 + _3037;
        float _3041 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3043 = _2841 + _3041;
        float _3045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3047 = -_2729;
        float _3049 = _3047 + _3007;
        float _3051 = _3039 * _3039;
        float _3053 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3055 = _2855 + _3053;
        float _3057 = -_2721;
        float _3059 = _3057 + _3003;
        float _3061 = -_2871;
        float _3063 = _3061 + _3005;
        float _3065 = fma(_3043, _3043, _3051);
        float _3067 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3069 = fma(_3055, _3055, _3065);
        float _3071 = sqrt(_3069);
        float _3073 = 1.0 / _2231;
        float _3075 = precise::min(_3071, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3077 = _3075 * _3045;
        float _3079 = _3067 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3081 = _3077 * _3073;
        float _3083 = _3079 * _3081;
        float _3085 = _3049 * _3081;
        float _3087 = fma(_3059, _3083, _2841);
        float _3089 = fma(_3063, _3083, _2875);
        float _3091 = fma(_3079, _3085, _2855);
        _3023 = _3089;
        _3025 = _3087;
        _3027 = _3091;
    }
    float _3093 = _3023;
    float _3095 = _3025;
    float _3097 = _3027;
    float _3099 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3101 = _2937 * _3099;
    if (!_2885)
    {
        float _3103 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3105 = _3103 * 0.15915493667125701904296875;
        float _3107 = _3105 * 6.283185482025146484375;
        float _3109 = cos(_3107);
        float _3111 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3113 = _3111 * 0.15915493667125701904296875;
        float _3115 = _3105 * 6.283185482025146484375;
        float _3117 = sin(_3115);
        float _3119 = 1.0 / _3109;
        float _3121 = _3113 * 6.283185482025146484375;
        float _3123 = cos(_3121);
        float _3125 = _3117 * _3119;
        float _3127 = _3113 * 6.283185482025146484375;
        float _3129 = sin(_3127);
        float _3131 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3133 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3131;
        float _3135 = _3123 * _3125;
        float _3137 = 1.0 / _3133;
        float _3139 = 1.0 / _3135;
        float _3141 = _3129 * _3139;
        float _3143 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3145 = fma(_3101, _3141, _3143);
        float _3147 = _3145 * _3137;
        float _3149 = precise::clamp(_3147, 0.0, 1.0);
        _3035 = _3149;
    }
    float _3151 = _3035;
    float _3153 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3155 = _3093 + _3153;
    float _3157 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3159 = _3095 + _3157;
    float _3161 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3163 = _3097 + _3161;
    float _3165 = _3155 * _3155;
    float _3167 = fma(_3159, _3159, _3165);
    float _3169 = fma(_3163, _3163, _3167);
    float _3171 = rsqrt(_3169);
    float _3173 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3175 = _3159 * _3173;
    float _3177 = _3163 * _3173;
    float _3179 = _3175 * _3175;
    float _3181 = _3177 * _3177;
    float _3183 = _3179 + _3181;
    float _3185 = sqrt(_3183);
    bool _3187 = _3185 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3191 = _3185 + _3189;
    float _3193 = _3163;
    float _3195 = _3183;
    float _3197 = _3191;
    float _3199 = _3155;
    if (_3187)
    {
        float _3201 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3193 = _3201;
    }
    float _3203 = _3193;
    if (_3187)
    {
        float _3205 = rsqrt(_3183);
        _3195 = _3205;
    }
    float _3207 = _3195;
    float _3209 = _3207;
    if (_3187)
    {
        float _3211 = _3191 * _3203;
        _3197 = _3211;
    }
    float _3213 = _3197;
    if (_3187)
    {
        float _3215 = _3213 * 0.15915493667125701904296875;
        _3029 = _3215;
    }
    float _3217 = _3029;
    float _3219 = _3165;
    float _3221 = _3217;
    if (_3187)
    {
        float _3223 = _3217 * 6.283185482025146484375;
        float _3225 = sin(_3223);
        _3219 = _3225;
    }
    float _3227 = _3219;
    float _3229 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3231 = precise::max(0.0, _3229);
    float _3233 = _3171;
    float _3235 = _3229;
    float _3237 = _3231;
    if (_3187)
    {
        float _3239 = _3217 * 6.283185482025146484375;
        float _3241 = cos(_3239);
        _3233 = _3241;
    }
    float _3243 = _3233;
    float _3245 = -_3173;
    float _3247 = -_3231;
    float _3249 = fma(_3155, _3245, _3247);
    float _3251 = _3249;
    if (_3187)
    {
        float _3253 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3235 = _3253;
    }
    float _3255 = _3235;
    if (!_3187)
    {
        _3221 = _3175;
    }
    float _3257 = _3221;
    float _3259 = _3227;
    float _3261 = _3257;
    if (_3187)
    {
        float _3263 = fma(_3227, _3255, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3259 = _3263;
    }
    float _3265 = _3259;
    float _3267 = sqrt(_3169);
    float _3269 = _3265;
    if (_3187)
    {
        float _3271 = _3243 + (-1.0);
        _3199 = _3271;
    }
    float _3273 = _3199;
    float _3275 = _3273;
    if (_3187)
    {
        float _3277 = _3207 * _3265;
        _3031 = _3277;
    }
    float _3279 = _3031;
    if (!_3187)
    {
        _3209 = _3177;
    }
    float _3281 = _3209;
    float _3283 = _3281;
    if (_3187)
    {
        float _3285 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3237 = _3285;
    }
    float _3287 = _3237;
    if (_3187)
    {
        float _3289 = _3175 * _3279;
        _3261 = _3289;
    }
    float _3291 = _3261;
    if (!_3187)
    {
        _3269 = _3179;
    }
    float _3293 = _3269;
    float _3295 = _3293;
    if (_3187)
    {
        float _3297 = _3177 * _3279;
        _3283 = _3297;
    }
    float _3299 = _3283;
    if (_3187)
    {
        float _3301 = fma(_3249, _3243, _3287);
        _3251 = _3301;
    }
    float _3303 = _3251;
    if (_3187)
    {
        float _3305 = _3291 * _3291;
        _3295 = _3305;
    }
    float _3307 = _3295;
    if (!_3187)
    {
        _3275 = _3181;
    }
    float _3309 = _3275;
    float _3311 = _3309;
    if (_3187)
    {
        float _3313 = _3299 * _3299;
        _3311 = _3313;
    }
    float _3315 = _3311;
    float _3317 = _3093 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3319 = fma(_3303, _3303, _3307);
    float _3321 = _3093 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3323 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3317);
    float _3325 = _3319 + _3315;
    float _3327 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3329 = fma(_3267, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3327);
    float _3331 = precise::clamp(_3329, 0.0, 1.0);
    float _3333 = fma(_3097, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3323);
    float _3335 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3321);
    float _3337 = rsqrt(_3325);
    float _3339 = _3333 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3341 = fma(_2855, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3343 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3345 = -_3331;
    float _3347 = _3345 + 1.0;
    float _3349 = _3339 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3351 = _3093 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3353 = floor(_3341);
    float _3355 = -_3349;
    float _3357 = fma(_3355, _3343, 1.0);
    float _3359 = _3093 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3361 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3351);
    float _3363 = fma(_2841, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3365 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3359);
    float _3367 = abs(_3347);
    float _3369 = log2(_3367);
    float _3371 = _3337 * _3291;
    float _3373 = _3337 * _3303;
    float _3375 = fma(_3097, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3361);
    float _3377 = _3337 * _3299;
    float _3379 = _3371 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3381 = fma(_3097, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3365);
    float _3383 = _3375 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3385 = floor(_3363);
    float _3387 = -_3379;
    float _3389 = fma(_3373, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3387);
    float _3391 = _3381 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3393 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3395 = -_3377;
    float _3397 = fma(_3395, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3389);
    float _3399 = fma(_3097, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3335);
    float _3401 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3393);
    float _3403 = _3369 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3405 = fma(_3397, -0.5, 0.5);
    float _3407 = _3399 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3409 = fma(_3339, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3401);
    float _3411 = exp2(_3403);
    float _3413 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3415 = fma(_3397, 0.5, 0.5);
    float _3417 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3409);
    float _3419 = -_3385;
    float _3421 = _3363 + _3419;
    float _3423 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3425 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3413);
    float _3427 = log2(_3357);
    float _3429 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3423);
    float _3431 = -_3353;
    float _3433 = _3341 + _3431;
    float _3435 = _3373 + 1.0;
    float _3437 = fma(_3415, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3439 = fma(_3339, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3429);
    float _3441 = fma(_3339, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3425);
    float _3443 = 1.0 / _3417;
    float _3445 = -_3373;
    float _3447 = fma(_3411, _3435, _3445);
    float _3449 = fma(_3415, _3437, -0.212114393711090087890625);
    float _3451 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3439);
    float _3453 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3441);
    float _3455 = sqrt(_3405);
    float _3457 = fma(_3415, _3449, 1.570728778839111328125);
    float _3459 = _3427 * 0.693147182464599609375;
    float2 _9202 = float2(_3421, _3433);
    float _3461 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9202, float2(0.0), isnan(_9202)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9202, float2(0.0), isnan(_9202)), level(0.0)).x;
    float _3463 = fma(_3447, 0.5, 0.5);
    float _3465 = _3459 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3467 = _3451 * _3443;
    float _3469 = _3453 * _3443;
    float _3471 = fma(_3467, 0.5, 0.5);
    float _3473 = fma(_3469, -0.5, 0.5);
    float _3475 = _3455 * 0.636619746685028076171875;
    float3 _9230 = float3(_3471, _3473, _3465);
    float _3477 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9230, float3(0.0), isnan(_9230)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9230, float3(0.0), isnan(_9230)), level(0.0)).x;
    float _3479 = -_3457;
    float _3481 = fma(_3475, _3479, 1.0);
    float3 _9246 = float3(_3471, _3473, _3465);
    float4 _3484 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9246, float3(0.0), isnan(_9246)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9246, float3(0.0), isnan(_9246)), level(0.0)).xyzw;
    float _3486 = _3484.x;
    float _3488 = _3484.y;
    float _3490 = _3484.z;
    float _3492 = _3484.w;
    float2 _9262 = float2(_3481, _3463);
    float3 _3496 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9262, float2(0.0), isnan(_9262)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9262, float2(0.0), isnan(_9262)), level(0.0)).xyz;
    float _3498 = _3496.x;
    float _3500 = _3496.y;
    float _3502 = _3496.z;
    float _3504 = abs(_3101);
    float _3506 = log2(_3504);
    out.m_97.x = _2841;
    out.m_97.y = _2875;
    out.m_97.z = _2855;
    bool _3508 = _3267 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3510 = isnan(_3267);
    bool _3512 = _3508 || _3510;
    bool _3514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3516 = _3512 || _3514;
    out.m_99.x = _3095;
    out.m_99.y = _3093;
    out.m_99.z = _3097;
    float _3518 = _3506 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3520 = in.m_77.x;
    float _3522 = _3453;
    if (!_3516)
    {
        _2917 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3524 = _2917;
    float _3526 = _3524;
    float _3528 = _3524;
    if (!_3516)
    {
        _2919 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3530 = _2919;
    float _3532 = exp2(_3518);
    float _3534 = fma(_3532, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3536 = precise::clamp(_3534, 0.0, 1.0);
    float _3538 = fma(_3536, -2.0, 3.0);
    float _3540 = _3536 * _3536;
    float _3542 = _3383 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3544 = _3369 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3546 = _3101 <= 8000.0;
    bool _3548 = isnan(_3101);
    bool _3550 = _3546 || _3548;
    bool _3552 = isnan(8000.0);
    bool _3554 = _3550 || _3552;
    float _3556 = float(_3554);
    float _3558 = _3540 * _3538;
    float _3560 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3542);
    float _3562 = _3417 * 0.5;
    float _3564 = exp2(_3544);
    float _3566 = -_3558;
    float _3568 = _3566 + 1.0;
    float _3570 = fma(_3453, -0.5, _3562);
    float _3572 = fma(_3339, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3560);
    float _3574 = fma(_3568, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3558);
    float _3576 = fma(_3407, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3572);
    float _3578 = _3451 + _3417;
    float _3580 = _3556 * _3574;
    float _3582 = _3576 + _3417;
    out.gl_Position.x = _3451;
    out.gl_Position.y = _3453;
    out.gl_Position.z = _3576;
    out.gl_Position.w = _3417;
    float _3584 = _3580 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3586 = _3578 * 0.5;
    float _3588 = _3582 * 0.5;
    float _3590 = -_3564;
    float _3592 = _3590 + 1.0;
    float _3594 = _3592 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_101.x = _3586;
    out.m_101.y = _3570;
    out.m_101.z = _3588;
    out.m_101.w = _3417;
    float _3596 = _3151 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3598 = _3530;
    float _3600 = _3530;
    if (!_3516)
    {
        _3522 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3602 = _3522;
    float _3604 = -_3461;
    float _3606 = _3604 + 1.0;
    float _3608 = _3606 * _3584;
    float _3610 = precise::clamp(_3608, 0.0, 1.0);
    float _3612 = -_3610;
    float _3614 = fma(_3612, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3616 = _3614 * _3520;
    float _3618 = _3594 * _3477;
    float _3620 = -_3594;
    float _3622 = _3620 + 1.0;
    float _3624 = _3616 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3626 = _3616;
    float _3628 = _3622;
    float _3630 = _3602;
    float _3632 = _3602;
    if (!_3516)
    {
        _3626 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3634 = _3626;
    float _3636 = _3492 * _3618;
    out.m_103.x = _3624;
    float _3638 = _3502 * _3618;
    float _3640 = fma(_3498, _3636, _3486);
    float _3642 = fma(_3500, _3636, _3488);
    float _3644 = _3492 * _3622;
    float _3646 = fma(_3492, _3638, _3490);
    float _3648 = _3636;
    float _3650 = _3634;
    float _3652 = _3634;
    if (!_3516)
    {
        _3628 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3654 = _3628;
    float _3656 = _3654;
    float _3658 = _3654;
    if (!_3516)
    {
        _3648 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3660 = _3648;
    out.m_105.x = _3640;
    out.m_105.y = _3642;
    out.m_105.z = _3646;
    out.m_105.w = _3644;
    bool _3662 = !_3516;
    float _3664 = _3660;
    float _3666 = _3660;
    if (!_3662)
    {
        bool _3668 = _3267 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3670 = isnan(_3267);
        bool _3672 = _3668 || _3670;
        bool _3674 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3676 = _3672 || _3674;
        if (!_3676)
        {
            float _3678 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3680 = _3267 + _3678;
            float _3682 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3684 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3682;
            float _3686 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3688 = _3686 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3690 = 1.0 / _3684;
            float _3692 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3694 = _3692 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3696 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3698 = _3696 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3700 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3702 = _3700 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3704 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3706 = _3704 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3708 = _3680 * _3690;
            float _3710 = precise::clamp(_3708, 0.0, 1.0);
            float _3712 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3714 = _3712 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3716 = fma(_3710, _3688, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3718 = fma(_3710, _3714, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3720 = fma(_3710, _3694, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3722 = fma(_3710, _3698, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3724 = fma(_3710, _3702, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3726 = fma(_3710, _3706, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3658 = _3720;
            _3600 = _3724;
            _3632 = _3716;
            _3528 = _3722;
            _3652 = _3718;
            _3666 = _3726;
            _3728 = true;
        }
        else
        {
            bool _3730 = _3267 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3732 = isnan(_3267);
            bool _3734 = _3730 || _3732;
            bool _3736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3738 = _3734 || _3736;
            if (!_3738)
            {
                _3630 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3740 = _3630;
            _3632 = _3740;
            if (!_3738)
            {
                _3656 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3742 = _3656;
            _3658 = _3742;
            if (!_3738)
            {
                _3650 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3744 = _3650;
            _3652 = _3744;
            if (!_3738)
            {
                _3526 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3746 = _3526;
            _3528 = _3746;
            if (!_3738)
            {
                _3598 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3748 = _3598;
            _3600 = _3748;
            if (!_3738)
            {
                _3664 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3750 = _3664;
            bool _3752 = !_3738;
            _3666 = _3750;
            if (!_3752)
            {
                bool _3754 = _3267 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3756 = isnan(_3267);
                bool _3758 = _3754 || _3756;
                bool _3760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3762 = _3758 || _3760;
                if (!_3762)
                {
                    float _3764 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3766 = _3267 + _3764;
                    float _3768 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3770 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3768;
                    float _3772 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3774 = _3772 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3776 = 1.0 / _3770;
                    float _3778 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3780 = _3778 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3782 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3784 = _3782 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3786 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3788 = _3786 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3790 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3792 = _3790 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3794 = _3766 * _3776;
                    float _3796 = precise::clamp(_3794, 0.0, 1.0);
                    float _3798 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3800 = _3798 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3802 = fma(_3796, _3774, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3804 = fma(_3796, _3800, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3806 = fma(_3796, _3780, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3808 = fma(_3796, _3784, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3810 = fma(_3796, _3788, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3812 = fma(_3796, _3792, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3658 = _3806;
                    _3600 = _3810;
                    _3632 = _3802;
                    _3528 = _3808;
                    _3652 = _3804;
                    _3666 = _3812;
                    _3728 = true;
                }
                else
                {
                    _3658 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3600 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3632 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3528 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3652 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3666 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3728 = false;
    float _3814 = _3658;
    float _3816 = _3600;
    float _3818 = _3632;
    float _3820 = _3528;
    float _3822 = _3652;
    float _3824 = _3666;
    float _3826 = fma(_2715, -0.5, 0.5);
    float _3828 = precise::clamp(_3826, 0.0, 1.0);
    float _3830 = -_3814;
    float _3832 = _3830 + _3816;
    float _3834 = _3596 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3836 = -_3818;
    float _3838 = _3836 + _3820;
    float _3840 = fma(_3828, _3832, _3814);
    out.m_107.x = 0.0;
    float _3842 = -_3822;
    float _3844 = _3842 + _3824;
    float _3846 = fma(_3828, _3838, _3818);
    float _3848 = _3840 * 0.586610972881317138671875;
    out.m_53.x = _3834;
    bool _3850 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3852 = fma(_3828, _3844, _3822);
    float _3854 = fma(_3846, 0.298911988735198974609375, _3848);
    bool _3856 = _3151 > 0.0;
    bool _3858 = isnan(_3151);
    bool _3860 = _3856 || _3858;
    bool _3862 = isnan(0.0);
    bool _3864 = _3860 || _3862;
    float _3866 = fma(_3852, 0.114477999508380889892578125, _3854);
    float _3868 = -_3866;
    float _3870 = _3846 + _3868;
    float _3872 = -_3866;
    float _3874 = _3840 + _3872;
    float _3876 = -_3866;
    float _3878 = _3852 + _3876;
    float _3880 = fma(_3870, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3866);
    float _3882 = fma(_3874, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3866);
    float _3884 = fma(_3878, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3866);
    bool _3886 = !_3850;
    if (!_3886)
    {
        float _3888 = -_3093;
        float _3890 = _3888 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3892 = -_3095;
        float _3894 = _3892 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3896 = -_3097;
        float _3898 = _3896 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3900 = _3890 * _3890;
        float _3902 = fma(_3894, _3894, _3900);
        float _3904 = fma(_3898, _3898, _3902);
        float _3906 = sqrt(_3904);
        float _3908 = rsqrt(_3904);
        float _3910 = -_3906;
        float _3912 = _3910 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3914 = _3912 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3916 = precise::clamp(_3914, 0.0, 1.0);
        float _3918 = _3894 * _3908;
        float _3920 = _3890 * _3908;
        float _3922 = abs(_3916);
        float _3924 = log2(_3922);
        float _3926 = _3898 * _3908;
        float _3928 = _3918 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3930 = _2715 * _3920;
        float _3932 = -_3920;
        float _3934 = -_3928;
        float _3936 = fma(_3932, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3934);
        float _3938 = fma(_2713, _3918, _3930);
        float _3940 = -_3926;
        float _3942 = fma(_3940, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3936);
        float _3944 = fma(_2717, _3926, _3938);
        float _3946 = precise::clamp(_3944, 0.0, 1.0);
        float _3948 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3950 = _3942 + _3948;
        float _3952 = _3924 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3954 = _3950 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3956 = precise::clamp(_3954, 0.0, 1.0);
        float _3958 = exp2(_3952);
        float _3960 = _3958 * _3956;
        float _3962 = _3946 * _3960;
        float _3964 = _3962 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3966 = _3962 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3968 = _3962 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _3964;
        out.m_107.y = _3966;
        out.m_107.z = _3968;
    }
    out.m_81.x = _3880;
    out.m_81.y = _3882;
    out.m_81.z = _3884;
    if (_3864)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3970 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3970;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

